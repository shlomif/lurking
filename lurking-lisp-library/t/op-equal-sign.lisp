(load "quicklisp.lisp")
(ql:quickload "testbild")

(load "lurking.lisp")
(let ((producer (make-instance 'tap-producer)))
  (init-test producer)
  (emit-plan producer :plan-argument 1) ; simple plan, three tests planned
  ; TEST
  (let ((result 28))
    (-= result 4)
    (emit-result producer :success (= result 24) :description "Test -="))
  (finalize-test producer))
