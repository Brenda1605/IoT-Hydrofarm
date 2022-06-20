-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 11-11-2020 a las 20:06:40
-- Versión del servidor: 10.4.14-MariaDB
-- Versión de PHP: 7.4.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `normalizacion`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asenta`
--

CREATE TABLE `asenta` (
  `d_codigo` int(11) NOT NULL,
  `id_asenta_cpcons` varchar(4) NOT NULL,
  `nombre_asenta` varchar(45) NOT NULL,
  `Codigo_postal_d_CP` int(11) NOT NULL,
  `Estado_c_estado` varchar(4) NOT NULL,
  `Tipo_asenta_c_tipo_asenta` varchar(4) NOT NULL,
  `Municipio_c_mnpio` varchar(4) NOT NULL,
  `Zona_c_zona` int(11) NOT NULL,
  `Ciudad_C_ciudad` varchar(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ciudad`
--

CREATE TABLE `ciudad` (
  `C_ciudad` varchar(4) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `Estado_c_estado` varchar(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ciudad`
--

INSERT INTO `ciudad` (`C_ciudad`, `nombre`, `Estado_c_estado`) VALUES
('01', 'Aguascalientes', '01'),
('01', 'Colima', '06'),
('01', 'Ameca', '14'),
('02', 'Calvillo', '01'),
('02', 'Manzanillo', '06'),
('02', 'Ciudad Guzman', '14'),
('03', 'San Francisco de los Romo', '01'),
('03', 'Tecoman', '06'),
('03', 'Guadalajara', '14'),
('04', 'Jesus Maria', '01'),
('04', 'Ciudad de Villa de Alvarez', '06'),
('04', 'Lagos de Moreno', '14'),
('05', 'Pabellon de Arteaga', '01'),
('05', 'Ciudad de Armeria', '06'),
('05', 'Ocotlan', '14'),
('06', 'Rincon de Romos', '01'),
('06', 'Puerto Vallarta', '14'),
('07', 'Asientos', '01'),
('07', 'San Juan de los Lagos', '14'),
('08', 'Tepezala', '01'),
('08', 'Tepatitlan de Morelos', '14'),
('09', 'Cosio', '01'),
('09', 'Tlaquepaque', '14'),
('10', 'Zapopan', '14'),
('11', 'Tlajomulco de Zuniga', '14'),
('12', 'Tonala', '14'),
('13', 'Tuxpan', '14'),
('14', 'Tototlan', '14'),
('15', 'San Diego de Alejandria', '14'),
('16', 'La Resolana', '14'),
('17', 'Atotonilco el Alto', '14'),
('18', 'Jalostotitlan', '14'),
('19', 'Poncitlan', '14'),
('20', 'Arandas', '14'),
('21', 'Talpa de Allende', '14'),
('22', 'Etzatlan', '14'),
('23', 'Sayula', '14'),
('24', 'Ahualulco de Mercado', '14'),
('25', 'Autlan de Navarro', '14'),
('26', 'Magdalena', '14'),
('27', 'San Julian', '14'),
('28', 'Cocula', '14'),
('29', 'El Grullo', '14'),
('30', 'San Miguel el Alto', '14'),
('31', 'Tala', '14'),
('32', 'La Barca', '14'),
('33', 'Jamay', '14'),
('34', 'Yahualica de Gonzalez Gallo', '14'),
('35', 'Colotlan', '14'),
('36', 'Cihuatlan', '14'),
('37', 'Zapotiltic', '14'),
('38', 'Villa Corona', '14'),
('39', 'Teocaltiche', '14'),
('41', 'Tequila', '14'),
('42', 'El Quince (San Jose el Quince)', '14'),
('43', 'San Jose el Verde (El Verde)', '14'),
('44', 'Jocotepec', '14'),
('45', 'Tecalitlan', '14'),
('46', 'Chapala', '14'),
('47', 'Ajijic', '14'),
('48', 'San Ignacio Cerro Gordo', '14'),
('49', 'Zacoalco de Torres', '14'),
('50', 'Huejuquilla el Alto', '14'),
('51', 'Villa Hidalgo', '14'),
('52', 'Union de San Antonio', '14'),
('53', 'Las Pintitas', '14'),
('54', 'Tamazula de Gordiano', '14'),
('55', 'Acatlan de Juarez', '14'),
('56', 'Valle de Guadalupe', '14'),
('57', 'El Salto', '14'),
('58', 'Villa Purificacion', '14');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `codigo_postal`
--

CREATE TABLE `codigo_postal` (
  `d_CP` int(11) NOT NULL,
  `c_oficina` int(11) NOT NULL,
  `c_CP` int(11) DEFAULT NULL,
  `Estado_c_estado` varchar(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `codigo_postal`
--

INSERT INTO `codigo_postal` (`d_CP`, `c_oficina`, `c_CP`, `Estado_c_estado`) VALUES
(20001, 20001, NULL, '01'),
(20001, 20001, NULL, '14'),
(20293, 20293, NULL, '01'),
(20401, 20401, NULL, '01'),
(20671, 20671, NULL, '01'),
(20801, 20801, NULL, '01'),
(20921, 20921, NULL, '01'),
(20999, 20999, NULL, '01'),
(20999, 20999, NULL, '14'),
(28001, 28001, NULL, '06'),
(28001, 28001, NULL, '14'),
(28101, 28101, NULL, '06'),
(28201, 28201, NULL, '06'),
(28201, 28201, NULL, '14'),
(28301, 28301, NULL, '06'),
(28401, 28401, NULL, '06'),
(28451, 28451, NULL, '06'),
(28501, 28501, NULL, '06'),
(28511, 28511, NULL, '06'),
(28706, 28706, NULL, '06'),
(28751, 28751, NULL, '06'),
(28861, 28861, NULL, '06'),
(28901, 28901, NULL, '06'),
(28971, 28971, NULL, '06'),
(44101, 44101, NULL, '14'),
(44241, 44241, NULL, '14'),
(44291, 44291, NULL, '14'),
(44308, 44308, NULL, '14'),
(44421, 44421, NULL, '14'),
(44534, 44534, NULL, '14'),
(44721, 44721, NULL, '14'),
(44731, 44731, NULL, '14'),
(44761, 44761, NULL, '14'),
(44921, 44921, NULL, '14'),
(44943, 44943, NULL, '14'),
(44981, 44981, NULL, '14'),
(45011, 45011, NULL, '14'),
(45042, 45042, NULL, '14'),
(45082, 45082, NULL, '14'),
(45101, 45101, NULL, '14'),
(45131, 45131, NULL, '14'),
(45132, 45132, NULL, '14'),
(45182, 45182, NULL, '14'),
(45192, 45192, NULL, '14'),
(45202, 45202, NULL, '14'),
(45261, 45261, NULL, '14'),
(45301, 45301, NULL, '14'),
(45351, 45351, NULL, '14'),
(45401, 45401, NULL, '14'),
(45409, 45409, NULL, '14'),
(45411, 45411, NULL, '14'),
(45421, 45421, NULL, '14'),
(45431, 45431, NULL, '14'),
(45471, 45471, NULL, '14'),
(45501, 45501, NULL, '14'),
(45591, 45591, NULL, '14'),
(45603, 45603, NULL, '14'),
(45642, 45642, NULL, '14'),
(45648, 45648, NULL, '14'),
(45681, 45681, NULL, '14'),
(45701, 45701, NULL, '14'),
(45731, 45731, NULL, '14'),
(45751, 45751, NULL, '14'),
(45801, 45801, NULL, '14'),
(45851, 45851, NULL, '14'),
(45861, 45861, NULL, '14'),
(45901, 45901, NULL, '14'),
(45951, 45951, NULL, '14'),
(46001, 46001, NULL, '14'),
(46171, 46171, NULL, '14'),
(46201, 46201, NULL, '14'),
(46241, 46241, NULL, '14'),
(46261, 46261, NULL, '14'),
(46401, 46401, NULL, '14'),
(46441, 46441, NULL, '14'),
(46471, 46471, NULL, '14'),
(46501, 46501, NULL, '14'),
(46561, 46561, NULL, '14'),
(46601, 46601, NULL, '14'),
(46731, 46731, NULL, '14'),
(46761, 46761, NULL, '14'),
(46771, 46771, NULL, '14'),
(46801, 46801, NULL, '14'),
(46901, 46901, NULL, '14'),
(47001, 47001, NULL, '14'),
(47121, 47121, NULL, '14'),
(47141, 47141, NULL, '14'),
(47171, 47171, NULL, '14'),
(47181, 47181, NULL, '14'),
(47191, 47191, NULL, '14'),
(47201, 47201, NULL, '14'),
(47251, 47251, NULL, '14'),
(47271, 47271, NULL, '14'),
(47301, 47301, NULL, '14'),
(47341, 47341, NULL, '14'),
(47361, 47361, NULL, '14'),
(47381, 47381, NULL, '14'),
(47401, 47401, NULL, '14'),
(47541, 47541, NULL, '14'),
(47591, 47591, NULL, '14'),
(47601, 47601, NULL, '14'),
(47701, 47701, NULL, '14'),
(47721, 47721, NULL, '14'),
(47722, 47722, NULL, '14'),
(47731, 47731, NULL, '14'),
(47751, 47751, NULL, '14'),
(47801, 47801, NULL, '14'),
(47901, 47901, NULL, '14'),
(47911, 47911, NULL, '14'),
(47931, 47931, NULL, '14'),
(47951, 47951, NULL, '14'),
(47981, 47981, NULL, '14'),
(48001, 48001, NULL, '14'),
(48051, 48051, NULL, '14'),
(48101, 48101, NULL, '14'),
(48201, 48201, NULL, '14'),
(48281, 48281, NULL, '14'),
(48293, 48293, NULL, '14'),
(48351, 48351, NULL, '14'),
(48402, 48402, NULL, '14'),
(48452, 48452, NULL, '14'),
(48501, 48501, NULL, '14'),
(48541, 48541, NULL, '14'),
(48701, 48701, NULL, '14'),
(48741, 48741, NULL, '14'),
(48761, 48761, NULL, '14'),
(48851, 48851, NULL, '14'),
(48901, 48901, NULL, '14'),
(48931, 48931, NULL, '14'),
(48971, 48971, NULL, '06'),
(48971, 48971, NULL, '14'),
(48982, 48982, NULL, '14'),
(49001, 49001, NULL, '14'),
(49121, 49121, NULL, '14'),
(49201, 49201, NULL, '14'),
(49251, 49251, NULL, '14'),
(49301, 49301, NULL, '14'),
(49331, 49331, NULL, '14'),
(49341, 49341, NULL, '14'),
(49371, 49371, NULL, '14'),
(49401, 49401, NULL, '14'),
(49441, 49441, NULL, '14'),
(49501, 49501, NULL, '14'),
(49541, 49541, NULL, '14'),
(49601, 49601, NULL, '14'),
(49651, 49651, NULL, '14'),
(49701, 49701, NULL, '14'),
(49801, 49801, NULL, '14'),
(49841, 49841, NULL, '14'),
(49871, 49871, NULL, '14'),
(49901, 49901, NULL, '14'),
(59251, 59251, NULL, '14'),
(60601, 60601, NULL, '14'),
(63901, 63901, NULL, '14'),
(63961, 63961, NULL, '14');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado`
--

CREATE TABLE `estado` (
  `c_estado` varchar(2) NOT NULL,
  `d_estado` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `estado`
--

INSERT INTO `estado` (`c_estado`, `d_estado`) VALUES
('01', 'Aguascalientes'),
('06', 'Colima'),
('14', 'Jalisco');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `municipio`
--

CREATE TABLE `municipio` (
  `c_mnpio` varchar(4) NOT NULL,
  `D_mnpio` varchar(45) NOT NULL,
  `Estado_c_estado` varchar(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `municipio`
--

INSERT INTO `municipio` (`c_mnpio`, `D_mnpio`, `Estado_c_estado`) VALUES
('001', 'Aguascalientes', '01'),
('001', 'Armeria', '06'),
('001', 'Acatic', '14'),
('002', 'Asientos', '01'),
('002', 'Colima', '06'),
('002', 'Acatlan de Juarez', '14'),
('003', 'Calvillo', '01'),
('003', 'Comala', '06'),
('003', 'Ahualulco de Mercado', '14'),
('004', 'Cosio', '01'),
('004', 'Coquimatlan', '06'),
('004', 'Amacueca', '14'),
('005', 'Jesus Maria', '01'),
('005', 'Cuauhtemoc', '06'),
('005', 'Amatitan', '14'),
('006', 'Pabellon de Arteaga', '01'),
('006', 'Ixtlahuacan', '06'),
('006', 'Ameca', '14'),
('007', 'Rincon de Romos', '01'),
('007', 'Manzanillo', '06'),
('007', 'San Juanito de Escobedo', '14'),
('008', 'San Jose de Gracia', '01'),
('008', 'Minatitlan', '06'),
('008', 'Arandas', '14'),
('009', 'Tepezala', '01'),
('009', 'Tecoman', '06'),
('009', 'El Arenal', '14'),
('010', 'El Llano', '01'),
('010', 'Villa de Alvarez', '06'),
('010', 'Atemajac de Brizuela', '14'),
('011', 'San Francisco de los Romo', '01'),
('011', 'Atengo', '14'),
('012', 'Atenguillo', '14'),
('013', 'Atotonilco el Alto', '14'),
('014', 'Atoyac', '14'),
('015', 'Autlan de Navarro', '14'),
('016', 'Ayotlan', '14'),
('017', 'Ayutla', '14'),
('018', 'La Barca', '14'),
('019', 'Bolanos', '14'),
('020', 'Cabo Corrientes', '14'),
('021', 'Casimiro Castillo', '14'),
('022', 'Cihuatlan', '14'),
('023', 'Zapotlan el Grande', '14'),
('024', 'Cocula', '14'),
('025', 'Colotlan', '14'),
('026', 'Concepcion de Buenos Aires', '14'),
('027', 'Cuautitlan de Garcia Barragan', '14'),
('028', 'Cuautla', '14'),
('029', 'Cuquio', '14'),
('030', 'Chapala', '14'),
('031', 'Chimaltitan', '14'),
('032', 'Chiquilistlan', '14'),
('033', 'Degollado', '14'),
('034', 'Ejutla', '14'),
('035', 'Encarnacion de Diaz', '14'),
('036', 'Etzatlan', '14'),
('037', 'El Grullo', '14'),
('038', 'Guachinango', '14'),
('039', 'Guadalajara', '14'),
('040', 'Hostotipaquillo', '14'),
('041', 'Huejucar', '14'),
('042', 'Huejuquilla el Alto', '14'),
('043', 'La Huerta', '14'),
('044', 'Ixtlahuacan de los Membrillos', '14'),
('045', 'Ixtlahuacan del Rio', '14'),
('046', 'Jalostotitlan', '14'),
('047', 'Jamay', '14'),
('048', 'Jesus Maria', '14'),
('049', 'Jilotlan de los Dolores', '14'),
('050', 'Jocotepec', '14'),
('051', 'Juanacatlan', '14'),
('052', 'Juchitlan', '14'),
('053', 'Lagos de Moreno', '14'),
('054', 'El Limon', '14'),
('055', 'Magdalena', '14'),
('056', 'Santa Maria del Oro', '14'),
('057', 'La Manzanilla de la Paz', '14'),
('058', 'Mascota', '14'),
('059', 'Mazamitla', '14'),
('060', 'Mexticacan', '14'),
('061', 'Mezquitic', '14'),
('062', 'Mixtlan', '14'),
('063', 'Ocotlan', '14'),
('064', 'Ojuelos de Jalisco', '14'),
('065', 'Pihuamo', '14'),
('066', 'Poncitlan', '14'),
('067', 'Puerto Vallarta', '14'),
('068', 'Villa Purificacion', '14'),
('069', 'Quitupan', '14'),
('070', 'El Salto', '14'),
('071', 'San Cristobal de la Barranca', '14'),
('072', 'San Diego de Alejandria', '14'),
('073', 'San Juan de los Lagos', '14'),
('074', 'San Julian', '14'),
('075', 'San Marcos', '14'),
('076', 'San Martin de Bolanos', '14'),
('077', 'San Martin Hidalgo', '14'),
('078', 'San Miguel el Alto', '14'),
('079', 'Gomez Farias', '14'),
('080', 'San Sebastian del Oeste', '14'),
('081', 'Santa Maria de los Angeles', '14'),
('082', 'Sayula', '14'),
('083', 'Tala', '14'),
('084', 'Talpa de Allende', '14'),
('085', 'Tamazula de Gordiano', '14'),
('086', 'Tapalpa', '14'),
('087', 'Tecalitlan', '14'),
('088', 'Tecolotlan', '14'),
('089', 'Techaluta de Montenegro', '14'),
('090', 'Tenamaxtlan', '14'),
('091', 'Teocaltiche', '14'),
('092', 'Teocuitatlan de Corona', '14'),
('093', 'Tepatitlan de Morelos', '14'),
('094', 'Tequila', '14'),
('095', 'Teuchitlan', '14'),
('096', 'Tizapan el Alto', '14'),
('097', 'Tlajomulco de Zuniga', '14'),
('098', 'San Pedro Tlaquepaque', '14'),
('099', 'Toliman', '14'),
('100', 'Tomatlan', '14'),
('101', 'Tonala', '14'),
('102', 'Tonaya', '14'),
('103', 'Tonila', '14'),
('104', 'Totatiche', '14'),
('105', 'Tototlan', '14'),
('106', 'Tuxcacuesco', '14'),
('107', 'Tuxcueca', '14'),
('108', 'Tuxpan', '14'),
('109', 'Union de San Antonio', '14'),
('110', 'Union de Tula', '14'),
('111', 'Valle de Guadalupe', '14'),
('112', 'Valle de Juarez', '14'),
('113', 'San Gabriel', '14'),
('114', 'Villa Corona', '14'),
('115', 'Villa Guerrero', '14'),
('116', 'Villa Hidalgo', '14'),
('117', 'Canadas de Obregon', '14'),
('118', 'Yahualica de Gonzalez Gallo', '14'),
('119', 'Zacoalco de Torres', '14'),
('120', 'Zapopan', '14'),
('121', 'Zapotiltic', '14'),
('122', 'Zapotitlan de Vadillo', '14'),
('123', 'Zapotlan del Rey', '14'),
('124', 'Zapotlanejo', '14'),
('125', 'San Ignacio Cerro Gordo', '14');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_asenta`
--

CREATE TABLE `tipo_asenta` (
  `c_tipo_asenta` varchar(4) NOT NULL,
  `d_tipo_asenta` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tipo_asenta`
--

INSERT INTO `tipo_asenta` (`c_tipo_asenta`, `d_tipo_asenta`) VALUES
('01', 'Aeorpuerto'),
('02', 'Barrio'),
('09', 'Colonia'),
('10', 'Condominio'),
('11', 'Congregacion'),
('12', 'Conjunto habitacional'),
('15', 'Ejido'),
('16', 'Estacion'),
('17', 'Equipamiento'),
('18', 'Exhacienda'),
('21', 'Fracccionamiento'),
('23', 'Granja'),
('24', 'Hacienda'),
('26', 'Parque Industrial'),
('27', 'Poblado comunal'),
('28', 'Pueblo'),
('29', 'Rancheria'),
('30', 'Residencial'),
('31', 'Unidad habitacional'),
('32', 'Villa'),
('33', 'Zona comercial'),
('34', 'Zona federal'),
('37', 'Zona industrial'),
('38', 'Ampliacion'),
('40', 'Puerto'),
('45', 'Paraje'),
('46', 'Zona naval'),
('47', 'Zona militar'),
('48', 'Rancho');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `zona`
--

CREATE TABLE `zona` (
  `c_zona` int(11) NOT NULL,
  `d_zona` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `zona`
--

INSERT INTO `zona` (`c_zona`, `d_zona`) VALUES
(100, 'Urbano'),
(200, 'Rural'),
(300, 'Semiurbano');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `asenta`
--
ALTER TABLE `asenta`
  ADD PRIMARY KEY (`d_codigo`,`id_asenta_cpcons`,`Codigo_postal_d_CP`,`Estado_c_estado`,`Tipo_asenta_c_tipo_asenta`,`Municipio_c_mnpio`,`Zona_c_zona`,`Ciudad_C_ciudad`),
  ADD KEY `fk_Asenta_Tipo_asenta1_idx` (`Tipo_asenta_c_tipo_asenta`),
  ADD KEY `fk_Asenta_Zona1_idx` (`Zona_c_zona`),
  ADD KEY `fk_Asenta_Ciudad1_idx` (`Ciudad_C_ciudad`),
  ADD KEY `fk_Asenta_Municipio1_idx` (`Municipio_c_mnpio`),
  ADD KEY `fk_Asenta_Codigo_postal1_idx` (`Codigo_postal_d_CP`),
  ADD KEY `fk_Asenta_Estado1_idx` (`Estado_c_estado`);

--
-- Indices de la tabla `ciudad`
--
ALTER TABLE `ciudad`
  ADD PRIMARY KEY (`C_ciudad`,`Estado_c_estado`),
  ADD KEY `fk_Ciudad_Estado_idx` (`Estado_c_estado`);

--
-- Indices de la tabla `codigo_postal`
--
ALTER TABLE `codigo_postal`
  ADD PRIMARY KEY (`d_CP`,`Estado_c_estado`),
  ADD KEY `fk_Codigo_postal_Estado1_idx` (`Estado_c_estado`);

--
-- Indices de la tabla `estado`
--
ALTER TABLE `estado`
  ADD PRIMARY KEY (`c_estado`);

--
-- Indices de la tabla `municipio`
--
ALTER TABLE `municipio`
  ADD PRIMARY KEY (`c_mnpio`,`Estado_c_estado`),
  ADD KEY `fk_Municipio_Estado1_idx` (`Estado_c_estado`);

--
-- Indices de la tabla `tipo_asenta`
--
ALTER TABLE `tipo_asenta`
  ADD PRIMARY KEY (`c_tipo_asenta`);

--
-- Indices de la tabla `zona`
--
ALTER TABLE `zona`
  ADD PRIMARY KEY (`c_zona`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `asenta`
--
ALTER TABLE `asenta`
  ADD CONSTRAINT `fk_Asenta_Ciudad1` FOREIGN KEY (`Ciudad_C_ciudad`) REFERENCES `ciudad` (`C_ciudad`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Asenta_Codigo_postal1` FOREIGN KEY (`Codigo_postal_d_CP`) REFERENCES `codigo_postal` (`d_CP`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Asenta_Estado1` FOREIGN KEY (`Estado_c_estado`) REFERENCES `estado` (`c_estado`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Asenta_Municipio1` FOREIGN KEY (`Municipio_c_mnpio`) REFERENCES `municipio` (`c_mnpio`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Asenta_Tipo_asenta1` FOREIGN KEY (`Tipo_asenta_c_tipo_asenta`) REFERENCES `tipo_asenta` (`c_tipo_asenta`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Asenta_Zona1` FOREIGN KEY (`Zona_c_zona`) REFERENCES `zona` (`c_zona`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `ciudad`
--
ALTER TABLE `ciudad`
  ADD CONSTRAINT `fk_Ciudad_Estado` FOREIGN KEY (`Estado_c_estado`) REFERENCES `estado` (`c_estado`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `codigo_postal`
--
ALTER TABLE `codigo_postal`
  ADD CONSTRAINT `fk_Codigo_postal_Estado1` FOREIGN KEY (`Estado_c_estado`) REFERENCES `estado` (`c_estado`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `municipio`
--
ALTER TABLE `municipio`
  ADD CONSTRAINT `fk_Municipio_Estado1` FOREIGN KEY (`Estado_c_estado`) REFERENCES `estado` (`c_estado`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
