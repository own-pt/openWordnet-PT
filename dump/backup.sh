#!/bin/zsh

compact () {
    input="$1-new.json"
    if [ -z "$input" ]; then
	return 1
    fi

    split -l 80000 $input $1-

    for f in $1-a?; do
	mv $f $f.jsonl
    done
    rm $input
}

export ES_URL=5325493c-3489-4c1d-a81e-5db7cbaef410.8117147f814b4b2ea643610826cd2046.databases.appdomain.cloud:31366
export NODE_TLS_REJECT_UNAUTHORIZED=0

source secret.sh

for val in "votes" "wn" "suggestion" "audit"; do
    elasticdump --input=https://$ES_USER:$ES_PASS@$ES_URL/$val --output=$val-new.json --type=data
    compact $val
done
