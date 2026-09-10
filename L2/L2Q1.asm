.text
main:	addi $2, $0, 5
	syscall
	add $8, $0, $2
	
	addi $2, $0, 5
	syscall
	add $9, $0, $2
	
	slt $10, $8, $9
	bne $10, $0, maior9
	# 8 é maior
	add $4, $0, $8
	j imp
	# 9 é maior
maior9:	add $4, $0, $9
	
imp:	addi $2, $0, 1
	syscall
	
	addi $2, $0, 10
	syscall