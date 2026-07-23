START TRANSACTION;

    -- 1. Encabezado de la venta (total arranca en 0, se recalcula solo)
    INSERT INTO ventas (fecha, cliente_id, empleado_id, total)
    VALUES (CURDATE(), 12, 5, 0);

    SET @venta_id = LAST_INSERT_ID();

    -- 2. Primero se leen los precios a variables (SELECT...INTO),
    --    NO dentro del INSERT
    SELECT precio_venta INTO @precio_10 FROM productos WHERE producto_id = 10;
    SELECT precio_venta INTO @precio_25 FROM productos WHERE producto_id = 25;

    -- 3. Ahora sí, INSERT con VALUES (ya no toca productos en el
    --    mismo statement)
    INSERT INTO detalle_ventas (venta_id, producto_id, precio_unitario, cantidad, subtotal)
    VALUES (@venta_id, 10, @precio_10, 2, @precio_10 * 2);

    INSERT INTO detalle_ventas (venta_id, producto_id, precio_unitario, cantidad, subtotal)
    VALUES (@venta_id, 25, @precio_25, 1, @precio_25 * 1);

COMMIT;


-- =====================================================================
-- TRANSACCIÓN 2: Registrar una compra completa (encabezado + detalles)
-- =====================================================================
START TRANSACTION;

    INSERT INTO compras (fecha, proveedor_id, empleado_id, total)
    VALUES (CURDATE(), 8, 3, 0);

    SET @compra_id = LAST_INSERT_ID();

    INSERT INTO detalle_compras (compra_id, producto_id, precio_unitario, cantidad, subtotal)
    VALUES (@compra_id, 10, 44.93, 20, 44.93 * 20);

    INSERT INTO detalle_compras (compra_id, producto_id, precio_unitario, cantidad, subtotal)
    VALUES (@compra_id, 25, 513.71, 10, 513.71 * 10);

COMMIT;


-- =====================================================================
-- TRANSACCIÓN 3: Registrar un equipo ensamblado con sus componentes
-- y servicios (precio_total se recalcula solo vía triggers)
-- =====================================================================
START TRANSACTION;

    INSERT INTO equipos_ensamblados (nombre_equipo, cliente_id, precio_total, fecha_ensamble, empleado_id)
    VALUES ('PC Gamer / Oficina #53', 20, 0, CURDATE(), 15);

    SET @equipo_id = LAST_INSERT_ID();

    INSERT INTO equipo_componentes (equipo_id, producto_id) VALUES (@equipo_id, 4);
    INSERT INTO equipo_componentes (equipo_id, producto_id) VALUES (@equipo_id, 17);
    INSERT INTO equipo_componentes (equipo_id, producto_id) VALUES (@equipo_id, 21);

    INSERT INTO equipo_servicios (equipo_id, empleado_id, fecha_servicio, costo, descripcion)
    VALUES (@equipo_id, 15, CURDATE(), 25.00, 'Ensamblaje e instalacion de sistema operativo');

COMMIT;


-- =====================================================================
-- TRANSACCIÓN 4: Actualizar el precio de venta de un producto
-- (respeta trg_before_insert_producto solo aplica en INSERT; para
-- UPDATE se recomienda validar en la misma transacción)
-- =====================================================================
START TRANSACTION;

    SET @precio_compra = (SELECT precio_compra FROM productos WHERE producto_id = 15);

    -- Solo actualiza si el nuevo precio queda por encima del de compra
    UPDATE productos
    SET precio_venta = GREATEST(@precio_compra * 1.30, precio_venta)
    WHERE producto_id = 15;

COMMIT;


-- =====================================================================
-- TRANSACCIÓN 5: Eliminar un cliente de forma segura
-- (trg_before_delete_cliente bloquea el DELETE si tiene ventas; aquí
-- se revisa primero para no depender del error del trigger)
-- =====================================================================
START TRANSACTION;

    SET @tiene_ventas = (SELECT COUNT(*) FROM ventas WHERE cliente_id = 99);

    DELETE FROM clientes
    WHERE cliente_id = 99
      AND @tiene_ventas = 0;

COMMIT;

DELIMITER $$

CREATE PROCEDURE sp_registrar_venta_transaccional(
    IN p_cliente_id INT,
    IN p_empleado_id INT,
    IN p_producto_id INT,
    IN p_cantidad INT,
    OUT p_resultado VARCHAR(100)
)
BEGIN
    DECLARE v_precio DECIMAL(10,2);
    DECLARE v_venta_id INT;

    -- Si algo falla dentro de la transacción, se hace ROLLBACK
    -- y se devuelve un mensaje en vez de romper la ejecución
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SET p_resultado = 'Error: no se pudo registrar la venta (revisar stock/datos)';
    END;

    START TRANSACTION;

        SELECT precio_venta INTO v_precio
        FROM productos WHERE producto_id = p_producto_id;

        INSERT INTO ventas (fecha, cliente_id, empleado_id, total)
        VALUES (CURDATE(), p_cliente_id, p_empleado_id, 0);

        SET v_venta_id = LAST_INSERT_ID();

        INSERT INTO detalle_ventas (venta_id, producto_id, precio_unitario, cantidad, subtotal)
        VALUES (v_venta_id, p_producto_id, v_precio, p_cantidad, v_precio * p_cantidad);

    COMMIT;

    SET p_resultado = 'Venta registrada correctamente';
END$$

DELIMITER ;


-- 1. Ver el encabezado de la última venta registrada
SELECT * FROM ventas
ORDER BY venta_id DESC
LIMIT 1;

-- 2. Ver los detalles de esa venta 
SELECT * FROM detalle_ventas
WHERE venta_id = @venta_id;   

-- 3. Ver el stock actualizado de los productos vendidos
SELECT producto_id, nombre, stock
FROM productos
WHERE producto_id IN (10, 25);

-- 4. Ver el registro de auditoría (cambios de stock/precio_venta)
SELECT * FROM auditoria_productos
ORDER BY auditoria_id DESC
LIMIT 10;

-- 5. Todo junto en una sola consulta: venta + detalle + producto
SELECT
    v.venta_id,
    v.fecha,
    v.total,
    dv.producto_id,
    p.nombre,
    dv.precio_unitario,
    dv.cantidad,
    dv.subtotal,
    p.stock AS stock_actual
FROM ventas v
JOIN detalle_ventas dv ON v.venta_id = dv.venta_id
JOIN productos p ON dv.producto_id = p.producto_id
WHERE v.venta_id = (SELECT MAX(venta_id) FROM ventas);