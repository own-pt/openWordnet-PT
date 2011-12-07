
# before the script 
# head -1 uwn-pt-sorted-a > header
# edit header

split -a 2 -l 500 uwn-pt-sorted.tsv uwn-pt-sorted-

# add header to all files without header
tail +2 uwn-pt-sorted-aa > aa.tmp
mv aa.tmp uwn-pt-sorted-aa
for f in uwn-pt-sorted-??; do 
    cat header $f >> $f.new; 
    mv $f.new $f
done

wc -l uwn-pt-sorted-??
wc -l uwn-pt-sorted.tsv

# convert to XML
for f in uwn-pt-sorted-??; do 
    python convert.py $f $f.xml 
done

# formating the XML
for f in uwn-pt-sorted-??.xml; do
    tidy -utf8 -wrap 150 -xml -i $f 2> `basename $f .xml`.error > $f.new
    mv $f.new $f
done

# remove temp files
rm uwn-pt-sorted-?? uwn-pt-sorted-??.error



