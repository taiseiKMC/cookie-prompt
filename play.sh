#!/bin/bash -eu
ps x | grep cookie | grep wav | grep play | awk '{
    system("kill "$1" > /dev/null 2>&1")
}'
play -q $1.wav &
