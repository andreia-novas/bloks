;;;; algoritmo.lisp
;;;; Funções de algoritmos
;;;; Disciplina de IA - 2021 / 2022
;;;; Autor: Joana Guerreiro e Andreia Novas

;;;;;;;;;; VARIAVEIS GLOBAIS ;;;;;;;;;; 

(defvar *hash-table* (make-hash-table :test 'equal))
(defvar *totalCortesAlfa* 0)
(defvar *totalCortesBeta* 0)
(defvar *nosAnalisados* 0)


;;;;;;;;;; VARIAVEIS GLOBAIS ;;;;;;;;;; 

;; adicionar-corte-alfa
(defun adicionar-corte-alfa ()
 "Incrementa a variavel que conta o numero de cortes alfa"
  (setf *totalCortesAlfa* (1+ *totalCortesAlfa*))
)

;; obter-cortes-alfa
(defun obter-cortes-alfa ()
 "Retorna a variavel que tem o numero total de cortes alfa"
  *totalCortesAlfa*
)

;; adicionar-corte-beta
(defun adicionar-corte-beta ()
 "Incrementa a variavel que conta o numero de cortes beta"
  (setf *totalCortesBeta* (1+ *totalCortesBeta*))
)

;; obter-cortes-beta
(defun obter-cortes-beta ()
 "Retorna a variavel que tem o numero total de cortes beta"
  *totalCortesBeta*
)

;; adicionar-corte
(defun adicionar-corte (valor)
  (cond
    ((< valor 0) (adicionar-corte-alfa))
    (t (adicionar-corte-beta))
  )
)

;; adicionar-no-analisado
(defun adicionar-no-analisado ()
 "Incrementa a variavel que conta o numero de nos avaliados"
  (setf *nosAnalisados* (1+ *nosAnalisados*))
)

;; obter-nos-analisados
(defun obter-nos-analisados ()
 "Retorna a variavel que tem o numero total de nos analisados"
  *nosAnalisados*
)

;; alterar-dados
(defun alterar-dados (novoNumCortesAlfa novoNumCortesBeta novoNumNosAnalisados)
 "Faz a alteracao as variaveis de estaisticas"
  (setf *totalCortesAlfa* novoNumCortesAlfa)
  (setf *totalCortesBeta* novoNumCortesBeta)
  (setf *nosAnalisados* novoNumNosAnalisados)
)

;; limpar-dados
(defun limpar-dados ()
 "Faz reset as variaveis de estaisticas"
  (setf *totalCortesAlfa* 0)
  (setf *totalCortesBeta* 0) 
  (setf *nosAnalisados* 0)
)

;; obter-no-hashtable
(defun obter-no-hashtable (no jogador tempoLimite tempoReal)
 "Guarda na hashtable o no enviado por parametro, se não existir com o resultado do negamax deste junto 
 com as estatisticas. Caso o no exista, vai buscar o no associado a ele, com os dados desse no altera os valores estatisticos e retorna-o"
  (cond
    ((null (gethash no *hash-table*))
     (let ((novoNoHash (list (cadr (negamax no jogador tempoLimite tempoReal)) (list (list (obter-cortes-alfa) (obter-cortes-beta)) (obter-nos-analisados)))))
       (progn
         (setf (gethash no *hash-table*) novoNoHash)
         (car novoNoHash)
       )
     )
    )
    (t (progn
         (let ((noHash (gethash no *hash-table*)))
           (alterar-dados (caaar (last noHash))  (cadaar (last noHash)) (cadar (last noHash)))
           (car noHash)
         )
       )
    )
  )
)


;;;;;;;;;; FUNCOES AUXILIARES ;;;;;;;;;; 

;; retornar-melhor-no
;; teste: (retornar-melhor-no '(1 NIL) '(2 NIL))
;; resultado: (2 NIL)
(defun retornar-melhor-no (noA noB)
  (cond
    ((> (car noA) (car noB)) noA)
    (t noB)
  )
)

;; inverter-valor-no
;; teste: (inverter-valor-no '(1 NIL))
;; resultado: (-1 NIL)
(defun inverter-valor-no (no)
  (list (* -1 (car no)) (cadr no))
)

;; funcao-avaliacao
;; teste: (funcao-avaliacao (no-teste) 1)
;; resultado: -110
(defun funcao-avaliacao (no jogador)
  (* -1 (no-pontuacao-jogador no jogador))
)

;; condicao-sort
(defun condicao-sort (noA noB)
 "Retorna nil se o no-custo do primeiro for maior que o segundo senão retorna T - isto é usado como condição de ordenação"
  (< (no-pontuacao-jogador noA (no-jogador noA)) (no-pontuacao-jogador noB (no-jogador noB)))
)



;;;;;;;;;; ALGORITMO ;;;;;;;;;; 

;; retornar-no-alfa
(defun retornar-no-alfa (sucessores noAtual profundidade noAlfa noBeta jogador tempoLimite tempoInicial)
  (let ((novoNoAlfa (retornar-melhor-no noAtual noAlfa)))
    (progn
      (adicionar-no-analisado)
      (cond
        ((or (null sucessores) (< tempoLimite (- (get-internal-real-time) tempoInicial))) novoNoAlfa)
        ((>= (car noAlfa) (car noBeta)) (progn (adicionar-corte (car novoNoAlfa)) novoNoAlfa))
        (t 
          (retornar-no-alfa 
            (cdr sucessores)
            (retornar-melhor-no 
              noAtual                                                
              (list
                (* -1 (car (negamax (car sucessores) (* -1 jogador) tempoLimite tempoInicial (1- profundidade) (inverter-valor-no noBeta) (inverter-valor-no novoNoAlfa))))
                (car sucessores) 
              )
            )                             
            profundidade 
            novoNoAlfa 
            noBeta 
            jogador
            tempoLimite
            tempoInicial
          )
        )
      )
    )
  )
)

;; negamax 
"só vai até profundidade 5 no max"
(defun negamax (no jogador tempoLimite tempoInicial &optional (profundidade 5) (noAlfa (list most-negative-fixnum no)) (noBeta (list most-positive-fixnum no)))
  (cond
    ((or (< tempoLimite (- (get-internal-real-time) tempoInicial))(= profundidade 0)) (list (funcao-avaliacao no jogador) no))
    (t (let ((sucessores (lista-sucessores no jogador)))
         (cond
           ((not (null sucessores))(retornar-no-alfa (sort sucessores 'condicao-sort) (list most-negative-fixnum (car sucessores)) profundidade (list (car noAlfa) (car sucessores)) (list (car noBeta) (car sucessores)) jogador tempoLimite tempoInicial))
           (t noAlfa)
         )
       )
    )
  )
)
