;d) * Escribir un programa que implemente un encendido y apagado sincronizado de las luces. Un contador,
;que inicializa en cero, se incrementa en uno una vez por segundo. Por cada incremento, se muestra a
;través de las luces, prendiendo solo aquellas luces donde el valor de las llaves es 1. Entonces, primero
;se enciende solo la luz de más a la derecha, correspondiente al patrón 00000001. Luego se continúa con
;los patrones 00000010, 00000011, y así sucesivamente. El programa termina al llegar al patrón
;11111111.

CONT EQU 10H
COMP EQU 11H
EOI EQU 20H
IMR EQU 21H
TIMER EQU 25H
PB EQU 31H
CB EQU 33H

ORG 3000H 
CONTADOR: INC CL
MOV AL, CL
OUT PB, AL 
CMP CL, 11111111b
JNZ SIGO 
MOV AL, 11111111b
OUT IMR, AL


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


LOOP: CMP CL, 11111111b
JNZ LOOP

INT 0
END