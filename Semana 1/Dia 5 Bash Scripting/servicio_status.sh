#!/bin/bash

# Lista de servicios a verificar
servicios=(nginx mysql docker)

# Dirección de correo para notificación
correo="tu_email@dominio.com"

# Variable para almacenar servicios caídos
caidos=()

# Verificar cada servicio
for servicio in "${servicios[@]}"; do
  if systemctl is-active --quiet "$servicio"; then
    echo "✓ $servicio está activo."
  else
    echo "✗ $servicio NO está activo."
    caidos+=("$servicio")
  fi
done

# Si hay servicios caídos, enviar correo
if [ ${#caidos[@]} -gt 0 ]; then
  mensaje="ALERTA: Los siguientes servicios están caídos:\n\n"
  for s in "${caidos[@]}"; do
    mensaje+="$s\n"
  done

  echo -e "$mensaje" | mail -s "⚠️ Alerta de servicios caídos" "$correo"
  echo "📧 Correo de alerta enviado a $correo."
else
  echo "✅ Todos los servicios están funcionando correctamente."
fi

