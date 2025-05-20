#!/bin/bash

#this code is used to check either user was root or not
USERID=$(id -u) #id -u commands extract only user information from log

#these are the variables that use to store the colors

R="\e[31m" #red
G="\e[32m" #green
Y="\e[33m" #yellow
N="\e[0m" #no colour

LOGS_FOLDER="/var/log/shellcripts-logs" #we create this path for storing our logs
SCRIPT_NAME=$(echo $0 | cut -d "." -f1) # it removes the .sh in script name
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log"

mkdir -p $LOGS_FOLDER #we are making directry and telling if it is already dont give error by using -p
echo "script started at : $(date)" &>>$LOG_FILE

#we are checking that if user was not equal to zero or not
#root user id will be zero,if not we will give error

if [ $USERID -ne 0 ]
then
    echo -e "$R Errorr....$N please run with root user" &>>$LOG_FILE 
    exit 1 #give any number except zero for checking status
else
    echo "you are the root user"
fi

#we use this function if given one is installed or not ,to reduce the steps we use this

#here we are sending two arguments to the function one is exit status as $1=$? $2=is the package name to install
VALIDATE(){

    if [ $1 -eq 0 ]
    then
        echo -e " installing $2 is $G succesfull $N" &>>$LOG_FILE
    else
        echo "installing $2 is fail" &>>$LOG_FILE
        exit 1
    fi
}

dnf list installed mysql &>>$LOG_FILE
#this command will check is mysql is  installed or not

if [ $? -ne 0 ]
then
    echo "mysql is not installed....going to install it" &>>$LOG_FILE
    dnf install mysql -y
    VALIDATE $? "mysql"
else
    echo -e "mysql is allready installed.....$Y nothing to do $N" &>>$LOG_FILE
fi

dnf list installed python3 &>>$LOG_FILE
#if installed or not


if [ $? -ne 0 ]
then
    echo "python3 is not installed....going to install it" &>>$LOG_FILE
    dnf install python3 -y

    VALIDATE $? "python3"
else
    echo "python3 is allready installed.....nothing to do" &>>$LOG_FILE
fi

dnf list installed nginx &>>$LOG_FILE
#if installed or not


if [ $? -ne 0 ]
then
    echo "nginx is not installed....going to install it" &>>$LOG_FILE
    dnf install nginx -y
    VALIDATE $? "nginx"
    
else
    echo "nginx is allready installed.....nothing to do" &>>$LOG_FILE
fi