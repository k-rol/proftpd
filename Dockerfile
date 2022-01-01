FROM debian:bullseye
MAINTAINER Carol Ouellet <carol.ouellet@gmail.com>

RUN apt-get update && apt-get install -y proftpd-basic

RUN mkdir /users && cd users && cat userlist

ADD proftpd.conf /etc/proftpd/
ADD entrypoint.sh /


EXPOSE 20 21 50000-50050

ENTRYPOINT ["bash","/entrypoint.sh"]
CMD /usr/sbin/proftpd -n -c /etc/proftpd/proftpd.conf
