.text
main:	addi $2, $0, 5
	syscall
	add $8, $0, $2
	
	addi $2, $0, 5
	syscall
	add $9, $0, $2
	
	mul $8, $8, 2
	mul $9, $9, 3
	add $10, $8, $9
	
	addi $11, $0, 5
	div $10, $11
	mflo $4
	
	addi $2, $0, 1
	syscall
