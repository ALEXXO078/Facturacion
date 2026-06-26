-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 22-04-2025 a las 20:10:14
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `facturacion`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `IdCliente` int(11) NOT NULL,
  `Nombre` varchar(255) DEFAULT NULL,
  `Dirección` varchar(255) DEFAULT NULL,
  `Teléfono` varchar(20) DEFAULT NULL,
  `Correo electrónico` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`IdCliente`, `Nombre`, `Dirección`, `Teléfono`, `Correo electrónico`) VALUES
(1, 'Juan Pérez', 'Calle 123', '1234567890', 'juan.perez@example.com'),
(2, 'María Rodríguez', 'Calle 456', '9876543210', 'maria.rodriguez@example.com'),
(3, 'Carlos López', 'Calle 789', '5555555555', 'carlos.lopez@example.com'),
(4, 'Ana García', 'Calle 012', '4444444444', 'ana.garcia@example.com'),
(5, 'Elena Vargas', 'Avenida Principal 567', '9998887777', 'elena.vargas@example.com'),
(6, 'betty medina tantavilca', 'av mexico uuu 66', '98232333', 'betty@gmail.com'),
(7, 'Ana cecelia calzada', 'av ica 555', '86565665', 'ana@gmailcom'),
(8, 'mary calzda', 'meza', '454545454', 'mary@gmail.com'),
(9, 'angel calzada meza', 'Jr. San Roberto -194', '94412222', 'angel@mail.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `configuracion`
--

CREATE TABLE `configuracion` (
  `id` int(11) NOT NULL,
  `nit` bigint(20) NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `razon_social` varchar(30) NOT NULL,
  `telefono` bigint(9) NOT NULL,
  `mail` varchar(39) NOT NULL,
  `direccion` varchar(59) NOT NULL,
  `igv` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `configuracion`
--

INSERT INTO `configuracion` (`id`, `nit`, `nombre`, `razon_social`, `telefono`, `mail`, `direccion`, `igv`) VALUES
(1, 10778787, 'iisep', '', 98776666, 'iisep@edu.pe', 'av. tupac amaru 666', 18);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalles_de_productos`
--

CREATE TABLE `detalles_de_productos` (
  `IdDetalle` int(11) NOT NULL,
  `IdFactura` int(11) DEFAULT NULL,
  `IdProducto` int(11) DEFAULT NULL,
  `Cantidad` int(11) DEFAULT NULL,
  `Precio_unitario` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `detalles_de_productos`
--

INSERT INTO `detalles_de_productos` (`IdDetalle`, `IdFactura`, `IdProducto`, `Cantidad`, `Precio_unitario`) VALUES
(1, 1, 1, 2, 50.00),
(2, 1, 2, 1, 20.00),
(3, 2, 3, 3, 30.00),
(4, 3, 1, 1, 50.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_temp`
--

CREATE TABLE `detalle_temp` (
  `correlativo` int(11) NOT NULL,
  `token_user` varchar(20) NOT NULL,
  `idProducto` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precio_venta` decimal(5,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `facturas`
--

CREATE TABLE `facturas` (
  `IdFactura` int(11) NOT NULL,
  `Fecha` date DEFAULT NULL,
  `Total` decimal(10,2) DEFAULT NULL,
  `IdCliente` int(11) DEFAULT NULL,
  `estatus` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `facturas`
--

INSERT INTO `facturas` (`IdFactura`, `Fecha`, `Total`, `IdCliente`, `estatus`) VALUES
(1, '2025-04-22', 100.00, 1, 1),
(2, '2025-04-22', 200.00, 2, 1),
(3, '2025-04-22', 50.00, 3, 1),
(4, '2025-04-21', 150.00, 4, 1),
(5, '2025-04-21', 250.00, 5, 1),
(6, '2025-04-21', 120.00, 2, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pagos`
--

CREATE TABLE `pagos` (
  `IdPago` int(11) NOT NULL,
  `IdFactura` int(11) DEFAULT NULL,
  `Fecha` date DEFAULT NULL,
  `Monto` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pagos`
--

INSERT INTO `pagos` (`IdPago`, `IdFactura`, `Fecha`, `Monto`) VALUES
(1, 1, '2022-01-01', 100.00),
(2, 2, '2022-01-15', 200.00),
(3, 3, '2022-02-01', 50.00),
(4, 4, '2022-03-01', 150.00),
(5, 5, '2022-04-05', 250.00),
(6, 1, '2022-01-05', 50.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `IdProducto` int(11) NOT NULL,
  `Nombre` varchar(255) DEFAULT NULL,
  `Descripción` varchar(255) DEFAULT NULL,
  `Precio` decimal(10,2) DEFAULT NULL,
  `proveedor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`IdProducto`, `Nombre`, `Descripción`, `Precio`, `proveedor`) VALUES
(1, 'Arroz', 'Paquete de arroz de 1 kg', 3.50, 0),
(2, 'Leche', 'Botella de leche entera de 1 litro', 4.20, 0),
(3, 'Fideos', 'Paquete de fideos tallarín de 500 gr', 2.80, 0),
(4, 'Aceite', 'Botella de aceite vegetal de 1 litro', 9.50, 0),
(5, 'Azúcar', 'Paquete de azúcar blanca de 1 kg', 3.00, 0),
(6, 'Pan', 'Bolsa de 6 panes franceses', 2.00, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedor`
--

CREATE TABLE `proveedor` (
  `codprovvedor` int(11) NOT NULL,
  `proveedor` varchar(20) NOT NULL,
  `telefonoo` bigint(9) NOT NULL,
  `direccion` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `proveedor`
--

INSERT INTO `proveedor` (`codprovvedor`, `proveedor`, `telefonoo`, `direccion`) VALUES
(1, 'gloria', 6765544, ''),
(2, 'Nicoline', 5656565, 'av cuba 4545');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `stockproductos`
--

CREATE TABLE `stockproductos` (
  `IdProducto` int(11) NOT NULL,
  `CantidadEnStock` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `stockproductos`
--

INSERT INTO `stockproductos` (`IdProducto`, `CantidadEnStock`) VALUES
(1, 100),
(2, 50),
(3, 120),
(4, 30),
(5, 80),
(6, 200);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `idusuario` int(11) NOT NULL,
  `usuario` varchar(30) NOT NULL,
  `nombre` varchar(60) NOT NULL,
  `correo` varchar(60) NOT NULL,
  `clave` varchar(30) NOT NULL,
  `rol` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`idusuario`, `usuario`, `nombre`, `correo`, `clave`, `rol`) VALUES
(1, 'jose1234', 'antonio calzada', 'jose@gmaail.com', '1234', 1),
(14, 'ana1234', 'ana calzada mexa', 'ana@gmail.com', '1234', 1),
(15, 'Adriana ', 'cakzada', 'adriana@gmail.com', '1234', 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`IdCliente`);

--
-- Indices de la tabla `configuracion`
--
ALTER TABLE `configuracion`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `detalles_de_productos`
--
ALTER TABLE `detalles_de_productos`
  ADD PRIMARY KEY (`IdDetalle`),
  ADD KEY `IdFactura` (`IdFactura`),
  ADD KEY `IdProducto` (`IdProducto`);

--
-- Indices de la tabla `detalle_temp`
--
ALTER TABLE `detalle_temp`
  ADD PRIMARY KEY (`correlativo`);

--
-- Indices de la tabla `facturas`
--
ALTER TABLE `facturas`
  ADD PRIMARY KEY (`IdFactura`),
  ADD KEY `IdCliente` (`IdCliente`);

--
-- Indices de la tabla `pagos`
--
ALTER TABLE `pagos`
  ADD PRIMARY KEY (`IdPago`),
  ADD KEY `IdFactura` (`IdFactura`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`IdProducto`);

--
-- Indices de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  ADD PRIMARY KEY (`codprovvedor`);

--
-- Indices de la tabla `stockproductos`
--
ALTER TABLE `stockproductos`
  ADD PRIMARY KEY (`IdProducto`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`idusuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `IdCliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `configuracion`
--
ALTER TABLE `configuracion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `detalles_de_productos`
--
ALTER TABLE `detalles_de_productos`
  MODIFY `IdDetalle` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `detalle_temp`
--
ALTER TABLE `detalle_temp`
  MODIFY `correlativo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `facturas`
--
ALTER TABLE `facturas`
  MODIFY `IdFactura` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `pagos`
--
ALTER TABLE `pagos`
  MODIFY `IdPago` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `IdProducto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  MODIFY `codprovvedor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `stockproductos`
--
ALTER TABLE `stockproductos`
  MODIFY `IdProducto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `idusuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `detalles_de_productos`
--
ALTER TABLE `detalles_de_productos`
  ADD CONSTRAINT `detalles_de_productos_ibfk_1` FOREIGN KEY (`IdFactura`) REFERENCES `facturas` (`IdFactura`),
  ADD CONSTRAINT `detalles_de_productos_ibfk_2` FOREIGN KEY (`IdProducto`) REFERENCES `productos` (`IdProducto`);

--
-- Filtros para la tabla `facturas`
--
ALTER TABLE `facturas`
  ADD CONSTRAINT `facturas_ibfk_1` FOREIGN KEY (`IdCliente`) REFERENCES `clientes` (`IdCliente`);

--
-- Filtros para la tabla `pagos`
--
ALTER TABLE `pagos`
  ADD CONSTRAINT `pagos_ibfk_1` FOREIGN KEY (`IdFactura`) REFERENCES `facturas` (`IdFactura`);

--
-- Filtros para la tabla `stockproductos`
--
ALTER TABLE `stockproductos`
  ADD CONSTRAINT `stockproductos_ibfk_1` FOREIGN KEY (`IdProducto`) REFERENCES `productos` (`IdProducto`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
