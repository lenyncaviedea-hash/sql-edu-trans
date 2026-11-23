-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 23-11-2026 a las 23:33:44
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
-- Base de datos: `transporte_masivo`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_buses`
--

CREATE TABLE `tb_buses` (
  `id_bus` int(11) NOT NULL,
  `placa` varchar(10) NOT NULL,
  `capacidad` int(11) NOT NULL,
  `id_ruta` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tb_buses`
--

INSERT INTO `tb_buses` (`id_bus`, `placa`, `capacidad`, `id_ruta`) VALUES
(1, 'ABC-101', 80, 1),
(2, 'ABC-102', 80, 2),
(3, 'ABC-103', 120, 3),
(4, 'ABC-104', 120, 4),
(5, 'ABC-105', 90, 5),
(6, 'ABC-106', 90, 6),
(7, 'ABC-107', 100, 7),
(8, 'ABC-108', 100, 8),
(9, 'ABC-109', 140, 9),
(10, 'ABC-110', 140, 10);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_conductores`
--

CREATE TABLE `tb_conductores` (
  `id_conductor` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `licencia` varchar(20) NOT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  `id_bus` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tb_conductores`
--

INSERT INTO `tb_conductores` (`id_conductor`, `nombre`, `licencia`, `telefono`, `id_bus`) VALUES
(1, 'Carlos Pérez', 'LIC-001', '3001112233', 1),
(2, 'María Gómez', 'LIC-002', '3002223344', 2),
(3, 'Juan Rodríguez', 'LIC-003', '3003334455', 3),
(4, 'Ana Torres', 'LIC-004', '3004445566', 4),
(5, 'Luis Martínez', 'LIC-005', '3005556677', 5),
(6, 'Sofía Ramírez', 'LIC-006', '3006667788', 6),
(7, 'Pedro Castro', 'LIC-007', '3007778899', 7),
(8, 'Laura Díaz', 'LIC-008', '3008889900', 8),
(9, 'Andrés Vargas', 'LIC-009', '3009990011', 9),
(10, 'Camila Ruiz', 'LIC-010', '3001010101', 10);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_estaciones`
--

CREATE TABLE `tb_estaciones` (
  `id_estacion` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `direccion` varchar(80) DEFAULT NULL,
  `id_ruta` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tb_estaciones`
--

INSERT INTO `tb_estaciones` (`id_estacion`, `nombre`, `direccion`, `id_ruta`) VALUES
(1, 'Estación Norte', 'Calle 100 #15-20', 1),
(2, 'Estación Central', 'Carrera 7 #32-10', 1),
(3, 'Estación Sur', 'Av. Boyacá #50-12', 2),
(4, 'Estación Plaza', 'Calle 26 #10-05', 2),
(5, 'Estación Campus', 'Carrera 30 #45-00', 3),
(6, 'Estación Oriente', 'Calle 80 #20-33', 3),
(7, 'Estación Aeropuerto', 'Av. El Dorado #103-09', 4),
(8, 'Estación Salud', 'Calle 1 #12-40', 5),
(9, 'Estación Estadio', 'Av. 68 #55-15', 6),
(10, 'Estación Terminal', 'Calle 22 #68-60', 7);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_rutas`
--

CREATE TABLE `tb_rutas` (
  `id_ruta` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `origen` varchar(50) NOT NULL,
  `destino` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tb_rutas`
--

INSERT INTO `tb_rutas` (`id_ruta`, `nombre`, `origen`, `destino`) VALUES
(1, 'Ruta A1', 'Portal Norte', 'Centro'),
(2, 'Ruta B2', 'Portal Sur', 'Centro'),
(3, 'Ruta C3', 'Portal Oriente', 'Universidad'),
(4, 'Ruta D4', 'Portal Occidente', 'Aeropuerto'),
(5, 'Ruta E5', 'Centro', 'Hospital'),
(6, 'Ruta F6', 'Terminal', 'Estadio'),
(7, 'Ruta G7', 'Portal Norte', 'Terminal'),
(8, 'Ruta H8', 'Universidad', 'Portal Sur'),
(9, 'Ruta I9', 'Aeropuerto', 'Centro'),
(10, 'Ruta J10', 'Estadio', 'Portal Oriente');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `tb_buses`
--
ALTER TABLE `tb_buses`
  ADD PRIMARY KEY (`id_bus`),
  ADD UNIQUE KEY `placa` (`placa`),
  ADD KEY `id_ruta` (`id_ruta`);

--
-- Indices de la tabla `tb_conductores`
--
ALTER TABLE `tb_conductores`
  ADD PRIMARY KEY (`id_conductor`),
  ADD KEY `id_bus` (`id_bus`);

--
-- Indices de la tabla `tb_estaciones`
--
ALTER TABLE `tb_estaciones`
  ADD PRIMARY KEY (`id_estacion`),
  ADD KEY `id_ruta` (`id_ruta`);

--
-- Indices de la tabla `tb_rutas`
--
ALTER TABLE `tb_rutas`
  ADD PRIMARY KEY (`id_ruta`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `tb_buses`
--
ALTER TABLE `tb_buses`
  MODIFY `id_bus` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `tb_conductores`
--
ALTER TABLE `tb_conductores`
  MODIFY `id_conductor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `tb_estaciones`
--
ALTER TABLE `tb_estaciones`
  MODIFY `id_estacion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `tb_rutas`
--
ALTER TABLE `tb_rutas`
  MODIFY `id_ruta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `tb_buses`
--
ALTER TABLE `tb_buses`
  ADD CONSTRAINT `tb_buses_ibfk_1` FOREIGN KEY (`id_ruta`) REFERENCES `tb_rutas` (`id_ruta`);

--
-- Filtros para la tabla `tb_conductores`
--
ALTER TABLE `tb_conductores`
  ADD CONSTRAINT `tb_conductores_ibfk_1` FOREIGN KEY (`id_bus`) REFERENCES `tb_buses` (`id_bus`);

--
-- Filtros para la tabla `tb_estaciones`
--
ALTER TABLE `tb_estaciones`
  ADD CONSTRAINT `tb_estaciones_ibfk_1` FOREIGN KEY (`id_ruta`) REFERENCES `tb_rutas` (`id_ruta`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
