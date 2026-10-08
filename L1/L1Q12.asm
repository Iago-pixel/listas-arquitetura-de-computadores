.text
main:	addi $2, $0, 5
	syscall
	sll $8, $2, 1
	add $8, $8, $2
	
	addi $2, $0, 5
	syscall
	sll $9, $2, 3
	add $9, $9, $2
	
	addi $2, $0, 5
	syscall
	sll $10, $2, 4
	sub $10, $10, $2
	
	add $11, $8, $9
	add $11, $11, $10
	
	addi $12, $0, 27
	div $11, $12
	mflo $4
	
	addi $2, $0, 1
	syscall