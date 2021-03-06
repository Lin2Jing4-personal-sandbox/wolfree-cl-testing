"
    Wolfree gives everyone free access to Wolfram|Alpha Pro.
    Copyright (C) 2021  Lin2Jing4

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU Affero General Public License as published
    by the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU Affero General Public License for more details.

    You should have received a copy of the GNU Affero General Public License
    along with this program.  If not, see <https://www.gnu.org/licenses/>.
"

(uiop:define-package
    wolfree
    (:mix
     parenscript
     hunchentoot
     cl-interpol
     cl-wget
     cl-css
     cl-who))

(in-package wolfree)

(named-readtables:in-readtable :interpol-syntax)

(eval-when (:compile-toplevel :load-toplevel :execute)
  (setq *attribute-quote-char* #\")
  (setq *js-inline-string-delimiter* #\')
  (setf (html-mode) :html5))

(unless (probe-file "https://www.wolframalpha.com/input/index.html")
  (wget
   '("https://www.wolframalpha.com/input/index.html")
   :--page-requisites t))

(ignore-errors
 (start
  (make-instance
   'easy-acceptor
   :port 8080
   :document-root "https://www.wolframalpha.com/")))

(with-open-file (*standard-output*
                 "https://www.wolframalpha.com/index.html"
                 :direction :output
                 :if-exists :supersede)
  (with-html-output (*standard-output*
                     nil
                     :prologue t
                     :indent t)
    (:html
     :lang "en"
     (:head
      (:title
       "WolfreeAlpha: FREE Wolfram|Alpha Step-by-Step Solution")
      (:meta
       :charset "utf-8")
      (:meta
       :name "viewport"
       :content "width=device-width,initial-scale=1")
      (:meta
       :name "description"
       :content "How to show steps for FREE in Wolfram|Alpha? Get Wolfram Alpha Pro Features for Free. Use step-by-step calculators for chemistry, calculus, algebra, trigonometry, equation solving, basic math, and more. Gain more understanding of your homework with steps and hints guiding you from problems to answers! Wolfram|Alpha Pro Step-by-step solutions not only give you the answers you're looking for but also help you learn how to solve problems."))
     (:body
      (:iframe
       :id "iframe"
       :src "input/index.html"
       :style (inline-css
               '(:height "100%"
                 :width "100%"
                 :border 0
                 :position "absolute"
                 :inset 0)))
      (:script
       (str
        (ps
          (defun $ (selector)
            ((@ iframe content-document query-selector) selector))
          (defmacro wait-until-exist (selector &body body)
            (with-ps-gensyms (function-name)
              `(progn
                 (defun ,function-name ()
                   (if
                    ($ ,selector)
                    (progn ,@body)
                    (set-timeout ,function-name 999)))
                 (,function-name))))
          (defun parse (json)
            (wait-until-exist
             "._2oVR5"
             (setf
              (inner-html ($ "._2oVR5"))
              (who-ps-html (:section :class "_2GT4c")))
             (defmacro attach (&rest html)
               `((@ ($ "._2GT4c") "insertAdjacentHTML")
                 :BeforeEnd
                 (who-ps-html ,@html)))
             ((@ json queryresult pods for-each)
              (lambda (pod)
                (attach
                 (:header
                  :class "_124pH"
                  (:h2 :class "pxQx2" (@ pod title))))
                (when (@ pod states)
                  ((@ pod states for-each)
                   (lambda (state)
                     (when (@ state states)
                       (attach
                        (:select
                         :style (lisp
                                 (inline-css
                                  '(:margin "1em"
                                    :color "orangered"
                                    :background "white"
                                    :border-radius "4px"
                                    :border "thin solid darkorange")))
                         :onchange (lisp
                                    (ps
                                      ((@ parent submit)
                                       ((@ this value replace-all) #\Space :+))
                                      ((@
                                        this
                                        previous-element-sibling
                                        class-list
                                        add)
                                       "_21h4q"
                                       "_1GgzZ"
                                       "_3f1Mz")))
                         (:option (@ state value))
                         (chain
                          ((@ state states map)
                           (lambda (state)
                             (who-ps-html (:option (@ state name)))))
                          (join))))))))
                ((@ pod subpods for-each)
                 (lambda (subpod)
                   (attach
                    (:div
                     :class "Y4YRs"
                     (:div
                      :class "_8J16o"
                      (:img :src (chain subpod img src))
                      (:details
                       (:summary :class "_3lk7l")
                       (:pre (@ subpod plaintext))))))))))))
          (fetch
           (setf
            cors-proxy
            (+
             "https://lin2jing4-cors-"
             (new ((@ (*date) get-day)))
             ".herokuapp.com/")))
          (defun submit (podstate)
            (setf
             appid
             '("26LQEH-YT3P6T3YY9"
               "K49A6Y-4REWHGRWW6"
               "J77PG9-UY8A3WQ2PG"
               "P3WLYY-2G9GA6RQGE"
               "P7JH3K-27RHWR53JQ"
               "L349HV-29P5JV8Y7J"
               "77PP56-XLQK5GKUAA"
               "59EQ3X-HE26TY2W64"
               "8Q68TL-QA8W9GEXAA"
               "KQRKKJ-8WHPY395HA"
               "AAT4HU-Q3RETTGY93"
               "7JKH84-T648HW2UV9"
               "WYEQU3-2T55JP3WUG"
               "T2XT8W-57PJW3L433"
               "2557YT-52JEY65G9K"
               "UVPKUJ-X9Q365R7E3"
               "W85VHP-E6WH3U78EE"
               "W33433-AKRV98E5AT"
               "3A3P8J-XA4UTGKAH5"
               "QGK5UA-HGUK7AP5LY"
               "8EL8GA-7W6EVYTQ5X"
               "W4TUXQ-GA2H8KUULA"
               "UGHH75-YPX2RVU4E4"))
            (chain
             (fetch
              (+
               cors-proxy
               :api.wolframalpha.com/v2/query?
               :&output= :json
               :&podstate= :Step-by-step+solution
               :&podstate= :Step-by-step
               :&podstate= :Show+all+steps
               :&scantimeout= 30
               :&podtimeout= 30
               :&formattimeout= 30
               :&parsetimeout= 30
               :&totaltimeout= 30
               :&reinterpret= true
               :&podstate= podstate
               :&appid= (@ appid (rem (new *date) (@ appid length)))
               :&input= (chain
                         '("Power"
                           "Sqrt"
                           "Cbrt"
                           "Surd"
                           "Exp"
                           "Log"
                           "Log10"
                           "Abs"
                           "D"
                           "Partial"
                           "Integrate"
                           "Sum"
                           "Product"
                           "Limit"
                           "UnitStep"
                           "DiracDelta"
                           "Piecewise"
                           "LaplaceTransform"
                           "InverseLaplaceTransform"
                           "FourierTransform"
                           "InverseFourierTransform"
                           "Sin"
                           "Cos"
                           "Tan"
                           "Sec"
                           "Csc"
                           "Cot"
                           "ArcSin"
                           "ArcCos"
                           "ArcTan"
                           "Sinh"
                           "Cosh"
                           "Tanh"
                           "Sech"
                           "Csch"
                           "Coth"
                           "ArcSinh"
                           "ArcCosh"
                           "ArcTanh"
                           "ArcSech"
                           "ArcCsch"
                           "ArcCoth")
                         (reduce
                          (lambda (input built-in-symbol)
                            ((@ input replace-all)
                             (+ built-in-symbol "%5B")
                             (+ #\Space built-in-symbol "%5B")))
                          (chain
                           (@ iframe content-window location search)
                           (replace (regex ".*i=") "")
                           (replace-all "%E2%85%87" :e))))))
             (then (lambda (response) (chain response (json))))
             (then (lambda (json) (parse json)))))
          (set-interval
           (lambda ()
             (setf (@ ($ :form) onsubmit) submit)
             (setf
              (inner-html ($ :li>button))
              (who-ps-html
               (:button
                :onclick (ps-inline
                             ((@ parent location replace)
                              "https://github.com/WolfreeAlpha"))
                :class "_10um4 VC3Co _34x1u"
                "Source")
               "Get FREE access to Wolfram|Alpha PRO."
               (:br)
               "Unlock step-by-step solution for everyone."))
             (setf (inner-html ($ :p)) "Report a problem to Wolfree ??")
             (setf
              (@ ($ "._28OPL") onclick)
              (lambda ()
                ((@ parent location replace)
                 "https://gitreports.com/issue/git-reports/wolfree"))))
           999)
          (wait-until-exist
           "._2oVR5 ._2cS1C"
           ((@ ($ "._2oVR5 ._2cS1C") remove))))))))))
