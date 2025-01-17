#!/bin/bash

SAVEIFS=$IFS
IFS=$(echo -en "\n\b")

FILES=$(ls *.mp4|sort)

let START=0

for FILE in $FILES
do
    echo Processing $FILE
    mkdir "${FILE}-chop"
    for COUNT in {1..59}
    do
        exec avconv -i "${FILE}" -ss $START -t 60 -c:v copy -c:a copy "./${FILE}-chop/${COUNT} - ${FILE}"
        let START=$START+60
    done
done

IFS=$SAVEIFS
