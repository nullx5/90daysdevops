## 🛠️ Instalación de Docker

Recomendación

Si necesitas estabilidad sin importar versiones: `docker.io` + `docker-compose-v2` es suficiente.

Si estás desarrollando, usando características nuevas o quieres compatibilidad total: usa la instalación oficial (docker-ce + plugins).

### Opción 1 repositorios ubuntu

```bash
sudo apt update
sudo apt install docker.io docker-composev2
```
### Opción 2 recomendada: Instalación desde repositorios oficiales Docker

```bash
sudo apt-get update
sudo apt-get install ca-certificates curl gnupg
````

Agregar la clave GPG:

```bash
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg
```

Agregar el repositorio:

```bash
echo \
"deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian \
$(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
```

Instalar Docker Engine:

```bash
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
```

Agregar tu usuario al grupo `docker` (opcional pero recomendado):

```bash
sudo usermod -aG docker $USER
su - $USER
```

Verificar:

```bash
docker --version
```
