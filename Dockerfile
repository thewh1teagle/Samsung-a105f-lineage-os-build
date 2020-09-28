# https://en.wikibooks.org/wiki/Advanced_phone_customization/Building_your_own_ROM#What_you'll_need
from ubuntu:18.04


RUN apt-get update
RUN apt-get install -y \
    bc bison build-essential \
    ccache curl flex g++-multilib \
    gcc-multilib git gnupg gperf \
    imagemagick lib32ncurses5-dev  \
    lib32readline-dev lib32z1-dev \
    liblz4-tool libncurses5-dev  \
    libsdl1.2-dev libssl-dev  \
    libwxgtk3.0-dev libxml2 \
    libxml2-utils lzop pngcrush \
    rsync schedtool squashfs-tools \
    xsltproc zip zlib1g-dev \
    # choose 7 for older lineage os \
    python

RUN apt-get install -y \
    openjdk-8-jdk 

RUN mkdir /workspace
WORKDIR /workspace
RUN mkdir -p android/lineage 
RUN mkdir bin
RUN curl https://storage.googleapis.com/git-repo-downloads/repo > bin/repo
RUN chmod a+x bin/repo
RUN echo 'export PATH=$PATH:/workspace/bin' >> ~/.bashrc

RUN git config --global user.email "you@example.com"
RUN git config --global user.name "Your Name"

RUN cd android/lineage
WORKDIR /workspace/android/lineage
