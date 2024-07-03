/**
 *  @file kalman_filter.cpp
 *  @brief Linear kalman filter implementation for states estimation using LiDAR TFMini
 *  @version 0.1
 *  @date 04-30-2020
 * 
 *  Copyright (c) 2020 Miguel Saavedra
 * 
 *  Permission is hereby granted, free of charge, to any person obtaining a copy
 *  of this software and associated documentation files (the "Software"), to deal
 *  in the Software without restriction, including without limitation the rights
 *  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 *  copies of the Software, and to permit persons to whom the Software is
 *  furnished to do so, subject to the following conditions:
 * 
 *  The above copyright notice and this permission notice shall be included in all
 *  copies or substantial portions of the Software.
 * 
 *  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 *  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 *  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 *  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 *  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 *  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 *  SOFTWARE.
 */

#include <ros/ros.h>
#include <stdio.h>
#include <math.h>
#include <sensor_msgs/Range.h>
#include <Eigen/Dense>
#include <std_msgs/Float32.h>

# define M_PI 3.14159265358979323846  /* pi */

using namespace Eigen;

class Kalman
{
    private:
        // Private class attributes
        ros::NodeHandle po_nh;
        ros::Subscriber sub;
        ros::Publisher pub;

        MatrixXd T; // Posteriori estimate covariance matrix
        MatrixXd Q; // Covariance of the process noise
        MatrixXd R; // Covariance of the observation noise
        MatrixXd A; // State transition matrix
        MatrixXd H; // Observation model
        MatrixXd X; // State vector
        MatrixXd Z; // Innovation vector
        MatrixXd S1; // Covariance of the innovation
        MatrixXd Kg; // Kalman gain
        float dt; // Delta of time
        int first_iter; // variable to check the first iteration of the algorithm

    public:
        // Public class attributes and methods
        Kalman(ros::NodeHandle ao_nh) : po_nh( ao_nh ), first_iter(0), dt(1), T(2,2), Q(2,2), R(1,1), 
                                        A(2,2), H(1,2), X(2,1), Z(1,1), S1(1,1), Kg(2,1)
        {
            // Publisher type std_msgs::Float32, it publishes in /predicted_distance topic
            pub = po_nh.advertise<std_msgs::Float32>( "/predicted_distance", 10 ) ;
            // Subscriber to /tfmini_ros_node/TFmini topic from sensor_msgs::Range
            sub = po_nh.subscribe("/tfmini_ros_node/TFmini", 10, &Kalman::predictionsDetectedCallback, this); 
            // Delta of time for the transition matrix
            this->dt = 0.1;
            this->first_iter = 0;

            // Posteriori estimate covariance matrix initialization
            this->T <<  1, 0,
                        0, 1;

            // Covariance of the process noise initialization
            this->Q = 1e-4*MatrixXd::Identity(2,2);
            // Covariance of the observation noise initialization
            this->R = 1e-2*MatrixXd::Identity(1,1);

            // State vector initialization
            this->X = MatrixXd::Zero(2,1); 
            // Innovation vector initialization
            this->Z = MatrixXd::Zero(1,1); 
            // Covariance of the innovation initialization
            this->S1 = MatrixXd::Zero(1,1); 
            // Kalman gain initialization
            this->Kg = MatrixXd::Zero(2,1); 

            // State transition matrix initialization
            this->A << 1, dt, 
                        0, 1;

            // Observation model initialization
            this->H << 1, 0;
        }

        // Subscriber callback
        void predictionsDetectedCallback(const sensor_msgs::Range& msg)
        {	
            // Creation of a Float32 object to publish the info
            std_msgs::Float32 prediction;

            MatrixXd measurement(1,1); // Vector to store the observations
            measurement = MatrixXd::Zero(1,1);

            // If it is the first iteration, initialize the states with the first observation
            if(this->first_iter==0)
            {
                this->X(0,0) = msg.range; // State distance
                this->X(1,0) = 0; // State velocity
                this->first_iter = 1;
            }

            // Prediction step
            this->X = this->A*this->X; 
            this->T = ((this->A*this->T)*this->A.transpose())+this->Q;

            // Update step, assign the observations to the measurement vector 
            measurement(0,0) = msg.range;

            // If there is a valid measurement
            if(measurement(0) > 0) 
            {
                // Update step
                this->Z = measurement - this->H*this->X; 
                this->S1 = ((this->H*this->T)*this->H.transpose())+R; 
                this->Kg = (this->T*this->H.transpose())*this->S1.inverse(); 
                this->X = this->X + this->Kg*this->Z; 
                this->T = (MatrixXd::Identity(2,2)-(this->Kg*this->H))*this->T; 
            }

            // Assign the prediction to the publisher object
            prediction.data = this->X(0,0);

            pub.publish(prediction);
        }
};


int main(int argc, char** argv)
{ 
    ros::init(argc, argv, "KF_predictor"); 
    ros::NodeHandle n;
    Kalman kf(n);
    ros::spin();

    return 0;
}   
