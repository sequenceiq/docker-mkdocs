FROM       ubuntu:14.04
MAINTAINER SequenceIQ

RUN \
  apt-get update && \
  apt-get -y upgrade && \
  apt-get install -y python python-pip python-dev build-essential libyaml-dev

RUN pip install mkdocs

COPY bootstrap /usr/local/lib/python2.7/dist-packages/mkdocs/themes/bootstrap
