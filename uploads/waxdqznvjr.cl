; Chapter 1 of The Little Schemer:; Toys;; Code examples assemled by Peteris Krumins (peter@catonmat.net).; His blog is at http://www.catonmat.net  --  good coders code, great reuse.;; Get yourself this wonderful book at Amazon: http://bit.ly/4GjWdP;'atom(quote atom)'turkey1492'*abc$(quote *abc$)'(atom)(quote (atom))'(atom turkey or)'((atom turkey) or)'xyz'(x y z)'((x y z))'(how are you doing so far)'(((how) are) ((you) (doing so)) far)'()'(() () () ())'(atom turkey) 'or      ; because it's two separate s-expressions'()     ; because it's a list(car '(a b c))                ; 'a(car '((a b c) x y z))        ; '(a b c); (car 'hotdog)     ; not-applicable because 'hotdog is not a list; (car '())         ; not-applicable because '() is an empty list;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; The law of car:                                                            ;;                                                                            ;; The primitive /car/ is defined only for non-empty lists.                   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; More examples of car;(car '(((hotdogs)) (and) (pickle) relish))  ; '((hotdogs))(car (car '(((hotdogs)) (and))))            ; '(hotdogs)(cdr '(a b c))              ; '(b c)(cdr '((a b c) x y z))      ; '(x y z)(cdr '(hamburger))          ; '()(cdr '((x) t r))            ; '(t r); (cdr 'hotdogs)    ; not-applicable because 'hotdogs is not a list; (cdr '())         ; not-applicable because '() is an empty list;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; The law of cdr:                                                            ;;                                                                            ;; The primitive /cdr/ is defined only for non-empty lists.                   ;; The /cdr/ of any non-empty list is always another list.                    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;(car (cdr '((b) (x y) ((c)))))      ; '(x y)(cdr (cdr '((b) (x y) ((c)))))      ; '(((c)))(cons 'peanut '(butter and jelly))                  ; '(peanut butter and jelly)(cons '(banana and) '(peanut butter and jelly))     ; '((banana and) peanut butter and jelly)(cons '((help) this) '(is very ((hard) to learn)))  ; '(((help) this) is very ((hard) to learn))(cons '(a b (c)) '())                               ; '((a b (c)))(cons 'a '())                                       ; '(a); (cons '((a b c)) 'b)  ; not-applicable because 'b is not a list; (cons 'a 'b)          ; not-applicable because 'b is not a list;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; The law of cons                                                            ;;                                                                            ;; The primitive /cons/ takes two arguments.                                  ;; The second argument to /cons/ must be a list.                              ;; The result is a list.                                                      ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;(cons 'a (car '((b) c d)))     ; (a b)(cons 'a (cdr '((b) c d)))     ; (a c d)'()(null? '())         ; true(null? '(a b c))    ; false