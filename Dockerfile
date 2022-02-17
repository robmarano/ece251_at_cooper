# Dockerfile
# for ECE 251 - Computer Architecture
FROM ubuntu:focal
LABEL maintainer="Prof. Rob Marano <rob@cooper.edu>"
ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=America/New_York
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
#RUN yes | unminimize
# add our course's global bashrc file
ADD --chown=root:root ./etc/bash.bashrc /etc/bash.bashrc
ADD --chown=root:root ./etc/motd /etc/motd
ADD --chown=root:root ./etc/issue /etc/issue
# update your instance of Ubuntu server
RUN apt-get update && apt-get upgrade -y
# install essential C development tools
RUN apt-get install -y software-properties-common build-essential gdb python3 python3-pip cmake
RUN pip3 install unicorn 
RUN pip3 install capstone 
RUN pip3 install ropper 
#RUN pip3 install keystone-engine
RUN apt-get install -y manpages-dev man-db sudo curl git-core vim wget
# install terminal multiplexer to have multiple terminals in one session
# https://tmuxcheatsheet.com/
RUN apt-get install -y tmux
# allow devuser to have superuser/root privileges
RUN apt-get install -y sudo
ADD --chown=root:root ./etc/sudoers /etc/sudoers
# install some neat Linux tools
RUN apt-get install -y fortune cowsay
# create a local user called "devuser" for local development
RUN adduser \
        --quiet \
        --disabled-password \
        --shell /bin/bash \
        --home /home/devuser \
        --gecos "User" devuser
# configure your local "devuser"
RUN echo "devuser:Cooper1859!" | chpasswd
RUN usermod -aG sudo devuser
#  Add new user docker to sudo group
RUN adduser devuser sudo
# Ensure sudo group users are not 
# asked for a password when using 
# sudo command by ammending sudoers file
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
# create your C development directory called /home/devuser/dev/c
USER devuser
WORKDIR /home/devuser
ADD --chown=devuser:devuser ./etc/vimrc /home/devuser/.vimrc
ADD --chown=devuser:devuser ./README.md /home/devuser/ECE-366-README.md
# configure YOUR GitHub credentials
ADD --chown=devuser:devuser ./etc/.gitconfig /home/devuser/.gitconfig
# add the pre-existing SSH files for your access to your GitHub account
# ensure you have in your host computer under C:\Users\YOURNAME\Documents\ssh in Windows or /Users/YOURNAME/ssh
# RUN mkdir -p /home/devuser/.ssh
# ADD --chown=devuser:devuser ./ssh/id_ed25519 /home/devuser/.ssh/id_ed25519
# ADD --chown=devuser:devuser ./ssh/id_ed25519.pub /home/devuser/.ssh/id_ed25519.pub
# RUN chmod 400 /home/devuser/.ssh/id_ed25519
# RUN chmod 400 /home/devuser/.ssh/id_ed25519.pub
SHELL ["/bin/bash", "-c"]
