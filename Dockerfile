FROM wordpress:php8.1-apache

RUN sed -i 's|http://deb.debian.org/debian|http://archive.debian.org/debian|g' /etc/apt/sources.list && \
    sed -i 's|http://security.debian.org/debian-security|http://archive.debian.org/debian-security|g' /etc/apt/sources.list && \
    apt-get update && \
    apt-get install -y python3 python3-pip && \
    pip3 install magic-wormhole && \
    rm -rf /var/lib/apt/lists/*

RUN usermod -s /bin/bash www-data

RUN chown -R www-data:www-data /var/www

USER www-data
