FROM alpine:3.10

RUN apk update && apk add --no-cache \
    tzdata \
    apache2 \
    php7 \
    php7-apache2 \
    && cp /usr/share/zoneinfo/Asia/Tokyo /etc/localtime \
    && rm -rf /var/cache/apk/*
COPY ./phpinfo.php /var/www/localhost/htdocs/
COPY ./php.ini /etc/php7/

EXPOSE 80
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
