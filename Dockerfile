# Dockerfile
# for ECE 251 - Computer Architecture
FROM ubuntu:focal
LABEL maintainer="Prof. Rob Marano <rob@cooper.edu>"
ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=America/New_York
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
#RUN yes | unminimize
# add our course's global bashrc file
ADD --chown=root:root ./etc/bash.bashrc /etc/bash.bashrc
ADD --chown=root:root ./etc/motd /etc/motd
ADD --chown=root:root ./etc/issue /etc/issue
# update your instance of Ubuntu server
RUN apt-get update && yes | apt-get upgrade -y
# install some neat Linux tools
RUN apt-get install -y curl git-core vim wget
RUN apt-get install -y manpages-dev man-db
#RUN apt-get install -y fortune cowsay
# install iVerilog; see http://iverilog.icarus.com/
RUN apt-get install -y iverilog
# install essential development tools
RUN apt-get install -y software-properties-common build-essential gdb python3 python3-pip cmake make
# install terminal multiplexer to have multiple terminals in one session
# https://tmuxcheatsheet.com/
RUN apt-get install -y tmux
# allow ece251 to have superuser/root privileges
RUN apt-get install -y sudo
ADD --chown=root:root ./etc/sudoers /etc/sudoers
# create a local user called "ece251" for local development
RUN adduser \
        --quiet \
        --disabled-password \
        --shell /bin/bash \
        --home /home/ece251 \
        --gecos "User" ece251
# configure your local "ece251"
RUN echo "ece251:ece251" | chpasswd
RUN usermod -aG sudo ece251
#  Add new user docker to sudo group
RUN adduser ece251 sudo
# Ensure sudo group users are not 
# asked for a password when using 
# sudo command by ammending sudoers file
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
# create your C development directory called /home/ece251/dev/c
USER ece251
WORKDIR /home/ece251
ADD --chown=ece251:ece251 ./etc/vimrc /home/ece251/.vimrc
ADD --chown=ece251:ece251 ./README.md /home/ece251/ECE-251-README.md
# configure YOUR GitHub credentials
ADD --chown=ece251:ece251 ./etc/.gitconfig /home/ece251/.gitconfig
# add the pre-existing SSH files for your access to your GitHub account
# ensure you have in your host computer under C:\Users\YOURNAME\Documents\ssh in Windows or /Users/YOURNAME/ssh
RUN mkdir -p /home/ece251/.ssh
ADD --chown=ece251:ece251 ./ssh/id_ed25519 /home/ece251/.ssh/id_ed25519
ADD --chown=ece251:ece251 ./ssh/id_ed25519.pub /home/ece251/.ssh/id_ed25519.pub
RUN chmod 400 /home/ece251/.ssh/id_ed25519
RUN chmod 400 /home/ece251/.ssh/id_ed25519.pub
SHELL ["/bin/bash", "-c"]
