FROM composer:latest

RUN addgroup -g 1000 octobercms && adduser -G octobercms -g octobercms -s /bin/sh -D octobercms

WORKDIR /var/www/html