FROM php:8-apache

# Basic PHP setup
RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install -y \
    mariadb-client \
    zip
RUN docker-php-ext-install \
    mysqli \
    pdo \
    pdo_mysql

# Install Matomo
RUN curl -OL https://builds.matomo.org/matomo-latest.zip && unzip ./matomo-latest.zip && rm ./matomo-latest.zip

# Set up apache configuration
RUN a2enmod rewrite
RUN a2dissite 000-default.conf
COPY ./docker/matomo.conf /etc/apache2/sites-available/matomo.conf
RUN a2ensite matomo.conf

# Give PHP a useful amount of RAM
RUN mv "$PHP_INI_DIR/php.ini-production" "$PHP_INI_DIR/php.ini"
RUN sed -i "s/memory_limit\s*=.*/memory_limit = 1024M/g"  "$PHP_INI_DIR/php.ini"

# Set up the custom entrypoint and init scripts
COPY ./docker/bin/docker-entrypoint.sh /
COPY ./docker/httpd-init /docker-entrypoint
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["apache2-foreground"]
