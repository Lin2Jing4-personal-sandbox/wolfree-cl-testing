(defsystem wolfree
  :depends-on (parenscript
               hunchentoot
               cl-interpol
               cl-wget
               cl-css
               cl-who)
  :components ((:file wolfree)))
