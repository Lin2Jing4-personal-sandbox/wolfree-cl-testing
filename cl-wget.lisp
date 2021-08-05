(uiop:define-package
    cl-wget
    (:mix
     drakma
     lquery
     puri
     trivial-download)
  (:export wget))

(in-package cl-wget)

(defun wget (uris &key --page-requisites --quiet)
  (map
   (type-of uris)
   (lambda (uri)
     (if
      --page-requisites
      (wget
       (map
        'vector
        (lambda (u) (render-uri (merge-uris u uri) nil))
        (let ((dom ($ (initialize (http-request uri)))))
          (concatenate
           'vector
           (vector uri)
           ($ dom "[src]" (attr :src))
           ($ dom "[href]" (attr :href)))))
       :--quiet --quiet)
      (if
       (uiop:file-pathname-p uri)
       (download uri uri :quiet (or --quiet (terpri)))
       uri)))
   uris))
