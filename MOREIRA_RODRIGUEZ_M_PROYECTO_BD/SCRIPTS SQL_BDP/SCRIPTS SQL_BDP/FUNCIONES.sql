USE LEJOS_TECH;

DELIMITER $$

-- 1. Antigüedad en años de un empleado (según fecha_ingreso)
CREATE FUNCTION fn_antiguedad_empleado(p_empleado_id INT)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE v_anios INT;
    SELECT TIMESTAMPDIFF(YEAR, fecha_ingreso, CURDATE())
    INTO v_anios
    FROM empleados
    WHERE empleado_id = p_empleado_id;
    RETURN IFNULL(v_anios, 0);
END$$

-- 2. Stock disponible de un producto
CREATE FUNCTION fn_stock_disponible(p_producto_id INT)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE v_stock INT;
    SELECT stock INTO v_stock
    FROM productos
    WHERE producto_id = p_producto_id;
    RETURN IFNULL(v_stock, 0);
END$$

-- 3. Total histórico comprado por un cliente (suma de ventas.total)
CREATE FUNCTION fn_total_compras_cliente(p_cliente_id INT)
RETURNS DECIMAL(12,2)
DETERMINISTIC
BEGIN
    DECLARE v_total DECIMAL(12,2);
    SELECT IFNULL(SUM(total), 0) INTO v_total
    FROM ventas
    WHERE cliente_id = p_cliente_id;
    RETURN v_total;
END$$

-- 4. Total histórico comprado a un proveedor (suma de compras.total)
CREATE FUNCTION fn_total_compras_proveedor(p_proveedor_id INT)
RETURNS DECIMAL(12,2)
DETERMINISTIC
BEGIN
    DECLARE v_total DECIMAL(12,2);
    SELECT IFNULL(SUM(total), 0) INTO v_total
    FROM compras
    WHERE proveedor_id = p_proveedor_id;
    RETURN v_total;
END$$

-- 5. Precio de un producto con IVA aplicado (tasa en porcentaje, ej. 15)
CREATE FUNCTION fn_precio_con_iva(p_producto_id INT, p_tasa_iva DECIMAL(5,2))
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE v_precio DECIMAL(10,2);
    SELECT precio_venta INTO v_precio
    FROM productos
    WHERE producto_id = p_producto_id;
    RETURN ROUND(IFNULL(v_precio, 0) * (1 + p_tasa_iva / 100), 2);
END$$

-- 6. Margen de ganancia (%) de un producto
CREATE FUNCTION fn_margen_ganancia(p_producto_id INT)
RETURNS DECIMAL(6,2)
DETERMINISTIC
BEGIN
    DECLARE v_compra DECIMAL(10,2);
    DECLARE v_venta DECIMAL(10,2);
    SELECT precio_compra, precio_venta INTO v_compra, v_venta
    FROM productos
    WHERE producto_id = p_producto_id;

    IF v_compra IS NULL OR v_compra = 0 THEN
        RETURN 0;
    END IF;

    RETURN ROUND(((v_venta - v_compra) / v_compra) * 100, 2);
END$$

-- 7. Nombre completo del producto con su marca (para reportes)
CREATE FUNCTION fn_nombre_producto_marca(p_producto_id INT)
RETURNS VARCHAR(200)
DETERMINISTIC
BEGIN
    DECLARE v_resultado VARCHAR(200);
    SELECT CONCAT(p.nombre, ' - ', m.nombre)
    INTO v_resultado
    FROM productos p
    JOIN marcas m ON p.marca_id = m.marca_id
    WHERE p.producto_id = p_producto_id;
    RETURN v_resultado;
END$$

-- 8. Número de equipos ensamblados que tiene un cliente
CREATE FUNCTION fn_total_equipos_cliente(p_cliente_id INT)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE v_total INT;
    SELECT COUNT(*) INTO v_total
    FROM equipos_ensamblados
    WHERE cliente_id = p_cliente_id;
    RETURN v_total;
END$$

-- 9. Costo total de servicios aplicados a un equipo ensamblado
CREATE FUNCTION fn_costo_servicios_equipo(p_equipo_id INT)
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE v_total DECIMAL(10,2);
    SELECT IFNULL(SUM(costo), 0) INTO v_total
    FROM equipo_servicios
    WHERE equipo_id = p_equipo_id;
    RETURN v_total;
END$$

-- 10. Clasificación textual del nivel de stock de un producto
CREATE FUNCTION fn_clasificar_stock(p_producto_id INT)
RETURNS VARCHAR(10)
DETERMINISTIC
BEGIN
    DECLARE v_stock INT;
    SELECT stock INTO v_stock FROM productos WHERE producto_id = p_producto_id;

    IF v_stock IS NULL THEN
        RETURN 'N/A';
    ELSEIF v_stock <= 10 THEN
        RETURN 'Bajo';
    ELSEIF v_stock <= 50 THEN
        RETURN 'Medio';
    ELSE
        RETURN 'Alto';
    END IF;
END$$

DELIMITER ;