 #	Wszystkie zadania wykonujemy w katalogu lab7.
 #	I. Find, whereis, xargs, head, tail (w przypadku długiej listy wyników wykonujemy tylko screen początku.
 #		Za pomocą find znajdź w katalogu ~ewao/UNIX i podkatalogach wszystkie pliki używane przez ostatnie 3 dni.
 # 		Znajdź w katalogu ~ewao/UNIX i podkatalogach wszystkie pliki o rozmiarze przekraczającym 100kB.
 #		Znajdź w katalogu /etc i podkatalogach wszystkie pliki z rozszerzeniem cfg, przekierowując wszystkie komunikaty o braku dostępu do pliku error.log.
 #		Wykorzystaj opcję exec, aby dodatkowo przekopiować znalezione pliki z pkt 3. do utworzonego u siebie katalogu CFG.
 #   		Wykorzystaj xargs, aby dodatkowo skompresować i wkopiować do katalogu CFG znalezione pliki w 3. Nie zapomnij o przekierowaniu błędów find do pliku.
 # 		Znajdź w katalogu /bin wszystkie linki symboliczne i wypisz w postaci pełnej listy z informacją o przekierowaniach (ls -l).
 # 		Za pomocą jednego polecenia find znajdź w katalogu ~ewao i podkatalogach archiwa zip i rozpakuj je do katalogu ZIP u siebie. Nie zapomnij o przekierowaniu błędów find do pliku, gdyż nie masz dostępu do wszystkich katalogów.
 #		Wykorzystując operatory logiczne, znajdź w katalogu /etc i podkatalogach wszystkie pliki z rozszerzeniem conf, które nie były modyfikowane od tygodnia, przekierowując wszystkie komunikaty o braku dostępu do pliku error.log
		 # Wykonaj punkt 7. dodatkowo szukając na maksymalną głębokość w /etc i jego podkatalogach, przekierowując wszystkie komunikaty o braku dostępu do pliku error.log a wyniki do findcfg. Wyświetl ten plik.
		 # Znajdź lokalizację katalogu dict na serwerze. Pokaż 5 pierwszych i 6 ostatnich linii pliku words znajdującym się w dict. Wyświetl wszystkie informacje o dict i words.
#	II. Procesy (nie trzeba dokumentować screenami, wystarczą polecenia + kombinacje klawiszy)
#		Wyświetl procesy związane z własnym terminalem (uruchomione z bieżącego terminala).
			ps -u

		 # Wyświetl wszystkie procesy (procesy wszystkich użytkowników).
		 # Wyświetl pełną listę procesów danego użytkownika (opcja -u). Wybierz login kolegi.
		 # Uruchom polecenie cat > plik. Następnie naciśnij Ctrl-Z i przenieś w tło (bg). Sprawdź, jaki jest numer powstałego procesu? Wznów proces cat jako pierwszoplanowy, a następnie przerwij jego działanie, aby plik się nie utworzył. Sprawdź na liście procesów, czy proces zniknął.
		 # Uruchom proces nano lop w tle. Jaki jest numer powstałego procesu?
		 # Wznów proces nano jako pierwszoplanowy, wpisz do niego następującą treść:
			 # echo "Mój pierwszy skrypt"
			 # for ((i=1;i<100;)); do
			 # i=$i
			 # done

		 # Nadaj plikowi lop prawo do wykonywania, a następnie uruchom ./lop, zatrzymaj go za pomocą Ctrl-Z i przenieś w tło.
		 chmod +x ./lop
		 # Uruchom ponownie nano lop i nano bez argumentów, tym razem od razu w tle.
		 # Uruchom program ./lop w tle, a drugi normalnie i przenieś w tło. Sprawdź numery i stany obu procesów lop. Czy się różnią? Spraw aby zatrzymany program loop zaczął pracować.
		 # Wznów proces nano lop, sprawdź wcześniej za pomocą jobs, który ma numer. Zamknij program nano lop.
		 # Wznów proces ./lop, a następnie przerwij jego wykonywanie, naciskając Ctrl-C. Sprawdź za pomocą ps, czy proces się zakończył.
		 # Otwórz nowy terminal (duplicate session) i zaloguj się. Sprawdź listę jobs, czy widzisz procesy z drugiego terminala? Wyświetl wszystkie swoje procesy.
		 # Z nowego terminala zakończ działanie drugiego procesu lop oraz nano za pomocą polecenia kill. Sprawdź, czy oba udało się zakończyć, jeśli nie, użyj -9 i zamknij drugi terminal.
		 # Sprawdź, czy w tle są jeszcze jakieś procesy, jeśli coś pozostało, je również zakończ.
		 # Za pomocą polecenia top albo htop znajdź (wzrokowo) proces, który zajmuje najwięcej czasu procesora. Lista cały czas się zmienia, możesz zatrzymać działanie programu za pomocą klawisza skrótu.
