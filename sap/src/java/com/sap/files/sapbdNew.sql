SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

DROP SCHEMA IF EXISTS `sapbd` ;
CREATE SCHEMA IF NOT EXISTS `sapbd` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `sapbd` ;

-- -----------------------------------------------------
-- Table `sapbd`.`persona`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sapbd`.`persona` ;

CREATE  TABLE IF NOT EXISTS `sapbd`.`persona` (
  `id` VARCHAR(25) NOT NULL ,
  `nombre` VARCHAR(255) NOT NULL ,
  `apellido` VARCHAR(255) NOT NULL ,
  `password` VARCHAR(45) NOT NULL ,
  `mail` VARCHAR(45) NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sapbd`.`fuente`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sapbd`.`fuente` ;

CREATE  TABLE IF NOT EXISTS `sapbd`.`fuente` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `nombre` VARCHAR(255) NOT NULL ,
  `descripcion` VARCHAR(500) NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sapbd`.`facultad`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sapbd`.`facultad` ;

CREATE  TABLE IF NOT EXISTS `sapbd`.`facultad` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `nombre` VARCHAR(255) NOT NULL ,
  `descripcion` VARCHAR(500) NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `nombre_UNIQUE` (`nombre` ASC) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sapbd`.`programa`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sapbd`.`programa` ;

CREATE  TABLE IF NOT EXISTS `sapbd`.`programa` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `nombre` VARCHAR(255) NOT NULL ,
  `descripcion` VARCHAR(500) NULL ,
  `modalidad` VARCHAR(255) NULL ,
  `tipoformacion` VARCHAR(255) NULL ,
  `facultad_id` INT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_programa_facultad1_idx` (`facultad_id` ASC) ,
  CONSTRAINT `fk_programa_facultad1`
    FOREIGN KEY (`facultad_id` )
    REFERENCES `sapbd`.`facultad` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sapbd`.`estudiante`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sapbd`.`estudiante` ;

CREATE  TABLE IF NOT EXISTS `sapbd`.`estudiante` (
  `id` VARCHAR(25) NOT NULL ,
  `semestre` VARCHAR(45) NOT NULL ,
  `periodo` VARCHAR(45) NOT NULL ,
  `anio` VARCHAR(45) NOT NULL ,
  `persona_id` VARCHAR(25) NOT NULL ,
  `fuente_id` INT NOT NULL ,
  `programa_id` INT NOT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_estudiante_fuente1_idx` (`fuente_id` ASC) ,
  INDEX `fk_estudiante_programa1_idx` (`programa_id` ASC) ,
  INDEX `fk_estudiante_persona1_idx` (`persona_id` ASC) ,
  CONSTRAINT `fk_estudiante_fuente1`
    FOREIGN KEY (`fuente_id` )
    REFERENCES `sapbd`.`fuente` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_estudiante_programa1`
    FOREIGN KEY (`programa_id` )
    REFERENCES `sapbd`.`programa` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_estudiante_persona1`
    FOREIGN KEY (`persona_id` )
    REFERENCES `sapbd`.`persona` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sapbd`.`administrativo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sapbd`.`administrativo` ;

CREATE  TABLE IF NOT EXISTS `sapbd`.`administrativo` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `cargo` VARCHAR(255) NULL ,
  `persona_id` VARCHAR(25) NOT NULL ,
  `fuente_id` INT NOT NULL ,
  `programa_id` INT NOT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_administrativo_fuente1_idx` (`fuente_id` ASC) ,
  INDEX `fk_administrativo_programa1_idx` (`programa_id` ASC) ,
  INDEX `fk_administrativo_persona1_idx` (`persona_id` ASC) ,
  CONSTRAINT `fk_administrativo_fuente1`
    FOREIGN KEY (`fuente_id` )
    REFERENCES `sapbd`.`fuente` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_administrativo_programa1`
    FOREIGN KEY (`programa_id` )
    REFERENCES `sapbd`.`programa` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_administrativo_persona1`
    FOREIGN KEY (`persona_id` )
    REFERENCES `sapbd`.`persona` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sapbd`.`directorprograma`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sapbd`.`directorprograma` ;

CREATE  TABLE IF NOT EXISTS `sapbd`.`directorprograma` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `persona_id` VARCHAR(25) NOT NULL ,
  `fuente_id` INT NOT NULL ,
  `programa_id` INT NOT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_directorprograma_fuente1_idx` (`fuente_id` ASC) ,
  INDEX `fk_directorprograma_programa1_idx` (`programa_id` ASC) ,
  INDEX `fk_directorprograma_persona1_idx` (`persona_id` ASC) ,
  CONSTRAINT `fk_directorprograma_fuente1`
    FOREIGN KEY (`fuente_id` )
    REFERENCES `sapbd`.`fuente` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_directorprograma_programa1`
    FOREIGN KEY (`programa_id` )
    REFERENCES `sapbd`.`programa` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_directorprograma_persona1`
    FOREIGN KEY (`persona_id` )
    REFERENCES `sapbd`.`persona` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sapbd`.`docente`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sapbd`.`docente` ;

CREATE  TABLE IF NOT EXISTS `sapbd`.`docente` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `tipo` VARCHAR(45) NULL ,
  `persona_id` VARCHAR(25) NOT NULL ,
  `fuente_id` INT NOT NULL ,
  `programa_id` INT NOT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_docente_fuente1_idx` (`fuente_id` ASC) ,
  INDEX `fk_docente_programa1_idx` (`programa_id` ASC) ,
  INDEX `fk_docente_persona1_idx` (`persona_id` ASC) ,
  CONSTRAINT `fk_docente_fuente1`
    FOREIGN KEY (`fuente_id` )
    REFERENCES `sapbd`.`fuente` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_docente_programa1`
    FOREIGN KEY (`programa_id` )
    REFERENCES `sapbd`.`programa` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_docente_persona1`
    FOREIGN KEY (`persona_id` )
    REFERENCES `sapbd`.`persona` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sapbd`.`egresado`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sapbd`.`egresado` ;

CREATE  TABLE IF NOT EXISTS `sapbd`.`egresado` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `persona_id` VARCHAR(25) NOT NULL ,
  `fuente_id` INT NOT NULL ,
  `programa_id` INT NOT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_egresado_fuente1_idx` (`fuente_id` ASC) ,
  INDEX `fk_egresado_programa1_idx` (`programa_id` ASC) ,
  INDEX `fk_egresado_persona1_idx` (`persona_id` ASC) ,
  CONSTRAINT `fk_egresado_fuente1`
    FOREIGN KEY (`fuente_id` )
    REFERENCES `sapbd`.`fuente` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_egresado_programa1`
    FOREIGN KEY (`programa_id` )
    REFERENCES `sapbd`.`programa` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_egresado_persona1`
    FOREIGN KEY (`persona_id` )
    REFERENCES `sapbd`.`persona` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sapbd`.`empleador`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sapbd`.`empleador` ;

CREATE  TABLE IF NOT EXISTS `sapbd`.`empleador` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `empresa` VARCHAR(255) NULL ,
  `cargo` VARCHAR(255) NULL ,
  `persona_id` VARCHAR(25) NOT NULL ,
  `fuente_id` INT NOT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_empleador_fuente1_idx` (`fuente_id` ASC) ,
  INDEX `fk_empleador_persona1_idx` (`persona_id` ASC) ,
  CONSTRAINT `fk_empleador_fuente1`
    FOREIGN KEY (`fuente_id` )
    REFERENCES `sapbd`.`fuente` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_empleador_persona1`
    FOREIGN KEY (`persona_id` )
    REFERENCES `sapbd`.`persona` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sapbd`.`agenciagubernamental`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sapbd`.`agenciagubernamental` ;

CREATE  TABLE IF NOT EXISTS `sapbd`.`agenciagubernamental` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `descripcion` VARCHAR(500) NULL ,
  `persona_id` VARCHAR(25) NOT NULL ,
  `fuente_id` INT NOT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_agenciagubernamental_fuente1_idx` (`fuente_id` ASC) ,
  INDEX `fk_agenciagubernamental_persona1_idx` (`persona_id` ASC) ,
  CONSTRAINT `fk_agenciagubernamental_fuente1`
    FOREIGN KEY (`fuente_id` )
    REFERENCES `sapbd`.`fuente` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_agenciagubernamental_persona1`
    FOREIGN KEY (`persona_id` )
    REFERENCES `sapbd`.`persona` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sapbd`.`representante`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sapbd`.`representante` ;

CREATE  TABLE IF NOT EXISTS `sapbd`.`representante` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `nombre` VARCHAR(255) NOT NULL ,
  `apellido` VARCHAR(255) NOT NULL ,
  `password` VARCHAR(45) NOT NULL ,
  `rol` VARCHAR(45) NOT NULL ,
  `mail` VARCHAR(45) NULL ,
  `programa_id` INT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_representante_programa1_idx` (`programa_id` ASC) ,
  CONSTRAINT `fk_representante_programa1`
    FOREIGN KEY (`programa_id` )
    REFERENCES `sapbd`.`programa` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sapbd`.`modelo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sapbd`.`modelo` ;

CREATE  TABLE IF NOT EXISTS `sapbd`.`modelo` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `nombre` VARCHAR(500) NOT NULL ,
  `descripcion` VARCHAR(1000) NOT NULL ,
  `fechaactualizacion` INT NULL ,
  `fechacreacion` DATE NOT NULL ,
  `observaciones` VARCHAR(1000) NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sapbd`.`proceso`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sapbd`.`proceso` ;

CREATE  TABLE IF NOT EXISTS `sapbd`.`proceso` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `fechainicio` VARCHAR(30) NOT NULL ,
  `fechacierre` VARCHAR(30) NULL ,
  `descripcion` VARCHAR(500) NULL ,
  `programa_id` INT NOT NULL ,
  `modelo_id` INT NOT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_proceso_programa1_idx` (`programa_id` ASC) ,
  INDEX `fk_proceso_modelo1` (`modelo_id` ASC) ,
  CONSTRAINT `fk_proceso_programa1`
    FOREIGN KEY (`programa_id` )
    REFERENCES `sapbd`.`programa` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_proceso_modelo1`
    FOREIGN KEY (`modelo_id` )
    REFERENCES `sapbd`.`modelo` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sapbd`.`muestra`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sapbd`.`muestra` ;

CREATE  TABLE IF NOT EXISTS `sapbd`.`muestra` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `formula` VARCHAR(500) NULL ,
  `proceso_id` INT NOT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_muestra_proceso1_idx` (`proceso_id` ASC) ,
  CONSTRAINT `fk_muestra_proceso1`
    FOREIGN KEY (`proceso_id` )
    REFERENCES `sapbd`.`proceso` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sapbd`.`muestrapersona`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sapbd`.`muestrapersona` ;

CREATE  TABLE IF NOT EXISTS `sapbd`.`muestrapersona` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `cedula` VARCHAR(45) NOT NULL ,
  `nombre` VARCHAR(45) NOT NULL ,
  `apellido` VARCHAR(45) NOT NULL ,
  `password` VARCHAR(45) NOT NULL ,
  `mail` VARCHAR(45) NOT NULL ,
  `muestra_id` INT NOT NULL ,
  INDEX `fk_muestrapersona_muestra1_idx` (`muestra_id` ASC) ,
  PRIMARY KEY (`id`) ,
  CONSTRAINT `fk_muestrapersona_muestra1`
    FOREIGN KEY (`muestra_id` )
    REFERENCES `sapbd`.`muestra` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sapbd`.`muestraestudiante`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sapbd`.`muestraestudiante` ;

CREATE  TABLE IF NOT EXISTS `sapbd`.`muestraestudiante` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `codigo` VARCHAR(45) NOT NULL ,
  `semestre` VARCHAR(45) NOT NULL ,
  `periodo` VARCHAR(45) NOT NULL ,
  `anio` VARCHAR(45) NOT NULL ,
  `muestrapersona_id` INT NOT NULL ,
  `programa_id` INT NOT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_muestraestudiante_muestrapersona1` (`muestrapersona_id` ASC) ,
  INDEX `fk_muestraestudiante_programa1` (`programa_id` ASC) ,
  CONSTRAINT `fk_muestraestudiante_muestrapersona1`
    FOREIGN KEY (`muestrapersona_id` )
    REFERENCES `sapbd`.`muestrapersona` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_muestraestudiante_programa1`
    FOREIGN KEY (`programa_id` )
    REFERENCES `sapbd`.`programa` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sapbd`.`muestradocente`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sapbd`.`muestradocente` ;

CREATE  TABLE IF NOT EXISTS `sapbd`.`muestradocente` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `tipo` VARCHAR(45) NULL ,
  `muestrapersona_id` INT NOT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_muestradocente_muestrapersona1` (`muestrapersona_id` ASC) ,
  CONSTRAINT `fk_muestradocente_muestrapersona1`
    FOREIGN KEY (`muestrapersona_id` )
    REFERENCES `sapbd`.`muestrapersona` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sapbd`.`muestraegresado`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sapbd`.`muestraegresado` ;

CREATE  TABLE IF NOT EXISTS `sapbd`.`muestraegresado` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `muestrapersona_id` INT NOT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_muestraegresado_muestrapersona1` (`muestrapersona_id` ASC) ,
  CONSTRAINT `fk_muestraegresado_muestrapersona1`
    FOREIGN KEY (`muestrapersona_id` )
    REFERENCES `sapbd`.`muestrapersona` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sapbd`.`muestraempleador`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sapbd`.`muestraempleador` ;

CREATE  TABLE IF NOT EXISTS `sapbd`.`muestraempleador` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `empresa` VARCHAR(255) NOT NULL ,
  `cargo` VARCHAR(255) NULL ,
  `muestrapersona_id` INT NOT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_muestraempleador_muestrapersona1` (`muestrapersona_id` ASC) ,
  CONSTRAINT `fk_muestraempleador_muestrapersona1`
    FOREIGN KEY (`muestrapersona_id` )
    REFERENCES `sapbd`.`muestrapersona` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sapbd`.`muestraadministrativo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sapbd`.`muestraadministrativo` ;

CREATE  TABLE IF NOT EXISTS `sapbd`.`muestraadministrativo` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `cargo` VARCHAR(45) NULL ,
  `muestrapersona_id` INT NOT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_muestraadministrativo_muestrapersona1` (`muestrapersona_id` ASC) ,
  CONSTRAINT `fk_muestraadministrativo_muestrapersona1`
    FOREIGN KEY (`muestrapersona_id` )
    REFERENCES `sapbd`.`muestrapersona` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sapbd`.`muestradirector`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sapbd`.`muestradirector` ;

CREATE  TABLE IF NOT EXISTS `sapbd`.`muestradirector` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `muestrapersona_id` INT NOT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_muestradirector_muestrapersona1` (`muestrapersona_id` ASC) ,
  CONSTRAINT `fk_muestradirector_muestrapersona1`
    FOREIGN KEY (`muestrapersona_id` )
    REFERENCES `sapbd`.`muestrapersona` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sapbd`.`muestraagencia`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sapbd`.`muestraagencia` ;

CREATE  TABLE IF NOT EXISTS `sapbd`.`muestraagencia` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `descripcion` VARCHAR(45) NULL ,
  `muestrapersona_id` INT NOT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_muestraagencia_muestrapersona1` (`muestrapersona_id` ASC) ,
  CONSTRAINT `fk_muestraagencia_muestrapersona1`
    FOREIGN KEY (`muestrapersona_id` )
    REFERENCES `sapbd`.`muestrapersona` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sapbd`.`factor`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sapbd`.`factor` ;

CREATE  TABLE IF NOT EXISTS `sapbd`.`factor` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `codigo` VARCHAR(100) NOT NULL ,
  `nombre` VARCHAR(255) NOT NULL ,
  `modelo_id` INT NOT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_factor_modelo1_idx` (`modelo_id` ASC) ,
  CONSTRAINT `fk_factor_modelo1`
    FOREIGN KEY (`modelo_id` )
    REFERENCES `sapbd`.`modelo` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sapbd`.`caracteristica`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sapbd`.`caracteristica` ;

CREATE  TABLE IF NOT EXISTS `sapbd`.`caracteristica` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `codigo` VARCHAR(100) NOT NULL ,
  `nombre` VARCHAR(500) NOT NULL ,
  `factor_id` INT NULL ,
  `modelo_id` INT NOT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_caracteristica_factor1_idx` (`factor_id` ASC) ,
  INDEX `fk_caracteristica_modelo1` (`modelo_id` ASC) ,
  CONSTRAINT `fk_caracteristica_factor1`
    FOREIGN KEY (`factor_id` )
    REFERENCES `sapbd`.`factor` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_caracteristica_modelo1`
    FOREIGN KEY (`modelo_id` )
    REFERENCES `sapbd`.`modelo` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sapbd`.`ponderacioncaracteristica`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sapbd`.`ponderacioncaracteristica` ;

CREATE  TABLE IF NOT EXISTS `sapbd`.`ponderacioncaracteristica` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `nivelimportancia` FLOAT NOT NULL ,
  `ponderacion` DOUBLE NOT NULL ,
  `justificacion` VARCHAR(500) NOT NULL ,
  `proceso_id` INT NOT NULL ,
  `caracteristica_id` INT NOT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_ponderacioncaracteristica_proceso1_idx` (`proceso_id` ASC) ,
  INDEX `fk_ponderacioncaracteristica_caracteristica1_idx` (`caracteristica_id` ASC) ,
  CONSTRAINT `fk_ponderacioncaracteristica_proceso1`
    FOREIGN KEY (`proceso_id` )
    REFERENCES `sapbd`.`proceso` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ponderacioncaracteristica_caracteristica1`
    FOREIGN KEY (`caracteristica_id` )
    REFERENCES `sapbd`.`caracteristica` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sapbd`.`indicador`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sapbd`.`indicador` ;

CREATE  TABLE IF NOT EXISTS `sapbd`.`indicador` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `codigo` VARCHAR(100) NOT NULL ,
  `nombre` VARCHAR(255) NOT NULL ,
  `caracteristica_id` INT NULL ,
  `modelo_id` INT NOT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_indicador_caracteristica1_idx` (`caracteristica_id` ASC) ,
  INDEX `fk_indicador_modelo1` (`modelo_id` ASC) ,
  CONSTRAINT `fk_indicador_caracteristica1`
    FOREIGN KEY (`caracteristica_id` )
    REFERENCES `sapbd`.`caracteristica` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_indicador_modelo1`
    FOREIGN KEY (`modelo_id` )
    REFERENCES `sapbd`.`modelo` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sapbd`.`pregunta`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sapbd`.`pregunta` ;

CREATE  TABLE IF NOT EXISTS `sapbd`.`pregunta` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `codigo` VARCHAR(100) NOT NULL ,
  `pregunta` VARCHAR(500) NOT NULL ,
  `tipo` VARCHAR(45) NOT NULL ,
  `indicador_id` INT NULL ,
  `modelo_id` INT NOT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_pregunta_indicador1_idx` (`indicador_id` ASC) ,
  INDEX `fk_pregunta_modelo1` (`modelo_id` ASC) ,
  CONSTRAINT `fk_pregunta_indicador1`
    FOREIGN KEY (`indicador_id` )
    REFERENCES `sapbd`.`indicador` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_pregunta_modelo1`
    FOREIGN KEY (`modelo_id` )
    REFERENCES `sapbd`.`modelo` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sapbd`.`encuesta`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sapbd`.`encuesta` ;

CREATE  TABLE IF NOT EXISTS `sapbd`.`encuesta` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `codigo` VARCHAR(100) NOT NULL ,
  `nombre` VARCHAR(255) NOT NULL ,
  `objetivo` VARCHAR(1000) NOT NULL ,
  `instrucciones` VARCHAR(1000) NOT NULL ,
  `modelo_id` INT NOT NULL ,
  `version` VARCHAR(45) NOT NULL ,
  `fecha` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_encuesta_modelo1` (`modelo_id` ASC) ,
  CONSTRAINT `fk_encuesta_modelo1`
    FOREIGN KEY (`modelo_id` )
    REFERENCES `sapbd`.`modelo` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sapbd`.`asignacionencuesta`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sapbd`.`asignacionencuesta` ;

CREATE  TABLE IF NOT EXISTS `sapbd`.`asignacionencuesta` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `fuente_id` INT NOT NULL ,
  `encuesta_id` INT NOT NULL ,
  `modelo_id` INT NOT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_asignacionencuesta_fuente1_idx` (`fuente_id` ASC) ,
  INDEX `fk_asignacionencuesta_encuesta1_idx` (`encuesta_id` ASC) ,
  INDEX `fk_asignacionencuesta_modelo1` (`modelo_id` ASC) ,
  CONSTRAINT `fk_asignacionencuesta_fuente1`
    FOREIGN KEY (`fuente_id` )
    REFERENCES `sapbd`.`fuente` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_asignacionencuesta_encuesta1`
    FOREIGN KEY (`encuesta_id` )
    REFERENCES `sapbd`.`encuesta` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_asignacionencuesta_modelo1`
    FOREIGN KEY (`modelo_id` )
    REFERENCES `sapbd`.`modelo` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sapbd`.`ponderacionfactor`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sapbd`.`ponderacionfactor` ;

CREATE  TABLE IF NOT EXISTS `sapbd`.`ponderacionfactor` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `ponderacion` DOUBLE NOT NULL ,
  `justificacion` VARCHAR(500) NOT NULL ,
  `proceso_id` INT NOT NULL ,
  `factor_id` INT NOT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_ponderacionfactor_proceso1_idx` (`proceso_id` ASC) ,
  INDEX `fk_ponderacionfactor_factor1_idx` (`factor_id` ASC) ,
  CONSTRAINT `fk_ponderacionfactor_proceso1`
    FOREIGN KEY (`proceso_id` )
    REFERENCES `sapbd`.`proceso` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ponderacionfactor_factor1`
    FOREIGN KEY (`factor_id` )
    REFERENCES `sapbd`.`factor` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sapbd`.`privilegio`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sapbd`.`privilegio` ;

CREATE  TABLE IF NOT EXISTS `sapbd`.`privilegio` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `nombre` VARCHAR(255) NOT NULL ,
  `descripcion` VARCHAR(500) NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sapbd`.`instrumento`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sapbd`.`instrumento` ;

CREATE  TABLE IF NOT EXISTS `sapbd`.`instrumento` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `nombre` VARCHAR(255) NOT NULL ,
  `descripcion` VARCHAR(500) NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sapbd`.`instrumentohasindicador`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sapbd`.`instrumentohasindicador` ;

CREATE  TABLE IF NOT EXISTS `sapbd`.`instrumentohasindicador` (
  `instrumento_id` INT NOT NULL ,
  `indicador_id` INT NOT NULL ,
  PRIMARY KEY (`instrumento_id`, `indicador_id`) ,
  INDEX `fk_instrumento_has_indicador_indicador1` (`indicador_id` ASC) ,
  INDEX `fk_instrumento_has_indicador_instrumento1` (`instrumento_id` ASC) ,
  CONSTRAINT `fk_instrumento_has_indicador_instrumento1`
    FOREIGN KEY (`instrumento_id` )
    REFERENCES `sapbd`.`instrumento` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_instrumento_has_indicador_indicador1`
    FOREIGN KEY (`indicador_id` )
    REFERENCES `sapbd`.`indicador` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sapbd`.`numericadocumental`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sapbd`.`numericadocumental` ;

CREATE  TABLE IF NOT EXISTS `sapbd`.`numericadocumental` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `documento` VARCHAR(500) NOT NULL ,
  `responsable` VARCHAR(500) NOT NULL ,
  `medio` VARCHAR(500) NOT NULL ,
  `lugar` VARCHAR(500) NOT NULL ,
  `evaluacion` INT NOT NULL ,
  `accion` VARCHAR(500) NOT NULL ,
  `proceso_id` INT NOT NULL ,
  `instrumentohasindicador_instrumento_id` INT NOT NULL ,
  `instrumentohasindicador_indicador_id` INT NOT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_numericadocumental_proceso1_idx` (`proceso_id` ASC) ,
  INDEX `fk_numericadocumental_instrumentohasindicador1_idx` (`instrumentohasindicador_instrumento_id` ASC, `instrumentohasindicador_indicador_id` ASC) ,
  CONSTRAINT `fk_numericadocumental_proceso1`
    FOREIGN KEY (`proceso_id` )
    REFERENCES `sapbd`.`proceso` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_numericadocumental_instrumentohasindicador1`
    FOREIGN KEY (`instrumentohasindicador_instrumento_id` , `instrumentohasindicador_indicador_id` )
    REFERENCES `sapbd`.`instrumentohasindicador` (`instrumento_id` , `indicador_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sapbd`.`encabezado`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sapbd`.`encabezado` ;

CREATE  TABLE IF NOT EXISTS `sapbd`.`encabezado` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `fecha` DATETIME NOT NULL ,
  `muestrapersona_id` INT NOT NULL ,
  `proceso_id` INT NOT NULL ,
  `encuesta_id` INT NOT NULL ,
  `fuente_id` INT NOT NULL ,
  `estado` VARCHAR(45) NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_encabezado_proceso1_idx` (`proceso_id` ASC) ,
  INDEX `fk_encabezado_encuesta1_idx` (`encuesta_id` ASC) ,
  INDEX `fk_encabezado_fuente1_idx` (`fuente_id` ASC) ,
  INDEX `fk_encabezado_muestrapersona1` (`muestrapersona_id` ASC) ,
  CONSTRAINT `fk_encabezado_proceso1`
    FOREIGN KEY (`proceso_id` )
    REFERENCES `sapbd`.`proceso` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_encabezado_encuesta1`
    FOREIGN KEY (`encuesta_id` )
    REFERENCES `sapbd`.`encuesta` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_encabezado_fuente1`
    FOREIGN KEY (`fuente_id` )
    REFERENCES `sapbd`.`fuente` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_encabezado_muestrapersona1`
    FOREIGN KEY (`muestrapersona_id` )
    REFERENCES `sapbd`.`muestrapersona` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sapbd`.`ResultadoEvaluacion`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sapbd`.`ResultadoEvaluacion` ;

CREATE  TABLE IF NOT EXISTS `sapbd`.`ResultadoEvaluacion` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `respuesta` VARCHAR(45) NULL ,
  `encabezado_id` INT NOT NULL ,
  `pregunta_id` INT NOT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_ResultadoEvaluacion_encabezado1_idx` (`encabezado_id` ASC) ,
  INDEX `fk_ResultadoEvaluacion_pregunta1_idx` (`pregunta_id` ASC) ,
  CONSTRAINT `fk_ResultadoEvaluacion_encabezado1`
    FOREIGN KEY (`encabezado_id` )
    REFERENCES `sapbd`.`encabezado` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ResultadoEvaluacion_pregunta1`
    FOREIGN KEY (`pregunta_id` )
    REFERENCES `sapbd`.`pregunta` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sapbd`.`representantehasprivilegio`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sapbd`.`representantehasprivilegio` ;

CREATE  TABLE IF NOT EXISTS `sapbd`.`representantehasprivilegio` (
  `representante_id` INT NOT NULL ,
  `privilegio_id` INT NOT NULL ,
  PRIMARY KEY (`representante_id`, `privilegio_id`) ,
  INDEX `fk_representante_has_privilegio_privilegio1` (`privilegio_id` ASC) ,
  INDEX `fk_representante_has_privilegio_representante1` (`representante_id` ASC) ,
  CONSTRAINT `fk_representante_has_privilegio_representante1`
    FOREIGN KEY (`representante_id` )
    REFERENCES `sapbd`.`representante` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_representante_has_privilegio_privilegio1`
    FOREIGN KEY (`privilegio_id` )
    REFERENCES `sapbd`.`privilegio` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sapbd`.`encuestahaspregunta`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sapbd`.`encuestahaspregunta` ;

CREATE  TABLE IF NOT EXISTS `sapbd`.`encuestahaspregunta` (
  `encuesta_id` INT NOT NULL ,
  `pregunta_id` INT NOT NULL ,
  PRIMARY KEY (`encuesta_id`, `pregunta_id`) ,
  INDEX `fk_encuesta_has_pregunta_pregunta1` (`pregunta_id` ASC) ,
  INDEX `fk_encuesta_has_pregunta_encuesta1` (`encuesta_id` ASC) ,
  CONSTRAINT `fk_encuesta_has_pregunta_encuesta1`
    FOREIGN KEY (`encuesta_id` )
    REFERENCES `sapbd`.`encuesta` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_encuesta_has_pregunta_pregunta1`
    FOREIGN KEY (`pregunta_id` )
    REFERENCES `sapbd`.`pregunta` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sapbd`.`procesohasindicador`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sapbd`.`procesohasindicador` ;

CREATE  TABLE IF NOT EXISTS `sapbd`.`procesohasindicador` (
  `proceso_id` INT NOT NULL ,
  `indicador_id` INT NOT NULL ,
  PRIMARY KEY (`proceso_id`, `indicador_id`) ,
  INDEX `fk_proceso_has_indicador_indicador1` (`indicador_id` ASC) ,
  INDEX `fk_proceso_has_indicador_proceso1` (`proceso_id` ASC) ,
  CONSTRAINT `fk_proceso_has_indicador_proceso1`
    FOREIGN KEY (`proceso_id` )
    REFERENCES `sapbd`.`proceso` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_proceso_has_indicador_indicador1`
    FOREIGN KEY (`indicador_id` )
    REFERENCES `sapbd`.`indicador` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `sapbd` ;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
