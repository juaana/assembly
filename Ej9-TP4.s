.data
a: .word 2 
x: .word 0
y: .word 3

.code
dadd r2, r0, r0
ld r3, y(r0)

loop: ld r1, a(r0)
beqz r1, fin 
daddi r1, r1, -1 
dadd r2, r2,r3
sd r1,a(r0)
j loop 

fin: sd r2, x(r0)
halt