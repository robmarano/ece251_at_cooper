#include <stdio.h>
#define SUCCESS 0
#define HELLO_STR "Hello, World!\n"

static const char *hello_str = HELLO_STR;

int main(void)
{
    int pos = 0;
    char c = hello_str[pos];

    while (c != '\0') {
        /* printf("%c",hello_str[pos]); */
        write(1,c,1);
        pos++;
        c = hello_str[pos];
    }

    return(SUCCESS);
}

