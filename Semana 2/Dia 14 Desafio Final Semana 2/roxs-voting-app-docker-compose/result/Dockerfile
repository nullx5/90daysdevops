# Imagen base de Node.js
FROM node:20-bookworm
# Establecer directorio de trabajo
WORKDIR /app
# Copiar package.json y package-lock.json (si existe) primero
COPY package*.json ./
# Instalar dependencias de la app
RUN npm install
# Instalar PM2 globalmente
RUN npm install -g pm2
# Copiar el resto del código
COPY . .
# Exponer el puerto que usará la app
EXPOSE 3000
# Ejecutar con PM2
CMD ["pm2-runtime", "start", "main.js", "--name", "vote-worker", "--", "-p", "3000"]

