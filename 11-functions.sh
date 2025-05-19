#!/bin/bash
USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "please run with root user"
    exit 1 #give any number except zero for checking status
else
    echo "you are the root user"
fi


VALIDATE(){

    if [ $1 -eq 0 ]
    then
        echo "$2 is succesfull"
    else
        echo "$2 is fail"
        exit 1
    fi
}

dnf list installed mysql
#if installed or not

if [ $? -ne 0 ]
then
    echo "mysql is not installed....going to install it"
    dnf install mysql -y
    VALIDATE $?
else
    echo "mysql is allready installed.....nothing to do"
fi

dnf list installed python3
#if installed or not


if [ $? -ne 0 ]
then
    echo "python3 is not installed....going to install it"
    dnf install python3 -y

    VALIDATE $?
else
    echo "python3 is allready installed.....nothing to do"
fi

dnf list installed nginx
#if installed or not


if [ $? -ne 0 ]
then
    echo "nginx is not installed....going to install it"
    dnf install nginx -y
    VALIDATE $?
    
else
    echo "nginx is allready installed.....nothing to do"
fi