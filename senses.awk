  BEGIN { 
    FS="\t";
    OFS="\t";
    s=""; 
    l="";
} 

  /^#/ { 
    next
}

  { 
      gsub(/ /,"_",$3);
      if(l == $1 || l == "") 
	  if(s == ""){
	      s = $3;
	  } else {
	      s = s " " $3;
	  }
      else {
	  print l, $2, s; 
	  s = $3;
      }
      l=$1;
}

  END {
      print l, "lemma", s;
  }
