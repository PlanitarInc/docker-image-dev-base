FROM planitar/base

RUN apt-get install -y build-essential gnupg && apt-get clean
RUN apt-get install -y git bzr && apt-get clean
# Avoid installing X
RUN apt-get install -y mercurial --no-install-recommends && apt-get clean
RUN apt-get install -y net-tools dnsutils tcpdump apache2-utils socat telnet && apt-get clean
RUN apt-get install -y realpath && apt-get clean

RUN useradd -d /home/planitar -s /bin/bash -m planitar && \
    usermod -aG sudo planitar && \
    echo 'planitar ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers

USER planitar
ENV HOME /home/planitar
WORKDIR /home/planitar
