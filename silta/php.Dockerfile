# Dockerfile for the Drupal container.
FROM wunderio/drupal-php-fpm:latest

COPY --chown=www-data:www-data . /app

RUN curl -LJO https://github.com/Smile-SA/gdpr-dump/releases/download/1.1.1/gdpr-dump.phar