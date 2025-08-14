#!/bin/bash

files=$(find . -name "*.log" -mtime +14)

while IFS= read -r filepath
do
    rm -rf $filepath
done <<< $files