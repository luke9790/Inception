
FROM alpine:3.17

RUN apt-get update && \
    apt-get install -y php-fpm php-mysql && \
    rm -rf /var/lib/apt/lists/*

CMD ["php-fpm", "-F"]
