
-- Tabla de apoyo para el trigger de auditoría de stock (#7)
CREATE TABLE IF NOT EXISTS auditoria_stock (
    auditoria_id INT AUTO_INCREMENT PRIMARY KEY,
    producto_id INT NOT NULL,
    stock_anterior INT NOT NULL,
    stock_nuevo INT NOT NULL,
    fecha_cambio DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (producto_id) REFERENCES productos(producto_id)
);

DELIMITER $$

-- 1. Antes de insertar un detalle de venta: valida que haya stock suficiente
CREATE TRIGGER trg_before_insert_detalle_venta
BEFORE INSERT ON detalle_ventas
FOR EACH ROW
BEGIN
    DECLARE v_stock INT;
    SELECT stock INTO v_stock FROM productos WHERE producto_id = NEW.producto_id;
    IF v_stock < NEW.cantidad THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Stock insuficiente para esta venta';
    END IF;
END$$

-- 2. Después de insertar un detalle de venta: descuenta stock y
--    actualiza el total de la venta
CREATE TRIGGER trg_after_insert_detalle_venta
AFTER INSERT ON detalle_ventas
FOR EACH ROW
BEGIN
    UPDATE productos
    SET stock = stock - NEW.cantidad
    WHERE producto_id = NEW.producto_id;

    UPDATE ventas
    SET total = (SELECT IFNULL(SUM(subtotal), 0) FROM detalle_ventas WHERE venta_id = NEW.venta_id)
    WHERE venta_id = NEW.venta_id;
END$$

-- 3. Después de eliminar un detalle de venta: repone stock y
--    actualiza el total de la venta
CREATE TRIGGER trg_after_delete_detalle_venta
AFTER DELETE ON detalle_ventas
FOR EACH ROW
BEGIN
    UPDATE productos
    SET stock = stock + OLD.cantidad
    WHERE producto_id = OLD.producto_id;

    UPDATE ventas
    SET total = (SELECT IFNULL(SUM(subtotal), 0) FROM detalle_ventas WHERE venta_id = OLD.venta_id)
    WHERE venta_id = OLD.venta_id;
END$$

-- 4. Después de insertar un detalle de compra: incrementa stock y
--    actualiza el total de la compra
CREATE TRIGGER trg_after_insert_detalle_compra
AFTER INSERT ON detalle_compras
FOR EACH ROW
BEGIN
    UPDATE productos
    SET stock = stock + NEW.cantidad
    WHERE producto_id = NEW.producto_id;

    UPDATE compras
    SET total = (SELECT IFNULL(SUM(subtotal), 0) FROM detalle_compras WHERE compra_id = NEW.compra_id)
    WHERE compra_id = NEW.compra_id;
END$$

-- 5. Después de eliminar un detalle de compra: descuenta stock y
--    actualiza el total de la compra
CREATE TRIGGER trg_after_delete_detalle_compra
AFTER DELETE ON detalle_compras
FOR EACH ROW
BEGIN
    UPDATE productos
    SET stock = stock - OLD.cantidad
    WHERE producto_id = OLD.producto_id;

    UPDATE compras
    SET total = (SELECT IFNULL(SUM(subtotal), 0) FROM detalle_compras WHERE compra_id = OLD.compra_id)
    WHERE compra_id = OLD.compra_id;
END$$

-- 6. Antes de insertar un producto: valida que precio_venta > precio_compra
CREATE TRIGGER trg_before_insert_producto
BEFORE INSERT ON productos
FOR EACH ROW
BEGIN
    IF NEW.precio_venta <= NEW.precio_compra THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El precio de venta debe ser mayor al precio de compra';
    END IF;
END$$

-- 7. Después de actualizar el stock de un producto: registra el cambio
--    en la tabla de auditoría
CREATE TRIGGER trg_after_update_stock_producto
AFTER UPDATE ON productos
FOR EACH ROW
BEGIN
    IF OLD.stock <> NEW.stock THEN
        INSERT INTO auditoria_stock (producto_id, stock_anterior, stock_nuevo)
        VALUES (NEW.producto_id, OLD.stock, NEW.stock);
    END IF;
END$$

-- 8. Antes de eliminar un cliente: impide la eliminación si tiene
--    ventas registradas (regla de integridad de negocio)
CREATE TRIGGER trg_before_delete_cliente
BEFORE DELETE ON clientes
FOR EACH ROW
BEGIN
    DECLARE v_cuenta INT;
    SELECT COUNT(*) INTO v_cuenta FROM ventas WHERE cliente_id = OLD.cliente_id;
    IF v_cuenta > 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'No se puede eliminar un cliente con ventas registradas';
    END IF;
END$$

-- 9. Después de insertar un componente en un equipo ensamblado:
--    suma el precio_venta del producto al precio_total del equipo
CREATE TRIGGER trg_after_insert_equipo_componente
AFTER INSERT ON equipo_componentes
FOR EACH ROW
BEGIN
    DECLARE v_precio DECIMAL(10,2);
    SELECT precio_venta INTO v_precio FROM productos WHERE producto_id = NEW.producto_id;

    UPDATE equipos_ensamblados
    SET precio_total = precio_total + IFNULL(v_precio, 0)
    WHERE equipo_id = NEW.equipo_id;
END$$

-- 10. Después de insertar un servicio en un equipo ensamblado:
--     suma el costo del servicio al precio_total del equipo
CREATE TRIGGER trg_after_insert_equipo_servicio
AFTER INSERT ON equipo_servicios
FOR EACH ROW
BEGIN
    UPDATE equipos_ensamblados
    SET precio_total = precio_total + NEW.costo
    WHERE equipo_id = NEW.equipo_id;
END$$

DELIMITER ;

-- Tabla de auditoría
CREATE TABLE IF NOT EXISTS auditoria_productos (
    auditoria_id INT AUTO_INCREMENT PRIMARY KEY,
    producto_id INT NOT NULL,
    campo_modificado VARCHAR(30) NOT NULL,
    valor_anterior VARCHAR(50) NOT NULL,
    valor_nuevo VARCHAR(50) NOT NULL,
    usuario_bd VARCHAR(100) NOT NULL,
    fecha_cambio DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (producto_id) REFERENCES productos(producto_id)
);

DELIMITER $$
 
-- Trigger: después de actualizar un producto, registra en la
-- auditoría cualquier cambio en stock o precio_venta
CREATE TRIGGER trg_auditoria_productos
AFTER UPDATE ON productos
FOR EACH ROW
BEGIN
    IF OLD.stock <> NEW.stock THEN
        INSERT INTO auditoria_productos (producto_id, campo_modificado, valor_anterior, valor_nuevo, usuario_bd)
        VALUES (NEW.producto_id, 'stock', OLD.stock, NEW.stock, CURRENT_USER());
    END IF;
 
    IF OLD.precio_venta <> NEW.precio_venta THEN
        INSERT INTO auditoria_productos (producto_id, campo_modificado, valor_anterior, valor_nuevo, usuario_bd)
        VALUES (NEW.producto_id, 'precio_venta', OLD.precio_venta, NEW.precio_venta, CURRENT_USER());
    END IF;
END$$
 
DELIMITER ;

SHOW TRIGGERS;
