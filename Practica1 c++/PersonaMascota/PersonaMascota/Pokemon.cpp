#include "../Persona/Pokemon.h"

struct PokemonSt {
    string nombre;
    int vida;
};

Pokemon crearPokemon(string nombre, int vida){
    PokemonSt* pokemon = new PokemonSt;
    pokemon->nombre = nombre;
    pokemon->vida = vida;

    return pokemon;
}

string getNombre(Pokemon p){
    return p->nombre;
}

int getVida(Pokemon p){
    return p->vida;
}
bool estaVivo(Pokemon p){
    return getVida(p);
}
void restarUnoAVida(Pokemon& p){
    p->vida--;
}
///O(1)
void lucharN(int n, Pokemon& p1, Pokemon& p2){
    while(n>0){
        restarUnoAVida(p1);
        restarUnoAVida(p2);
        n--;
    }
}
///void destruirP(Pokemon& p);
void destruirP(Pokemon& p){
    delete p;
}
