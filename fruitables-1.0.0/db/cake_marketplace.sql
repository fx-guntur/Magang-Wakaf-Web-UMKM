-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.30 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for cake_marketplace
CREATE DATABASE IF NOT EXISTS `cake_marketplace` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `cake_marketplace`;

-- Dumping structure for table cake_marketplace.table_category
CREATE TABLE IF NOT EXISTS `table_category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `category_name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table cake_marketplace.table_category: ~0 rows (approximately)
DELETE FROM `table_category`;

-- Dumping structure for table cake_marketplace.table_item
CREATE TABLE IF NOT EXISTS `table_item` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `price` float NOT NULL,
  `description` text,
  `categories` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `FK_table_item_table_category` (`categories`),
  CONSTRAINT `FK_table_item_table_category` FOREIGN KEY (`categories`) REFERENCES `table_category` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table cake_marketplace.table_item: ~0 rows (approximately)
DELETE FROM `table_item`;

-- Dumping structure for table cake_marketplace.table_transaction
CREATE TABLE IF NOT EXISTS `table_transaction` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user` int NOT NULL,
  `item` int NOT NULL,
  `quantity` int NOT NULL,
  `transaction_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK__table_user` (`user`),
  KEY `FK__table_item` (`item`),
  CONSTRAINT `FK__table_item` FOREIGN KEY (`item`) REFERENCES `table_item` (`id`),
  CONSTRAINT `FK__table_user` FOREIGN KEY (`user`) REFERENCES `table_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table cake_marketplace.table_transaction: ~0 rows (approximately)
DELETE FROM `table_transaction`;

-- Dumping structure for table cake_marketplace.table_user
CREATE TABLE IF NOT EXISTS `table_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('admin','user') NOT NULL DEFAULT 'user',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table cake_marketplace.table_user: ~0 rows (approximately)
DELETE FROM `table_user`;

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
