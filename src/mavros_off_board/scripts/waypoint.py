#!/usr/bin/env python

import rospy
from mavros_msgs.msg import State
from mavros_msgs.srv import CommandBool, CommandTOL, SetMode, CommandBoolRequest, SetModeRequest, CommandTOLRequest
from geometry_msgs.msg import PoseStamped
from sensor_msgs.msg import NavSatFix

FLIGHT_ALTITUDE = 3
WP_1_X = 4
WP_1_Y = 0
WP_2_X = 4
WP_2_Y = -3

current_state = State()
current_position = PoseStamped()
current_gps_position = NavSatFix()
pose = PoseStamped()

# Callback functions
def state_cb(msg):
    global current_state
    current_state = msg

def follow0(msg):
    global current_position
    current_position = msg

def gps0(msg):
    global current_gps_position
    current_gps_position = msg

def main():
    rospy.init_node('multidronecoba_node', anonymous=True)
    
    # Subscribers
    rospy.Subscriber("mavros/state", State, state_cb)
    rospy.Subscriber("mavros/local_position/pose", PoseStamped, follow0)
    rospy.Subscriber("mavros/global_position/global", NavSatFix, gps0)
    
    # Publishers
    local_pos_pub = rospy.Publisher("mavros/setpoint_position/local", PoseStamped, queue_size=10)
    
    # Service Clients
    arming_client = rospy.ServiceProxy("mavros/cmd/arming", CommandBool)
    set_mode_client = rospy.ServiceProxy("mavros/set_mode", SetMode)
    land_client = rospy.ServiceProxy("mavros/cmd/land", CommandTOL)
    
    rate = rospy.Rate(40.0)  # The setpoint publishing rate MUST be faster than 2Hz
    
    # Wait for FCU connection
    while not rospy.is_shutdown() and not current_state.connected:
        rospy.spin()
        rate.sleep()
        rospy.loginfo("connecting to FCU...")
    
    # UAV0 mode and commands
    arm_cmd = CommandBoolRequest()
    arm_cmd.value = True
    
    offb_set_mode = SetModeRequest()
    offb_set_mode.custom_mode = "AUTO.TAKEOFF"
    
    land_cmd = CommandTOLRequest()
    land_cmd.yaw = 0
    land_cmd.latitude = 0
    land_cmd.longitude = 0
    land_cmd.altitude = 0
    
    last_request = rospy.Time.now()
    
    # Takeoff
    pose.pose.position.x = 0
    pose.pose.position.y = 0
    pose.pose.position.z = FLIGHT_ALTITUDE
    
    rospy.loginfo("takeoff setinggi 3 meter")
    for i in range(10*40):
        local_pos_pub.publish(pose)
        rospy.spin()
        rate.sleep()
    rospy.loginfo("ketinggian sudah 3 meter")
    
    # Menuju Waypoint A
    pose.pose.position.x = WP_1_X
    pose.pose.position.y = WP_1_Y
    pose.pose.position.z = FLIGHT_ALTITUDE
    
    rospy.loginfo("Menuju Waypoint Pertama")
    for i in range(10*30):
        local_pos_pub.publish(pose)
        rospy.spin()
        rate.sleep()
    rospy.loginfo("Waypoint Pertama Tercapai")
    
    pose.pose.position.x = 0
    pose.pose.position.y = 0
    pose.pose.position.z = FLIGHT_ALTITUDE
    
    rospy.loginfo("Kembali ke Home Position")
    for i in range(10*30):
        local_pos_pub.publish(pose)
        rospy.spin()
        rate.sleep()
    rospy.loginfo("UAV sudah berada di Home")
    
    while not rospy.is_shutdown():
        pose.header.stamp = rospy.Time.now()
        pose.pose.position.z -= 0.1  # Decrease altitude by 0.1 meters per iteration
        
        for i in range(10*2):
            local_pos_pub.publish(pose)
            rospy.spin()
            rate.sleep()
        
        # Disarm the drone when soft landing is complete
        if current_state.armed and pose.pose.position.z <= 0.0:
            rospy.loginfo("Soft landing complete. Disarming...")
            
            for i in range(10*30):
                local_pos_pub.publish(pose)
                rospy.spin()
                rate.sleep()
            
            arm_cmd.value = False
            if arming_client.call(arm_cmd).success:
                rospy.loginfo("Disarmed")
                break  # Exit the loop when disarmed
            else:
                rospy.logerr("Failed to disarm")
                return -1

if __name__ == '__main__':
    try:
        main()
    except rospy.ROSInterruptException:
        pass
