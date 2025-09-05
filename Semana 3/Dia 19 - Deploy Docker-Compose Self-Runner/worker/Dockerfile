# Imagen base oficial de Node.js
FROM node:20-bookworm
# Establecer el directorio de trabajo
WORKDIR /app
# Copiar primero package.json y package-lock.json para aprovechar la cache
COPY package*.json ./
# Instalar dependencias de la aplicación
RUN npm install
# Instalar PM2 globalmente
RUN npm install -g pm2
# Copiar el resto del código
COPY . .
# Exponer el puerto en el que correrá la app
EXPOSE 3001
# Usar pm2-runtime para mantener el proceso en primer plano
CMD ["pm2-runtime", "start", "main.js", "--name", "vote-worker", "--", "-p", "3001"]

