;5) Cálculo de A+B-C. Pasaje de parámetros a través de registros.
;a) Escribir un programa que dados los valores etiquetados como A, B y C y almacenados en la memoria de datos,
;calcule A+B-C y guarde el resultado en la memoria con etiqueta D, sin utilizar subrutinas.
ORG 1000H
A DW 4
B DW 3
C DW 2
D DW ?

ORG 2000H 
MOV AX, A 
MOV BX, B 
MOV CX, C 
ADD AX, BX 
MOV DX, CX 
MOV D, DX 
HLT
END 