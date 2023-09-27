;8) Escribir un programa que efectúe la resta de dos números (de un dígito cada uno) ingresados por teclado y muestre el
;resultado en la pantalla de comandos. Antes de visualizarlo el programa debe verificar si el resultado es positivo o negativo
;y anteponer al valor el signo correspondiente.

ORG 1000h
MSJ DB "Escriba un número: "
MSJ2 DB "Escriba otro número: "
NUM1 DB ?
NUM2 DB ?
SIG DB 2DH
RES DB ?
SIGPOS DB 2BH
ORG 3000H
OPERACION: SUB CL, 30H
SUB CH, 30H
SUB CL, CH 
ADD CL, 30H
MOV RES, CL
RET 

ORG 2000H
MOV BX, OFFSET MSJ
MOV AL, OFFSET MSJ2 - OFFSET MSJ
INT 7
MOV BX, OFFSET NUM1
INT 6 
MOV BX, OFFSET MSJ2
MOV AL, OFFSET NUM1 - OFFSET MSJ2 
INT 7 
MOV BX, OFFSET NUM2
INT 6


MOV CL, NUM1
MOV CH, NUM2
SUB CL, CH
JS CONSIGNO 
JMP SINSIGNO

CONSIGNO:  
MOV CL, NUM2 
MOV CH, NUM1
CALL OPERACION

MOV BX, OFFSET SIG ;IMPRIMO EL SIGNO 
MOV AL, 1
INT 7 
JMP FIN

SINSIGNO: 
MOV CL, NUM1 
MOV CH, NUM2
CALL OPERACION
MOV BX, OFFSET SIGPOS ;IMPRIMO EL SIGNO 
MOV AL, 1
INT 7 

FIN: MOV BX, OFFSET RES ;IMPRIMO EL NUMERO
MOV AL, 1
INT 7



INT 0
END