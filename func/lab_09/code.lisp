(defun list-between-only (from to lst)
  (mapcan #'(lambda (el)
              (and (< el to) (> el from) (list el)))
          lst))


(defun list-btwn-only-internal (from to lst acc)
  (cond ((null lst) acc)
        (T (let ((head (car lst)))
             (cond ((and (< head to) (> head from))
                    (list-btwn-only-internal from to (cdr lst) (cons head acc)))
                   (T (list-btwn-only-internal from to (cdr lst) acc)))))))
(defun list-btwn-only-rec (from to lst)
  (reverse (list-btwn-only-internal from to lst nil)))

(defun square-list (lst)
  (cond ((null lst) lst)
        ((atom lst) (* lst lst))
        (T (cons (square-list (car lst))
                 (square-list (cdr lst))))))

; если убрать append будет эффективнее
(defun list-mul (lst1 lst2)
  (mapcan #'(lambda (outer-el)
              (mapcar #'(lambda (inner-el)
                          (cons outer-el inner-el))
                      lst2))
          lst1))

(defun list-mul-internal (cur-lst1 src-lst1 lst2 acc)
  (cond ((null lst2) acc)
        ((null cur-lst1) (list-mul-internal src-lst1 src-lst1 (cdr lst2) acc))
        (T (list-mul-internal (cdr cur-lst1) src-lst1 lst2 (cons (cons (car cur-lst1) (car lst2)) acc)))))
(defun list-mul-rec (lst1 lst2)
  (and lst1 lst2 (reverse (list-mul-internal lst1 lst1 lst2 nil))))


; пример работы reduce с печатью того, как и с какими аргументами вызывается переданная функция
;(reduce #'(lambda (acc x) (or (format T "acc: ~a; x: ~a~%" acc x) x)) '(1 2 3))

(defun my-reduce-internal (func lst acc)
  (cond ((null lst) acc)
        (T (my-reduce-internal func (cdr lst) (funcall func acc (car lst))))))
(defun my-reduce (func lst)
  (cond ((null lst) (funcall func))
        (T (my-reduce-internal func (cdr lst) (car lst)))))

(defun sum-lens (list-of-lists)
  (reduce #'(lambda (acc lst) (+ acc (length lst)))
          (cons 0 list-of-lists)))

(defun sum-lens-rec-internal (lol acc)
  (cond ((null lol) acc)
        (T (sum-lens-rec-internal (cdr lol) (+ acc (length (car lol)))))))
(defun sum-lens-rec (list-of-lists)
  (and (listp list-of-lists) (sum-lens-rec-internal list-of-lists 0)))
