;;;; procura.lisp
;;;; 
;;;; Disciplina de IA - 2021 / 2022
;;;; Autor: Joana Guerreiro e Andreia Novas

;; penetrancia
;; teste: (penetrancia 4 15)
;; resultado: 0.26666668
(defun penetrancia (profundidade totalNosGerados)
"Permite calcular a penetrancia dum algoritmo"
  (cond
     ((not (zerop profundidade)) (float (/ profundidade totalNosGerados)))
     (t 0)
  )
)

;; polinomial
;; teste: (polinomial 3 576460752303423488)
;; resultado: 191561942608236107627100377340017616754754907646459904
(defun polinomial (grau polinomio)
"Implementa o calculo de uma funcao polinomial"
    (cond
     ((= grau 1) polinomio)
     (t (+ (expt polinomio grau) (polinomial (1- grau) polinomio)))
    )
)

;; fator-ramificacao
;; teste: (fator-ramificacao 4 15)
;; resultado: 1.6067009
(defun fator-ramificacao (profundidade nosGerados &optional (limiteInferior 1) (limiteSuperior most-positive-fixnum) (margemErro 0.00001) (limiteMedio (/ (+ limiteInferior limiteSuperior) 2)))
"Permite calcular o fator de ramificacao para um no, esta aplica o metodo da bissecao para o calculo desta funcao com uma margem de erro de 0.00001"
  (cond
   ;;Se a diferenca entre os limites for inferior a margem de erro entao podemos assumir com precisao que o fator de ramificacao encontra-se entre estes dois limites
   ((< (- limiteSuperior limiteInferior) margemErro) (float limiteMedio)) 
   
   ;;Caso o valor esteja mais perto do limiteInferior, diminui-se o limite superior
   ((> (- (polinomial profundidade limiteMedio) nosGerados) margemErro) (fator-ramificacao profundidade nosGerados limiteInferior limiteMedio margemErro))  

   ;;Caso o valor esteja mais perto do limiteSuperior, aumenta-se o limite inferior
   (T (float (fator-ramificacao profundidade nosGerados limiteMedio limiteSuperior margemErro))) 
  )
)

;; tamanho-lista-fechados-expandidos
;;Teste : (tamanho-lista-fechados-expandidos 1 '(  ((((0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0)) 0 NIL 0 0) ((10 10 15) 0) NIL)((((0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0)) 0 NIL 1 0) ((10 10 15) 0) NIL)((((0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0)) 0 NIL 2 0) ((10 10 15) 0) NIL)))  
;;Resultado
(defun tamanho-lista-fechados-expandidos (profundidade listaFechados)
  "Retorna o tamanho da lista de nós fechados que tenham menor profundidade do que a profundidade máxima "
  (length (remover-se #'(lambda (no)(> (no-profundidade no) profundidade)) listaFechados))
)

;; condicao-sort
;;Teste : ( condicao-sort   '((((0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0)) 1 72 1 71) ((9 10 15) 0) NIL) '((((0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0) (0 0 0 0 0 0 0 0 0 0 0 0 0 0)) 2 72 2 70) ((8 10 15) 0) NIL))  
;;Resultado : NIL
(defun condicao-sort (noA noB)
"Retorna nil se o no-custo do primeiro for maior que o segundo senão retorna T - isto é usado como condição de ordenação dos NOS no algoritmo a*"
  (< (no-custo noA) (no-custo noB))
)

;; lista-resultados
;;Teste : (lista-resultados 15 4 '( (((1 1 0 0 2 2 2 2 2 2 2 2 2 2) (1 1 0 0 2 2 2 2 2 2 2 2 2 2) (0 0 1 1 2 2 2 2 2 2 2 2 2 2) (0 1 1 0 2 2 2 2 2 2 2 2 2 2) (2 2 2 2 2 2 2 2 2 2 2 2 2 2) (2 2 2 2 2 2 2 2 2 2 2 2 2 2) (2 2 2 2 2 2 2 2 2 2 2 2 2 2) (2 2 2 2 2 2 2 2 2 2 2 2 2 2) (2 2 2 2 2 2 2 2 2 2 2 2 2 2) (2 2 2 2 2 2 2 2 2 2 2 2 2 2) (2 2 2 2 2 2 2 2 2 2 2 2 2 2) (2 2 2 2 2 2 2 2 2 2 2 2 2 2) (2 2 2 2 2 2 2 2 2 2 2 2 2 2) (2 2 2 2 2 2 2 2 2 2 2 2 2 2)) 8 8 2 0) ((10 9 14) 0) ((((1 1 0 0 2 2 2 2 2 2 2 2 2 2) (1 1 0 0 2 2 2 2 2 2 2 2 2 2) (0 0 0 0 2 2 2 2 2 2 2 2 2 2) (0 0 0 0 2 2 2 2 2 2 2 2 2 2) (2 2 2 2 2 2 2 2 2 2 2 2 2 2) (2 2 2 2 2 2 2 2 2 2 2 2 2 2) (2 2 2 2 2 2 2 2 2 2 2 2 2 2) (2 2 2 2 2 2 2 2 2 2 2 2 2 2) (2 2 2 2 2 2 2 2 2 2 2 2 2 2) (2 2 2 2 2 2 2 2 2 2 2 2 2 2) (2 2 2 2 2 2 2 2 2 2 2 2 2 2) (2 2 2 2 2 2 2 2 2 2 2 2 2 2) (2 2 2 2 2 2 2 2 2 2 2 2 2 2) (2 2 2 2 2 2 2 2 2 2 2 2 2 2)) 4 8 1 0) ((10 9 15) 0) ((((0 0 0 0 2 2 2 2 2 2 2 2 2 2) (0 0 0 0 2 2 2 2 2 2 2 2 2 2) (0 0 0 0 2 2 2 2 2 2 2 2 2 2) (0 0 0 0 2 2 2 2 2 2 2 2 2 2) (2 2 2 2 2 2 2 2 2 2 2 2 2 2) (2 2 2 2 2 2 2 2 2 2 2 2 2 2) (2 2 2 2 2 2 2 2 2 2 2 2 2 2) (2 2 2 2 2 2 2 2 2 2 2 2 2 2) (2 2 2 2 2 2 2 2 2 2 2 2 2 2) (2 2 2 2 2 2 2 2 2 2 2 2 2 2) (2 2 2 2 2 2 2 2 2 2 2 2 2 2) (2 2 2 2 2 2 2 2 2 2 2 2 2 2) (2 2 2 2 2 2 2 2 2 2 2 2 2 2) (2 2 2 2 2 2 2 2 2 2 2 2 2 2)) 0 8 0 0) ((10 10 15) 0) NIL))))
;; Resultado : (15 4 0.13333334 3.4051247 (((# # # # # # # # # # # # # #) 8 8 2 0) ((10 9 14) 0) ((# 4 8 1 0) (# 0) (# # NIL))))
(defun lista-resultados (nosGerados nosExpandidos noObjetivo)
"Construção das estatíticas - nosGerados , nosExpandidos, penetrancia, fator-ramificação e o noObjetivo"
  (list nosGerados 
        nosExpandidos 
        (penetrancia (no-profundidade noObjetivo) nosGerados)
        (fator-ramificacao (no-profundidade noObjetivo) nosGerados)
        noObjetivo
  )
)


;;;;;;;;;; ALGORITMO ;;;;;;;;;;

;; BFS
(defun bfs (listAbertos  &optional (listFechados NIL))
"Algoritmo de largura"
 (let ((listaNos(append listAbertos listFechados)))
  (cond 
     ((null listAbertos) NIL)
     (t(let ((sucessores (no-existe-listaP listaNos (lista-sucessores (car listAbertos)))))
          (cond
             ((null sucessores) (bfs (cdr listAbertos) (cons (car listAbertos) listFechados)))
             (t(let ((noObjetivo (no-objetivoP sucessores)))
                  (cond
                     ((null noObjetivo) (bfs (append (cdr listAbertos) sucessores)(cons (car listAbertos) listFechados)))
                     (t(lista-resultados (+ (length listaNos)(length sucessores)) (1+ (length listFechados)) noObjetivo))
                  )
             ))
           )
      ))
   )
  )
)


;; DFS
(defun dfs (listAbertos profundidade &optional (listFechados NIL))
"Algoritmo de comprimento"
 (let ((listaNos(append listAbertos listFechados)))
  (cond 
     ((null listAbertos) NIL)
     ((> (no-profundidade (car listAbertos)) profundidade) (dfs (cdr listAbertos) profundidade (cons (car listAbertos) listFechados)))
     (t(let ((sucessores (no-existe-listaP listaNos (lista-sucessores (car listAbertos)))))
          (cond
             ((null sucessores) (dfs (cdr listAbertos) profundidade (cons (car listAbertos) listFechados)))
             (t(let ((noObjetivo (no-objetivoP sucessores)))
                  (cond
                     ((null noObjetivo) (dfs (append sucessores (cdr listAbertos)) profundidade (cons (car listAbertos) listFechados)))
                     (t(lista-resultados (+ (length listaNos)(length sucessores)) (tamanho-lista-fechados-expandidos profundidade listFechados) noObjetivo))
                  )
             ))
           )
      ))
   )
  )
)


;; A*
(defun a* (listAbertos &optional (heuristica 'heuristica-default) (listFechados NIL))
  "Algoritmo *A"
  (let ((listaNos(append listAbertos listFechados)))
    (cond 
      ((null listAbertos) NIL)
      ((no-solucao (car listAbertos))
           (lista-resultados (length listaNos) (1+ (length listFechados)) (car listAbertos))
       )
      (t(let ((sucessores (no-existe-listaP listaNos (lista-sucessores (car listAbertos) heuristica)))) 
          (cond
             ((null sucessores) (a* (cdr listAbertos) heuristica (cons (car listAbertos) listFechados)))
             (t(a* (sort (append sucessores (cdr listAbertos)) 'condicao-sort) heuristica (cons (car listAbertos) listFechados)))
           )
      ))
    )
  )
)


