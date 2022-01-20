 ;;;; jogo.lisp
;;;; Funcoes interacao com o utilizador
;;;; Disciplina de IA - 2021 / 2022
;;;; Autor: Joana Guerreiro e Andreia Novas

;;;;;;;;;; INICIALIZAÇãO ;;;;;;;;;; 

;; iniciar-jogo
(defun iniciar-jogo () 
  "Carrega os ficheiros e chama o menu pricipal"
  (progn 
    (carregar-ficheiros)
    (menu-inicial)
  )
)

;; diretorio
(defun diretorio ()
  "Caminho onde está o projeto" 
  (string "C:/Users/User/Instituto Politécnico de Setúbal/IA Project - Blocks - General/Blocks/bloks/parte2")
  ;;(string "C:/Users/Joana/Instituto Politécnico de Setúbal/IA Project - Blocks - General/Blocks/bloks/parte2")
)

;; carregar-ficheiros
(defun carregar-ficheiros ()
  "Carrega os ficheiros do projeto" 
  (let ((path (diretorio)))
    (progn
      (compile-file (concatenate 'string path "/algoritmo.lisp"))
      (compile-file (concatenate 'string path "/puzzle.lisp"))

      (load (concatenate 'string path "/algoritmo.lisp"))
      (load (concatenate 'string path "/puzzle.lisp"))
    )
  )
)

;;;;;;;;;; OUTPUT ;;;;;;;;;; 

;; escrever-resultados
(defun escrever-resultados (texto &optional (arg NIL))
  "Escreve o texto recebido por parametro em ficheiro e no ecra"
  (progn 
    (escrever-resultados-ficheiro texto arg)
  )
)

;; escrever-resultados-ficheiro
(defun escrever-resultados-ficheiro (texto &optional (arg NIL))
  "Escreve o texto recebido por parametro em ficheiro"
  (with-open-file 
    (output-file 
      (concatenate 'string (diretorio) "/log.dat")
      :direction :output
      :if-exists :append
      :if-does-not-exist :create
    )
    (format output-file texto arg)
  )
)



;;;;;;;;;; FUNCOES AUXILIARES ;;;;;;;;;;

;; imprimir-tabuleiro
;; teste: (imprimir-tabuleiro (no-teste))
;; resultado:
;;        A B C D E F G H I J K L M N 
;;      1(0 0 0 0 0 0 0 0 0 0 0 0 0 0) 
;;      2(0 0 0 0 0 0 0 0 0 0 0 0 0 0)
;;      3(0 0 0 0 0 0 0 0 0 0 0 0 0 0)
;;      4(0 0 0 0 0 0 0 0 0 0 0 0 0 0)
;;      5(0 0 0 0 0 0 0 0 0 0 0 0 0 0)
;;      6(0 0 0 0 0 0 0 0 0 0 0 0 0 0)
;;      7(0 0 0 0 0 0 0 0 0 0 0 0 0 0)
;;      8(0 0 0 0 0 0 0 0 0 0 0 0 0 0)
;;      9(0 0 0 0 0 0 0 0 0 0 0 0 0 0)
;;     10(0 0 0 0 0 0 0 0 0 0 0 0 0 0)
;;     11(0 0 0 0 0 0 0 0 0 0 0 0 0 0)
;;     12(0 0 0 0 0 0 0 0 0 0 0 0 0 0)
;;     13(0 0 0 0 0 0 0 0 0 0 0 0 0 0)
;;     14(0 0 0 0 0 0 0 0 0 0 0 0 0 0)
;;
;;     Jogador 1: 
;;     Pontuacao: 110
;;     Peca Quadrado Pequeno: 10
;;     Peca Quadrado: 10
;;     Peca S: 15
;;
;;     Jogador 2: 
;;     Pontuacao: 110
;;     Peca Quadrado Pequeno: 10
;;     Peca Quadrado: 10
;;     Peca S: 15
;;
;;     Estatisticas da Jogada: 
;;     Cortes: 0
;;     Nos Analisados: 0
;;     Tempo: 0.0
(defun imprimir-tabuleiro (no tempo)
  "Imprimir estado do problema durante o caminho"
    (format t "~%        A B C D E F G H I J K L M N ~%      1~A ~%      2~A~%      3~A~%      4~A~%      5~A~%      6~A~%      7~A~%      8~A~%      9~A~%     10~A~%     11~A~%     12~A~%     13~A~%     14~A~%~%     Jogador 1: ~%     Pontuacao: ~d~%     Peca Quadrado Pequeno: ~d~%     Peca Quadrado: ~d~%     Peca S: ~d~%~%     Jogador 2: ~%     Pontuacao: ~d~%     Peca Quadrado Pequeno: ~d~%     Peca Quadrado: ~d~%     Peca S: ~d~%~%     Estatisticas da Jogada: ~%     Cortes Alfa: ~d~%     Cortes Beta: ~d~%     Nos Analisados: ~d~%     Tempo: ~f~%" 
          (nth 0 (no-tabuleiro no)) 
          (nth 1 (no-tabuleiro no)) 
          (nth 2 (no-tabuleiro no)) 
          (nth 3 (no-tabuleiro no)) 
          (nth 4 (no-tabuleiro no)) 
          (nth 5 (no-tabuleiro no)) 
          (nth 6 (no-tabuleiro no))
          (nth 7 (no-tabuleiro no))
          (nth 8 (no-tabuleiro no))
          (nth 9 (no-tabuleiro no))
          (nth 10 (no-tabuleiro no))
          (nth 11 (no-tabuleiro no))
          (nth 12 (no-tabuleiro no))
          (nth 13 (no-tabuleiro no))
          (no-pontuacao-jogador no 1)
          (nth 0 (no-pecas-jogador no 1))
          (nth 1 (no-pecas-jogador no 1))
          (nth 2 (no-pecas-jogador no 1))
          (no-pontuacao-jogador no 2)
          (nth 0 (no-pecas-jogador no 2))
          (nth 1 (no-pecas-jogador no 2))
          (nth 2 (no-pecas-jogador no 2))
          (obter-cortes-alfa) 
          (obter-cortes-beta) 
          (obter-nos-analisados)
          tempo)
)

;; letra-para-numero
;; teste: (letra-para-numero "f")
;; resultado: 5
(defun letra-para-numero (letra) 
 "Converte um numero introduzido pelo utilizador para uma coordenada X do tabuleiro"
  (cond
    ((or (equal letra "a")(equal letra "A")) 0)
    ((or (equal letra "b")(equal letra "B")) 1)
    ((or (equal letra "c")(equal letra "C")) 2)
    ((or (equal letra "d")(equal letra "D")) 3)
    ((or (equal letra "e")(equal letra "E")) 4)
    ((or (equal letra "f")(equal letra "F")) 5)
    ((or (equal letra "g")(equal letra "G")) 6)
    ((or (equal letra "h")(equal letra "H")) 7)
    ((or (equal letra "i")(equal letra "I")) 8)
    ((or (equal letra "j")(equal letra "J")) 9)
    ((or (equal letra "k")(equal letra "K")) 10)
    ((or (equal letra "l")(equal letra "L")) 11)
    ((or (equal letra "m")(equal letra "M")) 12)
    ((or (equal letra "n")(equal letra "N")) 13)
    (t NIL)
  )
)

;; numero-para-coordenada
;; teste: (numero-para-coordenada 5)
;; resultado: 4
(defun numero-para-coordenada(numero) 
 "Converte um numero introduzido pelo utilizador para uma coordenada Y do tabuleiro"
  (cond
   ((null numero) NIL)
   ((numberp numero) (1- numero))
   (t NIL)
 )
)

;; numero-para-letra
;; teste: (numero-para-letra 6)
;; resultado: "G"
(defun numero-para-letra(numero) 
 "Converte um numero para uma letra"
  (cond
    ((equal numero 0) "A")
    ((equal numero 1) "B")
    ((equal numero 2) "C")
    ((equal numero 3) "D")
    ((equal numero 4) "E")
    ((equal numero 5) "F")
    ((equal numero 6) "G")
    ((equal numero 7) "H")
    ((equal numero 8) "I")
    ((equal numero 9) "J")
    ((equal numero 10) "K")
    ((equal numero 11) "L")
    ((equal numero 12) "M")
    ((equal numero 13) "N")
    (t nil)
  )
)

;; coordenada-para-numero
;; teste: (coordenada-para-numero 5)
;; resultado: 6
(defun coordenada-para-numero(numero)
 "Converte uma coordenada para um numero"
  (1+ numero)
)

;; peca-para-numero
;; teste: (peca-para-numero "a")
;; resultado: 0
(defun peca-para-numero (peca) 
 "Converte uma peca introduzida pelo utilizador para um numero de tipo peca"
  (cond
    ((equal peca "a") 0)
    ((equal peca "b") 1)
    ((or (equal peca "c1") (equal peca "c2")) 2)
    (t NIL)
  )
)

;; vencedor
;; teste: (vencedor 100 99)
;; resultado: "Jogador 2"
(defun vencedor (pontuacaoJogador1 pontuacaoJogador2)
 "Retorna o jogador vencedor, tendo em conta que o que tiver menor pontos ganha"
  (cond
    ((< pontuacaoJogador1 pontuacaoJogador2) "Jogador 1")
    ((> pontuacaoJogador1 pontuacaoJogador2) "Jogador 2")
    (t "Empate")
  )
)

;;escrever-estado-ficheiro
(defun escrever-estado-ficheiro (no tempo jogador)
 "Escreve os resultados estatisticos da jogada no ficheiro"
  (escrever-resultados "~%            ************ JOGADA ************~%     -> Valor da posição para qual jogou: ~d pontos" (no-pontuacao-jogador no jogador))
  (escrever-resultados "~%     -> Número de cortes alfa: ~d cortes" (obter-cortes-alfa))
  (escrever-resultados "~%     -> Número de cortes beta: ~d cortes" (obter-cortes-beta))
  (escrever-resultados "~%     -> Número de nos analisados: ~d no(s)" (obter-nos-analisados))
  (escrever-resultados "~%     -> Tempo da jogada: ~f milisegundos(s)~%" tempo)
)

;; calcular-tempo
(defun calcular-tempo (tempoInicial)
 "Calcula a diferença entre o tempo atual e um determinado tempo inicial"
 (float (/ (- (get-internal-real-time) tempoInicial) internal-time-units-per-second))
)

;; imprimir-jogada
(defun imprimir-jogada (no jogador tempo)
  (cond
    ((not (null (no-pai no)))
     (format t "~% > Jogador ~d jogou ~%" (trocar-jogador jogador))
    )
    (t (progn (format t "")))
  )
  (imprimir-tabuleiro no tempo)
)

;; imprimir-resultados
(defun imprimir-resultados (no tempoInicial)
"Imprimir resultados do jogo, com o vencedor do mesmo"
  (progn
    (format t  "~%*******************************************~%********* Chegamos ao fim do jogo *********~%*******************************************~%")
    (imprimir-tabuleiro no tempoInicial)
    (format t "~%     Vencedor: ~s~%     ~%*******************************************~%~%"            
          (vencedor (no-pontuacao-jogador no 1) (no-pontuacao-jogador no 2)))
  )
)

;; imprimir-escrever
(defun imprimir-escrever (no jogador tempoInicial existeHumano funcaoJogada)
 "Funcao que conforme os parametros chama as funcoes de imprimir no ecra e escrever do ficheiro, mas com o tempo a 0 ou utilizando o calculo"
  (cond 
    ((or (and existeHumano (equal funcaoJogada "funcaoComputador"))) 
       (progn 
         (imprimir-jogada no jogador 0)
         (escrever-estado-ficheiro no 0 jogador)
       )
    )
    (t (progn 
         (imprimir-jogada no jogador (calcular-tempo tempoInicial))
         (escrever-estado-ficheiro no (calcular-tempo tempoInicial) jogador)
       )
    )
  )
)
    



;;;;;;;;;; MENUS ;;;;;;;;;; 

;; menu-inicial
(defun menu-inicial ()
  "Menu Principal"
  (progn
    (format t "~% ~% ~%Bem vindo ~%
             1 - Jogar
             2 - Sair ~%")
    (let ((opcao (read)))
      (cond 
        ((= opcao 1) (menu-tipo-jogo))
        ((= opcao 2) (format t "Adeus ~% ~%"))
        (t (progn 
             (format t "~% ~% >> Resposta invalida  << ~% ~%")
             (menu-inicial)
            )
        )
      )
    )
  )
)

;; menu-tipo-jogo
(defun menu-tipo-jogo ()
  "Menu tipo de jogo"
  (progn
    (format t "~% ~% ~% ~%
             1 - Humano vs Computador
             2 - Computador vs Computador ~%")
    (let ((opcao (read)))
      (cond 
        ((= opcao 1) (definir-primeiro-jogador))
        ((= opcao 2) (definir-tempo-jogo))
        (t (progn 
             (format t "~% ~% >> Resposta invalida  << ~% ~%")
             (menu-tipo-jogo)
           )
        )
      )
    )
  )
)

;; definir-primeiro-jogador
(defun definir-primeiro-jogador ()
"Menu definir primeiro jogador"
  (progn
    (format t "~% ~% ~%Qual o primeiro jogador? ~%
             1 - Humano
             2 - Computador ~%")
    (let ((opcao (read)))
      (cond 
        ((or (= opcao 1) (= opcao 2)) (definir-tempo-jogo opcao T))
        (t (progn 
             (format t "~% ~% >> Resposta invalida  << ~% ~%")
             (definir-primeiro-jogador)
           )
        )
      )
    )
  )
)

;; definir-tempo-jogo
(defun definir-tempo-jogo (&optional (primeiroJogador 2) (existeHumano NIL) (no (no-inicial)))
"Menu definir tempo de jogo"
  (progn
    (format t "~% ~% ~%Qual o tempo de jogo? (Entre 1 e 20 segundos) ~%")
    (let ((tempo (read)))
      (cond 
        ((and (numberp tempo) (>= tempo 1) (<= tempo 20) (= primeiroJogador 1)) (jogada-humano (* tempo 1000) primeiroJogador existeHumano no))
        ((and (numberp tempo) (>= tempo 1) (<= tempo 20) (= primeiroJogador 2)) (jogada-computador (* tempo 1000) (trocar-jogador primeiroJogador) existeHumano no))
        (t (progn 
             (format t "~% ~% >> Resposta invalida  << ~% ~%")
             (definir-tempo-jogo primeiroJogador existeHumano no)
           )
        )
      )
    )
  )
)

;; definir-peca
(defun definir-peca (jogador no)
"Menu definir a peca que o humana quer jogar"
  (progn
    (format t "~% ~% ~%Qual a peça que pretende jogar? ~%
           a  - quadrado simples 
           b  - quadrado que ocupa 4 casas
           c1 - peça c na posição 1
           c2 - peça c na posição 2 ~%")
    (let ((opcao (read-line)))
      (cond 
        ((equal opcao "a") (definir-coordenada opcao "coordenada do próprio quadrado" jogador no))
        ((equal opcao "b") (definir-coordenada opcao "coordenada do canto superior esquerdo" jogador no))
        ((equal opcao "c1") (definir-coordenada opcao "coordenada do canto inferior esquerdo" jogador no))
        ((equal opcao "c2") (definir-coordenada opcao "coordenada do canto superior esquerdo" jogador no))
        (t (progn 
             (format t "~% ~% >> Resposta invalida  << ~% ~%")
             (definir-peca jogador no)
           )
        )
      )
    )
  )
)

;; definir-coordenada
(defun definir-coordenada (peca mensagem jogador no)
"Menu definir a coordenada da peca que o jogador quer jogar"
  (progn
    (format t "~% ~% ~%Qual é a ~a que quer colocar a peça ~a? (<letra><numero de 1 a 14>) ~%
               > Se escolheu a peca: ~%
                     - a coloque a coordenadas da própria peca
                     - b coloque a coordenadas do canto superior esquerdo da peca
                     - c1 coloque a coordenada do canto inferior esquerdo da peca
                     - c2 coordenada do canto superior esquerdo da peca ~%" mensagem peca)
    (let* ((opcao (read-line))
           (x (letra-para-numero (subseq opcao 0 1)))
           (y (numero-para-coordenada (parse-integer (subseq opcao 1) :junk-allowed t)))
           (listaCoordenadas (lista-coordenadas-peca peca (list x y)))
           (listaCoordenadasVertices (lista-coordenadas-vertices-peca peca (list x y))))
      (format t " ~a" (no-pai no))
      (cond 
        ((and (valida-possivel-colocar-peca (no-tabuleiro no) listaCoordenadas jogador) (validar-primeira-jogada (no-tabuleiro no) jogador))  (list peca listaCoordenadas))
        ((and (valida-possivel-colocar-peca (no-tabuleiro no) listaCoordenadas jogador) (validar-lista-coordenadas-vertices-peca listaCoordenadasVertices (no-tabuleiro no) jogador) ) (list peca listaCoordenadas))
        (t (progn 
             (format t "~% ~% >> Coordenada invalida  << ~% ~%")
             (definir-coordenada peca mensagem jogador no)
           )
        )
      )
    )
  )
)

;; definir-passar-vez
(defun definir-passar-vez ()
"Menu que define se o jogador pretende passar a vez"
  (progn
    (format t "~% ~% ~%Pretende passar a vez? ~%
             1 - Sim
             2 - Não ~%")
    (let ((opcao (read)))
      (cond 
        ((= opcao 1) T) 
        ((= opcao 2) NIL)
        (t (progn 
             (format t "~% ~% >> Resposta invalida  << ~% ~%")
             (definir-passar-vez)
           )
        )
      )
    )
  )
)

;; jogada-computador
(defun jogada-computador (tempoLimite jogador existeHumano no &optional (tempoInicial 0))
  (progn
    (imprimir-escrever no jogador tempoInicial existeHumano "funcaoComputador")
    (limpar-dados)
    (cond 
      ((no-solucaop no) 
         (progn (imprimir-resultados no tempoInicial) (iniciar-jogo))
         
      )
      ((null (verificar-possivel-jogar no jogador)) 
         (progn
           (format t "~% > O Jogador ~d passa a sua vez... ~%" jogador)
           (cond
             ((not (null existeHumano)) (jogada-humano tempoLimite (trocar-jogador jogador) existeHumano (no-alterar-jogador no) tempoInicial))
             (t (jogada-computador tempoLimite (trocar-jogador jogador) existeHumano (no-alterar-jogador no) tempoInicial))
           )
         )
      )
      (t (let* ((tempoReal (get-internal-real-time))
                (novoNo (obter-no-hashtable no jogador tempoLimite tempoReal))) 
           (progn
             (format t "~% > Jogador ~d a fazer a sua jogada... ~%" jogador)
             (cond
              ((not (null existeHumano)) (jogada-humano tempoLimite (trocar-jogador jogador) existeHumano novoNo tempoReal))
              (t (jogada-computador tempoLimite (trocar-jogador jogador) existeHumano novoNo tempoReal))
             )  
           )
         )
       )    
    )
  )
)

;; jogada-humano
(defun jogada-humano (tempoLimite jogador existeHumano no &optional (tempoInicial 0))
  (progn
    (imprimir-escrever no jogador (get-universal-time) existeHumano "funcaoJogador")
    (cond
      ((no-solucaop no) 
         (imprimir-resultados no tempoInicial)
      )
      ((or (null (verificar-possivel-jogar no jogador)) (definir-passar-vez)) 
        (progn
          (format t "~% > O Jogador ~d passa a sua vez... ~%" jogador)
          (jogada-computador tempoLimite (trocar-jogador jogador) existeHumano (no-alterar-jogador no) tempoInicial)
        )
      )
      (t (let* ((jogada (definir-peca jogador no))
                (novoNo (criar-jogada no (substituir-valores-tabuleiro (no-tabuleiro no)  (cadr jogada)  jogador) (peca-para-numero (car jogada)) jogador)))
           (format t "~% > Jogador ~d a fazer a sua jogada... ~%" (trocar-jogador jogador))
           (jogada-computador tempoLimite (trocar-jogador jogador) existeHumano novoNo tempoInicial)
         )
      )
    )
  )
)











