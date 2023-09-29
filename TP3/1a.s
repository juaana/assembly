;1.a)Escribir un programa que encienda las luces con el patrón 11000011, o sea, solo las primeras y las
;últimas dos luces deben prenderse, y el resto deben apagarse.
PB EQU 31H
CB EQU 33H

ORG 2000H
MOV AL, 00111100b
OUT CB, AL
MOV AL, 11000011b
OUT PB, AL 
INT 0
END