FROM ubuntu:16.04

COPY setup.sh /
RUN bash /setup.sh

ENV USER=root
CMD bash
