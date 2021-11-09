# Manual Utilizador
## Blokus Uno
    Disciplina - Inteligencia Artificial
    Turma - SW-01
    Realizadores - Joana Guerreiro 202001733 | Andreia Novas - 201400498 
## Índice
1. Acrónimos e Convenções usadas
2. Introdução
3. Instalação e utilização
4. Input/Output
5. Exemplo de aplicação

## Introdução
Este documento é um guia para o utilizar, da aplicação desenvolvida em Common Lisp, para a Unidade Curricular de Inteligência Artificial. Esta aplicação é um jogo de puzzle baseado no jogo conhecido como o Blokus,sendo o **Blokus Uno** uma versão do mesmo mais simplificado. No **Blokus Uno** existe um tabuleiro de 14 linhas e 14 colunas,existem 35 peças de três tipos, sendo que a peça C pode ser colocada em duas posições distintas, existe apenas um jogador no jogo e este termina quando todas as peças tiverem sido colocadas ou não for possível colocar mais peças respeitando as regras.
Este jogo é iniciado com a escolha do tabuleira/problema e do algoritmo. O objectivo do jogo é preencher o tabuleiro com os 3 tipos de peças nos espaços minimos existentes no problema, que se pode vizualizar na escolha do tabuleiro.
Nesta aplicação está desenvolvidos os algoritmos BFS, DFS e A*, de procura em Espaços de Estados, para a resolução autónoma do jogos.

- **BFS(breadth-first Search)**: Algoritmo de procura em largura, explora todos os sucessores de um nó antes depassar para o nível seguinte, segue a ordem crescente dos nós da figura no topo da secção.

- **DFS(Depth-first Search)**: Algoritmo de procura em profundidade, explora sempre o primeiro sucessor de umnó, atingindo a máxima profundidade possível até encontrar uma solução, caso atinja o limite semencontrar solução, percorre, utilizando os mesmos métodos, o sucessor mais próximo.

- **A***: Algoritmo de procura informada utiliza uma função heurística para calcular o valor de um nó e apenas explora os nós com o menos valor heurístico, garantindo assim, a melhor solução possível.

## Instalação e utilização
Para a utilização é necessário iniciar o jogo, escolher um problema que será apresentado no menu e um  tipo algoritmo , para a resolução do mesmo.  

## Input/Output
?

## Exemplo de aplicação
?

