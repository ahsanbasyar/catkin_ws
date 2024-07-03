;; Auto-generated. Do not edit!


(when (boundp 'object_detector::States)
  (if (not (find-package "OBJECT_DETECTOR"))
    (make-package "OBJECT_DETECTOR"))
  (shadow 'States (find-package "OBJECT_DETECTOR")))
(unless (find-package "OBJECT_DETECTOR::STATES")
  (make-package "OBJECT_DETECTOR::STATES"))

(in-package "ROS")
;;//! \htmlinclude States.msg.html


(defclass object_detector::States
  :super ros::object
  :slots (_Xc _Yc _W _H _Theta ))

(defmethod object_detector::States
  (:init
   (&key
    ((:Xc __Xc) 0.0)
    ((:Yc __Yc) 0.0)
    ((:W __W) 0.0)
    ((:H __H) 0.0)
    ((:Theta __Theta) 0.0)
    )
   (send-super :init)
   (setq _Xc (float __Xc))
   (setq _Yc (float __Yc))
   (setq _W (float __W))
   (setq _H (float __H))
   (setq _Theta (float __Theta))
   self)
  (:Xc
   (&optional __Xc)
   (if __Xc (setq _Xc __Xc)) _Xc)
  (:Yc
   (&optional __Yc)
   (if __Yc (setq _Yc __Yc)) _Yc)
  (:W
   (&optional __W)
   (if __W (setq _W __W)) _W)
  (:H
   (&optional __H)
   (if __H (setq _H __H)) _H)
  (:Theta
   (&optional __Theta)
   (if __Theta (setq _Theta __Theta)) _Theta)
  (:serialization-length
   ()
   (+
    ;; float32 _Xc
    4
    ;; float32 _Yc
    4
    ;; float32 _W
    4
    ;; float32 _H
    4
    ;; float32 _Theta
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _Xc
       (sys::poke _Xc (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _Yc
       (sys::poke _Yc (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _W
       (sys::poke _W (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _H
       (sys::poke _H (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _Theta
       (sys::poke _Theta (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _Xc
     (setq _Xc (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _Yc
     (setq _Yc (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _W
     (setq _W (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _H
     (setq _H (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _Theta
     (setq _Theta (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get object_detector::States :md5sum-) "50a97e783d0bea6e7856b14f0401e6c9")
(setf (get object_detector::States :datatype-) "object_detector/States")
(setf (get object_detector::States :definition-)
      "float32 Xc
float32 Yc
float32 W
float32 H
float32 Theta


")



(provide :object_detector/States "50a97e783d0bea6e7856b14f0401e6c9")


