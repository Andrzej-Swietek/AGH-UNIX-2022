#!/bin/bash

LOGIN=""
DOMAIN=""
PASSWORD=""

usage() {                                 # Function: Print a help message.
  echo "Usage: $0 [ -u USER ] [ -d DOMAIN ] [ -p PASSWORD ]" 1>&2
}
exit_abnormal() {                         # Function: Exit with error.
  usage
  exit 1
}

install_sshpass() {
    wget https://sourceforge.net/projects/sshpass/files/sshpass/1.08/sshpass-1.08.tar.gz
    tar xvzf sshpass-1.08.tar.gz
    cd sshpass-1.08
    ./configure && make && make install
}

spawn_variant() {
    echo "[ SPAWN ]"
    # spawn ssh "$LOGIN@$DOMAIN"
    # expect "password"
    # send "$PASSWORD\r"
    # interact
}

sshpass_variant(){
    echo "[ SSHPASS ]"
    # install_sshpass
    # sshpass -p "$PASSWORD" ssh  -x -o StrictHostKeyChecking=no "$USER@$PASSWORD"
} 

# keygen_variant() {
#     if [[ $( ls ~/.ssh/ | wc -l) == 0 ]] 
#        mkdir ~/.ssh
#        chmod 700 ~/.ssh
#        ssh-keygen -t rsa
#        echo "[ KEYGEN ]: KEY GENERATED SUCCESSFULLY"
#     else 
#        echo "[ KEYGEN ]: RSA KEY ALREADY EXISTS"
#     fi
# }


while getopts "u:d:p:" options;
do
  echo "$options"
  case "${options}" in
    u)
      LOGIN=${OPTARG}
      ;;
    d)                                   # If the option is g,
      DOMAIN=${OPTARG}
      ;;
    p)
      PASSWORD=${OPTARG}
      ;;
    :)                                    # If expected argument omitted:
      echo "Error: -${OPTARG} requires an argument."
      exit_abnormal                       # Exit abnormally.
      ;;
    *)                                    # If unknown (any other) option:
      exit_abnormal                       # Exit abnormally.
      ;;
  esac
  # shift $(( OPTIND - 1 ));
done

if [[ $LOGIN != "" && $DOMAIN != "" && $PASSWORD != "" ]]
then 
    echo "$LOGIN | $DOMAIN"
   # keygen_variant
   mkdir ~/.ssh
   chmod 700 ~/.ssh
   ssh-keygen -t rsa
   ssh-copy-id "$LOGIN@$DOMAIN"
   ssh -x "$LOGIN@$DOMAIN"

else 
    echo "MISSING PARAMS"
fi


exit 0


# #!/usr/bin/expect

# set timeout 20

# set cmd [lrange $argv 1 end]
# set password [lindex $argv 0]

# eval spawn $cmd
# expect "password:"
# send "$password\r";
# interact

# https://www.baeldung.com/linux/logging-into-ssh-server