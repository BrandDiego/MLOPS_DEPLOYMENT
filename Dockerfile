# Imagen base optimizada con las dependencias necesarias
FROM python:3.11-slim

# Instalar dependencias del sistema (para lightgbm y libgomp)
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    libgomp1 \
    && rm -rf /var/lib/apt/lists/*

# Crear y setear el directorio de trabajo
WORKDIR /app

# Copiar solo los archivos necesarios
COPY requirements.txt .

# Instalar dependencias de Python
RUN pip install --upgrade pip && pip install -r requirements.txt

# Copiar el resto del código de la aplicación
COPY . .

# Exponer el puerto de la aplicación
EXPOSE 5000

# Comando para correr la app con Gunicorn
CMD ["gunicorn", "-b", "0.0.0.0:5000", "app:app"]


