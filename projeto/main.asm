.text
main:	add $t6, $0, $0		#$t6 - move para direita
	lui $t7, 0xffff		#$t7 - verificar input teclado
	add $s7, $0, $0		#$s7 - contador
	looptela:
	lui $t0, 0x1001		#$t0 - valor da UG atual
	addi $t1, $t0, 0x8000	#$t1 - comeco do cenario
	addi $s2, $t1, 0x36C00	#$s2 - comeco do meta
	add $t2, $t6, $t1	#$t2 - valor do dado grafico atual
	add $s3, $t6, $s2	#$s3 - valor atual do meta
	addi $t3, $0, 64	#$t3 - contador de linhas
	gerartela:
		addi $t4, $0, 128	#$t4 - contador de UG
		gerarlinha:
			lw $t5, 0($s3)	#$t5 - variavel que envia a cor
			addi $s4, $0, 3
			beq $t5, $s4, naotemmosntro
			bne $t5, $0, temmonstro
				naotemmosntro:
				lw $t5, 0($t2)
				j desenharcelula
				temmonstro:
				addi $s4, $0, 2
				slt $s4, $s4, $t5
				bne $s4, $0, desenharcelula
					addi $s4, $0, -2
					beq $t5, $s4, rodargumbaparadireita
					addi $s4, $0, 2
					beq $t5, $s4, rodargumbaparadireita
						jal gumbaparaesquerda
						lw $t5, 0($t2)
						j desenharcelula
						rodargumbaparadireita:
						jal gumbaparadireita
						lw $t5, 0($t2)
			desenharcelula:
			sw $t5, 0($t0)
			addi $t0, $t0, 4
			addi $t2, $t2, 4
			addi $s3, $s3, 4
			addi $t4, $t4, -1
			bne $t4, $0, gerarlinha
		addi $t1, $t1, 3504
		add $t2, $t6, $t1
		addi $s2, $s2, 3504
		add $s3, $t6, $s2
		addi $t3, $t3, -1
		bne $t3, $0, gerartela
	lw $s0, 0($t7)
	beq $s0, $0, ficarparado
	lw $s0, 4($t7)
      	addi $s1, $0, ' '
      	beq $s0, $s1, fim
	beq $t6, 2988, ficarparado
      	addi $s1, $0, 'd'
      	bne $s0, $s1, ficarparado
	addi $t6, $t6, 4
	ficarparado:
	addi $s7, $s7, 1
	j looptela
	fim:
	addi $v0, $0, 10
	syscall

# move o inimigo para a esquerda
# usado: $s2, $s3, $s4, $s5, $s6, $s7, $t8, $t9
# $s2 - inicio da linha atual do meta
# $s3 - valor atual do meta
# $s4, $s5, $t8, $t9 - registrador livre para ser manipulado
# $s6 - variavel que envia a cor dentro do modulo
# $s7 - contador
gumbaparaesquerda:
	sw $s3, 0($sp)		# salvando o $s3 pois será alterado

	addi $s4, $0, 2
	lw $s5, -16($s3)
	beq $s4, $s5, alternarparadir	# encostou em outro gumba
	addi $s4, $0, -2
	beq $s4, $s5, alternarparadir	# encostou em outro gumba
	addi $s4, $0, 1
	beq $s4, $s5, alternarparadir	# encostou em outro gumba

	sub $s4, $s3, $s2	# $s4 distancia do inicio da linha
	addi $s3, $s2, 21024
	add $s3, $s3, $s4	# $s3 é o endereço da ponta do pé direito
	lw $s6, -12($s3)	
	addi $s4, $0, 3
	lw $s3, 0($sp)
	beq $s6, $s4, alternarparadir	# encostou em algo
		addi $s4, $0, 8
		div $s7, $s4
		mfhi $s4
		bne $s4, $0, fimmovesq	# deixa o movimento mais lento
			addi $t9, $0, 6			# $t9 - número de linhas do gumba
			proxlinhaesq:
				addi $s4, $0, 4			# até onde vai em relação ao $t8
				addi $t8, $0, -12		# $t8 - variavel de manipulação de movimento
				movcelesq:
					add $s5, $s3, $t8
					lw $s6, 0($s5)
					sw $s6, -4($s5)
					addi $t8, $t8, 4
					bne $t8, $s4, movcelesq
					sw $0, 0($s5)		# preenchendo 0s a direita
					addi $t9, $t9, -1	# contador de linhas
					beq $t9, $0, fimmovesq
					sub $s4, $s3, $s2	# pegando distancia em relação a inicio da linha
					addi $s3, $s2, 3504	# indo para proxima linha
					add $s3, $s3, $s4	# indo para celula mais a direita do gumba para reiniciar ciclo
					j proxlinhaesq
		alternarparadir:
		addi $s4, $0, 2
		sw $s4, 0($s3)
	fimmovesq:
	lw $s3, 0($sp)
	jr $ra

# move o inimigo para a direita
# usado: $s3, $s4, $s5, $s6, $s7, $t8, $t9
# $s3 - valor atual do meta
# $s4, $s5, $t8, $t9 - registrador livre para ser manipulado
# $s6 - variavel que envia a cor dentro do modulo
# $s7 - contador
gumbaparadireita:
	sw $s3, 0($sp)		# salvando o $s3 pois será alterado
	
	addi $s4, $0, 1
	lw $s5, 20($s3)
	beq $s4, $s5, alternarparaesq	# encostou em outro gumba
	
	sub $s4, $s3, $s2	# $s4 distancia do inicio da linha
	addi $s3, $s2, 21024	# indo pro inicio da linha aonde está o pé do gumba
	add $s3, $s3, $s4	# $s3 é o endereço da ponta do pé direito
	lw $s6, 4($s3)
	addi $s4, $0, 3
	lw $s3, 0($sp)		# recupera valor de $s3
	beq $s6, $s4, alternarparaesq	# encostou em algo
		addi $s4, $0, 8
		div $s7, $s4
		mfhi $s4
		bne $s4, $0, fimmovdir	# deixa o movimento mais lento
		
			addi $s4, $0, -2
			lw $s5, 0($s3)
			beq $s5, $s4, por2
		
			addi $t9, $0, 6		# $t9 - número de linhas do gumba
			addi $s4, $0, -2
			sw $s4, 0($s3)		# fix - parar de se mover para direita sem parar
			proxlinhadir:
				addi $s4, $0, -20	# até onde vai em relação ao $t8
				addi $t8, $0, 0		# $t8 - variavel de manipulação de movimento
				movceldir:
					add $s5, $s3, $t8
					lw $s6, 0($s5)
					sw $s6, 4($s5)
					addi $t8, $t8, -4
					bne $t8, $s4, movceldir
					sw $0, 0($s5)		# preenchendo 0s a esquerda
				addi $t9, $t9, -1	# contador de linhas
				beq $t9, $0, fimmovdir
				sub $s4, $s3, $s2	# pegando distancia em relação a inicio da linha
				addi $s3, $s2, 3504	# indo para proxima linha
				add $s3, $s3, $s4	# indo para celula mais a direita do gumba para reiniciar ciclo
				j proxlinhadir
		por2:
		addi $s4, $0, 2
		sw $s4, 0($s3)
		j fimmovdir
		alternarparaesq:
		addi $s4, $0, 1
		sw $s4, 0($s3)
	fimmovdir:
	lw $s3, 0($sp)		# recupera valor de $s3
	jr $ra
	
	
	
