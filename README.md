# ECE 251 - Computer Architecture
Prof. Rob Marano <rob@cooper.edu>
Spring 2022

## Getting Started with your Virtual Machine (VM)

We will be using Ubuntu Server 20.04.3 for our class this semester in order to emulate ARMv8 (LEGv8) assembly instructions. The following instructions are for those whose computers are running an operating system (OS) specifically Windows or Mac.

### Creating your environment to code on your computer (Windows, Mac, Linux)

Note: Since Apple introduced their M1 ARM-based CPU, the usual use of VirtualBox (virtual machine emulator) will no longer work. We will use Docker containers instead.

#### Installing Microsoft Visual Studio Code (VS Code): your editor and workspace using Docker

Go to the main page for [Microsoft Visual Studio Code](https://code.visualstudio.com/) and download the application for your type of OS: Windows or Mac.

Also, since we will be using Docker to create the Linux container within which use various software for this course, it will be very helpful for you to add the Docker extension to VS Code.

**AFTER** you install the Docker Desktop on your computer (see below), follow the instructions on this page [Working with Container](https://code.visualstudio.com/docs/containers/overview). You can install the Docker extension directly within the VS Code application once you start it up by opening it.

Once installed, move on to next section.

#### Download Docker Desktop

Go to [Getting Started with Docker](https://www.docker.com/get-started) and choose your computer type under Docker Desktop. See here for [Docker Desktop for Mac](https://hub.docker.com/editions/community/docker-ce-desktop-mac) and here for [Docker Desktop for Windows](https://hub.docker.com/editions/community/docker-ce-desktop-windows) Once downloaded, install the software. You may have to update your computer BIOS on non-Apple computers to enable CPU virtualization. This may help for [BIOS setting of virtualization](https://docs.fedoraproject.org/en-US/Fedora/13/html/Virtualization_Guide/sect-Virtualization-Troubleshooting-Enabling_Intel_VT_and_AMD_V_virtualization_hardware_extensions_in_BIOS.html) for non-Apple computers.

Once installed, move on to next section.

#### Download QEMU
Go to [Download QEMU](https://www.qemu.org/download/#windows) and select your computer type.

Once installed, move on to next section.

#### Download Git

Follow [these instructions](https://www.atlassian.com/git/tutorials/install-git) on installing Git on your computer -- Windows or Mac.

#### Learning How to Use Git (with GitHub as its server)

Follow [these instructions on GitHub](https://docs.github.com/en/get-started/getting-started-with-git) to learn the basics of Git with GitHub.

#### Configure and Build Your Docker Container 

After installing Docker Hub and Git on your computers, follow the instructions:
1. Open a terminal on your computer, ```cmd.exe``` on Windows or ```Terminal.app``` or ```iTerm2.app``` on Mac
2. Change directory to either ```My Documents``` on Windows or your ```${HOME}``` directory on Mac OS. Then create a directory called ```dev``` where we will create sub-directories for projects and code respositories.
    1. If you are on Mac or Linux host OS, run command:
    ```bash
    cd ${HOME}
    mkdir dev
    cd dev
    ```
    2. If you are on Windows host OS:
    ```bash
    cd %HOMEPATH%
    mkdir dev
    cd dev
    ```
3. Then clone the repo to your computer using the command
    ```bash
    git clone https://github.com/robmarano/ece251_at_cooper
    cd ece251_at_cooper
    ```
4. Change directory into ```./ece251_at_cooper``` and change to "environment" branch with ```git checkout environment```
5. Update your full name and email address in the file ```etc/.gitconfig```
6. Build the Docker image with the command. See Docker [build manual](https://docs.docker.com/engine/reference/commandline/build/) to decode what the command above does.

    ```bash
    docker buildx create --name mybuilder
    docker buildx use mybuilder
    docker buildx inspect --bootstrap
    docker buildx build --rm -f Dockerfile --platform linux/arm64 -t ubuntu:ece251 --load .
    ```

7. Run your new Docker image in a container and place in background
    Choose from either option below based upon your OS. See Docker [run manual](https://docs.docker.com/engine/reference/run/) to decode what the command above does.
    1. If you are on Mac or Linux, run command:
    ```bash
    docker run --rm -dit -e "TERM=xterm-256color" -P --name ece251 -v ~/:/home/devuser/myHome --platform linux/arm64 -t ubuntu:ece251
    ```
    2. If you are on Windows, run command:
    ```bash
    docker run --rm -dit -e "TERM=xterm-256color" -P --name ece251 --security-opt seccomp=unconfined --mount type=bind,source="%HOMEDRIVE%%HOMEPATH%\Documents",destination=/home/devuser/myHome ubuntu:ece251
    ```
8. Confirm the Docker container is running using the command ```docker ps```, looking for the line that has ```ubuntu:ece251``` as the image.
9. Login to your new Docker container to being coding ```docker exec -it ece251 /bin/bash```
10. You're inside the virtual ARMv8 computer running Ubuntu Linux and ready to program assembly!

#### Some good links
* [Learn Vim For the Last Time: A Tutorial and Primer](https://danielmiessler.com/study/vim/)
* [Docker Basics](https://docker-curriculum.com/)
* [6 Docker Basics You Should Completely Grasp When Getting Started](https://vsupalov.com/6-docker-basics/)

## To remove the Docker container and image
### Stop the container
```bash
docker ps
```
Copy the ```CONTAINER_ID```
```bash
docker container kill CONTAINER_ID
```
### Delete the container
```bash
docker container rm CONTAINER_ID
```
### Delete the image
```bash
docker image ls
```
Take the ```IMAGE_ID``` of the image for cs102-student
```bash
docker image rm IMAGE_ID
```

To recreate and run a new container, start from the top of this page.
