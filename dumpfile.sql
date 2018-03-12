-- MySQL dump 10.13  Distrib 5.7.21, for Linux (x86_64)
--
-- Host: localhost    Database: FLIGHT
-- ------------------------------------------------------
-- Server version	5.7.21-0ubuntu0.16.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `AIRCRAFT`
--

DROP TABLE IF EXISTS `AIRCRAFT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AIRCRAFT` (
  `AID` int(11) NOT NULL,
  `ANAME` varchar(30) DEFAULT NULL,
  `CRUISINGRANGE` int(11) DEFAULT NULL,
  PRIMARY KEY (`AID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AIRCRAFT`
--

LOCK TABLES `AIRCRAFT` WRITE;
/*!40000 ALTER TABLE `AIRCRAFT` DISABLE KEYS */;
INSERT INTO `AIRCRAFT` VALUES (100,'AIR INDIA',10000),(200,'SPICE JET',2000),(300,'JET AIRWAYS',1500),(400,'INDIGO AIRLINES',5000),(500,'TRUJET',2000);
/*!40000 ALTER TABLE `AIRCRAFT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CERTIFIED`
--

DROP TABLE IF EXISTS `CERTIFIED`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CERTIFIED` (
  `EID` int(11) NOT NULL,
  `AID` int(11) NOT NULL,
  PRIMARY KEY (`EID`,`AID`),
  KEY `CERTIFIEDFK` (`AID`),
  CONSTRAINT `CERTIFIEDFK` FOREIGN KEY (`AID`) REFERENCES `AIRCRAFT` (`AID`),
  CONSTRAINT `CERTIFIEDFK2` FOREIGN KEY (`EID`) REFERENCES `EMPLOYEES` (`EID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CERTIFIED`
--

LOCK TABLES `CERTIFIED` WRITE;
/*!40000 ALTER TABLE `CERTIFIED` DISABLE KEYS */;
INSERT INTO `CERTIFIED` VALUES (101,100),(102,100),(201,200),(202,200),(301,300),(401,400),(402,400),(501,500),(502,500);
/*!40000 ALTER TABLE `CERTIFIED` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EMPLOYEES`
--

DROP TABLE IF EXISTS `EMPLOYEES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `EMPLOYEES` (
  `EID` int(11) NOT NULL,
  `ENAME` varchar(50) DEFAULT NULL,
  `SALARY` int(11) DEFAULT NULL,
  PRIMARY KEY (`EID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EMPLOYEES`
--

LOCK TABLES `EMPLOYEES` WRITE;
/*!40000 ALTER TABLE `EMPLOYEES` DISABLE KEYS */;
INSERT INTO `EMPLOYEES` VALUES (101,'PAVAN CHAITHANYA',10000000),(102,'SAI PHANI',300000),(201,'SREE CHARAN',400000000),(202,'SANKAR MANTRIPRAGADA',2400000),(301,'BETANABOTLA KAUSHIK',10000),(401,'ANEESH HIREGANGE',3600000),(402,'PUSH PULL',100000),(501,'BONAPARTE',300000),(502,'OBLIVION',500000);
/*!40000 ALTER TABLE `EMPLOYEES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FLIGHTS`
--

DROP TABLE IF EXISTS `FLIGHTS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FLIGHTS` (
  `FLNO` int(11) NOT NULL,
  `SRC` varchar(50) DEFAULT NULL,
  `DEST` varchar(50) DEFAULT NULL,
  `DISTANCE` int(11) DEFAULT NULL,
  `DEPARTS` time DEFAULT NULL,
  `ARRIVES` time DEFAULT NULL,
  `PRICE` int(11) DEFAULT NULL,
  PRIMARY KEY (`FLNO`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FLIGHTS`
--

LOCK TABLES `FLIGHTS` WRITE;
/*!40000 ALTER TABLE `FLIGHTS` DISABLE KEYS */;
INSERT INTO `FLIGHTS` VALUES (1,'HYDERABAD','CHENNAI',860,'06:15:00','07:20:00',1600),(2,'NEW DELHI','HYDERABAD',1000,'11:15:00','13:15:00',4000),(3,'MUMBAI','BANGALORE',700,'12:00:00','13:30:00',3500),(4,'GOA','HYDERABAD',900,'07:35:00','09:30:00',6000),(5,'JABALPUR','HYDERABAD',850,'06:00:00','07:15:00',2500),(10,'CHENNAI','HYDERABAD',860,'05:45:00','06:50:00',2000),(20,'HYDERABAD','NEW DELHI',1000,'13:45:00','16:00:00',4500),(30,'BANGALORE','MUMBAI',700,'00:00:00','01:25:00',4000),(40,'HYDERABAD','GOA',900,'04:20:00','06:40:00',5500),(50,'HYDERABAD','JABALPUR',850,'18:00:00','19:20:00',2350);
/*!40000 ALTER TABLE `FLIGHTS` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-02-26 18:01:24
