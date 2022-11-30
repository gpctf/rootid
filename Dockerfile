#use ubuntu 18.04 image
FROM ubuntu:18.04
#create user ctf and set it password to envirement variable password
RUN useradd -m ctf
#set working directory to /usr/local/bin
WORKDIR /home/ctf
#copy binary to /usr/local/bin

RUN apt-get update && apt-get install -y g++
RUN apt-get install openssh-server sudo -y 
RUN apt-get install nano -y 
COPY --chown=ctf:ctf ./binary/getrootid.cpp ./getrootid.cpp
RUN g++ getrootid.cpp -o /usr/local/bin/getrootid
WORKDIR /usr/local/bin
RUN chown root:root getrootid
RUN chmod u-w getrootid
RUN chmod u+s getrootid
#allow password authentication
RUN sed -i '/#PasswordAuthentication yes/c\PasswordAuthentication yes' /etc/ssh/sshd_config
#copy flag to root home as set permission so that only root can read it
COPY ./flag/flag.txt /root/flag.txt
RUN chmod 400 /root/flag.txt
#copy run.sh to root folder
COPY ./run.sh /root/run.sh
#set user to root
USER root
#run run.sh
CMD ["/bin/bash", "/root/run.sh"]
