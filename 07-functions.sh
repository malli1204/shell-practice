#!/bin/bash

ID=$(id -u)

if [ $ID -ne 0 ]
then 
    echo "you are not running in root access"
    exit 1
else
    echo "you are running in root access"
fi

Validate(){
    if [ $1 -eq 0 ]
    then 
        echo "$2 installed succesfully"
    else
        echo "$2 not installed"
        exit 1
    fi
}
dnf installed list mysql
if [ $? -ne 0 ]
then 
    echo "$2 is not installed.... going to install"
    dnf install mysql -y
    Validate $? "mysql"

else
    echo "mysql is installed nothing to do"
fi







































# uid=$(id -u)

# if [ $uid -ne 0 ] 
# then 
#     echo "you are not running with root user"
#     exit 1
# else 
#     echo "you are running with root user"
# fi
# validate(){
#     if [ $1 -eq 0 ]
#     then 
#         echo "Installing $2 is success "
#     else 
#         echo "Installing $2 is not succcess"
#         exit 1
#     fi
# }
# dnf list installed mysql
# if [ $? -ne 0 ]
# then 
#     echo "mysql is not installed...going to install"
#     dnf install mysql -y
#     validate $? "mysql"
# else 
#     echo "already installed"
# fi

# dnf list installed nginx
# if [ $? -ne 0 ]
# then 
#     echo "nginx is not installed...going to install"
#     dnf install nginx -y
#     validate $? "nginx"
# else 
#     echo "already installed"
# fi

# dnf list installed python3
# if [ $? -ne 0 ]
# then 
#     echo "python3 is not installed...going to install"
#     dnf install python3 -y
#     validate $? "python3"
# else 
#     echo "already installed"
# fi