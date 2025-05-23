#!/bin/bash


echo "All variables passed : $@"
echo "number variables : $#"
echo "Script number : $0"
echo "Current directory : $PWD "
echo "User running the script : $USER"
echo "home directory of user : $HOME"
echo "PID of the script : $$"
sleep 100 &
echo "PID of the script running in the bg : $!"