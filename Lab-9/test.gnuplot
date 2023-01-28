##### Umieszczenie wykresu funkcji sin(x) w pliku  ###########
set terminal png	                            # Format terminala: PNG
cd 'C:\Documents and Settings\wms\Pulpit\TwójLogin' #Jeżeli nie będzie tej komendy, to gnuplot utworzy plik z wykresem w katalogu 'C:\gnuplot\bin'
set output "wykres1.png"	                    # Wybieramy nazwę pliku wynikowego i otwieramy plik
plot sin(x)	                                    # "Rysujemy" wykres funkcji sin(x) w pliku
###### Wyświetlenie wykresu funkcji sin(x) na ekranie ###########
set output	                                    # Zamykamy plik
set terminal wxt	                            # Przywracamy terminal domyślny 
replot                                              # Ponownie rysujemy wykres, ale tym razem pojawi on się on na ekranie