;;;; projeto.lisp
;;;; Funcoes interacao com o utilizador
;;;; Disciplina de IA - 2021 / 2022
;;;; Autor: Joana Guerreiro e Andreia Novas

;;;;;;;;;; INICIALIZAÇãO ;;;;;;;;;; 
(defun iniciar-jogo () 
  "Carrega os ficheiros e chama o menu pricipal"
  (progn 
    (carregar-ficheiros)
    (menu-inicial (ler-problemas))
  )
)

(defun diretorio ()
  "Caminho onde está o projeto"
  (string "C:/Users/User/Instituto Politécnico de Setúbal/IA Project - Blocks - General/Blocks/bloks/parte1")
  ;;(string "C:/Users/Joana/Instituto Politécnico de Setúbal/IA Project - Blocks - General/Blocks/bloks/parte1")
)

(defun carregar-ficheiros ()
  "Compila e carrega os ficheiros do projeto" 
  (let ((path (diretorio)))
    (progn
      (compile-file (concatenate 'string path "/puzzle.lisp"))
      (compile-file (concatenate 'string path "/procura.lisp"))

      (load (concatenate 'string path "/puzzle.lisp"))
      (load (concatenate 'string path "/procura.lisp"))
    )
  )
)

;;;;;;;;;; MENUS ;;;;;;;;;; 
(defun menu-inicial (problemas)
  "Funcionamento do menu Principal"
  (progn
    (format t "~% ~% ~%Bem Vindo - Blokus Uno ~%
             1 - Jogar
             2 - Sair ~%")
    (let ((opcao (read)))
      (cond ((= opcao 1) (selecionar-problema problemas))
            ((= opcao 2) (format t "Adeus ~% ~%"))
            (t (progn 
                 (format t "~% ~% >> Resposta invalida  << ~% ~%")
                 (menu-inicial problemas)
            ))
      )
    )
  )
)

(defun selecionar-problema (problemas)
  "Funcionamento do menu de  selecionar os problemas"
  (progn
    (problemas-opcoes-menu problemas)

    (let ((opcao (read))
        (totalProblemas (list-length problemas)))

      (cond ((OR (not (numberp opcao)) (< opcao 0) (> opcao totalProblemas)) 
               (format t "~% ~% >> Resposta invalida  << ~% ~%")
               (selecionar-problema problemas))
            (t (selecionar-algoritmo (nth (- opcao 1) problemas)))
      )
    )
  )
)


(defun problemas-opcoes-menu(problemas &optional (index 0))
  "Opcoes do menu de problemas"
  (cond ((null problemas) (format t "~% ~%"))
        ((= index 0) 
           (progn
             (format t " > Escolha um problema")
             (problemas-opcoes-menu problemas (1+ index))
           ))
        (t (progn 
             (imprimir-problema index (first problemas))
             (problemas-opcoes-menu (rest problemas) (1+ index)))))
)

(defun imprimir-problema (index problema)
  "Imprime o tabuleiro do problema e o objetivo do problema"
  (format t "~% ~% ~d -    A B C D E F G H I J K L M N ~%      1~A ~%      2~A~%      3~A~%      4~A~%      5~A~%      6~A~%      7~A~%      8~A~%      9~A~%     10~A~%     11~A~%     12~A~%     13~A~%     14~A~%     Preencher pelo menos ~d casas para ganhar" 
          index
          (nth 0 (car problema)) 
          (nth 1 (car problema)) 
          (nth 2 (car problema)) 
          (nth 3 (car problema)) 
          (nth 4 (car problema)) 
          (nth 5 (car problema)) 
          (nth 6 (car problema))
          (nth 7 (car problema))
          (nth 8 (car problema))
          (nth 9 (car problema))
          (nth 10 (car problema))
          (nth 11 (car problema))
          (nth 12 (car problema))
          (nth 13 (car problema))
          (nth 1 problema))
)

(defun selecionar-algoritmo (problema)
  "Funcionamento do menu  para selecionar os algoritmos"
  (progn 
    (algoritmos-opcoes-menu)

    (let ((opcao (read)))

      (cond ((OR (not (numberp opcao)) (< opcao 1) (> opcao 3)) 
               (progn
                 (format t "~% ~% >> Resposta invalida << ~% ~%")
                 (selecionar-algoritmo problema)
               ))
            (t (direcionar-algoritmo problema (nome-algoritmo opcao)))))
  )
)

(defun algoritmos-opcoes-menu()
  "Opções do menu algoritmos"
  (format t " > Escolha um algoritmo para aplicar na resolucao do problema: ~% ~% 1 - BFS ~% 2 - DFS ~% 3 - A* ~% ~%")
)

(defun pedir-profundidade() 
  "Pede a profundidade maxima do algoritmo dfs"
  (progn 
    (format t " > Introduza a profundidade maximo do algortmo ~%")
    (let ((opcao (read)))
      (cond ((OR (not (numberp opcao)) (< opcao 1))
               (progn 
                 (format t "~% ~% >> Tem que ser numero positivo << ~% ~%")
                 (pedir-profundidade)
               ))
            (t opcao)))
  )
)

(defun pedir-heuristica ()
  "Pede ao utilizador para escolher a heuristica a usar para o algoritmo a*"
  (progn 
    (format t " > Escolha uma heuristica: ~%")
    (format t "1 - Heuristica default (fornecida no enunciado) ~%")
    (format t "2 - Heuristica custom (criado pelo grupo) ~%")

    (let ((opcao (read)))

      (cond ((OR (not (numberp opcao)) (< opcao 1) (> opcao 2))
               (progn 
                 (format t "~% ~% >> Resposta invalida << ~% ~%")
                 (pedir-heuristica)
               ))
            (t (cond ((= opcao 1) 'heuristica-default)
                     (t 'heuristica-custom)))))
  )
)

;;;;;;;;;; ALGORITMO ;;;;;;;;;; 

(defun iniciar-funcao-algoritmo (no algoritmo &optional (heuristica NIL) (profundidade 0))
  " Dependendo do algoritmo pedido inicia a resolução do problema "
  (cond
    ((string-equal algoritmo 'bfs) (bfs no))
    ((string-equal algoritmo 'dfs) (dfs no profundidade))
    ((string-equal algoritmo 'a*) (a* no heuristica))
    (NIL)
  )
)

(defun iniciar-algoritmo (problema algoritmo &optional (heuristica NIL) (profundidade 0))
  "Funcao que aplica o algoritmo escolhido no problema escolhido e depois cria um ficheiro com os resultados (com recurso a funcao \"write-results-to-file\") e mostra na consola (com recurso a funcao \"format-results\")"
  (let* ((tempo-inicio (get-internal-real-time))
         (resultados (iniciar-funcao-algoritmo (list (no-inicial (car problema) (cadr problema))) algoritmo heuristica profundidade))
         (tempo-total (float (/ (- (get-internal-real-time) tempo-inicio) internal-time-units-per-second)))
         (caminho (concatenate 'string (diretorio) "/resultados.dat")))

    (progn 
      (format t "             >>> Algoritmo finalizado <<< ~%~%")
      (format t "Registos guardados em: ~s ~% ~%" caminho) 

      (formatar-resultados resultados 't algoritmo profundidade problema heuristica tempo-total)

      (escrever-resultados-ficheiro resultados algoritmo profundidade problema heuristica tempo-total caminho)
    )
  )
)

(defun nome-algoritmo (index)
  "Retorna o nome do algoritmo escolhido"
  (cond ((= index 1) 'bfs)
        ((= index 2) 'dfs)
        (t 'a*))
)

(defun direcionar-algoritmo (problema algoritmo)  
  "Se o escolhido foi o DFS, pede a profundidade maxima do algoritmo. Se for A* pede ao utilizador para escolher a heuristica, senao inicia-se logo"
  (cond 
    ((string-equal algoritmo 'bfs) (iniciar-algoritmo problema 'bfs NIL))
    ((string-equal algoritmo 'dfs) (iniciar-algoritmo problema 'dfs NIL (pedir-profundidade)))
    ((string-equal algoritmo 'a*) (iniciar-algoritmo problema 'a* (pedir-heuristica)))
    (t (iniciar-algoritmo problema algoritmo)))
)




;;;;;;;;;; OUTPUT FINAL ;;;;;;;;;; 

(defun escrever-resultados-ficheiro (resultados algoritmo profundidade problema heuristica tempo caminho)
  "Escreve os resultados num ficheiro \"resultados.dat\""
  (with-open-file (output-file 
                   caminho
                   :direction :output
                   :if-exists :append
                   :if-does-not-exist :create)
    (formatar-resultados resultados output-file algoritmo profundidade problema heuristica tempo))
)

(defun formatar-resultados (resultados output algoritmo profundidade problema heuristica tempo)
  "Formata os resultados (results) do algoritmo para o {output} especificado (t > consola, filestream > ficheiro)"
  (progn 
    ;; caracteristicas
    (format output "> Caracteristicas: ~% - Algoritmo: ~s ~% - Heuristica: ~a ~% - Profundidade: ~s ~% - Problema:~%"
             algoritmo heuristica profundidade)
    (imprimir-no (no-inicial (car problema) (cadr problema)) output)
    ;; resultados
    (format output "~%> Resultados: ~% - Nos gerados: ~d ~% - Nos expandidos: ~d ~% - Penetrancia: ~d ~% - Fator de ramificacao: ~d ~% - Tempo de execucao: ~d segundo(s) ~% - Profundidade da solucao: ~d ~%"
            (first resultados) (second resultados) (third resultados) (fourth resultados) tempo (no-profundidade (fifth resultados))) 
    (solucao (fifth resultados) output)
  )
)

(defun solucao (no output)
  "Realiza o output da solucao. Usa \"get-caminho-solucao\" para mostrar o caminho solucao"
  (progn 
    (format output " - Solucao: ~%")
    (caminho-solucao no output)
    (format output "~% ~% --------------------------------------------- ~% ~%")
  )
)

(defun caminho-solucao (no output)
  "Percorre o caminho solucao desde o no solucao ate ao no pai, fazendo output de cada no"
  (let ((pai (no-pai no)))
    (progn 
      (imprimir-no no output)
      (cond ((not (null pai)) (caminho-solucao pai output)))
    )
  )
)

(defun imprimir-no (no output)
  "Imprimir estado do problema durante o caminho"
    (format output "        A B C D E F G H I J K L M N ~%      1~A ~%      2~A~%      3~A~%      4~A~%      5~A~%      6~A~%      7~A~%      8~A~%      9~A~%     10~A~%     11~A~%     12~A~%     13~A~%     14~A~%     Minimo Casas: ~d~%     Casas Preenchidas: ~d~%     Peca Quadrado Pequeno: ~d~%     Peca Quadrado: ~d~%     Peca S: ~d~%     ~%" 
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
          (no-min-casas no)
          (no-casas-preenchidas no)
          (nth 0 (no-pecas no))
          (nth 1 (no-pecas no))
          (nth 2 (no-pecas no)))
)




;;;;;;;;;; PROBLEMAS INPUT ;;;;;;;;;; 

(defun ler-problemas ()
  "Abre o ficheiro problemas.dat e constroi os problemas. Retorna erro se nao encontrar o ficheiro"
  (with-open-file (file 
                   (concatenate 'string (diretorio) "/problemas.dat")
                   :direction :input
                   :if-does-not-exist :error)
      (construir-problemas (ler-problemas-aux file)))
)

(defun ler-problemas-aux(input &optional (output))
  "Percorre o ficheiro linha a linha. Retorna uma lista com as varias linhas do ficheiro"
  (let ((line (read-line input nil)))
    (cond ((not (null line))
              (ler-problemas-aux input (append output (list line))))
          (t output)))
)

(defun construir-problemas(problemasStrings &optional (problemas))
  "Construir os problemas com as varias linhas do ficheiro."
  (cond 
    ((null problemasStrings) problemas)
    (t (construir-problemas (rest problemasStrings) (append problemas (list (construir-problemas-aux (first problemasStrings))))))
   )
)

(Defun construir-problemas-aux (problemaStrings)
  "Separar a string e construir o estado do problema."
  (let ((problema (split-sequence "," problemaStrings)))
    (list 
     (list 
      (read-from-string (nth 0 problema)) 
      (read-from-string (nth 1 problema)) 
      (read-from-string (nth 2 problema)) 
      (read-from-string (nth 3 problema)) 
      (read-from-string (nth 4 problema))
      (read-from-string (nth 5 problema))
      (read-from-string (nth 6 problema))
      (read-from-string (nth 7 problema))
      (read-from-string (nth 8 problema))
      (read-from-string (nth 9 problema))
      (read-from-string (nth 10 problema))
      (read-from-string (nth 11 problema))
      (read-from-string (nth 12 problema))
      (read-from-string (nth 13 problema))
      )
     (read-from-string (nth 14 problema))
     )
  )
)