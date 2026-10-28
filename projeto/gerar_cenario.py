def preencher_linha(linha, coluna_inicial, tamanho, cor):
    for i in range(tamanho):
        data[linha - 1][coluna_inicial - 1 + i] = cor

def formato_nuvem(linha_sup, coluna_esq, cor, qtd=1):
    for i in range(qtd):
        preencher_linha(linha_sup, coluna_esq + 3 + i*5, 2, cor)
        preencher_linha(linha_sup + 1, coluna_esq + 2 + i*5, 4, cor)
        preencher_linha(linha_sup + 2, coluna_esq + 1 + i*5, 6, cor)
        preencher_linha(linha_sup + 3, coluna_esq + i*5, 8, cor)
        preencher_linha(linha_sup + 4, coluna_esq + 1 + i*5, 7, cor)
        preencher_linha(linha_sup + 5, coluna_esq + 2 + i*5, 5, cor)

def montanha(linha_sup, coluna_esq):
    cor = "0x1b791f"
    preencher_linha(linha_sup, coluna_esq + 10, 3, cor)
    for i in range(1, 10):
        preencher_linha(linha_sup + i, coluna_esq + 10 - i, 3 + i*2, cor)
        preencher_linha(linha_sup + i, coluna_esq + 10 - i, 3 + i*2, cor)
        preencher_linha(linha_sup + i, coluna_esq + 10 - i, 3 + i*2, cor)
        preencher_linha(linha_sup + i, coluna_esq + 10 - i, 3 + i*2, cor)
        preencher_linha(linha_sup + i, coluna_esq + 10 - i, 3 + i*2, cor)
        preencher_linha(linha_sup + i, coluna_esq + 10 - i, 3 + i*2, cor)
        preencher_linha(linha_sup + i, coluna_esq + 10 - i, 3 + i*2, cor)
        preencher_linha(linha_sup + i, coluna_esq + 10 - i, 3 + i*2, cor)
        preencher_linha(linha_sup + i, coluna_esq + 10 - i, 3 + i*2, cor)

def cano(linha_sup, coluna_esq):
    cor = "0x4cb700"
    for i in range(4):
        preencher_linha(linha_sup + i, coluna_esq, 8, cor)
    linha_atual = linha_sup + 4
    while linha_atual < 65:
        preencher_linha(linha_atual, coluna_esq + 1, 6, cor)
        linha_atual += 1

def chao(coluna_inicial, tamanho):
    for i in range(9):
        preencher_linha(56 + i, coluna_inicial, tamanho, "0x8b4f16")

def cubo(linha_sup, coluna_esq, cor, qtd=1):
    for i in range(qtd):
        for j in range(4):
                preencher_linha(linha_sup + j, coluna_esq + i*5, 5, cor)

def escada(coluna_inicial, degrais, invertida=False, final_duplicado=False):
    linha = 52
    coluna = coluna_inicial
    cor = "0xa55d17"
    qtd = degrais
    if final_duplicado:
        qtd += 1
    for _ in range(degrais):
        cubo(linha, coluna, cor, qtd)
        linha -= 4
        if not invertida:
            coluna += 5
        qtd -= 1

data = [["0x009290ff" for _ in range(876)] for _ in range(64)]

formato_nuvem(51, 49, "0x0d9300", 3)
formato_nuvem(51, 100, "0x0d9300")
formato_nuvem(51, 176, "0x0d9300", 2)
formato_nuvem(51, 252, "0x0d9300", 3)
formato_nuvem(51, 302, "0x0d9300")
formato_nuvem(51, 302, "0x0d9300")
formato_nuvem(51, 378, "0x0d9300", 2)
formato_nuvem(51, 454, "0x0d9300", 3)
formato_nuvem(51, 454, "0x0d9300", 3)
formato_nuvem(51, 504, "0x0d9300")
formato_nuvem(51, 582, "0x0d9300", 2)
formato_nuvem(51, 706, "0x0d9300")

montanha(47, 1)
montanha(51, 68)
montanha(47, 203)
montanha(51, 270)
montanha(47, 405)
montanha(51, 473)
montanha(47, 607)
montanha(51, 675)
montanha(47, 807)

cano(48, 119)
cano(44, 161)
cano(40, 195)
cano(40, 241)
cano(48, 688)
cano(48, 755)

chao(1, 291)
chao(300, 63)
chao(376, 269)
chao(654, 222)

formato_nuvem(14, 37, "0x00ffffff")
formato_nuvem(10, 65, "0x00ffffff")
formato_nuvem(14, 117, "0x00ffffff", 3)
formato_nuvem(10, 155, "0x00ffffff", 2)
formato_nuvem(10, 239, "0x00ffffff")
formato_nuvem(10, 285, "0x00ffffff")
formato_nuvem(14, 319, "0x00ffffff", 3)
formato_nuvem(10, 357, "0x00ffffff", 2)
formato_nuvem(14, 441, "0x00ffffff")
formato_nuvem(10, 487, "0x00ffffff")
formato_nuvem(14, 521, "0x00ffffff", 3)
formato_nuvem(10, 559, "0x00ffffff", 2)
formato_nuvem(14, 643, "0x00ffffff")
formato_nuvem(10, 689, "0x00ffffff")
formato_nuvem(14, 723, "0x00ffffff", 3)
formato_nuvem(10, 761, "0x00ffffff", 2)
formato_nuvem(14, 845, "0x00ffffff")

cubo(39, 68, "0xcb996f")
cubo(39, 85, "0x9f5303")
cubo(39, 90, "0xcb996f")
cubo(39, 95, "0x9f5303")
cubo(39, 100, "0xcb996f")
cubo(39, 105, "0x9f5303")
cubo(22, 95, "0xcb996f")
cubo(35, 271, "0xcb996f")
cubo(39, 325, "0x9f5303")
cubo(39, 330, "0xcb996f")
cubo(39, 335, "0x9f5303")
cubo(22, 340, "0x9f5303", 6)
cubo(22, 384, "0x9f5303", 3)
cubo(22, 399, "0xcb996f")
cubo(39, 399, "0x9f5303")
cubo(39, 422, "0x9f5303", 2)
cubo(39, 447, "0xcb996f")
cubo(39, 460, "0xcb996f")
cubo(22, 460, "0xcb996f")
cubo(39, 473, "0xcb996f")
cubo(39, 498, "0x9f5303")
cubo(22, 511, "0x9f5303", 3)
cubo(22, 540, "0x9f5303")
cubo(22, 545, "0xcb996f", 2)
cubo(22, 555, "0x9f5303")
cubo(39, 545, "0x9f5303", 2)
cubo(39, 709, "0x9f5303", 2)
cubo(39, 719, "0xcb996f")
cubo(39, 724, "0x9f5303")

escada(562, 4)
escada(594, 4, invertida=True)
escada(620, 4, final_duplicado=True)
escada(654, 4, invertida=True)
escada(763, 8, final_duplicado=True)
escada(835, 1)

with open("cenario.asm", "w", encoding="utf-8") as arquivo:
    arquivo.write(".data 0x10018000\n")
    for linha in data:
        arquivo.write(".word")
        for celula in linha:
            arquivo.write(f" {celula}")
        arquivo.write("\n")
