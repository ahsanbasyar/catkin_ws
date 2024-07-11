;; Auto-generated. Do not edit!


(when (boundp 'mavros_off_board::Trigger)
  (if (not (find-package "MAVROS_OFF_BOARD"))
    (make-package "MAVROS_OFF_BOARD"))
  (shadow 'Trigger (find-package "MAVROS_OFF_BOARD")))
(unless (find-package "MAVROS_OFF_BOARD::TRIGGER")
  (make-package "MAVROS_OFF_BOARD::TRIGGER"))
(unless (find-package "MAVROS_OFF_BOARD::TRIGGERREQUEST")
  (make-package "MAVROS_OFF_BOARD::TRIGGERREQUEST"))
(unless (find-package "MAVROS_OFF_BOARD::TRIGGERRESPONSE")
  (make-package "MAVROS_OFF_BOARD::TRIGGERRESPONSE"))

(in-package "ROS")





(defclass mavros_off_board::TriggerRequest
  :super ros::object
  :slots (_trigger ))

(defmethod mavros_off_board::TriggerRequest
  (:init
   (&key
    ((:trigger __trigger) nil)
    )
   (send-super :init)
   (setq _trigger __trigger)
   self)
  (:trigger
   (&optional (__trigger :null))
   (if (not (eq __trigger :null)) (setq _trigger __trigger)) _trigger)
  (:serialization-length
   ()
   (+
    ;; bool _trigger
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _trigger
       (if _trigger (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _trigger
     (setq _trigger (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass mavros_off_board::TriggerResponse
  :super ros::object
  :slots (_success _message ))

(defmethod mavros_off_board::TriggerResponse
  (:init
   (&key
    ((:success __success) nil)
    ((:message __message) "")
    )
   (send-super :init)
   (setq _success __success)
   (setq _message (string __message))
   self)
  (:success
   (&optional (__success :null))
   (if (not (eq __success :null)) (setq _success __success)) _success)
  (:message
   (&optional __message)
   (if __message (setq _message __message)) _message)
  (:serialization-length
   ()
   (+
    ;; bool _success
    1
    ;; string _message
    4 (length _message)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _success
       (if _success (write-byte -1 s) (write-byte 0 s))
     ;; string _message
       (write-long (length _message) s) (princ _message s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _success
     (setq _success (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; string _message
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _message (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass mavros_off_board::Trigger
  :super ros::object
  :slots ())

(setf (get mavros_off_board::Trigger :md5sum-) "1531357144714babf83a2def976015d9")
(setf (get mavros_off_board::Trigger :datatype-) "mavros_off_board/Trigger")
(setf (get mavros_off_board::Trigger :request) mavros_off_board::TriggerRequest)
(setf (get mavros_off_board::Trigger :response) mavros_off_board::TriggerResponse)

(defmethod mavros_off_board::TriggerRequest
  (:response () (instance mavros_off_board::TriggerResponse :init)))

(setf (get mavros_off_board::TriggerRequest :md5sum-) "1531357144714babf83a2def976015d9")
(setf (get mavros_off_board::TriggerRequest :datatype-) "mavros_off_board/TriggerRequest")
(setf (get mavros_off_board::TriggerRequest :definition-)
      "bool trigger
---
bool success
string message
")

(setf (get mavros_off_board::TriggerResponse :md5sum-) "1531357144714babf83a2def976015d9")
(setf (get mavros_off_board::TriggerResponse :datatype-) "mavros_off_board/TriggerResponse")
(setf (get mavros_off_board::TriggerResponse :definition-)
      "bool trigger
---
bool success
string message
")



(provide :mavros_off_board/Trigger "1531357144714babf83a2def976015d9")


