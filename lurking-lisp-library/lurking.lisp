(defmacro op2assign (op)
    (let ((op= (intern (concatenate 'string (string op) "="))))
        `(defmacro ,op= (var . values)
            `(setf ,var (,',op ,var ,@values)))))

(op2assign +)
(op2assign -)
(op2assign *)

;;;(defmacro -= (x y)
;;;  `(incf ,x (- ,y)))
;;;(defmacro *= (x y)
;;;  `(setf ,x (* ,x ,y)))

(defun ~ (&rest lst)
  (apply 'concatenate 'string lst))

(op2assign ~)

;;; Taken from http://p-cos.blogspot.com/2007/02/what-is-point-of-macros.html
;;; Thanks!
(defmacro while (expression &body body)
  `(tagbody
     start (if (not ,expression) (go end))
           ,@body
           (go start)
     end))
