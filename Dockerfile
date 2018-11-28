FROM php:apache
MAINTAINER Jose Selvi <jselvi@pentester.es>

# Create SSL self-signed certificate
COPY ssl/server.crt /etc/apache2/server.crt
COPY ssl/server.key /etc/apache2/server.key
RUN sync
RUN chmod 600 /etc/apache2/server.crt
RUN chmod 644 /etc/apache2/server.key

# Upload Apache configuration
COPY apache2/httpd.conf /etc/apache2/sites-available/default-ssl.conf
RUN a2enmod ssl deflate ; a2ensite default-ssl
RUN sync

# Upload Demo Website
COPY web/index.php /var/www/html/index.php
RUN sync
RUN chmod 644 /var/www/html/index.php

