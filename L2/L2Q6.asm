.text
main:	addi $2, $0, 5
	syscall
	add $8, $0, $2
	
	addi $2, $0, 5
	syscall
	add $9, $0, $2
	
	addi $10, $0, 65
	slt $11, $8, $10
	bne $11, $0, false
		addi $11, $0, 1
		j fimnot1
		false:
		addi $11, $0, 0
		fimnot1:
	# pelo menos 65 anos -> $11 CONDI��O 1

	addi $10, $0, 40
	slt $12, $9, $10
	bne $12, $0, false2
		addi $12, $0, 1
		j fimnot2
		false2:
		addi $12, $0, 0
		fimnot2:
	# trabalhou pelo menos 40 anos -> $12 CONDI��O 2
	
	addi $10, $0, 60
	slt $13, $8, $10
	bne $13, $0, false3
		addi $13, $0, 1
		j fimnot3
		false3:
		addi $13, $0, 0
		fimnot3:
	# pelo menos 60 anos -> $13 e...
	
	addi $10, $0, 35
	slt $14, $10, $9	# trabalhou mais de 35
	
	and $15, $13, $14	# pelo menos 60 anos E trabalhou mais de 35 -> $15 CONDI��O 3
	
	or $16, $11, $12
	or $16, $16, $15
	bne $16, $0, aposentou
		add $4, $0, 'N'
		addi $2, $0, 11
		syscall
		j fimaposentou
		aposentou:
		add $4, $0, 'S'
		addi $2, $0, 11
		syscall
		fimaposentou:
	
	addi $2, $0, 10
	syscall
