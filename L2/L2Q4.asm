.text
main:	addi $2, $0, 5
	syscall
	add $8, $0, $2
	
	addi $2, $0, 5
	syscall
	add $9, $0, $2
	
	slt $10, $8, $9
	bne $10, $0, menor8
		beq $8, $9, igual
			addi $11, $0, '>'
			j fimigual
			igual:	addi $11, $0, '='
		fimigual:
		j fimmenor8
		menor8:	addi $11, $0, '<'
	fimmenor8:
	add $4, $0, $8
	addi $2, $0, 1
	syscall
	
	add $4, $0, $11
	addi $2, $0, 12
	syscall
	
	add $4, $0, $9
	addi $2, $0, 1
	syscall
	
	addi $2, $0, 10
	syscall