## 🧠 Reto del Día

🧪 **Conecta y persiste**

1. Crear una red personalizada `miapp-net`.
2. Ejecutar dos contenedores `api` y `db` en esa red.
3. Desde `api`, hacé ping a `db` para verificar conectividad.
4. Crear un volumen `vol-db` y montarlo en `/datos` dentro del contenedor `db`.
5. Desde `db`, escribí un archivo en `/datos/info.txt`.
6. Eliminá el contenedor `db`, volvé a crearlo, y comprobá si el archivo sigue existiendo.

---

## 🧪 Reto Adicional: MongoDB + Mongo Express

🎯 **Objetivo**: Crear un entorno con dos contenedores — MongoDB y Mongo Express — y conectarlos con Docker.

### Instrucciones:

1. Crear contenedor de MongoDB:

```bash
docker run -d --name mongo \
  -e MONGO_INITDB_ROOT_USERNAME=admin \
  -e MONGO_INITDB_ROOT_PASSWORD=secret \
  --network miapp-net \
  mongo
```

2. Crear contenedor de Mongo Express:

```bash
docker run -d --name mongo-express \
  -e ME_CONFIG_MONGODB_ADMINUSERNAME=admin \
  -e ME_CONFIG_MONGODB_ADMINPASSWORD=secret \
  -e ME_CONFIG_MONGODB_SERVER=mongo \
  -p 8081:8081 \
  --network miapp-net \
  mongo-express
```

3. Acceder a la interfaz web en:
   👉 [http://localhost:8081](http://localhost:8081)

4. Crear la base de datos `Library` y la colección `Books`.

5. Importar datos (`books.json`):

```json
[
  { "title": "Docker in Action, Second Edition", "author": "Jeff Nickoloff and Stephen Kuenzli" },
  { "title": "Kubernetes in Action, Second Edition", "author": "Marko Lukša" }
]
```

📂 Colocá este archivo en tu máquina y usá la interfaz de Mongo Express para cargarlo.
