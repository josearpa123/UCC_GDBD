SELECT c.nombre_cliente, p.nombre_producto, v.cantidad
FROM clientes c
INNER JOIN ventas v ON c.cliente_id = v.cliente_id
INNER JOIN productos p ON v.producto_id = p.producto_id;



SELECT c.nombre_cliente, p.nombre_producto, v.cantidad
FROM clientes c
LEFT JOIN ventas v ON c.cliente_id = v.cliente_id
LEFT JOIN productos p ON v.producto_id = p.producto_id;


SELECT c.nombre_cliente, p.nombre_producto, v.cantidad
FROM clientes c
RIGHT JOIN ventas v ON c.cliente_id = v.cliente_id
RIGHT JOIN productos p ON v.producto_id = p.producto_id;


SELECT c.nombre_cliente, v.venta_id
FROM clientes c
FULL OUTER JOIN ventas v ON c.cliente_id = v.cliente_id;


SELECT c.nombre_cliente, p.nombre_producto, v.cantidad
FROM clientes c
LEFT JOIN ventas v ON c.cliente_id = v.cliente_id
RIGHT JOIN productos p ON v.producto_id = p.producto_id
INNER JOIN categorias cat ON p.categoria_id = cat.categoria_id;
