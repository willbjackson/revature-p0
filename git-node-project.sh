#!/bin/bash

##check for git and node

# The Linux which command is used to find the location of a program
# -z checks for an empty string

# if [ $(node -v) !=~ (11.14.0)]; then
if [ -z "$(which git)" ] && [ -z "$(which node)" ]; then
  echo "get git and/or node"
  exit 1
fi

## ensure a directory and make one if necessary
nd=$1

if ! [ -d $nd ]; then
  mkdir $nd
  exit 1
fi

## checks to see if things are in the directory 
## -a means it shows all items in the directory
if [ -n "$(ls -a $nd)" ]; then
    echo "this directory is not empty"
    exit 1
fi

# create a web node based project
## docker
cd $nd
# set up new npm package with a default package.json file
# https://docs.npmjs.com/cli/init
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

username=$2
useremail=$3
# initialize git and customize git environment.
# Git is an open-source tool developers install locally to manage source code
# git config lets you get and set configuration variables that control all aspects of how git operates
# https://git-scm.com/book/en/v2/Getting-Started-First-Time-Git-Setup
git init
git config --global $username
git config --global $useremail

exit 0
