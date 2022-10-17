#!/bin/bash

read -p "What's your lastname... " NAME
# Utwórz w katalogu domowym katalog PSO-swoje_nazwisko (bez polskich liter np PSO-Wojcik)
mkdir PSO-$NAME

# Za pomocą jednokrotnego wywołania odpowiedniej komendy, utwórz w PSO-... katalog K1 i zawarty w nim katalog K2.
mkdir -p PSO-$NAME/K1/K2

# Utwórz w katalogu K1 plik a
touch PSO-$NAME/K1/a

# Utwórz kopię pliku a o nazwie b
cp PSO-$NAME/K1/a PSO-$NAME/K1/b

# Zmień datę pliku a na 13.09.2022 godz. 9.
touch PSO-$NAME/K1/a -t 202209130900
stat PSO-$NAME/K1/a 

# Utwórz w PSO-swoje_nazwisko katalog K3. Utwórz, za pomocą jednej komendy, kopię zawartości katalogu K1 o nazwie K3.
cp -r PSO-$NAME/K1 PSO-$NAME/K3

# Wyświetl zawartość K3 wraz podkatalogami
ls -R PSO-$NAME/K3

# Usuń, przy pomocy tylko jednej komendy, katalog K1 wraz z całą jego zawartością.
rm -rf PSO-$NAME/K1

# -
# Przekopiuj do K3 katalog UNIX wraz podkatalogami, znajdujący się u użytkownika ewao. Proszę wykonać to polecenie z wykorzystaniem ścieżki względnej, odwołując się bezpośrednio do użytkownika ewao.
cp -r ~ewao/UNIX PSO-$NAME/K3/UNIX
chown $USER PSO-$NAME/K3/UNIX

# Przekopiuj zawartość podkatalogu Fonts do UNIX. Uwaga, w podkatalogu Fonts są dwa dowiązania symboliczne, jeśli nie podasz żadnych opcji, przekopiują się pliki, na które wskazują dowiązania. Sprawdź to za pomocą ls w długiej wersji.
cp PSO-$NAME/K3/UNIX/Fonts/* PSO-$NAME/K3/UNIX/
ls -alr PSO-$NAME/

# Wejdź do katalogu K3 i zmień nazwę pliku b na c (można to zrobić z katalogu nadrzędnego bez wchodzenia do K3)
mv PSO-$NAME/K3/b PSO-$NAME/K3/c 

# Zmień nazwę katalogu K3 na K3-old
mv  PSO-$NAME/K3 PSO-$NAME/K3-old

# Utwórz w katalogu PSO-swoje_nazwisko katalog K3-new
mkdir PSO-$NAME/K3-new

# Przy pomocy jednej komendy, przenieś katalog UNIX (z K3-old) wraz z całą zawartością do katalogu K3-new
mv PSO-$NAME/K3-old/UNIX PSO-$NAME/K3-new

# Przenieś pliki z K3-new/UNIX/Obj main2.o i main.o do swojego katalogu PSO-swoje_nazwisko
chown $USER PSO-$NAME/K3-new/UNIX/Obj/main.o && chown $USER PSO-$NAME/K3-new/UNIX/Obj/main2.o
mv PSO-$NAME/K3-new/UNIX/Obj/main.o PSO-$NAME/main.o
mv PSO-$NAME/K3-new/UNIX/Obj/main2.o PSO-$NAME/main2.o

# Skopiuj katalog PSO-Nazwisko do ~ewao/Stud2022
cp -r PSO-$NAME ~ewao/Stud2022/PSO-$NAME