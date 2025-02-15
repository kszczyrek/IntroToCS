#!/bin/bash

# Sprawdzamy, czy podano nazwę projektu jako argument
if [ -z "$1" ]; then
  echo "Uzycie: $0 <nazwa_projektu>"
  exit 1
fi

# Tworzenie folderu projektu
mkdir $1
cd $1

# Tworzenie folderu .vscode
mkdir .vscode

# Kopiowanie domyślnego tasks.json (upewnij się, że ścieżka jest poprawna)
cp ~/Desktop/Template/C/tasks.json .vscode/

# Tworzenie domyślnego pliku main.c
echo '#include <stdio.h>

int main(void) {
    printf("Hello, World!\n");
    return 0;
}' > main.c

echo "Projekt $1 został utworzony."
