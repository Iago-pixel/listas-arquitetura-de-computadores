# 0 -> nada
# 1 -> movimenta o gumba para a esquerda
# 2 -> movimenta o gumba para a direita
# 3 -> paredes

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
    col_de_numero(coluna_inicial + 4, linha_inferior, 5, 1)

def cano(linha_sup, coluna_esq):
    #for i in range(4):
        #preencher_linha(linha_sup + i, coluna_esq, 8, cor)
    col_de_numero(coluna_esq, linha_sup + 3, 4, 3)
    col_de_numero(coluna_esq + 8, linha_sup + 3, 4, 3)

    linha_atual = linha_sup + 4
    while linha_atual < 65:
        #preencher_linha(linha_atual, coluna_esq + 1, 6, cor)
        numero_em_celular(linha_atual, coluna_esq + 1, 3)
        numero_em_celular(linha_atual, coluna_esq + 7, 3)
        linha_atual += 1


data = [["0" for _ in range(876)] for _ in range(64)]

gerar_gumba(94, 55)
gerar_gumba(171, 55)
gerar_gumba(216, 55)
cano(48, 119)
cano(44, 161)
cano(40, 195)
cano(40, 241)

with open("meta.asm", "w", encoding="utf-8") as arquivo:
    arquivo.write(".data 0x1004EC00\n")
    for linha in data:
        arquivo.write(".word")
        for celula in linha:
            arquivo.write(f" {celula}")
        arquivo.write("\n")