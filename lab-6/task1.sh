#!/bin/bash
# Napisz króciutkie skrypty:
#   a) wyszukujący we wszystkich plikach w katalogu podanym jako pierwszy argument skryptu (w głąb) wszystkie wiersze zaczynające się od wzoru podanego jako drugi argument skryptu i wypisujący na stdout, przekierowując stderr da pliku log.

FOLDER=$1
PATTERN=$2

FILES = 'ls -al'

grep -inRsH "$PATTERN" $FOLDER