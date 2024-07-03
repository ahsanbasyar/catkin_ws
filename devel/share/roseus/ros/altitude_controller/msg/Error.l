;; Auto-generated. Do not edit!


(when (boundp 'altitude_controller::Error)
  (if (not (find-package "ALTITUDE_CONTROLLER"))
    (make-package "ALTITUDE_CONTROLLER"))
  (shadow 'Error (find-package "ALTITUDE_CONTROLLER")))
(unless (find-package "ALTITUDE_CONTROLLER::ERROR")
  (make-package "ALTITUDE_CONTROLLER::ERROR"))

(in-package "ROS")
;;//! \htmlinclude Error.msg.html


(defclass altitude_controller::Error
  :super ros::object
  :slots (_errorX _errorY _errorT _errorZ ))

(defmethod altitude_controller::Error
  (:init
   (&key
    ((:errorX __errorX) 0.0)
    ((:errorY __errorY) 0.0)
    ((:errorT __errorT) 0.0)
    ((:errorZ __errorZ) 0.0)
    )
   (send-super :init)
   (setq _errorX (float __errorX))
   (setq _errorY (float __errorY))
   (setq _errorT (float __errorT))
   (setq _errorZ (float __errorZ))
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
  (:errorZ
   (&optional __errorZ)
   (if __errorZ (setq _errorZ __errorZ)) _errorZ)
  (:serialization-length
   ()
   (+
    ;; float32 _errorX
    4
    ;; float32 _errorY
    4
    ;; float32 _errorT
    4
    ;; float32 _errorZ
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
     ;; float32 _errorZ
       (sys::poke _errorZ (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
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
   ;; float32 _errorZ
     (setq _errorZ (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get altitude_controller::Error :md5sum-) "02b23bb72f5cb40fc5320fa3bb6465eb")
(setf (get altitude_controller::Error :datatype-) "altitude_controller/Error")
(setf (get altitude_controller::Error :definition-)
      "float32 errorX
float32 errorY
float32 errorT
float32 errorZ



")



(provide :altitude_controller/Error "02b23bb72f5cb40fc5320fa3bb6465eb")


