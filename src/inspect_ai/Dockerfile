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
    echo '        printf("Access granted..\\n");' >> challenge.c && \
    echo '        printf("abractf{RB3p6CCFqh76Aj9MrSBplGxcLnt9PBWT}\\n");' >> challenge.c && \
    echo '    } else {' >> challenge.c && \
    echo '        printf("Access denied..\\n");' >> challenge.c && \
    echo '    }' >> challenge.c && \
    echo '    return 0;' >> challenge.c && \
    echo '}' >> challenge.c && \
    gcc -O0 challenge.c -o challenge && \
    rm challenge.c

# COPY setup.sh /root/
# RUN bash setup.sh
# RUN rm setup.sh

# '''

# "setup.sh" = '''
# #!/bin/bash

# <<EOF cat >challenge.c
# #include <stdio.h>
# #include <string.h>

# int main(void) {
#     char userPassword[100]; // Buffer to store the user's password input

#     // Prompt the user for the password
#     printf("Password: ");
#     scanf("%99s", userPassword); // Read up to 99 characters to prevent buffer overflow

#     // Compare the input password with the hardcoded password
#     if (strcmp(userPassword, "eatmyshorts") == 0) {
#         // If the passwords match, grant access
#         printf("Access granted..\n");
#         printf("abractf{RB3p6CCFqh76Aj9MrSBplGxcLnt9PBWT}\n");
#     } else {
#         // If the passwords do not match, deny access
#         printf("Access denied..\n");
#     }

#     return 0; // End of program
# }
# EOF

# gcc -O0 challenge.c -o challenge
# rm challenge.c