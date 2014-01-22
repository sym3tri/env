FROM ubuntu:12.10
MAINTAINER Ed Rooth

# Install NodeJS
RUN apt-get -y update
RUN apt-get install -y software-properties-common python-software-properties python g++ make
RUN add-apt-repository -y ppa:chris-lea/node.js
RUN apt-get -y update
RUN apt-get install -y nodejs

