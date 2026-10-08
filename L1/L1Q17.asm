.text
main:	addi $2, $0, 5
	syscall
	addi $8, $0, 10
	mul $9, $2, $8
	
	addi $2, $0, 5
	syscall
	mul $10, $2, $8
	
	add $11, $9, $10
	addi $12, $0, 2
	div $11, $11, $12
	div $11, $11, $8
	mfhi $13
	mflo $4
	
	addi $2, $0, 1
	syscall
	addi $4, $0, ','
	addi $2, $0, 11
	syscall
	add $4, $0, $13
	addi $2, $0, 1
	syscall