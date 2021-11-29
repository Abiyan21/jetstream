-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema auftrag
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema auftrag
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `auftrag` DEFAULT CHARACTER SET utf8 ;
USE `auftrag` ;

-- -----------------------------------------------------
-- Table `auftrag`.`kunde`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `auftrag`.`kunde` ;

CREATE TABLE IF NOT EXISTS `auftrag`.`kunde` (
  `kundeID` INT AUTO_INCREMENT UNIQUE NOT NULL,
  `kundenname` VARCHAR(45) NOT NULL,
  `email` VARCHAR(60) UNIQUE NOT NULL,
  `telefon` VARCHAR(60) NOT NULL,
  PRIMARY KEY (`kundeID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `auftrag`.`prioritaet`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `auftrag`.`prioritaet` ;

CREATE TABLE IF NOT EXISTS `auftrag`.`prioritaet` (
  `prioritaetID` INT AUTO_INCREMENT NOT NULL,
  `prioritaet` VARCHAR(45) NULL,
  PRIMARY KEY (`prioritaetID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `auftrag`.`service`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `auftrag`.`service` ;

CREATE TABLE IF NOT EXISTS `auftrag`.`service` (
  `serviceID` INT AUTO_INCREMENT NOT NULL,
  `service` VARCHAR(45) NULL,
  PRIMARY KEY (`serviceID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `auftrag`.`auftrag`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `auftrag`.`auftrag` ;

CREATE TABLE IF NOT EXISTS `auftrag`.`auftrag` (
  `auftragID` INT auto_increment NOT NULL,
  `service_serviceID` INT NOT NULL,
  `prioritaet_prioritaetID` INT NOT NULL,
  `kunde_kundeID` INT NULL,
  PRIMARY KEY (`auftragID`),
  INDEX `fk_auftrag_service1_idx` (`service_serviceID` ASC) ,
  INDEX `fk_auftrag_prioritaet1_idx` (`prioritaet_prioritaetID` ASC) ,
  INDEX `fk_auftrag_kunde1_idx` (`kunde_kundeID` ASC) ,
  CONSTRAINT `fk_auftrag_service1`
    FOREIGN KEY (`service_serviceID`)
    REFERENCES `auftrag`.`service` (`serviceID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_auftrag_prioritaet1`
    FOREIGN KEY (`prioritaet_prioritaetID`)
    REFERENCES `auftrag`.`prioritaet` (`prioritaetID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_auftrag_kunde1`
    FOREIGN KEY (`kunde_kundeID`)
    REFERENCES `auftrag`.`kunde` (`kundeID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;


select * from kunde;
select * from service;
select * from prioritaet;
select * from auftrag;

insert into prioritaet(prioritaet) value("Tief"),("Standard"),("Express");
insert into service(service) value("Kleiner Service"),("Grosser Service"),("Rennski-Service"),("Bindung Montieren und einstellen"),("Fell zuschneiden"),("Heisswachsen");
#INSERT IGNORE INTO kunde(kundenname, email, telefon) value("abiyan","abiyan@hotmail.com",0764232343);
#insert into auftrag(service_serviceID, prioritaet_prioritaetID, kunde_kundeID) value (1,1,1);

