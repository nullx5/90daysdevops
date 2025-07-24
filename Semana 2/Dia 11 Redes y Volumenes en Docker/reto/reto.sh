#!/bin/bash

# Reto del Día: Conecta y persiste
set -e  # Detiene el script ante errores

echo "🔧 1. Crear red personalizada miapp-net..."
sudo docker network create miapp-net || echo "La red ya existe"

echo "📦 2. Crear contenedor db..."
sudo docker rm -f db 2>/dev/null || true
sudo docker run -dit --name db --network miapp-net alpine sh

echo "📦 3. Crear contenedor api..."
sudo docker rm -f api 2>/dev/null || true
sudo docker run -dit --name api --network miapp-net alpine sh

echo "🌐 4. Verificar conectividad (ping desde api a db)..."
sudo docker exec api ping -c 3 db

echo "💾 5. Crear volumen vol-db..."
sudo docker volume create vol-db || echo "El volumen ya existe"

echo "♻️ 6. Eliminar y volver a crear contenedor db con volumen montado..."
sudo docker rm -f db
sudo docker run -dit --name db --network miapp-net -v vol-db:/datos alpine sh

echo "📄 7. Escribir archivo info.txt dentro del volumen..."
sudo docker exec db sh -c "echo 'Hola desde DB' > /datos/info.txt"

echo "🗑️ 8. Eliminar nuevamente contenedor db..."
sudo docker rm -f db

echo "🔁 9. Volver a crear contenedor db y verificar persistencia..."
sudo docker run -dit --name db --network miapp-net -v vol-db:/datos alpine sh

echo "📁 10. Verificando contenido de /datos/info.txt..."
sudo docker exec db cat /datos/info.txt

echo "✅ Reto completado: El archivo fue persistido correctamente."

