FROM php:7.2-apache

COPY src/php.ini /usr/local/etc/php/
COPY src/index.php /var/www/html/