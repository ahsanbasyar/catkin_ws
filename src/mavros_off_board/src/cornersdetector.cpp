#include <ros/ros.h>
#include <std_msgs/Float32MultiArray.h>
#include <opencv2/opencv.hpp>
#include <opencv2/aruco.hpp>
#include <cv_bridge/cv_bridge.h>
#include <sensor_msgs/Image.h>
#include <object_detector/Corners.h>  // Assuming you have a message type object_detector/Corners

class Drone {
public:
    Drone() {
        ros::NodeHandle nh;
        image_sub = nh.subscribe("/iris/usb_cam/image_raw", 1, &Drone::imageCallback, this);
        corners_pub = nh.advertise<object_detector::Corners>("corners_detected", 1);
    }

    void imageCallback(const sensor_msgs::ImageConstPtr& msg) {
        cv_bridge::CvImagePtr cv_ptr;
        try {
            cv_ptr = cv_bridge::toCvCopy(msg, sensor_msgs::image_encodings::BGR8);
        } catch (cv_bridge::CvBridgeException& e) {
            ROS_ERROR("cv_bridge exception: %s", e.what());
            return;
        }

        cv::Mat frame = cv_ptr->image;
        cv::Mat gray_image;
        cv::cvtColor(frame, gray_image, cv::COLOR_BGR2GRAY);

        std::vector<int> marker_ids;
        std::vector<std::vector<cv::Point2f>> marker_corners;
        cv::aruco::detectMarkers(gray_image, aruco_dict, marker_corners, marker_ids, parameters);

        if (!marker_corners.empty()) {
            std::vector<cv::Vec3d> rvecs, tvecs;
            cv::aruco::estimatePoseSingleMarkers(marker_corners, marker_size, camera_matrix, camera_distortion, rvecs, tvecs);

            for (size_t i = 0; i < marker_ids.size(); ++i) {
                object_detector::Corners coordinates;
                coordinates.MarkerID = marker_ids[i];
                coordinates.TopLeftX = marker_corners[i][0].x;
                coordinates.TopLeftY = marker_corners[i][0].y;
                coordinates.TopRightX = marker_corners[i][1].x;
                coordinates.TopRightY = marker_corners[i][1].y;
                coordinates.BottomRightX = marker_corners[i][2].x;
                coordinates.BottomRightY = marker_corners[i][2].y;
                coordinates.BottomLeftX = marker_corners[i][3].x;
                coordinates.BottomLeftY = marker_corners[i][3].y;
                coordinates.CenterX = (coordinates.TopLeftX + coordinates.TopRightX + coordinates.BottomRightX + coordinates.BottomLeftX) / 4.0;
                coordinates.CenterY = (coordinates.TopLeftY + coordinates.TopRightY + coordinates.BottomRightY + coordinates.BottomLeftY) / 4.0;

                corners_pub.publish(coordinates);
            }
        }
    }

private:
    ros::Subscriber image_sub;
    ros::Publisher corners_pub;
    cv::Ptr<cv::aruco::Dictionary> aruco_dict = cv::aruco::getPredefinedDictionary(cv::aruco::DICT_ARUCO_ORIGINAL);
    cv::Ptr<cv::aruco::DetectorParameters> parameters = cv::aruco::DetectorParameters::create();
    cv::Mat camera_matrix, camera_distortion;
    float marker_size = 8.0;  // Marker size in cm
};

int main(int argc, char** argv) {
    ros::init(argc, argv, "drone_aruco_detector");
    Drone drone;

    // Load camera calibration data
    cv::FileStorage fs("/home/ahsanbasyar/Downloads/MultiMatrix.xml", cv::FileStorage::READ);
    fs["camMatrix"] >> drone.camera_matrix;
    fs["distCoef"] >> drone.camera_distortion;
    fs.release();

    ros::spin();
    return 0;
}
