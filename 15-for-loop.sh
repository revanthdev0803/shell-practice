
#!/bin/bash

#this code is used to check either user was root or not
USERID=$(id -u) #id -u commands extract only user information from log

#these are the variables that use to store the colors

R="\e[31m" #red
G="\e[32m" #green
Y="\e[33m" #yellow
N="\e[0m" #no colour

LOGS_FOLDER="/var/log/shellscripts-logs"    #we create this path for storing our logs
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)  # it removes the .sh in script name
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log"
PACKAGES=("mysql" "python" "nginx" "httpd")

mkdir -p $LOGS_FOLDER #we are making directry and telling if it is already dont give error by using -p
echo "script started at: $(date)" | tee -a $LOG_FILE

#we are checking that if user was not equal to zero or not
#root user id will be zero,if not we will give error

if [ $USERID -ne 0 ]
then
    echo -e "$R Erorr....$N please run with root user" | tee -a $LOG_FILE 
    exit 1 #give any number except zero for checking status
else
    echo "you are the root user" |&>>$LOG_FILE
fi

 #we use this function if given one is installed or not ,to reduce the steps we use this
 #here we are sending two arguments to the function one is exit status as $1=$? $2=is the package name to install
VALIDATE(){

    if [ $1 -eq 0 ]
    then
        echo -e " installing $2 is $G succesfull $N" | tee -a $LOG_FILE 
    else
        echo "installing $2 is fail" | tee -a $LOG_FILE 
        exit 1
    fi
}

for package in ${PACKAGES[@]}
do
    dnf list installed $package &>>$LOG_FILE
    if [ $? -ne 0 ]
    then
        echo "$package is not installed....going to install $package it" | tee -a $LOG_FILE 
        dnf install $package -y
        VALIDATE $? "$package"
    else
        echo -e "$package is allready installed.....$Y nothing to do $N" | tee -a $LOG_FILE 
    fi


