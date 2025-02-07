-- Adminer 4.8.1 MySQL 8.4.4 dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

SET NAMES utf8mb4;

DROP TABLE IF EXISTS `product_media`;
CREATE TABLE `product_media` (
  `id` int NOT NULL AUTO_INCREMENT,
  `product_id` int NOT NULL,
  `type` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `credit_text` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `credit_url` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alternative_description` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_media_product_id_FK` (`product_id`),
  CONSTRAINT `product_media_product_id_FK` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `product_option`;
CREATE TABLE `product_option` (
  `id` int NOT NULL AUTO_INCREMENT,
  `product_id` int NOT NULL,
  `rate_internal_code` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rate_internal_type` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_fetched` datetime DEFAULT NULL,
  `name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `product` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'adult, child, infant, 1 person, 5 people, 10 people, full-price, reduced, ...',
  `type` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'DAY-BASED, TIME-BASED',
  `language` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `individual` tinyint DEFAULT '1',
  `minimum_buy` int DEFAULT NULL,
  `maximum_buy` int DEFAULT NULL,
  `currency` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `net_rate` decimal(10,2) DEFAULT '0.00',
  `recommended_retail_rate` decimal(10,2) DEFAULT '0.00',
  `retail_rate` decimal(10,2) DEFAULT '0.00',
  `age_from` int DEFAULT NULL,
  `age_to` int DEFAULT NULL,
  `valid_from` timestamp NULL DEFAULT NULL,
  `valid_to` timestamp NULL DEFAULT NULL,
  `restrictions` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `preferred` tinyint(1) DEFAULT '0',
  `comments` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_option_product_id_FK` (`product_id`),
  CONSTRAINT `product_option_product_id_FK` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `product_option` (`id`, `product_id`, `rate_internal_code`, `rate_internal_type`, `date_fetched`, `name`, `product`, `type`, `language`, `individual`, `minimum_buy`, `maximum_buy`, `currency`, `net_rate`, `recommended_retail_rate`, `retail_rate`, `age_from`, `age_to`, `valid_from`, `valid_to`, `restrictions`, `preferred`, `comments`, `created_at`, `updated_at`) VALUES
(31,	36,	NULL,	NULL,	NULL,	'Adult',	NULL,	NULL,	NULL,	1,	NULL,	NULL,	NULL,	0.00,	0.00,	0.00,	NULL,	NULL,	NULL,	NULL,	NULL,	0,	NULL,	'2025-02-07 22:14:30',	NULL),
(32,	37,	NULL,	NULL,	NULL,	'Adult',	NULL,	NULL,	NULL,	1,	NULL,	NULL,	NULL,	0.00,	0.00,	0.00,	NULL,	NULL,	NULL,	NULL,	NULL,	0,	NULL,	'2025-02-07 22:14:30',	NULL),
(33,	38,	NULL,	NULL,	NULL,	'Adult',	NULL,	NULL,	NULL,	1,	NULL,	NULL,	NULL,	0.00,	0.00,	0.00,	NULL,	NULL,	NULL,	NULL,	NULL,	0,	NULL,	'2025-02-07 22:14:30',	NULL);

DROP TABLE IF EXISTS `product_type`;
CREATE TABLE `product_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `product_type` (`id`, `name`) VALUES
(1,	'Adult'),
(2,	'Tipo B'),
(3,	'Tipo C'),
(4,	'Tipo A'),
(5,	'Tipo B'),
(6,	'Tipo C');

DROP TABLE IF EXISTS `products`;
CREATE TABLE `products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `supplier_id` int NOT NULL,
  `supplier_product_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_code` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_type_id` int NOT NULL DEFAULT '1',
  `short_description` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `long_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `considerations` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `operational_days` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `week_days` int DEFAULT '127',
  `open_ticket` tinyint DEFAULT '0',
  `supplier_city_code` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `supplier_city_destination_id` int DEFAULT NULL,
  `supplier_venue_attraction_id` int DEFAULT NULL,
  `fully_refundable` tinyint DEFAULT '0',
  `duration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `external_supplier` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `languages` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `includes` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `relevance` int DEFAULT '0',
  `reviews_number` int DEFAULT '0',
  `reviews_average_rating` decimal(3,2) DEFAULT '0.00',
  `reviews_scores` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `safety_information` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `retail_rate_reference_currency` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `net_rate_reference` decimal(10,2) DEFAULT NULL,
  `retail_rate_reference` decimal(10,2) DEFAULT NULL,
  `admission_schedule_type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pickup_point_mandatory` tinyint DEFAULT NULL,
  `supplier_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'UNPUBLISHED',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `fetched_at` date DEFAULT NULL,
  `to_be_fetched_at` date DEFAULT NULL,
  `availability_mandatory` tinyint DEFAULT '0',
  `meeting_point` varchar(3072) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_tour` tinyint DEFAULT '0',
  `estimated_confirmation_time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `products_product_type_id_FK` (`product_type_id`),
  KEY `products_supplier_id_FK` (`supplier_id`),
  KEY `products_supplier_city_destination_id_FK` (`supplier_city_destination_id`),
  KEY `products_supplier_venue_attraction_id_FK` (`supplier_venue_attraction_id`),
  KEY `products_supplier_product_code_IDX` (`supplier_product_code`),
  KEY `products_relevance_IDX` (`relevance`),
  CONSTRAINT `products_product_type_id_FK` FOREIGN KEY (`product_type_id`) REFERENCES `product_type` (`id`),
  CONSTRAINT `products_supplier_city_destination_id_FK` FOREIGN KEY (`supplier_city_destination_id`) REFERENCES `supplier_city_destination` (`id`),
  CONSTRAINT `products_supplier_id_FK` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`id`),
  CONSTRAINT `products_supplier_venue_attraction_id_FK` FOREIGN KEY (`supplier_venue_attraction_id`) REFERENCES `supplier_venue_attraction` (`id`),
  CONSTRAINT `products_chk_1` CHECK (json_valid(`includes`)),
  CONSTRAINT `products_chk_2` CHECK (json_valid(`safety_information`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `products` (`id`, `supplier_id`, `supplier_product_code`, `short_code`, `name`, `product_type_id`, `short_description`, `long_description`, `considerations`, `operational_days`, `week_days`, `open_ticket`, `supplier_city_code`, `supplier_city_destination_id`, `supplier_venue_attraction_id`, `fully_refundable`, `duration`, `external_supplier`, `languages`, `includes`, `relevance`, `reviews_number`, `reviews_average_rating`, `reviews_scores`, `safety_information`, `retail_rate_reference_currency`, `net_rate_reference`, `retail_rate_reference`, `admission_schedule_type`, `pickup_point_mandatory`, `supplier_data`, `status`, `created_at`, `updated_at`, `fetched_at`, `to_be_fetched_at`, `availability_mandatory`, `meeting_point`, `is_tour`, `estimated_confirmation_time`) VALUES
(36,	1,	'P001',	'X12345',	'Producto A',	1,	'Descripción corta A',	'Descripción larga A',	NULL,	NULL,	127,	0,	NULL,	NULL,	NULL,	0,	'1',	NULL,	NULL,	NULL,	0,	0,	4.20,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'UNPUBLISHED',	'2025-02-07 21:47:31',	'2025-02-03 21:47:31',	'2025-02-07',	NULL,	0,	NULL,	0,	NULL),
(37,	2,	'P002',	'B67890',	'Producto B',	2,	'Descripción corta B',	'Descripción larga B',	NULL,	NULL,	127,	0,	NULL,	NULL,	NULL,	0,	'2',	NULL,	NULL,	NULL,	0,	0,	4.40,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'UNPUBLISHED',	'2025-02-07 21:47:31',	'2025-02-03 21:47:31',	'2025-02-07',	NULL,	0,	NULL,	0,	NULL),
(38,	1,	'P003',	'C13579',	'Producto C',	3,	'Descripción corta C',	'Descripción larga C',	NULL,	NULL,	127,	0,	NULL,	NULL,	NULL,	0,	'3',	NULL,	NULL,	NULL,	0,	0,	4.10,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'UNPUBLISHED',	'2025-02-07 21:47:31',	'2025-02-02 21:47:31',	'2025-02-06',	NULL,	0,	NULL,	0,	NULL),
(39,	1,	'P001',	'A12345',	'Producto A',	1,	'Descripción corta A',	'Descripción larga A',	NULL,	NULL,	127,	0,	NULL,	NULL,	NULL,	0,	NULL,	NULL,	NULL,	NULL,	0,	0,	4.20,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'UNPUBLISHED',	'2025-02-07 21:47:40',	'2025-02-07 21:47:40',	'2025-02-07',	NULL,	0,	NULL,	0,	NULL),
(40,	1,	'P002',	'B67890',	'Producto B',	2,	'Descripción corta B',	'Descripción larga B',	NULL,	NULL,	127,	0,	NULL,	NULL,	NULL,	0,	NULL,	NULL,	NULL,	NULL,	0,	0,	4.40,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'UNPUBLISHED',	'2025-02-07 21:47:40',	'2025-02-07 21:47:40',	'2025-02-07',	NULL,	0,	NULL,	0,	NULL),
(41,	2,	'P003',	'C13579',	'Producto C',	3,	'Descripción corta C',	'Descripción larga C',	NULL,	NULL,	127,	0,	NULL,	NULL,	NULL,	0,	NULL,	NULL,	NULL,	NULL,	0,	0,	4.10,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'UNPUBLISHED',	'2025-02-07 21:47:40',	'2025-02-07 21:47:40',	'2025-02-06',	NULL,	0,	NULL,	0,	NULL),
(42,	1,	'P004',	'X12345',	'Producto D',	2,	'Descripción corta D',	'Descripción larga D',	NULL,	NULL,	127,	0,	NULL,	NULL,	NULL,	0,	NULL,	NULL,	NULL,	NULL,	0,	0,	3.90,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'UNPUBLISHED',	'2025-02-07 21:47:40',	'2025-02-07 21:47:40',	'2025-02-05',	NULL,	0,	NULL,	0,	NULL),
(43,	2,	'P005',	'E11223',	'Producto E',	1,	'Descripción corta E',	'Descripción larga E',	NULL,	NULL,	127,	0,	NULL,	NULL,	NULL,	0,	NULL,	NULL,	NULL,	NULL,	0,	0,	4.30,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'UNPUBLISHED',	'2025-02-07 21:47:40',	'2025-02-07 21:47:40',	'2025-02-07',	NULL,	0,	NULL,	0,	NULL),
(44,	1,	'P001',	'A12345',	'Producto A',	1,	'Descripción corta A',	'Descripción larga A',	NULL,	NULL,	127,	0,	NULL,	NULL,	NULL,	0,	'2 horas',	NULL,	NULL,	NULL,	0,	0,	4.20,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'UNPUBLISHED',	'2025-02-07 22:10:01',	'2025-02-07 22:10:01',	'2025-02-07',	NULL,	0,	NULL,	0,	NULL),
(45,	2,	'P002',	'B67890',	'Producto B',	2,	'Descripción corta B',	'Descripción larga B',	NULL,	NULL,	127,	0,	NULL,	NULL,	NULL,	0,	'3 horas',	NULL,	NULL,	NULL,	0,	0,	4.30,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'UNPUBLISHED',	'2025-02-07 22:10:01',	'2025-02-07 22:10:01',	'2025-02-07',	NULL,	0,	NULL,	0,	NULL),
(46,	1,	'P003',	'C13579',	'Producto C',	3,	'Descripción corta C',	'Descripción larga C',	NULL,	NULL,	127,	0,	NULL,	NULL,	NULL,	0,	'1 hora',	NULL,	NULL,	NULL,	0,	0,	4.10,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'UNPUBLISHED',	'2025-02-07 22:10:01',	'2025-02-07 22:10:01',	'2025-02-06',	NULL,	0,	NULL,	0,	NULL);

DROP TABLE IF EXISTS `supplier_city_destination`;
CREATE TABLE `supplier_city_destination` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `supplier_venue_attraction`;
CREATE TABLE `supplier_venue_attraction` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `location` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `suppliers`;
CREATE TABLE `suppliers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_info` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `suppliers` (`id`, `name`, `contact_info`) VALUES
(1,	'Proveedor A',	NULL),
(2,	'Proveedor B',	NULL);

-- 2025-02-07 22:23:33
