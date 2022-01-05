-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.3.13-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for capstone
DROP DATABASE IF EXISTS `capstone`;
CREATE DATABASE IF NOT EXISTS `capstone` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `capstone`;

-- Dumping structure for table capstone.client
DROP TABLE IF EXISTS `client`;
CREATE TABLE IF NOT EXISTS `client` (
  `id` varchar(255) NOT NULL,
  `client_name` varchar(255) DEFAULT NULL,
  `transaction_limit` double DEFAULT NULL,
  `custodian_id` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKqebni3i612aw82epyk5wapi52` (`custodian_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Dumping data for table capstone.client: 3 rows
/*!40000 ALTER TABLE `client` DISABLE KEYS */;
INSERT INTO `client` (`id`, `client_name`, `transaction_limit`, `custodian_id`) VALUES
	('DBS001', 'MACQUARIE BANK LIMITED', 1003100, 'CS001'),
	('DBS002', 'LLOYDS BANK CORPORATE MARKETS PLC', 1973900, 'CS001'),
	('DBS003', 'KEYBANK NATIONAL ASSOCIATION', 4000000, 'CS002');
/*!40000 ALTER TABLE `client` ENABLE KEYS */;

-- Dumping structure for table capstone.custodian
DROP TABLE IF EXISTS `custodian`;
CREATE TABLE IF NOT EXISTS `custodian` (
  `id` varchar(255) NOT NULL,
  `custodian_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Dumping data for table capstone.custodian: 2 rows
/*!40000 ALTER TABLE `custodian` DISABLE KEYS */;
INSERT INTO `custodian` (`id`, `custodian_name`) VALUES
	('CS001', 'BNP Paribas Securities ServicesFrance'),
	('CS002', 'The Bank of New York Mellon CorporationU.S.');
/*!40000 ALTER TABLE `custodian` ENABLE KEYS */;

-- Dumping structure for table capstone.instrument
DROP TABLE IF EXISTS `instrument`;
CREATE TABLE IF NOT EXISTS `instrument` (
  `id` varchar(255) NOT NULL,
  `expiry_date` date DEFAULT NULL,
  `face_value` int(11) DEFAULT NULL,
  `instrument_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Dumping data for table capstone.instrument: 3 rows
/*!40000 ALTER TABLE `instrument` DISABLE KEYS */;
INSERT INTO `instrument` (`id`, `expiry_date`, `face_value`, `instrument_name`) VALUES
	('I001', NULL, 100, 'US treasury Bills'),
	('I002', NULL, 1000, 'RBI-2026 -6.5%'),
	('I003', NULL, 1000, 'RBI-2045 -8%'),
	('I004', '2021-12-27', 100, 'USDINR'),
	('I005', NULL, 100, 'EUR USD-FUT');
/*!40000 ALTER TABLE `instrument` ENABLE KEYS */;

-- Dumping structure for table capstone.stock
DROP TABLE IF EXISTS `stock`;
CREATE TABLE IF NOT EXISTS `stock` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `initial_quantity` int(11) DEFAULT NULL,
  `order_direction` varchar(255) DEFAULT NULL,
  `order_status` varchar(255) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `time_stamp` datetime DEFAULT NULL,
  `client_id` varchar(255) DEFAULT NULL,
  `instrument_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKcx4fviyrovj2n6wlfkkwwg1ff` (`client_id`),
  KEY `FKahvw7t7fxrs59npehmxspsx8b` (`instrument_id`)
) ENGINE=MyISAM AUTO_INCREMENT=33 DEFAULT CHARSET=latin1;

-- Dumping data for table capstone.stock: 6 rows
/*!40000 ALTER TABLE `stock` DISABLE KEYS */;
INSERT INTO `stock` (`id`, `initial_quantity`, `order_direction`, `order_status`, `price`, `quantity`, `time_stamp`, `client_id`, `instrument_id`) VALUES
	(27, 25, 'BUY', 'COMPLETED', 150, 0, '2021-12-27 10:54:19', 'DBS001', 'I001'),
	(28, 25, 'SELL', 'COMPLETED', 150, 0, '2021-12-27 10:57:09', 'DBS002', 'I001'),
	(29, 50, 'BUY', 'COMPLETED', 150, 0, '2021-12-27 11:01:25', 'DBS001', 'I001'),
	(30, 50, 'SELL', 'PROCESSING', 200, 25, '2021-12-27 10:59:28', 'DBS002', 'I002'),
	(31, 25, 'BUY', 'COMPLETED', 200, 0, '2021-12-27 11:00:11', 'DBS001', 'I002'),
	(32, 50, 'SELL', 'COMPLETED', 150, 0, '2021-12-27 11:05:33', 'DBS002', 'I001');
/*!40000 ALTER TABLE `stock` ENABLE KEYS */;

-- Dumping structure for table capstone.stock_exchange
DROP TABLE IF EXISTS `stock_exchange`;
CREATE TABLE IF NOT EXISTS `stock_exchange` (
  `id` bigint(20) NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  `time_stamp` datetime DEFAULT NULL,
  `client_id` varchar(255) NOT NULL,
  `instrument_id` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKmbvms9ay7eneev3wlf2d74y5c` (`client_id`),
  KEY `FKbheo60tp5hsitjw4tjh8sujhr` (`instrument_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Dumping data for table capstone.stock_exchange: 6 rows
/*!40000 ALTER TABLE `stock_exchange` DISABLE KEYS */;
INSERT INTO `stock_exchange` (`id`, `quantity`, `time_stamp`, `client_id`, `instrument_id`) VALUES
	(1, 8740, NULL, 'DBS001', 'I001'),
	(2, 20030, NULL, 'DBS001', 'I002'),
	(3, 11260, NULL, 'DBS002', 'I001'),
	(4, 9970, NULL, 'DBS002', 'I002'),
	(5, 10000, NULL, 'DBS002', 'I003'),
	(6, 1000000, NULL, 'DBS003', 'I001');
/*!40000 ALTER TABLE `stock_exchange` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
