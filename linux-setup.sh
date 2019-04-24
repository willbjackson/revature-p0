#!/bin/bash

# requirement 1
# automate the process of provisioning a new linux virtual machine

# next script, configure for redhat and opensuse as well

# Install ubuntu
sudo apt update
sudo apt upgrade
sudo apt install build-essential curl file git
# curl provides source packages
# The build-essentials package is a reference for all the packages needed to compile a Debian package


# Install Brew
# https://docs.brew.sh/Homebrew-on-Linux
sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)"

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
