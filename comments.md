# COMENTÁRIOS

- Um problema na tradução de synsets em inglês para synsets em português é o fato de que muitas as palavras 
tem mais de um significado  e as vezes certas palavras em inglês tem mais significados do que em Português.

- Outro problema é que algumas vezes synsets ,que tem EN-Words muito parecidos ou até iguais em inglês, parecem redundantes quando traduzidos para potuguês.
Há caso em que até o EN-Gloss é muito parecido.  

Ex: 
 <BC>258</BC>
    <WN-3.0-Synset>v236999</WN-3.0-Synset>
    <PT-Words-Man>ferver</PT-Words-Man>
    <PT-Word-Cand />
    <EN-Gloss>cook until very little liquid is left; "The cook reduced the sauce by boiling it for a long time"</EN-Gloss>
    <EN-Words>boil down, concentrate, reduce</EN-Words>
    <PT-Gloss>cozinhar até restar muito pouco de líquido</PT-Gloss>
    <PT-Gloss-Sug />
    <SPA-Words-Sug />
    <Comments />
  </row>
  <row>
    <BC>259</BC>
    <WN-3.0-Synset>v237259</WN-3.0-Synset>
    <PT-Words-Man>ferver</PT-Words-Man> 
    <PT-Word-Cand>diminuir</PT-Word-Cand>
    <EN-Gloss>be cooked until very little liquid is left; "The sauce should reduce to one cup"</EN-Gloss>
    <EN-Words>boil down, concentrate, decoct, reduce</EN-Words>
    <PT-Gloss>ser cozinhado até que muito pouco de líquido que reste</PT-Gloss>
    <PT-Gloss-Sug />
    <SPA-Words-Sug>mermar, disminuir</SPA-Words-Sug>
    <Comments /> 

Existem outros casos também como os synsets(394 e 395), os synsets(136, 226 e 227) e os synsets(242 e 243).

- O fato de estamos primeiro pegando um sentido e depois tentando encaixar palavras nesse sentido pode acabar criando redundância em alguns casos, isso porque eu não sou especialista em potuguês e não sei a melhor palavra ou a mais apropriada que se encaixa com cada Gloss especificamente. É mais garantido quando apartir da palavra se acha um significado para tal, mas esse método não funciona no nosso caso.
 
- Um caso que é interessante analizar para aprimorar e melhorar a qualidade do resultado de tradução é ter atenção com os synsets que tem Glosses não muito específicos ou descritivos, como os synsets(21, 23, 24 e 51). Seria bom criar regras de tradução, para evitar conflitos quando for fazer as relações semânticas entre os synsets, isso porque o Gloss ser abrangente permite que a tradução também seja mas isso não pode ocorrer porque existe uma palavra específica ou mais que se encaixa em cada determinado synset, afinal todos vão ser relacionados de uma forma. Um exemplo é o synset 24 abaixo.

<BC>24</BC>
    <WN-3.0-Synset>n20827</WN-3.0-Synset>
    <PT-Words-Man>matéria, átomo, substância</PT-Words-Man>
    <PT-Words-Cand>substância</PT-Words-Cand>
    <EN-Gloss>that which has mass and occupies space; "physicists study both the nature of matter and the forces which govern it"</EN-Gloss>
    <EN-Words>matter</EN-Words>
    <PT-Gloss> tudo aquilo que têm massa e ocupa espaço; "os físicos estudam tanto a natureza da matéria quanto as forças que a governam"</PT-Gloss>
    <PT-Gloss-Sug />
    <Spa-Words-Sug>materia</Spa-Words-Sug>
    <Comments />

Nesse caso por exemplo é importante verificar o EN-words, porque apenas pelo Gloss seria impossível identificar uma palavra, afinal tudo é "tudo aquilo que têm massa e ocupa espaço". Por isso eu digo que seria bom botar também junto dos synstes algumas relaçoes semânticas como de hiperônimo, hipônimo e meronímia
para termos uma noção de em qual nível de profundidade está a palavra desejada.

- Em alguns casos o synset simplismente não possui um correspondente adequado para a lingua portuguesa nesses casos oque ocorreria com eles na nova wordnet que estamos fazendo, porque muito provavelmente esses synsets tem alguma relação com um outro synset, como ficaria essa relação? e seria um problema apenas tirar esses synsets da wordnet eliminado suas possíveis relações semânticas.




























