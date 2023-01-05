#!/bin/bash
# Napisz króciutkie skrypty:
# b) tworzący n katalogów o nazwie przedrosteknr, gdzie nr jest wartością od 01 do n,
#    przedrostek jest pierwszym argumentem skryptu, 
#    maksymalna liczna katalogów n drugim, w każdym z tych katalogów mają być podkatalogi include i src, 
#    np. makestruct lab 15 utworzy 15 katalogów z podkatalogami include i src.

mkdir -p $1 