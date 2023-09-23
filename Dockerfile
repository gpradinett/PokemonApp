# Utiliza una imagen base de Node.js en Alpine
FROM node:14-alpine

# Establece el directorio de trabajo en /app dentro del contenedor.
WORKDIR /app

# Copia el archivo package.json y package-lock.json para instalar las dependencias.
COPY package*.json ./

# Comprueba si existe la carpeta node_modules.
# Si no existe, ejecuta npm install para instalar las dependencias.
RUN if [ ! -d "node_modules" ]; then npm install; fi

# Copia el resto de los archivos de la aplicación al contenedor.
COPY . .

# Expone el puerto en el que se ejecutará tu aplicación (si es necesario).
# EXPOSE 3000

# Comando para ejecutar la aplicación cuando se inicie el contenedor.
CMD ["npm", "start"]
