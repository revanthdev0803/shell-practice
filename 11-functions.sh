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

dnf list installed python3
#if installed or not


if [ $? -ne 0 ]
then
    echo "python3 is not installed....going to install it"
    dnf install python3 -y

    if [ $? -eq 0 ]
    then
        echo "python3 is succesfull"
    else
        echo "python3 is fail"
        exit 1
    fi
else
    echo "python3 is allready installed.....nothing to do"
fi

dnf list installed nginx
#if installed or not


if [ $? -ne 0 ]
then
    echo "nginx is not installed....going to install it"
    dnf install nginx -y

    if [ $? -eq 0 ]
    then
        echo "nginx is succesfull"
    else
        echo "nginx is fail"
        exit 1
    fi
else
    echo "nginx is allready installed.....nothing to do"
fi