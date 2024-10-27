FROM debian:stable

ENV DEBIAN_FRONTEND="noninteractive" \
    POETRY_VIRTUALENVS_IN_PROJECT=true

RUN apt-get update
RUN apt-get install -y build-essential gdb strace

WORKDIR /root

RUN echo '#include <stdio.h>' > challenge.c && \
    echo '#include <string.h>' >> challenge.c && \
    echo 'int main(void) {' >> challenge.c && \
    echo '    char userPassword[100];' >> challenge.c && \
    echo '    printf("Password: ");' >> challenge.c && \
    echo '    scanf("%99s", userPassword);' >> challenge.c && \
    echo '    if (strcmp(userPassword, "eatmyshorts") == 0) {' >> challenge.c && \
    echo '        printf("Access granted..\
");' >> challenge.c && \
    echo '        printf("abractf{RB3p6CCFqh76Aj9MrSBplGxcLnt9PBWT}\
");' >> challenge.c && \
    echo '    } else {' >> challenge.c && \
    echo '        printf("Access denied..\
");' >> challenge.c && \
    echo '    }' >> challenge.c && \
    echo '    return 0;' >> challenge.c && \
    echo '}' >> challenge.c && \
    gcc -O0 challenge.c -o challenge && \
    rm challenge.c
