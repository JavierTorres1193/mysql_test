# Prueba Técnica - MySQL

Este proyecto proporciona una solución utilizando **MySQL** y **Docker** para levantar una base de datos de manera sencilla y rápida.

## 📌 Requisitos previos

Antes de comenzar, asegúrate de tener instalado:
- **Docker** y **Docker Compose** en tu sistema.
- Asegurarse de que los puertos **3306** (MySQL) y **8080** (Adminer) estén libres antes de ejecutar los contenedores.

## 🚀 Cómo ejecutar la base de datos

Sigue estos pasos para levantar el entorno de MySQL:

1. **Clona este repositorio:**
   ```sh
   git clone https://github.com/JavierTorres1193/mysql_test.git
   cd mysql_test
   ```

2. **Inicia los contenedores con Docker Compose:**
   ```sh
   docker-compose up -d
   ```
   Esto iniciará un contenedor con **MySQL** y otro con **Adminer** para la administración visual de la base de datos.

3. **Opcional: Usar Adminer para gestionar la base de datos**
   - Abre tu navegador y accede a: [http://localhost:8080](http://localhost:8080)
   - Ingresa las siguientes credenciales:
     - **Servidor:** `mysql`
     - **Usuario:** `user`
     - **Contraseña:** `password`
     - **Base de datos:** `testdb`

4. **Ejecuta las consultas desde `queries.sql` en MySQL.**

## 📂 Contenido del repositorio

- `database.sql` → Script SQL con la estructura y datos de prueba.
- `queries.sql` → Conjunto de consultas SQL organizadas.
- `docker-compose.yml` → Archivo de configuración para Docker.
- `README.md` → Documentación del proyecto.

## 🛠 Configuración de Docker

Este proyecto utiliza **Docker Compose** para configurar un entorno con **MySQL 8** y **Adminer**.

📌 **Estructura del `docker-compose.yml`:**

```yaml
version: '3.8'

services:
  mysql:
    image: mysql:8
    container_name: mysql_prueba_tecnica
    restart: always
    environment:
      MYSQL_ROOT_PASSWORD: root
      MYSQL_DATABASE: testdb
      MYSQL_USER: user
      MYSQL_PASSWORD: password
    ports:
      - "3306:3306"
    volumes:
      - ./database.sql:/docker-entrypoint-initdb.d/database.sql

  adminer:
    image: adminer
    container_name: adminer
    restart: always
    ports:
      - "8080:8080"
```

### 🔹 **¿Qué hace este archivo?**
✅ Descarga la imagen oficial de **MySQL 8** y **Adminer**
✅ Crea la base de datos `testdb` con usuario y contraseña predefinidos
✅ Ejecuta el script `database.sql` al iniciar el contenedor
✅ Proporciona una interfaz web en [http://localhost:8080](http://localhost:8080)

## 📌 Consultas SQL disponibles

📌 **Ejemplo de consultas en `queries.sql`:**

```sql
-- 1️⃣ Obtener productos con short_code distinto a 'X12345'
SELECT id, name, short_description, long_description
FROM products
WHERE short_code != 'X12345';

-- 2️⃣ Contar registros actualizados hoy para supplier_id = 1
SELECT COUNT(*) AS cantidad_registros
FROM products
WHERE supplier_id = 1 AND DATE(updated_at) = CURDATE();
```

