(defun glue-together(A B)
(cond ((null (member A B)) (cons A B)) (t B)))

(defun map-set (func L)
(cond ((null L) nil)
(t (glue-together (funcall func (car L)) (map-set func (cdr L))))))
