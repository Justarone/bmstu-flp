(defun mult-all-numbers (mult lst)
  (mapcar #'(lambda (el) (* el mult)) lst))

(defun compl-mult-all-numbers (mult lst)
  (mapcar #'(lambda (el)
              (cond ((listp el) (compl-mult-all-numbers mult el))
                    (T (* el mult))))
          lst))

(defun get-n (n lst acc)
  (cond ((or (null lst) (<= n 0)) (reverse acc))
        (T (get-n (- n 1) (cdr lst) (cons (car lst) acc)))))

(defun select-between (from to lst)
  (sort (get-n (+ (- to from) 1) (nthcdr from lst) Nil) #'<))

(defun lst-minus-10 (lst)
  (mapcar #'(lambda (x) (- x 10)) lst))

(defun first-sublist (lst)
  (and lst (cond ((listp (car lst)) (car lst))
                 (T (first-sublist (cdr lst))))))

(defun count-all-in-list (lst)
  (reduce #'(lambda (acc el)
              (cond ((listp el) (+ acc (count-all-in-list el)))
                    ((numberp el) (+ acc el))
                    (T acc)))
          (cons 0 lst)))

;(count-all-in-list '(1 2 (3 4 (5 6 ("asdf" 7)))))
