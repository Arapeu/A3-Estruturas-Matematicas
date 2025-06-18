# A3-Estruturas-Matematicas

# 📊 Simulador de Cadeias de Markov em Julia

Este projeto simula o comportamento de Cadeias de Markov com entradas interativas, desenvolvido em Julia. O usuário define a matriz de transição e a distribuição inicial dos estados, e o sistema calcula a evolução da distribuição ao longo de várias iterações.

---

## 🚀 Funcionalidades

- Leitura interativa da matriz de transição com validação automática;
- Entrada da distribuição inicial com ajuste automático da última probabilidade;
- Simulação por N iterações;
- Exibição da evolução das distribuições e do resultado final.

---

## 🧰 Requisitos

- [Julia](https://julialang.org/downloads/) versão **1.6 ou superior**;
- Nenhum pacote externo necessário (usa apenas `LinearAlgebra` da biblioteca padrão).

---

## 🧪 Verificando a versão do Julia

Para garantir que você está usando uma versão compatível, execute no terminal ou REPL:

```julia
versioninfo()
```

Você deve ver algo como:

```
Julia Version 1.11.5
Platform Info:
  OS: Windows (x86_64)
  CPU: 12th Gen Intel(R) Core(TM) i5-12450H
  ...
```

Este projeto é compatível com Julia **1.6 ou superior**.

---

## ▶️ Como executar o projeto

### ✅ Opção 1: Modo Interativo (REPL do Julia)

1. **Abra o terminal** (Prompt de Comando, PowerShell ou Terminal do VS Code).

2. **Navegue até a pasta onde está salvo o projeto** utilizando o comando `cd`.  
   Exemplo, se seu projeto está em `C:\Git\Trabalho-Estruturas-Matematicas`, digite:

```powershell
cd C:\Git\Trabalho-Estruturas-Matematicas
```

> 🔎 **Dica:** você pode digitar `cd ` e depois **arrastar a pasta** para o terminal, que o caminho será preenchido automaticamente.

3. **Inicie o interpretador Julia:**

```powershell
julia
```

Você verá algo como:

```
               _
   _       _ _(_)_     |  Documentation: https://docs.julialang.org
  (_)     | (_) (_)    |
   _ _   _| |_  __ _   |  Type "?" for help, "]?" for Pkg help.
  | | | | | | |/ _` |  |
  | | |_| | | | (_| |  |  Version 1.X.X
 _/ |\__'_|_|_|\__'_|  |  Official https://julialang.org/ release
|__/                   |
```

4. **No REPL do Julia, rode o script com:**

```julia
include("cadeia_markov.jl")
```

Isso executará o programa, iniciando a simulação passo a passo no terminal.

---

### ✅ Opção 2: Execução direta fora do REPL

Se preferir executar tudo de uma vez no terminal (sem entrar no REPL), use:

```powershell
julia cadeia_markov.jl
```

> 💡 Esse comando deve ser executado **fora** do REPL (direto no terminal).

---

## 💡 Exemplo de uso

### Entrada:
```
Digite o tamanho da matriz de transição (ex: 3 para matriz 3x3): 3

Linha 1 (digite 3 valores separados por espaço):
0.9 0.075 0.025

Linha 2 (digite 3 valores separados por espaço):
0.15 0.8 0.05

Linha 3 (digite 3 valores separados por espaço):
0.25 0.25 0.5

Probabilidade do Estado 1 (0-1): 0
Probabilidade do Estado 2 (0-1): 1
Probabilidade do Estado 3 (automático): 0.0

Número de iterações (padrão 100): 3
```

### Saída esperada:
```
Interação 1: Estado 1 = 0.15, Estado 2 = 0.8, Estado 3 = 0.05
Interação 2: Estado 1 = 0.2225, Estado 2 = 0.735, Estado 3 = 0.0425
Interação 3: Estado 1 = 0.283375, Estado 2 = 0.674125, Estado 3 = 0.0425

Distribuição Final:
Probabilidade do Estado 1: 28.3375%
Probabilidade do Estado 2: 67.4125%
Probabilidade do Estado 3: 4.25%
```

---

## ❗ Erros Comuns

### ❌ `extra tokens after end of expression`
Esse erro ocorre quando você tenta rodar:

```julia
julia cadeia_markov.jl
```

**dentro** do REPL. Isso não é permitido.

✅ **Solução:**  
- No REPL, use: `include("cadeia_markov.jl")`  
- No terminal (fora do REPL), use: `julia cadeia_markov.jl`


