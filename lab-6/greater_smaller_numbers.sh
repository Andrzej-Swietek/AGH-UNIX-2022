#!/bin/sh
if [ $1 -gt 0 ]
then
   echo "liczba $1 jest dodatnia"
elif [ $1 -lt 0 ]
then
   echo "liczba $1 jest ujemna"
elif [ $1 -eq 0 ]
then
   echo "liczba $1 jest zerem"
else
   echo "$1 nie jest liczba"
fi
