#include <iostream>
#include "fraccion.h"

using namespace std;

int main()
{
    Fraccion f1 = fraccion(2,3);
    Fraccion f2 = fraccion(5,4);
    cout <<"La fraccion f1 es: " <<getNumerador(f1) << "/" << getDenominador(f1) << endl;
    cout <<"La fraccion f2 es: " <<getNumerador(f2) << "/" << getDenominador(f2) << endl;
    cout << "La suma de f1 y f2 es: " << getNumerador(sumar(f1,f2)) << "/" << getDenominador(sumar(f1,f2)) << endl;
    invertir2(f2);
    cout << getNumerador(f2) << "/" << getDenominador(f2) << endl;
    invertir2(f2);
    invertir(f2);
    cout << getNumerador(f2) << "/" << getDenominador(f2) << endl;
    cout << "Invertir f1 es: " << getNumerador(f1) << "/" << getDenominador(f1) << endl;
    cout << "Multiplicar f1 y f2 es: " << getNumerador(multiplicar(f1,f2)) << "/" <<getDenominador(multiplicar(f1,f2)) << endl;
    cout << "Dividir f1 y f2 es: " << getNumerador(dividir(f1,f2)) << "/" <<getDenominador(dividir(f1,f2)) << endl;
    return 0;
}
