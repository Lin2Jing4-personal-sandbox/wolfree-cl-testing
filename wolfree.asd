(defsystem :wolfree
  :depends-on (:cl-css
               :cl-who
               :cl-interpol
               :hunchentoot
               :parenscript)
  :components ((:file :package)
               (:file :wolfree)))
