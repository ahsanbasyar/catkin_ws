/**
 *  @file pid_controller_final.cpp
 *  @author Miguel Saavedra (miguel.saaruiz@gmail@gmail.com)
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
#include "mavros_msgs/PositionTarget.h"
// include "object_detector/States.h" // Custom msgs of type States
#include "altitude_controller/Error.h" // Custom msgs of type Error
#include "altitude_controller/ppid.h"
#include <mavros_msgs/CommandTOL.h> // Service for landing
#include <std_msgs/Float32.h>
#include <geometry_msgs/Twist.h>
#include <sensor_msgs/Range.h> // Include for sensor_msgs::Range



#define FACTORZ  0.025 // Descend Factor

class AltitudeController
{
	private: 
        ros::NodeHandle nh;
        ros::Subscriber lidar_sub;
        ros::Subscriber setpoint_sub;
        ros::Publisher vel_pub;
        ros::Publisher error_pub;
        ros::Time last_time;
        PID* pid_altitude; // PID altitude
        double current_altitude;
        double target_altitude;


public:
    AltitudeController(ros::NodeHandle nh) : nh(nh) 
    {
        pid_altitude = new PID(1.0, -1.0, 0.5, 0.1, 0.05);
        
        // Publisher for height error
        error_pub = nh.advertise<std_msgs::Float32>("/height_error", 10); 
        vel_pub = nh.advertise<geometry_msgs::Twist>("/cmd_vel", 10);

        // Subscribers for LiDAR and setpoint
        lidar_sub = nh.subscribe("/tfmini/laser/range", 10, &AltitudeController::lidarCallback, this);
        setpoint_sub = nh.subscribe("/height_setpoint", 10, &AltitudeController::setpointCallback, this);
    }

	

    void lidarCallback(const sensor_msgs::Range::ConstPtr &msg) {
        current_altitude = msg->range;

        float height_error = current_altitude - target_altitude;

        // Create and publish the height error message
        std_msgs::Float32 error_msg;
        error_msg.data = height_error;

        // Calculate control command
        double dt = (ros::Time::now() - last_time).toSec();
        double cmd = pid_altitude->calculate(target_altitude, current_altitude, dt);
        last_time = ros::Time::now();

        // Publish velocity command
        geometry_msgs::Twist vel_msg;
        vel_msg.linear.z = cmd; // Adjust altitude
        vel_pub.publish(vel_msg);

        ROS_INFO("Current Altitude: %f, Command: %f", current_altitude, cmd);
        printf("Er at Z is (%f) \n", height_error);
        error_pub.publish(error_msg);
    }
    void setpointCallback(const std_msgs::Float32::ConstPtr &msg) {
        target_altitude = msg->data;
    }

};


int main(int argc, char **argv) {
    ros::init(argc, argv, "altitude_controller");
    ros::NodeHandle nh;

    AltitudeController ac(nh);
    ros::spin();

    return 0;
}

