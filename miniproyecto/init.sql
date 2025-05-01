CREATE DATABASE banco;

\c banco;

CREATE ROLE generador_datos WITH LOGIN PASSWORD 'clave_segura';
GRANT CONNECT ON DATABASE banco TO generador_datos;
CREATE USER mi_usuario WITH PASSWORD 'mi_clave' IN ROLE generador_datos;

CREATE TABLE cuentas (
    id_cuenta SERIAL PRIMARY KEY,
    nombre_cliente VARCHAR(255),
    saldo DECIMAL
);

CREATE TABLE transacciones (
    id_transaccion SERIAL PRIMARY KEY,
    id_cuenta INTEGER,
    tipo_transaccion VARCHAR(10),
    monto DECIMAL,
    fecha_transaccion TIMESTAMP,
    FOREIGN KEY (id_cuenta) REFERENCES cuentas(id_cuenta)
);

GRANT INSERT ON TABLE cuentas TO generador_datos;
GRANT INSERT ON TABLE transacciones TO generador_datos;
