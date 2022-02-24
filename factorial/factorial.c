#include <stdio.h>
#define SUCCESS 0
#define LOWER_LIMIT 5
#define UPPER_LIMIT 11

long long int fact(long long int n)
{
    if (n < 1) {
        return (1);
    }
    else {
        return (n * fact(n-1));
    }
}

int main(int argc, char *argv[])
{
    long long int x = 5;
    long long int result = fact(x);
    
    printf("fact(%lld) = %lld\n",x,result);

    return(SUCCESS);
}


