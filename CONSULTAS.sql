-- Todos los productos disponibles
SELECT * FROM productos WHERE cantidad_inventario > 0;

-- Proveedores que suministran un producto específico (id_producto = 1)
SELECT DISTINCT p.nombre 
FROM proveedores p
JOIN transacciones t ON p.id_proveedor = t.id_proveedor
WHERE t.id_producto = 1;

-- Transacciones en una fecha específica
SELECT * FROM transacciones WHERE fecha = '2025-07-07';

-- Total de productos vendidos
SELECT SUM(cantidad) AS total_vendidos_venta 
FROM transacciones 
WHERE tipo = 'venta';

-- Valor total de compras
SELECT SUM(p.precio * t.cantidad) AS total_compras
FROM transacciones t
JOIN productos p ON t.id_producto = p.id_producto
WHERE t.tipo = 'compra';

-- Total de ventas de un producto en el mes anterior
SELECT SUM(t.cantidad) AS total_vendido
FROM transacciones t
WHERE t.tipo = 'venta'
  AND t.id_producto = 1
  AND MONTH(t.fecha) = MONTH(CURDATE());

-- Productos con información de proveedor y transacción
SELECT p.nombre, pr.nombre AS proveedor, t.tipo, t.fecha
FROM productos p
JOIN transacciones t ON p.id_producto = t.id_producto
LEFT JOIN proveedores pr ON t.id_proveedor = pr.id_proveedor;

-- Productos que no se han vendido en el último mes
SELECT * FROM productos 
WHERE id_producto NOT IN (
  SELECT id_producto FROM transacciones 
  WHERE tipo = 'venta' AND fecha >= CURDATE() - INTERVAL 1 MONTH
);


