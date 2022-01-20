# Manual Tecnico
## Blokus Uno
    Disciplina - Inteligencia Artificial
    Turma - SW-01
    Realizadores - Joana Guerreiro 202001733 | Andreia Novas - 201400498 
    Docente - Filipe Mariano
## Índice
1. Introdução
2. Estrutura do Sistema
3. Implementação técnica
4. Algoritmo 
    4.1.Funções Auxiliares  
5. Limitações técnicas
6. Análise crítica dos resultados
7. Análise estatística contra Humano

## Introdução
A aplicação desenvolvida em Common Lisp, para a Unidade Curricular de Inteligência Artificial, é baseda numa versão simplificada do jogo Blokus, denominada Blokus Uno. Esta primeira parte do projeto tem como objetivo encontrar a uma solução para um determinado problema, colocando peças através da procura em espaços de estados, baseada num critério de menor custo ou caminho. Nesta segunda parte o utilizador escolhe qual o tipo de jogo Humano vs Computador e Computador vs Computador.

## Estrutura de Sistema
Este aplicação está dividida em três ficheiros com uma boa editação, decomentados e organizados por lógica, para uma melhor leitura e compreensão do mesmo. Estes ficheiros são o "jogo", o "algoritmo" e o "puzzle". Também temos um ficheiro que é gerado no final do jogo "log", que guarda todos os valores de cada jogada do mesmo.

##### Jogo

##### Algoritmo

##### Puzzle

## Implementação técnica

O jogo inicia com a chamada à função "iniciar-jogo". Na inicialização do jogo este carrega todas as dependências, que estão dentro dos outros dos ficheiros falados na estrutura de sistema.