CREATE DATABASE APP_DATABASE;
/* DROP DATABASE APP_DATABASE; */

SHOW DATABASES;

USE `APP_DATABASE`;

CREATE TABLE `APP_DATABASE`.`category` (
	`id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	`name` VARCHAR(45) NOT NULL
);
  
CREATE TABLE `APP_DATABASE`.`news` (
	`id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `id_category`INT NOT NULL,
	`title` VARCHAR(255) NOT NULL,
	`content` TEXT NOT NULL,
    FOREIGN KEY (id_category) REFERENCES category(id)
);

CREATE TABLE `APP_DATABASE`.`user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NOT NULL,
  `email` VARCHAR(50) NOT NULL,
  `password` VARCHAR(200) NOT NULL,
  PRIMARY KEY (`id`)
);

DROP TABLE APP_DATABASE.user;

INSERT INTO `APP_DATABASE`.`category` (`name`) VALUES ('TV News');
INSERT INTO `APP_DATABASE`.`category` (`name`) VALUES ('Sports');

SELECT id, name FROM APP_DATABASE.category;

INSERT INTO `APP_DATABASE`.`news` (`id_category`,`title`, `content`) VALUES ('1', 'Best TV Show of all time', 'It Supernatural series ...');
INSERT INTO `APP_DATABASE`.`news` (`id_category`, `title`, `content`) VALUES ('2', `Pigossi and Stefani claim Brazil first Olympic tennis medal`, `Laura Pigossi and Luisa Stefani pulled off an implausible rebound triumph in the bronze-decoration last at the Tokyo Olympics on Saturday, collecting a noteworthy first Olympic award in tennis for Brazil.`);

SELECT * FROM APP_DATABASE.news;

SELECT id, title, content FROM APP_DATABASE.news WHERE id_category = 1;

SELECT * FROM APP_DATABASE.user; 

insert into APP_DATABASE.user (name, email, password) values ('Winnah', 'wkilmartin0@live.com', '123456789');
insert into APP_DATABASE.user (name, email, password) values ('Leila', 'lstearndale1@wufoo.com', '123456789');
insert into APP_DATABASE.user (name, email, password) values ('Holmes', 'hgoodredge2@seattletimes.com', '123456789');
insert into APP_DATABASE.user (name, email, password) values ('Mac', 'mdelayglesia3@naver.com', '123456789');
insert into APP_DATABASE.user (name, email, password) values ('Averill', 'adeluna4@about.com', '123456789');
insert into APP_DATABASE.user (name, email, password) values ('Craig', 'ckieff5@usda.gov', '123456789');

SELECT email, password FROM APP_DATABASE.user WHERE email = 'rms@localhost.com' AND password = '123456789';

select * from APP_DATABASE.user;




## Para os exemplos de relacionamemnto 1 para N e N para N

## DROP TABLE APP_DATABASE.manufacturer;
CREATE TABLE `APP_DATABASE`.`manufacturer` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NOT NULL,
  `createdAt`DATE NOT NULL,
  `updatedAt` DATE NOT NULL,
  PRIMARY KEY (`id`)
);

## DROP TABLE APP_DATABASE.categoryp;
CREATE TABLE `APP_DATABASE`.`categoryp` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `createdAt`DATE NOT NULL,
  `updatedAt` DATE NOT NULL,
  PRIMARY KEY (`id`)
);

## DROP TABLE APP_DATABASE.product;
CREATE TABLE `APP_DATABASE`.`product` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NOT NULL,
  `price` float NOT NULL,
  `quantity` INT NOT NULL,
  `manufacturer_id` INT NOT NULL,
  `createdAt`DATE NOT NULL,
  `updatedAt` DATE NOT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (manufacturer_id) REFERENCES manufacturer(id)
);

## DROP TABLE APP_DATABASE.product_category;
CREATE TABLE `APP_DATABASE`.`product_category` (
  `product_id` INT NOT NULL ,
  `category_id` INT NOT NULL ,
  `createdAt`DATE NOT NULL,
  `updatedAt` DATE NOT NULL,
  FOREIGN KEY (product_id) REFERENCES product(id),
  FOREIGN KEY (category_id) REFERENCES categoryp(id)
);
