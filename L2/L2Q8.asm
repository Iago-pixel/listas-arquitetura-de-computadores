.text
main:	addi $2, $0, 5
	syscall
	add $8, $0, $2	# <- dia
	
	addi $2, $0, 5
	syscall
	add $9, $0, $2	# <- mes
	
	addi $2, $0, 5
	syscall
	add $10, $0, $2	# <- ano
	
	addi $12, $0, 13
	slt $11, $9, $12
	beq $11, $0, fim	# <- mes > 12!
	
	addi $12, $0, 0
	slt $11, $12, $9
	beq $11, $0, fim	# <- mes < 1!
	
	addi $12, $0, 0
	slt $11, $12, $8
	beq $11, $0, fim	# <- dia < 1!
	
	addi $12, $0, 32
	slt $11, $8, $12
	beq $11, $0, fim	# <- dia > 31!
	
	addi $11, $0, 1		# <- $11 devine se a data é valida!
	
	addi $12, $0, 31
	
	addi $13, $0, 4
	beq $9, $13, mesde30dias
	addi $13, $0, 6
	beq $9, $13, mesde30dias
	addi $13, $0, 9
	beq $9, $13, mesde30dias
	addi $13, $0, 11
	beq $9, $13, mesde30dias
		j outrosmeses
		mesde30dias:
		slt $11, $8, $12
		beq $11, $0, fim	# <- mes de 30 dias com mes > 30!
		outrosmeses:
	addi $13, $0, 2
	beq $9, $13, fevereiro
		j fim
		fevereiro:
		addi $12, $0, 30
		slt $11, $8, $12
		beq $11, $0, fim	# <- fevereiro > 29 dias!
		addi $12, $0, 4
		div $10, $12
		mfhi $12
		beq $12, $0, anodiv4	# <- ano divisivel por 4
			j anonaobissexto
			anodiv4:
			addi $12, $0, 100
			div $10, $12
			mfhi $12
			beq $12, $0, anodiv100	# <- ano divisivel por 100
				j fim
				anodiv100:
				addi $12, $0, 400
				div $10, $12
				mfhi $12
				beq $12, $0, fim	# <- ano bissexto!
					anonaobissexto:
					addi $12, $0, 29
					slt $11, $8, $12
					beq $11, $0, fim	# <- fevereiro nao bissexto > 28 dias!
	fim:
	bne $11, $0, valida
		addi $4, $0, 'i'
		addi $2, $0, 11
		syscall
		addi $4, $0, 'n'
		addi $2, $0, 11
		syscall
		valida:
		addi $4, $0, 'v'
		addi $2, $0, 11
		syscall
		addi $4, $0, 'a'
		addi $2, $0, 11
		syscall
		addi $4, $0, 'l'
		addi $2, $0, 11
		syscall
		addi $4, $0, 'i'
		addi $2, $0, 11
		syscall
		addi $4, $0, 'd'
		addi $2, $0, 11
		syscall
		addi $4, $0, 'a'
		addi $2, $0, 11
		syscall

	addi $2, $0, 10
	syscall