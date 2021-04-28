
#include <cassert>
#include <map>

#include "Common.h"
#include "Map.h"
#include "Test.h"

int main() {
    srand(0xFEDCBA98);

    correrTestsStack();
    cout << endl;

    correrTestsMap();
    cout << endl;

    correrTestsNetwork();
    cout << endl;

    Map m = emptyM();
    insertM(m, 10, 10);
    insertM(m, 11, 11);
    insertM(m, 9,9);

    succMap(1,m);
    int v;
    lookupM(m,10,v);
    cout << "la key 10 tiene el valor: " << v << endl;
    lookupM(m,9,v);
    cout << "la key 9 tiene el valor: " << v << endl;
    lookupM(m,11,v);
    cout << "la key 11 tiene el valor: " << v << endl;


    return 0;
}
