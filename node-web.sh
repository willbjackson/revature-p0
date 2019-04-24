#!/bin/bash
# find out if node exists
# The Linux which command is used to find the location of a program
# -z checks for an empty string
if [ -z "$(which node)" ]; then
    echo "install node"
exit 1
fi

start () {
    # check to see if the package.json contains 'start'
    check1=$(cat package.json | grep -E 'start')

    if [ -z "$check1"]; then
    echo "no start in your package.json. add one and run again"
    exit 1
    fi
    
# This runs an arbitrary command specified in the package’s "start" property of its "scripts" object.
    npm start
}

stop () {
    # check to see if the package.json contains 'stop'
    check2=$(cat package.json | grep -E 'stop')

    if [ -z "$check2"]; then
    echo "no stop in your package.json. add one and run again"
    exit 1
    fi

    # This runs a package’s “stop” script, if one was provided.
    npm stop
}

# case
command=$1

case $command in
    "start" ) start ;;
    "stop" ) stop ;;
    "*" ) echo "need to start or stop a command";;
esac

exit 0
# https://docs.npmjs.com/misc/scripts
# The “scripts” property is a dictionary containing script commands that are run at various times in the lifecycle of your package. The key is the lifecycle event, and the value is the command to run at that point.