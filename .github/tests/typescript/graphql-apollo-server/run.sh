#!/bin/sh

set -eu

yarn dev &
pid=$!

sleep 5

curl --fail 'http://localhost:4000/' -H 'Accept-Encoding: gzip, deflate, br' -H 'Content-Type: application/json' -H 'Accept: application/json' -H 'Connection: keep-alive' -H 'DNT: 1' -H 'Origin: http://localhost:4000' --data-binary '{"query":"query {\n  feed {\n    id\n    content\n    author {\n      id\n      name\n      email\n    }\n  }\n}"}' --compressed

kill "$pid"
