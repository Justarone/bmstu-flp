(defconstant +dices-amount+ 2)
(defconstant +max-score+ 6)
(defconstant +magic-scores+ '(7 11))
(defconstant +rethrow-combinations+ '((1 1) (6 6)))

(defun iter-times-internal (times fn acc)
  (if (<= times 0)
    acc
    (iter-times-internal (- times 1) fn (cons (funcall fn times) acc))))
(defun iter-times (times fn)
  (iter-times-internal times fn nil))

(defun throw-dices (times)
  (iter-times times #'(lambda (_x) (+ (random +max-score+) 1))))

(defun score-with-rules (i dices)
  (let ((sum (reduce #'+ dices)))
    (format T "Player ~a has ~a!~%" i dices)
    (cond ((member dices +rethrow-combinations+ :test #'equal)
           (score-with-rules i (throw-dices +dices-amount+)))
          ((member sum +magic-scores+) (cons i (+ (* +dices-amount+ +max-score+) 1)))
          (T (cons i sum)))))

(defun collect-throws (amount)
  (mapcar #'(lambda (x) (score-with-rules (car x) (cdr x)))
          (iter-times amount #'(lambda (i) (cons i (throw-dices +dices-amount+))))))

(defun is-next-better (prev next)
  (or (< (cdr prev) (cdr next))))

(defun play (players_amount)
  (let ((winner (reduce 
                  #'(lambda (cur next) (if (is-next-better cur next) next cur)) 
                  (collect-throws players_amount))))
    (format T "Winner: ~a" (car winner))))
