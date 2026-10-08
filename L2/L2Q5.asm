.text
main:	addi $2, $0, 5
	syscall
	add $8, $0, $2
	
	addi $2, $0, 5
	syscall
	add $9, $0, $2
	
	addi $2, $0, 5
	syscall
	add $10, $0, $2
	
	addi $11, $0, 2
	mul $9, $9, $11
	
	addi $11, $0, 3
	mul $10, $10, $11
	
	add $8, $8, $9
	add $8, $8, $10
	
	addi $11, $0, 6
	div $8, $11
	mflo $4
	
	addi $2, $0, 1
	syscall
	
	addi $8, $0, 60
	slt $9, $4, $8
	bne $9, $0, reprovado
		addi $4, $0, 'A'
		addi $2, $0,  11
		syscall
		j fimmedia
		reprovado:
		addi $4, $0, 'R'
		addi $2, $0,  11
		syscall
	fimmedia:
	
	addi $2, $0, 10
	syscall