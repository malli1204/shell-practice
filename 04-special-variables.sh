#!/bin/bash


echo "all variables passed to script : $@"
echo "script name : $0"
echo "present working directory : $PWD"
echo "Home directory of the user : $HOME"
echo "Which user is running the script : $USER"
echo "PID of current script : $$"
sleep 10&
echo "PID of the last command running in bg : $!"