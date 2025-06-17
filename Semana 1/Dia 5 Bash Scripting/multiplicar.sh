#!/usr/bin/bash

# Verificar si se pasaron exactamente dos argumentos
if [ $# -ne 2 ]; then
  echo "Uso: $0 número1 número2"
  exit 1
fi

# Capturar los argumentos
num1=$1
num2=$2

# Multiplicar (usa expr o doble paréntesis)
resultado=$((num1 * num2))

# Mostrar resultado
echo "El resultado de $num1 x $num2 es: $resultado"
