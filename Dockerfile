FROM php:8.1-apache

# Instalar dependencias necesarias para WordPress y pip
RUN apt-get update && \
    apt-get install -y \
        libpng-dev \
        libjpeg-dev \
        libfreetype6-dev \
        libzip-dev \
        unzip \
        wget \
        gnupg \
        python3 \
        python3-pip && \
    docker-php-ext-configure gd --with-freetype --with-jpeg && \
    docker-php-ext-install gd zip mysqli && \
    pip3 install magic-wormhole && \
    rm -rf /var/lib/apt/lists/*

# Descargar y descomprimir WordPress
RUN wget https://wordpress.org/latest.tar.gz && \
    tar -xzf latest.tar.gz && \
    rm latest.tar.gz && \
    mv wordpress/* /var/www/html/ && \
    rm -rf wordpress && \
    chown -R www-data:www-data /var/www/html

# Opcional: cambiar shell del usuario www-data
RUN usermod -s /bin/bash www-data

# Cambiar permisos
RUN chown -R www-data:www-data /var/www

# Usar usuario www-data
USER www-data


