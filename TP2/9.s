;9) Escribir un programa que aguarde el ingreso de una clave de cuatro caracteres por teclado sin visualizarla en pantalla. En
;caso de coincidir con una clave predefinida (y guardada en memoria) que muestre el mensaje "Acceso permitido", caso
;contrario el mensaje "Acceso denegado".

ORG 1000H
CONTRA DW 31H
  DW 32H
  DW 33H
  DW 34H
CONTRAI DB ?
DB ?
DB? 
DB?
MSJACC DB "Acceso permitido"
MSJNA DB "Acceso denegado"
MSJ DB "Ingrese su contrasenia de 4 digitos "
FIN DB ?

ORG 2000H

MOV BX, OFFSET MSJ 
MOV AL, OFFSET FIN - OFFSET MSJ 
INT 7

MOV CL, 4

MOV BX, OFFSET CONTRAI 

LOOP: CMP CL, 0 
JZ COMPARA
INT 6 
MOV AX, [BX]
PUSH AX
INC BX
DEC CL
JMP LOOP

COMPARA: MOV AX, OFFSET CONTRA
        MOV BX, AX
        MOV DX, [BX]
          
        MOV BX, SP
        MOV BX, 7FFEH
        MOV CX, BX 
        MOV BX, [BX]
CALL CHECK
        
CHECK:  CMP DL, BL 
        JNZ ACCESONO
        CMP CX, 7FF8H
        JZ ACCESOPER
        SUB CX, 2 
        ADD AX,2
        
        MOV BX, AX
        MOV DX, [BX]
        MOV BX, CX
        MOV BX, [BX]
        JMP CHECK
          

ACCESONO: MOV BX, OFFSET MSJNA
          MOV AL, OFFSET MSJ - OFFSET MSJNA
          JMP F
          
ACCESOPER: MOV BX, OFFSET MSJACC
          MOV AL, OFFSET MSJNA - OFFSET MSJACC
  
  
  
 F:INT 7 
  INT 0
END
       