SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `listacontactosdb` DEFAULT CHARACTER SET utf8 ;
USE `listacontactosdb` ;

-- -----------------------------------------------------
-- Table `listacontactosdb`.`persona`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `listacontactosdb`.`persona` (
  `idPersona` INT(11) NOT NULL AUTO_INCREMENT ,
  `Nombre` VARCHAR(45) NOT NULL ,
  `Edad` VARCHAR(45) NULL DEFAULT NULL ,
  `Sexo` CHAR(1) NULL DEFAULT NULL DEFAULT b'x' ,
  `Documento` VARCHAR(45) NOT NULL ,
  `habilitado` BIT(1) NOT NULL DEFAULT b'1' ,
  PRIMARY KEY (`idPersona`) )
ENGINE = InnoDB
AUTO_INCREMENT = 16
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `listacontactosdb`.`correoselectronicos`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `listacontactosdb`.`correoselectronicos` (
  `idCorreosElectronicos` INT(11) NOT NULL AUTO_INCREMENT ,
  `CorreoElectronico` VARCHAR(45) NULL DEFAULT NULL ,
  `Persona_idPersona` INT(11) NOT NULL ,
  `habilitado` BIT(1) NOT NULL DEFAULT b'1' ,
  PRIMARY KEY (`idCorreosElectronicos`, `Persona_idPersona`) ,
  INDEX `fk_CorreosElectronicos_Persona1_idx` (`Persona_idPersona` ASC) ,
  CONSTRAINT `fk_CorreosElectronicos_Persona1`
    FOREIGN KEY (`Persona_idPersona` )
    REFERENCES `listacontactosdb`.`persona` (`idPersona` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `listacontactosdb`.`direcciones`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `listacontactosdb`.`direcciones` (
  `idDirecciones` INT(11) NOT NULL AUTO_INCREMENT ,
  `Direccion` VARCHAR(150) NULL DEFAULT NULL ,
  `Persona_idPersona` INT(11) NOT NULL ,
  `habilitado` BIT(1) NOT NULL DEFAULT b'1' ,
  PRIMARY KEY (`idDirecciones`, `Persona_idPersona`) ,
  INDEX `fk_Direcciones_Persona_idx` (`Persona_idPersona` ASC) ,
  CONSTRAINT `fk_Direcciones_Persona`
    FOREIGN KEY (`Persona_idPersona` )
    REFERENCES `listacontactosdb`.`persona` (`idPersona` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `listacontactosdb`.`telefonos`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `listacontactosdb`.`telefonos` (
  `idTelefonos` INT(11) NOT NULL AUTO_INCREMENT ,
  `Telefono` VARCHAR(45) NULL DEFAULT NULL ,
  `Ubicacion` VARCHAR(45) NULL DEFAULT NULL ,
  `Persona_idPersona` INT(11) NOT NULL ,
  `habilitado` BIT(1) NOT NULL DEFAULT b'1' ,
  PRIMARY KEY (`idTelefonos`, `Persona_idPersona`) ,
  INDEX `fk_Telefonos_Persona1_idx` (`Persona_idPersona` ASC) ,
  CONSTRAINT `fk_Telefonos_Persona1`
    FOREIGN KEY (`Persona_idPersona` )
    REFERENCES `listacontactosdb`.`persona` (`idPersona` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 8
DEFAULT CHARACTER SET = utf8;

USE `listacontactosdb` ;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
