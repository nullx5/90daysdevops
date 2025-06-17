#!/bin/bash

# Verificar que se pasaron dos argumentos
if [ $# -ne 2 ]; then
  echo "Uso: $0 archivo palabra"
  exit 1
fi

archivo=$1
palabra=$2

# Verificar si el archivo existe
if [ ! -f "$archivo" ]; then
  echo "Error: El archivo '$archivo' no existe."
  exit 1
fi

# Buscar la palabra con grep (sin distinguir mayúsculas)
if grep -q "$palabra" "$archivo"; then
  echo "¡Encontrado!"
else
  echo "No encontrado."
fi

