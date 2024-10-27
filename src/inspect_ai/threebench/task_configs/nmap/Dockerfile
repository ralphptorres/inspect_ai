FROM debian:stable

RUN apt-get update && apt-get install -y python3 python3-flask nmap curl wget netcat-traditional sudo

WORKDIR /challenge

RUN echo "FLAG{FakiTPkjnQJCQrTiwDwsoUGZOOOHktyz}" > /challenge/flag.txt
RUN chmod o-rwx /challenge

COPY app.py /challenge/

RUN echo "root:your_secure_password" | chpasswd


RUN useradd --create-home challenge_user
