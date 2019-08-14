FROM ubuntu:18.04
LABEL maintainer="Patrick van der Leer <pat.vdleer+gramps@gmail.com>"

ENV DEBIAN_FRONTEND=noninteractive
ENV LC_ALL=C.UTF-8

ARG GRAMPS_VERSION=5.0.2
ENV GRAMPS_VERSION=$GRAMPS_VERSION
ENV GRAMPSHOME=/usr/src/app

ENV LANG en_US.UTF-8
ENV LANGUAGE en_US

WORKDIR /usr/src/app

RUN apt-get update
RUN apt-get -y install \
    locales \
    graphviz \
    gir1.2-gtk-3.0 \
    gir1.2-gexiv2-0.10 \
    gir1.2-osmgpsmap-1.0 \
    librsvg2-2 \
    python3-bsddb3 \
    python3-pillow \
    python3-gi \
    python3-gi-cairo \
    python3-pip \
    python-pyicu \
    xdg-utils \
    xvfb

RUN locale-gen en

ADD https://github.com/gramps-project/gramps/releases/download/v$GRAMPS_VERSION/gramps_$GRAMPS_VERSION-1_all.deb /tmp/gramps.deb
RUN dpkg -i /tmp/gramps.deb
