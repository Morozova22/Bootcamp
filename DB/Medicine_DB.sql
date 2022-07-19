-- -----------------------------------------------------
-- Таблица Раздел
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `medicine`.`Раздел` (
  `код_раздела` INT NOT NULL AUTO_INCREMENT,
  `название` VARCHAR(45) NOT NULL,
  `описание` VARCHAR(300) NOT NULL,
  `код_каталога` INT NOT NULL,
  `количество_товара` INT NOT NULL,
  `заголовок` VARCHAR(45) NULL,
  PRIMARY KEY (`код_раздела`));

-- -----------------------------------------------------
-- Таблица Товар
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `medicine`.`Товар` (
  `код_товара` INT NOT NULL AUTO_INCREMENT,
  `название` VARCHAR(45) NOT NULL,
  `цена` DECIMAL(10,2) NOT NULL,
  `цена_без_скидки` DECIMAL(10,2) NOT NULL,
  `цена_по_промокоду` DECIMAL(10,2) NOT NULL,
  `описание` VARCHAR(300) NOT NULL,
  `картинка_анонс` VARCHAR(255) NOT NULL,
  `доп_картинка` VARCHAR(255) NOT NULL,
  `заголовок` VARCHAR(45) NULL,
  PRIMARY KEY (`код_товара`));

-- -----------------------------------------------------
-- Промежуточная таблица Раздел - Товар
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `medicine`.`Раздел_has_Товар` (
  `код_раздела` INT NOT NULL,
  `код_товара` INT NOT NULL,
  PRIMARY KEY (`код_раздела`, `код_товара`),
  INDEX `Раздел_has_Товар_Товар` (`код_товара`),
  INDEX `fk_Раздел_has_Товар_Раздел` (`код_раздела`),
  CONSTRAINT `Раздел_has_Товар_Раздел`
    FOREIGN KEY (`код_раздела`)
    REFERENCES `medicine`.`Раздел` (`код_раздела`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `Раздел_has_Товар_Товар`
    FOREIGN KEY (`код_товара`)
    REFERENCES `medicine`.`Товар` (`код_товара`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);
