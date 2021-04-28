

struct NodeT{
	int valor; // valor de la raiz
	NodeT* izq;
	NodeT* der;
}

typedef NodeT* Tree

Tree emptyT(){
	return Null;
}

bool isEmptyT(Tree t){
	return t==Null;
}

Tree nodeT(int valor, Tree izq, Tree der){
	NodeT* n = new NodeT;
	n->valor = valor;
	n->izq = izq;
	n->der = der;
	return n;
}

int root(Tree t){ return t->valor}
Tree left(Tree t){return t->izq}
Tree right(Tree t){return t->der}

int main(){
	Tree t1 = nodeT(2,emptyT(),emptyT());
	Tree t2 = nodeT(3,emptyT(),t1);
	Tree t3 = nodeT(4,t1,t2)

			4
		   / \
		  2   3
		       \
		       	2
}

//el problema aca es la cantidad de stacks frames abiertos para la sumatoria
int sumT(Tree t){
	if(isEmptyT(t)){
		return 0;
	}else{
		return root(t) + sumT(left(t)) + sumT(right(t));
	}
}

int iterativeSumT(tree T){
	int r = 0;
	List pendientes = nil()
	agregarP(t,pendientes);
	while(not isNil(pendientes)){
		Tree actual = head(pendientes);
		tail(pendientes);
		r = r + root(actual);
		agregarP(left(actual),pendientes); //si cambio el orden a derecho->izquierdo, cambio la rama que primero se procesa
		agregarP(right(actual),pendientes);
	}
	return r;
}

void agregarP(Tree t,List pendientes){
	if(not isEmptyT(t)){
		cons(t,pendientes); // un cons implica procesar los datos como un stack (dfs). un snoc procesa los datos como una queue y por niveles (bfs)
	}
}

    	 t1
        /  \
      t2    t3
     /  \  /  \
    t4  t5 t6  t7
    
[] -> [t1] -> [] -> [t2] -> [t3,t2] -> [t2] -> [t6,t2] -> [t7,t6,t2] -> ... -> [t6,t2] -> ... -> [t2] -> [] -> [t4] -> [t5,t4] -> ... -> []

// recorrido dfs (depth first search)
// recorrido bfs (breadth first search)

// es un arbol general, cada nodo puede tener n cantidad de hijos
struct GNode {
	int valor;
	List hijos;
}

typedef GNode* Gentree

list children (Gentree g){....}