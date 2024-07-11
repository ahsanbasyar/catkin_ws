;; Auto-generated. Do not edit!


(when (boundp 'drone_controller::Information)
  (if (not (find-package "DRONE_CONTROLLER"))
    (make-package "DRONE_CONTROLLER"))
  (shadow 'Information (find-package "DRONE_CONTROLLER")))
(unless (find-package "DRONE_CONTROLLER::INFORMATION")
  (make-package "DRONE_CONTROLLER::INFORMATION"))

(in-package "ROS")
;;//! \htmlinclude Information.msg.html


(defclass drone_controller::Information
  :super ros::object
  :slots (_information ))

(defmethod drone_controller::Information
  (:init
   (&key
    ((:information __information) "")
    )
   (send-super :init)
   (setq _information (string __information))
   self)
  (:information
   (&optional __information)
   (if __information (setq _information __information)) _information)
  (:serialization-length
   ()
   (+
    ;; string _information
    4 (length _information)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _information
       (write-long (length _information) s) (princ _information s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _information
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _information (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(setf (get drone_controller::Information :md5sum-) "8f643f4492d5df4a7264b4dfdbe3626f")
(setf (get drone_controller::Information :datatype-) "drone_controller/Information")
(setf (get drone_controller::Information :definition-)
      "string information
")



(provide :drone_controller/Information "8f643f4492d5df4a7264b4dfdbe3626f")


