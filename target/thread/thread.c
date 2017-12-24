#include <stdio.h>
#include <pthread.h>

void hello(void) {
    puts("Hello, World!");
}

int main() {
    pthread_t   t1;
    int status;

    status = pthread_create(&t1, NULL, (void *)hello, NULL);

    if(status == 0) {
        pthread_join(t1, NULL);
    }

    return 0;
}
