CREATE DATABASE IF NOT EXISTS medicine;

USE medicine;


-- -----------------------------------------------------
-- Таблица Раздел
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `medicine`.`Section` (
  `id_section` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `description` VARCHAR(300) NOT NULL,
  PRIMARY KEY (`id_section`));

-- -----------------------------------------------------
-- Таблица Товар
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `medicine`.`Product` (
  `id_product` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `price` DECIMAL(10,2) NOT NULL,
  `price_without_discount` DECIMAL(10,2) NOT NULL,
  `price_promocode` DECIMAL(10,2) NOT NULL,
  `description` VARCHAR(300) NOT NULL,
  `visibility` TINYINT NOT NULL,
  `main_section` TINYINT NULL,
  `main_picture` TINYINT NULL,
  PRIMARY KEY (`id_product`));

-- -----------------------------------------------------
-- Таблица Картинка
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `medicine`.`Picture` (
  `id_picture` INT NOT NULL AUTO_INCREMENT,
  `url` VARCHAR(255) NOT NULL,
  `alt` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id_picture`));

-- -----------------------------------------------------
-- Промежуточная таблица Картинка-Товар
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `medicine`.`Picture_has_Product` (
  `id_picture` INT NOT NULL,
  `id_product` INT NOT NULL,
  PRIMARY KEY (`id_picture`, `id_product`),
  INDEX `Picture_has_Product_Product` (`id_product`),
  INDEX `Picture_has_Product_Picture` (`id_picture`),
  CONSTRAINT `Picture_has_Product_Picture`
    FOREIGN KEY (`id_picture`)
    REFERENCES `medicine`.`Picture` (`id_picture`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `Picture_has_Product_Product`
    FOREIGN KEY (`id_product`)
    REFERENCES `medicine`.`Product` (`id_product`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);

-- -----------------------------------------------------
-- Промежуточная таблица Товар-Раздел
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `medicine`.`Product_has_Section` (
  `id_product` INT NOT NULL,
  `id_section` INT NOT NULL,
  PRIMARY KEY (`id_product`, `id_section`),
  INDEX `Product_has_Section_Section` (`id_section`),
  INDEX `Product_has_Section_Product` (`id_product`),
  CONSTRAINT `Product_has_Section_Product`
    FOREIGN KEY (`id_product`)
    REFERENCES `medicine`.`Product` (`id_product`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `Product_has_Section_Section`
    FOREIGN KEY (`id_section`)
    REFERENCES `medicine`.`Section` (`id_section`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);



