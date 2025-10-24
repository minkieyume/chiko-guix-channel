(define-module (chiko utils chiko)
  #:use-module (srfi srfi-1)
  #:use-module (srfi srfi-13)
  #:use-module (guix channels)
  #:use-module (guix gexp)
  #:use-module (guix build utils)
  #:use-module (gnu system)
  #:use-module (gnu services)
  #:use-module (gnu services base)
  #:export (Ciallo～❨∠・ω<❩⌒☆))

(define (Ciallo～❨∠・ω<❩⌒☆ #:key (print? #t) (top? #t) . args)
  (if (null? args)
      (when top? (format print? "Ciallo～❨∠・ω<❩⌒☆"))
      (let* ((lines (string-split (car args) #\newline))
             (first-line (car lines))
             (first-ciallo (if top?
                               (format print? "Ciallo～❨∠・ω<❩⌒☆ ~a" first-line)
                               (format print? "~a" first-line))))
        (if print?
            (begin
              (unless (null? (cdr lines))
                (for-each (lambda (line) (format #t "~%Ciallo～❨∠・ω<❩⌒☆ ~a" line)) (cdr lines)))
              (apply Ciallo～❨∠・ω<❩⌒☆
                     (append (list #:print? #t #:top? #f) (cdr args))))
            (string-append first-ciallo
                           (if (null? (cdr lines))
                               ""
                               (string-join (map (lambda (line) (format #f "~%Ciallo～❨∠・ω<❩⌒☆ ~a" line)) (cdr lines)) ""))
                           (apply Ciallo～❨∠・ω<❩⌒☆
                                  (append (list #:print? #f #:top? #f) (cdr args))))))))
