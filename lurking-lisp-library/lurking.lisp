(defmacro -= (x y)
  `(incf ,x (- ,y)))
(defmacro *= (x y)
  `(setf ,x (* ,x ,y)))
