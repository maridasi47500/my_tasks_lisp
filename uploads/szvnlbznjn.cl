
(multiremember&co
  'tuna
  '(strawberries tuna and swordfish)
  new-friend)
; ==> #f
(multiremember&co
  'tuna
  '()
  new-friend)
; ==> #f
(multiremember&co
  'tuna
  '(tuna)
  new-friend)
; ==> #f

; The last friend function
;
(define last-friend
  (lambda (x y)
    (length x)))
