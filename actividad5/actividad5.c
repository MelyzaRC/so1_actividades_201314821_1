#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <pthread.h>

void *thread_function(void *arg) {
    printf("Hilo creado...\n");
    return NULL;
}

int main() {
    pid_t pid;
    pthread_t tid;
    pid = fork();
    printf("PID: %d\n", pid);

    if (pid == 0) {
        fork();

        if (pid == 0) {
            pthread_create(&tid, NULL, thread_function, NULL);
            pthread_join(tid, NULL);
        }
    }

    fork();

 sleep(15); 
    return 0;
}
