#!/bin/zsh

compact () {
    input="$1-new.json"
    if [ ! -f "$input" ]; then
	echo "File $input does not exist."
	return 1
    fi

    split -l 50000 $input $1-

    for f in $1-a?; do
	mv $f $f.jsonl
    done
}

export NODE_TLS_REJECT_UNAUTHORIZED=0
source secret.sh

for i in votes wn suggestion audit; do
    echo Processing $i
    
    if [ ! -f "$i-new.json" ]; then
	echo Updating $i; 
	elasticdump --input=https://$ES_USER:$ES_PASS@$ES_URL/$i --output=$i-new.json --type=data;
	compact $i;
    fi
done
