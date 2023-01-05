#!/bin/bash

FILE=""
FOLDER=""
INITIAL_PATH=$(pwd)
REVERSE=0
GR=0



usage() {                                 # Function: Print a help message.
  echo "Usage: $0 [ -r REVERSE ] [ -g GROUP ]" 1>&2
}
exit_abnormal() {                         # Function: Exit with error.
  usage
  exit 1
}

while getopts "r:g:p:" options;
do        
  echo "$options"
  case "${options}" in                    
    r)                                    
      REVERSE=1                      
      ;;
    g)                                   # If the option is g,
      GR=${OPTARG}                   
      ;;
    p) 
        FILE=${OPTARG}
        FOLDER="${FILE%.zip}"
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


handle_zip() {
   CONTENT=$(ls $FOLDER/)
    cd $FOLDER
    echo $CONTENT

    if [[ $( ls | wc -l) == 1 ]] 
    then
        if [[ -d $CONTENT ]]
        then 
            mv $CONTENT/* .
            rm -rf $CONTENT
        fi
    fi

    for x in *.zip; do 
        echo $x
        SUB_ARCHIVE_FOLDER="${x%.zip}/*"
        ls $SUB_ARCHIVE_FOLDER
        unzip $x && mv $SUB_ARCHIVE_FOLDER $(pwd) && rm -rf $SUB_ARCHIVE_FOLDER
    done 
}

# ZIP UNPACK 
if [[ "$FILE" == *.zip ]] 
then
    unzip $FILE
    handle_zip
elif [[ "$FILE" == *.tar.gz ]] 
then
    tar -xvf $FILE
     handle_zip
else
    echo -e "INVALID FILE FORMAT \n \t Archive path: $FILE"
fi

echo $REVERSE
echo $GR
if [[ $GR != 0 ]]
then
    mv $FOLDER "$GR-$FOLDER"
    echo "[ARCHIVE]: $FILE -> $GR-$FOLDER"
else 
    echo "[ARCHIVE]: $FILE -> $FOLDER"
fi

cd $INITIAL_PATH
exit 0
