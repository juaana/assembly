;3.1) 1. Si el registro SP vale 8000h al comenzar el programa, indicar el contenido de la pila luego de ejecutar cada
;instrucción. Si el contenido es desconocido/basura, indicarlo con el símbolo ?. Considerar que el programa
;comienza a ejecutarse con el IP en la dirección 2000h, es decir que la primera instrucción que se ejecuta es la
;de la línea 5 (call rut). Se provee la ubicación de las instrucciones en memoria, para poder determinar la
;dirección de retorno de la rutina.

ORG 3000H
RUT: MOV bx, 3; STACK 2003H; PILA 200AH
RET; STACK= 2003H; PILA 2000AH

ORG 2000h
CALL RUT; STACK = 2003h
ADD CX, 5; STACK= 2003H 
CALL RUT; STACK = 200AH 
HLT; STACK = 200AH 
END 
