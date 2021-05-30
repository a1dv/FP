(defun adder(op li)
    (if (atom li) li
    	(if (> (length li) 1)
        	(format nil "~a ~a ~a"(form-to-infix (car li)) op (adder op (cdr li)))
    		(format nil "~a" (form-to-infix (car li)))))
)


(defun check (str)
    (let ((a (search "+ (-" str) )
            (b (search "- (-" str)))
            (if (equalp a NIL)
                (if (equalp b NIL)
                    (values str)
                    (check (replace str " +  " :start1 b :start2 0)))
                (check (replace str " -  " :start1 a :start2 0)))))


(defun form-to-infix(ex)
  (if (atom ex) ex
        (let ((op (car ex))
              (a1 (cadr ex))
              (a2 (cddr ex)))
              (if (> (length a2) 0)
                (check (string-downcase  (princ-to-string (list (form-to-infix a1) op (adder op a2)))))
                (if (eq op '/)
                	(string-downcase (princ-to-string (list '1 op (form-to-infix a1))))
                	(string-downcase (princ-to-string (list op (form-to-infix a1)))))))))
