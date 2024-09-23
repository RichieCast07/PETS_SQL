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
    
    
    
    
    -- Insertar datos en la tabla pet_owner
INSERT INTO pet_owner (id, username)
VALUES (1, 'john_doe'),
       (2, 'jane_smith'),
       (3, 'bob_jones');

-- Insertar datos en la tabla pet_group
INSERT INTO pet_group (id, numPets, name, description, type)
VALUES (1, 2, 'Grupo 1', 'Grupo de perros', 'Perro'),
       (2, 3, 'Grupo 2', 'Grupo de gatos', 'Gato');

-- Insertar datos en la tabla couple
INSERT INTO couple (id, type_of_couple, status)
VALUES (1, 'Amigos', 'Activo'),
       (2, 'Pareja', 'Inactivo');

-- Insertar datos en la tabla eventos
INSERT INTO eventos (id, title, category, IdCategory, body, fecha, horario, id_couple)
VALUES (1, 'Evento de Perros', 'Concurso', 1, 'Concurso anual de perros', '2024-10-15', '2024-10-15 10:00:00', 1),
       (2, 'Evento de Gatos', 'Exposición', 2, 'Exposición de gatos', '2024-11-10', '2024-11-10 12:00:00', 2);

-- Insertar datos en la tabla pets
INSERT INTO pets (id, name, age, raza, id_pet_owner, id_event, sexo)
VALUES (1, 'Fido', 3, 'Golden Retriever', 1, 1, 'Macho'),
       (2, 'Max', 2, 'Bulldog', 2, 1, 'Macho'),
       (3, 'Whiskers', 4, 'Siamés', 3, 2, 'Hembra');

-- Insertar datos en la tabla posts
INSERT INTO posts (id, title, body, id_pet)
VALUES (1, 'Fido gana concurso', 'Fido ganó el concurso anual de perros', 1),
       (2, 'Max en el parque', 'Max disfrutó mucho en el parque hoy', 2);

-- Insertar datos en la tabla comments
INSERT INTO comments (id, body, id_Pet, id_post)
VALUES (1, '¡Felicidades Fido!', 2, 1),
       (2, 'Max se ve muy feliz', 3, 2);

-- Insertar datos en la tabla friends
INSERT INTO friends (id, id_pet)
VALUES (1, 1),
       (2, 2),
       (3, 3);

-- Insertar datos en la tabla best_friends_list
INSERT INTO best_friends_list (id, id_friend, date_best_friends)
VALUES (1, 1, '2024-09-01'),
       (2, 2, '2024-09-02');


SELECT * FROM pets WHERE id = 1;
SELECT * FROM pet_owner;
SELECT * FROM eventos;
SELECT * FROM posts;
SELECT * FROM comments WHERE id = 1;
SELECT c.* 
FROM comments c
JOIN posts p ON c.id_post = p.id
WHERE p.id = 1;


