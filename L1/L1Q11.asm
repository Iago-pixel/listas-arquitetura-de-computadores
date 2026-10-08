.text
main:	addi $2, $0, 5
	syscall
	addi $8, $0, 10
	
	div $2, $8
	mflo $10
	mfhi $4
	
	div $10, $8
	mflo $11
	mfhi $12
	
	addi $2, $0, 1
	syscall
	add $4, $0, $12
	syscall
	add $4, $0, $11
	syscall 
