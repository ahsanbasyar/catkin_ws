#!/usr/bin/env python3
import numpy as np
import cv2
import rospy
import cv2.aruco as aruco
from cv_bridge import CvBridge, CvBridgeError
from std_msgs.msg import String
from sensor_msgs.msg import Image
import sqlite3
from sqlite3 import Error
from datetime import datetime
import os
import subprocess
import roslaunch
import rospkg
from mavros_off_board.msg import Corners
from mavros_off_board.msg import Marker
from drone_controller.msg import Information
from mavros_off_board.srv import Trigger, TriggerResponse


class Drone:
    def __init__(self):
        rospy.init_node("CV")       
        self.bridge = CvBridge()

        self.information_sub = rospy.Subscriber("/information", Information, self.information_callback)
        self.image_sub = rospy.Subscriber("/usb_uav1/image_raw", Image, self.callback_rgb)
        self.imageshow_rgb = np.zeros((320, 240, 3), dtype=np.uint8)
        self.capture = None
        self.pub = rospy.Publisher('/corners', Corners, queue_size=10)
        self.pub_cam = rospy.Publisher('/marker', Marker, queue_size=10)
    

    def information_callback(self, msg):
        information = Information()
        # Handle information message if needed
        pass

    def callback_rgb(self, data):
        try:
            img = self.bridge.imgmsg_to_cv2(data, "bgr8")
            self.imageshow_rgb = img
            self.capture = img
        except CvBridgeError as e:
            print(e)

    def run(self):
        calib_data_path = "/home/ahsanbasyar/Downloads/MultiMatrix.npz"
        calib_data = np.load(calib_data_path)
        camera_matrix = calib_data["camMatrix"]
        camera_distortion = calib_data["distCoef"]

        aruco_dict = aruco.Dictionary_get(aruco.DICT_ARUCO_ORIGINAL)
        parameters = aruco.DetectorParameters_create()

        rate = rospy.Rate(100)  # 100 Hz update rate
        while not rospy.is_shutdown():
            frame = self.imageshow_rgb.copy()
            gray_image = cv2.cvtColor(frame, cv2.COLOR_BGR2GRAY)

            marker = None  # Initialize marker here
            information = None
            
            marker_corners, marker_IDs, reject = aruco.detectMarkers(gray_image, aruco_dict, parameters=parameters)

            if marker_corners:
                for ids, corners in zip(marker_IDs, marker_corners):
                    rVec, tVec, _ = aruco.estimatePoseSingleMarkers(corners, 8, camera_matrix, camera_distortion)
                    marker = Marker()
                    information = Information()
                    coordinates = Corners()
                    cv2.polylines(frame, [corners.astype(np.int32)], True, (0, 255, 255), 4, cv2.LINE_AA)
                    corners = corners.reshape(4, 2)
                    corners = corners.astype(int)
                    top_right = corners[0].ravel()
                    top_left = corners[1].ravel()
                    bottom_right = corners[2].ravel()
                    bottom_left = corners[3].ravel()

                    bottom_right_x, bottom_right_y = bottom_right
                    top_right_x, top_right_y = top_right

                    distance = np.sqrt(tVec[0][0][2] ** 2 + tVec[0][0][0] ** 2 + tVec[0][0][1] ** 2)

                    # Calculate center coordinates
                    center_x = int((top_left[0] + bottom_right[0]) / 2)
                    center_y = int((top_left[1] + bottom_right[1]) / 2)

                    points = [top_right, top_left, bottom_right, bottom_left]
                    points.sort(key=lambda pt: pt[0])

                    self.assign_corners(points, coordinates)

                    coordinates.CenterX = center_x
                    coordinates.CenterY = center_y

                    cv2.putText(frame, f"x: {round(tVec[0][0][0], 1)} y: {round(tVec[0][0][1], 1)}",
                                (bottom_right_x, bottom_right_y), cv2.FONT_HERSHEY_PLAIN, 0.8, (0, 255), 2, cv2.LINE_AA)
                    cv2.putText(frame, f"Marker ID: {ids[0]}", (top_right_x, top_right_y), cv2.FONT_HERSHEY_PLAIN, 1, (0, 255), 2, cv2.LINE_AA)

                    self.pub.publish(coordinates)
                    marker.marker = "Marker Found"
                    self.pub_cam.publish(marker)

            else:
                coordinates = Corners()
                coordinates.TopLeftX = coordinates.TopLeftY = 0
                coordinates.TopRightX = coordinates.TopRightY = 0
                coordinates.BottomLeftX = coordinates.BottomLeftY = 0
                coordinates.BottomRightX = coordinates.BottomRightY = 0
                coordinates.CenterX = coordinates.CenterY = 0

                marker = Marker()  # Initialize marker here
                marker.marker = "Marker Not Found"
                self.pub.publish(coordinates)
                self.pub_cam.publish(marker)

            cv2.imshow('frame', frame)
            key = cv2.waitKey(1) & 0xFF

            if marker.marker == "Marker Found":
                category = 'base'
                if marker_IDs:
                    image_name = f"/home/ahsanbasyar/catkin_ws/src/mavros_off_board/scripts/images/data/{category}({marker_IDs[0][0]})_{datetime.now().strftime('%Y-%m-%d_%H:%M:%S')}.jpg"
                    print(f'Image saved to {image_name}')
                    cv2.imwrite(image_name, self.capture)
                    self.insert_to_database(image_name, category)

            elif key == ord('q'):
                break

            rate.sleep()

        cv2.destroyAllWindows()

    def assign_corners(self, points, coordinates):
        if points[0][1] > points[1][1]:
            coordinates.BottomLeftX = points[0][0]
            coordinates.BottomLeftY = points[0][1]
            coordinates.TopLeftX = points[1][0]
            coordinates.TopLeftY = points[1][1]
        else:
            coordinates.BottomLeftX = points[1][0]
            coordinates.BottomLeftY = points[1][1]
            coordinates.TopLeftX = points[0][0]
            coordinates.TopLeftY = points[0][1]

        if points[2][1] > points[3][1]:
            coordinates.BottomRightX = points[2][0]
            coordinates.BottomRightY = points[2][1]
            coordinates.TopRightX = points[3][0]
            coordinates.TopRightY = points[3][1]
        else:
            coordinates.BottomRightX = points[3][0]
            coordinates.BottomRightY = points[3][1]
            coordinates.TopRightX = points[2][0]
            coordinates.TopRightY = points[2][1]

    def create_connection(self, db_file):
        conn = None
        try:
            conn = sqlite3.connect(db_file)
            return conn
        except Error as e:
            print(e)
        return conn
    
    def create_table(self, conn, create_table_sql):
        try:
            c = conn.cursor()
            c.execute(create_table_sql)
        except Error as e:
            print(e)

    def insert_image(self, conn, image_path, category):
        try:
            sql = ''' INSERT INTO images(image_path, category, timestamp)
                      VALUES(?,?,?) '''
            cur = conn.cursor()
            cur.execute(sql, (image_path, category, datetime.now()))
            conn.commit()
            cur.close()
            return cur.lastrowid
        except Error as e:
            print(e)
            return None

    def initialize_database(self, db_file):
        try:
            conn = self.create_connection(db_file)
            sql_create_table = """ CREATE TABLE IF NOT EXISTS images (
                                        id INTEGER PRIMARY KEY AUTOINCREMENT,
                                        image_path TEXT NOT NULL,
                                        category TEXT NOT NULL,
                                        timestamp DATETIME NOT NULL
                                    ); """
            if conn is not None:
                self.create_table(conn, sql_create_table)
            else:
                print("Error! Cannot create the database connection.")
        except Error as e:
            print(e)
        finally:
            if conn:
                conn.close()

    def insert_to_database(self, image_path, category, db_file="/home/ahsanbasyar/catkin_ws/src/mavros_off_board/scripts/images/data/images.db"):
        try:
            conn = self.create_connection(db_file)
            if conn is not None:
                self.insert_image(conn, image_path, category)
            else:
                print("Error! Cannot create the database connection.")
        except Error as e:
            print(e)
        finally:
            if conn:
                conn.close()

if __name__ == "__main__":
    drone = Drone()
    drone.run()