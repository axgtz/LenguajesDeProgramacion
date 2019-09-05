#|
First Program in Racket
    Valid extensions: .rkt or .scm

Roberto Alejandro Gutierrez Guillen
2/08/2019

Usar ./racket en la terminal para entrar 
|#

; Create Hello world funcion
;greeting es el nombre de la funcion y name es la variable
(define (greeting name)
  (display (string-append "Hello " name " !"))
 )
