-- Clientes
INSERT INTO clientes (nombre_cliente, direccion_cliente) VALUES
('Juan Pérez', 'Av. Siempre Viva 123'),
('Ana Torres', 'Calle Luna 45'),
('Carlos Díaz', 'Calle Sol 78');

-- Categorías
INSERT INTO categorias (nombre_categoria) VALUES
('Electrónica'),
('Ropa'),
('Alimentos');

-- Productos
INSERT INTO productos (nombre_producto, categoria_id) VALUES
('Televisor', 1),
('Camisa', 2),
('Pan', 3);

-- Ventas
INSERT INTO ventas (cliente_id, producto_id, cantidad) VALUES
(1, 1, 2),
(2, 2, 1),
(1, 3, 5);
