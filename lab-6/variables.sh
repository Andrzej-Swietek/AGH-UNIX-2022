#!/bin/bash

a=2
a=ls
b=$a
echo "${a}"

# ARRAY 
arr[0]=cos
arr[1]=3
ehco "ARRAY item ${arr[1]}"


# System built in variables: $HOME, $PWD, $USER, printenv, export
echo $HOME $PWD $USER 

#Arguments
#   $0 - nazwa wywołanego skryptu
#   $1, $2, ... - wartości kolejnych parametrów
#   $# - liczba parametrów
#   $* - lista parametrów
#   shift - przesunięcie o parametr

# Assign command result
a='ls $HOME'
a="ls $HOME"
a=`ls $HOME`
a=$(ls $HOME) 


# MATH
a=2
a=$a+1
b=2
((b=$b+3))
((b++))