.text
main:	add $14, $0, $0		#$14 - move para direita
	lui $15, 0xffff		#$15 - verificar input teclado
	add $23, $0, $0		#$23 - contador
	looptela:
	lui $8, 0x1001		#$8 - valor da UG atual
	addi $9, $8, 0x8000	#$9 - comeco do cenario
	addi $18, $9, 0x36C00	#$18 - comeco do meta 
	add $10, $14, $9	#$10 - valor do dado grafico atual
	add $19, $14, $18	#$19 - valor atual do meta
	addi $11, $0, 64	#$11 - contador de linhas
	gerartela:
		addi $12, $0, 128	#$12 - contador de UG
		gerarlinha:
			lw $13, 0($19)	#$13 - variavel que envia a cor
			addi $20, $0, 3
			#beq $13, $20, naotemmosntro
			bne $13, $0, temmonstro
				naotemmosntro:
				lw $13, 0($10)
				j desenharcelula
				temmonstro:
				addi $20, $0, 2
				slt $20, $20, $13
				bne $20, $0, desenharcelula
					addi $20, $0, -2
					beq $13, $20, pausamovdir
					addi $20, $0, 2
					beq $13, $20, rodargumbaparadireita
						jal gumbaparaesquerda
						lw $13, 0($10)
						j desenharcelula
						rodargumbaparadireita:
						jal gumbaparadireita
						lw $13, 0($10)
						pausamovdir:
						addi $20, $0, 2
						sw $20, 0($19)
						lw $13, 0($10)
			desenharcelula:
			sw $13, 0($8)
			addi $8, $8, 4
			addi $10, $10, 4
			addi $19, $19, 4
			addi $12, $12, -1
			bne $12, $0, gerarlinha
		addi $9, $9, 3504
		add $10, $14, $9
		addi $18, $18, 3504
		add $19, $14, $18
		addi $11, $11, -1
		bne $11, $0, gerartela
	lw $16, 0($15)
	beq $16, $0, ficarparado
	lw $16, 4($15)
      	addi $17, $0, ' '
      	beq $16, $17, fim
	beq $14, 2988, ficarparado
      	addi $17, $0, 'd'
      	bne $16, $17, ficarparado
	addi $14, $14, 4
	ficarparado:
	addi $23, $23, 1
	j looptela
	fim:
	addi $2, $0, 10
	syscall

# move o inimigo para a esquerda
# usado: $19, $20, $21, $22, $23, $24, $25
gumbaparaesquerda:
	lw $22, -20($19)	# $22 variavel que envia a cor dentro do modulo
	addi $20, $0, 3
	beq $22, $20, alternarparadir	# encostou em algo
		addi $20, $0, 8
		div $23, $20
		mfhi $20
		bne $20, $0, terminarmovesquerda	# deixa o movimento mais lento
			addi $20, $0, 8			# até onde vai em relação ao $24
			addi $24, $0, -20		# $24 - variavel de manipulação de movimento
			addi $25, $0, 3
			movercelulaesq:
				add $21, $19, $24
				lw $22, -4($21)
				beq $22, $25, ignorar3esq	 # ignorar paredes
				lw $22, 0($21)
				sw $22, -4($21)
				ignorar3esq:
				addi $24, $24, 4
				bne $24, $20, movercelulaesq
				j terminarmovesquerda
		alternarparadir:
		addi $20, $0, 2
		sw $20, -20($19)
		sw $0, 0($19)
	terminarmovesquerda:
	jr $31

# move o inimigo para a direita
# usado: $19, $20, $21, $22, $23, $24, $25
gumbaparadireita:
	lw $22, 8($19)	# $22 variavel que envia a cor dentro do modulo
	addi $20, $0, 3
	beq $22, $20, alternarparaesq	# encostou em algo
		addi $20, $0, 8
		div $23, $20
		mfhi $20
		bne $20, $0, terminarmovdireita	# deixa o movimento mais lento
			addi $20, $0, -2
			sw $20, 0($19)		# fix - parar de se mover para direita sem parar
			addi $20, $0, -8	# até onde vai em relação ao $24
			addi $24, $0, 16	# $24 - variavel de manipulação de movimento
			moverceluladir:
				add $21, $19, $24
				lw $22, 0($21)
				sw $22, 4($21)
				addi $24, $24, -4
				bne $24, $20, moverceluladir
				j terminarmovdireita
		alternarparaesq:
		addi $20, $0, 1
		sw $20, 20($19)
		sw $0, 0($19)
	terminarmovdireita:
	jr $31
	
	
	
