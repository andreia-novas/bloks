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
  "Diretório do projeto"
  (string "C:/Users/User/Instituto Politécnico de Setúbal/IA Project - Blocks - General/Blocks/bloks/parte1")
)

(defun carregar-ficheiros ()
  "Carrega os ficheiros do projeto" 
  (let ((path (diretorio)))
    (progn
      (compile-file (concatenate 'string path "/puzzle.lisp"))
      ;;(compile-file (concatenate 'string path "/procura.lisp"))

      (load (concatenate 'string path "/puzzle.lisp"))
      ;;(load (concatenate 'string path "/procura.lisp"))
    )
  )
)

;;;;;;;;;; MENUS ;;;;;;;;;; 
(defun menu-inicial (problemas)
  "Menu Principal"
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
  "Menu de problemas"
  (progn
    (problemas-opcoes-menu problemas)

    (let ((opcao (read))
        (totalProblemas (list-length problemas)))

      (cond ((OR (not (numberp opcao)) (< opcao 0) (> opcao totalProblemas)) 
               (format t "~% ~% >> Resposta invalida  << ~% ~%")
               (t (selecionar-problema problemas)))
            ;;(t (selecionar-algoritmo (nth (- opcao 1) problemas)))
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
  "Imprime o tabuleiro do problema"
  (format t "~% ~% ~d -   ~A ~%      1~A ~%      2~A~%      3~A~%      4~A~%      5~A~%      6~A~%      7~A~%      8~A~%      9~A~%     10~A~%     11~A~%     12~A~%     13~A~%     14~A~%     Preencher pelo menos ~d casas para ganhar" 
          index
          '(A B C D E F G H I J K L M N)
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
  "Menu Algoritmos"
  (progn 
    (algoritmos-opcoes-menu)

    (let ((opcao (read)))

      (cond ((OR (not (numberp opcao)) (< opcao 1) (> opcao 3)) 
               (progn
                 (format t "~% ~% >> Resposta invalida << ~% ~%")
                 (selecionar-algoritmo problema)
               ))
            (t (eval-algoritmo problema (nome-algoritmo opcao)))))
  )
)


;;;;;;;;;; PROBLEMAS INPUT ;;;;;;;;;; 
(defun ler-problemas ()
  "Abre o ficheiro problemas.dat e constrai os problemas. Retorna erro se nao encontrar o ficheiro"
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