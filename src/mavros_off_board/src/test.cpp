#include <ros/ros.h>
#include <geometry_msgs/PoseStamped.h>
#include <mavros_msgs/CommandBool.h>
#include <mavros_msgs/CommandTOL.h>
#include <mavros_msgs/SetMode.h>
#include <mavros_msgs/State.h>
#include <mavros_msgs/PositionTarget.h>
#include <geometry_msgs/TwistStamped.h>
#include <sensor_msgs/NavSatFix.h>
#include <sensor_msgs/Image.h>
#include <image_transport/image_transport.h>
#include "mavros_off_board/Marker.h"
// #include <cv_bridge/cv_bridge.h>
// #include <opencv2/highgui/highgui.hpp>
// #include <opencv2/aruco.hpp>
#define FLIGHT_ALTITUDE1 3
#define FLIGHT_ALTITUDE2 5
#define FLIGHT_ALTITUDE3 7
#define WP_1_X 4
#define WP_1_Y 0
#define WP_2_X 4
#define WP_2_Y -3


mavros_msgs::State current_state;

geometry_msgs::PoseStamped current_position;

sensor_msgs::NavSatFix current_gps_position;

geometry_msgs::PoseStamped pose;


// Subscriber Define
ros::Subscriber marker_sub;
ros::Subscriber global_pos_sub;
ros::Subscriber local_pos_sub;
ros::Subscriber state_sub;
ros::Subscriber pos_sub;
ros::Subscriber init_local_pos_sub;
ros::Subscriber local_vel_sub;

// Publisher Define
ros::Publisher local_pos_pub;
ros::Publisher local_vel_pub;
ros::ServiceClient arming_client;
ros::ServiceClient set_mode_client;
ros::ServiceClient land_client;


void state_cb(const mavros_msgs::State::ConstPtr& msg1){
    current_state = *msg1;
}

void follow0(const geometry_msgs::PoseStamped::ConstPtr& msg4){
current_position = *msg4;
}


void gps0(const sensor_msgs::NavSatFix::ConstPtr& msg7){
current_gps_position = *msg7;

}


int main(int argc, char **argv)
{
    ros::init(argc, argv, "multidronecoba_node");
    ros::NodeHandle nh;


    // subs and pubs for uavs

    // image_transport::ImageTransport it_uav1(nh_uav1);
    // image_transport::Subscriber sub_uav1 = it_uav1.subscribe("iris1/usb_cam/image_raw/compressed", 1, imageCallback_uav1);
    // vel_pub_uav1 = nh_uav1.advertise<geometry_msgs::TwistStamped>("uav1/mavros/setpoint_velocity/cmd_vel", 1);
    
    // image_transport::ImageTransport it_uav2(nh_uav2);
    // image_transport::SubscDICT_6X6_250riber sub_uav2 = it_uav2.subscribe("iris2/usb_cam/image_raw/compressed", 1, imageCallback_uav2);
    // vel_pub_uav2 = nh_uav2.advertise<geometry_msgs::TwistStamped>("uav2/mavros/setpoint_velocity/cmd_vel", 1);

    // ros::Publisher pub = node_handle.advertise<message_type>(topic_name, queue_size);
    
    state_sub = nh.subscribe<mavros_msgs::State>
            ("mavros/state", 10, state_cb);
    marker_sub = nh.subscribe<mavros_off_board::Marker>
            ("mavros/state", 10, state_cb);
    local_pos_pub = nh.advertise<geometry_msgs::PoseStamped>
            ("mavros/setpoint_position/local", 10);
    arming_client = nh.serviceClient<mavros_msgs::CommandBool>
            ("mavros/cmd/arming");
    land_client = nh.serviceClient<mavros_msgs::CommandTOL>
            ("mavros/cmd/land");
    set_mode_client = nh.serviceClient<mavros_msgs::SetMode>
            ("mavros/set_mode");
    //ros::Subscriber sub = nh_uav0.subscribe("uav0/mavros/local_position/pose", 10, poseCallback0);
    local_pos_sub = nh.subscribe("mavros/local_position/odom", 10, follow0);
    global_pos_sub = nh.subscribe("mavros/global_position/global", 10, gps0);
  


    //the setpoint publishing rate MUST be faster than 2Hz
    ros::Rate rate(40.0);

    // wait for FCU connection
    while(ros::ok() && current_state.connected){
        ros::spinOnce();
        rate.sleep();
        ROS_INFO("connecting to FCU...");
    }

   

//uav0 mode and commands
    mavros_msgs::CommandBool arm_cmd;
    arm_cmd.request.value = true;

    mavros_msgs::SetMode offb_set_mode;
    offb_set_mode.request.custom_mode = "AUTO.TAKEOFF";

    mavros_msgs::CommandTOL land_cmd;
    land_cmd.request.yaw = 0;
    land_cmd.request.latitude = 0;
    land_cmd.request.longitude = 0;
    land_cmd.request.altitude = 0;

    ros::Time last_request = ros::Time::now();



// Takeoff
    pose.pose.position.x = 0;
    pose.pose.position.y = 0;
    pose.pose.position.z = FLIGHT_ALTITUDE1;

    ROS_INFO("takeoff setinggi 3 meter");
    for(int i = 0; ros::ok() && i < 10*40; ++i){

      local_pos_pub.publish(pose);

      ros::spinOnce();
      rate.sleep();
    }
    ROS_INFO("ketinggian sudah 3 meter");

      // Menuju Waypoint A
    pose.pose.position.x = WP_1_X;
    pose.pose.position.y = WP_1_Y;
    pose.pose.position.z = FLIGHT_ALTITUDE1;


    ROS_INFO("Menuju Waypoint Pertama");
    for(int i = 0; ros::ok() && i < 10*30; ++i){

      local_pos_pub.publish(pose);

      ros::spinOnce();
      rate.sleep();
    }
    ROS_INFO("Waypoint Pertama Tercapai");



     // Menuju Waypoint A
    pose.pose.position.x = WP_1_X;
    pose.pose.position.y = WP_1_Y;
    pose.pose.position.z = FLIGHT_ALTITUDE1;


    ROS_INFO("Menuju Tinggi Kedua");
    for(int i = 0; ros::ok() && i < 10*30; ++i){

      local_pos_pub.publish(pose);

      ros::spinOnce();
      rate.sleep();
    }
    ROS_INFO("Waypoint Pertama Tercapai");



    pose.pose.position.x = 0;
    pose.pose.position.y = 0;
    pose.pose.position.z = FLIGHT_ALTITUDE2;


    ROS_INFO("Kembali ke Home Position");
    //send setpoints for 10 seconds
    for(int i = 0; ros::ok() && i < 10*30; ++i){

      local_pos_pub.publish(pose);
      ros::spinOnce();
      rate.sleep();
    }
    ROS_INFO("UAV sudah berada di Home");

    while (ros::ok()) {

        pose.header.stamp = ros::Time::now();
        pose.pose.position.z -= 0.1;  // Decrease altitude by 0.1 meters per iteration
             
        for(int i = 0; ros::ok() && i < 10*2; ++i){

            local_pos_pub.publish(pose);

            ros::spinOnce();
            rate.sleep();
        }

        // Disarm the drone when soft landing is complete
        if (current_state.armed && pose.pose.position.z <= 0.0) {
            ROS_INFO("Soft landing complete. Disarming...");

            for(int i = 0; ros::ok() && i < 10*30; ++i){

            local_pos_pub.publish(pose);
            
            ros::spinOnce();
            rate.sleep();
        }


            arm_cmd.request.value = false;
            if (arming_client.call(arm_cmd) && arm_cmd.response.success) {
                 ROS_INFO("Disarmed");
                 break;  // Exit the loop when disarmed
             } else {
                 ROS_ERROR("Failed to disarm");
                 return -1;
             }
        }
    }

}
