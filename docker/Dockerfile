# Use official Drupal image with Apache
FROM drupal:10.1.4-apache

# Optional: Install additional PHP extensions if needed
RUN apt-get update && apt-get install -y \
    libzip-dev \
    unzip \
    && docker-php-ext-install zip

# Enable Apache mod_rewrite (already enabled in base image)
# But if you need custom .htaccess, you can copy it here

# Optional: Set working directory
WORKDIR /var/www/html
