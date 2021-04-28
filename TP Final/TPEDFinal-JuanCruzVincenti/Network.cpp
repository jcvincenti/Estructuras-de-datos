#include "Common.h"
#include "Network.h"
#include "Map.h"
#include "Stack.h"

struct NetworkRepr {
    Map flechas;
    Stack acciones;
};

Network emptyN() {
    NetworkRepr* network = new NetworkRepr;
    network->flechas = emptyM();
    network->acciones = emptyS();
    return network;
}

void addN(Network net, Id id) {
    insertM(net->flechas,id,id);
    pushS(net->acciones,id);
}

bool elemN(Network net, Id id) {
    return (lookupM(net->flechas,id,id));
}

int connectedTo(Network net, Id id1){
    Id id8;
    lookupM(net->flechas,id1,id8);
    if (id1 != id8){
        id8 = connectedTo(net,id8);
    }
    return id8;
}

void connectN(Network net, Id id1, Id id2) {
    if (id1 == id2){
        insertM(net->flechas,connectedTo(net,id1),connectedTo(net,id2));
    }else if(!connectedN(net,id1,id2)){
        pushS(net->acciones,connectedTo(net,id1));
        insertM(net->flechas,connectedTo(net,id1),connectedTo(net,id2));
    }
}

bool connectedN(Network net, Id id1, Id id2) {
    Id id3 = connectedTo(net,id1);
    Id id4 = connectedTo(net,id2);
    return id3==id4;
}

void undoN(Network net) {
    Id id = topS(net->acciones);
    Id id2;
    lookupM(net->flechas,id,id2);
    popS(net->acciones);
    if (id == id2){
        removeM(net->flechas,id);
    }else{
        insertM(net->flechas,id,id);
    }
}

void destroyN(Network net) {
    destroyM(net->flechas);
    destroyS(net->acciones);
    delete net;
}
