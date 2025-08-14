#!/bin/bash

source_file=/home/ec2-user/shell-practice/app-logs

files=$(find $source_file -name "*.log" -mtime +14)

while IFS= read -r filepath
do
    rm -rf $filepath
done <<< $files

echo "$?"