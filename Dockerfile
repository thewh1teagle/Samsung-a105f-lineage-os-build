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
    python3 

RUN apt-get install -y \
    openjdk-8-jdk 

RUN mkdir -p ~/android/lineage
RUN cd ~/android/lineage 
WORKDIR ~/android/lineage 

RUN mkdir -p ~/bin
RUN curl https://storage.googleapis.com/git-repo-downloads/repo > ~/bin/repo
RUN chmod a+x ~/bin/repo
RUN ln -s /usr/bin/python3 /usr/bin/python
RUN ~/bin/repo init -u git://github.com/LineageOS/android.git -b lineage-17.1
# RUN ~/bin/repo sync
