#!/usr/bin/env python

import rospy
from sensor_msgs.msg import Image
from cv_bridge import CvBridge, CvBridgeError
import cv2
import numpy as np
from object_detector.msg import States

class Drawer:
    def __init__(self):
        self.data = [0] * 5
        self.bridge = CvBridge()
        self.image_sub = rospy.Subscriber("/quad_f450_camera/camera_link/raw_image", Image, self.image_callback)
        self.state_sub = rospy.Subscriber("/predicted_states", States, self.estimations_detected_callback)
        self.image_pub = rospy.Publisher("/rectangle_draw/raw_image", Image, queue_size=10)
        cv2.namedWindow("Estimation")

    def estimations_detected_callback(self, msg):
        self.data[0] = msg.Xc
        self.data[1] = msg.Yc
        self.data[2] = msg.W
        self.data[3] = msg.H
        self.data[4] = msg.Theta

    def image_callback(self, msg):
        try:
            cv_image = self.bridge.imgmsg_to_cv2(msg, "bgr8")
        except CvBridgeError as e:
            rospy.logerr("CvBridge Error: {0}".format(e))
            return

        self.rectangle_draw(cv_image)

        try:
            self.image_pub.publish(self.bridge.cv2_to_imgmsg(cv_image, "bgr8"))
        except CvBridgeError as e:
            rospy.logerr("CvBridge Error: {0}".format(e))

    def rectangle_draw(self, img):
        measurement = self.data

        pt = (int(measurement[0]), int(measurement[1]))
        size = (int(measurement[2]), int(measurement[3]))
        angle = measurement[4]

        # Create a rotated rectangle
        rRect = ((pt[0], pt[1]), (size[0], size[1]), angle)

        # Get the four corners of the rotated rectangle
        vertices = cv2.boxPoints(rRect)
        vertices = np.intp(vertices)

        # Draw the lines of the rectangle
        for i in range(4):
            cv2.line(img, tuple(vertices[i]), tuple(vertices[(i + 1) % 4]), (0, 255, 0), 2)

        # Draw a point in each vertex
        cv2.circle(img, tuple(vertices[0]), 5, (255, 0, 255), -1)
        cv2.circle(img, tuple(vertices[1]), 5, (0, 0, 255), -1)
        cv2.circle(img, tuple(vertices[2]), 5, (255, 0, 0), -1)
        cv2.circle(img, tuple(vertices[3]), 5, (0, 255, 0), -1)

        # Show the image
        cv2.imshow("Estimation", img)
        cv2.waitKey(3)

if __name__ == '__main__':
    rospy.init_node('rectangle_detector', anonymous=True)
    drawer = Drawer()
    try:
        rospy.spin()
    except KeyboardInterrupt:
        cv2.destroyAllWindows()
