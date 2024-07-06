
(cl:in-package :asdf)

(defsystem "mavros_off_board-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "Corners" :depends-on ("_package_Corners"))
    (:file "_package_Corners" :depends-on ("_package"))
  ))