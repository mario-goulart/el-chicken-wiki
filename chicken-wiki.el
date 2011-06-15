(defmacro chicken-wiki-define-command (command &optional open-tag close-tag)
  `(defun ,(intern (concat "chicken-wiki-" (symbol-name command))) (beg end)
     (interactive "r")
     (let ((start-tag ,(or open-tag
                           (concat "<" (symbol-name command) ">")))
           (end-tag ,(or close-tag
                         (concat "</" (symbol-name command) ">"))))
       (save-excursion
         (goto-char beg)
         (insert start-tag)
         (goto-char (+ end (length start-tag)))
         (insert end-tag)))))

(chicken-wiki-define-command procedure)
(chicken-wiki-define-command macro)
(chicken-wiki-define-command parameter)
(chicken-wiki-define-command constant)
(chicken-wiki-define-command record)
(chicken-wiki-define-command string)
(chicken-wiki-define-command class)
(chicken-wiki-define-command method)
(chicken-wiki-define-command setter)
(chicken-wiki-define-command type)

(chicken-wiki-define-command highlight-scheme
                             "<enscript highlight=scheme>\n"
                             "</enscript>\n")

(chicken-wiki-define-command highlight-elisp
                             "<enscript highlight=elisp>\n"
                             "</enscript>\n")

(chicken-wiki-define-command highlight-c
                             "<enscript highlight=c>\n"
                             "</enscript>\n")
