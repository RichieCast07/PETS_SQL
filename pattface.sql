CREATE SCHEMA IF NOT EXISTS `pettface` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `pettface` ;

-- -----------------------------------------------------
-- Table `pettface`.`couple`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pettface`.`couple` (
  `id` INT NOT NULL,
  `type_of_couple` VARCHAR(45) NULL DEFAULT NULL,
  `status` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `pettface`.`pet_group`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pettface`.`pet_group` (
  `id` INT NOT NULL,
  `numPets` INT NULL DEFAULT NULL,
  `name` VARCHAR(45) NULL DEFAULT NULL,
  `description` VARCHAR(45) NULL DEFAULT NULL,
  `type` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `pettface`.`eventos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pettface`.`eventos` (
  `id` INT NOT NULL,
  `title` VARCHAR(45) NULL DEFAULT NULL,
  `category` VARCHAR(45) NULL DEFAULT NULL,
  `IdCategory` INT NULL DEFAULT NULL,
  `body` VARCHAR(45) NULL DEFAULT NULL,
  `fecha` DATE NULL DEFAULT NULL,
  `horario` DATETIME NULL DEFAULT NULL,
  `id_couple` INT NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `id_couple` (`id_couple` ASC) VISIBLE,
  INDEX `IdCategory` (`IdCategory` ASC) VISIBLE,
  CONSTRAINT `eventos_ibfk_1`
    FOREIGN KEY (`id_couple`)
    REFERENCES `pettface`.`couple` (`id`),
  CONSTRAINT `eventos_ibfk_2`
    FOREIGN KEY (`IdCategory`)
    REFERENCES `pettface`.`pet_group` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `pettface`.`pet_owner`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pettface`.`pet_owner` (
  `id` INT NOT NULL,
  `username` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `pettface`.`pets`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pettface`.`pets` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NULL DEFAULT NULL,
  `age` INT NULL DEFAULT NULL,
  `raza` VARCHAR(45) NULL DEFAULT NULL,
  `id_pet_owner` INT NULL DEFAULT NULL,
  `id_event` INT NULL DEFAULT NULL,
  `sexo` VARCHAR(15) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `id_event` (`id_event` ASC) VISIBLE,
  INDEX `id_pet_owner` (`id_pet_owner` ASC) VISIBLE,
  CONSTRAINT `pets_ibfk_1`
    FOREIGN KEY (`id_event`)
    REFERENCES `pettface`.`eventos` (`id`),
  CONSTRAINT `pets_ibfk_2`
    FOREIGN KEY (`id_pet_owner`)
    REFERENCES `pettface`.`pet_owner` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `pettface`.`friends`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pettface`.`friends` (
  `id` INT NOT NULL,
  `id_pet` INT NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `id_pet` (`id_pet` ASC) VISIBLE,
  CONSTRAINT `friends_ibfk_1`
    FOREIGN KEY (`id_pet`)
    REFERENCES `pettface`.`pets` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `pettface`.`best_friends_list`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pettface`.`best_friends_list` (
  `id` INT NOT NULL,
  `id_friend` INT NULL DEFAULT NULL,
  `date_best_friends` DATE NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `id_friend` (`id_friend` ASC) VISIBLE,
  CONSTRAINT `best_friends_list_ibfk_1`
    FOREIGN KEY (`id_friend`)
    REFERENCES `pettface`.`friends` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `pettface`.`posts`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pettface`.`posts` (
  `id` INT NOT NULL,
  `title` VARCHAR(45) NULL DEFAULT NULL,
  `body` VARCHAR(45) NULL DEFAULT NULL,
  `id_pet` INT NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `id_pet` (`id_pet` ASC) VISIBLE,
  CONSTRAINT `posts_ibfk_1`
    FOREIGN KEY (`id_pet`)
    REFERENCES `pettface`.`pets` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `pettface`.`comments`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pettface`.`comments` (
  `id` INT NOT NULL,
  `body` VARCHAR(45) NULL DEFAULT NULL,
  `id_Pet` INT NULL DEFAULT NULL,
  `id_post` INT NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `id_post` (`id_post` ASC) VISIBLE,
  INDEX `id_Pet` (`id_Pet` ASC) VISIBLE,
  CONSTRAINT `comments_ibfk_1`
    FOREIGN KEY (`id_post`)
    REFERENCES `pettface`.`posts` (`id`),
  CONSTRAINT `comments_ibfk_2`
    FOREIGN KEY (`id_Pet`)
    REFERENCES `pettface`.`pets` (`id`))
    
    
    
    
    
    
    
    
    
    
    

SELECT * FROM pets WHERE id = 1;
SELECT * FROM pet_owner;
SELECT * FROM eventos;
SELECT * FROM posts;
SELECT * FROM comments WHERE id = 1;
SELECT c.* 
FROM comments c
JOIN posts p ON c.id_post = p.id
WHERE p.id = 1;


