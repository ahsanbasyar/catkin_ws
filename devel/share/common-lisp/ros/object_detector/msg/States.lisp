; Auto-generated. Do not edit!


(cl:in-package object_detector-msg)


;//! \htmlinclude States.msg.html

(cl:defclass <States> (roslisp-msg-protocol:ros-message)
  ((Xc
    :reader Xc
    :initarg :Xc
    :type cl:float
    :initform 0.0)
   (Yc
    :reader Yc
    :initarg :Yc
    :type cl:float
    :initform 0.0)
   (W
    :reader W
    :initarg :W
    :type cl:float
    :initform 0.0)
   (H
    :reader H
    :initarg :H
    :type cl:float
    :initform 0.0)
   (Theta
    :reader Theta
    :initarg :Theta
    :type cl:float
    :initform 0.0))
)

(cl:defclass States (<States>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <States>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'States)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name object_detector-msg:<States> is deprecated: use object_detector-msg:States instead.")))

(cl:ensure-generic-function 'Xc-val :lambda-list '(m))
(cl:defmethod Xc-val ((m <States>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader object_detector-msg:Xc-val is deprecated.  Use object_detector-msg:Xc instead.")
  (Xc m))

(cl:ensure-generic-function 'Yc-val :lambda-list '(m))
(cl:defmethod Yc-val ((m <States>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader object_detector-msg:Yc-val is deprecated.  Use object_detector-msg:Yc instead.")
  (Yc m))

(cl:ensure-generic-function 'W-val :lambda-list '(m))
(cl:defmethod W-val ((m <States>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader object_detector-msg:W-val is deprecated.  Use object_detector-msg:W instead.")
  (W m))

(cl:ensure-generic-function 'H-val :lambda-list '(m))
(cl:defmethod H-val ((m <States>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader object_detector-msg:H-val is deprecated.  Use object_detector-msg:H instead.")
  (H m))

(cl:ensure-generic-function 'Theta-val :lambda-list '(m))
(cl:defmethod Theta-val ((m <States>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader object_detector-msg:Theta-val is deprecated.  Use object_detector-msg:Theta instead.")
  (Theta m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <States>) ostream)
  "Serializes a message object of type '<States>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'Xc))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'Yc))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'W))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'H))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'Theta))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <States>) istream)
  "Deserializes a message object of type '<States>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'Xc) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'Yc) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'W) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'H) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'Theta) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<States>)))
  "Returns string type for a message object of type '<States>"
  "object_detector/States")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'States)))
  "Returns string type for a message object of type 'States"
  "object_detector/States")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<States>)))
  "Returns md5sum for a message object of type '<States>"
  "50a97e783d0bea6e7856b14f0401e6c9")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'States)))
  "Returns md5sum for a message object of type 'States"
  "50a97e783d0bea6e7856b14f0401e6c9")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<States>)))
  "Returns full string definition for message of type '<States>"
  (cl:format cl:nil "float32 Xc~%float32 Yc~%float32 W~%float32 H~%float32 Theta~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'States)))
  "Returns full string definition for message of type 'States"
  (cl:format cl:nil "float32 Xc~%float32 Yc~%float32 W~%float32 H~%float32 Theta~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <States>))
  (cl:+ 0
     4
     4
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <States>))
  "Converts a ROS message object to a list"
  (cl:list 'States
    (cl:cons ':Xc (Xc msg))
    (cl:cons ':Yc (Yc msg))
    (cl:cons ':W (W msg))
    (cl:cons ':H (H msg))
    (cl:cons ':Theta (Theta msg))
))
