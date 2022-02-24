#include <stdio.h>
#define SUCCESS 0
#define LOWER_LIMIT 5
#define UPPER_LIMIT 11

int main(int argc, char *argv[])
{
    int x = 10;

    if ( x < UPPER_LIMIT) {
        x = x + 1;
    }

    return(SUCCESS);
}


