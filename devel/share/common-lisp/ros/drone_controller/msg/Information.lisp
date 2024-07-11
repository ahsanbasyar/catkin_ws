; Auto-generated. Do not edit!


(cl:in-package drone_controller-msg)


;//! \htmlinclude Information.msg.html

(cl:defclass <Information> (roslisp-msg-protocol:ros-message)
  ((information
    :reader information
    :initarg :information
    :type cl:string
    :initform ""))
)

(cl:defclass Information (<Information>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Information>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Information)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name drone_controller-msg:<Information> is deprecated: use drone_controller-msg:Information instead.")))

(cl:ensure-generic-function 'information-val :lambda-list '(m))
(cl:defmethod information-val ((m <Information>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader drone_controller-msg:information-val is deprecated.  Use drone_controller-msg:information instead.")
  (information m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Information>) ostream)
  "Serializes a message object of type '<Information>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'information))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'information))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Information>) istream)
  "Deserializes a message object of type '<Information>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'information) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'information) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Information>)))
  "Returns string type for a message object of type '<Information>"
  "drone_controller/Information")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Information)))
  "Returns string type for a message object of type 'Information"
  "drone_controller/Information")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Information>)))
  "Returns md5sum for a message object of type '<Information>"
  "8f643f4492d5df4a7264b4dfdbe3626f")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Information)))
  "Returns md5sum for a message object of type 'Information"
  "8f643f4492d5df4a7264b4dfdbe3626f")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Information>)))
  "Returns full string definition for message of type '<Information>"
  (cl:format cl:nil "string information~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Information)))
  "Returns full string definition for message of type 'Information"
  (cl:format cl:nil "string information~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Information>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'information))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Information>))
  "Converts a ROS message object to a list"
  (cl:list 'Information
    (cl:cons ':information (information msg))
))
