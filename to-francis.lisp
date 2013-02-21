
;; Referencias:
;; - http://code.google.com/p/cl-en/source/browse/trunk/basics.lisp#148
;; - http://www.ibm.com/developerworks/xml/tutorials/x-usax/
;; - http://common-lisp.net/project/cxml/
;; - http://common-lisp.net/project/cxml/saxoverview/index.html

(ql:quickload :cxml)
(ql:quickload :cl-ppcre)
(ql:quickload :csv-parser)
(ql:quickload :uri-template)

(uri-template:enable-uri-template-syntax)

(defparameter *fields* '(("BC" . bc) 
			 ("WN-3.0-Synset" . id)
			 ("PT-Words-Man"  . words-man)
			 ("PT-Word-Cand"  . words-sug)
			 ("PT-Gloss"      . gloss-man)
			 ("PT-Gloss-Sug"  . gloss-sug)
			 ("EN-Gloss"      . gloss-en)
			 ("EN-Words"      . words-en)
			 ("SPA-Words-Sug" . words-sp)))

(defparameter *EXTRA* nil)
(defparameter *OUTFILE* #P"wn-data-por.tab")

(defclass synset ()
  ((id :initform nil)
   (bc :initform nil)
   (words-man :initform nil)
   (words-sug :initform nil)
   (gloss-man :initform nil)
   (gloss-sug :initform nil)
   (gloss-en  :initform nil)
   (words-en  :initform nil)
   (words-sp  :initform nil)))


(defclass sax-handler (sax:default-handler)
  ((current-ss     :initform nil :reader current-wn)
   (current-field  :initform nil :reader current-field)
   (synsets        :initform nil :reader synsets) 
   (stack          :initform nil :reader collected-text)))


(defmethod sax:start-element ((h sax-handler) (namespace t) (local-name t) (qname t) (attributes t))
  (with-slots (current-ss current-field stack) h
    (cond 
      ((equal local-name "row") 
       (setf current-ss (make-instance 'synset)))
      ((assoc local-name *fields* :test 'equal) 
       (setf current-field (cdr (assoc local-name *fields* :test 'equal)))
       (setf stack nil)))))


(defmethod sax:end-element ((h sax-handler) (namespace t) (local-name t) (qname t))
  (with-slots (current-ss current-field stack synsets) h
    (cond 
      ((equal local-name "row") 
       (push current-ss synsets))
      ((assoc local-name *fields* :test 'equal) 
       (setf (slot-value current-ss current-field) (format nil "~{~A~}" (reverse stack)))
       (setf stack nil)))))


(defmethod sax:characters ((h sax-handler) (data t))
  (with-slots (stack) h
    (push data stack)))


(defun synset-format (synset stream)
  (let* ((id (slot-value synset 'id))
	 (id-pos (subseq id 0 1))
	 (id-offset (format nil "~8,'0d" (parse-integer (subseq id 1))))
	 (the-slot 'words-man))
    (if (equal "" (slot-value synset 'words-man))
	(setf the-slot 'words-sug))
    (dolist (w (cl-ppcre:split "\\s*(,|;)\\s*" (string-trim '(#\Space #\Tab) (slot-value synset the-slot))))
      (let ((reg (list (format nil "~a-~a" id-offset id-pos) 
					      "lemma" 
					      w)))
	(if *EXTRA* 
	    (progn 
	      (nconc reg (list the-slot))
	      (nconc reg (list #Uhttp://logics.emap.fgv.br/wn30pt/{w}))))
	(csv-parser:write-csv-line stream reg)))))


;; using the parser and csv formatter
  
;; (let ((my (make-instance 'sax-handler)))
;;   (cxml:parse #P"/Users/arademaker/work/WordNet-BR/uwn-pt-sorted-ah.xml" my)
;;   (mapcar (lambda (s) 
;; 	    (list (slot-value s 'id)  
;; 		  (slot-value s 'words-man)
;; 		  (slot-value s 'words-sug)))
;; 	  (slot-value my 'synsets)))


(setf csv-parser:*field-separator* #\Tab)

(with-open-file (out *OUTFILE* :direction :output :if-exists :supersede)
  (write-line "# OpenWN-PT	por	https://github.com/arademaker/wordnet-br	CC by SA 3.0" out)
  (dolist (file (directory #P"/Users/arademaker/work/WordNet-BR/uwn-*.xml"))
    (let ((my (make-instance 'sax-handler)))
      (cxml:parse file my)
      (mapcar (lambda (s) (synset-format s out)) (slot-value my 'synsets)))))


(exit)
