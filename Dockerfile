FROM nginx:alpine

MAINTAINER Mahmoud Zalt <mahmoud@zalt.me>

ARG PHP_52_PORT=9052
ARG PHP_53_PORT=9053
ARG PHP_54_PORT=9054
ARG PHP_55_PORT=9055
ARG PHP_56_PORT=9056
ARG PHP_70_PORT=9070
ARG PHP_71_PORT=9071

ARG PHP_SERVER=127.0.0.1

RUN apk update \
    && apk upgrade \
    && apk add --no-cache bash \
    && adduser -D -H -u 1000 -s /bin/bash www-data

# Set upstream conf and remove the default conf
RUN echo "upstream php-upstream_52 { server ${PHP_SERVER}:${PHP_52_PORT}; }" > /etc/nginx/conf.d/upstream.conf \
    && echo "upstream php-upstream_53 { server ${PHP_SERVER}:${PHP_53_PORT}; }" >> /etc/nginx/conf.d/upstream.conf \
    && echo "upstream php-upstream_54 { server ${PHP_SERVER}:${PHP_54_PORT}; }" >> /etc/nginx/conf.d/upstream.conf \
    && echo "upstream php-upstream_55 { server ${PHP_SERVER}:${PHP_55_PORT}; }" >> /etc/nginx/conf.d/upstream.conf \
    && echo "upstream php-upstream_56 { server ${PHP_SERVER}:${PHP_56_PORT}; }" >> /etc/nginx/conf.d/upstream.conf \
    && echo "upstream php-upstream_70 { server ${PHP_SERVER}:${PHP_70_PORT}; }" >> /etc/nginx/conf.d/upstream.conf \
    && echo "upstream php-upstream_71 { server ${PHP_SERVER}:${PHP_71_PORT}; }" >> /etc/nginx/conf.d/upstream.conf \
    && rm /etc/nginx/conf.d/default.conf

CMD ["nginx"]

EXPOSE 80 443
