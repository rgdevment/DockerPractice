FROM php:7.2-apache

LABEL maintainer="MarioDevment"
LABEL application="Practice Docker"

RUN pecl install xdebug-2.6.0
RUN docker-php-ext-enable xdebug
RUN docker-php-ext-install pdo pdo_mysql

ENV DISPLAY_ERRORS="On"

COPY src/php.ini /usr/local/etc/php/
COPY src/index.php /var/www/html/