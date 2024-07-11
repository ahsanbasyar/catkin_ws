/**
 * @file controller_client.cpp
 * @brief ROS service client to activate/deactivate the controller
 * @author Your Name
 * @date 09-07-2024
 */

#include <ros/ros.h>
#include "drone_controller/controller.h"  // Replace 'your_package' with your actual package name

int main(int argc, char **argv)
{
    ros::init(argc, argv, "controller_client");
    ros::NodeHandle nh;

    while (ros::ok())
    {
        if (ros::service::waitForService("/activate_controller", ros::Duration(5.0)))
        {
           // Service client initialization
            ros::ServiceClient client = nh.serviceClient<drone_controller::controller>("/activate_controller");
            drone_controller::controller srv;

            // Example request
            srv.request.activate = true;

            // Call the service
            if (client.call(srv))
            {
                if (srv.response.success)
                {
                    ROS_INFO("Controller activated successfully");
                }
                else
                {
                    ROS_ERROR("Failed to activate controller");
                }
            }
            else
            {
                ROS_ERROR("Failed to call service activate_controller");
                return 1;
            }

            // Example: Request to deactivate the controller (similar logic as above)

            return 0;
        }
       else
        {
            ROS_WARN("Service '/activate_controller' is not available, retrying...");
            ros::Duration(1.0).sleep();  // Wait for 1 second before retrying
        }

    }
    return 0;
}
