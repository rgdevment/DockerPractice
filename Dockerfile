FROM php:7.2-apache

# Layer reduction reduces the final image size.
RUN apt-get update && \
    apt-get install -y --no-install-recommends git zip \
    curl --silent --show-error https://getcomposer.org/installer | php \
    && pecl install xdebug-2.6.0 \
    && docker-php-ext-enable xdebug \
    && docker-php-ext-install pdo pdo_mysql

WORKDIR /app

LABEL maintainer="MarioDevment"
LABEL application="Practice Docker"

ENV DISPLAY_ERRORS="On"

COPY src/php.ini /usr/local/etc/php/
COPY src/index.php /app/

RUN composer install \
    --ignore-platform-reqs \
    --no-ansi \
    --no-dev \
    --no-interaction \
    --no-scripts