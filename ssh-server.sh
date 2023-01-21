PS3="Enter a number: "
set -e
#files=(server.list example.list) # whitespace seperate list
files+=()
files+=($1)
sshUserName="techcreater"
sshArgs=""

function choose_server() {
    select server in ${allServer[@]} exit
    do  
        if [ $server == "exit" ] 
        then
            echo "goodbye!"
            exit 1
        fi
        server=$(echo $server | sed 's/#.*//')
        echo "Selected server: $server"

        ssh $sshUserName@$server $sshArgs
#        exit 1 # exit after last ssh-session
        choose_server
    done
}

function choose_file() {
    select file in ${files[@]}
    do  
        while IFS= read -r line; do
            allServer+=("$line")
        done <$file
        choose_server
    done
}

choose_file
