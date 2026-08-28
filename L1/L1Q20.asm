.text
main:	addi $2, $0, 5
	syscall
	
	addi $8, $0, 19
	div $2, $8
	mfhi $9 # a
	
	addi $8, $0, 100
	div $2, $8
	mflo $10 # b
	
	mfhi $11 # c
	
	addi $8, $0, 4
	div $2, $8
	mflo $12 # d
	
	mfhi $13 # e
	
	addi $8, $0, 25
	addi $14, $10, 8
	div $14, $8
	mflo $14 # f
	
	addi $8, $0, 3
	sub $15, $10, $14
	addi $15, $15, 1
	div $15, $8
	mflo $15 # g
	
	addi $8, $0, 30
	addi $16, $0, 19
	mul $16, $16, $9
	add $16, $16, $10
	sub $16, $16, $12
	sub $16, $16, $15
	addi $16, $16, 15
	div $16, $8
	mfhi $16 # h
	
	addi $8, $0, 4
	div $11, $8
	mflo $17 # i
	
	mfhi $18 # k
	
	addi $8, $0, 7
	addi $19, $0, 32
	addi $20, $0, 2
	mul $21, $20, $13
	add $19, $19, $21
	mul $21, $17, $20
	add $19, $19, $21
	sub $19, $19, $16
	sub $19, $19, $18
	div $19, $8
	mfhi $19 # L
	
	addi $8, $0, 451
	addi $20, $0, 11
	mul $21, $16, $20
	add $21, $21, $9
	addi $20, $0, 22
	mul $20, $20, $19
	add $21, $21, $20
	div $21, $8
	mfhi $21 # m
	
	addi $8, $0, 31
	add $20, $16, $19
	addi $22, $0, 7
	mul $22, $22, $21
	sub $20, $20, $22
	addi $20, $20, 114
	div $20, $8
	mflo $20 # MÊS
	
	addi $22, $0, -7
	mul $22, $22, $21
	add $22, $22, $16
	add $22, $22, $19
	addi $22, $22, 114
	div $22, $8
	mfhi $22
	addi $22, $22, 1 # DIA
	
	add $4, $0, $22
	addi $2, $0, 1
	syscall
	addi $4, $0, '/'
	addi $2, $0, 11
	syscall
	add $4, $0, $20
	addi $2, $0, 1
	syscall
	