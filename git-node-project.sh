#!/bin/bash

## Requirement 2 ##
# automate the process of setting up a new git project repository structure
# include: verify req-1 is valid, create web node-based project

# the name of the directory that you put as an argument
directory=$1

# the user.name and user.email used to do the git config to hook up your get repo to this directory
user_name=$2
user_email=$3


## verify git and node are installed
if [ -z "$(which git)" ] && [ -z "$(which node)" ]; then
    echo "the environment for this script is not set up yet"
    exit 1
fi



## checks to see if directory exist
if ! [ -d "$directory" ]; then
    mkdir $directory
fi

## checks to see if things are in the directory 
## -A means it shows all items in the directory
if [ -n "$(ls -A $directory)" ]; then
    echo "this directory is not empty"
    exit 1
fi

cd $directory
npm init

## directory strucker ## 
mkdir .docker

touch \
.docker/dockerfile \
.docker/dockerup.yaml

## github
mkdir -p \
.github/ISSUE_TEMPLATE \
.github/PULL_REQUEST_TEMPLATE

touch \
.github/ISSUE_TEMPLATE/issue-template.md \
.github/PULL_REQUEST_TEMPLATE/pull-request-template.md

touch \
.github/CODE-OF-CONDUCT.md \
.github/CONTRIBUTING.md

## root
mkdir \
client \
src \
test

touch \
client/.gitkeep \
src/.gitkeep \
test/.gitkeep

touch \
.azureup.yaml \
.dockerignore \
.editorconfig \
.gitignore \
.markdownlint.yaml \
CHANGELOG.md \
LICENSE.txt \
README.md

git init
git config $user_name
git config $user_email


exit 0