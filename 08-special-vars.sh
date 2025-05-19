#!/bin/bash

echo "all variables passed to the script: $@"
echo "number of variables:$#"
echo "script name:$0"
echo "current directry: $PWD"
echo "user running this script: $USER"
echo "home directory of user : $HOME"
sleep 10 &
echo "pid of last command : $!"

