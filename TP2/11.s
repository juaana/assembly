;11) Escribir un programa que permita seleccionar una letra del abecedario al azar. El código de la letra debe generarse en un
;registro que incremente su valor desde el código de A hasta el de Z continuamente. La letra debe quedar seleccionada al
;presionarse la tecla F10 y debe mostrarse de inmediato en la pantalla de comandos.

EOI EQU 20H
IMR EQU 21H 
INT0 EQU 24H
A EQU 41H 
Z EQU 5AH
ORG 1000H 
LETRA DB ?
FIN DB ?



ORG 3000H
IMP: MOV AL,1 
MOV BX, OFFSET LETRA
INT 7
MOV AL, 20H 
OUT EOI, AL
IRET 

ORG 2000H
MOV AX, IMP 
MOV BX, 20 
MOV [BX], AX

CLI 
MOV AL, 11111110b
OUT IMR, AL
MOV AL, 5
OUT INT0, AL
STI

ABC: MOV CX, A
LOOP: CMP CX, Z
JZ ABC
INC CX
MOV BX, OFFSET LETRA
MOV [BX], CX
JMP LOOP

INT 0
END