CREATE INDEX idx_nombre_cliente ON clientes(nombre_cliente);

EXPLAIN ANALYZE SELECT * FROM clientes WHERE nombre_cliente = 'Juan Pérez';

CREATE INDEX idx_nombre_direccion ON clientes(nombre_cliente, direccion_cliente);


SELECT indexname, indexdef FROM pg_indexes WHERE tablename = 'clientes';


DROP INDEX IF EXISTS idx_nombre_cliente;
EXPLAIN ANALYZE SELECT * FROM clientes WHERE nombre_cliente = 'Juan Pérez';
