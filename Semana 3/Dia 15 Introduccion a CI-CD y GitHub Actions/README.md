# Día 15 - Introducción a CI/CD y GitHub actions

[https://github.com/nullx5/workflows-github-actions/actions](https://github.com/nullx5/workflows-github-actions/actions)

>Ejemplo workflow deploy with git push
[https://gist.github.com/nullx5/838ad8a7311b94c803d2d41a45051839](https://gist.github.com/nullx5/838ad8a7311b94c803d2d41a45051839)

> Ejemplo workflow git merge with pull request
[https://github.com/nullx5/mi-primer-pull-request/blob/main/.github/workflows/auto-pr-merge.yml](https://github.com/nullx5/mi-primer-pull-request/blob/main/.github/workflows/auto-pr-merge.yml)
### Elementos principales del workflow

| Elemento  | Descripción                                                  | Ejemplo                         |
|-----------|--------------------------------------------------------------|---------------------------------|
| name      | Nombre descriptivo del workflow (opcional).                  | `name: CI Pipeline`             |
| on        | Evento(s) que disparan la ejecución del workflow.            | `on: [push, pull_request]`      |
| jobs      | Conjunto de trabajos que se ejecutarán en el workflow.       | `jobs:`                         |
| runs-on   | Especifica el sistema operativo/runner donde se ejecutará el job. | `runs-on: ubuntu-latest, windows-latest, macos-latest` |
| steps     | Lista de pasos dentro de un job.                             | `steps:`                        |
| uses      | Indica que un paso usa una acción existente.                 | `uses: actions/checkout@v4`     |
| run       | Comandos que se ejecuta dentro de un paso. `run` puede ejecutar cualquier lenguaje. `bash, python, nodejs. etc` | `run: npm install`              |
| env       | Variables de entorno para jobs o steps.                      | `env: { NODE_ENV: production }` |


## ✨ ¡Tu primer workflow de CI/CD!

### Paso 1: Crear tu proyecto

```bash
mkdir mi-primer-ci-cd
cd mi-primer-ci-cd
git init
echo "# Mi Primer CI/CD" > README.md
git add .
git commit -m "Inicio de proyecto"
````

### Paso 2: Crear la estructura

```bash
mkdir -p .github/workflows
```

### Paso 3: Crear el workflow `.github/workflows/hola-mundo.yml`

```yaml
name: Mi Primer CI/CD

on:
  push:
    branches: [ main ]
  pull_request:
    branches: [ main ]
  workflow_dispatch:

jobs:
  saludar:
    runs-on: ubuntu-latest
    steps:
    - name: 📥 Descargar código
      uses: actions/checkout@v4

    - name: 👋 ¡Hola mundo DevOps!
      run: |
        echo "¡Hola DevOps con Roxs! 🚀"
        date
        uname -a

    - name: 🧪 Test Matemático
      run: |
        if [ $((2+2)) -eq 4 ]; then
          echo "✅ Todo OK"
        else
          echo "❌ Algo falló"
          exit 1
        fi
```

### Paso 4: Subir tu repositorio

```bash
git remote add origin https://github.com/TU-USUARIO/mi-primer-ci-cd.git
git branch -M main
git push -u origin main
```

📌 **En GitHub → pestaña “Actions” vas a ver tu workflow ejecutándose automáticamente.**

---

## 🎯 Ejercicios prácticos

### Ejercicio 1: Workflow con variables

`.github/workflows/variables.yml`

```yaml
name: Variables DevOps

on: [push, workflow_dispatch]

env:
  PROYECTO: "Mi App DevOps"
  AMBIENTE: "Desarrollo"

jobs:
  mostrar:
    runs-on: ubuntu-latest
    env:
      RESPONSABLE: "Estudiante DevOps"
    steps:
    - name: Mostrar info
      run: |
        echo "Proyecto: $PROYECTO"
        echo "Ambiente: $AMBIENTE"
        echo "Responsable: $RESPONSABLE"
```

### Ejercicio 2: Workflow condicional

`.github/workflows/condicional.yml`

```yaml
name: Rama Detectada

on:
  push:
    branches: [main, develop, feature/*]
  workflow_dispatch:

jobs:
  detectar:
    runs-on: ubuntu-latest
    steps:
    - name: Detectar rama
      run: |
        echo "Rama actual: ${{ github.ref_name }}"
