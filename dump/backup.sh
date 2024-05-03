#!/bin/zsh


compact () {
    split -l 80000 $1-new.json $1-

    for f in $1-a?; do
	mv $f $f.jsonl
    done
}

ES_URL=5325493c-3489-4c1d-a81e-5db7cbaef410.8117147f814b4b2ea643610826cd2046.databases.appdomain.cloud:31366
source secret.sh
indexes=("suggestion" "audit" "wn" "votes")
NODE_TLS_REJECT_UNAUTHORIZED=0

for val in "${indexes[@]}"; do
    elasticdump --input=https://$ES_USER:$ES_PASS@$ES_URL/$val --output=$val-new.json --type=data
done

compact suggestion
compact audit

