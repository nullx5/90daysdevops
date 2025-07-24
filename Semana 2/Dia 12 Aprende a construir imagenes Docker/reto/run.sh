#!/bin/bash

echo "Construyendo Imagen ..."
sudo docker build -t hello-node-app .

echo "Levantando contenedor ..."
sudo docker run -d --name hello-app -p 3000:3000 hello-node-app

echo "Navega a : http://localhost:3000"
