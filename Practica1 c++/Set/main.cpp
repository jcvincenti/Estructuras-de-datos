#include <iostream>
#include "Set.h"

using namespace std;

int main()
{
    Set s1 = emptyS();
    addS(1,s1);
    addS(2,s1);
    addS(3,s1);
    printSet(s1);
    return 0;
}
