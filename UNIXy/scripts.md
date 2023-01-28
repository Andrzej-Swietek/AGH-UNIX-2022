# Skrypty

## Przykłady z zajęć

0. [Wylistuj wszystkie podane parametry](scripts/list_params.sh)
0. [Monitoruj liczbę procesów (bez procesu liczącego)](scripts/count_processes_except_self.sh)
0. [Wypisz opis użytkownika o podanym UID](scripts/user_description_from_uid.sh)
0. [Wypisz opis użytkowników o podanych UIDach](scripts/user_description_from_uids.sh)
0. [Wyświetl prawa dostępu do danego pliku z punktu widzenia procesu basha](scripts/describe_file_permissions_from_current_process.sh)
0. [Podziel plik na kawałki o zadanym rozmiarze](scripts/divide_file_in_chunks.sh)
0. [Przykład użycia trapów](scripts/traps_example.sh)
0. [Forkbomba](scripts/forkbomb.sh)
0. [2016/2017 - Zestaw 5 - *Programowanie w językach interpreterów poleceń*](scripts/lab-5-writing-scripts)

## Zadania

#### A. Pliki

0. Oblicz liczbę plików, katalogów i symlinków znajdujących się w katalogu.

    > Napisz skrypt liczący ile plików, katalogów, a ile dowiązań symbolicznych jest w katalogu podanym jako pierwszy paramter skryptu.
    Jeśli nie podano żadnych parametrów, to skrypt powinien sprawdzić katalog bieżący. Jeśli podano więcej niż jeden parametr, to skrypt powinien
    sprawdzić pierwszy z nich, a pozostałe parametry wyświetlić z komunikatem "Parametr nadliczbowy."

    *Implementacje:* [link] (scripts/piotr-janczyk/count-files-by-type.sh)

0. Oblicz liczbę plików regularnych w podanym katalogu.

    > Wejść do katalogu, policzyć pliki regularne, wrócić do katalogu pierwotnego.

    *Implementacje:* [link] (scripts/missing_scripts/change_directory_and_count.sh.txt)
    
0. Oblicz liczbę plików regularnych w podanym katalogu.

    > Skrypt może dostać (nie musi - wtedy domyślnie katalog domowy) jeden argument będący ścieżką do katalogu. Sprawdza, czy to katalog, i wyświetla
    odpowiedni komunikat jeśli nie. Jeśli tak, to liczy w nim ilość plików regularnych.

    *Implementacje:* [link] (scripts/missing_scripts/count_regular_files_in_directory.txt)

0. Oblicz liczbę plików regularnych w podanych katalogach.

    > Skrypt dostaje ścieżki (względne lub bezwzględne) katalogów i podaje ile jest w nich plików regularnych.

    *Implementacje:* [link] (scripts/missing_scripts/count_files_in_directories.txt)

0. Oblicz liczbę i sumę rozmiarów plików regularnych w podanym katalogu.

    > Wypisanie sumy w bajtach rozmiarów plików regularnych w katalogu podanym jako argument oraz liczby tych plików. W przypadku braku argumentów trzeba przyjąć katalog bieżący.

    *Implementacje:* [link] (scripts/piotr-janczyk/count-and-sum-files.sh)

0. Porównaj liczbę plików w dwóch podanych katalogach.

    > Napisz skrypt przyjmujący dwa argumenty - nazwy katalogów. Działanie skryptu ma polegać na sprawdzeniu, w którym z nich jest więcej plikow i poinformowaniu
    o tym uzytkownika. Jeśli podano więcej niż dwa parametry, to skrypt powinien zadziałać dla pierwszych dwóch, a pozostałe parametry wyświetlić z komunikatem
    "Parametr nadliczbowy". Gdy parametrów bedzie za mało, to również powinien się pojawić odpowiedni komunikat.

    *Implementacje:* [link] (scripts/piotr-janczyk/compare-number-of-files.sh)

0. Oblicz sumę rozmiarów plików regularnych w podanym katalogu.

    > Skrypt liczy łączny rozmiar plików regularnych w katalogu podanym jako parametr, a w razie braku parametru sprawdza katalog bieżący.

    *Implementacje:* [link] (scripts/missing_scripts/regular_files_sizes_sum_in_directory.txt)

0. Oblicz sumę rozmiarów plików regularnych w podanym katalogu.

    > Proszę napisać skrypt, który jako argument otrzymuje ścieżkę do katalogu (jeżeli nie, ma ją pobrać od użytkownika). Jeżeli podany argument nie jest
    adresem katalogu, ma wypisać odpowiedni komunikat. W przeciwnym razie ma podać rozmiar w bajtach wszystkich plików regularnych znajdujących się w tym katalogu.

    *Implementacje:* [link] (scripts/count_bytes_of_files_in_given_dirs.sh)

0. Oblicz sumę rozmiarów plików (nie folderów) w podanym katalogu.

    > Napisz skrypt, który jako argument przyjmuje ściężkę dostępu do katalogu, jeśli nie dostanie argumentu, to się o niego upomina; jak dostanie, to sprawdza, czy to jest katalog, a jeśli nie, to o tym informuje; jak jest w katalogu, to sumuje wielkości wszystkich plików w tym katalogu (folderów już nie)

    *Implementacje:* [link] (scripts/missing_scripts/files_sizes_sum_no_directories.txt)

0. Oblicz sumę rozmiarów plików regularnych w podanych katalogach.

    > Skrypt dostaje (jak nie - ma się dopytać) ścieżki względne lub bezwzględne do katalogów i dla każdego katalogu z osobna ma podać
    ile bajtów w sumie zajmują znajdujące się w nim pliki regularne.

    *Implementacje:* [link] (scripts/missing_scripts/directories_and_regular_files_sizes_sums.txt)

0. Oblicz ilość miejsca zajętego przez pliki w podanym katalogu.

    > Może dostać argument będący ścieżką dostępu do katalogu, jeżeli argumentu nie będzie to przyjmujemy, że chodzi o katalog bieżący. Skrypt sprawdza,
    czy katalog istnieje, jeżeli nie to kończymy działanie skryptu ze stosownym komunikatem. W przeciwnym wypadku oblicza, ile miejsca w bajtach zajmują
    pliki regularne w katalogu.

    *Implementacje:* TODO

0. Skopiuj plik.

    > Napisz skrypt "kopia", ktory skopiuje plik podany jako pierwszy parametr skryptu pod nazwą podaną jako drugi parametr. Jeżeli kopiowanie się nie powiedzie,
    wypisze komunikat "Nie udało się". Błędy przekieruj na urządzenie puste. Jeśli zabraknie drugiego argumentu lub drugi argument będzie katalogiem,
    nazwa kopii powinna brzmieć: nazwapliku.bak. Jeśli podano więcej niż dwa parametry, to skrypt powinien zadziałać dla pierwszych dwóch, a pozostałe parametry
    wyświetlić z komunikatem "Parametr nadliczbowy". Gdy parametrów bedzie za malo, to również powinien pojawić się odpowiedni komunikat.

    *Implementacje:* [link](scripts/piotr-janczyk/copy-file.sh)

0. Oblicz liczbę wystąpień wzorców w pliku.

    > Napisz skrypt, który dla pliku podanego jako pierwszy parametr wyswietla liczę wierszy, w których występuje wzorzec (wzorce) podany jako drugi i ew. następne argumenty.
    Ilość wzorców w wywołaniu powinna być dowolna. Składnia "Ile plik wzorzec1 [wzorzec2 wzorzec3 ....]".

    *Implementacje:* [link] (scripts/missing_scripts/count_pattern_lines_in_file.txt)

0. Monitoruj procentową zajętość katalogu domowego.

    > Jeżeli nie ma argumentu, to doczytuje go z klawiatury. Jeżeli jest więcej niż jeden argument, to zajmuje się tylko pierwszym. Skrypt sprawdza zajętość
    procentową /home danego użytkownika. Następnie tę liczbę porównujemy z argumentem skryptu (zakładamy, że jest on z zakresu 1-100, jak procent) w pętli nieskończonej.
    Pętla sprawdza cały czas, czy zajetość /home nie przekracza podanego przez użytkownika procentu. Jeżeli tak się stanie, to wypisuje stosowny komunikat.

    *Implementacje:* [link] (scripts/missing_scripts/check_percent_size_of_home_directory.txt)

#### B. Użytkownicy

0. Wypisz opisy zalogowanych użytkowników

    > Skrypt nie dostaje żadnych parametrów, ma wypisać 5 kolumnę pliku /etc/passwd wszystkich aktualnie zalogowanych użytkowników

    *Implementacje:*
    [link](scripts/describe_logged_in_users.sh)

0. Wypisz opisy zalogowanych użytkowników

    > Napisać skrypt który "mniej więcej co 5 sekund" wypisuje listę zalogowanych użytkowników i ich opis z 5 kolumny pliku passwd w przypadku braku opisu powinien pojawić się napis brak opisu

    *Implementacje:* TODO

0. Wypisz opisy zalogowanych użytkowników wraz z ich UID

    > Co 2 sekundy wypisuje listę zalogowanych użytkowników razem z ich UID i opisem (jeśli kolumna z opisem jest pusta wypisuje "brak opisu") i podsumowanie ilu użytkowników jest zalogowanych.

    *Implementacje:* TODO

0. Monitoruj logowania użytkownika

    > Jeden argument (w razie czego wola o niego) - nazwa usera - w petli nieskonczonej co pare sek sprawdza czy user jest zalogowany - jak tak to krzyczy ze jest i konczy dzialanie

    *Implementacje:* TODO

#### C. Procesy

0. Monitoruj sumę RSS procesów danego użytkownika

    > Dostaje argument, jak nie to wczytuje z klawiatury. Wypisuje sumę RSS (ps aux, 6sta kolumna) wszystkich procesów użytkownika podanego jakgo argument (czy tam wczytanego z klawiatury) w nieskończonej pętli co dwie sekundy

    *Implementacje:* TODO

0. Monitoruj sumę RSS procesów danego użytkownika

    > Napisz skrypt, do którego w argumencie podawana jest nazwa użytkownika (jeśli nie ma argumentu to przyjmij bieżącego użytkownika, jeśli argumentów jest więcej to weź 1 argument, a pozostałe pomiń). skrypt w pętli nieskończonej co 2 sekundy ma wypisywać ile pamięci rezydualnej zajmują wszystkie procesy tego użytkownika.

    *Implementacje:* TODO

0. Monitoruj sumę RSS dla procesów wszystkich użytkowników

    > Napisz skrypt: 1)do którego nie są przekazywane żadne argumenty 2)w pętli nieskończonej co trzy sekundy wypisuje wszystkich userów, a obok nich sumę używanej przez nich pamięci residualnej (RSS) 3)oddziela wypisy ciągiem pauz 4)w przypadku naciśnięcia ctr^C program kończy działanie i wypisuje aktualną datę i godzinę

    *Implementacje:* TODO

0. Oblicz sumę RSS procesów wszystkich zalogowanych użytkowników

    > Napisz skrypt wypisujący RSS wszystkich procesów zalogowanych użytkowników

    *Implementacje:*
    [link](scripts/total_rss_per_logged_in_user.sh)

0. Oblicz sumę VSZ procesów danego użytkownika

    > Napisz skrypt, który pobiera jako pierwszy argument nazwę użytkownika (jeśli argumentów brak - kończy działanie, jeśli argumentów więcej niż 1 - olewa pozostałe), a następnie wypisuje sumę wartości VSZ wszystkich procesów tego użytkownika.

    *Implementacje:* TODO

0. Oblicz liczbę długo pracujących procesów

    > Napisz skrypt, który sprawdzi ilość procesów działających dłużej niż czas podany w sekundach do pierwszego parametru. (przy braku parametrów skrypt ma się o nie upomnieć, ma też pominąć dalsze niż pierwszy).

    *Implementacje:*
    [Policz procesy które zużyły więcej niż N sekund procesora](scripts/print_processor_time_of_process.sh)

0. Monitoruj procesy zalogowanych użytkownikóœ

    > Skrypt co 2 sekundy wypisuje listę zalogowanych użytkowników razem z liczbą procesów które zostały przez nich uruchomione. Przerwanie wypisywania na komendę Ctrl+C i wypisanie daty.

    *Implementacje:*
    [link](scripts/n_processes_per_logged_in_user.sh)

0. Monitoruj długo pracujące procesy

    > Co kilka sekund (nie było sprecyzowane co ile) w nieskończonej pętli wypisuje liczbę aktualnie uruchomionych procesów, które zużyły więcej niż t sekund czasu procesora.  Jeżeli skrypt został uruchomiony z parametrem, to parametr jest liczbą t.  Jeżeli nie, to t ma być domyślnie ustawione na 10.  Skrypt jest kończony przez ubicie (ctrl+c), ale przed ubiciem powinien wypisać bieżącą datę.

    *Implementacje:*
    [link](scripts/count_processes_running_for_longer_than_seconds.sh)

0. Wypisz czas procesora danego procesu

    > Wypisz zużyty czas procesora dla danego PID

    *Implementacje:*
    [Wylistuj zużyty czas procesora procesu o podanym PIDzie](scripts/print_processor_time_of_process.sh)

0. Zmień nice procesów danego użytkownika o danym czasie procesora

    > Skrypt ma przyjmować dwa argumenty - nazwę użytkownika i liczbę (sekund). Jeśli jest wywołany bez argumentów, przyjmuje domyślnie bieżącego użytkownika i 0. Zakładamy, że nigdy nie dostaje tylko jednego z argumentów.  Zadanie: zmienić o 1 parametr nice wszystkich procesów tego użytkownika, które mają czas procka większy lub równy, niż zadana liczba sekund.

    *Implementacje:* TODO

0. Cyklicznie zmieniaj nice śpiących procesów

    > Skrypt działa cyklicznie co 30 ustawiając naszym procesom które mają status S (sleeping) nice 5

    *Implementacje:* TODO

0. Zmień nice wszystkich procesów danego użytkownika na 0

    > Napisz skrypt, który jako argument przyjmuje nazwę użytkownika (w razie braku argumentu upomina się, w razie większej ilości argumentów bierze tylko pierwszy) i zmienia parametr nice wszystkich procesów tego użytkownika na 0.

    *Implementacje:*
    [link](scripts/renice_all_user_processes_to_0.sh)

0. Zmień nice wszystkich procesów danego użytkownika na 5

    > Proszę napisać skrypt, który jako argument będzie przyjmował nazwę użytkownika (jeśli brak argumentu ma się o niego upomnieć, a jeśli jest więcej bierze pod uwagę tylko pierwszy) i zmienia temu użytkownikowi parametr nice wszystkich jego procesów na 5.

    *Implementacje:* TODO
