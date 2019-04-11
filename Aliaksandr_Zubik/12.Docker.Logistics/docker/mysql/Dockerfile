FROM percona:5.7

RUN echo '[mysqld]' >>  /etc/mysql/my.cnf
RUN echo 'bind-address=0.0.0.0' >>  /etc/mysql/my.cnf
RUN echo 'max_allowed_packet=1024M' >>  /etc/mysql/my.cnf
RUN echo 'sql-mode=''' >>  /etc/mysql/my.cnf
RUN echo 'character-set-server = utf8' >>  /etc/mysql/my.cnf
RUN echo 'collation-server = utf8_unicode_ci ' >>  /etc/mysql/my.cnf
RUN echo 'skip-character-set-client-handshake' >>  /etc/mysql/my.cnf


CMD ["mysqld"]

EXPOSE 3306
