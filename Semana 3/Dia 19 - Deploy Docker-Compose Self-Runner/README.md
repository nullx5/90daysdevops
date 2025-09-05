---
title: Día 19 - Deploy con GitHub Actions
description: Aprender a desplegar con Docker Compose y Self-hosted Runners
sidebar_position: 5
---

## 🚀 Deploy con Docker Compose y Runners Propios

![](../../static/images/banner/3.png)

> "Construir es importante, pero **desplegar bien** es lo que hace que tu código cobre vida."

Hoy vas a **desplegar una aplicación full-stack** usando Docker Compose desde tu **self-hosted runner**. Vas a conectar todo lo que aprendiste en los días anteriores.

---

## 🧱 ¿Por qué usar Docker Compose?

- 🔁 Para levantar varios servicios juntos (app, DB, cache)
- 🧪 Ideal para entornos de desarrollo y testing
- ⚡ Despliegues rápidos con un solo comando
- 🔌 Los contenedores se conectan fácilmente entre sí

---

## 🛠️ Arquitectura de ejemplo

Imaginá una app con:

- 🐍 App Web (Flask o Node.js)
- 🐘 PostgreSQL
- 🔴 Redis
- 🌐 Nginx como reverse proxy

---

## 📦 Paso 1: Estructura de proyecto

```
 .
├──  docker-compose.yml
├──  README.md
├──  result
│  ├──  Dockerfile
│  ├──  main.js
│  ├──  package.json
│  ├──  tests
│  └──  views
├──  vote
│  ├──  app.py
│  ├──  Dockerfile
│  ├──  requirements.txt
│  ├──  templates
│  └──  tests
└──  worker
   ├──  Dockerfile
   ├──  main.js
   ├──  package.json
   └──  tests

```

---

## ⚙️ Paso 2: Docker Compose base (desarrollo)

`docker-compose.yml`

```yaml
services:
    vote:
        container_name: vote
        build: ./vote
        ports:
            - "80:80"
        environment:
            - REDIS_HOST=${REDIS_HOST}
            - DATABASE_HOST=${DATABASE_HOST}
            - DATABASE_USER=${DATABASE_USER}
            - DATABASE_PASSWORD=${DATABASE_PASSWORD}
            - DATABASE_NAME=${DATABASE_NAME}
        depends_on:
            - redis

    result:
        container_name: result
        build: ./result
        ports:
            - "3000:3000"
        environment:
            - APP_PORT=3000
            - DATABASE_HOST=${DATABASE_HOST}
            - DATABASE_USER=${DATABASE_USER}
            - DATABASE_PASSWORD=${DATABASE_PASSWORD}
            - DATABASE_NAME=${DATABASE_NAME}
        depends_on:
            - redis
            - database

    worker:
        container_name: worker
        build: ./worker
        ports:
           - "3001:3001"
        environment:
            - REDIS_HOST=${REDIS_HOST}
            - DATABASE_HOST=${DATABASE_HOST}
            - DATABASE_USER=${DATABASE_USER}
            - DATABASE_PASSWORD=${DATABASE_PASSWORD}
            - DATABASE_NAME=${DATABASE_NAME}
        depends_on:
            - redis
            - database

    redis:
        container_name: redis
        image: "redis:alpine"
        ports:
            - "6379:6379"

    database:
        container_name: database
        image: "postgres:15-alpine"
        environment:
            POSTGRES_USER: ${DATABASE_USER}
            POSTGRES_PASSWORD: ${DATABASE_PASSWORD}
            POSTGRES_DB: ${DATABASE_NAME}
        ports:
            - "5432:5432"
        volumes:
            - pgdata:/var/lib/postgresql/data

volumes:
    pgdata:
````

---

## 🚀 Paso 3: Workflow de Deployment

`.github/workflows/deploy-compose-self-runner.yml`

```yaml
name: Deploy Docker Compose Self-Runner

on:
  push:
    branches: [Dia-19-Deploy-Docker-Compose-Self-Runner]
  workflow_dispatch:

jobs:
  deploy:
    runs-on: [self-hosted, linux, rox]

    steps:
    - name: Checkout código
      uses: actions/checkout@v4

    - name: Parar servicios anteriores
      run: docker compose down -v || true

    - name: Construir servicios
      run: docker compose -f docker-compose.yml build

    - name: Levantar servicios
      run: | 
        docker compose -f docker-compose.yml up -d
        sleep 10
        curl -I http://localhost
        curl -I http://localhost:3000
        curl -I http://localhost:3001

```

---

## 🧪 Paso 4: Probar staging y producción

Cambiá el archivo `docker-compose.yml` por:

```bash
docker compose -f docker-compose.staging.yml up -d
docker compose -f docker-compose.prod.yml up -d
```

📌 Podés tener un workflow para cada uno.

---

## ✅ Tarea del Día

1. Crear una app full-stack o usar una del reto anterior
2. Agregar `docker-compose.yml` para levantarla
3. Crear un workflow de deploy usando tu runner
4. Verificar que se levanta bien

🎁 Bonus: Agregar `nginx` como reverse proxy
📸 Compartí el deploy corriendo con **#DevOpsConRoxs - Día 19**

---

## 🧠 Revisión rápida

| Pregunta                            | ✔️ / ❌ |
| ----------------------------------- | ------ |
| ¿Qué es Docker Compose?             |        |
| ¿Qué hace el workflow?              |        |
| ¿Cómo se levanta la app en staging? |        |

---

## 🏁 Cierre del Día

Hoy desplegaste con herramientas reales, como en los entornos productivos.
Mañana vas a aprender cómo **monitorear** tu aplicación y detectar si algo falla.

Nos vemos en el **Día 20** 📈🩺
