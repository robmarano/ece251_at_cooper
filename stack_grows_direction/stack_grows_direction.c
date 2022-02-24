#include <stdio.h>
#define SUCCESS 0
#define LOWER_LIMIT 5
#define UPPER_LIMIT 11

static int find_stack_direction(void)
{
    static char *addr = 0;
    auto char dummy;
    if (addr == 0)
    {
        addr = &dummy;
        return find_stack_direction ();
    }
    else
    {
        return ((&dummy > addr) ? 1 : -1);
    }
}

int main(int argc, char *argv[])
{
    int x = 10;

    if ( x < UPPER_LIMIT) {
        x = x + 1;
    }
    printf("The stack on this computer grows (1=up;-1=down): %d\n",find_stack_direction());

    int q = 10;
    int s = 5;
    int a[3];

    printf("Address of q: %d\n",    (int)&q);
    printf("Address of s: %d\n",    (int)&s);
    printf("Address of a: %d\n",    (int)a);
    printf("Address of a[1]: %d\n", (int)&a[1]);
    printf("Address of a[2]: %d\n", (int)&a[2]);
    
    return(SUCCESS);
}


