#include "Common.h"
#include "Map.h"

typedef int Priority;

Priority randomPriority() {
    return rand();
}

struct Node {
    Key clave;
    Value valor;
    Priority prioridad;
    Node* hijoIzq;
    Node* hijoDer;
};

struct MapRepr {
    Node* raiz;
    int tam;
};

Map emptyM() {
    Map mapR = new MapRepr;
    mapR->raiz = NULL;
    mapR->tam = 0;
    return mapR;
}

int sizeM(Map m) {
    return m->tam;
}

bool lookupM(Map m, Key k, Value& v) {
    Node* nodo = new Node;
    nodo = m->raiz;
    while(nodo != NULL && nodo->clave != k){
        if (nodo->clave < k){
            nodo = nodo->hijoDer;
        }else{
            nodo = nodo->hijoIzq;
        }
    }
    if (nodo != NULL){
        v = nodo->valor;
    }
    return nodo != NULL;
}

void intercambiarContenido(Node* padre,Node* hijo){
    Key claveP = padre->clave;
    Value valorP = padre->valor;
    Priority prioridadP = padre->prioridad;

    padre->clave = hijo->clave;
    padre->valor = hijo->valor;
    padre->prioridad = hijo->prioridad;

    hijo->clave = claveP;
    hijo->valor = valorP;
    hijo->prioridad = prioridadP;
}

void rotarIzq(Node* padre){
	Node* hijo = padre->hijoIzq;
	Node* x = hijo->hijoIzq;
	Node* y = hijo->hijoDer;
	Node* z = padre->hijoDer;
	intercambiarContenido(padre,hijo);
	padre->hijoIzq = x;
	padre->hijoDer = hijo;
	hijo->hijoIzq = y;
	hijo->hijoDer = z;
}

void rotarDer(Node* padre){
	Node* hijo = padre->hijoDer;
	Node* z = hijo->hijoDer;
	Node* y = hijo->hijoIzq;
	Node* x = padre->hijoIzq;
	intercambiarContenido(padre,hijo);
	padre->hijoDer = z;
	padre->hijoIzq = hijo;
	hijo->hijoIzq = x;
	hijo->hijoDer = y;
}

Node* insertarN(Node* nodo,Node* nuevoNodo, int& tam){
    if(nodo == NULL){
        nodo = nuevoNodo;
        tam++;
    }else if (nodo->clave > nuevoNodo->clave){
		nodo->hijoIzq = insertarN (nodo->hijoIzq,nuevoNodo, tam);
		rotarIzq(nodo);
	}else if (nodo->clave < nuevoNodo->clave){
		nodo->hijoDer = insertarN (nodo->hijoDer,nuevoNodo, tam);
		rotarDer(nodo);
	}else if (nodo->clave == nuevoNodo->clave){
        nodo->valor = nuevoNodo->valor;
	}
	return nodo;
}

void insertM(Map m, Key k, Value v) {
    Node* nodo = new Node;
    nodo->clave = k;
    nodo->valor = v;
    nodo->hijoDer = NULL;
    nodo->hijoIzq = NULL;
    nodo->prioridad = rand();
    m->raiz = insertarN(m->raiz,nodo,m->tam);
}

Node* borrarMin (Node* n, Key& k, Value& v ){
	if (n->hijoIzq == NULL){
		Node* tmp = n->hijoDer;
		k = n->clave;
		v = n->valor;
		delete n;
		return tmp;
	}else{
		n->hijoIzq = borrarMin(n->hijoIzq,k,v);
		return n;
	}
}

//precondicion: N no debe ser NULL
Node* borrarRaiz(Node* n){
	if (n->hijoDer == NULL){
		Node* tmp = n->hijoIzq;
		delete n;
		return tmp;
	}else{
		Key k ;
		Value v;
		n->hijoDer = borrarMin(n->hijoDer,k,v);
		n->clave = k;
		n->valor = v;
		return n;
	}
}

Node* removeN(Node* n, Key k, int& tam){
	if (n!=NULL && n->clave == k){
		tam--;
		return borrarRaiz(n);
	}else if(n!=NULL && k < n->clave){
		n->hijoIzq = removeN(n->hijoIzq, k, tam);
		return n;
	}else if(n!= NULL){
		n->hijoDer = removeN(n->hijoDer, k, tam);
		return n;
	}else{
		return n;
	}
}

void removeM(Map m, Key k) {
    m->raiz = removeN(m->raiz, k, m->tam);
}

void destroyM(Map m) {
    while(sizeM(m) != 0){
        m->raiz = removeN(m->raiz,m->raiz->clave,m->tam);
    }
    delete m;
}

void succApartirDe(int i, Node* n){
    if (i == 0 && n != NULL){
        n->valor++;
        succApartirDe(0,n->hijoDer);
        succApartirDe(0,n->hijoIzq);
    }else if (n != NULL){
        succApartirDe(i--, n->hijoDer);
        succApartirDe(i--, n->hijoIzq);
    }
}

bool esHeap(Node* n){
    bool heap = true;
    if(n->hijoDer != NULL){
        if (n->prioridad > n->hijoDer->prioridad)
            heap = heap && esHeap(n->hijoDer);
        else{
            return false;
        }
    }
    if (n->hijoIzq != NULL){
        if (n->prioridad > n->hijoIzq->prioridad)
            heap = head && esHeap(n->hijoIzq);
        }else{
            return false;
        }
    }
    return heap;
}

return n == NULL ||
   (!n->hijoIzq || n->hijoIzq->prioridad < n->prioridad && esHeap(n->hijoIzq)) &&
   (!n->hijoDer || n->hijoDer->prioridad < n->prioridad && esHeap(n->hijoDer));

void succMap(int i, Map m){
    succApartirDe(i, m->raiz);
}
