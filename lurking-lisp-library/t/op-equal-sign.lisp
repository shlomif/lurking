
;;; The following lines added by ql:add-to-init-file:
#-quicklisp
(let ((quicklisp-init (merge-pathnames "quicklisp/setup.lisp"
                                       (user-homedir-pathname))))
  (when (probe-file quicklisp-init)
    (load quicklisp-init)))

(ql:quickload "testbild")

(use-package 'testbild)
(load "lurking.lisp")

(let ((producer (make-instance 'tap-producer)))
  (init-test producer)
  (emit-plan producer :plan-argument 1) ; simple plan, three tests planned
  ; TEST
  (let ((result 28))
    (-= result 4)
    (emit-result producer :success (= result 24) :description "Test -="))
  (finalize-test producer))
