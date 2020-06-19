# Dockerfile for the Drupal container.
FROM wunderio/drupal-php-fpm:latest

COPY --chown=www-data:www-data . /app

# Install gdpr-dump.
RUN cd /tmp \
  && curl -LJO https://github.com/Smile-SA/gdpr-dump/releases/download/1.1.1/gdpr-dump.phar \
  && chmod u+x gdpr-dump.phar \
  && mv gdpr-dump.phar /usr/bin/gdpr-dump