#!/bin/bash

for ((i=0;i<=10;i++))
do
echo "i=$i"
done


for i in pierwszy drugi trzeci czwarty
do
    echo "i=$i"
done


for i in `ls`
do
    echo "i=$i"
done


while (true)
  echo "Naciśnij Ctr+C, by przerwać"
  sleep 3
done