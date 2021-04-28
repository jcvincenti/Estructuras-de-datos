#include "fraccion.h"

struct FraccionSt{
    int numerador;
    int denominador;
};

Fraccion fraccion(int x, int y){
    FraccionSt* fraccion = new FraccionSt;
    fraccion ->numerador = x;
    fraccion ->denominador = y;
}
///Fraccion sumar(Fraccion f1, Fraccion f2);
///Fraccion restar(Fraccion f1, Fraccion f2);
///Fraccion multiplicar(Fraccion f1, Fraccion f2);
///Fraccion dividir(Fraccion f1, Fraccion f2);
///void invertir(Fraccion f1);
///Invierte numerador y denominador.
///void sumplificar(Fraccion f1);
///void destruir(Fraccion f1);
