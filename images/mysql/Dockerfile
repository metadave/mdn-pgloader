FROM mysql:5.6

COPY Index.xml /usr/share/mysql/charsets/
RUN sed -Ei 's/\[mysqld\]/[mysqld]\nmax_allowed_packet=100M\ninnodb_log_file_size=1G/' /etc/mysql/my.cnf
EXPOSE 3306:3306
