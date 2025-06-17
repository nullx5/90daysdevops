#!/bin/bash

# Cambiar esto por tu nombre de usuario
USUARIO="blessed"
DESTINO="/home/$USUARIO/backups"

# Crear el directorio si no existe
mkdir -p "$DESTINO"

# Timestamp actual (formato YYYY-MM-DD_HH-MM-SS)
TIMESTAMP=$(date +%F_%H-%M-%S)

# Nombre del archivo de backup
ARCHIVO="log_backup_$TIMESTAMP.tar.gz"

# Crear el backup
tar -czf "$DESTINO/$ARCHIVO" /var/log

# Mostrar mensaje de éxito
echo "✔ Backup creado: $DESTINO/$ARCHIVO"

# Eliminar archivos de backup con más de 7 días
find "$DESTINO" -type f -name "log_backup_*.tar.gz" -mtime +7 -exec rm -f {} \;

echo "🧹 Backups mayores a 7 días eliminados."

