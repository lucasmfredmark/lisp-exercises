;;
;; Prelude
;;

;; Lambdas are defined by the syntax (lambda (arguments) body)
(lambda (a) (+ a 2))

;; Lambdas should be called with the funcall function
(funcall (lambda (a) (+ a 2)) 4) ;; 6

;;
;; Exercises
;;

;; Exercise 1
;; Call this lambda in the same line!
(funcall (lambda (a b) (+ a b)) 1 5)

;; Exercise 2
;; Write a function that returns the lambda below
(setf l (lambda (a) (+ a 3)))

;; Exercise 3
;; Write a function that returns a lamdda that is run twice on some input.
;; If you had a function in Java (f) this would be written: f(f(4))
(defun lambdaTwice (inputLambda) (funcall inputLambda (funcall inputLambda 2)))
(write (lambdaTwice (lambda (a) (+ a 2))))
