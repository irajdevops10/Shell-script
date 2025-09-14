#!/bin/bash

USERID=$(id -u)

VALIDATE(){
    if [ $1 -ne 0 ]
    then 
        echo "$2 .... FAILURE"
        exit 1
    else
        echo "$2 .... SUCCESS"
    fi
}

if [ $USERID -ne 0 ]
then
 echo "Error:: You must have sudo access to execute this script"
 exit 1 #other than 0
fi

dnf list installed mysql

if [ $? -ne 0 ]
then #not installed
    dnf install mysql -y
    VALIDATE $? "Installing MySQL"

else
    echo "MySQL is already .... SUCCESS"
fi

dnf list installed mysql
if [ $? -ne 0 ]
then 

    dnf install git -y
    VALIDATE $? "Installing Git"
 

else
    echo "Git is already .... SUCCESS"
fi