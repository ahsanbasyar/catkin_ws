/**
 *  @file tfmini_height_error.cpp
 *  @brief This node computes the height error based on lidar readings from TF Mini and publishes it.
 *  @version 0.1
 *  @date 06-30-2024
 * 
 *  Copyright (c) 2024
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
#include <sensor_msgs/Range.h> // Include for lidar sensor data
#include "std_msgs/Float32.h" // Include for publishing height error and subscribing to setpoint

class TFminiHeightError
{
    private: 
        ros::NodeHandle nh;
        ros::Subscriber lidar_sub;
        ros::Subscriber setpoint_sub;
        ros::Publisher error_pub;
        // float height_setpoint; // Setpoint for height

    public:
        // Constructor
        TFminiHeightError(ros::NodeHandle& node_handle) : nh(node_handle), height_setpoint(0.0)
        {
            // Publisher for height error
            error_pub = nh.advertise<std_msgs::Float32>("/height_error", 10); 
            // Subscriber for lidar data from TF Mini
            lidar_sub = nh.subscribe("/tfmini_ros_node/TFmini", 10, &TFminiHeightError::lidarCallback, this);
            // Subscriber for height setpoint
            setpoint_sub = nh.subscribe("/height_setpoint", 10, &TFminiHeightError::setpointCallback, this);
        }

        // Subscriber callback for LIDAR data
        void lidarCallback(const sensor_msgs::Range& msg)
        {
            float height_setpoint = msg.data;
            float lidar_height = msg.range; // Store lidar height
            float height_error = lidar_height - height_setpoint;

            // Create and publish the height error message
            std_msgs::Float32 error_msg;
            error_msg.height = height_error;
            error_pub.publish(error_msg);
        }

};

int main(int argc, char** argv)
{   
    ros::init(argc, argv, "tfmini_height_error_node"); // Node name
    ros::NodeHandle n;
    TFminiHeightError height_error_calculator(n);
    ros::spin();

    return 0;
}
