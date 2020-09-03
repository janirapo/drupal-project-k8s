# Dockerfile for building nginx.
# Rebuild trigger, please delete before merge
FROM wunderio/drupal-nginx:latest

COPY . /app/web

