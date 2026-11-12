.text
main:	lui $t7, 0xffff		# $t7 - verificar input teclado
	# GERAR TELA INICIAL
	lui $t0, 0x1001		# $t0 - valor da UG atual
	addi $t3, $0, 8192	# $t3 - contador de UGs da tela inicial
	geradortelainicial:
		lw $t5, 0($t0)
		sw $t5, 0($t0)
		addi $t0, $t0, 4
		addi $t3, $t3, -1
		bne $t3, $0, geradortelainicial
	aguardarenter:
	lw $s0, 0($t7)
	beq $s0, $0, aguardarenter
	lw $s0, 4($t7)
      	addi $s4, $0, '\n'
      	bne $s0, $s4, aguardarenter
	
	add $t6, $0, $0		# $t6 - move para direita a fase
	add $s7, $0, $0		# $s7 - contador
	add $s1, $0, $0		# $s1 - move o Mario
	add $s5, $0, $0		# $s5 - contador usado no pulo
	looptela:
	lui $t0, 0x1001		# $t0 - valor da UG atual
	addi $t1, $t0, 0x8000	# $t1 - comeco do cenario
	addi $s2, $t1, 0x36C00	# $s2 - comeco do meta
	add $t2, $t6, $t1	# $t2 - valor do dado grafico atual
	add $s3, $t6, $s2	# $s3 - valor atual do meta
	addi $t3, $0, 64	# $t3 - contador de linhas
	gerartela:
		addi $t4, $0, 128	# $t4 - contador de UG
		gerarlinha:
			lw $t5, 0($s3)	# $t5 - variavel que envia a cor
			addi $s4, $0, 3
			beq $t5, $s4, naotemmosntro
			addi $s4, $0, 4
			beq $t5, $s4, naotemmosntro
			addi $s4, $0, 7
			beq $t5, $s4, naotemmosntro
			bne $t5, $0, temmonstro
				lw $t5, 0($t2)
				j desenharcelula
				naotemmosntro:
				lw $t5, 0($t2)
				j desenharcelula
				temmonstro:
				addi $s4, $0, 6
				slt $s4, $s4, $t5
				bne $s4, $0, desenharcelula
					addi $s4, $0, -2
					beq $t5, $s4, rodargumbaparadireita
					addi $s4, $0, 2
					beq $t5, $s4, rodargumbaparadireita
					addi $s4, $0, 5
					beq $t5, $s4, rodargravidade
					addi $s4, $0, -5
					beq $t5, $s4, rodargravidade
					addi $s4, $0, 6
					beq $t5, $s4, rodargerarmario
					addi $s4, $0, -6
					beq $t5, $s4, rodargerarmario
						jal gumbaparaesquerda
						lw $t5, 0($t2)
						j desenharcelula
						rodargumbaparadireita:
						jal gumbaparadireita
						lw $t5, 0($t2)
						j desenharcelula
						rodargravidade:
						lw $t5, 0($t2)
						jal gravidade
						j desenharcelula
						rodargerarmario:
						lw $t5, 0($s3)
						jal gerarmario
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
      	addi $s4, $0, ' '
      	bne $s0, $s4, naopulou
      		bne $s5, $0, naopulou
      			addi $s5, $0, 20
      	naopulou:
	beq $t6, 2988, fim
      	addi $s4, $0, 'd'
      	bne $s0, $s4, ficarparado
	addi $s1, $s1, 4
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
	sw $s5, 0($sp)		# salvando o $s4 pois será alterado
	addi $sp, $sp, -4
	sw $s3, 0($sp)		# salvando o $s3 pois será alterado

	addi $s4, $0, 2
	lw $s5, -16($s3)
	beq $s4, $s5, alternarparadir	# encostou em outro gumba
	addi $s4, $0, -2
	beq $s4, $s5, alternarparadir	# encostou em outro gumba
	addi $s4, $0, 1
	beq $s4, $s5, alternarparadir	# encostou em outro gumba

	sub $s4, $s3, $s2	# $s4 distancia do inicio da linha
	addi $s3, $s2, 17520
	add $s3, $s3, $s4	# $s3 é o endereço da ponta do pé direito
	lw $s6, -16($s3)
	addi $s4, $0, 3
	lw $s3, 0($sp)
	beq $s6, $s4, alternarparadir	# fix para encostar no cano
	
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
	addi $sp, $sp, 4
	lw $s5, 0($sp)
	jr $ra

# move o inimigo para a direita
# usado: $s2, $s3, $s4, $s5, $s6, $s7, $t8, $t9
# $s2 - inicio da linha atual do meta
# $s3 - valor atual do meta
# $s4, $s5, $t8, $t9 - registrador livre para ser manipulado
# $s6 - variavel que envia a cor dentro do modulo
# $s7 - contador
gumbaparadireita:
	sw $s5, 0($sp)
	addi $sp, $sp, -4
	sw $s3, 0($sp)
	
	addi $s4, $0, 1
	lw $s5, 16($s3)
	beq $s4, $s5, alternarparaesq	# encostou em outro gumba
	addi $s4, $0, 2
	beq $s4, $s5, alternarparaesq	# encostou em outro gumba
	addi $s4, $0, -2
	beq $s4, $s5, alternarparaesq	# encostou em outro gumba
	
	sub $s4, $s3, $s2	# $s4 distancia do inicio da linha
	addi $s3, $s2, 17520	# indo pro inicio da linha aonde está o pé do gumba
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
			addi $s4, $0, -16	# até onde vai em relação ao $t8
			addi $t8, $0, 0		# $t8 - variavel de manipulação de movimento
			movceldir:
				add $s5, $s3, $t8
				lw $s6, 0($s5)
				sw $s6, 4($s5)
				addi $t8, $t8, -4
				bne $t8, $s4, movceldir
				sw $0, 0($s5)	# preenchendo 0s a esquerda
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
	addi $sp, $sp, 4
	lw $s5, 0($sp)
	jr $ra

# usado: $s3, $s4, $s2, $s6, $s5, $t8, $t9, $s7
# $s3 - valor atual do meta
# $s2 - inicio da linha atual do meta
# $s4, $s5, $t8, $t9  - registrador livre para ser manipulado
# $s6 - variavel que envia a cor dentro do modulo
# $s7 - contador
gravidade:
	sw $s5, 0($sp)
	addi $sp, $sp, -4
	sw $s3, 0($sp)		# salvando o $s3 pois será alterado
	
	# fix - parar de cair mmuito rapido
	addi $s4, $0, -5
	lw $s5, 0($s3)
	beq $s4, $s5, por5
	addi $s4, $0, -5
	sw $s4, 0($s3)

	addi $s3, $s3, 21028	# embaixo do pé direito
	lw $s6, 0($s3)
	addi $s4, $0, 4
	beq $s6, $s4, fimgrav	# ta no chao
	
	addi $t9, $0, 7
	proxlinhagrav:
		addi $s4, $0, -16		# até onde vai em relação ao $t8
		addi $t8, $0, 0			# $t8 - variavel de manipulação de movimento
			movcelgrav:
				add $s5, $s3, $t8
				lw $s6, -3504($s5)
				sw $s6, 0($s5)
				addi $t8, $t8, -4
				bne $t8, $s4, movcelgrav
		addi $s3, $s3, -3504
		addi $t9, $t9, -1
		bne $t9, $0, proxlinhagrav
		j fimgrav
	por5:
	addi $s4, $0, 5
	sw $s4, 0($s3)
	fimgrav:
	lw $s3, 0($sp)
	addi $sp, $sp, 4
	lw $s5, 0($sp)
	jr $ra

# põe mario na tela (move ele caso tenha se movido)
# usado: $s4, $s1, $s3, $s5, $t8, $s7, $t9, $t6
# $s1 - serve para verificar se a tela andou
# $s4, $t8, $t9 - registrador livre para ser manipulado
# $s3 - valor atual do meta
# $s7 - contador
# $t6 - move para direita
# $s5 - contador usado no pulo
gerarmario:
	sw $s3, 0($sp)		# salvando o $s3 pois será alterado
	
	addi $t9, $0, 7
	addi $s3, $s3, -3504
	lw $s4, 0($s3)
	bne $s4, $t9, verificarfrente
	lw $s4, -4($s3)
	bne $s4, $t9, verificarfrente
	lw $s4, -8($s3)
	bne $s4, $t9, verificarfrente
	lw $s4, -12($s3)
	bne $s4, $t9, verificarfrente
	add $s5, $0, $0
	
	verificarfrente:
	lw $s3, 0($sp)		# salvando o $s3 pois será alterado
	proxlinhaverificacao:
		addi $s3, $s3, 3504
		lw $s4, 4($s3)
		addi $t8, $0, 7
		beq $t8, $s4, verificarpulo
		addi $t8, $0, 4
		beq $t8, $s4, verificarpulo
		addi $t8, $0, 3
		beq $t8, $s4, verificarpulo
		bne $s4, $0, fim
		addi $t9, $t9, -1
		bne $t9, $0, proxlinhaverificacao
	addi $t8, $0, 7
	addi $s3, $s3, 3504
	lw $s4, 0($s3)
	slt $s4, $t8, $s4
	bne $s4, $0, fim
	lw $s4, -4($s3)
	slt $s4, $t8, $s4
	bne $s4, $0, fim
	lw $s4, -8($s3)
	slt $s4, $t8, $s4
	bne $s4, $0, fim
	lw $s4, -12($s3)
	slt $s4, $t8, $s4
	bne $s4, $0, fim

	beq $s1, $t6, verificarpulo
	add $t6, $0, $s1

	lw $s3, 0($sp)		# recupera valor de $s3

	addi $t9, $0, 8
	proxlinhamariodir:
		addi $t8, $0, 5
		proxcelmariodir:
			lw $s4, 0($s3)
			sw $s4, 4($s3)
			addi $s3, $s3, -4
			addi $t8, $t8, -1
			bne $t8, $0, proxcelmariodir
			sw $0, 0($s3)
		addi $s3, $s3, 3524
		addi $t9, $t9, -1
		bne $t9, $0, proxlinhamariodir
	
	lw $s3, 0($sp)		# recupera valor de $s3
	addi $s4, $0, 8
	div $s1, $s4
	mfhi $s4
	beq $s4, $0, clarearpedireito
		addi $s3, $s3, 21024
		addi $s4, $0, 0xff0000
		sw $s4, -4($s3)
		addi $s4, $0, 0xd82800
		sw $s4, 0($s3)
		addi $s3, $s3, 3504
		addi $s4, $0, 0x515151
		sw $s4, -4($s3)
		addi $s4, $0, 0x010101
		sw $s4, 0($s3)
		j fimgerarmario
		clarearpedireito:
		addi $s3, $s3, 21024
		addi $s4, $0, 0xff0000
		sw $s4, 0($s3)
		addi $s4, $0, 0xd82800
		sw $s4, -4($s3)
		addi $s3, $s3, 3504
		addi $s4, $0, 0x515151
		sw $s4, 0($s3)
		addi $s4, $0, 0x010101
		sw $s4, -4($s3)
	j fimgerarmario
	
	verificarpulo:
	lw $s3, 0($sp)		# recupera valor de $s3
	addi $t9, $0, 4		# 4 é piso
	addi $s3, $s3, 28032
	lw $t8, 0($s3)
	beq $t9, $t8, podepular
	lw $t8, -4($s3)
	beq $t9, $t8, podepular
	lw $t8, -8($s3)
	beq $t9, $t8, podepular
	lw $t8, -12($s3)
	beq $t9, $t8, podepular
		addi $t9, $0, 20
		beq $s5, $t9, naopodepular
	podepular:
	beq $s5, $0, gravidademario
		lw $s3, 0($sp)		# recupera valor de $s3
		addi $t9, $0, 8
		proxlinhamariopulo:
			addi $t8, $0, 5
			proxcelmariopulo:
				lw $s4, 0($s3)
				sw $s4, -3504($s3)
				sw $0, 0($s3)
				addi $s3, $s3, -4
				addi $t8, $t8, -1
				bne $t8, $0, proxcelmariopulo
			addi $s3, $s3, 3524
			addi $t9, $t9, -1
			bne $t9, $0, proxlinhamariopulo
		addi $s5, $s5, -1
		j fimgerarmario
	naopodepular:
		add $s5, $0, $0
	gravidademario:
		lw $s3, 0($sp)		# recupera valor de $s3
		lw $t9, 0($s3)
		addi $t8, $0, -6
		beq $t9, $t8, por6
		sw $t8, 0($s3)
		
		addi $t9, $0, 4		# 4 é piso
		addi $s3, $s3, 28032
		lw $t8, 0($s3)
		beq $t9, $t8, estanochao
		lw $t8, -4($s3)
		beq $t9, $t8, estanochao
		lw $t8, -8($s3)
		beq $t9, $t8, estanochao
		lw $t8, -12($s3)
		beq $t9, $t8, estanochao
			lw $s3, 0($sp)		# recupera valor de $s3
			addi $s3, $s3, 24528
			addi $t9, $0, 8
			proxlinhamariograv:
				lw $s4, 0($s3)
				sw $s4, 3504($s3)
				sw $0, 0($s3)
				lw $s4, -4($s3)
				sw $s4, 3500($s3)
				sw $0, -4($s3)
				lw $s4, -8($s3)
				sw $s4, 3496($s3)
				sw $0, -8($s3)
				lw $s4, -12($s3)
				sw $s4, 3492($s3)
				sw $0, -12($s3)
				addi $s3, $s3, -3504
				addi $t9, $t9, -1
				bne $t9, $0, proxlinhamariograv
		j fimgerarmario
	estanochao:
	add $s5, $0, $0
	j fimgerarmario
	por6:
	addi $t8, $0, 6
	sw $t8, 0($s3)
	fimgerarmario:
	lw $s3, 0($sp)		# recupera valor de $s3
	jr $ra
