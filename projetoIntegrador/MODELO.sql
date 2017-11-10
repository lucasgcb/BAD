-- MySQL Script generated by MySQL Workbench
-- Sex 10 Nov 2017 15:32:46 -02
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema amphora
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `amphora` ;

-- -----------------------------------------------------
-- Schema amphora
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `amphora` DEFAULT CHARACTER SET utf8 ;
USE `amphora` ;

-- -----------------------------------------------------
-- Table `amphora`.`almoxarifado`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `amphora`.`almoxarifado` ;

CREATE TABLE IF NOT EXISTS `amphora`.`almoxarifado` (
  `idAlmoxarifado` INT NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idAlmoxarifado`))
ENGINE = InnoDB
COMMENT = 'Melhor tabela do universo';


-- -----------------------------------------------------
-- Table `amphora`.`categorias`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `amphora`.`categorias` ;

CREATE TABLE IF NOT EXISTS `amphora`.`categorias` (
  `idalmoxarifado` INT NOT NULL,
  `idcategoria` INT NOT NULL,
  `descricao` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idcategoria`, `idalmoxarifado`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `amphora`.`item`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `amphora`.`item` ;

CREATE TABLE IF NOT EXISTS `amphora`.`item` (
  `idalmoxarifado` INT NOT NULL,
  `iditem` INT NOT NULL,
  `idcategoria` INT NULL,
  `quantidade` INT NOT NULL,
  `info` VARCHAR(1024) NULL,
  INDEX `fk_item_almoxarifado1_idx` (`idalmoxarifado` ASC),
  PRIMARY KEY (`iditem`, `idalmoxarifado`),
  INDEX `fk_item_categorias1_idx` (`idcategoria` ASC),
  CONSTRAINT `fk_item_almoxarifado1`
    FOREIGN KEY (`idalmoxarifado`)
    REFERENCES `amphora`.`almoxarifado` (`idAlmoxarifado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_item_categorias1`
    FOREIGN KEY (`idcategoria`)
    REFERENCES `amphora`.`categorias` (`idcategoria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_item_categorias2`
    FOREIGN KEY (`idalmoxarifado`)
    REFERENCES `amphora`.`categorias` (`idalmoxarifado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `amphora`.`usuario`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `amphora`.`usuario` ;

CREATE TABLE IF NOT EXISTS `amphora`.`usuario` (
  `idalmoxarifado` INT NOT NULL,
  `idusuario` INT NOT NULL,
  `admin` TINYINT NOT NULL,
  `matricula` INT NULL,
  `departamento` VARCHAR(255) NULL,
  `email` VARCHAR(255) NOT NULL,
  `telefone` VARCHAR(16) NULL,
  `nome` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`idalmoxarifado`, `idusuario`),
  INDEX `fk_usuario_almoxarifado1_idx` (`idalmoxarifado` ASC),
  CONSTRAINT `fk_usuario_almoxarifado1`
    FOREIGN KEY (`idalmoxarifado`)
    REFERENCES `amphora`.`almoxarifado` (`idAlmoxarifado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `amphora`.`operacoes`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `amphora`.`operacoes` ;

CREATE TABLE IF NOT EXISTS `amphora`.`operacoes` (
  `idoperacao` INT NOT NULL,
  `nome` VARCHAR(32) NULL,
  PRIMARY KEY (`idoperacao`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `amphora`.`transacao`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `amphora`.`transacao` ;

CREATE TABLE IF NOT EXISTS `amphora`.`transacao` (
  `idtransacao` INT NOT NULL,
  `idalmoxarifado` INT NOT NULL,
  `idusuario` INT NOT NULL,
  `iditem` INT NOT NULL,
  `data_solicitada` DATETIME NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `quantidade_entregue` INT NULL,
  `entregue?` VARCHAR(1) NULL,
  `quantidade_devolvida` INT NULL,
  `devolvida?` VARCHAR(45) NULL,
  `data_devolvida` DATETIME NULL,
  `idoperacao` INT NULL,
  PRIMARY KEY (`idtransacao`),
  INDEX `fk_transacao_item_idx` (`iditem` ASC),
  INDEX `fk_transacao_usuario1_idx` (`idusuario` ASC),
  INDEX `fk_transacao_operacoes1_idx` (`idoperacao` ASC),
  INDEX `fk_transacao_item1_idx` (`idalmoxarifado` ASC),
  CONSTRAINT `fk_transacao_item`
    FOREIGN KEY (`iditem`)
    REFERENCES `amphora`.`item` (`iditem`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_transacao_usuario1`
    FOREIGN KEY (`idusuario`)
    REFERENCES `amphora`.`usuario` (`idusuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_transacao_operacoes1`
    FOREIGN KEY (`idoperacao`)
    REFERENCES `amphora`.`operacoes` (`idoperacao`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_transacao_item1`
    FOREIGN KEY (`idalmoxarifado`)
    REFERENCES `amphora`.`item` (`idalmoxarifado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_transacao_usuario2`
    FOREIGN KEY (`idalmoxarifado`)
    REFERENCES `amphora`.`usuario` (`idalmoxarifado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;