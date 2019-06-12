# Pull base image.
FROM ubuntu:18.04

MAINTAINER chandrakant

RUN apt-get update
RUN apt-get install -y software-properties-common

RUN mkdir /usr/lib/jvm
ADD jdk-8u211-linux-x64.tar.gz /usr/lib/jvm
RUN echo J2SDKDIR="/usr/lib/jvm/jdk1.8.0_211" >> /etc/environment
RUN echo J2REDIR="/usr/lib/jvm/jdk1.8.0_211/jre" >> /etc/environment
RUN echo JAVA_HOME="/usr/lib/jvm/jdk1.8.0_211" >> /etc/environment

RUN update-alternatives --install "/usr/bin/java" "java" "/usr/lib/jvm/jdk1.8.0_211/bin/java" 0
RUN update-alternatives --install "/usr/bin/javac" "javac" "/usr/lib/jvm/jdk1.8.0_211/bin/javac" 0
RUN update-alternatives --set java /usr/lib/jvm/jdk1.8.0_211/bin/java
RUN update-alternatives --set javac /usr/lib/jvm/jdk1.8.0_211/bin/javac

# Define commonly used JAVA_HOME variable
ENV JAVA_HOME /usr/lib/jvm/jdk1.8.0_211

# Define default command.
CMD ["bash"]
