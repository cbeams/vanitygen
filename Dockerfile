FROM debian:latest
MAINTAINER Chris Beams <chris@beams.io>

RUN apt-get update

# to build vanitygen
RUN apt-get install -y gcc
RUN apt-get install -y make

# to clone the vanitygen repo
RUN apt-get install -y git

# to avoid the following error:
#     vanitygen.c:26:25: fatal error: openssl/sha.h: No such file or directory
RUN apt-get install -y libssl-dev

# to avoid the following error:
#     pattern.c:32:18: fatal error: pcre.h: No such file or directory
RUN apt-get install -y libpcre3-dev

RUN git clone https://github.com/cbeams/vanitygen.git /usr/local/src/vanitygen
RUN make --directory /usr/local/src/vanitygen
RUN ln -s /usr/local/src/vanitygen/vanitygen /usr/local/bin/vanitygen
