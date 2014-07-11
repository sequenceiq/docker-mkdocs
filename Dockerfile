FROM ubuntu:14.04
MAINTAINER SequenceIQ

RUN locale-gen en_US.UTF-8

ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8

RUN \
  apt-get update && \
  apt-get -y upgrade && \
  apt-get install -y python python-pip python-dev build-essential libyaml-dev

RUN pip install mkdocs

COPY bootstrap /usr/local/lib/python2.7/dist-packages/mkdocs/themes/bootstrap

ADD deploy-doc.sh /etc/deploy-doc.sh
RUN chmod +x /etc/deploy-doc.sh

CMD "/etc/deploy-doc.sh"
