;d) * Escribir un programa que solicite ingresar caracteres por teclado y que recién al presionar la tecla F10
;los envíe a la impresora a través de la PIO. No es necesario mostrar los caracteres en la pantalla.

EOI EQU 20H
IMR EQU 21H
F10 EQU 24H

PA EQU 30H
PB EQU 31H
CA EQU 32H
CB EQU 33H

ORG 1000H
MSJ DB "INGRESE 5 LETRAS"
LETRAS DB ?


ORG 3000H
IMPRIMIR: MOV AL, 11111111b
          OUT IMR, AL

MOV BX, OFFSET LETRAS
  
POLL: IN AL, PA 
	AND AL, 1 
	JNZ POLL   
  
	MOV AL, [BX]
	OUT PB, AL 
  
  IN AL, PA 
	OR AL, 00000010b 
	OUT PA, AL
	
  AND AL, 11111101b 
	OUT PA, AL 
  
	INC BX
	CMP DX, BX
JNZ POLL 

MOV AL, 20H
OUT EOI, AL
IRET

ORG 2000H
MOV DL, 0

MOV AX, IMPRIMIR
MOV BX, 20
MOV [BX], AX

MOV AL, 11111101b 
OUT CA, AL 
MOV AL, 0
OUT CB, AL 




MOV BX, OFFSET MSJ
MOV AL, OFFSET LETRAS - OFFSET MSJ
INT 7
MOV BX, OFFSET LETRAS

CLI
MOV AL, 11111110b
OUT IMR, AL

MOV AL, 5
OUT F10, AL

STI


LEE: INT 6
     INC BX
     MOV DX, BX

     IN AL, IMR
     CMP AL, 11111111b
JNZ LEE


  
INT 0
END
