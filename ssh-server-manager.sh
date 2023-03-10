#!/bin/bash
PS3="Enter a number: "
set -e

sshUserName=""
sshArgs=""

files=(server.list example.list) # whitespace seperate list

function choose_server() {
    clear
    select server in ${allServer[@]} back
    do  
        if [ $server == "back" ] 
        then
            choose_file
        fi
        server=$(echo $server | sed 's/#.*//')
        echo "Selected server: $server"
        ssh $sshUserName@$server $sshArgs
#        exit 0 # exit after last ssh-session
        choose_server

    done
}

function choose_file() {
    clear
    select file in ${files[@]} exit
    do  
        allServer=()
        if [ $file == "exit" ]
        then
            echo "goodbye!"
            exit 0
        fi
        while IFS= read -r line || [[ -n "$line" ]]
        do
            allServer+=("$line")
        done <$file
        choose_server
    done
}

choose_file
