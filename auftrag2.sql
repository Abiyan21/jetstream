-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema ne
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
  `kundeID` INT(11) NOT NULL AUTO_INCREMENT,
  `kundenname` VARCHAR(45) NOT NULL,
  `email` VARCHAR(60) NOT NULL,
  `telefon` VARCHAR(60) NOT NULL,
  PRIMARY KEY (`kundeID`),
  UNIQUE INDEX `kundeID` (`kundeID` ASC),
  UNIQUE INDEX `email` (`email` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `auftrag`.`prioritaet`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `auftrag`.`prioritaet` ;

CREATE TABLE IF NOT EXISTS `auftrag`.`prioritaet` (
  `prioritaetID` INT(11) NOT NULL AUTO_INCREMENT,
  `prioritaet` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`prioritaetID`))
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `auftrag`.`service`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `auftrag`.`service` ;

CREATE TABLE IF NOT EXISTS `auftrag`.`service` (
  `serviceID` INT(11) NOT NULL AUTO_INCREMENT,
  `service` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`serviceID`))
ENGINE = InnoDB
AUTO_INCREMENT = 7
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `auftrag`.`stati`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `auftrag`.`stati` ;

CREATE TABLE IF NOT EXISTS `auftrag`.`stati` (
  `statiID` INT NOT NULL AUTO_INCREMENT,
  `status` VARCHAR(45) NULL,
  PRIMARY KEY (`statiID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `auftrag`.`mitarbeiter`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `auftrag`.`mitarbeiter` ;

CREATE TABLE IF NOT EXISTS `auftrag`.`mitarbeiter` (
  `mitarbeiterID` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(45) NOT NULL,
  `passwort` VARCHAR(100) NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`mitarbeiterID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `auftrag`.`auftrag`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `auftrag`.`auftrag` ;

CREATE TABLE IF NOT EXISTS `auftrag`.`auftrag` (
  `auftragID` INT(11) NOT NULL AUTO_INCREMENT,
  `service_serviceID` INT(11) NOT NULL,
  `prioritaet_prioritaetID` INT(11) NOT NULL,
  `kunde_kundeID` INT(11) NULL DEFAULT NULL,
  `stati_statiID` INT NOT NULL,
  `mitarbeiter_mitarbeiterID` INT NULL,
  `kommentar` VARCHAR(255) NULL,
  PRIMARY KEY (`auftragID`),
  INDEX `fk_auftrag_service1_idx` (`service_serviceID` ASC),
  INDEX `fk_auftrag_prioritaet1_idx` (`prioritaet_prioritaetID` ASC),
  INDEX `fk_auftrag_kunde1_idx` (`kunde_kundeID` ASC),
  INDEX `fk_auftrag_stati1_idx` (`stati_statiID` ASC),
  INDEX `fk_auftrag_mitarbeiter1_idx` (`mitarbeiter_mitarbeiterID` ASC),
  CONSTRAINT `fk_auftrag_kunde1`
    FOREIGN KEY (`kunde_kundeID`)
    REFERENCES `auftrag`.`kunde` (`kundeID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_auftrag_prioritaet1`
    FOREIGN KEY (`prioritaet_prioritaetID`)
    REFERENCES `auftrag`.`prioritaet` (`prioritaetID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_auftrag_service1`
    FOREIGN KEY (`service_serviceID`)
    REFERENCES `auftrag`.`service` (`serviceID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_auftrag_stati1`
    FOREIGN KEY (`stati_statiID`)
    REFERENCES `auftrag`.`stati` (`statiID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_auftrag_mitarbeiter1`
    FOREIGN KEY (`mitarbeiter_mitarbeiterID`)
    REFERENCES `auftrag`.`mitarbeiter` (`mitarbeiterID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;




alter table service AUTO_INCREMENT = 1;
alter table prioritaet AUTO_INCREMENT = 1;
alter table stati AUTO_INCREMENT = 1;


insert into prioritaet(prioritaet) value("Tief"),("Standard"),("Express");
insert into service(service) value("Kleiner Service"),("Grosser Service"),("Rennski-Service"),("Bindung Montieren und einstellen"),("Fell zuschneiden"),("Heisswachsen");
insert into stati(status) value("Offen"),("In Verarbeitung"),("Abgeschlossen");
insert into mitarbeiter(username, passwort,name) value("abiyanadmin","$2y$10$THXHMra9n0LAxraczsWUvOzqPYANA3vc2jq/An0R60Hb.txGTlhJK", "Abiyan Khan"),("Joe2","$2y$10$3wPih5WqSkR/vplQBrDTYOJiZxE3HXWEmLLEH4dcZEHFjkni6SRpG","Joe Mama"),("Maxadmin","$2y$10$3wPih5WqSkR/vplQBrDTYOJiZxE3HXWEmLLEH4dcZEHFjkni6SRpG","Max Muster"),("Jeffadmin","$2y$10$3wPih5WqSkR/vplQBrDTYOJiZxE3HXWEmLLEH4dcZEHFjkni6SRpG","Jeff Joff"),("Jonasadmin","$2y$10$3wPih5WqSkR/vplQBrDTYOJiZxE3HXWEmLLEH4dcZEHFjkni6SRpG","Jonas Bonas"),("Trojadmin","$2y$10$3wPih5WqSkR/vplQBrDTYOJiZxE3HXWEmLLEH4dcZEHFjkni6SRpG","Trojan Horse"),("Leoadmin","$2y$10$3wPih5WqSkR/vplQBrDTYOJiZxE3HXWEmLLEH4dcZEHFjkni6SRpG","Leo Beo"),("Alexadmin","$2y$10$3wPih5WqSkR/vplQBrDTYOJiZxE3HXWEmLLEH4dcZEHFjkni6SRpG","Alexander Xander");
# abiyanadmin passwort ist test123. Rest sind test.

select * from service;
select * from prioritaet;
select * from stati;
select * from auftrag;
select * from mitarbeiter;