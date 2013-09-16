
# Converting to Open Multilingual Wordnet

The site http://www.casta-net.jp/~kuribayashi/multi/ by Francis Bond
has its own input format. Here are the script to generate the
wn-data-por.tab that can be submitted to Open Multilingual Wordnet.

1. Load the wordnet-br.rdf in a triple store.
2. Execute and export as csv file the result of the SPARQL 1.1 query:

```
select ?part ?w {
  graph source:wordnet-br.rdf {
	  ?ss wn30:containsWordSense/wn30:word/wn30:lexicalForm ?w ;
          wn30:synsetId ?id .
  }
  BIND (str(?ss) as ?s)
  BIND (substr(?s,55) AS ?part)
}
order by ?part
```

3. Run the awk command on the output of the query:

```
awk -F ',' 'BEGIN {OFS = "\t"} {gsub(/"/,""); gsub(/_/," "); print $1, "lemma", $2;}' query.csv > wn-data-por.tab
```

4. Include the first line 

```
# OpenWN-PT	por	https://github.com/arademaker/wordnet-br	CC BY-SA
```
