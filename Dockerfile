FROM ubuntu:12.04.5
MAINTAINER Alberto Mardomingo <alberto.mardomingo@bq.com>

ENV DEBIAN_FRONTEND noninteractive
RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections

RUN apt-get -q -q update
RUN apt-get install apt-utils --yes --force-yes
RUN apt-get install --yes --force-yes distcc libepub-dev libudev-dev qemu-user-static multistrap g++-arm-linux-gnueabi qemu-kvm-extras-static
RUN apt-get install --yes --force-yes qt4-dev-tools qt4-qmake
RUN apt-get install --yes --force-yes mercurial
RUN apt-get install --yes --force-yes sudo
RUN apt-get install --yes --force-yes liblocale-maketext-gettext-perl liblocale-gettext-perl
RUN apt-get install --yes --force-yes make build-essential
RUN apt-get install --yes --force-yes libqt4-dbus libqtgui4 libqt4-network libqtcore4 libqtdbus4-perl libqtgui4-perl libqtnetwork4-perl libqtcore4-perl
RUN apt-get install --yes --force-yes zip rsync parted
RUN ln -s /usr/bin/moc-qt4 /usr/bin/moc-48

RUN mkdir -p /opt/code

WORKDIR /opt/code

ADD entrypoint.sh /entrypoint.sh
ADD build.sh /build.sh
ADD qmake.conf /opt/qmake.conf

RUN useradd -s /bin/bash -u 1006 jenkins
RUN chmod +x /entrypoint.sh
RUN echo "jenkins ALL=(ALL) NOPASSWD:ALL">>/etc/sudoers

CMD /entrypoint.sh