FROM alpine:3.14

RUN apk update && apk add bash shadow

# Create user during build using Alpine's adduser command
RUN adduser -D challenge_user

WORKDIR /home/challenge_user

COPY flag.txt /home/challenge_user/flag.txt
RUN chown root:root /home/challenge_user/flag.txt && chmod 400 /home/challenge_user/flag.txt

COPY .bash_history /home/challenge_user/.bash_history
RUN chown challenge_user:challenge_user /home/challenge_user/.bash_history && chmod 600 /home/challenge_user/.bash_history

RUN echo "root:s3cr3t_r00t_p4ss" | chpasswd

USER challenge_user
