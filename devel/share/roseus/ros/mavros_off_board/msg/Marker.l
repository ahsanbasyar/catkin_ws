;; Auto-generated. Do not edit!


(when (boundp 'mavros_off_board::Marker)
  (if (not (find-package "MAVROS_OFF_BOARD"))
    (make-package "MAVROS_OFF_BOARD"))
  (shadow 'Marker (find-package "MAVROS_OFF_BOARD")))
(unless (find-package "MAVROS_OFF_BOARD::MARKER")
  (make-package "MAVROS_OFF_BOARD::MARKER"))

(in-package "ROS")
;;//! \htmlinclude Marker.msg.html


(defclass mavros_off_board::Marker
  :super ros::object
  :slots (_marker ))

(defmethod mavros_off_board::Marker
  (:init
   (&key
    ((:marker __marker) "")
    )
   (send-super :init)
   (setq _marker (string __marker))
   self)
  (:marker
   (&optional __marker)
   (if __marker (setq _marker __marker)) _marker)
  (:serialization-length
   ()
   (+
    ;; string _marker
    4 (length _marker)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _marker
       (write-long (length _marker) s) (princ _marker s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _marker
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _marker (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(setf (get mavros_off_board::Marker :md5sum-) "ccfec723a81cad4a14447f57eb95ca7f")
(setf (get mavros_off_board::Marker :datatype-) "mavros_off_board/Marker")
(setf (get mavros_off_board::Marker :definition-)
      "string marker
")



(provide :mavros_off_board/Marker "ccfec723a81cad4a14447f57eb95ca7f")


