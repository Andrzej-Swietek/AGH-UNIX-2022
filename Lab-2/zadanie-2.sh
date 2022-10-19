#!/bin/bash

read -p "What's your lastname... " NAME

# 1.Prawa dostępu i przekierowania

#   1.1 Dodaj rekurencyjnie katalogowi ~ewao/Stud2022/PSO-Nazwisko
chmod -R 646 ~ewao/Stud2022/PSO-$NAME

#   Wyczyść w swoim katalogu domowym PSO-Nazwisko ze wszystkich plików i katalogów
rm -rf ~$USER/PSO-$NAME/* 

# Utwórz w nim katalog K1 a w nim dwa katalogi K2 i K3
mkdir -p ~$USER/PSO-$NAME/K1/K2 && mkdir -p ~$USER/PSO-$NAME/K1/K3


#   1.2
# echo -e "cat \n ls \n pwd \n " > ~$USER/PSO-$NAME/K1/K2/a.txt
cat > ~$USER/PSO-$NAMe/K1/K2/a

#   1.3 
ls -l

chmod 000 ~$USER/PSO-$NAME/K1/K2/a
chmod 000 ~$USER/PSO-$NAME/K1/*

#   1.4
chmod 111 ~$USER/PSO-$NAME/K1/K2

#   1.5
chmod 440 ~$USER/PSO-$NAME/K1/K2

# owner - group - others

#   1.6
chmod 400 ~$USER/PSO-$NAME/K1/K2/a

#   1.7
chmod 200 ~$USER/PSO-$NAME/K1/K2/a
whoami >> ~$USER/PSO-$NAME/K1/K2/a
cal >> ~$USER/PSO-$NAME/K1/K2/a
cat > ~$USER/PSO-$NAME/K1/K2/a

#   1.8 
chmod 100 ~$USER/PSO-$NAME/K1/K2/a
./~$USER/PSO-$NAME/K1/K2/a
rm -f ~$USER/PSO-$NAME/K1/K2/a

#   1.9
chmod 300 ~$USER/PSO-$NAME/K1

#   1.10
chmod -R 720 ~$USER/PSO-$NAME/K1

#   1.11
stat -c %a ~$USER/PSO-$NAME/K1
stat -c %A ~$USER/PSO-$NAME/K1
# chmod 440 ~$USER/PSO-$NAME/K1
umask 226 ~$USER/PSO-$NAME/K1

#   1.12
touch ~$USER/PSO-$NAME/uneditable
stat -c %a ~$USER/PSO-$NAME/uneditable
umask -S ~$USER/PSO-$NAME/uneditbale

#   2
#   2.1
echo "12345" > ~$USER/PSO-$NAME/a

#   2.2
cp ~$USER/PSO-$NAME/a ~$USER/PSO-$NAME/a-cp && ls -al

ls -l | awk -F" " '{ print $9 " " $2 }'

#   2.3
ln -s ~$USER/PSO-$NAME/a ~$USER/PSO-$NAME/a-lnk
ln ~$USER/PSO-$NAME/a ~$USER/PSO-$NAME/a-hrd
ln ~$USER/PSO-$NAME/a ~$USER/PSO-$NAME/a-hrd2

#   2.4
echo "54321" >> ~$USER/PSO-$NAME/a
echo "hrd-test" >> ~$USER/PSO-$NAME/a-hrd
cat ~$USER/PSO-$NAME/a
echo -e "\n HARD LINK 1 \n"
cat ~$USER/PSO-$NAME/a-hrd
echo -e "\n HARD LINK 1 \n"
cat ~$USER/PSO-$NAME/a-hrd2
echo -e "\n SOFT LINK  \n"
cat ~$USER/PSO-$NAME/a-lnk




