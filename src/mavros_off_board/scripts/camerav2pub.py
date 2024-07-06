#!/usr/bin/env python3
import numpy as np
import cv2
import rospy
import cv2.aruco as aruco
import sys, time, math
from cv_bridge import CvBridge, CvBridgeError
from std_msgs.msg import String
from sensor_msgs.msg import Image
from geometry_msgs.msg import Point
from mavros_off_board.msg import Corners  # Import your custom message type
import sqlite3
from sqlite3 import Error
from datetime import datetime

class Drone:

    def __init__(self):
        rospy.init_node("CV")
        self.bridge = CvBridge()
        self.image_sub = rospy.Subscriber("/quad_f450_camera/camera_link/raw_image", Image, self.callback_rgb)
        self.imageshow_rgb = np.zeros((640, 480, 3), dtype=np.uint8)
        self.capture = None

        # Initialize database and markers
        self.initialize_database("/home/ahsanbasyar/catkin_ws/src/mavros_off_board/scripts/images/data/images.db")
        self.aruco_dict = aruco.Dictionary_get(aruco.DICT_ARUCO_ORIGINAL)
        self.parameters = aruco.DetectorParameters_create()

        # Publisher for marker corners
        self.marker_corners_pub = rospy.Publisher("/corners", Corners, queue_size=10)

    def callback_rgb(self, data):
        try:
            img = self.bridge.imgmsg_to_cv2(data, "bgr8")
            self.imageshow_rgb = img
            self.capture = img
        except CvBridgeError as e:
            print(e)

    def detect_markers_and_corners(self, frame, camera_matrix, camera_distortion):
        gray_image = cv2.cvtColor(frame, cv2.COLOR_BGR2GRAY)
        marker_corners, marker_IDs, reject = aruco.detectMarkers(gray_image, self.aruco_dict, parameters=self.parameters)

        if marker_corners:
            rVec, tVec, _ = aruco.estimatePoseSingleMarkers(marker_corners, 8, camera_matrix, camera_distortion)
            total_markers = range(0, marker_IDs.size)
            for ids, corners, i in zip(marker_IDs, marker_corners, total_markers):
                cv2.polylines(frame, [corners.astype(np.int32)], True, (0, 255, 255), 4, cv2.LINE_AA)
                corners = corners.reshape(4, 2)
                corners = corners.astype(int)
                top_right = corners[0].ravel()
                top_left = corners[1].ravel()
                bottom_right = corners[2].ravel()
                bottom_left = corners[3].ravel()

                bottom_right_x, bottom_right_y = corners[2].ravel()
                top_right_x, top_right_y = top_right = corners[0].ravel()

                # Calculate center coordinates
                center_x = int((top_left[0] + bottom_right[0]) / 2)
                center_y = int((top_left[1] + bottom_right[1]) / 2)

                # Publish marker corner information
                marker_corner_msg = Corners()
                marker_corner_msg.top_left = Point(top_left[0], top_left[1], 0)
                marker_corner_msg.top_right = Point(top_right[0], top_right[1], 0)
                marker_corner_msg.bottom_left = Point(bottom_left[0], bottom_left[1], 0)
                marker_corner_msg.bottom_right = Point(bottom_right[0], bottom_right[1], 0)
                marker_corner_msg.center = Point(center_x, center_y, 0)

                self.marker_corners_pub.publish(marker_corner_msg)
              
                

        return frame

    def run(self):
        calib_data_path = "/home/ahsanbasyar/Downloads/MultiMatrix.npz"
        calib_data = np.load(calib_data_path)
        camera_matrix = calib_data["camMatrix"]
        camera_distortion = calib_data["distCoef"]

        counterbase = 1
        countermove = 1

        while not rospy.is_shutdown():
            try:
                frame = self.imageshow_rgb.copy()

                # Detect markers and get corner coordinates
                frame = self.detect_markers_and_corners(frame, camera_matrix, camera_distortion)

                # Display frame with detected markers
                cv2.imshow('frame', frame)
                self.show_image()

                key = cv2.waitKey(1) & 0xFF

                if key == ord('1') or key == ord('2'):
                    category = 'base' if key == ord('1') else 'move'
                    image_name = f"/home/ahsanbasyar/catkin_ws/src/mavros_off_board/scripts/images/data/{category}({datetime.now().strftime('%Y-%m-%d_%H:%M:%S')}.jpg"
                    print(f'Image copied to {image_name}')
                    cv2.imwrite(image_name, self.capture)
                    self.insert_to_database(image_name, category)
                    if category == 'base':
                        counterbase += 1
                    else:
                        countermove += 1

                elif key == ord('q'):
                    break

                rospy.Rate(100).sleep()

            except rospy.exceptions.ROSTimeMovedBackwardsException:
                pass

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

    def convertToBinaryData(self, filename):
        try:
            with open(filename, 'rb') as file:
                blobData = file.read()
            return blobData
        except IOError as e:
            print(e)
            return None

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

    def show_image(self):
        cv2.imshow("rgb", self.imageshow_rgb)
        cv2.waitKey(1)

if __name__ == "__main__":
    drone = Drone()
    drone.run()
