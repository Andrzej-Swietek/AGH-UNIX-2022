#!/bin/bash

# dla plików: -d (istnieje katalog), -e (istnieje plik), -r -w -x (plik można czytać, zapisywać, wykonywać)
 if [ -x "plik.txt" ]
  then
    echo 'Plik można wykonywać'
 fi
 
# matematyczne: -eq (równy), -ne (różny), -lt -le (mniejszy, mniejszy lub równy), -gt -ge (większy, większy lub równy)
 a=2
 b=3
 if [ "$a" -gt "$b" ]
   then
	      echo 'Działa'
 fi

# w trybie matematycznym: == (równe), != (różne), < > (mniejsze, większe), <= >= (mniejsze/większe lub równe)
 a=3
 if (($a>5))
  then
    echo "większe"
 fi

# dla znaków: = (równy), != (różny), -n (niepusty ciąg, odpowiednik != ""), -z (pusty ciąg, odpowiednik = "")
 if [ "$a" = "$b" ]
  then
     echo "Równe"
 fi

