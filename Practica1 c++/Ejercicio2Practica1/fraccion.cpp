#include "fraccion.h"

struct FraccionSt{
    int numerador;
    int denominador;
};

Fraccion fraccion(int x, int y){
    FraccionSt* fraccion = new FraccionSt;
    fraccion ->numerador = x;
    fraccion ->denominador = y;

    return fraccion;
}

int getNumerador(Fraccion f1){
    return f1->numerador;
}

int getDenominador(Fraccion f1){
    return f1->denominador;
}
Fraccion sumar(Fraccion f1, Fraccion f2){
    FraccionSt* fraccion = new FraccionSt;
    if (getDenominador(f1)== getDenominador(f2)){
        fraccion->numerador = getNumerador(f1) + getNumerador(f2);
        fraccion->denominador = getDenominador(f1);
    }else{
        fraccion->numerador = getNumerador(f1)*getDenominador(f2) + getNumerador(f2)*getDenominador(f1);
        fraccion->denominador = getDenominador(f1)*getDenominador(f2);
    }
    return fraccion;
}

Fraccion restar(Fraccion f1, Fraccion f2){
    FraccionSt* fraccion = new FraccionSt;
    if (getDenominador(f1)== getDenominador(f2)){
        fraccion->numerador = getNumerador(f1) - getNumerador(f2);
        fraccion->denominador = getDenominador(f1);
    }else{
        fraccion->numerador = getNumerador(f1)*getDenominador(f2) - getNumerador(f2)*getDenominador(f1);
        fraccion->denominador = getDenominador(f1)*getDenominador(f2);
    }
    return fraccion;
}
Fraccion multiplicar(Fraccion f1, Fraccion f2){
    FraccionSt* fraccion = new FraccionSt;
    fraccion->numerador = getNumerador(f1)*getNumerador(f2);
    fraccion->denominador = getDenominador(f1)*getDenominador(f2);
    return fraccion;
}
Fraccion dividir(Fraccion f1, Fraccion f2){
    invertir(f2);
    return multiplicar(f1,f2);
}
void invertir(Fraccion f1){
    int numerador = getNumerador(f1);
    f1->numerador = getDenominador(f1);
    f1->denominador = numerador;
}

void invertir2 (Fraccion& f1){
    int numerador = getNumerador(f1);
    f1->numerador = getDenominador(f1);
    f1->denominador = numerador;
}
///Invierte numerador y denominador.
///void sumplificar(Fraccion f1);
///void destruir(Fraccion f1);
