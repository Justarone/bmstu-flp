(defun extender (from to)
  #'(lambda (elem res) (cond ((and (numberp elem) (< elem to) (> elem from) (not (member elem res))) (cons elem res))
        (T res))))

(defun union-rec-int (compl-list res extender)
  (cond ((null compl-list) res)
        (T (let ((head (car compl-list)))
             (cond ((atom head) (union-rec-int (cdr compl-list) (funcall extender head res) extender))
                   (T (union-rec-int (cdr compl-list) 
                                     (funcall extender head (union-rec-int (car compl-list) res extender)) 
                                     extender)))))))

(defun union-rec (compl-list from to)
  (union-rec-int compl-list nil (extender from to)))

(union-rec '(1 2 (3 4 (5 6 (7 a) 8) 99) 4) 1 10)

(defun union-func-int (compl-list res extender)
  (reduce #'(lambda (acc elem)
              (cond ((atom elem) (funcall extender elem acc))
                   (T (union-func-int elem acc extender))))
          compl-list :initial-value res))

(defun union-func (compl-list from to)
  (union-func-int compl-list nil (extender from to)))

(union-func '(1 2 (3 4 (5 6 (7 a) 8) 99) 4) 1 10)
