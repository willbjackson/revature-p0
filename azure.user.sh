#!/bin/bash
# req 3: automate the process of creating, assigning, deleting a directory user

# Azure definition : Microsoft Azure is a cloud computing service created by Microsoft for building, testing, deploying, and managing applications and services through Microsoft-managed data centers.

# checks to see if az is currently installed
# The Linux which command is used to find the location of a program
# -z flag checks for an empty string
if [ -z "$(which az)" ]; then
    echo "azure isn't there"
    exit 1
fi
# creates user
create () {
    dn=$1
    DOMAIN=wbjackson218gmail.onmicrosoft.com
    upn=$dn@$DOMAIN
    password=$(date)
    sub=$2

    # Flattening an array is done with the [] JMESPath operator. All expressions after the [] operator are applied to each element in the current array. If [] appears at the start of the query, it flattens the CLI command result.
    # grep searches the input files for lines containing a match to a given pattern list. When it finds a match in a line, it copies the line to standard output (by default), or whatever other sort of output you have requested with options.
    # Grep is a Unix command used to search files for the occurrence of a string of characters that matches a specified pattern.
    # JMESPath is a query language for JSON
    # http://jmespath.org/tutorial.html#flatten-projections
    checkUser=$(az ad user list --query [].userPrincipalName | grep -E /$upn/)

    if [ -n $checkUser ]; then
        az ad user create
        --display-name $dn
        --user-principal-name $upn
        --password $password
        --subscription $sub

        echo "user created";
    fi
}

assign () {
  # create variables for the role, username
  # see if there was any assignment created
  # see if there either a reader of contributer
  # assign one of the 2

      # username is the user principle name of the user you want to add role for
    dn=$1
    DOMAIN=wbjackson218gmail.onmicrosoft.com
    upn=$dn@$DOMAIN
    # "create" or "delete" a role
    act=$2
    role=$3

    checkUser=$(az ad user list --query [].userPrincipalName | grep -E /$upn/)

    # checks to see if the user exists
    if [ -z $checkUser ]; then
        echo "user doesnt exist"
        exit 1
    fi

    # is it either reader or contributer
    if [ $role != "reader" ] || [ $role != "contributor" ]; then
        echo "not a valid role"
        exit 1
    fi

    # assign role
    az role assignment $act --assignee $upn --role $role
    echo "success"

}


remove () {
  # define what an admin is
  # check to see if the person is an admin
  # delete user
  
     checkUser=$(az ad user list --query [].userPrincipalName | grep -E /$upn/)

  # A filter projection can be used to see if the user is an admin. The syntax is found in jmespath.
  # http://jmespath.org/tutorial.html#flatten-projections

  admin=$(az role assignment list --include-classic-administrators --query "[?id=='NA(classic admins)'].principalName" | grep -E /$upn/)

    # checks to see if the user exists
    if [ -z $checkUser ]; then
        echo "user doesnt exist"
        exit 1
    fi
  upn=$1

  # see if the user is an admin
  if [ -n "$admin" ]; then
      echo "can not delete an admin user"
      exit 1
  fi
az ad user delete --upn-or-object-id $upn
    echo "deleted user"
}

case $command in
  create ) create;;
  assign ) assign;;
  remove ) remove;;
esac

exit 0