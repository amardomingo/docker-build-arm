FROM ubuntu:12.04.5
MAINTAINER Alberto Mardomingo <alberto.mardomingo@bq.com>

RUN apt-get -qq update

RUN apt-get install -y distcc libepub-dev libudev-dev qemu-user-static multistrap g++-arm-linux-gnueabi qemu-kvm-extras-static
RUN apt-get install -y qt4-dev-tools qt4-qmake
RUN apt-get install -y mercurial
RUN ln -s /usr/bin/moc-qt4 /usr/bin/moc-48

RUN mkdir -p /opt/code

WORKDIR /opt/code

ADD build.sh /build.sh
ADD qmake.conf /opt/qmake.conf

CMD /build.sh