; Auto-generated. Do not edit!


(cl:in-package mavros_off_board-msg)


;//! \htmlinclude Corners.msg.html

(cl:defclass <Corners> (roslisp-msg-protocol:ros-message)
  ((TopLeftX
    :reader TopLeftX
    :initarg :TopLeftX
    :type cl:float
    :initform 0.0)
   (TopLeftY
    :reader TopLeftY
    :initarg :TopLeftY
    :type cl:float
    :initform 0.0)
   (TopRightX
    :reader TopRightX
    :initarg :TopRightX
    :type cl:float
    :initform 0.0)
   (TopRightY
    :reader TopRightY
    :initarg :TopRightY
    :type cl:float
    :initform 0.0)
   (BottomLeftX
    :reader BottomLeftX
    :initarg :BottomLeftX
    :type cl:float
    :initform 0.0)
   (BottomLeftY
    :reader BottomLeftY
    :initarg :BottomLeftY
    :type cl:float
    :initform 0.0)
   (BottomRightX
    :reader BottomRightX
    :initarg :BottomRightX
    :type cl:float
    :initform 0.0)
   (BottomRightY
    :reader BottomRightY
    :initarg :BottomRightY
    :type cl:float
    :initform 0.0)
   (CenterX
    :reader CenterX
    :initarg :CenterX
    :type cl:float
    :initform 0.0)
   (CenterY
    :reader CenterY
    :initarg :CenterY
    :type cl:float
    :initform 0.0))
)

(cl:defclass Corners (<Corners>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Corners>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Corners)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name mavros_off_board-msg:<Corners> is deprecated: use mavros_off_board-msg:Corners instead.")))

(cl:ensure-generic-function 'TopLeftX-val :lambda-list '(m))
(cl:defmethod TopLeftX-val ((m <Corners>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mavros_off_board-msg:TopLeftX-val is deprecated.  Use mavros_off_board-msg:TopLeftX instead.")
  (TopLeftX m))

(cl:ensure-generic-function 'TopLeftY-val :lambda-list '(m))
(cl:defmethod TopLeftY-val ((m <Corners>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mavros_off_board-msg:TopLeftY-val is deprecated.  Use mavros_off_board-msg:TopLeftY instead.")
  (TopLeftY m))

(cl:ensure-generic-function 'TopRightX-val :lambda-list '(m))
(cl:defmethod TopRightX-val ((m <Corners>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mavros_off_board-msg:TopRightX-val is deprecated.  Use mavros_off_board-msg:TopRightX instead.")
  (TopRightX m))

(cl:ensure-generic-function 'TopRightY-val :lambda-list '(m))
(cl:defmethod TopRightY-val ((m <Corners>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mavros_off_board-msg:TopRightY-val is deprecated.  Use mavros_off_board-msg:TopRightY instead.")
  (TopRightY m))

(cl:ensure-generic-function 'BottomLeftX-val :lambda-list '(m))
(cl:defmethod BottomLeftX-val ((m <Corners>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mavros_off_board-msg:BottomLeftX-val is deprecated.  Use mavros_off_board-msg:BottomLeftX instead.")
  (BottomLeftX m))

(cl:ensure-generic-function 'BottomLeftY-val :lambda-list '(m))
(cl:defmethod BottomLeftY-val ((m <Corners>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mavros_off_board-msg:BottomLeftY-val is deprecated.  Use mavros_off_board-msg:BottomLeftY instead.")
  (BottomLeftY m))

(cl:ensure-generic-function 'BottomRightX-val :lambda-list '(m))
(cl:defmethod BottomRightX-val ((m <Corners>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mavros_off_board-msg:BottomRightX-val is deprecated.  Use mavros_off_board-msg:BottomRightX instead.")
  (BottomRightX m))

(cl:ensure-generic-function 'BottomRightY-val :lambda-list '(m))
(cl:defmethod BottomRightY-val ((m <Corners>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mavros_off_board-msg:BottomRightY-val is deprecated.  Use mavros_off_board-msg:BottomRightY instead.")
  (BottomRightY m))

(cl:ensure-generic-function 'CenterX-val :lambda-list '(m))
(cl:defmethod CenterX-val ((m <Corners>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mavros_off_board-msg:CenterX-val is deprecated.  Use mavros_off_board-msg:CenterX instead.")
  (CenterX m))

(cl:ensure-generic-function 'CenterY-val :lambda-list '(m))
(cl:defmethod CenterY-val ((m <Corners>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mavros_off_board-msg:CenterY-val is deprecated.  Use mavros_off_board-msg:CenterY instead.")
  (CenterY m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Corners>) ostream)
  "Serializes a message object of type '<Corners>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'TopLeftX))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'TopLeftY))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'TopRightX))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'TopRightY))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'BottomLeftX))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'BottomLeftY))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'BottomRightX))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'BottomRightY))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'CenterX))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'CenterY))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Corners>) istream)
  "Deserializes a message object of type '<Corners>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'TopLeftX) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'TopLeftY) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'TopRightX) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'TopRightY) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'BottomLeftX) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'BottomLeftY) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'BottomRightX) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'BottomRightY) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'CenterX) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'CenterY) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Corners>)))
  "Returns string type for a message object of type '<Corners>"
  "mavros_off_board/Corners")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Corners)))
  "Returns string type for a message object of type 'Corners"
  "mavros_off_board/Corners")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Corners>)))
  "Returns md5sum for a message object of type '<Corners>"
  "95a9b5efd4b7dca1a4966428500c815c")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Corners)))
  "Returns md5sum for a message object of type 'Corners"
  "95a9b5efd4b7dca1a4966428500c815c")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Corners>)))
  "Returns full string definition for message of type '<Corners>"
  (cl:format cl:nil "float32 TopLeftX~%float32 TopLeftY~%float32 TopRightX~%float32 TopRightY~%float32 BottomLeftX~%float32 BottomLeftY~%float32 BottomRightX~%float32 BottomRightY~%float32 CenterX~%float32 CenterY~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Corners)))
  "Returns full string definition for message of type 'Corners"
  (cl:format cl:nil "float32 TopLeftX~%float32 TopLeftY~%float32 TopRightX~%float32 TopRightY~%float32 BottomLeftX~%float32 BottomLeftY~%float32 BottomRightX~%float32 BottomRightY~%float32 CenterX~%float32 CenterY~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Corners>))
  (cl:+ 0
     4
     4
     4
     4
     4
     4
     4
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Corners>))
  "Converts a ROS message object to a list"
  (cl:list 'Corners
    (cl:cons ':TopLeftX (TopLeftX msg))
    (cl:cons ':TopLeftY (TopLeftY msg))
    (cl:cons ':TopRightX (TopRightX msg))
    (cl:cons ':TopRightY (TopRightY msg))
    (cl:cons ':BottomLeftX (BottomLeftX msg))
    (cl:cons ':BottomLeftY (BottomLeftY msg))
    (cl:cons ':BottomRightX (BottomRightX msg))
    (cl:cons ':BottomRightY (BottomRightY msg))
    (cl:cons ':CenterX (CenterX msg))
    (cl:cons ':CenterY (CenterY msg))
))
