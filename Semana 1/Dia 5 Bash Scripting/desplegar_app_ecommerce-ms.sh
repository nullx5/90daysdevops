#!/bin/bash

LOG="logs_pm2.txt"

REPO="https://github.com/roxsross/devops-static-web.git"
BRANCH="ecommerce-ms"
APP_DIR="devops-static-web"

SERVICIOS=(
  "frontend:3000"
  "products:3001"
  "shopping-cart:3002"
  "merchandise:3003"
)

instalar_dependencias() {
  echo "🔧 Instalando Node.js, npm y PM2..." | tee $LOG
  sudo apt update >> $LOG 2>&1
  sudo apt install -y nodejs npm >> $LOG 2>&1
  sudo npm install -g pm2 >> $LOG 2>&1
}

clonar_app() {
  echo "📦 Clonando aplicación desde $REPO (branch: $BRANCH)..." | tee -a $LOG
  git clone -b $BRANCH $REPO >> $LOG 2>&1
  cd $APP_DIR || exit 1
}

instalar_y_ejecutar_servicios() {
  echo "🚀 Instalando y ejecutando servicios con PM2..." | tee -a ../$LOG

  for item in "${SERVICIOS[@]}"; do
    IFS=":" read -r nombre puerto <<< "$item"
    echo "➡️ Servicio: $nombre (Puerto: $puerto)" | tee -a ../$LOG

    cd "$nombre" || { echo "❌ No se encontró el directorio $nombre"; exit 1; }

    npm install >> ../../$LOG 2>&1
    pm2 start server.js --name "$nombre" -- -p "$puerto" >> ../../$LOG 2>&1
    cd ..  # volver al directorio raíz del proyecto
  done
}

guardar_configuracion_pm2() {
  echo "💾 Guardando configuración de PM2 para reinicio automático..." | tee -a ../$LOG
  pm2 save >> ../$LOG 2>&1
  pm2 startup systemd -u $USER --hp $HOME >> ../$LOG 2>&1
}

verificar_servicios() {
  echo "📋 Verificando estado de los servicios..." | tee -a ../$LOG
  pm2 list | tee -a ../$LOG
}

main() {
  echo "=== 🧩 INICIANDO DESPLIEGUE PM2 - ECOMMERCE APP ===" | tee $LOG
  instalar_dependencias
  clonar_app
  instalar_y_ejecutar_servicios
  guardar_configuracion_pm2
  verificar_servicios

  echo "=== ✅ DESPLIEGUE COMPLETADO ===" | tee -a ../$LOG
  echo "Revisá $LOG para detalles." | tee -a ../$LOG
  echo "La aplicación debería estar disponible en: http://$(hostname -I | awk '{print $2}'):3000" | tee -a ../$LOG
}

main

