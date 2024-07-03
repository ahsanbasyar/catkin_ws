#include <ros/ros.h>
#include <geometry_msgs/PoseStamped.h>
#include <geometry_msgs/Twist.h>
#include <sensor_msgs/Range.h>
#include <mavros_msgs/CommandBool.h>
#include <mavros_msgs/SetMode.h>
#include <mavros_msgs/State.h>
#include "drone_controller/pid.h"

// Define a variable to hold the current state of the drone
mavros_msgs::State current_state;
double current_altitude;
double target_altitude = 2.0; // Target altitude can be set here or via a parameter

// PID controller for altitude
PID* pid_altitude;

void state_cb(const mavros_msgs::State::ConstPtr& msg) {
    current_state = *msg;
}

void altitude_cb(const sensor_msgs::Range::ConstPtr& msg) {
    current_altitude = msg->range;
}

double pid_controller(double target, double current, double dt) {
    return pid_altitude->calculate(target, current, dt);
}

int main(int argc, char **argv) {
    ros::init(argc, argv, "offb_node");
    ros::NodeHandle nh;

    ros::Subscriber state_sub = nh.subscribe<mavros_msgs::State>("mavros/state", 10, state_cb);
    ros::Subscriber altitude_sub = nh.subscribe<sensor_msgs::Range>("/tfmini/laser/range", 10, altitude_cb);
    ros::Publisher local_pos_pub = nh.advertise<geometry_msgs::PoseStamped>("mavros/setpoint_position/local", 10);
    ros::Publisher vel_pub = nh.advertise<geometry_msgs::Twist>("/cmd_vel", 10);
    ros::ServiceClient arming_client = nh.serviceClient<mavros_msgs::CommandBool>("mavros/cmd/arming");
    ros::ServiceClient set_mode_client = nh.serviceClient<mavros_msgs::SetMode>("mavros/set_mode");

    // Initialize PID controller
    pid_altitude = new PID(1.0, -1.0, 0.5, 0.1, 0.05);

    // Get target altitude from parameter server if available
    nh.getParam("target_altitude", target_altitude);

    // The setpoint publishing rate MUST be faster than 2Hz
    ros::Rate rate(20.0);

    // Wait for FCU connection
    while (ros::ok() && !current_state.connected) {
        ros::spinOnce();
        rate.sleep();
    }

    geometry_msgs::PoseStamped pose;
    pose.pose.position.x = 0;
    pose.pose.position.y = 0;
    pose.pose.position.z = target_altitude;

    // Send a few setpoints before starting
    for (int i = 100; ros::ok() && i > 0; --i) {
        local_pos_pub.publish(pose);
        ros::spinOnce();
        rate.sleep();
    }

    mavros_msgs::SetMode offb_set_mode;
    offb_set_mode.request.custom_mode = "OFFBOARD";

    mavros_msgs::CommandBool arm_cmd;
    arm_cmd.request.value = true;

    ros::Time last_request = ros::Time::now();
    ros::Time last_time = ros::Time::now();

    while (ros::ok()) {
        ros::Time now = ros::Time::now();
        double dt = (now - last_time).toSec();
        last_time = now;

        if (current_state.mode != "OFFBOARD" &&
            (ros::Time::now() - last_request > ros::Duration(5.0))) {
            if (set_mode_client.call(offb_set_mode) &&
                offb_set_mode.response.mode_sent) {
                ROS_INFO("Offboard enabled");
            }
            last_request = ros::Time::now();
        } else {
            if (!current_state.armed &&
                (ros::Time::now() - last_request > ros::Duration(5.0))) {
                if (arming_client.call(arm_cmd) &&
                    arm_cmd.response.success) {
                    ROS_INFO("Vehicle armed");
                }
                last_request = ros::Time::now();
            }
        }

        double control_effort = pid_controller(target_altitude, current_altitude, dt);
        
        geometry_msgs::Twist vel_msg;
        vel_msg.linear.z = control_effort;
        vel_pub.publish(vel_msg);

        local_pos_pub.publish(pose);

        ros::spinOnce();
        rate.sleep();
    }

    delete pid_altitude;
    return 0;
}
