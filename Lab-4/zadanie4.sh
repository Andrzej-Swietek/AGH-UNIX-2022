#!/bin/bash

read -p "What's your lastname... " NAME

# Wszystkie zadania wykonujemy w nowym katalogu lab6.
# I. Tr, grep, sort, uniq

# 1.    Korzystając z dowolnego edytora, (np. nano) stwórz w lokalnym katalogu dwa pliki o podanych nazwach i z podaną zawartością):
#       Nie wpisuj "na piechotę", wykorzystaj kopiuj - wklej, wklejenie w nano to prawy klawisz myszy.
echo -e "
1	jeden\n
10	dziesięć\n
2	dwa\n
3	trzy\n
31	trzydzieści jeden\n
4	cztery\n
5	pięć \n
6	sześć\n
7	siedem\n
8	osiem\n
9	dziewięć\n
0	zero\n " > plik1.txt


echo -e "
0  Zero\n
1  One\n
12  Twelve\n
11  Eleven\n
2  Two\n
3  Three\n
4  Four\n
5  Five\n 
6  Six\n
7 Seven\n
8  Eight\n
88  Eighty eight\n
9  Nine\n
" > plik2.txt

# 2.    (*) Zamień w pliku plik1 wszystkie tabulacje i znaki końca linii na spacje, wynik wypisz na ekran.
cat plik1.txt | tr "\t" " " | tr "\n" " "

# 3.    Usuń w pliku plik2 wielokrotne spacje, wynik zapisz w plik22. Zamień plik 22 na plik2
cat plik2.txt | tr -s " " > plik22.txt
cat plik2.txt > plik22.txt

# 4.    Utwórz plik plik11 zawierający połączenie pliku plik1 z plikiem plik1 (plik1 dwukrotnie)
cat plik.txt plik1.txt > plik11.txt

# 5.    Zamień w pliku plik2 wszystkie małe litery na duże i wynik zapisz w plik2big.
cat plik2.txt | tr '[:lower:]' '[:upper:]'   >> plik2bif.txt

# 6.    (*) Jednym poleceniem tr zamień w pliku ~ewao/UNIX/kotek powtarzające się znaki '--' na pojedyncze '-' oraz ', ,' na ' " '. Wynik zapisz w kotek2 (plik kotek zaraz wgram)
cat ~ewao/UNIX/kotek | tr "-" " " | tr -s "-" | tr -s "," | tr ",," "\"" > kotek2.txt

# 7.    Posortuj  dane w pliku plik11 liczbowo i usuń powtarzające się wiersze, wynik zapisz w pliku plik11uniq.
sort -n plik11.txt | uniq -u > plik11uniq.txt | cat plik11uniq.txt

# 8.    Wyszukaj w obu podanych wcześniej plikach (plik1 i plik2):
$files = cat plik1 plik2
#       -   linie zaczynające się od cyfry 2,
#       -   linie kończące się literą n,
#       -   linie, w których pierwsza liczba jest dwucyfrowa,

# 9.    Wyszukaj w wyjściu polecenia ls -l /etc (korzystając z potoku):
#       -   pliki z rozszerzeniem conf (uważać na plik conf.d itp)
#       -   pliki ostatnio zmodyfikowane w roku 2018

# 10.   Korzystając z grep, wyszukaj (finger) i automatycznie policz zalogowanych użytkowników:
#       -   których numer pseudoterminala pts jest w zakresie od 20 do 39,
#       -   użytkowników o loginie niezaczynającym się na 0 (wskazówka: login jest na początku linii)
#       -   użytkowników, którzy mają uruchomiony inny proces niż bash

# 11.   Wyszukaj (a następnie policz) w pliku ~ewao/UNIX/dict:
#       -   wszystkie słowa zawierające slowo 'linuks' (również w środku)
#       -   wszystkie słowa trzyliterowe zaczynające się na h (wskazówka: pamiętaj o znakach początku i końca linii).

# 12.   (*) Wyświetl pełną listę plików w katalogu /etc posortowaną według rozmiaru, malejąco, które zostały zmodyfikowane w 2014 i 2018 roku. Wykonaj zadanie za pomocą sort oraz ls z opcją sortowania.

# 13.   (*) W pliku lista  (w ~ewao/UNIX) skasuj tabulatory, usuń puste linie i powtarzające się spacje oraz spacje na początku linii i posortuj  dane wg nazwiska, ignorując wielkość liter. Wynik przekieruj do pliku lista-new  w swoim katalogu zajęciowym. Wyświetl ten plik.


# II. Symbole wieloznaczne (zadanie domowe *)

# 1.    Wykonaj komendę export LANG=C
# 2.    Spraw, aby wyniki wykonania polecenia ls  pełnej listy posortowanej wg rozszerzenia zostały umieszczone w pliku wyjscie.txt
# 3.    Za pomocą polecenia echo lub polecenia ls -d wyświetlić nazwy wszystkich plików zawartych w katalogu /etc wg następujących kryteriów:
#       -   pierwszym znakiem w nazwie pliku jest a lub b
#       -   pierwszym znakiem w nazwie NIE JEST a lub b
#       -   nazwa pliku zawiera co najmniej 5 znaków
#       -   przedostatnim znakiem w nazwie pliku jest mała litera



# 4.    Proszę dopisać do pliku wyjscie.txt wyniki ostatniego wykonania komendy echo.