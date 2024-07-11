
(cl:in-package :asdf)

(defsystem "mavros_off_board-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "Corners" :depends-on ("_package_Corners"))
    (:file "_package_Corners" :depends-on ("_package"))
    (:file "Marker" :depends-on ("_package_Marker"))
    (:file "_package_Marker" :depends-on ("_package"))
    (:file "States" :depends-on ("_package_States"))
    (:file "_package_States" :depends-on ("_package"))
  ))