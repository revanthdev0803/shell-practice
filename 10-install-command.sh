#!/bin/bash



USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "please run with root user"
    exit 1 #give any number except zero for checking status
else
    echo "you are the root user"
fi


dnf install mysql -y
