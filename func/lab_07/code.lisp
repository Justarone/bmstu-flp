(defun polyndromp (lst)
  (equal lst (reverse lst)))

(defun set-equal (lst1 lst2)
  (and (subsetp lst2 lst1) (subsetp lst1 lst2)))

(defun get-cptl (cntry cntry-cptl)
  (let ((pair (assoc cntry cntry-cptl)))
    (and pair (cdr pair))))

(defun get-cntry (cptl cntry-cptl)
  (let ((pair (rassoc cptl cntry-cptl)))
    (and pair (car pair))))

(defun nswap-first-last (lst)
  (let ((el1 (car lst))
        (last-el (last lst)))
    (setf (car lst) (car last-el))
    (setf (car last-el) el1)
    lst))

(defun swap-first-last (lst)
  (let ((el1 (car lst))
        (last-el (car (last lst))))
    (reverse (cons el1
                   (cdr
                     (reverse
                       (cons last-el (cdr lst))))))))

(defun nswap-two-ellement (n1 n2 lst)
  (let ((len (length lst)))
    (and (< n1 len) (< n2 len)
         (let ((el1 (nth n1 lst))
               (el2 (nth n2 lst)))
           (setf (nth n1 lst) el2)
           (setf (nth n2 lst) el1)
           lst))))

(defun swap-two-ellement (n1 n2 lst)
  (let ((len (length lst))
        (lst-copy (copy-list lst)))
    (and (< n1 len) (< n2 len)
         (let ((el1 (nth n1 lst))
               (el2 (nth n2 lst)))
           (setf (nth n1 lst-copy) el2)
           (setf (nth n2 lst-copy) el1)
           lst-copy))))

(defun swap-to-left (lst)
  (and lst
       (let ((tail (cdr lst))
             (head (car lst)))
         (reverse (cons head (reverse tail))))))

(defun swap-to-right (lst)
  (and lst
       (let ((last-el (car (last lst))))
         (reverse (cdr (reverse (cons last-el lst)))))))
