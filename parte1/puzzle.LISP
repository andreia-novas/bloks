;;;; puzzle.lisp
;;;; Dominio do prolema
;;;; Disciplina de IA - 2021 / 2022
;;;; Autor: Joana Guerreiro e Andreia Novas

;; remover-se
;; teste: (remover-se #'(lambda (x) (= x 0)) '(1 2 0 2 0 4))
(defun remover-se (pred lista)
"Remover valor da lista se preecher condicao (remover-se #'(lambda (x) (= x 0)) '(1 2 0 2 0 4))"
  (cond 
   ((null lista) NIL) 
   ((funcall pred (car lista)) (remover-se pred (cdr lista)))
   (T (cons (car lista) (remover-se pred (cdr lista))))
  )
)

;; juntar-lista
;; teste: (juntar-lista (tabuleiro-teste))
(defun juntar-lista (lista)
 "Retorna todos os valores do tabuleiro numa lista só"
  (cond
    ((null lista) '())
    ((append (car lista) (juntar-lista (cdr lista))))
  )
)

;; criar-no
(defun criar-no (tabuleiro minCasas pecas noPai &optional (jogador 0))
  (list (list tabuleiro minCasas) (list pecas jogador) noPai)
)

;; no-teste
(defun no-teste ()
  (list (list (tabuleiro-vazio) 72) '((10 10 15) 0) NIL)
)

;; no-inicial
;; teste: (no-inicial)
(defun no-inicial (&optional (tabuleiro (tabuleiro-vazio)) (minCasas 72))
  "Define um no inical do problema"
  (list (list tabuleiro minCasas) '((10 10 15) 0) NIL)
)

;; no-pai 
(defun no-pai (no)
  (car (last no))
)

;; no-tabuleiro
(defun no-tabuleiro (no)
  (caar no)
)

;; no-min-casas
(defun no-min-casas (no)
  (cadar no)
)

;; no-pecas
(defun no-pecas (no)
  (caadr no)
)

;; no-jogador
(defun no-jogador (no)
  (cadadr no)
)

;; tabuleiro-teste
(defun tabuleiro-teste ()
  '(
      (1 1 0 0 2 2 2 2 2 2 2 2 2 2)
      (1 1 0 0 2 2 2 2 2 2 2 2 2 2)
      (0 0 0 0 0 1 2 2 2 2 2 2 2 2)
      (0 1 0 0 1 0 2 2 2 2 2 2 2 2)
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

;; tabuleiro-vazio
(defun tabuleiro-teste2 ()
  '(
      (0 0 0 0 0 0 0 0 0 0 0 0 0 0)
      (0 0 0 0 0 0 0 0 0 0 0 0 0 0)
      (0 0 0 0 0 0 0 0 0 0 0 0 0 0)
      (0 0 0 0 0 0 0 0 0 0 0 0 0 0)
      (0 0 0 0 0 0 0 0 0 0 0 0 0 0)
      (0 0 0 0 0 0 0 0 0 0 0 0 0 0)
      (0 0 0 0 0 0 0 0 0 0 0 0 0 0)
      (0 0 0 0 0 0 1 0 0 0 0 0 0 0) 
      (0 0 0 0 0 0 0 0 0 0 0 0 0 0)
      (0 0 0 0 0 0 0 0 0 0 0 0 0 0)
      (0 0 0 0 0 0 0 0 0 0 0 0 0 0)
      (0 0 0 0 0 0 0 0 0 0 0 0 0 0)
      (0 0 0 0 0 0 0 0 0 0 0 0 0 0)
      (0 0 0 0 0 0 0 0 0 0 0 0 0 0)
  )
)

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

;; largura-tabuleiro
(defun largura-tabuleiro (tabuleiro)
  (length (car tabuleiro))
)

;; comprimento-tabuleiro
(defun comprimento-tabuleiro (tabuleiro)
  (length tabuleiro)
)

;; fora-tabuleiro
(defun fora-tabuleiro (tabuleiro coordenada)
  (let ((y (car (last coordenada)))
        (x (first coordenada)))
     (or (< x 0) (>= x (largura-tabuleiro tabuleiro)) (< y 0) (>= y (comprimento-tabuleiro tabuleiro)))
  )
)

;; linha
(defun linha (numlinha tabuleiro)
  (nth numlinha tabuleiro)
)

;; existePecas
(defun existePecas (numPecas)
  (<= numPecas 0)
)

;; valor-coordenada
;; teste: (valor-coordenada (tabuleiro-vazio) '(1 1))
(defun valor-coordenada (tabuleiro coordenada)
  (nth (first coordenada) (linha (car (last coordenada)) tabuleiro))
)

;; substituir-valor-na-linha
;; teste: (substituir-valor-na-linha (car (tabuleiro-vazio)) 6 1)
(defun substituir-valor-na-linha (linha x valor)
  (cond 
    ((null linha) NIL)
    ((= x 0) (cons valor (cdr linha)))
    (t (cons (car linha) (substituir-valor-na-linha (cdr linha) (1- x) valor)))
  )
)

;; procura-linha 
;; teste: (procura-linha (tabuleiro-vazio) 3 6 1)
(defun procura-linha (tabuleiro x y valor)
  (cond
    ((= (length tabuleiro) 0) NIL)
    ((= y 0) (cons (substituir-valor-na-linha (car tabuleiro) x valor) (cdr tabuleiro)))
    (t (cons (car tabuleiro) (procura-linha (cdr tabuleiro) x (1- y) valor)))
  )
)

;; procurar-coordenadas-possiveis-linha
;; teste: (procurar-coordenadas-possiveis-linha '(0 0 0 0 1 0 0 0 0 0 0 0 0))
(defun procurar-coordenadas-possiveis-linha (tabuleiro linha y &optional (x 0))
  (cond
    ((null linha) '())
    ((= (car linha) 1)
     (cons
         (mapcar #'(lambda (coordenada) 
                 (cond
                   ((fora-tabuleiro tabuleiro coordenada) NIL)
                   ((= (valor-coordenada tabuleiro coordenada) 0) coordenada)
                   (NIL)
                 )
                ) 
         (list (list (1+ x) (1+ y)) (list (1- x) (1- y)) (list (1+ x) (1- y)) (list (1- x) (1+ y))))
       (procurar-coordenadas-possiveis-linha tabuleiro (cdr linha) y (1+ x))))
    (t (procurar-coordenadas-possiveis-linha tabuleiro (cdr linha) y (1+ x)))
  )
)

;; procurar-coordenadas-possiveis
(defun procurar-coordenadas-possiveis (tabuleiro &optional (y 0))
  (cond
    ((= y (comprimento-tabuleiro tabuleiro)) NIL)
    (t (cons (procurar-coordenadas-possiveis-linha tabuleiro (linha y tabuleiro) y)(procurar-coordenadas-possiveis tabuleiro (1+ y))))
  )
)

;; lista-coordenadas-possiveis
(defun lista-coordenadas-possiveis (tabuleiro)
  (cond
    ((= (valor-coordenada tabuleiro '(0 0)) 0) '((0 0)))
    (t (remover-se #'(lambda (valor) (null valor)) (juntar-lista (juntar-lista (procurar-coordenadas-possiveis tabuleiro)))))
  )
)

;; substituir-valor-coordenada
;; teste: (substituir-valor-tabuleiro (tabuleiro-teste) '(0 0))  -> res: NIL
;;        (substituir-valor-tabuleiro (tabuleiro-vazio) '(-1 0)) -> res: NIL
;;        (substituir-valor-tabuleiro (tabuleiro-teste) '(20 0)) -> res: NIL
;;        (substituir-valor-tabuleiro (tabuleiro-teste) '(0 -1)) -> res: NIL
;;        (substituir-valor-tabuleiro (tabuleiro-teste) '(0 20)) -> res: NIL
;;        (substituir-valor-tabuleiro (tabuleiro-vazio) '(6 3)) -> res: 
(defun substituir-valor-tabuleiro (tabuleiro coordenada &optional (valor 1))
  (cond
     ((fora-tabuleiro tabuleiro coordenada) NIL)
     ((/= (valor-coordenada tabuleiro coordenada) 0) NIL)
     (t (procura-linha tabuleiro (first coordenada) (car (last coordenada)) valor))
  )
)

;;;; OPERADORES 

;; lista-operadores
(defun lista-operadores ()
  (list 'colocar-mini-quadrado 'colocar-quadrado-vertice-sup-esquerdo 'colocar-quadrado-vertice-sup-direito 'colocar-quadrado-vertice-esquerdo 'colocar-quadrado-vertice-direito)
)

;; lista-sucessores
(defun lista-sucessores (no &optional (valor 1))
  (let ((listaCoordenadas (lista-coordenadas-possiveis (no-tabuleiro no))))
    (cond
       ((null listaCoordenadas) NIL)
       (t (mapcar #'(lambda (coordenada)(remover-se #'(lambda(valor)(null valor))
                      (mapcar #'(lambda (operador) (funcall operador no coordenada valor)) 
        (lista-operadores)))) listaCoordenadas))
    )
  )
)

;; verifcar-espaços-vazios
(defun verifcar-espaços-vazios (tabuleiro coordenada &optional (valor 1))
  (let ((y (car (last coordenada)))
        (x (first coordenada)))
     (cond
        ((fora-tabuleiro tabuleiro coordenada) NIL)
        ((and (> x 0) (= (valor-coordenada tabuleiro (list (1- x) y)) valor)) NIL)
        ((and (< x (1- (largura-tabuleiro tabuleiro))) (= (valor-coordenada tabuleiro (list (1+ x) y)) valor)) NIL)
        ((and (> y 0) (= (valor-coordenada tabuleiro (list x (1- y))) valor)) NIL)
        ((and (< y (1- (comprimento-tabuleiro tabuleiro))) (= (valor-coordenada tabuleiro (list x (1+ y))) valor)) NIL)
        (t)
     )
  )
)

;;;; MINI-QUADRADO

;; colocar-mini-quadrado
;; teste: (colocar-mini-quadrado (tabuleiro-vazio) '(0 0) 1)
(defun colocar-mini-quadrado (no coordenada &optional (valor 1))
  (let ((numPecas (nth 0 (no-pecas no))))
    (cond
      ((existePecas numPecas) NIL) 
      ((equal (verifcar-espaços-vazios (no-tabuleiro no) coordenada valor) NIL) NIL)
      (t (criar-no (substituir-valor-tabuleiro (no-tabuleiro no) coordenada valor) (1- (no-min-casas no)) (cons (1- numPecas) (cdr (no-pecas no))) no))
    )
  )
)

;;;; QUADRADO
;; (colocar-quadrado-vertice-sup-esquerdo (colocar-quadrado-vertice-sup-direito 
;;  (colocar-quadrado-vertice-esquerdo (colocar-quadrado-vertice-direito (tabuleiro-teste2) '(7 8) 1) '(5 8) 1) 
;; '(7 6) 1) '(5 6) 1)

;; colocar-quadrado-vertice-sup-esquerdo
;; teste: (colocar-quadrado-vertice-sup-esquerdo (tabuleiro-vazio) '(0 0) 1)
(defun colocar-quadrado-vertice-sup-esquerdo (no coordenada &optional (valor 1))
  (let ((y (car (last coordenada)))
        (x (first coordenada))
        (numPecas (nth 1 (no-pecas no))))
     (cond
        ((existePecas numPecas) NIL)
        ((equal (verifcar-espaços-vazios (no-tabuleiro no) coordenada valor) NIL) NIL)
        ((equal (verifcar-espaços-vazios (no-tabuleiro no) (list (1- x) y) valor) NIL) NIL)
        ((equal (verifcar-espaços-vazios (no-tabuleiro no) (list x (1- y)) valor) NIL) NIL)
        ((equal (verifcar-espaços-vazios (no-tabuleiro no) (list (1- x) (1- y)) valor) NIL) NIL)
        (t (criar-no
           (substituir-valor-tabuleiro (substituir-valor-tabuleiro (substituir-valor-tabuleiro (substituir-valor-tabuleiro (no-tabuleiro no) coordenada valor) (list (1- x) y) valor) (list x (1- y)) valor) (list (1- x) (1- y)) valor) 
           (- (no-min-casas no) 4) (cons (car (no-pecas no)) (list (1- numPecas) (car (last (no-pecas no))))) no))
     )
  )
)

;; colocar-quadrado-vertice-sup-direito
;; teste: (colocar-quadrado-vertice-sup-direito (tabuleiro-vazio) '(0 0) 1)
(defun colocar-quadrado-vertice-sup-direito (no coordenada &optional (valor 1))
  (let ((y (car (last coordenada)))
        (x (first coordenada))
        (numPecas (nth 1 (no-pecas no))))
     (cond
        ((existePecas numPecas ) NIL)
        ((equal (verifcar-espaços-vazios (no-tabuleiro no) coordenada valor) NIL) NIL)
        ((equal (verifcar-espaços-vazios (no-tabuleiro no) (list (1+ x) y) valor) NIL) NIL)
        ((equal (verifcar-espaços-vazios (no-tabuleiro no) (list x (1- y)) valor) NIL) NIL)
        ((equal (verifcar-espaços-vazios (no-tabuleiro no) (list (1+ x) (1- y)) valor) NIL) NIL)
        (t (criar-no 
               (substituir-valor-tabuleiro (substituir-valor-tabuleiro (substituir-valor-tabuleiro (substituir-valor-tabuleiro (no-tabuleiro no) coordenada valor) (list (1+ x) y) valor) (list x (1- y)) valor) (list (1+ x) (1- y)) valor)
          (- (no-min-casas no) 4) (cons (car (no-pecas no)) (list (1- numPecas) (car (last (no-pecas no))))) no )
         )
        )
    )
)

;; colocar-quadrado-vertice-esquerdo
;; teste: (colocar-quadrado-vertice-esquerdo (tabuleiro-vazio) '(0 0) 1)
(defun colocar-quadrado-vertice-esquerdo (no coordenada &optional (valor 1))
  (let ((y (car (last coordenada)))
        (x (first coordenada))
        (numPecas (nth 1 (no-pecas no))))
     (cond
        ((existePecas numPecas ) NIL)
        ((equal (verifcar-espaços-vazios (no-tabuleiro no) coordenada valor) NIL) NIL)
        ((equal (verifcar-espaços-vazios (no-tabuleiro no) (list (1- x) y) valor) NIL) NIL)
        ((equal (verifcar-espaços-vazios (no-tabuleiro no) (list x (1+ y)) valor) NIL) NIL)
        ((equal (verifcar-espaços-vazios (no-tabuleiro no) (list (1- x) (1+ y)) valor) NIL) NIL)
        (t (criar-no
               (substituir-valor-tabuleiro (substituir-valor-tabuleiro (substituir-valor-tabuleiro (substituir-valor-tabuleiro (no-tabuleiro no) coordenada valor) (list (1- x) y) valor) (list x (1+ y)) valor) (list (1- x) (1+ y)) valor)
               (- (no-min-casas no) 4) (cons (car (no-pecas no)) (list (1- numPecas) (car (last (no-pecas no))))) no)
         )
     )
  )
)

;; colocar-quadrado-vertice-direito
;; teste: (colocar-quadrado-vertice-direito (tabuleiro-vazio) '(0 0) 1)
(defun colocar-quadrado-vertice-direito (no coordenada &optional (valor 1))
  (let ((y (car (last coordenada)))
        (x (first coordenada))
        (numPecas (nth 1 (no-pecas no))))
     (cond
        ((existePecas (nth 1 (no-pecas no))) NIL)
        ((equal (verifcar-espaços-vazios (no-tabuleiro no) coordenada valor) NIL) NIL)
        ((equal (verifcar-espaços-vazios (no-tabuleiro no) (list (1+ x) y) valor) NIL) NIL)
        ((equal (verifcar-espaços-vazios (no-tabuleiro no) (list x (1+ y)) valor) NIL) NIL)
        ((equal (verifcar-espaços-vazios (no-tabuleiro no) (list (1+ x) (1+ y)) valor) NIL) NIL)
        (t (criar-no
                (substituir-valor-tabuleiro (substituir-valor-tabuleiro (substituir-valor-tabuleiro (substituir-valor-tabuleiro (no-tabuleiro no) coordenada valor) (list (1+ x) y) valor) (list x (1+ y)) valor) (list (1+ x) (1+ y)) valor) 
                (- (no-min-casas no) 4) (cons (car (no-pecas no)) (list (1- numPecas) (car (last (no-pecas no))))) no)
         )
      )
   )
)


;;;; PECA S





