FROM python:3.11-bookworm
# Variables para evitar buffering y .pyc innecesarios
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1
# Establecer directorio de trabajo
WORKDIR /app
# Copiar primero el archivo de dependencias y instalar
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
# Copiar el resto del código
COPY . .
# Exponer el puerto (Gunicorn lo usará)
EXPOSE 80
# Comando por defecto
CMD ["gunicorn", "-w", "4", "-b", "0.0.0.0:80", "app:app"]

