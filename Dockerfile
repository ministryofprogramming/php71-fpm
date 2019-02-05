FROM php:7.1-fpm

LABEL maintainer="kenan.hrnjic@ministryofprogramming.com"
RUN docker-php-ext-install sockets
RUN apt-get update
RUN apt-get install libpq-dev -y
RUN docker-php-ext-install pdo_pgsql
RUN docker-php-ext-install bcmath
RUN usermod -u 1000 www-data
RUN apt-get install -y supervisor
RUN apt-get install -y gnupg
RUN curl -sL https://deb.nodesource.com/setup_9.x | bash -
RUN apt-get install -y nodejs
RUN apt-get install psmisc
RUN apt-get install -y procps

EXPOSE 9000
CMD ["php-fpm"]