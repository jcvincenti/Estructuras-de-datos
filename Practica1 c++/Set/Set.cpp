#include"Set.h"

struct SetNode {
    int elem;
    SetNode* next;
};

Set emptyS(){
    return NULL;
}

Set singleton(int x){
    SetNode* setNode = new SetNode;
    setNode->elem = x;
    setNode->next = NULL;
    return setNode;
}

bool belongs(int x, Set s){
    while (s != NULL && s->elem != x){
        s = s->next;
    }
    return s!=NULL;
}

void addS(int x, Set& s){
    if (!belongs(x,s)){
        SetNode* setNode = singleton(x);
        setNode->next = s;
        s = setNode;
    }
}

void removeS(int x, Set& s){
    SetNode* prevSet = new SetNode;
    while(s->elem != x){
        prevSet = s;
        s = s->next;
    }
    prevSet->next = s->next;
}

int size(Set s){
    int tam = 0;
    while(s != NULL){
        tam++;
        s = s->next;
    }
    return tam;
}

///Set unionS(Set s1, Set s2);

void printSet(Set s) {
    if (s == NULL) {
        cout << "{}" << endl;
    } else {
        cout << "{";
        while (s->next != NULL) {
            cout << s->elem << ", ";
            s = s->next;
        }
        cout << s->elem << "}" << endl;
    }
}
