.data
cadena: .asciiz "adbdcdedfdgdhdid" ; cadena a analizar
car: .asciiz "d" ; caracter buscado
cant: .word 0 ; cantidad de veces que se repite el caracter car en cadena.

.code
dadd r2, r0, r0
ld r3, car(r0)

loop: ld r4, cant(r0)
lbu r1, cadena(r2)
bne r1, r3, noEsIgual
daddi r4, r4, 1
sd r4, cant(r0)
noEsIgual: daddi r2,r2,1
bnez r1, loop

halt 