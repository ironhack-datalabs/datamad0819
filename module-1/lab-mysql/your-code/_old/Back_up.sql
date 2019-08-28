-- MySQL dump 10.13  Distrib 8.0.16, for Win64 (x86_64)
--
-- Host: localhost    Database: lab_mysql
-- ------------------------------------------------------
-- Server version	8.0.16

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cars`
--

DROP TABLE IF EXISTS `cars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `cars` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `car_VIN` varchar(45) NOT NULL,
  `manufacturer` varchar(45) NOT NULL,
  `model` varchar(45) NOT NULL,
  `year` varchar(45) NOT NULL,
  `color` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cars`
--

LOCK TABLES `cars` WRITE;
/*!40000 ALTER TABLE `cars` DISABLE KEYS */;
INSERT INTO `cars` VALUES (1,'3K096I98581DHSNUP','Volkswagen','Tiguan','2019','Blue'),(2,'ZM8G7BEUQZ97IH46V','Peugeot','Rifter','2019','Red'),(3,'RKXVNNIHLVVZOUB4M','Ford','Fusion','2018','White'),(4,'HKNDGS7CU31E9Z7JW','Toyota','RAV4','2018','Silver'),(5,'DAM41UDN3CHU2WVF6','Volvo','V60','2019','Gray'),(6,'DAM41UDN3CHU2WVF6','Volvo','V60 Cross Country','2019','Gray');
/*!40000 ALTER TABLE `cars` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `customers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `phone number` varchar(45) NOT NULL,
  `email` varchar(45) DEFAULT NULL,
  `address` varchar(45) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `province` varchar(45) DEFAULT NULL,
  `country` varchar(45) DEFAULT NULL,
  `zip` int(6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1,10001,'Pablo Picasso','+34 636 17 63 82','-','Paseo de la Chopera, 14','Madrid','Madrid','Spain',28045),(2,20001,'Abraham Lincoln','+1 305 907 7086','-','120 SW 8th St','Miami','Florida','United States',33130),(3,30001,'Napoléon Bonaparte','+33 1 79 75 40 00','-','40 Rue du Colisée','Paris','Île-de-France','France',75008);
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoices`
--

DROP TABLE IF EXISTS `invoices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `invoices` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `invoice_number` int(11) NOT NULL,
  `date` varchar(45) NOT NULL,
  `Cars_id` int(11) NOT NULL,
  `Customers_id` int(11) NOT NULL,
  `Salesperson_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Invoices_Cars1_idx` (`Cars_id`),
  KEY `fk_Invoices_Customers1_idx` (`Customers_id`),
  KEY `fk_Invoices_Salesperson1_idx` (`Salesperson_id`),
  CONSTRAINT `fk_Invoices_Cars1` FOREIGN KEY (`Cars_id`) REFERENCES `cars` (`id`),
  CONSTRAINT `fk_Invoices_Customers1` FOREIGN KEY (`Customers_id`) REFERENCES `customers` (`id`),
  CONSTRAINT `fk_Invoices_Salesperson1` FOREIGN KEY (`Salesperson_id`) REFERENCES `salesperson` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoices`
--

LOCK TABLES `invoices` WRITE;
/*!40000 ALTER TABLE `invoices` DISABLE KEYS */;
INSERT INTO `invoices` VALUES (4,852399038,'22-08-2018',1,2,4),(5,731166526,'31-12-2018',4,1,6),(6,271135104,'22-01-2019',3,3,8);
/*!40000 ALTER TABLE `invoices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salesperson`
--

DROP TABLE IF EXISTS `salesperson`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `salesperson` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `staff_id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `store` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salesperson`
--

LOCK TABLES `salesperson` WRITE;
/*!40000 ALTER TABLE `salesperson` DISABLE KEYS */;
INSERT INTO `salesperson` VALUES (1,1,'Petey Cruiser','Madrid'),(2,2,'Anna Sthesia','Barcelona'),(3,3,'Paul Molive','Berlin'),(4,4,'Gail Forcewind','Paris'),(5,5,'Paige Turner','Mimia'),(6,6,'Bob Frapples','Mexico City'),(7,7,'Walter Melon','Amsterdam'),(8,8,'Shonda Leer','São Paulo');
/*!40000 ALTER TABLE `salesperson` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-08-28 16:57:06
