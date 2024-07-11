;; Auto-generated. Do not edit!


(when (boundp 'drone_controller::controller)
  (if (not (find-package "DRONE_CONTROLLER"))
    (make-package "DRONE_CONTROLLER"))
  (shadow 'controller (find-package "DRONE_CONTROLLER")))
(unless (find-package "DRONE_CONTROLLER::CONTROLLER")
  (make-package "DRONE_CONTROLLER::CONTROLLER"))
(unless (find-package "DRONE_CONTROLLER::CONTROLLERREQUEST")
  (make-package "DRONE_CONTROLLER::CONTROLLERREQUEST"))
(unless (find-package "DRONE_CONTROLLER::CONTROLLERRESPONSE")
  (make-package "DRONE_CONTROLLER::CONTROLLERRESPONSE"))

(in-package "ROS")





(defclass drone_controller::controllerRequest
  :super ros::object
  :slots (_activate ))

(defmethod drone_controller::controllerRequest
  (:init
   (&key
    ((:activate __activate) nil)
    )
   (send-super :init)
   (setq _activate __activate)
   self)
  (:activate
   (&optional (__activate :null))
   (if (not (eq __activate :null)) (setq _activate __activate)) _activate)
  (:serialization-length
   ()
   (+
    ;; bool _activate
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _activate
       (if _activate (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _activate
     (setq _activate (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass drone_controller::controllerResponse
  :super ros::object
  :slots (_success ))

(defmethod drone_controller::controllerResponse
  (:init
   (&key
    ((:success __success) nil)
    )
   (send-super :init)
   (setq _success __success)
   self)
  (:success
   (&optional (__success :null))
   (if (not (eq __success :null)) (setq _success __success)) _success)
  (:serialization-length
   ()
   (+
    ;; bool _success
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _success
       (if _success (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _success
     (setq _success (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass drone_controller::controller
  :super ros::object
  :slots ())

(setf (get drone_controller::controller :md5sum-) "28dadd83d564c0f1c7317577c2a315b5")
(setf (get drone_controller::controller :datatype-) "drone_controller/controller")
(setf (get drone_controller::controller :request) drone_controller::controllerRequest)
(setf (get drone_controller::controller :response) drone_controller::controllerResponse)

(defmethod drone_controller::controllerRequest
  (:response () (instance drone_controller::controllerResponse :init)))

(setf (get drone_controller::controllerRequest :md5sum-) "28dadd83d564c0f1c7317577c2a315b5")
(setf (get drone_controller::controllerRequest :datatype-) "drone_controller/controllerRequest")
(setf (get drone_controller::controllerRequest :definition-)
      "bool activate  # Whether to activate or deactivate the controller
---
bool success  # Indicate if the operation was successful
")

(setf (get drone_controller::controllerResponse :md5sum-) "28dadd83d564c0f1c7317577c2a315b5")
(setf (get drone_controller::controllerResponse :datatype-) "drone_controller/controllerResponse")
(setf (get drone_controller::controllerResponse :definition-)
      "bool activate  # Whether to activate or deactivate the controller
---
bool success  # Indicate if the operation was successful
")



(provide :drone_controller/controller "28dadd83d564c0f1c7317577c2a315b5")


