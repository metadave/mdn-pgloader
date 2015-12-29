FROM debian:jessie

RUN apt-get update && \
  apt-get install -y mysql-client postgresql-client \
    wget freetds-common freetds-dev libct4 libsybdb5  # for pgloader

# Note: This installs a pgloader that has bugs that cause the conversion to fail.
# See https://github.com/dimitri/pgloader/blob/master/INSTALL.md for installing a recent pgloader.
RUN cd /tmp && \
  wget -nv -O pgloader.deb http://pgloader.io/files/pgloader_3.2.0+dfsg-1_amd64.deb && \
  dpkg -i pgloader.deb && \
  rm pgloader.deb

COPY ./command-file /
