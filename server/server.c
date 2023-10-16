#include <fcgi_stdio.h>
#include <stdlib.h>

int main(void) {
    while (FCGI_Accept() >= 0) {
        printf("Content-type: text/html\r\n"
               "\r\n"
               "<html>\n"
               "<head><title>Hello, world!</title></head>\n"
               "<body><h1>Hello, world!</h1></body>\n"
               "</html>\n");
    }
    return 0;
}