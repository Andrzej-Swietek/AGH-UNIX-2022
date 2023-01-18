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

old() {
  case $1 in
    "move")
      inc=${2:-0}
      # Pobranie przestarzałych zadań
      old_tasks=$(grep -v $(date +%F) ~/.todo/data)
      # Przesunięcie zadań na dzisiaj i zwiększenie priorytetu
      while read -r task; do
        id=$(echo $task | cut -d ':' -f1)
        date=$(date +%F)
        task=$(echo $task | cut -d ',' -f2)
        priority=$(( $(echo $task | cut -d ',' -f3) + inc ))
        echo "$id: $date, $task, $priority" >> ~/.todo/data
      done <<< "$old_tasks"
      # Usunięcie przestarzałych zadań z pliku
      sed -i "/^[0-9]*: $(date -d "1 day ago" +%F)/d" ~/.todo/data
      echo "Przeniesiono na dzisiaj $(echo "$old_tasks" | wc -l) zadań."
      ;;
    "del")
      # Pobranie przestarzałych zadań
      old_tasks=$(grep -v $(date +%F) ~/.todo/data)
      # Usunięcie przestarzałych zadań z pliku
      sed -i "/^[0-9]*: $(date -d "1 day ago" +%F)/d" ~/.todo/data
      echo "Usunięto $(echo "$old_tasks" | wc -l) przestarzałych zadań."
      ;;
    "list")
      sort_param=${2:-p}
      case $sort_param in
        "p") old_tasks=$(grep -v $(date +%F) ~/.todo/data | sort -k4 -nr) ;;
        "d") old_tasks=$(grep -v $(date +%F) ~/.todo/data | sort -k2,2 -k4 -nr) ;;
      esac
      echo "ID: TREŚĆ, PRIORYTET"
      echo "--------------------"
      echo "$old_tasks"
      ;;
    *) echo "Nieznana komenda. Dostępne komendy to: move, del, list." ;;
  esac
}

stat() {
    local end_date=${1:-2099-12-31}

    local tasks=$(find "$HOME/.todo/" -type f -printf '%f\n' | awk -F'.' '{print $2 " " $1}')
    local task_dates=$(echo "$tasks" | awk '{print $1}' | sort -u)

    echo "DATA: ILE, ŚR_PRI"
    echo "-----------------"

    for date in $task_dates; do
        if [ "$date" -gt "$(date +%Y-%m-%d)" ] && [ "$date" -le "$end_date" ]; then
            local count=$(echo "$tasks" | awk -v d="$date" '$1 == d {count++} END {print count}')
            local sum=$(echo "$tasks" | awk -v d="$date" '$1 == d {sum+=$2} END {print sum}')
            local avg=$((sum / count))
            echo "$date: $count, $avg"
        fi
    done
}


import() {
    local user=$1
    local n_flag=${2:-""}

    if [ ! -d "/home/$user/.todo" ]; then
        echo "Brak bazy zadań użytkownika $user."
        return
    fi

    if [ ! -r "/home/$user/.todo" ]; then
        echo "Brak uprawnień do odczytania bazy zadań użytkownika $user."
        return
    fi

    local count=0
    for task in /home/$user/.todo/*; do
        local id=$(basename "$task" | awk -F '.' '{print $1}')
        local date=$(basename "$task" | awk -F '.' '{print $2}')
        local content=$(cat "$task" | awk '{$1=$2=""; print $0}')
        local priority=$(cat "$task" | awk '{print $3}')

        if [ -z "$n_flag" ] || ([ ! -z "$n_flag" ] && [ "$date" -ge "$(date +%Y-%m-%d)" ]); then
            echo "$id.$date.$content $priority" >> "$HOME/.todo/$date.$RANDOM"
            count=$((count+1))
        fi
    done
    echo "Zaimportowano $count zadań od $user."
}

block() {
    chmod 600 $HOME/.todo/*
    echo "Zablokowano bazę."
}

unblock() {
    chmod 644 $HOME/.todo/*
    echo "Odblokowano bazę."
}

# main program
case $1 in
  "add") add $2 "$3" $4;;
  "list") list $2;;
  "del") delete $2;;
  "move") move $2 $3;;
  *) echo "Invalid command";;
esac