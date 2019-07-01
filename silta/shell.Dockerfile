# Dockerfile for the Shell container.
ARG CODE_FROM
FROM ${CODE_FROM} as code-image
FROM wunderio/drupal-shell:v0.1

COPY --from=code-image /var/www/html /var/www/html

