
;;; The following lines added by ql:add-to-init-file:
#-quicklisp
(let ((quicklisp-init (merge-pathnames "quicklisp/setup.lisp"
                                       (user-homedir-pathname))))
  (when (probe-file quicklisp-init)
    (load quicklisp-init)))

(ql:quickload "testbild")

(use-package 'testbild)
(load "lurking.lisp")

(defun concat-uc (x y)
  (concatenate 'string x (string-upcase y)))

(let ((producer (make-instance 'tap-producer)))
  (init-test producer)
  (emit-plan producer :plan-argument 3) ; simple plan, three tests planned
  (let ((result 28))
    (-= result 4)
    ; TEST
    (emit-result producer :success (= result 24) :description "Test -=")
    (*= result 2)
    ; TEST
    (emit-result producer :success (= result 48) :description "Test *=")

    ; TEST
    (emit-result producer :success (equal (concat-uc "foo " "bar") "foo BAR")
                 :description "Testing concat-uc")

    )
  (finalize-test producer))
