FROM php:7.2-apache

COPY src/php.ini /usr/local/etc/php/
COPY src/index.php /var/www/html/

LABEL maintainer="MarioDevment"
LABEL application="Practice Docker"

ENV DISPLAY_ERRORS="On"

RUN pecl install xdebug-2.6.0 \
    && docker-php-ext-enable xdebug \
    && docker-php-ext-install pdo pdo_mysql