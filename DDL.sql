CREATE TABLE proveedores (
  id_proveedor INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  direccion VARCHAR(150),
  telefono VARCHAR(20),
  email VARCHAR(100)
);

ALTER TABLE productos ADD COLUMN stock_minimo INT DEFAULT 5;