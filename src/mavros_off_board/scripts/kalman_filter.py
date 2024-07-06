#!/usr/bin/env python

import rospy
import numpy as np
from mavros_off_board.msg import States  # Make sure you have this custom message

class Kalman:
    def __init__(self):
        self.pub = rospy.Publisher('/predicted_states', States, queue_size=10)
        self.sub = rospy.Subscriber('/states', States, self.predictions_detected_callback)
        
        self.dt = 0.1
        self.first_iter = False
        
        self.T = np.array([
            [2, 0, 0, 0, 0, 0, 0, 0, 0, 0],
            [0, 2, 0, 0, 0, 0, 0, 0, 0, 0],
            [0, 0, 5, 0, 0, 0, 0, 0, 0, 0],
            [0, 0, 0, 5, 0, 0, 0, 0, 0, 0],
            [0, 0, 0, 0, 5.625, 0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0, 1e-3, 0, 0, 0, 0],
            [0, 0, 0, 0, 0, 0, 1e-3, 0, 0, 0],
            [0, 0, 0, 0, 0, 0, 0, 1e-3, 0, 0],
            [0, 0, 0, 0, 0, 0, 0, 0, 1e-3, 0],
            [0, 0, 0, 0, 0, 0, 0, 0, 0, 1e-3]
        ])
        
        self.Q = 1e-4 * np.eye(10)
        self.R = 1e-2 * np.eye(5)
        self.R[0, 0] = 1e-4
        self.R[1, 1] = 1e-4
        
        self.X = np.zeros((10, 1))
        self.Z = np.zeros((5, 1))
        self.S1 = np.zeros((5, 5))
        self.Kg = np.zeros((5, 5))
        
        self.A = np.array([
            [1, 0, 0, 0, 0, self.dt, 0, 0, 0, 0],
            [0, 1, 0, 0, 0, 0, self.dt, 0, 0, 0],
            [0, 0, 1, 0, 0, 0, 0, self.dt, 0, 0],
            [0, 0, 0, 1, 0, 0, 0, 0, self.dt, 0],
            [0, 0, 0, 0, 1, 0, 0, 0, 0, self.dt],
            [0, 0, 0, 0, 0, 1, 0, 0, 0, 0],
            [0, 0, 0, 0, 0, 0, 1, 0, 0, 0],
            [0, 0, 0, 0, 0, 0, 0, 1, 0, 0],
            [0, 0, 0, 0, 0, 0, 0, 0, 1, 0],
            [0, 0, 0, 0, 0, 0, 0, 0, 0, 1]
        ])
        
        self.H = np.array([
            [1, 0, 0, 0, 0, 0, 0, 0, 0, 0],
            [0, 1, 0, 0, 0, 0, 0, 0, 0, 0],
            [0, 0, 1, 0, 0, 0, 0, 0, 0, 0],
            [0, 0, 0, 1, 0, 0, 0, 0, 0, 0],
            [0, 0, 0, 0, 1, 0, 0, 0, 0, 0]
        ])
        
    def predictions_detected_callback(self, msg):
        predictions = States()
        
        measurement = np.zeros((5, 1))
        
        if not self.first_iter:
            self.X[0, 0] = msg.Xc
            self.X[1, 0] = msg.Yc
            self.X[2, 0] = msg.W
            self.X[3, 0] = msg.H
            self.X[4, 0] = msg.Theta
            self.X[5, 0] = 0
            self.X[6, 0] = 0
            self.X[7, 0] = 0
            self.X[8, 0] = 0
            self.X[9, 0] = 0
            self.first_iter = True
        
        self.X = np.dot(self.A, self.X)
        self.T = np.dot(np.dot(self.A, self.T), self.A.T) + self.Q
        
        measurement[0, 0] = msg.Xc
        measurement[1, 0] = msg.Yc
        measurement[2, 0] = msg.W
        measurement[3, 0] = msg.H
        measurement[4, 0] = msg.Theta
        
        if (measurement[0] > 0) and (measurement[1] > 0) and (measurement[2] > 0) and (measurement[3] > 0):
            self.Z = measurement - np.dot(self.H, self.X)
            self.S1 = np.dot(np.dot(self.H, self.T), self.H.T) + self.R
            self.Kg = np.dot(np.dot(self.T, self.H.T), np.linalg.inv(self.S1))
            self.X = self.X + np.dot(self.Kg, self.Z)
            self.T = np.dot((np.eye(10) - np.dot(self.Kg, self.H)), self.T)
        
        predictions.Xc = self.X[0, 0]
        predictions.Yc = self.X[1, 0]
        predictions.W = self.X[2, 0]
        predictions.H = self.X[3, 0]
        predictions.Theta = self.X[4, 0]
        
        self.pub.publish(predictions)

if __name__ == '__main__':
    rospy.init_node('KF_predictor', anonymous=True)
    kf = Kalman()
    rospy.spin()