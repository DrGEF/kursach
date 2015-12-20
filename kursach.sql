DROP database IF EXISTS kursach;
create database kursach;
use kursach;

SET FOREIGN_KEY_CHECKS=0;

DROP TABLE IF EXISTS `chief_accountant` CASCADE
;

DROP TABLE IF EXISTS `companies` CASCADE
;

DROP TABLE IF EXISTS `company` CASCADE
;

DROP TABLE IF EXISTS `debt` CASCADE
;

DROP TABLE IF EXISTS `employees` CASCADE
;

DROP TABLE IF EXISTS `relations` CASCADE
;

DROP TABLE IF EXISTS `tax_rates` CASCADE
;

DROP TABLE IF EXISTS `type` CASCADE
;

CREATE TABLE `chief_accountant`
(
	`id` INT NOT NULL,
	`Name` VARCHAR(100) NOT NULL,
	CONSTRAINT `PK_Table1` PRIMARY KEY (`id`)
)
;

CREATE TABLE `companies`
(
	`id` INT NOT NULL AUTO_INCREMENT ,
	`company_name` VARCHAR(50) NOT NULL,
	`country` VARCHAR(50) NOT NULL,
	`state` VARCHAR(50) NOT NULL,
	`type` INT NOT NULL,
	`accountant` INT,
	`contact_number` CHAR(12),
	`served` DATE NOT NULL,
	CONSTRAINT `PK_Table1` PRIMARY KEY (`id`)
)
;

CREATE TABLE `company`
(
	`company_id` INT,
	`date` DATE,
	`income` INT,
	`costs` INT
)
;

CREATE TABLE `debt`
(
	`company` INT,
	`amount_of_indebtedness` INT,
	`destination` INT
)
;

CREATE TABLE `employees`
(
	`id` INT NOT NULL AUTO_INCREMENT ,
	`name` VARCHAR(100),
	`salary` INT,
	`company` INT,
	CONSTRAINT `PK_Table1` PRIMARY KEY (`id`)
)
;

CREATE TABLE `relations`
(
	`type` INT NOT NULL,
	`rate_id` INT NOT NULL
)
;

CREATE TABLE `tax_rates`
(
	`id` INT NOT NULL AUTO_INCREMENT ,
	`title` VARCHAR(50),
	`value` DOUBLE,
	`description` VARCHAR(100),
	CONSTRAINT `PK_tax rates` PRIMARY KEY (`id`)
)
;

CREATE TABLE `type`
(
	`type` VARCHAR(50),
	`id` INT NOT NULL,
	CONSTRAINT `PK_Table1` PRIMARY KEY (`id`)
)
;

ALTER TABLE `companies` 
 ADD CONSTRAINT `FK_companies_Chief Accountant`
	FOREIGN KEY (`Accountant`) REFERENCES `chief_accountant` (`id`) ON DELETE Restrict ON UPDATE Restrict
;

ALTER TABLE `companies` 
 ADD CONSTRAINT `FK_companies_type`
	FOREIGN KEY (`type`) REFERENCES `type` (`id`) ON DELETE Restrict ON UPDATE Restrict
;

ALTER TABLE `debt` 
 ADD CONSTRAINT `FK_debt_companies`
	FOREIGN KEY (`company`) REFERENCES `companies` (`id`) ON DELETE Restrict ON UPDATE Restrict
;

ALTER TABLE `employees` 
 ADD CONSTRAINT `FK_employees_companies`
	FOREIGN KEY (`company`) REFERENCES `companies` (`id`) ON DELETE Restrict ON UPDATE Restrict
;

SET FOREIGN_KEY_CHECKS=1;



load data local infile 'acc.txt' into table chief_accountant;
load data local infile 'tax_rates.txt' into table tax_rates;
load data local infile 'types.txt' into table type;
load data local infile 'relations.txt' into table relations;
load data local infile 'com.txt' into table companies;
load data local infile 'emp.txt' into table employees;
load data local infile 'cmp.txt' into table company;
load data local infile 'deb.txt' into table debt;