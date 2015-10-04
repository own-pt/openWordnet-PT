
BEGIN {
    OFS="\t";
    FS=",";
    print "# OpenWN-PT	por	https://github.com/arademaker/wordnet-br	CC BY-SA";
}
  {
    gsub(/https:\/\/w3id.org\/own-pt\/wn30-pt\/instances\/synset-/,"");
    gsub(/"/,"");
    gsub(/_/," ");
    print $1, "lemma", $2;
}
		   
