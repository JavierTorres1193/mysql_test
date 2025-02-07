-- 1️⃣ Productos con short_code distinto a 'X12345'
SELECT id, name, short_description, long_description FROM products
WHERE short_code != 'X12345';

-- 2️⃣ Cantidad de registros de supplier_id = 1 actualizados hoy
-- SELECT COUNT(*) AS cantidad_registros 
-- FROM products 
-- WHERE supplier_id = 1 AND DATE(updated_at) = CURDATE();

-- 3️⃣ Duraciones únicas con reviews entre 4.0 y 4.5, y opción "Adult"
-- SELECT DISTINCT p.duration
-- FROM products p
-- JOIN product_option po ON p.id = po.product_id
-- WHERE p.reviews_average_rating BETWEEN 4.0 AND 4.5
-- AND po.name = 'Adult';

-- 4️⃣ Última fecha de actualización por supplier
-- SELECT supplier_id, MAX(fetched_at) AS ultima_fecha_actualizacion
-- FROM products
-- GROUP BY supplier_id;
