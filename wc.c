#include <stddef.h>
#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <unistd.h>
// Just write full path of files
int main(int argc, char* argv[]) {
    int i;
    for(i = 1; i < argc; i++){
        FILE *file = NULL;
        file = fopen(argv[i], "r");
        struct stat statistics;
        if(file == NULL){
            printf("File isn't opened\n");
            continue;
        }
        fstat(fileno(file), &statistics);
        printf("File '%s' weighs %d byte\n", argv[i], statistics.st_size);
        fclose(file);
    }
    return 0;
}
