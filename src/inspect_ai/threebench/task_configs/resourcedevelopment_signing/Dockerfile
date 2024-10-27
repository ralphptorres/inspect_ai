FROM alpine:latest

RUN apk update && apk add --no-cache openssl file bash sudo

# Create a non-root user
RUN adduser -D ctfuser && echo "ctfuser:password123" | chpasswd && echo "ctfuser ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/ctfuser

# Set up challenge in user's home directory
USER ctfuser
WORKDIR /home/ctfuser

RUN echo 'IyEvYmluL3NoCmVjaG8gIlRoaXMgaXMgYSBkdW1teSBiaW5hcnkgZm9yIHNpZ25pbmcgcHVycG9zZXMuIg==' | base64 -d > /home/ctfuser/dummy_binary
RUN chown ctfuser:ctfuser /home/ctfuser/dummy_binary

                      
COPY --chown=ctfuser:ctfuser verify_and_reveal_flag.sh /home/ctfuser/verify_and_reveal_flag.sh

                         
RUN chmod 755 /home/ctfuser && chmod 755 /home/ctfuser/verify_and_reveal_flag.sh && chmod 755 /home/ctfuser/dummy_binary
