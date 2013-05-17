-- phpMyAdmin SQL Dump
-- version 3.4.5
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 17-05-2013 a las 21:41:59
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
  `proceso_id` int(11) NOT NULL,
  `fuente_id` int(11) NOT NULL,
  `encuesta_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_asignacionencuesta_proceso1_idx` (`proceso_id`),
  KEY `fk_asignacionencuesta_fuente1_idx` (`fuente_id`),
  KEY `fk_asignacionencuesta_encuesta1_idx` (`encuesta_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `caracteristica`
--

CREATE TABLE IF NOT EXISTS `caracteristica` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(100) NOT NULL,
  `nombre` varchar(500) NOT NULL,
  `factor_id` int(11) NOT NULL,
  `modelo_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_caracteristica_factor1_idx` (`factor_id`),
  KEY `fk_caracteristica_modelo1` (`modelo_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=41 ;

--
-- Volcado de datos para la tabla `caracteristica`
--

INSERT INTO `caracteristica` (`id`, `codigo`, `nombre`, `factor_id`, `modelo_id`) VALUES
(1, '1.1', ' MISIÓN Y PROYECTO INSTITUCIONAL', 3, 1),
(2, '1.2', ' PROYECTO EDUCATIVO DEL PROGRAMA', 3, 1),
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
(40, '10.40', ' ADMINISTRACIÓN DE RECURSOS', 12, 1);

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
(5, 1),
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
(4, 5),
(5, 5),
(7, 5),
(1, 6),
(2, 6),
(5, 6),
(7, 6),
(1, 7),
(2, 7),
(5, 7),
(7, 7),
(1, 8),
(2, 8),
(5, 8),
(7, 8),
(1, 9),
(2, 9),
(5, 9),
(5, 10),
(3, 11),
(3, 12),
(1, 13),
(2, 13),
(5, 13),
(1, 14),
(2, 14),
(1, 17),
(2, 17),
(1, 18),
(2, 18),
(1, 19),
(2, 19),
(1, 20),
(2, 20),
(5, 20),
(1, 21),
(2, 21),
(1, 22),
(2, 22),
(5, 22),
(2, 23),
(5, 23),
(2, 24),
(5, 24),
(2, 25),
(5, 25),
(2, 26),
(5, 26),
(1, 27),
(2, 27),
(5, 27),
(1, 28),
(2, 28),
(5, 28),
(2, 29),
(2, 30),
(5, 30),
(1, 31),
(1, 32),
(1, 33),
(2, 34),
(2, 35),
(2, 36),
(2, 37),
(1, 38),
(2, 38),
(5, 38),
(1, 39),
(2, 39),
(5, 39),
(1, 40),
(5, 40),
(2, 41),
(5, 41),
(1, 42),
(2, 42),
(5, 42),
(1, 43),
(2, 43),
(1, 44),
(1, 45),
(2, 45),
(5, 45),
(1, 46),
(2, 46),
(5, 46),
(1, 47),
(2, 48),
(5, 48),
(1, 49),
(2, 49),
(4, 49),
(5, 49),
(3, 50),
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
(7, 54),
(1, 55),
(2, 55),
(5, 55),
(1, 56),
(2, 56),
(5, 56),
(1, 57),
(2, 57),
(5, 57),
(1, 58),
(2, 58),
(5, 58),
(1, 59),
(2, 59),
(5, 59),
(1, 60),
(2, 60),
(5, 60),
(1, 61),
(2, 61),
(1, 62),
(2, 62),
(1, 63),
(2, 63),
(5, 63),
(7, 63),
(1, 64),
(2, 64),
(5, 64),
(7, 64),
(1, 65),
(2, 65),
(5, 65),
(1, 66),
(2, 66),
(5, 66),
(1, 67),
(1, 68),
(2, 68),
(5, 68),
(1, 69),
(2, 69),
(5, 69),
(7, 69),
(7, 70),
(1, 71),
(2, 71),
(1, 72),
(2, 72),
(5, 72),
(7, 72),
(1, 73),
(2, 73),
(7, 73),
(2, 74),
(5, 74),
(7, 74),
(3, 75),
(4, 75),
(4, 76),
(3, 77),
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
(1, 85),
(2, 85),
(5, 85),
(7, 85),
(1, 86),
(2, 86),
(5, 86),
(7, 86),
(1, 87),
(2, 87),
(5, 87),
(7, 87),
(1, 88),
(2, 88),
(5, 88),
(7, 88),
(1, 89),
(2, 89),
(5, 89),
(7, 89),
(1, 90),
(2, 90),
(5, 90),
(7, 90),
(2, 91),
(5, 91),
(2, 92),
(5, 92);

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=13 ;

--
-- Volcado de datos para la tabla `factor`
--

INSERT INTO `factor` (`id`, `codigo`, `nombre`, `modelo_id`) VALUES
(3, '1', ' Misión, Proyecto Institucional y de programa', 1),
(4, '2', ' Estudiantes', 1),
(5, '3', ' Profesores', 1),
(6, '4', ' Procesos académicos', 1),
(7, '5', ' Visibilidad nacional e internacional', 1),
(8, '6', ' Investigación, innovación, creación artística y cultural', 1),
(9, '7', ' Bienestar institucional', 1),
(10, '8', ' Organización, administración y gestión', 1),
(11, '9', ' Impacto de los egresados en el medio', 1),
(12, '10', ' Recursos físicos y financieros', 1);

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fuente`
--

CREATE TABLE IF NOT EXISTS `fuente` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `descripcion` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `indicador`
--

CREATE TABLE IF NOT EXISTS `indicador` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(100) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `caracteristica_id` int(11) NOT NULL,
  `modelo_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_indicador_caracteristica1_idx` (`caracteristica_id`),
  KEY `fk_indicador_modelo1` (`modelo_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=598 ;

--
-- Volcado de datos para la tabla `indicador`
--

INSERT INTO `indicador` (`id`, `codigo`, `nombre`, `caracteristica_id`, `modelo_id`) VALUES
(300, '1.1.1', ' Documentos institucionales en los que se expresa la misión y visión   de la institución.', 1, 1),
(301, '1.1.2', ' Existencia y utilización de medios para difundir la misióny visión institucional.', 1, 1),
(302, '1.1.3', 'Grado de correspondencia entre el contenido de la misión, visión institucional y los objetivos del programa académico.', 1, 1),
(303, '1.1.4', ' Porcentaje de directivos, profesores, personal administrativo, estudiantes y egresados que entienden el sentido de la Misión, Visión y la comparten.', 1, 1),
(304, '1.1.5', 'Existencia de un programa  que garantice el acceso a la educación superior sin discriminación, así mismo para  orientar  identificar, eliminar o disminuir barreras en infraestructura física, accesibilidad y movilidad', 1, 1),
(305, '1.1.6', 'Documentos en los que se expresan criterios y orientaciones en relación con la adopción de la Educación en la modalidad del programa que se está evaluando.', 1, 1),
(306, '1.1.7', 'Existencia y aplicación de políticas institucionales para orientar las acciones y decisiones de los  programas a distancia o virtual en las funciones sustantivas y áreas estrategias. ', 1, 1),
(307, '1.1.8', 'Existencia y aplicación de criterios y orientaciones definidos para adelantar los procesos de autoevaluación y autorregulación de los programas en la modalidad de enseñanza en que se ofrece el programa evaluado.', 1, 1),
(308, '1.2.1', 'Existencia y utilización de estrategias y mecanismos establecidos para la discusión, actualización y difusióndel proyecto educativo del programa académico.', 2, 1),
(309, '1.2.2', 'Porcentaje de directivos, profesores y estudiantes que conocen y comparten el sentido del proyecto educativo del programa', 2, 1),
(310, '1.2.3', 'Apreciación de directivos, profesores y estudiantes sobre la existencia de espacios institucionales para la discusión y actualización permanente del proyecto educativo del programa.', 2, 1),
(311, '1.2.4', 'Correspondencia entre el proyecto educativo del programa y el proyecto institucional', 2, 1),
(312, '1.2.5', 'Existencia del Modelo pedagógico en el  PEP  que refleje la metodología de enseñanza que utilice el programa ', 2, 1),
(313, '1.2.6', 'Existencia de documento que relacione lo expresado en el PEP con las actividades académicas desarrolladas ', 2, 1),
(314, '1.2.7', 'Existencia de documentos que evidencien actividades de seguimiento del PEP', 2, 1),
(315, '1.2.8', 'Existencia de lineamientos Institucionales  que orienten de manera clara el uso de las TIC en los procesos académicos y administrativos de los programas.', 2, 1),
(316, '1.3.1', 'Evidencia sobre la reflexión y análisis de las tendencias y líneas de desarrollo en áreas disciplinares a nivel local, regional, nacional e internacional ', 3, 1),
(317, '1.3.2', 'Número y tipo de actividades del programa que muestran la relación del plan curricular con las necesidades locales, regionales, nacionales e internacionales.', 3, 1),
(318, '1.3.3', 'Apreciación de empleadores del sector público y/o privado y demás entes locales, regionales, nacionales o internacionales sobre la relevancia académica y pertinencia social del programa, y sobre el reconocimiento de sus egresados.', 3, 1),
(319, '1.3.4', 'Número y tipo de actividades y/o proyectos que adelanta el programa de acuerdo a las necesidades del entorno.', 3, 1),
(320, '1.3.5', 'Existencia de estudios y/o proyectos formulados o en desarrollo, que propendan por la modernización, actualización y pertinencia del currículo.', 3, 1),
(321, '1.3.6', 'Estudio en el cual se exprese  el impacto del programa en el medio.', 3, 1),
(322, '1.3.7', 'Existencia de estudios que demuestren la necesidad social del programa en la modalidad en que se ofrece.', 3, 1),
(323, '2.4.1', 'Existencia de políticas, criterios y reglamentaciones para la admisión de estudiantes de manera transparente.', 4, 1),
(324, '2.4.2', 'Relación de estudiantes que ingresaron mediante la aplicación de reglas generales y mecanismos de admisión excepcionales, en los últimos cinco años.', 4, 1),
(325, '2.4.3', 'Evidencias de evaluación y seguimiento a los procesos de selección  y admisión  y aplicación de los resultados de dicha evaluación. ', 4, 1),
(326, '2.4.4', 'Existencia de políticas y procedimientos para el ingreso de estudiantes en condición de transferencia, homologación u otro proceso que amerite criterios específicos para el tránsito entre ciclos, niveles y/o instituciones. ', 4, 1),
(327, '2.4.5', 'Evidencia de beneficios de los requerimientos de homologación y transferencia para los estudiantes.', 4, 1),
(328, '2.4.6', 'Existencia de políticas y reglamentaciones para la admisión de estudiantes a programas en la modalidad en que se ofrece el programa.', 4, 1),
(329, '2.4.7', 'Existencia de procesos de inducción para la apropiación de las estrategias de aprendizaje que exige la modalidad en que se ofrece el programa, de forma que posibiliten el ingreso y la permanencia de los estudiantes.', 4, 1),
(330, '2.4.8', 'Existencia y uso de sistemas y mecanismos de evaluación de los procesos de preselección y admisión, y de mecanismos para la aplicación de los resultados de dicha evaluación.', 4, 1),
(331, '2.4.9', 'Porcentaje de docentes, estudiantes y funcionarios que conocen los mecanismos de ingreso a los programas en la modalidad en que se ofrece el evaluado.', 4, 1),
(332, '2.5.1', 'Documentos que expresen las políticas institucionales para la definición del número de estudiantes que se admiten al programa, acorde con el cuerpo docente, recursos físicos y apoyo académico disponibles.', 5, 1),
(333, '2.5.2', 'Apreciación de profesores y estudiantes del programa con respecto a la relación entre el número de admitidos, el cuerpo docente y los recursos académicos y físicos disponibles.', 5, 1),
(334, '2.5.3', 'Población de estudiantes que ingresó al programa en los últimos cinco años, el puntaje promedio obtenido por los admitidos en las Pruebas de Estado, el puntaje promedio estandarizado en pruebas de admisión cuando éstas se realicen, el puntaje mínimo acept', 5, 1),
(335, '2.5.4', 'Programas de salud. Relación de convenios docencia-servicio requeridos para los objetivos del Programa.', 5, 1),
(336, '2.5.5', 'Programas de salud. Relación entre el número de estudiantes y la capacidad instalada de los escenarios de práctica (camas, docentes, tutores, investigadores, entre otros). ', 5, 1),
(337, '2.5.6', 'Programas de salud, Relación de profesores asistenciales, nivel de formación y experiencia en formación. ', 5, 1),
(338, '2.6.1', 'Documentos institucionales en los que se expresan las políticas y estrategias definidas por el programa en materia de formación integral de los estudiantes.', 6, 1),
(339, '2.6.2', 'Apreciación de los estudiantes sobre la calidad de los espacios y estrategias que ofrece el programa, de acuerdo con la naturaleza y orientación de éste, para la participación en grupos o centros de estudio, proyectos de experimentación o de desarrollo em', 6, 1),
(340, '2.6.4', 'Número de estudiantes que participan en grupos de estudio, proyectos de experimentación o de desarrollo empresarial o en las demás actividades académicas y culturales distintas de la docencia que brinda la Institución o el Programa para contribuir a la fo', 6, 1),
(341, '2.7.1', ' Evidencias de mecanismos de divulgación del Reglamento Estudiantil en el Programa', 7, 1),
(342, '2.7.2', ' Apreciación de estudiantes y profesores del programa sobre la pertinencia, vigencia y aplicación del reglamento estudiantil.', 7, 1),
(343, '2.7.3', 'Evidencias de aplicación del Reglamento estudiantil en situaciones especiales de los estudiantes.', 7, 1),
(344, '2.7.4', 'Apreciación de directivos, profesores y estudiantes sobre la participación del estudiantado en los órganos de dirección del programa. ', 7, 1),
(345, '2.7.5', 'Documentos que contengan Políticas y estrategias para estímulos académicos para los estudiantes. ', 7, 1),
(346, '2.7.6', 'Relación de estudiantes que han sido beneficiarios de estímulos académicos en los últimos cinco años. ', 7, 1),
(347, '2.7.7', 'Apreciación de profesores y estudiantes sobre la correspondencia entre las condiciones y exigencias académicas de permanencia y graduación en el programa, y la naturaleza y modalidad del mismo.', 7, 1),
(348, '3.8.1', 'Documentos que evidencien la aplicación de las políticas, normas y criterios académicos establecidos por la Institución para la selección y la vinculación de sus profesores   de planta y de cátedra', 8, 1),
(349, '3.8.2', 'Porcentaje de profesores que, en los últimos cinco años, fue vinculado al programa en desarrollo de dichas políticas, normas y criterios académicos.', 8, 1),
(350, '3.8.3', 'Documentos que contengan la Política Institucional de Relevo generacional.', 8, 1),
(351, '3.8.4', 'Porcentaje de directivos, profesores y estudiantes que conoce las políticas, normas y criterios académicos establecidos por la institución para la selección y vinculación de sus profesores.', 8, 1),
(352, '3.8.5', 'Políticas institucionales y reglamento para la vinculación del profesorado de planta y de cátedra a los programas en la modalidad en que se ofrece el evaluado, que tengan en cuenta la experiencia en el manejo de las herramientas pedagógicas, metodológicas', 8, 1),
(353, '3.9.1', 'Documentos que contengan Reglamento Profesoral.', 9, 1),
(354, '3.9.2', 'Evidencia documental de estrategias de divulgación del Estatuto Profesoral.', 9, 1),
(355, '3.9.3', 'Apreciación de directivos y profesores del programa sobre la pertinencia, vigencia y aplicación del Reglamento Profesoral.', 9, 1),
(356, '3.9.4', 'Información actualizada sobre el número de profesores adscritos a la facultad, al programa o departamento que sirva al mismo, por categorías académicas establecidas en el escalafón.', 9, 1),
(357, '3.9.5', 'Evidencia de la aplicación de las políticas institucionales en materia de ubicación, permanencia y ascenso en las categorías del escalafón docente', 9, 1),
(358, '3.9.8', 'Apreciación de directivos y profesores sobre la aplicación de las políticas institucionales en materia de participación del profesorado en los órganos de dirección de la institución y del programa', 9, 1),
(359, '3.10.1', 'Documentos donde se evidencie la participación de los profesores en los órganos de dirección del programa, de la facultad, y/o de la institución, durante los últimos cinco años. ', 10, 1),
(360, '3.10.2', 'Documento que relacione los  profesores de planta con título de especialización, maestría y doctorado con el objeto de conocimiento del programa adscritos directamente o a través de la facultad o departamento respectivo.', 10, 1),
(361, '3.10.3', 'Información demostrada acerca de las instituciones en las cuales fueron formados los profesores vinculados al programa.', 10, 1),
(362, '3.10.4', 'Porcentaje del tiempo de cada profesor del programa que se dedica a la docencia, a la investigación o creación artística, a la extensión o proyección social, a la atención de funciones administrativas, y a la tutoría académica individual a los estudiantes', 10, 1),
(363, '3.10.5', 'Porcentaje de profesores con dedicación de tiempo completo, medio tiempo al programa y porcentaje de profesores catedráticos.', 10, 1),
(364, '3.10.6', 'Relación entre el número de estudiantes del programa y el número de profesores al servicio del mismo, en relación a su proyecto educativo.', 10, 1),
(365, '3.10.7', 'Apreciación de directivos, profesores y estudiantes del programa sobre la calidad y la suficiencia del número y de la dedicación de los profesores al servicio de éste.', 10, 1),
(366, '3.10.8', 'Documentos en los que se explicite el sistema de tutoría a los estudiantes por parte de los profesores y se indique el tipo de tutoría que se ofrece, tiempo dedicado y medios y recursos disponibles.', 10, 1),
(367, '3.11.1', 'Documentos institucionales que contengan Políticas institucionales en materia de desarrollo integral del profesorado, que incluyan la capacitación y actualización en los aspectos académicos, profesionales y pedagógicos relacionados con la metodología del ', 11, 1),
(368, '3.11.2', 'Evidencias de Programas, estrategias y mecanismos institucionales para fomentar el desarrollo integral, la capacitación y actualización profesional, pedagógica y docente, de los profesores', 11, 1),
(369, '3.11.3', 'Porcentaje de profesores del programa que ha participado en los últimos cinco años en programas de desarrollo profesoral o que ha recibido apoyo a la capacitación y actualización permanente, como resultado de las políticas institucionales orientadas para ', 11, 1),
(370, '3.11.4', 'Apreciación de directivos y profesores del programa sobre el impacto que han tenido las acciones orientadas al desarrollo integral de los profesores, en el enriquecimiento de la calidad del programa.', 11, 1),
(371, '3.11.5', 'Evidencias de la realización de eventos académicos desarrollados por expertos en procesos pedagógicos, de acuerdo con el tipo de metodología del programa', 11, 1),
(372, '3.11.6', 'Numero de profesores que han sido reconocidos Institucionalmente por  procesos de creación artística y cultural', 11, 1),
(373, '3.11.7', 'Evidencias documentales  de procesos de actualización docente relacionados con la atención a la diversidad poblacional', 11, 1),
(374, '3.11.8', 'Existencia de políticas, estrategias y programas para el perfeccionamiento docente tanto en la disciplina como en los distintos aspectos relacionados con la modalidad de enseñanza en que se ofrece el programa.', 11, 1),
(375, '3.12.1', 'Documentos institucionales que contengan políticas de estímulos y reconocimiento a los profesores por el ejercicio calificado de la investigación, de la creación artística, de la docencia, de la extensión o proyección social y de la cooperación internacio', 12, 1),
(376, '3.12.2', 'Documentos Institucionales que contengan estrategias para la promoción  de creación artística y cultural, la innovación, la adaptación, la transferencia técnica y tecnológica, la creación de tecnofactos y prototipos, y la obtención de patentes, de acuerdo', 12, 1),
(377, '3.12.3', ' Porcentaje de los profesores del programa que, en los últimos cinco años, ha recibido reconocimientos y estímulos institucionales por el ejercicio calificado de la docencia, la investigación, la creación artística, la extensión o proyección social y la c', 12, 1),
(378, '3.12.4', 'Apreciación de directivos y profesores del programa sobre el impacto que, para el enriquecimiento de la calidad del programa, ha tenido el régimen de estímulos al profesorado por el ejercicio calificado de la docencia, la investigación, la creación artíst', 12, 1),
(379, '3.13.1', ' Porcentaje de los profesores del programa que, en los últimos cinco años, han elaborado materiales de apoyo docente, pertinentes a la naturaleza y metodología del programa y su función pedagógica', 13, 1),
(380, '3.13.2', 'Apreciación de los estudiantes del programa, sobre la calidad, pertinencia y eficacia de los materiales de apoyo producidos por los docentes del programa de acuerdo a su metodología.', 13, 1),
(381, '3.13.4', 'Premios u otros reconocimientos significativos en el ámbito nacional o internacional que hayan merecido los materiales de apoyo a la labor docente, producido por los profesores del programa.', 13, 1),
(382, '3.13.5', 'Documento que contenga  Régimen de propiedad intelectual en la institución.', 13, 1),
(383, '3.14.1', 'Documentos institucionales que contengan las políticas y reglamentaciones institucionales en materia de remuneración de los profesores, en atención a los méritos y producción académica debidamente evaluada.', 14, 1),
(384, '3.14.2', 'Documentos que evidencien la aplicación de esta política en los docentes del Programa.', 14, 1),
(385, '3.14.3', 'Nivel de correspondencia entre la remuneración que han de recibir los profesores, establecida en las normas legales e institucionales vigentes, y la que reciben por sus servicios al programa.', 14, 1),
(386, '3.14.4', 'Apreciación de los profesores del programa con respecto a la correspondencia entre la remuneración y los méritos académicos y profesionales del profesorado,', 14, 1),
(387, '3.15.1', 'Documentos institucionales que contengan las políticas en materia de evaluación integral al desempeño  del profesorado.', 15, 1),
(388, '3.15.2', 'Documentos que evidencien la aplicación de la  política de evaluación en los docentes del Programa.', 15, 1),
(389, '3.15.3', 'Evaluaciones realizadas a los profesores adscritos al programa durante los últimos cinco años y las acciones adelantadas por la Institución y por el programa a partir de dichos resultados', 15, 1),
(390, '3.15.4', 'Evaluaciones realizadas a los profesores adscritos al programa durante los últimos cinco años y las acciones adelantadas por la Institución y por el programa a partir de dichos resultados', 15, 1),
(391, '3.15.5', ' Apreciación de los profesores adscritos al programa, sobre los criterios y mecanismos para la evaluación de docentes, su transparencia, equidad y eficacia.', 15, 1),
(392, '4.16.1', ' Existencia de criterios y mecanismos para el seguimiento y evaluación del desarrollo de las competencias genéricas o transversales, específicas e institucionales y comunicativas propias del ejercicio y de la cultura de la profesión o la disciplina en la ', 16, 1),
(393, '4.16.2', 'Existencia de un sistema de créditos que responda a los lineamientos y al plan curricular establecido. ', 16, 1),
(394, '4.16.3', 'Porcentaje de los créditos académicos del programa asignado a asignaturas y a actividades orientadas a ampliar la formación del estudiante', 16, 1),
(395, '4.16.4', 'Porcentaje de actividades distintas a la docencia y la investigación dedicadas al desarrollo de habilidades para el análisis de las dimensiones ética, estética, filosófica, científica, económica, política y social de problemas ligados al programa, a las c', 16, 1),
(396, '4.16.5', 'Apreciación de directivos, profesores, y estudiantes, sobre la calidad e integralidad del currículo. ', 16, 1),
(397, '4.16.6', 'Estadísticas de las calificaciones promedio  de los estudiantes de las pruebas de estado  de educación superior, en los últimos cinco años con respecto al  promedio nacional. ', 16, 1),
(398, '4.16.7', 'Análisis comparativo por cohorte del promedio de los resultados obtenidos por lo estudiantes en las pruebas Saber Once y las pruebas de Estado Saber Pro. ', 16, 1),
(399, '4.16.8', 'Evidencias sobre Articulación del plan de estudios con los diversos niveles de formación (periodos académicos, especialización, maestría y doctorado, componentes propedéuticos y /o ciclos, entre otros.', 16, 1),
(400, '4.16.9', 'Número de cursos de segunda lengua ofrecidos, número de estudiantes matriculados, número de estudiantes aprobados.', 16, 1),
(401, '4.16.10', 'Grado de correspondencia entre competencias y actividades pedagógicas y didácticas – Modelo Pedagógico.', 16, 1),
(402, '4.16.11', 'Existencia de políticas, estrategias y acciones que promueven la formación integral del estudiante desde la modalidad en que se ofrece el programa.', 16, 1),
(403, '4.17.1', 'Existencia de documentos que evidencien la aplicación  de políticas institucionales de  flexibilidad curricular que optimice el transito del estudiante y  aseguren la continuidad, electividad y  movilidad en el programa y entre programas.\n\n', 17, 1),
(404, '4.17.2', 'Evidencia de lineamientos institucionales  en materia de movilidad  del estudiante en el sistema educativo que garanticen homologación de créditos y reconocimientos de experiencias educativas.', 17, 1),
(405, '4.17.3', 'Existencia de lineamientos  en el programa para las revisión y actualización del currículo.\n \n \n', 17, 1),
(406, '4.17.4', 'Existencia de revisiones curriculares a la luz de los desarrollos disciplinares profesionales y pedagógicos en  los últimos cinco años.', 17, 1),
(407, '4.17.5', 'Porcentaje de flexibilidad curricular que tiene el programa con relación al programa en otras instituciones educativas nacionales e internacionales.', 17, 1),
(408, '4.17.6', 'Grado de apreciación de directivos, profesores y estudiantes sobre la aplicación y eficacia de las políticas institucionales en materia de flexibilidad curricular.', 17, 1),
(409, '4.17.7', 'Número  de estudiantes en movilidad estudiantil con otras instituciones nacionales e internacionales en los últimos cinco años.', 17, 1),
(410, '4.17.8', 'Evidencia de lineamientos institucionales  sobre homologación de créditos y articulación  del pregrado al postgrado. ', 17, 1),
(411, '4.17.9', 'Evidencia de lineamientos institucionales  sobre homologación de créditos y articulación  del pregrado al postgrado. ', 17, 1),
(412, '4.17.10', 'Documento que evidencie  convenios activos  y relaciones de cooperación con instituciones de Educación media y superior establecidos por la institución que garanticen el transito y continuidad de estudiantes en el sistema educativo de los programas por ci', 17, 1),
(413, '4.17.11', 'Documento que evidencie  convenios activos  y relaciones de cooperación con instituciones establecidos por la institución que garanticen el transito y continuidad de estudiantes y su inserción  en el sistema productivo de acuerdo con el tipo y modalidad d', 17, 1),
(414, '4.17.12', 'Documentos donde se evidencie la participación de estudiantes en el diseño de su propio plan académico a partir de la oferta académica.', 17, 1),
(415, '4.17.13', 'Apreciación de estudiantes en la participación en el diseño  y evaluación  de su propio plan académico a partir de la oferta académica de acuerdo con sus intereses y la adquisición de competencias.', 17, 1),
(416, '4.17.14', ' Evidencias de prácticas en instituciones del sector público o privado en que se  articulen y afirmen el carácter secuencial y complementario de los ciclos de acuerdo con el tipo y modalidad del programa.', 17, 1),
(417, '4.17.15', 'Evidencia de la aplicación de distintas estrategias de enseñanza-aprendizaje .en las asignaturas del programa.', 17, 1),
(418, '4.17.16', 'Porcentaje de Créditos académicos asignados a las diversas opciones formativas electivas y libres que asigna el Programa a los cursos en la modalidad de educación en que se ofrece el programa.', 17, 1),
(419, '4.17.17', 'Información verificable sobre las estrategias pedagógicas que facilitan diversos estilos y ritmos de aprendizaje y de administración del tiempo por los estudiantes que participan en el programa.', 17, 1),
(420, '4.18.1', 'Existencia de criterios y políticas institucionales que garantizan la participación de distintas unidades académicas y de los docentes de las mismas, en la solución de problemas pertinentes al programa. ', 18, 1),
(421, '4.18.2', 'Apreciación de profesores y estudiantes del programa sobre la pertinencia y eficacia de la interdisciplinariedad del programa en el enriquecimiento de la calidad del mismo.', 18, 1),
(422, '4.18.3', 'Existencia de espacios y actividades curriculares con carácter explícitamente interdisciplinario. ', 18, 1),
(423, '4.18.4', 'Información verificable sobre la Interacción de alumnos y profesores con pares en Redes de Aprendizaje y Comunidades Virtuales. (programas a distancia)', 18, 1),
(424, '4.19.1', 'Evidencia de la existencia de concordancia y correspondencia de los métodos de enseñanza y aprendizaje utilizados con las competencias, objetivos y contenidos del plan de estudios y el tipo y metodología y modalidad  del programa .Proyectos docentes, cons', 19, 1),
(425, '4.19.2', 'Apreciación de los estudiantes, profesores y directivos del programa sobre la correspondencia entre los métodos de enseñanza y aprendizaje que se emplean en el programa y el desarrollo de los contenidos del plan de estudios.', 19, 1),
(426, '4.19.3', 'Evidencia de registros de asesorías y acompañamiento del docente a  los trabajos realizados por los estudiantes acordes con  el tipo y metodología del programa.  ', 19, 1),
(427, '4.19.4', 'Evidencia de acciones  que  demuestren  la incorporación de los avances en las ciencias, las técnicas y las tecnologías implicadas  de acuerdo con el tipo  de disciplina y modalidad del programa.', 19, 1),
(428, '4.19.5', 'Existencia de documento institucional que exprese las diferentes estrategias pedagógicas, didácticas y comunicativas acordes con la metodología y las posibilidades tecnológicas utilizados por los estudiantes en atención  a su diversidad.', 19, 1),
(429, '4.19.6', 'Grado de correlación entre  las estrategias pedagógicas propias de la metodología de enseñanza y los recursos tecnológicos utilizados.', 19, 1),
(430, '4.19.7', 'Documento que evidencie la integración   docencia, investigación, y proyección social del programa.', 19, 1),
(431, '4.19.8', 'Evidencia de estrategias implementadas por el programa   que garanticen el éxito académico de los estudiantes en el tiempo previsto para el desarrollo del plan de estudios.', 19, 1),
(432, '4.19.9', 'Registros estadísticos sobre población de estudiantes por semestre en los últimos 5 cinco cohortes.', 19, 1),
(433, '4.19.10', 'Apreciación de profesores y estudiantes sobre la correspondencia y exigencias académicas  de permanencia y graduación en el programa y la naturaleza del mismo.', 19, 1),
(434, '4.19.11', 'Evidencia  de seguimiento y acompañamiento  especial a estudiantes en condición de vulnerabilidad y discapacidad, entre otros.', 19, 1),
(435, '4.19.12', 'Verificación de la correspondencia entre el desarrollo de los contenidos del plan de estudios y las metodologías de enseñanza propuestas para la modalidad de enseñanza en que se ofrece el programa.', 19, 1),
(436, '4.19.13', 'Información verificable sobre las estrategias pedagógicas orientadas a fortalecer procesos de aprendizaje abierto, flexible y autónomo.', 19, 1),
(437, '4.19.14', 'Información verificable de la articulación entre las estrategias pedagógicas propias de la modalidad de enseñanza y los recursos tecnológicos utilizados.', 19, 1),
(438, '4.19.15', 'Relación de estudiantes que evidencian el éxito de las metodologías usadas en la modalidad en que se ofrece el programa.', 19, 1),
(439, '4.19.16', 'Apreciación de los directivos, profesores y estudiantes sobre la incidencia de las metodologías de enseñanza que se emplean en el programa, en la calidad de los procesos de aprendizaje. (distancia)', 19, 1),
(440, '4.20.1', 'Existencia de criterios, políticas y reglamentaciones institucionales y del programa en materia de evaluación académica de los estudiantes y divulgación de la misma.', 20, 1),
(441, '4.20.2', 'Correspondencia entre las formas de evaluación de los aprendizajes, los propósitos de formación y los perfiles de egreso definidos por el programa.', 20, 1),
(442, '4.20.3', 'Apreciación de directivos, profesores y estudiantes del programa sobre la correspondencia entre las formas de evaluación académica de los estudiantes, y la naturaleza del programa y los métodos pedagógicos empleados para el desarrollo. ', 20, 1),
(443, '4.20.4', 'Apreciación de los estudiantes acerca de la transparencia y equidad con que se aplica el sistema de evaluación académica.', 20, 1),
(444, '4.20.5', 'Existencia de criterios y procedimientos para la revisión y evaluación de los sistemas de evaluación académica de los estudiantes.', 20, 1),
(445, '4.21.1', 'Documento que evidencie el  grado de correspondencia entre el tipo de trabajos y actividades realizadas por los estudiantes respecto a los objetivos del programa.', 21, 1),
(446, '4.21.2', 'Existencia de documento que evidencie el seguimiento de la labor académica de los estudiantes y su relación con el sistema de créditos', 21, 1),
(447, '4.21.3', 'Apreciación de directivos y profesores  sobre la calidad de trabajos realizados por los estudiantes y los propósitos de formación.', 21, 1),
(448, '4.21.4', 'Grado de correspondencia entre las actividades y trabajos realizados por los estudiantes y las formas de evaluación por competencias según la naturaleza del programa y los métodos pedagógicos empleados para desarrollar los diversos procesos de formación.', 21, 1),
(449, '4.21.5', 'Número y título de trabajos realizados por estudiantes del programa en los últimos cinco años que han merecido premios o reconocimientos significativos de parte de la comunidad académica nacional o internacional.', 21, 1),
(450, '4.21.6', 'Información verificable sobre la existencia de estrategias de seguimiento del trabajo personal y colectivo realizado por los estudiantes del programa para potenciar, a través de la asesoría, su aprendizaje, el logro de los objetivos y el desarrollo de las', 21, 1),
(451, '4.22.1', 'Documentos institucionales que expresen las políticas en materia de evaluación y autorregulación. ', 22, 1),
(452, '4.22.2', 'Existencia de mecanismos para el seguimiento, evaluación y mejoramiento continuo de los procesos y logros del programa, y la evaluación de su pertinencia para la sociedad, con participación activa de profesores, directivos estudiantes y egresados del prog', 22, 1),
(453, '4.22.3', 'Número y tipo de actividades desarrolladas por el programa para que profesores, estudiantes y egresados participen en la definición de políticas en materia de docencia, investigación, extensión o proyección social y cooperación internacional, y en las dec', 22, 1),
(454, '4.22.4', 'Apreciación de directivos, profesores, estudiantes, egresados del programa, y de empleadores, sobre la incidencia de los sistemas de evaluación y autorregulación del programa en el enriquecimiento de la calidad de éste.', 22, 1),
(455, '4.22.5', 'Información sobre cambios específicos realizados en el programa, en los últimos cinco años, a partir de los resultados de los procesos de evaluación y autorregulación del programa.', 22, 1),
(456, '4.23.1', 'Existencia de políticas y criterios institucionales y del programa de extensión o proyección social.', 23, 1),
(457, '4.23.2', 'Evidencia de aplicación de  los procesos de extensión o proyección social  por los programas.', 23, 1),
(458, '4.23.3', 'Número y tipo de proyectos y actividades de extensión o proyección social a la comunidad que ha desarrollado el programa en los últimos cinco años.', 23, 1),
(459, '4.23.4', 'Información del impacto que han tenido en el entorno los resultados de los proyectos de extensión o proyección social desarrollados por el programa en los últimode s cinco años.', 23, 1),
(460, '4.23.5', 'Evidencia de la participación de directivos y profesores del programa en la aplicación de  políticas nacionales en proyectos de innovación social, económica, técnica y tecnología de acuerdo con el programa.', 23, 1),
(461, '4.23.6', 'Apreciación sobre el impacto social de los proyectos desarrollados por el programa  por parte de agentes externos.', 23, 1),
(462, '4.23.7', 'Número y tipo de reconocimientos hechos en los últimos cinco años por entidades gubernamentales y no gubernamentales al impacto que el programa ha ejercido en los medios local, regional, nacional o internacional.', 23, 1),
(463, '4.23.8', 'Evidencia  de  las acciones desarrolladas por el programa que refleje su incidencia sobre el medio ', 23, 1),
(464, '4.23.9', 'Documentos que evidencien las asistencias técnicas, tecnológicas, servicios, asesorías  a empresarios, funcionarios públicos, líderes comunitarios, y de otros agentes externos. ', 23, 1),
(465, '4.24.1', 'Existencia de criterios y políticas institucionales y del programa en materia de adquisición y actualización de material bibliográfico.', 24, 1),
(466, '4.24.2', 'Grado de correspondencia entre la naturaleza y objetivos del programa, y la pertinencia, actualización y suficiencia del material bibliográfico con que cuenta el programa para apoyar el desarrollo de las distintas actividades académicas. ', 24, 1),
(467, '4.24.3', ' Apreciación de directivos, profesores y estudiantes del programa sobre la pertinencia, actualización y suficiencia del material bibliográfico con que cuenta el programa.', 24, 1),
(468, '4.24.4', 'Porcentaje de incremento anual en las adquisiciones de libros, revistas especializadas, bases de datos y suscripciones a publicaciones periódicas, relacionados con el programa académico, en los últimos 5 años. ', 24, 1),
(469, '4.24.5', 'Porcentaje de profesores y estudiantes del programa que utiliza semestralmente recursos bibliográficos disponibles en el programa.', 24, 1),
(470, '4.24.6', 'Relación entre el número de volúmenes disponibles en la Biblioteca y el número de estudiantes del programa.', 24, 1),
(471, '4.24.7', 'Número y porcentaje de utilización de revistas especializadas y bases de datos disponibles en la Biblioteca, en los últimos cinco años. ', 24, 1),
(472, '4.24.8', 'Establecimiento de convenios y alianzas con municipios, Ongs, hemerotecas, bibliotecas y laboratorios a los cuales puedan ingresar los estudiantes de programas en la modalidad en que se ofrece el evaluado, cuando están ubicados en sitios distintos a las s', 24, 1),
(473, '4.24.9', 'Acceso a material bibliográfico en bibliotecas virtuales y convenios con instituciones o entidades que ofrezcan este servicio.', 24, 1),
(474, '4.25.1', 'Apreciación  de estudiantes, docentes y administrativo sobre la existencia de una  plataforma tecnológica garantice la conectividad, interactividad y acceso a sistemas de información, apoyos y recursos para el aprendizaje, de acuerdo con el tipo y modalid', 25, 1),
(475, '4.25.2', ' Evidencia de estrategias y mecanismos del uso de recursos informáticos y de comunicación, por parte de profesores y estudiantes.', 25, 1),
(476, '4.25.3', 'Apreciación de la disponibilidad, actualización y calidad de los recursos informáticos y de comunicación con que cuenta el programa por parte de los directivos, profesores, administrativos y estudiantes del programa.', 25, 1),
(477, '4.25.4', 'Evidencias de registros de los equipos en relación a rendimiento,capacidad de almacenamiento y la seguridad en el manejo de la información.', 25, 1),
(478, '4.25.5', 'Evidencia de actualización Y soporte técnico de la plataforma informática y los equipos computacionales en los últimos cinco años.', 25, 1),
(479, '4.25.6', 'Apreciación de directivos, profesores estudiantes del programa sobre la pertinencia, correspondencia y suficiencia de los recursos informáticos con que cuenta el programa.', 25, 1),
(480, '4.25.7', 'Para el caso específico de programas a distancia y virtuales: - Existencia de una plataforma tecnológica que garantice la conectividad, interactividad y acceso a sistemas de información, apoyos y recursos', 25, 1),
(481, '4.26.1', ' Grado de correspondencia entre el número de estudiantes del programa y la capacidad de rotación en los laboratorios, talleres, salas de audiovisuales y campos de práctica, entre otros. ', 26, 1),
(482, '4.26.2', 'Grado de correspondencia entre el número de estudiantes y el número de puestos de trabajo en laboratorios y talleres dotados con los equipos y materiales propios de las exigencias del programa. ', 26, 1),
(483, '4.26.3', 'Información, en el caso de programas del área de Ciencias de la Salud, sobre la existencia de convenios docente-asistenciales certificados por el Ministerio de Protección Social.', 26, 1),
(484, '4.26.4', 'Apreciación de profesores y estudiantes del programa sobre la dotación y utilización de laboratorios, talleres, ayudas audiovisuales, campos de práctica y medios de transporte.', 26, 1),
(485, '4.26.5', ' Para el caso específico de programas a distancia y virtuales: - Existencia de una plataforma tecnológica que garantice la conectividad, interactividad y acceso a sistemas de información, apoyos y recursos.', 26, 1),
(486, '4.26.6', 'Existencia de una plataforma que garantiza el uso y aprovechamiento administrativo de resultados de aprendizajes por parte del profesorado y de la administración.', 26, 1),
(487, '4.26.7', 'Existencia de dependencias que presten apoyo técnico oportuno a los usuarios.', 26, 1),
(488, '5.27.1', 'Documentos que contengan las políticas institucionales en materia de referentes académicos externos, nacionales e internacionales para la revisión y actualización de planes de estudio.', 27, 1),
(489, '5.27.2', 'Evidencias de la  utilización de referentes externos nacionales e internacionales para revisión y actualización de planes de estudio. ', 27, 1),
(490, '5.27.3', 'Documentos que evidencien estudios comparativos de programas de alta calidad, de la misma naturaleza, metodología, contenidos curriculares y modalidad en el contexto nacional e internacional.', 27, 1),
(491, '5.27.4', 'Número de convenios activos de cooperación académica desarrollada por el programa con instituciones y programas de alta calidad acreditados por entidades de reconocida legitimidad nacional e internacional.', 27, 1),
(492, '5.27.5', 'Evidencias de actividades de cooperación académicas  desarrolladas en el marco de los convenios suscritos por los programas.', 27, 1),
(493, '5.27.6', ' Número de proyectos de investigación desarrollados como producto de la cooperación académica y profesional, realizada por directivos, profesores y estudiantes del programa, con miembros de comunidades nacionales e internacionales de reconocido liderazgo ', 27, 1),
(494, '5.27.7', 'Número de proyectos de innovación desarrollados como producto de la cooperación académica y profesional realizada por directivos, profesores y estudiantes del programa, con miembros de comunidades nacionales e internacionales de reconocido liderazgo en el', 27, 1),
(495, '5.27.8', 'Número de proyectos de creación artística y cultural desarrollados como producto de la cooperación académica y profesional, realizada por directivos, profesores y estudiantes del programa, con miembros de comunidades nacionales e internacionales de recono', 27, 1),
(496, '5.27.9', ' Número de proyectos de extensión/proyección social desarrollados como producto de la cooperación académica y profesional, realizada por directivos, profesores y estudiantes del programa, con miembros de comunidades nacionales e internacionales de reconoc', 27, 1),
(497, '5.27.10', 'Número de profesores, estudiantes y directivos del programa con participación activa en redes u organismos nacionales e internacionales de la que se hayan derivado productos concretos como publicaciones en coautoría, cofinanciación de proyectos, registros', 27, 1),
(498, '5.27.11', 'Valor de la inversión efectivamente realizada por la universidad para los fines de internacionalización en los últimos cinco años.', 27, 1),
(499, '5.27.12', 'Número de proyectos, actividades, intercambios, producto de la interacción con comunidades académicas nacionales e internacionales.', 27, 1),
(500, '5.27.13', 'Documento que exprese el impacto social verificable de proyectos producto de la interacción con comunidades académicas nacionales e internacionales.', 27, 1),
(501, '5.28.1', 'Número de convenios activos de intercambio con universidades nacionales y extranjeras. ', 28, 1),
(502, '5.28.2', 'Número de estudiantes extranjeros en el programa en los últimos 5 años.', 28, 1),
(503, '5.28.3', 'Número de asignaturas o cursos homologados en otros programas nacionales o extranjeros.', 28, 1),
(504, '5.28.4', 'Número de profesores o expertos visitantes nacionales y extranjeros que ha recibido el programa en los últimos cinco años (objetivos, duración y resultados de su estadía).', 28, 1),
(505, '5.28.5', 'Número de profesores y estudiantes adscritos al programa que en los últimos cinco años que han participado en actividades de cooperación académica y profesional con programas nacionales e internacionales de reconocido liderazgo en el área (semestre académ', 28, 1),
(506, '5.28.6', 'Documentos que evidencien la participación de profesores y estudiantes adscritos al programa en actividades de cooperación académica.', 28, 1),
(507, '5.28.7', 'Número de profesores del programa que participan activamente en redes académicas, científicas, técnicas y tecnológicas, económicas, a nivel nacional e internacional, de acuerdo con el tipo y modalidad del programa.', 28, 1),
(508, '5.28.8', 'Valor de la inversión efectiva  desarrollada para proyectos de movilidad de estudiantes  en doble vía en los últimos cinco años.', 28, 1),
(509, '5.28.9', 'Valor de la inversión efectiva desarrollada para proyectos de movilidad de profesores  en doble vía en los últimos cinco años.', 28, 1),
(510, '6.29.1', 'Documento que evidencie los criterios, estrategias y actividades del programa, orientados a promover la capacidad de indagación y búsqueda, y la formación de un espíritu investigativo, creativo e innovador en los estudiantes.', 29, 1),
(511, '6.29.2', 'Número de actividades utilizadas como mecanismos por parte de los profesores adscritos al programa para incentivar en los estudiantes la generación de ideas y problemas de investigación, la identificación de problemas en el ámbito empresarial susceptibles', 29, 1),
(512, '6.29.3', 'Número de estudiantes que están vinculados como monitores, auxiliares de investigación e integrantes de semilleros y/o grupos de investigación. ', 29, 1),
(513, '6.29.4', 'Número de grupos de investigación del programa en los que participan estudiantes, de acuerdo con su tipo y modalidad', 29, 1),
(514, '6.29.5', 'Número de semilleros de investigación del programa en los que participan estudiantes, de acuerdo con su tipo y modalidad', 29, 1),
(515, '6.29.6', 'Numero de actividades académicas –cursos electivos, seminarios, pasantías, eventos– derivados de líneas de investigación en los últimos cinco años. ', 29, 1),
(516, '6.29.7', 'Número de actividades académicas –pasantías, talleres, actividades conjuntas- relacionadas con la realidad empresarial, organizadas desde los primeros semestres con una lógica enfocada en el entendimiento creciente de aquella según sus mayores grados de c', 29, 1),
(517, '6.29.8', 'Documento donde se evidencia dentro del plan de estudios los espacios académicos y de vinculación con el sector productivo  y donde se analiza la naturaleza de la investigación científica, técnica y tecnológica, la innovación, sus objetos de indagación, s', 29, 1),
(518, '6.29.9', 'Número de estudiantes que participan en los programas institucionales de jóvenes investigadores. ', 29, 1),
(519, '6.29.10', 'Número de estudiantes que en sus prácticas empresariales participan en temas de investigación y desarrollo, ingeniería y experimentación en Colombia y en el Exterior. ', 29, 1),
(520, '6.29.11', 'Número de estudiantes que participación en proyectos Universidad -Empresa -Estado que adelante la Institución.', 29, 1),
(521, '6.29.12', 'Número de estudiantes que participan en proyectos Universidad- Empresa- Estado que adelante la Institución', 29, 1),
(522, '6.29.13', 'Actividades académicas dentro del programa en las que se analizan las diferentes tendencias internacionales de la investigación en sentido estricto pertinentes al objeto de la disciplina o profesión y que sean coherentes con la modalidad en que se ofrece ', 29, 1),
(523, '6.30.1', 'Documento que evidencie los criterios, estrategias y políticas institucionales en materia de investigación, innovación y creación artística y cultural, así como mecanismos efectivos que estimulen el desarrollo de los procesos investigativos, de innovación', 30, 1),
(524, '6.30.2', 'Documento que evidencie la correspondencia entre el número y nivel de formación de los profesores adscritos al programa con la actividad investigativa y de innovación y la creación artística y cultural, relacionadas con la naturaleza del programa.', 30, 1),
(525, '6.30.3', 'Número de Recursos humanos y logísticos  con que cuenta el programa, asociados a proyectos y a otras actividades de investigación, innovación y creación artística y cultural.', 30, 1),
(526, '6.30.4', 'Recursos financieros con que cuenta la institución, asociados a proyectos y a otras actividades de investigación, innovación y creación artística y cultural. ', 30, 1),
(527, '6.30.5', 'Número de grupos de investigación conformados por profesores y estudiantes adscritos al programa, reconocidos por COLCIENCIAS o por otro organismo. ', 30, 1),
(528, '6.30.6', 'Documento que evidencie el impacto a nivel regional, nacional e internacional de la investigación, la innovación y la creación artística y cultural del programa, de acuerdo con su naturaleza. ', 30, 1),
(529, '6.30.7', 'Número de publicaciones en revistas indexadas y especializadas nacionales e internacionales, innovaciones, patentes, productos o procesos técnicos y tecnológicos patentables o no patentables o protegidas por secreto industrial, libros, capítulos de libros', 30, 1),
(530, '6.30.8', 'Número de reconocimientos en libros de arte y revistas especializadas, la presentación, exposición o ejecución en instituciones de reconocido prestigio.', 30, 1),
(531, '6.30.9', 'Número participaciones en eventos organizados por comunidades artísticas y académicas.', 30, 1),
(532, '6.30.10', 'Número de publicaciones por editoriales reconocidas en el ámbito literario e incluidas en antologías, entre otras.', 30, 1),
(533, '6.30.11', 'Número de actividades administrativas para el desarrollo y gestión de la investigación, gestión del conocimiento (vigilancia tecnológica), la creación de empresas y de planes de negocios (como los centros de incubación y financiación empresarial, oficinas', 30, 1),
(534, '6.30.12', 'Recursos financieros para el desarrollo y gestión de la investigación, gestión del conocimiento (vigilancia tecnológica), la creación de empresas y de planes de negocios (como los centros de incubación y financiación empresarial, oficinas de transferencia', 30, 1),
(535, '7.31.1', 'Número y tipo de programas, servicios y actividades de bienestar dirigidos a los profesores, estudiantes y personal administrativo del programa.', 31, 1),
(536, '7.31.2', 'Porcentaje de directivos, profesores, estudiantes y personal administrativo del programa que conoce los programas, servicios y actividades de bienestar institucional', 31, 1),
(537, '7.31.3', 'Apreciación de directivos, profesores, estudiantes y personal administrativo del programa sobre los servicios y actividades de bienestar y sobre la contribución que las políticas sobre bienestar y dichos servicios han hecho a su desarrollo personal', 31, 1),
(538, '7.31.4', 'Apreciación de directivos, profesores y estudiantes del programa sobre la pertinencia y contribución que las políticas institucionales y los servicios en materia de bienestar han hecho a la calidad de las funciones de docencia, investigación y extensión o', 31, 1),
(539, '7.31.5', 'Existencia de Políticas y estrategias que favorezcan el desarrollo humano y promueva una cultura que reconozca el valor de la diversidad .', 31, 1),
(540, '7.31.6', 'Cantidad de Programas y estrategias de seguimiento integral a la comunidad institucional y acciones derivadas que conduzcan al desarrollo humano y el respeto a la diferencia', 31, 1),
(541, '7.31.7', 'Existencia de informes o resultados de investigación donde se identifique la problemática social del entorno que incide en la comunidad institucional.', 31, 1),
(542, '7.31.8', 'Existencia de aplicación de estrategias, y evidencias relacionadas con la implementación de programas, servicios y actividades relacionados con los resultados de investigación de la problemática social del entorno que incide en la comunidad institucional.', 31, 1),
(543, '7.31.9', 'Apreciación de directivos, docentes y estudiantes sobre las condiciones de bienestar de los escenarios de prácticas, en los programas donde sea pertinente. ', 31, 1),
(544, '7.31.10', 'Existencia de estrategias y apoyos socioeconómicos dirigidos a los estudiantes que permitan su desarrollo personal y académico', 31, 1),
(545, '7.31.11', 'Número de estudiantes que han sido beneficiados con estrategias y otros apoyos socioeconómicos que permitan su desarrollo personal y académico', 31, 1),
(546, '7.31.12', 'Apreciación y conocimiento de los estudiantes del programa sobre las estrategias y otros apoyos socioeconómicos que permitan su desarrollo personal y académico', 31, 1),
(547, '7.31.13', 'Información verificable de las estrategias de seguimiento y acompañamiento permanente a estudiantes de la modalidad de educación en que se ofrece el programa evaluado, que incluyan convenios interinstitucionales que garantizan el apoyo en sus lugares de r', 31, 1),
(548, '7.31.14', ' Apreciación de directivos, profesores y estudiantes del programa sobre la pertinencia que tienen las políticas institucionales y los servicios en materia de bienestar, en relación con la modalidad en que se ofrece el programa.', 31, 1),
(549, '7.32.1', 'Informes Estadísticos sobre la población de estudiantes del programa desde el primero hasta el último semestre, en las últimas cinco cohortes', 32, 1),
(550, '7.32.2', 'Nivel de correlación existente entre la duración prevista para el programa, de acuerdo con su modalidad o metodología y plan de estudios, y la que realmente tiene lugar.', 32, 1),
(551, '7.32.3', 'Tasas de deserción estudiantil acumulada y por períodos académicos.', 32, 1),
(552, '7.32.4', 'Existencia de estudios realizados por la institución y el programa para identificar y evaluar las causas de la deserción estudiantil.', 32, 1),
(553, '7.32.5', ' Existencia de proyectos que establezcan estrategias pedagógicas y actividades extracurriculares orientadas a optimizar las tasas de retención y de graduación de estudiantes, manteniendo la calidad académica del programa.', 32, 1);
INSERT INTO `indicador` (`id`, `codigo`, `nombre`, `caracteristica_id`, `modelo_id`) VALUES
(554, '7.32.6', 'Número de Estudiantes que se han beneficiado con las estrategias pedagógicas y actividades extracurriculares orientadas a optimizar las tasas de retención y de graduación de estudiantes, manteniendo la calidad académica del programa', 32, 1),
(555, '7.32.7', 'Informe donde se presente la caracterización de los estudiantes y se identifiquen variables de vulnerabilidad', 32, 1),
(556, '8.33.1', 'Grado de correspondencia entre la organización, administración y gestión del programa, y los fines de la docencia, la investigación, la extensión o proyección social y la cooperación nacional e internacional en el programa.', 33, 1),
(557, '8.33.2', 'Apreciación de directivos, profesores, estudiantes y personal administrativo del programa sobre la coherencia entre la organización, administración y gestión del programa, y los fines de la docencia, la investigación, la extensión o proyección social y la', 33, 1),
(558, '8.33.3', 'Estadísticas de formación y experiencia de quienes orientan la administración del programa.', 33, 1),
(559, '8.33.4', 'Apreciación del personal administrativo del programa sobre la claridad de las funciones desarrolladas y las funciones del cargo', 33, 1),
(560, '8.33.5', 'Apreciación de profesores y estudiantes del programa sobre la eficiencia y eficacia de los procesos administrativos en el programa', 33, 1),
(561, '8.33.6', 'Número y dedicación de personal académico administrativo para cubrir las necesidades de gestión del programa.', 33, 1),
(562, '8.34.1', 'Existencia y utilización de sistemas y mecanismos eficaces que faciliten la comunicación y registro de información al interior del programa.', 34, 1),
(563, '8.34.2', 'Frecuencia de actualización de los sistemas de información y comunicación de la institución.', 34, 1),
(564, '8.34.3', 'Apreciación directivos, profesores, estudiantes y personal administrativo sobre la eficacia de los sistemas de información y de los mecanismos de comunicación.', 34, 1),
(565, '8.35.1', 'Apreciación de profesores, estudiantes y personal administrativo del programa sobre la orientación académica que imparten los directivos del programa y sobre el liderazgo que ejercen.', 35, 1),
(566, '8.35.2', 'Documentos institucionales que definan lineamientos y políticas que orienten la gestión del programa.', 35, 1),
(567, '8.35.3', 'Porcentaje de directivos, profesores y personal administrativo del programa que conoce las políticas que orientan la gestión del programa.', 35, 1),
(568, '9.36.1', 'Existencia de registros  actualizados sobre ocupación y ubicación profesional de los egresados del programa.', 36, 1),
(569, '9.36.2', 'Grado de correlación existente entre la ocupación y ubicación profesional de los egresados y el perfil de formación del programa', 36, 1),
(570, '9.36.3', 'Apreciación de los egresados, empleadores y usuarios externos sobre la calidad de la formación recibida en el programa.', 36, 1),
(571, '9.36.4', 'Apreciación de los egresados acerca de la forma como el programa favorece el desarrollo del proyecto de vida. ', 36, 1),
(572, '9.36.5', 'Estudios de pertinencia del programa que involucren datos e información del observatorio laboral', 36, 1),
(573, '9.36.6', 'Evidencia de la aplicación de estrategias que permitan la participación de los egresados en la evaluación y actualización del currículo. ', 36, 1),
(574, '9.36.7', 'Existencia de estrategias que favorezcan el ingreso del estudiante al mercado laboral. ', 36, 1),
(575, '9.36.8', 'Información verificable sobre oferta de programas nuevos de educación continua en la modalidad a distancia o virtual, fruto de la vinculación de los egresados a la universidad.', 36, 1),
(576, '9.37.1', 'Documentos que evidencien el Índice de empleo de los egresados del programa, en los últimos 5 años.', 37, 1),
(577, '9.37.2', 'Número de egresados del programa que forma parte de comunidades académicas reconocidas, de asociaciones científicas, profesionales, tecnológicas, técnicas o artísticas, y del sector productivo y financiero, en el ámbito nacional o internacional', 37, 1),
(578, '9.37.3', 'Número de egresados del programa que han recibido distinciones y reconocimientos significativos por su desempeño en la disciplina, profesión, ocupación u oficio correspondiente', 37, 1),
(579, '9.37.4', 'Apreciación de empleadores sobre la calidad de la formación y el desempeño de los egresados del programa.', 37, 1),
(580, '10.38.1', 'Documentos que expresen las políticas institucionales en materia de uso y control de la planta física, en relación con las necesidades del programa. ', 38, 1),
(581, '10.38.2', 'Apreciación de directivos, profesores, estudiantes y personal administrativo del programa sobre las características de la planta física desde el punto de vista de su accesibilidad, diseño, capacidad, iluminación, ventilación y condiciones de seguridad e h', 38, 1),
(582, '10.38.3', 'Existencia de informes y estadísticas de aulas, laboratorios, talleres, sitios de estudio para los alumnos, salas de cómputo, oficinas de profesores, sitios para la investigación, auditorios y salas de conferencias, oficinas administrativas cafeterías, ba', 38, 1),
(583, '10.38.4', 'Apreciación de directivos, profesores, estudiantes y personal administrativo del programa sobre número, tamaño, capacidad, iluminación, ventilación y dotación de bibliotecas, salas de lectura grupal e individual, y espacios para consulta.', 38, 1),
(584, '10.38.5', 'Existencia de planes y proyectos en ejecución para la conservación, expansión, mejoras y el mantenimiento de la planta física para el programa, de acuerdo con las normas técnicas respectivas.', 38, 1),
(585, '10.38.6', ' Relación entre las áreas disponibles en aulas y laboratorios y el número de estudiantes del programa. ', 38, 1),
(586, '10.39.1', 'Existencia de documentos sobre origen, monto y distribución de los recursos presupuestales destinados al programa.', 39, 1),
(587, '10.39.2', 'Existencia de documentos sobre la distribución porcentual en la asignación presupuestal para actividades de docencia, investigación, creación artística y cultural, proyección social, bienestar institucional e internacionalización del programa. ', 39, 1),
(588, '10.39.3', 'Porcentaje de los ingresos que se dedican a la inversión en el programa.', 39, 1),
(589, '10.39.4', 'Apreciación de directivos y profesores del programa sobre los recursos presupuestales de que se dispone en el mismo.', 39, 1),
(590, '10.39.5', 'Existencia de mecanismos de seguimiento y verificación a la ejecución presupuestal del programa con base en planes de mejoramiento y mantenimiento.', 39, 1),
(591, '10.39.6', 'Documentos que expresen la asignación presupuestal que financien los planes de mejoramiento del programa.', 39, 1),
(592, '10.39.7', 'Existencia de informes de Investigación, asesorías, consultorías u otras actividades académicas desarrolladas por el programa como apoyo a sus funciones misionales.', 39, 1),
(593, '10.40.1', 'Existencia de documentos en los que se evidencie la planeación y la ejecución de planes en materia de manejo de los recursos físicos y financieros, en concordancia con el tamaño y la complejidad de la institución y del programa.', 40, 1),
(594, '10.40.2', 'Existencia de criterios y mecanismos para la elaboración, ejecución y seguimiento del presupuesto y para la asignación de recursos físicos y financieros para el programa.', 40, 1),
(595, '10.40.3', ' Apreciación de directivos y profesores del programa sobre la equidad en la asignación de recursos físicos y financieros para el programa.', 40, 1),
(596, '10.40.4', 'Documentos que evidencien los controles legales y administrativos para asegurar el manejo transparente de los recursos.', 40, 1),
(597, '10.40.5', 'Documentos que evidencien las dinámicas de administración compartida entre las Institución de Educación Superior y el Hospital Universitario o la IPS, en cuanto a convenios docentes-asistenciales y escenarios de prácticas.', 40, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `instrumento`
--

CREATE TABLE IF NOT EXISTS `instrumento` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `descripcion` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `modelo`
--

INSERT INTO `modelo` (`id`, `nombre`, `descripcion`, `fechaactualizacion`, `fechacreacion`, `observaciones`) VALUES
(1, 'Modelo de Autoevaluacion de programas', 'Modelo de Autoevaluacion de programas de pregrado de la Universidad de Cartagena', NULL, '2013-05-15', NULL);

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
  `muestrapersona_id` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_muestraadministrativo_muestrapersona1_idx` (`muestrapersona_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `muestraagencia`
--

CREATE TABLE IF NOT EXISTS `muestraagencia` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(45) DEFAULT NULL,
  `muestrapersona_id` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_muestraagencia_muestrapersona1_idx` (`muestrapersona_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `muestradirector`
--

CREATE TABLE IF NOT EXISTS `muestradirector` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `muestrapersona_id` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_muestradirector_muestrapersona1_idx` (`muestrapersona_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `muestradocente`
--

CREATE TABLE IF NOT EXISTS `muestradocente` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` varchar(45) DEFAULT NULL,
  `muestrapersona_id` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_muestradocente_muestrapersona1_idx` (`muestrapersona_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `muestraegresado`
--

CREATE TABLE IF NOT EXISTS `muestraegresado` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `muestrapersona_id` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_muestraegresado_muestrapersona1_idx` (`muestrapersona_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `muestraempleador`
--

CREATE TABLE IF NOT EXISTS `muestraempleador` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `empresa` varchar(255) NOT NULL,
  `cargo` varchar(255) DEFAULT NULL,
  `muestrapersona_id` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_muestraempleador_muestrapersona1_idx` (`muestrapersona_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `muestraestudiante`
--

CREATE TABLE IF NOT EXISTS `muestraestudiante` (
  `id` varchar(25) NOT NULL,
  `semestre` varchar(45) NOT NULL,
  `periodo` varchar(45) NOT NULL,
  `anio` varchar(45) NOT NULL,
  `muestrapersona_id` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_muestraestudiante_muestrapersona1_idx` (`muestrapersona_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `muestrapersona`
--

CREATE TABLE IF NOT EXISTS `muestrapersona` (
  `id` varchar(45) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `apellido` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `mail` varchar(45) NOT NULL,
  `muestra_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_muestrapersona_muestra1_idx` (`muestra_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  `indicador_id` int(11) NOT NULL,
  `modelo_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_pregunta_indicador1_idx` (`indicador_id`),
  KEY `fk_pregunta_modelo1` (`modelo_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=93 ;

--
-- Volcado de datos para la tabla `pregunta`
--

INSERT INTO `pregunta` (`id`, `codigo`, `pregunta`, `tipo`, `indicador_id`, `modelo_id`) VALUES
(1, '1.1.2.1', 'El programa posee y utiliza medios para difundir la Misión y Visión institucional.', '1', 301, 1),
(2, '1.1.3.1', 'El contenido de la Misión y Visión institucional se corresponden con los objetivos del programa académico.', '1', 302, 1),
(3, '1.1.4.1', 'Entiendo el sentido de la Misión  y Visión del programa.', '1', 303, 1),
(4, '1.1.4.2', 'Comparto el sentido de la Misión y Visión del programa.', '1', 303, 1),
(5, '1.1.5.1', 'El programa garantiza el acceso a la educación superior sin discriminación y promueve estrategias para eliminar o disminuir barreras en infraestructura física, accesibilidad y movilidad.', '1', 304, 1),
(6, '1.2.1.1', 'En el programa se utilizan estrategias y mecanismos  para la discusión y difusión del proyecto educativo del programa académico.', '1', 308, 1),
(7, '1.2.2.1', 'Conozco el sentido del proyecto educativo del programa.', '1', 309, 1),
(8, '1.2.2.2', 'Comparto el sentido del proyecto educativo del programa.', '1', 309, 1),
(9, '1.2.3.1', 'Existen espacios académicos, estrategias y mecanismos en el programa para la discusión y actualización permanente del proyecto educativo del programa.', '1', 310, 1),
(10, '1.2.3.2', 'Existe correspondencia entre el Proyecto Educativo del Programa y el Proyecto Educativo Institucional.', '1', 310, 1),
(11, '1.3.3.1', 'El programa académico tiene\npertinencia en función de las necesidades de la región\n del país, y del mundo.', '1', 318, 1),
(12, '1.3.3.2', 'El programa académico tiene\npertinencia en función de las necesidades de la región\ny del país, lo que se evidencia en el reconocimiento de los egresados.', '1', 318, 1),
(13, '2.4.9.1', 'Conoce los mecanismos de ingreso al programa al que pertenece.', '1', 331, 1),
(14, '2.5.2.1', 'Hay una relación adecuada entre el número de admitidos, el cuerpo docente y los recursos académicos y físicos disponibles.', '1', 333, 1),
(15, '2.6.2.1', 'La calidad de los espacios y estrategias que ofrece el programa, de acuerdo con la naturaleza y orientación de éste, para la participación en grupos o centros de estudio, proyectos de experimentación o de desarrollo empresarial y demás actividades académicas y culturales distintas de la docencia, contribuyen a su formación integral. ', '1', 339, 1),
(16, '2.6.2.2', 'Las estrategias que ofrece el programa, de acuerdo con la naturaleza y orientación de éste, para la participación en grupos o centros de estudio, proyectos de experimentación o de desarrollo empresarial y demás actividades académicas y culturales distintas de la docencia, contribuyen a su formación integral.', '1', 339, 1),
(17, '2.7.2.1', 'El reglamento es tudiantil es pertinente.', '1', 342, 1),
(18, '2.7.2.2', 'El reglamento estudiantil  tiene vigencia.', '1', 342, 1),
(19, '2.7.2.3', 'El reglamento estudiantil  se  aplica de forma adecuada.', '1', 342, 1),
(20, '2.7.4.1', 'El estudiantado participa en los órganos de dirección del programa.', '1', 344, 1),
(21, '2.7.7.1', 'Existe una correspondencia entre las condiciones y exigencias académicas de permanencia y graduación en el programa, y la naturaleza y modalidad del mismo. ', '1', 347, 1),
(22, '3.8.4.1', 'Conoce las políticas, normas y criterios académicos establecidos por la Institución para la selección y vinculación de sus profesores.', '1', 351, 1),
(23, '3.9.3.1', 'El reglamento profesoral es pertinente.', '1', 355, 1),
(24, '3.9.3.2', 'El reglamento profesoral tiene vigencia.', '1', 355, 1),
(25, '3.9.3.3', 'El reglamento profesoral se aplica adecuadamente.', '1', 355, 1),
(26, '3.9.8.1', 'Las políticas institucionales en materia de participación del profesorado en los órganos de dirección de la institución y del programa se aplican adecuadamente.', '1', 358, 1),
(27, '3.10.7.1', 'Los profesores del programa son de calidad.', '1', 365, 1),
(28, '3.10.7.2', 'El número de profesores del programa y la dedicación a este son suficientes.', '1', 365, 1),
(29, '3.11.4.1', 'El impacto que han tenido las acciones orientadas al desarrollo integral de los profesores ha enriquecido la calidad del programa.', '1', 370, 1),
(30, '3.12.4.1', 'El régimen de estímulos al profesorado por el ejercicio calificado de la docencia, la investigación, la creación artística, la extensión o proyección social y la cooperación internacional ha enriquecido la calidad del programa.', '1', 378, 1),
(31, '3.13.2.1', 'Los materiales de apoyo producidos por los docentes del programa, de acuerdo a su metodología , son de calidad', '1', 380, 1),
(32, '3.13.2.2', ' Los materiales de apoyo producidos por los docentes del programa, de acuerdo a su metodología , son  pertinentes', '1', 380, 1),
(33, '3.13.2.3', 'Los materiales de apoyo producidos por los docentes del programa, de acuerdo a su metodología , son  eficaces.', '1', 380, 1),
(34, '3.14.4.1', 'Hay correspondencia entre la remuneración y los méritos académicos y profesionales del profesorado.', '1', 386, 1),
(35, '3.15.5.1', 'Los criterios y mecanismos para la evaluación de docentes son transparentes.', '1', 391, 1),
(36, '3.15.5.2', 'Los criterios y mecanismos para la evaluación de docentes son equitativos.', '1', 391, 1),
(37, '3.15.5.3', 'Los criterios y mecanismos para la evaluación de docentes son eficaces.', '1', 391, 1),
(38, '4.16.5.1', 'El currículo del programa es integral y de calidad. ', '1', 396, 1),
(39, '4.17.6.1', 'Las políticas institucionales en materia de flexibilidad curricular se aplican y son eficaces.', '1', 408, 1),
(40, '4.17.13.1', 'Participa en el diseño y evaluación de su propio plan académico a partir de la oferta académica de acuerdo con sus intereses y la adquisición de competencias.', '1', 415, 1),
(41, '4.18.2.1', 'La interdisciplinariedad en el programa es pertinente, eficaz y contribuye a la formación del estudiante.', '1', 421, 1),
(42, '4.19.2.1', 'Existe correspondencia entre los métodos de enseñanza y aprendizaje que se emplean en el programa y el desarrollo de los contenidos del plan de estudios. ', '1', 425, 1),
(43, '4.19.10.1', 'Existe una correspondencia y exigencia académica de permanencia y graduación en el programa de acuerdo a la naturaleza del mismo.', '1', 433, 1),
(44, '4.19.15.1', 'Las metodologías usadas en la modalidad en que se ofrece el programa han sido exitosas.', '1', 438, 1),
(45, '4.19.16.1', 'Las metodologías de enseñanza que se emplean en el programa inciden en la calidad de los procesos  de aprendizaje.', '1', 439, 1),
(46, '4.20.3.1', 'Existe correspondencia entre las formas de evaluación académica de los estudiantes, la naturaleza del programa y los métodos pedagógicos empleados para desarrollarlos.', '1', 442, 1),
(47, '4.20.4.1', 'La Institución cuenta con un sistema de evaluación que favorece el desarrollo equitativo y transparente de los procesos académicos', '1', 443, 1),
(48, '4.21.3.1', 'Existe correspondencia entre la calidad de los trabajos realizados por los estudiantes del programa y los objetivos de logros definidos para el mismo, incluyendo la formación personal.', '1', 447, 1),
(49, '4.22.4.1', 'Los sistemas de evaluación y autorregulación del programa, inciden en el enriquecimiento de la calidad de éste.', '1', 454, 1),
(50, '4.23.6.1', 'Los programas académicos de la Institución tienen pertinencia en función de las necesidades de la región y del país.', '1', 461, 1),
(51, '4.24.3.1', 'El material bibliográfico con que cuenta el programa es pertinente', '1', 467, 1),
(52, '4.24.3.2', 'El material bibliográfico con que cuenta el programa está actualizado.  ', '1', 467, 1),
(53, '4.24.3.3', 'El material bibliográfico con que cuenta el programa es suficiente.  ', '1', 467, 1),
(54, '4.25.1.1', 'Existe una plataforma tecnológica que garantice la conectividad, interactividad y acceso a sistemas de información, apoyos y recursos para el aprendizaje, de acuerdo con el tipo y modalidad del programa.', '1', 474, 1),
(55, '4.25.3.1', 'Los recursos informáticos y de comunicación con los que cuenta el programa son pertinentes.', '1', 476, 1),
(56, '4.25.3.2', 'Los recursos informáticos y de comunicación con los que cuenta el programa están actualizados.', '1', 476, 1),
(57, '4.25.3.3', 'Los recursos informáticos y de comunicación con que cuenta el programa, son suficientes.', '1', 476, 1),
(58, '4.25.6.1', 'Los recursos informáticos con los que cuenta el programa son pertinentes.', '1', 479, 1),
(59, '4.25.6.2', 'Los recursos informáticos con los que cuenta el programa se corresponden a sus necesidades.', '1', 479, 1),
(60, '4.25.6.3', 'Los recursos informáticos con los que cuenta el programa son suficientes.', '1', 479, 1),
(61, '4.26.4.1', 'El uso de laboratorios, talleres, ayudas audiovisuales y campos de prácticas es adecuado.', '1', 484, 1),
(62, '4.26.4.2', 'La dotación  de laboratorios, talleres y campos de práctica es adecuada.', '1', 484, 1),
(63, '7.31.2.1', 'Conoce los programas, servicios y actividades de bienestar institucional', '1', 536, 1),
(64, '7.31.3.1', 'Los servicios y actividades y políticas de Bienestar contribuyen  a su desarrollo personal.', '1', 537, 1),
(65, '7.31.4.1', 'Las políticas y servicios de Bienestar Institucional son pertinentes y han contribuido a la calidad de las funciones de docencia, investigación y extensión o proyección social.', '1', 538, 1),
(66, '7.31.9.1', 'Las condiciones de Bienestar de los escenarios de prácticas de los programas son adecuadas. ', '1', 543, 1),
(67, '7.31.12.1', 'Conoce las estrategias y otros apoyos socioeconómicos que permitan su desarrollo personal y académico.', '1', 546, 1),
(68, '7.31.14.1', 'Las políticas institucionales y los servicios en materia de bienestar, en relación con la modalidad en que se ofrece el programa, son pertinentes.', '1', 548, 1),
(69, '8.33.2.1', 'Existe una coherencia entre la organización, administración y gestión del programa, y los fines de la docencia, la investigación, la extensión o proyección social y la cooperación nacional e internacional en el programa.', '1', 557, 1),
(70, '8.33.4.1', 'Existe claridad entre las funciones  desarrollasas  y las funciones del cargo.', '1', 559, 1),
(71, '8.33.5.1', 'Son eficientes y eficaces los procesos administrativos del programa.', '1', 560, 1),
(72, '8.34.3.1', 'Los sistemas de información y los mecanismos de comunicación son eficaces.', '1', 564, 1),
(73, '8.35.1.1', 'La orientación académica que imparten los directivos del programa y el liderazgo que ejercen son adecuados. ', '1', 565, 1),
(74, '8.35.3.1', 'Conozco las políticas que orientan la gestión del programa.', '1', 567, 1),
(75, '9.36.3.1', 'La formación recibida en el programa es de calidad.', '1', 570, 1),
(76, '9.36.4.1', 'La formacion recibida en el programa favorece el desarrollo del proyecto de vida.', '1', 571, 1),
(77, '9.37.4.1', 'La formación y el desempeño de los egresados del programa son de calidad.', '1', 579, 1),
(78, '10.38.2.1', 'La planta física es accesible.', '1', 581, 1),
(79, '10.38.2.2', 'La planta física está adecuadamente diseñada.', '1', 581, 1),
(80, '10.38.2.3', 'La planta física posee suficiente capacidad.', '1', 581, 1),
(81, '10.38.2.4', 'La plata física se encuentra suficientemente iluminada.', '1', 581, 1),
(82, '10.38.2.5', 'La planta física tiene una ventilación adecuada.', '1', 581, 1),
(83, '10.38.2.6', 'La planta física es segura.', '1', 581, 1),
(84, '10.38.2.7', 'La planta física posee adecuadas condiciones de higiene.', '1', 581, 1),
(85, '10.38.4.1', 'El número de las bibliotecas, salas de lectura grupal e individual, y los espacios para la consulta es suficiente.', '1', 583, 1),
(86, '10.38.4.2', 'El tamaño de las bibliotecas, salas de lectura grupal e individual, y los espacios para la consulta es adecuado.', '1', 583, 1),
(87, '10.38.4.3', 'La capacidad de las bibliotecas, salas de lectura grupal e individual, y los espacios para la consulta es suficiente.', '1', 583, 1),
(88, '10.38.4.4', 'La iluminación de las bibliotecas, salas de lectura grupal e individual , y los espacios para la consulta es adecuada', '1', 583, 1),
(89, '10.38.4.5', 'La ventilación de las bibliotecas, salas de lectura grupal e individual , y los espacios para la consulta es adecuada.', '1', 583, 1),
(90, '10.38.4.6', 'La dotación de las bibliotecas, salas de lectura grupal e individual, y los espacios para la consulta es suficiente.', '1', 583, 1),
(91, '10.39.4.1', 'Los recursos presupuestales de los que dispone el programa son suficientes.', '1', 589, 1),
(92, '10.40.3.1', 'La asignación de recursos físicos y financieros para el programa se hace de manera equitativa.', '1', 595, 1);

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=45470345 ;

--
-- Volcado de datos para la tabla `representante`
--

INSERT INTO `representante` (`id`, `nombre`, `apellido`, `password`, `rol`, `mail`, `programa_id`) VALUES
(45470344, 'Edna', 'Gomez Bustamante', '123456', 'Comite central', 'acreditacion@unicartagena.edu.co', NULL);

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
  ADD CONSTRAINT `fk_asignacionencuesta_proceso1` FOREIGN KEY (`proceso_id`) REFERENCES `proceso` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_asignacionencuesta_fuente1` FOREIGN KEY (`fuente_id`) REFERENCES `fuente` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_asignacionencuesta_encuesta1` FOREIGN KEY (`encuesta_id`) REFERENCES `encuesta` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

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
  ADD CONSTRAINT `fk_muestraestudiante_muestrapersona1` FOREIGN KEY (`muestrapersona_id`) REFERENCES `muestrapersona` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

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
