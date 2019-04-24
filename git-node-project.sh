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

# create a web node based project
## docker
mkdir $nd/.docker

touch \
  $nd/.docker/dockerfile \
  $nd/.docker/dockerup.yaml

## github
mkdir -p \
  $nd/.github/ISSUE_TEMPLATE \
  $nd/.github/PULL_REQUEST_TEMPLATE

touch \
  $nd/.github/ISSUE_TEMPLATE/issue-template.md \
  $nd/.github/PULL_REQUEST_TEMPLATE/pull-request-template.md

touch \
  $nd/.github/CODE-OF-CONDUCT.md \
  $nd/.github/CONTRIBUTING.md

## root
mkdir \
  $nd/client \
  $nd/src \

touch \
  $nd/client/.gitkeep \
  $nd/src/.gitkeep \
  $nd/test/.gitkeep

touch \
  $nd/.azureup.yaml \
  $nd/.dockerignore \
  $nd/.editorconfig \
  $nd/.gitignore \
  $nd/.markdownlint.yaml \
  $nd/CHANGELOG.md \
  $nd/LICENSE.txt \
  $nd/README.md

# set up new npm package with a default package.json file
# https://docs.npmjs.com/cli/init
npm init -y

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
