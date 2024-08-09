; Chapter 3 of The Little Schemer:; Cons the Magnificent;; Code examples assemled by Peteris Krumins (peter@catonmat.net).; His blog is at http://www.catonmat.net  --  good coders code, great reuse.;; Get yourself this wonderful book at Amazon: http://bit.ly/4GjWdP;; The rember function removes the first occurance of the given atom from the; given list.;(define rember  (lambda (a lat)    (cond      ((null? lat) '())      ((eq? (car lat) a) (cdr lat))      (else (cons (car lat)                  (rember a (cdr lat)))))))(rember 'mint '(lamb chops and mint flavored mint jelly)) ; '(lamb chops and flavored mint jelly)(rember 'toast '(bacon lettuce and tomato))               ; '(bacon lettuce and tomato)(rember 'cup '(coffee cup tea cup and hick cup))          ; '(coffee tea cup and hick cup);;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;                                                                            ;; The second commandment                                                     ;;                                                                            ;; Use /cons/ to build lists.                                                 ;;                                                                            ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; The firsts function builds a list of first s-expressions;(define firsts  (lambda (l)    (cond      ((null? l) '())      (else        (cons (car (car l)) (firsts (cdr l)))))))(firsts '((apple peach pumpkin)          (plum pear cherry)          (grape raisin pea)          (bean carrot eggplant)))                     ; '(apple plum grape bean)(firsts '((a b) (c d) (e f)))                          ; '(a c e)(firsts '((five plums) (four) (eleven green oranges))) ; '(five four eleven)(firsts '(((five plums) four)          (eleven green oranges)          ((no) more)))                                ; '((five plums) eleven (no));;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;                                                                            ;; The third commandment                                                      ;;                                                                            ;; When building lists, describe the first typical element, and then /cons/   ;; it onto the natural recursion.                                             ;;                                                                            ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; The insertR function inserts the element new to the right of the first; occurence of element old in the list lat;(define insertR  (lambda (new old lat)    (cond      ((null? lat) '())      ((eq? (car lat) old)       (cons old (cons new (cdr lat))))      (else        (cons (car lat) (insertR new old (cdr lat)))))))(insertR  'topping 'fudge  '(ice cream with fudge for dessert)) ; '(ice cream with fudge topping for dessert)(insertR  'jalapeno  'and  '(tacos tamales and salsa))          ; '(tacos tamales and jalapeno salsa)(insertR  'e  'd  '(a b c d f g d h))                  ; '(a b c d e f g d h); The insertL function inserts the element new to the left of the first; occurrence of element old in the list lat;(define insertL  (lambda (new old lat)    (cond      ((null? lat) '())      ((eq? (car lat) old)       (cons new (cons old (cdr lat))))      (else        (cons (car lat) (insertL new old (cdr lat)))))))