#!/usr/bin/env python3
import numpy as np
import cv2
import rospy
import cv2.aruco as aruco
import sys, time, math
from cv_bridge import CvBridge, CvBridgeError
from std_msgs.msg import String
from sensor_msgs.msg import Image
import sqlite3
from sqlite3 import Error
from datetime import datetime
import os  # Import the os module#!/usr/bin/env python3
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
from mavros_off_board.msg import Corners

class Drone:
    def __init__(self, ao_nh=None):
        if ao_nh:
            self.po_nh = ao_nh
            self.pub = self.po_nh.advertise('/corners', 10)
            # self.sub = self.po_nh.subscribe('/objects', 10, self.corners_detected_callback)
        else:
            rospy.init_node("CV")
            self.bridge = CvBridge()
            self.image_sub = rospy.Subscriber("/quad_f450_camera/camera_link/raw_image", Image, self.callback_rgb)
            self.imageshow_rgb = np.zeros((640, 480, 3), dtype=np.uint8)
            self.capture = None
            self.pub = rospy.Publisher('/corners', Corners, queue_size=10)

    def callback_rgb(self, data):
        try:
            img = self.bridge.imgmsg_to_cv2(data, "bgr8")
            self.imageshow_rgb = img
            self.capture = img
        except CvBridgeError as e:
            rospy.logerr(e)

    def show_image(self):
        cv2.imshow("rgb", self.imageshow_rgb)
        cv2.waitKey(1)

    def run(self):
        calib_data_path = "/home/ahsanbasyar/Downloads/MultiMatrix.npz"
        calib_data = np.load(calib_data_path)
        camera_matrix = calib_data["camMatrix"]
        camera_distortion = calib_data["distCoef"]

        aruco_dict = aruco.Dictionary_get(aruco.DICT_ARUCO_ORIGINAL)
        parameters = aruco.DetectorParameters_create()

        while not rospy.is_shutdown():
            try:
                frame = self.imageshow_rgb
                gray_image = cv2.cvtColor(frame, cv2.COLOR_BGR2GRAY)

                marker_corners, marker_IDs, reject = aruco.detectMarkers(gray_image, aruco_dict, parameters=parameters)

                if marker_corners:
                    rVec, tVec, _ = aruco.estimatePoseSingleMarkers(marker_corners, 8, camera_matrix, camera_distortion)
                    total_markers = range(0, marker_IDs.size)
                    
                    for ids, corners, i in zip(marker_IDs, marker_corners, total_markers):
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

                        distance = np.sqrt(tVec[i][0][2] ** 2 + tVec[i][0][0] ** 2 + tVec[i][0][1] ** 2)

                        # Calculate center coordinates
                        center_x = int((top_left[0] + bottom_right[0]) / 2)
                        center_y = int((top_left[1] + bottom_right[1]) / 2)

                        points = [top_right, top_left, bottom_right, bottom_left]
                        points.sort(key=lambda pt: pt[0])

                        self.assign_corners(points, coordinates)

                        coordinates.CenterX = center_x
                        coordinates.CenterY = center_y

                        cv2.putText(frame, f"x: {round(tVec[i][0][0], 1)} y: {round(tVec[i][0][1], 1)}",
                                    (bottom_right_x, bottom_right_y), cv2.FONT_HERSHEY_PLAIN, 0.8, (0, 255), 2, cv2.LINE_AA)
                        cv2.putText(frame, f"Marker ID: {ids[0]}", (top_right_x, top_right_y), cv2.FONT_HERSHEY_PLAIN, 1, (0, 255), 2, cv2.LINE_AA)

                        self.pub.publish(coordinates)

                else:
                    coordinates = Corners()
                    coordinates.TopLeftX = coordinates.TopLeftY = 0
                    coordinates.TopRightX = coordinates.TopRightY = 0
                    coordinates.BottomLeftX = coordinates.BottomLeftY = 0
                    coordinates.BottomRightX = coordinates.BottomRightY = 0
                    coordinates.CenterX = coordinates.CenterY = 0
                    self.pub.publish(coordinates)
                
                cv2.imshow('frame', frame)
                key = cv2.waitKey(1) & 0xFF

                if key == ord('1') or key == ord('2'):
                    category = 'base' if key == ord('1') else 'move'
                    image_name = f"/home/ahsanbasyar/catkin_ws/src/mavros_off_board/scripts/images/data/{category}({ids[0]})_{datetime.now().strftime('%Y-%m-%d_%H:%M:%S')}.jpg"
                    print(f'Image saved to {image_name}')
                    cv2.imwrite(image_name, self.capture)
                    self.insert_to_database(image_name, category)

                elif key == ord('q'):
                    break

                rospy.Rate(100).sleep()

            except rospy.exceptions.ROSTimeMovedBackwardsException:
                pass

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


if __name__ == "__main__":
    drone = Drone()
    drone.run()
from mavros_off_board.msg import Corners

class Drone:
    def __init__(self, ao_nh):
        self.po_nh = ao_nh
        self.pub = self.po_nh.advertise('/corners', 10)
        # self.sub = self.po_nh.subscribe('/objects', 10, self.corners_detected_callback)

    def __init__(self):
        rospy.init_node("CV")       
        self.bridge = CvBridge()
        self.image_sub = rospy.Subscriber("/quad_f450_camera/camera_link/raw_image", Image, self.callback_rgb)
        self.imageshow_rgb = np.zeros((640, 480, 3), dtype=np.uint8)
        self.capture = None

    def callback_rgb(self, data):
        img = self.bridge.imgmsg_to_cv2(data, "bgr8")
        self.imageshow_rgb = img
        self.capture = img  # Corrected to use img instead of cpt

    def show_image(self):
        cv2.imshow("rgb", self.imageshow_rgb)
        cv2.waitKey(1)

    def run(self):
        calib_data_path = "/home/ahsanbasyar/Downloads/MultiMatrix.npz"
        calib_data = np.load(calib_data_path)
        camera_matrix = calib_data["camMatrix"]
        camera_distortion = calib_data["distCoef"]

        aruco_dict = aruco.Dictionary_get(aruco.DICT_ARUCO_ORIGINAL)
        parameters = aruco.DetectorParameters_create()

        counterbase = 1
        countermove = 1

        while not rospy.is_shutdown():
            try:
                frame = self.imageshow_rgb
                gray_image = cv2.cvtColor(frame, cv2.COLOR_BGR2GRAY)

                marker_corners, marker_IDs, reject = aruco.detectMarkers(gray_image, aruco_dict, parameters=parameters)

                if marker_corners:
                    rVec, tVec, _ = aruco.estimatePoseSingleMarkers(marker_corners, 8, camera_matrix, camera_distortion)
                    total_markers = range(0, marker_IDs.size)
                    
                    for ids, corners, i in zip(marker_IDs, marker_corners, total_markers):
                        coordinates = corners()
                        cv2.polylines(frame, [corners.astype(np.int32)], True, (0, 255, 255), 4, cv2.LINE_AA)
                        corners = corners.reshape(4, 2)
                        corners = corners.astype(int)
                        top_right = corners[0].ravel()
                        top_left = corners[1].ravel()
                        bottom_right = corners[2].ravel()
                        bottom_left = corners[3].ravel()

                        bottom_right_x, bottom_right_y = corners[2].ravel()
                        top_right_x, top_right_y = top_right = corners[0].ravel()

                        distance = np.sqrt(tVec[i][0][2] ** 2 + tVec[i][0][0] ** 2 + tVec[i][0][1] ** 2)

                        # Calculate center coordinates
                        center_x = int((top_left[0] + bottom_right[0]) / 2)
                        center_y = int((top_left[1] + bottom_right[1]) / 2)

                        points = [top_right, top_left, bottom_right, bottom_left]
                        points.sort(key=lambda pt: pt.x())

                        coordinates.CenterX = center_x
                        coordinates.CenterY = center_y


                        # Store coordinates and marker ID
                        marker_info = {
                            'marker_id': ids[0],
                            'top_left_x': top_left[0],
                            'top_left_y': top_left[1],
                            'top_right_x': top_right[0],
                            'top_right_y': top_right[1],
                            'bottom_left_x': bottom_left[0],
                            'bottom_left_y': bottom_left[1],
                            'bottom_right_x': bottom_right[0],
                            'bottom_right_y': bottom_right[1],
                            'center_x': center_x,
                            'center_y': center_y
                        }
                        #markers_info.append(marker_info)

                        cv2.putText(frame, f"x: {round(tVec[i][0][0], 1)} y: {round(tVec[i][0][1], 1)}",
                                    (bottom_right_x, bottom_right_y), cv2.FONT_HERSHEY_PLAIN, 0.8, (0, 255), 2, cv2.LINE_AA)
                        cv2.putText(frame, f"Marker ID: {ids[0]}", (top_right_x, top_right_y), cv2.FONT_HERSHEY_PLAIN, 1, (0, 255), 2, cv2.LINE_AA)
                    else:
                        coordinates.TopLeftX = coordinates.TopLeftY = 0
                        coordinates.TopRightX = coordinates.TopRightY = 0
                        coordinates.BottomLeftX = coordinates.BottomLeftY = 0
                        coordinates.BottomRightX = coordinates.BottomRightY = 0
                        coordinates.CenterX = coordinates.CenterY = 0

                    self.pub.publish(coordinates)

                
                cv2.imshow('frame', frame)
                key = cv2.waitKey(1) & 0xFF

                if key == ord('1') or key == ord('2'):
                    category = 'base' if key == ord('1') else 'move'
                    image_name = f"/home/ahsanbasyar/catkin_ws/src/mavros_off_board/scripts/images/data/{category}({ids[0]})_{datetime.now().strftime('%Y-%m-%d_%H:%M:%S')}.jpg"
                    print(f'Image copied to {image_name}')
                    cv2.imwrite(image_name, self.capture)
                    self.insert_to_database(image_name, category)
                    counterbase += 1 if key == ord('1') else 1

                elif key == ord('q'):
                    break

                rospy.Rate(100).sleep()

            except rospy.exceptions.ROSTimeMovedBackwardsException:
                pass
    def assign_corners(self, points, coordinates):
        if points[0].y() > points[1].y():
            coordinates.BottomLeftX = points[0].x()
            coordinates.BottomLeftY = points[0].y()
            coordinates.TopLeftX = points[1].x()
            coordinates.TopLeftY = points[1].y()
        else:
            coordinates.BottomLeftX = points[1].x()
            coordinates.BottomLeftY = points[1].y()
            coordinates.TopLeftX = points[0].x()
            coordinates.TopLeftY = points[0].y()

        if points[2].y() > points[3].y():
            coordinates.BottomRightX = points[2].x()
            coordinates.BottomRightY = points[2].y()
            coordinates.TopRightX = points[3].x()
            coordinates.TopRightY = points[3].y()
        else:
            coordinates.BottomRightX = points[3].x()
            coordinates.BottomRightY = points[3].y()
            coordinates.TopRightX = points[2].x()
            coordinates.TopRightY = points[2].y()
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


if __name__ == "__main__":
    drone = Drone()
    drone.run()
