;;
;; Prelude
;;

;; Define a function 'f'
(defun f (a) (+ a a))

;; Call the function f
(f 10)

;; Truth is written as T
T

;; False is written as nil (the empty list)
nil

;; Equality is made like so
(equal 1 2) ;; nil = false

;; Lists are made like so
(list 1 2)

;; - or using cons:
(cons 1 (cons 2 nil))

;; Remember that if statements are made like so
;; if condition then else
(if (equal (list 1 2) (list 1 2)) T nil)

;;
;; Exercises
;;

;; Exercise 1
;; Implement the function 'adder' below so that it adds 2 to each element in
;; the list, puts it in a new list and returns that list
(defun adder (l) (if (equal l nil) nil (cons (+ (car l) 2) (adder (cdr l)))))
(write (adder (list 4 8 15 16 23 42))) ;; this should return (6 10 17 18 25 44)
(write-line"")

;; Exercise 2
;; Implement the 'prodder' function below so that it multiplies each element
;; in the list by 3, puts it in a new list and returns that list
(defun prodder (l) (if (equal l nil) nil (cons (* (car l) 3) (prodder (cdr l)))))
(write (prodder (list 4 8 15 16 23 42)))
(write-line"")

;; Exercise 3
;; Implement the 'minusser' function below that subtracts 5 from
;; each element in the list, puts it in a new list and returns that list
(defun minusser (l) (if (equal l nil) nil (cons (- (car l) 5) (minusser (cdr l)))))
(write (minusser (list 4 8 15 16 23 42)))
(write-line"")

;; Exercise 4
;; This must be possible to make simpler! Search your feelings. How could
;; you generalise the concept? What did you have to do each time in
;; the above assignments?
;; Hint: Your function needs to take two arguments: A function and a list
(defun myMap (l fn) (if (equal l nil) nil (cons (funcall fn (car l)) (myMap (cdr l) fn))))
(write (myMap (list 4 8 15 16 23 42) (lambda (item) (+ item 2)))) ;; adds 2 to each element in the list
(write-line"")
(write (myMap (list 4 8 15 16 23 42) (lambda (item) (* item 3)))) ;; multiplies each element in the list by 3
(write-line"")
(write (myMap (list 4 8 15 16 23 42) (lambda (item) (- item 5)))) ;; subtracts 5 from each element in the list
