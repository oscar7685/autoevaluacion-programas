-- phpMyAdmin SQL Dump
-- version 3.4.5
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 29-05-2013 a las 19:34:26
-- Versión del servidor: 5.5.16
-- Versión de PHP: 5.3.8

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `sapbd`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `administrativo`
--

CREATE TABLE IF NOT EXISTS `administrativo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cargo` varchar(255) DEFAULT NULL,
  `persona_id` varchar(25) NOT NULL,
  `fuente_id` int(11) NOT NULL,
  `programa_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_administrativo_fuente1_idx` (`fuente_id`),
  KEY `fk_administrativo_programa1_idx` (`programa_id`),
  KEY `fk_administrativo_persona1_idx` (`persona_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `agenciagubernamental`
--

CREATE TABLE IF NOT EXISTS `agenciagubernamental` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(500) DEFAULT NULL,
  `persona_id` varchar(25) NOT NULL,
  `fuente_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_agenciagubernamental_fuente1_idx` (`fuente_id`),
  KEY `fk_agenciagubernamental_persona1_idx` (`persona_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asignacionencuesta`
--

CREATE TABLE IF NOT EXISTS `asignacionencuesta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fuente_id` int(11) NOT NULL,
  `encuesta_id` int(11) NOT NULL,
  `modelo_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_asignacionencuesta_fuente1_idx` (`fuente_id`),
  KEY `fk_asignacionencuesta_encuesta1_idx` (`encuesta_id`),
  KEY `fk_asignacionencuesta_modelo1` (`modelo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `caracteristica`
--

CREATE TABLE IF NOT EXISTS `caracteristica` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(100) NOT NULL,
  `nombre` varchar(500) NOT NULL,
  `factor_id` int(11) DEFAULT NULL,
  `modelo_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_caracteristica_factor1_idx` (`factor_id`),
  KEY `fk_caracteristica_modelo1` (`modelo_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=70 ;

--
-- Volcado de datos para la tabla `caracteristica`
--

INSERT INTO `caracteristica` (`id`, `codigo`, `nombre`, `factor_id`, `modelo_id`) VALUES
(1, '1.1', 'MISIÓN Y PROYECTO INSTITUCIONAL', 3, 1),
(2, '1.2', 'PROYECTO EDUCATIVO DEL PROGRAMA', 3, 1),
(3, '1.3', ' RELEVANCIA ACADÉMICA Y PERTINENCIA SOCIAL DEL PROGRAMA', 3, 1),
(4, '2.4', ' MECANISMOS DE SELECCIÓN E INGRESO', 4, 1),
(5, '2.5', ' ESTUDIANTES ADMITIDOS Y CAPACIDAD INSTITUCIONAL', 4, 1),
(6, '2.6', ' PARTICIPACIÓN EN ACTIVIDADES DE FORMACIÓN INTEGRAL', 4, 1),
(7, '2.7', ' REGLAMENTOS ESTUDIANTIL Y ACADÉMICO', 4, 1),
(8, '3.8', ' SELECCIÓN, VINCULACIÓN Y PERMANENCIA DE PROFESORES', 5, 1),
(9, '3.9', ' ESTATUTO PROFESORAL', 5, 1),
(10, '3.10', ' NÚMERO, DEDICACIÓN, NIVEL DE FORMACIÓN Y EXPERIENCIA DE LOS PROFESORES', 5, 1),
(11, '3.11', ' DESARROLLO PROFESORAL', 5, 1),
(12, '3.12', ' ESTÍMULOS A LA DOCENCIA, INVESTIGACIÓN, CREACIÓN ARTÍSTICA Y CULTURAL, EXTENSIÓN O PROYECCIÓN SOCIAL Y A LA COOPERACIÓN INTERNACIONAL', 5, 1),
(13, '3.13', ' PRODUCCIÓN, PERTINENCIA, UTILIZACIÓN E IMPACTO DE MATERIAL DOCENTE', 5, 1),
(14, '3.14', ' REMUNERACIÓN POR MÉRITOS', 5, 1),
(15, '3.15', ' EVALUACIÓN DE PROFESORES', 5, 1),
(16, '4.16', ' INTEGRALIDAD DEL CURRÍCULO', 6, 1),
(17, '4.17', ' FLEXIBILIDAD DEL CURRÍCULO', 6, 1),
(18, '4.18', ' INTERDISCIPLINARIEDAD', 6, 1),
(19, '4.19', ' ESTRATEGIAS DE ENSEÑANZA Y APRENDIZAJE', 6, 1),
(20, '4.20', ' SISTEMA DE EVALUACIÓN DE ESTUDIANTES', 6, 1),
(21, '4.21', ' TRABAJOS DE LOS ESTUDIANTES', 6, 1),
(22, '4.22', ' EVALUACIÓN Y AUTORREGULACIÓN DEL PROGRAMA', 6, 1),
(23, '4.23', ' EXTENSIÓN O PROYECCIÓN SOCIAL', 6, 1),
(24, '4.24', ' RECURSOS BIBLIOGRÁFICOS', 6, 1),
(25, '4.25', ' RECURSOS INFORMÁTICOS Y DE COMUNICACIÓN', 6, 1),
(26, '4.26', ' RECURSOS DE APOYO DOCENTE', 6, 1),
(27, '5.27', ' INSERCIÓN DEL PROGRAMA EN CONTEXTOS ACADÉMICOS NACIONALES E INTERNACIONALES', 7, 1),
(28, '5.28', ' RELACIONES EXTERNAS DE PROFESORES Y ESTUDIANTES', 7, 1),
(29, '6.29', 'FORMACIÓN PARA LA INVESTIGACIÓN, LA INNOVACIÓN Y LA CREACIÓN ARTÍSTICA Y CULTURAL', 8, 1),
(30, '6.30', ' COMPROMISO CON LA INVESTIGACIÓN, LA INNOVACIÓN Y LA CREACIÓN ARTÍSTICA Y CULTURAL', 8, 1),
(31, '7.31', ' POLÍTICAS, PROGRAMAS Y SERVICIOS DE BIENESTAR UNIVERSITARIO', 9, 1),
(32, '7.32', ' PERMANENCIA Y RETENCIÓN ESTUDIANTIL', 9, 1),
(33, '8.33', ' ORGANIZACIÓN, ADMINISTRACIÓN Y GESTIÓN DEL PROGRAMA', 10, 1),
(34, '8.34', ' SISTEMAS DE COMUNICACIÓN E INFORMACIÓN', 10, 1),
(35, '8.35', ' DIRECCIÓN DEL PROGRAMA', 10, 1),
(36, '9.36', ' SEGUIMIENTO DE LOS EGRESADOS', 11, 1),
(37, '9.37', ' IMPACTO DE LOS EGRESADOS EN EL MEDIO SOCIAL Y ACADÉMICO', 11, 1),
(38, '10.38', ' RECURSOS FÍSICOS', 12, 1),
(39, '10.39', ' PRESUPUESTO DEL PROGRAMA', 12, 1),
(40, '10.40', ' ADMINISTRACIÓN DE RECURSOS', 12, 1),
(41, '1.1', 'Cumplimiento de los objetivos del programa', 13, 2),
(42, '2.2', 'Características de los estudiantes en el momento de su ingreso', 14, 2),
(43, '2.3', 'Permanencia y desempeño de los estudiantes del posgrado', 14, 2),
(44, '2.4', 'Graduados del programa', 14, 2),
(45, '3.5', 'Perfil de los profesores', 15, 2),
(46, '3.6', 'Producción científica de los profesores:', 15, 2),
(47, '3.7', 'Relación Tutor/Estudiante', 15, 2),
(48, '3.8', 'Política sobre Profesores', 15, 2),
(49, '4.9', 'Formación, Aprendizaje y Desarrollo de Investigadores', 16, 2),
(50, '4.10', 'Formación del investigador en términos de su capacidad para comprender el entorno social y geopolítico de la ciencia', 16, 2),
(51, '4.11', 'Flexibilidad del Currículo', 16, 2),
(52, '4.12', 'Aseguramiento de la Calidad y Mejora Continua', 16, 2),
(53, '5.13', 'Articulación de la Investigación al Programa', 17, 2),
(54, '5.14', 'Los Grupos de Investigación y sus Líneas', 17, 2),
(55, '5.15', 'Productos de la investigación y su impacto', 17, 2),
(56, '6.16', 'Posibilidad de trabajo inter y transdisciplinario', 18, 2),
(57, '6.17', 'Relevancia de las Líneas de Investigación y de las Tesis de Grado para el Desarrollo del País o de la Región', 18, 2),
(58, '6.18', 'Experiencias de Interacción con el Entorno', 18, 2),
(59, '7.19', 'Internacionalización del currículo', 19, 2),
(60, '7.20', 'Internacionalización de Estudiantes y Profesores', 19, 2),
(61, '7.21', 'Internacionalización de la investigación', 19, 2),
(62, '8.22', 'Bienestar y ambiente institucional', 20, 2),
(63, '9.23', 'La producción científica de los egresados', 21, 2),
(64, '9.24', 'Análisis del impacto del programa', 21, 2),
(65, '10.25', 'Infraestructura física adecuada', 22, 2),
(66, '10.26', 'Recursos Bibliográficos, Informáticos y de Comunicación', 22, 2),
(67, '10.27', 'Adecuado apoyo administrativo a las actividades de docencia, investigación y extensión del programa', 22, 2),
(68, '10.28', 'Presupuesto del programa', 22, 2),
(69, '10.29', 'Gestión del programa', 22, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `directorprograma`
--

CREATE TABLE IF NOT EXISTS `directorprograma` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `persona_id` varchar(25) NOT NULL,
  `fuente_id` int(11) NOT NULL,
  `programa_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_directorprograma_fuente1_idx` (`fuente_id`),
  KEY `fk_directorprograma_programa1_idx` (`programa_id`),
  KEY `fk_directorprograma_persona1_idx` (`persona_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `docente`
--

CREATE TABLE IF NOT EXISTS `docente` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` varchar(45) DEFAULT NULL,
  `persona_id` varchar(25) NOT NULL,
  `fuente_id` int(11) NOT NULL,
  `programa_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_docente_fuente1_idx` (`fuente_id`),
  KEY `fk_docente_programa1_idx` (`programa_id`),
  KEY `fk_docente_persona1_idx` (`persona_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `egresado`
--

CREATE TABLE IF NOT EXISTS `egresado` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `persona_id` varchar(25) NOT NULL,
  `fuente_id` int(11) NOT NULL,
  `programa_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_egresado_fuente1_idx` (`fuente_id`),
  KEY `fk_egresado_programa1_idx` (`programa_id`),
  KEY `fk_egresado_persona1_idx` (`persona_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleador`
--

CREATE TABLE IF NOT EXISTS `empleador` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `empresa` varchar(255) DEFAULT NULL,
  `cargo` varchar(255) DEFAULT NULL,
  `persona_id` varchar(25) NOT NULL,
  `fuente_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_empleador_fuente1_idx` (`fuente_id`),
  KEY `fk_empleador_persona1_idx` (`persona_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `encabezado`
--

CREATE TABLE IF NOT EXISTS `encabezado` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` datetime NOT NULL,
  `persona_id` varchar(25) NOT NULL,
  `proceso_id` int(11) NOT NULL,
  `encuesta_id` int(11) NOT NULL,
  `fuente_id` int(11) NOT NULL,
  `estado` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_encabezado_persona1_idx` (`persona_id`),
  KEY `fk_encabezado_proceso1_idx` (`proceso_id`),
  KEY `fk_encabezado_encuesta1_idx` (`encuesta_id`),
  KEY `fk_encabezado_fuente1_idx` (`fuente_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `encuesta`
--

CREATE TABLE IF NOT EXISTS `encuesta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(100) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `objetivo` varchar(1000) NOT NULL,
  `instrucciones` varchar(1000) NOT NULL,
  `modelo_id` int(11) NOT NULL,
  `version` varchar(45) NOT NULL,
  `fecha` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_encuesta_modelo1` (`modelo_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Volcado de datos para la tabla `encuesta`
--

INSERT INTO `encuesta` (`id`, `codigo`, `nombre`, `objetivo`, `instrucciones`, `modelo_id`, `version`, `fecha`) VALUES
(1, 'FO-DO/AA-002', 'ENCUESTA PARA ESTUDIANTES', 'Recolectar información sobre la percepción que la comunidad universitaria tiene de los procesos académicos y administrativos desarrollados por el programa para el logro de sus objetivos misionales, con el fin de adelantar el proceso de autoevaluación de programas.', 'A continuación encontrará una serie de afirmaciones, valórelas según su grado de acuerdo con la siguiente escala de calificación: \r\n5 - Completamente de acuerdo\r\n4 - De acuerdo\r\n3 - Parcialmente de acuerdo\r\n2 - En desacuerdo\r\n1 - Completamente en desacuerdo\r\n0 - No sabe', 1, '00', '18/04/2012'),
(2, 'FO-DO/AA-002', 'ENCUESTA PARA PROFESORES', 'Recolectar información sobre la percepción que la comunidad universitaria tiene de los procesos académicos y administrativos desarrollados por el programa para el logro de sus objetivos misionales, con el fin de adelantar el proceso de autoevaluación de programas.', 'A continuación encontrará una serie de afirmaciones, valórelas según su grado de acuerdo con la siguiente escala de calificación: \r\n5 - Completamente de acuerdo\r\n4 - De acuerdo\r\n3 - Parcialmente de acuerdo\r\n2 - En desacuerdo\r\n1 - Completamente en desacuerdo\r\n0 - No sabe', 1, '00', '18/04/2012'),
(3, 'FO-DO/AA-002', 'ENCUESTA PARA EMPLEADORES', 'Recolectar información sobre la percepción que la comunidad universitaria tiene de los procesos académicos y administrativos desarrollados por el programa para el logro de sus objetivos misionales, con el fin de adelantar el proceso de autoevaluación de programas.', 'A continuación encontrará una serie de afirmaciones, valórelas según su grado de acuerdo con la siguiente escala de calificación: \r\n5 - Completamente de acuerdo\r\n4 - De acuerdo\r\n3 - Parcialmente de acuerdo\r\n2 - En desacuerdo\r\n1 - Completamente en desacuerdo\r\n0 - No sabe', 1, '00', '18/04/2012'),
(4, 'FO-DO/AA-002', 'ENCUESTA PARA EGRESADOS', 'Recolectar información sobre la percepción que la comunidad universitaria tiene de los procesos académicos y administrativos desarrollados por el programa para el logro de sus objetivos misionales, con el fin de adelantar el proceso de autoevaluación de programas.', 'A continuación encontrará una serie de afirmaciones, valórelas según su grado de acuerdo con la siguiente escala de calificación: \r\n5 - Completamente de acuerdo\r\n4 - De acuerdo\r\n3 - Parcialmente de acuerdo\r\n2 - En desacuerdo\r\n1 - Completamente en desacuerdo\r\n0 - No sabe', 1, '00', '18/04/2012'),
(5, 'FO-DO/AA-002', 'ENCUESTA PARA DIRECTORES DE PROGRAMA', 'Recolectar información sobre la percepción que la comunidad universitaria tiene de los procesos académicos y administrativos desarrollados por el programa para el logro de sus objetivos misionales, con el fin de adelantar el proceso de autoevaluación de programas.', 'A continuación encontrará una serie de afirmaciones, valórelas según su grado de acuerdo con la siguiente escala de calificación: \r\n5 - Completamente de acuerdo\r\n4 - De acuerdo\r\n3 - Parcialmente de acuerdo\r\n2 - En desacuerdo\r\n1 - Completamente en desacuerdo\r\n0 - No sabe', 1, '00', '18/04/2012'),
(7, 'FO-DO/AA-002', 'ENCUESTA PARA ADMINISTRATIVOS', 'Recolectar información sobre la percepción que la comunidad universitaria tiene de los procesos académicos y administrativos desarrollados por el programa para el logro de sus objetivos misionales, con el fin de adelantar el proceso de autoevaluación de programas.', 'A continuación encontrará una serie de afirmaciones, valórelas según su grado de acuerdo con la siguiente escala de calificación: \r\n5 - Completamente de acuerdo\r\n4 - De acuerdo\r\n3 - Parcialmente de acuerdo\r\n2 - En desacuerdo\r\n1 - Completamente en desacuerdo\r\n0 - No sabe', 1, '00', '18/04/2012');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `encuestahaspregunta`
--

CREATE TABLE IF NOT EXISTS `encuestahaspregunta` (
  `encuesta_id` int(11) NOT NULL,
  `pregunta_id` int(11) NOT NULL,
  PRIMARY KEY (`encuesta_id`,`pregunta_id`),
  KEY `fk_encuesta_has_pregunta_pregunta1` (`pregunta_id`),
  KEY `fk_encuesta_has_pregunta_encuesta1` (`encuesta_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `encuestahaspregunta`
--

INSERT INTO `encuestahaspregunta` (`encuesta_id`, `pregunta_id`) VALUES
(1, 1),
(2, 1),
(5, 1),
(7, 1),
(1, 2),
(2, 2),
(5, 2),
(1, 3),
(2, 3),
(4, 3),
(5, 3),
(7, 3),
(1, 4),
(2, 4),
(4, 4),
(5, 4),
(7, 4),
(1, 5),
(2, 5),
(5, 5),
(7, 5),
(1, 6),
(2, 6),
(5, 6),
(7, 6),
(1, 7),
(2, 7),
(5, 7),
(3, 8),
(4, 9),
(1, 10),
(2, 10),
(1, 11),
(2, 11),
(2, 12),
(2, 13),
(1, 14),
(2, 14),
(1, 15),
(2, 15),
(1, 16),
(2, 16),
(1, 17),
(2, 17),
(5, 17),
(1, 18),
(2, 18),
(5, 18),
(2, 19),
(5, 19),
(2, 20),
(5, 20),
(2, 21),
(5, 21),
(2, 22),
(5, 22),
(1, 23),
(2, 23),
(5, 23),
(2, 24),
(5, 24),
(2, 25),
(5, 25),
(1, 26),
(1, 27),
(1, 28),
(2, 29),
(2, 30),
(2, 31),
(2, 32),
(1, 33),
(2, 33),
(5, 33),
(1, 34),
(2, 34),
(5, 34),
(1, 35),
(2, 35),
(5, 35),
(1, 36),
(5, 36),
(2, 37),
(5, 37),
(1, 38),
(2, 38),
(5, 38),
(1, 39),
(2, 39),
(5, 39),
(1, 40),
(2, 41),
(5, 41),
(1, 42),
(2, 42),
(4, 42),
(5, 42),
(3, 43),
(1, 44),
(2, 44),
(5, 44),
(1, 45),
(2, 45),
(5, 45),
(1, 46),
(2, 46),
(5, 46),
(1, 47),
(2, 47),
(7, 47),
(1, 48),
(2, 48),
(5, 48),
(1, 49),
(2, 49),
(5, 49),
(1, 50),
(2, 50),
(5, 50),
(1, 51),
(2, 51),
(5, 51),
(1, 52),
(2, 52),
(5, 52),
(1, 53),
(2, 53),
(5, 53),
(1, 54),
(2, 54),
(1, 55),
(2, 55),
(1, 56),
(2, 56),
(5, 56),
(7, 56),
(1, 57),
(2, 57),
(5, 57),
(7, 57),
(1, 58),
(2, 58),
(5, 58),
(7, 58),
(1, 59),
(2, 59),
(5, 59),
(1, 60),
(1, 61),
(2, 61),
(5, 61),
(1, 62),
(2, 62),
(5, 62),
(7, 62),
(7, 63),
(1, 64),
(2, 64),
(1, 65),
(2, 65),
(5, 65),
(7, 65),
(1, 66),
(2, 66),
(7, 66),
(2, 67),
(5, 67),
(7, 67),
(3, 68),
(4, 69),
(4, 70),
(3, 71),
(1, 72),
(2, 72),
(5, 72),
(7, 72),
(1, 73),
(2, 73),
(5, 73),
(7, 73),
(1, 74),
(2, 74),
(5, 74),
(7, 74),
(1, 75),
(2, 75),
(5, 75),
(7, 75),
(1, 76),
(2, 76),
(5, 76),
(7, 76),
(1, 77),
(2, 77),
(5, 77),
(7, 77),
(1, 78),
(2, 78),
(5, 78),
(7, 78),
(1, 79),
(2, 79),
(5, 79),
(7, 79),
(1, 80),
(2, 80),
(5, 80),
(7, 80),
(1, 81),
(2, 81),
(5, 81),
(7, 81),
(1, 82),
(2, 82),
(5, 82),
(7, 82),
(1, 83),
(2, 83),
(5, 83),
(7, 83),
(1, 84),
(2, 84),
(5, 84),
(7, 84),
(2, 85),
(5, 85),
(2, 86),
(5, 86);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estudiante`
--

CREATE TABLE IF NOT EXISTS `estudiante` (
  `id` varchar(25) NOT NULL,
  `semestre` varchar(45) NOT NULL,
  `periodo` varchar(45) NOT NULL,
  `anio` varchar(45) NOT NULL,
  `persona_id` varchar(25) NOT NULL,
  `fuente_id` int(11) NOT NULL,
  `programa_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_estudiante_fuente1_idx` (`fuente_id`),
  KEY `fk_estudiante_programa1_idx` (`programa_id`),
  KEY `fk_estudiante_persona1_idx` (`persona_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `estudiante`
--

INSERT INTO `estudiante` (`id`, `semestre`, `periodo`, `anio`, `persona_id`, `fuente_id`, `programa_id`) VALUES
('0220720010', '09', '2', '2012', '1128060964', 1, 22),
('0220720011', '09', '2', '2012', '1047422951', 1, 22),
('0220720017', '10', '2', '2012', '73209373', 1, 22),
('0220720018', '08', '2', '2012', '1047398260', 1, 22),
('0220720023', '09', '2', '2012', '1047408963', 1, 22),
('0220720026', '09', '2', '2012', '1143343643', 1, 22),
('0220720027', '10', '2', '2012', '1047419618', 1, 22),
('0220720030', '09', '2', '2012', '1128047055', 1, 22),
('0220720031', '08', '2', '2012', '73006859', 1, 22),
('0220720032', '09', '2', '2012', '1047415538', 1, 22),
('0220720039', '09', '2', '2012', '1128057404', 1, 22),
('0220720040', '10', '2', '2012', '1047426383', 1, 22),
('0220720042', '07', '2', '2012', '1043652362', 1, 22),
('0220720045', '08', '2', '2012', '1143347612', 1, 22),
('0220720047', '09', '2', '2012', '1143334111', 1, 22),
('0220722001', '10', '2', '2012', '1047413683', 1, 22),
('0220810002', '10', '2', '2012', '1047436649', 1, 22),
('0220810003', '09', '2', '2012', '1143345556', 1, 22),
('0220810004', '07', '2', '2012', '1047441541', 1, 22),
('0220810005', '10', '2', '2012', '1047426689', 1, 22),
('0220810008', '08', '2', '2012', '1143353411', 1, 22),
('0220810009', '07', '2', '2012', '1050037270', 1, 22),
('0220810012', '09', '2', '2012', '1047426345', 1, 22),
('0220810015', '10', '2', '2012', '1047434637', 1, 22),
('0220810017', '09', '2', '2012', '1047434978', 1, 22),
('0220810018', '06', '2', '2012', '1143351357', 1, 22),
('0220810020', '10', '2', '2012', '1143347323', 1, 22),
('0220810021', '07', '2', '2012', '1143355772', 1, 22),
('0220810022', '08', '2', '2012', '1103217271', 1, 22),
('0220810023', '07', '2', '2012', '1143348639', 1, 22),
('0220810025', '07', '2', '2012', '1047441076', 1, 22),
('0220810027', '09', '2', '2012', '1047432850', 1, 22),
('0220810028', '09', '2', '2012', '32937292', 1, 22),
('0220810031', '08', '2', '2012', '1143351885', 1, 22),
('0220810032', '08', '2', '2012', '1047426346', 1, 22),
('0220810033', '08', '2', '2012', '1143349281', 1, 22),
('0220810034', '10', '2', '2012', '1047424991', 1, 22),
('0220810036', '10', '2', '2012', '1143350644', 1, 22),
('0220810037', '10', '2', '2012', '1047434674', 1, 22),
('0220810038', '08', '2', '2012', '1143354166', 1, 22),
('0220810041', '07', '2', '2012', '1047425074', 1, 22),
('0220810042', '10', '2', '2012', '1047426951', 1, 22),
('0220810043', '08', '2', '2012', '1143346120', 1, 22),
('0220810044', '08', '2', '2012', '1047426880', 1, 22),
('0220810045', '10', '2', '2012', '1044917781', 1, 22),
('0220810047', '09', '2', '2012', '1047425119', 1, 22),
('0220820003', '09', '2', '2012', '1128062003', 1, 22),
('0220820006', '09', '2', '2012', '1049932254', 1, 22),
('0220820007', '07', '2', '2012', '1143339248', 1, 22),
('0220820012', '08', '2', '2012', '1047433224', 1, 22),
('0220820014', '07', '2', '2012', '1143347053', 1, 22),
('0220820017', '09', '2', '2012', '1047443420', 1, 22),
('0220820021', '08', '2', '2012', '1047434781', 1, 22),
('0220820022', '09', '2', '2012', '1143346597', 1, 22),
('0220820023', '08', '2', '2012', '1047433267', 1, 22),
('0220820025', '07', '2', '2012', '1047429276', 1, 22),
('0220820030', '08', '2', '2012', '1020729179', 1, 22),
('0220820031', '06', '2', '2012', '1047418683', 1, 22),
('0220820035', '07', '2', '2012', '1143340657', 1, 22),
('0220820036', '09', '2', '2012', '1047442506', 1, 22),
('0220820038', '09', '2', '2012', '1094247286', 1, 22),
('0220820040', '05', '2', '2012', '1143346271', 1, 22),
('0220820041', '09', '2', '2012', '1143352701', 1, 22),
('0220820042', '05', '2', '2012', '1143353987', 1, 22),
('0220820044', '09', '2', '2012', '1128054752', 1, 22),
('0220820046', '08', '2', '2012', '1047426759', 1, 22),
('0220820047', '09', '2', '2012', '1047420038', 1, 22),
('0220820049', '08', '2', '2012', '1143332414', 1, 22),
('0220820050', '05', '2', '2012', '1047430379', 1, 22),
('0220820052', '05', '2', '2012', '1049453283', 1, 22),
('0220910001', '08', '2', '2012', '1143354403', 1, 22),
('0220910002', '08', '2', '2012', '1099963388', 1, 22),
('0220910003', '08', '2', '2012', '1143361777', 1, 22),
('0220910004', '06', '2', '2012', '1100546238', 1, 22),
('0220910005', '08', '2', '2012', '1143353556', 1, 22),
('0220910006', '08', '2', '2012', '1143358785', 1, 22),
('0220910007', '07', '2', '2012', '1047436247', 1, 22),
('0220910008', '05', '2', '2012', '1143362129', 1, 22),
('0220910009', '08', '2', '2012', '1143357270', 1, 22),
('0220910010', '07', '2', '2012', '1143361183', 1, 22),
('0220910014', '08', '2', '2012', '1102850826', 1, 22),
('0220910015', '08', '2', '2012', '1102849759', 1, 22),
('0220910016', '08', '2', '2012', '1143354081', 1, 22),
('0220910017', '07', '2', '2012', '1047437863', 1, 22),
('0220910018', '07', '2', '2012', '1143354736', 1, 22),
('0220910019', '08', '2', '2012', '1047446020', 1, 22),
('0220910021', '08', '2', '2012', '1047440662', 1, 22),
('0220910022', '05', '2', '2012', '1143344548', 1, 22),
('0220910024', '06', '2', '2012', '1143362803', 1, 22),
('0220910025', '07', '2', '2012', '1044921397', 1, 22),
('0220910026', '06', '2', '2012', '1143354737', 1, 22),
('0220910029', '08', '2', '2012', '1143355214', 1, 22),
('0220910030', '06', '2', '2012', '1047445791', 1, 22),
('0220910032', '06', '2', '2012', '1051447716', 1, 22),
('0220910033', '07', '2', '2012', '1047449606', 1, 22),
('0220910037', '05', '2', '2012', '1047447311', 1, 22),
('0220910038', '06', '2', '2012', '1047448739', 1, 22),
('0220910039', '07', '2', '2012', '1143352985', 1, 22),
('0220910041', '05', '2', '2012', '1143355967', 1, 22),
('0220910043', '08', '2', '2012', '1143360055', 1, 22),
('0220910045', '05', '2', '2012', '1047442548', 1, 22),
('0220911001', '08', '2', '2012', '1047452772', 1, 22),
('0220920001', '05', '2', '2012', '1143357644', 1, 22),
('0220920002', '05', '2', '2012', '1044917440', 1, 22),
('0220920003', '07', '2', '2012', '1143362740', 1, 22),
('0220920004', '05', '2', '2012', '1044919151', 1, 22),
('0220920010', '06', '2', '2012', '1048289166', 1, 22),
('0220920011', '06', '2', '2012', '1047447298', 1, 22),
('0220920013', '07', '2', '2012', '1143359039', 1, 22),
('0220920014', '05', '2', '2012', '1047449043', 1, 22),
('0220920016', '04', '2', '2012', '1143359449', 1, 22),
('0220920018', '06', '2', '2012', '1047428364', 1, 22),
('0220920019', '04', '2', '2012', '1047445429', 1, 22),
('0220920021', '05', '2', '2012', '1143356821', 1, 22),
('0220920022', '05', '2', '2012', '1143366270', 1, 22),
('0220920023', '06', '2', '2012', '1047447867', 1, 22),
('0220920025', '06', '2', '2012', '73160028', 1, 22),
('0220920027', '06', '2', '2012', '1047441644', 1, 22),
('0220920034', '07', '2', '2012', '1143362263', 1, 22),
('0220920035', '06', '2', '2012', '1047412894', 1, 22),
('0220920037', '05', '2', '2012', '1047425314', 1, 22),
('0220920039', '04', '2', '2012', '1044925822', 1, 22),
('0220920040', '05', '2', '2012', '1047451812', 1, 22),
('0220920042', '06', '2', '2012', '1143346442', 1, 22),
('0220920044', '04', '2', '2012', '1047435780', 1, 22),
('0220920047', '06', '2', '2012', '1047395983', 1, 22),
('0221010001', '05', '2', '2012', '1047450650', 1, 22),
('0221010002', '06', '2', '2012', '1143360556', 1, 22),
('0221010004', '03', '2', '2012', '1047456336', 1, 22),
('0221010006', '06', '2', '2012', '1143363501', 1, 22),
('0221010008', '06', '2', '2012', '1047450631', 1, 22),
('0221010009', '04', '2', '2012', '94013126903', 1, 22),
('0221010010', '04', '2', '2012', '1050959364', 1, 22),
('0221010011', '04', '2', '2012', '1047453834', 1, 22),
('0221010012', '05', '2', '2012', '1047457019', 1, 22),
('0221010014', '06', '2', '2012', '1047452823', 1, 22),
('0221010016', '06', '2', '2012', '1143369825', 1, 22),
('0221010017', '06', '2', '2012', '1047452443', 1, 22),
('0221010021', '05', '2', '2012', '1047452868', 1, 22),
('0221010022', '05', '2', '2012', '1143361742', 1, 22),
('0221010023', '04', '2', '2012', '1143353501', 1, 22),
('0221010026', '03', '2', '2012', '1050962068', 1, 22),
('0221010027', '03', '2', '2012', '1050944065', 1, 22),
('0221010028', '05', '2', '2012', '1143365900', 1, 22),
('0221010030', '04', '2', '2012', '1047455664', 1, 22),
('0221010033', '04', '2', '2012', '1047451636', 1, 22),
('0221010034', '04', '2', '2012', '1047455733', 1, 22),
('0221010035', '04', '2', '2012', '1051824073', 1, 22),
('0221010036', '04', '2', '2012', '1047451234', 1, 22),
('0221010037', '04', '2', '2012', '1143338761', 1, 22),
('0221010039', '04', '2', '2012', '1143342266', 1, 22),
('0221010042', '04', '2', '2012', '1047436327', 1, 22),
('0221010043', '04', '2', '2012', '94080912581', 1, 22),
('0221011001', '03', '2', '2012', '1050921792', 1, 22),
('0221019001', '04', '2', '2012', '1123630089', 1, 22),
('0221020011', '03', '2', '2012', '94032929421', 1, 22),
('0221020016', '05', '2', '2012', '1143364669', 1, 22),
('0221020017', '04', '2', '2012', '1143337592', 1, 22),
('0221020018', '04', '2', '2012', '1050961975', 1, 22),
('0221020021', '05', '2', '2012', '1047461706', 1, 22),
('0221020023', '05', '2', '2012', '1047445575', 1, 22),
('0221020026', '05', '2', '2012', '1047421571', 1, 22),
('0221020027', '02', '2', '2012', '1104012279', 1, 22),
('0221020035', '03', '2', '2012', '1143361881', 1, 22),
('0221020037', '03', '2', '2012', '1143361361', 1, 22),
('0221020038', '03', '2', '2012', '94070512747', 1, 22),
('0221020039', '05', '2', '2012', '1047397719', 1, 22),
('0221020042', '04', '2', '2012', '1143368477', 1, 22),
('0221020047', '03', '2', '2012', '1143359411', 1, 22),
('0221020048', '03', '2', '2012', '1143360328', 1, 22),
('0221021001', '03', '2', '2012', '1051742430', 1, 22),
('0221110001', '03', '2', '2012', '1143367742', 1, 22),
('0221110005', '03', '2', '2012', '1047436661', 1, 22),
('0221110008', '02', '2', '2012', '94102600082', 1, 22),
('0221110009', '03', '2', '2012', '1143340921', 1, 22),
('0221110010', '02', '2', '2012', '1143374525', 1, 22),
('0221110012', '03', '2', '2012', '94030113149', 1, 22),
('0221110013', '03', '2', '2012', '1143365170', 1, 22),
('0221110014', '03', '2', '2012', '94110918946', 1, 22),
('0221110015', '04', '2', '2012', '1047461582', 1, 22),
('0221110019', '02', '2', '2012', '1050958642', 1, 22),
('0221110020', '03', '2', '2012', '1143354714', 1, 22),
('0221110021', '03', '2', '2012', '1007027719', 1, 22),
('0221110022', '03', '2', '2012', '1143370194', 1, 22),
('0221110023', '03', '2', '2012', '94050129521', 1, 22),
('0221110024', '02', '2', '2012', '1143367012', 1, 22),
('0221110026', '04', '2', '2012', '94013012827', 1, 22),
('0221110027', '03', '2', '2012', '1047465063', 1, 22),
('0221110029', '03', '2', '2012', '1143360688', 1, 22),
('0221110030', '02', '2', '2012', '1143372412', 1, 22),
('0221110031', '03', '2', '2012', '1047450829', 1, 22),
('0221110032', '03', '2', '2012', '1047464521', 1, 22),
('0221110033', '03', '2', '2012', '94071412207', 1, 22),
('0221110034', '03', '2', '2012', '1047462032', 1, 22),
('0221110035', '03', '2', '2012', '1050962191', 1, 22),
('0221110036', '02', '2', '2012', '94042512456', 1, 22),
('0221110037', '03', '2', '2012', '1143358834', 1, 22),
('0221110038', '03', '2', '2012', '1063162164', 1, 22),
('0221110039', '04', '2', '2012', '94082809524', 1, 22),
('0221110040', '03', '2', '2012', '94061112388', 1, 22),
('0221110043', '03', '2', '2012', '1050962736', 1, 22),
('0221110047', '03', '2', '2012', '94101218869', 1, 22),
('0221110048', '02', '2', '2012', '1044925132', 1, 22),
('0221110049', '03', '2', '2012', '1047437018', 1, 22),
('0221110054', '02', '2', '2012', '1047457012', 1, 22),
('0221110055', '03', '2', '2012', '1047449557', 1, 22),
('0221120002', '03', '2', '2012', '1143346148', 1, 22),
('0221120003', '03', '2', '2012', '1043654907', 1, 22),
('0221120004', '01', '2', '2012', '1102856458', 1, 22),
('0221120006', '02', '2', '2012', '94022213126', 1, 22),
('0221120007', '02', '2', '2012', '1143348541', 1, 22),
('0221120008', '03', '2', '2012', '1047463742', 1, 22),
('0221120009', '02', '2', '2012', '1050036574', 1, 22),
('0221120010', '01', '2', '2012', '94041213021', 1, 22),
('0221120011', '01', '2', '2012', '94101329261', 1, 22),
('0221120013', '02', '2', '2012', '1143360796', 1, 22),
('0221120015', '03', '2', '2012', '1047455030', 1, 22),
('0221120016', '02', '2', '2012', '1143370739', 1, 22),
('0221120018', '02', '2', '2012', '1143370871', 1, 22),
('0221120020', '02', '2', '2012', '1143347094', 1, 22),
('0221120021', '02', '2', '2012', '1047461938', 1, 22),
('0221120023', '02', '2', '2012', '1143366580', 1, 22),
('0221120024', '02', '2', '2012', '1047457703', 1, 22),
('0221120025', '02', '2', '2012', '45565790', 1, 22),
('0221120030', '03', '2', '2012', '94082017962', 1, 22),
('0221120031', '02', '2', '2012', '1143361663', 1, 22),
('0221120032', '02', '2', '2012', '1128044691', 1, 22),
('0221120034', '02', '2', '2012', '1047447643', 1, 22),
('0221120037', '02', '2', '2012', '1047460999', 1, 22),
('0221120040', '02', '2', '2012', '94060618024', 1, 22),
('0221120041', '02', '2', '2012', '1143374892', 1, 22),
('0221120044', '02', '2', '2012', '1050038122', 1, 22),
('0221120046', '02', '2', '2012', '94030128820', 1, 22),
('0221120048', '02', '2', '2012', '1143336423', 1, 22),
('0221210001', '02', '2', '2012', '1047409363', 1, 22),
('0221210002', '02', '2', '2012', '96050717868', 1, 22),
('0221210003', '02', '2', '2012', '95042728803', 1, 22),
('0221210004', '01', '2', '2012', '94092012705', 1, 22),
('0221210005', '02', '2', '2012', '1047406088', 1, 22),
('0221210006', '02', '2', '2012', '1143356182', 1, 22),
('0221210007', '02', '2', '2012', '1047451778', 1, 22),
('0221210008', '02', '2', '2012', '1047428270', 1, 22),
('0221210009', '02', '2', '2012', '1143363125', 1, 22),
('0221210010', '02', '2', '2012', '95090631781', 1, 22),
('0221210011', '02', '2', '2012', '94103118306', 1, 22),
('0221210012', '02', '2', '2012', '95031729921', 1, 22),
('0221210013', '02', '2', '2012', '97021208802', 1, 22),
('0221210014', '02', '2', '2012', '95080909765', 1, 22),
('0221210015', '02', '2', '2012', '94122908385', 1, 22),
('0221210017', '02', '2', '2012', '95051908709', 1, 22),
('0221210019', '01', '2', '2012', '94061713829', 1, 22),
('0221210020', '01', '2', '2012', '95021005887', 1, 22),
('0221210021', '01', '2', '2012', '94110130885', 1, 22),
('0221210022', '02', '2', '2012', '95032726225', 1, 22),
('0221210023', '02', '2', '2012', '95090510305', 1, 22),
('0221210025', '01', '2', '2012', '95101128408', 1, 22),
('0221210027', '02', '2', '2012', '95092931464', 1, 22),
('0221210028', '01', '2', '2012', '95022809661', 1, 22),
('0221210030', '02', '2', '2012', '95111928100', 1, 22),
('0221210031', '02', '2', '2012', '94011911522', 1, 22),
('0221210032', '01', '2', '2012', '94070528902', 1, 22),
('0221210034', '02', '2', '2012', '1128050684', 1, 22),
('0221210037', '01', '2', '2012', '1143344875', 1, 22),
('0221210039', '02', '2', '2012', '1143362910', 1, 22),
('0221210040', '02', '2', '2012', '1047457194', 1, 22),
('0221210041', '01', '2', '2012', '1051823829', 1, 22),
('0221210042', '01', '2', '2012', '1047460099', 1, 22),
('0221210043', '01', '2', '2012', '1143359519', 1, 22),
('0221210044', '01', '2', '2012', '94021311965', 1, 22),
('0221210045', '01', '2', '2012', '96121227549', 1, 22),
('0221210049', '01', '2', '2012', '1047450734', 1, 22),
('0221210052', '01', '2', '2012', '94112312344', 1, 22),
('0221220001', '01', '2', '2012', '1047443719', 1, 22),
('0221220002', '01', '2', '2012', '1047421446', 1, 22),
('0221220003', '01', '2', '2012', '1143346639', 1, 22),
('0221220004', '01', '2', '2012', '1099963163', 1, 22),
('0221220005', '01', '2', '2012', '94120714265', 1, 22),
('0221220006', '01', '2', '2012', '1047446583', 1, 22),
('0221220007', '01', '2', '2012', '1051672967', 1, 22),
('0221220008', '01', '2', '2012', '95120416767', 1, 22),
('0221220009', '01', '2', '2012', '1047451644', 1, 22),
('0221220010', '01', '2', '2012', '96012927646', 1, 22),
('0221220012', '01', '2', '2012', '95103030022', 1, 22),
('0221220013', '01', '2', '2012', '95051127502', 1, 22),
('0221220014', '01', '2', '2012', '95050831966', 1, 22),
('0221220015', '01', '2', '2012', '94100816845', 1, 22),
('0221220017', '01', '2', '2012', '1044913334', 1, 22),
('0221220018', '01', '2', '2012', '1047418845', 1, 22),
('0221220019', '01', '2', '2012', '94110516562', 1, 22),
('0221220020', '01', '2', '2012', '95052429715', 1, 22),
('0221220021', '01', '2', '2012', '1104870798', 1, 22),
('0221220022', '01', '2', '2012', '95082029002', 1, 22),
('0221220023', '01', '2', '2012', '1143354702', 1, 22),
('0221220024', '01', '2', '2012', '1104866832', 1, 22),
('0221220025', '01', '2', '2012', '1007208350', 1, 22),
('0221220026', '01', '2', '2012', '96040313645', 1, 22),
('0221220027', '01', '2', '2012', '95040530224', 1, 22),
('0221220028', '01', '2', '2012', '1103110408', 1, 22),
('0221220029', '01', '2', '2012', '94120932424', 1, 22),
('0221220030', '01', '2', '2012', '1047462295', 1, 22),
('0221220031', '01', '2', '2012', '1102859180', 1, 22),
('0221220032', '01', '2', '2012', '95070226988', 1, 22),
('0221220033', '01', '2', '2012', '1128059390', 1, 22),
('0221220034', '01', '2', '2012', '1143367682', 1, 22),
('0221220035', '01', '2', '2012', '94102525803', 1, 22),
('0221220036', '01', '2', '2012', '1047460836', 1, 22),
('0221220037', '01', '2', '2012', '1143359150', 1, 22),
('0221220039', '01', '2', '2012', '95051532520', 1, 22),
('0221220040', '01', '2', '2012', '94091530583', 1, 22),
('0221220041', '01', '2', '2012', '1143359984', 1, 22),
('0221220042', '01', '2', '2012', '1143356946', 1, 22),
('0221220043', '01', '2', '2012', '1101450188', 1, 22),
('0221220044', '01', '2', '2012', '1047435280', 1, 22),
('0221220045', '01', '2', '2012', '1047458073', 1, 22),
('0221220046', '01', '2', '2012', '94080529001', 1, 22),
('0221220047', '01', '2', '2012', '1047425645', 1, 22);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factor`
--

CREATE TABLE IF NOT EXISTS `factor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(100) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `modelo_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_factor_modelo1_idx` (`modelo_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=23 ;

--
-- Volcado de datos para la tabla `factor`
--

INSERT INTO `factor` (`id`, `codigo`, `nombre`, `modelo_id`) VALUES
(3, '1', 'Misión, Proyecto Institucional y de programa', 1),
(4, '2', ' Estudiantes', 1),
(5, '3', ' Profesores', 1),
(6, '4', ' Procesos académicos', 1),
(7, '5', ' Visibilidad nacional e internacional', 1),
(8, '6', ' Investigación, innovación, creación artística y cultural', 1),
(9, '7', ' Bienestar institucional', 1),
(10, '8', ' Organización, administración y gestión', 1),
(11, '9', ' Impacto de los egresados en el medio', 1),
(12, '10', ' Recursos físicos y financieros', 1),
(13, '1', 'Cumplimiento de los objetivos del programa', 2),
(14, '2', 'Estudiantes', 2),
(15, '3', 'Profesores', 2),
(16, '4', 'Procesos Académicos y Lineamientos Curriculares', 2),
(17, '5', 'Investigación: Calidad, Pertinencia y Producción Científica', 2),
(18, '6', 'Articulación con el Entorno y Capacidad para Generar Procesos de Innovación', 2),
(19, '7', 'Internacionalización, alianzas estratégicas e inserción en redes científicas globales', 2),
(20, '8', 'Bienestar y ambiente institucional', 2),
(21, '9', 'Graduados y Análisis de Impacto', 2),
(22, '10', 'Recursos Físicos y Gestión Administrativa y Financiera', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `facultad`
--

CREATE TABLE IF NOT EXISTS `facultad` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `descripcion` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre_UNIQUE` (`nombre`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=100 ;

--
-- Volcado de datos para la tabla `facultad`
--

INSERT INTO `facultad` (`id`, `nombre`, `descripcion`) VALUES
(1, 'FACULTAD DE CIENCIAS HUMANAS', NULL),
(2, 'FACULTAD DE CIENCIAS SOCIALES Y EDUCACION', NULL),
(3, 'FACULTAD DE MEDICINA', NULL),
(4, 'FACULTAD DE ODONTOLOGIA', NULL),
(5, 'FACULTAD DE INGENIERIA', NULL),
(6, 'FACULTAD DE DERECHO Y CIENCIAS POLITICAS', NULL),
(7, 'FACULTAD DE CIENCIAS  FARMACEUTICAS', NULL),
(8, 'FACULTAD DE ENFERMERIA', NULL),
(9, 'FACULTAD DE CIENCIAS ECONOMICAS', NULL),
(10, 'CREAD - CARTAGENA', NULL),
(11, 'CREAD - MAGANGUE', NULL),
(12, 'CREAD - SIMITI', NULL),
(13, 'CREAD - S. ROSA', NULL),
(14, 'CREAD - S. MARCOS', NULL),
(15, 'CREAD - S. ESTANISLAO', NULL),
(16, 'FACULTAD DE CIENCIAS EXACTAS Y NATURALES', NULL),
(17, 'CERES - CARTAGENA', NULL),
(18, 'CREAD - C. BOLIVAR', NULL),
(19, 'CREAD - TURBACO', NULL),
(20, 'CREAD - PINILLOS', NULL),
(21, 'CREAD - ACHI', NULL),
(22, 'CREAD - LORICA', NULL),
(23, 'CREAD - S. ONOFRE', NULL),
(24, 'CREAD - SAN JACINTO DEL CAUCA', NULL),
(25, 'ESCUELA DE EDUCACIÓN PARA EL TRABAJO Y EL DESARROLLO HUMANO', NULL),
(27, 'CREAD - SINCE', NULL),
(28, 'CREAD - SAN JUAN NEPO', NULL),
(29, 'CREAD - CLEMENCIA', NULL),
(30, 'CREAD - MARIA LA BAJA', NULL),
(31, 'CREAD', NULL),
(32, 'CERES - NELSON MANDELA', NULL),
(33, 'CERES - POZON', NULL),
(34, 'CERES - PASACABALLOS', NULL),
(35, 'INSTITUTO DE POLITICAS PUBLICAS REGIONALES Y DE GOBIERNO', NULL),
(36, 'INSTITUTO DE MATEMATICAS APLICADA', NULL),
(60, 'DOCTORADO EN CIENCIAS DE LA EDUCACIÓN CADE UNIVERSIDAD DE CARTAGENA', NULL),
(98, 'CURSOS DE INGLÉS', NULL),
(99, 'CURSOS VIRTUALES', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fuente`
--

CREATE TABLE IF NOT EXISTS `fuente` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `descripcion` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Volcado de datos para la tabla `fuente`
--

INSERT INTO `fuente` (`id`, `nombre`, `descripcion`) VALUES
(1, 'Estudiantes', 'Estudiantes'),
(2, 'Docentes', 'Docentes'),
(3, 'Administrativos', 'Administrativos'),
(4, 'Egresados', 'Egresados'),
(5, 'Directores de programa', 'Directores de programa'),
(6, 'Empleadores', 'Empleadores');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `indicador`
--

CREATE TABLE IF NOT EXISTS `indicador` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(100) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `caracteristica_id` int(11) DEFAULT NULL,
  `modelo_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_indicador_caracteristica1_idx` (`caracteristica_id`),
  KEY `fk_indicador_modelo1` (`modelo_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=422 ;

--
-- Volcado de datos para la tabla `indicador`
--

INSERT INTO `indicador` (`id`, `codigo`, `nombre`, `caracteristica_id`, `modelo_id`) VALUES
(1, '1.1.1', 'Documentos institucionales en los que se expresa la misión y visión de la institución.', 1, 1),
(2, '1.1.2', 'Existencia y utilización de medios para difundir la misióny visión institucional.', 1, 1),
(3, '1.1.3', 'Grado de correspondencia entre el contenido de la misión, visión institucional y los objetivos del programa académico.', 1, 1),
(4, '1.1.4', 'Porcentaje de directivos, profesores, personal administrativo, estudiantes y egresados que entienden el sentido de la Misión, Visión del programa y la comparten.', 1, 1),
(5, '1.1.5', 'Existencia políticas que garanticen el acceso a la educación superior sin discriminación, así mismo para orientar identificar, eliminar o disminuir barreras en infraestructura física, accesibilidad y movilidad.', 1, 1),
(6, '1.2.1', 'Existencia y utilización de estrategias y mecanismos establecidos para la discusión, actualización y difusióndel proyecto educativo del programa académico.', 2, 1),
(7, '1.2.2', 'Porcentaje de directivos, profesores y estudiantes que conocen y comparten el sentido del proyecto educativo del programa', 2, 1),
(8, '1.2.3', 'Apreciación de directivos, profesores y estudiantes sobre la existencia de espacios institucionales para la discusión y actualización permanente del proyecto educativo del programa.', 2, 1),
(9, '1.2.4', 'Correspondencia entre el proyecto educativo del programa y el proyecto institucional.', 2, 1),
(10, '1.2.5', 'Existencia del Modelo pedagógico en el PEP que refleje la metodología de enseñanza que utilice el programa', 2, 1),
(11, '1.2.6', 'Existencia de documento que relacione lo expresado en el PEP con las actividades académicas desarrolladas', 2, 1),
(12, '1.2.7', 'Existencia de documentos que evidencien actividades de seguimiento del PEP', 2, 1),
(13, '1.3.1', 'Evidencia sobre la reflexión y análisis de las tendencias y líneas de desarrollo en áreas disciplinares a nivel local, regional, nacional e internacional', 3, 1),
(14, '1.3.2', 'Número y tipo de actividades del programa que muestran la relación del plan curricular con las necesidades locales, regionales, nacionales e internacionales.', 3, 1),
(15, '1.3.3', 'Apreciación de empleadores del sector público y/o privado y demás entes locales, regionales, nacionales o internacionales sobre la relevancia académica y pertinencia social del programa, y sobre el reconocimiento de sus egresados.', 3, 1),
(16, '1.3.4', 'Número y tipo de actividades y/o proyectos que adelanta el programa de acuerdo a las necesidades del entorno.', 3, 1),
(17, '1.3.5', 'Existencia de estudios y/o proyectos formulados o en desarrollo, que propendan por la modernización, actualización y pertinencia del currículo.', 3, 1),
(18, '1.3.6', 'Estudio en el cual se exprese el impacto del programa en el medio.', 3, 1),
(19, '2.4.1', 'Existencia de políticas, criterios y reglamentaciones para la admisión de estudiantes de manera transparente.', 4, 1),
(20, '2.4.2', 'Relación de estudiantes que ingresaron mediante la aplicación de reglas generales y mecanismos de admisión excepcionales, en los últimos cinco años.', 4, 1),
(21, '2.4.3', 'Evidencias de evaluación y seguimiento a los procesos de selección y admisión y aplicación de los resultados de dicha evaluación.', 4, 1),
(22, '2.4.4', 'Existencia de políticas y procedimientos para el ingreso de estudiantes en condición de transferencia, homologación u otro proceso que amerite criterios específicos para el tránsito entre ciclos, niveles y/o instituciones.', 4, 1),
(23, '2.4.5', 'Evidencia de beneficios de los requerimientos de homologación y transferencia para los estudiantes.', 4, 1),
(24, '2.5.1', 'Documentos que expresen las políticas institucionales para la definición del número de estudiantes que se admiten al programa, acorde con el cuerpo docente, recursos físicos y apoyo académico disponibles.', 5, 1),
(25, '2.5.2', 'Apreciación de profesores y estudiantes del programa con respecto a la relación entre el número de admitidos, el cuerpo docente y los recursos académicos y físicos disponibles.', 5, 1),
(26, '2.5.3', 'Población de estudiantes que ingresó al programa en los últimos cinco años, el puntaje promedio obtenido por los admitidos en las Pruebas de Estado, el puntaje promedio estandarizado en pruebas de admisión cuando éstas se realicen, el puntaje mínimo acept', 5, 1),
(27, '2.5.4', 'Programas de salud. Relación de convenios docencia-servicio requeridos para los objetivos del Programa.', 5, 1),
(28, '2.5.5', 'Programas de salud. Relación entre el número de estudiantes y la capacidad instalada de los escenarios de práctica (camas, docentes, tutores, investigadores, entre otros).', 5, 1),
(29, '2.5.6', 'Programas de salud, Relación de profesores asistenciales, nivel de formación y experiencia en formación.', 5, 1),
(30, '2.6.1', 'Documentos institucionales en los que se expresan las políticas y estrategias definidas por el programa en materia de formación integral de los estudiantes.', 6, 1),
(31, '2.6.2', 'Apreciación de los estudiantes sobre la calidad de los espacios y estrategias que ofrece el programa, de acuerdo con la naturaleza y orientación de éste, para la participación en grupos o centros de estudio, proyectos de experimentación o de desarrollo em', 6, 1),
(32, '2.6.3', 'Número de estudiantes que participan en grupos de estudio, proyectos de experimentación o de desarrollo empresarial o en las demás actividades académicas y culturales distintas de la docencia que brinda la Institución o el Programa para contribuir a la fo', 6, 1),
(33, '2.7.1', 'Evidencias de mecanismos de divulgación del Reglamento Estudiantil en el Programa', 7, 1),
(34, '2.7.2', 'Apreciación de estudiantes y profesores del programa sobre la pertinencia, vigencia y aplicación del reglamento estudiantil.', 7, 1),
(35, '2.7.3', 'Evidencias de aplicación del Reglamento estudiantil en situaciones especiales de los estudiantes.', 7, 1),
(36, '2.7.4', 'Apreciación de directivos, profesores y estudiantes sobre la participación del estudiantado en los órganos de dirección del programa.', 7, 1),
(37, '2.7.5', 'Documentos que contengan Políticas y estrategias para estímulos académicos para los estudiantes.', 7, 1),
(38, '2.7.6', 'Relación de estudiantes que han sido beneficiarios de estímulos académicos en los últimos cinco años.', 7, 1),
(39, '3.8.1', 'Documentos que evidencien la aplicación de las políticas, normas y criterios académicos establecidos por la Institución para la selección y la vinculación de sus profesores de planta y de cátedra', 8, 1),
(40, '3.8.2', 'Porcentaje de profesores que, en los últimos cinco años, fue vinculado al programa en desarrollo de dichas políticas, normas y criterios académicos.', 8, 1),
(41, '3.8.3', 'Documentos que contengan la Política Institucional de Relevo generacional.', 8, 1),
(42, '3.8.4', 'Porcentaje de directivos, profesores y estudiantes que conoce las políticas, normas y criterios académicos establecidos por la institución para la selección y vinculación de sus profesores.', 8, 1),
(43, '3.9.1', 'Documentos que contengan Reglamento Profesoral.', 9, 1),
(44, '3.9.2', 'Evidencia documental de estrategias de divulgación del Estatuto Profesoral.', 9, 1),
(45, '3.9.3', 'Apreciación de directivos y profesores del programa sobre la pertinencia, vigencia y aplicación del Reglamento Profesoral.', 9, 1),
(46, '3.9.4', 'Información actualizada sobre el número de profesores adscritos a la facultad, al programa o departamento que sirva al mismo, por categorías académicas establecidas en el escalafón.', 9, 1),
(47, '3.9.5', 'Evidencia de la aplicación de las políticas institucionales en materia de ubicación, permanencia y ascenso en las categorías del escalafón docente.', 9, 1),
(48, '3.9.6', 'Apreciación de directivos y profesores sobre la aplicación de las políticas institucionales en materia de participación del profesorado en los órganos de dirección de la institución y del programa', 9, 1),
(49, '3.9.7', 'Documentos donde se evidencie la participación de los profesores en los órganos de dirección del programa, de la facultad, y/o de la institución, durante los últimos cinco años.', 9, 1),
(50, '3.10.1', 'Documento que relacione los profesores de planta con título de especialización, maestría y doctorado con el objeto de conocimiento del programa adscritos directamente o a través de la facultad o departamento respectivo.', 10, 1),
(51, '3.10.2', 'Información demostrada acerca de las instituciones en las cuales fueron formados los profesores vinculados al programa.', 10, 1),
(52, '3.10.3', 'Porcentaje del tiempo de cada profesor del programa que se dedica a la docencia, a la investigación o creación artística, a la extensión o proyección social, a la atención de funciones administrativas, y a la tutoría académica individual a los estudiantes', 10, 1),
(53, '3.10.4', 'Porcentaje de profesores con dedicación de tiempo completo, medio tiempo al programa y porcentaje de profesores catedráticos.', 10, 1),
(54, '3.10.5', 'Relación entre el número de estudiantes del programa y el número de profesores al servicio del mismo, en relación a su proyecto educativo.', 10, 1),
(55, '3.10.6', 'Apreciación de directivos, profesores y estudiantes del programa sobre la calidad y la suficiencia del número y de la dedicación de los profesores al servicio de éste.', 10, 1),
(56, '3.10.7', 'Documentos en los que se explicite el sistema de tutoría a los estudiantes por parte de los profesores y se indique el tipo de tutoría que se ofrece, tiempo dedicado y medios y recursos disponibles.', 10, 1),
(57, '3.11.1', 'Documentos institucionales que contengan Políticas institucionales en materia de desarrollo integral del profesorado, que incluyan la capacitación y actualización en los aspectos académicos, profesionales y pedagógicos relacionados con la metodología del ', 11, 1),
(58, '3.11.2', 'Evidencias de Programas, estrategias y mecanismos institucionales para fomentar el desarrollo integral, la capacitación y actualización profesional, pedagógica y docente, de los profesores', 11, 1),
(59, '3.11.3', 'Porcentaje de profesores del programa que ha participado en los últimos cinco años en programas de desarrollo profesoral o que ha recibido apoyo a la capacitación y actualización permanente, como resultado de las políticas institucionales orientadas para ', 11, 1),
(60, '3.11.4', 'Apreciación de directivos y profesores del programa sobre el impacto que han tenido las acciones orientadas al desarrollo integral de los profesores, en el enriquecimiento de la calidad del programa.', 11, 1),
(61, '3.11.5', 'Evidencias de la realización de eventos académicos desarrollados por expertos en procesos pedagógicos, de acuerdo con el tipo de metodología del programa', 11, 1),
(62, '3.11.6', 'Numero de profesores que han sido reconocidos Institucionalmente por procesos de creación artística y cultural.', 11, 1),
(63, '3.11.7', 'Evidencias documentales de procesos de actualización docente relacionados con la atención a la diversidad poblacional.', 11, 1),
(64, '3.11.8', 'Existencia de políticas, estrategias y programas para el perfeccionamiento docente tanto en la disciplina como en los distintos aspectos relacionados con la modalidad de enseñanza en que se ofrece el programa.', 11, 1),
(65, '3.12.1', 'Documentos institucionales que contengan políticas de estímulos y reconocimiento a los profesores por el ejercicio calificado de la investigación, de la creación artística, de la docencia, de la extensión o proyección social y de la cooperación internacio', 12, 1),
(66, '3.12.2', 'Documentos Institucionales que contengan estrategias para la promoción de creación artística y cultural, la innovación, la adaptación, la transferencia técnica y tecnológica, la creación de tecnofactos y prototipos, y la obtención de patentes, de acuerdo ', 12, 1),
(67, '3.12.3', 'Porcentaje de los profesores del programa que, en los últimos cinco años, ha recibido reconocimientos y estímulos institucionales por el ejercicio calificado de la docencia, la investigación, la creación artística, la extensión o proyección social y la co', 12, 1),
(68, '3.12.4', 'Apreciación de directivos y profesores del programa sobre el impacto que, para el enriquecimiento de la calidad del programa, ha tenido el régimen de estímulos al profesorado por el ejercicio calificado de la docencia, la investigación, la creación artíst', 12, 1),
(69, '3.13.1', 'Porcentaje de los profesores del programa que, en los últimos cinco años, han elaborado materiales de apoyo docente, pertinentes a la naturaleza y metodología del programa y su función pedagógica.', 13, 1),
(70, '3.13.2', 'Apreciación de los estudiantes del programa, sobre la calidad, pertinencia y eficacia de los materiales de apoyo producidos por los docentes del programa de acuerdo a su metodología.', 13, 1),
(71, '3.13.4', 'Premios u otros reconocimientos significativos en el ámbito nacional o internacional que hayan merecido los materiales de apoyo a la labor docente, producido por los profesores del programa.', 13, 1),
(72, '3.13.5', 'Documento que contenga Régimen de propiedad intelectual en la institución.', 13, 1),
(73, '3.14.1', 'Documentos institucionales que contengan las políticas y reglamentaciones institucionales en materia de remuneración de los profesores, en atención a los méritos y producción académica debidamente evaluada.', 14, 1),
(74, '3.14.2', 'Documentos que evidencien la aplicación de esta política en los docentes del Programa.', 14, 1),
(75, '3.14.3', 'Nivel de correspondencia entre la remuneración que han de recibir los profesores, establecida en las normas legales e institucionales vigentes, y la que reciben por sus servicios al programa.', 14, 1),
(76, '3.14.4', 'Apreciación de los profesores del programa con respecto a la correspondencia entre la remuneración y los méritos académicos y profesionales del profesorado,', 14, 1),
(77, '3.15.1', 'Documentos institucionales que contengan las políticas en materia de evaluación integral al desempeño del profesorado.', 15, 1),
(78, '3.15.2', 'Documentos que evidencien la aplicación de la política de evaluación en los docentes del Programa.', 15, 1),
(79, '3.15.3', 'Evaluaciones realizadas a los profesores adscritos al programa durante los últimos cinco años y las acciones adelantadas por la Institución y por el programa a partir de dichos resultados', 15, 1),
(80, '3.15.4', 'Evaluaciones realizadas a los profesores adscritos al programa durante los últimos cinco años y las acciones adelantadas por la Institución y por el programa a partir de dichos resultados', 15, 1),
(81, '3.15.5', 'Apreciación de los profesores adscritos al programa, sobre los criterios y mecanismos para la evaluación de docentes, su transparencia, equidad y eficacia.', 15, 1),
(82, '4.16.1', 'Existencia de criterios y mecanismos para el seguimiento y evaluación del desarrollo de las competencias genéricas o transversales, específicas e institucionales y comunicativas propias del ejercicio y de la cultura de la profesión o la disciplina en la q', 16, 1),
(83, '4.16.2', 'Existencia de un sistema de créditos que responda a los lineamientos y al plan curricular establecido.', 16, 1),
(84, '4.16.3', 'Porcentaje de los créditos académicos del programa asignado a asignaturas y a actividades orientadas a ampliar la formación del estudiante', 16, 1),
(85, '4.16.4', 'Porcentaje de actividades distintas a la docencia y la investigación dedicadas al desarrollo de habilidades para el análisis de las dimensiones ética, estética, filosófica, científica, económica, política y social de problemas ligados al programa, a las c', 16, 1),
(86, '4.16.5', 'Apreciación de directivos, profesores, y estudiantes, sobre la calidad e integralidad del currículo.', 16, 1),
(87, '4.16.6', 'Estadísticas de las calificaciones promedio de los estudiantes de las pruebas de estado de educación superior, en los últimos cinco años con respecto al promedio nacional.', 16, 1),
(88, '4.16.7', 'Análisis comparativo por cohorte del promedio de los resultados obtenidos por lo estudiantes en las pruebas Saber Once y las pruebas de Estado Saber Pro.', 16, 1),
(89, '4.16.8', 'Evidencias sobre Articulación del plan de estudios con los diversos niveles de formación (periodos académicos, especialización, maestría y doctorado, componentes propedéuticos y /o ciclos, entre otros.', 16, 1),
(90, '4.16.9', 'Número de cursos de segunda lengua ofrecidos, número de estudiantes matriculados, número de estudiantes aprobados.', 16, 1),
(91, '4.16.10', 'Grado de correspondencia entre competencias y actividades pedagógicas y didácticas – Modelo Pedagógico.', 16, 1),
(92, '4.16.11', 'Existencia de políticas, estrategias y acciones que promueven la formación integral del estudiante desde la modalidad en que se ofrece el programa.', 16, 1),
(93, '4.17.1', 'Existencia de documentos que evidencien la aplicación de políticas institucionales de flexibilidad curricular que optimice el transito del estudiante y aseguren la continuidad, electividad y movilidad en el programa y entre programas.\n\n', 17, 1),
(94, '4.17.2', 'Evidencia de lineamientos institucionales en materia de movilidad del estudiante en el sistema educativo que garanticen homologación de créditos y reconocimientos de experiencias educativas.', 17, 1),
(95, '4.17.3', 'Existencia de lineamientos en el programa para las revisión y actualización del currículo.\n \n \n', 17, 1),
(96, '4.17.4', 'Existencia de revisiones curriculares a la luz de los desarrollos disciplinares profesionales y pedagógicos en los últimos cinco años.', 17, 1),
(97, '4.17.5', 'Porcentaje de flexibilidad curricular que tiene el programa con relación al programa en otras instituciones educativas nacionales e internacionales.', 17, 1),
(98, '4.17.6', 'Grado de apreciación de directivos, profesores y estudiantes sobre la aplicación y eficacia de las políticas institucionales en materia de flexibilidad curricular.', 17, 1),
(99, '4.17.7', 'Número de estudiantes en movilidad estudiantil con otras instituciones nacionales e internacionales en los últimos cinco años.', 17, 1),
(100, '4.17.8', 'Evidencia de lineamientos institucionales sobre homologación de créditos y articulación del pregrado al postgrado.', 17, 1),
(101, '4.17.9', 'Evidencia de lineamientos institucionales sobre homologación de créditos y articulación del pregrado al postgrado.', 17, 1),
(102, '4.17.10', 'Documento que evidencie convenios activos y relaciones de cooperación con instituciones de Educación media y superior establecidos por la institución que garanticen el transito y continuidad de estudiantes en el sistema educativo de los programas por cicl', 17, 1),
(103, '4.17.11', 'Documento que evidencie convenios activos y relaciones de cooperación con instituciones establecidos por la institución que garanticen el transito y continuidad de estudiantes y su inserción en el sistema productivo de acuerdo con el tipo y modalidad del ', 17, 1),
(104, '4.17.12', 'Documentos donde se evidencie la participación de estudiantes en el diseño de su propio plan académico a partir de la oferta académica.', 17, 1),
(105, '4.17.13', 'Apreciación de estudiantes en la participación en el diseño y evaluación de su propio plan académico a partir de la oferta académica de acuerdo con sus intereses y la adquisición de competencias.', 17, 1),
(106, '4.17.14', 'Evidencias de prácticas en instituciones del sector público o privado en que se articulen y afirmen el carácter secuencial y complementario de los ciclos de acuerdo con el tipo y modalidad del programa.', 17, 1),
(107, '4.17.15', 'Evidencia de la aplicación de distintas estrategias de enseñanza-aprendizaje .en las asignaturas del programa.', 17, 1),
(108, '4.17.16', 'Porcentaje de Créditos académicos asignados a las diversas opciones formativas electivas y libres que asigna el Programa a los cursos en la modalidad de educación en que se ofrece el programa.', 17, 1),
(109, '4.17.17', 'Información verificable sobre las estrategias pedagógicas que facilitan diversos estilos y ritmos de aprendizaje y de administración del tiempo por los estudiantes que participan en el programa.', 17, 1),
(110, '4.18.1', 'Existencia de criterios y políticas institucionales que garantizan la participación de distintas unidades académicas y de los docentes de las mismas, en la solución de problemas pertinentes al programa.', 18, 1),
(111, '4.18.2', 'Apreciación de profesores y estudiantes del programa sobre la pertinencia y eficacia de la interdisciplinariedad del programa en el enriquecimiento de la calidad del mismo.', 18, 1),
(112, '4.18.3', 'Existencia de espacios y actividades curriculares con carácter explícitamente interdisciplinario.', 18, 1),
(113, '4.18.4', 'Información verificable sobre la Interacción de alumnos y profesores con pares en Redes de Aprendizaje y Comunidades Virtuales. (programas a distancia)', 18, 1),
(114, '4.19.1', 'Evidencia de la existencia de concordancia y correspondencia de los métodos de enseñanza y aprendizaje utilizados con las competencias, objetivos y contenidos del plan de estudios y el tipo y metodología y modalidad del programa .Proyectos docentes, const', 19, 1),
(115, '4.19.2', 'Apreciación de los estudiantes, profesores y directivos del programa sobre la correspondencia entre los métodos de enseñanza y aprendizaje que se emplean en el programa y el desarrollo de los contenidos del plan de estudios.', 19, 1),
(116, '4.19.3', 'Evidencia de registros de asesorías y acompañamiento del docente a los trabajos realizados por los estudiantes acordes con el tipo y metodología del programa.', 19, 1),
(117, '4.19.4', 'Evidencia de acciones que demuestren la incorporación de los avances en las ciencias, las técnicas y las tecnologías implicadas de acuerdo con el tipo de disciplina y modalidad del programa.', 19, 1),
(118, '4.19.5', 'Existencia de documento institucional que exprese las diferentes estrategias pedagógicas, didácticas y comunicativas acordes con la metodología y las posibilidades tecnológicas utilizados por los estudiantes en atención a su diversidad.', 19, 1),
(119, '4.19.6', 'Grado de correlación entre las estrategias pedagógicas propias de la metodología de enseñanza y los recursos tecnológicos utilizados.', 19, 1),
(120, '4.19.7', 'Documento que evidencie la integración docencia, investigación, y proyección social del programa.', 19, 1),
(121, '4.19.8', 'Evidencia de estrategias implementadas por el programa que garanticen el éxito académico de los estudiantes en el tiempo previsto para el desarrollo del plan de estudios.', 19, 1),
(122, '4.19.9', 'Registros estadísticos sobre población de estudiantes por semestre en los últimos 5 cinco cohortes.', 19, 1),
(123, '4.19.10', 'Evidencia de seguimiento y acompañamiento especial a estudiantes en condición de vulnerabilidad y discapacidad, entre otros.', 19, 1),
(124, '4.19.11', 'Verificación de la correspondencia entre el desarrollo de los contenidos del plan de estudios y las metodologías de enseñanza propuestas para la modalidad de enseñanza en que se ofrece el programa.', 19, 1),
(125, '4.19.12', 'Información verificable sobre las estrategias pedagógicas orientadas a fortalecer procesos de aprendizaje abierto, flexible y autónomo.', 19, 1),
(126, '4.19.13', 'Información verificable de la articulación entre las estrategias pedagógicas propias de la modalidad de enseñanza y los recursos tecnológicos utilizados.', 19, 1),
(127, '4.20.1', 'Existencia de criterios, políticas y reglamentaciones institucionales y del programa en materia de evaluación académica de los estudiantes y divulgación de la misma.', 20, 1),
(128, '4.20.2', 'Correspondencia entre las formas de evaluación de los aprendizajes, los propósitos de formación y los perfiles de egreso definidos por el programa.', 20, 1),
(129, '4.20.3', 'Apreciación de directivos, profesores y estudiantes del programa sobre la correspondencia entre las formas de evaluación académica de los estudiantes, la naturaleza del programa y los métodos pedagógicos empleados para el desarrollo.', 20, 1),
(130, '4.20.4', 'Apreciación de los estudiantes acerca de la transparencia y equidad con que se aplica el sistema de evaluación académica.', 20, 1),
(131, '4.20.5', 'Existencia de criterios y procedimientos para la revisión y evaluación de los sistemas de evaluación académica de los estudiantes.', 20, 1),
(132, '4.21.1', 'Documento que evidencie el grado de correspondencia entre el tipo de trabajos y actividades realizadas por los estudiantes respecto a los objetivos del programa.', 21, 1),
(133, '4.21.2', 'Existencia de documento que evidencie el seguimiento de la labor académica de los estudiantes y su relación con el sistema de créditos', 21, 1),
(134, '4.21.3', 'Apreciación de directivos y profesores sobre la calidad de trabajos realizados por los estudiantes y los propósitos de formación.', 21, 1),
(135, '4.21.4', 'Grado de correspondencia entre las actividades y trabajos realizados por los estudiantes y las formas de evaluación por competencias según la naturaleza del programa y los métodos pedagógicos empleados para desarrollar los diversos procesos de formación.', 21, 1),
(136, '4.21.5', 'Número y título de trabajos realizados por estudiantes del programa en los últimos cinco años que han merecido premios o reconocimientos significativos de parte de la comunidad académica nacional o internacional.', 21, 1),
(137, '4.21.6', 'Información verificable sobre la existencia de estrategias de seguimiento del trabajo personal y colectivo realizado por los estudiantes del programa para potenciar, a través de la asesoría, su aprendizaje, el logro de los objetivos y el desarrollo de las', 21, 1),
(138, '4.22.1', 'Documentos institucionales que expresen las políticas en materia de evaluación y autorregulación.', 22, 1),
(139, '4.22.2', 'Existencia de mecanismos para el seguimiento, evaluación y mejoramiento continuo de los procesos y logros del programa, y la evaluación de su pertinencia para la sociedad, con participación activa de profesores, directivos estudiantes y egresados del prog', 22, 1),
(140, '4.22.3', 'Número y tipo de actividades desarrolladas por el programa para que profesores, estudiantes y egresados participen en la definición de políticas en materia de docencia, investigación, extensión o proyección social y cooperación internacional, y en las dec', 22, 1),
(141, '4.22.4', 'Apreciación de directivos, profesores, estudiantes, egresados del programa, y de empleadores, sobre la incidencia de los sistemas de evaluación y autorregulación del programa en el enriquecimiento de la calidad de éste.', 22, 1),
(142, '4.22.5', 'Información sobre cambios específicos realizados en el programa, en los últimos cinco años, a partir de los resultados de los procesos de evaluación y autorregulación del programa.', 22, 1),
(143, '4.23.1', 'Existencia de políticas y criterios institucionales y del programa de extensión o proyección social.', 23, 1),
(144, '4.23.2', 'Evidencia de aplicación de los procesos de extensión o proyección social por los programas.', 23, 1),
(145, '4.23.3', 'Número y tipo de proyectos y actividades de extensión o proyección social a la comunidad que ha desarrollado el programa en los últimos cinco años.', 23, 1),
(146, '4.23.4', 'Información del impacto que han tenido en el entorno los resultados de los proyectos de extensión o proyección social desarrollados por el programa en los últimode s cinco años.', 23, 1),
(147, '4.23.5', 'Evidencia de la participación de directivos y profesores del programa en la aplicación de políticas nacionales en proyectos de innovación social, económica, técnica y tecnología de acuerdo con el programa.', 23, 1),
(148, '4.23.6', 'Apreciación sobre el impacto social de los proyectos desarrollados por el programa por parte de agentes externos.', 23, 1),
(149, '4.23.7', 'Número y tipo de reconocimientos hechos en los últimos cinco años por entidades gubernamentales y no gubernamentales al impacto que el programa ha ejercido en los medios local, regional, nacional o internacional.', 23, 1),
(150, '4.23.8', 'Evidencia de las acciones desarrolladas por el programa que refleje su incidencia sobre el medio', 23, 1),
(151, '4.23.9', 'Documentos que evidencien las asistencias técnicas, tecnológicas, servicios, asesorías a empresarios, funcionarios públicos, líderes comunitarios, y de otros agentes externos.', 23, 1),
(152, '4.24.1', 'Existencia de criterios y políticas institucionales y del programa en materia de adquisición y actualización de material bibliográfico.', 24, 1),
(153, '4.24.2', 'Grado de correspondencia entre la naturaleza y objetivos del programa, y la pertinencia, actualización y suficiencia del material bibliográfico con que cuenta el programa para apoyar el desarrollo de las distintas actividades académicas.', 24, 1),
(154, '4.24.3', 'Apreciación de directivos, profesores y estudiantes del programa sobre la pertinencia, actualización y suficiencia del material bibliográfico con que cuenta el programa.', 24, 1),
(155, '4.24.4', 'Porcentaje de incremento anual en las adquisiciones de libros, revistas especializadas, bases de datos y suscripciones a publicaciones periódicas, relacionados con el programa académico, en los últimos 5 años.', 24, 1),
(156, '4.24.5', 'Porcentaje de profesores y estudiantes del programa que utiliza semestralmente recursos bibliográficos disponibles en el programa.', 24, 1),
(157, '4.24.6', 'Relación entre el número de volúmenes disponibles en la Biblioteca y el número de estudiantes del programa.', 24, 1),
(158, '4.24.7', 'Número y porcentaje de utilización de revistas especializadas y bases de datos disponibles en la Biblioteca, en los últimos cinco años.', 24, 1),
(159, '4.24.8', 'Acceso a material bibliográfico en bibliotecas virtuales y convenios con instituciones o entidades que ofrezcan este servicio.', 24, 1),
(160, '4.25.1', 'Apreciación de estudiantes, docentes y administrativo sobre la existencia de una plataforma tecnológica garantice la conectividad, interactividad y acceso a sistemas de información, apoyos y recursos para el aprendizaje, de acuerdo con el tipo y modalidad', 25, 1),
(161, '4.25.2', 'Evidencia de estrategias y mecanismos del uso de recursos informáticos y de comunicación, por parte de profesores y estudiantes.', 25, 1),
(162, '4.25.3', 'Apreciación de la disponibilidad, actualización y calidad de los recursos informáticos y de comunicación con que cuenta el programa por parte de los directivos, profesores, administrativos y estudiantes del programa.', 25, 1),
(163, '4.25.4', 'Evidencias de registros de los equipos en relación a rendimiento,capacidad de almacenamiento y la seguridad en el manejo de la información.', 25, 1),
(164, '4.25.5', 'Evidencia de actualización Y soporte técnico de la plataforma informática y los equipos computacionales en los últimos cinco años.', 25, 1),
(165, '4.25.6', 'Apreciación de directivos, profesores estudiantes del programa sobre la pertinencia, correspondencia y suficiencia de los recursos informáticos con que cuenta el programa.', 25, 1),
(166, '4.25.7', 'Para el caso específico de programas a distancia y virtuales: - Existencia de una plataforma tecnológica que garantice la conectividad, interactividad y acceso a sistemas de información, apoyos y recursos.', 25, 1),
(167, '4.26.1', 'Grado de correspondencia entre el número de estudiantes del programa y la capacidad de rotación en los laboratorios, talleres, salas de audiovisuales y campos de práctica, entre otros.', 26, 1),
(168, '4.26.2', 'Grado de correspondencia entre el número de estudiantes y el número de puestos de trabajo en laboratorios y talleres dotados con los equipos y materiales propios de las exigencias del programa.', 26, 1),
(169, '4.26.3', 'Información, en el caso de programas del área de Ciencias de la Salud, sobre la existencia de convenios docente-asistenciales certificados por el Ministerio de Protección Social.', 26, 1),
(170, '4.26.4', 'Apreciación de profesores y estudiantes del programa sobre la dotación y utilización de laboratorios, talleres, ayudas audiovisuales, campos de práctica y medios de transporte.', 26, 1),
(171, '5.27.1', 'Documentos que contengan las políticas institucionales en materia de referentes académicos externos, nacionales e internacionales para la revisión y actualización de planes de estudio.', 27, 1),
(172, '5.27.2', 'Evidencias de la utilización de referentes externos nacionales e internacionales para revisión y actualización de planes de estudio.', 27, 1),
(173, '5.27.3', 'Documentos que evidencien estudios comparativos de programas de alta calidad, de la misma naturaleza, metodología, contenidos curriculares y modalidad en el contexto nacional e internacional.', 27, 1),
(174, '5.27.4', 'Número de convenios activos de cooperación académica desarrollada por el programa con instituciones y programas de alta calidad acreditados por entidades de reconocida legitimidad nacional e internacional.', 27, 1),
(175, '5.27.5', 'Evidencias de actividades de cooperación académicas desarrolladas en el marco de los convenios suscritos por los programas.', 27, 1),
(176, '5.27.6', 'Número de proyectos de investigación desarrollados como producto de la cooperación académica y profesional, realizada por directivos, profesores y estudiantes del programa, con miembros de comunidades nacionales e internacionales de reconocido liderazgo e', 27, 1),
(177, '5.27.7', 'Número de proyectos de innovación desarrollados como producto de la cooperación académica y profesional realizada por directivos, profesores y estudiantes del programa, con miembros de comunidades nacionales e internacionales de reconocido liderazgo en el', 27, 1),
(178, '5.27.8', 'Número de proyectos de creación artística y cultural desarrollados como producto de la cooperación académica y profesional, realizada por directivos, profesores y estudiantes del programa, con miembros de comunidades nacionales e internacionales de recono', 27, 1),
(179, '5.27.9', 'Número de proyectos de extensión/proyección social desarrollados como producto de la cooperación académica y profesional, realizada por directivos, profesores y estudiantes del programa, con miembros de comunidades nacionales e internacionales de reconoci', 27, 1),
(180, '5.27.10', 'Número de profesores, estudiantes y directivos del programa con participación activa en redes u organismos nacionales e internacionales de la que se hayan derivado productos concretos como publicaciones en coautoría, cofinanciación de proyectos, registros', 27, 1),
(181, '5.27.11', 'Valor de la inversión efectivamente realizada por la universidad para los fines de internacionalización en los últimos cinco años.', 27, 1),
(182, '5.27.12', 'Número de proyectos, actividades, intercambios, producto de la interacción con comunidades académicas nacionales e internacionales.', 27, 1),
(183, '5.27.13', 'Documento que exprese el impacto social verificable de proyectos producto de la interacción con comunidades académicas nacionales e internacionales.', 27, 1),
(184, '5.28.1', 'Número de convenios activos de intercambio con universidades nacionales y extranjeras.', 28, 1),
(185, '5.28.2', 'Número de estudiantes extranjeros en el programa en los últimos 5 años.', 28, 1),
(186, '5.28.3', 'Número de asignaturas o cursos homologados en otros programas nacionales o extranjeros.', 28, 1),
(187, '5.28.4', 'Número de profesores o expertos visitantes nacionales y extranjeros que ha recibido el programa en los últimos cinco años (objetivos, duración y resultados de su estadía).', 28, 1),
(188, '5.28.5', 'Número de profesores y estudiantes adscritos al programa que en los últimos cinco años han participado en actividades de cooperación académica y profesional con programas nacionales e internacionales de reconocido liderazgo en el área (semestre académico ', 28, 1),
(189, '5.28.6', 'Documentos que evidencien la participación de profesores y estudiantes adscritos al programa en actividades de cooperación académica.', 28, 1),
(190, '5.28.7', 'Número de profesores del programa que participan activamente en redes académicas, científicas, técnicas y tecnológicas, económicas, a nivel nacional e internacional, de acuerdo con el tipo y modalidad del programa.', 28, 1),
(191, '5.28.8', 'Valor de la inversión efectiva desarrollada para proyectos de movilidad de estudiantes en doble vía en los últimos cinco años.', 28, 1),
(192, '5.28.9', 'Valor de la inversión efectiva desarrollada para proyectos de movilidad de profesores en doble vía en los últimos cinco años.', 28, 1),
(193, '6.29.1', 'Documento que evidencie los criterios, estrategias y actividades del programa, orientados a promover la capacidad de indagación y búsqueda, y la formación de un espíritu investigativo, creativo e innovador en los estudiantes.', 29, 1),
(194, '6.29.2', 'Número de actividades utilizadas como mecanismos por parte de los profesores adscritos al programa para incentivar en los estudiantes la generación de ideas y problemas de investigación, la identificación de problemas en el ámbito empresarial susceptibles', 29, 1),
(195, '6.29.3', 'Número de estudiantes que están vinculados como monitores, auxiliares de investigación e integrantes de semilleros y/o grupos de investigación.', 29, 1),
(196, '6.29.4', 'Número de grupos de investigación del programa en los que participan estudiantes, de acuerdo con su tipo y modalidad.', 29, 1),
(197, '6.29.5', 'Número de semilleros de investigación del programa en los que participan estudiantes, de acuerdo con su tipo y modalidad.', 29, 1),
(198, '6.29.6', 'Número de actividades académicas –cursos electivos, seminarios, pasantías, eventos– derivados de líneas de investigación en los últimos cinco años.', 29, 1),
(199, '6.29.7', 'Número de actividades académicas –pasantías, talleres, actividades conjuntas- relacionadas con la realidad empresarial, organizadas desde los primeros semestres con una lógica enfocada en el entendimiento creciente de aquella según sus mayores grados de c', 29, 1),
(200, '6.29.8', 'Documento donde se evidencia dentro del plan de estudios los espacios académicos y de vinculación con el sector productivo y donde se analiza la naturaleza de la investigación científica, técnica y tecnológica, la innovación, sus objetos de indagación, su', 29, 1),
(201, '6.29.9', 'Número de estudiantes que participan en los programas institucionales de jóvenes investigadores.', 29, 1),
(202, '6.29.10', 'Número de estudiantes que en sus prácticas empresariales participan en temas de investigación y desarrollo, ingeniería y experimentación en Colombia y en el Exterior.', 29, 1),
(203, '6.29.11', 'Número de estudiantes que participación en proyectos Universidad -Empresa -Estado que adelante la Institución.', 29, 1),
(204, '6.29.12', 'Número de estudiantes que participan en proyectos Universidad- Empresa- Estado que adelante la Institución.', 29, 1),
(205, '6.30.1', 'Documento que evidencie los criterios, estrategias y políticas institucionales en materia de investigación, innovación y creación artística y cultural, así como mecanismos efectivos que estimulen el desarrollo de los procesos investigativos, de innovación', 30, 1),
(206, '6.30.2', 'Documento que evidencie la correspondencia entre el número y nivel de formación de los profesores adscritos al programa con la actividad investigativa y de innovación y la creación artística y cultural, relacionadas con la naturaleza del programa.', 30, 1),
(207, '6.30.3', 'Número de Recursos humanos y logísticos con que cuenta el programa, asociados a proyectos y a otras actividades de investigación, innovación y creación artística y cultural.', 30, 1),
(208, '6.30.4', 'Recursos financieros con que cuenta la institución, asociados a proyectos y a otras actividades de investigación, innovación y creación artística y cultural.', 30, 1),
(209, '6.30.5', 'Número de grupos de investigación conformados por profesores y estudiantes adscritos al programa, reconocidos por COLCIENCIAS o por otro organismo.', 30, 1),
(210, '6.30.6', 'Documento que evidencie el impacto a nivel regional, nacional e internacional de la investigación, la innovación y la creación artística y cultural del programa, de acuerdo con su naturaleza.', 30, 1),
(211, '6.30.7', 'Número de publicaciones en revistas indexadas y especializadas nacionales e internacionales, innovaciones, patentes, productos o procesos técnicos y tecnológicos patentables o no patentables o protegidas por secreto industrial, libros, capítulos de libros', 30, 1),
(212, '6.30.8', 'Número de reconocimientos en libros de arte y revistas especializadas, la presentación, exposición o ejecución en instituciones de reconocido prestigio.', 30, 1),
(213, '6.30.9', 'Número participaciones en eventos organizados por comunidades artísticas y académicas.', 30, 1),
(214, '6.30.10', 'Número de publicaciones por editoriales reconocidas en el ámbito literario e incluidas en antologías, entre otras.', 30, 1),
(215, '6.30.11', 'Número de actividades administrativas para el desarrollo y gestión de la investigación, gestión del conocimiento (vigilancia tecnológica), la creación de empresas y de planes de negocios (como los centros de incubación y financiación empresarial, oficinas', 30, 1),
(216, '6.30.12', 'Recursos financieros para el desarrollo y gestión de la investigación, gestión del conocimiento (vigilancia tecnológica), la creación de empresas y de planes de negocios (como los centros de incubación y financiación empresarial, oficinas de transferencia', 30, 1),
(217, '7.31.1', 'Número y tipo de programas, servicios y actividades de bienestar dirigidos a los profesores, estudiantes y personal administrativo del programa.', 31, 1),
(218, '7.31.2', 'Porcentaje de directivos, profesores, estudiantes y personal administrativo del programa que conoce los programas, servicios y actividades de bienestar institucional.', 31, 1),
(219, '7.31.3', 'Apreciación de directivos, profesores, estudiantes y personal administrativo del programa sobre los servicios y actividades de bienestar y sobre la contribución que las políticas sobre bienestar y dichos servicios han hecho a su desarrollo personal.', 31, 1),
(220, '7.31.4', 'Apreciación de directivos, profesores y estudiantes del programa sobre la pertinencia y contribución que las políticas institucionales y los servicios en materia de bienestar han hecho a la calidad de las funciones de docencia, investigación y extensión o', 31, 1),
(221, '7.31.5', 'Existencia de Políticas y estrategias que favorezcan el desarrollo humano y promueva una cultura que reconozca el valor de la diversidad.', 31, 1),
(222, '7.31.6', 'Cantidad de Programas y estrategias de seguimiento integral a la comunidad institucional y acciones derivadas que conduzcan al desarrollo humano y el respeto a la diferencia', 31, 1),
(223, '7.31.7', 'Existencia de informes o resultados de investigación donde se identifique la problemática social del entorno que incide en la comunidad institucional.', 31, 1),
(224, '7.31.8', 'Existencia de aplicación de estrategias, y evidencias relacionadas con la implementación de programas, servicios y actividades relacionados con los resultados de investigación de la problemática social del entorno que incide en la comunidad institucional.', 31, 1),
(225, '7.31.9', 'Apreciación de directivos, docentes y estudiantes sobre las condiciones de bienestar de los escenarios de prácticas, en los programas donde sea pertinente.', 31, 1),
(226, '7.31.10', 'Existencia de estrategias y apoyos socioeconómicos dirigidos a los estudiantes que permitan su desarrollo personal y académico', 31, 1),
(227, '7.31.11', 'Número de estudiantes que han sido beneficiados con estrategias y otros apoyos socioeconómicos que permitan su desarrollo personal y académico', 31, 1),
(228, '7.31.12', 'Apreciación y conocimiento de los estudiantes del programa sobre las estrategias y otros apoyos socioeconómicos que permitan su desarrollo personal y académico', 31, 1),
(229, '7.31.13', 'Apreciación de directivos, profesores y estudiantes del programa sobre la pertinencia que tienen las políticas institucionales y los servicios en materia de bienestar, en relación con la modalidad en que se ofrece el programa.', 31, 1),
(230, '7.32.1', 'Informes Estadísticos sobre la población de estudiantes del programa desde el primero hasta el último semestre, en las últimas cinco cohortes', 32, 1),
(231, '7.32.2', 'Nivel de correlación existente entre la duración prevista para el programa, de acuerdo con su modalidad o metodología y plan de estudios, y la que realmente tiene lugar.', 32, 1),
(232, '7.32.3', 'Tasas de deserción estudiantil acumulada y por períodos académicos.', 32, 1),
(233, '7.32.4', 'Existencia de estudios realizados por la institución y el programa para identificar y evaluar las causas de la deserción estudiantil.', 32, 1),
(234, '7.32.5', 'Existencia de proyectos que establezcan estrategias pedagógicas y actividades extracurriculares orientadas a optimizar las tasas de retención y de graduación de estudiantes, manteniendo la calidad académica del programa.', 32, 1),
(235, '7.32.6', 'Número de Estudiantes que se han beneficiado con las estrategias pedagógicas y actividades extracurriculares orientadas a optimizar las tasas de retención y de graduación de estudiantes, manteniendo la calidad académica del programa', 32, 1),
(236, '7.32.7', 'Informe donde se presente la caracterización de los estudiantes y se identifiquen variables de vulnerabilidad', 32, 1),
(237, '8.33.1', 'Grado de correspondencia entre la organización, administración y gestión del programa, y los fines de la docencia, la investigación, la extensión o proyección social y la cooperación nacional e internacional en el programa.', 33, 1),
(238, '8.33.2', 'Apreciación de directivos, profesores, estudiantes y personal administrativo del programa sobre la coherencia entre la organización, administración y gestión del programa, y los fines de la docencia, la investigación, la extensión o proyección social y la', 33, 1),
(239, '8.33.3', 'Estadísticas de formación y experiencia de quienes orientan la administración del programa.', 33, 1),
(240, '8.33.4', 'Apreciación del personal administrativo del programa sobre la claridad de las funciones desarrolladas y las funciones del cargo.', 33, 1),
(241, '8.33.5', 'Apreciación de profesores y estudiantes del programa sobre la eficiencia y eficacia de los procesos administrativos en el programa.', 33, 1),
(242, '8.33.6', 'Número y dedicación de personal académico administrativo para cubrir las necesidades de gestión del programa.', 33, 1),
(243, '8.34.1', 'Existencia y utilización de sistemas y mecanismos eficaces que faciliten la comunicación y registro de información al interior del programa.', 34, 1),
(244, '8.34.2', 'Frecuencia de actualización de los sistemas de información y comunicación de la institución.', 34, 1),
(245, '8.34.3', 'Apreciación directivos, profesores, estudiantes y personal administrativo sobre la eficacia de los sistemas de información y de los mecanismos de comunicación.', 34, 1),
(246, '8.35.1', 'Apreciación de profesores, estudiantes y personal administrativo del programa sobre la orientación académica que imparten los directivos del programa y sobre el liderazgo que ejercen.', 35, 1),
(247, '8.35.2', 'Documentos institucionales que definan lineamientos y políticas que orienten la gestión del programa.', 35, 1),
(248, '8.35.3', 'Porcentaje de directivos, profesores y personal administrativo del programa que conoce las políticas que orientan la gestión del programa.', 35, 1),
(249, '9.36.1', 'Existencia de registros actualizados sobre ocupación y ubicación profesional de los egresados del programa.', 36, 1),
(250, '9.36.2', 'Grado de correlación existente entre la ocupación y ubicación profesional de los egresados y el perfil de formación del programa', 36, 1),
(251, '9.36.3', 'Apreciación de los egresados, empleadores y usuarios externos sobre la calidad de la formación recibida en el programa.', 36, 1),
(252, '9.36.4', 'Apreciación de los egresados acerca de la forma como el programa favorece el desarrollo del proyecto de vida.', 36, 1),
(253, '9.36.5', 'Estudios de pertinencia del programa que involucren datos e información del observatorio laboral.', 36, 1),
(254, '9.36.6', 'Evidencia de la aplicación de estrategias que permitan la participación de los egresados en la evaluación y actualización del currículo.', 36, 1),
(255, '9.36.7', 'Existencia de estrategias que favorezcan el ingreso del estudiante al mercado laboral.', 36, 1),
(256, '9.37.1', 'Documentos que evidencien el Índice de empleo de los egresados del programa, en los últimos 5 años.', 37, 1),
(257, '9.37.2', 'Número de egresados del programa que forma parte de comunidades académicas reconocidas, de asociaciones científicas, profesionales, tecnológicas, técnicas o artísticas, y del sector productivo y financiero, en el ámbito nacional o internacional', 37, 1),
(258, '9.37.3', 'Número de egresados del programa que han recibido distinciones y reconocimientos significativos por su desempeño en la disciplina, profesión, ocupación u oficio correspondiente', 37, 1),
(259, '9.37.4', 'Apreciación de empleadores sobre la calidad de la formación y el desempeño de los egresados del programa.', 37, 1),
(260, '10.38.1', 'Documentos que expresen las políticas institucionales en materia de uso y control de la planta física, en relación con las necesidades del programa.', 38, 1);
INSERT INTO `indicador` (`id`, `codigo`, `nombre`, `caracteristica_id`, `modelo_id`) VALUES
(261, '10.38.2', 'Apreciación de directivos, profesores, estudiantes y personal administrativo del programa sobre las características de la planta física desde el punto de vista de su accesibilidad, diseño, capacidad, iluminación, ventilación y condiciones de seguridad e h', 38, 1),
(262, '10.38.3', 'Existencia de informes y estadísticas de aulas, laboratorios, talleres, sitios de estudio para los alumnos, salas de cómputo, oficinas de profesores, sitios para la investigación, auditorios y salas de conferencias, oficinas administrativas cafeterías, ba', 38, 1),
(263, '10.38.4', 'Apreciación de directivos, profesores, estudiantes y personal administrativo del programa sobre número, tamaño, capacidad, iluminación, ventilación y dotación de bibliotecas, salas de lectura grupal e individual, y espacios para consulta.', 38, 1),
(264, '10.38.5', 'Existencia de planes y proyectos en ejecución para la conservación, expansión, mejoras y el mantenimiento de la planta física para el programa, de acuerdo con las normas técnicas respectivas.', 38, 1),
(265, '10.38.6', 'Documentos institucionales en los que se expresa la misión y visión de la institución.', 38, 1),
(266, '10.39.1', 'Existencia y utilización de medios para difundir la misióny visión institucional.', 39, 1),
(267, '10.39.2', 'Grado de correspondencia entre el contenido de la misión, visión institucional y los objetivos del programa académico.', 39, 1),
(268, '10.39.3', 'Porcentaje de directivos, profesores, personal administrativo, estudiantes y egresados que entienden el sentido de la Misión, Visión del programa y la comparten.', 39, 1),
(269, '10.39.4', 'Existencia políticas que garanticen el acceso a la educación superior sin discriminación, así mismo para orientar identificar, eliminar o disminuir barreras en infraestructura física, accesibilidad y movilidad.', 39, 1),
(270, '10.39.5', 'Existencia y utilización de estrategias y mecanismos establecidos para la discusión, actualización y difusióndel proyecto educativo del programa académico.', 39, 1),
(271, '10.39.6', 'Porcentaje de directivos, profesores y estudiantes que conocen y comparten el sentido del proyecto educativo del programa', 39, 1),
(272, '10.39.7', 'Apreciación de directivos, profesores y estudiantes sobre la existencia de espacios institucionales para la discusión y actualización permanente del proyecto educativo del programa.', 39, 1),
(273, '10.40.1', 'Correspondencia entre el proyecto educativo del programa y el proyecto institucional.', 40, 1),
(274, '10.40.2', 'Existencia del Modelo pedagógico en el PEP que refleje la metodología de enseñanza que utilice el programa', 40, 1),
(275, '10.40.3', 'Existencia de documento que relacione lo expresado en el PEP con las actividades académicas desarrolladas', 40, 1),
(276, '10.40.4', 'Existencia de documentos que evidencien actividades de seguimiento del PEP', 40, 1),
(277, '10.40.5', 'Evidencia sobre la reflexión y análisis de las tendencias y líneas de desarrollo en áreas disciplinares a nivel local, regional, nacional e internacional', 40, 1),
(278, '1.1.1', 'Apreciación de directivos, profesores, estudiantes y personal administrativo sobre la claridad en los objetivos del programa', 41, 2),
(279, '1.1.2', 'Apreciación de directivos, profesores, estudiantes y personal administrativo de la capacidad que ha demostrado el programa a lo largo de su trayectoria para lograr dichos objetivos ', 41, 2),
(280, '2.2.1', 'Existencia de evidencia de los proceso de selección de estudiantes con criterios bien definidos en los últimos 5 años.', 42, 2),
(281, '2.2.2', 'Existencia de evidencia de estrategias implementadas en los últimos 5 años para asegurar un número de estudiantes adecuado que le den sostenibilidad al programa. ', 42, 2),
(282, '2.2.3', 'Relación existente entre el número de solicitudes que el programa recibe en los últimos 5 años y los que se admitieron.', 42, 2),
(283, '2.2.4', 'Relación existente entre el número de estudiantes admitidos en los últimos 5 años y los que se matricularon.', 42, 2),
(284, '2.2.5', 'Número de estudiantes que se matricularon en los últimos 5 años.', 42, 2),
(285, '2.2.6', 'Proporción de estudiantes de tiempo completo en los últimos 5 años. ', 42, 2),
(286, '2.2.7', 'Proporción de estudiantes con becas o con nombramientos como Asistentes de Docencia o de Investigación (Teaching and Research Assistants) en los últimos 5 años.', 42, 2),
(287, '2.2.8', 'Proporción de estudiantes que vienen de otras universidades y regiones del país en los últimos 5 años.', 42, 2),
(288, '2.2.9', 'Proporción de estudiantes que vienen de otros países en los últimos 5 años.', 42, 2),
(289, '2.3.1', 'Tasa de deserción de los estudiantes en los últimos 5 años.', 43, 2),
(290, '2.3.2', 'Número de publicaciones realizadas por los estudiantes del programa en revistas nacionales indexadas en los últimos 5 años. ', 43, 2),
(291, '2.3.3', 'Número de publicaciones realizadas por los estudiantes del programa en revistas internacionales indexadas en los últimos 5 años. ', 43, 2),
(292, '2.3.4', 'Existencia de evidencia de asistencia de los estudiantes a congresos y eventos científicos, tanto nacionales como internacionales en los últimos 5 años', 43, 2),
(293, '2.3.5', 'Número de eventos por estudiante en los últimos 5 años.', 43, 2),
(294, '2.3.6', 'Existencia de evidencia de participación de los estudiantes en redes de investigación y en comunidades científicas en los últimos 5 años.', 43, 2),
(295, '2.3.7', 'Existencia de mecanismos de evaluación de desempeño de los estudiantes y transparencia del mismo.', 43, 2),
(296, '2.3.8', 'Existencia de evaluación de desempeño de los estudiantes en los últimos 5 años.', 43, 2),
(297, '2.4.1', 'Tiempo de duración, por cohorte, para la obtención del grado. ', 44, 2),
(298, '3.5.1', 'Número de profesores de tiempo completo con doctorado en el campo de las líneas de las líneas de del programa.', 45, 2),
(299, '3.5.2', 'Relación del número de profesores y el número de estudiantes en el programa por línea de investigación.', 45, 2),
(300, '3.5.3', 'Proporción de profesores visitantes de universidades extranjeras y universidades colombianas.', 45, 2),
(301, '3.5.4', 'Existencia de evidencias de cursos en el programa con profesores visitantes de universidades extranjeras y universidades colombianas.', 45, 2),
(302, '3.5.5', 'Existencia de evidencia de distinciones que los profesores han recibido en docencia, investigación y extensión en los últimos cinco años.', 45, 2),
(303, '3.6.1', 'Existencia de evidencia de publicaciones científicas de los profesores en los últimos cinco años ', 46, 2),
(304, '3.6.2', 'Número de artículos de los profesores del programa publicados en revistas internacionales indexadas últimos cinco años.', 46, 2),
(305, '3.6.3', 'Número de artículos de los profesores del programa publicados en revistas nacionales indexadas últimos cinco años.', 46, 2),
(306, '3.6.4', 'Número de libros de los profesores del programa publicados (con ISBN) últimos cinco años.', 46, 2),
(307, '3.6.5', 'Número de capítulos en libros de los profesores del programa publicados (con ISBN) últimos cinco años.', 46, 2),
(308, '3.6.6', 'Número de otras publicaciones de los profesores del programa publicados últimos cinco años.', 46, 2),
(309, '3.6.7', 'Existencia de evidencia de evaluaciones de impacto de las publicaciones de los profesores del programa medido en términos de indicadores de citas bibliográficas.', 46, 2),
(310, '3.6.8', 'Número de proyectos académicos, diseños curriculares de los profesores del programa realizadas en los últimos cinco años.', 46, 2),
(311, '3.6.9', 'Existencia de evidencia de la participación de los profesores del programa en Comités Editoriales de revistas nacionales e internacionales.', 46, 2),
(312, '3.7.1', 'Número de estudiantes por tutor de tesis doctorales (profesores de tiempo completo).', 47, 2),
(313, '3.7.2', 'Número de estudiantes por tutor de la comunidad académica nacional.', 47, 2),
(314, '3.7.3', 'Existencia de políticas sobre asignación de profesores como directores o jurados de tesis doctorales.', 47, 2),
(315, '3.8.1', 'Existencia de política de selección, renovación y contratación y permanencia de profesores.', 48, 2),
(316, '3.8.2', 'Existencia de políticas sobre años sabáticos y Post-Doctorados para profesores del programa.', 48, 2),
(317, '3.8.3', 'Número de profesores que se han acogido a pasantías, sabáticos y Post-Doctorados en los últimos tres años.', 48, 2),
(318, '3.8.4', 'Existencia de políticas y mecanismos de evaluación de profesores ', 48, 2),
(319, '3.8.5', 'Existencia de políticas de flexibilidad del programa para invitar profesores y jurados de la comunidad nacional.', 48, 2),
(320, '4.9.1', 'Existencia de estrategias del programa orientadas a promover la capacidad de indagación.', 49, 2),
(321, '4.9.2', 'Existencia y utilización de estrategias del programa para desarrollar capacidad de pensamiento autónomo y dominio de desarrollos teóricos, experimentales y de las técnicas de investigación propias.', 49, 2),
(322, '4.9.3', 'Existencia y utilización de estrategias para construir estados del arte y tendencias en el campo de las ciencias de la educación mediante el uso critico de las diversas fuentes de información.', 49, 2),
(323, '4.9.4', 'Existencia y utilización de estrategias de divulgación de avances y resultados de la investigación', 49, 2),
(324, '4.9.5', 'Existencia de estrategias y mecanismos por parte de los tutores para el desarrollo riguroso de las labores desarrolladas en la investigación.', 49, 2),
(325, '4.9.6', 'Número de Tesis Doctorales premiados durante los últimos cinco años por jurados nacionales y extranjeros', 49, 2),
(326, '4.10.1', 'Información verificable de la existencia de mecanismos sobre facilidad de acceso a cursos, seminarios o conferencias en la universidad sobre aspectos relacionados con cambios en la ciencia mundial y con aspectos relevantes del entorno social y económico d', 50, 2),
(327, '4.11.1', 'Información verificable del programa que se cuenta con una oferta académica amplia que le suministre opciones al estudiante de temas o líneas de investigación en las que puede vincularse.', 51, 2),
(328, '4.11.2', 'Información verificable del aprovechamiento de los estudiantes de seminarios y oferta académica de otros grupos de investigación y programas, de RUDECOLOMBIA o de otras universidades nacionales o extranjeras.', 51, 2),
(329, '4.11.3', 'Información verificable de la existencia de convenios que faciliten, promuevan y garanticen la movilidad estudiantil y del profesorado en programas de otras universidades nacionales e internacionales.', 51, 2),
(330, '4.12.1', 'Existencia de evidencia de los resultados de los procesos periódicos de autoevaluación, conducentes a mejoras en el programa en los últimos cinco años.', 52, 2),
(331, '4.12.2', 'Existencia de Estrategias de seguimiento a los productos de los planes de mejora desarrolladas en los últimos cinco años', 52, 2),
(332, '4.12.3', 'Existencia de evidencias de seguimiento a dicha evaluación desarrolladas en los últimos cinco años', 52, 2),
(333, '4.12.4', 'Existencia de evidencias de participación de estudiantes, profesores, egresados, empleadores, directivos, personal administrativo y pares nacionales e internacionales en dichos procesos. ', 52, 2),
(334, '5.13.1', 'Información verificable de la existencia de estrategias por medio de las cuales la investigación constituye la base del programa, y cómo ella contribuirá a formar investigadores.', 53, 2),
(335, '5.13.2', 'Información verificable de la existencia de uno o más grupos de investigación, consolidados de manera visible a través de los proyectos y publicaciones que soportan el programa. ', 53, 2),
(336, '5.13.3', 'Existencia de una política clara de apoyo a la investigación y estrategias que aseguren la implementación de ésta (reconocimiento de tiempo a profesores, financiación de proyectos, etc.).', 53, 2),
(337, '5.14.1', 'Número de grupos de investigación relacionados con las líneas de formación del programa, clasificados según su categoría en el ScientiCol de COLCIENCIAS.', 54, 2),
(338, '5.14.2', 'Existencia de evidencia de las Líneas de Investigación y proyectos de cada grupo que son relevantes para el programa de doctorado ', 54, 2),
(339, '5.14.3', 'Número de proyectos terminados por línea y por grupo de investigación en los últimos cinco años', 54, 2),
(340, '5.14.4', 'Número de proyectos activos por línea y por grupo de investigación. ', 54, 2),
(341, '5.14.5', 'Número de investigadores por grupo y línea de investigación en los últimos cinco años. ', 54, 2),
(342, '5.14.6', 'Número de proyectos de investigación activos y en ejecución con financiación externa', 54, 2),
(343, '5.14.7', 'Número de proyectos de investigación activos y en ejecución con financiación interna', 54, 2),
(344, '5.14.8', 'Registro sistemático de los gastos de los proyectos con base en un presupuesto formalmente aprobado en los últimos cinco años. ', 54, 2),
(345, '5.14.9', 'Recursos financieros que el programa logró movilizar para financiar el conjunto de proyectos de investigación en los últimos cinco años (recursos externos o recursos internos). ', 54, 2),
(346, '5.14.10', 'Existencia de evidencia de integración de los grupos de investigación de RUDECOLOMBIA y otras redes que desempeñan un papel importante en el campo de las ciencias de la educación.', 54, 2),
(347, '5.15.1', 'Número de publicaciones indexadas, en el ScientiCol y en bases de datos internacionales de los grupos', 55, 2),
(348, '5.15.2', 'Número de citas y co-citaciones de los profesores.', 55, 2),
(349, '5.15.3', 'Número de proyectos de extensión de impacto social.', 55, 2),
(350, '5.15.4', 'Número de tesis de doctorado en los últimos cinco años.', 55, 2),
(351, '5.15.5', 'Existencia de evidencia de los resultados de las investigaciones de los grupos de investigación y su aporte al campo de las ciencias de la educación.', 55, 2),
(352, '6.16.1', 'Existencia de evidencia de la posibilidad de los estudiantes de tomar seminarios o cursos en campos complementarios a los del programa ya sea en las universidades de RUDECOLOMBIA o en otras universidades, vía alianzas estratégicas - convenios.', 56, 2),
(353, '6.16.2', 'Existencia de evidencia de la posibilidad de los estudiantes de participar en las actividades de otros grupos de investigación relacionados con el programa o con programas complementarios.', 56, 2),
(354, '6.16.3', 'Existencia de evidencia de la posibilidad de trabajar con Directores de Tesis que sean de otras universidades diferentes a RUDECOLOMBIA.', 56, 2),
(355, '6.17.1', 'Existencia de líneas de investigación relacionadas con problemas o temas de del campo de las ciencias de la educación de la comunidad nacional, regional o local, o con problemas del sector productivo o de otros campos del conocimiento.', 57, 2),
(356, '6.17.2', 'Existencia de evidencias de innovaciones, cambios o mejoras introducidos en el entorno a partir de resultados de tesis doctorales de estudiantes, de proyectos de investigación realizados por el grupo de investigación, o de servicios de extensión ofrecidos', 57, 2),
(357, '6.18.1', 'Investigaciones desarrolladas en el Doctorado sobre problemas o desafíos que se enfrentan a nivel nacional, regional o local.', 58, 2),
(358, '6.18.2', 'Número y temas de las Tesis doctorales que se han realizado sobre aspectos o problemas de interés para el desarrollo nacional, o para el desarrollo regional o local.', 58, 2),
(359, '6.18.3', 'No. de Contratos con actores sociales del entorno (empresas, gremios, agencias de gobierno, ONGs, etc.) para realizar investigación o servicios de consultoría relacionados con temas de su interés.', 58, 2),
(360, '7.19.1', 'Existencia de evidencia de pasantías en grupos de investigación en el extranjero, en grupos de reconocida trayectoria en su respectivo campo.', 59, 2),
(361, '7.19.2', 'Existencia de evidencia de homologación y programas con doble titulación o programas conjuntos', 59, 2),
(362, '7.19.3', 'Existencia de evidencia de oferta de seminarios y cursos de carácter internacional (temas internacionales).', 59, 2),
(363, '7.19.4', 'Existencia de evidencias para estudiantes y profesores de asistencia a cursos o seminarios ofrecidos en otras lenguas', 59, 2),
(364, '7.20.1', 'Porcentaje de estudiantes extranjeros en el programa en los últimos cinco años.', 60, 2),
(365, '7.20.2', 'Existencia de convenios de intercambios activos con universidades extranjeras.', 60, 2),
(366, '7.20.3', 'Existencia de evidencias de experiencias de homologación de cursos del programa en programas extranjeros en los últimos cinco años.', 60, 2),
(367, '7.20.4', 'Número de profesores visitantes extranjeros en el programa en los últimos cinco años.', 60, 2),
(368, '7.20.5', 'Número de Profesores del programa como Profesores Visitantes en universidades extranjeras en los últimos cinco años.', 60, 2),
(369, '7.20.6', 'Número de Becas o proyectos de investigación financiadas por fuentes extranjeras en los últimos cinco años.', 60, 2),
(370, '7.21.1', 'Numero de participaciones en redes internacionales de investigación.', 61, 2),
(371, '7.21.2', 'Número de profesores y estudiantes investigadores del programa que han hecho pasantías en grupos de investigación extranjeros.', 61, 2),
(372, '7.21.3', 'Número de proyectos de investigación conjuntos con universidades o centros de investigación extranjeros.', 61, 2),
(373, '7.21.4', 'Existencia de tesis de Doctorado dirigidas por profesores en el extranjero.', 61, 2),
(374, '7.21.5', 'Existencia de evidencia de acceso a laboratorios u otras facilidades de investigación en universidades extranjeras.', 61, 2),
(375, '8.22.1', 'Exigencia de vinculación de los estudiantes a una EPS y en caso de ser necesario a una ARP.', 62, 2),
(376, '8.22.2', 'Existencia de unidades médicas que prestan servicios básicos y asistencia sicológica.', 62, 2),
(377, '8.22.3', 'Existencia de mecanismos que garanticen el bienestar de los estudiantes durante cortas estadías en el extranjero, como parte de la movilidad estudiantil y de la participación en congresos y eventos científicos.', 62, 2),
(378, '8.22.4', 'Existencia de apoyo a la consecución de vivienda para estudiantes casados, sobre todo los extranjeros y de otras regiones del país (mínimo suministro de información).', 62, 2),
(379, '9.23.1', 'Número de graduados que tiene el programa en los últimos cinco años', 63, 2),
(380, '9.23.2', 'Existencia de estudios de seguimiento a sus egresados', 63, 2),
(381, '9.23.3', 'Existencia de estadísticas donde se refleje en que se desempeñan los graduados', 63, 2),
(382, '9.23.4', 'Existencia de evidencia de trabajos de colaboración científica entre los graduados y los grupos de investigación del programa.', 63, 2),
(383, '9.23.5', 'Existencia de evidencia de publicaciones científicas de los graduados del programa ', 63, 2),
(384, '9.23.6', 'Número de artículos de los graduados del programa publicados en revistas internacionales indexadas.', 63, 2),
(385, '9.23.7', 'Número de artículos de los graduados del programa publicados en revistas nacionales indexadas.', 63, 2),
(386, '9.23.8', 'Número de libros de los graduados del programa publicados (con ISBN).', 63, 2),
(387, '9.23.9', 'Número de capítulos en libros de los graduados del programa publicados (con ISBN).', 63, 2),
(388, '9.23.10', 'Número de otras publicaciones de los graduados del programa publicados.', 63, 2),
(389, '9.23.11', 'Existencia de evidencia de evaluaciones de impacto de las publicaciones de los graduados del programa medido en términos de indicadores de citas bibliográficas.', 63, 2),
(390, '9.23.12', 'Número de proyectos de extensión de los graduados del programa.', 63, 2),
(391, '9.23.13', 'Existencia de evidencia de la participación de los graduados del programa en Comités Editoriales de revistas nacionales e internacionales.', 63, 2),
(392, '9.24.1', 'Existencia de evidencia de la productividad académica y sus aportes al campo del conocimiento', 64, 2),
(393, '10.25.1', 'Relación entre las áreas disponibles para el ejercicio de la docencia (aulas de audiovisuales, salas de computo) y el número de estudiantes por programa', 65, 2),
(394, '10.25.2', 'Relación entre las áreas disponibles para el ejercicio de la Investigación   (cubículos, biblioteca, salones tutoriales) y el número de estudiantes por programa.', 65, 2),
(395, '10.25.3', 'Apreciación de directivos, profesores, estudiantes y personal administrativos acerca de si los diferentes espacios físicos son adecuados', 65, 2),
(396, '10.25.4', 'Apreciación de directivos, profesores, estudiantes y personal administrativos acerca de si los diferentes espacios físicos son suficientes.', 65, 2),
(397, '10.25.5', 'Apreciación de directivos, profesores, estudiantes y personal administrativos acerca de si los diferentes espacios físicos están acondicionados adecuadamente.', 65, 2),
(398, '10.25.6', 'Apreciación de parte de los directivos, profesores, estudiantes y personal administrativos sobre la conservación y mantenimiento de la planta física.', 65, 2),
(399, '10.26.1', 'Información verificable sobre la existencia de criterios y políticas institucionales y del programa de doctorado en materia de adquisición y actualización de material bibliográfico y de recursos informáticos.', 66, 2),
(400, '10.26.2', 'Información verificable sobre la correspondencia entre las Líneas de Investigación desarrolladas y la disponibilidad de material bibliográfico.', 66, 2),
(401, '10.26.3', 'Información sobre el presupuesto anual de la biblioteca o porcentaje de incremento anual, dedicado a la adquisición de publicaciones o bases de datos relevantes para el programa.', 66, 2),
(402, '10.26.4', 'Información estadística de uso efectivo de los recursos bibliográficos por parte de profesores y estudiantes del programa', 66, 2),
(403, '10.26.5', 'Apreciación de directivos, profesores y estudiantes acerca de la cantidad de los recursos bibliográficos utilizados en el programa', 66, 2),
(404, '10.26.6', 'Apreciación de directivos, profesores y estudiantes acerca de la calidad de los recursos bibliográficos utilizados en el programa', 66, 2),
(405, '10.26.7', 'Relación entre la cantidad de los recursos informáticos y de comunicación disponibles y el número de estudiantes del programa', 66, 2),
(406, '10.26.8', 'Relación entre la cantidad de los recursos informáticos y de comunicación disponibles y el número de profesores del programa', 66, 2),
(407, '10.26.9', 'Información estadística de uso efectivo de los recursos informáticos por parte de profesores y estudiantes del programa', 66, 2),
(408, '10.26.10', 'Información verificable sobre la existencia de criterios y políticas institucionales y del programa, en materia de adquisición y actualización de recursos informáticos y de comunicación.', 66, 2),
(409, '10.26.11', 'Información verificable sobre la existencia de una plataforma tecnológica que garantice buena conectividad y acceso a bases de datos o sistemas de información a nivel mundial.', 66, 2),
(410, '10.26.12', 'Apreciación de directivos, profesores y estudiantes acerca de la cantidad de los recursos informáticos utilizados en el programa', 66, 2),
(411, '10.26.13', 'Apreciación de directivos, profesores y estudiantes acerca de la calidad de los recursos informáticos utilizados en el programa', 66, 2),
(412, '10.27.1', 'Relación entre el número de personal administrativo y de servicio, y el número de       docentes y estudiantes, para responder adecuadamente a las exigencias del programa.', 67, 2),
(413, '10.27.2', 'Información verificable sobre la preparación técnica adecuada del personal administrativo y capacitación del mismo para cumplir sus funciones.', 67, 2),
(414, '10.27.3', 'Información verificable sobre la coherencia entre la administración y gestión del programa y las tareas científicas del mismo.', 67, 2),
(415, '10.27.4', 'Apreciación de las directivas del programa de la calidad del apoyo administrativo por parte de profesores y estudiantes.', 67, 2),
(416, '10.28.1', 'Información verificable que  plantean claramente la viabilidad financiera del programa, proyectando ingresos y egresos para los próximos tres a cinco años, explicando estrategia financiera prevista.', 68, 2),
(417, '10.28.2', 'Información verificable de la programación y ejecución del presupuesto de inversión y de funcionamiento del programa.', 68, 2),
(418, '10.28.3', 'Información verificable de mecanismos de control para la ejecución presupuestal.', 68, 2),
(419, '10.28.4', 'Apreciación de directivos y profesores del programa sobre lo adecuado de los recursos presupuestales de que se dispone.', 68, 2),
(420, '10.29.1', 'Información verificable sobre las funciones del Comité Nacional Curricular y de Autoevaluación del Programa.', 69, 2),
(421, '10.29.2', 'Apreciación de directivos, profesores, estudiantes y personal administrativo sobre la calidad de los sistemas de información para la gestión académica del programa.', 69, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `instrumento`
--

CREATE TABLE IF NOT EXISTS `instrumento` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `descripcion` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `instrumento`
--

INSERT INTO `instrumento` (`id`, `nombre`, `descripcion`) VALUES
(1, 'Encuesta', 'Instrumento para recolectar información a traves de encuestas'),
(2, 'Información numérica', 'Instrumento para recolectar información a traves de información numérica'),
(3, 'Información documental', 'Instrumento para recolectar información a traves de información documental');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `instrumentohasindicador`
--

CREATE TABLE IF NOT EXISTS `instrumentohasindicador` (
  `instrumento_id` int(11) NOT NULL,
  `indicador_id` int(11) NOT NULL,
  PRIMARY KEY (`instrumento_id`,`indicador_id`),
  KEY `fk_instrumento_has_indicador_indicador1` (`indicador_id`),
  KEY `fk_instrumento_has_indicador_instrumento1` (`instrumento_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `instrumentohasindicador`
--

INSERT INTO `instrumentohasindicador` (`instrumento_id`, `indicador_id`) VALUES
(3, 1),
(1, 2),
(1, 3),
(1, 4),
(3, 5),
(3, 6),
(1, 7),
(1, 8),
(3, 9),
(3, 10),
(3, 11),
(3, 12),
(3, 13),
(2, 14),
(1, 15),
(2, 16),
(3, 17),
(3, 18),
(3, 19),
(2, 20),
(3, 21),
(3, 22),
(3, 23),
(3, 24),
(1, 25),
(3, 26),
(3, 27),
(3, 28),
(3, 29),
(3, 30),
(1, 31),
(2, 32),
(3, 33),
(1, 34),
(3, 35),
(1, 36),
(3, 37),
(3, 38),
(3, 39),
(2, 40),
(3, 41),
(1, 42),
(3, 43),
(3, 44),
(1, 45),
(3, 46),
(3, 47),
(1, 48),
(3, 49),
(3, 50),
(3, 51),
(2, 52),
(2, 53),
(2, 54),
(1, 55),
(3, 56),
(3, 57),
(3, 58),
(2, 59),
(1, 60),
(3, 61),
(2, 62),
(3, 63),
(3, 64),
(3, 65),
(3, 66),
(2, 67),
(1, 68),
(2, 69),
(1, 70),
(3, 71),
(3, 72),
(3, 73),
(3, 74),
(3, 75),
(1, 76),
(3, 77),
(3, 78),
(3, 79),
(3, 80),
(1, 81),
(3, 82),
(3, 83),
(2, 84),
(2, 85),
(1, 86),
(2, 87),
(2, 88),
(3, 89),
(2, 90),
(3, 91),
(3, 92),
(3, 93),
(3, 94),
(3, 95),
(3, 96),
(2, 97),
(1, 98),
(2, 99),
(3, 100),
(3, 101),
(3, 102),
(3, 103),
(3, 104),
(1, 105),
(3, 106),
(3, 107),
(2, 108),
(3, 109),
(3, 110),
(1, 111),
(3, 112),
(3, 113),
(3, 114),
(1, 115),
(3, 116),
(3, 117),
(3, 118),
(3, 119),
(3, 120),
(3, 121),
(2, 122),
(3, 123),
(3, 124),
(3, 125),
(3, 126),
(3, 127),
(3, 128),
(1, 129),
(1, 130),
(3, 131),
(3, 132),
(3, 133),
(1, 134),
(3, 135),
(2, 136),
(3, 137),
(3, 138),
(3, 139),
(2, 140),
(1, 141),
(3, 142),
(3, 143),
(3, 144),
(2, 145),
(3, 146),
(3, 147),
(1, 148),
(2, 149),
(3, 150),
(3, 151),
(3, 152),
(3, 153),
(1, 154),
(2, 155),
(2, 156),
(2, 157),
(2, 158),
(3, 159),
(1, 160),
(3, 161),
(1, 162),
(3, 163),
(3, 164),
(1, 165),
(3, 166),
(3, 167),
(3, 168),
(3, 169),
(1, 170),
(3, 171),
(3, 172),
(3, 173),
(2, 174),
(3, 175),
(2, 176),
(2, 177),
(2, 178),
(2, 179),
(2, 180),
(3, 181),
(2, 182),
(3, 183),
(2, 184),
(2, 185),
(2, 186),
(2, 187),
(2, 188),
(3, 189),
(2, 190),
(2, 191),
(2, 192),
(3, 193),
(2, 194),
(2, 195),
(2, 196),
(2, 197),
(2, 198),
(2, 199),
(3, 200),
(2, 201),
(2, 202),
(2, 203),
(2, 204),
(3, 205),
(3, 206),
(2, 207),
(3, 208),
(2, 209),
(3, 210),
(2, 211),
(2, 212),
(2, 213),
(2, 214),
(2, 215),
(2, 216),
(2, 217),
(1, 218),
(1, 219),
(1, 220),
(3, 221),
(2, 222),
(3, 223),
(3, 224),
(1, 225),
(3, 226),
(2, 227),
(1, 228),
(1, 229),
(2, 230),
(2, 231),
(2, 232),
(3, 233),
(3, 234),
(2, 235),
(3, 236),
(3, 237),
(1, 238),
(2, 239),
(1, 240),
(1, 241),
(2, 242),
(3, 243),
(3, 244),
(1, 245),
(1, 246),
(3, 247),
(1, 248),
(3, 249),
(3, 250),
(1, 251),
(1, 252),
(3, 253),
(3, 254),
(3, 255),
(3, 256),
(2, 257),
(2, 258),
(1, 259),
(3, 260),
(1, 261),
(3, 262),
(1, 263),
(3, 264),
(2, 265),
(3, 266),
(3, 267),
(2, 268),
(1, 269),
(3, 270),
(3, 271),
(3, 272),
(3, 273),
(3, 274),
(1, 275),
(3, 276),
(3, 277);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modelo`
--

CREATE TABLE IF NOT EXISTS `modelo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(500) NOT NULL,
  `descripcion` varchar(1000) NOT NULL,
  `fechaactualizacion` int(11) DEFAULT NULL,
  `fechacreacion` date NOT NULL,
  `observaciones` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `modelo`
--

INSERT INTO `modelo` (`id`, `nombre`, `descripcion`, `fechaactualizacion`, `fechacreacion`, `observaciones`) VALUES
(1, 'Modelo de Autoevaluación de Programas', 'Modelo de Autoevaluación de Programas de pregrado de la Universidad de Cartagena', NULL, '2013-05-25', NULL),
(2, 'Modelo de Autoevaluacion de Maestrias', 'Modelo de Autoevaluacion de Maestrias de la Universidad de Cartagena', NULL, '2013-05-27', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `muestra`
--

CREATE TABLE IF NOT EXISTS `muestra` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `formula` varchar(500) DEFAULT NULL,
  `proceso_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_muestra_proceso1_idx` (`proceso_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `muestraadministrativo`
--

CREATE TABLE IF NOT EXISTS `muestraadministrativo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cargo` varchar(45) DEFAULT NULL,
  `muestrapersona_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_muestraadministrativo_muestrapersona1` (`muestrapersona_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `muestraagencia`
--

CREATE TABLE IF NOT EXISTS `muestraagencia` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(45) DEFAULT NULL,
  `muestrapersona_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_muestraagencia_muestrapersona1` (`muestrapersona_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `muestradirector`
--

CREATE TABLE IF NOT EXISTS `muestradirector` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `muestrapersona_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_muestradirector_muestrapersona1` (`muestrapersona_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `muestradocente`
--

CREATE TABLE IF NOT EXISTS `muestradocente` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` varchar(45) DEFAULT NULL,
  `muestrapersona_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_muestradocente_muestrapersona1` (`muestrapersona_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `muestraegresado`
--

CREATE TABLE IF NOT EXISTS `muestraegresado` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `muestrapersona_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_muestraegresado_muestrapersona1` (`muestrapersona_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `muestraempleador`
--

CREATE TABLE IF NOT EXISTS `muestraempleador` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `empresa` varchar(255) NOT NULL,
  `cargo` varchar(255) DEFAULT NULL,
  `muestrapersona_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_muestraempleador_muestrapersona1` (`muestrapersona_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `muestraestudiante`
--

CREATE TABLE IF NOT EXISTS `muestraestudiante` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(45) NOT NULL,
  `semestre` varchar(45) NOT NULL,
  `periodo` varchar(45) NOT NULL,
  `anio` varchar(45) NOT NULL,
  `muestrapersona_id` int(11) NOT NULL,
  `programa_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_muestraestudiante_muestrapersona1` (`muestrapersona_id`),
  KEY `fk_muestraestudiante_programa1` (`programa_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `muestrapersona`
--

CREATE TABLE IF NOT EXISTS `muestrapersona` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cedula` varchar(45) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `apellido` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `mail` varchar(45) NOT NULL,
  `muestra_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_muestrapersona_muestra1_idx` (`muestra_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `numericadocumental`
--

CREATE TABLE IF NOT EXISTS `numericadocumental` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `documento` varchar(500) NOT NULL,
  `responsable` varchar(500) NOT NULL,
  `medio` varchar(500) NOT NULL,
  `lugar` varchar(500) NOT NULL,
  `evaluacion` int(11) NOT NULL,
  `accion` varchar(500) NOT NULL,
  `proceso_id` int(11) NOT NULL,
  `instrumentohasindicador_id` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_numericadocumental_proceso1_idx` (`proceso_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona`
--

CREATE TABLE IF NOT EXISTS `persona` (
  `id` varchar(25) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `apellido` varchar(255) NOT NULL,
  `password` varchar(45) NOT NULL,
  `mail` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `persona`
--

INSERT INTO `persona` (`id`, `nombre`, `apellido`, `password`, `mail`) VALUES
('1007027719', 'RAFAEL EDUARDO', 'PEDROZA MANGA ', '1007027719', 'rafa-120993@hotmail.com '),
('1007208350', 'YEIFER DUVAN', 'GOMEZ GONZALEZ', '1007208350', 'yeifer13@hotmail.com'),
('1020729179', 'CRISTIAN RAFAEL                         ', 'TRUJILLO ZULETA                         ', '1020729179', 'ctrujillozt@hotmail.com                      '),
('1043652362', 'JHONNY RAFAEL ', 'CASTRO LOPEZ', '1043652362', 'CASTROMAN-99@HOTMAIL.COM'),
('1043654907', 'JESÚS DAVID ', 'PIMIENTA PICO ', '1043654907', 'pimientapico@yahoo.com'),
('1044913334', 'CARLOS ANDRÉS ', 'CASTILLO PÁJARO ', '1044913334', 'carlosmaxhm@yahoo.com '),
('1044915846', 'LUIS EDUARDO                            ', 'OSORIO CONEO                            ', '1044915846', 'luis_coneo@hotmail.com                       '),
('1044917440', 'CARLOS ARTURO ', 'TATIS GORDON', '1044917440', 'tatisgordon@hotmail.com '),
('1044917781', 'ADALBERTO JOSÉ                          ', 'GARCÍA MÉNDEZ                           ', '1044917781', 'adalberto939@hotmail.com                     '),
('1044919151', 'CRISTIAN RAFAEL ', 'PARDO CRESPO', '1044919151', 'crispy1020@hotmail.com'),
('1044921397', 'LUIS EDUARDO', 'MEZA ESALAS ', '1044921397', 'elzame10@hotmail.com'),
('1044925132', 'LEONARDO ANDRES ', 'NUÑEZ BUELVAS ', '1044925132', 'leonardo-93@hotmail.com '),
('1044925822', 'IVAN DAVID', 'OSPINO VALENZUELA ', '1044925822', 'ivanovis_30@hotmail.com '),
('1047393812', 'ANDRES                                  ', 'ZUNIGA MENDEZ                           ', '1047393812', 'andreszm69@hotmail.com                       '),
('1047394014', 'LEONARDO ANTONIO                        ', 'RAMÍREZ MARTÍNEZ                        ', '1047394014', 'leopsycho7@gmail.com                         '),
('1047395983', 'GUSTAVO ADOLFO', 'ROJAS ALFARO', '1047395983', 'tavo_rojas22@hotmail.com'),
('1047397719', 'EUGENIO ', 'PAJARO ALMAGRO', '1047397719', 'epajaroa@unicartegena.edu.co'),
('1047398260', 'JUAN RAFAEL                             ', 'MENDEZ MATOS                            ', '1047398260', 'juanrey_1010@yahoo.es                        '),
('1047406088', 'OMAR OCTAVIO', 'FORTICH ALMANZA ', '1047406088', 'fortichalmanza@hotmail.com'),
('1047408359', 'NELSON JIMMY                            ', 'RAMIREZ RODRIGUEZ                       ', '1047408359', 'jim16-005@hotmail.com                        '),
('1047408963', 'ROIME YECID                             ', 'OROZCO HENAO                            ', '1047408963', 'emior0814@hotmail.com                        '),
('1047409363', 'JUAN DAVID', 'SANCHEZ DAZA', '1047409363', 'jdsanchezdaza@gmail.com '),
('1047412894', 'LEONARDO', 'ORTEGA HERNANDEZ', '1047412894', 'leon9894@gmail.com'),
('1047413117', 'ANGEL EDUARDO                           ', 'PENA ESQUIVEL                           ', '1047413117', 'arcangel_989@hotmail.com                     '),
('1047413144', 'ANDRES MANUEL                           ', 'HEREDIA LOPEZ                           ', '1047413144', 'andrus.81@hotmail.com                        '),
('1047413683', 'WILLIAM ENRIQUE                         ', 'CASTILLO CORREA                         ', '1047413683', 'wecc18@hotmail.com                           '),
('1047415405', 'ABEL ENRIQUE                            ', 'POMARES AGAMEZ                          ', '1047415405', 'a.pomares.a@hotmail.com                      '),
('1047415502', 'YAMID                                   ', 'PICO LEAL                               ', '1047415502', 'ypicoleal@gmail.com                          '),
('1047415538', 'ORLANDO JOSE                            ', 'DEL RIO BUENDIA                         ', '1047415538', 'orla725@hotmail.com                          '),
('1047416823', 'JHON CARLO                              ', 'BUENDIA ROBINSON                        ', '1047416823', 'jhon_buendia@hotmail.com                     '),
('1047418683', 'PITER ALEJANDRO ', 'VELASQUEZ COTA', '1047418683', 'pealveco@yahoo.com'),
('1047418845', 'ALVARO JAVIER ', 'MARTINEZ ZULUAGA', '1047418845', 'a_mello07@hotmail.com '),
('1047419618', 'CAROLINA                                ', 'ACUÑA GUZMÁN                            ', '1047419618', 'caritoaguz@hotmail.com                       '),
('1047420038', 'LILIBETH                                ', 'RODRIGUEZ GOMEZ                         ', '1047420038', 'lilibethrodriguez2440@hotmail.com            '),
('1047420386', 'JULIAN                                  ', 'GAMARRA BALBUTIN                        ', '1047420386', 'MorPheuS11@hotmail.es                        '),
('1047421446', 'ALFREDO DE JESUS', 'VERBEL PUELLO ', '1047421446', 'alf-xtreme@hotmail.com'),
('1047421571', 'VIRGILIO MANUEL ', 'PADILLA RUIZ', '1047421571', 'virgiliopadilla@hotmail.com '),
('1047422283', 'DEWIS ENRIQUE                           ', 'ROMERO SANTAMARIA                       ', '1047422283', 'MR.DEWIS@HOTMAIL.COM                         '),
('1047422951', 'BENJAMIN JOSE                           ', 'TORRES CABARCAS                         ', '1047422951', 'benyo_blinblin@hotmail.com                   '),
('1047424991', 'Jason David                             ', 'Ovalle Manjarres                        ', '1047424991', 'ovallejason@hotmail.com                      '),
('1047425074', 'HERNAN', 'RIVERA CABEZA ', '1047425074', 'rivert08@HOTMAIL.COM'),
('1047425119', 'MARIA YOLANDA                           ', 'GONZALEZ CASTELLANOS                    ', '1047425119', 'thica65@hotmail.com                          '),
('1047425314', 'MARTHA PATRICIA ', 'IBAÑEZ CHAVERRA ', '1047425314', 'estrellita--007@hotmail.com '),
('1047425390', 'EVER LUIS                               ', 'BLANCO GARCIA                           ', '1047425390', 'ever_lis15@hotmail.com                       '),
('1047425645', 'MELVIN', 'TAJAN CORREA', '1047425645', 'melvintajan15@hotmail.com '),
('1047426345', 'JOSE ESTEBAN                            ', 'BETIN DIAZ                              ', '1047426345', 'jose_betin@hotmail.com                       '),
('1047426346', 'OSCAR ALFONSO                           ', 'SALCEDO ROBLES                          ', '1047426346', 'oscarsalcedo10@hotmail.com                   '),
('1047426383', 'JAIRO RAFAEL                            ', 'GUZMAN BRITO                            ', '1047426383', 'jrguzmanb.9010@hotmail.com                   '),
('1047426689', 'EDUARDO ENRIQUE                         ', 'PAJARO MARTINEZ                         ', '1047426689', 'eduardenrique-30@hotmail.com                 '),
('1047426759', 'ALBEYS', 'CASTILLO RUIZ ', '1047426759', 'albeys1@hotmail.com '),
('1047426880', 'ISAMAR', 'BLANQUICET BERRIO ', '1047426880', 'isa-0110@hotmail.com'),
('1047426951', 'GRACIE PAOLA                            ', 'LOPEZ PINEDA                            ', '1047426951', 'glopezp@unicartagena.info                    '),
('1047428270', 'IVAN DARIO', 'CUADRO GUZMAN ', '1047428270', 'ivan.dario@hotmail.com'),
('1047428364', 'OSWALDO ANDRES', 'VEGA GALARZA', '1047428364', 'oavg15@hotmail.com'),
('1047429276', 'HAROLD FABIAN ', 'SOLORZANO PEÑA', '1047429276', 'haspe90@hotmail.com '),
('1047430379', 'LUIS ALEJANDRO', 'SIERRA SUAREZ ', '1047430379', 'luis_sierra_90@hotmail.com'),
('1047432850', 'LUIS MANUEL                             ', 'ORTIZ DIAZ                              ', '1047432850', 'luisma_od@hotmail.com                        '),
('1047433224', 'JULIAN MAURICIO                         ', 'MARTINEZ FERNANDEZ                      ', '1047433224', 'julian790_realmadrid@hotmail.com             '),
('1047433267', 'LUIS FELIPE                             ', 'SERNA GOMEZ                             ', '1047433267', 'felo01234@hotmail.com                        '),
('1047434637', 'HOWARD ANDRES                           ', 'MARTINEZ MEZA                           ', '1047434637', 'howardmartinez@informaticos.com              '),
('1047434674', 'JOSE ALFREDO                            ', 'BOHORQUEZ AGUILAR                       ', '1047434674', 'jaba_0891@hotmail.com                        '),
('1047434781', 'DARWIN ALEXANDER                        ', 'ESCOBAR MIRANDA                         ', '1047434781', 'escobar7@hotmail.com                         '),
('1047434978', 'AMAURY DANIEL                           ', 'JIMENEZ ESCAMILLA                       ', '1047434978', 'amaury1047@hotmail.com                       '),
('1047435280', 'JORGE ANDRES', 'GOMEZ MARMOL', '1047435280', 'jorgegomezmarmol@hotmail.com'),
('1047435780', 'GUSTAVO JOSE', 'RODRIGUEZ ROMERO', '1047435780', 'phoenix2303@hotmail.com '),
('1047436247', 'HAYDER JOSE ', 'RHENALS PEREZ ', '1047436247', 'hayderhj@hotmail.com'),
('1047436327', 'JUAN CARLOS ', 'BUSTAMANTE MONTES ', '1047436327', 'juancarlosbust@hotmail.com'),
('1047436649', 'RICARDO ANDRÉS                          ', 'CARDONA ALARCÓN                         ', '1047436649', 'rick000@hotmail.com                          '),
('1047436661', 'JESUS DAVID ', 'PRASCA BUSTOS ', '1047436661', 'tatatan.91@hotmail.com'),
('1047437018', 'MIGUEL ANGEL', 'SEGURA GAZCON ', '1047437018', 'miguelonse88@hotmail.com'),
('1047437105', 'LUIS ALBERTO', 'BABILONIA FONSECA ', '1047437105', 'turcomen2324@hotmail.com'),
('1047437863', 'LEONARD JAVIER', 'YEPES ROJAS ', '1047437863', 'lyepesr@hotmail.com '),
('1047440662', 'LING                                    ', 'LUNG ZUÑIGA                             ', '1047440662', 'ling.lung@hotmail.com                        '),
('1047441076', 'CARLOS MARIO', 'PATERNINA PEREZ ', '1047441076', 'cmario911@hotmail.com '),
('1047441541', 'PEDRO ANDRES', 'ALVAREZ ROMERO', '1047441541', 'calipso1991@hotmail.com '),
('1047441644', 'WESLY DAVID ', 'ESCAMILLA HERNANDEZ ', '1047441644', 'skmilla-hw-07@hotmail.com '),
('1047442506', 'AURY LORENA                             ', 'JARAMILLO CORREA                        ', '1047442506', 'aurylorena1224@hotmail.com                   '),
('1047442548', 'CARLOS ARTURO ', 'SALGADO MONROY', '1047442548', 'clase.103@hotmail.com '),
('1047443420', 'CRISTIAN DAVID                          ', 'POSSO PAJARO                            ', '1047443420', 'CRISSSO_DOG23@HOTMAIL.COM                    '),
('1047443719', 'ALVARO JOSE ', 'MEZA HERAZO ', '1047443719', 'masterkool04@hotmail.com'),
('1047445429', 'CRISTOBAL ', 'ROMERO ROSSI', '1047445429', 'tobal_romossi@hotmail.es'),
('1047445575', 'HECTOR ANDRES ', 'TRIANA LOPEZ', '1047445575', 'ptb1204@hotmail.com '),
('1047445791', 'MANUEL ADOLFO ', 'OCHOA DIAZ', '1047445791', 'skay8a@hotmail.com'),
('1047446020', 'JESUS ALBERTO                           ', 'RODRIGUEZ HENAO                         ', '1047446020', 'jealrohe@hotmail.com                         '),
('1047446583', 'SEBASTIAN FELIPE', 'BARON CAICEDO ', '1047446583', 'iceman.92@hotmail.com '),
('1047447298', 'KELVIN JOSE ', 'HERNANDEZ CABRERA ', '1047447298', 'keljohe@hotmail.com '),
('1047447311', 'JESUS EDUARDO ', 'BARRAZA PAVA', '1047447311', 'jeduardo_barraza@hotmail.com'),
('1047447643', 'BERNARDO ENRIQUE', 'MARTINEZ PEREZ', '1047447643', 'djberna14@hotmail.com '),
('1047447867', 'SKARLYS JINETH', 'COLON SAENZ ', '1047447867', 'saenz_921@hotmail.com '),
('1047448739', 'JUAN CARLOS ', 'MONSALVE GIRALDO', '1047448739', 'juan_kmg@live.com '),
('1047449043', 'WALTER EDUARDO', 'MORALES CHARRASQUIEL', '1047449043', 'tukoski@hotmail.com '),
('1047449557', 'RAFAEL RICARDO', 'VELASQUEZ HERNANDEZ ', '1047449557', 'rrvh07@hotmail.com'),
('1047449606', 'JONATHAN', 'LOZANO MORELO ', '1047449606', 'nate-kun@hotmail.com'),
('1047450631', 'MARIO ALEJANDRO ', 'RANGEL MORA ', '1047450631', 'mario6.10@live.com'),
('1047450650', 'ANDRES FELIPE ', 'SIPLE DE LA ESPRIELLA ', '1047450650', 'sipleandrew_1103@hotmail.com'),
('1047450734', 'CRISTIAN JAVIER ', 'HERNANDEZ BERROCAL', '1047450734', 'cristianhdz0710@hotmail.com '),
('1047450829', 'ERICK ELOY', 'WILCHES TRUJILLO', '1047450829', 'ericking12@hotmail.com'),
('1047451234', 'HECTOR LUIS ', 'POSADA YEPEZ', '1047451234', 'crixus-0hlpy9@hotmail.com '),
('1047451636', 'NELSON DANIEL ', 'BARRIOS VALENCIA', '1047451636', 'nb_derek@hotmail.com'),
('1047451644', 'BRANDON JOSE', 'MIER ARRIETA', '1047451644', 'bramiarr_0312@hotmail.com '),
('1047451778', 'CARLOS EDUARDO', 'BECERRA MEJÍA ', '1047451778', 'cebm1992@hotmail.com'),
('1047451812', 'FREDIS ANDRES ', 'ESCOBAR JIMENEZ ', '1047451812', 'fedex6587@hotmail.com '),
('1047452443', 'ESTEBAN JOSE', 'PUELLO FUENTES', '1047452443', 'estebanp009@hotmail.com '),
('1047452772', 'MARIA ANGELICA                          ', 'ZABALETA PALMERA                        ', '1047452772', 'mariangel-92@hotmail.com                     '),
('1047452823', 'CHRISTIAN GABRIEL ', 'TORRES MARTINEZ ', '1047452823', 'cristianotorres_c28@hotmail.com '),
('1047452868', 'ADELAIDA', 'GARI ARENAS ', '1047452868', 'doide2911@hotmail.com '),
('1047453834', 'KEVIN JOSE', 'RIVERA MENDEZ ', '1047453834', 'kevinrivera23@hotmail.com '),
('1047455030', 'JUAN JOSE ', 'MORAD FERNANDEZ ', '1047455030', 'juanjomorad_cr7@hotmail.com '),
('1047455664', 'GUSTAVO ENRIQUE ', 'PACHECO GOMEZ ', '1047455664', 'ryctabo@gmail.com '),
('1047455733', 'MARIA VICTORIA', 'DE AVILA MEJIA', '1047455733', 'mariadeavila@live.com '),
('1047456336', 'DANNA VANESSA ', 'DOLUGAR MARRUGO ', '1047456336', 'theprincesslibra_21@hotmail.com '),
('1047457012', 'NEYVER DAVID', 'BARRIOS MERCADO ', '1047457012', 'neyver.barrios.mercado_93@hotmail.com '),
('1047457019', 'JORGE ', 'CORTES ALVAREZ', '1047457019', 'george.c.o@hotmail.com'),
('1047457194', 'JORDAN ALEJANDRO', 'SALAZAR CUERVO', '1047457194', 'JASC_M0711@HOTMAIL.COM'),
('1047457703', 'JEFFERSON JOSE', 'FAJARDO CAYCEDO ', '1047457703', 'jjfc_real@hotmail.com '),
('1047458073', 'ANTONIO JOSE', 'HURTADO AGUAS ', '1047458073', 'jose_aguas@hotmail.com'),
('1047460099', 'FRANCISCO JAVIER', 'MARRUGO VENGOECHEA', '1047460099', 'marrugo.v@gmail.com '),
('1047460836', 'JOSE LUIS ', 'MARQUEZ GARCIA', '1047460836', 'marquezga_18@hotmail.com'),
('1047460999', 'PEDRO YAIR', 'CARABALLO VALLEJO ', '1047460999', 'pcaravall17@hotmail.com '),
('1047461582', 'CARLOS ANDRES ', 'GARCIA ALJURE ', '1047461582', 'carlosaljure_15@hotmail.com '),
('1047461706', 'Sergio Andrés ', 'Girado Arnedo ', '1047461706', 'sgiradoa@unicartagena.edu.co'),
('1047461938', 'LEONARDO FABIO', 'VASQUEZ GONGORA ', '1047461938', 'lefavago@hotmail.com'),
('1047462032', 'DIEGO FERNANDO', 'MANTILLA LLERENA', '1047462032', 'mc-fluter_14@hotmail.com'),
('1047462295', 'EDBER RICARDO ', 'TABOADA NARANJO ', '1047462295', 'edbertaboada@hotmail.com'),
('1047463742', 'JESUS MANUEL', 'HURTADO ACOSTA', '1047463742', 'hurtaco09@live.com'),
('1047464521', 'VICTOR FERNANDO ', 'DEL RIO PRENS ', '1047464521', 'victorprens@hotmail.com '),
('1047465063', 'CARLOS EDUARDO', 'PEREZ MEZA', '1047465063', 'CryT1c@hotmail.com'),
('1048289166', 'FERNANDO ANDRES ', 'BUITRAGO RODRIGUEZ', '1048289166', 'el.fer-22@hotmail.com '),
('1049453283', 'IVAN JOSE ', 'VILLAMIL OCHOA', '1049453283', '8avilla@gmail.com '),
('1049931423', 'CARLOS GUILLERMO                        ', 'CORONEL CARDONA                         ', '1049931423', 'carlosg310@hotmail.com                       '),
('1049932254', 'DUVIER ENRIQUE                          ', 'ZUÑIGA PEREZ                            ', '1049932254', 'deriver1989@yahoo.com                        '),
('1050036574', 'DAVID JAVIER', 'ANILLO LORA ', '1050036574', 'djmakia10@hotmail.com '),
('1050037270', 'CARLOS YESID', 'HERNANDEZ HERRERA ', '1050037270', 'caryesher91@hotmail.com '),
('1050038122', 'JAVIER EDUARDO', 'SOLANO GUZMAN ', '1050038122', 'javier930320@hotmail.com'),
('1050064709', 'MARCELO                                 ', 'SOLIS POVEDA                            ', '1050064709', 'marcemen20@hotmail.com                       '),
('1050921792', 'TEO MAYERLY ', 'LONDOÑO GUERRERO', '1050921792', 'teitolalinda@hotmail.com'),
('1050944065', 'GERMAN EDUARDO', 'MESTRE RAMOS', '1050944065', 'gmestrer1@unicartagena.edu.co '),
('1050958642', 'PEDRO PABLO ', 'ARCE ANAYA', '1050958642', 'grandfunk30@hotmail.com '),
('1050959364', 'YEIKARINA ', 'CORONELL RODRIGUEZ', '1050959364', 'yande_1907@hotmail.com'),
('1050961975', 'PEDRO JUAN', 'GUERRERO MUÑOZ', '1050961975', 'pjgm_18@hotmail.com '),
('1050962068', 'ISMAEL', 'SAYAS ARRIETA ', '1050962068', 'ISAYASARRIETA1993@HOTMAIL.COM '),
('1050962191', 'JOSE ANTONIO', 'TAMARA FUENTES', '1050962191', 'jochitoel1@hotmail.com'),
('1050962736', 'JUAN DAVID', 'VERGARA DE LEON ', '1050962736', 'jvergaradeleon@hotmail.com'),
('1051447716', 'EFRAIN JULIO', 'HERNANDEZ GONZALEZ', '1051447716', 'nicky1792@hotmail.com '),
('1051660552', 'ROBER ANTONIO                           ', 'FLOREZ YUNEZ                            ', '1051660552', 'fray256@hotmail.com                          '),
('1051672967', 'LUIS MIGUEL ', 'BELEÑO FONSECA', '1051672967', 'thedarkgargolas@hotmail.com '),
('1051742430', 'DUVAN ANTONIO ', 'CHAVEZ ROJAS', '1051742430', 'el_chicoleo_19@hotmail.com'),
('1051819796', 'JORGE LEONARDO                          ', 'ESCUDERO MARTINEZ                       ', '1051819796', 'JORGE-EM@HOTMAIL.COM                         '),
('1051823829', 'JUAN JOSÉ ', 'SARABIA CAFFRONI', '1051823829', 'fenix.perro@hotmail.com '),
('1051824073', 'PAULA ANDREA', 'PACHECO ESCALANTE ', '1051824073', 'panda12308@hotmail.com'),
('1063162164', 'LUIS ALBERTO', 'PUCHE DAJER ', '1063162164', 'lucho92p@hotmail.com'),
('1091655803', 'NELSON DAVID                            ', 'DUARTE OSORIO                           ', '1091655803', 'daviduos27@hotmail.com                       '),
('1094247286', 'DAMIAN JOSE                             ', 'RIOS VERGARA                            ', '1094247286', 'damianjrv@hotmail.com                        '),
('1099963163', 'DIEGO FERNANDO', 'MEZA ACOSTA ', '1099963163', 'thiago_1892@hotmail.com '),
('1099963388', 'ANDRES DAVID', 'BETIN RODRIGUEZ ', '1099963388', 'andre_14betin@hotmail.com '),
('1100546238', 'RUBEN DARIO ', 'IRIARTE LOPEZ ', '1100546238', 'ririartel@unicartagena.edu.co '),
('1101450188', 'JOSE BELL ', 'PRIMERA BARBOZA ', '1101450188', 'josebell30@hotmail.com'),
('1102849759', 'LEONARDO FABIO                          ', 'DIAZ ALVAREZ                            ', '1102849759', 'lensel_zero@hotmail.com                      '),
('1102850826', 'DAVID ANTONIO                           ', 'FLOREZ MENESES                          ', '1102850826', 'davo22.florez@gmail.com                      '),
('1102856458', 'LUIS FELIPE ', 'BLANCO GARAY', '1102856458', 'pipe-19-91love@hotmail.com'),
('1102859180', 'JOSE LUIS ', 'ARRIETA BLANCO', '1102859180', 'jolublargod@gmail.com '),
('1103110408', 'ANDRES DAVID', 'MEJIA ZARZA ', '1103110408', 'andres92.dest@hotmail.com '),
('1103217271', 'LUIS ALFONSO                            ', 'VELEZ SANTOS                            ', '1103217271', 'lvelezsantos@hotmail.com                     '),
('1104012279', 'RAMIRO MANUEL ', 'MEZA PEREZ', '1104012279', 'vicio1991@hotmail.com '),
('1104866832', 'LUIS MIGUEL ', 'GUERRERO SOTOMAYOR', '1104866832', 'Lmgs832@hotmail.com '),
('1104870798', 'JESUS DAVID ', 'RIONDO HERAZO ', '1104870798', 'jesus-h.r1993@hotmail.com '),
('1123630089', 'KEVIN ANDRES', 'LEON HERNANDEZ', '1123630089', 'kevinlh92@hotmail.com '),
('1128044691', 'ROBERT SAMIR', 'VARGAS MARTELO', '1128044691', 'rmdid@hotmail.com '),
('1128047055', 'DIEGO ARMANDO                           ', 'MAZA TAPIA                              ', '1128047055', 'dmata28@hotmail.com                          '),
('1128050684', 'JHON FREDY', 'MORALES MARIN ', '1128050684', 'jhony-morales@hotmail.com '),
('1128052568', 'STALIN DAVID                            ', 'OVIEDO VARGAS                           ', '1128052568', 'zapcannon51@hotmail.com                      '),
('1128054752', 'KELLY JOHANA                            ', 'MEJIA URUETA                            ', '1128054752', 'doncella87@hotmail.com                       '),
('1128057404', 'ALVARO LUIS                             ', 'PAYARES GUZMAN                          ', '1128057404', 'alpayares7@hotmail.com                       '),
('1128059390', 'ALBERTO ENRRIQUE', 'SERRANO TORRES', '1128059390', 'alhenrry@hotmail.com'),
('1128060361', 'BRAYAN ANTONIO                          ', 'ORTEGA GARCIA                           ', '1128060361', 'baog_26@hotmail.com                          '),
('1128060964', 'EDGARDO JAVIER                          ', 'DÍAZ PÉREZ                              ', '1128060964', 'edgarjdp@yahoo.es                            '),
('1128062003', 'SAMIR ANDRES                            ', 'HINCAPIE CAMELO                         ', '1128062003', 'sahincapiec@gmail.com                        '),
('1143326430', 'LEIMAN ALFONSO                          ', 'MEJIA MAURY                             ', '1143326430', 'leymere@gmail.com                            '),
('1143330196', 'OSCAR LUIS                              ', 'BARBOSA VALETA                          ', '1143330196', 'osquys31f@hotmail.com                        '),
('1143332414', 'RICARDO ', 'BARRIOS GUERRERO', '1143332414', 'akii_4@hotmail.com'),
('1143334111', 'WILSON  STIVEN                          ', 'PEREIRA MELENDEZ                        ', '1143334111', 'shakab_nizi@hotmail.com                      '),
('1143335800', 'JULIO CESAR                             ', 'DE AVILA PERTUZ                         ', '1143335800', 'juliodeavila25@hotmail.com                   '),
('1143336423', 'CRISTIAN CAMILO ', 'NOREÑA YANES', '1143336423', 'cricanoya_27@hotmail.com'),
('1143337592', 'ALBERTO CARLOS', 'CASTRO CASTRO ', '1143337592', 'carloscastro89@hotmail.com'),
('1143338386', 'JULIO CESAR                             ', 'BARCOS ESPITALETA                       ', '1143338386', 'jubarcos1_9@hotmail.com                      '),
('1143338761', 'CARLOS ARTURO ', 'VASQUEZ REYES ', '1143338761', 'carlosdark29@hotmail.com'),
('1143339248', 'FERNANDO JOSE ', 'CASASBUENAS BARRIOS ', '1143339248', 'ferjo88@hotmail.com '),
('1143340657', 'JUAN ALBERTO', 'ACOSTA TORRES ', '1143340657', 'juanco57@hotmail.com'),
('1143340921', 'ANTONIO JOSE', 'ANGULO PADILLA', '1143340921', 'ajap.xd@hotmail.com '),
('1143340925', 'CARLOS ANDRES                           ', 'BERMUDEZ TORRES                         ', '1143340925', 'carand315@hotmail.com                        '),
('1143342266', 'ROMARIO SENEN ', 'LOPEZ IBARRA', '1143342266', 'mafla1990@hotmail.com '),
('1143342464', 'LUIS CARLOS                             ', 'COVILLA YARCE                           ', '1143342464', 'lucacoya@hotmail.com                         '),
('1143343643', 'CESAR ANDRES                            ', 'VELASQUEZ MARTINEZ                      ', '1143343643', 'cesarandresvelasquez@hotmail.com             '),
('1143343782', 'IADER JOSE                              ', 'LORDUY SALAS                            ', '1143343782', 'iaderlor@hotmail.com                         '),
('1143344548', 'JOSE LUIS ', 'PEREZ ALVARADO', '1143344548', 'josle_85@hotmail.com'),
('1143344875', 'MAURICIO EDUARDO', 'ALVAREZ GONZALEZ', '1143344875', 'mauroalvarez2011@hotmail.com'),
('1143345556', 'JOSE CARLO                              ', 'OJEDA DE LA HOZ                         ', '1143345556', 'josecarlo_26@hotmail.com                     '),
('1143346120', 'ANTONIO LUIS                            ', 'PONCE RONDON                            ', '1143346120', 'america_y_real@hotmail.com                   '),
('1143346148', 'JESUS DAVID ', 'GIL BERDUGO ', '1143346148', 'jesus.gil@hotmail.com '),
('1143346271', 'ALEXANDER ', 'MORALES CANO', '1143346271', 'alex.morales04@hotmail.com'),
('1143346442', 'NEAL', 'DE ORO PINO ', '1143346442', 'nealdop@hotmail.es'),
('1143346570', 'FENEIRA                                 ', 'GARCIA CAMPO                            ', '1143346570', 'feneira_22@hotmail.com                       '),
('1143346597', 'ANTONIO CARLOS                          ', 'ORTEGA ARRIETA                          ', '1143346597', 'ortegaarrieta@hotmail.com                    '),
('1143346639', 'ALEXANDER RAFAEL', 'SILVERA CHARRIS ', '1143346639', 'alma_28_nov@hotmail.com '),
('1143347053', 'ARMANDO JOSE', 'GARCIA PEREZ', '1143347053', 'a-joe989@hotmail.com'),
('1143347094', 'RENZO DE JESUS', 'BARRIOS PAJARO', '1143347094', 'renzo.barrios1407@Gmail.com '),
('1143347323', 'JOLY STEPHANY                           ', 'ANILLO FARELLO                          ', '1143347323', 'jolysanillo@hotmail.com                      '),
('1143347612', 'LUIS MIGUEL                             ', 'MORALES PÁJARO                          ', '1143347612', 'luismiguel.mopa@hotmail.com                  '),
('1143348541', 'JHONATAN', 'URIBE ECHENIQUE ', '1143348541', 'jhue04@hotmail.com'),
('1143348639', 'CARLOS DAVID', 'MENCO GUARDO', '1143348639', 'carlosmenco@ingenieros.com'),
('1143349281', 'JOSE LUIS                               ', 'VEGA SUAREZ                             ', '1143349281', 'vega1593@hotmail.com                         '),
('1143350644', 'CESAR ANDRES                            ', 'AGUIRRE ROMERO                          ', '1143350644', 'canro91@hotmail.com                          '),
('1143351357', 'CRISTIAN ANDRES ', 'LOPEZ FUENTES ', '1143351357', 'calf39_6@hotmail.com'),
('1143351885', 'FRANKLIN ANTONIO', 'ACUÑA PESTANA ', '1143351885', 'ciberfrank_20@hotmail.com '),
('1143352701', 'JAIME ENRIQUE                           ', 'FAJARDO HERRERA                         ', '1143352701', 'kfajardo@hotmail.es                          '),
('1143352985', 'FREDDY ANDRES ', 'PERTUZ PRIETO ', '1143352985', 'freddypertuz@hotmail.com'),
('1143353411', 'DIYINA CECILIA                          ', 'FERNANDEZ GOMEZ                         ', '1143353411', 'diyis5@hotmail.com                           '),
('1143353501', 'EVER DANIEL ', 'GONZÁLEZ GUZMÁN ', '1143353501', 'edgg72@hotmail.com'),
('1143353556', 'CINDY MARGARITA                         ', 'PACHECO ALVAREZ                         ', '1143353556', 'cindy_pacheco30@hotmail.com                  '),
('1143353987', 'SAMUEL ALEJANDRO', 'PORTACIO APARICIO ', '1143353987', 'nekros8@hotmail.com '),
('1143354081', 'JHONNY ENRIQUE                          ', 'MADERA OSORIO                           ', '1143354081', 'jhonnymaos_10@hotmail.com                    '),
('1143354166', 'LUIS ALFREDO                            ', 'MONCARIS GONZALEZ                       ', '1143354166', 'luis_moncaris1991@hotmail.com                '),
('1143354403', 'KEVIN RAFAEL                            ', 'SARMIENTO MENDOZA                       ', '1143354403', 'krsarmiento@gmail.com                        '),
('1143354702', 'JESUS DAVID ', 'ESCOBAR LASCARRO', '1143354702', 'jesusdavid20_@hotmail.com '),
('1143354714', 'JUAN FELIPE ', 'CERVANTES TOLOZA', '1143354714', 'tatoomsn@hotmail.com'),
('1143354736', 'MOISES DAVID', 'CORREA AVILA', '1143354736', 'moisescorrea2011@hotmail.com'),
('1143354737', 'JAIME DAVID ', 'DIAZ ARROYO ', '1143354737', 'jaime-david-diaz@hotmail.com'),
('1143355214', 'ARTURO                                  ', 'VERBEL DE LEON                          ', '1143355214', 'arturo-verbel@hotmail.com                    '),
('1143355772', 'EDUARDO ALFONSO ', 'ROSALES MONTALBAN ', '1143355772', 'badboyer_22@hotmail.com '),
('1143355967', 'MELISSA ANDREA', 'OROZCO ACEVEDO', '1143355967', 'melo_orozcoacevedo@hotmail.com'),
('1143356182', 'ALBERTO JOSE', 'URUETA CABEZA ', '1143356182', 'cenarius_164@hotmail.com'),
('1143356821', 'LUIS EDUARDO MANUEL ', 'MENDOZA ANGULO', '1143356821', 'luis.eduardo.mendoza@live.com '),
('1143356946', 'FRANK JOSE', 'SANCHEZ CASTELLAR ', '1143356946', 'fran.sanchez01@hotmail.com'),
('1143357270', 'JORGE ANDRÉS                            ', 'OSORIO ROMERO                           ', '1143357270', 'master.jorg3@gmail.com                       '),
('1143357644', 'RODRIGO ALFONSO ', 'MARTINEZ TORRES ', '1143357644', 'rockyramt610@hotmail.com'),
('1143358785', 'JAIDER                                  ', 'GARCES CARRASCAL                        ', '1143358785', 'jaidergc@gmail.com                           '),
('1143358834', 'KEVIN ALON', 'YAU LAI ', '1143358834', 'cyberdragun@hotmail.com '),
('1143359039', 'DANIEL ALFONSO', 'FUENTES LÓPEZ ', '1143359039', 'fuentes_616@hotmail.com '),
('1143359150', 'LUIS ENRIQUE', 'CONSUEGRA ARRIETA ', '1143359150', 'ing.luisconsuegra@live.com'),
('1143359411', 'JUAN MANUEL ', 'JARAMILLO BELTRAN ', '1143359411', 'jmjb_jaramillo1992@hotmail.com'),
('1143359449', 'STEFANY DEL CARMEN', 'RAMOS CASTRO', '1143359449', 'tipuni@hotmail.com'),
('1143359519', 'ELIAS DAVID ', 'ZABALETA CORREA ', '1143359519', 'eldavi007@hotmail.com '),
('1143359984', 'OMAR YESID', 'VALDELAMAR MANJARRES', '1143359984', 'damaluz19@hotmail.com '),
('1143360055', 'ALEJANDRA INES                          ', 'RIOS RODRIGUEZ                          ', '1143360055', 'alerios.9@hotmail.es                         '),
('1143360328', 'JHANIO ALFONSO', 'JIMENEZ CARMONA ', '1143360328', 'yankes@hotmail.es '),
('1143360556', 'JOSE ALEJANDRO', 'AGUDELO VERGARA ', '1143360556', 'alejofila@hotmail.com '),
('1143360688', 'ALBERTO CARLOS', 'BARBOZA MERCADO ', '1143360688', 'alber-cbm@hotmail.com '),
('1143360796', 'EDUARDO JOSE', 'LOPEZ BARRETO ', '1143360796', 'ingenierolopez7@hotmail.com '),
('1143361183', 'JEFFREY ALONSO', 'ESPINEL PEREZ ', '1143361183', 'jeffrey_espinel@hotmail.com '),
('1143361361', 'MARIO JOSE', 'BARRIOS PACHECO ', '1143361361', 'mariobp_321@hotmail.com '),
('1143361663', 'KELIN ', 'CARREAZO CABARCAS ', '1143361663', 'jo_ke_23@hotmail.com'),
('1143361742', 'ROBERTO CARLOS', 'FERRER GARCÍA ', '1143361742', 'rocafega02@hotmail.com'),
('1143361777', 'MILTON ELIAS                            ', 'LIZCANO PEREZ                           ', '1143361777', 'melp1911@hotmail.com                         '),
('1143361881', 'DANIEL ALBERTO', 'ARDILA CARRASQUILLA ', '1143361881', 'DNA_Elreyscorpion8-11@hotmail.com '),
('1143362129', 'EMMANUEL', 'GARCIA MAESTRE', '1143362129', 'ema16gm@hotmail.com '),
('1143362263', 'ANGELICA MARIA', 'CONTRERAS BLANQUICETT ', '1143362263', 'angelicacontreras1992@hotmail.com '),
('1143362740', 'EDGARDO JOSE', 'DIAZ DEL CASTILLO ', '1143362740', 'diazdelcastillo1992@hotmail.com '),
('1143362803', 'ORLANDO VICENTE ', 'BUSTAMANTE SANTANDER', '1143362803', 'orvibusa@hotmail.com'),
('1143362910', 'IVAN DARIO', 'FLOREZ GUERRERO ', '1143362910', 'budopapi@hotmail.com'),
('1143363125', 'JESUS MANUEL', 'QUINTANA MARTINEZ ', '1143363125', 'jm921027@gmail.com'),
('1143363501', 'RAUL ANDRES ', 'PIÑERES CARRERA ', '1143363501', 'raanpica08@hotmail.com'),
('1143364669', 'NATALI PAOLA', 'MAZA FIGUEROA ', '1143364669', 'nmazaf@gmail.com'),
('1143365170', 'CRISTIAM MANUEL JUNIOR', 'MERCADO JIMENEZ ', '1143365170', 'cristian0514@hotmail.com'),
('1143365900', 'LUIS ALFONSO', 'LENES SALAS ', '1143365900', 'luigiflow07@hotmail.com '),
('1143366270', 'KEVIN RAMIRO', 'SOTO MORALES', '1143366270', 'kevineldelflow2009@hotmail.com'),
('1143366580', 'LUIS ANGEL', 'MARTIN NAVARRO', '1143366580', 'luis700_jefe@hotmail.com'),
('1143367012', 'DANIEL EDUARDO', 'ACOSTA CONTRERAS', '1143367012', 'deacostac@hotmail.com '),
('1143367682', 'FREDDYS MANUEL', 'BARRIOS DEL RIO ', '1143367682', 'freddybarrios.077@gmail.com '),
('1143367742', 'FERNANDO DE JESUS ', 'CASTILLA OSPINA ', '1143367742', 'fer2593@hotmail.com '),
('1143368477', 'DIUNYS', 'DIAZ ALTAMAR', '1143368477', 'diza_06@hotmail.com '),
('1143369825', 'RAUL ALEJANDRO', 'TELLEZ MORA ', '1143369825', 'ralejotm@hotmail.com'),
('1143370194', 'PEDRO DAVID ', 'MANJARRES SERRANO ', '1143370194', 'pedro3manjarrez@hotmail.com '),
('1143370739', 'ANGIE XIMENA', 'QUINTANA TORREGLOZA ', '1143370739', 'angiequintanatorregloza@hotmail.com '),
('1143370871', 'HEISSER DAVID ', 'MENDOZA MEDINA', '1143370871', 'heissermm@hotmail.com '),
('1143372412', 'ROBERTO ', 'CASTELLAR RODRIGUEZ ', '1143372412', 'robercastellar@hotmail.com'),
('1143374525', 'RUBBER', 'YUNEZ MARTINEZ', '1143374525', 'rubber_yunez@hotmail.com'),
('1143374892', 'NATALY ALEXANDRA', 'DUNCAN BARCELO', '1143374892', 'natyduba_18@hotmail.com '),
('32937292', 'MARIA LILIANA                           ', 'CONEO CARABALLO                         ', '32937292', 'liliana.coneo@gmail.com                      '),
('45565790', 'MAIRA ', 'BASTIDAS GOMEZ', '45565790', 'maira.bastidas.gomez@hotmail.com'),
('73005973', 'SAAD NAYIB                              ', 'BITTAR MONTERROZA                       ', '73005973', 'SAAD088@HOTMAIL..COM                         '),
('73006859', 'ONEL', 'ARRIETA ZUñIGA', '73006859', 'elbuho9@hotmail.com '),
('73160028', 'GABRIEL ', 'DIZZETT UTRIA ', '73160028', 'gdizzett_u@yahoo.com'),
('73209373', 'DAVID                                   ', 'MARTINEZ ESGUERRA                       ', '73209373', 'david.m.esguerra@hotmail.com                 '),
('7938826', 'PEDRO JOSE                              ', 'PAYARES GARCIA                          ', '7938826', 'payares_7@yahoo.es                           '),
('94011911522', 'SAIR JOSE ', 'MARTINEZ MEDINA ', '94011911522', 'marmed_1901@hotmail.com '),
('94013012827', 'ROBERTO CARLOS', 'AHUMADA VIANA ', '94013012827', 'rcav356@hotmail.com '),
('94013126903', 'JORGE IVAN', 'MARTINEZ PUELLO ', '94013126903', 'jorkat_1212@hotmail.com '),
('94021311965', 'RAFAEL JOSE ', 'MENDOZA RODRIGUEZ ', '94021311965', 'mendozajunior120@gmail.com'),
('94022213126', 'JAIME JOSE', 'HERRERA PETRO ', '94022213126', 'jaimejose294@hotmail.com'),
('94030113149', 'JORGE LUIS', 'CARBAL YEPES', '94030113149', 'jorgeluiscarbal@hotmail.com '),
('94030128820', 'JUAN DAVID', 'PEREZ DIAZ', '94030128820', 'TOP_KILLER_03@HOTMAIL.COM '),
('94032929421', 'LUIS PABLO', 'ROJAS HERRERA ', '94032929421', 'PEDROLUCHO09@HOTMAIL.COM'),
('94041213021', 'JORGE ELIECER ', 'CARO OLMOS', '94041213021', 'jegco13@hotmail.com '),
('94042512456', 'JULIETH ALEXANDRA ', 'DIAZ VASQUEZ', '94042512456', 'jdvva25@hotmail.com '),
('94050129521', 'DANIEL JOSE ', 'CARRILLO HERRERA', '94050129521', 'danieljose_ing@hotmail.com'),
('94060618024', 'RONALD LUIS ', 'HERRERA MARRUGO ', '94060618024', 'ronald9466@hotmail.com'),
('94061112388', 'BRAYAN', 'BATISTA ZUÑIGA', '94061112388', 'bbz_06@hotmail.es '),
('94061713829', 'CRISTIAN DAVID', 'ALVAREZ CORREA', '94061713829', 'cis.alvarez@hotmail.com '),
('94070512747', 'LUIS ANTONIO', 'CERVANTES ORTEGA', '94070512747', 'cervants_tk@hotmail.com '),
('94070528902', 'JORGE LEONARDO', 'HERNANDEZ MALLARINO ', '94070528902', 'JLHMFLOW@hotmail.com'),
('94071412207', 'DANIEL EDUARDO', 'GALOFRE VARGAS', '94071412207', 'escorpion_d14@hotmail.com '),
('94080529001', 'DANIEL EDUARDO', 'ALVEAR ARTUZ', '94080529001', 'dalveartuz@hotmail.com'),
('94080912581', 'MIGUEL ANGEL', 'ESTREMOR HERRERA', '94080912581', 'miguesh_09@hotmail.com'),
('94082017962', 'LUIS MIGUEL ', 'RUIZ HERNANDEZ', '94082017962', 'luismiguelrh.20@hotmail.com '),
('94082809524', 'JUAN CAMILO ', 'BELEÑO VEGA ', '94082809524', 'JUCABEL08@HOTMAIL.COM '),
('94091530583', 'RICARDO JOSE', 'DIAZ HERRERA', '94091530583', 'ricky00777@homail.com '),
('94092012705', 'EDGAR DANIEL', 'CASTRO VILLA', '94092012705', 'edgar_kstro2@hotmail.com'),
('94100816845', 'LUIS ALBERTO', 'BERNAL CARRASCAL', '94100816845', 'luis-0080@hotmail.com '),
('94101218869', 'OSMAR ', 'PEÑA GONZALEZ ', '94101218869', 'osmarpego_10.12@hotmail.com '),
('94101329261', 'ENGELS RAFAEL ', 'DE LA BARRERA JIMENEZ ', '94101329261', 'sk8-angelz@hotmail.com'),
('94102525803', 'FABIO DE JESUS', 'MANGONES LUNA ', '94102525803', 'fabiodejesus.m.l@hotmail.com'),
('94102600082', 'EDUARDO JOSE', 'DAVILA MARTINEZ ', '94102600082', 'davilaroger@hotmail.com '),
('94103118306', 'JORGE ANTONIO ', 'BLANCO HERRERA', '94103118306', 'Jorge.whitte@hotmail.com'),
('94110130885', 'MIGUEL ANGEL', 'MERCADO TIRADO', '94110130885', 'miguel_rey94@hotmail.com'),
('94110516562', 'JUAN CAMILO ', 'MUÑOZ BURGOS', '94110516562', 'cositamor2010@hotmail.com '),
('94110918946', 'JOSE JAVIER ', 'SERNA GRIMALDO', '94110918946', 'mac_baby2006@hotmail.com'),
('94112312344', 'JUAN CARLOS ', 'SARMIENTO ROSSO ', '94112312344', 'juancasarmiento_3@yahoo.es'),
('94120714265', 'KELVIN DAVID', 'VEGA PÉREZ', '94120714265', 'karagnoz@gmail.com'),
('94120932424', 'JAIME ALFONSO ', 'OLMOS BARRIOS ', '94120932424', 'jaob1507@hotmail.com'),
('94122908385', 'JAIRO DAVID ', 'BELTRAN ASSIA ', '94122908385', 'jairodavidbeltranassia@hotmail.com'),
('95021005887', 'CAMILO ANDRÉS ', 'TANGARIFE CABEZA', '95021005887', 'catc95@hotmail.com'),
('95022809661', 'HAROLD ANDRES ', 'REYES PADILLA ', '95022809661', 'harp_951@hotmail.com'),
('95031729921', 'JESÚS DAVID ', 'MARTÍNEZ CAUSIL ', '95031729921', 'jedamarca@hotmail.com '),
('95032726225', 'BORIS FERNANDO', 'QUINTANA FAJARDO', '95032726225', 'boriji_95@hotmail.com '),
('95040530224', 'RICARDO ', 'AVILA GOMEZ ', '95040530224', 'rap-ak47@hotmail.com'),
('95042728803', 'EDGAR ENRIQUE ', 'JIMÉNEZ GARCÍA', '95042728803', 'edenjiga_@hotmail.com '),
('95050831966', 'RAFAEL ANDRES ', 'SALCEDO BARRETO ', '95050831966', 'BIOLABARRETO2010@HOTMAIL.COM'),
('95051127502', 'JOSHUA ISAAC', 'MARIMONT LARA ', '95051127502', 'msupez@gmail.com'),
('95051532520', 'CARLOS ANDRES ', 'QUEVEDO DIAZ', '95051532520', 'lequevedo_951@hotmail.com '),
('95051908709', 'JAVIER DAVID', 'CASTILLO BELTRAN', '95051908709', 'javicastillo584@hotmail.com '),
('95052429715', 'KATHERINE PAOLA ', 'PUELLO RAMOS', '95052429715', 'kathepuella@hotmail.com '),
('95070226988', 'ERICK ', 'PICO ECHENIQUE', '95070226988', 'erick_blackdj29@hotmail.com '),
('95080909765', 'OSCAR ANDRES', 'QUESEDO LOPEZ ', '95080909765', 'oscarandres-09@hotmail.com'),
('95082029002', 'LUIS EDUARDO', 'VIVAS RODRIGUEZ ', '95082029002', 'luise_vivasrodriguez@hotmail.com'),
('95090510305', 'JEYMARSON JOEL', 'GARCÍA SANMARTÍN', '95090510305', 'jeymar05@hotmail.com'),
('95090631781', 'DANIEL ANDRES ', 'OROZCO MENDEZ ', '95090631781', 'daniel_andres1995@hotmail.com '),
('95092931464', 'ESTEBAN RAFAEL', 'TRIVIÑO GUERRA', '95092931464', 'steven.trivinog@hotmail.com '),
('95101128408', 'LUIS DAVID', 'SALAS HERNANDEZ ', '95101128408', 'daveram@hotmail.com '),
('95103030022', 'JHONATAN', 'CHICO IGLESIAS', '95103030022', 'jhonatanchico_xp@hotmail.com'),
('95111928100', 'JOANMANUEL', 'THERAN BURGOS ', '95111928100', 'j_manuel_1995@hotmail.com '),
('95120416767', 'RICARDO ALEJANDRO ', 'OROZCO MARRUGO', '95120416767', 'ricardoom2009@hotmail.com '),
('96012927646', 'Daniel Antonio', 'Yepes Ahumedo ', '96012927646', 'danielyepesahumedo@hotmail.com'),
('96040313645', 'IVAN ANDRES ', 'MORALES ESPINOSA', '96040313645', 'ivan_morales47@live.com.ar'),
('96050717868', 'JOSIAS DANIEL ', 'MONTOYA CAMPO ', '96050717868', 'josiasmc13@hotmail.com'),
('96121227549', 'ELBER YAMID ', 'CANOLES PEREZ ', '96121227549', 'elberyamid@hotmail.com'),
('97021208802', 'EMERSON RAFAEL', 'HERRERA DIAZ', '97021208802', 'emerson_971202@hotmail.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ponderacioncaracteristica`
--

CREATE TABLE IF NOT EXISTS `ponderacioncaracteristica` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nivelimportancia` float NOT NULL,
  `ponderacion` double NOT NULL,
  `justificacion` varchar(500) NOT NULL,
  `proceso_id` int(11) NOT NULL,
  `caracteristica_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_ponderacioncaracteristica_proceso1_idx` (`proceso_id`),
  KEY `fk_ponderacioncaracteristica_caracteristica1_idx` (`caracteristica_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ponderacionfactor`
--

CREATE TABLE IF NOT EXISTS `ponderacionfactor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ponderacion` double NOT NULL,
  `justificacion` varchar(500) NOT NULL,
  `proceso_id` int(11) NOT NULL,
  `factor_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_ponderacionfactor_proceso1_idx` (`proceso_id`),
  KEY `fk_ponderacionfactor_factor1_idx` (`factor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pregunta`
--

CREATE TABLE IF NOT EXISTS `pregunta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(100) NOT NULL,
  `pregunta` varchar(500) NOT NULL,
  `tipo` varchar(45) NOT NULL,
  `indicador_id` int(11) DEFAULT NULL,
  `modelo_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_pregunta_indicador1_idx` (`indicador_id`),
  KEY `fk_pregunta_modelo1` (`modelo_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=87 ;

--
-- Volcado de datos para la tabla `pregunta`
--

INSERT INTO `pregunta` (`id`, `codigo`, `pregunta`, `tipo`, `indicador_id`, `modelo_id`) VALUES
(1, '1.1.2.1', 'La Institución posee y utiliza medios para difundir la Misión y Visión institucional.', '1', 2, 1),
(2, '1.1.3.1', 'Los objetivos del programa académico se corresponden con la Misión y Visión institucional.', '1', 2, 1),
(3, '1.1.4.1', 'Entiendo el sentido de la Misión y Visión del programa.', '1', 4, 1),
(4, '1.1.4.2', 'Comparto el sentido de la Misión y Visión del programa.', '1', 4, 1),
(5, '1.2.2.1', 'Conozco el sentido del proyecto educativo del programa.', '1', 7, 1),
(6, '1.2.2.2', 'Comparto el sentido del proyecto educativo del programa.', '1', 7, 1),
(7, '1.2.3.1', 'Existen espacios académicos, estrategias y mecanismos en el programa para la discusión y actualización permanente del proyecto educativo del programa.', '1', 8, 1),
(8, '1.3.3.1', 'El programa académico tiene\npertinencia en función de las necesidades de la región\n del país, y del mundo.', '1', 15, 1),
(9, '1.3.3.2', 'El programa académico tiene\npertinencia en función de las necesidades de la región\ny del país, lo que se evidencia en el reconocimiento de los egresados.', '1', 15, 1),
(10, '2.5.2.1', 'El número de docentes se corresponde con el número de estudiantes.', '1', 25, 1),
(11, '2.5.2.2', 'Los recursos académicos y físicos disponibles se corresponden con el número de estudiantes.', '1', 25, 1),
(12, '2.6.2.1', 'La calidad de los espacios y estrategias que ofrece el programa, de acuerdo con la naturaleza y orientación de éste, para la participación en grupos o centros de estudio, proyectos de experimentación o de desarrollo empresarial y demás actividades académicas y culturales distintas de la docencia, contribuyen a su formación integral.', '1', 31, 1),
(13, '2.6.2.2', 'Las estrategias que ofrece el programa, de acuerdo con la naturaleza y orientación de éste, para la participación en grupos o centros de estudio, proyectos de experimentación o de desarrollo empresarial y demás actividades académicas y culturales distintas de la docencia, contribuyen a su formación integral.', '1', 31, 1),
(14, '2.7.2.1', 'El reglamento estudiantil es pertinente.', '1', 34, 1),
(15, '2.7.2.2', 'El reglamento estudiantil tiene vigencia.', '1', 34, 1),
(16, '2.7.2.3', 'El reglamento estudiantil se aplica de forma adecuada.', '1', 34, 1),
(17, '2.7.4.1', 'El estudiantado participa en los órganos de dirección del programa.', '1', 36, 1),
(18, '3.8.4.1', 'Conoce las políticas, normas y criterios académicos establecidos por la Institución para la selección y vinculación de sus profesores.', '1', 42, 1),
(19, '3.9.3.1', 'El reglamento profesoral es pertinente.', '1', 45, 1),
(20, '3.9.3.2', 'El reglamento profesoral tiene vigencia.', '1', 45, 1),
(21, '3.9.3.3', 'El reglamento profesoral se aplica adecuadamente.', '1', 45, 1),
(22, '3.9.6.1', 'Las políticas institucionales en materia de participación del profesorado en los órganos de dirección de la institución y del programa se aplican adecuadamente.', '1', 48, 1),
(23, '3.10.6.1', 'El número de profesores del programa y la dedicación a este son suficientes y de calidad.', '1', 55, 1),
(24, '3.11.4.1', 'Las acciones orientadas al desarrollo integral de los profesores ha enriquecido la calidad del programa.', '1', 60, 1),
(25, '3.12.4.1', 'El régimen de estímulos al profesorado por el ejercicio calificado de la docencia, la investigación, la creación artística, la extensión o proyección social y la cooperación internacional ha enriquecido la calidad del programa.', '1', 68, 1),
(26, '3.13.2.1', 'Los materiales de apoyo (compilaciones, guias de estudio y de laboratorio, notas de clase, libros, entre otros) producidos por los docentes del programa, de acuerdo a su metodología, son de calidad.', '1', 70, 1),
(27, '3.13.2.2', 'Los materiales de apoyo (compilaciones, guias de estudio y de laboratorio, notas de clase, libros, entre otros) producidos por los docentes del programa, de acuerdo a su metodología, son pertinentes.', '1', 70, 1),
(28, '3.13.2.3', 'Los materiales de apoyo (compilaciones, guias de estudio y de laboratorio, notas de clase, libros, entre otros) producidos por los docentes del programa, de acuerdo a su metodología, son eficaces.', '1', 70, 1),
(29, '3.14.4.1', 'Hay correspondencia entre la remuneración y los méritos académicos y profesionales del profesorado.', '1', 76, 1),
(30, '3.15.5.1', 'Los criterios y mecanismos para la evaluación de docentes son transparentes.', '1', 81, 1),
(31, '3.15.5.2', 'Los criterios y mecanismos para la evaluación de docentes son equitativos.', '1', 81, 1),
(32, '3.15.5.3', 'Los criterios y mecanismos para la evaluación de docentes son eficaces.', '1', 81, 1),
(33, '4.16.5.1', 'El currículo del programa es integrado.', '1', 86, 1),
(34, '4.16.5.2', 'El currículo del programa es de calidad.', '1', 86, 1),
(35, '4.17.6.1', 'Las políticas institucionales en materia de flexibilidad curricular se aplican y son eficaces.', '1', 98, 1),
(36, '4.17.13.1', 'Participa en el diseño y evaluación de su propio plan académico (electivas, cursos libre, líneas de énfasis, entre otros) a partir de la oferta académica de acuerdo a su modalidad, intereses y la adquisición de competencias.', '1', 105, 1),
(37, '4.18.2.1', 'La interdisciplinariedad en el programa es pertinente, eficaz y contribuye a la formación del estudiante.', '1', 111, 1),
(38, '4.19.2.1', 'Existe correspondencia entre los métodos de enseñanza y aprendizaje que se emplean en el programa con el desarrollo de los contenidos del plan de estudios.', '1', 115, 1),
(39, '4.20.3.1', 'Existe correspondencia entre las formas de evaluación, la naturaleza del programa y las actividades didácticas empleadas.', '1', 129, 1),
(40, '4.20.4.1', 'La evaluación académica es equitativa y transparente.', '1', 130, 1),
(41, '4.21.3.1', 'Existe correspondencia entre la calidad de los trabajos realizados por los estudiantes y los objetivos de logros definidos.', '1', 134, 1),
(42, '4.22.4.1', 'Los sistemas de evaluación y autorregulación del programa, han incidido en el enriquecimiento de la calidad de éste.', '1', 141, 1),
(43, '4.23.6.1', 'Los proyectos realizados por el programa han tenido un impacto social.', '1', 148, 1),
(44, '4.24.3.1', 'El material bibliográfico con que cuenta el programa es pertinente.', '1', 154, 1),
(45, '4.24.3.2', 'El material bibliográfico con que cuenta el programa está actualizado.', '1', 154, 1),
(46, '4.24.3.3', 'El material bibliográfico con que cuenta el programa es suficiente.', '1', 154, 1),
(47, '4.25.1.1', 'Existe una plataforma tecnológica que garantice la conectividad, interactividad y acceso a sistemas de información, apoyos y recursos para el aprendizaje, de acuerdo con el tipo y modalidad del programa.', '1', 160, 1),
(48, '4.25.3.1', 'Los recursos informáticos y de comunicación con los que cuenta el programa son pertinentes.', '1', 162, 1),
(49, '4.25.3.2', 'Los recursos informáticos y de comunicación con los que cuenta el programa están actualizados.', '1', 162, 1),
(50, '4.25.3.3', 'Los recursos informáticos y de comunicación con que cuenta el programa, son suficientes.', '1', 162, 1),
(51, '4.25.6.1', 'Los recursos informáticos con los que cuenta el programa son pertinentes.', '1', 165, 1),
(52, '4.25.6.2', 'Los recursos informáticos con los que cuenta el programa se corresponden a sus necesidades.', '1', 165, 1),
(53, '4.25.6.3', 'Los recursos informáticos con los que cuenta el programa son suficientes.', '1', 165, 1),
(54, '4.26.4.1', 'El uso de laboratorios, talleres, ayudas audiovisuales y campos de prácticas es adecuado.', '1', 170, 1),
(55, '4.26.4.2', 'La dotación de laboratorios, talleres y campos de práctica es adecuada.', '1', 170, 1),
(56, '7.31.2.1', 'Los programas, servicios y actividades de bienestar institucional son de conocimiento publico', '1', 218, 1),
(57, '7.31.3.1', 'Los servicios y actividades y políticas de Bienestar contribuyen a su desarrollo personal.', '1', 219, 1),
(58, '7.31.4.1', 'Las políticas y servicios de Bienestar Institucional son pertinentes y han contribuido a la calidad de las funciones de docencia, investigación y extensión o proyección social.', '1', 220, 1),
(59, '7.31.9.1', 'Las condiciones de Bienestar de los escenarios de prácticas de los programas son adecuadas.', '1', 225, 1),
(60, '7.31.12.1', 'Las estrategias de apoyos socioeconómicos que le brinda la institución permiten su desarrollo personal y académico.', '1', 228, 1),
(61, '7.31.13.1', 'Las políticas institucionales y los servicios en materia de bienestar, en relación con la modalidad en que se ofrece el programa, son pertinentes.', '1', 229, 1),
(62, '8.33.2.1', 'Existe una coherencia entre la organización, administración y gestión del programa, y los fines de la docencia, la investigación, la extensión o proyección social y la cooperación nacional e internacional en el programa.', '1', 238, 1),
(63, '8.33.4.1', 'Existe claridad entre las funciones desarrolladas y las funciones del cargo.', '1', 240, 1),
(64, '8.33.5.1', 'Son eficientes y eficaces los procesos administrativos del programa.', '1', 241, 1),
(65, '8.34.3.1', 'Los sistemas de información y los mecanismos de comunicación son eficaces.', '1', 245, 1),
(66, '8.35.1.1', 'La orientación académica que imparten los directivos del programa y el liderazgo que ejercen son adecuados.', '1', 246, 1),
(67, '8.35.3.1', 'Conozco las políticas que orientan la gestión del programa.', '1', 248, 1),
(68, '9.36.3.1', 'La formación que se imparte en el programa es de calidad.', '1', 251, 1),
(69, '9.36.3.2', 'La formación recibida en el programa es de calidad.', '1', 251, 1),
(70, '9.36.4.1', 'La formacion recibida en el programa favorece el desarrollo del proyecto de vida.', '1', 252, 1),
(71, '9.37.4.1', 'La formación y el desempeño de los egresados del programa son de calidad.', '1', 259, 1),
(72, '10.38.2.1', 'La planta física es accesible.', '1', 261, 1),
(73, '10.38.2.2', 'La planta física está adecuadamente diseñada para el desarrollo de las actividades académicas.', '1', 261, 1),
(74, '10.38.2.3', 'La planta física posee suficiente capacidad para el desarrollo de las actividades académicas.', '1', 261, 1),
(75, '10.38.2.4', 'La plata física se encuentra suficientemente iluminada.', '1', 261, 1),
(76, '10.38.2.5', 'La planta física tiene una ventilación adecuada.', '1', 261, 1),
(77, '10.38.2.6', 'La planta física es segura.', '1', 261, 1),
(78, '10.38.2.7', 'La planta física posee adecuadas condiciones de higiene.', '1', 261, 1),
(79, '10.38.4.1', 'El número de las bibliotecas, salas de lectura grupal e individual, y los espacios para la consulta es suficiente.', '1', 263, 1),
(80, '10.38.4.2', 'El tamaño de las bibliotecas, salas de lectura grupal e individual, y los espacios para la consulta es adecuado.', '1', 263, 1),
(81, '10.38.4.3', 'La capacidad de las bibliotecas, salas de lectura grupal e individual, y los espacios para la consulta es suficiente.', '1', 263, 1),
(82, '10.38.4.4', 'La iluminación de las bibliotecas, salas de lectura grupal e individual , y los espacios para la consulta es adecuada', '1', 263, 1),
(83, '10.38.4.5', 'La ventilación de las bibliotecas, salas de lectura grupal e individual , y los espacios para la consulta es adecuada.', '1', 263, 1),
(84, '10.38.4.6', 'La dotación de las bibliotecas, salas de lectura grupal e individual, y los espacios para la consulta es suficiente.', '1', 263, 1),
(85, '10.39.4.1', 'Los recursos presupuestales de los que dispone el programa son suficientes.', '1', 269, 1),
(86, '10.40.3.1', 'La asignación de recursos físicos y financieros para el programa se hace de manera equitativa.', '1', 275, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `privilegio`
--

CREATE TABLE IF NOT EXISTS `privilegio` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `descripcion` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proceso`
--

CREATE TABLE IF NOT EXISTS `proceso` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fechainicio` varchar(30) NOT NULL,
  `fechacierre` varchar(30) DEFAULT NULL,
  `descripcion` varchar(500) DEFAULT NULL,
  `programa_id` int(11) NOT NULL,
  `modelo_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_proceso_programa1_idx` (`programa_id`),
  KEY `fk_proceso_modelo1` (`modelo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `procesohasindicador`
--

CREATE TABLE IF NOT EXISTS `procesohasindicador` (
  `proceso_id` int(11) NOT NULL,
  `indicador_id` int(11) NOT NULL,
  PRIMARY KEY (`proceso_id`,`indicador_id`),
  KEY `fk_proceso_has_indicador_indicador1` (`indicador_id`),
  KEY `fk_proceso_has_indicador_proceso1` (`proceso_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `programa`
--

CREATE TABLE IF NOT EXISTS `programa` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `descripcion` varchar(500) DEFAULT NULL,
  `modalidad` varchar(255) DEFAULT NULL,
  `tipoformacion` varchar(255) DEFAULT NULL,
  `facultad_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_programa_facultad1_idx` (`facultad_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=264 ;

--
-- Volcado de datos para la tabla `programa`
--

INSERT INTO `programa` (`id`, `nombre`, `descripcion`, `modalidad`, `tipoformacion`, `facultad_id`) VALUES
(11, 'INGENIERIA DE ALIMENTOS', 'INGENIERIA DE ALIMENTOS', 'Presencial', 'Pregrado', 5),
(21, 'INGENIERIA CIVIL', 'INGENIERIA CIVIL', 'Presencial', 'Pregrado', 5),
(22, 'INGENIERIA DE SISTEMAS', 'INGENIERIA DE SISTEMAS', 'Presencial', 'Pregrado', 5),
(23, 'INGENIERIA QUIMICA', 'INGENIERIA QUIMICA', 'Presencial', 'Pregrado', 5),
(130, 'PROYECTO DE CONSTRUCCION', 'PROYECTO DE CONSTRUCCION', 'Presencial', 'Postgrado', 5),
(132, 'QUIMICA ANALITICA', 'QUIMICA ANALITICA', 'Presencial', 'Postgrado', 5),
(136, 'ESPECIALIZACION EN INGENIERIA DE VIAS TERRESTRES', 'ESPECIALIZACION EN INGENIERIA DE VIAS TERRESTRES', 'Presencial', 'Postgrado', 5),
(148, 'MAESTRIA EN  INGENIERIA AMBIENTAL', 'MAESTRIA EN  INGENIERIA AMBIENTAL', 'Presencial', 'Postgrado', 5),
(149, 'ESPECIALIZACION EN PLANIFICACION EN TRANSITO Y TRANSPORTE', 'ESPECIALIZACION EN PLANIFICACION EN TRANSITO Y TRANSPORTE', 'Presencial', 'Postgrado', 5),
(166, 'ESPECIALIZACION EN INGENIERIA SANITARIA', 'ESPECIALIZACION EN INGENIERIA SANITARIA', 'Presencial', 'Postgrado', 5),
(174, 'ESPECIALIZACION EN ESTRUCTURAS', 'ESPECIALIZACION EN ESTRUCTURAS', 'Presencial', 'Postgrado', 5),
(263, 'ESPECIALIZACION EN GERENCIA DE PROYECTOS DE CONSTRUCCION', 'ESPECIALIZACION EN GERENCIA DE PROYECTOS DE CONSTRUCCION', 'Presencial', 'Postgrado', 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `representante`
--

CREATE TABLE IF NOT EXISTS `representante` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `apellido` varchar(255) NOT NULL,
  `password` varchar(45) NOT NULL,
  `rol` varchar(45) NOT NULL,
  `mail` varchar(45) DEFAULT NULL,
  `programa_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_representante_programa1_idx` (`programa_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1020757935 ;

--
-- Volcado de datos para la tabla `representante`
--

INSERT INTO `representante` (`id`, `nombre`, `apellido`, `password`, `rol`, `mail`, `programa_id`) VALUES
(123456, 'Usuario', 'Prueba', '123456', 'Comite programa', NULL, 23),
(212121, 'Juan', 'Perez', '123456', 'Comite programa', 'xx', 21),
(222222, 'Jorge', 'Anaya', '123456', 'Comite programa', 'zz', 22),
(45470344, 'Edna', 'Gomez Bustamante', '123456', 'Comite central', 'acreditacion@unicartagena.edu.co', NULL),
(1020757934, 'Arturo', 'González', '123456', 'Comite programa', NULL, 22);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `representantehasprivilegio`
--

CREATE TABLE IF NOT EXISTS `representantehasprivilegio` (
  `representante_id` int(11) NOT NULL,
  `privilegio_id` int(11) NOT NULL,
  PRIMARY KEY (`representante_id`,`privilegio_id`),
  KEY `fk_representante_has_privilegio_privilegio1` (`privilegio_id`),
  KEY `fk_representante_has_privilegio_representante1` (`representante_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `resultadoevaluacion`
--

CREATE TABLE IF NOT EXISTS `resultadoevaluacion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `respuesta` varchar(45) DEFAULT NULL,
  `encabezado_id` int(11) NOT NULL,
  `pregunta_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_ResultadoEvaluacion_encabezado1_idx` (`encabezado_id`),
  KEY `fk_ResultadoEvaluacion_pregunta1_idx` (`pregunta_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `administrativo`
--
ALTER TABLE `administrativo`
  ADD CONSTRAINT `fk_administrativo_fuente1` FOREIGN KEY (`fuente_id`) REFERENCES `fuente` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_administrativo_programa1` FOREIGN KEY (`programa_id`) REFERENCES `programa` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_administrativo_persona1` FOREIGN KEY (`persona_id`) REFERENCES `persona` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `agenciagubernamental`
--
ALTER TABLE `agenciagubernamental`
  ADD CONSTRAINT `fk_agenciagubernamental_fuente1` FOREIGN KEY (`fuente_id`) REFERENCES `fuente` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_agenciagubernamental_persona1` FOREIGN KEY (`persona_id`) REFERENCES `persona` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `asignacionencuesta`
--
ALTER TABLE `asignacionencuesta`
  ADD CONSTRAINT `fk_asignacionencuesta_fuente1` FOREIGN KEY (`fuente_id`) REFERENCES `fuente` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_asignacionencuesta_encuesta1` FOREIGN KEY (`encuesta_id`) REFERENCES `encuesta` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_asignacionencuesta_modelo1` FOREIGN KEY (`modelo_id`) REFERENCES `modelo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `caracteristica`
--
ALTER TABLE `caracteristica`
  ADD CONSTRAINT `fk_caracteristica_factor1` FOREIGN KEY (`factor_id`) REFERENCES `factor` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_caracteristica_modelo1` FOREIGN KEY (`modelo_id`) REFERENCES `modelo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `directorprograma`
--
ALTER TABLE `directorprograma`
  ADD CONSTRAINT `fk_directorprograma_fuente1` FOREIGN KEY (`fuente_id`) REFERENCES `fuente` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_directorprograma_programa1` FOREIGN KEY (`programa_id`) REFERENCES `programa` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_directorprograma_persona1` FOREIGN KEY (`persona_id`) REFERENCES `persona` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `docente`
--
ALTER TABLE `docente`
  ADD CONSTRAINT `fk_docente_fuente1` FOREIGN KEY (`fuente_id`) REFERENCES `fuente` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_docente_programa1` FOREIGN KEY (`programa_id`) REFERENCES `programa` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_docente_persona1` FOREIGN KEY (`persona_id`) REFERENCES `persona` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `egresado`
--
ALTER TABLE `egresado`
  ADD CONSTRAINT `fk_egresado_fuente1` FOREIGN KEY (`fuente_id`) REFERENCES `fuente` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_egresado_programa1` FOREIGN KEY (`programa_id`) REFERENCES `programa` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_egresado_persona1` FOREIGN KEY (`persona_id`) REFERENCES `persona` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `empleador`
--
ALTER TABLE `empleador`
  ADD CONSTRAINT `fk_empleador_fuente1` FOREIGN KEY (`fuente_id`) REFERENCES `fuente` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_empleador_persona1` FOREIGN KEY (`persona_id`) REFERENCES `persona` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `encabezado`
--
ALTER TABLE `encabezado`
  ADD CONSTRAINT `fk_encabezado_persona1` FOREIGN KEY (`persona_id`) REFERENCES `persona` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_encabezado_proceso1` FOREIGN KEY (`proceso_id`) REFERENCES `proceso` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_encabezado_encuesta1` FOREIGN KEY (`encuesta_id`) REFERENCES `encuesta` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_encabezado_fuente1` FOREIGN KEY (`fuente_id`) REFERENCES `fuente` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `encuesta`
--
ALTER TABLE `encuesta`
  ADD CONSTRAINT `fk_encuesta_modelo1` FOREIGN KEY (`modelo_id`) REFERENCES `modelo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `encuestahaspregunta`
--
ALTER TABLE `encuestahaspregunta`
  ADD CONSTRAINT `fk_encuesta_has_pregunta_encuesta1` FOREIGN KEY (`encuesta_id`) REFERENCES `encuesta` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_encuesta_has_pregunta_pregunta1` FOREIGN KEY (`pregunta_id`) REFERENCES `pregunta` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `estudiante`
--
ALTER TABLE `estudiante`
  ADD CONSTRAINT `fk_estudiante_fuente1` FOREIGN KEY (`fuente_id`) REFERENCES `fuente` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_estudiante_programa1` FOREIGN KEY (`programa_id`) REFERENCES `programa` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_estudiante_persona1` FOREIGN KEY (`persona_id`) REFERENCES `persona` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `factor`
--
ALTER TABLE `factor`
  ADD CONSTRAINT `fk_factor_modelo1` FOREIGN KEY (`modelo_id`) REFERENCES `modelo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `indicador`
--
ALTER TABLE `indicador`
  ADD CONSTRAINT `fk_indicador_caracteristica1` FOREIGN KEY (`caracteristica_id`) REFERENCES `caracteristica` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_indicador_modelo1` FOREIGN KEY (`modelo_id`) REFERENCES `modelo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `instrumentohasindicador`
--
ALTER TABLE `instrumentohasindicador`
  ADD CONSTRAINT `fk_instrumento_has_indicador_instrumento1` FOREIGN KEY (`instrumento_id`) REFERENCES `instrumento` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_instrumento_has_indicador_indicador1` FOREIGN KEY (`indicador_id`) REFERENCES `indicador` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `muestra`
--
ALTER TABLE `muestra`
  ADD CONSTRAINT `fk_muestra_proceso1` FOREIGN KEY (`proceso_id`) REFERENCES `proceso` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `muestraadministrativo`
--
ALTER TABLE `muestraadministrativo`
  ADD CONSTRAINT `fk_muestraadministrativo_muestrapersona1` FOREIGN KEY (`muestrapersona_id`) REFERENCES `muestrapersona` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `muestraagencia`
--
ALTER TABLE `muestraagencia`
  ADD CONSTRAINT `fk_muestraagencia_muestrapersona1` FOREIGN KEY (`muestrapersona_id`) REFERENCES `muestrapersona` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `muestradirector`
--
ALTER TABLE `muestradirector`
  ADD CONSTRAINT `fk_muestradirector_muestrapersona1` FOREIGN KEY (`muestrapersona_id`) REFERENCES `muestrapersona` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `muestradocente`
--
ALTER TABLE `muestradocente`
  ADD CONSTRAINT `fk_muestradocente_muestrapersona1` FOREIGN KEY (`muestrapersona_id`) REFERENCES `muestrapersona` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `muestraegresado`
--
ALTER TABLE `muestraegresado`
  ADD CONSTRAINT `fk_muestraegresado_muestrapersona1` FOREIGN KEY (`muestrapersona_id`) REFERENCES `muestrapersona` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `muestraempleador`
--
ALTER TABLE `muestraempleador`
  ADD CONSTRAINT `fk_muestraempleador_muestrapersona1` FOREIGN KEY (`muestrapersona_id`) REFERENCES `muestrapersona` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `muestraestudiante`
--
ALTER TABLE `muestraestudiante`
  ADD CONSTRAINT `fk_muestraestudiante_muestrapersona1` FOREIGN KEY (`muestrapersona_id`) REFERENCES `muestrapersona` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_muestraestudiante_programa1` FOREIGN KEY (`programa_id`) REFERENCES `programa` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `muestrapersona`
--
ALTER TABLE `muestrapersona`
  ADD CONSTRAINT `fk_muestrapersona_muestra1` FOREIGN KEY (`muestra_id`) REFERENCES `muestra` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `numericadocumental`
--
ALTER TABLE `numericadocumental`
  ADD CONSTRAINT `fk_numericadocumental_proceso1` FOREIGN KEY (`proceso_id`) REFERENCES `proceso` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `ponderacioncaracteristica`
--
ALTER TABLE `ponderacioncaracteristica`
  ADD CONSTRAINT `fk_ponderacioncaracteristica_proceso1` FOREIGN KEY (`proceso_id`) REFERENCES `proceso` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_ponderacioncaracteristica_caracteristica1` FOREIGN KEY (`caracteristica_id`) REFERENCES `caracteristica` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `ponderacionfactor`
--
ALTER TABLE `ponderacionfactor`
  ADD CONSTRAINT `fk_ponderacionfactor_proceso1` FOREIGN KEY (`proceso_id`) REFERENCES `proceso` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_ponderacionfactor_factor1` FOREIGN KEY (`factor_id`) REFERENCES `factor` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `pregunta`
--
ALTER TABLE `pregunta`
  ADD CONSTRAINT `fk_pregunta_indicador1` FOREIGN KEY (`indicador_id`) REFERENCES `indicador` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_pregunta_modelo1` FOREIGN KEY (`modelo_id`) REFERENCES `modelo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `proceso`
--
ALTER TABLE `proceso`
  ADD CONSTRAINT `fk_proceso_programa1` FOREIGN KEY (`programa_id`) REFERENCES `programa` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_proceso_modelo1` FOREIGN KEY (`modelo_id`) REFERENCES `modelo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `procesohasindicador`
--
ALTER TABLE `procesohasindicador`
  ADD CONSTRAINT `fk_proceso_has_indicador_proceso1` FOREIGN KEY (`proceso_id`) REFERENCES `proceso` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_proceso_has_indicador_indicador1` FOREIGN KEY (`indicador_id`) REFERENCES `indicador` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `programa`
--
ALTER TABLE `programa`
  ADD CONSTRAINT `fk_programa_facultad1` FOREIGN KEY (`facultad_id`) REFERENCES `facultad` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `representante`
--
ALTER TABLE `representante`
  ADD CONSTRAINT `fk_representante_programa1` FOREIGN KEY (`programa_id`) REFERENCES `programa` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `representantehasprivilegio`
--
ALTER TABLE `representantehasprivilegio`
  ADD CONSTRAINT `fk_representante_has_privilegio_representante1` FOREIGN KEY (`representante_id`) REFERENCES `representante` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_representante_has_privilegio_privilegio1` FOREIGN KEY (`privilegio_id`) REFERENCES `privilegio` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `resultadoevaluacion`
--
ALTER TABLE `resultadoevaluacion`
  ADD CONSTRAINT `fk_ResultadoEvaluacion_encabezado1` FOREIGN KEY (`encabezado_id`) REFERENCES `encabezado` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_ResultadoEvaluacion_pregunta1` FOREIGN KEY (`pregunta_id`) REFERENCES `pregunta` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
