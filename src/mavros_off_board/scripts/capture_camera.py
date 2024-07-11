#!/usr/bin/env python

import sqlite3
from sensor_msgs.msg import NavSatFix, Image
from cv_bridge import CvBridge
import cv2
from datetime import datetime
import rospy
from mavros_off_board.srv import Trigger, TriggerResponse


trigger_active = False

# Global variables for SQLite connection and cursor
conn = None
cursor = None

class ImageGPSLogger:
    def __init__(self):
        rospy.init_node('image_gps_logger_node', anonymous=True)
        rospy.Subscriber('/mavros/global_position/global', NavSatFix, self.gps_callback)
        self.image_sub = rospy.Subscriber('/usb_uav1/image_raw', Image, self.callback_rgb)
        self.bridge = CvBridge()
        self.db_file = "/home/ahsanbasyar/catkin_ws/src/mavros_off_board/scripts/images/data/images.db"
        self.initialize_database()
        
        # Service to trigger capture and save
        self.trigger_service = rospy.Service('/image_gps_logger_node/trigger_capture', Trigger, self.trigger_capture)
    
    def create_connection(self, db_file):
        conn = None
        try:
            conn = sqlite3.connect(db_file)
            return conn
        except sqlite3.Error as e:
            rospy.logerr(str(e))
        return conn

    def create_table(self, conn, create_table_sql):
        try:
            c = conn.cursor()
            c.execute(create_table_sql)
        except sqlite3.Error as e:
            rospy.logerr(str(e))

    def initialize_database(self):
        try:
            conn = self.create_connection(self.db_file)
            sql_create_table_combined = """ 
            CREATE TABLE IF NOT EXISTS combined_data (
                id INTEGER PRIMARY KEY AUTOINCREMENT,
                data_type TEXT,
                latitude REAL,
                longitude REAL,
                altitude REAL,
                image BLOB,
                timestamp DATETIME DEFAULT CURRENT_TIMESTAMP
            ); """
            if conn is not None:
                self.create_table(conn, sql_create_table_combined)
            else:
                rospy.logerr("Error! Cannot create the database connection.")
        except sqlite3.Error as e:
            rospy.logerr(str(e))
        finally:
            if conn:
                conn.close()

    def gps_callback(self, msg):
        global cursor, conn, trigger_active
        if trigger_active:
            try:
                conn = self.create_connection(self.db_file)
                if conn is not None:
                    latitude = msg.latitude
                    longitude = msg.longitude
                    altitude = msg.altitude
                    cursor = conn.cursor()
                    cursor.execute("INSERT INTO combined_data (data_type, latitude, longitude, altitude, timestamp) VALUES (?, ?, ?, ?, ?)", ('gps', latitude, longitude, altitude, datetime.now()))
                    conn.commit()
                    cursor.close()
                    rospy.loginfo("GPS data captured and stored in database.")
                else:
                    rospy.logerr("Error! Cannot create the database connection.")
            except sqlite3.Error as e:
                rospy.logerr(str(e))
            finally:
                if conn:
                    conn.close()

    def callback_rgb(self, msg):
        global cursor, conn, trigger_active
        if trigger_active:
            try:
                conn = self.create_connection(self.db_file)
                if conn is not None:
                    cv_image = self.bridge.imgmsg_to_cv2(msg, "bgr8")
                    _, jpeg_image = cv2.imencode('.jpg', cv_image)
                    cursor = conn.cursor()
                    cursor.execute("INSERT INTO combined_data (data_type, image, timestamp) VALUES (?, ?, ?)", ('image', sqlite3.Binary(jpeg_image), datetime.now()))
                    conn.commit()
                    cursor.close()
                    rospy.loginfo("Image captured and stored in database.")
                else:
                    rospy.logerr("Error! Cannot create the database connection.")
            except sqlite3.Error as e:
                rospy.logerr(str(e))
            finally:
                if conn:
                    conn.close()

    def trigger_capture(self, req):
        global trigger_active
        trigger_active = req.trigger
        
        res = TriggerResponse()
        
        if trigger_active:
            try:
                # Capture an image
                captured_image = self.capture_image()  # Implement capture logic
                
                # Save image and GPS data to combined table
                conn = self.create_connection(self.db_file)
                if conn is not None:
                    cursor = conn.cursor()
                    
                    # Insert image
                    cursor.execute("INSERT INTO combined_data (data_type, image, timestamp) VALUES (?, ?, ?)", ('image', sqlite3.Binary(captured_image), datetime.now()))
                    
                    # Capture GPS data
                    gps_data = self.capture_gps_data()  # Implement GPS capture logic
                    
                    if gps_data:
                        # Insert GPS data
                        cursor.execute("INSERT INTO combined_data (data_type, latitude, longitude, altitude, timestamp) VALUES (?, ?, ?, ?, ?)", ('gps', gps_data[0], gps_data[1], gps_data[2], datetime.now()))
                        
                    conn.commit()
                    cursor.close()
                    rospy.loginfo("Image and GPS data captured and stored in database.")
                else:
                    rospy.logerr("Error! Cannot create the database connection.")
                    res.success = False
                    res.message = "Failed to store image and GPS data in database."
            except Exception as e:
                rospy.logerr("Failed to capture and store image and GPS data:", str(e))
                res.success = False
                res.message = "Failed to capture and store image and GPS data: " + str(e)
        else:
            rospy.loginfo("Capture trigger deactivated.")
            res.success = False
            res.message = "Capture trigger deactivated."
        
        return res

    def capture_image(self):
        # Example: Capture an image using OpenCV (replace with your actual image capture logic)
        # Example uses cv2.VideoCapture, adjust for your specific setup
        camera = cv2.VideoCapture(0)
        _, image = camera.read()
        camera.release()
        return image

    def capture_gps_data(self):
        # Example: Capture GPS data (replace with your actual GPS capture logic)
        # Example assumes you have access to global variables or methods that provide current GPS data
        # Adjust according to your setup and ROS message handling
        try:
            # Access the latest GPS data (this is a simplified example)
            latitude = 0.0  # Replace with actual latitude
            longitude = 0.0  # Replace with actual longitude
            altitude = 0.0  # Replace with actual altitude
            return (latitude, longitude, altitude)
        except Exception as e:
            rospy.logerr("Failed to capture GPS data:", str(e))
            return None

    def spin(self):
        rospy.spin()

if __name__ == '__main__':
    logger = ImageGPSLogger()
    logger.spin()
