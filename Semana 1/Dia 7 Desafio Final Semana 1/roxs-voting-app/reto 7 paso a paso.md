https://github.com/roxsross/roxs-devops-project90.git

----------------------------------------------------------------
### database redis y postgresql

```
sudo apt install redis-server
sudo systemctl status redis
redis-cli
```

| Acción                     | Comando           |
| -------------------------- | ----------------- |
| Entrar al CLI de Redis     | `redis-cli`       |
| Cambiar de base de datos   | `SELECT <número>` |
| Ver claves en base actual  | `KEYS *`          |
| Ver resumen de bases (uso) | `INFO keyspace`   |
| borrar todo | `flushall` |
| tipo de valor string o lista | `TYPE votes` |
| listar contenido de lista | `LRANGE votes 0 -1` |

```
sudo apt install postgresql
sudo systemctl status postgresql
sudo -u postgres psql

CREATE DATABASE votes;
ALTER USER postgres WITH PASSWORD 'postgres';
GRANT ALL PRIVILEGES ON DATABASE votes TO postgres;

```
crear toda la `tabla votes` eso lo hace la `app worker main.js`

----------------------------------------------------------------
### app worker nodejs

`app  worker main.js` corre en segundo plano procesando votos desde `colas en Redis` y guardándolos en `PostgreSQL`. Además, expone métricas con Prometheus en un servidor HTTP en el `puerto 3001`.

```
cd roxs-devops-project90/roxs-voting-app/worker
sudo apt install -y nodejs npm
npm install

sudo npm install -g pm2


nvim main.js
const port = 3000; por const port = 3001;
app.listen(port, () por app.listen(port, '0.0.0.0', ()

host: process.env.DATABASE_HOST || "database" por host: process.env.DATABASE_HOST || "localhost"
let hostname = process.env.REDIS_HOST || "redis"; por let hostname = process.env.REDIS_HOST || "localhost";

pm2 start main.js --name vote-worker -- -p 3001
pm2 save
pm2 startup systemd -u $USER --hp $HOME

pm2 delete vote-worker
pm2 restart vote-worker
pm2 status
ss -tlpn
```


> Tu worker abrirá el endpoint de métricas en:
`http://192.168.33.20:3001/metrics`
----------------------------------------------------------------
### app result nodejs

```
cd roxs-devops-project90/roxs-voting-app/result
npm install

nvim main.js
const dbhost = process.env.DATABASE_HOST || 'database'; por const dbhost = process.env.DATABASE_HOST || 'localhost';

pm2 start main.js --name vote-result -- -p 3000

pm2 status
ss -tlpn

pm2 save
pm2 startup systemd -u $USER --hp $HOME
```

------------------------------------------------------------------
### app vote flask

```
cd roxs-devops-project90/roxs-voting-app/vote

sudo apt install python3-pip python3-venv -y

python3 -m venv venv

source venv/bin/activate


pip list

pip install -r requirements.txt

sudo flask run --host=0.0.0.0 --port=80
sudo python3 app.py
sudo gunicorn -w 4 -b 0.0.0.0:80 app:app
```
--------------------------------------------------------

### Niveles de Verbosidad ansible

| Nivel | Opción CLI                        | Descripción                                                                 |
|-------|-----------------------------------|-----------------------------------------------------------------------------|
| 0     | `ansible-playbook playbook.yml`  | Verbosidad por defecto. Muestra solo errores o información esencial.        |
| 1     | `ansible-playbook -v playbook.yml`   | Muestra tareas realizadas y cambios hechos.                                |
| 2     | `ansible-playbook -vv playbook.yml`  | Incluye detalles adicionales como salidas de comandos, módulos usados.     |
| 3     | `ansible-playbook -vvv playbook.yml` | Muestra información de conexión, variables y más detalles técnicos.         |
| 4     | `ansible-playbook -vvvv playbook.yml`| Muestra salida de depuración completa (incluye detalles SSH, etc.).        |
| 5     | `ansible-playbook -vvvvv playbook.yml`| Nivel de depuración extremo, raramente necesario.                          |

> Logs bonitos `ccze -A < ansible.log | grep "TASK"`
