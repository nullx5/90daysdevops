#!/bin/bash

echo "Tabla del 5:"

for i in {1..10}; do
  resultado=$((5 * i))
  echo "5 x $i = $resultado"
done

