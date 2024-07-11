
(cl:in-package :asdf)

(defsystem "drone_controller-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "Error" :depends-on ("_package_Error"))
    (:file "_package_Error" :depends-on ("_package"))
    (:file "Information" :depends-on ("_package_Information"))
    (:file "_package_Information" :depends-on ("_package"))
  ))