;12) Interrupción por hardware: TIMER.
;Implementar a través de un programa un reloj segundero que muestre en pantalla los segundos transcurridos (00-59 seg)
;desde el inicio de la ejecución.
TIMER EQU 10H
PIC EQU 20H
EOI EQU 20H
N_CLK EQU 10

ORG 40
IP_CLK DW RUT_CLK

ORG 1000H
SEG DB 30H
DB 30H
ESPACIO DB 20H
FIN DB ?

ORG 3000H
RUT_CLK: INC SEG+1
CMP SEG+1, 3AH
JNZ RESET
MOV SEG+1, 30H ;Si el contador esta en 9 paso un digito a la izquierda

INC SEG
CMP SEG, 36H
JNZ RESET
MOV SEG, 30H


RESET: MOV AL, OFFSET FIN - OFFSET SEG
MOV BX, OFFSET SEG

INT 7
MOV AL, 0
OUT TIMER, AL

MOV AL, 20H
OUT EOI, AL
IRET

ORG 2000H
CLI
MOV AL, 0FDH
OUT PIC+1, AL ; PIC: registro IMR
MOV AL, N_CLK
OUT PIC+5, AL ; PIC: registro INT1
MOV AL, 1
OUT TIMER+1, AL ; TIMER: registro COMP
MOV AL, 0
OUT TIMER, AL ; TIMER: registro CONT
STI
LAZO: JMP LAZO
END