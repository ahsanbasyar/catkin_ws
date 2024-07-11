
(cl:in-package :asdf)

(defsystem "drone_controller-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "controller" :depends-on ("_package_controller"))
    (:file "_package_controller" :depends-on ("_package"))
  ))