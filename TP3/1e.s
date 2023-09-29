;e) Escribir un programa que encienda una luz a la vez, de las ocho conectadas al puerto paralelo del
;microprocesador a través de la PIO, en el siguiente orden de bits:
;0-1-2-3-4-5-6-7-6-5-4-3-2-1-0-1-2-3-4-5-6-7-6-5-4-3-2-1-0-1-..., es decir, 00000001, 00000010,
;00000100, etc. Cada luz debe estar encendida durante un segundo. El programa nunca termina.

CONT EQU 10H
COMP EQU 11H
EOI EQU 20H
IMR EQU 21H
TIMER EQU 25H
PB EQU 31H
CB EQU 33H

ORG 1000H
FLAG DB 0

ORG 3000H 
CONTADOR: CMP FLAG, 1
JZ DECREMENTO 
INCREMENTO: 
INC CL
MOV AL, CL
OUT PB, AL 
CMP CL, 11111111b
JNZ SIGO 
MOV FLAG, 1
JMP SIGO 

DECREMENTO: DEC CL
MOV AL, CL
OUT PB, AL 
CMP CL, 00000000b
JNZ SIGO 
MOV FLAG, 0



SIGO: MOV AL, 0
OUT CONT, AL

MOV AL, 20H
OUT EOI, AL
IRET

ORG 2000H

MOV BX, 20
MOV AX, CONTADOR
MOV [BX], AX

MOV CL, 0
MOV AL, 00000000b
OUT CB, AL
OUT PB, AL

CLI
MOV AL, 11111101b
OUT IMR, AL 

MOV AL, 5
OUT TIMER, AL

MOV AL, 1
OUT COMP, AL
MOV AL, 0
OUT CONT, AL 



STI


LOOP: 
JMP LOOP

INT 0
END


