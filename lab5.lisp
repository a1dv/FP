(defclass line ()
 ((start :initarg :start :accessor line-start)
  (end   :initarg :end   :accessor line-end)))


(defclass polar ()
 ((radius :initarg :radius :accessor radius) 	; длина >=0
  (angle  :initarg :angle  :accessor angle)))	; угол (-π;π]

 (setq lin (make-instance 'line
             :start (make-instance 'polar :radius 5 :angle (/ pi 6))
             :end (make-instance 'polar :radius 6 :angle (/ pi 3))))

(defmethod print-object ((lin line) stream)
  (format stream "[ОТРЕЗОК ~s ~s]"
        (line-start lin) (line-end lin)))

(defmethod print-object ((p polar) stream)
  (format stream "[POLAR radius ~d angle ~d]"
          (radius p) (angle p)))

(defmethod cart-x ((p polar))
    (* (radius p) (cos (angle p))))

(defmethod cart-y ((p polar))
    (* (radius p) (sin (angle p))))

(defmethod line-length ((lin line))

            (values (sqrt (+ (*  (- (cart-x  (line-end lin)) (cart-x  (line-start lin))) (- (cart-x  (line-end lin)) (cart-x  (line-start lin)))) (*  (- (cart-y  (line-end lin)) (cart-y  (line-start lin))) (- (cart-y  (line-end lin)) (cart-y  (line-start lin)))))))
)
