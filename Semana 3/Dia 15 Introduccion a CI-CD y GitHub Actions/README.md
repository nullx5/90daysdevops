# Día 15 - Introducción a CI/CD y GitHub actions

[https://github.com/nullx5/workflows-github-actions/actions](https://github.com/nullx5/workflows-github-actions/actions)

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
