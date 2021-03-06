-- MySQL Script generated by MySQL Workbench
-- Mon Nov  9 20:34:48 2020
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `mydb` ;

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Zona`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Zona` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Zona` (
  `Nombre` VARCHAR(45) NOT NULL,
  `Concejal` VARCHAR(45) NULL,
  `Area` INT NOT NULL,
  `NumViviendas` INT NULL,
  PRIMARY KEY (`Nombre`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Vivienda`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Vivienda` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Vivienda` (
  `Calle` VARCHAR(40) NOT NULL,
  `Numero` INT NOT NULL,
  `Cantidad de Personas` INT NULL,
  `NombreZona` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Calle`, `Numero`),
  CONSTRAINT `NombreZona`
    FOREIGN KEY (`NombreZona`)
    REFERENCES `mydb`.`Zona` (`Nombre`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Bloque`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Bloque` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Bloque` (
  `Calle` VARCHAR(45) NOT NULL,
  `Numero` INT NOT NULL,
  `Cantidad de Personas` INT NULL,
  `nombreZona` VARCHAR(45) NULL,
  PRIMARY KEY (`Calle`, `Numero`),
  CONSTRAINT `nombreZ`
    FOREIGN KEY (`nombreZona`)
    REFERENCES `mydb`.`Zona` (`Nombre`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Persona`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Persona` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Persona` (
  `DNI` VARCHAR(8) NOT NULL,
  `Nombre` VARCHAR(45) NOT NULL,
  `Numero Telefono` INT NULL,
  `DNI_Lid` VARCHAR(8) NOT NULL,
  `CalleViv` VARCHAR(40) NULL,
  `NumeroViv` INT NULL,
  PRIMARY KEY (`DNI_Lid`),
  CONSTRAINT `DNI_`
    FOREIGN KEY (`DNI`)
    REFERENCES `mydb`.`Persona` (`DNI_Lid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `CalleViv_`
    FOREIGN KEY (`CalleViv`, `NumeroViv`)
    REFERENCES `mydb`.`Vivienda` (`Calle`,`Numero`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `CalleViv`
    FOREIGN KEY(`CalleViv`)
    REFERENCES `mydb`.`Bloque` (`Calle`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Piso`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Piso` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Piso` (
  `Calle` VARCHAR(45) NOT NULL,
  `Numero` INT NOT NULL,
  `Planta` INT NOT NULL,
  `Letra` VARCHAR(1) NOT NULL,
  `Superficie` INT NOT NULL,
  PRIMARY KEY (`Planta`, `Letra`),
  CONSTRAINT `Calle_`
    FOREIGN KEY (`Calle`, `Numero`)
    REFERENCES `mydb`.`Bloque` (`Calle`, `Numero`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
