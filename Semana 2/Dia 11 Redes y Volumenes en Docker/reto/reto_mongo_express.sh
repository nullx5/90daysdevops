#!/bin/bash

# Reto Adicional: MongoDB + Mongo Express
set -e

echo "🔧 1. Crear red 'miapp-net' si no existe..."
sudo docker network create miapp-net || echo "La red ya existe"

echo "📦 2. Crear contenedor MongoDB..."
sudo docker rm -f mongo 2>/dev/null || true
sudo docker run -d --name mongo \
  -e MONGO_INITDB_ROOT_USERNAME=admin \
  -e MONGO_INITDB_ROOT_PASSWORD=secret \
  --network miapp-net \
  mongo

echo "⏳ Esperando 5 segundos para que MongoDB inicie..."
sleep 5

echo "🌐 3. Crear contenedor Mongo Express..."
sudo docker rm -f mongo-express 2>/dev/null || true
sudo docker run -d --name mongo-express \
  -e ME_CONFIG_MONGODB_ADMINUSERNAME=admin \
  -e ME_CONFIG_MONGODB_ADMINPASSWORD=secret \
  -e ME_CONFIG_MONGODB_AUTH_DATABASE=admin \
  -e ME_CONFIG_MONGODB_SERVER=mongo \
  -e ME_CONFIG_BASICAUTH=false \
  -p 8081:8081 \
  --network miapp-net \
  mongo-express

echo "✅ MongoDB y Mongo Express están corriendo."
echo "🌐 Accede a Mongo Express en: http://localhost:8081"

