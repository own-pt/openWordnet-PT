
split -a 1 -l 15000 uwn-pt-sorted.tsv uwn-pt-sorted-
head -1 uwn-pt-sorted-a > header

# add header
for f in uwn-pt-sorted-[b-h]; do 
    cat header $f >> $f.new; 
    mv $f.new $f
done

# convert to XML
for f in uwn-pt-sorted-?; do 
    python convert.py $f $f.xml 
done

# formating the XML
for f in uwn-pt-sorted-?.xml; do
    tidy -utf8 -wrap 150 -xml -i $f 2> `basename $f .xml`.error > $f.new
    mv $f.new $f
done

# remove temp files
rm uwn-pt-sorted-? header uwn-pt-sorted-?.error



