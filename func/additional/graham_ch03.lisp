(defun my-union-internal(src dest)
  (if (null src)
  dest
  (let ((head (car src))
        (tail (cdr src)))
    (if (not (member head dest))
      (setf dest (cons head dest)))
    (my-union-internal tail dest))))
(defun my-union (s1 s2)
  (reverse (my-union-internal s2 (reverse s1))))


(defun internal-pos+(lst index acc)
  (if (null lst) 
    acc
    (let ((head (car lst)))
      (internal-pos+ (cdr lst) (+ index 1) (cons (+ head index) acc)))))
(defun pos+ (lst) 
  (reverse (internal-pos+ lst 0 Nil)))

(defun pos+-mapcar(lst)
  (let ((cnt 1))
    (mapcar #'(lambda (x) (+ x (setf cnt (+ cnt 1)))) lst)))


(defun internal-occurrences (lst kv)
  (if (null lst)
    kv
    (let ((pair (assoc (car lst) kv)))
      (if pair 
        (setf (cdr pair) (+ (cdr pair) 1))
        (setf kv (cons (cons (car lst) 1) kv)))
        ;(format t "~A~%" kv)
    (internal-occurrences (cdr lst) kv))))
(defun occurrences(lst)
  (sort (internal-occurrences lst nil) #'(lambda(a b) (< (car a) (car b)))))

