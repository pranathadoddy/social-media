FROM php:7.1.8-apache

COPY src/ /srv/app

COPY config/vhost.conf /etc/apache2/sites-available/000-default.conf

COPY config/apache2.conf /etc/apache2/apache2.conf

RUN docker-php-ext-install pdo_mysql mbstring

RUN chown -R www-data:www-data /srv/app \
    && a2enmod rewrite