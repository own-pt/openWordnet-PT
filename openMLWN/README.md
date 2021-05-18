
# Converting to Open Multilingual Wordnet

The site http://compling.hss.ntu.edu.sg/omw/ by Francis Bond has its
own input format. Here are the script to generate the wn-data-por.tab
that can be submitted to Open Multilingual Wordnet.

1. Execute and export as csv file the result of the [SPARQL 1.1 query](http://wnpt.sl.res.ibm.com:10035/#/repositories/wn30/query/d/select%20?s%20?w%20{%0A%20%20graph%20source:own-pt.nt%20{%0A%20%20%20%20%20%20?ss%20wn30:containsWordSense/wn30:word/wn30:lexicalForm%20?w%20;%0A%20%20%20%20%20%20%20%20%20%20wn30:synsetId%20?id%20.%0A%20%20}%0A%20%20BIND%20(str(?ss)%20as%20?s)%0A}%0Aorder%20by%20?s):

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

# Data from OMW (Francis)

The wn-wikt-por.tab and the wn-multi-ext.pdf article explaining how OMW used Wikidictionary to expand WNs (plus evaluation).


