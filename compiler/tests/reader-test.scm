
(load-with-macros "compiler.scm")

(compile-and-emit '(begin

(define (collapse-strings strings acc)
  (if (null? strings)
      acc
      (collapse-strings (cdr strings)
                        (string-append (car strings) acc))))

(collapse-strings (cons "foo" (cons "bar" '())) "")

;; (define ch ())

;; (define (peek-next-char)
;;   (if (null? ch)
;;       (begin (set! ch (read-char))
;;              ch)
;;       ch))

;; (define (read-next-char)
;;   (if (null? ch)
;;       (read-char)
;;       (let ((c ch))
;;         (set! ch '())
;;         c)))

;; (define (blank? c)
;;   (or (string= c " ")
;;       (string= c "\n")
;;       (string= c "\t")))

;; (define (get-string acc)
;;   (let ((c (read-next-char)))
;;     (if (string= c "\"")
;;         (collapse-strings (reverse acc) '())
;;         (get-string (cons c acc)))))

;; (define (get-symbol acc)
;;   (let ((c (peek-next-char)))
;;     (if (or (string= c "(")
;;             (string= c ")")
;;             (blank? c))
;;         (string->symbol (collapse-strings (reverse acc) '()))
;;         (get-symbol (cons (read-next-char) acc)))))

;; (define (read_)
;;   (let ((token (next-token)))
;;     (if (eq? token 'Left)
;;         (read-list '())
;;         ;; doesn't check if the token isn't an atom
;;         token)))

;; (define (read-list acc)
;;   (let ((token (next-token)))
;;     (cond ((eq? token 'Left)
;;            (read-list (cons (read-list '()) acc)))
;;           ((eq? token 'Right)
;;            (reverse acc))
;;           ((symbol? token)
;;            (read-list (cons token acc))))))

;; (define (next-token)
;;   (let ((c (read-next-char)))
;;     (cond ((blank? c) (next-token))
;;           ((string= c "(") 'Left)
;;           ((string= c ")") 'Right)
;;           ((string= c ".") 'Period)
;;           ((string= c ",") 'Comma)
;;           ((string= c "`") 'Back)
;;           ((string= c "'") 'Quote)
;;           ((string= c "\"")
;;            (get-string '()))
;;           (else (get-symbol (list c))))))

;; (define (length l)
;;   (if (null? l)
;;       0
;;       (+ 1 (length (cdr l)))))

;; (length (read_))
                     )
                  "read-test.c")
