/*!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19-11.4.2-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: products_database
-- ------------------------------------------------------
-- Server version	11.4.2-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*M!100616 SET @OLD_NOTE_VERBOSITY=@@NOTE_VERBOSITY, NOTE_VERBOSITY=0 */;

--
-- Table structure for table `account_emailaddress`
--

DROP TABLE IF EXISTS `account_emailaddress`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account_emailaddress` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(254) NOT NULL,
  `verified` tinyint(1) NOT NULL,
  `primary` tinyint(1) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `account_emailaddress_user_id_email_987c8728_uniq` (`user_id`,`email`),
  KEY `account_emailaddress_email_03be32b2` (`email`),
  CONSTRAINT `account_emailaddress_user_id_2c513194_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_emailaddress`
--

LOCK TABLES `account_emailaddress` WRITE;
/*!40000 ALTER TABLE `account_emailaddress` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_emailaddress` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_emailconfirmation`
--

DROP TABLE IF EXISTS `account_emailconfirmation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account_emailconfirmation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `sent` datetime(6) DEFAULT NULL,
  `key` varchar(64) NOT NULL,
  `email_address_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key` (`key`),
  KEY `account_emailconfirm_email_address_id_5b7f8c58_fk_account_e` (`email_address_id`),
  CONSTRAINT `account_emailconfirm_email_address_id_5b7f8c58_fk_account_e` FOREIGN KEY (`email_address_id`) REFERENCES `account_emailaddress` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_emailconfirmation`
--

LOCK TABLES `account_emailconfirmation` WRITE;
/*!40000 ALTER TABLE `account_emailconfirmation` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_emailconfirmation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES
(1,'Can add log entry',1,'add_logentry'),
(2,'Can change log entry',1,'change_logentry'),
(3,'Can delete log entry',1,'delete_logentry'),
(4,'Can view log entry',1,'view_logentry'),
(5,'Can add permission',2,'add_permission'),
(6,'Can change permission',2,'change_permission'),
(7,'Can delete permission',2,'delete_permission'),
(8,'Can view permission',2,'view_permission'),
(9,'Can add group',3,'add_group'),
(10,'Can change group',3,'change_group'),
(11,'Can delete group',3,'delete_group'),
(12,'Can view group',3,'view_group'),
(13,'Can add user',4,'add_user'),
(14,'Can change user',4,'change_user'),
(15,'Can delete user',4,'delete_user'),
(16,'Can view user',4,'view_user'),
(17,'Can add content type',5,'add_contenttype'),
(18,'Can change content type',5,'change_contenttype'),
(19,'Can delete content type',5,'delete_contenttype'),
(20,'Can view content type',5,'view_contenttype'),
(21,'Can add session',6,'add_session'),
(22,'Can change session',6,'change_session'),
(23,'Can delete session',6,'delete_session'),
(24,'Can view session',6,'view_session'),
(25,'Can add site',7,'add_site'),
(26,'Can change site',7,'change_site'),
(27,'Can delete site',7,'delete_site'),
(28,'Can view site',7,'view_site'),
(29,'Can add email address',8,'add_emailaddress'),
(30,'Can change email address',8,'change_emailaddress'),
(31,'Can delete email address',8,'delete_emailaddress'),
(32,'Can view email address',8,'view_emailaddress'),
(33,'Can add email confirmation',9,'add_emailconfirmation'),
(34,'Can change email confirmation',9,'change_emailconfirmation'),
(35,'Can delete email confirmation',9,'delete_emailconfirmation'),
(36,'Can view email confirmation',9,'view_emailconfirmation'),
(37,'Can add social account',10,'add_socialaccount'),
(38,'Can change social account',10,'change_socialaccount'),
(39,'Can delete social account',10,'delete_socialaccount'),
(40,'Can view social account',10,'view_socialaccount'),
(41,'Can add social application',11,'add_socialapp'),
(42,'Can change social application',11,'change_socialapp'),
(43,'Can delete social application',11,'delete_socialapp'),
(44,'Can view social application',11,'view_socialapp'),
(45,'Can add social application token',12,'add_socialtoken'),
(46,'Can change social application token',12,'change_socialtoken'),
(47,'Can delete social application token',12,'delete_socialtoken'),
(48,'Can view social application token',12,'view_socialtoken'),
(49,'Can add category',13,'add_category'),
(50,'Can change category',13,'change_category'),
(51,'Can delete category',13,'delete_category'),
(52,'Can view category',13,'view_category'),
(53,'Can add product',14,'add_product'),
(54,'Can change product',14,'change_product'),
(55,'Can delete product',14,'delete_product'),
(56,'Can view product',14,'view_product'),
(57,'Can add cart',15,'add_cart'),
(58,'Can change cart',15,'change_cart'),
(59,'Can delete cart',15,'delete_cart'),
(60,'Can view cart',15,'view_cart');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES
(1,'pbkdf2_sha256$720000$lyqUjgzZk7pLka28fYLHE8$HHOgClaEwm1NnbdaW51/PdEodzhX9Vzo32LkLSOVFu4=','2024-07-24 11:25:09.761284',1,'julian','','','felipemadeit@gmail.com',1,1,'2024-07-24 11:24:52.339490');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES
(1,'2024-07-24 11:26:53.927073','1','Processor',1,'[{\"added\": {}}]',13,1),
(2,'2024-07-24 11:27:06.903753','2','Graphics Card',1,'[{\"added\": {}}]',13,1),
(3,'2024-07-24 11:27:14.342285','3','Laptops',1,'[{\"added\": {}}]',13,1),
(4,'2024-07-24 11:29:07.092676','1','Macbook Pro Apple M3 Max',1,'[{\"added\": {}}]',14,1),
(5,'2024-07-24 11:35:05.123872','2','AMD Ryzen 7 5800X 3.8GHz',1,'[{\"added\": {}}]',14,1),
(6,'2024-07-24 12:26:11.055943','2','AMD Ryzen 7 5800X 3.8GHz',3,'',14,1),
(7,'2024-07-24 12:28:20.731126','1','Macbook Pro Apple M3 Max',2,'[{\"changed\": {\"fields\": [\"Primary img\", \"Second img\"]}}]',14,1),
(8,'2024-07-24 12:28:37.004356','1','Macbook Pro Apple M3 Max',2,'[{\"changed\": {\"fields\": [\"Primary img\", \"Second img\"]}}]',14,1),
(9,'2024-07-24 12:32:14.138859','3','Apple MacBook Air Apple M3/16GB/512GB SSD/GPU 10 Núcleos/13.6\" Gris Espacial',1,'[{\"added\": {}}]',14,1),
(10,'2024-07-24 12:49:22.874271','3','Apple MacBook Air Apple M3/16GB/512GB SSD/GPU 10 Núcleos/13.6\" Gris Espacial',3,'',14,1),
(11,'2024-07-24 12:49:26.639506','1','Macbook Pro Apple M3 Max',3,'',14,1),
(12,'2024-07-24 12:51:14.837539','4','Apple MacBook Air Apple M3/16GB/512GB SSD/GPU 10 Núcleos/13.6\" Gris Espacial',1,'[{\"added\": {}}]',14,1),
(13,'2024-07-24 12:51:40.200052','4','Apple MacBook Air Apple M3/16GB/512GB SSD/GPU 10 Núcleos/13.6\" Gris Espacial',3,'',14,1),
(14,'2024-07-24 12:52:27.659699','5','Apple MacBook Air Apple M3/16GB/512GB SSD/GPU 10 Núcleos/13.6\" Gris Espacial',1,'[{\"added\": {}}]',14,1),
(15,'2024-07-24 13:29:41.863720','5','Apple MacBook Air Apple M3/16GB/512GB SSD/GPU 10 Núcleos/13.6\" Gris Espacial',2,'[{\"changed\": {\"fields\": [\"Primary img\", \"Second img\"]}}]',14,1),
(16,'2024-07-24 14:00:57.086552','6','fg',1,'[{\"added\": {}}]',14,1),
(17,'2024-07-24 14:01:04.373861','6','fg',2,'[]',14,1),
(18,'2024-07-24 14:14:31.939335','7','dhgh',1,'[{\"added\": {}}]',14,1),
(19,'2024-07-24 14:21:48.675394','8','AMD Ryzen 7 5800X 3.8GHz',1,'[{\"added\": {}}]',14,1),
(20,'2024-07-24 14:24:15.285390','9','AMD RYZEN 5 8500G',1,'[{\"added\": {}}]',14,1),
(21,'2024-07-24 14:30:09.038544','5','Apple MacBook Air Apple M3/16GB/512GB SSD/GPU 10 Núcleos/13.6\" Gris Espacial',3,'',14,1),
(22,'2024-07-24 14:30:13.820672','6','fg',3,'',14,1),
(23,'2024-07-24 14:30:17.069771','7','dhgh',3,'',14,1),
(24,'2024-07-24 14:33:10.457821','10','INTEL CORE I9-14900KS 24 CORES',1,'[{\"added\": {}}]',14,1),
(25,'2024-07-24 14:54:41.258162','11','AMD Ryzen Threadripper PRO 7995WX 2.5/5.1GHz',1,'[{\"added\": {}}]',14,1),
(26,'2024-07-24 15:04:28.576927','12','AMD Ryzen Threadripper PRO 5965WX 3.8GHz/4.5GHz',1,'[{\"added\": {}}]',14,1),
(27,'2024-07-24 15:06:26.036786','13','Intel Core i9-10980XE 3 GHz Extreme Edition',1,'[{\"added\": {}}]',14,1),
(28,'2024-07-24 15:11:31.766555','14','AMD Ryzen Threadripper 2920X 3.5GHz',1,'[{\"added\": {}}]',14,1),
(29,'2024-07-24 15:15:05.682477','15','Intel Core i9-12900K 3.2 GHz',1,'[{\"added\": {}}]',14,1),
(30,'2024-07-24 15:18:18.084409','16','AMD Ryzen 7 5800X3D 3.4GHz',1,'[{\"added\": {}}]',14,1),
(31,'2024-07-24 15:21:24.395311','17','AMD Ryzen 7 7700X 4.5 GHz',1,'[{\"added\": {}}]',14,1),
(32,'2024-07-24 15:23:56.028445','18','Intel Core i5-9500 3 GHz',1,'[{\"added\": {}}]',14,1),
(33,'2024-07-24 15:26:58.314567','19','AMD RYZEN 5 5500 4.2 GHZ',1,'[{\"added\": {}}]',14,1),
(34,'2024-07-24 15:29:17.796271','20','INTEL CORE I3-12100F 4.30 GHZ',1,'[{\"added\": {}}]',14,1),
(35,'2024-07-24 15:32:56.375184','21','INTEL CORE i5 14400 2,5 9,5M 10CORES',1,'[{\"added\": {}}]',14,1),
(36,'2024-07-24 15:39:59.604773','22','AMD RYZEN 7 8700G 4,2 8 CORE RADEON AM5',1,'[{\"added\": {}}]',14,1),
(37,'2024-07-24 15:51:32.527154','23','MSI GEFORCE RTX-4090 GAMING TRIO RGB 24 GB',1,'[{\"added\": {}}]',14,1),
(38,'2024-07-24 15:53:58.576265','24','GEFORCE ASUS RTX 4060 TI DUAL OC 8GB',1,'[{\"added\": {}}]',14,1),
(39,'2024-07-24 15:55:47.292384','25','GIGABYTE RTX 4060 GAMING WF OC 3X 8 GB',1,'[{\"added\": {}}]',14,1),
(40,'2024-07-24 15:57:17.300244','26','ASUS GEF RTX 4060 DUAL OC 8 GB',1,'[{\"added\": {}}]',14,1),
(41,'2024-07-24 15:59:04.924846','27','MSI RTX-4060 VENTUS 2X OC 8 GB',1,'[{\"added\": {}}]',14,1),
(42,'2024-07-24 16:00:31.625561','28','GIGABYTE RTX 4060 TI EAGLE OC WINF 3X 8 GB',1,'[{\"added\": {}}]',14,1),
(43,'2024-07-24 16:03:42.034952','29','MSI RTX 4060 8 GB GAMING X NV EDITION',1,'[{\"added\": {}}]',14,1),
(44,'2024-07-24 16:05:29.261699','30','ASUS PROART RTX 4060 OC 8 GB',1,'[{\"added\": {}}]',14,1),
(45,'2024-07-24 16:12:52.545259','31','ASUS RTX-3060 DUAL OC V2 12 GB',1,'[{\"added\": {}}]',14,1),
(46,'2024-07-24 16:14:20.339290','32','MSI GEF RTX 3050 VENTUS 2X OC 6 GB',1,'[{\"added\": {}}]',14,1),
(47,'2024-07-24 16:16:13.212667','33','ASUS RTX 3050 DUAL OC AUTO EX 6 GB',1,'[{\"added\": {}}]',14,1),
(48,'2024-07-24 16:17:49.900301','34','ASUS TUF RTX 4080 SUPER GAMING OC 16 GB',1,'[{\"added\": {}}]',14,1),
(49,'2024-07-24 16:19:11.344898','35','MSI RTX-3050 LP OC 6GB',1,'[{\"added\": {}}]',14,1),
(50,'2024-07-24 16:21:37.281886','36','MSI GEF RTX 4060 TI GAMING X SLIM 16 GB',1,'[{\"added\": {}}]',14,1),
(51,'2024-07-24 16:23:31.890627','37','NVIDIA GEFORCE ASUS GT 710 SILENT DDR5 2 GB',1,'[{\"added\": {}}]',14,1),
(52,'2024-07-24 16:52:10.653092','38','Apple Macbook Pro Apple M3 Max 16 Núcleos/48GB/1TB SSD',1,'[{\"added\": {}}]',14,1),
(53,'2024-07-24 16:54:49.990937','39','Apple Macbook Air Apple M2/16GB/512GB SSD',1,'[{\"added\": {}}]',14,1),
(54,'2024-07-24 16:57:02.222552','40','Apple MacBook Air Apple M1/8GB/256GB SSD',1,'[{\"added\": {}}]',14,1),
(55,'2024-07-24 17:00:05.026669','41','Microsoft Surface Laptop 5 Intel Evo Core i7-1255U/8GB/256GB SSD',1,'[{\"added\": {}}]',14,1),
(56,'2024-07-24 17:03:08.137256','42','Acer Predator Triton 500 SE Intel Core i7-11800H/32GB/1TB/RTX 3080',1,'[{\"added\": {}}]',14,1),
(57,'2024-07-24 17:05:54.055356','43','MSI Vector 16  Intel Core i9/32GB/1TB/RTX 4080',1,'[{\"added\": {}}]',14,1),
(58,'2024-07-24 17:08:54.166371','44','MSI Stealth GS77 12UHS-086ES Intel Core i7-12/32GB/1TB/RTX 3080Ti',1,'[{\"added\": {}}]',14,1),
(59,'2024-07-24 17:36:39.889334','45','ASUS ROG Zephyrus G16 OLED 29W Intel Core Ultra 9/32GB/2TB/RTX 4090',1,'[{\"added\": {}}]',14,1),
(60,'2024-07-24 17:39:32.631786','46','ASUS TUF Gaming F15  Intel Core i7/16GB/1TB/RTX 4060',1,'[{\"added\": {}}]',14,1),
(61,'2024-07-24 17:42:15.311311','47','ASUS ROG Zephyrus Duo 16 AMD Ryzen 9/64GB/4TB/RTX 3080 Ti',1,'[{\"added\": {}}]',14,1),
(62,'2024-07-24 17:45:45.784871','48','MSI Raider Intel Core i7/32GB/1TB/RTX 3080Ti',1,'[{\"added\": {}}]',14,1),
(63,'2024-07-24 17:49:50.579560','49','Gigabyte AERO 17 Intel Core i7/16GB/2TB/RTX 3070Ti',1,'[{\"added\": {}}]',14,1),
(64,'2024-07-24 18:16:56.356040','4','Keyboard',1,'[{\"added\": {}}]',13,1),
(65,'2024-07-24 18:18:31.480530','50','LOGITECH PRO X 60 LIGHTSPEED SW BROWN',1,'[{\"added\": {}}]',14,1),
(66,'2024-07-24 18:20:26.266258','51','LOGITECH G915 RGB MECHANIC',1,'[{\"added\": {}}]',14,1),
(67,'2024-07-24 18:22:29.737465','52','LOGITECH PRO X TKL LIGHTSPEED US SW BROWN',1,'[{\"added\": {}}]',14,1),
(68,'2024-07-24 18:24:11.135662','53','RAZER HUNTSMAN MINI 60% MERCURY ING SW',1,'[{\"added\": {}}]',14,1),
(69,'2024-07-24 18:26:16.150048','54','RAZER BLACKWIDOW V4 X SW YELLOW',1,'[{\"added\": {}}]',14,1),
(70,'2024-07-24 18:27:46.521108','55','LOGITECH G PRO RGB LIGHTSYNC SW BLUE',1,'[{\"added\": {}}]',14,1),
(71,'2024-07-24 18:29:23.197830','56','KINGSTON HYPERX ALLOY ELITE 2 RGB-RED',1,'[{\"added\": {}}]',14,1),
(72,'2024-07-24 18:31:02.631403','57','RAZER TARTARUS V2 RGB',1,'[{\"added\": {}}]',14,1),
(73,'2024-07-24 18:33:18.702888','58','LOGITECH POP KEYS YELLOW',1,'[{\"added\": {}}]',14,1),
(74,'2024-07-24 18:35:13.055896','59','REDRAGON FIZZ PRO K616 RGB',1,'[{\"added\": {}}]',14,1),
(75,'2024-07-24 18:37:28.109441','60','RAZER ORNATA V3 X LP RGB',1,'[{\"added\": {}}]',14,1),
(76,'2024-07-24 19:22:19.657078','1','Jpc Store',1,'[{\"added\": {}}]',11,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES
(8,'account','emailaddress'),
(9,'account','emailconfirmation'),
(1,'admin','logentry'),
(3,'auth','group'),
(2,'auth','permission'),
(4,'auth','user'),
(5,'contenttypes','contenttype'),
(6,'sessions','session'),
(7,'sites','site'),
(10,'socialaccount','socialaccount'),
(11,'socialaccount','socialapp'),
(12,'socialaccount','socialtoken'),
(15,'store','cart'),
(13,'store','category'),
(14,'store','product');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES
(1,'contenttypes','0001_initial','2024-07-24 11:23:37.420427'),
(2,'auth','0001_initial','2024-07-24 11:23:37.788060'),
(3,'account','0001_initial','2024-07-24 11:23:37.882076'),
(4,'account','0002_email_max_length','2024-07-24 11:23:37.905613'),
(5,'account','0003_alter_emailaddress_create_unique_verified_email','2024-07-24 11:23:37.936206'),
(6,'account','0004_alter_emailaddress_drop_unique_email','2024-07-24 11:23:37.982116'),
(7,'account','0005_emailaddress_idx_upper_email','2024-07-24 11:23:37.989981'),
(8,'account','0006_emailaddress_lower','2024-07-24 11:23:37.998383'),
(9,'account','0007_emailaddress_idx_email','2024-07-24 11:23:38.031451'),
(10,'account','0008_emailaddress_unique_primary_email_fixup','2024-07-24 11:23:38.040813'),
(11,'account','0009_emailaddress_unique_primary_email','2024-07-24 11:23:38.046333'),
(12,'admin','0001_initial','2024-07-24 11:23:38.120334'),
(13,'admin','0002_logentry_remove_auto_add','2024-07-24 11:23:38.128827'),
(14,'admin','0003_logentry_add_action_flag_choices','2024-07-24 11:23:38.137607'),
(15,'contenttypes','0002_remove_content_type_name','2024-07-24 11:23:38.188901'),
(16,'auth','0002_alter_permission_name_max_length','2024-07-24 11:23:38.221199'),
(17,'auth','0003_alter_user_email_max_length','2024-07-24 11:23:38.242242'),
(18,'auth','0004_alter_user_username_opts','2024-07-24 11:23:38.250272'),
(19,'auth','0005_alter_user_last_login_null','2024-07-24 11:23:38.281374'),
(20,'auth','0006_require_contenttypes_0002','2024-07-24 11:23:38.283312'),
(21,'auth','0007_alter_validators_add_error_messages','2024-07-24 11:23:38.289563'),
(22,'auth','0008_alter_user_username_max_length','2024-07-24 11:23:38.307023'),
(23,'auth','0009_alter_user_last_name_max_length','2024-07-24 11:23:38.327624'),
(24,'auth','0010_alter_group_name_max_length','2024-07-24 11:23:38.350428'),
(25,'auth','0011_update_proxy_permissions','2024-07-24 11:23:38.356696'),
(26,'auth','0012_alter_user_first_name_max_length','2024-07-24 11:23:38.373833'),
(27,'sessions','0001_initial','2024-07-24 11:23:38.402554'),
(28,'sites','0001_initial','2024-07-24 11:23:38.413878'),
(29,'sites','0002_alter_domain_unique','2024-07-24 11:23:38.431801'),
(30,'socialaccount','0001_initial','2024-07-24 11:23:38.726904'),
(31,'socialaccount','0002_token_max_lengths','2024-07-24 11:23:38.780817'),
(32,'socialaccount','0003_extra_data_default_dict','2024-07-24 11:23:38.790047'),
(33,'socialaccount','0004_app_provider_id_settings','2024-07-24 11:23:38.866905'),
(34,'socialaccount','0005_socialtoken_nullable_app','2024-07-24 11:23:38.962164'),
(35,'socialaccount','0006_alter_socialaccount_extra_data','2024-07-24 11:23:39.003331'),
(36,'store','0001_initial','2024-07-24 11:23:39.124252'),
(37,'store','0002_alter_product_primary_img_alter_product_second_img','2024-07-24 14:00:17.857149');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES
('clsyulbah0889pbke8fxgltgxabaj03q','.eJxVjM0KgzAQhN9lzyWYTaCJx977BEXCJrsa-xPB6Kn03avgxdMM883MF1KmJXykVhqkQvvoLhBoXXJYq8xhZGhBwymLlF5SdsBPKsOk0lSWeYxqr6iDVnWfWN63o3s6yFTzto6SrhYdpx6p2VR6qzUyUvQGtTbCRJEcWe82w41xRrMz2LBN3iHC7w_Ixj72:1sWa7J:a8qSe_ZQ9eqX_qKPXEzWE246pjEICPENN9Y4mSQnP6o','2024-08-07 11:25:09.764864');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_site`
--

DROP TABLE IF EXISTS `django_site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_site` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domain` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_site_domain_a2e37b91_uniq` (`domain`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_site`
--

LOCK TABLES `django_site` WRITE;
/*!40000 ALTER TABLE `django_site` DISABLE KEYS */;
INSERT INTO `django_site` VALUES
(1,'example.com','example.com');
/*!40000 ALTER TABLE `django_site` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `socialaccount_socialaccount`
--

DROP TABLE IF EXISTS `socialaccount_socialaccount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `socialaccount_socialaccount` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `provider` varchar(200) NOT NULL,
  `uid` varchar(191) NOT NULL,
  `last_login` datetime(6) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `extra_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`extra_data`)),
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `socialaccount_socialaccount_provider_uid_fc810c6e_uniq` (`provider`,`uid`),
  KEY `socialaccount_socialaccount_user_id_8146e70c_fk_auth_user_id` (`user_id`),
  CONSTRAINT `socialaccount_socialaccount_user_id_8146e70c_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `socialaccount_socialaccount`
--

LOCK TABLES `socialaccount_socialaccount` WRITE;
/*!40000 ALTER TABLE `socialaccount_socialaccount` DISABLE KEYS */;
/*!40000 ALTER TABLE `socialaccount_socialaccount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `socialaccount_socialapp`
--

DROP TABLE IF EXISTS `socialaccount_socialapp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `socialaccount_socialapp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `provider` varchar(30) NOT NULL,
  `name` varchar(40) NOT NULL,
  `client_id` varchar(191) NOT NULL,
  `secret` varchar(191) NOT NULL,
  `key` varchar(191) NOT NULL,
  `provider_id` varchar(200) NOT NULL,
  `settings` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`settings`)),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `socialaccount_socialapp`
--

LOCK TABLES `socialaccount_socialapp` WRITE;
/*!40000 ALTER TABLE `socialaccount_socialapp` DISABLE KEYS */;
INSERT INTO `socialaccount_socialapp` VALUES
(1,'google','Jpc Store','162831051128-6ki2g8k0llb1525nclkjok72r94189f8.apps.googleusercontent.com','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','','','{}');
/*!40000 ALTER TABLE `socialaccount_socialapp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `socialaccount_socialapp_sites`
--

DROP TABLE IF EXISTS `socialaccount_socialapp_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `socialaccount_socialapp_sites` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `socialapp_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `socialaccount_socialapp_sites_socialapp_id_site_id_71a9a768_uniq` (`socialapp_id`,`site_id`),
  KEY `socialaccount_socialapp_sites_site_id_2579dee5_fk_django_site_id` (`site_id`),
  CONSTRAINT `socialaccount_social_socialapp_id_97fb6e7d_fk_socialacc` FOREIGN KEY (`socialapp_id`) REFERENCES `socialaccount_socialapp` (`id`),
  CONSTRAINT `socialaccount_socialapp_sites_site_id_2579dee5_fk_django_site_id` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `socialaccount_socialapp_sites`
--

LOCK TABLES `socialaccount_socialapp_sites` WRITE;
/*!40000 ALTER TABLE `socialaccount_socialapp_sites` DISABLE KEYS */;
INSERT INTO `socialaccount_socialapp_sites` VALUES
(1,1,1);
/*!40000 ALTER TABLE `socialaccount_socialapp_sites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `socialaccount_socialtoken`
--

DROP TABLE IF EXISTS `socialaccount_socialtoken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `socialaccount_socialtoken` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` longtext NOT NULL,
  `token_secret` longtext NOT NULL,
  `expires_at` datetime(6) DEFAULT NULL,
  `account_id` int(11) NOT NULL,
  `app_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `socialaccount_socialtoken_app_id_account_id_fca4e0ac_uniq` (`app_id`,`account_id`),
  KEY `socialaccount_social_account_id_951f210e_fk_socialacc` (`account_id`),
  CONSTRAINT `socialaccount_social_account_id_951f210e_fk_socialacc` FOREIGN KEY (`account_id`) REFERENCES `socialaccount_socialaccount` (`id`),
  CONSTRAINT `socialaccount_social_app_id_636a42d7_fk_socialacc` FOREIGN KEY (`app_id`) REFERENCES `socialaccount_socialapp` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `socialaccount_socialtoken`
--

LOCK TABLES `socialaccount_socialtoken` WRITE;
/*!40000 ALTER TABLE `socialaccount_socialtoken` DISABLE KEYS */;
/*!40000 ALTER TABLE `socialaccount_socialtoken` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `store_cart`
--

DROP TABLE IF EXISTS `store_cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `store_cart` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `quantity` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `store_cart_user_id_99e99107_fk_auth_user_id` (`user_id`),
  KEY `store_cart_product_id_b219c080_fk_store_product_id` (`product_id`),
  CONSTRAINT `store_cart_product_id_b219c080_fk_store_product_id` FOREIGN KEY (`product_id`) REFERENCES `store_product` (`id`),
  CONSTRAINT `store_cart_user_id_99e99107_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store_cart`
--

LOCK TABLES `store_cart` WRITE;
/*!40000 ALTER TABLE `store_cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `store_cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `store_category`
--

DROP TABLE IF EXISTS `store_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `store_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store_category`
--

LOCK TABLES `store_category` WRITE;
/*!40000 ALTER TABLE `store_category` DISABLE KEYS */;
INSERT INTO `store_category` VALUES
(1,'Processor'),
(2,'Graphics Card'),
(3,'Laptops'),
(4,'Keyboard');
/*!40000 ALTER TABLE `store_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `store_product`
--

DROP TABLE IF EXISTS `store_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `store_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `price` int(11) NOT NULL,
  `brand` varchar(200) NOT NULL,
  `description` longtext NOT NULL,
  `primary_img` varchar(100) NOT NULL,
  `second_img` varchar(100) NOT NULL,
  `stock` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `store_product_category_id_574bae65_fk_store_category_id` (`category_id`),
  CONSTRAINT `store_product_category_id_574bae65_fk_store_category_id` FOREIGN KEY (`category_id`) REFERENCES `store_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store_product`
--

LOCK TABLES `store_product` WRITE;
/*!40000 ALTER TABLE `store_product` DISABLE KEYS */;
INSERT INTO `store_product` VALUES
(8,'AMD Ryzen 7 5800X 3.8GHz',750000,'AMD','The processor that allows you to enjoy an elite gaming experience. Eight cores optimized for high FPS gaming computers.\r\n\r\nWelcome to the world of the AMD Ryzen 7 5800X processor. This device is a marvel for users who demand top performance and processing speed.\r\n\r\nThis processor features a base clock speed of 3.8GHz, meaning you can efficiently and swiftly handle complex tasks. Additionally, its 8-core, 16-thread architecture enables you to multitask without compromising performance.\r\n\r\nThe AMD Ryzen 7 5800X 3.8GHz is an excellent choice for those seeking high-level performance in both applications and games. Its multi-core processing capability, 3.8GHz clock frequency, and innovative AMD technology deliver a smooth and efficient user experience.\r\n\r\nFeatures:\r\nAMD StoreMI Technology: Software that combines SSD speed with HDD capacity into a single, fast, and easy-to-manage unit, free with AMD Series 400 motherboards.\r\nAMD Ryzen™ Master Utility: Simple yet powerful overclocking utility for AMD Ryzen™ processors.\r\nAMD Ryzen™ VR-Ready Premium: For users demanding a premium VR experience, AMD offers high-performance Ryzen™ VR-Ready Premium processors.','products/p1.png','products/p1_Z520wBJ.png',100,1),
(9,'AMD RYZEN 5 8500G',890000,'AMD','AMD Ryzen™ 5 8500G\r\n\r\nFamily: Ryzen\r\nSeries: Ryzen 8000 Series\r\nForm Factor: Desktop Computers\r\nAMD PRO Technologies: No\r\nConsumer Use: Yes\r\nRegional Availability: Global\r\nPrevious Codename: Phoenix\r\nArchitecture: 2x Zen 4, 4x Zen 4c\r\nCPU Core Count: 6\r\nSimultaneous Multithreading (SMT): Yes\r\nNumber of Threads: 12\r\nMax Turbo Clock: Up to 5 GHz\r\nMax Zen C Clock: Up to 3.7 GHz\r\nBase Clock: 3.5 GHz\r\nZen4 Base Clock: 4.1 GHz\r\nZen C Base Clock: 3.2 GHz\r\nL2 Cache: 6 MB\r\nL3 Cache: 16 MB\r\nDefault TDP: 65W\r\nConfigurable TDP from AMD (cTDP): 45-65W\r\nCPU Processor Technology: TSMC 4nm FinFET\r\nCPU Processing Chip Size (CCD): 137mm²\r\nPackage Chip Count: 1\r\nAMD EXPO™ Memory Overclocking Technology: Yes\r\nPrecision Boost Overdrive: Yes\r\nCurve Optimizer Voltage Compensation: Yes\r\nAMD Ryzen™ Master Support: Yes\r\nCPU Socket: AM5\r\nCPU Boost Technology: Precision Boost 2\r\nInstruction Set Extensions: x86-64\r\nCompatible Extensions: AES, AMD-V, AVX, AVX2, AVX512, FMA3, MMX-plus, SHA, SSE, SSE2, SSE3, SSE4.1, SSE4.2, SSE4A, SSSE3, x86-64\r\nMaximum Operating Temperature (Tjmax): 95°C\r\nRelease Date: 1/31/2024\r\nSupported Operating Systems: Windows 11 – 64-Bit Edition, Windows 10 – 64-Bit Edition, RHEL x86 64-Bit, Ubuntu x86 64-Bit\r\nThis processor is designed for desktop use, featuring 6 cores and 12 threads with advanced technologies like Precision Boost Overdrive and AMD Ryzen™ Master support, suitable for a range of applications including gaming and multitasking.','products/p2.png','products/p22.png',100,1),
(10,'INTEL CORE I9-14900KS 24 CORES',3450000,'Intel','Intel Core i9-14900KS 24 Cores (8 P-Cores + 16 E-Cores)\r\n\r\nPlay harder and work smarter with 14th generation Intel Core processors\r\n24 cores (8 P-cores + 16 E-cores) and 32 threads. Includes integrated Intel UHD 770 graphics\r\nUp to 5.9 GHz with Turbo Boost Max 3.0 technology delivers smooth gaming, high frame rates, and quick response\r\nCompatible with Intel 600 series (with possible BIOS update) or chipset-based 700 series motherboards\r\nSupports DDR4 and DDR5 platforms to reduce loading times and provide space for running the most demanding games\r\nThis processor is designed to offer high performance for gaming and intensive workloads, featuring a mix of performance and efficiency cores, integrated graphics, and support for both DDR4 and DDR5 memory technologies.','products/p3.png','products/p33.png',100,1),
(11,'AMD Ryzen Threadripper PRO 7995WX 2.5/5.1GHz',48250000,'AMD','Designed for today\'s enterprises, AMD PRO technologies offer a comprehensive suite of security features, robust manageability tools, and enterprise-level stability and reliability. Featuring a rich set of management capabilities, they simplify deployment, image creation, and fleet administration for rapidly growing and changing environments. Whether devices are managed within a network or via cloud-based management tools, AMD PRO manageability provides a unified set of tools for organizations, available from deployment to decommissioning.\r\n\r\nFeatures:\r\n\r\nFlexibility and Vendor Options: Open standard features for both wired and wireless devices. Wireless compatibility for up to 33 DASH profiles.\r\nSeamless Deployment: Supports cloud-based configuration technologies like Windows Autopilot.\r\nSimplified Scalable Management: Out-of-band and in-band manageability support, such as Microsoft Endpoint Manager.\r\nSpecifications AMD Ryzen Threadripper PRO 7995WX:\r\n\r\nProcessor:\r\n\r\nProcessor Manufacturer: AMD\r\nProcessor Model: 7995WX\r\nProcessor Base Frequency: 2.5 GHz\r\nProcessor Family: AMD Ryzen Threadripper PRO\r\nNumber of Processor Cores: 96\r\nProcessor Socket: Socket sTR5\r\nProcessor Lithography: 5 nm\r\nNumber of Threads: 192\r\nProcessor Turbo Frequency: 5.1 GHz\r\nProcessor Cache: 384 MB\r\nCache Type: L3\r\nThermal Design Power (TDP): 350 W\r\nBoxed: Yes\r\nCooler Included: No\r\nMemory:\r\n\r\nSupported Memory Types: DDR5-SDRAM\r\nMemory Channels: Eight Channels\r\nGraphics:\r\n\r\nIntegrated Graphics Adapter: No\r\nDiscrete Graphics Adapter: No\r\nIntegrated Graphics Model: Not applicable\r\nDiscrete Graphics Model: Not applicable\r\nFeatures:\r\n\r\nMarket Segment: Desktop\r\nPCI Express Entry Version: 5.0\r\nSupported Operating Systems: Windows 11 x64, RHEL x86 64-bit, Ubuntu x86 64-bit\r\nThis powerful processor is designed to meet the demanding needs of modern enterprises, offering unparalleled performance, manageability, and security features essential for business environments.','products/P4.png','products/P44.png',100,1),
(12,'AMD Ryzen Threadripper PRO 5965WX 3.8GHz/4.5GHz',9100000,'AMD','Aquí tienes un resumen en inglés basado en la información proporcionada:\r\n\r\nThe Ryzen Threadripper PRO 5000 WX-Series processors combine the incredible performance of the \"Zen 3\" architecture with enterprise-grade security features, ease of management, and scalability of AMD PRO technologies.\r\n\r\nWith higher frequencies and an enhanced L3 cache architecture, the new Ryzen Threadripper PRO processors enable users to handle the most demanding workloads.\r\n\r\nFeatures:\r\n\r\nTotal Redesign: The \"Zen 3\" architecture represents the most comprehensive redesign of the \"Zen\" era, incorporating over 20 fundamental changes. It features wider and more flexible execution resources, significantly increased load/store bandwidth to enable faster execution, and an optimized user interface for incorporating more threads and processing them faster.\r\n\r\nIncreased Instructions per Clock (IPC): The \"Zen 3\" architecture extracts an average of 19% additional performance per MHz compared to the previous generation, marking a historic IPC improvement and a key player in delivering unprecedented single-core performance.\r\n\r\nLower Latency: The \"Zen 3\" architecture transitions to a new \"unified complex\" design that integrates 8 cores and 32 MB of L3 cache into a single resource pool. This significantly reduces core-to-core and core-to-cache latencies by minimizing communication time between adjacent elements. Latency-sensitive tasks, such as PC gaming, particularly benefit from this change as tasks now have direct access to twice the L3 cache compared to the \"Zen 2\" architecture.\r\n\r\nThe King of the Hill: The combination of higher IPC and the unified complex of 8 cores provides a potent combination for gaming. Customers upgrading from AMD Ryzen™ 3000 series to the 5000 series can expect up to 26% better gaming performance at 1080p. Moreover, processors featuring the \"Zen 3\" architecture, like the AMD Ryzen™ 9 5900X, are considered the best in the world for PC gaming.\r\n\r\nIncredible Efficiency: The performance improvements of the \"Zen 3\" architecture are achieved without an increase in power consumption or TDP. The combination of cutting-edge architecture and industry-leading 7nm technology gives the AMD Ryzen™ 5000 series processors a generational improvement of over 24% in energy efficiency, positioning them 2.8 times ahead of competing architectures.\r\n\r\nSpecifications:\r\n\r\nArchitecture: Zen 3\r\nCores: 8 (Unified Complex)\r\nL3 Cache: 32 MB\r\nIPC Improvement: 19%\r\nGaming Performance Improvement (from Ryzen 3000 series): up to 26% at 1080p\r\nEnergy Efficiency Improvement: over 24% compared to previous generations','products/P5.png','products/P55.png',100,1),
(13,'Intel Core i9-10980XE 3 GHz Extreme Edition',5950000,'Intel','Intel® Optane Memory is a groundbreaking type of non-volatile memory positioned between system memory and storage, designed to accelerate system performance and responsiveness. When combined with the Intel® Rapid Storage Technology controller, it seamlessly manages multiple storage tiers while presenting a single virtual drive to the operating system. This setup optimizes access to frequently used data by placing it in the fastest storage tier available.\r\n\r\nFeatures:\r\n\r\nIntel® Turbo Boost Technology: Dynamically increases processor frequency as needed, leveraging thermal and power headroom to provide a speed boost when required, and enhanced energy efficiency when idle.\r\nIntel® Hyper-Threading Technology: Provides two processing threads per physical core. Applications with many threads can perform more work in parallel, completing tasks faster.\r\nIntel® Virtualization Technology (VT-x): Enables a platform to function as multiple virtual platforms, improving manageability by isolating computing activities in separate partitions, thus reducing downtime and maintaining productivity.\r\nIntel® Virtualization Technology for Directed I/O (VT-d): Enhances virtualization by providing additional support for virtualization of I/O devices. This technology improves security, reliability, and performance of I/O devices in a virtualized environment.\r\nIntel® 64: Intel® 64 architecture delivers 64-bit computing on platforms for servers, workstations, PCs, and laptops when combined with compatible software. It enhances performance by enabling systems to address more than 4 GB of physical and virtual memory.\r\nInstruction Set Extensions: Refers to the basic set of commands a microprocessor understands and executes. This processor supports Intel\'s instruction sets to enhance performance on repetitive tasks across multiple data objects.\r\nAVX-512 FMA Units: Intel® Advanced Vector Extensions 512 (AVX-512) are advanced instruction set extensions that offer wide vector operations (512 bits) with up to 2 FMA (fused multiply-add instructions), accelerating performance for demanding computational tasks.\r\nIntel® SpeedStep® Technology: Provides advanced means to achieve high performance while meeting the energy conservation needs of portable systems. It adjusts voltage and frequency levels in response to processor load, optimizing power usage without sacrificing performance.\r\nIntel® Deep Learning Boost (Intel® DL Boost): A new set of integrated processor technologies designed to accelerate deep learning AI use cases. It extends Intel AVX-512 with Vector Neural Network Instructions (VNNI) to significantly enhance performance in deep learning inference tasks compared to previous generations.','products/P6.png','products/P66.png',100,1),
(14,'AMD Ryzen Threadripper 2920X 3.5GHz',4150000,'AMD','AMD Ryzen Threadripper 2920X is a powerhouse designed for the most demanding gamers and creators.\r\n\r\nWith 12 cores delivering incredible simultaneous multiprocessing power of 24 threads and 32MB of L3 cache, the AMD X399 enthusiast-level platform is set to outperform all competitors.\r\n\r\nBest Desktop Platform:\r\nThe AMD X399 chipset supports both 1st and 2nd generation AMD Ryzen Threadripper processors (BIOS update may be required). Built for creators who game and gamers who create, the expandable AMD X399 chipset offers unprecedented expansion for NVMe RAID and multiple high-end GPUs. Meanwhile, four-channel DDR4 memory support, ECC compatibility, and unlocked overclocking capabilities make the X399 platform irresistible for users who rely on true computing power.\r\n\r\nSetting New Standards for Performance and Efficiency:\r\nAMD\'s high-performance \"Zen\" x86 core architecture delivers over 52% improvement in instructions per clock cycle compared to AMD\'s previous generation cores.\r\n\r\nThe 2nd generation Ryzen processors further enhance performance with the \"Zen+\" architecture improvements, marking it as the first desktop processor on the advanced 12nm process node.\r\n\r\nAMD SenseMI Technology. Technology with a Thought:\r\nAMD SenseMI technology is a suite of learning and adaptation features that customize AMD Ryzen processor performance based on user and application needs, utilizing true machine intelligence (MI). In summary, it offers thoughtful performance.\r\n\r\nAMD Ryzen Master. Your Tool to Unlock AMD Ryzen Processors:\r\nEvery AMD Ryzen processor comes with an unlocked multiplier out of the box, allowing users to customize performance to their liking. AMD provides the AMD Ryzen Master utility to access this powerful advantage.\r\n\r\nThis combination of robust hardware and intelligent software features makes the AMD Ryzen Threadripper 2920X an ideal choice for enthusiasts seeking unmatched performance and flexibility in their computing experience.','products/P7.png','products/P77.png',100,1),
(15,'Intel Core i9-12900K 3.2 GHz',1650000,'Intel','The Intel® Core™ i9-12900K is a 12th generation unlocked desktop processor designed for enthusiasts and serious creators, featuring Intel® Turbo Boost Max 3.0 technology and support for PCIe Gen 5.0 and 4.0. It offers compatibility with both DDR5 and DDR4 memory, providing high-speed memory support for enhanced performance. Note that a thermal solution is not included in the box.\r\n\r\nSpecifications:\r\n\r\nSocket Base: LGA 1700\r\nFrequency (GHz): Base 3.2 GHz\r\nIntel® Smart Cache (L3) Size: 30 MB\r\nProcessor Cores (P-cores + E-cores): 16 (8 Performance cores + 8 Efficiency cores)\r\nProcessor Threads: 24\r\nMemory Speed Support:\r\nDDR4: Up to 4800 MHz\r\nDDR5: Up to 3200 MHz\r\nIntel® Turbo Boost Technology 2.0 (single core) Frequency (GHz): Up to 5.1\r\nIntel® Turbo Boost Max Technology 3.0 Frequency (GHz): Up to 5.2\r\nTotal PCIe Lanes: Yes\r\nPCIe Support: Gen 5.0, Gen 4.0, Gen 3.0\r\nUnlocked: Yes (for overclocking)\r\nChipset Compatibility: Intel® 600 Series Chipset\r\nProcessor Graphics: Intel® UHD Graphics 770 (integrated)\r\nIntegrated Memory Controller: Dual-channel\r\nProcessor Base Power (W): 125W\r\nIntel® SIPP: Yes (Stable Image Platform Program)\r\nIntel® vPro™ Technology: Yes (platform security and manageability capabilities)\r\nISM (Intel® Stable Image Platform): Yes (enhanced platform stability for IT management)\r\nThis processor is optimized to deliver high performance across a wide range of applications, from gaming to intensive creative tasks, leveraging Intel\'s latest technologies for superior speed, efficiency, and overclocking potential. Its compatibility with both DDR4 and DDR5 memory ensures flexibility in memory configurations, while PCIe Gen 5.0 support offers future-proof connectivity options for high-bandwidth devices.','products/P8.png','products/P88.png',100,1),
(16,'AMD Ryzen 7 5800X3D 3.4GHz',1450000,'AMD','AMD Ryzen™ serie 5000 processors for desktops represent the pinnacle of performance for both gamers and content creators alike. Whether you\'re playing the latest games, designing future skyscrapers, or processing data-intensive tasks, you need a powerful processor that can meet these demands and more. The AMD Ryzen™ series 5000 processors elevate expectations with cutting-edge desktop processor architecture.\r\n\r\nKey Features:\r\n\r\nPlay on Windows® 11: AMD-powered PCs offer the best gaming experience on Windows® 11, ensuring smooth gameplay and compatibility with the latest operating system features.\r\n\r\nAMD 3D V-Cache™ Technology: This innovative technology stacks L3 cache in a 3D configuration, boosting gaming performance significantly. The AMD Ryzen™ 7 5800X3D is the world\'s first desktop processor with stacked L3 cache, providing an unprecedented 96 MB of L3 cache paired with incredibly fast cores, making it the fastest desktop gaming processor in the world.\r\n\r\nAMD StoreMI Technology: Enhances storage performance by combining the speed of SSDs with the capacity of hard drives into a single fast and easy-to-manage unit. This software is free with AMD 400 Series motherboards, offering seamless integration and improved data management capabilities.\r\n\r\nAMD \"Zen 3\" Core Architecture: Featuring the world\'s fastest cores for PC gamers, the \"Zen 3\" architecture delivers exceptional single-threaded and multi-threaded performance, ensuring smooth gaming and multitasking experiences.\r\n\r\nAMD Ryzen™ VR-Ready Premium: For users demanding a premium virtual reality experience, AMD offers specially designed Ryzen™ VR-Ready Premium processors. These high-performance processors are optimized to handle the demands of immersive VR environments seamlessly.\r\n\r\nOverall, AMD Ryzen™ series 5000 processors set new standards in desktop computing with their advanced features, unparalleled gaming performance, and robust capabilities for content creation and multitasking. Whether you\'re a gamer pushing the limits of gaming performance or a creator needing powerful processing capabilities, these processors are designed to exceed expectations.','products/P9.png','products/P99.png',100,1),
(17,'AMD Ryzen 7 7700X 4.5 GHz',1345000,'AMD','AMD is proud to introduce the AMD Ryzen™ 7000 series, setting a new benchmark as the most advanced desktop processors for gamers and creators. Enter a new era of performance with the AMD Ryzen 7000 series, leveraging the incredible speed of \"Zen 4\" architecture and raw power to handle any game or workflow with ease. These processors extend AMD\'s leadership in performance to empower your PC like never before.\r\n\r\nUnleash Gaming Power:\r\nFor gamers, the AMD Ryzen™ 7000 series allows you to focus on what matters most: winning in the digital battlefield. Whether you\'re diving into the latest releases or revisiting classics, these processors deliver overwhelming gaming power with high-performance \"Zen 4\" cores. Featuring up to 16 cores, 32 threads, maximum turbo speeds up to 5.7 GHz, and up to 80 MB of cache, AMD Ryzen 7000 series processors redefine gaming performance.\r\n\r\nCutting-Edge Technologies:\r\nWhether rendering highly detailed 3D scenes, exporting massive video files, or visualizing architectural dreams, AMD Ryzen™ 7000 series processors are designed to outpace the clock. They feature time-saving connectivity options like PCIe® 5.0 storage interface, blazing-fast WiFi® 6E, AMD EXPO™ technology for up to 32 threads, and dedicated video accelerators. Everything is enhanced with AMD Ryzen 7000 series processors.\r\n\r\nExperience \"Zen 4\" Performance and Speed:\r\nBuilt for effortless PC building, AMD Ryzen 7000 series processors integrate the latest technologies seamlessly. Highlights include DDR5 memory support, PCIe® 5.0 interface, one-touch memory overclocking with AMD EXPO™, and highly efficient 5 nm manufacturing technology. Place an AMD motherboard with Socket AM5 at the heart of your setup to dominate the games you love now and into the future. If your PC demands the newest and most powerful features, AMD Ryzen™ processors are your solution.\r\n\r\nThe AMD Ryzen™ 7000 series represents a leap forward in desktop computing, offering unparalleled performance, cutting-edge technologies, and a platform ready to tackle the challenges of modern gaming and content creation.','products/P10.png','products/P1010.png',100,1),
(18,'Intel Core i5-9500 3 GHz',1130000,'Intel','Intel® Optane™ Memory is a revolutionary type of non-volatile memory that sits between system memory and storage to accelerate system performance and responsiveness. When combined with the Intel® Rapid Storage Technology controller, it seamlessly manages multiple storage tiers while presenting a single virtual drive to the operating system, allowing frequently used data to reside in the fastest storage tier. Intel® Optane™ Memory requires specific hardware and software configuration.\r\n\r\nFeatures:\r\n\r\nIntel® Turbo Boost Technology: Intel® Turbo Boost dynamically increases the processor frequency when needed by taking advantage of thermal and power headroom to provide a speed boost when necessary, and energy efficiency when not.\r\n\r\nSuitability for Intel® vPro™ Platform: Intel® vPro™ Technology is a set of security and management capabilities built into the processor designed to address four key areas of IT security: 1) Threat management, including rootkit protection, viruses, and malware; 2) Identity and web site access point protection; 3) Protection of personal and business-sensitive data; 4) Remote and local monitoring, correction, and repair of PCs and workstations.\r\n\r\nIntel® Virtualization Technology (VT-x): Intel® VT-x allows a hardware platform to function as multiple virtual platforms. It provides improved manageability by limiting downtime and maintaining productivity through the isolation of computing activities into separate partitions.\r\n\r\nIntel® Virtualization Technology for Directed I/O (VT-d): Intel® VT-d extends existing virtualization support for IA-32 (VT-x) and Itanium® processor (VT-i) virtualization to include new capabilities for I/O device virtualization. Intel VT-d can enhance end-user security and system reliability, as well as improve I/O device performance in a virtualized environment.\r\n\r\nIntel® VT-x with Extended Page Tables (EPT): Intel® VT-x with Extended Page Tables, also known as Second Level Address Translation (SLAT), accelerates virtualized applications with memory-intensive workloads. Extended Page Tables on Intel® Virtualization Technology platforms reduce the additional memory and power overhead costs and increases battery life through hardware optimization of page table management.\r\n\r\nIntel® Transactional Synchronization Extensions – New Instructions (Intel® TSX-NI): Intel® TSX-NI is a set of instructions focused on scaling performance for multiple threads. This technology helps make parallel operations more efficient by enabling improved control of locks in software.\r\n\r\nIntel® 64: Intel® 64 architecture delivers 64-bit computing on server, workstation, PC, and laptop platforms when combined with compatible software.¹ Intel® 64 architecture enhances performance by allowing systems to address more than 4 GB of both physical and virtual memory.\r\n\r\nInstruction Set Extensions: Instruction Set Extensions are additional instructions that can increase performance when the same operations are performed on multiple data objects. These may include SSE (Streaming SIMD Extensions) and AVX (Advanced Vector Extensions).\r\n\r\nIdle States: Idle States (C-states) are used to save power when the processor is idle. C0 is the operational state, indicating that the CPU is functioning properly. C1 is the first idle state, C2 is the second, and so on, where higher-numbered C-states perform more power-saving actions.\r\n\r\nEnhanced Intel SpeedStep® Technology: Enhanced Intel SpeedStep® Technology is an advanced means of enabling high performance while meeting the need for energy conservation in portable systems. Traditional Intel SpeedStep® switches voltage and frequency in tandem between high and low levels in response to processor load. Enhanced Intel SpeedStep® Technology builds on this architecture using design strategies such as voltage and frequency separation, and clock partitioning and recovery.\r\n\r\nThermal Monitoring Technologies: Thermal Monitoring Technologies protect the processor package and system from thermal failures through several thermal management features. A Digital Thermal Sensor (DTS) within the die detects the core temperature, and thermal management features reduce package power consumption and thereby temperature when required to remain within normal operating limits.\r\n\r\nIntel® Identity Protection Technology: Intel® Identity Protection Technology is a built-in security token technology that helps provide a simple, tamper-resistant method for protecting access to your customer and business data from threats and fraud. Intel® Identity Protection Technology provides hardware-based evidence of a unique PC to websites, financial institutions, and network services, verifying that attempting to log in is not malware. Intel® Identity Protection Technology can be a key component in two-factor authentication solutions to protect your information on websites and business accounts.\r\n\r\nIntel® Stable Image Platform Program (SIPP): The Intel® Stable Image Platform Program can assist your business in identifying and deploying a standard, stable PC platform for at least 15 months.','products/P1111.png','products/P11.png',100,1),
(19,'AMD RYZEN 5 5500 4.2 GHZ',570000,'AMD','The AMD Ryzen 5 5500 is a desktop processor designed for mainstream computing tasks. Here are its specifications:\r\n\r\nPlatform: Desktop Computer\r\nProduct Family: AMD Ryzen™ Processors\r\nProduct Line: AMD Ryzen™ 5 Desktop Processors\r\nNumber of CPU Cores: 6\r\nNumber of Threads: 12\r\nMax Boost Clock: Up to 4.2GHz\r\nBase Clock: 3.6GHz\r\nTotal L1 Cache: 384KB\r\nTotal L2 Cache: 3MB\r\nTotal L3 Cache: 16MB\r\nTDP/Default TDP: 65W\r\nCPU Technology: TSMC 7nm FinFET\r\nUnlocked: Yes\r\nCPU Socket: AM4\r\nNumber of Sockets: 1P (Single Processor)\r\nThermal Solution (PIB): AMD Wraith Stealth\r\nMax Temperature: 90°C\r\nThis processor offers a balanced configuration with 6 cores and 12 threads, making it suitable for multitasking and moderate gaming. It supports overclocking (unlocked), and comes with AMD\'s Wraith Stealth cooler, which is sufficient for its thermal management within a maximum temperature of 90°C. The AM4 socket compatibility ensures it can be paired with a wide range of AM4 chipset motherboards.','products/P12.png','products/P1212.png',100,1),
(20,'INTEL CORE I3-12100F 4.30 GHZ',679000,'Intel','The Intel Core i3-12100F processor enhances your productivity, gaming, and content creation experiences when installed in your desktop computer system. Built on Alder Lake architecture with Intel 7 process, this 3.3 GHz Quad-Core 12th generation desktop processor supports up to 8 threads and delivers speed for applications and gaming. Additionally, this processor has a Boost 2.0 frequency of 4.3 GHz with 12 MB of cache for fast and reliable performance. The Core i3-12100F also includes support for PCIe 5.0 and dual-channel DDR5 memory at 4800 MHz to help run and multitask across a variety of applications. The Core i3-12100F does not include integrated graphics, meaning users will need to purchase a dedicated graphics card separately. An Intel Laminar RM1 thermal solution is included. The processor is compatible with Intel LGA 1700 socket motherboards.\r\n\r\nPCIe 4.0 and 5.0\r\n\r\nThis processor supports up to four PCIe 4.0 lanes and sixteen PCIe 5.0 lanes, providing a total of 20 lanes for exceptional data performance with compatible devices.\r\n\r\nIntel Deep Learning Boost\r\n\r\nAccelerates AI inference to improve performance for deep learning workloads.\r\n\r\nGaussian and Neural Accelerator 3.0\r\n\r\nThe Gaussian and Neural Accelerator 3.0 (GNA) technology aids in noise suppression while enhancing background blur during video chats.','products/P13.png','products/P1313.png',100,1),
(21,'INTEL CORE i5 14400 2,5 9,5M 10CORES',1229000,'Intel','Number of Cores: 10\r\nPerformance-cores: 6\r\nEfficient-cores: 4\r\nNumber of Threads: 16\r\nMax Turbo Frequency: 4.7 GHz\r\nMax Performance-core Turbo Frequency: 4.7 GHz\r\nMax Efficient-core Turbo Frequency: 3.5 GHz\r\nBase Performance-core Frequency: 2.5 GHz\r\nBase Efficient-core Frequency: 1.8 GHz\r\nCache: Intel® Smart Cache of 20 MB\r\nTotal L2 Cache: 9.5 MB\r\nProcessor Base Power: 65 watts\r\nMax Turbo Power: 148 watts\r\nAdditional Information:\r\n\r\nStatus: Launched\r\nLaunch Date: Q1’24\r\nIntegrated Options Available: Yes\r\nMemory Specifications:\r\n\r\nMax Memory Size (dependent on memory type): 192 GB\r\nMemory Types: Up to DDR5 4800 MT/s, Up to DDR4 3200 MT/s\r\nMax Number of Memory Channels: 2\r\nMax Memory Bandwidth: 76.8 GB/s\r\nGPU Specifications:\r\n\r\nGPU Name: Intel® UHD Graphics 730\r\nMax Dynamic Graphics Frequency: 1.55 GHz\r\nGraphics Output: eDP 1.4b, DP 1.4a, HDMI 2.1\r\nExecution Units: 24\r\nMax Resolution (HDMI): 4096 x 2160 @ 60 Hz\r\nMax Resolution (DP): 7680 x 4320 @ 60 Hz\r\nMax Resolution (eDP – Integrated Flat Panel): 5120 x 3200 @ 120 Hz\r\nDirectX* Support: 12\r\nOpenGL* Support: 4.5\r\nOpenCL* Support: 3.0\r\nMulti-Format Codec Engines: 1\r\nIntel® Quick Sync Video: Yes\r\nIntel® Clear Video HD Technology: Yes\r\nMax Supported Displays: 4\r\nDevice ID: 0x4682/0xA782','products/p14.png','products/p1414.png',100,1),
(22,'AMD RYZEN 7 8700G 4,2 8 CORE RADEON AM5',1580000,'AMD','General Specifications:\r\n\r\nRegional Availability: Global\r\nPlatform: Desktop Computer\r\nProduct Family: AMD Ryzen™ Processors\r\nProduct Line: AMD Ryzen™ 7 8000 Series G Desktop Processors with Radeon™ Graphics\r\nNumber of CPU Cores: 8\r\nNumber of Threads: 16\r\nMax Boost Clock: Up to 5.1 GHz\r\nBase Clock: 4.2 GHz\r\nTotal L2 Cache: 8 MB\r\nTotal L3 Cache: 16 MB\r\nTDP/Default TDP: 65W\r\nAMD Configurable TDP (cTDP): 45-65W\r\nCPU Core Technology: 4 nm TSMC FinFET\r\nUnlocked: Yes\r\nPackage: AM5\r\nMax Temperature: 95°C\r\nSupported Operating Systems: Windows 11 – 64-bit edition, Windows 10 – 64-bit edition, RHEL x86 – 64-bit edition, Ubuntu x86 – 64-bit edition. *Operating system support (OS) may vary by manufacturer.\r\nThis processor combines high-performance CPU cores with integrated Radeon™ graphics, making it suitable for both gaming and demanding computing tasks on desktop systems.','products/P15.png','products/P1515.png',100,1),
(23,'MSI GEFORCE RTX-4090 GAMING TRIO RGB 24 GB',9550000,'MSI','MSI has designed the GAMING series as the preferred graphics card solution for all types of gamers, including adventurers, esports competitors, and live streamers. The GAMING series reflects both the spirit of gamers and the intense performance of the cards with a stylized exterior featuring colorful RGB lighting and bold edges.\r\n\r\nTORX FAN 5.0 represents the culmination of fan design improvements to increase pressure and airflow through the heatsink. Anular arcs unite three sets of fan blades angled 22 degrees together to maintain high-pressure airflow even at lower rotational speeds, resulting in a +23% airflow compared to axial fans.\r\n\r\nA fan guard extends slightly beyond the general compartment to lengthen the wind passage, allowing airflow to stabilize and move smoothly through the fans. Bulging notches under the hood help reduce recirculation, further enhancing airflow stability and reducing noise.\r\n\r\nHeat from the GPU and memory modules is immediately captured by a solid nickel-plated copper baseplate and swiftly transferred to a set of heat pipes. This expansion of thermal transfer systems with highly effective mechanisms improves overall efficiency.\r\n\r\nThe Core Pipes are precision-engineered to maximize available space. A square section of heat pipes fully contacts the vapor chamber to evenly distribute heat along the heatsink.\r\n\r\nAirflow control enhances airflow dynamics through Wave Curved 2.0, updated deflectors, and Air Antegrade fin design to optimize the balance between cooling and quieter acoustics.\r\n\r\nV-shaped notched fins are positioned in the airflow path to improve efficiency. Optimized tilt angles and increased wave notches shape air resistance towards the center, pushing out hot air faster like a nozzle.\r\n\r\nA die-cast anti-bending plate reinforces the entire card, while thermal pads ensure cooling reaches critical components underneath.\r\n\r\nThe NVIDIA® GeForce RTX™ 4090 is the ultimate GeForce GPU. It brings a massive leap in performance, efficiency, and AI-powered graphics. Enjoy high-performance gaming, incredibly detailed virtual worlds with ray tracing, unprecedented productivity, and new ways to create. Powered by the NVIDIA Ada Lovelace architecture, it features 24 GB of G6X memory to deliver the ultimate experience for gamers and creators alike.','products/G1.png','products/G11.png',100,2),
(24,'GEFORCE ASUS RTX 4060 TI DUAL OC 8GB',2119000,'Asus','Advanced cooling solutions are a hallmark of flagship graphics cards, including two Axial-tech fans to maximize airflow to the heatsink, housed in a 2.5-slot, 22.7 cm long card, delivering more power in less space. These enhancements make ASUS Dual the perfect choice for gamers seeking heavy graphical performance in a compact build.\r\n\r\nNVIDIA Ada Lovelace Streaming Multiprocessors: Up to double the performance and energy efficiency.\r\n4th Generation Tensor Cores: Up to 4 times more performance with DLSS 3 compared to brute force rendering.\r\n3rd Generation RT Cores: Up to double the performance in ray tracing.\r\nOC Edition: Boost Clock 2595 MHz (OC mode) / 2565 MHz (default mode).\r\nThe Axial-tech fan design features a smaller hub that enables longer blades and a barrier ring to increase downward air pressure.\r\nA 2.5-slot design maximizes compatibility and cooling efficiency for superior performance in small chassis.\r\n0dB technology allows for quiet operation during light gaming.\r\nDual ball fan bearings can last up to twice as long as sleeve bearing designs.\r\nTwo tried-and-true Axial-tech fans feature a smaller hub for longer blades and a barrier ring to increase downward air pressure.\r\n\r\nTo eliminate unnecessary noise, a stop mode halts all fans when GPU temperature drops below 55 degrees and power consumption is low.\r\n\r\nDifferent types of bearings have unique advantages and disadvantages. Ball bearings stand out for their durability and can last up to twice as long as sleeve bearing designs.\r\n\r\nAuto-Extreme technology is an automated manufacturing process that sets new industry standards by completing all soldering in a single pass. This reduces thermal stress on components and avoids the use of aggressive cleaning chemicals, resulting in lower environmental impact, reduced manufacturing energy consumption, and an overall more reliable product.','products/G2.png','products/G22.png',100,2),
(25,'GIGABYTE RTX 4060 GAMING WF OC 3X 8 GB',1689000,'GIGABYTE','Fourth-generation Tensor Cores: Up to 4 times performance improvement with DLSS 3 compared to brute-force rendering.\r\nThird-generation RT Cores: Up to 2 times performance improvement in ray tracing.\r\nPowered by GeForce RTX™ 4060.\r\nIntegrated with 8GB GDDR6 128-bit memory interface.\r\nWINDFORCE cooling system.\r\nRGB Fusion.\r\nDual BIOS.\r\nMetal back plate for protection.\r\nThe extended heat sink allows for airflow, providing better heat dissipation.\r\n\r\nPure copper heat pipe makes direct contact with the GPU for enhanced heat transfer to the heat sink, optimizing the graphics card\'s cooling efficiency.\r\n\r\nWith 16.7 million customizable color options and numerous lighting effects, you can choose any lighting effect or synchronize it with other devices using GIGABYTE CONTROL CENTER.\r\n\r\nGIGABYTE CONTROL CENTER is unified software for all GIGABYTE-compatible products. It provides an intuitive interface that allows users to adjust clock speed, voltage, fan mode, and power target in real time.','products/G3.png','products/G33.png',100,2),
(26,'ASUS GEF RTX 4060 DUAL OC 8 GB',1580000,'Asus','NVIDIA Ada Lovelace Streaming Multiprocessors: Up to double the performance and energy efficiency.\r\nFourth-generation Tensor Cores: Up to 4 times more performance with DLSS 3 compared to brute-force rendering.\r\nThird-generation RT Cores: Up to double the performance in ray tracing.\r\nOC Edition: 2535 MHz (OC mode) / 2505 MHz (default mode)\r\nAxial-tech fan design features a smaller fan hub that enables longer blades and a barrier ring to increase downward air pressure.\r\nA 2.5-slot design maximizes compatibility and cooling efficiency for superior performance in compact chassis.\r\n0dB technology allows for near-silent gaming during light loads.\r\nDual ball-bearing fans can last up to twice as long as sleeve-bearing designs.\r\n\r\nModel: DUAL-RTX4060-O8G\r\n\r\nGraphics Engine: NVIDIA® GeForce RTX™ 4060\r\n\r\nBus Standard: PCI-Express 4.0\r\n\r\nOpenGL: OpenGL® 4.6\r\n\r\nVideo Memory: 8GB GDDR6\r\n\r\nEngine Clock: OC Mode: 2535 MHz Default Mode: 2505 MHz (Boost)\r\n\r\nCUDA Cores: 3072\r\n\r\nMemory Speed: 17 Gbps\r\n\r\nMemory Interface: 128-bit\r\n\r\nResolution: Maximum Digital Resolution 7680 x 4320\r\n\r\nInterface:\r\n\r\n1 x HDMI 2.1a (native)\r\n3 x DisplayPort 1.4a (native)\r\nHDCP Support: Yes (2.3)\r\nMaximum Display Support: 4\r\n\r\nSoftware: ASUS GPU Tweak III, GeForce Game Ready Driver, and Studio Driver: download all software from the support site.\r\n\r\nDimensions: 227.2 x 123.24 x 49.6 mm\r\n\r\nRecommended Power Supply: 550W\r\n\r\nPower Connectors: 1 x 8-pin\r\n\r\nSlot: 2.5 Slot','products/g4.png','products/g44.png',100,2),
(27,'MSI RTX-4060 VENTUS 2X OC 8 GB',1525000,'MSI','TORX FAN 4.0 is built on teamwork, with pairs of fan blades linked by an outer ring design that focuses airflow on the dual-fan cooling system.\r\n\r\nWith DLSS 3\r\nPlay, stream, create. The GeForce RTX™ 4060 allows you to enjoy the latest games and applications with the ultra-efficient NVIDIA Ada Lovelace architecture. Experience immersive AI-accelerated gaming with ray tracing and DLSS 3, and enhance your creative process and productivity with NVIDIA Studio.\r\n\r\nClock/Memory Speed Boost\r\n2505MHz / 17Gbps\r\n8GB GDDR6\r\n3 x DisplayPort (v1.4a)\r\n1 x HDMI™ (supports 4K@120Hz HDR, 8K@60Hz HDR, and variable refresh rate as specified in HDMI™ 2.1a)\r\nDual-fan thermal design\r\nTORX Fan 4.0: A masterpiece of teamwork, fan blades work in pairs to create unprecedented levels of focused airflow pressure.\r\nZero Frozr: Fans stop completely when temperatures are relatively low, eliminating all noise.','products/G5.png','products/G55.png',100,2),
(28,'GIGABYTE RTX 4060 TI EAGLE OC WINF 3X 8 GB',2179000,'GIGABYTE','With NVIDIA DLSS 3 technology, ultra-efficient Ada Lovelace architecture, and full ray tracing capabilities:\r\n\r\nFourth-generation Tensor Cores: Up to 4 times performance improvement with DLSS 3 compared to brute-force rendering.\r\nThird-generation RT Cores: Up to 2 times performance improvement in ray tracing.\r\nPowered by GeForce RTX™ 4060 Ti (8GB)\r\nIntegrated with 8GB GDDR6 128-bit memory interface\r\nWINDFORCE cooling system\r\nDual BIOS\r\nProtective backplate\r\nThe 3D active fan provides semi-passive cooling, with fans remaining off when the GPU is under low load or low power consumption.\r\n\r\nAirflow spills through the fan\'s triangular edge and is gently guided through the 3D stripe curve on the fan surface.\r\n\r\nGraphene nanolubricant can extend the fan\'s lifespan by 2.1 times that of sleeve bearing fans and is quieter.\r\n\r\nThe shape of the pure copper heat pipe maximizes direct contact area with the GPU. The heat pipe also covers the VRAM via a large metal contact plate to ensure adequate cooling.\r\n\r\nThe extended heat sink allows airflow passage, providing better heat dissipation.\r\n\r\nThe backplate not only provides an aesthetic shape but also enhances the graphics card structure for complete protection.\r\n\r\nFactory default setting is OC mode, providing users with the best performance. However, switching to silent mode will enjoy a quieter experience.\r\n\r\nHighest quality ultra-durable certified metal chokes, solid capacitors with lower ESR, 2 oz copper PCB, and MOSFETs with lower RDS(on), plus over-temperature protection design to deliver superior performance and longer system lifespan.\r\n\r\nFully automated production process ensures maximum quality of circuit boards and eliminates sharp protrusions from solder connectors seen on conventional PCB surfaces. This user-friendly design prevents accidental cuts or damage to components during assembly.\r\n\r\nGIGABYTE CONTROL CENTER is a unified software for all GIGABYTE-compatible products. It provides an intuitive interface that allows users to adjust clock speed, voltage, fan mode, and power target in real time.','products/G66.png','products/G6.png',100,2),
(29,'MSI RTX 4060 8 GB GAMING X NV EDITION',1800000,'MSI','MSI envisioned the GAMING series as the preferred graphics card solution for all types of gamers, including adventurers, esports competitors, live streamers, and more. GAMING reflects both the spirit of gamers and the intense performance of the cards with a stylish exterior bursting with colorful lights between lines and striking edges.\r\n\r\nStay cool and quiet. MSI\'s TWIN FROZR 9 thermal design enhances heat dissipation across the entire graphics card.\r\n\r\nTORX FAN 5.0 is the culmination of fan design improvements to increase air pressure and flow to the heatsink. Ring-like arcs unite three sets of fan blades tilted 22 degrees between them to maintain high-pressure airflow even at slower rotation speeds. The resulting increase in airflow is +23% compared to an axial fan.\r\n\r\nA fan cover extends slightly beyond the general enclosure to lengthen the wind path, allowing airflow to stabilize and move smoothly through the fans. Bulging notches under the hood help reduce recirculation, further enhancing airflow stability and reducing noise.\r\n\r\nHeat from the GPU and memory modules is immediately captured by a solid nickel-plated copper baseplate and then quickly transferred to a series of heat pipes. This enhancement of thermal transfer systems with highly efficient mechanisms improves overall efficiency.\r\n\r\nCore Pipes are precision-manufactured to make the most of available space. A square section of heat pipes fully touches the GPU baseplate and distributes heat across the entire heatsink.\r\n\r\nAirflow Control enhances airflow dynamics through Wave Curved 2.0 and updated deflectors to optimize the balance between cooling and quieter acoustics.','products/G7.png','products/G77.png',100,2),
(30,'ASUS PROART RTX 4060 OC 8 GB',1885000,'Asus','NVIDIA Studio: AI-accelerated creator applications and RTX, exclusive AI software, and Studio drivers for unmatched creativity and performance.\r\n\r\nNVIDIA Ada Lovelace Streaming Multiprocessors: Up to double the performance and energy efficiency.\r\n\r\n4th Generation Tensor Cores: Up to 4 times performance with DLSS 3 compared to brute-force rendering.\r\n\r\n3rd Generation RT Cores: Up to double the ray tracing performance.\r\n\r\nOC Edition: 2580 MHz (OC mode) / 2550 MHz (default mode).\r\n\r\nExpanded Axial-tech Fans: Enhanced to achieve 21% more airflow.\r\n\r\n2.5-slot Design: Allows greater build compatibility while maintaining superior cooling.\r\n\r\nDual Ball Bearing Fans last up to twice as long as conventional designs.\r\n\r\n0dB Technology allows for quiet operation during light gaming.\r\n\r\nPrecision automated manufacturing with Auto-Extreme technology for increased reliability.\r\n\r\nGPU Tweak III: Connect Profile allows creators to seamlessly optimize performance and system cooling for each application.\r\n\r\nBigger and Better: Axial-tech fans spin on dual ball bearings and have been expanded to drive 23% more air through the card, setting the stage for lower temperatures, less noise, and higher performance.\r\n\r\nThe two lateral fans spin counterclockwise to minimize turbulence and maximize air dispersion through the heatsink. All three fans stop when GPU temperatures drop below 50 degrees Celsius, allowing you to play less demanding games or perform light tasks in relative silence. Fans resume operation when temperatures exceed 55 degrees Celsius, following a speed curve that balances performance and acoustics for work or play.\r\n\r\nEfficient heatpipes transfer heat towards an optimized fin stack for airflow from the Axial-tech fans. The entire assembly is dressed in stealthy black to match the ProArt theme.\r\n\r\nDigital power control, a variety of high-current power phases, and a 15K limit line ensure massive reserves to reliably exceed performance limits.\r\n\r\nComponent and trace designs have been optimized on a short PCB to reduce power loss and vent heat through a massive ventilation on the backplate.\r\n\r\nAuto-Extreme technology is an automated manufacturing process that sets new standards in the industry by completing all soldering in a single pass. This reduces thermal stress on components and eliminates the use of aggressive cleaning chemicals, resulting in lower environmental impact, reduced manufacturing energy consumption, and a more reliable product overall.','products/G8.png','products/G88.png',100,2),
(31,'ASUS RTX-3060 DUAL OC V2 12 GB',1525000,'Asus','With the latest NVIDIA® Ampere architecture, the ASUS Dual GeForce RTX™ 3060 combines dynamic thermal performance with highly versatile compatibility. Advanced cooling solutions found in premium graphics cards, such as the two Axial-tech fans that maximize heat dissipation, are integrated into a compact design measuring 20 cm in length and occupying 2 slots, offering more power in less space. These enhancements make the ASUS Dual the perfect choice for gamers seeking advanced graphic performance in a compact design.\r\n\r\nAuto-Extreme technology is a manufacturing process that sets new industry standards. Auto-Extreme allows components to be soldered in a single pass, reducing thermal stress on components and eliminating the use of aggressive chemicals. The result is a reduced environmental impact, lower energy consumption during manufacturing, and a more reliable product.\r\n\r\nASUS GPU Tweak II utility takes graphics card performance to the next level. This utility allows manipulation of parameters such as GPU core and memory frequencies, voltages, fan speeds, and more, while monitoring everything in real-time from a customizable overlay interface. GPU Tweak II provides all the controls needed to maximize the performance of your graphics card.','products/g99.png','products/g9.png',100,2),
(32,'MSI GEF RTX 3050 VENTUS 2X OC 6 GB',915000,'MSI','In comparison to generic fan designs, Ventus series fans utilize a custom fan design with a unique curve to enhance heat dissipation by generating more airflow and air pressure.\r\n\r\nNot all circuit boards are equal. A custom PCB design provides greater reliability and reinforced power circuits to push the card to its limits.\r\n\r\nThe GeForce RTX™ 3050 with 6GB is built on the NVIDIA Ampere architecture, featuring dedicated ray tracing cores, AI tensor cores, and high-speed G6 memory. Take the leap to GeForce RTX.\r\n\r\nBoost Clock/Memory Speed:\r\n1492MHz / 14Gbps\r\n6GB GDDR6\r\n\r\nDisplay Output:\r\n1 x DisplayPort (v1.4a)\r\n2 x HDMI™ (supports 4K@120Hz as specified in HDMI™ 2.1)\r\n\r\nDual Fan Thermal Design:\r\nTwo fans and a large heatsink ensure a cool and quiet experience.\r\n\r\nMSI Center:\r\nExclusive MSI Center software allows real-time monitoring, modification, and optimization of MSI products.\r\n\r\nAfterburner Overclocking Utility:\r\nOC Scanner: An automated function finds the highest stable overclocking settings.\r\nOn-Screen Display: Provides real-time system performance information.\r\nPredator: In-game video recording.','products/G1010.png','products/G10.png',100,2),
(33,'ASUS RTX 3050 DUAL OC AUTO EX 6 GB',960000,'Asus','With the latest NVIDIA® Ampere architecture, the ASUS Dual GeForce RTX™ 3050 6G combines dynamic thermal performance with extensive compatibility. Advanced cooling solutions from leading graphics cards are integrated into this 2-slot, 20 cm long card, offering more power in less space. These improvements make ASUS Dual the perfect choice for gamers seeking powerful graphics performance in a compact form factor.\r\n\r\nDust is the number one enemy for enthusiasts. Cleaning blades is easy, but disassembling the fan to remove internally accumulated dust isn\'t simple. Achieving IP5X certification means the casing is shielded from undesirable particles, ensuring you\'ll never need deep cleaning.\r\n\r\nAuto-Extreme technology is an automated manufacturing process setting new industry standards by completing all soldering in a single pass. This reduces thermal stress on components and avoids the use of aggressive cleaning chemicals, resulting in lower environmental impact, reduced manufacturing energy consumption, and overall more reliable products.\r\n\r\nASUS GPU Tweak III utility takes GPU tuning to the next level. It allows critical parameter adjustments including GPU core clocks, memory frequency, and voltage settings, with real-time monitoring through customizable on-screen display. Advanced fan control and numerous other features are included to help you maximize your graphics card\'s performance.\r\n\r\nA 144-hour validation program subjects the cards to rigorous testing to ensure compatibility with the latest games.\r\n\r\nUse our power calculator to estimate the energy needed to power your setup, then choose a compatible ROG, TUF Gaming, or Prime power supply for maximum performance.','products/G1212.png','products/G12.png',100,2),
(34,'ASUS TUF RTX 4080 SUPER GAMING OC 16 GB',5800000,'Asus','Enhanced with NVIDIA Ada Lovelace architecture, improved cooling, and power delivery, backed by a robust reinforcement arsenal to cover your back. Lock, load, and dominate with the TUF Gaming GeForce RTX™ 4080 SUPER.\r\n\r\nBigger and better. Axial-tech fans spin on double ball bearings and have been enlarged to boost airflow through the card by 21%, setting the stage for lower temperatures, less noise, and higher performance.\r\n\r\nThe two lateral fans spin counterclockwise to minimize turbulence and maximize airflow dispersion through the heatsink. All three fans stop when the GPU temperature is below 50°C, allowing you to play less demanding games or perform light tasks in relative silence. The fans restart when temperatures exceed 55°C, following a speed curve that balances performance and acoustics for work or play.\r\n\r\nA generously sized heatsink efficiently absorbs GPU heat, which is then expelled by the three Axial-tech fans.\r\n\r\nA line of capacitors with a 20,000-hour lifespan at 105°C provides greater temperature tolerance and ripple control on the GPU power rail, preparing the card for long-term use under extreme conditions.\r\n\r\nThe backplate is made of durable aluminum to support the PCB and dissipate heat from integrated components.\r\n\r\nAuto-Extreme technology is an automated manufacturing process setting new industry standards by completing all soldering in a single pass. This reduces thermal stress on components and avoids the use of aggressive cleaning chemicals, resulting in lower environmental impact, reduced manufacturing energy consumption, and overall more reliable products.\r\n\r\nARGB lighting compatible with Aura on the cover adds a customizable touch of color or functional effects to your setup. Pair it with a wide range of compatible system components and coordinate brightness to create a unique theme for yourself.','products/G13.png','products/G1313.png',100,2),
(35,'MSI RTX-3050 LP OC 6GB',870000,'MSI','The dual fans cover more area of the heatsink to efficiently dissipate heat.\r\n\r\nThe GeForce RTX™ 3050 with 6GB GDDR6 is built on the NVIDIA Ampere architecture, featuring dedicated ray tracing cores, AI tensor cores, and high-speed G6 memory. Step up to GeForce RTX.\r\n\r\nClock Speed/Memory Boost:\r\n1492MHz / 14Gbps\r\n6GB GDDR6\r\nDisplayPort x 1 (v1.4a)\r\nHDMI™ x 2 (supports 4K@120Hz as specified in HDMI™ 2.1)\r\nLow-Profile Design\r\nThe low-profile design saves more space.\r\nUsers can easily build a slim or smaller system.\r\nDual Fan Thermal Design\r\nDual fans cover more area of the heatsink to efficiently dissipate heat.\r\nMSI Center\r\nExclusive MSI Center software allows you to monitor, modify, and optimize MSI products in real time.\r\nAfterburner Overclocking Utility\r\nOC Scanner: An automated function finds the highest stable overclocking settings.\r\nOn-Screen Display: Provides real-time performance information about your system.\r\nPredator: In-game video recording.','products/G14.png','products/G1414.png',100,2),
(36,'MSI GEF RTX 4060 TI GAMING X SLIM 16 GB',2670000,'MSI','Stay cool and quiet. MSI\'s TRI FROZR 3 thermal design enhances heat dissipation around the graphics card.\r\n\r\nAirflow Control improves airflow dynamics through Wave Curved 2.0 and an updated deflector design to optimize the balance between cooling and quieter acoustics.\r\n\r\nTake a closer look at the other thermal solution features that help control temperatures and noise levels.','products/G15.png','products/G1515.png',100,2),
(37,'NVIDIA GEFORCE ASUS GT 710 SILENT DDR5 2 GB',239000,'ASUS','The ASUS GT 710 is a fantastic graphics card with an efficient thermal design that dissipates heat in complete silence. The Auto-Extreme automated manufacturing process with Super Alloy Power II ensures the best quality and reliability. GPU Tweak II allows you to intuitively adjust performance for an elite gaming experience.\r\n\r\nASUS\' exclusive heatsinks feature a larger surface area for passive and completely silent cooling. This feature is ideal for building home theater PCs (HTPCs) and media centers.\r\n\r\nEquipped with HDMI, DVI, and D-Sub video outputs, the compact GT 710 graphics card supports up to 3 displays simultaneously.\r\n\r\nThe intuitive GPU Tweak II interface makes overclocking accessible to all users without sacrificing advanced features for experienced overclockers. With just one click, Game Booster maximizes graphics performance by eliminating redundant processes. XSplit Gamecaster allows you to conveniently stream or record gameplay from a comfortable overlay interface.','products/G16.png','products/G1616.png',100,2),
(38,'Apple Macbook Pro Apple M3 Max 16 Núcleos/48GB/1TB SSD',19550000,'Apple','A wild beauty. Three giant steps forward. The MacBook Pro soars with the M3, M3 Pro, and M3 Max chips. Equipped with 3-nanometer technology and a new GPU architecture, they are the most cutting-edge chips for personal computers to date. These three small giants elevate performance and capabilities to unprecedented levels.\r\n\r\nFeatures:\r\n\r\nGraphics in a league of their own. Open your eyes wide: you\'re facing a new GPU architecture from top to bottom and the most advanced graphics of all Apple chips. Dynamic caching optimizes chip memory to boldly increase average GPU usage. The result? A surge in performance for the most demanding apps and games. Plus, games now feature a level of detail never seen before thanks to hardware-accelerated mesh shading. This technology offers more capacity and efficiency in processing geometry, allowing visually complex scenes to be rendered for breathtaking images.\r\n\r\nHardware-accelerated ray tracing. For the first time, the MacBook Pro utilizes hardware-accelerated ray tracing. Coupled with the new graphics architecture, professional applications now increase rendering speeds by up to 2.5 times, while games display even more realistic shadows and reflections. If you look up \"prodigy\" in the dictionary, this is what you\'ll find.\r\n\r\nOpen until dawn. The MacBook Pro boasts the longest battery life in a Mac, up to 22 hours, which is no small feat. All models perform at peak levels whether plugged in or not. Moreover, Apple\'s chips deliver efficiency to maximize performance when inspiration or duty calls.\r\n\r\nApps at full throttle. With thousands of apps optimized to harness macOS and Apple\'s chip potential, the M3 lineup boosts performance beyond imagination. Now apps kick into high gear: the ones you use every day, work apps, and your favorite games.\r\n\r\nThe best screen ever seen on a laptop. Extreme dynamic range (XDR) displays spectacular lighting effects, detailed shadows, and true-to-life colors. Each Liquid Retina XDR display comes factory-calibrated with ProMotion technology and professional reference profiles. Look closely and prepare to be amazed.\r\n\r\nKeen eye. And ear.\r\n\r\n1080p camera. Video calls show your best self with technologies that bring out the best in you. Say \"Hello, hello!\" like a radio genius and you\'ll shine even in dim light.\r\n\r\nStudio-quality three-microphone array. Capture every nuance in audio production and reduce background noise so you\'re heard loud and clear.\r\n\r\nSix-speaker sound system. Two pairs of woofers with force-canceling and two tweeters make for an auditory delight. Dolby Atmos spatial audio offers superior three-dimensional sound.\r\n\r\nEverything is connected. The MacBook Pro includes a variety of ports for high-performance peripherals, high-resolution monitors, and SDXC cards. Plus, it supports Wi-Fi 6E and Bluetooth 5.3 networks. It connects effortlessly with both familiar and new devices.\r\n\r\nSecurity that leaves a mark. The Magic Keyboard features standard-height function keys and Touch ID for unlocking the Mac and logging into apps and websites quickly, easily, and securely. Designed to be secure. Your fingerprint information becomes an encrypted mathematical value, so you don\'t have to remember complex passwords.','products/L1.png','products/L11.png',100,3),
(39,'Apple Macbook Air Apple M2/16GB/512GB SSD',7900000,'Apple','Reinvented with the new M2 chip, the MacBook Air captivates not only with its ultra-thin design but also with the speed and efficiency hidden within its durable aluminum chassis. With such a versatile computer, you can work, play, and unleash all your creativity wherever you go.\r\n\r\nFeatures:\r\n\r\nLess weight. More of everything. Reinvented with the new M2 chip, the MacBook Air captivates not only with its ultra-thin design but also with the speed and efficiency hidden within its durable aluminum chassis. With such a versatile computer, you can work, play, and unleash all your creativity wherever you go.\r\n\r\nStar white, midnight, and other stellar colors. The MacBook Air is available in four finishes to amaze, each with its matching MagSafe charging cable.\r\n\r\nClear the runway. The new generation of Apple chips debuts with the M2, which takes speed and energy efficiency introduced by the M1 further. Do a thousand things in less time with an even more powerful 8-core CPU. Create impossible images and animations with the up to 10-core GPU. Playback and edit more ProRes 4K and 8K video sequences with its high-performance multimedia engine. And keep pushing your projects and games relentlessly, as you have up to 18 hours of battery life. Let the party begin.\r\n\r\nFaster speeds for your apps. All apps run like lightning on macOS, from Microsoft 365 to your favorite iOS apps. Plus, get ready because there are already over 10,000 apps and plug-ins optimized for Apple\'s chips: your creativity is secured for the future.\r\n\r\nNow all together. Make and receive calls from your iPhone on the Mac. Turn your iPad into a second screen. Unlock your Mac with your Apple Watch. It\'s like they were made for each other. But without the \"as if.\"\r\n\r\nEverything looks beautiful to you. The 13.6-inch Liquid Retina display is the largest and brightest ever on a MacBook Air. With over a billion colors, text is super sharp, and both photos and movies shine with spectacular contrast and precision. Spoiler: You\'re going to binge-watch series like crazy.\r\n\r\nYour living image. And sound. Video calls have leveled up with the 1080p FaceTime HD camera and the three-microphone array. Plus, the four-speaker system with spatial audio completely immerses you in sound. The MacBook Air is a pleasure for the senses.\r\n\r\nA virtuoso of keys. The Magic Keyboard isn\'t satisfied with being comfortable and silent. That\'s why it includes standard-height function keys that give you access to all kinds of controls and shortcuts. Unlocking the Mac, entering passwords, shopping securely, and paying whatever is needed is as simple as moving your finger to the Touch ID sensor. Want to work comfortably? The Force Touch trackpad now has a larger surface area.\r\n\r\nFeel the connection. The MagSafe port has magnets that attach the charging cable with just a touch and release instantly if someone trips over it. The two Thunderbolt ports allow you to connect and charge high-speed accessories or even a 6K monitor. And the 3.5mm headphone jack supports high-impedance headphones.','products/L2.png','products/L22.png',100,3),
(40,'Apple MacBook Air Apple M1/8GB/256GB SSD',4300000,'Apple','Power takes up no space. Apple\'s M1 chip redefines our thinnest and lightest laptop. The CPU is up to 3.5 times faster. Graphics are up to five times faster. An advanced Neural Engine increases machine learning speed by up to nine times. It also boasts the longest battery life in a MacBook Air and a fanless design that makes it ultra-quiet. Discover unprecedented performance ready to follow you anywhere.\r\n\r\nFeatures:\r\n\r\nPower made chip. It\'s here. Our first chip designed specifically for the Mac. Apple\'s M1 is a System on Chip (SoC) that packs 16 billion transistors and integrates the CPU, GPU, Neural Engine, I/O, and more into a tiny design. With top performance, custom technologies, and industry-leading efficiency, the M1 isn\'t just a new step for the Mac. It\'s a before and after in its history.\r\n\r\nEager for work. Not for battery. The M1 chip features the fastest CPU we\'ve ever built. With such power on hand, the MacBook Air excels in demanding tasks like professional video editing or epic gaming sessions. And that\'s just the beginning, because in addition to up to 3.5 times the speed of the previous generation, the M1 chip\'s eight-core CPU balances high-performance cores and efficiency cores, handling everyday tasks while consuming only a tenth of the power. That\'s something.\r\n\r\nmacOS Big Sur power with the M1 chip. macOS Big Sur has been developed to harness the potential of the M1 chip and transform the Mac. The result? Superior performance, app improvements, a stunning new design, and industry-leading privacy and security features. It\'s our most powerful software, and it matches our most advanced hardware.\r\n\r\nColors so real you won\'t believe it. The 2560-by-1600 pixel resolution of the 13.3-inch Retina display offers astonishing detail and realism. Text is crystal clear, colors shine brightly, and the glass extends to the edge of the casing so nothing distracts you.\r\n\r\nTrue Tone technology. Enjoy the views. Rest your eyes. The MacBook Air automatically adjusts the white point of the screen based on the ambient color temperature, making it more comfortable to look at.\r\n\r\nCamera and microphones. Bring out your best self. The M1 chip features our most advanced image signal processor so you always look great on your FaceTime calls. The three integrated microphones pick up everything, whether you\'re on a call, dictating a note, or asking Siri about the weather.\r\n\r\nA keyboard with capital letters. Enjoy absolute comfort from A to Z. In addition to typing comfortably, this keyboard\'s pre-programmed shortcuts let you instantly access the features you use most. Talk to Siri, change the keyboard language, respond with the perfect emoji, find documents with Spotlight... You can\'t imagine everything you can do with a touch. And the backlit keyboard with ambient light sensor allows you to type even when it\'s dark.\r\n\r\nTouch ID. A single touch is enough to lock and unlock the MacBook Air. Your fingerprint can rent a movie, buy an app, or access protected documents and system settings without typing a password. And when you use Apple Pay to shop online, Touch ID adds your address and billing details without sharing your credit card number.','products/L3.png','products/L33.png',100,3),
(41,'Microsoft Surface Laptop 5 Intel Evo Core i7-1255U/8GB/256GB SSD',6550000,'Microsoft','Ultra-fast, sophisticated style. Achieve multitasking speed with 12th generation Intel® Core™ processors based on the Intel® Evo™ platform, long-lasting battery life, and your choice of size and color in a beautiful and elegant laptop.\r\n\r\nFeatures:\r\n\r\nPixelSense™ touchscreen, the largest 15-inch display for multitasking with split-screen capability.\r\nStylish and ultra-light laptop starting from just 1,272 grams with an exceptionally comfortable keyboard.\r\nUltra-fast performance. Work swiftly in multitasking mode with powerful 12th generation Intel® Core™ i5/i7 processors based on the Intel® Evo™ platform.\r\nUltra-fast Thunderbolt™ 4 port connects to a 4K monitor, charges your laptop, and provides faster data transfer speeds for large video files.\r\nReliable battery that lasts all day.\r\nElevated experiences. Present your best voice and face during calls with studio microphones and enhanced camera experiences, all powered by Windows 11.\r\nCinematic entertainment. Ultra-vivid colors with Dolby Vision IQ™ and immersive sound with Dolby Atmos®.\r\nPeace of mind from the moment you log in, with Windows Hello and integrated security from Windows 11.\r\nEnhance your productivity and boost your creative ideas with Microsoft 365 and video editing with ClipChamp.\r\nProtected OneDrive cloud storage for your Microsoft 365 files.\r\nPlay collaboratively on Windows PC with Xbox Game Pass Ultimate.','products/L4.png','products/L44.png',100,3),
(42,'Acer Predator Triton 500 SE Intel Core i7-11800H/32GB/1TB/RTX 3080',29550000,'Acer','The Triton 500 SE is a sleek and understated gaming laptop designed to handle multiple tasks simultaneously, deliver extreme performance, and enhance your creativity at every moment.\r\n\r\nSpecifications:\r\n\r\nProcessor: Intel® Core™ i7-11800H\r\nMemory: 32 GB DDR4 3200MHz Memory\r\nStorage: 1024GB PCIe NVMe SSD\r\nOptical Drive: No\r\nDisplay: 16\" WQXGA SlimBezel 165Hz WQXGA (2560 x 1600) 16:10\r\nGraphics: NVIDIA® GeForce RTX™ 3080 8 GB VRAM\r\nConnectivity:\r\n802.11AX + Bluetooth® 5.1\r\nHD Camera with 2 Microphones\r\nBattery: 99Wh Li-ion battery\r\nConnections:\r\n1x USB 3.2 Gen 2 + 1 x USB 3.2 Gen 2 power-off charging + USB Type-C™ (Thunderbolt™ 4)\r\n1 x HDMI 2.1 port\r\nAcer PBA fingerprint reader\r\n1 x RJ-45\r\nOperating System: Windows 11 Home 64-bit\r\nDimensions (Width x Depth x Height): 358.5 (W) x 262.4 (D) x 19.9 (H) mm\r\nWeight: 2.4 kg\r\nColor: Gray\r\nIncludes: 1 month of Xbox Game Pass Ultimate','products/L5.png','products/L55.png',100,3),
(43,'MSI Vector 16  Intel Core i9/32GB/1TB/RTX 4080',25660000,'MSI','MSI Vector 16 HX A14VHG-400FR\r\n\r\nSpecifications:\r\n\r\nDesign:\r\n\r\nColor Name: Cosmos Gray\r\nProduct Type: Laptop\r\nProduct Color: Black\r\nForm Factor: Clamshell\r\nMarket Positioning: Gaming\r\nOriginal Brand Name: MSI\r\nDisplay:\r\n\r\nScreen Diagonal: 16 inches (40.6 cm)\r\nScreen Resolution: 2560 x 1600 pixels\r\nTouchscreen: No\r\nHD Type: Quad HD+\r\nAnti-reflective Screen: Yes\r\nRGB Color Space: DCI-P3\r\nColor Gamut: 100%\r\nMaximum Refresh Rate: 240 Hz\r\nProcessor:\r\n\r\nProcessor Manufacturer: Intel\r\nProcessor Generation: Intel Core i9-14xxx\r\nProcessor Family: Intel® Core™ i9\r\nProcessor Model: i9-14900HX\r\nEfficient Core Base Frequency: 1.6 GHz\r\nProcessor Turbo Frequency: 5.8 GHz\r\nPerformance Core Base Frequency: 2.2 GHz\r\nEfficient Core Maximum Turbo Frequency: 4.1 GHz\r\nPerformance Core Maximum Turbo Frequency: 5.8 GHz\r\nNumber of Processor Cores: 24\r\nPerformance Cores: 8\r\nEfficient Cores: 16\r\nProcessor Cache: 36 MB\r\nProcessor Cache Type: Smart Cache\r\nChipset: Intel HM770\r\nProcessor Base Power: 55 W\r\nMaximum Turbo Power: 157 W\r\nMemory:\r\n\r\nInternal Memory: 32 GB\r\nInternal Memory Type: DDR5-SDRAM\r\nMemory Clock Speed: 5600 MHz\r\nMemory Form Factor: SO-DIMM\r\nMemory Layout: 2 x 16 GB\r\nMemory Slots: 2x SO-DIMM\r\nMaximum Internal Memory: 96 GB\r\nStorage:\r\n\r\nTotal Storage Capacity: 1 TB\r\nStorage Drive: SSD\r\nSSD Total Capacity: 1 TB\r\nNumber of Installed SSDs: 1\r\nSSD Capacity: 1 TB\r\nSSD Interface: PCI Express 4.0\r\nNVMe: Yes\r\nSSD Form Factor: M.2\r\nOptical Drive:\r\n\r\nOptical Drive Type: No\r\nIntegrated Card Reader:\r\n\r\nIntegrated Card Reader: Yes\r\nCompatible Memory Cards: SD\r\nGraphics:\r\n\r\nExternal GPU Manufacturer: NVIDIA\r\nDiscrete Graphics Adapter Model: NVIDIA GeForce RTX 4080\r\nIntegrated Graphics Adapter: Yes\r\nIntegrated GPU Manufacturer: Intel\r\nDiscrete Graphics Adapter: Yes\r\nIntegrated Graphics Family: Intel® UHD Graphics\r\nIntegrated Graphics Adapter Model: Intel® UHD Graphics\r\n4K Support for Integrated Graphics Adapter: Yes\r\n6K Support for Integrated Graphics: Yes\r\nDiscrete Graphics Memory Capacity: 12 GB\r\nDiscrete Graphics Memory Type: GDDR6','products/l6.png','products/l66.png',100,3),
(44,'MSI Stealth GS77 12UHS-086ES Intel Core i7-12/32GB/1TB/RTX 3080Ti',18230000,'MSI','MSI Stealth GS77 12UHS-086ES\r\n\r\nFeatures:\r\n\r\nProcessor: Intel Core i7-12700H Alder Lake (45W)\r\nMemory: 32 GB DDR5-SDRAM (2x SO-DIMM, up to 64 GB)\r\nStorage: 1 TB SSD M.2\r\nOptical Drive: No\r\nDisplay Options:\r\n17.3\" Full HD (1920x1080), 360 Hz refresh rate, IPS-Level panel\r\nOther display options available (UHD, QHD with different refresh rates and color gamuts)\r\nGraphics: NVIDIA GeForce RTX 3080 Ti Laptop GPU, 16GB GDDR6 (105W)\r\nCooling System: MSI Cooler Boost 5 with 0.1 mm blades\r\nLiquid Metal Pad: MSI exclusive thermal compound\r\nAudio: Dynaudio with 6 speakers\r\nBattery: 4-cell, 99.9Whr\r\nKeyboard: SteelSeries Per-Key RGB Backlight Keyboard\r\nMSI Center: Includes exclusive gaming mode\r\nConnectivity:\r\nKiller Gb LAN (Up to 2.5G)\r\nIntel Killer AX Wi-Fi 6E + Bluetooth 5.2\r\nWebcam: FHD type, 30fps@1080p\r\nMicrophone: Yes\r\nPorts:\r\n1x Type-C (USB3.2 Gen2 / DP)\r\n1x Type-C (USB / DP / Thunderbolt™ 4) with PD charging\r\n2x Type-A USB3.2 Gen2\r\n1x RJ45\r\n1x SD Express Card Reader\r\n1x HDMI (8K @ 60Hz / 4K @ 120Hz)\r\nOperating System: Windows 11 Home 64-bit\r\nDimensions: 397.6 x 283.5 x 20.1~20.8 mm\r\nWeight: 2.8 kg\r\nColor: Black\r\nThis laptop is designed for both gaming and professional tasks, featuring powerful hardware including the Intel Core i7-12700H processor, NVIDIA GeForce RTX 3080 Ti graphics, and a variety of high-refresh-rate display options. It also emphasizes connectivity with Thunderbolt™ 4 support, advanced cooling with MSI Cooler Boost 5, and immersive audio with Dynaudio speakers. The inclusion of a large 99.9Whr battery supports extended gaming sessions or intensive workloads without needing to recharge frequently.','products/L7.png','products/L77.png',100,3),
(45,'ASUS ROG Zephyrus G16 OLED 29W Intel Core Ultra 9/32GB/2TB/RTX 4090',17550000,'Asus','ASUS ROG Zephyrus G16 2024 OLED GU605MY-QR029W\r\n\r\nFeatures:\r\n\r\nProcessor: Intel Core Ultra 9 185H\r\nMemory: 32GB\r\nStorage: 2TB SSD\r\nGraphics: NVIDIA GeForce RTX 4090 for laptops\r\nDisplay:\r\n16\" OLED panel\r\nResolution: 2.5K (2560x1600 pixels)\r\nRefresh Rate: 240Hz\r\nColor Gamut: 100% DCI-P3\r\nHDR: VESA HDR True Black 500\r\nOperating System: Windows 11 Home\r\nCooling System: ROG Intelligent Cooling with Arc Flow Fans™ (2nd Gen), redesigned high-efficiency air outlet, optional custom vapor chamber or Tri-Fan design, and liquid metal thermal compound\r\nKeyboard: 16:10 aspect ratio with increased key size (12% larger keys), 1.7mm key travel, 20 million keystroke durability\r\nAudio: Enhanced woofers for 47% louder volume and ultra-low 100Hz bass frequency\r\nConnectivity:\r\nWiFi 6E\r\nBluetooth\r\nPorts:\r\n1x Type-C (USB3.2 Gen2 / DP)\r\n1x Type-C (USB / DP / Thunderbolt™ 4) with PD charging\r\n2x Type-A USB3.2 Gen2\r\n1x RJ45\r\n1x SD Express Card Reader\r\n1x HDMI (8K @ 60Hz / 4K @ 120Hz)\r\nBattery: 90Wh, fast charging (0-50% in 30 minutes)\r\nDesign: CNC-machined aluminum chassis with Slash Lighting design\r\nDimensions:\r\nThickness: 1.49 cm\r\nWeight: 1.85 kg\r\nAdditional Features:\r\n\r\nAdvanced AI acceleration with Intel Core Ultra 9 processor\r\nNVIDIA Studio support for creative applications\r\nNVIDIA GeForce RTX 4090 for high-performance gaming and ray tracing\r\nOLED display with 2.5K resolution and exceptional color accuracy\r\nG-SYNC support for smooth gaming experience\r\nUltra-thin and lightweight design for portability\r\nPremium build quality with CNC-machined aluminum\r\nThe ASUS ROG Zephyrus G16 2024 OLED GU605MY-QR029W combines high-performance gaming capabilities with elegant design and portability. It features top-tier components like the Intel Core Ultra 9 processor and NVIDIA GeForce RTX 4090 GPU, making it suitable for demanding gaming and creative tasks. The OLED display with HDR support, coupled with advanced cooling and audio enhancements, ensures an immersive and enjoyable user experience whether gaming or creating content.','products/L8.png','products/L88.png',100,3),
(46,'ASUS TUF Gaming F15  Intel Core i7/16GB/1TB/RTX 4060',13500000,'Asus','ASUS TUF Gaming F15 FX507ZV4-LP047\r\n\r\nFeatures:\r\n\r\nProcessor: Intel Core i7-12700H\r\nMemory: 16GB\r\nStorage: 1TB SSD\r\nGraphics: NVIDIA GeForce RTX 4060\r\nDisplay:\r\n15.6\" Full HD IPS-level panel\r\nOperating System: Windows 11 Home\r\nKeyboard: RGB backlit keyboard with highlighted WASD keys\r\nCooling System: Arc Flow Fans™ with 84 blades, dual fans, 4 exhausts, 5 heat pipes\r\nAudio: Two speakers with Dolby Atmos, Hi-Res Audio, AI bidirectional noise cancellation\r\nConnectivity:\r\nWi-Fi 6 (802.11ax)\r\nBluetooth\r\nGigabit Ethernet\r\n1x HDMI 2.1\r\n2x USB Type-C (DisplayPort compatible, Thunderbolt™ 4)\r\n2x USB Type-A\r\nBattery: 90Wh, fast charging (50% in 30 minutes)\r\nDurability: MIL-STD-810H military standard tested\r\nDimensions:\r\nSmaller chassis size, 4.5% smaller than previous designs\r\nAdditional Features:\r\n\r\nNVIDIA Advanced Optimus for automatic frame routing between discrete GPU and integrated GPU\r\nOverstroke technology for faster key response\r\nDesigned for high-performance gaming and multitasking\r\nDurable construction to withstand drops, vibrations, and extreme temperatures\r\nAI-enhanced noise cancellation for clear communication\r\nExtensive connectivity options including Thunderbolt™ 4 and HDMI 2.1\r\nEfficient cooling system with advanced fans and heat pipes\r\nLong-lasting battery life and quick charging capability\r\nThe ASUS TUF Gaming F15 FX507ZV4-LP047 combines robust performance with durability and a range of features tailored for gaming and productivity. It\'s equipped with the Intel Core i7-12700H processor, NVIDIA GeForce RTX 4060 graphics, and a fast 1TB SSD, making it suitable for demanding tasks and modern gaming. The laptop also features a compact design with improved cooling, RGB backlit keyboard, and a comprehensive set of connectivity options.','products/L9.png','products/L99.png',100,3),
(47,'ASUS ROG Zephyrus Duo 16 AMD Ryzen 9/64GB/4TB/RTX 3080 Ti',16500000,'Asus','ASUS ROG Zephyrus Duo 16 GX650RX-LO162W\r\n\r\nProcessor:\r\n\r\nAMD Ryzen 9 6900HX\r\nMemory:\r\n\r\n64GB DDR5 RAM @ 4800 MHz\r\nStorage:\r\n\r\n4TB SSD PCIe® Gen 4.0 (2x 2TB SSD NVMe PCIe® Gen 4x4 in RAID 0)\r\nGraphics:\r\n\r\nNVIDIA GeForce RTX 3080 Ti with Dynamic Boost (165W)\r\nDisplay:\r\n\r\nMain Display: Nebula HDR™ Mini-LED 16-inch touchscreen\r\nDisplayHDR™ 1000 certified\r\n120Hz refresh rate\r\n3ms response time\r\n100% DCI-P3 color gamut coverage\r\nSecondary Screen: 14.1-inch ROG ScreenPad Plus\r\nTouch-enabled secondary display\r\nOperating System:\r\n\r\nWindows 10 Home / Windows 10 Pro\r\nAudio:\r\n\r\n6 speakers + 2 woofers\r\nDolby Atmos\r\nAI Noise-Canceling microphone array\r\nConnectivity:\r\n\r\nWi-Fi 6E (802.11ax)\r\nBluetooth 5.2\r\n2 x USB Type-C 3.2 Gen 2 with DisplayPort 1.4a and Power Delivery\r\n2 x USB 3.2 Gen 2 Type-A\r\n1 x HDMI 2.1\r\n1 x Ethernet (2.5G)\r\n1 x Audio combo jack\r\n1 x MicroSD card reader\r\nKeyboard:\r\n\r\nBacklit chiclet keyboard with Aura Sync RGB per-key lighting\r\nN-key rollover\r\n1.7mm key travel\r\nSecurity:\r\n\r\nIR webcam with Windows Hello support\r\nBattery:\r\n\r\n90Wh battery\r\nCooling:\r\n\r\nROG Intelligent Cooling with liquid metal thermal compound\r\nActive Aerodynamic System Plus (AAS+)\r\nAdditional Features:\r\n\r\nTwo-way AI noise-canceling microphone\r\nEasy upgrade design for RAM and storage\r\nArmoury Crate software for system customization\r\nMIL-STD-810H military standard durability\r\nDimensions and Weight:\r\n\r\nDimensions: 35.9 x 25.6 x 2.1 cm (WxDxH)\r\nWeight: 2.4 kg\r\nSummary:\r\nThe ASUS ROG Zephyrus Duo 16 GX650RX-LO162W is a high-end gaming and productivity laptop featuring top-tier specifications. With its AMD Ryzen 9 6900HX processor, NVIDIA GeForce RTX 3080 Ti graphics card, and 64GB of DDR5 RAM, it is designed to handle intensive gaming, multimedia tasks, and professional applications with ease. The innovative dual-screen design includes a primary 16-inch Nebula HDR™ Mini-LED display with stunning visuals and a secondary 14.1-inch ROG ScreenPad Plus for enhanced multitasking. Advanced cooling technology, extensive connectivity options, and premium audio features further enhance the user experience, making it a versatile choice for gamers and content creators alike.','products/L10.png','products/L1010.png',100,3),
(48,'MSI Raider Intel Core i7/32GB/1TB/RTX 3080Ti',13250000,'MSI','Processor:\r\n\r\nIntel Core i7-12700H (12th Gen Alder Lake)\r\nGraphics Options:\r\n\r\nNVIDIA GeForce RTX 3080 Ti GPU for laptops, 16GB GDDR6\r\nDisplay Options:\r\n\r\nUHD 17.3\" (3840 x 2160), 120Hz refresh rate, 100% Adobe RGB, IPS-level panel (optional)\r\nQHD 17.3\" (2560 x 1440), 240Hz refresh rate, 100% DCI-P3, IPS-level panel (optional)\r\nFull HD 17.3\" (1920 x 1080), 360Hz refresh rate, IPS-level panel (optional)\r\nMemory:\r\n\r\n32GB DDR4 RAM\r\nStorage:\r\n\r\n1TB SSD NVMe PCIe Gen4\r\nKeyboard:\r\n\r\nSteelSeries RGB per-key gaming keyboard\r\nSteelSeries GG for RGB backlighting customization\r\nBattery:\r\n\r\n99.9Whr battery capacity\r\nWireless Connectivity:\r\n\r\nIntel Killer Wi-Fi 6E AX1675\r\nBluetooth 5.2\r\nEthernet:\r\n\r\nIntel Killer Ethernet E3100G (up to 2.5 GbE)\r\nCooling System:\r\n\r\nCooler Boost 5 with 2 dedicated fans and 6 copper heat pipes\r\nPhase-change metal thermal compound for enhanced thermal conductivity\r\nPorts:\r\n\r\nThunderbolt 4 (USB Type-C) supporting data transfer up to 40 Gbps, and up to 8K 60Hz monitor output\r\nMultiple USB Type-A ports\r\nHDMI port\r\nAudio combo jack\r\nEthernet port\r\nMicroSD card reader\r\nSoftware and Features:\r\n\r\nMSI Center for gaming mode, SmartAuto, and Ambient Silent AI\r\nVirtual Aim Point for improved aiming in games\r\nMSI App Player for seamless gaming experience across devices\r\nAI-driven noise cancellation for clear communication\r\nGPU Switching between full performance mode and Optimus for battery saving\r\nNahimic 3 audio technology for immersive 360-degree audio experience\r\nDynaudio Duo Wave speakers with woofers for rich sound output\r\nTrue Color technology for enhanced color contrast and detail\r\nMatrix Display supporting up to 4K output across 4 external monitors\r\nDimensions and Weight:\r\n\r\nDimensions: (W x D x H) mm\r\nWeight: kg\r\nSummary:\r\nThe MSI Raider GE76 12UHS-612ES is a high-performance gaming laptop designed for enthusiasts and professionals alike. It features a powerful Intel Core i7-12700H processor, NVIDIA GeForce RTX 3080 Ti graphics, and various display options including UHD, QHD, and Full HD with high refresh rates and wide color gamuts. With advanced cooling solutions, extensive connectivity options, RGB gaming keyboard, and immersive audio technologies, it aims to deliver a superior gaming and multitasking experience. The inclusion of Thunderbolt 4, MSI Center software for system management, and AI-enhanced features further enhance its appeal for gamers and content creators seeking top-tier performance in a portable form factor.','products/L12.png','products/L1212.png',100,3),
(49,'Gigabyte AERO 17 Intel Core i7/16GB/2TB/RTX 3070Ti',12100000,'GIGABYTE','The Gigabyte AERO 17 XE5-73ES738HP is a laptop specifically designed for creators, combining power and performance with an elegant and compact aesthetic. Here are its key details:\r\n\r\nProcessor:\r\n\r\n12th Gen Intel Core i7-12700H\r\nGraphics:\r\n\r\nNVIDIA GeForce RTX 3070 Ti with 8GB GDDR6\r\nMemory:\r\n\r\n16GB RAM (configurable depending on model options)\r\nStorage:\r\n\r\n2TB SSD, offering ample capacity for fast and accessible storage\r\nDisplay:\r\n\r\nUltra-wide 4K HDR display, providing stunning resolution and HDR support for superior visual experience\r\nDesign:\r\n\r\nSlim and aesthetically appealing chassis, inspired by humanistic design with a minimalist yet detailed approach\r\nAdditional Features:\r\n\r\nFocused on efficiency and precision, ideal for creators needing robust performance for creative tasks\r\nCombines the power of the latest Intel Core processor with advanced graphics capabilities of the NVIDIA GeForce RTX 30 series\r\nCompact design for easy portability without compromising on performance\r\nApplications:\r\n\r\nIdeal for video editing, graphic design, 3D modeling, and other intensive creative tasks that demand power and precision\r\nConnectivity:\r\n\r\nIncludes modern standard connections for peripherals and networks, ensuring versatility in work environments\r\nIn summary, the Gigabyte AERO 17 XE5-73ES738HP is an excellent choice for professionals and creators seeking a balance of cutting-edge performance, aesthetic design, and portability in their daily work tool.','products/L13.png','products/L1313-.png',100,3),
(50,'LOGITECH PRO X 60 LIGHTSPEED SW BROWN',920000,'Logitech','The Logitech PRO X 60 is a gaming keyboard designed in collaboration with top esports athletes to deliver high performance and customization options. Here are its key features:\r\n\r\nDesign and Collaboration:\r\n\r\nDeveloped in partnership with hundreds of top esports athletes to ensure it meets the demands of competitive gaming.\r\nCustomization:\r\n\r\nOffers unparalleled customization through Logitech G HUB software.\r\nKEYCONTROL allows for detailed key customization and multiple customizable layers for a personalized gaming experience.\r\nPerformance:\r\n\r\nUtilizes Logitech\'s proven LIGHTSPEED wireless technology for reliable performance, ensuring low-latency wireless connectivity.\r\nCompatible with Logitech\'s LIGHTSPEED wireless adapter for maximum performance with compatible hardware.\r\nFeatures:\r\n\r\nGame Mode switch to prevent accidental interruptions during gameplay.\r\nDedicated volume control knob and strategically placed multimedia controls for easy access without losing focus on the game.','products/T1.png','products/T11.png',100,4),
(51,'LOGITECH G915 RGB MECHANIC',910000,'Logitech','ChatGPT\r\nThe Logitech G915 RGB Mechanical Keyboard is meticulously crafted with premium materials, offering unparalleled beauty, durability, and performance. Here are its key features:\r\n\r\nDesign and Build:\r\n\r\nConstructed with premium materials, the G915 boasts a sophisticated design that blends aesthetics with robustness and functionality.\r\nWireless Technology:\r\n\r\nUtilizes Logitech\'s LIGHTSPEED wireless technology for professional-grade wireless performance with a blazing-fast 1 ms response time.\r\nCan also be used wired via USB, allowing simultaneous charging and usage.\r\nMechanical Switches:\r\n\r\nFeatures Logitech\'s new low-profile GL mechanical switches, offering high performance with half the height of traditional switches.\r\nThree types of switches available:\r\nGL Clicky - Audible click and tactile feedback.\r\nGL Tactile - Soft bump for tactile feel.\r\nGL Linear - Smooth keystroke without tactile feedback.\r\nBattery Life and Charging:\r\n\r\nProvides hours of uninterrupted gaming on a single charge.\r\nBattery status indicator on the keyboard and Logitech G HUB notifies when battery is at 15%.\r\nFully rechargeable in just three hours via micro USB, allowing continuous gaming while charging.\r\nDual Connectivity:\r\n\r\nSeamlessly switch between LIGHTSPEED wireless for high-performance gaming and Bluetooth for connectivity to other devices with the press of a button.\r\nMultimedia Controls:\r\n\r\nIntegrated multimedia controls for quick adjustments to volume, playback, skip, and mute functions, ensuring convenience during gameplay or multimedia tasks.','products/T2.png','products/T22.png',100,4),
(52,'LOGITECH PRO X TKL LIGHTSPEED US SW BROWN',830000,'Logitech','The Logitech PRO X TKL LIGHTSPEED is designed to deliver high performance, speed, and reliability, perfect for competitive gaming. Featuring Logitech\'s proven LIGHTSPEED wireless technology, it ensures ultra-fast and stable connectivity with minimal latency. You can connect both your mouse and keyboard using a single adapter, streamlining setup and freeing up USB ports. It includes programmable keys for customization, RGB lighting with LIGHTSYNC for synchronized effects across compatible Logitech devices, and essential gaming features like a dedicated game mode button and new game mode lock function to prevent interruptions during intense gaming sessions. Built for professional gamers aiming for championships, it boasts double-shot PBT keycaps for durability and a premium tactile feel, standard keyboard layouts for compatibility with third-party software, and multiple connectivity options including LIGHTSPEED for maximum speed, Bluetooth for flexibility, and USB for direct connection.','products/T3.png','products/T33.png',100,4),
(53,'RAZER HUNTSMAN MINI 60% MERCURY ING SW',480000,'RAZER','The Razer Huntsman Mini 60% Mercury brings gaming to a new lethal dimension with its compact size and Razer™ Optical Switches. Perfect for small desks or minimal setups, it delivers lightning-fast actuation in a sleek, portable design. Despite omitting the function row, home cluster, and numeric pad of a full-sized keyboard, it maintains full functionality through secondary functions and shortcuts. Designed for durability, its premium textured keycaps resist wear and maintain clarity over intensive use. Secondary functions are conveniently printed on the sides for easy reference when executing commands or shortcuts. With onboard memory, it stores and activates settings across 5 keyboard profiles without needing software, while further customization is enabled through preloaded Razer Chroma RGB lighting effects.','products/T4.png','products/T44.png',100,4),
(54,'RAZER BLACKWIDOW V4 X SW YELLOW',480000,'RAZER','The Razer BlackWidow V4 X with Yellow switches enhances your command capabilities, whether unleashing your ultimate ability or optimizing skill rotations. It features easily accessible macro keys programmable to your gaming style. Enjoy ultimate convenience with controls for pause, play, skip, and adjust brightness and volume, ensuring leisurely enjoyment. Choose between two distinct switch options: Green for precise execution with tactile feedback and audible click, or Yellow for fast, smooth, and silent operation. The switches\' design facilitates brighter, more uniform lighting, customizable across each key with over 16.8 million colors and effects, including dynamic Chroma integration in hundreds of games. Built for durability, the keycaps utilize a double injection molding process to prevent label wear, with extra-thick walls capable of withstanding intensive use. The Razer BlackWidow V4 X ensures a satisfying typing experience with a special foam layer beneath the printed circuit board and lubricated stabilizers to minimize noise.','products/T5.png','products/T55.png',100,4),
(55,'LOGITECH G PRO RGB LIGHTSYNC SW BLUE',520000,'Logitech','The Logitech G Pro RGB with LIGHTSYNC in Blue is a tournament-proven gaming keyboard, now equipped with advanced GX mechanical switches featuring audible click feedback.\r\n\r\nDesigned based on professional feedback, the PRO X boasts a compact layout and professional switches with a perceptible click, ensuring tournament-grade reliability and performance.\r\n\r\nThe advanced GX mechanical switches with audible click and tactile bump are engineered for maximum performance, responsiveness, and durability, delivering precise feedback during intense gaming sessions.\r\n\r\nWith its tenkeyless design and detachable cable, the keyboard offers more space for mouse movement and easy portability during travels to tournaments worldwide.\r\n\r\nCustomize key highlights or proudly display team colors with personalized lighting and animations using Logitech\'s G HUB software. Save static lighting designs directly onto the keyboard\'s integrated memory for seamless tournament setups.\r\n\r\nThe detachable micro USB cable with a three-pronged design ensures a secure connection and convenient portability in your travel bag.\r\n\r\nFor intense gaming moments, rubber feet keep the keyboard firmly in place, while the three-step adjustment allows you to customize the keyboard angle for optimal comfort during extended play sessions.','products/T6.png','products/T66.png',100,4),
(56,'KINGSTON HYPERX ALLOY ELITE 2 RGB-RED',420000,'KINGSTON','The Kingston HyperX Alloy Elite 2 RGB-Red is a versatile gaming keyboard equipped with dedicated multimedia keys and a large volume wheel, catering to tasks from video editing to movie watching. It features reliable HyperX mechanical switches balanced for speed and responsiveness, ensuring dependable keystrokes during intense gaming sessions. The exposed LED design on the keys pairs with translucent HyperX Pudding Keycaps to enhance RGB lighting with extra brightness compared to solid-colored keys.\r\n\r\nCustomize the signature light bar and create lighting profiles using the intuitive HyperX NGENUITY software for vibrant color displays. Further personalize your setup with game modes and custom macros through the software. A built-in USB 2.0 pass-through port provides additional connectivity for multitasking needs. The sturdy steel frame of the Alloy Elite 2 ensures durability for both work and play, making it a reliable choice for daily use.','products/T7.png','products/T77.png',100,4),
(57,'RAZER TARTARUS V2 RGB',560000,'RAZER','The Razer Tartarus V2 RGB keyboard provides essential responsiveness and control for swift execution of commands during intense gaming scenarios. It combines the soft, cushioned feel of a membrane rubber dome with the precise, tactile click of a mechanical switch. Each key actuates halfway for instant response, allowing you to trigger commands faster than ever before.\r\n\r\nFeaturing a fully programmable arsenal of 32 keys for skills, shortcuts, and macros within easy reach, along with an 8-way directional pad for seamless navigation or expanded commands. Its advanced ergonomics ensure comfort even during extended gaming sessions, complemented by a removable wrist rest with two adjustable positions to suit your preferred comfort angle.','products/T8.png','products/T88.png',100,4),
(58,'LOGITECH POP KEYS YELLOW',360000,'Logitech','Logitech POP Keys in Heartbreaker brings vibrant coral and raspberry colors to a keyboard designed for expressive communicators. Featuring eight interchangeable emoji keys, POP Keys lets you customize them to match your mood or communication style. Assign these keys to your favorite emojis using Logi Options+ software, or choose them on the fly with the emoji menu key while chatting with friends.\r\n\r\nEnjoy a nostalgic typing experience reminiscent of typewriters with mechanical-style keys that offer satisfying tactile feedback with every press. Despite its vintage aesthetic, POP Keys integrates modern functionality with 12 new FN shortcuts for tasks like screen capture, voice-to-text activation, and microphone mute during meetings.\r\n\r\nEasily switch between three paired devices simultaneously using POP Keys\' Easy-Switch keys, supporting Bluetooth wireless technology or Logi Bolt USB receiver connectivity across Windows, macOS, Chrome OS™, Android™, iOS, and iPadOS devices. Its compact layout saves space, placing keys ergonomically for precise and comfortable typing, reducing arm strain and improving posture.\r\n\r\nBuilt to last, POP Keys boasts a battery life of up to three years and keys rated for up to 50 million keystrokes, ensuring durability and reliability for extensive creative and communicative sessions. Pair it with other Logitech accessories like POP Mouse, StreamCam, G733 headset, and the Logitech desk mat for a complete, stylish productivity setup.','products/T9.png','products/T99.png',100,4),
(59,'REDRAGON FIZZ PRO K616 RGB',230000,'REDRAGON','The Redragon Fizz Pro K616 RGB is designed to enhance gaming performance with its compact 60% layout and detachable cable, providing ample space for mouse movement during gameplay. It features a 1600mAh 3.8V battery that offers up to 14 days of autonomy with continuous daily use of up to 6 hours, even with all lighting effects active. An integrated LED battery level indicator keeps you informed about the charge status.\r\n\r\nConstructed with double-shot molded keycaps, where two ABS plastic pieces are fused to ensure legends never fade. The textured matte finish on the outer layer prevents oil and sweat stains, keeping the keyboard clean and durable over time.\r\n\r\nThe K616-RGB Fizz Pro utilizes mechanical switches known for their quiet operation and linear travel. These switches are also compatible with other Redragon switch types and are rated for an impressive lifespan of up to 50 million keystrokes, ensuring long-lasting reliability for intense gaming sessions.','products/T10.png','products/T1010.png',100,4),
(60,'RAZER ORNATA V3 X LP RGB',200000,'RAZER','The Razer Ornata V3 X LP RGB features ultra-thin keycaps and shorter switches, allowing for a more natural hand placement on its low-profile ergonomic design, ideal for extended gaming or typing sessions with minimal pressure. It prioritizes a quieter and comfortable experience while gaming or typing. The integrated wrist rest provides optimal wrist support, enhancing comfort during prolonged use.\r\n\r\nBuilt robustly, the Razer Ornata V3 X handles intense gaming sessions with ease and is resistant to minor splashes, ensuring durability and reliability. Its cable management design includes slots for easy cable routing in any direction, keeping your desk clutter-free.\r\n\r\nWith customizable RGB lighting offering 16.8 million colors and a variety of dynamic effects through integrated Chroma, you can personalize the keyboard to match your preferences and enjoy immersive lighting effects tailored for hundreds of games.','products/T12.png','products/T1212.png',100,4);
/*!40000 ALTER TABLE `store_product` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*M!100616 SET NOTE_VERBOSITY=@OLD_NOTE_VERBOSITY */;

-- Dump completed on 2024-07-24 14:22:57
