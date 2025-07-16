#!/bin/bash


#DEPRECATED: The legacy builder is deprecated and will be removed in a future release.
#            BuildKit is currently disabled; enable it by removing the DOCKER_BUILDKIT=0
#            environment-variable.
# Construir imagen
DOCKER_BUILDKIT=0 docker build -t mensaje-app .

# Ejecutar contenedor
docker run -d --name mensaje-container mensaje-app

# Esperar para que genere mensajes
sleep 12

# Copiar archivo desde el contenedor
docker cp mensaje-container:/app/mensajes.txt .

# Mostrar contenido
echo "Contenido de mensajes.txt:"
cat mensajes.txt

# Inspección de contenedor
echo "IP e Imagen:"
docker inspect mensaje-container --format 'IP: {{ .NetworkSettings.IPAddress }} | Imagen: {{ .Config.Image }}'

# Ver procesos activos
echo "Procesos activos:"
docker top mensaje-container

# Eliminar contenedor forzadamente
docker rm -f mensaje-container

