; Auto-generated. Do not edit!


(cl:in-package drone_controller-srv)


;//! \htmlinclude controller-request.msg.html

(cl:defclass <controller-request> (roslisp-msg-protocol:ros-message)
  ((activate
    :reader activate
    :initarg :activate
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass controller-request (<controller-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <controller-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'controller-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name drone_controller-srv:<controller-request> is deprecated: use drone_controller-srv:controller-request instead.")))

(cl:ensure-generic-function 'activate-val :lambda-list '(m))
(cl:defmethod activate-val ((m <controller-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader drone_controller-srv:activate-val is deprecated.  Use drone_controller-srv:activate instead.")
  (activate m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <controller-request>) ostream)
  "Serializes a message object of type '<controller-request>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'activate) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <controller-request>) istream)
  "Deserializes a message object of type '<controller-request>"
    (cl:setf (cl:slot-value msg 'activate) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<controller-request>)))
  "Returns string type for a service object of type '<controller-request>"
  "drone_controller/controllerRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'controller-request)))
  "Returns string type for a service object of type 'controller-request"
  "drone_controller/controllerRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<controller-request>)))
  "Returns md5sum for a message object of type '<controller-request>"
  "28dadd83d564c0f1c7317577c2a315b5")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'controller-request)))
  "Returns md5sum for a message object of type 'controller-request"
  "28dadd83d564c0f1c7317577c2a315b5")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<controller-request>)))
  "Returns full string definition for message of type '<controller-request>"
  (cl:format cl:nil "bool activate  # Whether to activate or deactivate the controller~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'controller-request)))
  "Returns full string definition for message of type 'controller-request"
  (cl:format cl:nil "bool activate  # Whether to activate or deactivate the controller~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <controller-request>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <controller-request>))
  "Converts a ROS message object to a list"
  (cl:list 'controller-request
    (cl:cons ':activate (activate msg))
))
;//! \htmlinclude controller-response.msg.html

(cl:defclass <controller-response> (roslisp-msg-protocol:ros-message)
  ((success
    :reader success
    :initarg :success
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass controller-response (<controller-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <controller-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'controller-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name drone_controller-srv:<controller-response> is deprecated: use drone_controller-srv:controller-response instead.")))

(cl:ensure-generic-function 'success-val :lambda-list '(m))
(cl:defmethod success-val ((m <controller-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader drone_controller-srv:success-val is deprecated.  Use drone_controller-srv:success instead.")
  (success m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <controller-response>) ostream)
  "Serializes a message object of type '<controller-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'success) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <controller-response>) istream)
  "Deserializes a message object of type '<controller-response>"
    (cl:setf (cl:slot-value msg 'success) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<controller-response>)))
  "Returns string type for a service object of type '<controller-response>"
  "drone_controller/controllerResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'controller-response)))
  "Returns string type for a service object of type 'controller-response"
  "drone_controller/controllerResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<controller-response>)))
  "Returns md5sum for a message object of type '<controller-response>"
  "28dadd83d564c0f1c7317577c2a315b5")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'controller-response)))
  "Returns md5sum for a message object of type 'controller-response"
  "28dadd83d564c0f1c7317577c2a315b5")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<controller-response>)))
  "Returns full string definition for message of type '<controller-response>"
  (cl:format cl:nil "bool success  # Indicate if the operation was successful~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'controller-response)))
  "Returns full string definition for message of type 'controller-response"
  (cl:format cl:nil "bool success  # Indicate if the operation was successful~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <controller-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <controller-response>))
  "Converts a ROS message object to a list"
  (cl:list 'controller-response
    (cl:cons ':success (success msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'controller)))
  'controller-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'controller)))
  'controller-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'controller)))
  "Returns string type for a service object of type '<controller>"
  "drone_controller/controller")