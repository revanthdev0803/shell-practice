#!/bin/bash



USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "please run with root user"
    exit 1 #give any number except zero for checking status
else
    echo "you are the root user"
fi

dnf list installed mysql
#if installed or not


if [ $? -ne 0 ]
then
    echo "mysql is not installed....going to install it"
    dnf install mysql -y

    if [ $? -eq 0 ]
    then
        echo "my sql is succesfull"
    else
        echo "my sql is fail"
        exit 1
    fi
else
    echo "mysql is allready installed.....nothing to do"
fi

