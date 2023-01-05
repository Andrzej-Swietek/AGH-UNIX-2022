
# 1.  Utwórz w katalogu lab5 katalog ZIP i wykonaj w nim poniższe instrukcje.
cd ~$USER/PSO-$NAME/
mkdir lab5 && cd lab5


# 2.   Zapisz w pliku users w katalogu ZIP:
# - pełną nazwę hosta,
# - aktualną datę,
# - id użytkownika.
# - listę aktualnie zalogowanych osób.
touch users.txt
echo -e "USER DETAILS: \n"
hostname >> users.txt
date >> users.txt
whoami >> users.txt
id >> users.txt
users >> users.txt


# 3.   Otwórz plik users do edycji w dowolnym edytorze konsolowym i dopisz na początku pliku tekst:
#      recznie

# 4.   Zapisz w pliku user-info dokładne informacje o użytkowniku mindur.
finger mindur > userinfo.txt

# 5.   Znajdź login osoby Aleksandra Kowalska


# 6.   Wyslij za pomocą ping 5 pakietów sprawdzających aktywność serwera (np wms.math.agh.edu.pl), wynik przekieruj do pliku wms-ping.

# 7.   Wykonaj traceroute dla serwera www.agh.edu.pl.
traceroute www.agh.edu.pl
