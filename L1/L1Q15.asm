.text
main:	addi $2, $0, 5
	syscall
	addi $8, $0, 10
	
	div $2, $8
	mfhi $9 # unidade
	
	mflo $10
	div, $10, $8
	mfhi $11 # dezena
	
	mflo $10
	div $10, $8
	mfhi $12 # centena
	
	mflo $10 # milhar
	
	addi $13, $0, 32
	sub $14, $0, $10
	srl $14, $14, 31
	mul $14, $14, 16
	add $13, $13, $14
	add $4, $10, $13
	addi $2, $0, 11
	syscall
	
	addi $13, $0, 32
	sub $14, $0, $12
	srl $14, $14, 31
	mul $14, $14, 16
	add $13, $13, $14
	add $4, $12, $13
	addi $2, $0, 11
	syscall
	
	addi $13, $0, 32
	sub $14, $0, $11
	srl $14, $14, 31
	mul $14, $14, 16
	add $13, $13, $14
	add $4, $11, $13
	addi $2, $0, 11
	syscall
	
	addi $13, $0, 32
	sub $14, $0, $9
	srl $14, $14, 31
	mul $14, $14, 16
	add $13, $13, $14
	add $4, $9, $13
	addi $2, $0, 11
	syscall