#!/bin/bash

ID=$(id -u)

if [ $ID -ne 0 ]
then 
    echo "you are not running in root access"
    exit 1
else
    echo "you are running in root access"
fi
dnf installed list mysql
if [ $? -ne 0 ]
then 
    echo "mysql is not installed.... going to install"
    dnf install mysql -y
    if [ $? -eq 0 ]
    then 
        echo "mysql is installed properly"
    else 
        echo "mysql not installed..."
        exit 1
    fi
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

# dnf list installed mysql
# if [ $? -ne 0 ]
# then 
#     echo "mysql is not installed...going to install"
#     dnf install mysql -y
#     if [ $? -eq 0 ]
#     then 
#         echo "Installing is success "
#     else 
#         echo "Installing is not succcess"
#         exit 1
#     fi
# else 
#     echo "already installed"

# # dnf install mysql -y

# # if [ $? -eq 0 ]
# # then 
# #     echo "Installing is success "
# # else 
# #     echo "Installing is not succcess"
# #     exit 1
# # fi