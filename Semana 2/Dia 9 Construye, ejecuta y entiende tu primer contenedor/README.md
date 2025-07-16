## 🚀 Tarea del Día extra: ¡Tu Primer Sitio Web en un Contenedor!

### 🧪 Objetivo

Crear un contenedor Docker con **NGINX** que sirva una web estática personalizada desde una carpeta externa, accesible en:
📍 `http://localhost:9999`

---

### 📋 Instrucciones paso a paso

1. **Correr un contenedor llamado `bootcamp-web`**:

```bash
docker run -d --name bootcamp-web -p 9999:80 nginx
```

2. **Clonar el repositorio con la web**:

```bash
git clone -b devops-simple-web https://github.com/roxsross/devops-static-web.git
```

3. **Copiar el contenido al contenedor**:

```bash
docker cp devops-static-web/bootcamp-web/. bootcamp-web:/usr/share/nginx/html/
```

4. **Verificar que los archivos estén copiados**:

```bash
docker exec bootcamp-web ls /usr/share/nginx/html
```

5. **Acceder al sitio en tu navegador**:

Abrí: [http://localhost:9999](http://localhost:9999)

---

### ✅ Resultado Esperado

Deberías ver en pantalla una web estática servida por tu contenedor `bootcamp-web` usando NGINX.

![](https://bootcamp.295devops.com/assets/images/ses1-ejer2-fca816fd2465864500194c00360a1fb1.png)

🎉 ¡Felicitaciones! Estás dominando los contenedores.

---

## 💡 Tip de Roxs

> “Un contenedor no es solo para testear, ¡también puede ser tu primer servidor web real! Practicar con cosas que podés ver y tocar motiva el doble 🚀”

---

## 📚 Recursos recomendados

* 🧪 [Play with Docker](https://labs.play-with-docker.com/)
* 📘 [Cheatsheet de Docker](https://dockerlabs.collabnix.com/docker/cheatsheet/)
* 📘 [Documentación oficial](https://docs.docker.com/get-started/)

---

Usá el hashtag **#DevOpsConRoxs** o compartilo en el canal de la comunidad. 🎯
