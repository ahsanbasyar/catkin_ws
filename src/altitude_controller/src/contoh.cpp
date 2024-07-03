/**
 *  @file pid_controller_final.cpp
 *  @brief PID controller to land the vehicle on the landing pad
 *  @version 0.1
 *  @date 05-01-2020
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
#include <geometry_msgs/Twist.h>
#include <sensor_msgs/Range.h>
#include <mavros_msgs/AttitudeTarget.h>
#include "altitude_controller/Error.h" // Custom msgs of type Error
#include "altitude_controller/ppid.h"
#include <std_msgs/Float32.h>

#define FACTORZ  0.025 // Descend Factor

class AltitudeController
{
    private: 
        ros::NodeHandle nh;
        ros::Publisher attitude_pub;
        ros::Subscriber lidar_sub;
        ros::Publisher error_pub;
        ros::Time last_time;
        PID* pid_altitude; // PID altitude
        double current_altitude;
        double target_altitude;

    public:
        AltitudeController(ros::NodeHandle &nh)
            : nh(nh), target_altitude(2.0) { // Default target altitude in meters
            pid_altitude = new PID(3, 1, 0.1, 0.01, 0.005);

            attitude_pub = nh.advertise<mavros_msgs::AttitudeTarget>("/mavros/setpoint_raw/attitude", 10);
            error_pub = nh.advertise<std_msgs::Float32>("/height_error", 10); 

            lidar_sub = nh.subscribe("/tfmini_ros_node/TFmini", 10, &AltitudeController::lidarCallback, this);

            last_time = ros::Time::now();
        }

        void lidarCallback(const sensor_msgs::Range::ConstPtr &msg) {
            current_altitude = msg->range;
            float height_error = current_altitude - target_altitude;

            // Create and publish the height error message
            std_msgs::Float32 error_msg;
            error_msg.data = height_error;

            double current_time = ros::Time::now().toSec();
            double dt = current_time - last_time.toSec();
            last_time = ros::Time(current_time);

            // Calculate control command
            double cmd = pid_altitude->calculate(target_altitude, current_altitude, dt);
            

            // Publish attitude command
            mavros_msgs::AttitudeTarget att_target;
            att_target.orientation.x = 0;
            att_target.orientation.y = 0;
            att_target.orientation.z = 0;
            att_target.orientation.w = 1; // Level flight

            att_target.thrust = cmd; // Adjust thrust based on PID output
            att_target.type_mask = mavros_msgs::AttitudeTarget::IGNORE_ROLL_RATE |
                                   mavros_msgs::AttitudeTarget::IGNORE_PITCH_RATE |
                                   mavros_msgs::AttitudeTarget::IGNORE_YAW_RATE; // Ignore body rates

            attitude_pub.publish(att_target);

            ROS_INFO("Current Altitude: %f, Target Altitude: %f, Command: %f", current_altitude, target_altitude, cmd);

            printf("Error at Z is (%f) \n", height_error);
            error_pub.publish(error_msg);
        }
};

int main(int argc, char **argv) {
    ros::init(argc, argv, "altitude_controller");
    ros::NodeHandle nh;

    AltitudeController ac(nh);
    ros::spin();

    return 0;
}
