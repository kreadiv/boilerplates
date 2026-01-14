FROM php:8.5-apache

# Umgebungseinstellungen
ENV DEBIAN_FRONTEND noninteractive

WORKDIR /var/www/html

# System-Abhängigkeiten installieren
RUN apt-get update && apt-get install -y \
    git \
    unzip \
    imagemagick \
    libmagickwand-dev \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    libpng-dev \
    libicu-dev \
    libxml2-dev \
    libzip-dev \
    libldap2-dev \
    libpq-dev \
    libgmp-dev \
    libtidy-dev \
    libxslt1-dev \
    && rm -rf /var/lib/apt/lists/*

# PHP-Erweiterungen installieren und konfigurieren
# Hinweis: opcache ist in PHP 8.5 bereits eingebaut
RUN docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j$(nproc) \
    gd \
    intl \
    pdo_mysql \
    pdo_pgsql \
    mysqli \
    zip \
    soap \
    bcmath \
    exif \
    tidy \
    xsl \
    gmp \
    ldap

# Imagick über PECL installieren
RUN pecl install imagick redis \
    && docker-php-ext-enable imagick redis

# Composer installieren
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# PHP Konfigurationen anpassen (memory_limit, upload_max_filesize, etc.)
RUN { \
    echo 'memory_limit=512M'; \
    echo 'upload_max_filesize=80M'; \
    echo 'post_max_size=80M'; \
    echo 'max_execution_time=120'; \
    echo 'date.timezone=Europe/Berlin'; \
    } > /usr/local/etc/php/conf.d/99-custom.ini

# Apache Module aktivieren
RUN a2enmod rewrite

# Apache Konfiguration kopieren
COPY ./apache-config.conf /etc/apache2/sites-available/000-default.conf

# Webinhalte kopieren
COPY . /var/www/html

# Berechtigungen setzen
RUN chown -R www-data:www-data /var/www/html

# Ports freigeben
EXPOSE 80

# Startbefehle für Apache
CMD ["apache2-foreground"]
