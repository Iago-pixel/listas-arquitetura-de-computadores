def preencher_linha(linha, coluna_inicial, tamanho, cor):
    for i in range(tamanho):
        data[linha - 1][coluna_inicial - 1 + i] = cor

def preencher_coluna(coluna, linha_inicial, tamanho, cor):
    for i in range(tamanho):
        data[linha_inicial - 1 + i][coluna - 1] = cor

def preencher_em_celular(linha, coluna, cor):
    data[linha - 1][coluna - 1] = cor

def a(linha_inferior, coluna_esq):
    preencher_linha(linha_inferior - 4, coluna_esq, 3, "0xffffff")
    preencher_linha(linha_inferior - 2, coluna_esq, 3, "0xffffff")
    preencher_coluna(coluna_esq, linha_inferior - 3, 4, "0xffffff")
    preencher_coluna(coluna_esq + 2, linha_inferior - 3, 4, "0xffffff")

def b(linha_inferior, coluna_esq):
    preencher_linha(linha_inferior - 4, coluna_esq, 2, "0xffffff")
    preencher_linha(linha_inferior - 2, coluna_esq, 3, "0xffffff")
    preencher_linha(linha_inferior, coluna_esq, 2, "0xffffff")
    preencher_coluna(coluna_esq, linha_inferior - 3, 4, "0xffffff")
    preencher_coluna(coluna_esq + 2, linha_inferior - 3, 3, "0xffffff")

def c(linha_inferior, coluna_esq):
    preencher_linha(linha_inferior - 4, coluna_esq, 3, "0xffffff")
    preencher_coluna(coluna_esq, linha_inferior - 3, 4, "0xffffff")
    preencher_linha(linha_inferior, coluna_esq, 3, "0xffffff")

def d(linha_inferior, coluna_esq):
    preencher_linha(linha_inferior - 4, coluna_esq, 2, "0xffffff")
    preencher_coluna(coluna_esq, linha_inferior - 3, 4, "0xffffff")
    preencher_linha(linha_inferior, coluna_esq, 2, "0xffffff")
    preencher_coluna(coluna_esq + 2, linha_inferior - 3, 3, "0xffffff")

def e(linha_inferior, coluna_esq):
    preencher_linha(linha_inferior - 4, coluna_esq, 3, "0xffffff")
    preencher_linha(linha_inferior - 2, coluna_esq, 3, "0xffffff")
    preencher_linha(linha_inferior, coluna_esq, 3, "0xffffff")
    preencher_coluna(coluna_esq, linha_inferior - 3, 4, "0xffffff")

def g(linha_inferior, coluna_esq):
    preencher_linha(linha_inferior - 4, coluna_esq, 3, "0xffffff")
    preencher_coluna(coluna_esq, linha_inferior - 3, 4, "0xffffff")
    preencher_linha(linha_inferior, coluna_esq, 3, "0xffffff")
    preencher_coluna(coluna_esq + 2, linha_inferior - 2, 2, "0xffffff")

def i(linha_inferior, coluna_esq):
    preencher_coluna(coluna_esq, linha_inferior - 4, 5, "0xffffff")

def l (linha_inferior, coluna_esq):
    preencher_coluna(coluna_esq, linha_inferior - 4, 5, "0xffffff")
    preencher_linha(linha_inferior, coluna_esq, 3, "0xffffff")

def n(linha_inferior, coluna_esq):
    preencher_linha(linha_inferior - 4, coluna_esq, 3, "0xffffff")
    preencher_coluna(coluna_esq, linha_inferior - 3, 4, "0xffffff")
    preencher_coluna(coluna_esq + 2, linha_inferior - 3, 4, "0xffffff")

def o(linha_inferior, coluna_esq):
    preencher_linha(linha_inferior - 4, coluna_esq, 3, "0xffffff")
    preencher_coluna(coluna_esq, linha_inferior - 3, 4, "0xffffff")
    preencher_linha(linha_inferior, coluna_esq, 3, "0xffffff")
    preencher_coluna(coluna_esq + 2, linha_inferior - 3, 4, "0xffffff")

def t(linha_inferior, coluna_esq):
    preencher_linha(linha_inferior - 4, coluna_esq, 3, "0xffffff")
    preencher_coluna(coluna_esq + 1, linha_inferior - 3, 4, "0xffffff")

def s(linha_inferior, coluna_esq):
    preencher_linha(linha_inferior - 4, coluna_esq, 3, "0xffffff")
    preencher_coluna(coluna_esq, linha_inferior - 4, 2, "0xffffff")
    preencher_linha(linha_inferior - 2, coluna_esq, 3, "0xffffff")
    preencher_coluna(coluna_esq + 2, linha_inferior - 1, 2, "0xffffff")
    preencher_linha(linha_inferior, coluna_esq, 3, "0xffffff")

def r(linha_inferior, coluna_esq):
    preencher_linha(linha_inferior - 4, coluna_esq, 3, "0xffffff")
    preencher_coluna(coluna_esq, linha_inferior - 3, 4, "0xffffff")
    preencher_coluna(coluna_esq + 2, linha_inferior - 4, 3, "0xffffff")
    preencher_linha(linha_inferior - 2, coluna_esq, 3, "0xffffff")
    preencher_em_celular(linha_inferior - 1, coluna_esq + 1, "0xffffff")
    preencher_em_celular(linha_inferior, coluna_esq + 2, "0xffffff")


def v(linha_inferior, coluna_esq):
    preencher_coluna(coluna_esq, linha_inferior - 4, 5, "0xffffff")
    preencher_linha(linha_inferior, coluna_esq, 3, "0xffffff")
    preencher_coluna(coluna_esq + 2, linha_inferior - 4, 5, "0xffffff")

def u(linha_inferior, coluna_esq):
    preencher_coluna(coluna_esq, linha_inferior - 4, 5, "0xffffff")
    preencher_linha(linha_inferior, coluna_esq, 3, "0xffffff")
    preencher_coluna(coluna_esq + 2, linha_inferior - 4, 5, "0xffffff")


data = [["0x009290ff" for _ in range(128)] for _ in range(64)]

i(10, 10)
a(10, 12)
g(10, 16)
o(10, 20)

v(10, 26)
i(10, 30)
n(10, 32)
i(10, 36)
c(10, 38)
i(10, 42)
u(10, 44)
s(10, 48)

t(10, -24)
a(10, -20)
d(10, -16)
s(10, -12)

b(-10, 10)
r(-10, 14)
a(-10, 18)
u(-10, 22)
l(-10, 26)
i(-10, 30)
o(-10, 32)

e(35, 55)
n(35, 59)
t(35, 63)
e(35, 67)
r(35, 71)

with open("tela_inicial.asm", "w", encoding="utf-8") as arquivo:
    arquivo.write(".data 0x10010000\n")
    for linha in data:
        arquivo.write(".word")
        for celula in linha:
            arquivo.write(f" {celula}")
        arquivo.write("\n")