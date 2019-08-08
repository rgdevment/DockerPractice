FROM composer as backend
WORKDIR /app

COPY sites/composer.json sites/composer.lock /app/
RUN composer install \
    --ignore-platform-reqs \
    --no-ansi \
    --no-autoloader \
    --no-dev \
    --no-interaction \
    --no-scripts

COPY sites/. /app/
RUN composer dump-autoload --no-dev --optimize --classmap-authoritative

#Multi-Stage
FROM php:7.2-apache
ENV DISPLAY_ERRORS="On"

# Layer reduction reduces the final image size.
RUN pecl install xdebug-2.6.0 \
    && docker-php-ext-enable xdebug \
    && docker-php-ext-install pdo pdo_mysql

WORKDIR /app
COPY --from=backend /app /var/www/html/
COPY config/php.ini /usr/local/etc/php/