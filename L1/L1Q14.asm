.text
main:	addi $2, $0, 5
	syscall
	andi $4, $2, 1
	addi $2, $0, 1
	syscall