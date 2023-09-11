-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               11.1.2-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             12.3.0.6589
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for mydb
CREATE DATABASE IF NOT EXISTS `mydb` /*!40100 DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci */;
USE `mydb`;

-- Dumping structure for table mydb.account
CREATE TABLE IF NOT EXISTS `account` (
  `account_id` varchar(50) NOT NULL DEFAULT '000',
  `full_name` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Data exporting was unselected.

-- Dumping structure for table mydb.grant_access
CREATE TABLE IF NOT EXISTS `grant_access` (
  `role_id` varchar(50) DEFAULT NULL,
  `account_id` varchar(50) DEFAULT NULL,
  `is_grant` enum('1','0','-1') DEFAULT NULL,
  `note` varchar(250) DEFAULT NULL,
  KEY `FK_role_id_grant_role` (`role_id`),
  KEY `FK_account_id_grant_account` (`account_id`),
  CONSTRAINT `FK_account_id_grant_account` FOREIGN KEY (`account_id`) REFERENCES `account` (`account_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_role_id_grant_role` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Data exporting was unselected.

-- Dumping structure for table mydb.log
CREATE TABLE IF NOT EXISTS `log` (
  `id` bigint(20) NOT NULL DEFAULT 0,
  `account_id` varchar(50) DEFAULT NULL,
  `login_time` datetime DEFAULT NULL,
  `logout_time` datetime DEFAULT NULL,
  `notes` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Data exporting was unselected.

-- Dumping structure for table mydb.role
CREATE TABLE IF NOT EXISTS `role` (
  `role_id` varchar(50) NOT NULL DEFAULT '000',
  `role_name` varchar(50) DEFAULT NULL,
  `description` varchar(50) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Data exporting was unselected.

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;