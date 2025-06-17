#!/bin/bash
echo "¿Cómo te llamás?"
read NOMBRE
echo "¡Hola $NOMBRE!"


read -p "¿Tenés sed? (sí/no): " RESPUESTA

if [ "$RESPUESTA" == "si" ]; then
  echo "Andá por un cafecito ☕"
else
  echo "Seguimos con DevOps 🚀"
fi
