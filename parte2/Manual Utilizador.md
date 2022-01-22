# Manual Utilizador
## Blokus Uno
    Disciplina - Inteligencia Artificial
    Turma - SW-01
    Realizadores - Joana Guerreiro 202001733 | Andreia Novas - 201400498 
    Docente - Filipe Mariano

## Índice
1. Introdução
2. Instalação
3. Jogabilidade
4. Limitações do programa

## Introdução
A aplicação desenvolvida em Common Lisp, para a Unidade Curricular de Inteligência Artificial, é baseda numa versão simplificada do jogo Blokus, denominada Blokus Uno. Neste projeto apresentamos uma versão deste jogo simplificada, em que o utilizador no inicio terá que escolher se pretende jogar contra o computador (opção "Humano vs Computador") ou se pretente que o computador jogue contra ele mesmo (opção "Computador vs Computador"). 
As regras deste jogo são as seguintes:
- O jogo é disputado entre 2 jogadores.
- Existem 35 peças de três tipos para cada jogador (Figura 1).
- O tabuleiro tem apenas 14 linhas por 14 colunas, sempre vazio.
- Os jogadores escolhem uma das suas peças e colocam-na num dos cantos do tabuleiro dependendo do jogador, se for o Jogador 1 este deve fazer a primeira jogada no canto superior esquerdo, caso seja o Jogador 2 deve começar no canto inferior direito.
- Assim que se joga uma peça, esta não pode ser alterar até ao final do jogo.
- As jogadas são feitas à vez e, em cada turno, o jogador coloca uma peça de modo a que toque em uma das suas peças já existente no tabuleiro, mas apenas nos cantos. Peças do mesmo jogador nunca podem-se tocar lateralmente, mno entanto podem tocar lateralmente com peças do outro jogador (Figura 2).
- Quando um dos jogadores não consegue colocar uma peça no tabuleiro de jogo, deverá passar a vez.
- O jogo termina quando nenhum dos jogadores consegue colocar mais peças.
- Quando o jogo termina, os jogadores contam o número de quadrados existentes nas peças que
restaram, e o jogador que tiver o menor número de quadrados é o vencedor.

![](https://raw.githubusercontent.com/andreia-novas/bloks/main/parte2/img/pecasIntroducao.png)
Figura 1 - Peças do Jogo

![](https://raw.githubusercontent.com/andreia-novas/bloks/main/parte2/img/regraJogada.png)
Figura 1 - Regra para colocar a peça


## Instalação e utilização
Para a aplicação correr é necessário alterar o caminho na função "diretorio", pelo caminho onde o utilizador
guardou a aplicação, no ficheiro jogo.lisp
- Exemplo windows : C:/Users/User/Instituto Politécnico de Setúbal/IA Project - Blocks - General/Blocks/bloks/parte1

O inicio da sua utilização é necessário iniciar o jogo, escolher no menu apresentado se pretende jogar contra o computador (opção "Humano vs Computador") ou se pretente que o computador jogue contra ele mesmo (opção "Computador vs Computador"), no menu apresentado, posteriormente, terá de escolher o tempo limite que o computador terá para fazer a sua jogada. 
Na eventualidade de ter escolhido no primeiro menu, a primeira opção "Humano vs Computador", terá de escolher no menu apresentado se o primeiro jogador será o "Humano" ou o "Computador", antes de escolher o tempo limite do computador, também terá que no momento da jogada do "Humano", escolher qual a peca que pretende jogar e no menu seguinte qual a coordenada que pretende jogar, conforme as regras apresentadas para a coordenada de cada peça. Existe ainda o menu que vai aparecer em cada jogada, apenas ao jogador "Humano" de este pretende passar a vez, neste moemnto também terá de escolher se "Sim" ou "Não".  Desta forma no final de todas as jogadas possiveis de cada jogador seram apresentados os resultados do jogo.


## Jogabilidade
No incio da aplicação será apresentado o menu:
![](https://raw.githubusercontent.com/andreia-novas/bloks/main/parte2/img/menu1.PNG)

No menu seguinte tem de escolhar qual a opção de tipo de jogo:

![](https://raw.githubusercontent.com/andreia-novas/bloks/main/parte2/img/menutipoJogo.png)

Neste momento dependendo da opção que escolheu no menu anterior poderá seguir dois caminhos, 
- Se escolher a 1.opção "Computador vs Computador", é direcionado para o menu de escolher o tempo limite que o computador terá para jogar:
![](https://raw.githubusercontent.com/andreia-novas/bloks/main/parte2/img/tempoLimite.PNG)

- Caso escolha a 2. opção "Humano vs Computador", primeiro é direcionado para o menu ara escolher o primeiro jogador e só depois é que vai para o menu do tempo limite, apresentado na imagem acima:
![](https://raw.githubusercontent.com/andreia-novas/bloks/main/parte2/img/menuPrimeiroJogador.png)

Apôs o utilizador colocar o tempo, este vai motrar o tabuleiro inicial:

![](https://raw.githubusercontent.com/andreia-novas/bloks/main/parte2/img/tabuleiroInicial.png)

Quando o tipo de jogo é "Humano vs Computador", sempre que for a vez do jogador "Humano":
- Vai aparecer um menu onde o utilizador tem de escolher se pretende passar a sua vez:
![](https://raw.githubusercontent.com/andreia-novas/bloks/main/parte2/img/passarVez.png)
- Depois no próximo menu, tem de escolher qual a peça que pretende jogar:
![](https://raw.githubusercontent.com/andreia-novas/bloks/main/parte2/img/menuPecas.png)
- Por último tem de selecionar a coordenada, mediante a peça terá que ver qual a coordenada na peça que é pedida, não quer dizer que seja a que toca diagonalmente com a posição onde quer jogar:
![](https://raw.githubusercontent.com/andreia-novas/bloks/main/parte2/img/coordenadas.png)

Quando o tipo de jogo é "Computador vs Computador", este vai começar automaticamente até ao final do jogo.

O jogador 1 tem sempre que jogar inicialmente na coordenada "A1" e o jogador 2 na "N14":
![](https://raw.githubusercontent.com/andreia-novas/bloks/main/parte2/img/exemplo/exemploJogo5.png)![](https://raw.githubusercontent.com/andreia-novas/bloks/main/parte2/img/exemplo/exemploJogo6.png)

Seja qual for o menu que aparecer se responder algo incorretamente ou que não seja o que o programa pede este mostra uma mensagem de erro e volta a mostrar o menu (abaixo mostro um exemplo com o menu do tempo limite):
![](https://raw.githubusercontent.com/andreia-novas/bloks/main/parte2/img/respostaInvalida.png)

Sempre que é uma jogada de "Computador", na impressão do tabuleiro existem valores nos "Dados Estatisticos", ao contrário de se for uma jogada de "Humano" (exemplo na imagem abaixo, jogador "Humano" à esquerda e jogador "Computador" à direita):
![](https://raw.githubusercontent.com/andreia-novas/bloks/main/parte2/img/jogadorHumanovsComputador.png)

No final do jogo será apresentado qual foi o jogador vencedor:
![](https://raw.githubusercontent.com/andreia-novas/bloks/main/parte2/img/vencedor.png)

Um exemplo de um jogo do tipo "Computador vs Computador":
- Selecionar para jogar:
![](https://raw.githubusercontent.com/andreia-novas/bloks/main/parte2/img/exemplo/exemploJogo1.png)

- Selecionar o tipo de jogo "Computador vs Computador":
![](https://raw.githubusercontent.com/andreia-novas/bloks/main/parte2/img/exemplo/exemploJogo2.png)

- Selecionar 5 segundos para tempo limite, para cada jogada do computador:
![](https://raw.githubusercontent.com/andreia-novas/bloks/main/parte2/img/exemplo/exemploJogo3.png)

- É apresentado o tabuleiro inicial:
![](https://raw.githubusercontent.com/andreia-novas/bloks/main/parte2/img/exemplo/exemploJogo4.png)

- De seguida o jogo vai se decorrer alternando entre o jogador 1 e o jogador 2 (imagens das jogadas colocadas lado a lado para uma melhor leitura):
![](https://raw.githubusercontent.com/andreia-novas/bloks/main/parte2/img/exemplo/exemploJogo5.png)![](https://raw.githubusercontent.com/andreia-novas/bloks/main/parte2/img/exemplo/exemploJogo6.png)
![](https://raw.githubusercontent.com/andreia-novas/bloks/main/parte2/img/exemplo/exemploJogo7.png)![](https://raw.githubusercontent.com/andreia-novas/bloks/main/parte2/img/exemplo/exemploJogo8.png)
![](https://raw.githubusercontent.com/andreia-novas/bloks/main/parte2/img/exemplo/exemploJogo9.png)![](https://raw.githubusercontent.com/andreia-novas/bloks/main/parte2/img/exemplo/exemploJogo10.png)
![](https://raw.githubusercontent.com/andreia-novas/bloks/main/parte2/img/exemplo/exemploJogo11.png)![](https://raw.githubusercontent.com/andreia-novas/bloks/main/parte2/img/exemplo/exemploJogo12.png)
![](https://raw.githubusercontent.com/andreia-novas/bloks/main/parte2/img/exemplo/exemploJogo13.png)![](https://raw.githubusercontent.com/andreia-novas/bloks/main/parte2/img/exemplo/exemploJogo14.png)
![](https://raw.githubusercontent.com/andreia-novas/bloks/main/parte2/img/exemplo/exemploJogo15.png)![](https://raw.githubusercontent.com/andreia-novas/bloks/main/parte2/img/exemplo/exemploJogo16.png)
![](https://raw.githubusercontent.com/andreia-novas/bloks/main/parte2/img/exemplo/exemploJogo17.png)![](https://raw.githubusercontent.com/andreia-novas/bloks/main/parte2/img/exemplo/exemploJogo18.png)
![](https://raw.githubusercontent.com/andreia-novas/bloks/main/parte2/img/exemplo/exemploJogo19.png)![](https://raw.githubusercontent.com/andreia-novas/bloks/main/parte2/img/exemplo/exemploJogo20.png)
![](https://raw.githubusercontent.com/andreia-novas/bloks/main/parte2/img/exemplo/exemploJogo21.png)![](https://raw.githubusercontent.com/andreia-novas/bloks/main/parte2/img/exemplo/exemploJogo22.png)
![](https://raw.githubusercontent.com/andreia-novas/bloks/main/parte2/img/exemplo/exemploJogo23.png)![](https://raw.githubusercontent.com/andreia-novas/bloks/main/parte2/img/exemplo/exemploJogo24.png)
![](https://raw.githubusercontent.com/andreia-novas/bloks/main/parte2/img/exemplo/exemploJogo25.png)![](https://raw.githubusercontent.com/andreia-novas/bloks/main/parte2/img/exemplo/exemploJogo26.png)
![](https://raw.githubusercontent.com/andreia-novas/bloks/main/parte2/img/exemplo/exemploJogo27.png)![](https://raw.githubusercontent.com/andreia-novas/bloks/main/parte2/img/exemplo/exemploJogo28.png)
![](https://raw.githubusercontent.com/andreia-novas/bloks/main/parte2/img/exemplo/exemploJogo29.png)![](https://raw.githubusercontent.com/andreia-novas/bloks/main/parte2/img/exemplo/exemploJogo30.png)
![](https://raw.githubusercontent.com/andreia-novas/bloks/main/parte2/img/exemplo/exemploJogo31.png)![](https://raw.githubusercontent.com/andreia-novas/bloks/main/parte2/img/exemplo/exemploJogo32.png)
![](https://raw.githubusercontent.com/andreia-novas/bloks/main/parte2/img/exemplo/exemploJogo33.png)![](https://raw.githubusercontent.com/andreia-novas/bloks/main/parte2/img/exemplo/exemploJogo34.png)
![](https://raw.githubusercontent.com/andreia-novas/bloks/main/parte2/img/exemplo/exemploJogo35.png)![](https://raw.githubusercontent.com/andreia-novas/bloks/main/parte2/img/exemplo/exemploJogo36.png)
![](https://raw.githubusercontent.com/andreia-novas/bloks/main/parte2/img/exemplo/exemploJogo37.png)![](https://raw.githubusercontent.com/andreia-novas/bloks/main/parte2/img/exemplo/exemploJogo38.png)
![](https://raw.githubusercontent.com/andreia-novas/bloks/main/parte2/img/exemplo/exemploJogo39.png)![](https://raw.githubusercontent.com/andreia-novas/bloks/main/parte2/img/exemplo/exemploJogo40.png)
![](https://raw.githubusercontent.com/andreia-novas/bloks/main/parte2/img/exemplo/exemploJogo41.png)![](https://raw.githubusercontent.com/andreia-novas/bloks/main/parte2/img/exemplo/exemploJogo42.png)
![](https://raw.githubusercontent.com/andreia-novas/bloks/main/parte2/img/exemplo/exemploJogo43.png)![](https://raw.githubusercontent.com/andreia-novas/bloks/main/parte2/img/exemplo/exemploJogo44.png)
![](https://raw.githubusercontent.com/andreia-novas/bloks/main/parte2/img/exemplo/exemploJogo45.png)![](https://raw.githubusercontent.com/andreia-novas/bloks/main/parte2/img/exemplo/exemploJogo46.png)
![](https://raw.githubusercontent.com/andreia-novas/bloks/main/parte2/img/exemplo/exemploJogo47.png)![](https://raw.githubusercontent.com/andreia-novas/bloks/main/parte2/img/exemplo/exemploJogo48.png)
![](https://raw.githubusercontent.com/andreia-novas/bloks/main/parte2/img/exemplo/exemploJogo49.png)

- Por fim um jogador ganha, este mostra qual é o vencedor e a sua jogada: 
![](https://raw.githubusercontent.com/andreia-novas/bloks/main/parte2/img/exemplo/exemploJogo50.png)


## Limitações do programa

Uma limitação que é colocada ao utilizador é este ter que pensar conforme a peça que pretende colocar e onde, que é  coordenada da peça, conforme a sua regra, que este tem de escrever, que nem sempre será exatamente a coordenada da posição onde pretente jogar.
O jogador "Computador" também está limitado ao tempo limite dado pelo utilizador.

