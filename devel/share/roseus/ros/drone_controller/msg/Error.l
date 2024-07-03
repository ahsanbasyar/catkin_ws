;; Auto-generated. Do not edit!


(when (boundp 'drone_controller::Error)
  (if (not (find-package "DRONE_CONTROLLER"))
    (make-package "DRONE_CONTROLLER"))
  (shadow 'Error (find-package "DRONE_CONTROLLER")))
(unless (find-package "DRONE_CONTROLLER::ERROR")
  (make-package "DRONE_CONTROLLER::ERROR"))

(in-package "ROS")
;;//! \htmlinclude Error.msg.html


(defclass drone_controller::Error
  :super ros::object
  :slots (_errorX _errorY _errorT _errorS ))

(defmethod drone_controller::Error
  (:init
   (&key
    ((:errorX __errorX) 0.0)
    ((:errorY __errorY) 0.0)
    ((:errorT __errorT) 0.0)
    ((:errorS __errorS) 0.0)
    )
   (send-super :init)
   (setq _errorX (float __errorX))
   (setq _errorY (float __errorY))
   (setq _errorT (float __errorT))
   (setq _errorS (float __errorS))
   self)
  (:errorX
   (&optional __errorX)
   (if __errorX (setq _errorX __errorX)) _errorX)
  (:errorY
   (&optional __errorY)
   (if __errorY (setq _errorY __errorY)) _errorY)
  (:errorT
   (&optional __errorT)
   (if __errorT (setq _errorT __errorT)) _errorT)
  (:errorS
   (&optional __errorS)
   (if __errorS (setq _errorS __errorS)) _errorS)
  (:serialization-length
   ()
   (+
    ;; float32 _errorX
    4
    ;; float32 _errorY
    4
    ;; float32 _errorT
    4
    ;; float32 _errorS
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _errorX
       (sys::poke _errorX (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _errorY
       (sys::poke _errorY (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _errorT
       (sys::poke _errorT (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _errorS
       (sys::poke _errorS (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _errorX
     (setq _errorX (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _errorY
     (setq _errorY (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _errorT
     (setq _errorT (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _errorS
     (setq _errorS (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get drone_controller::Error :md5sum-) "bec471dc6cd71b2bc7e4ca773e16f190")
(setf (get drone_controller::Error :datatype-) "drone_controller/Error")
(setf (get drone_controller::Error :definition-)
      "float32 errorX
float32 errorY
float32 errorT
float32 errorS



")



(provide :drone_controller/Error "bec471dc6cd71b2bc7e4ca773e16f190")


