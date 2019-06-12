FROM ca03430/ubuntu18:java

MAINTAINER chandrakant

RUN \
    apt-get update && \
    apt-get install -y vim python supervisor wget curl openssh-server git-core maven && \
    mkdir -p /var/log/supervisor && \
    mkdir -p /var/run/sshd && \
# add pwd to file
  echo 'root:intelli$123' | chpasswd && \
  sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config && \
# SSH login fix. Otherwise user is kicked off after login
  sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

ENV NOTVISIBLE "in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile    
    
EXPOSE 22

CMD ["bash"]
