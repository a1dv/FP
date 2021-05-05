(defun summ(x)
	(if(< x 10) x (+ (mod x 10) (summ (floor x 10)))))
