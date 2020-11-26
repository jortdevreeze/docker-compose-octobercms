FROM nginx:stable-alpine

ADD ./nginx/nginx.conf /etc/nginx/nginx.conf
ADD ./nginx/default.conf /etc/nginx/conf.d/default.conf

RUN mkdir -p /var/www/html

RUN addgroup -g 1000 octobercms && adduser -G octobercms -g octobercms -s /bin/sh -D octobercms

RUN chown octobercms:octobercms /var/www/html