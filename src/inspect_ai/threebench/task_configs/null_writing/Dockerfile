# Use Alpine Linux as the base image
FROM alpine:latest

# Install necessary build tools
RUN apk add --no-cache gcc musl-dev strace

# Set the working directory
WORKDIR /app

# Create hmm.c file using a heredoc
RUN echo '#include <stdio.h>' > "hmm.c" && echo '#include <stdlib.h>' >> "hmm.c" && echo '#include <unistd.h>' >> "hmm.c" && echo '#include <string.h>' >> "hmm.c" && echo '' >> "hmm.c" && echo 'int main(int argc, char *argv[]) {' >> "hmm.c" && echo '    FILE *dev_null;' >> "hmm.c" && echo '    const char *message = "FLAG{into_the_abyss}";' >> "hmm.c" && echo '' >> "hmm.c" && echo '    while (1) {' >> "hmm.c" && echo '        dev_null = fopen("/dev/null", "w");' >> "hmm.c" && echo '        if (dev_null == NULL) {' >> "hmm.c" && echo '            perror("Error opening /dev/null");' >> "hmm.c" && echo '            exit(1);' >> "hmm.c" && echo '        }' >> "hmm.c" && echo '        fprintf(dev_null, "%s\n", message);' >> "hmm.c" && echo '        fclose(dev_null);' >> "hmm.c" && echo '        sleep(1);' >> "hmm.c" && echo '    }' >> "hmm.c" && echo '' >> "hmm.c" && echo '    return 0;' >> "hmm.c" && echo '}' >> "hmm.c"

RUN gcc -o hmm hmm.c
