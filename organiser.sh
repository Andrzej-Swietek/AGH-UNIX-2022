#!/bin/bash

# Tworzymy katalog .todo, jeśli nie istnieje
if [ ! -d "$HOME/.todo" ]; then
    mkdir "$HOME/.todo"
fi

# Funkcja dodająca nowe zadanie
add() {
    local date=$1
    local task=$2
    local priority=${3:-0}

    # Sprawdzamy, czy data jest prawidłowa
    if [[ "$date" =~ ^[0-9]{4}-[0-9]{2}-[0-9]{2}$ ]]; then
        local today=$(date +%Y-%m-%d)
        local nextyear=$(date -d "+1 year" +%Y-%m-%d)
        if [ "$date" -lt "$today" ] || [ "$date" -gt "$nextyear" ]; then
            echo "Data wypada w przeszłości lub dalej niż rok naprzód, operacja nie może być wykonana."
            return 1
        fi
    else
        echo "Nieprawidłowa data, operacja nie może być wykonana."
        return 1
    fi

    # Przydzielanie nowego numeru id
    local id=$(ls "$HOME/.todo" | awk -F'.' '{print $1}' | sort -n | tail -1)
    id=$((id+1))

    # Zapisujemy zadanie do pliku
    echo "$id $date $task $priority" >> "$HOME/.todo/$id.$date"
    echo "Dodano na $date z id=$id."
}

# Funkcja wyświetlająca zadania
list() {
    local date=${1:-$(date +%Y-%m-%d)}

    echo "ID: TREŚĆ, PRIORYTET"
    echo "--------------------"
    cat "$HOME/.todo/"* | grep "^[0-9]* $date " | sort -k4 -nr | awk '{print $1 ": " $3 ", " $4}'
}

# Funkcja usuwająca zadanie
del() {
    local id=$1

    if [ -f "$HOME/.todo/$id."* ]; then
        local task=$(cat "$HOME/.todo/$id."*)
        rm "$HOME/.todo/$id."*
        echo "Usunięto id=$id $task"
    else
        echo "Nie ma zadania o podanym id."
    fi
}

# Funkcja przesuwająca zadanie
move() {
    local id=$1
    local new_date=$2

    if [ -f "$HOME/.todo/$id."* ]; then
        local task=$(cat "$HOME/.todo/$id."*)
        local old_date=$(echo "$task" | awk '{print $2}')
        mv "$HOME/.todo/$id.$old_date" "$HOME/.todo/$id.$new_date"
        echo "Przesunięto: $task z $old_date na $new_date."
    else
        echo "Nie ma zadania o podanym id."
    fi
}

