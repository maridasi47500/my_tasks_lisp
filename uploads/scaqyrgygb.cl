

(define rember-f
  (lambda (test?)
    (lambda (a l)
      (cond
        ((null? l) '())
        ((test? (car l) a) (cdr l))
        (else
          (cons (car l) ((rember-f test?) a (cdr l))))))))

((rember-f eq?) 2 '(1 2 3 4 5))

(define rember-eq? (rember-f eq?))

(rember-eq? 2 '(1 2 3 4 5))
(rember-eq? 'tuna '(tuna salad is good))
(rember-eq? 'tuna '(shrimp salad and tuna salad))
(rember-eq? 'eq? '(equal? eq? eqan? eqlist? eqpair?))

(define insertL-f
  (lambda (test?)
    (lambda (new old l)
      (cond
        ((null? l) '())
        ((test? (car l) old)
         (cons new (cons old (cdr l))))
        (else
          (cons (car l) ((insertL-f test?) new old (cdr l))))))))

((insertL-f eq?)
  'd
  'e

(define insertR-f
  (lambda (test?)
    (lambda (new old l)
      (cond
        ((null? l) '())
        ((test? (car l) old)
         (cons old (cons new (cdr l))))
        (else
          (cons (car l) ((insertR-f test?) new old (cdr l))))))))

((insertR-f eq?)
  'e
  'd

(define seqL
  (lambda (new old l)
    (cons new (cons old l))))

(define seqR
  (lambda (new old l)
    (cons old (cons new l))))

(define insert-g
  (lambda (seq)
    (lambda (new old l)
      (cond
        ((null? l) '())
        ((eq? (car l) old)
         (seq new old (cdr l)))
        (else
          (cons (car l) ((insert-g seq) new old (cdr l))))))))

(define insertL (insert-g seqL))

(define insertR (insert-g seqR))

(insertL
  'd
  'e

(insertR
  'e
  'd

(define insertL
  (insert-g
    (lambda (new old l)
      (cons new (cons old l)))))

(insertL
  'd
  'e

(define subst-f
  (lambda (new old l)
    (cond
      ((null? l) '())
      ((eq? (car l) old)
       (cons new (cdr l)))
      (else
        (cons (car l) (subst new old (cdr l)))))))

(define seqS
  (lambda (new old l)
    (cons new l)))

(define subst (insert-g seqS))

(subst
  'topping
  'fudge

(define yyy
  (lambda (a l)
    ((insert-g seqrem) #f a l)))

(define seqrem
  (lambda (new old l)
    l))

(yyy
  'sausage


(define value
  (lambda (nexp)
    (cond
      ((atom? nexp) nexp)
      ((eq? (car (cdr nexp)) 'o+)
       (+ (value (car nexp))
          (value (car (cdr (cdr nexp))))))
      ((eq? (car (cdr nexp)) 'o*)
       (* (value (car nexp))
          (value (car (cdr (cdr nexp))))))
      ((eq? (car (cdr nexp)) 'o^)
       (expt (value (car nexp))
             (value (car (cdr (cdr nexp))))))
      (else #f))))

(define atom-to-function
  (lambda (atom)
    (cond
      ((eq? atom 'o+) +)
      ((eq? atom 'o*) *)
      ((eq? atom 'o^) expt)
      (else #f))))

(define operator
  (lambda (aexp)
    (car aexp)))
