# Imagen base con Python
FROM python:3.11-slim

# Establecer directorio de trabajo en el contenedor
WORKDIR /app

# Copiar los archivos del proyecto al contenedor
COPY . /app

# Instalar las dependencias
RUN pip install --upgrade pip && pip install -r requirements.txt

# Exponer el puerto en el que correrá la app Flask
EXPOSE 5000

# Comando para ejecutar la app
CMD ["gunicorn", "--bind", "0.0.0.0:5000", "app:app"]

