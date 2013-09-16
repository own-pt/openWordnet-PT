
# Converting to FreeLing senses file

You only need to run the awk script which uses the wn-data-por.tab
(Open Multilingual WordNet file):

```
awk -f senses.awk wn-data-por.tab > senses30.src
```
