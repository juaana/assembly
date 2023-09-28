TIMER EQU 10H
;15) Escribir un programa que implemente un conteo regresivo a partir de un valor ingresado desde el teclado. El conteo
;debe comenzar al presionarse la tecla F10. El tiempo transcurrido debe mostrarse en pantalla, actualizándose el valor cada
;segundo.
PIC EQU 20H
EOI EQU 20H
N_CLK EQU 10
N_F10 EQU 5

INT0 EQU 24H
INT1 EQU 25H

CONT EQU 10H 
COMP EQU 11H
IMR EQU 21H


ORG 1000H
SEG DB 30H
ESPACIO DB 20H
FIN DB ?
MSJ DB "Ingrese un número "
MSJ2 DB "Cuenta regresiva: "
NUMERO DB ?
FLAG DB 0

ORG 3000H
RUT_CLK: 
MOV SEG, CL
CMP SEG, 30H
JNZ IMPRIMO
JMP F

IMPRIMO: MOV AL, OFFSET FIN - OFFSET SEG
MOV BX, OFFSET SEG
INT 7
DEC SEG
MOV CL, SEG
MOV AL, 0
OUT CONT, AL

JMP AVISOPIC

F: MOV DL, 1
AVISOPIC: MOV AL, 20H
OUT EOI, AL
IRET

ORG 3700H
RUT_F10: 
IN AL, IMR ; Recupero el valor actual del IMR
MOV AL, 11111101B ; Y cambio la linea correspondiente al TIMER
OUT IMR, AL

MOV AL, 20H ; Se finaliza la atencion de la interrupcion
OUT EOI, AL

IRET


ORG 2000H
MOV BX, OFFSET MSJ
MOV AL, OFFSET MSJ2 - OFFSET MSJ
INT 7

MOV BX, OFFSET NUMERO 
INT 6
MOV CL, [BX]

MOV AX, RUT_F10
MOV BX, 20; 5* 4=20 en vec de int
MOV [BX],AX ; En la posición 20= 3000H

MOV AX, RUT_CLK
MOV BX, 40
MOV [BX], AX

CLI
MOV AL, 11111110b
OUT IMR, AL ; PIC: registro IMR

MOV AL, 5
OUT INT0, AL ; PIC: registro INT0, F10

MOV AL, 10
OUT INT1, AL ; PIC: registro INT1

MOV AL, 1
OUT COMP, AL ; TIMER: registro COMP

MOV AL, 0
OUT CONT, AL ; TIMER: registro CONT

MOV BX, OFFSET SEG ; Direccion del contador
MOV DL, 0
STI

LAZO: 
CMP DL, 0
JZ LAZO

INT 0
END