
# Converting to Open Multilingual Wordnet

The site http://www.casta-net.jp/~kuribayashi/multi/ by Francis Bond
has its own input format. Here are the script to generate the
wn-data-por.tab that can be submitted to Open Multilingual Wordnet.

1. Execute and export as csv file the result of the SPARQL 1.1 query:

```
select ?s ?w {
  graph source:own-pt.nt {
      ?ss wn30:containsWordSense/wn30:word/wn30:lexicalForm ?w ;
          wn30:synsetId ?id .
  }
  BIND (str(?ss) as ?s)
}
order by ?s
```

2. Run the awk command on the output of the query:

```
awk -f convert.awk query.csv > wn-data-por.tab
```

3. Remove the second line of the file created in the previous step.

