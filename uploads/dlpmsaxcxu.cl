
;
(equal?? 'a 'a)                              ; #t
(equal?? 'a 'b)                              ; #f
(equal?? '(a) 'a)                            ; #f
(equal?? '(a) '(a))                          ; #t
(equal?? '(a) '(b))                          ; #f
(equal?? '(a) '())                           ; #f
(equal?? '() '(a))                           ; #f
(equal?? '(a b c) '(a b c))                  ; #t
(equal?? '(a (b c)) '(a (b c)))              ; #t
(equal?? '(a ()) '(a ()))                    ; #t