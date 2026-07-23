-- =====================================================================
-- 1. CREACION DE ROLES
-- =====================================================================

CREATE ROLE IF NOT EXISTS 'rol_administrador';
CREATE ROLE IF NOT EXISTS 'rol_gerente_ventas';
CREATE ROLE IF NOT EXISTS 'rol_contador';
CREATE ROLE IF NOT EXISTS 'rol_bodeguero';
CREATE ROLE IF NOT EXISTS 'rol_soporte_tecnico';

-- =====================================================================
-- 2. PERMISOS DE CADA ROL
-- =====================================================================

-- rol_administrador: control total sobre la base de datos
GRANT ALL PRIVILEGES ON * TO 'rol_administrador';

-- rol_gerente_ventas: gestiona ventas y consulta clientes/productos
GRANT SELECT, INSERT, UPDATE ON ventas          TO 'rol_gerente_ventas';
GRANT SELECT, INSERT, UPDATE ON detalle_ventas   TO 'rol_gerente_ventas';
GRANT SELECT                 ON clientes         TO 'rol_gerente_ventas';
GRANT SELECT                 ON productos        TO 'rol_gerente_ventas';
GRANT SELECT                 ON empleados        TO 'rol_gerente_ventas';

-- rol_contador: solo lectura sobre ventas, compras y montos financieros
GRANT SELECT ON ventas           TO 'rol_contador';
GRANT SELECT ON detalle_ventas   TO 'rol_contador';
GRANT SELECT ON compras          TO 'rol_contador';
GRANT SELECT ON detalle_compras  TO 'rol_contador';
GRANT SELECT ON empleados        TO 'rol_contador';
GRANT SELECT ON proveedores      TO 'rol_contador';

-- rol_bodeguero: gestiona inventario, productos y compras a proveedores
GRANT SELECT, UPDATE         ON productos        TO 'rol_bodeguero';
GRANT SELECT, INSERT, UPDATE ON compras          TO 'rol_bodeguero';
GRANT SELECT, INSERT, UPDATE ON detalle_compras  TO 'rol_bodeguero';
GRANT SELECT                 ON proveedores      TO 'rol_bodeguero';

-- rol_soporte_tecnico: gestiona ensamblaje de equipos y servicios tecnicos
GRANT SELECT, INSERT, UPDATE ON equipos_ensamblados TO 'rol_soporte_tecnico';
GRANT SELECT, INSERT, UPDATE ON equipo_componentes  TO 'rol_soporte_tecnico';
GRANT SELECT, INSERT, UPDATE ON equipo_servicios    TO 'rol_soporte_tecnico';
GRANT SELECT                 ON productos           TO 'rol_soporte_tecnico';
GRANT SELECT                 ON clientes            TO 'rol_soporte_tecnico';

-- =====================================================================
-- 3. CREACION DE 5 USUARIOS 
-- =====================================================================

CREATE USER IF NOT EXISTS 'pedro.quinde'@'%' IDENTIFIED BY 'Adm_2026*Lejos';

-- empleado_id 4 - Ximena Reyes - Gerente de Ventas
CREATE USER IF NOT EXISTS 'ximena.reyes'@'%' IDENTIFIED BY 'Vta_2026*Lejos';

-- empleado_id 5 - Miguel Cevallos - Contador
CREATE USER IF NOT EXISTS 'miguel.cevallos'@'%' IDENTIFIED BY 'Cnt_2026*Lejos';

-- empleado_id 7 - Gonzalo Ramirez - Bodeguero
CREATE USER IF NOT EXISTS 'gonzalo.ramirez'@'%' IDENTIFIED BY 'Bod_2026*Lejos';

-- empleado_id 3 - Gabriela Solis - Soporte Tecnico
CREATE USER IF NOT EXISTS 'gabriela.solis'@'%' IDENTIFIED BY 'Sop_2026*Lejos';

-- =====================================================================
-- 4. ASIGNACION DE ROLES A CADA USUARIO
-- =====================================================================

GRANT 'rol_administrador'  TO 'pedro.quinde'@'%';
GRANT 'rol_gerente_ventas' TO 'ximena.reyes'@'%';
GRANT 'rol_contador'       TO 'miguel.cevallos'@'%';
GRANT 'rol_bodeguero'      TO 'gonzalo.ramirez'@'%';
GRANT 'rol_soporte_tecnico' TO 'gabriela.solis'@'%';

-- Activar el rol por defecto al iniciar sesion (MySQL 8+)
SET DEFAULT ROLE 'rol_administrador'   TO 'pedro.quinde'@'%';
SET DEFAULT ROLE 'rol_gerente_ventas'  TO 'ximena.reyes'@'%';
SET DEFAULT ROLE 'rol_contador'        TO 'miguel.cevallos'@'%';
SET DEFAULT ROLE 'rol_bodeguero'       TO 'gonzalo.ramirez'@'%';
SET DEFAULT ROLE 'rol_soporte_tecnico' TO 'gabriela.solis'@'%';

FLUSH PRIVILEGES;

-- =====================================================================
-- 5. VERIFICACION (opcional, util al probar el script)
-- =====================================================================
SHOW GRANTS FOR 'pedro.quinde'@'%';
SHOW GRANTS FOR 'ximena.reyes'@'%';
SHOW GRANTS FOR 'miguel.cevallos'@'%';
SHOW GRANTS FOR 'gonzalo.ramirez'@'%';
SHOW GRANTS FOR 'gabriela.solis'@'%';


