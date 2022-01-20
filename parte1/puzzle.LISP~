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

;; tabuleiro-teste
(defun tabuleiro-teste-vazio ()
  '(
      (0 0 0 0 2 2 2 2 2 2 2 2 2 2)
      (0 0 0 0 2 2 2 2 2 2 2 2 2 2)
      (0 0 0 0 0 0 2 2 2 2 2 2 2 2)
      (0 0 0 0 0 0 2 2 2 2 2 2 2 2)
      (0 0 0 0 0 0 0 0 2 2 2 2 2 2)
      (0 0 0 0 0 0 0 0 2 2 2 2 2 2)
      (0 0 0 0 0 0 0 0 0 0 2 2 2 2)
      (2 0 0 0 0 0 0 0 0 0 2 2 2 2)
      (2 2 0 0 0 0 0 0 0 0 0 0 2 2)
      (2 2 2 0 0 0 0 0 0 0 0 0 2 2)
      (2 2 2 2 0 0 0 0 0 0 0 0 0 0)
      (2 2 2 2 2 0 0 0 0 0 0 0 0 0)
      (2 2 2 2 2 2 0 0 0 0 0 0 0 0)
      (2 2 2 2 2 2 2 0 0 0 0 0 0 0)
   )
)

;; tabuleiro-teste-solucao
(defun tabuleiro-teste-solucao ()
  '(
      (1 1 0 0 2 2 2 2 2 2 2 2 2 2)
      (1 1 0 0 2 2 2 2 2 2 2 2 2 2)
      (0 0 1 0 0 1 2 2 2 2 2 2 2 2)
      (0 0 0 0 1 0 2 2 2 2 2 2 2 2)
      (1 0 0 0 1 1 0 0 2 2 2 2 2 2)
      (0 1 1 0 0 1 0 1 2 2 2 2 2 2)
      (0 1 1 0 0 0 1 0 1 0 2 2 2 2)
      (2 0 0 1 1 0 1 1 0 0 2 2 2 2)
      (2 2 0 1 1 0 0 1 0 1 1 0 2 2)
      (2 2 2 0 0 1 1 0 1 1 0 0 2 2)
      (2 2 2 2 0 1 1 0 0 0 0 1 0 1)
      (2 2 2 2 2 0 0 1 1 0 0 0 1 0)
      (2 2 2 2 2 2 0 1 1 0 1 1 0 1)
      (2 2 2 2 2 2 2 0 0 1 1 0 1 0)
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




;;;;;;;;;; FUNÇÕES NO ;;;;;;;;;; 

;; criar-no
;; teste: (criar-no (tabuleiro-vazio) 0 '(10 10 15) NIL)
;; resultado: ((((0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0)) 0 NIL 0 0) ((10 10 15) 0) NIL)
(defun criar-no (tabuleiro casasPreenchidas pecas noPai &optional (profundidade 0)(heuristica 0)(jogador 0))
 "Funcao que cria um no com as propriedades do mesmo enviadas por parametro"
  (list (list tabuleiro casasPreenchidas (no-min-casas noPai) profundidade heuristica) (list pecas jogador) noPai)
)

;; no-teste
;; teste: (no-teste)
;; resultado: ((((0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0)) 0 72 0 0) ((10 10 15) 0) NIL)
(defun no-teste ()
 "Funcao que retorna um um no por defeito"
  (list (list (tabuleiro-vazio) 0 72 0 0) '((10 10 15) 0) NIL)
)

;; no-inicial
;; teste: (no-inicial)
;; resultado: ((((0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0)) 0 72 0 0) ((10 10 15) 0) NIL)
(defun no-inicial (&optional (tabuleiro (tabuleiro-vazio)) (minCasas 72))
  "Funcao que define um no inical do problema"
  (list (list tabuleiro 0 minCasas 0 0) '((10 10 15) 0) NIL)
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

;; no-casas-preenchidas
;; teste: (no-casas-preenchidas (no-teste))
;; resultado: 0
(defun no-casas-preenchidas (no)
 "Funcao que retorna o numero de casas preenchidas do no enviado por paramatro"
  (cadar no)
)

;; no-min-casas
;; teste: (no-min-casas (no-teste))
;; resultado: 72
(defun no-min-casas (no)
 "Funcao que retorna o numero minimo de casas a preencher do no enviado por paramatro"
  (caddar no)
)

;; no-pecas
;; teste: (no-pecas (no-teste))
;; resultado: (10 10 15)
(defun no-pecas (no)
 "Funcao que retorna a lista de pecas do no enviado por paramatro"
  (caadr no)
)

;; no-jogador
;; teste: (no-jogador (no-teste))
;; resultado: 0
(defun no-jogador (no)
 "Funcao que retorna o jogador do no enviado por paramatro"
  (cadadr no)
)

;; no-heuristica
;; teste: (no-heuristica (no-teste))
;; resultado: 0
(defun no-heuristica (no) 
 "Funcao que retorna a heuristica do no enviado por paramatro"
  (car(cdr(cdr(cdr(cdr(car no))))))
)

;; no-custo
;; teste: (no-custo (no-teste))
;; resultado: 0
(defun no-custo (no)
 "Funcao que retorna o custo do no enviado por paramatro"
  (+(no-profundidade no)(no-heuristica no))
)

;; no-profundidade
;; teste: (no-profundidade (no-teste))
;; resultado: 0
(defun no-profundidade (no)
 "Funcao que retorna aprofundidade do no enviado por paramatro"
  (car(cdr(cdr(cdr(car no)))))
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
(defun tirar-peca (peca no)
 "Funcao que retorna a nova lista de pecas do no enviado por paramatro, com menos uma peca, do tipo enviado por parametro"
  (let ((numPecas (nth peca (no-pecas no))))
    (cond
      ((= peca 0) (cons (1- numPecas) (cdr (no-pecas no))))
      ((= peca 1) (cons (car (no-pecas no)) (list (1- numPecas) (car (last (no-pecas no))))))
      (t (cons (car (no-pecas no)) (list (cadr (no-pecas no)) (1- numPecas))))
    )
  )
)

;; no-solucao
;; teste: (no-solucao (no-teste))
;; resultado: NIL
(defun no-solucao (no)
 "Funcao que retorna T/NIL se o no enviado por parametro e solucao, comprimindo a condicao de que o minimo de casas a preencher tem de ser menor ou igual as casas preenchidas"
  (<= (no-min-casas no)(no-casas-preenchidas no))
)

;; no-objetivoP
;; teste: (no-objetivoP (lista-sucessores (no-teste)))
;; resultado: NIL
(defun no-objetivoP (listSucessores) 
 "Funcao que retorna se algum dos nos na lista de sucessores enviada por parametro é o no objetivo"
  (cond
    ((null listSucessores) NIL)
    ((no-solucao (car listSucessores)) (car listSucessores))
    ((no-objetivoP (cdr listSucessores)))
  )
)

;; heuristica-default
;; teste: (heuristica-default (no-teste))
;; resultado: 72
(defun heuristica-default (no)
 "Funcao que retorna o valor heuristico, do no enviado por parametro, a diferenca entre o minimo de casas a preencher e as casas preenchidas"
  (- (no-min-casas no)(no-casas-preenchidas no))
)

;; heuristica-custom 
;; teste: (heuristica-custom (no-teste))
;; resultado: 70
(defun heuristica-custom (no)
 "Funcao que retorna o valor heuristico, do no enviado por parametro, a soma entre o da multiplicação do peso que cada peca tem"
 (apply'+ (list (* (nth 1 (no-pecas no)) 3) (* 2(nth 2 (no-pecas no))) (nth 0 (no-pecas no))))
)

;; calcular-heuristica
;; teste: (calcular-heuristica (no-teste) 'heuristica-custom)
;; resultado: ((((0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0)) 0 NIL 0 70) ((10 10 15) 0) NIL)
(defun calcular-heuristica (no heuristica)
 "Funcao que retorna o no com o novo valor heuristico calculado"
  (cond
    ((null no) NIL)
    ((null heuristica) no)
    (t(criar-no (no-tabuleiro no) (no-casas-preenchidas no) (no-pecas no) (no-pai no) (no-profundidade no) (funcall heuristica no) (no-jogador no)))
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
(defun verificar-espacos-vazios (tabuleiro coordenada &optional (valor 1))
 "Funcao que retorna T/NIL se a coordenada no tabuleiro, enviados por parametro, e um espaço possivel de jogar"
  (let ((y (car(last coordenada)))
        (x (first  coordenada)))
     (cond
        ((fora-tabuleiro tabuleiro coordenada) NIL)
        ((/= (valor-coordenada tabuleiro coordenada) 0)nil)
        ((and (> x 0) (= (valor-coordenada tabuleiro (list (1- x) y)) valor)) NIL)
        ((and (< x (1- (largura-tabuleiro tabuleiro))) (= (valor-coordenada tabuleiro (list (1+ x) y)) valor)) NIL)
        ((and (> y 0) (= (valor-coordenada tabuleiro (list x (1- y))) valor)) NIL)
        ((and (< y (1- (comprimento-tabuleiro tabuleiro))) (= (valor-coordenada tabuleiro (list x (1+ y))) valor)) NIL)
        (t)
     )
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
(defun substituir-valor-na-linha (linha x valor)
 "Funcao que retorna a linha com linha alterada na possicao x, pelo valor enviado por parametro"
  (cond 
    ((null linha) NIL)
    ((= x 0) (cons valor (cdr linha)))
    (t (cons (car linha) (substituir-valor-na-linha (cdr linha) (1- x) valor)))
  )
)

;; procura-linha 
;; teste: (procura-linha (tabuleiro-vazio) 3 6 1)
;; resolução: ((0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 1 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0))
(defun procura-linha (tabuleiro x y valor)
 "Funcao que retorna o tabuleiro com o novo valor nas coordenadas x y, enviados por parametro"
  (cond
    ((= (length tabuleiro) 0) NIL)
    ((= y 0) (cons (substituir-valor-na-linha (car tabuleiro) x valor) (cdr tabuleiro)))
    (t (cons (car tabuleiro) (procura-linha (cdr tabuleiro) x (1- y) valor)))
  )
)

;; procurar-coordenadas-possiveis-linha
;; teste: (procurar-coordenadas-possiveis-linha (tabuleiro-teste-solucao) (linha 2 (tabuleiro-teste-solucao)) 2)
;; resultado: (NIL NIL ((3 1) VERTICESUPDIR) ((1 3) VERTICEINFESQ) NIL NIL NIL NIL)
(defun procurar-coordenadas-possiveis-linha (tabuleiro linha y &optional (x 0) (valor 1))
 "Funcao que retorna uma lista com as coordenadas e com o operador, que são possiveis jogar da linha enviada por parametro"
  (cond
    ((null linha) '())
    ((= (car linha) 1)
     (append
         (mapcar #'(lambda (coordenada) 
                     (cond
                       ((verificar-espacos-vazios tabuleiro (car coordenada) valor) coordenada)
                       (NIL)
                     )
                )
             (list (list (list (1+ x)(1+ y)) 'verticeInfDir)
                   (list (list (1- x)(1- y)) 'verticeSupEsq)
                   (list (list (1+ x)(1- y)) 'verticeSupDir)
                   (list (list (1- x)(1+ y)) 'verticeInfEsq))
          )
       (procurar-coordenadas-possiveis-linha tabuleiro (cdr linha) y (1+ x))))
    (t (procurar-coordenadas-possiveis-linha tabuleiro (cdr linha) y (1+ x)))
  )
)

;; procurar-coordenadas-possiveis
;; teste: (procurar-coordenadas-possiveis (tabuleiro-teste-solucao))
;; resultado: (NIL NIL NIL NIL NIL NIL NIL NIL NIL NIL NIL NIL NIL NIL NIL NIL NIL NIL ((3 1) VERTICESUPDIR) ((1 3) VERTICEINFESQ) NIL NIL NIL NIL NIL NIL NIL NIL NIL NIL ((1 3) VERTICESUPDIR) NIL NIL NIL NIL NIL NIL NIL NIL NIL ...)
(defun procurar-coordenadas-possiveis (tabuleiro &optional (y 0))
 "Funcao que retorna uma lista com as coordenadas e com o operador, que são possiveis jogar no tabuleiro enviado por parametro"
  (cond
    ((= y (comprimento-tabuleiro tabuleiro)) NIL)
    (t (append (procurar-coordenadas-possiveis-linha tabuleiro (linha y tabuleiro) y) (procurar-coordenadas-possiveis tabuleiro (1+ y))))
  )
)

;; lista-coordenadas-possiveis
;; teste: (lista-coordenadas-possiveis (tabuleiro-teste-solucao))
;; resultado: (((3 1) VERTICESUPDIR) ((1 3) VERTICESUPDIR))
(defun lista-coordenadas-possiveis (tabuleiro)
 "Funcao que retorna uma lista de coordenadas possiveis no tabuleiro, enviado por parametro, sem valores a NIL"
  (cond
    ((= (valor-coordenada tabuleiro '(0 0)) 0) '(((0 0) verticeInfDir)))
    (t(remove-duplicates (remover-se #'(lambda (valor) (null valor)) (procurar-coordenadas-possiveis tabuleiro)) :test 'equal :key 'CAR))
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
      ((= x (car coordenadaCorrente)) (cons valor (substituir-valores-linha (cdr linha) (cdr listaCoordenadas) valor (1+ x))))
      (t (cons (car linha) (substituir-valores-linha (cdr linha) listaCoordenadas valor (1+ x))))
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
         (cons (substituir-valores-linha (car tabuleiro) listaCoordenadas valor) 
               (substituir-valores-coluna (cdr tabuleiro) (remover-se #'(lambda (coordenada) (= (cadr coordenada) y)) listaCoordenadas) valor (1+ y))))
      (t(cons (car tabuleiro) (substituir-valores-coluna (cdr tabuleiro) listaCoordenadas valor (1+ y))))
    )
  )
)

;; substituir-valores-tabuleiro
;; teste: (substituir-valores-tabuleiro (tabuleiro-vazio) '((0 0) (1 0) (0 1) (1 1)))
;; resultado: ((1 1 0 0 0 0 0 0 0 0 0 0 0 0) (1 1 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0))
(defun substituir-valores-tabuleiro (tabuleiro listaCoordenadas &optional (valor 1))
  "Funcao que retorna o tabuleiro com o valor nas coordenadas possiveis existentes na lista de coordenadas enviada"
  (substituir-valores-coluna tabuleiro listaCoordenadas valor)
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
(defun colocar-peca-verificar-coordenadas (tabuleiro listaCoordenadas &optional (valor 1))
 "Funcao que retorna T/NIL, se for possivel colocar uma peca em todas as coordenadas da lista de coordenadas enviada" 
  (cond
     ((null listaCoordenadas)T)
     ((null (verificar-espacos-vazios tabuleiro (car listaCoordenadas) valor)) NIL)
     (t(colocar-peca-verificar-coordenadas tabuleiro (cdr listaCoordenadas)))
  )
)


;; colocar-peca
;; teste: (colocar-peca '((((1 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 1 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0)) 0 72 0 0) ((8 10 15) 0) NIL) '((0 1) (1 1) (0 2) (2 2)) 1)
;; resultado: NIL
(defun colocar-peca (no listaCoordenadas tipoPeca &optional (valor 1)) 
 "Funcao que retorna o novo no com a peca colocada ou NIL, caso seja possivel ou não colocar a peca, no tabuleiro do no enviado, com todas as coordenadas da lista de coordenadas livres e possiveis"
  (cond
    ((null (colocar-peca-verificar-coordenadas (no-tabuleiro no) listaCoordenadas))NIL)
    (t (criar-no                                         
           (substituir-valores-tabuleiro (no-tabuleiro no) listaCoordenadas valor) 
            (+ (no-casas-preenchidas no) (length listaCoordenadas)) (tirar-peca tipoPeca no) no (1+ (no-profundidade no))))
  )
)

;;;; MINI-QUADRADO

;; colocar-mini-quadrado
;; teste: (colocar-mini-quadrado (no-teste) '(0 0) 'geral 1)
;; resultado: ((((1 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0)) 1 72 1 0) ((9 10 15) 0) (((# # # # # # # # # # # # # #) 0 72 0 0) ((10 10 15) 0) NIL))
(defun colocar-mini-quadrado (no coordenada vertice valor)
 "Funcao que retorna novo no com o mini quadrado colocado ou NIL"
  (let ((numPecas (nth 0 (no-pecas no))))
    (cond
      ((existePecas numPecas) NIL)
      ((null vertice) NIL)
      (t(colocar-peca no (list coordenada) 0 valor))
    )
  )
)

;;;; QUADRADO

;; colocar-quadrado
;; teste: (colocar-mini-quadrado (no-teste) '(0 0) 'verticeInfDir 1)
;; resultado: ((((1 1 0 0 0 0 0 0 0 0 0 0 0 0) (1 1 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0)) 4 72 1 0) ((10 9 15) 0) (((# # # # # # # # # # # # # #) 0 72 0 0) ((10 10 15) 0) NIL))
(defun colocar-quadrado (no coordenada vertice valor)
  "Funcao que retorna novo no com o quadrado no tabuleiro ou NIL"
  (let ((y (car (last coordenada)))
        (x (first coordenada))
        (numPecas (nth 1 (no-pecas no)))) 
     (cond
        ((existePecas numPecas) NIL)
        ((eq vertice 'verticeSupEsq) (colocar-peca no (list (list (1- x) (1- y)) (list x (1- y)) (list (1- x) y) coordenada) 1 valor))
        ((eq vertice 'verticeSupDir) (colocar-peca no (list (list x (1- y))(list (1+ x) (1- y)) coordenada (list (1+ x) y)) 1 valor))
        ((eq vertice 'verticeInfEsq) (colocar-peca no (list (list (1- x)y) coordenada (list (1- x) (1+ y))   (list  x (1+ y))) 1 valor))
        ((eq vertice 'verticeInfDir) (colocar-peca no (list coordenada (list (1+ x)y)(list x (1+ y))(list (1+ x)(1+ y))) 1 valor))
        (NIL)
     )
  )
)


;;;; PECA S

;; colocar-peca-s-horizontal-ponta
;; teste: (colocar-peca-s-horizontal-ponta (no-teste) '(1 1) 'verticeInfDir 1)
;; resultado: ((((0 0 1 1 0 0 0 0 0 0 0 0 0 0) (0 1 1 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0)) 4 72 1 0) ((10 10 14) 0) (((# # # # # # # # # # # # # #) 0 72 0 0) ((10 10 15) 0) NIL))
(defun colocar-peca-s-horizontal-ponta (no coordenada vertice valor)
 "Funcao que retorna novo no com a peca s horizontal, olhando ao vertice da ponta da peca, no tabuleiro ou NIL"
  (let ((y (car (last coordenada)))
        (x (first coordenada))
        (numPecas (nth 2 (no-pecas no)))) 
     (cond
        ((existePecas numPecas) NIL)
        ((or (eq vertice 'verticeSupEsq) (eq vertice 'verticeInfEsq)) (colocar-peca no (list (list (1- x) y) coordenada (list (- x 2)(1+ y))(list(1- x)(1+ y))) 2 valor))
        ((or (eq vertice 'verticeSupDir) (eq vertice 'verticeInfDir)) (colocar-peca no (list (list (1+ x)(1- y))(list(+ 2 x)(1- y)) coordenada (list (1+ x) y)) 2 valor))
        (NIL)
     )
  )
)

;; colocar-peca-s-horizontal-meio
;; teste: (colocar-peca-s-horizontal-meio (no-teste) '(1 1) 'verticeInfDir 1)
;; resultado: ((((0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 1 0 0 0 0 0 0 0 0 0 0 0 0) (0 1 1 0 0 0 0 0 0 0 0 0 0 0) (0 0 1 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0)) 4 72 1 0) ((10 10 14) 0) (((# # # # # # # # # # # # # #) 0 72 0 0) ((10 10 15) 0) NIL))
(defun colocar-peca-s-horizontal-meio (no coordenada vertice valor)
 "Funcao que retorna novo no com a peca s horizontal, olhando ao vertice do centro da peca, no tabuleiro ou NIL"
  (let ((y (car (last coordenada)))
        (x (first coordenada))
        (numPecas (nth 2 (no-pecas no)))) 
     (cond
        ((existePecas numPecas) NIL)
        ((eq vertice 'verticeSupEsq) (colocar-peca no (list (list x (1- y))(list(1+ x)(1- y))(list (1- x) y) coordenada) 2 valor))
        ((eq vertice 'verticeInfDir) (colocar-peca no (list coordenada (list (1+ x) y)(list (1- x)(1+ y))(list x(1+ y))) 2 valor))
        (NIL)
     )
  )
)

;; colocar-peca-s-vertical-ponta
;; teste: (colocar-peca-s-vertical-ponta (no-teste) '(0 0) 'verticeInfDir 1)
;; resultado: ((((1 0 0 0 0 0 0 0 0 0 0 0 0 0) (1 1 0 0 0 0 0 0 0 0 0 0 0 0) (0 1 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0)) 4 72 1 0) ((10 10 14) 0) (((# # # # # # # # # # # # # #) 0 72 0 0) ((10 10 15) 0) NIL))
(defun colocar-peca-s-vertical-ponta (no coordenada vertice valor)
 "Funcao que retorna novo no com a peca s vertical, olhando ao vertice da ponta da peca, no tabuleiro ou NIL"
  (let ((y (car (last coordenada)))
        (x (first coordenada))
        (numPecas (nth 2 (no-pecas no)))) 
     (cond
        ((existePecas numPecas) NIL)
        ((or (eq vertice 'verticeSupEsq) (eq vertice 'verticeSupDir)) (colocar-peca no (list (list (1- x)(- y 2))(list (1- x)(1- y))(list x (1- y)) coordenada) 2 valor))
        ((or (eq vertice 'verticeInfEsq) (eq vertice 'verticeInfDir)) (colocar-peca no (list coordenada (list x (1+ y))(list (1+ x)(1+ y))(list (1+ x)(+ 2 y))) 2 valor))
        (NIL)
     )
  )
)

;; colocar-peca-s-vertical-meio
;; teste: (colocar-peca-s-vertical-meio (no-teste) '(2 2) 'verticeInfEsq 1)
;; resultado: ((((0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 1 0 0 0 0 0 0 0 0 0 0 0 0) (0 1 1 0 0 0 0 0 0 0 0 0 0 0) (0 0 1 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0)) 4 72 1 0) ((10 10 14) 0) (((# # # # # # # # # # # # # #) 0 72 0 0) ((10 10 15) 0) NIL))
(defun colocar-peca-s-vertical-meio (no coordenada vertice valor)
 "Funcao que retorna novo no com a peca s vertical, olhando ao vertice do centro da peca, no tabuleiro ou NIL"
  (let ((y (car (last coordenada)))
        (x (first coordenada))
        (numPecas (nth 2 (no-pecas no)))) 
     (cond
        ((existePecas numPecas) NIL)
        ((eq vertice 'verticeSupDir) (colocar-peca no (list (list x (1- y)) coordenada (list (1+ x) y)(list (1+ x)(1+ y))) 2 valor))
        ((eq vertice 'verticeInfEsq) (colocar-peca no (list (list (1- x)(1- y))(list (1- x)  y) coordenada (list x (1+ y))) 2 valor))
        (NIL)
     )
  )
)




;;;;;;;;;; SUCESSORES ;;;;;;;;;; 

;; lista-sucessores
;; teste: (lista-sucessores (no-teste))
;; resultado: ((((# # # # # # # # # # # # # #) 4 72 1 0) ((10 10 14) 0) ((# 0 72 0 0) (# 0) NIL)) (((# # # # # # # # # # # # # #) 1 72 1 0) ((9 10 15) 0) ((# 0 72 0 0) (# 0) NIL)) (((# # # # # # # # # # # # # #) 4 72 1 0) ((10 9 15) 0) ((# 0 72 0 0) (# 0) NIL)))
(defun lista-sucessores (no &optional (heuristica NIL) (valor 1))
 "Funcao que retorna a lista de nos sucessores, ou seja as jogadas" 
  (let ((listaCoordenadas (lista-coordenadas-possiveis (no-tabuleiro no))))
   (cond
       ((null listaCoordenadas) NIL)
       (t (remover-se #'(lambda (valor)(null valor))(juntar-lista 
           (mapcar #'(lambda (coordenada)
                      (mapcar #'(lambda (operador) (calcular-heuristica (funcall operador no (car coordenada) (cadr coordenada) valor) heuristica))(lista-operadores))) 
                   listaCoordenadas))))
    ) 
  )
) 

