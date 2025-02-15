#include <stdio.h>
#include <stdlib.h>
#include "list.h"

bool is_empty(list l) {
  return l->first == NULL;
}
int pop(list l) {
  node_ptr n = l->first;
  int e = n->elem;
  l->first = l->first->next;
  if (l->first == NULL)  // last element
    l->last = NULL;
  free(n);
  return e;
}
int get(list l, int i) {
  node_ptr n = l->first;
  for (int j = 1; j < i; j++) {
    n = n->next;
  }
  return n->elem;
}
void push(list l, int e) {
  node_ptr n = malloc(sizeof(node));
  n->elem = e;
  n->next = l->first;
  l->first = n;
  if (l->last == NULL)  // first element
    l->last = n;
}
void append(list l, int e) {
  node_ptr n = malloc(sizeof(node));
  n->elem = e;
  if (l->first == NULL)  // first element
    l->first = n;
  else
    l->last->next = n;
  l->last = n;
}
void print(list l) {
  node_ptr n = l->first;
  while (n != NULL) {
    printf(" %d", n->elem);
    n = n->next;
  }
  printf(" ( %d )\n", length(l));
}
void put(list l, int i, int e){
  node_ptr n = l->first;
  for (int j = 1; j < i; j++) {
    n = n->next;
  }
  n->elem = e;
}
void insert(list l, int i, int e) {
  if(i == 1)
    push(l, e);
  else if(i-1 == length(l))
    append(l, e);
  else {
  node_ptr n = malloc(sizeof(node));
  node_ptr k = l->first;
  n->elem = e;
  k = l->first;
  for (int j = 1; j < i-1; j++) {
    k = k->next;
  }
  n->next = k->next;
  k->next = n;
  }  
}
void delete(list l, int i) {
  if(i == length(l)) { 
    node_ptr k = l->last;
    node_ptr n = l->first;
    for(int j = 1; j < i-1; j++) 
      n = n->next;
    n->next = NULL;
    l->last = n;
    free(k);
  }
  else if(i == 1) {
    pop(l);
  }
  else {
    node_ptr n = l->first;
    for (int j = 1; j < i-1; j++) {
      n = n->next;
    }
    node_ptr k = n->next;
    n->next = k->next;
    free(k);
  }
}
void clean(list l) {
  while(!is_empty(l))
    pop(l);
}
int length(list l) {
  int i = 0;
  node_ptr n = l->first;
  while (n != NULL) {
    i = i + 1;
    n = n->next;
  }
  return i;
}

