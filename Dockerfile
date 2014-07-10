FROM ubuntu:trusty
MAINTAINER Tully Foote tfoote@osrfoundation.org

VOLUME ["/var/cache/apt/archives"]
ENV DEBIAN_FRONTEND noninteractive
RUN echo deb http://archive.ubuntu.com/ubuntu trusty multiverse | tee -a /etc/apt/sources.list
RUN apt-get update
RUN apt-get install -q -y curl net-tools python python-yaml
RUN curl -s --retry 5 http://packages.ros.org/ros.key | apt-key add -
RUN echo deb http://packages.ros.org/ros-shadow-fixed/ubuntu trusty main | tee /etc/apt/sources.list.d/ros-latest.list
RUN apt-get update
RUN apt-get install -q -y python-rosdep python-rosinstall-generator python-wstool python-rosinstall build-essential
CMD ['bash']