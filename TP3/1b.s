;1.b) Escribir un programa que verifique si la llave de más a la izquierda está prendida. Si es así, mostrar en
;pantalla el mensaje “Llave prendida”, y de lo contrario mostrar “Llave apagada”. Solo importa el valor
;de la llave de más a la izquierda (bit más significativo). Recordar que las llaves se manejan con las
;teclas 0-7.
PA EQU 30H
CA EQU 32H

ORG 1000H
MSJ DB "Llave prendida"
MSJ2 DB "Llave apagada"
FIN DB ?
ORG 2000H

MOV AL, 11111111b
OUT CA, AL 
 
IN AL, PA
AND AL, 10000000b
JZ APAGADA 

MOV AL, OFFSET MSJ2 - OFFSET MSJ
MOV BX, OFFSET MSJ
JMP I

APAGADA: 
MOV AL, OFFSET FIN - OFFSET MSJ2
MOV BX, OFFSET MSJ2
I: INT 7
INT 0
END
