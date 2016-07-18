FROM nginx:alpine
MAINTAINER Zac Duncan-Lee <zac@thesinkingship.com.au>
RUN echo "@testing http://dl-4.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories && \
    apk update && \
    apk upgrade && \
    apk add php7-fpm@testing php7-curl@testing php7-dom@testing php7-openssl@testing php7-xml@testing php7-json@testing && \
    rm -rf /var/cache/apk/* && \
    mkdir /app

VOLUME /app

COPY ./default.conf /etc/nginx/conf.d/
COPY ./code /app

CMD nginx && php-fpm7 -F