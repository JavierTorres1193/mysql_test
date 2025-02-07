# Prueba Técnica - MySQL

Este proyecto contiene la solución a la prueba técnica utilizando **MySQL** y **Docker**.

## 📌 Requisitos previos

- Tener **Docker** y **Docker Compose** instalados en tu máquina.

## 🚀 Cómo ejecutar la base de datos

1. **Clona este repositorio:**
   ```sh
   git clone https://github.com/JavierTorres1193/mysql_test.git
   cd mysql_test
   ```

2. **Levanta el contenedor de MySQL con Docker:**
   ```sh
   docker-compose up -d
   ```

3. **Conéctate a la base de datos:**
   ```sh
   mysql -h 127.0.0.1 -P 3306 -u user -p password testdb
   ```

4. **Ejecuta las consultas desde `queries.sql` en MySQL.**

## 📌 Contenido

- `database.sql`: Script SQL con la estructura de la base de datos y datos de prueba.
- `queries.sql`: Consultas SQL organizadas y comentadas.
- `docker-compose.yml`: Archivo para levantar MySQL en un contenedor Docker.
- `README.md`: Instrucciones para ejecutar el proyecto.

## 🛠 Configuración de Docker

Este proyecto utiliza **Docker** para levantar un entorno de base de datos MySQL automáticamente.

📌 **Contenido de `docker-compose.yml`:**

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
```

### 🔹 **¿Qué hace este archivo?**
✅ Descarga la imagen oficial de **MySQL 8**  
✅ Crea la base de datos `testdb` con usuario y contraseña  
✅ Ejecuta el script `database.sql` automáticamente  

## 📌 Consultas SQL

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

## 📩 Contacto
Si tienes dudas, puedes contactarme en [tu correo o LinkedIn].

