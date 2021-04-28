#include "Common.h"
#include "Stack.h"

struct Nodo {
    int valor;
    Nodo* siguiente;
};

struct StackRepr {
    int tam;
    Nodo* first;
};

Stack emptyS() {
    Stack stackR = new StackRepr;
    stackR->tam = 0;
    stackR->first = NULL;
    return stackR;
}

int sizeS(Stack s) {
    return s->tam;
}

void pushS(Stack s, int x) {
    Nodo* nodo = new Nodo;
    nodo->valor = x;
    nodo->siguiente = s->first;
    s->first = nodo;
    s->tam = s->tam+1;
}

int topS(Stack s) {
    return s->first->valor;
}

void popS(Stack s) {
    Stack tope = s;
    tope->first = tope->first->siguiente;
    tope->tam = tope->tam-1;
}

void destroyS(Stack s) {
    while(sizeS(s) != 0){
        Nodo* tope = s->first;
        popS(s);
        delete tope;
    }
    delete s;
}
