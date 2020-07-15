# Dockerfile for the Drupal container.
FROM wunderio/drupal-shell:latest

RUN sed -i 's/^#PermitTunnel .*/PermitTunnel yes/' /etc/ssh/sshd_config
RUN sed -i 's/^AllowTcpForwarding .*/AllowTcpForwarding yes/' /etc/ssh/sshd_config

COPY --chown=www-data:www-data . /app
