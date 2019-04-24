#!/bin/bash
# username of the admin
username=$1


# checks to see if az is currently installed
if [ -z "$(which az)" ]; then
    echo "azure isn't there"
    exit 1
fi

create_user()
{
    dn=$1
    DOMAIN=wbjackson218gmail.onmicrosoft.com
    upn=$displayname@$DOMAIN
    password=$(date)
    us=$2

    # creates a new user if the user doesnt exist 
    output=$(az ad user list -q [].upn | grep -E /$displayname/)

    if [ -n $output ]; then
        az ad user create
        --display-name $dn
        --user-principal-name $upn
        --password $password
        --subscription $us

        echo "user created"
    else 
        echo "been there done that"
    fi
}

assign() 
{
  # create variables for the role, username
  # see if there was any assignment created
  # see if there either a reader of contributer
  # assign one of the 2
}

delete()
{
  # name the person you want to delete
  # make sure that person exists
  # define what an admin is
  # check to see if the person is an admin
  # delete if not an admin
}


# ## create func
# create ($username, $domain, $subscription) {
#   az commands
# }

# ## assign func
# assign ($username, $role) {
#   if ! [user exists]; then
#     exit 1
#   fi

#   if [user has role]; then
#     echo 'yes/no'

#     if [ $4 = 'yes']
#       remove role commands
#     else
#       case read answer
#         yes ) remove role commands;
#   fi

#   add role commands
# }

# # commands

# case $command in
#   create ) create();
#   assign ) assign();
#   remove ) remove();
# esac

