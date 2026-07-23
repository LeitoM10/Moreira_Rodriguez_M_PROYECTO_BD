

-- Consulta 1: Catalogo completo de productos con categoria, marca y proveedor
SELECT p.producto_id, p.nombre, c.nombre AS categoria, m.nombre AS marca,
       pr.nombre AS proveedor, p.precio_venta, p.stock
FROM productos p
JOIN categorias c  ON p.categoria_id = c.categoria_id
JOIN marcas m       ON p.marca_id = m.marca_id
JOIN proveedores pr ON p.proveedor_id = pr.proveedor_id
ORDER BY p.nombre;

-- Consulta 2: Total comprado y numero de ventas por cliente
SELECT cl.cliente_id, cl.nombre, COUNT(v.venta_id) AS num_ventas, SUM(v.total) AS total_comprado
FROM clientes cl
JOIN ventas v ON cl.cliente_id = v.cliente_id
GROUP BY cl.cliente_id, cl.nombre
ORDER BY total_comprado DESC;

-- Consulta 3: Empleados que han realizado al menos una venta
SELECT DISTINCT e.empleado_id, e.nombre, e.cargo
FROM empleados e
JOIN ventas v ON e.empleado_id = v.empleado_id;

-- Consulta 4: Productos con stock bajo (menos de 20 unidades)
SELECT producto_id, nombre, stock
FROM productos
WHERE stock < 20
ORDER BY stock;

-- Consulta 5: Top 5 productos mas vendidos (por unidades)
SELECT p.producto_id, p.nombre, SUM(dv.cantidad) AS unidades_vendidas
FROM detalle_ventas dv
JOIN productos p ON dv.producto_id = p.producto_id
GROUP BY p.producto_id, p.nombre
ORDER BY unidades_vendidas DESC
LIMIT 5;

-- Consulta 6: Clientes que tienen al menos un equipo ensamblado
SELECT DISTINCT cl.cliente_id, cl.nombre, cl.ciudad
FROM clientes cl
JOIN equipos_ensamblados ee ON cl.cliente_id = ee.cliente_id;

-- Consulta 7: Total comprado a cada proveedor
SELECT pr.proveedor_id, pr.nombre, COUNT(c.compra_id) AS num_compras, SUM(c.total) AS total_comprado
FROM proveedores pr
JOIN compras c ON pr.proveedor_id = c.proveedor_id
GROUP BY pr.proveedor_id, pr.nombre
ORDER BY total_comprado DESC;

-- =====================================================================
-- SUBCONSULTAS (8 - 20)
-- =====================================================================

-- Consulta 8: Empleados con salario mayor al promedio 
SELECT empleado_id, nombre, cargo, salario
FROM empleados
WHERE salario > (SELECT AVG(salario) FROM empleados)
ORDER BY salario DESC;

-- Consulta 9: Productos con precio de venta mayor al promedio de su propia categoria
SELECT p.producto_id, p.nombre, p.categoria_id, p.precio_venta
FROM productos p
WHERE p.precio_venta > (
    SELECT AVG(p2.precio_venta)
    FROM productos p2
    WHERE p2.categoria_id = p.categoria_id
)
ORDER BY p.categoria_id;

-- Consulta 10: Clientes que nunca han realizado una compra 
SELECT cl.cliente_id, cl.nombre
FROM clientes cl
WHERE NOT EXISTS (
    SELECT 1 FROM ventas v WHERE v.cliente_id = cl.cliente_id
);

-- Consulta 11: Proveedores que no tienen ningun producto registrado 
SELECT pr.proveedor_id, pr.nombre
FROM proveedores pr
WHERE pr.proveedor_id NOT IN (
    SELECT DISTINCT proveedor_id FROM productos
);

-- Consulta 12: Ventas con un total mayor al promedio general de ventas
SELECT venta_id, fecha, cliente_id, total
FROM ventas
WHERE total > (SELECT AVG(total) FROM ventas)
ORDER BY total DESC;

-- Consulta 13: Producto mas caro de cada categoria
SELECT p.producto_id, p.nombre, p.categoria_id, p.precio_venta
FROM productos p
WHERE p.precio_venta = (
    SELECT MAX(p2.precio_venta)
    FROM productos p2
    WHERE p2.categoria_id = p.categoria_id
)
ORDER BY p.categoria_id;

-- Consulta 14: Clientes con mas de 2 ventas registradas
SELECT cl.cliente_id, cl.nombre, COUNT(v.venta_id) AS num_ventas
FROM clientes cl
JOIN ventas v ON cl.cliente_id = v.cliente_id
GROUP BY cl.cliente_id, cl.nombre
HAVING COUNT(v.venta_id) > 2
ORDER BY num_ventas DESC;

-- Consulta 15: Detalle completo de la venta con el monto mas alto
SELECT dv.*
FROM detalle_ventas dv
WHERE dv.venta_id = (
    SELECT venta_id FROM ventas ORDER BY total DESC LIMIT 1
);

-- Consulta 16: Empleados que han registrado tanto ventas como compras
SELECT empleado_id, nombre, cargo
FROM empleados
WHERE empleado_id IN (SELECT empleado_id FROM ventas)
  AND empleado_id IN (SELECT empleado_id FROM compras);

-- Consulta 17: Productos que forman parte de algun equipo ensamblado 
SELECT producto_id, nombre, precio_venta
FROM productos
WHERE producto_id IN (
    SELECT DISTINCT producto_id FROM equipo_componentes
);

-- Consulta 18: Costo total de servicios tecnicos por equipo ensamblado
SELECT ee.equipo_id, ee.nombre_equipo, costos.total_servicios
FROM equipos_ensamblados ee
JOIN (
    SELECT equipo_id, SUM(costo) AS total_servicios
    FROM equipo_servicios
    GROUP BY equipo_id
) AS costos ON ee.equipo_id = costos.equipo_id
ORDER BY costos.total_servicios DESC;

-- Consulta 19: Marca con la mayor cantidad de productos registrados
SELECT m.marca_id, m.nombre, conteo.total_productos
FROM marcas m
JOIN (
    SELECT marca_id, COUNT(*) AS total_productos
    FROM productos
    GROUP BY marca_id
) AS conteo ON m.marca_id = conteo.marca_id
ORDER BY conteo.total_productos DESC
LIMIT 1;

-- Consulta 20: Clientes cuyo gasto total supera el gasto promedio de todos los clientes
SELECT cl.cliente_id, cl.nombre, SUM(v.total) AS gasto_total
FROM clientes cl
JOIN ventas v ON cl.cliente_id = v.cliente_id
GROUP BY cl.cliente_id, cl.nombre
HAVING SUM(v.total) > (
    SELECT AVG(total_cliente)
    FROM (
        SELECT SUM(total) AS total_cliente
        FROM ventas
        GROUP BY cliente_id
    ) AS sub
)
ORDER BY gasto_total DESC;