FROM php:8.1-apache

RUN apt update \
        && apt install -y \
            g++ \
            libicu-dev \
            libpq-dev \
            libzip-dev \
            zip \
            zlib1g-dev \
            cron \
        && docker-php-ext-install \
            pdo \
            pdo_mysql \
            sockets \
        && docker-php-ext-enable pdo_mysql

RUN pecl install grpc

RUN docker-php-ext-enable grpc.so

WORKDIR /var/www/devops-project

RUN a2enmod rewrite headers
RUN a2enmod ssl

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer


