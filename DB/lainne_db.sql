-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 16, 2020 at 02:33 AM
-- Server version: 10.1.35-MariaDB
-- PHP Version: 7.2.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `lainne_db`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `Add_User` (IN `nombre` VARCHAR(255), IN `apellido` VARCHAR(255), IN `telefono` VARCHAR(255), IN `direccion` VARCHAR(255), IN `ciudad` VARCHAR(255), IN `correo` VARCHAR(255), IN `contrasena` VARCHAR(255))  BEGIN
	INSERT INTO
    usuario 
    (Nombre, Apellido, Telefono, Direccion,    		Ciudad, Correo, Contrasena)
    VALUES
    (nombre, apellido, telefono, direccion, 		ciudad, correo, contrasena);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Agregar_Producto` (IN `Nombre` VARCHAR(100), IN `Descripcion` VARCHAR(100), IN `Imagen` VARCHAR(500), IN `PrecioBase` DOUBLE, IN `Sabor_Id` INT, IN `Tamano_Id` INT, IN `Relleno_Id` INT, IN `Configuracion_Id` INT, IN `Forma_id` INT)  NO SQL
BEGIN
INSERT INTO `producto` (`Id`, `Nombre`, `Descripcion`, `Imagen`, `PrecioBase`, `FechaCreacion`, `Eliminado`, `Sabor_Id`, `Tamano_Id`, `Relleno_Id`, `Configuracion_Id`, `Forma_id`) VALUES (NULL, Nombre, Descripcion, Imagen, PrecioBase, CURRENT_TIMESTAMP, '0', Sabor_Id, Tamano_Id, Relleno_Id, Configuracion_Id, Forma_id);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Agregar_Usuario` (IN `nombre` VARCHAR(255), IN `apellido` VARCHAR(255), IN `telefono` VARCHAR(255), IN `direccion` VARCHAR(255), IN `ciudad` VARCHAR(255), IN `correo` VARCHAR(255), IN `contrasena` VARCHAR(255))  BEGIN
	INSERT INTO
    usuario 
    (Nombre, Apellido, Telefono, Direccion,    		Ciudad, Correo, Contrasena)
    VALUES
    (nombre, apellido, telefono, direccion, 		ciudad, correo, contrasena);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Buscar_Producto` (IN `InTamano` VARCHAR(30), IN `InSabor` VARCHAR(30), IN `InRelleno` VARCHAR(30), IN `InExtra` VARCHAR(30))  BEGIN
SELECT p.Id FROM producto as p JOIN tamano as t ON p.Tamano_Id = t.Id JOIN sabor as s ON p.Sabor_Id = s.Id JOIN relleno as r ON p.Relleno_Id = r.Id JOIN configuracion as e ON p.Configuracion_Id = e.Id WHERE t.Nombre = InTamano AND s.Nombre = InSabor AND r.Nombre = InRelleno AND e.Nombre = InExtra;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Crear_Orden` (IN `Fecha_Entrega` DATE, IN `Cliente_ID` INT, IN `PRODUCTO_CANTIDAD` INT, IN `PRODUCTO_IMPORTE` DOUBLE, IN `PRODUCTO_DECORACION` VARCHAR(25), IN `InTamano` VARCHAR(25), IN `InSabor` VARCHAR(25), IN `InRelleno` VARCHAR(25), IN `InExtra` VARCHAR(25))  BEGIN
DECLARE ORDEN_HECHA INTEGER;
DECLARE PRODUCTO_ID INTEGER;
DECLARE exit handler for sqlexception
BEGIN
 ROLLBACK;
    END;
   DECLARE exit handler for sqlwarning
     BEGIN
     ROLLBACK;
     END;

-- SELECT usuario.Id INTO PRODUCTO_ID from usuario where usuario.Nombre='Edgar Alejandro';
--  SELECT lat,lng into cityLat, cityLng FROM cities WHERE cities.cityID = p_cityID;


SELECT p.Id INTO PRODUCTO_ID FROM producto as p JOIN tamano as t ON p.Tamano_Id = t.Id JOIN sabor
 as s ON p.Sabor_Id = s.Id JOIN relleno as r ON p.Relleno_Id = r.Id JOIN configuracion
 as e ON p.Configuracion_Id = e.Id WHERE t.Nombre = InTamano AND s.Nombre = InSabor 
AND r.Nombre = InRelleno AND e.Nombre = InExtra;

START TRANSACTION;
INSERT INTO orden (FechaEntrega, Usuario_Id) VALUES ( Fecha_Entrega, Cliente_ID);
SELECT LAST_INSERT_ID() INTO ORDEN_HECHA;
INSERT INTO orden_has_producto (Orden_Id, Producto_Id, Cantidad, Importe, Decoracion) 
VALUES (ORDEN_HECHA, PRODUCTO_ID, PRODUCTO_CANTIDAD, PRODUCTO_IMPORTE, PRODUCTO_DECORACION);
COMMIT;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getProducts` ()  BEGIN
SELECT Nombre, Descripcion, Imagen  from producto;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Get_Main_Products` ()  BEGIN

SELECT producto.Nombre, producto.Descripcion, producto.Imagen FROM producto WHERE producto.Nombre = 'Pastel Grande Natural' OR producto.Nombre = 'Pastel Grande Natural de Chocolate' OR 
producto.Nombre = 'Pastel Grande Chocolate de 3 leches';

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Obtener_Pedido` (IN `UsuarioId` INT)  NO SQL
BEGIN
SELECT p.Nombre, p.Descripcion, p.Imagen, o.FechaEntrega, o.Estado FROM producto as p JOIN orden_has_producto as op on p.Id = op.Producto_Id join orden as o ON o.Id = op.Orden_Id WHERE o.Usuario_Id = UsuarioId;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `banner`
--

CREATE TABLE `banner` (
  `Id` int(11) NOT NULL,
  `Nombre` varchar(45) DEFAULT NULL,
  `Imagen` varchar(500) DEFAULT NULL,
  `FechaCreacion` timestamp NULL DEFAULT NULL,
  `Eliminado` tinyint(4) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `configuracion`
--

CREATE TABLE `configuracion` (
  `Id` int(11) NOT NULL,
  `Nombre` varchar(45) DEFAULT NULL,
  `FechaCreacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `Eliminado` tinyint(4) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `configuracion`
--

INSERT INTO `configuracion` (`Id`, `Nombre`, `FechaCreacion`, `Eliminado`) VALUES
(1, '3 leches', '2020-06-27 02:10:00', 0),
(2, 'Natural', '2020-06-27 02:10:00', 0);

-- --------------------------------------------------------

--
-- Table structure for table `forma`
--

CREATE TABLE `forma` (
  `id` int(11) NOT NULL,
  `Nombre` varchar(45) DEFAULT NULL,
  `FechaCreacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `Eliminado` tinyint(4) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `forma`
--

INSERT INTO `forma` (`id`, `Nombre`, `FechaCreacion`, `Eliminado`) VALUES
(1, 'Cuadrado', '2020-06-27 13:44:08', 0),
(2, 'Redondo', '2020-06-27 13:44:08', 0);

-- --------------------------------------------------------

--
-- Table structure for table `orden`
--

CREATE TABLE `orden` (
  `Id` int(11) NOT NULL,
  `FechaEntrega` datetime DEFAULT NULL,
  `FechaCreacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `Eliminado` tinyint(4) DEFAULT '0',
  `Estado` varchar(45) DEFAULT 'Solicitada',
  `Usuario_Id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `orden`
--

INSERT INTO `orden` (`Id`, `FechaEntrega`, `FechaCreacion`, `Eliminado`, `Estado`, `Usuario_Id`) VALUES
(13, '2020-08-11 00:00:00', '2020-08-12 01:55:35', 0, 'Solicitada', 1),
(14, '2020-08-11 00:00:00', '2020-08-12 03:11:30', 0, 'Solicitada', 1),
(15, '2020-08-11 00:00:00', '2020-08-13 01:10:42', 0, 'Solicitada', 1),
(16, '2020-08-20 00:00:00', '2020-08-13 01:23:37', 0, 'Solicitada', 1),
(17, '2020-08-21 00:00:00', '2020-08-13 03:20:56', 0, 'Solicitada', 1),
(18, '2020-08-27 00:00:00', '2020-08-13 03:23:51', 0, 'Solicitada', 1),
(19, '2020-08-13 00:00:00', '2020-08-13 03:24:36', 0, 'Solicitada', 1),
(20, '2020-08-13 00:00:00', '2020-08-13 03:25:30', 0, 'Solicitada', 1);

-- --------------------------------------------------------

--
-- Table structure for table `orden_has_producto`
--

CREATE TABLE `orden_has_producto` (
  `Orden_Id` int(11) NOT NULL,
  `Producto_Id` int(11) NOT NULL,
  `Cantidad` int(11) DEFAULT NULL,
  `Importe` double DEFAULT NULL,
  `Decoracion` varchar(120) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `orden_has_producto`
--

INSERT INTO `orden_has_producto` (`Orden_Id`, `Producto_Id`, `Cantidad`, `Importe`, `Decoracion`) VALUES
(13, 5, 1, 1, 'Algo para niña'),
(14, 5, 1, 0, 'Un Unicornio volando sobr'),
(15, 5, 1, 0, 'Un unicornio volador'),
(16, 5, 1, 0, 'Un unicornio volador'),
(17, 15, 1, 0, 'Pastel demo '),
(18, 5, 1, 0, 'Pastel demo '),
(19, 5, 1, 0, 'Pastel demo '),
(20, 5, 1, 0, 'Pastel demo ');

-- --------------------------------------------------------

--
-- Table structure for table `producto`
--

CREATE TABLE `producto` (
  `Id` int(11) NOT NULL,
  `Nombre` varchar(45) DEFAULT NULL,
  `Descripcion` varchar(100) DEFAULT NULL,
  `Imagen` varchar(500) DEFAULT NULL,
  `PrecioBase` double DEFAULT NULL,
  `FechaCreacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `Eliminado` tinyint(4) DEFAULT '0',
  `Sabor_Id` int(11) NOT NULL,
  `Tamano_Id` int(11) NOT NULL,
  `Relleno_Id` int(11) NOT NULL,
  `Configuracion_Id` int(11) NOT NULL,
  `Forma_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `producto`
--

INSERT INTO `producto` (`Id`, `Nombre`, `Descripcion`, `Imagen`, `PrecioBase`, `FechaCreacion`, `Eliminado`, `Sabor_Id`, `Tamano_Id`, `Relleno_Id`, `Configuracion_Id`, `Forma_id`) VALUES
(1, 'Pastel Grande Natural', 'Pastel para 60 personas aproximadamente de forma cuadrada.', 'https://firebasestorage.googleapis.com/v0/b/lainne-c321f.appspot.com/o/pastel%20grande%20natural.jpg?alt=media&token=79f10ece-4a36-4653-98c7-770b60517fc6', 360, '2020-06-30 00:08:04', 0, 3, 1, 3, 2, 1),
(2, 'Pastel Grande Natural Relleno', 'Pastel grande natural relleno de durazno para 60 personas aproximadamente, en presentación cuadrada.', 'https://firebasestorage.googleapis.com/v0/b/lainne-c321f.appspot.com/o/grande%20natural%20relleno.jpg?alt=media&token=8a5fb6c9-8826-47c5-ad76-e2cffaaf9b95', 420, '2020-06-30 00:08:04', 0, 3, 1, 1, 2, 1),
(3, 'Pastel Grande de 3 Leches', 'Pastel grande de tres leches para 60 personas aproximadamente, en presentación cuadrada.', 'https://firebasestorage.googleapis.com/v0/b/lainne-c321f.appspot.com/o/grande%203L.jpg?alt=media&token=ca2f2165-4641-4d52-bada-cca3b8797a29', 470, '2020-06-30 00:09:47', 0, 3, 1, 3, 1, 1),
(4, 'Pastel Grande de 3 Leches Relleno ', 'Pastel grande de 3 leches con relleno de durazno para 60 personas aproximadamente en presentación cu', 'https://firebasestorage.googleapis.com/v0/b/lainne-c321f.appspot.com/o/grande%20relleno%203L.jpg?alt=media&token=ebb7e0bb-c5e8-48de-9067-3fc81327ca50', 550, '2020-06-30 00:14:48', 0, 3, 1, 1, 1, 1),
(5, 'Pastel Grande Natural de Chocolate', 'Pastel grande natural de chocolate para 60 personas aproximadamente, en presentación cuadrada', 'https://firebasestorage.googleapis.com/v0/b/lainne-c321f.appspot.com/o/grande%20natural%20chocolate.jpg?alt=media&token=080e392c-710f-4dad-b8f5-ccf3ab461491', 470, '2020-06-30 00:14:48', 0, 1, 1, 1, 1, 1),
(6, 'Pastel Grande Chocolate de 3 leches', 'Pastel grande de chocolate, de 3 leches para 60 personas aproximadamente en presentación cuadrada', 'https://firebasestorage.googleapis.com/v0/b/lainne-c321f.appspot.com/o/grande%20chocolate%203L.jpg?alt=media&token=d283e123-0821-44da-92cd-db9a09810665', 540, '2020-06-30 00:19:49', 0, 1, 1, 3, 1, 1),
(7, 'Pastel Grande Chocolate', 'Pastel grande de chocolate con relleno de durazno', 'https://firebasestorage.googleapis.com/v0/b/lainne-c321f.appspot.com/o/grande%20natural%20chocolate.jpg?alt=media&token=080e392c-710f-4dad-b8f5-ccf3ab461491', 540, '2020-08-13 02:55:58', 0, 1, 1, 1, 2, 1),
(8, 'Pastel Grande de Chocolate Relleno', 'Pastel de chocolate relleno de mermelada', 'https://firebasestorage.googleapis.com/v0/b/lainne-c321f.appspot.com/o/grande%203l%20chocolate%20relleno.jpg?alt=media&token=ab68c07a-c4fa-4abf-83bb-b53a113330aa', 420, '2020-08-13 02:55:58', 0, 1, 1, 2, 1, 1),
(9, 'Pastel Grande Chocolate', 'Pastel grande de chocolate relleno', 'https://firebasestorage.googleapis.com/v0/b/lainne-c321f.appspot.com/o/grande%203L.jpg?alt=media&token=ca2f2165-4641-4d52-bada-cca3b8797a29', 540, '2020-08-13 03:01:00', 0, 1, 1, 2, 2, 1),
(10, 'Pastel Grande de Chocolate ', 'Pastel grande de chocolate', 'https://firebasestorage.googleapis.com/v0/b/lainne-c321f.appspot.com/o/grande%20natural%20chocolate%20relleno.jpg?alt=media&token=9ac9e8a1-dc34-4422-8ba8-b9b1c5b695a9', 420, '2020-08-13 03:01:00', 0, 1, 1, 3, 2, 1),
(14, 'Pastel Grande con mermelada', 'Pastel grande de 3 leches relleno de mermelada', 'https://firebasestorage.googleapis.com/v0/b/lainne-c321f.appspot.com/o/grande%20natural%20chocolate%20relleno.jpg?alt=media&token=9ac9e8a1-dc34-4422-8ba8-b9b1c5b695a9', 540, '2020-08-13 03:12:55', 0, 3, 1, 2, 1, 1),
(15, 'Pastel natural relleno de mermelada', 'Pastel grande natural con relleno de mermelada', 'https://firebasestorage.googleapis.com/v0/b/lainne-c321f.appspot.com/o/grande%20relleno%203L.jpg?alt=media&token=ebb7e0bb-c5e8-48de-9067-3fc81327ca50', 420, '2020-08-13 03:12:55', 0, 3, 1, 2, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `relleno`
--

CREATE TABLE `relleno` (
  `Id` int(11) NOT NULL,
  `Nombre` varchar(45) DEFAULT NULL,
  `FechaCreacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `Eliminado` tinyint(4) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `relleno`
--

INSERT INTO `relleno` (`Id`, `Nombre`, `FechaCreacion`, `Eliminado`) VALUES
(1, 'Durazno', '2020-06-27 02:06:51', 0),
(2, 'Mermelada de Fresa', '2020-06-27 02:06:51', 0),
(3, 'Sin relleno', '2020-06-27 02:14:29', 0);

-- --------------------------------------------------------

--
-- Table structure for table `sabor`
--

CREATE TABLE `sabor` (
  `Id` int(11) NOT NULL,
  `Nombre` varchar(45) DEFAULT NULL,
  `FechaCreacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `Eliminado` tinyint(4) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sabor`
--

INSERT INTO `sabor` (`Id`, `Nombre`, `FechaCreacion`, `Eliminado`) VALUES
(1, 'Chocolate', '2020-06-27 02:03:02', 0),
(2, 'Marmoleado', '2020-06-27 02:03:02', 0),
(3, 'Clásico', '2020-06-27 02:03:02', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tamano`
--

CREATE TABLE `tamano` (
  `Id` int(11) NOT NULL,
  `Nombre` varchar(45) DEFAULT NULL,
  `FechaCreacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `Eliminado` tinyint(4) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tamano`
--

INSERT INTO `tamano` (`Id`, `Nombre`, `FechaCreacion`, `Eliminado`) VALUES
(1, 'Grande', '2020-06-27 02:00:52', 0),
(2, 'Chico', '2020-06-27 02:00:52', 0);

-- --------------------------------------------------------

--
-- Table structure for table `usuario`
--

CREATE TABLE `usuario` (
  `Id` int(11) NOT NULL,
  `Nombre` varchar(100) DEFAULT NULL,
  `Apellido` varchar(100) DEFAULT NULL,
  `Telefono` varchar(15) DEFAULT NULL,
  `Direccion` varchar(100) DEFAULT NULL,
  `Ciudad` varchar(50) DEFAULT NULL,
  `Correo` varchar(45) DEFAULT NULL,
  `Contrasena` varchar(150) DEFAULT NULL,
  `Avatar` varchar(500) DEFAULT 'https://firebasestorage.googleapis.com/v0/b/lainne-c321f.appspot.com/o/avatar-placeholder.png?alt=media&token=10c6f845-849b-4b10-9fa4-427da8b8ac95',
  `FechaCreacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Eliminado` tinyint(4) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `usuario`
--

INSERT INTO `usuario` (`Id`, `Nombre`, `Apellido`, `Telefono`, `Direccion`, `Ciudad`, `Correo`, `Contrasena`, `Avatar`, `FechaCreacion`, `Eliminado`) VALUES
(1, 'Edgar Alejandro', 'Mora Valdez', '4181098544', 'Calle 5 de Mayo #22 \"B\"', 'San Diego de la Unión', 'cruji42@gmail.com', '$2y$05$2nh6P7TlT7sAJQhRr7TqwOmtInhRrXg0plsrLHwcvRpPTYsCz5yS6', 'https://images.squarespace-cdn.com/content/v1/5070f2f8c4aa65eb3b6394d0/1436318763288-A0DOHGAV0JWK7J5XD0UC/ke17ZwdGBToddI8pDm48kMIebV6MdNPQMcRDrC5oPxMUqsxRUqqbr1mOJYKfIPR7LoDQ9mXPOjoJoqy81S2I8N_N4V1vUb5AoIIIbLZhVYxCRW4BPu10St3TBAUQYVKc73FUbOtyHSZLq0696RfXhzOQ1C7e-4RYctpOI87j69--0uIsXqDbvJ5MkV0zcn4f/LYB+People+Profile+%2809%29.jpg', '2020-06-30 23:14:45', 0),
(2, 'Julieta ', 'García Méndez', '4181234567', 'Lucas Balderas #18 Col. Mexiquito', 'San Miguel de Allende', 'chuleruze@gmail.com', '1234567890', 'https://firebasestorage.googleapis.com/v0/b/lainne-c321f.appspot.com/o/avatar-placeholder.png?alt=media&token=10c6f845-849b-4b10-9fa4-427da8b8ac95', '2020-06-30 03:01:46', 0),
(3, 'J. Loreto', 'Mora', '4181098544', 'asdasdasd', 'xsasdsdca', 'demo@demo.com', '$2y$05$N1kWXICrdMvBFJ2snwdGO.sOv8njaThbt9Tv0GPtFffY49DL.y01G', 'https://firebasestorage.googleapis.com/v0/b/lainne-c321f.appspot.com/o/avatar-placeholder.png?alt=media&token=10c6f845-849b-4b10-9fa4-427da8b8ac95', '2020-08-07 01:54:48', 0),
(4, 'Hola', 'demo', '1234567890', 'asdasd', 'sdawdasda', 'sasda@asdasd', '$2y$05$QQSq/xYTdI34pU1tHdt.EuDm8KLokCQn004bzOhiJ6aphJh6Gq0d6', 'https://firebasestorage.googleapis.com/v0/b/lainne-c321f.appspot.com/o/avatar-placeholder.png?alt=media&token=10c6f845-849b-4b10-9fa4-427da8b8ac95', '2020-08-07 01:59:26', 0),
(5, '', '', '', '', '', '', '$2y$05$rS.U1nOUIk/tHZl8DtfksuOXlPPpajutzqz5X.10Igd8n8w/ZjFu6', 'https://firebasestorage.googleapis.com/v0/b/lainne-c321f.appspot.com/o/avatar-placeholder.png?alt=media&token=10c6f845-849b-4b10-9fa4-427da8b8ac95', '2020-08-07 02:01:33', 0),
(8, 'dfañskljl', 'jlskdjalskdj', 'lkjfslkjdflkdj', 'qdjlSKDJALSDKJ', 'LKDJALSKJDLal', 'qjdlaskdjLAK', '$2y$05$YIESnxlqesWCt1yVIPcsi.i1k7G80Vcm4Y/LSiVtZuoYPDno7dTli', 'https://firebasestorage.googleapis.com/v0/b/lainne-c321f.appspot.com/o/avatar-placeholder.png?alt=media&token=10c6f845-849b-4b10-9fa4-427da8b8ac95', '2020-08-07 02:07:26', 0),
(9, 'Maria Isabel', 'Algun Apellido', '1234567890', 'Queretaro', 'Queretaro', 'example@example.com', '$2y$05$nL3WiElk6k48QErI7CfeMu3Ll4Jn2RsHcB5SZpEgne.6NM67tKkR.', 'https://firebasestorage.googleapis.com/v0/b/lainne-c321f.appspot.com/o/avatar-placeholder.png?alt=media&token=10c6f845-849b-4b10-9fa4-427da8b8ac95', '2020-08-13 17:45:01', 0);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vista_ordenes`
-- (See below for the actual view)
--
CREATE TABLE `vista_ordenes` (
`Nombre` varchar(45)
);

-- --------------------------------------------------------

--
-- Structure for view `vista_ordenes`
--
DROP TABLE IF EXISTS `vista_ordenes`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_ordenes`  AS  select `t2`.`Nombre` AS `Nombre` from (`orden_has_producto` `t1` join `producto` `t2` on((`t1`.`Producto_Id` = `t2`.`Id`))) where (`t1`.`Orden_Id` = 1) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `banner`
--
ALTER TABLE `banner`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `configuracion`
--
ALTER TABLE `configuracion`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `forma`
--
ALTER TABLE `forma`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orden`
--
ALTER TABLE `orden`
  ADD PRIMARY KEY (`Id`,`Usuario_Id`),
  ADD KEY `fk_Orden_Usuario1_idx` (`Usuario_Id`);

--
-- Indexes for table `orden_has_producto`
--
ALTER TABLE `orden_has_producto`
  ADD PRIMARY KEY (`Orden_Id`,`Producto_Id`),
  ADD KEY `fk_Orden_has_Producto3_Producto1_idx` (`Producto_Id`),
  ADD KEY `fk_Orden_has_Producto3_Orden1_idx` (`Orden_Id`);

--
-- Indexes for table `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`Id`,`Sabor_Id`,`Tamano_Id`,`Relleno_Id`,`Configuracion_Id`,`Forma_id`),
  ADD KEY `fk_Producto_Sabor1_idx` (`Sabor_Id`),
  ADD KEY `fk_Producto_Tamano2_idx` (`Tamano_Id`),
  ADD KEY `fk_Producto_Relleno2_idx` (`Relleno_Id`),
  ADD KEY `fk_Producto_Configuracion1_idx` (`Configuracion_Id`),
  ADD KEY `fk_Producto_Forma1_idx` (`Forma_id`);

--
-- Indexes for table `relleno`
--
ALTER TABLE `relleno`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `sabor`
--
ALTER TABLE `sabor`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `tamano`
--
ALTER TABLE `tamano`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`Id`),
  ADD UNIQUE KEY `Correo_UNIQUE` (`Correo`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `banner`
--
ALTER TABLE `banner`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `configuracion`
--
ALTER TABLE `configuracion`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `forma`
--
ALTER TABLE `forma`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `orden`
--
ALTER TABLE `orden`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `producto`
--
ALTER TABLE `producto`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `relleno`
--
ALTER TABLE `relleno`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `sabor`
--
ALTER TABLE `sabor`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tamano`
--
ALTER TABLE `tamano`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `usuario`
--
ALTER TABLE `usuario`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orden`
--
ALTER TABLE `orden`
  ADD CONSTRAINT `fk_Orden_Usuario1` FOREIGN KEY (`Usuario_Id`) REFERENCES `usuario` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `orden_has_producto`
--
ALTER TABLE `orden_has_producto`
  ADD CONSTRAINT `fk_Orden_has_Producto3_Orden1` FOREIGN KEY (`Orden_Id`) REFERENCES `orden` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Orden_has_Producto3_Producto1` FOREIGN KEY (`Producto_Id`) REFERENCES `producto` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `fk_Producto_Configuracion1` FOREIGN KEY (`Configuracion_Id`) REFERENCES `configuracion` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Producto_Forma1` FOREIGN KEY (`Forma_id`) REFERENCES `forma` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Producto_Relleno2` FOREIGN KEY (`Relleno_Id`) REFERENCES `relleno` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Producto_Sabor1` FOREIGN KEY (`Sabor_Id`) REFERENCES `sabor` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Producto_Tamano2` FOREIGN KEY (`Tamano_Id`) REFERENCES `tamano` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
