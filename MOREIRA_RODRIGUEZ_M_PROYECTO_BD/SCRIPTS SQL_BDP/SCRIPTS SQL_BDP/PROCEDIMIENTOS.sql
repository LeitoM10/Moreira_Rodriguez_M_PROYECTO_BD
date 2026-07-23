DELIMITER $$

-- 1. Registrar el encabezado de una venta 
CREATE PROCEDURE sp_registrar_venta(
    IN p_fecha DATE,
    IN p_cliente_id INT,
    IN p_empleado_id INT,
    OUT p_venta_id INT
)
BEGIN
    INSERT INTO ventas (fecha, cliente_id, empleado_id, total)
    VALUES (p_fecha, p_cliente_id, p_empleado_id, 0);
    SET p_venta_id = LAST_INSERT_ID();
END$$

-- 2. Registrar una línea de detalle de venta
CREATE PROCEDURE sp_registrar_detalle_venta(
    IN p_venta_id INT,
    IN p_producto_id INT,
    IN p_cantidad INT
)
BEGIN
    DECLARE v_precio DECIMAL(10,2);
    DECLARE v_stock INT;

    SELECT precio_venta, stock INTO v_precio, v_stock
    FROM productos WHERE producto_id = p_producto_id;

    IF v_stock < p_cantidad THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Stock insuficiente para registrar la venta';
    ELSE
        INSERT INTO detalle_ventas (venta_id, producto_id, precio_unitario, cantidad, subtotal)
        VALUES (p_venta_id, p_producto_id, v_precio, p_cantidad, v_precio * p_cantidad);
    END IF;
END$$

-- 3. Registrar el encabezado de una compra
CREATE PROCEDURE sp_registrar_compra(
    IN p_fecha DATE,
    IN p_proveedor_id INT,
    IN p_empleado_id INT,
    OUT p_compra_id INT
)
BEGIN
    INSERT INTO compras (fecha, proveedor_id, empleado_id, total)
    VALUES (p_fecha, p_proveedor_id, p_empleado_id, 0);
    SET p_compra_id = LAST_INSERT_ID();
END$$

-- 4. Registrar una línea de detalle de compra
CREATE PROCEDURE sp_registrar_detalle_compra(
    IN p_compra_id INT,
    IN p_producto_id INT,
    IN p_precio_unitario DECIMAL(10,2),
    IN p_cantidad INT
)
BEGIN
    INSERT INTO detalle_compras (compra_id, producto_id, precio_unitario, cantidad, subtotal)
    VALUES (p_compra_id, p_producto_id, p_precio_unitario, p_cantidad, p_precio_unitario * p_cantidad);
END$$

-- 5. Actualizar el precio de venta de un producto, validando margen mínimo
CREATE PROCEDURE sp_actualizar_precio_venta(
    IN p_producto_id INT,
    IN p_nuevo_precio DECIMAL(10,2)
)
BEGIN
    DECLARE v_precio_compra DECIMAL(10,2);
    SELECT precio_compra INTO v_precio_compra
    FROM productos WHERE producto_id = p_producto_id;

    IF p_nuevo_precio <= v_precio_compra THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El precio de venta debe ser mayor al precio de compra';
    ELSE
        UPDATE productos
        SET precio_venta = p_nuevo_precio
        WHERE producto_id = p_producto_id;
    END IF;
END$$

-- 6. Reporte de ventas realizadas por un empleado en un rango de fechas
CREATE PROCEDURE sp_reporte_ventas_empleado(
    IN p_empleado_id INT,
    IN p_fecha_inicio DATE,
    IN p_fecha_fin DATE
)
BEGIN
    SELECT v.venta_id, v.fecha, c.nombre AS cliente, v.total
    FROM ventas v
    JOIN clientes c ON v.cliente_id = c.cliente_id
    WHERE v.empleado_id = p_empleado_id
      AND v.fecha BETWEEN p_fecha_inicio AND p_fecha_fin
    ORDER BY v.fecha;
END$$

-- 7. Reporte de productos con stock igual o por debajo de un umbral
CREATE PROCEDURE sp_productos_bajo_stock(
    IN p_umbral INT
)
BEGIN
    SELECT producto_id, nombre, stock
    FROM productos
    WHERE stock <= p_umbral
    ORDER BY stock ASC;
END$$

-- 8. Registrar un nuevo equipo ensamblado (precio_total inicia en 0

CREATE PROCEDURE sp_registrar_equipo_ensamblado(
    IN p_nombre_equipo VARCHAR(150),
    IN p_cliente_id INT,
    IN p_empleado_id INT,
    IN p_fecha_ensamble DATE,
    OUT p_equipo_id INT
)
BEGIN
    INSERT INTO equipos_ensamblados (nombre_equipo, cliente_id, precio_total, fecha_ensamble, empleado_id)
    VALUES (p_nombre_equipo, p_cliente_id, 0, p_fecha_ensamble, p_empleado_id);
    SET p_equipo_id = LAST_INSERT_ID();
END$$

-- 9. Agregar un componente (producto) a un equipo ensamblado
CREATE PROCEDURE sp_agregar_componente_equipo(
    IN p_equipo_id INT,
    IN p_producto_id INT
)
BEGIN
    INSERT INTO equipo_componentes (equipo_id, producto_id)
    VALUES (p_equipo_id, p_producto_id);
END$$

-- 10. Reporte de los N clientes con mayor monto total comprado
CREATE PROCEDURE sp_top_clientes(
    IN p_limite INT
)
BEGIN
    SELECT c.cliente_id, c.nombre, SUM(v.total) AS total_comprado
    FROM clientes c
    JOIN ventas v ON c.cliente_id = v.cliente_id
    GROUP BY c.cliente_id, c.nombre
    ORDER BY total_comprado DESC
    LIMIT p_limite;
END$$

DELIMITER ;