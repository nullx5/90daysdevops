#!/bin/sh

i=0
while true; do
  echo "Mensaje $i - $(date)" >> mensajes.txt
  i=$((i+1))
  sleep 5
done

