-- Tabla de clientes
CREATE TABLE clientes (
    cliente_id SERIAL PRIMARY KEY,
    nombre_cliente VARCHAR(100),
    direccion_cliente VARCHAR(255)
);

-- Tabla de productos
CREATE TABLE productos (
    producto_id SERIAL PRIMARY KEY,
    nombre_producto VARCHAR(100),
    categoria_id INT
);

-- Tabla de ventas
CREATE TABLE ventas (
    venta_id SERIAL PRIMARY KEY,
    cliente_id INT REFERENCES clientes(cliente_id),
    producto_id INT REFERENCES productos(producto_id),
    cantidad INT
);

-- Tabla de categorías
CREATE TABLE categorias (
    categoria_id SERIAL PRIMARY KEY,
    nombre_categoria VARCHAR(100)
);-- Tabla de clientes
CREATE TABLE clientes (
    cliente_id SERIAL PRIMARY KEY,
    nombre_cliente VARCHAR(100),
    direccion_cliente VARCHAR(255)
);

-- Tabla de productos
CREATE TABLE productos (
    producto_id SERIAL PRIMARY KEY,
    nombre_producto VARCHAR(100),
    categoria_id INT
);

-- Tabla de ventas
CREATE TABLE ventas (
    venta_id SERIAL PRIMARY KEY,
    cliente_id INT REFERENCES clientes(cliente_id),
    producto_id INT REFERENCES productos(producto_id),
    cantidad INT
);

-- Tabla de categorías
CREATE TABLE categorias (
    categoria_id SERIAL PRIMARY KEY,
    nombre_categoria VARCHAR(100)
);