
-- -----------------------------------------------------
-- Таблица Каталог
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `medicine`.`Каталог` (
  `код_каталога` INT NOT NULL AUTO_INCREMENT,
  `название` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`код_каталога`));

-- -----------------------------------------------------
-- Таблица Раздел
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `medicine`.`Раздел` (
  `код_раздела` INT NOT NULL AUTO_INCREMENT,
  `название` VARCHAR(45) NOT NULL,
  `описание` VARCHAR(300) NOT NULL,
  `код_каталога` INT NOT NULL,
  PRIMARY KEY (`код_раздела`),
  INDEX `Раздел_Каталог` (`код_каталога` ASC),
  CONSTRAINT `Раздел_Каталог`
    FOREIGN KEY (`код_каталога`)
    REFERENCES `medicine`.`Каталог` (`код_каталога`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);

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
  PRIMARY KEY (`код_товара`));

-- -----------------------------------------------------
-- Промежуточная таблица Раздел - Товар
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `medicine`.`Раздел_has_Товар` (
  `код_раздела` INT NOT NULL,
  `код_товара` INT NOT NULL,
  PRIMARY KEY (`код_раздела`, `код_товара`),
  INDEX `Раздел_has_Товар_Товар` (`код_товара` ASC),
  INDEX `Раздел_has_Товар_Раздел` (`код_раздела` ASC),
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

-- -----------------------------------------------------
-- Таблица Картинка-анонс
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `medicine`.`Картинка_анонс` (
  `код_картинки` INT NOT NULL AUTO_INCREMENT,
  `адрес_картинки` VARCHAR(255) NOT NULL,
  `код_товара` INT NOT NULL,
  PRIMARY KEY (`код_картинки`),
  INDEX `Картинка_анонс_Товар` (`код_товара` ASC),
  CONSTRAINT `Картинка_анонс_Товар`
    FOREIGN KEY (`код_товара`)
    REFERENCES `medicine`.`Товар` (`код_товара`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);

-- -----------------------------------------------------
-- Таблица Доп_картинка
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `medicine`.`Доп_картинка` (
  `код_доп_картинки` INT NOT NULL AUTO_INCREMENT,
  `адрес_картинки` VARCHAR(255) NOT NULL,
  `код_товара` INT NOT NULL,
  PRIMARY KEY (`код_доп_картинки`),
  INDEX `Доп_картинка_Товар` (`код_товара` ASC),
  CONSTRAINT `Доп_картинка_Товар`
    FOREIGN KEY (`код_товара`)
    REFERENCES `medicine`.`Товар` (`код_товара`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);




