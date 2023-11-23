.data
A: .word 3
B: .word 3
C: .word 3
D: .word 0

.code
ld r1, A(r0) #cargo A
ld r2, B(r0) #CARGO B
ld r3, C(r0) #CARGO C 
dadd r4, r0, r0 #Inicializo r4 en 0


bne r1,r2,DISTINTOS1 #jump not equal between A y B
daddi r4, r4, 1 #Case equal add 1 r4 (2 numbers are equal)
DISTINTOS1: bne r1,r3,DISTINTOS2 #jump no equal A y C
daddi r4, r4, 1 #Case equal add 1 r4 (Another number is equal)
DISTINTOS2: bne r2,r3,DISTINTOS3 #B!=C? Jump not equal B y C
daddi r4, r4, 1 #Case equal add 1 r4 
DISTINTOS3: daddi r5,r0,1 #Si r4=1 hay DOS numero iguales (R4++)
bne r4,r5, NO_DOS 
daddi r4,r4,1 

NO_DOS: sd r4, D(r0)
halt
#Si tenes delay slot activado en D queda 4 no 3 porque se ejecuta la instrucción siguiente al salto y luego finaliza