#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <stdbool.h>
#include "list.h"

int main() {
  char command[20];
  bool cont = true;
  int r, i;
  list l = malloc(sizeof(list_t));
  l->first = l->last = NULL;
  while (cont) {
    printf("Command: ");
    scanf("%s", command);
    if (!strcmp(command, "pop")) {
      if (!is_empty(l)) {
        r = pop(l);
        printf("Result: %d\n", r);
      } else {
        printf("Error - stack is empty!\n");
      }
    }
    else if (!strcmp(command, "get")) {
      if (!is_empty(l)) {
        printf("Index: ");
        scanf("%d", &i);
        if (length(l) < i)  
          printf("Error - bad index\n");
        else 
          printf("Result: %d\n", get(l, i));
      }  
      else  
        printf("Error - stack is empty!\n");
    }
    else if (!strcmp(command, "push")) {
      printf("Value: ");
      scanf("%d", &r);
      push(l, r);
      printf("Result: OK\n");
    }
    else if (!strcmp(command, "append")) {
      printf("Value: ");
      scanf("%d", &r);
      append(l, r);
      printf("Result: OK\n");
    }
    else if (!strcmp(command, "put")) {
      printf("Index: ");
      scanf("%d", &i);
      printf("Value: ");
      scanf("%d", &r);
      // Wiem, ze lepiej jakby ta czesc byla w bilbiotece list...
      int len = length(l);
      if (len < i-1) 
        printf("Error - bad index (there is only %d elements in the list)\n", len);
      else if(is_empty(l)) {
        push(l, r);
        printf("Result: OK\n");
      }
      else if(len == i-1) { 
        append(l, r); 
        printf("Result: OK\n");
      }
      else {
        put(l, i, r);
        printf("Result: OK\n");
      }
      // ale juz nie mam czasu tego przerabiac
    }
    else if (!strcmp(command, "insert")) {
      printf("Index: ");
      scanf("%d", &i);
      if(i-1 > length(l)) 
        printf("Error - bad index\n");
      else {
      printf("Value: ");
      scanf("%d", &r);
      insert(l, i, r);
      printf("Result: OK\n");
      }
    }
    else if (!strcmp(command, "print")) {
      printf("Result: ");
      print(l);
    }
    else if (!strcmp(command, "length")) {
      r = length(l);
      printf("Result: %d\n", r);
    }
    else if (!strcmp(command, "delete")) {
      printf("Index: ");
      scanf("%d", &i);
      if(i > length(l)) 
        printf("Error - bad index\n");
      else {
      delete(l, i);
      printf("Result: OK\n");
      }
            
    }
    else if (!strcmp(command, "clean")) {
      clean(l);
      printf("Result: OK\n");
    }
    else if (!strcmp(command, "exit")) {
      cont = false;
    }
    else
      printf("Unknown command!\n");
  }
  while (!is_empty(l))
    pop(l);
  free(l);

  return 0;
}
