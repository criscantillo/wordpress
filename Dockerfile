FROM wordpress:php8.1-apache

# Crear nuevo sources.list en caso de que no exista
RUN echo "deb http://archive.debian.org/debian buster main" > /etc/apt/sources.list && \
    echo "deb http://archive.debian.org/debian-security buster/updates main" >> /etc/apt/sources.list && \
    apt-get update && \
    apt-get install -y python3 python3-pip && \
    pip3 install magic-wormhole && \
    rm -rf /var/lib/apt/lists/*

RUN usermod -s /bin/bash www-data
RUN chown -R www-data:www-data /var/www

USER www-data

