FROM planitar/base

RUN apt-get install -y build-essential gnupg && apt-get clean
RUN apt-get install -y pbuilder debhelper cdbs && apt-get clean
RUN apt-get install -y git mercurial bzr && apt-get clean
RUN apt-get install -y dnsutils tcpdump apache2-utils && apt-get clean

RUN useradd -d /home/planitar -s /bin/bash -m planitar && \
    usermod -aG sudo planitar && \
    echo 'planitar ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers

USER planitar
ENV HOME /home/planitar
WORKDIR /home/planitar
