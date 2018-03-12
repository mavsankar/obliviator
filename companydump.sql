-- MySQL dump 10.13  Distrib 5.7.21, for Linux (x86_64)
--
-- Host: localhost    Database: COMPANY
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
-- Temporary table structure for view `ASSMT`
--

DROP TABLE IF EXISTS `ASSMT`;
/*!50001 DROP VIEW IF EXISTS `ASSMT`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `ASSMT` AS SELECT 
 1 AS `SSN`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `ASSMT20`
--

DROP TABLE IF EXISTS `ASSMT20`;
/*!50001 DROP VIEW IF EXISTS `ASSMT20`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `ASSMT20` AS SELECT 
 1 AS `SSN`,
 1 AS `DNO`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `DEPENDENT`
--

DROP TABLE IF EXISTS `DEPENDENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DEPENDENT` (
  `Essn` char(9) NOT NULL,
  `Dependent_name` varchar(50) NOT NULL,
  `Sex` char(1) DEFAULT NULL,
  `Bdate` date DEFAULT NULL,
  `Relationship` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`Essn`,`Dependent_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DEPENDENT`
--

LOCK TABLES `DEPENDENT` WRITE;
/*!40000 ALTER TABLE `DEPENDENT` DISABLE KEYS */;
INSERT INTO `DEPENDENT` VALUES ('1','Konohamaru','M','2000-11-11','Son'),('10','Sasuke Uchiha','M','2007-08-01','Brother'),('2','Suhas','M','2000-11-11','Son'),('3','Elephant','F','1997-04-24','Wife'),('3','Sakura','F','1960-11-11','Daughter'),('5','Hinata hyuuga','F','1998-04-04','Wife'),('5','Uzumaki Boruto','M','2004-02-14','Son'),('5','Uzumaki Himawari','F','2010-12-02','Daughter'),('6','Littlegirl','F','2001-02-04','Wife'),('8','Kurama','M','2001-09-15','Son'),('9','Edward Alphonse','M','2010-05-10','Brother');
/*!40000 ALTER TABLE `DEPENDENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DEPT`
--

DROP TABLE IF EXISTS `DEPT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DEPT` (
  `Dname` varchar(20) NOT NULL,
  `Dnumber` int(11) NOT NULL,
  `Mgrssn` char(9) NOT NULL,
  `mgrstartdate` date DEFAULT NULL,
  PRIMARY KEY (`Dnumber`),
  KEY `mgrssnfk` (`Mgrssn`),
  CONSTRAINT `mgrssnfk` FOREIGN KEY (`Mgrssn`) REFERENCES `EMPLOYEE` (`Ssn`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DEPT`
--

LOCK TABLES `DEPT` WRITE;
/*!40000 ALTER TABLE `DEPT` DISABLE KEYS */;
INSERT INTO `DEPT` VALUES ('Computer Engineering',1,'4','2016-01-01'),('Electronics DM',2,'3','2003-02-03'),('Mechanical DM',3,'5','2017-10-10'),('Civil Engineering',4,'8','2017-12-31'),('Electrical Engg',5,'10','2018-01-01');
/*!40000 ALTER TABLE `DEPT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DEPT_LOCATIONS`
--

DROP TABLE IF EXISTS `DEPT_LOCATIONS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DEPT_LOCATIONS` (
  `Dnumber` int(11) NOT NULL,
  `Dlocation` varchar(15) NOT NULL,
  PRIMARY KEY (`Dnumber`,`Dlocation`),
  CONSTRAINT `dnumberfk` FOREIGN KEY (`Dnumber`) REFERENCES `DEPT` (`Dnumber`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DEPT_LOCATIONS`
--

LOCK TABLES `DEPT_LOCATIONS` WRITE;
/*!40000 ALTER TABLE `DEPT_LOCATIONS` DISABLE KEYS */;
INSERT INTO `DEPT_LOCATIONS` VALUES (1,'Chennai'),(1,'Hyderabad'),(2,'Bangalore'),(2,'Chennai'),(3,'Bangalore'),(3,'New Delhi'),(4,'Hyderabad'),(5,'Mumbai');
/*!40000 ALTER TABLE `DEPT_LOCATIONS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EMPLOYEE`
--

DROP TABLE IF EXISTS `EMPLOYEE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `EMPLOYEE` (
  `Fname` varchar(15) NOT NULL,
  `Mname` varchar(15) DEFAULT NULL,
  `Lname` varchar(15) NOT NULL,
  `Ssn` char(9) NOT NULL,
  `Bdate` date DEFAULT NULL,
  `Address` varchar(50) DEFAULT NULL,
  `Gender` char(1) DEFAULT NULL,
  `Salary` decimal(10,2) DEFAULT NULL,
  `Superssn` char(9) DEFAULT NULL,
  `Dno` int(11) NOT NULL,
  PRIMARY KEY (`Ssn`),
  KEY `superssnfk` (`Superssn`),
  CONSTRAINT `superssnfk` FOREIGN KEY (`Superssn`) REFERENCES `EMPLOYEE` (`Ssn`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EMPLOYEE`
--

LOCK TABLES `EMPLOYEE` WRITE;
/*!40000 ALTER TABLE `EMPLOYEE` DISABLE KEYS */;
INSERT INTO `EMPLOYEE` VALUES ('Anjani','Sankar','Mantripragada','1','1998-11-24','Hyderabad','M',2000000.00,'5',1),('Itachi',NULL,'Uchiha','10','1998-05-25','Eluru','M',900000.00,'5',5),('Shikamaru','NULL','Nara','11','1997-12-12','Hiroshima','M',100000.00,NULL,3),('daada','das','dad','12','1998-11-24','dashba','F',10.00,'1',3),('Sudheer','babu','manukonda','2','1998-03-12','Tanuku','M',5000000.00,'5',1),('Kaushik','mithai','Betanabotla','3','1997-04-24','Hyderabad','M',10000.00,'7',2),('Pavan','Chaithanya','Thatavarthy','4','1999-05-28','Kavali','M',9000000.00,'5',1),('Uzumaki','Naruto','kun','5','1997-10-10','Konohagakure','M',100000.00,'7',3),('Aneesh','Dinesh','Hiregange','6','1998-12-15','Kaiga','M',9000000.00,'5',1),('Sai','Phani','Vallabhaneni','7','1998-08-08','Warangal','M',900000.00,'5',1),('Minato',NULL,'Namikaze','8','1991-01-25','Nagasaki','M',5000000.00,NULL,4),('Edward',NULL,'Elrich','9','1991-05-25','Vizag','M',500000.00,'7',5);
/*!40000 ALTER TABLE `EMPLOYEE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EMPLOYEEBACKUP`
--

DROP TABLE IF EXISTS `EMPLOYEEBACKUP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `EMPLOYEEBACKUP` (
  `Fname` varchar(15) NOT NULL,
  `Mname` varchar(15) DEFAULT NULL,
  `Lname` varchar(15) NOT NULL,
  `Ssn` char(9) NOT NULL,
  `Bdate` date DEFAULT NULL,
  `Address` varchar(50) DEFAULT NULL,
  `Gender` char(1) DEFAULT NULL,
  `Salary` decimal(10,2) DEFAULT NULL,
  `Superssn` char(9) DEFAULT NULL,
  `Dno` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EMPLOYEEBACKUP`
--

LOCK TABLES `EMPLOYEEBACKUP` WRITE;
/*!40000 ALTER TABLE `EMPLOYEEBACKUP` DISABLE KEYS */;
INSERT INTO `EMPLOYEEBACKUP` VALUES ('Anjani','Sankar','Mantripragada','1','1998-11-24','Hyderabad','M',2000000.00,'5',1),('Itachi',NULL,'Uchiha','10','1998-05-25','Eluru','M',900000.00,'5',5),('Shikamaru','NULL','Nara','11','1997-12-12','Hiroshima','M',100000.00,NULL,3),('daada','das','dad','12','1998-11-24','dashba','F',10.00,'1',3),('Sudheer','babu','manukonda','2','1998-03-12','Tanuku','M',5000000.00,'5',1),('Kaushik','mithai','Betanabotla','3','1997-04-24','Hyderabad','M',10000.00,'7',2),('Pavan','Chaithanya','Thatavarthy','4','1999-05-28','Kavali','M',9000000.00,'5',1),('Uzumaki','Naruto','kun','5','1997-10-10','Konohagakure','M',100000.00,'7',3),('Aneesh','Dinesh','Hiregange','6','1998-12-15','Kaiga','M',9000000.00,'5',1),('Sai','Phani','Vallabhaneni','7','1998-08-08','Warangal','M',900000.00,'5',1),('Minato',NULL,'Namikaze','8','1991-01-25','Nagasaki','M',5000000.00,NULL,4),('Edward',NULL,'Elrich','9','1991-05-25','Vizag','M',500000.00,'7',5);
/*!40000 ALTER TABLE `EMPLOYEEBACKUP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EMPLOYEE_BACKUP`
--

DROP TABLE IF EXISTS `EMPLOYEE_BACKUP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `EMPLOYEE_BACKUP` (
  `Fname` varchar(15) NOT NULL,
  `Mname` varchar(15) DEFAULT NULL,
  `Lname` varchar(15) NOT NULL,
  `Ssn` char(9) NOT NULL,
  `Bdate` date DEFAULT NULL,
  `Address` varchar(50) DEFAULT NULL,
  `Gender` char(1) DEFAULT NULL,
  `Salary` decimal(10,2) DEFAULT NULL,
  `Superssn` char(9) DEFAULT NULL,
  `Dno` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EMPLOYEE_BACKUP`
--

LOCK TABLES `EMPLOYEE_BACKUP` WRITE;
/*!40000 ALTER TABLE `EMPLOYEE_BACKUP` DISABLE KEYS */;
INSERT INTO `EMPLOYEE_BACKUP` VALUES ('Anjani','Sankar','Mantripragada','1','1998-11-24','Hyderabad','M',2000000.00,'5',1),('Itachi',NULL,'Uchiha','10','1998-05-25','Eluru','M',900000.00,'5',5),('Shikamaru','NULL','Nara','11','1997-12-12','Hiroshima','M',100000.00,NULL,3),('daada','das','dad','12','1998-11-24','dashba','F',10.00,'1',3),('Sudheer','babu','manukonda','2','1998-03-12','Tanuku','M',5000000.00,'5',1),('Kaushik','mithai','Betanabotla','3','1997-04-24','Hyderabad','M',10000.00,'7',2),('Pavan','Chaithanya','Thatavarthy','4','1999-05-28','Kavali','M',9000000.00,'5',1),('Uzumaki','Naruto','kun','5','1997-10-10','Konohagakure','M',100000.00,'7',3),('Aneesh','Dinesh','Hiregange','6','1998-12-15','Kaiga','M',9000000.00,'5',1),('Sai','Phani','Vallabhaneni','7','1998-08-08','Warangal','M',900000.00,'5',1),('Minato',NULL,'Namikaze','8','1991-01-25','Nagasaki','M',5000000.00,NULL,4),('Edward',NULL,'Elrich','9','1991-05-25','Vizag','M',500000.00,'7',5);
/*!40000 ALTER TABLE `EMPLOYEE_BACKUP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PROJECT`
--

DROP TABLE IF EXISTS `PROJECT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PROJECT` (
  `Pname` varchar(50) NOT NULL,
  `Pnumber` int(11) NOT NULL,
  `Plocation` varchar(20) DEFAULT NULL,
  `Dnum` int(11) NOT NULL,
  PRIMARY KEY (`Pnumber`),
  KEY `dnumfk` (`Dnum`),
  CONSTRAINT `dnumfk` FOREIGN KEY (`Dnum`) REFERENCES `DEPT` (`Dnumber`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PROJECT`
--

LOCK TABLES `PROJECT` WRITE;
/*!40000 ALTER TABLE `PROJECT` DISABLE KEYS */;
INSERT INTO `PROJECT` VALUES ('Samgatha Webops',1,'Chennai',1),('Processor logic making',2,'Beijing',2),('Optimization of iv-tech engines',3,'Hyderabad',3),('Smart architectures',4,'Kolkata',4),('Lossless electricity transfer',5,'Singareni',5);
/*!40000 ALTER TABLE `PROJECT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `VNAME`
--

DROP TABLE IF EXISTS `VNAME`;
/*!50001 DROP VIEW IF EXISTS `VNAME`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `VNAME` AS SELECT 
 1 AS `FNAME`,
 1 AS `MNAME`,
 1 AS `LNAME`,
 1 AS `SSN`,
 1 AS `DNO`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `WORKS_BACK`
--

DROP TABLE IF EXISTS `WORKS_BACK`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `WORKS_BACK` (
  `ESSN` char(9) DEFAULT NULL,
  `PNO` int(11) DEFAULT NULL,
  `HOURS` decimal(3,1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `WORKS_BACK`
--

LOCK TABLES `WORKS_BACK` WRITE;
/*!40000 ALTER TABLE `WORKS_BACK` DISABLE KEYS */;
/*!40000 ALTER TABLE `WORKS_BACK` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `WORKS_ON`
--

DROP TABLE IF EXISTS `WORKS_ON`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `WORKS_ON` (
  `Essn` char(9) NOT NULL,
  `Pno` int(11) NOT NULL,
  `Hours` decimal(3,1) NOT NULL,
  PRIMARY KEY (`Essn`,`Pno`),
  KEY `pnofk` (`Pno`),
  CONSTRAINT `essnfk` FOREIGN KEY (`Essn`) REFERENCES `EMPLOYEE` (`Ssn`),
  CONSTRAINT `pnofk` FOREIGN KEY (`Pno`) REFERENCES `PROJECT` (`Pnumber`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `WORKS_ON`
--

LOCK TABLES `WORKS_ON` WRITE;
/*!40000 ALTER TABLE `WORKS_ON` DISABLE KEYS */;
INSERT INTO `WORKS_ON` VALUES ('1',1,8.2),('2',1,8.0),('5',3,9.0),('6',1,10.0),('7',1,20.0),('7',4,10.0),('8',4,6.0),('9',1,2.5),('9',2,5.0),('9',3,8.0),('9',4,7.0),('9',5,8.0);
/*!40000 ALTER TABLE `WORKS_ON` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `ASSMT`
--

/*!50001 DROP VIEW IF EXISTS `ASSMT`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`sankar`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `ASSMT` AS select `E1`.`Ssn` AS `SSN` from `EMPLOYEE` `E1` where (select count(0) from `WORKS_ON` where (`WORKS_ON`.`Essn` = `E1`.`Ssn`)) <= all (select count(0) from (`EMPLOYEE` join `WORKS_ON`) where ((`WORKS_ON`.`Essn` = `EMPLOYEE`.`Ssn`) and (`EMPLOYEE`.`Dno` = `E1`.`Dno`)) group by `EMPLOYEE`.`Ssn`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `ASSMT20`
--

/*!50001 DROP VIEW IF EXISTS `ASSMT20`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`sankar`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `ASSMT20` AS select `E1`.`Ssn` AS `SSN`,`E1`.`Dno` AS `DNO` from `EMPLOYEE` `E1` where ((select count(0) from `WORKS_ON` where (`WORKS_ON`.`Essn` = `E1`.`Ssn`)) <= all (select count(0) from (`EMPLOYEE` join `WORKS_ON`) where ((`WORKS_ON`.`Essn` = `EMPLOYEE`.`Ssn`) and (`EMPLOYEE`.`Dno` = `E1`.`Dno`)) group by `EMPLOYEE`.`Ssn`) and ((select count(0) from `WORKS_ON` where (`WORKS_ON`.`Essn` = `E1`.`Ssn`)) <> 0)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `VNAME`
--

/*!50001 DROP VIEW IF EXISTS `VNAME`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`sankar`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `VNAME` AS select `EMPLOYEE`.`Fname` AS `FNAME`,`EMPLOYEE`.`Mname` AS `MNAME`,`EMPLOYEE`.`Lname` AS `LNAME`,`EMPLOYEE`.`Ssn` AS `SSN`,`EMPLOYEE`.`Dno` AS `DNO` from ((`EMPLOYEE` join `WORKS_ON`) join `PROJECT`) where ((`WORKS_ON`.`Essn` = `EMPLOYEE`.`Ssn`) and (`WORKS_ON`.`Pno` = `PROJECT`.`Pnumber`) and `WORKS_ON`.`Pno` in (select `WORKS_ON`.`Pno` from `WORKS_ON` where `WORKS_ON`.`Essn` in (select `WORKS_ON`.`Essn` from `WORKS_ON` group by `WORKS_ON`.`Essn` having count(0) <= all (select count(0) from `WORKS_ON` group by `WORKS_ON`.`Essn`)))) order by `EMPLOYEE`.`Dno` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-03-02 16:27:17
