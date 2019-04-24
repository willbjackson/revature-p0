#!/bin/bash

newDirectory=$1

##check for git then git init
if [ -z "$(which git)"] && [ -z "$(which node)"]; then
else echo "get git and/or node"
exit 1
fi


## ensure a directory
if [ -d $newDirectory && -f false ]; then
  mkdir $newDirectory
  exit 1
fi

## docker
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
mkdir -p \
  client \
  src \

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

# convert to repository, initialize git
username=$2
useremail=$3
# initialize git
git init
git config $username
git config $useremail
# initialize node
npm init -y
# install all modules listed as dependencies in package.json
npm install npm@latest -g

# node commands

# npm scripts

# study npm and node 
# look into the script section of npm