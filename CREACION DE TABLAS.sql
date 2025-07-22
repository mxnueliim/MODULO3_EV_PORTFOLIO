CREATE DATABASE gestion_inventario;
USE gestion_inventario;

CREATE TABLE productos (
  id_producto INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  descripcion TEXT,
  precio DECIMAL(10, 2) CHECK (precio > 0),
  cantidad_inventario INT DEFAULT 0 CHECK (cantidad_inventario >= 0)
);

CREATE TABLE proveedores (
  id_proveedor INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  direccion VARCHAR(150),
  telefono VARCHAR(20),
  email VARCHAR(100)
);

CREATE TABLE transacciones (
  id_transaccion INT AUTO_INCREMENT PRIMARY KEY,
  tipo ENUM('compra', 'venta') NOT NULL,
  fecha DATE NOT NULL,
  cantidad INT CHECK (cantidad > 0),
  id_producto INT,
  id_proveedor INT,
  FOREIGN KEY (id_producto) REFERENCES productos(id_producto)
    ON DELETE CASCADE,
  FOREIGN KEY (id_proveedor) REFERENCES proveedores(id_proveedor)
    ON DELETE SET NULL
);

INSERT INTO proveedores (nombre, direccion, telefono, email) VALUES
('TechGlobal Ltda', 'Av. Apoquindo 1234, Las Condes', '229876543', 'ventas@techglobal.cl'),
('Distribuciones Andes', 'Calle Los Leones 456, Providencia', '223456789', 'contacto@andesdistrib.cl'),
('ElectroSur', 'Camino del Inca 987, Ñuñoa', '227654321', 'ventas@electrosur.cl');

INSERT INTO productos (nombre, descripcion, precio, cantidad_inventario) VALUES
('Notebook Lenovo Ideapad', '14" FHD, Intel i5, 8GB RAM, 512GB SSD', 550000, 10),
('Mouse Logitech M170', 'Mouse inalámbrico USB', 15000, 50),
('Monitor LG 24"', 'LED Full HD, HDMI/VGA', 120000, 15),
('Teclado Mecánico Redragon', 'RGB, switches Outemu Blue', 45000, 30),
('Disco Duro Externo 1TB', 'USB 3.0, portátil', 80000, 20);

-- Compras (tipo = 'compra')
INSERT INTO transacciones (tipo, fecha, cantidad, id_producto, id_proveedor) VALUES
('compra', '2025-07-01', 20, 1, 1),  -- 20 notebooks Lenovo comprados a TechGlobal
('compra', '2025-07-03', 100, 2, 2), -- 100 mouses Logitech comprados a Andes
('compra', '2025-07-05', 25, 3, 1),  -- 25 monitores LG comprados a TechGlobal
('compra', '2025-07-07', 50, 4, 3),  -- 50 teclados Redragon comprados a ElectroSur
('compra', '2025-07-09', 40, 5, 3);  -- 40 discos duros comprados a ElectroSur

-- Ventas (tipo = 'venta')
INSERT INTO transacciones (tipo, fecha, cantidad, id_producto, id_proveedor) VALUES
('venta', '2025-07-10', 5, 1, NULL), -- venta de 5 notebooks
('venta', '2025-07-11', 10, 2, NULL),
('venta', '2025-07-12', 3, 3, NULL),
('venta', '2025-07-13', 8, 4, NULL),
('venta', '2025-07-14', 6, 5, NULL);
