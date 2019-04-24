#!/bin/bash

# does node exist
if [ -z "$(which node)" ]; then
    echo "install node"
exit 1
fi

start () {

    check1=$(cat package.json | grep -E 'start')

    if [ -z "$check1"]; then
    echo "no start in your package.json. add one and run again"
    exit 1
    fi
    
    # runs the command npm start if it exists in the package.json
    npm start
}

stop () {

    check2=$(cat package.json | grep -E 'stop')

    if [ -z "$check2"]; then
    echo "no stop in your package.json. add one and run again"
    exit 1
    fi

    npm stop
}

# case
command=$1

case $command in
    "start" ) start ;;
    "stop" ) stop ;;
esac

exit 0
# start_node()
# {
#     file=$1

#     # check to see if the file exist if it does, run node file
#     if [ -e $file ]; then
#         node $file
#         echo "$file"
#         # add conditional for package.json
#     else
#         echo "no file"
#     fi
# }

# #kill node

# stop-node()
# {
#     file=$1
#     output=$(kill -INT $$)
#     echo $output
# }


