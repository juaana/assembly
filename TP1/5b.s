;5b) Escribir un programa como en a) pero ahora el cálculo y el almacenamiento del resultado debe realizarse en una
;subrutina llamada calculo, sin recibir ni devolver parámetros, es decir, utilizando A, B, C y D como variables
;globales. Si bien esta técnica no está recomendada, en ejercicio sirve para ver sus diferencias con el uso de
;parámetros.
ORG 1000H
A DW 4
B DW 3
C DW 2
D DW ?

ORG 3000H
CALCULO: INC A 
DEC B 
JNZ CALCULO
RESTA: DEC A
DEC C 
JNZ RESTA
RESULTADO: INC D 
DEC A 
JNZ RESULTADO 
RET 

ORG 2000H 
MOV D, 0 
CALL CALCULO 
HLT
END 