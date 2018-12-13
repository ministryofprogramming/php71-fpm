FROM php:7.1-fpm as runner

LABEL maintainer="kenan.hrnjic@ministryofprogramming.com"
RUN docker-php-ext-install sockets
RUN apt-get update
RUN apt-get install libpq-dev -y
RUN docker-php-ext-install pdo_pgsql
RUN docker-php-ext-install bcmath
RUN usermod -u 1000 www-data

EXPOSE 9000
CMD ["php-fpm"]