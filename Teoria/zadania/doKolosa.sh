#!/bin/bash

echo "Hello, What is your name? "
read who
echo "Hello, $who!, my name is ${whoami} "

# Ile jest procesów ktorych rodzicem jest proces o PID 1
ps --ppid 1 | wc -l

# Proces zuzywajacy najwiecej rss z Wszystich procesow ktorych rodzicem jest proces o PID 1
ps -eo pid,rss,ppid | awk '{if ($3==1) print $1, $2}' | sort -k2 -rn | awk '{print $1}' | head -1

# Jak wypisac wszystkie naglowki kolumn komendy ps
ps L

# Jak wyswietlic procesy uzywtkownika root posortowane wg romiaru zuzytej pamieci uzywajac tylko "ps"
ps -eo size,pid -U root --sort -size

# procesy z najwiekszym zurzyciem ramu
ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%mem | head

# Want to see and count every process running as vivek (real and effective ID) in user format, run:
ps -U root -u root u | wc -l

# Pass the --no-headers or --no-heading to print no header line at all to get processes count correctly on Linux:
ps -e --no-headers | wc -l

# Limit procesów w systemie
$ cat /proc/sys/kernel/pid_max
# Limity procesów dla uzytkownika
/etc/security/limits.conf
ulimit -a

# Znajdź użytkownika w systemie, który ma uruchomioną największą liczbę procesów.
ps -eo user|sort|uniq -c|sort -rn | head -1

# Podejrzenie stosu wywołań
sudo cat /proc/21517/stack

# Uruchomienie procesu w tle
firefox &

# najbardziej konsumpcyjne procesy
ps aux | sort -nrk 3,3 | head -n 5

# Wypisz UID wszystkich lokalnych użytkowników systemu, którzy mają puste pole komentarza w katalogu /boot
cat /etc/passwd | awk -F: '{if($5=="") print$3}'

# Wypisz nazwę , rozmiar i właściciela pliku zwykłego o największym rozwmiarze w katalogu /boot
ls -alR /boot | grep ^- | awk '{print $3, $5, $NF}' | sort -k2n | tail -1

# Wypisz liczbę procesów z zerową watością parametru NICE o 3 cyfrowym numerze PID
ps -eo nice,pid | awk '{if($1==0 && $2>99 && $2<1000) print $2}' | wc -l

# Opis usera o PID 14
cat /etc/passwd | awk -F":" '{if($3=14) print $5}'

# Ilu użytkowników zdefiniowanych w systemie używa jako podstawowego
interpretera poleceń interpretera Bash
cat /etc/passwd | awk -F":" '{if($7=="/bin/bash") print $5}' | wc -l

# Jaki jest największy numer grupy lokalnej w systemie?
cat /etc/passwd | awk -F ":" '{ print $4}' | sort -n | tail -1

# Ile jest w systemie grup, które nie są grupą podstawową dla ani jednego jednego użytkownika?
cat /etc/group | wc -l

# Ile jest w systemie grup, które nie są grupą podstawową dla ani jednego jednego użytkownika?
expr $(cat /etc/group | wc -l) - $(cat /etc/passwd | awk -F":" '{print $4}' | sort -u | wc -l) 

# Ile grup w systemie nie jest grupami dodatkowymi dla żadnego użytkownika?


# Wyswietl wszystkie pliki zwykłe których nazwa zawiera min  literę "a"
ls -l /usr/include | grep ^- | awk -e '{if($NF ~ /a/) print $5, $NF}'

# Wyswietl wszystkie pliki zwykłe których nazwa zawiera min  literę "a" i rozmiar jest wiekszy 5KB
ls -l /usr/include | grep ^- | awk -e '{if($NF ~ /a/ && &5 > 5120) print $5, $NF}'

# Ile plików w " /usr/includes/" zawiera conajmniej jedna litere "a" i waży ponad 5KB (grep ^- Filtrowanie po pierwszym znaku musi byc minus - pliki regularne)
ls -l /usr/include | grep ^- | awk -e '{if($NF ~ /a/ && $5 > 5120) print $5, $NF}' |  wc -l

