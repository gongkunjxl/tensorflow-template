# Creates a base ubuntu image with serf and dnsmasq
FROM hmonkey/openmpi14.04:v3

MAINTAINER gongkun <gongkunjxl@163.com>

RUN apt-get update && \
apt-get install -y unzip curl dnsmasq openssh-server wget vim

# dnsmasq configuration
ADD dnsmasq/* /etc/

# install serf
#RUN wget serf.zip https://releases.hashicorp.com/serf/0.8.1/serf_0.8.1_linux_amd64.zip -O serf.zip
RUN curl -Lso serf.zip https://releases.hashicorp.com/serf/0.5.0/serf_0.5.0_linux_amd64.zip
RUN unzip serf.zip -d /bin/
RUN rm serf.zip

# configure serf
ENV SERF_CONFIG_DIR /etc/serf
ADD serf/* $SERF_CONFIG_DIR/
ADD handlers $SERF_CONFIG_DIR/handlers
RUN chmod +x  $SERF_CONFIG_DIR/event-router.sh $SERF_CONFIG_DIR/start-serf-agent.sh

#configure ssh free key access
COPY files/* /tmp/

RUN ssh-keygen -t rsa -f ~/.ssh/id_rsa -P '' && \
    cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys && \
    mv /tmp/ssh_config ~/.ssh/config && \
    sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

expose 7373 7946
CMD '/etc/serf/start-serf-agent.sh'
