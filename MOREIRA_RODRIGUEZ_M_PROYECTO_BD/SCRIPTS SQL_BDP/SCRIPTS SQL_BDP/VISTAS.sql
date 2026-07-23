-- ---------------------------------------------------------------------
-- Vista 1: vista_catalogo_productos
-- Catalogo de productos con su categoria, marca y proveedor
-- ---------------------------------------------------------------------
DROP VIEW IF EXISTS vista_catalogo_productos;
CREATE VIEW vista_catalogo_productos AS
SELECT p.producto_id,
       p.nombre AS producto,
       c.nombre AS categoria,
       m.nombre AS marca,
       pr.nombre AS proveedor,
       pr.telefono AS proveedor_telefono,
       p.precio_compra,
       p.precio_venta,
       p.stock
FROM productos p
JOIN categorias c   ON p.categoria_id = c.categoria_id
JOIN marcas m        ON p.marca_id = m.marca_id
JOIN proveedores pr  ON p.proveedor_id = pr.proveedor_id;

-- ---------------------------------------------------------------------
-- Vista 2: vista_historial_ventas
-- Historial de ventas con nombre de cliente y del empleado que atendio
-- ---------------------------------------------------------------------
DROP VIEW IF EXISTS vista_historial_ventas;
CREATE VIEW vista_historial_ventas AS
SELECT v.venta_id,
       v.fecha,
       cl.nombre AS cliente,
       cl.telefono AS cliente_telefono,
       e.nombre AS empleado,
       v.total
FROM ventas v
JOIN clientes cl  ON v.cliente_id = cl.cliente_id
JOIN empleados e  ON v.empleado_id = e.empleado_id;

-- ---------------------------------------------------------------------
-- Vista 3: vista_detalle_ventas_completo
-- Detalle de cada venta con el nombre del producto vendido
-- ---------------------------------------------------------------------
DROP VIEW IF EXISTS vista_detalle_ventas_completo;
CREATE VIEW vista_detalle_ventas_completo AS
SELECT dv.detalle_id,
       dv.venta_id,
       v.fecha,
       p.nombre AS producto,
       dv.precio_unitario,
       dv.cantidad,
       dv.subtotal
FROM detalle_ventas dv
JOIN ventas v     ON dv.venta_id = v.venta_id
JOIN productos p  ON dv.producto_id = p.producto_id;

-- ---------------------------------------------------------------------
-- Vista 4: vista_compras_proveedor
-- Compras realizadas con el nombre del proveedor y del empleado gestor
-- ---------------------------------------------------------------------
DROP VIEW IF EXISTS vista_compras_proveedor;
CREATE VIEW vista_compras_proveedor AS
SELECT c.compra_id,
       c.fecha,
       pr.nombre AS proveedor,
       e.nombre AS empleado,
       c.total
FROM compras c
JOIN proveedores pr  ON c.proveedor_id = pr.proveedor_id
JOIN empleados e     ON c.empleado_id = e.empleado_id;

-- ---------------------------------------------------------------------
-- Vista 5: vista_equipos_completos
-- Equipos ensamblados con cliente, empleado, cantidad de componentes
-- y costo total de servicios tecnicos aplicados
-- ---------------------------------------------------------------------
DROP VIEW IF EXISTS vista_equipos_completos;
CREATE VIEW vista_equipos_completos AS
SELECT ee.equipo_id,
       ee.nombre_equipo,
       cl.nombre AS cliente,
       e.nombre AS empleado_ensamblador,
       ee.fecha_ensamble,
       ee.precio_total,
       (SELECT COUNT(*) FROM equipo_componentes ec WHERE ec.equipo_id = ee.equipo_id) AS num_componentes,
       COALESCE((SELECT SUM(es.costo) FROM equipo_servicios es WHERE es.equipo_id = ee.equipo_id), 0) AS costo_servicios
FROM equipos_ensamblados ee
JOIN clientes cl  ON ee.cliente_id = cl.cliente_id
JOIN empleados e  ON ee.empleado_id = e.empleado_id;

