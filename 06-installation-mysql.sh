#!/bin/bash

uid=$(id -u)

if [ $uid -ne 0 ] 
then 
    echo "you are not running with root user"
    exit 1
else 
    echo "you are running with root user"
fi

dnf install mysql -y