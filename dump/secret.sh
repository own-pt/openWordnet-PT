#!/bin/zsh

ES_HOST=$(jq -r '.connection | .https | .hosts | .[] | .hostname' credentials.json)
ES_PORT=$(jq -r '.connection | .https | .hosts | .[] | .port' credentials.json)
export ES_URL="https://$ES_HOST:$ES_PORT"
export ES_USER=$(jq -r '.connection | .https | .authentication | .username' credentials.json)
export ES_PASS=$(jq -r '.connection | .https | .authentication | .password' credentials.json)

