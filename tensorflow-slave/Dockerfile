FROM gongkunjxl/serf-dnsmasq:0.1.0

MAINTAINER gongkun <gongkunjxl@163.com>

WORKDIR /root

# install openssh-server, openjdk and wget
RUN apt-get update && apt-get install -y python-pip python-dev
RUN pip install --upgrade pip
RUN pip install tensorflow

#files
COPY files/* /tmp/

#RUN mv /tmp/bashrc ~/.bashrc && \
RUN mv /tmp/start-ssh-serf.sh ~/start-ssh-serf.sh && \
    mv /tmp/example.sh ~/example.sh && \
    mv /tmp/dist.log ~/dist.log && \
    mv /tmp/distributed.py ~/distributed.py

RUN chmod -R 777 ~/example.sh && \
    chmod -R 777 ~/dist.log && \
    chmod -R 777 ~/distributed.py && \
    chmod -R 777 ~/start-ssh-serf.sh 

RUN mkdir -p /tmp/mnist-data
RUN chmod -R 777 /tmp/mnist-data
ADD mnist-data /tmp/mnist-data/

#the privileged
RUN chmod 644 ~/.ssh/config

EXPOSE 22 2222 2223 7373 7946 9000 8088

CMD '/root/start-ssh-serf.sh'; 'bash'

