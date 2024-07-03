;; Auto-generated. Do not edit!


(when (boundp 'object_detector::Corners)
  (if (not (find-package "OBJECT_DETECTOR"))
    (make-package "OBJECT_DETECTOR"))
  (shadow 'Corners (find-package "OBJECT_DETECTOR")))
(unless (find-package "OBJECT_DETECTOR::CORNERS")
  (make-package "OBJECT_DETECTOR::CORNERS"))

(in-package "ROS")
;;//! \htmlinclude Corners.msg.html


(defclass object_detector::Corners
  :super ros::object
  :slots (_TopLeftX _TopLeftY _TopRightX _TopRightY _BottomLeftX _BottomLeftY _BottomRightX _BottomRightY _CenterX _CenterY ))

(defmethod object_detector::Corners
  (:init
   (&key
    ((:TopLeftX __TopLeftX) 0.0)
    ((:TopLeftY __TopLeftY) 0.0)
    ((:TopRightX __TopRightX) 0.0)
    ((:TopRightY __TopRightY) 0.0)
    ((:BottomLeftX __BottomLeftX) 0.0)
    ((:BottomLeftY __BottomLeftY) 0.0)
    ((:BottomRightX __BottomRightX) 0.0)
    ((:BottomRightY __BottomRightY) 0.0)
    ((:CenterX __CenterX) 0.0)
    ((:CenterY __CenterY) 0.0)
    )
   (send-super :init)
   (setq _TopLeftX (float __TopLeftX))
   (setq _TopLeftY (float __TopLeftY))
   (setq _TopRightX (float __TopRightX))
   (setq _TopRightY (float __TopRightY))
   (setq _BottomLeftX (float __BottomLeftX))
   (setq _BottomLeftY (float __BottomLeftY))
   (setq _BottomRightX (float __BottomRightX))
   (setq _BottomRightY (float __BottomRightY))
   (setq _CenterX (float __CenterX))
   (setq _CenterY (float __CenterY))
   self)
  (:TopLeftX
   (&optional __TopLeftX)
   (if __TopLeftX (setq _TopLeftX __TopLeftX)) _TopLeftX)
  (:TopLeftY
   (&optional __TopLeftY)
   (if __TopLeftY (setq _TopLeftY __TopLeftY)) _TopLeftY)
  (:TopRightX
   (&optional __TopRightX)
   (if __TopRightX (setq _TopRightX __TopRightX)) _TopRightX)
  (:TopRightY
   (&optional __TopRightY)
   (if __TopRightY (setq _TopRightY __TopRightY)) _TopRightY)
  (:BottomLeftX
   (&optional __BottomLeftX)
   (if __BottomLeftX (setq _BottomLeftX __BottomLeftX)) _BottomLeftX)
  (:BottomLeftY
   (&optional __BottomLeftY)
   (if __BottomLeftY (setq _BottomLeftY __BottomLeftY)) _BottomLeftY)
  (:BottomRightX
   (&optional __BottomRightX)
   (if __BottomRightX (setq _BottomRightX __BottomRightX)) _BottomRightX)
  (:BottomRightY
   (&optional __BottomRightY)
   (if __BottomRightY (setq _BottomRightY __BottomRightY)) _BottomRightY)
  (:CenterX
   (&optional __CenterX)
   (if __CenterX (setq _CenterX __CenterX)) _CenterX)
  (:CenterY
   (&optional __CenterY)
   (if __CenterY (setq _CenterY __CenterY)) _CenterY)
  (:serialization-length
   ()
   (+
    ;; float32 _TopLeftX
    4
    ;; float32 _TopLeftY
    4
    ;; float32 _TopRightX
    4
    ;; float32 _TopRightY
    4
    ;; float32 _BottomLeftX
    4
    ;; float32 _BottomLeftY
    4
    ;; float32 _BottomRightX
    4
    ;; float32 _BottomRightY
    4
    ;; float32 _CenterX
    4
    ;; float32 _CenterY
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _TopLeftX
       (sys::poke _TopLeftX (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _TopLeftY
       (sys::poke _TopLeftY (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _TopRightX
       (sys::poke _TopRightX (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _TopRightY
       (sys::poke _TopRightY (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _BottomLeftX
       (sys::poke _BottomLeftX (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _BottomLeftY
       (sys::poke _BottomLeftY (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _BottomRightX
       (sys::poke _BottomRightX (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _BottomRightY
       (sys::poke _BottomRightY (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _CenterX
       (sys::poke _CenterX (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _CenterY
       (sys::poke _CenterY (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _TopLeftX
     (setq _TopLeftX (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _TopLeftY
     (setq _TopLeftY (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _TopRightX
     (setq _TopRightX (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _TopRightY
     (setq _TopRightY (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _BottomLeftX
     (setq _BottomLeftX (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _BottomLeftY
     (setq _BottomLeftY (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _BottomRightX
     (setq _BottomRightX (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _BottomRightY
     (setq _BottomRightY (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _CenterX
     (setq _CenterX (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _CenterY
     (setq _CenterY (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get object_detector::Corners :md5sum-) "95a9b5efd4b7dca1a4966428500c815c")
(setf (get object_detector::Corners :datatype-) "object_detector/Corners")
(setf (get object_detector::Corners :definition-)
      "float32 TopLeftX
float32 TopLeftY
float32 TopRightX
float32 TopRightY
float32 BottomLeftX
float32 BottomLeftY
float32 BottomRightX
float32 BottomRightY
float32 CenterX
float32 CenterY

")



(provide :object_detector/Corners "95a9b5efd4b7dca1a4966428500c815c")


