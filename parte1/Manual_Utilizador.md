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
Para a aplicação correr é necessário alterar o caminha da da função diretorio, pelo caminha onde o utilizador
guardou a aplicação, no ficheiro projeto.lisp
- Exemplo windows : C:/Users/User/Instituto Politécnico de Setúbal/IA Project - Blocks - General/Blocks/bloks/parte1

O inicio da sua utilização é necessário iniciar o jogo, escolher um problema que será apresentado no menu , também será apresentado um 3 tipos algoritmos , para a resolução do problema.  
 

## Input/Output
No incio da aplicação será apresentado :
![](https://raw.githubusercontent.com/andreia-novas/bloks/main/parte1/img/menu1.PNG)

Terá de escolhar um problema
![](https://raw.githubusercontent.com/andreia-novas/bloks/main/parte1/img/problema1.PNG)
![](https://raw.githubusercontent.com/andreia-novas/bloks/main/parte1/img/problema2.PNG)
![](https://raw.githubusercontent.com/andreia-novas/bloks/main/parte1/img/problema3.PNG)

Terá de escolher um algoritmo
![](https://raw.githubusercontent.com/andreia-novas/bloks/main/parte1/img/algoitmo.PNG)

Terá de inserir uma máxima profundidade se escolher o dfs
![](https://raw.githubusercontent.com/andreia-novas/bloks/main/parte1/img/profundidade.PNG)

Terá de escolher uma heuristica se for o a*
![](https://raw.githubusercontent.com/andreia-novas/bloks/main/parte1/img/heuristica.PNG)

## Exemplo de aplicação
No exemplo de aplicação destes problemas, acrescentamos um problema novo que é referido no enunciado e escolhemos o algoritmo a* e a nova heuristica criada.

![](https://raw.githubusercontent.com/andreia-novas/bloks/main/parte1/img/Exemplo_parte1.PNG)
### É mostrado todas os problemas existentes. 
![](https://raw.githubusercontent.com/andreia-novas/bloks/main/parte1/img/Exemplo_parte2.PNG)
### Neste exemplo escolhi o 7 , novo problema adicionado.
![](https://raw.githubusercontent.com/andreia-novas/bloks/main/parte1/img/exemplo3.PNG)
### Escolhemos o problema a * .
![](https://raw.githubusercontent.com/andreia-novas/bloks/main/parte1/img/exemplo4.PNG)
### Escolhemos a heuristica que criamos.

### De seguida passo a apresentar as caraterísticas dos problemas.
![](https://raw.githubusercontent.com/andreia-novas/bloks/main/parte1/img/exemplo5.PNG)
### Por fim os resultados , o primeiro a ser apresentado é o no solução. 
![](https://raw.githubusercontent.com/andreia-novas/bloks/main/parte1/img/exemplo6.PNG)
![](https://raw.githubusercontent.com/andreia-novas/bloks/main/parte1/img/exemplo7.PNG)
![](https://raw.githubusercontent.com/andreia-novas/bloks/main/parte1/img/exemplo8.PNG)
![](https://raw.githubusercontent.com/andreia-novas/bloks/main/parte1/img/exemplo9.PNG)
![](https://raw.githubusercontent.com/andreia-novas/bloks/main/parte1/img/exemplo10.PNG)
![](https://raw.githubusercontent.com/andreia-novas/bloks/main/parte1/img/exemplo11.PNG)
![](https://raw.githubusercontent.com/andreia-novas/bloks/main/parte1/img/exemplo12.PNG)
![](https://raw.githubusercontent.com/andreia-novas/bloks/main/parte1/img/exemplo13.PNG)
![](https://raw.githubusercontent.com/andreia-novas/bloks/main/parte1/img/exemplo14.PNG)
![](https://raw.githubusercontent.com/andreia-novas/bloks/main/parte1/img/exemplo15.PNG)
![](https://raw.githubusercontent.com/andreia-novas/bloks/main/parte1/img/exemplo16.PNG)
![](https://raw.githubusercontent.com/andreia-novas/bloks/main/parte1/img/exemplo17.PNG)



