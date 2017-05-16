;;
;; Preamble: Lisp prerequisits
;;

;; These two lines sets the number of binary digits used to represent a float
;; in Lisp. This is necessary because you'll be working with tiny numbers
;; TL;DR ignore these two lines
(setf (EXT:LONG-FLOAT-DIGITS) 35000)
(setf *read-default-float-format* 'long-float)

;; This method rounds a number to a certain precision
;; It takes two arguments: the number to round and the number of digits to
;; round in decimals
;;
;; Example: (roundToPrecision 10.0044 3) -> 10.004
(defun roundToPrecision (number precision)
  (let
    ((p (expt 10 precision)))
    (/ (round (* number p)) p)
  )
)

;; Exercise
;; Your task is to implement the Gauss-Legendre algorithm for calculating pi
;; and extract 10.000 (ten thousand) digits
;; The reason you need the rounding function above is because you're not
;; interested in more than 10.000 digits. So every time you get a result with
;; the Gauss-Legendre algorithm, you should round it to 10.000.
;; You know you are done when your previously calculated pi value is equal to
;; the next pi value you get -- then the precision within 10.000 digits cannot
;; get any better.

;; Gauss-Legendre algorithm on Wikipedia
;; https://en.wikipedia.org/wiki/Gauss%E2%80%93Legendre_algorithm

;; PLEASE NOTE that we need a biiiig number to be able to store 10.000 decimals.
;; Just like in Java, Lisp has different number types, and if you get a floating
;; point overflow, you need to coerce Lisp to use the very precise data type.
;; So when you call your pi function for the first time, you should append 'L0'
;; to your numbers. This will force Lisp to use the 'long-float datatype for
;; the remainder of your program.
;; So in short, your call to your pi function could look like this:
;;   (myPi 1L0 (/ 1L0 (sqrt 2L0)) (/ 1L0 4L0) 1L0)
;;

(defun nextA (pA pB)
  (/ (+ pA pB) 2)
)

(defun nextB (pA pB)
  (sqrt (* pA pB))
)

(defun nextT (pT pP pA nA)
  (- pT (expt (* pP (- pA nA)) 2))
)

(defun nextP (pP)
  (* 2 pP)
)

(defun myPi (a b tt p pPie)
  (let
    (
      (aNext (nextA a b)) (bNext (nextB a b)) (pNext (nextP p))
    )
    (let
      (
        (tNext (nextT tt p a aNext))
      )
      (let
        (
          (nPie (roundToPrecision ( / (expt(+ aNext bNext) 2) (* 4 tNext) ) 10000))
        )
        (if (equal nPie pPie) nPie (myPi aNext bNext tNext pNext nPie))
      )
    )
  )
)

(write (coerce(myPi 1L0 (/ 1L0 (sqrt 2L0)) (/ 1L0 4L0) 1L0 3L0) 'long-float))
