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

(defun sum-n (n lst)
  (cond ((or (null lst) (= n 0)) 0)
        (T (+ (car lst) (sum-n (- n 1) (cdr lst))))))

(defun sum-nmd (n m d lst)
  (cond ((> n m) 0)
        (T (+ (nth n lst) (sum-nmd n (- m d) d (nthcdr d lst))))))

(defun last-odd-internal (lst cur-odd)
  (cond ((null lst) cur-odd)
        (T (cond ((oddp (car lst)) (last-odd-internal (cdr lst) (car lst)))
                 (T (last-odd-internal (cdr lst) cur-odd))))))
(defun last-odd (lst)
  (last-odd-internal lst nil))

(defun cons-square (lst)
  (and lst (cons ((lambda (x) (* x x)) (car lst))
                 (con-square (cdr lst)))))


(defun select-odd (lst)
  (mapcan #'(lambda (x) (if (oddp x) (list x))) lst))
(defun select-even (lst)
  (mapcan #'(lambda (x) (if (evenp x) (list x))) lst))

(defun sum-all-odd (lst)
  (apply #'+ (select-odd lst)))
(defun sum-all-even (lst)
  (apply #'+ (select-even lst)))


(setf people (list
               (list (cons 'fio "Ivanov Ivan Ivanovich")
                (cons 'salary 1000)
                (cons 'age 18)
                (cons 'category "programmer"))
               (list (cons 'fio "Petrov Ivan Ivanovich")
                (cons 'salary 2000)
                (cons 'age 28)
                (cons 'category "builder"))
               (list (cons 'fio "Petrov Petr Petrovich")
                (cons 'salary 3000)
                (cons 'age 32)
                (cons 'category "football manager"))
               ))

(defun salary-wrapper (salary-func man) 
  (let ((salary-item (assoc 'salary man)))
    (setf (cdr salary-item) (funcall salary-func (cdr salary-item)))))

(defun change-salaries (cond-func change-func lst)
  (mapcar #'(lambda (man) 
              (cond ((funcall cond-func man) (salary-wrapper change-func man))
                    (T man)))
          lst))

(change-salaries #'(lambda (man) (equal (cdr (assoc 'category man)) "programmer"))
                 #'(lambda (salary) (* salary 99)) 
                 people)

(defun count-salaries (people)
  (reduce #'(lambda (acc man)
              (+ acc (cdr (assoc 'salary man))))
          (cons 0 people)))
