FROM ubuntu:14.04

MAINTAINER Tomohisa Kusano <siomiz@gmail.com>

WORKDIR /usr/local/src

COPY 045395.patch /tmp/

RUN apt-get update \
	&& apt-get install -y dpkg-dev xserver-xorg-video-fbdev \
	&& apt-get source -y xserver-xorg-video-dummy \
	&& apt-get build-dep -y xserver-xorg-video-dummy \
	&& cd xserver-xorg-video-dummy-* \
	&& patch -p1 < /tmp/045395.patch \
	&& bash ./autogen.sh \
	&& make \
	&& make install
	
