(defun rec-add-internal (lst acc)
  (cond ((null lst) acc)
        (T (rec-add-internal (cdr lst) (+ acc (car lst))))))
(defun rec-add (lst)
  (rec-add-internal lst 0))

(defun rec-nth (n lst)
  (and lst (cond ((zerop n) (car lst))
                 (T (rec-nth (- n 1) (cdr lst))))))

(defun alloddr (lst)
  (or (null lst)
      (and (oddp (car lst))
           (alloddr (cdr lst)))))

(defun last-rec (lst)
  (cond ((null (cdr lst)) (car lst))
        (T (last-rec (cdr lst)))))

(defun last-odd-internal (lst cur-odd)
  (cond ((null lst) cur-odd)
        (T (cond ((oddp (car lst)) (last-odd-internal (cdr lst) (car lst)))
                 (T (last-odd-internal (cdr lst) cur-odd))))))
(defun last-odd (lst)
  (last-odd-internal lst nil))

(defun cons-square (lst)
  (and lst (cons ((lambda (x) (* x x)) (car lst))
                 (con-square (cdr lst)))))


; reverses the list
(defun my-filter-reducer (filter reducer lst init-el)
    (reduce #'(lambda (acc x)
                (cond ((funcall filter x) (funcall reducer acc x))
                      (T acc)))
            (cons init-el lst)))

(defun my-filter (func lst)
  (reverse (my-filter-reducer func #'(lambda (acc x) (cons x acc)) lst nil)))

(defun select-odd (lst)
  (my-filter #'oddp lst))
(defun select-even (lst)
  (my-filter #'evenp lst))

(defun sum-all-odd (lst)
  (my-filter-reducer #'oddp #'+ lst 0))
(defun sum-all-even (lst)
  (my-filter-reducer #'evenp #'+ lst 0))
