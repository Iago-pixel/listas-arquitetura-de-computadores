.text
main:	addi $2, $0, 5
	syscall
	
	andi $8, $2, 1
	addi $9, $0, -1
	mul $4, $8, $9
	
	addi $2, $0, 1
	syscall