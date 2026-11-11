# 0 -> nada
# 1 -> movimenta o gumba para a esquerda
# 2 -> movimenta o gumba para a direita
# 3 -> paredes
# 4 -> piso
# 5 -> gravidade
# 6 -> referencia para localizar Mario

def col_de_numero(coluna, linha_inferior, tamanho, numero):
    for i in range(tamanho):
        data[linha_inferior - i - 1][coluna - 1] = numero

def numero_em_celular(linha, coluna, numero):
    data[linha - 1][coluna - 1] = numero

def preencher_linha(linha, coluna_inicial, tamanho, cor):
    for i in range(tamanho):
        data[linha - 1][coluna_inicial - 1 + i] = cor

def gerar_gumba(coluna_inicial, linha_inferior):
    preto = "0x010101"
    marrom_claro = "0xf5c2b9"
    marrom_escuro = "0x9b5c27"

    preencher_linha(linha_inferior, coluna_inicial, 4, preto)
    preencher_linha(linha_inferior - 1, coluna_inicial + 1, 2, marrom_claro)
    preencher_linha(linha_inferior - 2, coluna_inicial, 4, marrom_escuro)
    preencher_linha(linha_inferior - 3, coluna_inicial, 4, marrom_escuro)
    preencher_linha(linha_inferior - 4, coluna_inicial + 1, 2, marrom_escuro)
    preencher_linha(linha_inferior - 5, coluna_inicial + 3, 1, 1)
    preencher_linha(linha_inferior - 5, coluna_inicial + 2, 1, 5)

def gerar_mario(coluna_inicial, linha_inferior):
    vermelho = "0xd82800"
    # vermelho_claro = "0xff0000"
    pele = "0xdeb79d"
    roupa = "0x887000"
    bota = "0x010101"
    # bota_clara = "0x515151"

    preencher_linha(linha_inferior, coluna_inicial + 1, 1, bota)
    preencher_linha(linha_inferior, coluna_inicial + 2, 1, bota)
    preencher_linha(linha_inferior - 1, coluna_inicial + 1, 1, vermelho)
    preencher_linha(linha_inferior - 1, coluna_inicial + 2, 1, vermelho)

    preencher_linha(linha_inferior - 2, coluna_inicial, 1, pele)
    preencher_linha(linha_inferior - 2, coluna_inicial + 1, 2, vermelho)
    preencher_linha(linha_inferior - 2, coluna_inicial + 3, 1, pele)

    preencher_linha(linha_inferior - 3, coluna_inicial, 1, roupa)
    preencher_linha(linha_inferior - 3, coluna_inicial + 1, 2, vermelho)
    preencher_linha(linha_inferior - 3, coluna_inicial + 3, 1, roupa)

    preencher_linha(linha_inferior - 4, coluna_inicial + 1, 2, pele)
    preencher_linha(linha_inferior - 5, coluna_inicial + 1, 3, vermelho)
    preencher_linha(linha_inferior - 6, coluna_inicial + 1, 2, vermelho)
    preencher_linha(linha_inferior - 7, coluna_inicial + 3, 1, 6)

def cano(linha_sup, coluna_esq):
    col_de_numero(coluna_esq, linha_sup + 3, 4, 3)
    col_de_numero(coluna_esq + 8, linha_sup + 3, 4, 3)

    linha_atual = linha_sup + 4
    while linha_atual < 56:
        numero_em_celular(linha_atual, coluna_esq + 1, 3)
        numero_em_celular(linha_atual, coluna_esq + 7, 3)
        linha_atual += 1

def piso(linha, coluna_inicial, tamanho):
    preencher_linha(linha, coluna_inicial, tamanho, 4)

data = [[0 for _ in range(876)] for _ in range(64)]

gerar_mario(55, 55)

gerar_gumba(94, 55)
gerar_gumba(171, 55)
gerar_gumba(216, 55)
gerar_gumba(222, 55)
gerar_gumba(338, 21)
gerar_gumba(346, 21)
gerar_gumba(410, 55)
gerar_gumba(416, 55)
gerar_gumba(481, 55)
gerar_gumba(487, 55)
gerar_gumba(523, 55)
gerar_gumba(530, 55)
gerar_gumba(540, 55)
gerar_gumba(546, 55)
gerar_gumba(734, 55)
gerar_gumba(740, 55)

cano(48, 119)
cano(44, 161)
cano(40, 195)
cano(40, 241)
cano(48, 688)
cano(48, 755)

piso(56, 1, 291)
piso(56, 300, 63)
piso(56, 376, 269)
piso(56, 654, 222)
piso(22, 340, 30)
piso(39, 325, 15)

with open("meta.asm", "w", encoding="utf-8") as arquivo:
    arquivo.write(".data 0x1004EC00\n")
    for linha in data:
        arquivo.write(".word")
        for celula in linha:
            arquivo.write(f" {celula}")
        arquivo.write("\n")