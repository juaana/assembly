;c) * Escribir un programa que solicita el ingreso de cinco caracteres por teclado y los envía de a uno por
;vez a la impresora a través de la PIO a medida que se van ingresando. No es necesario mostrar los
;caracteres en la pantalla.
PA EQU 30H
PB EQU 31H
CA EQU 32H
CB EQU 33H

ORG 1000H
MSJ DB "INGRESE 5 LETRAS"
LETRAS DB ?
FIN DB ?

ORG 2000H
MOV DL, 0

MOV AL, 11111101b 
OUT CA, AL 
MOV AL, 0
OUT CB, AL 




MOV BX, OFFSET MSJ
MOV AL, OFFSET LETRAS - OFFSET MSJ
INT 7

POLL: IN AL, PA 
	AND AL, 1 
	JNZ POLL 
  
  MOV BX, OFFSET LETRAS
  INT 6
  
	MOV AL, [BX]
	OUT PB, AL 
  
  IN AL, PA 
	OR AL, 00000010b 
	OUT PA, AL
	
  AND AL, 11111101b 
	OUT PA, AL 
  
	INC DL
	CMP DL, 5
	JNZ POLL  


  
INT 0
END
