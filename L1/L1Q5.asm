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
	
	add $13, $10, $11
	add $4, $13, $12
	
	addi $2, $0, 1
	syscall 
	