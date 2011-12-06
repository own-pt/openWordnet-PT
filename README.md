
# WordNet-BR

To facilitate the manual revision, the original uwn-pt-sorted.tsv was
splited and converted to XML using the `convert.sh` script. The
original header of uwn-pt-sorted.tsv would generated the XML files
with the following XML fragment for each synset:

    <row>
     <Base-Concept-No>1</Base-Concept-No>
     <WordNet-3.0-Synset>n1740</WordNet-3.0-Synset>
     <Portuguese-Words-manual />
     <Portuguese-Word-Candidates>entidade, Entidade</Portuguese-Word-Candidates>
     <English-Gloss>that which is perceived or known or inferred to have its own distinct existence (living or nonliving)</English-Gloss>
     <English-Words>entity</English-Words>
     <Portuguese-Gloss />
     <Portuguese-Gloss-Suggestion />
     <Spanish-Words-Suggestion>entidad, entidad, ente</Spanish-Words-Suggestion>
     <Comments />
    </row>

To save space, I reduced the header in the uwn-pt-sorted.tsv before
run the script. I end up with the following XML fragments:

    <row>
     <BC>1</BC>
     <WN-3.0-Synset>n1740</WN-3.0-Synset>
     <PT-Words-Man />
     <PT-Words-Candidates>entidade, Entidade</PT-Words-Candidates>
     <EN-Gloss>that which is perceived or known or inferred to have its own distinct existence (living or nonliving)</EN-Gloss>
     <EN-Words>entity</EN-Words>
     <PT-Gloss />
     <PT-Gloss-Prop />
     <Spa-Words-Prop>entidad, entidad, ente</Spa-Words-Prop>
     <Comments />
    </row>

## Team

- Alexandre Rademaker
- Gerard de Melo
- Valeria de Paiva
- Rafael Haeusler

