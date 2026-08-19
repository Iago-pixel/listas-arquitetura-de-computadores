.text
main:	addi $2, $0, 5
	syscall
	addi $8, $0, 10
	div $2, $8
	mflo $9
	mfhi $10
	
	div $9, $8
	mflo $9
	mfhi $11
	
	div $9, $8
	mfhi $12
	
	add $4, $0, $12
	addi $2, $0, 1
	syscall
	add $4, $0, $11
	addi $2, $0, 1
	syscall 
	add $4, $0, $10
	addi $2, $0, 1
	syscall 