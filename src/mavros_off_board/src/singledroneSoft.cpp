#include <ros/ros.h>
#include <geometry_msgs/PoseStamped.h>
#include <mavros_msgs/CommandBool.h>
#include <mavros_msgs/CommandTOL.h>
#include <mavros_msgs/SetMode.h>
#include <mavros_msgs/State.h>
#include <sensor_msgs/NavSatFix.h>
#include <mavros_off_board/Marker.h>
#include <drone_controller/controller.h>
#include <drone_controller/Information.h>
#include <mavros_off_board/Trigger.h>

#define FLIGHT_ALTITUDE 3
#define WP_1_X 4
#define WP_1_Y 0
#define WP_2_X 4
#define WP_2_Y -3

mavros_msgs::State current_state;
geometry_msgs::PoseStamped current_position;
sensor_msgs::NavSatFix current_gps_position;
geometry_msgs::PoseStamped pose;
mavros_off_board::Marker marker;
drone_controller::Information information;

ros::Subscriber marker_sub;
ros::Subscriber information_sub;
ros::Subscriber global_pos_sub;
ros::Subscriber local_pos_sub;
ros::Subscriber state_sub;
ros::Publisher local_pos_pub;
ros::ServiceClient arming_client;
ros::ServiceClient set_mode_client;
ros::ServiceClient land_client;
ros::ServiceClient client;
ros::ServiceClient trigger_client;

void state_cb(const mavros_msgs::State::ConstPtr& msg) {
    current_state = *msg;
}

void follow0(const geometry_msgs::PoseStamped::ConstPtr& msg) {
    current_position = *msg;
}

void gps0(const sensor_msgs::NavSatFix::ConstPtr& msg) {
    current_gps_position = *msg;
}

void markerinfo(const mavros_off_board::Marker::ConstPtr& msg) {
    marker = *msg;
}

void informationinfo(const drone_controller::Information::ConstPtr& msg) {
    information = *msg;
}

void return_home_and_land(ros::Rate& rate) { // Pass rate by reference
    pose.pose.position.x = 0;
    pose.pose.position.y = 0;
    pose.pose.position.z = FLIGHT_ALTITUDE;

    ROS_INFO("Returning to Home Position");

    for (int i = 0; ros::ok() && i < 10 * 30; ++i) {
        local_pos_pub.publish(pose);
        ros::spinOnce();
        rate.sleep(); // Use rate passed as parameter
    }

    ROS_INFO("UAV is at Home");

    while (ros::ok()) {
        pose.header.stamp = ros::Time::now();
        pose.pose.position.z -= 0.1;

        for (int i = 0; ros::ok() && i < 10 * 2; ++i) {
            local_pos_pub.publish(pose);
            ros::spinOnce();
            rate.sleep(); // Use rate passed as parameter
        }

        if (current_state.armed && pose.pose.position.z <= 0.0) {
            ROS_INFO("Soft landing complete. Disarming...");

            for (int i = 0; ros::ok() && i < 10 * 30; ++i) {
                local_pos_pub.publish(pose);
                ros::spinOnce();
                rate.sleep(); // Use rate passed as parameter
            }

            mavros_msgs::CommandBool arm_cmd;
            arm_cmd.request.value = false;

            if (arming_client.call(arm_cmd) && arm_cmd.response.success) {
                ROS_INFO("Disarmed");
                break;
            } else {
                ROS_ERROR("Failed to disarm");
                return;
            }
        }
    }
}

int main(int argc, char** argv) {
    ros::init(argc, argv, "waypoint_node");
    ros::NodeHandle nh;

    // Subscribers
    marker_sub = nh.subscribe<mavros_off_board::Marker>("marker", 10, markerinfo);
    information_sub = nh.subscribe<drone_controller::Information>("information", 10, informationinfo);
    state_sub = nh.subscribe<mavros_msgs::State>("mavros/state", 10, state_cb);
    local_pos_sub = nh.subscribe("mavros/local_position/odom", 10, follow0);
    global_pos_sub = nh.subscribe("mavros/global_position/global", 10, gps0);

    // Publishers
    local_pos_pub = nh.advertise<geometry_msgs::PoseStamped>("mavros/setpoint_position/local", 10);

    // Service Clients
    arming_client = nh.serviceClient<mavros_msgs::CommandBool>("mavros/cmd/arming");
    land_client = nh.serviceClient<mavros_msgs::CommandTOL>("mavros/cmd/land");
    set_mode_client = nh.serviceClient<mavros_msgs::SetMode>("mavros/set_mode");
    client = nh.serviceClient<drone_controller::controller>("service_name");
    trigger_client = nh.serviceClient<mavros_off_board::Trigger>("image_gps_logger_node/trigger_capture");

    // Wait for FCU connection
    ros::Rate rate(40.0);
    while (ros::ok() && !current_state.connected) {
        ros::spinOnce();
        rate.sleep();
        ROS_INFO("Connecting to FCU...");
    }

    // Takeoff
    pose.pose.position.x = 0;
    pose.pose.position.y = 0;
    pose.pose.position.z = FLIGHT_ALTITUDE;

    ROS_INFO("Taking off to 3 meters altitude");
    for (int i = 0; ros::ok() && i < 10 * 40; ++i) {
        local_pos_pub.publish(pose);
        ros::spinOnce();
        rate.sleep();
    }
    ROS_INFO("Reached altitude of 3 meters");

    // Move to Waypoint 1
    pose.pose.position.x = WP_1_X;
    pose.pose.position.y = WP_1_Y;

    ROS_INFO("Moving to Waypoint 1");
    for (int i = 0; ros::ok() && i < 10 * 30; ++i) {
        local_pos_pub.publish(pose);
        ros::spinOnce();
        rate.sleep();
    }
    ROS_INFO("Reached Waypoint 1");

    // Check marker condition
    if (marker.marker == "Marker Found") {
        // Call your service here
        // Example:
        ros::ServiceClient client = nh.serviceClient<drone_controller::controller>("/activate_controller");
        drone_controller::controller srv;
        srv.request.activate = true;
        if (client.call(srv)) {
            ROS_INFO("Service call success");
        } else {
            ROS_ERROR("Failed to call service");
        }
            // Menunggu informasi "Drone Diam" sebelum mematikan layanan
        while (ros::ok()) {
            ros::spinOnce();
            if (information.information == "Drone Diam") {
                break;
            }
            rate.sleep();
        }
    }

    // Delay 3 seconds
    ros::Duration(3.0).sleep();

    ros::ServiceClient trigger_client = nh.serviceClient<mavros_off_board::Trigger>("/image_gps_logger_node/trigger_capture");
    mavros_off_board::Trigger trg;
    trg.request.trigger = true;
    if (trigger_client.exists()) {
        if (trigger_client.call(trg)) {
            ROS_INFO("Service call success");
        } else {
            ROS_ERROR("Failed to call service");
        }
    } else {
        ROS_ERROR("Service '/image_gps_logger_node/trigger_capture' does not exist");
    }

    //rosservice, Buatlah sebuah skrip Python untuk mengirimkan permintaan ke layanan TriggerCapture.

    ros::ServiceClient client = nh.serviceClient<drone_controller::controller>("/activate_controller");
    drone_controller::controller srv;
    srv.request.activate = false;
    if (client.call(srv)) {
        ROS_INFO("Service call success");
    } else {
        ROS_ERROR("Failed to call service");
    }
        // return_home_and_land(rate); 
    return_home_and_land(rate); // Pass rate to the function
    
    

    return 0;
}
