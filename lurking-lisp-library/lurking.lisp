(defmacro op2assign (op)
    (let ((op= (intern (concatenate 'string (string op) "="))))
        `(defmacro ,op= (var . values)
            `(setf ,var (,',op ,var ,@values)))))

(op2assign -)
(op2assign *)

;;;(defmacro -= (x y)
;;;  `(incf ,x (- ,y)))
;;;(defmacro *= (x y)
;;;  `(setf ,x (* ,x ,y)))

(defun ~ (&rest lst)
  (apply 'concatenate 'string lst))
