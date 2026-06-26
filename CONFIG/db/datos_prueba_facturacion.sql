-- ============================================================
-- DATOS DE PRUEBA - Sistema Facturacion CJ (MySQL/MariaDB)
-- Compatible con el esquema de CONFIG/db/facturacion.sql
-- ============================================================

START TRANSACTION;

SET FOREIGN_KEY_CHECKS = 0;

-- Limpiar en orden para evitar conflictos de claves foraneas
TRUNCATE TABLE pagos;
TRUNCATE TABLE detalles_de_productos;
TRUNCATE TABLE facturas;
TRUNCATE TABLE stockproductos;
TRUNCATE TABLE productos;
TRUNCATE TABLE proveedor;
TRUNCATE TABLE clientes;
TRUNCATE TABLE usuarios;

SET FOREIGN_KEY_CHECKS = 1;

-- 1. CLIENTES
INSERT INTO clientes (`Nombre`, `Dirección`, `Teléfono`, `Correo electrónico`) VALUES
  ('Maria Garcia Lopez',      'Av. Los Pinos 145, Miraflores',     '987654321', 'maria.garcia@gmail.com'),
  ('Juan Carlos Perez',       'Jr. Huallaga 234, Cercado',         '976543210', 'juancarlos.perez@hotmail.com'),
  ('Rosa Elena Huanca',       'Calle Las Flores 89, San Borja',    '965432109', 'rosa.huanca@outlook.com'),
  ('Luis Alberto Quispe',     'Av. Arequipa 1200, Lince',          '954321098', 'luis.quispe@gmail.com'),
  ('Carmen Sofia Villanueva', 'Pasaje Los Cedros 12, Surco',       '943210987', 'carmen.villa@gmail.com'),
  ('Pedro Antonio Mamani',    'Av. Tupac Amaru 560, Comas',        '932109876', 'pedro.mamani@yahoo.com'),
  ('Ana Lucia Torres',        'Jr. Junin 78, Brena',               '921098765', 'ana.torres@gmail.com'),
  ('Roberto Ccallo Flores',   'Calle San Martin 305, Jesus Maria', '910987654', 'roberto.ccallo@gmail.com'),
  ('Giovanna Ramos Chavez',   'Av. Colonial 890, Pueblo Libre',    '999888777', 'giovanna.ramos@hotmail.com'),
  ('Marco Aurelio Diaz',      'Jr. Ucayali 44, Cercado',           '988777666', 'marco.diaz@gmail.com');

-- 2. PROVEEDORES
INSERT INTO proveedor (`proveedor`, `telefonoo`, `direccion`) VALUES
  ('Gloria S.A.',       987001122, 'Av. Argentina 3000, Callao'),
  ('Alicorp S.A.A.',    976002233, 'Av. Universitaria 2700, Lima'),
  ('Laive S.A.',        965003344, 'Calle Los Nogales 110, Lima'),
  ('Backus Johnston',   954004455, 'Av. Venezuela 2700, Lima'),
  ('San Fernando S.A.', 943005566, 'Av. Separadora Industrial 2, Ate');

-- 3. PRODUCTOS
-- Campo proveedor referencia al codigo de proveedor por convencion de la app
INSERT INTO productos (`Nombre`, `Descripción`, `Precio`, `proveedor`) VALUES
  ('Leche Gloria entera 1L',    'Leche evaporada entera en tarro',             4.50, 1),
  ('Arroz Costeno 1kg',         'Arroz extra calidad premium',                  3.80, 2),
  ('Aceite Primor 1L',          'Aceite vegetal de soya refinado',              9.90, 2),
  ('Azucar rubia 1kg',          'Azucar rubia de cana',                          3.20, 2),
  ('Fideos Don Vittorio 500g',  'Fideos tallarin especial',                     2.50, 2),
  ('Mantequilla Laive 100g',    'Mantequilla sin sal premium',                  5.80, 3),
  ('Yogurt Laive fresa 1L',     'Yogurt bebible de fresa',                      7.20, 3),
  ('Cerveza Cristal 650ml',     'Cerveza nacional botella retornable',          5.50, 4),
  ('Pollo entero x kg',         'Pollo fresco de granja por kilogramo',         8.90, 5),
  ('Huevos blancos x 30 unid.', 'Huevos frescos de granja',                    14.50, 5),
  ('Jabon Bolivar 230g',        'Jabon de lavar ropa',                          2.00, 2),
  ('Detergente Ariel 500g',     'Detergente en polvo para ropa',                8.50, 2);

-- 4. STOCK DE PRODUCTOS
INSERT INTO stockproductos (`IdProducto`, `CantidadEnStock`) VALUES
  (1,  150),
  (2,  200),
  (3,   80),
  (4,  120),
  (5,  180),
  (6,   60),
  (7,   90),
  (8,  100),
  (9,   50),
  (10,  70),
  (11, 200),
  (12, 110);

-- 5. FACTURAS (ultimas 2 semanas)
INSERT INTO facturas (`Fecha`, `Total`, `IdCliente`, `estatus`) VALUES
  ('2026-06-13',  47.60, 1, 1),
  ('2026-06-13',  32.80, 2, 1),
  ('2026-06-14',  89.00, 3, 1),
  ('2026-06-14',  21.50, 4, 1),
  ('2026-06-15', 115.20, 5, 1),
  ('2026-06-16',  58.40, 6, 1),
  ('2026-06-17',  43.00, 7, 1),
  ('2026-06-18',  76.50, 8, 1),
  ('2026-06-19',  99.80, 9, 1),
  ('2026-06-20',  34.20, 10, 1),
  ('2026-06-21',  62.70, 1, 1),
  ('2026-06-22',  88.10, 3, 1),
  ('2026-06-23',  45.00, 5, 1),
  ('2026-06-24', 130.50, 7, 1),
  ('2026-06-25',  55.90, 2, 1),
  ('2026-06-26',  72.00, 4, 1),
  ('2026-06-26',  38.50, 6, 1),
  ('2026-06-26',  91.20, 8, 1);

-- 6. DETALLES DE PRODUCTOS (lineas de cada factura)
INSERT INTO detalles_de_productos (`IdFactura`, `IdProducto`, `Cantidad`, `Precio_unitario`) VALUES
  -- Factura 1
  (1, 1, 4,  4.50),
  (1, 2, 2,  3.80),
  (1, 5, 3,  2.50),
  -- Factura 2
  (2, 4, 3,  3.20),
  (2, 11,5,  2.00),
  (2, 6, 1,  5.80),
  -- Factura 3
  (3, 9, 5,  8.90),
  (3, 10,1, 14.50),
  (3, 1, 3,  4.50),
  -- Factura 4
  (4, 2, 2,  3.80),
  (4, 3, 1,  9.90),
  -- Factura 5
  (5, 8, 6,  5.50),
  (5, 9, 4,  8.90),
  (5, 7, 2,  7.20),
  -- Factura 6
  (6, 12,2,  8.50),
  (6, 4, 5,  3.20),
  (6, 1, 3,  4.50),
  -- Factura 7
  (7, 2, 5,  3.80),
  (7, 5, 4,  2.50),
  -- Factura 8
  (8, 9, 4,  8.90),
  (8, 10,2, 14.50),
  -- Factura 9
  (9, 3, 3,  9.90),
  (9, 6, 4,  5.80),
  (9, 7, 3,  7.20),
  -- Factura 10
  (10,4, 4,  3.20),
  (10,11,7,  2.00),
  -- Factura 11
  (11,1, 6,  4.50),
  (11,2, 3,  3.80),
  (11,8, 2,  5.50),
  -- Factura 12
  (12,9, 6,  8.90),
  (12,10,1, 14.50),
  -- Factura 13
  (13,5, 8,  2.50),
  (13,12,3,  8.50),
  -- Factura 14
  (14,3, 5,  9.90),
  (14,7, 4,  7.20),
  (14,6, 3,  5.80),
  -- Factura 15
  (15,1, 5,  4.50),
  (15,4, 4,  3.20),
  -- Factura 16
  (16,9, 4,  8.90),
  (16,2, 5,  3.80),
  -- Factura 17
  (17,11,8,  2.00),
  (17,5, 5,  2.50),
  (17,8, 2,  5.50),
  -- Factura 18
  (18,3, 4,  9.90),
  (18,7, 5,  7.20),
  (18,1, 3,  4.50);

-- 7. PAGOS
INSERT INTO pagos (`IdFactura`, `Fecha`, `Monto`) VALUES
  (1,  '2026-06-13',  47.60),
  (2,  '2026-06-13',  32.80),
  (3,  '2026-06-14',  89.00),
  (4,  '2026-06-14',  21.50),
  (5,  '2026-06-15', 115.20),
  (6,  '2026-06-16',  58.40),
  (7,  '2026-06-17',  43.00),
  (8,  '2026-06-18',  76.50),
  (9,  '2026-06-19',  99.80),
  (10, '2026-06-20',  34.20),
  (11, '2026-06-21',  62.70),
  (12, '2026-06-22',  88.10),
  (13, '2026-06-23',  45.00),
  (14, '2026-06-24', 130.50),
  (15, '2026-06-25',  55.90),
  (16, '2026-06-26',  72.00),
  (17, '2026-06-26',  38.50),
  (18, '2026-06-26',  91.20);

-- 8. USUARIOS (solo pruebas)
INSERT INTO usuarios (`usuario`, `nombre`, `correo`, `clave`, `rol`) VALUES
  ('admin',       'Administrador General',  'admin@facturacioncj.com',    'Admin123!',  1),
  ('cajero01',    'Carlos Mendoza',         'cajero01@facturacioncj.com', 'Cajero123!', 2),
  ('cajero02',    'Lucia Paredes',          'cajero02@facturacioncj.com', 'Cajero123!', 2),
  ('supervisor',  'Jorge Ramirez',          'supervisor@facturacioncj.com','Super123!',  1),
  ('vendedor01',  'Sofia Castro',           'vendedor01@facturacioncj.com','Vend123!',   2);

COMMIT;

-- ============================================================
-- VERIFICACION RAPIDA
-- ============================================================
SELECT COUNT(*) AS total_clientes   FROM clientes;
SELECT COUNT(*) AS total_proveedor  FROM proveedor;
SELECT COUNT(*) AS total_productos  FROM productos;
SELECT COUNT(*) AS total_facturas   FROM facturas;
SELECT COUNT(*) AS total_detalles   FROM detalles_de_productos;
SELECT COUNT(*) AS total_pagos      FROM pagos;
SELECT COUNT(*) AS total_usuarios   FROM usuarios;
SELECT SUM(Total) AS ingresos_total FROM facturas;
