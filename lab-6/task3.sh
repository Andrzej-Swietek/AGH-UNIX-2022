#!/bin/bash
# Napisz króciutkie skrypty:
#   c) kopiujący pliki albo katalogi podane jako kolejne argumenty skryptu do każdego z podkatalogów bieżącej ścieżki, np. ./copyinto Makefile main.c

FOLDER=$1

for i in $*
do
    cp i $Folder
done