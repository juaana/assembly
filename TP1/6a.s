;6) * Multiplicación de números sin signo. Pasaje de parámetros a través de registros.
;El simulador no posee una instrucción para multiplicar números. Escribir un programa para multiplicar los números
;NUM1 y NUM2, y guardar el resultado en la variable RES
;a) Sin hacer llamados a subrutinas, resolviendo el problema desde el programa principal;
ORG 1000H
NUM1 DW 2
NUM2 DW 3
RES DW ?

ORG 2000H
MOV AX, NUM1
MOV BX, NUM2
MOV DX,0 
LOOP: ADD DX, AX 
DEC BX
JNZ LOOP
MOV RES, DX 
HLT 
END