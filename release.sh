# updating OpenWordnet-PT
python3 -m pyown.cli.update data/own-pt-* --wns dump/wn.jsonl --vts dump/votes.jsonl --sgs dump/suggestion-* -l pt -u arademaker vcvpaiva -o own-pt.nt -v
python3 -m pyown.cli.split own-pt.nt -l pt -e ttl -o data -v

# generating satistics.org
python3 -m pyown.cli.statistics --ownpt data/own-pt-* --ownen data/own-en-* -v

# generating LMFs
wget https://raw.githubusercontent.com/globalwordnet/cili/master/ili-map.ttl
python3 -m pyown.cli.lmf data/own-pt-* ili-map.ttl -li own-pt -lb OpenWordnet-PT -vr 1.0 -lg pt -cs 1.0 --email "arademaker@gmail.com" --url "http://openwordnet-pt.org/" --status "checked" --licence "http://creativecommons.org/licenses/by/4.0/" --citation "http://arademaker.github.io/bibliography/coling2012.html" -o own-pt-lmf-10.xml -v
python3 -m pyown.cli.lmf data/own-en-* ili-map.ttl -li own-en -lb OpenWordnet-EN -vr 1.0 -lg en -cs 1.0 --email "arademaker@gmail.com" --url "http://openwordnet-pt.org/" --status "checked" --licence "http://creativecommons.org/licenses/by/4.0/" --citation "http://arademaker.github.io/bibliography/coling2012.html" -o own-en-lmf-10.xml -v

# validanting LMFs
wget https://globalwordnet.github.io/schemas/WN-LMF-1.1.dtd
xmllint --noout --dtdvalid WN-LMF-1.1.dtd own-pt-lmf-10.xml
xmllint --noout --dtdvalid WN-LMF-1.1.dtd own-en-lmf-10.xml

# remove files
rm own-pt.nt log-update log-format ili-map.ttl* WN-LMF-1.1.dtd*
