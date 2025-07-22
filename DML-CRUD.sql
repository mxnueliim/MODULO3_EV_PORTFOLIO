-- Insertar un producto
INSERT INTO productos (nombre, descripcion, precio, cantidad_inventario)
VALUES ('Laptop', '14 pulgadas, 8GB RAM', 450000, 10);

-- Transacciones en una fecha específica
SELECT * FROM transacciones WHERE fecha = '2025-07-07';

-- Actualizar inventario tras una venta
UPDATE productos
SET cantidad_inventario = cantidad_inventario - 2
WHERE id_producto = 1;

-- Eliminar un producto
DELETE FROM productos WHERE id_producto = 3;