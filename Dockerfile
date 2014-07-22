FROM planitar/base

RUN apt-get update -y
RUN apt-get install -y build-essential gnupg && apt-get clean
RUN apt-get install -y pbuilder debhelper cdbs && apt-get clean
RUN apt-get install -y git && apt-get clean

RUN useradd -d /home/planitar -s /bin/bash -m planitar && usermod -aG sudo planitar
