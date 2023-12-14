FROM alpine:3.17

RUN apt-get update && \
    apt-get install -y mariadb-server && \
    rm -rf /var/lib/apt/lists/*

EXPOSE 3306

CMD ["mysqld", "--user=mysql", "--console"]

