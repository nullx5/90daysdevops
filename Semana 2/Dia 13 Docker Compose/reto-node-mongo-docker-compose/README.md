## ✅ Tarea Práctica: Aplicación Node.js + MongoDB con Docker Compose**  

Implementar una aplicación Node.js con MongoDB usando Docker Compose, asegurando persistencia de datos y conexión entre servicios.  

---

### **📌 Parte 1: Configuración Básica**  
1. **Estructura del proyecto**:  
   ```bash
   mkdir node-mongo-app && cd node-mongo-app
   mkdir backend
   touch backend/{server.js,package.json,Dockerfile} docker-compose.yml
   ```

2. **Archivos base**:  
   - `backend/server.js` (API simple):  
     ```javascript
     const express = require('express');
     const mongoose = require('mongoose');
     const app = express();
     
     mongoose.connect('mongodb://db:27017/mydb');
     
     app.get('/', (req, res) => {
       res.send('¡API conectada a MongoDB con Docker!');
     });
     
     app.listen(3000, () => console.log('Server running on port 3000'));
     ```
   - `backend/Dockerfile`:  
     ```dockerfile
     FROM node:18-alpine
     WORKDIR /app
     COPY package.json .
     RUN npm install
     COPY . .
     CMD ["node", "server.js"]
     ```

3. **docker-compose.yml**:  
   ```yaml
   services:
     backend:
       build: ./backend
       ports:
         - "3000:3000"
       depends_on:
         db:
           condition: service_healthy
     
     db:
       image: mongo:6
       volumes:
         - db_data:/data/db
       healthcheck:
         test: ["CMD", "mongosh", "--eval", "db.adminCommand('ping')"]
         interval: 5s
         timeout: 3s
         retries: 5
   
   volumes:
     db_data:
   ```

---

### **🛠️ Parte 2: Ejecución y Verificación**  
1. **Inicia los servicios**:  
   ```bash
   docker compose up -d
   ```
2. **Prueba la API**:  
   ```bash
   curl http://localhost:3000
   # Deberías ver: "¡API conectada a MongoDB con Docker!"
   ```
3. **Verifica la base de datos**:  
   ```bash
   docker compose exec db mongosh --eval "show dbs"
   ```

---

### **🔐 Parte 3: Persistencia y Debugging**  
1. **Detén y reinicia los contenedores**:  
   ```bash
   docker compose down && docker compose up -d
   ```
2. **Verifica que los datos de MongoDB persistan**:  
   - Crea una colección:  
     ```bash
     docker compose exec db mongosh --eval "db.test.insertOne({name: 'Ejemplo'})"
     ```
   - Reinicia y comprueba que sigue existiendo.  

---

### **💡 Bonus (Avanzado)**  
**Añade un frontend con React**:  
1. Agrega este servicio al `docker-compose.yml`:  
   ```yaml
   frontend:
     image: node:18-alpine
     working_dir: /app
     volumes:
       - ./frontend:/app
     ports:
       - "5173:5173"
     command: ["npm", "run", "dev"]
     depends_on:
       - backend
   ```


---

## 💡 Tips de Roxs 

> **"Docker Compose es como tener un director de orquesta para tus contenedores. Un solo comando y toda tu aplicación cobra vida."**

### Pro Tips:
1. **Usa `.env`** para todo lo configurable
2. **Healthchecks** en servicios críticos
3. **Perfiles** para separar entornos
4. **Nombres explícitos** para redes y volúmenes
5. **El nuevo comando** `docker compose` (sin guión)

---

Usá el hashtag **#DevOpsConRoxs** o compartilo en el canal de la comunidad. 🎯
