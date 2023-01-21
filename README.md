# filebased-ssh-server-manager
a bash script to read servers from files and connect to them with ssh

## getting started

```bash 
chmod +x ssh-server-manager.sh
```

add files to the variable "files" in the script and run from command line
```bash
./ssh-server-manager ssh-username
```

or run the script with files direct from command line
```bash
./ssh-server-manager ssh-username 'example.list /path/to/file.list'
```

you can add a description to server with #, but do not use with spaces. Have a look in the example.list
