#!/usr/bin/env python
# -*- coding: utf-8 -*-

"""
@file cent_calculator.py
@author Miguel Saavedra (miguel.saaruiz@gmail.com)
@brief This node computes the centroid, height, width and angle WRT to x of a template
@version 0.1
@date 04-30-2020

Copyright (c) 2020 Miguel Saavedra

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
"""

import rospy
import math
from mavros_off_board.msg import Corners
from object_detector.msg import States

class StatesCalculator:
    def __init__(self):
        self.pub = rospy.Publisher('/states', States, queue_size=10)
        self.sub = rospy.Subscriber('/corners', Corners, self.cent_calculator)

    def cent_calculator(self, msg):
        st = States()

        theta = self.compute_theta(msg.BottomLeftX, msg.BottomLeftY, msg.BottomRightX, msg.BottomRightY)
        v_bot = self.compute_euc_dist(msg.BottomLeftX, msg.BottomLeftY, msg.BottomRightX, msg.BottomRightY)
        v_right = self.compute_euc_dist(msg.BottomRightX, msg.BottomRightY, msg.TopRightX, msg.TopRightY)
        v_top = self.compute_euc_dist(msg.TopLeftX, msg.TopLeftY, msg.TopRightX, msg.TopRightY)
        v_left = self.compute_euc_dist(msg.TopLeftX, msg.TopLeftY, msg.BottomLeftX, msg.BottomLeftY)

        st.Xc = msg.CenterX
        st.Yc = msg.CenterY
        st.W = (v_bot + v_top) / 2
        st.H = (v_right + v_left) / 2
        st.Theta = theta

        # Ensure theta is within 0 to 180 degrees
        if theta < 0:
            st.Theta = theta + 180
        elif theta > 180:
            st.Theta = theta - 180

        # Uncomment these lines to print the results on console
        rospy.loginfo("Centroid in pix position (%f,%f)\n Object Width (%f)\n Object Height (%f)\n Theta (%f)\n",
                      st.Xc, st.Yc, st.W, st.H, st.Theta)

        self.pub.publish(st)

    @staticmethod
    def compute_euc_dist(x_1, y_1, x_2, y_2):
        vector_x = x_2 - x_1
        vector_y = y_2 - y_1
        return math.sqrt(vector_x * vector_x + vector_y * vector_y)

    @staticmethod
    def compute_theta(x_1, y_1, x_2, y_2):
        vector_x = x_2 - x_1
        vector_y = y_2 - y_1
        return math.atan2(vector_y, vector_x) * 180 / math.pi

if __name__ == '__main__':
    rospy.init_node('data_calculation', anonymous=True)
    StatesCalculator()
    rospy.spin()
