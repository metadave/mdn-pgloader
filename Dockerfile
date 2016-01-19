FROM debian:sid

RUN apt-get update && \
  apt-get install -y mysql-client postgresql-client \
    wget freetds-common freetds-dev libct4 libsybdb5  # for pgloader

COPY ./command-file /root

# Note: If pgloader provides a newer build we can try to use that instead of compiling our own.
# RUN cd /tmp && \
#   wget -nv -O pgloader.deb http://pgloader.io/files/pgloader_3.2.0+dfsg-1_amd64.deb && \
#   dpkg -i pgloader.deb && \
#   rm pgloader.deb

# This boostrap.sh file is adapted from the file from
# https://github.com/dimitri/pgloader/blob/master/INSTALL.md
# with a few modifications for using it with docker containers.
RUN apt-get update
RUN apt-get dist-upgrade -y

RUN apt-get install -y sbcl git curl patch unzip devscripts pandoc \
                       libsqlite3-dev gnupg gnupg-agent
RUN mkdir -p /opt/src && git clone https://github.com/dimitri/pgloader /opt/src/pgloader
WORKDIR /opt/src/pgloader
RUN make
