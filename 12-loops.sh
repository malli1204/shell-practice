#!/bin/bash

uid=$(id -u)

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
LOGS_FOLDER="/var/log/shellscript.logs"
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log"
PACKAGES=("mysql" "python" "nginx" "httpd")

mkdir -p $LOGS_FOLDER
echo "script started executing at : $(date)" | tee -a $LOG_FILE
if [ $uid -ne 0 ] 
then 
    echo -e "$R you are not running with root user $N" | tee -a $LOG_FILE
    exit 1
else 
    echo "you are running with root user" | tee -a $LOG_FILE
fi

validate(){
    if [ $1 -eq 0 ]
    then 
        echo -e "Installing $2 is $G success $N " | tee -a $LOG_FILE
    else 
        echo -e "Installing $2 is $R not succcess $N" | tee -a $LOG_FILE
    fi
}

for package in ${PACKAGES[@]}
do 
    dnf list installed $package &>>$LOG_FILE
    if [ $? -ne 0 ]
    then 
        echo "$package is not installed...going to install" | tee -a $LOG_FILE
        dnf install $package -y &>>$LOG_FILE
        validate $? "$package"
    else 
        echo "already installed" | tee -a $LOG_FILE
    fi
done

# dnf list installed mysql &>>$LOG_FILE
# if [ $? -ne 0 ]
# then 
#     echo "mysql is not installed...going to install" | tee -a $LOG_FILE
#     dnf install mysql -y &>>$LOG_FILE
#     validate $? "mysql"
# else 
#     echo "already installed" | tee -a $LOG_FILE
# fi

# dnf list installed nginx &>>$LOG_FILE
# if [ $? -ne 0 ]
# then 
#     echo "nginx is not installed...going to install" | tee -a $LOG_FILE
#     dnf install nginx -y &>>$LOG_FILE
#     validate $? "nginx"
# else 
#     echo "already installed" | tee -a $LOG_FILE
# fi

# dnf list installed python3 &>>$LOG_FILE
# if [ $? -ne 0 ]
# then 
#     echo "python3 is not installed...going to install" | tee -a $LOG_FILE
#     dnf install python3 -y &>>$LOG_FILE
#     validate $? "python3"
# else 
#     echo "already installed" | tee -a $LOG_FILE
# fi