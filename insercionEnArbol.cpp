struct Node{
	Key clave;
	value valor;
	Priority prioridad;
	Node* izq;
	Node* der;
};

struct MapRepr{
	Node* raiz;
	int tam;
};

typedef MapRepr* Map;

bool esta(Map m, Key k){
	Node* p = m->raiz;

	while(p != NULL && p->clave != k){
		if(k < p-> clave){
			p = p->izq;
		}else{
			p = p-> der;
		}
	}
	return p != NULL;
}

bool lookup(Map m, Key k, Value& v){
	......
	v = nodo -> valor;
	......
}

//Ejemplo
Map m = emptyM();
insert (m, 3, 9);
int z;
bool b = lookup (m, 3, z);
// como el 3 está en el map, reemplaza a z con el value del 3
cout << z; // imprime el 9

-------------------------------------------------------------------

//suponiendo que:
struct Nodo{
	int clave;
	Nodo* izq;
	Nodo* der;
};

struct SetRepr{
	Nodo* raiz;
};

typedef SetRepr* Set;

void insertar (Set s, int x){
	s-> raiz = insertarN(s->raiz, x);
}


// falta el caso en que x sea igual a la raiz
Node* insertarN(Nodo* n, int x){
	Nodo* res = n;
	if (n == NULL){
		res = new Nodo;
		res -> clave = x;
		res -> izq = NULL;
		res -> der = NULL;
	}else if (x < n -> clave){
		n -> izq = insertarN (n->izq,x);
		//rebalancear
	}else if (x > n -> clave){
		n -> der = insertarN (n -> der,x);
		//rebalancear
	}else{/* caso en que sea igual que la raiz*/}
	return res;
}

void borrar (Set s, int x){
	s-> raiz = borrarN(s->raiz, x);
}

Node* borrarN(Node* n, int x){
	if (n!=NULL && n->clave == x){
		return borrarRaiz(n); //borra la raiz manteniendo el invariante de BST
	}else if(n!=NULL && x < n->clave){
		n-> izq borrarN(n->izq, x);
		return n;
	}else if(n!= NULL){
		n-> der = borrarN(n->der,x);
		return n;
	}else{
		return n;
	}
}

Node* borrarRaiz(Node* n) /*precondición: N no es null*/{
	//agarro el mas chico del hijo derecho del arbol (recorrer hacia la izquierda hasta que el hijo izq sea null)
	//primeor chequeo que el hijo derecho no sea null
	if (n -> der == NULL){
		Node* tmp = n -> izq;
		delete n;
		return tmp;
	}else{
		int min ;
		n->der = borrarMin(n->der,min/*por referencia*/);
		n->clave = min;
		return n;
	}
}

borrarMin (Node* n, int& min /*modificamos la variable min que pasamos por parametro por referencia*/) /*precondicion, n no es NULL*/{
	if (n->izq == NULL){
		Node* tmp = n-> der;
		min = n-> clave;
		delete n;
		return tmp;
	}else{
		n -> izq = borrarMin(n->izq,min);
		return n;
	}
}
-------------------------------------------------------------------

//segun dibujo en carpeta
void rotarIzq(Nodo* padre){
	Nodo* hijo = padre -> izq;
	Nodo* x = hijo -> izq;
	Nodo* y = hijo -> der;
	Nodo* z = padre -> der;
	intercambiarContenido(padre,hijo) //tiene que cambiar todos los valores. Esto permite cambiar el contenido unicamente sin cambiar las referencias.
	// al cambiar el contenido, podemos NO cambiar el hijo de padre del padre.
	//aca debajo realizamos la rotación.
	padre -> izq = x;
	padre -> der = hijo;
	hijo -> izq = y;
	hijo -> der = z;
}