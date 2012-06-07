

(require :sax)

(use-package :net.xml.sax)

(defstruct counter
  (elements 0)
  (attributes 0)
  (characters 0))


(defclass sax-count-parser (sax-parser)
  ((counts :initform (make-counter)
	   :reader counts)))

(defmethod start-element ((parser sax-count-parser) iri localname qname
			  attrs)
  (declare (ignore iri localname qname))
  (let ((counter (counts parser)))
    (incf (counter-elements counter))
    (let ((attlen (length attrs)))
      (if* (> attlen 0)
	   then (incf (counter-attributes counter) attlen)))))

(defmethod content ((parser sax-count-parser) content start end ignorable)
  (declare (ignore content ignorable))
  (let ((counter (counts parser)))
    (incf (counter-characters counter) (- end start))))

(defmethod content-character ((parser sax-count-parser) char ignorable)
  (declare (ignore char ignorable))
  (let ((counter (counts parser)))
    (incf (counter-characters counter))))


(multiple-value-bind (a b) 
    (sax-parse-file #P"/Users/arademaker/work/WordNet-BR/uwn-pt-sorted-aa.xml" :class 'sax-count-parser)
  (list a (counts b)))
