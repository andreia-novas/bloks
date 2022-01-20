;;;; puzzle.lisp
;;;; Dominio do prolema
;;;; Disciplina de IA - 2021 / 2022
;;;; Autor: Joana Guerreiro e Andreia Novas

;;;;;;;;;; TABULEIROS ;;;;;;;;;; 

;; tabuleiro-vazio
(defun tabuleiro-vazio ()
  '(
      (0 0 0 0 0 0 0 0 0 0 0 0 0 0)
      (0 0 0 0 0 0 0 0 0 0 0 0 0 0)
      (0 0 0 0 0 0 0 0 0 0 0 0 0 0)
      (0 0 0 0 0 0 0 0 0 0 0 0 0 0)
      (0 0 0 0 0 0 0 0 0 0 0 0 0 0)
      (0 0 0 0 0 0 0 0 0 0 0 0 0 0)
      (0 0 0 0 0 0 0 0 0 0 0 0 0 0)
      (0 0 0 0 0 0 0 0 0 0 0 0 0 0) 
      (0 0 0 0 0 0 0 0 0 0 0 0 0 0)
      (0 0 0 0 0 0 0 0 0 0 0 0 0 0)
      (0 0 0 0 0 0 0 0 0 0 0 0 0 0)
      (0 0 0 0 0 0 0 0 0 0 0 0 0 0)
      (0 0 0 0 0 0 0 0 0 0 0 0 0 0)
      (0 0 0 0 0 0 0 0 0 0 0 0 0 0)
  )
)

;;;;;;;;;; FUNÇÕES GERAIS ;;;;;;;;;; 

;; remover-se
;; teste: (remover-se #'(lambda (x) (= x 0)) '(1 2 0 2 0 4))
;; resultado: (1 2 2 4)
(defun remover-se (pred lista)
"Função que remove o valor da lista se comprir a condicao enviada no parametro pred"
  (cond 
   ((null lista) NIL) 
   ((funcall pred (car lista)) (remover-se pred (cdr lista)))
   (t (cons (car lista) (remover-se pred (cdr lista))))
  )
)

;; juntar-lista
;; teste: (juntar-lista (tabuleiro-vazio))
;; resultado: (0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ...)
(defun juntar-lista (lista)
 "Função que retorna todos os valores de uma lista de listas em uma lista só"
  (cond
    ((null lista) '())
    ((append (car lista) (juntar-lista (cdr lista))))
  )
)

;; criar-no
;; teste: (criar-no (tabuleiro-vazio) 0 '(10 10 15) NIL)
;; resultado: ((((0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0)) 0 NIL 0 0) ((10 10 15) 0) NIL)
(defun criar-no (tabuleiro  pecas1 pecas2 noPai &optional (profundidade 0) (jogador 1)(pontuacao1 110) (pontuacao2 110))
 "Funcao que cria um no com as propriedades do mesmo enviadas por parametro"
  (list (list tabuleiro  (no-min-casas noPai) profundidade) (list pecas1 pontuacao1) (list pecas2 pontuacao2) jogador noPai)
)


;; no-teste
;; teste: (no-teste)
;; resultado: ((((0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0)) 0 72 0 0) ((10 10 15) 0) NIL)
(defun no-teste ()
 "Funcao que retorna um um no por defeito"
  (list (list (tabuleiro-vazio)  72 0) '((10 10 15) 110) '((10 10 15) 110) 2 NIL)
)

;; no-inicial
;; teste: (no-inicial)
;; resultado: ((((0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0)) 0 72 0 0) ((10 10 15) 0) NIL)
(defun no-inicial (&optional (tabuleiro (tabuleiro-vazio)) (minCasas 72))
  "Funcao que define um no inical do problema"
  (list (list tabuleiro  minCasas 0 ) '((10 10 15) 110) '((10 10 15) 110) 1 NIL)
)


;; no-pai 
;; teste: (no-pai (no-teste))
;; resultado: NIL
(defun no-pai (no)
 "Funcao que retorna o no pai"
  (car (last no))
)

;; no-tabuleiro
;; teste: (no-tabuleiro (no-teste))
;; resultado: ((0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0))
(defun no-tabuleiro (no)
 "Funcao que retorna o tabuleiro do no enviado por paramatro"
  (caar no)
)



;; no-min-casas
;; teste: (no-min-casas (no-teste))
;; resultado: 72
(defun no-min-casas (no)
 "Funcao que retorna o numero minimo de casas a preencher do no enviado por paramatro"
  (caddar no)
)

;; no-pecas-jogador
;; teste: (no-pecas-jogador (no-teste))
;; resultado: (10 10 15)
(defun no-pecas-jogador (no &optional (jogador 1))
 "Funcao que retorna a lista de pecas do no enviado por paramatro"
  (cond
   ((= jogador 1)(caadr no))
   (t (car(car(cdr ( cdr no)))) )
  )
)

;; no-jogador
;; teste: (no-jogador (no-teste))
;; resultado: 0
(defun no-jogador (no)
 "Funcao que retorna o jogador do no enviado por paramatro"
  (car(cdr(cdr(cdr no))))
)

;;inverter-jogador
(defun inverter-jogador (jogador)
 "Inverter jogadores negativos vindos do negamax"
  (cond
   ((or (= jogador 1)(= jogador -2)) 1)
   ((or (= jogador 2)(= jogador -1)) 2)
   (t 1)
   )
)

;; trocar-jogador
(defun trocar-jogador (jogador)
 "Retorna o jogador contrário ao recebido como parametro"
  (cond
    ((= jogador 1) 2)
    (t 1)
  )
)

;;no-alterar-jogador
(defun no-alterar-jogador (no)
 "Função que retorna um novo no com o jogador trocado"
  (criar-no (no-tabuleiro no) (no-pecas-jogador no 1) (no-pecas-jogador no 2) no (no-profundidade no) (trocar-jogador (no-jogador no)) (no-pontuacao-jogador no 1) (no-pontuacao-jogador no 2))
)

;; no-pontuacao-jogador
;; teste: (no-pontuacao (no-teste))
;; resultado: 0
(defun no-pontuacao-jogador (no &optional (jogador 1)) 
 "Funcao que retorna a pontuação dum jogador"
  (cond
    ((= (inverter-jogador jogador) 1) (cadadr no))
    (t (car(cdr(car(cdr(cdr no))))))
  )
)

;; no-profundidade
;; teste: (no-profundidade (no-teste))
;; resultado: 0
(defun no-profundidade (no)
 "Funcao que retorna aprofundidade do no enviado por paramatro" 
 (car(cdr(cdr(car no))))
)

;; existePecas
;; teste: (existePecas 10)
;; resultado: T
(defun existePecas (numPecas)
 "Funcao que retorna T/NIL se o numero de pecas existente, do no enviado por paramatro, for maior/menor que 0"
  (<= numPecas 0)
)



;; tirar-peca
;; teste: (tirar-peca 1 (no-teste))
;; resultado: (10 9 15)   
(defun tirar-peca (peca no jogador)
 "Funcao que retorna a nova lista de pecas do no enviado por paramatro, com menos uma peca, do tipo enviado por parametro"
  (let ((numPecas (nth peca (no-pecas-jogador no jogador ))))
    (cond
      ((= peca 0) (cons (1- numPecas) (cdr (no-pecas-jogador no jogador))))
      ((= peca 1) (cons (car (no-pecas-jogador no jogador)) (list (1- numPecas) (car (last (no-pecas-jogador no jogador))))))
      (t (cons (car (no-pecas-jogador no jogador)) (list (cadr (no-pecas-jogador no jogador)) (1- numPecas))))
    )
  )
)

;; no-existe-listaP
;; teste: (no-existe-listaP '(((((0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0)) 0 72 0 0) ((10 10 15) 0) NIL) ((((1 1 0 0 0 0 0 0 0 0 0 0 0 0) (1 1 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0)) 0 72 0 0) ((10 9 15) 0) NIL) ((((1 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0)) 0 72 0 0) ((9 10 15) 0) NIL)) '(((((1 0 0 0 0 0 0 0 0 0 0 0 0 0) (1 1 0 0 0 0 0 0 0 0 0 0 0 0) (0 1 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0)) 0 72 0 0) ((10 10 14) 0) NIL) ((((0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0)) 0 71 0 0) ((10 10 15) 0) NIL)))
;; resultado: (((((1 0 0 0 0 0 0 0 0 0 0 0 0 0) (1 1 0 0 0 0 0 0 0 0 0 0 0 0) (0 1 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0)) 0 72 0 0) ((10 10 14) 0) NIL))
(defun no-existe-listaP (listaNos listaSucessores)
 "Funcao que retorna NIL ou a lista de sucessores sem no que já existem na lista de nos (lista de abertos com a lista de fechados)" 
  (cond
    ((null listaSucessores) NIL)
    ((null listaNos)listaSucessores)
    (t(no-existe-listaP (cdr listaNos) (remover-se #'(lambda (no) (equal (no-tabuleiro no) (no-tabuleiro (car listaNos)))) listaSucessores)))
  )
)

;;pontuacao
(defun pontuacao (listaPecas)
 "Função que retorna a soma da multiplicação das pecas com o numero de quadrados que cada uma ocupa"
  (+(nth 0 listaPecas) (* 4 (+ (nth 1 listaPecas) (nth 2 listaPecas))))
)

;;verificar-possivel-jogar
(defun verificar-possivel-jogar (no jogador)
 "Função que retorna T/NIL, se a soma das pecas do jogador forem dif 0 ou se não tem mais coordenadas possiveis para jogar"
  (not (null (lista-sucessores no jogador))) ;;(/= (apply '+ (no-pecas-jogador no jogador)) 0)
)

;;no-solucaop
(defun no-solucaop (no)
 "Funcao que verifica se o estado do no e final"
  (and (null (verificar-possivel-jogar no 1)) (null (verificar-possivel-jogar no 2)))
)




;;;;;;;;;; FUNÇÕES TABULEIRO ;;;;;;;;;;

;; largura-tabuleiro
;; teste: (largura-tabuleiro (tabuleiro-vazio))
;; resultado: 14
(defun largura-tabuleiro (tabuleiro)
 "Funcao que retorna a largura do tabuleiro enviado por parametro"
  (length (car tabuleiro))
)

;; comprimento-tabuleiro
;; teste: (comprimento-tabuleiro (tabuleiro-vazio))
;; resultado: 14
(defun comprimento-tabuleiro (tabuleiro)
 "Funcao que retorna o comprimento do tabuleiro enviado por parametro"
  (length tabuleiro)
)

;; fora-tabuleiro
;; teste: (fora-tabuleiro (tabuleiro-vazio) '(-1 0))
;; resultado: T
(defun fora-tabuleiro (tabuleiro coordenada)
 "Funcao que retorna T/NIL se a coordenada enviada por paramatro não está entre a lagura e o comprimento do tabuleiro enviado por parametro"
  (let ((y (car(last coordenada)))
        (x (first coordenada)))
      (or (< x 0) (>= x (largura-tabuleiro tabuleiro)) (< y 0) (>= y (comprimento-tabuleiro tabuleiro))) 
     
   )
)

;; linha
;; teste: (linha 4 (tabuleiro-teste-solucao))
;; resultado: (1 0 0 0 1 1 0 0 2 2 2 2 2 2)
(defun linha (numlinha tabuleiro)
 "Funcao que retorna uma linha do tabuleiro enviados por parametro"
  (nth numlinha tabuleiro)
)

;; verificar-espacos-vazios
;; teste: (verificar-espacos-vazios (tabuleiro-teste-solucao) '(1 3))
;; resultado: T
(defun verificar-espacos-vazios (tabuleiro coordenada &optional (jogador 1))
 "Funcao que retorna T/NIL se a coordenada no tabuleiro, enviados por parametro, e um espaço possivel de jogar"
  (let ((y (car(last coordenada)))
        (x (first  coordenada))
        (jogadorAux (inverter-jogador jogador)))
     (cond
        ((fora-tabuleiro tabuleiro coordenada) NIL)
        ((/= (valor-coordenada tabuleiro coordenada) 0)nil)
        ((and (> x 0) (= (valor-coordenada tabuleiro (list (1- x) y)) jogadorAux)) NIL)
        ((and (< x (1- (largura-tabuleiro tabuleiro))) (= (valor-coordenada tabuleiro (list (1+ x) y)) jogadorAux)) NIL)
        ((and (> y 0) (= (valor-coordenada tabuleiro (list x (1- y))) jogadorAux)) NIL)
        ((and (< y (1- (comprimento-tabuleiro tabuleiro))) (= (valor-coordenada tabuleiro (list x (1+ y))) jogadorAux)) NIL)
        (t)
     )
  )
)

;; validar-primeira-jogada
(defun validar-primeira-jogada (tabuleiro jogador)
  (cond
   ((= jogador 1) (= (valor-coordenada tabuleiro '(0 0)) 0) T)
   ((= jogador 2) (= (valor-coordenada tabuleiro '(13 13)) 0) T)
   (t NIL)
  )
)


;;;;;;;;;; FUNÇÕES COORDENADAS TABULEIRO ;;;;;;;;;;

;; valor-coordenada
;; teste: (valor-coordenada (tabuleiro-teste-solucao) '(13 1))
;; resultado: 2
(defun valor-coordenada (tabuleiro coordenada)
 "Funcao que retorna o valor na coordenada do tabuleiro, enviados por parametro"
  (nth (first coordenada) (linha (car (last coordenada)) tabuleiro))
)


;; substituir-valor-na-linha
;; teste: (substituir-valor-na-linha (car (tabuleiro-vazio)) 6 1)
;; resultado: (0 0 0 0 0 0 1 0 0 0 0 0 0 0)
(defun substituir-valor-na-linha (linha x jogador)
 "Funcao que retorna a linha com linha alterada na possicao x, pelo valor enviado por parametro"
  (cond 
    ((null linha) NIL)
    ((= x 0) (cons (inverter-jogador jogador) (cdr linha)))
    (t (cons (car linha) (substituir-valor-na-linha (cdr linha) (1- x) (inverter-jogador jogador))))
  )
)

;; procura-linha 
;; teste: (procura-linha (tabuleiro-vazio) 3 6 1)
;; resolução: ((0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 1 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0))
(defun procura-linha (tabuleiro x y jogador)
 "Funcao que retorna o tabuleiro com o novo valor nas coordenadas x y, enviados por parametro"
  (cond
    ((= (length tabuleiro) 0) NIL)
    ((= y 0) (cons (substituir-valor-na-linha (car tabuleiro) x (inverter-jogador jogador)) (cdr tabuleiro)))
    (t (cons (car tabuleiro) (procura-linha (cdr tabuleiro) x (1- y) (inverter-jogador jogador))))
  )
)


;; procurar-coordenadas-possiveis-linha
;; teste: (procurar-coordenadas-possiveis-linha (tabuleiro-teste-solucao) (linha 2 (tabuleiro-teste-solucao)) 2)
;; resultado: (NIL NIL ((3 1) VERTICESUPDIR) ((1 3) VERTICEINFESQ) NIL NIL NIL NIL)
(defun procurar-coordenadas-possiveis-linha (tabuleiro jogador linha y &optional (x 0))
 "Funcao que retorna uma lista com as coordenadas e com o operador, que são possiveis jogar da linha enviada por parametro"
  (cond
    ((null linha) '())
    ( (= (car linha) (inverter-jogador jogador)) 
     (append
         (mapcar #'(lambda (coordenada) 
                     (cond
                       ((verificar-espacos-vazios tabuleiro (car coordenada) (inverter-jogador jogador)) coordenada)
                       (NIL)
                     )
                )
             (list (list (list (1+ x)(1+ y)) 'verticeInfDir)
                   (list (list (1- x)(1- y)) 'verticeSupEsq)
                   (list (list (1+ x)(1- y)) 'verticeSupDir)
                   (list (list (1- x)(1+ y)) 'verticeInfEsq))
          )
       (procurar-coordenadas-possiveis-linha tabuleiro (inverter-jogador jogador) (cdr linha) y (1+ x))))
    (t (procurar-coordenadas-possiveis-linha tabuleiro (inverter-jogador jogador) (cdr linha) y (1+ x)))
  )
)

;; procurar-coordenadas-possiveis
;; teste: (procurar-coordenadas-possiveis (tabuleiro-teste-solucao))
;; resultado: (NIL NIL NIL NIL NIL NIL NIL NIL NIL NIL NIL NIL NIL NIL NIL NIL NIL NIL ((3 1) VERTICESUPDIR) ((1 3) VERTICEINFESQ) NIL NIL NIL NIL NIL NIL NIL NIL NIL NIL ((1 3) VERTICESUPDIR) NIL NIL NIL NIL NIL NIL NIL NIL NIL ...)
(defun procurar-coordenadas-possiveis (tabuleiro jogador &optional (y 0))
 "Funcao que retorna uma lista com as coordenadas e com o operador, que são possiveis jogar no tabuleiro enviado por parametro" 
 (cond
    ((= y (comprimento-tabuleiro tabuleiro)) NIL)
    (t (append (procurar-coordenadas-possiveis-linha tabuleiro (inverter-jogador jogador) (linha y tabuleiro) y) (procurar-coordenadas-possiveis tabuleiro (inverter-jogador jogador) (1+ y))))
  )
)

;; lista-coordenadas-possiveis
;; teste: (lista-coordenadas-possiveis (tabuleiro-teste-solucao))
;; resultado: (((3 1) VERTICESUPDIR) ((1 3) VERTICESUPDIR))
(defun lista-coordenadas-possiveis (tabuleiro jogador)
 "Funcao que retorna uma lista de coordenadas possiveis no tabuleiro, enviado por parametro, sem valores a NIL"
(let ((jogadorAux (inverter-jogador jogador))) 
  (cond
    ((and(= (valor-coordenada tabuleiro '(0 0)) 0) (= jogadorAux 1)) '(((0 0) verticeInfDir)))
    ((and(= (valor-coordenada tabuleiro '(13 13)) 0) (= jogadorAux 2)) '(((13 13) verticeSupEsq)))
    (t(remove-duplicates (remover-se #'(lambda (valor) (null valor)) (procurar-coordenadas-possiveis tabuleiro jogadorAux)) :test 'equal :key 'CAR))
  )
)
  
)

;; valida-possivel-colocar-peca
(defun valida-possivel-colocar-peca (tabuleiro listaCoordenadas jogador)
 "Função que retorna se é possivel colocar a peca conforme a lista de coordenadas enviada por parametro"
  (cond
    ((and (= jogador 1) (= (valor-coordenada tabuleiro '(0 0)) 0)  (not (equal (car listaCoordenadas) '(0 0)))) NIL)
    ((and (= jogador 2) (= (valor-coordenada tabuleiro '(13 13))0) (not (equal (car (last listaCoordenadas)) '(13 13)))) NIL)
    (t (colocar-peca-verificar-coordenadas tabuleiro listaCoordenadas jogador))
  )
)

;; lista-coordenadas-peca
(defun lista-coordenadas-peca (peca coordenada)
"Função que retorna a lista de coordenadas da peca escolhida pelo utilizador Humano"
  (let ((y (car (last coordenada)))
        (x (first coordenada)))
    (cond
      ((or (null peca) (null coordenada)) NIL)
      ((equal peca "b") (list coordenada (list (1+ x) y) (list x (1+ y)) (list (1+ x) (1+ y))))
      ((equal peca "c1") (list (list (1+ x)(1- y))(list(+ 2 x)(1- y)) coordenada (list (1+ x) y)))
      ((equal peca "c2") (list coordenada (list x (1+ y))(list (1+ x)(1+ y))(list (1+ x)(+ 2 y))))
      (t (list coordenada))
    )
  )
)


;; validar-lista-coordenadas-vertices-peca
(defun validar-lista-coordenadas-vertices-peca (listaCoordenadas tabuleiro jogador)
"Função que retorna T/NIL se existe uma peca do humano na diagonal da peca que pretende jogar"
  (cond
    ((null listaCoordenadas) NIL)
    ((fora-tabuleiro tabuleiro (car listaCoordenadas))(validar-lista-coordenadas-vertices-peca (cdr listaCoordenadas) tabuleiro jogador))
    ((= (valor-coordenada tabuleiro (car listaCoordenadas)) jogador) T)
    (t (validar-lista-coordenadas-vertices-peca (cdr listaCoordenadas) tabuleiro jogador))
  )
)

;; lista-coordenadas-vertices-peca
(defun lista-coordenadas-vertices-peca (peca coordenada)
"Função que retorna a lista de coordenadas de todas as diagonais da pecaa ser jogada"
  (let ((y (car (last coordenada)))
        (x (first coordenada)))
    (cond
      ((or (null peca) (null coordenada)) NIL)
      ((equal peca "b")
        (list (list (1- x)(1- y)) (list (+ 3 x)(1- y)) (list (1- x) (+ 2 y))(list (+ 3 x) (+ 2 y)))
      )
      ((equal peca "c1") 
        (list (list x (- y 2)) (list (+ 3 x)(- y 2)) (list (1- x) (1- y))(list (+ 3 x) y) (list (1- x)(1+ y))(list (+ 2 x) (1+ y)))
      )
      ((equal peca "c2") 
        (list (list (1- x)(1- y)) (list (1+ x)(1- y))(list (+ 2 x) y)(list (1- x) (+ 2 y))(list x (+ 3 y))(list (+ 2 x) (+ 3 y)))
      )
      (t (list (list (1- x)(1- y))(list (1+ x)(1- y))(list (1- x) (1+ y))(list (1+ x) (1+ y))))
    )
  )
)


;; substituir-valores-linha
;; teste: (substituir-valores-linha '(0 0 0 0 0 0 0 0 0 0 0 0 0) '((0 0) (1 0) (0 1) (1 1)) 1)
;; resultado: (1 1 0 0 0 0 0 0 0 0 0 0 0)
(defun substituir-valores-linha (linha listaCoordenadas valor &optional (x 0))
 "Funcao que colocar o valor enviado na linha, nas coordenadas, dentro da lista de coordenadas enviada, que correspondem a linha enviada"
  (let ((coordenadaCorrente (car listaCoordenadas)))
    (cond
      ((or (null linha) (null coordenadaCorrente)) linha)
      ((= x (car coordenadaCorrente)) (cons valor (substituir-valores-linha (cdr linha) (cdr listaCoordenadas) (inverter-jogador valor) (1+ x))))
      (t (cons (car linha) (substituir-valores-linha (cdr linha) listaCoordenadas (inverter-jogador valor) (1+ x))))
    )
  )
)

;; substituir-valores-coluna
;; teste: (substituir-valores-coluna (tabuleiro-vazio) '((0 0) (1 0) (0 1) (1 1)) 1)
;; resultado: ((1 1 0 0 0 0 0 0 0 0 0 0 0 0) (1 1 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0))
(defun substituir-valores-coluna (tabuleiro listaCoordenadas valor &optional (y 0))
 "Funcao que colocar o valor, nas coordenadas do tabuleiro, possiveis existentes lista de coordenadas enviada"
  (let ((coordenadaCorrente (car listaCoordenadas)))
    (cond
      ((null coordenadaCorrente)  tabuleiro)
      ((= (cadr coordenadaCorrente) y ) 
         (cons (substituir-valores-linha (car tabuleiro) listaCoordenadas (inverter-jogador valor)) 
               (substituir-valores-coluna (cdr tabuleiro) (remover-se #'(lambda (coordenada) (= (cadr coordenada) y)) listaCoordenadas) (inverter-jogador valor) (1+ y))))
      (t(cons (car tabuleiro) (substituir-valores-coluna (cdr tabuleiro) listaCoordenadas (inverter-jogador valor) (1+ y))))
    )
  )
)

;; substituir-valores-tabuleiro
;; teste: (substituir-valores-tabuleiro (tabuleiro-vazio) '((0 0) (1 0) (0 1) (1 1)))
;; resultado: ((1 1 0 0 0 0 0 0 0 0 0 0 0 0) (1 1 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0))
(defun substituir-valores-tabuleiro (tabuleiro listaCoordenadas &optional (valor 1))
  "Funcao que retorna o tabuleiro com o valor nas coordenadas possiveis existentes na lista de coordenadas enviada"
  (substituir-valores-coluna tabuleiro listaCoordenadas (inverter-jogador valor))
)

;;;;;;;;;; OPERADORES ;;;;;;;;;; 

;; lista-operadores
;; teste: (lista-operadores)
;; resultado: (COLOCAR-PECA-S-HORIZONTAL-PONTA COLOCAR-PECA-S-HORIZONTAL-MEIO COLOCAR-PECA-S-VERTICAL-PONTA COLOCAR-PECA-S-VERTICAL-MEIO COLOCAR-MINI-QUADRADO COLOCAR-QUADRADO)
(defun lista-operadores ()
 "Funcao que retorna uma lista com todos os operadores"
  (list 'colocar-peca-s-horizontal-ponta 'colocar-peca-s-horizontal-meio 'colocar-peca-s-vertical-ponta 'colocar-peca-s-vertical-meio 'colocar-mini-quadrado 'colocar-quadrado)
)



;; colocar-peca-verificar-coordenadas
;; teste: (colocar-peca-verificar-coordenadas (tabuleiro-teste-solucao) '((0 0) (1 0) (0 1) (1 1)))
;; resultado: NIL
(defun colocar-peca-verificar-coordenadas (tabuleiro listaCoordenadas &optional (jogador 1))
 "Funcao que retorna T/NIL, se for possivel colocar uma peca em todas as coordenadas da lista de coordenadas enviada" 
  (cond
     ((null listaCoordenadas)T)
     ((null (verificar-espacos-vazios tabuleiro (car listaCoordenadas) (inverter-jogador jogador))) NIL)
     (t (colocar-peca-verificar-coordenadas tabuleiro (cdr listaCoordenadas) (inverter-jogador jogador)))
  )
)
;;criar-jogada
(defun criar-jogada(no tabuleiro  tipoPeca jogador)
  (let ((jogadorAux (inverter-jogador jogador ) ))
    (cond 
       ((= jogadorAux 1) (criar-no tabuleiro                                        
                       (tirar-peca tipoPeca no jogadorAux)(no-pecas-jogador no 2) no (1+ (no-profundidade no)) jogadorAux (pontuacao (tirar-peca tipoPeca no jogadorAux) ) (no-pontuacao-jogador no 2)))
       (t (criar-no  tabuleiro                                   
                     (no-pecas-jogador no 1)(tirar-peca tipoPeca no jogadorAux) no (1+ (no-profundidade no)) jogadorAux (no-pontuacao-jogador no 1) (pontuacao (tirar-peca tipoPeca no jogadorAux))))
     )
  )
) 

;; colocar-peca
;; teste: (colocar-peca '((((1 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 1 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0)) 0 72 0 0) ((8 10 15) 0) NIL) '((0 1) (1 1) (0 2) (2 2)) 1)
;; resultado: NIL
(defun colocar-peca (no listaCoordenadas tipoPeca jogador ) 
 "Funcao que retorna o novo no com a peca colocada ou NIL, caso seja possivel ou não colocar a peca, no tabuleiro do no enviado, com todas as coordenadas da lista de coordenadas livres e possiveis"
  (let ((jogadorAux (inverter-jogador jogador ) ))
    (cond
       ((null (colocar-peca-verificar-coordenadas (no-tabuleiro no) listaCoordenadas jogadorAux))NIL)
       (t   (criar-jogada no (substituir-valores-tabuleiro (no-tabuleiro no) listaCoordenadas jogadorAux) tipoPeca jogadorAux ))
     )
   )
)



;;;; MINI-QUADRADO

;; colocar-mini-quadrado
;; teste: (colocar-mini-quadrado (no-teste) '(0 0) 'geral 1)
;; resultado: ((((1 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0)) 1 72 1 0) ((9 10 15) 0) (((# # # # # # # # # # # # # #) 0 72 0 0) ((10 10 15) 0) NIL))
(defun colocar-mini-quadrado (no coordenada vertice jogador)
 "Funcao que retorna novo no com o mini quadrado colocado ou NIL"
  (let ((numPecas (nth 0 (no-pecas-jogador no (inverter-jogador jogador)))))
    (cond
      ((existePecas numPecas) NIL)
      ((null vertice) NIL)
      (t(colocar-peca no (list coordenada) 0 (inverter-jogador jogador)))
    )
  )
)

;;;; QUADRADO

;; colocar-quadrado
;; teste: (colocar-mini-quadrado (no-teste) '(0 0) 'verticeInfDir 1)
;; resultado: ((((1 1 0 0 0 0 0 0 0 0 0 0 0 0) (1 1 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0)) 4 72 1 0) ((10 9 15) 0) (((# # # # # # # # # # # # # #) 0 72 0 0) ((10 10 15) 0) NIL))
(defun colocar-quadrado (no coordenada vertice jogador)
  "Funcao que retorna novo no com o quadrado no tabuleiro ou NIL"
  (let ((y (car (last coordenada)))
        (x (first coordenada))
        (numPecas (nth 1 (no-pecas-jogador no (inverter-jogador jogador))))
        (jogadorAux (inverter-jogador jogador))) 
     (cond
        ((existePecas numPecas) NIL)
        ((eq vertice 'verticeSupEsq) (colocar-peca no (list (list (1- x) (1- y)) (list x (1- y)) (list (1- x) y) coordenada) 1 jogadorAux))
        ((eq vertice 'verticeSupDir) (colocar-peca no (list (list x (1- y))(list (1+ x) (1- y)) coordenada (list (1+ x) y)) 1 jogadorAux))
        ((eq vertice 'verticeInfEsq) (colocar-peca no (list (list (1- x)y) coordenada (list (1- x) (1+ y))   (list  x (1+ y))) 1 jogadorAux))
        ((eq vertice 'verticeInfDir) (colocar-peca no (list coordenada (list (1+ x)y)(list x (1+ y))(list (1+ x)(1+ y))) 1 jogadorAux))
        (NIL)
     )
  )
)


;;;; PECA S

;; colocar-peca-s-horizontal-ponta
;; teste: (colocar-peca-s-horizontal-ponta (no-teste) '(1 1) 'verticeInfDir 1)
;; resultado: ((((0 0 1 1 0 0 0 0 0 0 0 0 0 0) (0 1 1 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0)) 4 72 1 0) ((10 10 14) 0) (((# # # # # # # # # # # # # #) 0 72 0 0) ((10 10 15) 0) NIL))
(defun colocar-peca-s-horizontal-ponta (no coordenada vertice jogador)
 "Funcao que retorna novo no com a peca s horizontal, olhando ao vertice da ponta da peca, no tabuleiro ou NIL"
  (let ((y (car (last coordenada)))
        (x (first coordenada))
        (numPecas (nth 2 (no-pecas-jogador no jogador)))
         (jogadorAux (inverter-jogador jogador))) 
     (cond
        ((existePecas numPecas) NIL)
        ((or (eq vertice 'verticeSupEsq) (eq vertice 'verticeInfEsq)) (colocar-peca no (list (list (1- x) y) coordenada (list (- x 2)(1+ y))(list(1- x)(1+ y))) 2 jogadorAux))
        ((or (eq vertice 'verticeSupDir) (eq vertice 'verticeInfDir)) (colocar-peca no (list (list (1+ x)(1- y))(list(+ 2 x)(1- y)) coordenada (list (1+ x) y)) 2 jogadorAux))
        (NIL)
     )
  )
)

;; colocar-peca-s-horizontal-meio
;; teste: (colocar-peca-s-horizontal-meio (no-teste) '(1 1) 'verticeInfDir 1)
;; resultado: ((((0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 1 0 0 0 0 0 0 0 0 0 0 0 0) (0 1 1 0 0 0 0 0 0 0 0 0 0 0) (0 0 1 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0)) 4 72 1 0) ((10 10 14) 0) (((# # # # # # # # # # # # # #) 0 72 0 0) ((10 10 15) 0) NIL))
(defun colocar-peca-s-horizontal-meio (no coordenada vertice jogador)
 "Funcao que retorna novo no com a peca s horizontal, olhando ao vertice do centro da peca, no tabuleiro ou NIL"
  (let ((y (car (last coordenada)))
        (x (first coordenada))
        (numPecas (nth 2 (no-pecas-jogador no jogador)))
         (jogadorAux (inverter-jogador jogador))) 
     (cond
        ((existePecas numPecas) NIL)
        ((eq vertice 'verticeSupEsq) (colocar-peca no (list (list x (1- y))(list(1+ x)(1- y))(list (1- x) y) coordenada) 2 jogadorAux))
        ((eq vertice 'verticeInfDir) (colocar-peca no (list coordenada (list (1+ x) y)(list (1- x)(1+ y))(list x(1+ y))) 2 jogadorAux))
        (NIL)
     )
  )
)

;; colocar-peca-s-vertical-ponta
;; teste: (colocar-peca-s-vertical-ponta (no-teste) '(0 0) 'verticeInfDir 1)
;; resultado: ((((1 0 0 0 0 0 0 0 0 0 0 0 0 0) (1 1 0 0 0 0 0 0 0 0 0 0 0 0) (0 1 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0)) 4 72 1 0) ((10 10 14) 0) (((# # # # # # # # # # # # # #) 0 72 0 0) ((10 10 15) 0) NIL))
(defun colocar-peca-s-vertical-ponta (no coordenada vertice jogador)
 "Funcao que retorna novo no com a peca s vertical, olhando ao vertice da ponta da peca, no tabuleiro ou NIL"
  (let ((y (car (last coordenada)))
        (x (first coordenada))
        (numPecas (nth 2 (no-pecas-jogador no jogador)))
        (jogadorAux (inverter-jogador jogador))) 
     (cond
        ((existePecas numPecas) NIL)
        ((or (eq vertice 'verticeSupEsq) (eq vertice 'verticeSupDir)) (colocar-peca no (list (list (1- x)(- y 2))(list (1- x)(1- y))(list x (1- y)) coordenada) 2 jogadorAux))
        ((or (eq vertice 'verticeInfEsq) (eq vertice 'verticeInfDir)) (colocar-peca no (list coordenada (list x (1+ y))(list (1+ x)(1+ y))(list (1+ x)(+ 2 y))) 2 jogadorAux))
        (NIL)
     )
  )
)

;; colocar-peca-s-vertical-meio
;; teste: (colocar-peca-s-vertical-meio (no-teste) '(2 2) 'verticeInfEsq 1)
;; resultado: ((((0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 1 0 0 0 0 0 0 0 0 0 0 0 0) (0 1 1 0 0 0 0 0 0 0 0 0 0 0) (0 0 1 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0)) 4 72 1 0) ((10 10 14) 0) (((# # # # # # # # # # # # # #) 0 72 0 0) ((10 10 15) 0) NIL))
(defun colocar-peca-s-vertical-meio (no coordenada vertice jogador)
 "Funcao que retorna novo no com a peca s vertical, olhando ao vertice do centro da peca, no tabuleiro ou NIL"
  (let ((y (car (last coordenada)))
        (x (first coordenada))
        (numPecas (nth 2 (no-pecas-jogador no jogador)))
         (jogadorAux (inverter-jogador jogador))) 
     (cond
        ((existePecas numPecas) NIL)
        ((eq vertice 'verticeSupDir) (colocar-peca no (list (list x (1- y)) coordenada (list (1+ x) y)(list (1+ x)(1+ y))) 2 jogadorAux))
        ((eq vertice 'verticeInfEsq) (colocar-peca no (list (list (1- x)(1- y))(list (1- x)  y) coordenada (list x (1+ y))) 2 jogadorAux))
        (NIL)
     )
  )
)

;;;;;;;;;; SUCESSORES ;;;;;;;;;; 

;; lista-sucessores
;; teste: (lista-sucessores (no-teste))
;; resultado:
(defun lista-sucessores (no jogador)
 "Funcao que retorna a lista de nos sucessores, ou seja as jogadas" 
  (let ((listaCoordenadas (lista-coordenadas-possiveis (no-tabuleiro no) (inverter-jogador jogador))))
   (cond
       ((null listaCoordenadas) NIL)
       (t (remover-se #'(lambda (valor)(null valor))(juntar-lista 
           (mapcar #'(lambda (coordenada)
                      (mapcar #'(lambda (operador) (funcall operador no (car coordenada) (cadr coordenada) (inverter-jogador jogador)))(lista-operadores))) 
                   listaCoordenadas))))
    ) 
  )
) 







