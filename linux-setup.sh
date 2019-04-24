#!/bin/bash

# automate the linux enviroment setup

# if ! [ $(uname -r) | grep \#\d*-(\w)]: then


# case $linux_family in
#     ubuntu) ## use apt
#     redhat) ## use yum
#     opensuse) ## use zypper
# esac

# Install ubuntu
apt update
apt upgrade -y
apt install build-essential curl file git


# Install Brew
echo sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)"

# to add Homebrew to your PATH and to your bash shell profile script, ~/.profile on Debian/Ubuntu 
test -d ~/.linuxbrew && eval $(~/.linuxbrew/bin/brew shellenv)
test -d /home/linuxbrew/.linuxbrew && eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
test -r ~/.bash_profile && echo "eval \$($(brew --prefix)/bin/brew shellenv)" >>~/.bash_profile
echo "eval \$($(brew --prefix)/bin/brew shellenv)" >>~/.profile

# Installing Git azure-cli Linux

brew install git
brew install azure-cli
brew install gcc
brew install node


