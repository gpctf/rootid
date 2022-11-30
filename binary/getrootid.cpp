#include <stdlib.h>
#include <unistd.h>
using namespace std;
int main(){
    setuid(0);
    system("id");
    return 0;
}