(defun do-swp(ans A n m i j x)
    (if (< i n)
      (if (< j m)
        (progn
          (setf (aref ans i x) (aref A i j))
          (do-swp ans A n m i (+ 1 j) (- x 1)))
        (do-swp ans A n m (+ 1 i) 0 (- m 1))
        )
      t))


(defun run (A)
    (let* ((n (car (array-dimensions A)))
        (m (car (cdr (array-dimensions A))))
        (ans (make-array (list n m))))
        (do-swp ans A n m 0 0 (- m 1))
        ans))
