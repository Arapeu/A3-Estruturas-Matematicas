using LinearAlgebra

mutable struct CadeiaMarkov
    matriz_transicao::Matrix{Float64}
    distribuicao_atual::Matrix{Float64}
    tamanho_matriz::Int

    function CadeiaMarkov(matriz_transicao::Matrix{Float64}, distribuicao_inicial::Matrix{Float64})
        n = size(matriz_transicao, 1)
        new(matriz_transicao, distribuicao_inicial, n)
    end
end



function ler_probabilidade_valida(mensagem)
    while true
        try
            print(mensagem)
            valor = parse(Float64, readline())
            if 0 ≤ valor ≤ 1
                return valor
            end
            println("Valor deve estar entre 0 e 1!")
        catch e
            if isa(e, ArgumentError)
                println("Digite um número válido!")
            else
                rethrow(e)
            end
        end
    end
end



function executar_simulacao(cadeia:: CadeiaMarkov, num_interacoes::Int)
    println("\nResultados da Simulação:")

    for passo in 1:num_interacoes
        cadeia.distribuicao_atual = cadeia.distribuicao_atual * cadeia.matriz_transicao

        num_estados = size(cadeia.distribuicao_atual, 2)
        resultado = join(["Estado $j = $(round(cadeia.distribuicao_atual[1, j], digits=6))" for j in 1:num_estados], ", ")
        println("Interação $passo: $resultado")
    end

    println("\nDistribuição Final:")
    for j in 1:size(cadeia.distribuicao_atual, 2)
        probabilidade = cadeia.distribuicao_atual[1, j]
        println("Probabilidade do Estado $j: $(round(probabilidade * 100, digits=6))%")
    end
end


function ler_matriz_transicao(n::Int)::Matrix{Float64}
    println("\nDefina as probabilidades da matriz de transição por linhas (cada linha deve somar 1):")
    matriz = zeros(n, n)

    for i in 1:n
        linha_valida = false
        while !linha_valida
            println("Linha $i (digite $n valores separados por espaço): ")
            entrada = readline()
            try
                valores = parse.(Float64, split(entrada))
                if length(valores) != n
                    println("A linha deve ter exatamente $n valores.")
                    continue
                end
                if !isapprox(sum(valores), 1.0; atol=1e-6)
                    println("A soma dos valores da linha deve ser 1.")
                    continue
                end
                matriz[i, :] = valores
                linha_valida = true
            catch
                println("Entrada inválida. Tente novamente.")
            end
        end
    end

    return matriz
end



function executar_simulacao_cadeia_markov()
    try
        println("Simulação de Cadeia de Markov")

        # Passo 1: Ler o tamanho da matriz
        print("Digite o tamanho da matriz de transição (ex: 3 para matriz 3x3): ")
        n = parse(Int, readline())

        # Passo 2: Definir a matriz de transição
        println("\nDefina as probabilidades da matriz de transição (cada linha deve somar 1):")
        matriz = zeros(n, n)
        for i in 1:n
            linha_valida = false
            while !linha_valida
                println("Linha $i (digite $n valores separados por espaço): ")
                entrada = readline()
                try
                    valores = parse.(Float64, split(entrada))
                    if length(valores) != n
                        println("Erro: A linha deve ter exatamente $n valores.")
                        continue
                    end
                    if !isapprox(sum(valores), 1.0; atol=1e-6)
                        println("Erro: A soma dos valores deve ser 1 (soma atual = $(sum(valores)))")
                        continue
                    end
                    matriz[i, :] = valores
                    linha_valida = true
                catch
                    println("Entrada inválida. Use números separados por espaços (ex: 0.1 0.9)")
                end
            end
        end


        println("\nDefina as probabilidades iniciais:")
        distribuicao_inicial = zeros(1, n)
        soma_prob = 0.0

        for i in 1:n-1
            while true
                try
                    print("Probabilidade do Estado $i (0-1): ")
                    entrada = readline()
                    prob = isempty(entrada) ? 0.0 : parse(Float64, entrada)
                    
                    if prob < 0 || prob > 1
                        println("Valor deve estar entre 0 e 1!")
                        continue
                    end
                    if soma_prob + prob > 1
                        println("A soma não pode exceder 1 (soma atual = $(soma_prob + prob))")
                        continue
                    end
                    
                    distribuicao_inicial[1, i] = prob
                    soma_prob += prob
                    break
                catch
                    println("Digite um número válido!")
                end
            end
        end


        prob_restante = 1.0 - soma_prob
        distribuicao_inicial[1, end] = prob_restante
        println("Probabilidade do Estado $n (automático): ", round(prob_restante, digits=6))


        cadeia = CadeiaMarkov(matriz, distribuicao_inicial)


        print("\nNúmero de iterações (padrão 100): ")
        iterações = try parse(Int, readline()) catch _ 100 end

        println("\nIniciando simulação...")
        executar_simulacao(cadeia, iterações)

    catch e
        println("\nErro durante a execução: ", e)
    end
end



executar_simulacao_cadeia_markov()

println("\nSimulação concluída. Pressione ENTER para sair...")
readline()


