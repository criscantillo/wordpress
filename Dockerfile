FROM wordpress:php8.1-apache

# Instala Python3 y pip, y luego magic-wormhole vía pip
RUN apt-get update && \
    apt-get install -y python3 python3-pip && \
    pip3 install magic-wormhole && \
    rm -rf /var/lib/apt/lists/*

# Opcional: establece bash como shell por defecto para www-data
RUN usermod -s /bin/bash www-data

# Opcional: cambia permisos del directorio
RUN chown -R www-data:www-data /var/www

# Usa el usuario www-data (esto puede ser omitido si no lo necesitas)
USER www-data
