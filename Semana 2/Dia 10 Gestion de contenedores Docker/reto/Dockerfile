# Dockerfile
FROM alpine

WORKDIR /app

# Script que genera mensajes
COPY script.sh /app/script.sh
RUN chmod +x /app/script.sh

CMD ["/app/script.sh"]

