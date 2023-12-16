CREATE DATABASE  IF NOT EXISTS `school` /*!40100 DEFAULT CHARACTER SET latin1 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `school`;
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: school
-- ------------------------------------------------------
-- Server version	8.1.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Temporary view structure for view `absentstudentlistview`
--

DROP TABLE IF EXISTS `absentstudentlistview`;
/*!50001 DROP VIEW IF EXISTS `absentstudentlistview`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `absentstudentlistview` AS SELECT 
 1 AS `id`,
 1 AS `studentId`,
 1 AS `rollNo`,
 1 AS `studentName`,
 1 AS `fatherName`,
 1 AS `mobNumber`,
 1 AS `classId`,
 1 AS `className`,
 1 AS `divId`,
 1 AS `divName`,
 1 AS `classTeacherId`,
 1 AS `teacherName`,
 1 AS `attendanceDate`,
 1 AS `attendanceResult`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `addattendancestudentlistview`
--

DROP TABLE IF EXISTS `addattendancestudentlistview`;
/*!50001 DROP VIEW IF EXISTS `addattendancestudentlistview`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `addattendancestudentlistview` AS SELECT 
 1 AS `studentId`,
 1 AS `studentName`,
 1 AS `classId`,
 1 AS `divId`,
 1 AS `divName`,
 1 AS `className`,
 1 AS `rollNo`,
 1 AS `classTeacherId`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `admission`
--

DROP TABLE IF EXISTS `admission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `studentId` int DEFAULT NULL,
  `firstName` varchar(255) DEFAULT NULL,
  `middleName` varchar(255) DEFAULT NULL,
  `lastName` varchar(255) DEFAULT NULL,
  `profileImage` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `dateOfBirth` varchar(255) DEFAULT NULL,
  `classId` int DEFAULT NULL,
  `divId` int DEFAULT NULL,
  `rollNo` int DEFAULT NULL,
  `motherName` varchar(255) DEFAULT NULL,
  `motherQual` varchar(255) DEFAULT NULL,
  `motherProf` varchar(255) DEFAULT NULL,
  `fatherName` varchar(255) DEFAULT NULL,
  `fatherQual` varchar(255) DEFAULT NULL,
  `fatherProf` varchar(255) DEFAULT NULL,
  `parentNumber` varchar(255) DEFAULT NULL,
  `parentNumberSecond` varchar(255) DEFAULT NULL,
  `nationality` varchar(255) DEFAULT NULL,
  `religion` varchar(255) DEFAULT NULL,
  `caste` varchar(255) DEFAULT NULL,
  `bloodGroup` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `cityId` int DEFAULT NULL,
  `stateId` int DEFAULT NULL,
  `pincode` varchar(255) DEFAULT NULL,
  `prevPercentage` varchar(45) DEFAULT '0',
  `createdAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `createdBy` varchar(255) DEFAULT NULL,
  `updatedAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updatedBy` varchar(255) DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `paymentId` int DEFAULT NULL,
  `isallocated` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admission`
--

LOCK TABLES `admission` WRITE;
/*!40000 ALTER TABLE `admission` DISABLE KEYS */;
INSERT INTO `admission` VALUES (43,2,'Jane','B.','Smith','profile2.jpg','2','2001-02-15',2,2,201,'Emily Smith','MBA','Doctor','Bob Smith','MS','Scientist','+9876543210','+1234567890','Canada','Hindu','SC','A-','456 Oak St',2,2,'56789','94','2023-12-11 16:53:38','admin','2023-12-13 07:25:14','admin',1,15,0),(44,50,'Robert','C.','Johnson','profile3.jpg','1','1999-11-30 00:00:00',3,4,1,'Maria Johnson','MA','Artist','David Johnson','PhD','Professor','9999444444','9999444444','Australia','Buddhist','OBC','B+','789 Pine St',1,3,'98765','88','2023-12-11 16:53:38','admin','2023-12-13 07:45:51','admin',1,16,1),(45,4,'Emily','D.','Wilson','profile4.jpg','2','2002-04-22 00:00:00',1,1,102,'Jessica Wilson','PhD','Scientist','Michael Wilson','MS','Engineer','9922118822','9922929292','UK','Atheist','General','AB-','567 Maple St',1,2,'54321','89','2023-12-11 16:53:38','admin','2023-12-13 10:09:18','admin',1,17,0),(46,5,'David','E.','Miller','profile5.jpg','1','2003-07-12',2,2,202,'Sophie Miller','MA','Teacher','Peter Miller','PhD','Doctor','+1122334455','+5566778899','France','Jewish','General','O-','890 Cedar St',2,1,'67890','90','2023-12-11 16:53:38','admin','2023-12-13 07:25:14','admin',1,18,0),(47,48,'Sophia','F.','Brown','profile6.jpg','2','2000-10-05',3,2,2,'Oliver Brown','MS','Engineer','Emma Brown','MA','Artist','+1234567890','+9876543210','Germany','Muslim','OBC','B+','234 Pine St',3,2,'76543','86','2023-12-11 16:53:38','admin','2023-12-13 07:25:14','admin',1,19,1),(48,7,'Daniel','G.','Taylor','profile7.jpg','1','1998-03-18',1,1,103,'Lily Taylor','PhD','Doctor','James Taylor','MA','Teacher','+9876543210','+1234567890','Italy','Christian','General','A+','876 Olive St',1,3,'23456','91','2023-12-11 16:53:38','admin','2023-12-13 07:25:14','admin',1,20,0),(49,8,'Olivia','H.','Clark','profile8.jpg','2','2001-12-30',2,2,203,'Noah Clark','MS','Scientist','Ava Clark','MA','Artist','+1122334455','+5566778899','Spain','Hindu','SC','AB+','765 Redwood St',2,1,'87654','92','2023-12-11 16:53:38','admin','2023-12-13 07:25:14','admin',1,21,0),(50,46,'Ethan','I.','Moore','profile9.jpg','1','2002-05-08',3,1,2,'Grace Moore','PhD','Engineer','Liam Moore','MS','Doctor','+1234567890','+9876543210','Japan','Buddhist','OBC','B-','987 Elm St',3,2,'34567','87','2023-12-11 16:53:38','admin','2023-12-13 07:25:14','admin',1,22,1),(51,10,'Ava','J.','Baker','profile10.jpg','2','1999-09-14',1,1,104,'Henry Baker','MA','Artist','Mia Baker','PhD','Scientist','+9876543210','+1234567890','China','Christian','General','O+','432 Birch St',1,3,'12345','98','2023-12-11 16:53:38','admin','2023-12-13 07:25:14','admin',1,23,0),(52,11,'John1','A.','Doe','profile1.jpg','1','2000-01-01',2,1,101,'Mary Doe','MA','Teacher','John Doe Sr.','PhD','Engineer','+1234567890','+9876543210','USA','Christian','General','O+','123 Main St',1,1,'12345','88','2023-12-11 16:55:25','admin','2023-12-13 07:25:14','admin',1,24,0),(53,45,'Jane1','B.','Smith','profile2.jpg','2','2001-02-15',3,1,1,'Emily Smith','MBA','Doctor','Bob Smith','MS','Scientist','+9876543210','+1234567890','Canada','Hindu','SC','A-','456 Oak St',2,2,'56789','98','2023-12-11 16:55:25','admin','2023-12-13 07:25:14','admin',1,25,1),(54,13,'Robert1','C.','Johnson','profile3.jpg','1','1999-11-30',1,3,301,'Maria Johnson','MA','Artist','David Johnson','PhD','Professor','+1122334455','+5566778899','Australia','Buddhist','OBC','B+','789 Pine St',3,3,'98765','87','2023-12-11 16:55:25','admin','2023-12-13 07:25:14','admin',1,26,0),(55,14,'Emily1','D.','Wilson','profile4.jpg','2','2002-04-22',2,1,102,'Jessica Wilson','PhD','Scientist','Michael Wilson','MS','Engineer','+9876543210','+1234567890','UK','Atheist','General','AB-','567 Maple St',1,2,'54321','96','2023-12-11 16:55:25','admin','2023-12-13 07:25:14','admin',1,27,0),(56,47,'David1','E.','Miller','profile5.jpg','1','2003-07-12',3,2,1,'Sophie Miller','MA','Teacher','Peter Miller','PhD','Doctor','+1122334455','+5566778899','France','Jewish','General','O-','890 Cedar St',2,1,'67890','95','2023-12-11 16:55:25','admin','2023-12-13 07:25:14','admin',1,28,1),(57,16,'Sophia1','F.','Brown','profile6.jpg','2','2000-10-05',1,2,302,'Oliver Brown','MS','Engineer','Emma Brown','MA','Artist','+1234567890','+9876543210','Germany','Muslim','OBC','B+','234 Pine St',3,2,'76543','94','2023-12-11 16:55:25','admin','2023-12-13 07:25:14','admin',1,29,0),(60,19,'Ethan1','I.','Moore','profile9.jpg','1','2002-05-08',1,3,303,'Grace Moore','PhD','Engineer','Liam Moore','MS','Doctor','+1234567890','+9876543210','Japan','Buddhist','OBC','B-','987 Elm St',3,2,'34567','90','2023-12-11 16:55:25','admin','2023-12-13 07:25:14','admin',1,32,0),(62,17,'ankita','d','mali',NULL,'2','1990-01-10 18:30:00',1,1,NULL,'sdsada','fsdaf',NULL,'xzxcxzczx',NULL,'cxvcxvx','8877887788','8899774455','indian','hindu','open','O','test',1,1,NULL,'0','2023-12-16 05:35:33',NULL,'2023-12-16 05:35:34',NULL,NULL,30,0);
/*!40000 ALTER TABLE `admission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `all_classteacherlistview`
--

DROP TABLE IF EXISTS `all_classteacherlistview`;
/*!50001 DROP VIEW IF EXISTS `all_classteacherlistview`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `all_classteacherlistview` AS SELECT 
 1 AS `id`,
 1 AS `classId`,
 1 AS `className`,
 1 AS `divId`,
 1 AS `divName`,
 1 AS `teacherId`,
 1 AS `teacherName`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `all_teacherclassdivisionsubject`
--

DROP TABLE IF EXISTS `all_teacherclassdivisionsubject`;
/*!50001 DROP VIEW IF EXISTS `all_teacherclassdivisionsubject`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `all_teacherclassdivisionsubject` AS SELECT 
 1 AS `classId`,
 1 AS `className`,
 1 AS `divId`,
 1 AS `divName`,
 1 AS `subId`,
 1 AS `subName`,
 1 AS `teacherId`,
 1 AS `teacherName`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `attendance`
--

DROP TABLE IF EXISTS `attendance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attendance` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `studentId` bigint DEFAULT NULL,
  `classId` int DEFAULT NULL,
  `divId` int DEFAULT NULL,
  `classTeacherId` bigint DEFAULT NULL,
  `attendanceDate` date DEFAULT NULL,
  `attendanceResult` tinyint(1) DEFAULT NULL,
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createdBy` bigint DEFAULT NULL,
  `updatedAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedBy` bigint DEFAULT NULL,
  `active` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `attendance_ibfk_2` (`classId`),
  KEY `attendance_ibfk_3` (`divId`),
  KEY `attendance_ibfk_1` (`studentId`),
  KEY `attendance_ibfk_4` (`classTeacherId`),
  CONSTRAINT `attendance_ibfk_1` FOREIGN KEY (`studentId`) REFERENCES `student` (`id`),
  CONSTRAINT `attendance_ibfk_2` FOREIGN KEY (`classId`) REFERENCES `class` (`id`),
  CONSTRAINT `attendance_ibfk_3` FOREIGN KEY (`divId`) REFERENCES `division` (`id`),
  CONSTRAINT `attendance_ibfk_4` FOREIGN KEY (`classTeacherId`) REFERENCES `teacher` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attendance`
--

LOCK TABLES `attendance` WRITE;
/*!40000 ALTER TABLE `attendance` DISABLE KEYS */;
INSERT INTO `attendance` VALUES (1,1,1,1,1,'2019-04-23',0,'2018-10-07 09:57:56',NULL,'2018-10-07 09:57:56',NULL,1),(2,1,1,1,1,'2018-10-02',1,'2018-10-07 09:57:56',NULL,'2018-10-07 09:57:56',NULL,1),(3,1,1,1,1,'2018-09-26',1,'2018-10-07 09:58:40',NULL,'2018-10-07 09:58:40',NULL,1),(4,1,1,1,1,'2018-09-27',1,'2018-10-07 09:58:40',NULL,'2018-10-07 09:58:40',NULL,1),(6,1,1,1,1,'2018-09-24',1,'2018-10-07 09:58:40',NULL,'2018-10-07 09:58:40',NULL,1),(7,1,1,1,1,'2018-10-08',0,'2018-10-07 09:58:40',NULL,'2018-10-07 09:58:40',NULL,1),(8,1,1,1,1,'2018-10-03',1,'2018-10-07 09:57:56',NULL,'2018-10-07 09:57:56',NULL,1),(9,1,1,1,1,'2018-09-25',1,'2018-10-07 09:58:40',NULL,'2018-10-07 09:58:40',NULL,1),(11,2,1,1,2,'2018-09-25',1,'2018-10-07 09:58:40',NULL,'2018-10-07 09:58:40',NULL,1),(12,2,1,1,1,'2018-09-25',1,'2018-10-07 09:58:40',NULL,'2018-10-07 09:58:40',NULL,1),(13,1,2,1,2,'2018-10-08',0,'2018-10-07 09:58:40',NULL,'2018-10-07 09:58:40',NULL,1),(14,1,1,1,2,'2019-03-06',0,'2018-10-07 09:58:40',NULL,'2018-10-07 09:58:40',NULL,1),(15,1,2,1,2,'2018-07-25',0,'2018-10-07 09:58:40',NULL,'2018-10-07 09:58:40',NULL,1),(16,1,2,2,2,'2018-07-25',0,'2018-10-07 09:58:40',NULL,'2018-10-07 09:58:40',NULL,1),(21,1,1,1,1,'2019-03-07',1,'2019-03-24 09:08:13',NULL,'2019-03-24 09:08:13',NULL,1),(26,2,1,1,1,'2019-03-07',1,'2019-03-24 09:10:13',NULL,'2019-03-24 09:10:13',NULL,1),(27,1,1,1,1,'2019-03-08',1,'2019-03-24 09:12:37',NULL,'2019-04-18 18:03:30',NULL,1),(28,2,1,1,1,'2019-03-08',0,'2019-03-24 09:12:37',NULL,'2019-04-18 18:03:30',NULL,1),(51,1,1,1,1,'2019-04-10',1,'2019-04-11 17:49:37',NULL,'2019-04-20 04:16:25',NULL,1),(52,2,1,1,1,'2019-04-10',0,'2019-04-11 17:49:37',NULL,'2019-04-20 04:16:25',NULL,1),(53,1,1,1,1,'2018-07-17',1,'2019-04-20 04:33:44',NULL,'2019-04-20 04:33:44',NULL,1),(54,2,1,1,1,'2018-07-17',1,'2019-04-20 04:33:44',NULL,'2019-04-20 04:33:44',NULL,1),(55,7,1,2,2,'2018-07-17',1,'2019-04-20 04:35:05',NULL,'2019-04-20 04:35:05',NULL,1),(56,8,2,1,3,'2018-07-17',1,'2019-04-20 04:38:33',NULL,'2019-04-20 04:38:33',NULL,1),(57,10,2,1,3,'2018-07-17',1,'2019-04-20 04:38:33',NULL,'2019-04-20 04:38:33',NULL,1),(58,1,1,1,1,'2023-10-22',1,'2023-10-22 03:35:09',NULL,'2023-10-22 03:35:09',NULL,1),(59,2,1,1,1,'2023-10-22',1,'2023-10-22 03:35:09',NULL,'2023-10-22 03:35:09',NULL,1),(60,1,1,1,1,'2023-10-21',1,'2023-10-22 03:38:01',NULL,'2023-10-22 03:38:01',NULL,1),(61,2,1,1,1,'2023-10-21',1,'2023-10-22 03:38:01',NULL,'2023-10-22 03:38:01',NULL,1),(62,1,1,1,1,'2023-10-23',1,'2023-10-23 07:19:31',NULL,'2023-11-05 10:15:37',NULL,1),(63,2,1,1,1,'2023-10-23',1,'2023-10-23 07:19:31',NULL,'2023-11-05 10:15:37',NULL,1),(64,1,1,1,1,'2023-10-27',1,'2023-10-29 12:20:00',NULL,'2023-10-30 02:35:20',NULL,1),(65,2,1,1,1,'2023-10-27',1,'2023-10-29 12:20:00',NULL,'2023-10-30 02:35:20',NULL,1),(66,16,1,1,1,'2023-11-07',1,'2023-11-07 02:50:37',NULL,'2023-11-25 04:47:09',NULL,1),(67,1,1,1,1,'2023-11-07',1,'2023-11-07 02:50:37',NULL,'2023-11-25 04:47:09',NULL,1),(68,2,1,1,1,'2023-11-07',1,'2023-11-07 02:50:37',NULL,'2023-11-25 04:47:09',NULL,1),(69,7,1,2,6,'2023-11-07',1,'2023-11-07 02:51:52',NULL,'2023-11-25 04:46:38',NULL,1),(70,16,1,1,1,'2023-11-25',0,'2023-11-25 04:52:57',NULL,'2023-12-12 11:26:55',NULL,1),(71,17,1,1,1,'2023-11-25',1,'2023-11-25 04:52:57',NULL,'2023-12-12 11:26:55',NULL,1),(72,1,1,1,1,'2023-11-25',1,'2023-11-25 04:52:57',NULL,'2023-12-12 11:26:55',NULL,1),(73,2,1,1,1,'2023-11-25',1,'2023-11-25 04:52:57',NULL,'2023-12-12 11:26:55',NULL,1),(74,16,1,1,1,'2023-12-13',1,'2023-12-13 13:01:57',NULL,'2023-12-13 13:07:55',NULL,1),(75,17,1,1,1,'2023-12-13',1,'2023-12-13 13:01:57',NULL,'2023-12-13 13:07:55',NULL,1),(76,20,1,1,1,'2023-12-13',0,'2023-12-13 13:01:57',NULL,'2023-12-13 13:07:55',NULL,1),(77,1,1,1,1,'2023-12-13',0,'2023-12-13 13:01:57',NULL,'2023-12-13 13:07:55',NULL,1),(78,2,1,1,1,'2023-12-13',1,'2023-12-13 13:01:57',NULL,'2023-12-13 13:07:55',NULL,1);
/*!40000 ALTER TABLE `attendance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `attendancelistview`
--

DROP TABLE IF EXISTS `attendancelistview`;
/*!50001 DROP VIEW IF EXISTS `attendancelistview`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `attendancelistview` AS SELECT 
 1 AS `classId`,
 1 AS `divId`,
 1 AS `className`,
 1 AS `divName`,
 1 AS `teacherName`,
 1 AS `teacherId`,
 1 AS `selectedDate`,
 1 AS `totalPresent`,
 1 AS `total`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `attendancemonthlist`
--

DROP TABLE IF EXISTS `attendancemonthlist`;
/*!50001 DROP VIEW IF EXISTS `attendancemonthlist`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `attendancemonthlist` AS SELECT 
 1 AS `className`,
 1 AS `divName`,
 1 AS `classId`,
 1 AS `divId`,
 1 AS `AttendanceMonth`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `books`
--

DROP TABLE IF EXISTS `books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `books` (
  `bookId` int NOT NULL AUTO_INCREMENT,
  `classId` int DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `author` varchar(255) DEFAULT NULL,
  `isbn` varchar(20) DEFAULT NULL,
  `genre` varchar(50) DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `createdBy` int DEFAULT NULL,
  `createdAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedBy` int DEFAULT NULL,
  `updatedAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`bookId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books`
--

LOCK TABLES `books` WRITE;
/*!40000 ALTER TABLE `books` DISABLE KEYS */;
INSERT INTO `books` VALUES (1,0,'balbharti','Dheeraj','0-545-01022-5','test',99,NULL,'2023-11-27 03:04:56',NULL,'2023-11-27 03:52:30',1),(2,NULL,'History','PAVAN PATIL','090-908989-11','test',2,NULL,'2023-12-07 07:44:58',NULL,'2023-12-07 07:44:58',1);
/*!40000 ALTER TABLE `books` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `borrowed_books_view`
--

DROP TABLE IF EXISTS `borrowed_books_view`;
/*!50001 DROP VIEW IF EXISTS `borrowed_books_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `borrowed_books_view` AS SELECT 
 1 AS `borrowId`,
 1 AS `bookId`,
 1 AS `studentId`,
 1 AS `borrowDate`,
 1 AS `returnDate`,
 1 AS `bbCreatedBy`,
 1 AS `bbCreatedAt`,
 1 AS `bbUpdatedBy`,
 1 AS `bbUpdatedAt`,
 1 AS `active`,
 1 AS `bookName`,
 1 AS `studentName`,
 1 AS `studentActive`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `borrowedbooks`
--

DROP TABLE IF EXISTS `borrowedbooks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `borrowedbooks` (
  `borrowId` int NOT NULL AUTO_INCREMENT,
  `bookId` int DEFAULT NULL,
  `studentId` int DEFAULT NULL,
  `borrowDate` date DEFAULT NULL,
  `returnDate` date DEFAULT NULL,
  `createdBy` int DEFAULT NULL,
  `createdAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedBy` int DEFAULT NULL,
  `updatedAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`borrowId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `borrowedbooks`
--

LOCK TABLES `borrowedbooks` WRITE;
/*!40000 ALTER TABLE `borrowedbooks` DISABLE KEYS */;
INSERT INTO `borrowedbooks` VALUES (1,1,1,'2023-11-27','2023-11-28',NULL,'2023-11-27 11:10:57',NULL,'2023-11-27 13:09:03',1),(2,1,2,'2023-11-27',NULL,NULL,'2023-11-27 12:29:48',NULL,'2023-11-27 12:29:48',1),(3,1,7,'2023-12-07',NULL,NULL,'2023-12-07 07:40:30',NULL,'2023-12-07 07:40:30',1),(4,2,1,'2023-12-11',NULL,NULL,'2023-12-11 03:35:42',NULL,'2023-12-11 03:35:42',1);
/*!40000 ALTER TABLE `borrowedbooks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `city`
--

DROP TABLE IF EXISTS `city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `city` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `cityName` varchar(255) DEFAULT NULL,
  `stateId` bigint DEFAULT NULL,
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createdBy` bigint DEFAULT NULL,
  `updatedAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedBy` bigint DEFAULT NULL,
  `active` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `stateId` (`stateId`),
  CONSTRAINT `city_ibfk_1` FOREIGN KEY (`stateId`) REFERENCES `state` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `city`
--

LOCK TABLES `city` WRITE;
/*!40000 ALTER TABLE `city` DISABLE KEYS */;
INSERT INTO `city` VALUES (1,'Pune',1,'2018-09-13 13:22:16',NULL,'2018-09-13 13:22:16',NULL,1),(2,'Mumbai',1,'2018-09-13 13:22:16',NULL,'2018-09-13 13:22:16',NULL,1),(3,'Jalgaon',1,'2018-09-13 13:22:16',NULL,'2023-12-13 01:15:30',NULL,1),(5,'Indore',3,'2023-12-13 01:16:15',NULL,'2023-12-13 01:16:15',NULL,1);
/*!40000 ALTER TABLE `city` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `class`
--

DROP TABLE IF EXISTS `class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `class` (
  `id` int NOT NULL AUTO_INCREMENT,
  `className` varchar(255) NOT NULL,
  `divIds` text,
  `subjectIds` text,
  `optionalSubjectIds` text,
  `testIds` text,
  `totalSeats` int DEFAULT NULL,
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createdBy` bigint DEFAULT NULL,
  `updatedAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedBy` bigint DEFAULT NULL,
  `active` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `className_UNIQUE` (`className`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `class`
--

LOCK TABLES `class` WRITE;
/*!40000 ALTER TABLE `class` DISABLE KEYS */;
INSERT INTO `class` VALUES (1,'1','1,2,3','3,2,4,1,5',NULL,'2,4,1,3',180,'2018-09-13 13:21:09',NULL,'2023-12-15 03:09:26',NULL,1),(2,'2','1,2,3,4','1,2,3,4,5',NULL,'2,1,3',240,'2018-09-13 13:21:09',NULL,'2023-10-30 12:48:17',NULL,1),(3,'3','1,2,3,4','1,2,3,4',NULL,'1,2,3',240,'2018-09-13 13:21:09',NULL,'2018-09-13 13:21:09',NULL,1),(4,'4','1,2,3,4','1,2,3,4',NULL,'1,2,3',240,'2018-09-13 13:21:09',NULL,'2018-09-13 13:21:09',NULL,1),(5,'5','1,2,3,4','1,2,3,4',NULL,'1,2,3',240,'2018-09-13 13:21:09',NULL,'2018-09-13 13:21:09',NULL,1),(6,'6','1,2,3,4','1,2,3,4',NULL,'1,2,3',240,'2019-04-23 07:53:22',NULL,'2019-04-23 07:53:22',NULL,1),(8,'7','1,2,3,4','1,3,4,5','6','1,2,3',240,'2023-10-30 09:15:06',NULL,'2023-10-30 09:15:06',NULL,1),(12,'8','1,2,3,4','3,4,5',NULL,'2,4,1,3',240,'2023-10-30 11:23:36',NULL,'2023-10-30 11:23:36',NULL,1),(13,'9','1,2,3,4','3,4,5,6','6','2,4,1,3',240,'2023-10-30 11:26:35',NULL,'2023-10-30 11:26:35',NULL,1);
/*!40000 ALTER TABLE `class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `classdetailsview`
--

DROP TABLE IF EXISTS `classdetailsview`;
/*!50001 DROP VIEW IF EXISTS `classdetailsview`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `classdetailsview` AS SELECT 
 1 AS `id`,
 1 AS `className`,
 1 AS `divIds`,
 1 AS `subjectIds`,
 1 AS `optionalSubjectIds`,
 1 AS `testIds`,
 1 AS `divisionNames`,
 1 AS `subjectNames`,
 1 AS `optionalSubjectNames`,
 1 AS `testNames`,
 1 AS `totalSeats`,
 1 AS `admissionCount`,
 1 AS `allocatedCount`,
 1 AS `availableSeats`,
 1 AS `createdAt`,
 1 AS `active`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `classdivisionlistview`
--

DROP TABLE IF EXISTS `classdivisionlistview`;
/*!50001 DROP VIEW IF EXISTS `classdivisionlistview`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `classdivisionlistview` AS SELECT 
 1 AS `id`,
 1 AS `classId`,
 1 AS `divId`,
 1 AS `className`,
 1 AS `divName`,
 1 AS `teacherName`,
 1 AS `teacherId`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `classmonthlyattendanceview`
--

DROP TABLE IF EXISTS `classmonthlyattendanceview`;
/*!50001 DROP VIEW IF EXISTS `classmonthlyattendanceview`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `classmonthlyattendanceview` AS SELECT 
 1 AS `teacherId`,
 1 AS `classId`,
 1 AS `divId`,
 1 AS `attendanceMonth`,
 1 AS `monthAvg`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `classteacher`
--

DROP TABLE IF EXISTS `classteacher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `classteacher` (
  `id` int NOT NULL AUTO_INCREMENT,
  `teacherId` bigint DEFAULT NULL,
  `classId` int DEFAULT NULL,
  `divId` int DEFAULT NULL,
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createdBy` bigint DEFAULT NULL,
  `updatedAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedBy` bigint DEFAULT NULL,
  `active` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `classteacher_ibfk_1` (`teacherId`),
  KEY `classteacher_ibfk_2` (`classId`),
  KEY `classteacher_ibfk_3` (`divId`),
  CONSTRAINT `classteacher_ibfk_1` FOREIGN KEY (`teacherId`) REFERENCES `teacher` (`id`),
  CONSTRAINT `classteacher_ibfk_2` FOREIGN KEY (`classId`) REFERENCES `class` (`id`),
  CONSTRAINT `classteacher_ibfk_3` FOREIGN KEY (`divId`) REFERENCES `division` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classteacher`
--

LOCK TABLES `classteacher` WRITE;
/*!40000 ALTER TABLE `classteacher` DISABLE KEYS */;
INSERT INTO `classteacher` VALUES (1,1,1,1,'2018-10-13 00:30:53',NULL,'2018-10-13 00:30:53',NULL,1),(2,6,1,2,'2018-10-13 00:30:53',NULL,'2023-11-03 07:18:28',NULL,1),(3,3,2,1,'2018-10-13 00:30:53',NULL,'2023-11-03 08:52:15',NULL,1),(4,5,2,2,'2018-10-13 00:30:53',NULL,'2023-11-03 08:01:18',NULL,1),(10,2,1,3,'2023-11-03 07:24:10',NULL,'2023-12-12 11:28:14',NULL,1);
/*!40000 ALTER TABLE `classteacher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `classtestresultview`
--

DROP TABLE IF EXISTS `classtestresultview`;
/*!50001 DROP VIEW IF EXISTS `classtestresultview`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `classtestresultview` AS SELECT 
 1 AS `teacherId`,
 1 AS `classId`,
 1 AS `divId`,
 1 AS `testName`,
 1 AS `totalAvg`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `days`
--

DROP TABLE IF EXISTS `days`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `days` (
  `id` int NOT NULL AUTO_INCREMENT,
  `dayName` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createdBy` bigint DEFAULT NULL,
  `updatedAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedBy` bigint DEFAULT NULL,
  `active` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `days`
--

LOCK TABLES `days` WRITE;
/*!40000 ALTER TABLE `days` DISABLE KEYS */;
INSERT INTO `days` VALUES (1,'Monday','2018-09-24 10:17:50',NULL,'2018-09-24 10:17:50',NULL,1),(2,'Tuesday','2018-09-24 10:17:50',NULL,'2018-09-24 10:17:50',NULL,1),(3,'Wednesday','2018-09-24 10:17:50',NULL,'2018-09-24 10:17:50',NULL,1),(4,'Thursday','2018-09-24 10:17:50',NULL,'2018-09-24 10:17:50',NULL,1),(5,'Friday','2018-09-24 10:17:50',NULL,'2018-09-24 10:17:50',NULL,1),(6,'Saturday','2018-09-24 10:17:50',NULL,'2018-09-24 10:17:50',NULL,1);
/*!40000 ALTER TABLE `days` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `division`
--

DROP TABLE IF EXISTS `division`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `division` (
  `id` int NOT NULL AUTO_INCREMENT,
  `divName` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createdBy` bigint DEFAULT NULL,
  `updatedAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedBy` bigint DEFAULT NULL,
  `active` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `divName_UNIQUE` (`divName`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `division`
--

LOCK TABLES `division` WRITE;
/*!40000 ALTER TABLE `division` DISABLE KEYS */;
INSERT INTO `division` VALUES (1,'A','2018-09-13 13:21:22',NULL,'2018-09-13 13:21:22',NULL,1),(2,'B','2018-09-13 13:21:22',NULL,'2019-04-23 08:04:13',NULL,1),(3,'C','2019-04-23 08:04:20',NULL,'2019-04-23 08:04:20',NULL,1),(4,'D','2023-10-22 10:12:49',NULL,'2023-10-22 10:12:57',NULL,1);
/*!40000 ALTER TABLE `division` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fees`
--

DROP TABLE IF EXISTS `fees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fees` (
  `feeId` int NOT NULL AUTO_INCREMENT,
  `classId` int NOT NULL,
  `tuitionFee` decimal(20,2) NOT NULL,
  `developmentFee` decimal(20,2) NOT NULL,
  `examinationFee` decimal(20,2) NOT NULL,
  `sportsFee` decimal(20,2) NOT NULL,
  `transportationFee` decimal(20,2) NOT NULL,
  `libraryFee` decimal(20,2) NOT NULL,
  `labFee` decimal(20,2) NOT NULL,
  `securityFee` decimal(20,2) NOT NULL,
  `otherFee` decimal(20,2) NOT NULL,
  `totalFee` decimal(40,2) GENERATED ALWAYS AS (((((((((`tuitionFee` + `developmentFee`) + `examinationFee`) + `sportsFee`) + `transportationFee`) + `libraryFee`) + `labFee`) + `securityFee`) + `otherFee`)) VIRTUAL,
  `paymentFrequency` varchar(50) NOT NULL,
  `dueDate` date NOT NULL,
  `lateFee` decimal(20,2) DEFAULT NULL,
  `discount` decimal(20,2) DEFAULT NULL,
  `createdAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`feeId`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fees`
--

LOCK TABLES `fees` WRITE;
/*!40000 ALTER TABLE `fees` DISABLE KEYS */;
INSERT INTO `fees` (`feeId`, `classId`, `tuitionFee`, `developmentFee`, `examinationFee`, `sportsFee`, `transportationFee`, `libraryFee`, `labFee`, `securityFee`, `otherFee`, `paymentFrequency`, `dueDate`, `lateFee`, `discount`, `createdAt`, `updatedAt`) VALUES (1,1,20000.00,20000.00,2000.00,20000.00,2000.00,2000.00,5000.00,10000.00,10000.00,'2','2023-12-11',10000.00,100.00,'2023-12-09 04:18:46','2023-12-13 07:09:32'),(3,2,60000.00,10000.00,5000.00,5000.00,2000.00,2000.00,2000.00,4000.00,2000.00,'1','2023-12-14',0.00,0.00,'2023-12-13 07:07:20','2023-12-13 07:21:38'),(4,3,60000.00,5000.00,5000.00,1000.00,0.00,5000.00,5000.00,5000.00,5000.00,'5000','2023-12-13',1000.00,0.00,'2023-12-13 07:08:52','2023-12-13 07:21:07'),(5,4,60000.00,10000.00,5000.00,5000.00,2000.00,2000.00,2000.00,2000.00,2000.00,'2000','2023-12-14',0.00,0.00,'2023-12-13 07:10:47','2023-12-13 07:22:02'),(6,5,70000.00,10000.00,5000.00,5000.00,0.00,1000.00,1000.00,1000.00,1000.00,'1000','2023-12-13',0.00,0.00,'2023-12-13 07:20:10','2023-12-13 07:20:10');
/*!40000 ALTER TABLE `fees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feespaidbystudent`
--

DROP TABLE IF EXISTS `feespaidbystudent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `feespaidbystudent` (
  `paymentId` int NOT NULL AUTO_INCREMENT,
  `admissionId` int DEFAULT NULL,
  `studentId` int DEFAULT NULL,
  `feeId` int DEFAULT NULL,
  `classId` int DEFAULT NULL,
  `divId` int DEFAULT NULL,
  `paymentAmount` decimal(10,2) NOT NULL,
  `remainingAmount` decimal(10,2) NOT NULL,
  `paymentDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `paymentMethod` varchar(50) NOT NULL,
  `paymentDetail` varchar(100) DEFAULT NULL,
  `feesPaymentDetails` longtext,
  `isPartial` tinyint(1) DEFAULT '0',
  `createdAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`paymentId`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feespaidbystudent`
--

LOCK TABLES `feespaidbystudent` WRITE;
/*!40000 ALTER TABLE `feespaidbystudent` DISABLE KEYS */;
INSERT INTO `feespaidbystudent` VALUES (4,32,NULL,NULL,1,1,46000.00,50000.00,'2023-12-10 11:05:02','cash','cash','{\"tuitionFee\":\"9583.33\",\"developmentFee\":\"9583.33\",\"examinationFee\":\"958.33\",\"sportsFee\":\"9583.33\",\"transportationFee\":\"958.33\",\"libraryFee\":\"958.33\",\"labFee\":\"4791.67\",\"securityFee\":\"4791.67\",\"otherFee\":\"4791.67\",\"totalFee\":\"46000\"}',0,'2023-12-10 11:05:02','2023-12-10 11:05:02'),(15,15,NULL,NULL,1,1,48000.00,48000.00,'2023-12-10 11:34:07','cheque','12233','{\"tuitionFee\":\"10000\",\"developmentFee\":\"10000\",\"examinationFee\":\"1000\",\"sportsFee\":\"10000\",\"transportationFee\":\"1000\",\"libraryFee\":\"1000\",\"labFee\":\"5000\",\"securityFee\":\"5000\",\"otherFee\":\"5000\",\"totalFee\":\"48000\"}',0,'2023-12-10 11:34:07','2023-12-10 11:34:07'),(16,44,50,NULL,3,4,55000.00,5000.00,'2023-12-11 03:45:00','credit card','98765','{\"tuitionFee\":\"12000\",\"developmentFee\":\"8000\",\"examinationFee\":\"1500\",\"sportsFee\":\"9000\",\"transportationFee\":\"1500\",\"libraryFee\":\"2000\",\"labFee\":\"4000\",\"securityFee\":\"3000\",\"otherFee\":\"3500\",\"totalFee\":\"55000\"}',1,'2023-12-11 03:45:00','2023-12-13 07:45:51'),(17,17,NULL,NULL,1,1,42000.00,0.00,'2023-12-12 09:00:45','online transfer','34567','{\"tuitionFee\":\"8500\",\"developmentFee\":\"7500\",\"examinationFee\":\"1200\",\"sportsFee\":\"7500\",\"transportationFee\":\"0\",\"libraryFee\":\"1800\",\"labFee\":\"4500\",\"securityFee\":\"2500\",\"otherFee\":\"2800\",\"totalFee\":\"42000\"}',0,'2023-12-12 09:00:45','2023-12-12 09:00:45'),(18,18,NULL,NULL,2,1,50000.00,20000.00,'2023-12-13 05:50:30','cash','cash','{\"tuitionFee\":\"10000\",\"developmentFee\":\"9000\",\"examinationFee\":\"2000\",\"sportsFee\":\"8500\",\"transportationFee\":\"2500\",\"libraryFee\":\"1500\",\"labFee\":\"4000\",\"securityFee\":\"3500\",\"otherFee\":\"3500\",\"totalFee\":\"50000\"}',1,'2023-12-13 05:50:30','2023-12-13 05:50:30'),(19,47,48,NULL,3,2,47000.00,47000.00,'2023-12-14 13:15:15','cheque','11222','{\"tuitionFee\":\"9500\",\"developmentFee\":\"8000\",\"examinationFee\":\"1800\",\"sportsFee\":\"7500\",\"transportationFee\":\"2000\",\"libraryFee\":\"2000\",\"labFee\":\"4500\",\"securityFee\":\"4000\",\"otherFee\":\"4200\",\"totalFee\":\"47000\"}',0,'2023-12-14 13:15:15','2023-12-13 07:45:51'),(20,20,NULL,NULL,3,1,54000.00,20000.00,'2023-12-15 05:00:00','credit card','56789','{\"tuitionFee\":\"11000\",\"developmentFee\":\"8500\",\"examinationFee\":\"1500\",\"sportsFee\":\"8000\",\"transportationFee\":\"2500\",\"libraryFee\":\"2500\",\"labFee\":\"5000\",\"securityFee\":\"3000\",\"otherFee\":\"3500\",\"totalFee\":\"54000\"}',1,'2023-12-15 05:00:00','2023-12-15 05:00:00'),(21,21,NULL,NULL,3,1,43000.00,2000.00,'2023-12-16 10:25:30','online transfer','43210','{\"tuitionFee\":\"8500\",\"developmentFee\":\"7000\",\"examinationFee\":\"1200\",\"sportsFee\":\"7000\",\"transportationFee\":\"1000\",\"libraryFee\":\"2000\",\"labFee\":\"4000\",\"securityFee\":\"3000\",\"otherFee\":\"3300\",\"totalFee\":\"43000\"}',1,'2023-12-16 10:25:30','2023-12-16 10:25:30'),(22,50,46,NULL,3,1,48000.00,15000.00,'2023-12-17 06:40:45','cash','cash','{\"tuitionFee\":\"9800\",\"developmentFee\":\"8500\",\"examinationFee\":\"2000\",\"sportsFee\":\"8000\",\"transportationFee\":\"2500\",\"libraryFee\":\"1500\",\"labFee\":\"4000\",\"securityFee\":\"3500\",\"otherFee\":\"3700\",\"totalFee\":\"48000\"}',1,'2023-12-17 06:40:45','2023-12-13 07:45:51'),(23,23,NULL,NULL,4,1,49000.00,49000.00,'2023-12-18 04:00:20','cheque','33221','{\"tuitionFee\":\"10000\",\"developmentFee\":\"8000\",\"examinationFee\":\"1800\",\"sportsFee\":\"7000\",\"transportationFee\":\"2000\",\"libraryFee\":\"2000\",\"labFee\":\"4500\",\"securityFee\":\"4000\",\"otherFee\":\"4200\",\"totalFee\":\"49000\"}',0,'2023-12-18 04:00:20','2023-12-18 04:00:20'),(24,24,NULL,NULL,5,2,55000.00,20000.00,'2023-12-19 09:25:15','credit card','87654','{\"tuitionFee\":\"11000\",\"developmentFee\":\"8500\",\"examinationFee\":\"1500\",\"sportsFee\":\"8000\",\"transportationFee\":\"2500\",\"libraryFee\":\"2500\",\"labFee\":\"5000\",\"securityFee\":\"3000\",\"otherFee\":\"3500\",\"totalFee\":\"55000\"}',1,'2023-12-19 09:25:15','2023-12-19 09:25:15'),(25,53,45,NULL,3,1,48000.00,48000.00,'2023-12-20 05:50:30','online transfer','65432','{\"tuitionFee\":\"8500\",\"developmentFee\":\"7500\",\"examinationFee\":\"1200\",\"sportsFee\":\"7500\",\"transportationFee\":\"0\",\"libraryFee\":\"1800\",\"labFee\":\"4500\",\"securityFee\":\"2500\",\"otherFee\":\"2800\",\"totalFee\":\"42000\"}',0,'2023-12-20 05:50:30','2023-12-13 07:45:51'),(26,26,NULL,NULL,6,2,50000.00,20000.00,'2023-12-21 13:15:15','cheque','11223','{\"tuitionFee\":\"10000\",\"developmentFee\":\"9000\",\"examinationFee\":\"2000\",\"sportsFee\":\"8500\",\"transportationFee\":\"2500\",\"libraryFee\":\"1500\",\"labFee\":\"4000\",\"securityFee\":\"3500\",\"otherFee\":\"3500\",\"totalFee\":\"50000\"}',1,'2023-12-21 13:15:15','2023-12-21 13:15:15'),(27,27,NULL,NULL,7,3,47000.00,47000.00,'2023-12-22 05:00:00','credit card','98765','{\"tuitionFee\":\"9500\",\"developmentFee\":\"8000\",\"examinationFee\":\"1800\",\"sportsFee\":\"7500\",\"transportationFee\":\"2000\",\"libraryFee\":\"2000\",\"labFee\":\"4500\",\"securityFee\":\"4000\",\"otherFee\":\"4200\",\"totalFee\":\"47000\"}',0,'2023-12-22 05:00:00','2023-12-22 05:00:00'),(28,56,47,NULL,3,2,54000.00,20000.00,'2023-12-23 10:25:30','online transfer','45678','{\"tuitionFee\":\"11000\",\"developmentFee\":\"8500\",\"examinationFee\":\"1500\",\"sportsFee\":\"8000\",\"transportationFee\":\"2500\",\"libraryFee\":\"2500\",\"labFee\":\"5000\",\"securityFee\":\"3000\",\"otherFee\":\"3500\",\"totalFee\":\"54000\"}',1,'2023-12-23 10:25:30','2023-12-13 07:45:51'),(29,29,NULL,NULL,8,3,43000.00,2000.00,'2023-12-24 06:40:45','cash','cash','{\"tuitionFee\":\"8500\",\"developmentFee\":\"7000\",\"examinationFee\":\"1200\",\"sportsFee\":\"7000\",\"transportationFee\":\"1000\",\"libraryFee\":\"2000\",\"labFee\":\"4000\",\"securityFee\":\"3000\",\"otherFee\":\"3300\",\"totalFee\":\"43000\"}',1,'2023-12-24 06:40:45','2023-12-24 06:40:45'),(30,62,NULL,NULL,1,1,80000.00,11000.00,'2023-12-16 05:35:34','cash','cash','{\"tuitionFee\":\"17582.42\",\"developmentFee\":\"17582.42\",\"examinationFee\":\"1758.24\",\"sportsFee\":\"17582.42\",\"transportationFee\":\"1758.24\",\"libraryFee\":\"1758.24\",\"labFee\":\"4395.6\",\"securityFee\":\"8791.21\",\"otherFee\":\"8791.21\",\"totalFee\":\"80000\",\"paymentFrequency\":\"80000\",\"dueDate\":\"80000\",\"lateFee\":\"0\",\"discount\":\"0\"}',0,'2023-12-16 05:35:34','2023-12-16 05:35:34');
/*!40000 ALTER TABLE `feespaidbystudent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `finalresult`
--

DROP TABLE IF EXISTS `finalresult`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `finalresult` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `studentId` bigint DEFAULT NULL,
  `studentName` text,
  `classId` int DEFAULT NULL,
  `className` varchar(45) DEFAULT NULL,
  `divId` int DEFAULT NULL,
  `divName` varchar(45) DEFAULT NULL,
  `resultData` longtext,
  `getMarks` int DEFAULT NULL,
  `totalMarks` int DEFAULT NULL,
  `resultDate` varchar(255) DEFAULT NULL,
  `testResultData` longtext,
  `attendanceData` longtext,
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createdBy` bigint DEFAULT NULL,
  `updatedAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedBy` bigint DEFAULT NULL,
  `active` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `finalresult_ibfk_1` (`studentId`),
  KEY `finalresult_ibfk_2` (`classId`),
  KEY `finalresult_ibfk_3` (`divId`),
  CONSTRAINT `finalresult_ibfk_1` FOREIGN KEY (`studentId`) REFERENCES `student` (`id`),
  CONSTRAINT `finalresult_ibfk_2` FOREIGN KEY (`classId`) REFERENCES `class` (`id`),
  CONSTRAINT `finalresult_ibfk_3` FOREIGN KEY (`divId`) REFERENCES `division` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `finalresult`
--

LOCK TABLES `finalresult` WRITE;
/*!40000 ALTER TABLE `finalresult` DISABLE KEYS */;
INSERT INTO `finalresult` VALUES (8,1,'dheeraj malu',1,'1',1,'A','{\"Marathi\":\"87.25/100\",\"Hindi\":\"85.75/100\",\"English\":\"85.75/100\",\"History\":\"81.00/100\",\"Math\":\"82.75/100\",\"Total\":\"422.5/500\"}',423,500,'16-12-2023','[{\"Marathi\":\"349/400\"},{\"Hindi\":\"343/400\"},{\"English\":\"343/400\"},{\"History\":\"324/400\"},{\"Math\":\"331/400\"}]','[{\"month\":\"Apr\",\"pdays\":\"0\",\"tdays\":1,\"per\":\"0.00\"},{\"month\":\"Oct\",\"pdays\":\"1\",\"tdays\":1,\"per\":\"100.00\"},{\"month\":\"Sep\",\"pdays\":\"1\",\"tdays\":1,\"per\":\"100.00\"},{\"month\":\"Sep\",\"pdays\":\"1\",\"tdays\":1,\"per\":\"100.00\"},{\"month\":\"Sep\",\"pdays\":\"1\",\"tdays\":1,\"per\":\"100.00\"},{\"month\":\"Oct\",\"pdays\":\"0\",\"tdays\":2,\"per\":\"0.00\"},{\"month\":\"Oct\",\"pdays\":\"1\",\"tdays\":1,\"per\":\"100.00\"},{\"month\":\"Sep\",\"pdays\":\"1\",\"tdays\":1,\"per\":\"100.00\"},{\"month\":\"Mar\",\"pdays\":\"0\",\"tdays\":1,\"per\":\"0.00\"},{\"month\":\"Jul\",\"pdays\":\"0\",\"tdays\":2,\"per\":\"0.00\"},{\"month\":\"Mar\",\"pdays\":\"1\",\"tdays\":1,\"per\":\"100.00\"},{\"month\":\"Mar\",\"pdays\":\"1\",\"tdays\":1,\"per\":\"100.00\"},{\"month\":\"Apr\",\"pdays\":\"1\",\"tdays\":1,\"per\":\"100.00\"},{\"month\":\"Jul\",\"pdays\":\"1\",\"tdays\":1,\"per\":\"100.00\"},{\"month\":\"Oct\",\"pdays\":\"1\",\"tdays\":1,\"per\":\"100.00\"},{\"month\":\"Oct\",\"pdays\":\"1\",\"tdays\":1,\"per\":\"100.00\"},{\"month\":\"Oct\",\"pdays\":\"1\",\"tdays\":1,\"per\":\"100.00\"},{\"month\":\"Oct\",\"pdays\":\"1\",\"tdays\":1,\"per\":\"100.00\"},{\"month\":\"Nov\",\"pdays\":\"1\",\"tdays\":1,\"per\":\"100.00\"},{\"month\":\"Nov\",\"pdays\":\"1\",\"tdays\":1,\"per\":\"100.00\"},{\"month\":\"Dec\",\"pdays\":\"0\",\"tdays\":1,\"per\":\"0.00\"}]','2023-12-15 19:22:23',1,'2023-12-15 19:24:18',1,1),(9,2,'Pavan Patil',1,'1',1,'A','{\"Marathi\":\"89.50/100\",\"Hindi\":\"83.25/100\",\"English\":\"77.25/100\",\"History\":\"82.50/100\",\"Math\":\"72.00/100\",\"Total\":\"404.5/500\"}',405,500,'16-12-2023','[{\"Marathi\":\"358/400\"},{\"Hindi\":\"333/400\"},{\"English\":\"309/400\"},{\"History\":\"330/400\"},{\"Math\":\"288/400\"}]','[{\"month\":\"Sep\",\"pdays\":\"2\",\"tdays\":2,\"per\":\"100.00\"},{\"month\":\"Mar\",\"pdays\":\"1\",\"tdays\":1,\"per\":\"100.00\"},{\"month\":\"Mar\",\"pdays\":\"0\",\"tdays\":1,\"per\":\"0.00\"},{\"month\":\"Apr\",\"pdays\":\"0\",\"tdays\":1,\"per\":\"0.00\"},{\"month\":\"Jul\",\"pdays\":\"1\",\"tdays\":1,\"per\":\"100.00\"},{\"month\":\"Oct\",\"pdays\":\"1\",\"tdays\":1,\"per\":\"100.00\"},{\"month\":\"Oct\",\"pdays\":\"1\",\"tdays\":1,\"per\":\"100.00\"},{\"month\":\"Oct\",\"pdays\":\"1\",\"tdays\":1,\"per\":\"100.00\"},{\"month\":\"Oct\",\"pdays\":\"1\",\"tdays\":1,\"per\":\"100.00\"},{\"month\":\"Nov\",\"pdays\":\"1\",\"tdays\":1,\"per\":\"100.00\"},{\"month\":\"Nov\",\"pdays\":\"1\",\"tdays\":1,\"per\":\"100.00\"},{\"month\":\"Dec\",\"pdays\":\"1\",\"tdays\":1,\"per\":\"100.00\"}]','2023-12-15 19:22:23',1,'2023-12-15 19:24:19',1,1),(10,16,'lalit patil',1,'1',1,'A','{\"Marathi\":\"82.00/100\",\"Hindi\":\"91.50/100\",\"English\":\"92.25/100\",\"History\":\"82.50/100\",\"Math\":\"87.75/100\",\"Total\":\"436/500\"}',436,500,'16-12-2023','[{\"Marathi\":\"328/400\"},{\"Hindi\":\"366/400\"},{\"English\":\"369/400\"},{\"History\":\"330/400\"},{\"Math\":\"351/400\"}]','[{\"month\":\"Nov\",\"pdays\":\"1\",\"tdays\":1,\"per\":\"100.00\"},{\"month\":\"Nov\",\"pdays\":\"0\",\"tdays\":1,\"per\":\"0.00\"},{\"month\":\"Dec\",\"pdays\":\"1\",\"tdays\":1,\"per\":\"100.00\"}]','2023-12-15 19:22:23',1,'2023-12-15 19:24:19',1,1),(11,17,'ankita mali',1,'1',1,'A','{\"Total\":\"0/500\"}',0,500,'16-12-2023','[]','[{\"month\":\"Nov\",\"pdays\":\"1\",\"tdays\":1,\"per\":\"100.00\"},{\"month\":\"Dec\",\"pdays\":\"1\",\"tdays\":1,\"per\":\"100.00\"}]','2023-12-15 19:22:23',1,'2023-12-15 19:24:19',1,1),(12,20,'nikita mundada',1,'1',1,'A','{\"Total\":\"0/500\"}',0,500,'16-12-2023','[]','[{\"month\":\"Dec\",\"pdays\":\"0\",\"tdays\":1,\"per\":\"0.00\"}]','2023-12-15 19:22:23',1,'2023-12-15 19:24:19',1,1);
/*!40000 ALTER TABLE `finalresult` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `finalresultclassdivisionlist`
--

DROP TABLE IF EXISTS `finalresultclassdivisionlist`;
/*!50001 DROP VIEW IF EXISTS `finalresultclassdivisionlist`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `finalresultclassdivisionlist` AS SELECT 
 1 AS `className`,
 1 AS `divName`,
 1 AS `classId`,
 1 AS `divId`,
 1 AS `testTotal`,
 1 AS `totaltest`,
 1 AS `testSubTotal`,
 1 AS `totalSub`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `holidays`
--

DROP TABLE IF EXISTS `holidays`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `holidays` (
  `id` int NOT NULL AUTO_INCREMENT,
  `holidayDate` date NOT NULL,
  `createdAt` datetime DEFAULT NULL,
  `createdBy` int DEFAULT NULL,
  `updatedAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedBy` int DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `holidays`
--

LOCK TABLES `holidays` WRITE;
/*!40000 ALTER TABLE `holidays` DISABLE KEYS */;
INSERT INTO `holidays` VALUES (1,'2019-04-25','2019-04-24 00:00:00',0,'2019-04-23 11:59:50',0,1),(2,'2023-10-24','2023-10-23 07:07:49',NULL,'2023-10-23 07:10:18',NULL,1),(3,'2023-10-31','2023-10-28 09:42:20',NULL,'2023-10-28 09:42:20',NULL,1),(4,'2023-11-27','2023-11-23 10:15:44',NULL,'2023-11-25 04:33:16',NULL,1);
/*!40000 ALTER TABLE `holidays` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `homework`
--

DROP TABLE IF EXISTS `homework`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `homework` (
  `id` int NOT NULL AUTO_INCREMENT,
  `classId` int DEFAULT NULL,
  `divId` int DEFAULT NULL,
  `subId` int DEFAULT NULL,
  `title` varchar(200) DEFAULT NULL,
  `description` text,
  `deadline` date DEFAULT NULL,
  `isCompleted` tinyint(1) DEFAULT '0',
  `createdAt` datetime DEFAULT CURRENT_TIMESTAMP,
  `createdBy` bigint DEFAULT NULL,
  `updatedAt` datetime DEFAULT CURRENT_TIMESTAMP,
  `updatedBy` bigint DEFAULT NULL,
  `active` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `homework`
--

LOCK TABLES `homework` WRITE;
/*!40000 ALTER TABLE `homework` DISABLE KEYS */;
INSERT INTO `homework` VALUES (1,1,1,3,'test','<p><img style=\"width: 80px;\" src=\"data:image/jpeg;base64,/9j/4QAYRXhpZgAASUkqAAgAAAAAAAAAAAAAAP/sABFEdWNreQABAAQAAABkAAD/4QMdaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wLwA8P3hwYWNrZXQgYmVnaW49Iu+7vyIgaWQ9Ilc1TTBNcENlaGlIenJlU3pOVGN6a2M5ZCI/PiA8eDp4bXBtZXRhIHhtbG5zOng9ImFkb2JlOm5zOm1ldGEvIiB4OnhtcHRrPSJBZG9iZSBYTVAgQ29yZSA1LjYtYzEzOCA3OS4xNTk4MjQsIDIwMTYvMDkvMTQtMDE6MDk6MDEgICAgICAgICI+IDxyZGY6UkRGIHhtbG5zOnJkZj0iaHR0cDovL3d3dy53My5vcmcvMTk5OS8wMi8yMi1yZGYtc3ludGF4LW5zIyI+IDxyZGY6RGVzY3JpcHRpb24gcmRmOmFib3V0PSIiIHhtbG5zOnhtcE1NPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvbW0vIiB4bWxuczpzdFJlZj0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL3NUeXBlL1Jlc291cmNlUmVmIyIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bXBNTTpEb2N1bWVudElEPSJ4bXAuZGlkOjQ5REQwMEUzMUFENzExRTc5NThGOTAzNUY0QzRBMUQ3IiB4bXBNTTpJbnN0YW5jZUlEPSJ4bXAuaWlkOjQ5REQwMEUyMUFENzExRTc5NThGOTAzNUY0QzRBMUQ3IiB4bXA6Q3JlYXRvclRvb2w9IkFkb2JlIFBob3Rvc2hvcCBDQyAyMDE3IFdpbmRvd3MiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0iMTA3NTIxMUUzQTREMTJBMDc3RTEyN0E4QkJENDZCNTAiIHN0UmVmOmRvY3VtZW50SUQ9IjEwNzUyMTFFM0E0RDEyQTA3N0UxMjdBOEJCRDQ2QjUwIi8+IDwvcmRmOkRlc2NyaXB0aW9uPiA8L3JkZjpSREY+IDwveDp4bXBtZXRhPiA8P3hwYWNrZXQgZW5kPSJyIj8+/+4ADkFkb2JlAGTAAAAAAf/bAIQAAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEB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\" data-filename=\"user4.jpg\">vxvcxvcx xcvx</p>','2023-12-08',0,'2023-12-07 13:38:17',NULL,'2023-12-07 19:12:35',NULL,1),(2,2,2,4,'New test','this is testing data','2023-12-11',0,'2023-12-07 19:07:12',NULL,'2023-12-07 19:07:12',NULL,1);
/*!40000 ALTER TABLE `homework` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leavingcertificate`
--

DROP TABLE IF EXISTS `leavingcertificate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `leavingcertificate` (
  `id` int NOT NULL AUTO_INCREMENT,
  `studentId` int DEFAULT NULL,
  `studentName` text,
  `className` varchar(45) DEFAULT NULL,
  `divName` varchar(45) DEFAULT NULL,
  `gender` varchar(45) DEFAULT NULL,
  `dateOfBirth` varchar(45) DEFAULT NULL,
  `rollNo` varchar(45) DEFAULT NULL,
  `motherName` varchar(45) DEFAULT NULL,
  `fatherName` varchar(45) DEFAULT NULL,
  `nationality` varchar(45) DEFAULT NULL,
  `religion` varchar(45) DEFAULT NULL,
  `caste` varchar(45) DEFAULT NULL,
  `lastResult` varchar(45) DEFAULT NULL,
  `generalConduct` varchar(45) DEFAULT NULL,
  `dateOfCertificate` varchar(45) DEFAULT NULL,
  `leavingReason` varchar(225) DEFAULT NULL,
  `remark` text,
  `otherData` text,
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createdBy` bigint DEFAULT NULL,
  `updatedAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedBy` bigint DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leavingcertificate`
--

LOCK TABLES `leavingcertificate` WRITE;
/*!40000 ALTER TABLE `leavingcertificate` DISABLE KEYS */;
/*!40000 ALTER TABLE `leavingcertificate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messageportal`
--

DROP TABLE IF EXISTS `messageportal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `messageportal` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `userId` int DEFAULT NULL,
  `parentId` bigint DEFAULT NULL,
  `studentId` bigint DEFAULT NULL,
  `messageType` int DEFAULT NULL,
  `messageFrom` int DEFAULT NULL,
  `messageText` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createdBy` bigint DEFAULT NULL,
  `updatedAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedBy` bigint DEFAULT NULL,
  `active` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `messageportal_ibfk_1` (`userId`),
  KEY `messageportal_ibfk_2` (`parentId`),
  KEY `messageportal_ibfk_3` (`studentId`),
  CONSTRAINT `messageportal_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`),
  CONSTRAINT `messageportal_ibfk_2` FOREIGN KEY (`parentId`) REFERENCES `parentuser` (`id`),
  CONSTRAINT `messageportal_ibfk_3` FOREIGN KEY (`studentId`) REFERENCES `student` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messageportal`
--

LOCK TABLES `messageportal` WRITE;
/*!40000 ALTER TABLE `messageportal` DISABLE KEYS */;
/*!40000 ALTER TABLE `messageportal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `module_roles`
--

DROP TABLE IF EXISTS `module_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `module_roles` (
  `id` int NOT NULL,
  `moduleId` int DEFAULT NULL,
  `roleId` int DEFAULT NULL,
  `createdBy` int DEFAULT NULL,
  `createdAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedBy` int DEFAULT NULL,
  `updatedAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `moduleId` (`moduleId`),
  KEY `roleId` (`roleId`),
  CONSTRAINT `module_roles_ibfk_1` FOREIGN KEY (`moduleId`) REFERENCES `modules` (`moduleId`),
  CONSTRAINT `module_roles_ibfk_2` FOREIGN KEY (`roleId`) REFERENCES `roles` (`roleId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `module_roles`
--

LOCK TABLES `module_roles` WRITE;
/*!40000 ALTER TABLE `module_roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `module_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modules`
--

DROP TABLE IF EXISTS `modules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `modules` (
  `moduleId` int NOT NULL AUTO_INCREMENT,
  `moduleName` varchar(50) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `createdBy` int DEFAULT NULL,
  `createdAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedBy` int DEFAULT NULL,
  `updatedAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`moduleId`),
  UNIQUE KEY `module_name` (`moduleName`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modules`
--

LOCK TABLES `modules` WRITE;
/*!40000 ALTER TABLE `modules` DISABLE KEYS */;
/*!40000 ALTER TABLE `modules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `news`
--

DROP TABLE IF EXISTS `news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `news` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `newsEventType` tinyint(1) DEFAULT '1',
  `newsEventTitle` varchar(45) NOT NULL,
  `newsEventDetail` text,
  `newsEventDate` varchar(45) DEFAULT NULL,
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createdBy` bigint DEFAULT NULL,
  `updatedAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedBy` bigint DEFAULT NULL,
  `active` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `news`
--

LOCK TABLES `news` WRITE;
/*!40000 ALTER TABLE `news` DISABLE KEYS */;
/*!40000 ALTER TABLE `news` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `parentuser`
--

DROP TABLE IF EXISTS `parentuser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `parentuser` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `parentName` varchar(255) DEFAULT NULL,
  `parentMobileNumber` int DEFAULT NULL,
  `parentPwd` varchar(255) DEFAULT NULL,
  `studentIds` varchar(255) DEFAULT NULL,
  `parentDevice` varchar(255) DEFAULT NULL,
  `parentDeviceVerify` int DEFAULT NULL,
  `activeDevice` int DEFAULT NULL,
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createdBy` bigint DEFAULT NULL,
  `updatedAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedBy` bigint DEFAULT NULL,
  `active` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parentuser`
--

LOCK TABLES `parentuser` WRITE;
/*!40000 ALTER TABLE `parentuser` DISABLE KEYS */;
/*!40000 ALTER TABLE `parentuser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permissions` (
  `permissionId` int NOT NULL AUTO_INCREMENT,
  `permissionName` varchar(50) DEFAULT NULL,
  `createdBy` int DEFAULT NULL,
  `createdAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedBy` int DEFAULT NULL,
  `updatedAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`permissionId`),
  UNIQUE KEY `permissionName` (`permissionName`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions`
--

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rolepermissions`
--

DROP TABLE IF EXISTS `rolepermissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rolepermissions` (
  `rolePermissionID` int NOT NULL AUTO_INCREMENT,
  `roleId` int DEFAULT NULL,
  `permissionId` int DEFAULT NULL,
  `createdBy` int DEFAULT NULL,
  `createdAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedBy` int DEFAULT NULL,
  `updatedAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`rolePermissionID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rolepermissions`
--

LOCK TABLES `rolepermissions` WRITE;
/*!40000 ALTER TABLE `rolepermissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `rolepermissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `roleId` int NOT NULL AUTO_INCREMENT,
  `roleName` varchar(50) DEFAULT NULL,
  `createdBy` int DEFAULT NULL,
  `createdAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedBy` int DEFAULT NULL,
  `updatedAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`roleId`),
  UNIQUE KEY `roleName` (`roleName`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schoolprofile`
--

DROP TABLE IF EXISTS `schoolprofile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `schoolprofile` (
  `id` int NOT NULL AUTO_INCREMENT,
  `schoolName` varchar(255) NOT NULL,
  `schoolAddress` text NOT NULL,
  `contactNo1` varchar(50) NOT NULL,
  `contactNo2` varchar(50) NOT NULL,
  `emailId` varchar(255) NOT NULL,
  `website` varchar(255) NOT NULL,
  `regNo` varchar(255) NOT NULL,
  `schoolStartDate` datetime NOT NULL,
  `schoolEndDate` datetime NOT NULL,
  `createdAt` datetime NOT NULL,
  `createdBy` int DEFAULT NULL,
  `updatedAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedBy` int DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schoolprofile`
--

LOCK TABLES `schoolprofile` WRITE;
/*!40000 ALTER TABLE `schoolprofile` DISABLE KEYS */;
INSERT INTO `schoolprofile` VALUES (1,'Balkavi Thombare Secondary High School','At Post:pimpri kh, Tal-Dharangaon, Dist:Jalgaon, Pin-425105','7588646203','7588646201','dheerajmalu@ymail.com','www.mjs.com','23423fsdr53','2023-07-17 00:00:00','2024-06-30 00:00:00','0000-00-00 00:00:00',0,'2023-11-25 04:42:54',0,1);
/*!40000 ALTER TABLE `schoolprofile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sequelizemeta`
--

DROP TABLE IF EXISTS `sequelizemeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sequelizemeta` (
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`name`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sequelizemeta`
--

LOCK TABLES `sequelizemeta` WRITE;
/*!40000 ALTER TABLE `sequelizemeta` DISABLE KEYS */;
INSERT INTO `sequelizemeta` VALUES ('201800113232323-create-attendance.js'),('201800113232323-create-classteacher.js'),('201800113232323-create-finalResult.js'),('201800113232323-create-parentuser.js'),('201800113232323-create-teacherSubject.js'),('201800113232323-create-testMarks.js'),('2018001132323233434343-create-messageportal.js'),('20180116184149-create-user.js'),('20180116184150-create-class.js'),('20180116184150-create-days.js'),('20180116184150-create-division.js'),('20180116184150-create-state.js'),('20180116184150-create-subject.js'),('20180116184150-create-test.js'),('20180116184151-create-city.js'),('20180116184151-create-student.js'),('20180116184151-create-teacher.js'),('20180116184179-timetable.js'),('20180901044400-create-todo.js');
/*!40000 ALTER TABLE `sequelizemeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `state`
--

DROP TABLE IF EXISTS `state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `state` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `stateName` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createdBy` bigint DEFAULT NULL,
  `updatedAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedBy` bigint DEFAULT NULL,
  `active` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `state`
--

LOCK TABLES `state` WRITE;
/*!40000 ALTER TABLE `state` DISABLE KEYS */;
INSERT INTO `state` VALUES (1,'Maharashtra','2018-09-13 13:21:45',NULL,'2018-09-13 13:21:45',NULL,1),(2,'Goa','2018-09-13 13:21:45',NULL,'2018-09-13 13:21:45',NULL,1),(3,'MP','2023-12-13 01:16:08',NULL,'2023-12-13 01:16:08',NULL,1);
/*!40000 ALTER TABLE `state` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `firstName` varchar(255) DEFAULT NULL,
  `middleName` varchar(255) DEFAULT NULL,
  `lastName` varchar(255) DEFAULT NULL,
  `profileImage` varchar(255) DEFAULT NULL,
  `gender` int DEFAULT NULL,
  `dateOfBirth` varchar(255) DEFAULT NULL,
  `classId` int DEFAULT NULL,
  `divId` int DEFAULT NULL,
  `rollNo` varchar(255) DEFAULT NULL,
  `motherName` varchar(255) DEFAULT NULL,
  `motherQual` varchar(255) DEFAULT NULL,
  `motherProf` varchar(255) DEFAULT NULL,
  `fatherName` varchar(255) DEFAULT NULL,
  `fatherQual` varchar(255) DEFAULT NULL,
  `fatherProf` varchar(255) DEFAULT NULL,
  `parentNumber` varchar(255) DEFAULT NULL,
  `parentNumberSecond` varchar(255) DEFAULT NULL,
  `nationality` varchar(50) DEFAULT NULL,
  `religion` varchar(50) DEFAULT NULL,
  `caste` varchar(20) DEFAULT NULL,
  `bloodGroup` varchar(20) DEFAULT NULL,
  `address` text,
  `cityId` bigint DEFAULT NULL,
  `stateId` bigint DEFAULT NULL,
  `pincode` varchar(255) DEFAULT NULL,
  `prevClassDiv` text,
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createdBy` bigint DEFAULT NULL,
  `updatedAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedBy` bigint DEFAULT NULL,
  `active` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `student_ibfk_1` (`classId`),
  KEY `student_ibfk_2` (`divId`),
  KEY `student_ibfk_3` (`cityId`),
  KEY `student_ibfk_4` (`stateId`),
  CONSTRAINT `student_ibfk_1` FOREIGN KEY (`classId`) REFERENCES `class` (`id`),
  CONSTRAINT `student_ibfk_2` FOREIGN KEY (`divId`) REFERENCES `division` (`id`),
  CONSTRAINT `student_ibfk_3` FOREIGN KEY (`cityId`) REFERENCES `city` (`id`),
  CONSTRAINT `student_ibfk_4` FOREIGN KEY (`stateId`) REFERENCES `state` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES (1,'dheeraj','j','malu','1699354294375.jpg',1,'12-11-1990',1,1,'5','Sandhya','B.com','housewife','Jagdish','B.com','employee','7588646203','9860335008','Indian','maharashtra','Hindu','A+','at post:- pimpri kh. tal-dharangaon, jalgaon',1,1,NULL,NULL,'2018-09-13 13:36:13',NULL,'2023-11-07 10:51:34',NULL,1),(2,'Pavan','j','Patil','1699354246496.jpg',1,'01/11/1990',1,1,'6','xcvcxvx',NULL,'xccv','suraj',NULL,'xcvxcv','9860335008','8877887777','cxvxc','zxcvcx ','xcvxc','xcvcx','xcvvxcvx',1,1,NULL,NULL,'2018-09-13 13:36:13',NULL,'2023-11-07 10:50:46',NULL,1),(7,'Darpan','j','Patel',NULL,1,NULL,1,2,'1','shanti',NULL,'housewife','ashok',NULL,'working','8989989989','8988989889','Indian','maharashtra','hindi','A+','gujrat',NULL,1,NULL,NULL,'2019-03-16 07:58:07',NULL,'2019-03-16 07:58:07',NULL,1),(8,'Darpan','m','patil',NULL,1,NULL,2,1,'1','shanti',NULL,'housewife','ashok',NULL,'working','8989989989','8988989889','Indian','maharashtra','hindi','A+','gujrat',NULL,1,NULL,NULL,'2019-03-16 07:58:07',NULL,'2019-03-16 07:58:07',NULL,1),(9,'Ethan','I.','Moore',NULL,1,'2002-05-08',3,1,'2','Grace Moore','PhD','Engineer','Liam Moore','MS','Doctor','+1234567890','+9876543210','Japan','Buddhist','OBC','B-','987 Elm St',3,2,'34567',NULL,'2019-03-16 07:58:07',NULL,'2023-12-13 06:11:10',NULL,1),(10,'naresh','m','patil',NULL,1,NULL,2,1,'1','shanti',NULL,'housewife','ashok',NULL,'working','8989989989','8988989889','Indian','maharashtra','hindi','A+','gujrat',NULL,1,NULL,NULL,'2019-03-16 07:58:07',NULL,'2019-03-16 07:58:07',NULL,1),(12,'Jane1','B.','Smith',NULL,2,'2001-02-15',3,1,'1','Emily Smith','MBA','Doctor','Bob Smith','MS','Scientist','+9876543210','+1234567890','Canada','Hindu','SC','A-','456 Oak St',2,2,'56789',NULL,'2023-10-23 06:36:47',NULL,'2023-12-13 06:11:10',NULL,1),(16,'lalit','s','patil',NULL,1,NULL,1,1,NULL,'dffff fd',NULL,'cvxcvxvx zxcv','dnfksdnvkn ds',NULL,'dsvcx xc','8877665544','8877667788','indian','hindu','obc','A+','vcxvxc  xcxvvx',1,1,NULL,NULL,'2023-10-29 03:13:31',NULL,'2023-11-05 20:48:36',NULL,1),(17,'ankita','d','mali','1699352278119.jpg',2,'01/11/1990',1,1,NULL,'sdsada',NULL,'xcvcx','xzxcxzczx',NULL,'cxvcxvx','8877887788','8899774455','indian','hindu','open','O','test',1,1,NULL,NULL,'2023-11-07 10:04:02',NULL,'2023-11-07 10:17:58',NULL,1),(19,'Dheeraj Kumar ','J','Malu','1699386298978.jpg',1,'01/07/2019',1,2,NULL,'Gmgntnt',NULL,'Sbtbh','Fnntbtnt',NULL,'Dntnt','9988776655','9988776655','Indian ','Hindu ','Open ','A+','Hermosa ',1,1,NULL,NULL,'2023-11-07 19:45:00',NULL,'2023-11-07 19:45:00',NULL,1),(20,'nikita','s','mundada',NULL,1,'2023-10-26 20:30:00',1,1,'1','sunita','housewife',NULL,'shyamsundar',NULL,'business','9988774455','7788995566','indian','hindu','open','A+','test',1,1,NULL,'','2023-12-12 19:11:39',NULL,'2023-12-12 20:42:14',NULL,1),(45,'Jane1','B.','Smith',NULL,2,'2001-02-15',3,1,'1','Emily Smith','MBA','Doctor','Bob Smith','MS','Scientist','+9876543210','+1234567890','Canada','Hindu','SC','A-','456 Oak St',2,2,'56789','','2023-12-13 06:32:29',1,'2023-12-13 07:45:51',1,1),(46,'Ethan','I.','Moore',NULL,1,'2002-05-08',3,1,'2','Grace Moore','PhD','Engineer','Liam Moore','MS','Doctor','+1234567890','+9876543210','Japan','Buddhist','OBC','B-','987 Elm St',3,2,'34567','','2023-12-13 06:32:29',1,'2023-12-13 07:45:51',1,1),(47,'David1','E.','Miller',NULL,1,'2003-07-12',3,2,'1','Sophie Miller','MA','Teacher','Peter Miller','PhD','Doctor','+1122334455','+5566778899','France','Jewish','General','O-','890 Cedar St',2,1,'67890','','2023-12-13 06:32:29',1,'2023-12-13 07:45:51',1,1),(48,'Sophia','F.','Brown',NULL,2,'2000-10-05',3,2,'2','Oliver Brown','MS','Engineer','Emma Brown','MA','Artist','+1234567890','+9876543210','Germany','Muslim','OBC','B+','234 Pine St',3,2,'76543','','2023-12-13 06:32:29',1,'2023-12-13 07:45:51',1,1),(50,'Robert','C.','Johnson',NULL,1,'1999-11-30 00:00:00',3,4,'1','Maria Johnson','MA','Artist','David Johnson','PhD','Professor','9999444444','9999444444','Australia','Buddhist','OBC','B+','789 Pine St',1,3,'98765','','2023-12-13 06:32:29',1,'2023-12-13 07:45:51',1,1);
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `studentlistview`
--

DROP TABLE IF EXISTS `studentlistview`;
/*!50001 DROP VIEW IF EXISTS `studentlistview`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `studentlistview` AS SELECT 
 1 AS `id`,
 1 AS `studentName`,
 1 AS `classId`,
 1 AS `className`,
 1 AS `divId`,
 1 AS `divName`,
 1 AS `rollNo`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `studentmonthlyattendanceview`
--

DROP TABLE IF EXISTS `studentmonthlyattendanceview`;
/*!50001 DROP VIEW IF EXISTS `studentmonthlyattendanceview`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `studentmonthlyattendanceview` AS SELECT 
 1 AS `studentId`,
 1 AS `studentName`,
 1 AS `classId`,
 1 AS `divId`,
 1 AS `attendanceMonth`,
 1 AS `monthAvg`,
 1 AS `presentdays`,
 1 AS `totaldays`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `studenttestresultview`
--

DROP TABLE IF EXISTS `studenttestresultview`;
/*!50001 DROP VIEW IF EXISTS `studenttestresultview`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `studenttestresultview` AS SELECT 
 1 AS `studentId`,
 1 AS `testId`,
 1 AS `classId`,
 1 AS `divId`,
 1 AS `totalSubject`,
 1 AS `profileImage`,
 1 AS `studentName`,
 1 AS `testName`,
 1 AS `className`,
 1 AS `subjectIds`,
 1 AS `divName`,
 1 AS `totalAvg`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `subject`
--

DROP TABLE IF EXISTS `subject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subject` (
  `id` int NOT NULL AUTO_INCREMENT,
  `subName` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createdBy` bigint DEFAULT NULL,
  `updatedAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedBy` bigint DEFAULT NULL,
  `active` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `subName_UNIQUE` (`subName`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subject`
--

LOCK TABLES `subject` WRITE;
/*!40000 ALTER TABLE `subject` DISABLE KEYS */;
INSERT INTO `subject` VALUES (1,'Marathi','2018-09-19 08:57:23',NULL,'2018-09-19 08:57:23',NULL,1),(2,'Hindi','2018-09-19 08:57:36',NULL,'2018-09-19 08:57:36',NULL,1),(3,'English','2018-09-19 08:57:48',NULL,'2018-09-19 08:57:48',NULL,1),(4,'History','2018-09-19 08:57:36',NULL,'2018-09-19 08:57:36',NULL,1),(5,'Math','2018-09-19 08:57:48',NULL,'2018-09-19 08:57:48',NULL,1),(6,'Geography','2023-10-23 06:44:11',NULL,'2023-10-30 02:47:20',NULL,1);
/*!40000 ALTER TABLE `subject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `subjectteacherview`
--

DROP TABLE IF EXISTS `subjectteacherview`;
/*!50001 DROP VIEW IF EXISTS `subjectteacherview`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `subjectteacherview` AS SELECT 
 1 AS `id`,
 1 AS `teacherId`,
 1 AS `subId`,
 1 AS `classId`,
 1 AS `divId`,
 1 AS `subName`,
 1 AS `className`,
 1 AS `divName`,
 1 AS `teacherName`,
 1 AS `mobileNumber`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `teacher`
--

DROP TABLE IF EXISTS `teacher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teacher` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `firstName` varchar(255) DEFAULT NULL,
  `middleName` varchar(255) DEFAULT NULL,
  `lastName` varchar(255) DEFAULT NULL,
  `profileImage` varchar(255) DEFAULT NULL,
  `gender` int DEFAULT NULL,
  `bloodGroup` varchar(50) DEFAULT NULL,
  `dateOfBirth` varchar(255) DEFAULT NULL,
  `qualification` varchar(255) DEFAULT NULL,
  `experience` varchar(255) DEFAULT NULL,
  `nationality` varchar(50) DEFAULT NULL,
  `caste` varchar(50) DEFAULT NULL,
  `mobileNumber` varchar(255) DEFAULT NULL,
  `mobileNumberSecond` varchar(255) DEFAULT NULL,
  `address` text,
  `cityId` bigint DEFAULT NULL,
  `stateId` bigint DEFAULT NULL,
  `pincode` varchar(255) DEFAULT NULL,
  `joiningDate` varchar(255) DEFAULT NULL,
  `endDate` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createdBy` bigint DEFAULT NULL,
  `updatedAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedBy` bigint DEFAULT NULL,
  `active` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `teacher_ibfk_1` (`cityId`),
  KEY `teacher_ibfk_2` (`stateId`),
  CONSTRAINT `teacher_ibfk_1` FOREIGN KEY (`cityId`) REFERENCES `city` (`id`),
  CONSTRAINT `teacher_ibfk_2` FOREIGN KEY (`stateId`) REFERENCES `state` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teacher`
--

LOCK TABLES `teacher` WRITE;
/*!40000 ALTER TABLE `teacher` DISABLE KEYS */;
INSERT INTO `teacher` VALUES (1,'Suredra','P','Sharma','1699356162072.jpg',1,'A-','01/11/1990','MA','3 years','Indian','open','9860335008','9860335008','dsfds',1,1,NULL,'12/12/2012',NULL,'2018-10-07 00:55:19',NULL,'2023-11-07 11:22:42',NULL,1),(2,'Ashwin','P','Patil','',1,'xcvxcv','04/01/2023','cvcxvxc','sdvxccx','vcx','cxv','21121212121','1321212121','xcvcxv',1,1,'425001','12/12/2012',NULL,'2018-10-07 00:55:19',NULL,'2023-11-06 10:37:54',NULL,1),(3,'jyotsna','P','Patil',NULL,2,'A+','01/11/1990','MA','3 years','Indian ','Open ','9860335008','9988776655','Dharangaon',1,1,'425001','12/12/2012',NULL,'2018-10-07 00:55:19',NULL,'2023-11-07 02:41:07',NULL,1),(4,'Hiten','P','Patil',NULL,1,NULL,'01/11/1990','MA','3 years',NULL,NULL,'9860335008',NULL,NULL,2,1,'425001','12/12/2012',NULL,'2018-10-07 00:55:19',NULL,'2018-10-07 00:55:19',NULL,1),(5,'Dheeraj','P','Patil',NULL,1,NULL,'01/11/1990','MA','3 years',NULL,NULL,'9860335008',NULL,NULL,2,1,'425001','12/12/2012',NULL,'2018-10-07 00:55:19',NULL,'2018-10-07 00:55:19',NULL,1),(6,'Suraj','P','Patil',NULL,1,'o+','01/11/1990','MA','3 years','indian','open','9988223300','9911223322','E601',1,1,'425001','12/12/2012',NULL,'2018-10-07 00:55:19',NULL,'2023-10-29 09:25:41',NULL,1);
/*!40000 ALTER TABLE `teacher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teachersubject`
--

DROP TABLE IF EXISTS `teachersubject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teachersubject` (
  `id` int NOT NULL AUTO_INCREMENT,
  `teacherId` bigint DEFAULT NULL,
  `subId` int DEFAULT NULL,
  `classId` int DEFAULT NULL,
  `divId` int DEFAULT NULL,
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createdBy` bigint DEFAULT NULL,
  `updatedAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedBy` bigint DEFAULT NULL,
  `active` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_unique_combination` (`teacherId`,`subId`,`classId`,`divId`),
  KEY `teachersubject_ibfk_1` (`teacherId`),
  KEY `teachersubject_ibfk_2` (`subId`),
  KEY `teachersubject_ibfk_3` (`classId`),
  KEY `teachersubject_ibfk_4` (`divId`),
  CONSTRAINT `teachersubject_ibfk_1` FOREIGN KEY (`teacherId`) REFERENCES `teacher` (`id`),
  CONSTRAINT `teachersubject_ibfk_2` FOREIGN KEY (`subId`) REFERENCES `subject` (`id`),
  CONSTRAINT `teachersubject_ibfk_3` FOREIGN KEY (`classId`) REFERENCES `class` (`id`),
  CONSTRAINT `teachersubject_ibfk_4` FOREIGN KEY (`divId`) REFERENCES `division` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teachersubject`
--

LOCK TABLES `teachersubject` WRITE;
/*!40000 ALTER TABLE `teachersubject` DISABLE KEYS */;
INSERT INTO `teachersubject` VALUES (1,1,3,1,1,'2018-09-22 06:59:17',NULL,'2018-09-22 06:59:17',NULL,1),(2,1,2,1,2,'2018-09-22 06:59:37',NULL,'2018-09-22 06:59:37',NULL,1),(3,1,1,1,1,'2018-09-22 06:59:54',NULL,'2018-09-22 06:59:54',NULL,1),(4,2,4,2,2,'2018-09-22 06:59:54',NULL,'2018-09-22 06:59:54',NULL,1),(5,1,2,1,1,'2018-09-22 06:59:37',NULL,'2018-09-22 06:59:37',NULL,1),(6,1,1,1,2,'2018-09-22 06:59:54',NULL,'2018-09-22 06:59:54',NULL,1),(7,1,3,1,2,'2018-09-22 06:59:17',NULL,'2018-09-22 06:59:17',NULL,1),(8,2,4,2,1,'2018-09-22 06:59:54',NULL,'2018-09-22 06:59:54',NULL,1),(9,2,5,2,2,'2018-09-22 06:59:54',NULL,'2018-09-22 06:59:54',NULL,1),(10,2,2,2,2,'2018-09-22 06:59:54',NULL,'2018-09-22 06:59:54',NULL,1),(15,6,5,1,1,'2023-11-01 09:49:03',NULL,'2023-11-01 10:39:44',NULL,1),(16,3,5,1,2,'2023-11-01 10:44:38',NULL,'2023-11-01 10:44:38',NULL,1),(17,5,4,1,1,'2023-11-06 12:48:16',NULL,'2023-11-06 12:48:16',NULL,1);
/*!40000 ALTER TABLE `teachersubject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `teachersubjectrecordview`
--

DROP TABLE IF EXISTS `teachersubjectrecordview`;
/*!50001 DROP VIEW IF EXISTS `teachersubjectrecordview`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `teachersubjectrecordview` AS SELECT 
 1 AS `classId`,
 1 AS `divId`,
 1 AS `subId`,
 1 AS `testId`,
 1 AS `teacherId`,
 1 AS `testName`,
 1 AS `className`,
 1 AS `divName`,
 1 AS `subName`,
 1 AS `teacherName`,
 1 AS `avgRecord`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `test`
--

DROP TABLE IF EXISTS `test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `test` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `testName` varchar(255) NOT NULL,
  `testDate` datetime DEFAULT NULL,
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createdBy` bigint DEFAULT NULL,
  `updatedAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedBy` bigint DEFAULT NULL,
  `active` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `testName_UNIQUE` (`testName`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test`
--

LOCK TABLES `test` WRITE;
/*!40000 ALTER TABLE `test` DISABLE KEYS */;
INSERT INTO `test` VALUES (1,'test1','2019-01-01 00:00:00','2018-09-22 06:22:28',NULL,'2018-09-22 06:22:28',NULL,1),(2,'First Sem','2019-02-04 00:00:00','2018-09-22 06:22:28',NULL,'2023-10-23 06:56:24',NULL,1),(3,'test2','2019-03-20 00:00:00','2018-09-22 06:23:05',NULL,'2023-10-30 12:54:05',NULL,1),(4,'Second Sem',NULL,'2023-10-23 07:00:05',NULL,'2023-10-23 07:00:05',NULL,1);
/*!40000 ALTER TABLE `test` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `testmarks`
--

DROP TABLE IF EXISTS `testmarks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `testmarks` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `studentId` bigint DEFAULT NULL,
  `teacherId` bigint DEFAULT NULL,
  `classId` int DEFAULT NULL,
  `divId` int DEFAULT NULL,
  `testId` bigint DEFAULT NULL,
  `subId` int DEFAULT NULL,
  `getMarks` varchar(255) DEFAULT NULL,
  `totalMarks` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createdBy` bigint DEFAULT NULL,
  `updatedAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedBy` bigint DEFAULT NULL,
  `active` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_record` (`studentId`,`classId`,`divId`,`testId`,`subId`),
  KEY `studentId` (`studentId`),
  KEY `classId` (`classId`),
  KEY `divId` (`divId`),
  KEY `testId` (`testId`),
  KEY `subId` (`subId`),
  KEY `testmarks_ibfk_2` (`teacherId`),
  CONSTRAINT `testmarks_ibfk_1` FOREIGN KEY (`studentId`) REFERENCES `student` (`id`),
  CONSTRAINT `testmarks_ibfk_2` FOREIGN KEY (`teacherId`) REFERENCES `teacher` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  CONSTRAINT `testmarks_ibfk_3` FOREIGN KEY (`classId`) REFERENCES `class` (`id`),
  CONSTRAINT `testmarks_ibfk_4` FOREIGN KEY (`divId`) REFERENCES `division` (`id`),
  CONSTRAINT `testmarks_ibfk_5` FOREIGN KEY (`testId`) REFERENCES `test` (`id`),
  CONSTRAINT `testmarks_ibfk_6` FOREIGN KEY (`subId`) REFERENCES `subject` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=141 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testmarks`
--

LOCK TABLES `testmarks` WRITE;
/*!40000 ALTER TABLE `testmarks` DISABLE KEYS */;
INSERT INTO `testmarks` VALUES (77,16,1,1,1,1,1,'50','100','2023-11-06 11:45:22',NULL,'2023-11-06 11:45:22',NULL,1),(78,1,1,1,1,1,1,'80','100','2023-11-06 11:45:22',NULL,'2023-11-06 11:45:22',NULL,1),(79,2,1,1,1,1,1,'90','100','2023-11-06 11:45:22',NULL,'2023-11-06 11:45:22',NULL,1),(80,7,1,1,2,1,1,'90','100','2023-11-06 11:46:04',NULL,'2023-11-06 11:46:04',NULL,1),(81,7,1,1,2,2,1,'87','100','2023-11-06 11:46:14',NULL,'2023-11-06 11:46:14',NULL,1),(82,16,1,1,1,2,1,'100','100','2023-11-06 11:46:35',NULL,'2023-11-06 11:46:35',NULL,1),(83,1,1,1,1,2,1,'90','100','2023-11-06 11:46:35',NULL,'2023-11-06 11:46:35',NULL,1),(84,2,1,1,1,2,1,'80','100','2023-11-06 11:46:35',NULL,'2023-11-06 11:46:35',NULL,1),(85,9,1,2,2,1,2,'90','100','2023-11-06 11:54:43',NULL,'2023-11-06 11:54:43',NULL,1),(86,12,1,2,2,1,2,'90','100','2023-11-06 11:54:43',NULL,'2023-11-06 11:54:43',NULL,1),(87,16,1,1,1,1,3,'90','100','2023-11-06 12:45:02',NULL,'2023-11-06 12:45:02',NULL,1),(88,1,1,1,1,1,3,'89','100','2023-11-06 12:45:02',NULL,'2023-11-06 12:45:02',NULL,1),(89,2,1,1,1,1,3,'88','100','2023-11-06 12:45:02',NULL,'2023-11-06 12:45:02',NULL,1),(90,16,1,1,1,1,2,'100','100','2023-11-06 12:45:34',NULL,'2023-11-06 12:45:34',NULL,1),(91,1,1,1,1,1,2,'90','100','2023-11-06 12:45:34',NULL,'2023-11-06 12:45:34',NULL,1),(92,2,1,1,1,1,2,'80','100','2023-11-06 12:45:34',NULL,'2023-11-06 12:45:34',NULL,1),(93,16,1,1,1,1,5,'99','100','2023-11-06 12:45:52',NULL,'2023-11-06 12:45:52',NULL,1),(94,1,1,1,1,1,5,'89','100','2023-11-06 12:45:52',NULL,'2023-11-06 12:45:52',NULL,1),(95,2,1,1,1,1,5,'79','100','2023-11-06 12:45:52',NULL,'2023-11-06 12:45:52',NULL,1),(96,16,1,1,1,1,4,'99','100','2023-11-06 12:48:31',NULL,'2023-11-06 12:48:31',NULL,1),(97,1,1,1,1,1,4,'99','100','2023-11-06 12:48:31',NULL,'2023-11-06 12:48:31',NULL,1),(98,2,1,1,1,1,4,'88','100','2023-11-06 12:48:31',NULL,'2023-11-06 12:48:31',NULL,1),(99,16,1,1,1,2,2,'90','100','2023-11-07 03:04:31',NULL,'2023-11-07 03:04:31',NULL,1),(100,1,1,1,1,2,2,'88','100','2023-11-07 03:04:31',NULL,'2023-11-07 03:04:31',NULL,1),(101,2,1,1,1,2,2,'88','100','2023-11-07 03:04:31',NULL,'2023-11-07 03:04:31',NULL,1),(102,16,1,1,1,2,3,'89','100','2023-11-07 03:04:48',NULL,'2023-11-07 03:04:48',NULL,1),(103,1,1,1,1,2,3,'89','100','2023-11-07 03:04:48',NULL,'2023-11-07 03:04:48',NULL,1),(104,2,1,1,1,2,3,'89','100','2023-11-07 03:04:48',NULL,'2023-11-07 03:04:48',NULL,1),(105,16,1,1,1,2,5,'98','100','2023-11-07 03:05:03',NULL,'2023-11-07 03:05:03',NULL,1),(106,1,1,1,1,2,5,'88','100','2023-11-07 03:05:03',NULL,'2023-11-07 03:05:03',NULL,1),(107,2,1,1,1,2,5,'88','100','2023-11-07 03:05:03',NULL,'2023-11-07 03:05:03',NULL,1),(108,16,1,1,1,2,4,'44','100','2023-11-07 03:05:17',NULL,'2023-11-07 03:05:17',NULL,1),(109,1,1,1,1,2,4,'49','100','2023-11-07 03:05:17',NULL,'2023-11-07 03:05:17',NULL,1),(110,2,1,1,1,2,4,'77','100','2023-11-07 03:05:17',NULL,'2023-11-07 03:05:17',NULL,1),(111,16,1,1,1,3,1,'90','100','2023-11-07 03:06:08',NULL,'2023-11-07 03:06:08',NULL,1),(112,1,1,1,1,3,1,'90','100','2023-11-07 03:06:08',NULL,'2023-11-07 03:06:08',NULL,1),(113,2,1,1,1,3,1,'98','100','2023-11-07 03:06:08',NULL,'2023-11-07 03:06:08',NULL,1),(114,16,1,1,1,4,1,'88','100','2023-11-07 03:07:49',NULL,'2023-11-07 03:07:49',NULL,1),(115,1,1,1,1,4,1,'89','100','2023-11-07 03:07:49',NULL,'2023-11-07 03:07:49',NULL,1),(116,2,1,1,1,4,1,'90','100','2023-11-07 03:07:49',NULL,'2023-11-07 03:07:49',NULL,1),(117,16,1,1,1,3,2,'88','100','2023-11-07 03:08:45',NULL,'2023-11-07 03:08:45',NULL,1),(118,1,1,1,1,3,2,'77','100','2023-11-07 03:08:45',NULL,'2023-11-07 03:08:45',NULL,1),(119,2,1,1,1,3,2,'77','100','2023-11-07 03:08:45',NULL,'2023-11-07 03:08:45',NULL,1),(120,16,1,1,1,3,3,'91','100','2023-11-07 03:09:05',NULL,'2023-11-07 03:09:05',NULL,1),(121,1,1,1,1,3,3,'77','100','2023-11-07 03:09:05',NULL,'2023-11-07 03:09:05',NULL,1),(122,2,1,1,1,3,3,'55','100','2023-11-07 03:09:05',NULL,'2023-11-07 03:09:05',NULL,1),(123,16,1,1,1,3,4,'88','100','2023-11-07 03:09:27',NULL,'2023-11-07 03:09:27',NULL,1),(124,1,1,1,1,3,4,'88','100','2023-11-07 03:09:27',NULL,'2023-11-07 03:09:27',NULL,1),(125,2,1,1,1,3,4,'77','100','2023-11-07 03:09:27',NULL,'2023-11-07 03:09:27',NULL,1),(126,16,1,1,1,3,5,'55','100','2023-11-07 03:09:45',NULL,'2023-11-07 03:09:45',NULL,1),(127,1,1,1,1,3,5,'55','100','2023-11-07 03:09:45',NULL,'2023-11-07 03:09:45',NULL,1),(128,2,1,1,1,3,5,'44','100','2023-11-07 03:09:45',NULL,'2023-11-07 03:09:45',NULL,1),(129,16,1,1,1,4,2,'88','100','2023-11-07 03:10:12',NULL,'2023-11-07 03:10:12',NULL,1),(130,1,1,1,1,4,2,'88','100','2023-11-07 03:10:12',NULL,'2023-11-07 03:10:12',NULL,1),(131,2,1,1,1,4,2,'88','100','2023-11-07 03:10:12',NULL,'2023-11-07 03:10:12',NULL,1),(132,16,1,1,1,4,3,'99','100','2023-11-07 03:10:25',NULL,'2023-11-07 03:10:25',NULL,1),(133,1,1,1,1,4,3,'88','100','2023-11-07 03:10:25',NULL,'2023-11-07 03:10:25',NULL,1),(134,2,1,1,1,4,3,'77','100','2023-11-07 03:10:25',NULL,'2023-11-07 03:10:25',NULL,1),(135,16,1,1,1,4,4,'99','100','2023-11-07 03:10:38',NULL,'2023-11-07 03:10:38',NULL,1),(136,1,1,1,1,4,4,'88','100','2023-11-07 03:10:38',NULL,'2023-11-07 03:10:38',NULL,1),(137,2,1,1,1,4,4,'88','100','2023-11-07 03:10:38',NULL,'2023-11-07 03:10:38',NULL,1),(138,16,1,1,1,4,5,'99','100','2023-11-07 03:10:50',NULL,'2023-11-07 03:10:50',NULL,1),(139,1,1,1,1,4,5,'99','100','2023-11-07 03:10:50',NULL,'2023-11-07 03:10:50',NULL,1),(140,2,1,1,1,4,5,'77','100','2023-11-07 03:10:50',NULL,'2023-11-07 03:10:50',NULL,1);
/*!40000 ALTER TABLE `testmarks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `testmarkslistview`
--

DROP TABLE IF EXISTS `testmarkslistview`;
/*!50001 DROP VIEW IF EXISTS `testmarkslistview`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `testmarkslistview` AS SELECT 
 1 AS `teacherId`,
 1 AS `testId`,
 1 AS `subId`,
 1 AS `classId`,
 1 AS `divId`,
 1 AS `totalMarks`,
 1 AS `testName`,
 1 AS `className`,
 1 AS `divName`,
 1 AS `subName`,
 1 AS `teacherName`,
 1 AS `average`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `testmarkspendinglistview`
--

DROP TABLE IF EXISTS `testmarkspendinglistview`;
/*!50001 DROP VIEW IF EXISTS `testmarkspendinglistview`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `testmarkspendinglistview` AS SELECT 
 1 AS `testId`,
 1 AS `classId`,
 1 AS `divisionId`,
 1 AS `subjectId`,
 1 AS `testName`,
 1 AS `className`,
 1 AS `divName`,
 1 AS `subName`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `testmarkspendingteacherlistview`
--

DROP TABLE IF EXISTS `testmarkspendingteacherlistview`;
/*!50001 DROP VIEW IF EXISTS `testmarkspendingteacherlistview`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `testmarkspendingteacherlistview` AS SELECT 
 1 AS `testId`,
 1 AS `classId`,
 1 AS `divisionId`,
 1 AS `subjectId`,
 1 AS `testName`,
 1 AS `className`,
 1 AS `divName`,
 1 AS `subName`,
 1 AS `teacherId`,
 1 AS `teacherName`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `testmarksview`
--

DROP TABLE IF EXISTS `testmarksview`;
/*!50001 DROP VIEW IF EXISTS `testmarksview`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `testmarksview` AS SELECT 
 1 AS `id`,
 1 AS `studentId`,
 1 AS `teacherId`,
 1 AS `testId`,
 1 AS `subId`,
 1 AS `classId`,
 1 AS `divId`,
 1 AS `getMarks`,
 1 AS `totalMarks`,
 1 AS `testName`,
 1 AS `className`,
 1 AS `divName`,
 1 AS `subName`,
 1 AS `teacherName`,
 1 AS `studentName`,
 1 AS `rollNo`,
 1 AS `createdAt`,
 1 AS `updatedAt`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `testsubjectclassdivisionlistview`
--

DROP TABLE IF EXISTS `testsubjectclassdivisionlistview`;
/*!50001 DROP VIEW IF EXISTS `testsubjectclassdivisionlistview`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `testsubjectclassdivisionlistview` AS SELECT 
 1 AS `testId`,
 1 AS `classId`,
 1 AS `divisionId`,
 1 AS `subjectId`,
 1 AS `testName`,
 1 AS `className`,
 1 AS `divName`,
 1 AS `subName`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `timetable`
--

DROP TABLE IF EXISTS `timetable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `timetable` (
  `id` int NOT NULL AUTO_INCREMENT,
  `classId` int NOT NULL,
  `divId` int NOT NULL,
  `subId` int DEFAULT '0',
  `dayId` int NOT NULL,
  `timeSlot` varchar(255) NOT NULL,
  `textData` text,
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createdBy` bigint DEFAULT NULL,
  `updatedAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedBy` bigint DEFAULT NULL,
  `active` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `timetable_ibfk_1` (`classId`),
  KEY `timetable_ibfk_2` (`divId`),
  KEY `timetable_ibfk_3` (`subId`),
  KEY `timetable_ibfk_4` (`dayId`)
) ENGINE=InnoDB AUTO_INCREMENT=141 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `timetable`
--

LOCK TABLES `timetable` WRITE;
/*!40000 ALTER TABLE `timetable` DISABLE KEYS */;
INSERT INTO `timetable` VALUES (1,1,1,0,1,'10:00-11:00',NULL,'2018-09-24 00:00:00',NULL,'2023-10-30 13:52:38',NULL,1),(2,1,2,2,1,'10:00-11:00',NULL,'2018-09-24 00:00:00',NULL,'2023-11-23 10:33:05',NULL,1),(3,2,2,2,1,'09:00-10:45',NULL,'2018-09-24 00:00:00',NULL,'2018-09-24 00:00:00',NULL,1),(4,1,1,3,2,'10:00-11:00',NULL,'2018-09-24 00:00:00',NULL,'2023-10-30 13:52:38',NULL,1),(5,1,2,2,2,'10:00-11:00',NULL,'2018-09-24 00:00:00',NULL,'2023-11-23 10:33:05',NULL,1),(6,1,1,3,3,'10:00-11:00',NULL,'2018-09-24 00:00:00',NULL,'2023-10-30 13:52:38',NULL,1),(7,1,2,2,3,'10:00-11:00',NULL,'2018-09-24 00:00:00',NULL,'2023-11-23 10:33:05',NULL,1),(8,1,1,3,4,'10:00-11:00',NULL,'2018-09-24 00:00:00',NULL,'2023-10-30 13:52:38',NULL,1),(9,1,2,2,4,'10:00-11:00',NULL,'2018-09-24 00:00:00',NULL,'2023-11-23 10:33:05',NULL,1),(10,1,1,3,5,'16:00-17:45',NULL,'2018-09-24 00:00:00',NULL,'2023-10-30 13:52:38',NULL,1),(11,1,2,2,5,'10:00-11:00',NULL,'2018-09-24 00:00:00',NULL,'2023-11-23 10:33:05',NULL,1),(87,1,1,2,5,'10:00-10:00',NULL,'2023-10-30 13:52:38',NULL,'2023-10-30 13:52:38',NULL,1),(94,1,2,4,1,'11:00-11:30',NULL,'2023-10-30 13:55:10',NULL,'2023-11-23 10:33:05',NULL,1),(95,1,2,3,2,'11:00-11:30',NULL,'2023-10-30 13:55:10',NULL,'2023-11-23 10:33:05',NULL,1),(96,1,2,5,3,'11:00-11:30',NULL,'2023-10-30 13:55:10',NULL,'2023-11-23 10:33:05',NULL,1),(97,1,2,4,4,'11:00-11:00',NULL,'2023-10-30 13:55:10',NULL,'2023-11-23 10:33:05',NULL,1),(98,1,2,4,5,'11:00-11:30',NULL,'2023-10-30 13:55:10',NULL,'2023-11-23 10:33:05',NULL,1),(128,1,2,1,6,'10:00-10:50',NULL,'2023-10-31 08:37:20',NULL,'2023-11-23 10:33:05',NULL,1),(140,1,2,NULL,2,'11:30-12:00',NULL,'2023-11-23 10:33:05',NULL,'2023-11-23 10:33:05',NULL,1);
/*!40000 ALTER TABLE `timetable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `timetabledetailview`
--

DROP TABLE IF EXISTS `timetabledetailview`;
/*!50001 DROP VIEW IF EXISTS `timetabledetailview`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `timetabledetailview` AS SELECT 
 1 AS `id`,
 1 AS `teacherId`,
 1 AS `classId`,
 1 AS `divId`,
 1 AS `subId`,
 1 AS `dayId`,
 1 AS `timeSlot`,
 1 AS `textData`,
 1 AS `updatedAt`,
 1 AS `className`,
 1 AS `divName`,
 1 AS `subName`,
 1 AS `dayName`,
 1 AS `teacherName`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `todos`
--

DROP TABLE IF EXISTS `todos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `todos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `todos`
--

LOCK TABLES `todos` WRITE;
/*!40000 ALTER TABLE `todos` DISABLE KEYS */;
/*!40000 ALTER TABLE `todos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userroles`
--

DROP TABLE IF EXISTS `userroles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userroles` (
  `userRoleId` int NOT NULL AUTO_INCREMENT,
  `userId` int DEFAULT NULL,
  `roleId` int DEFAULT NULL,
  `createdBy` int DEFAULT NULL,
  `createdAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedBy` int DEFAULT NULL,
  `updatedAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`userRoleId`),
  KEY `userId` (`userId`),
  CONSTRAINT `userroles_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userroles`
--

LOCK TABLES `userroles` WRITE;
/*!40000 ALTER TABLE `userroles` DISABLE KEYS */;
/*!40000 ALTER TABLE `userroles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `first` varchar(255) DEFAULT NULL,
  `last` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `active` tinyint(1) DEFAULT '1',
  `role` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `phone` (`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'suraj','malu','surajmalu@ymail.com','7588646201','$2a$10$GUEiqZfR.1WlZn6SqaKN4.R83psL28FL/qgjxwH3w8iA1dK2Yb7o2','2018-09-06 17:33:17','2018-09-06 17:33:17',1,NULL),(3,'suraj','malu','dheerajmalu@ymail.com','7588646203','d9c59c1aa00818c948423d8d9f141f30','2018-09-06 17:33:17','2018-09-06 17:33:17',1,NULL),(5,NULL,NULL,'dheerajmalu143@gmail.com',NULL,'$2b$10$bHCOCGbpB0A2fds6QUZUoewEqEEVWqH7zryHuDjMqDzNMs.17Qe.e','2023-10-19 10:11:22','2023-10-19 10:11:22',1,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'school'
--

--
-- Dumping routines for database 'school'
--
/*!50003 DROP PROCEDURE IF EXISTS `attendancependinglist` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `attendancependinglist`()
    NO SQL
SELECT *,@rownum := @rownum + 1 as rowNumber FROM (SELECT * FROM classdivisionlistview )AS table2, (select DAYNAME(selectedDate) as day,selectedDate from 
(select adddate('1970-01-01',t4.i*10000 + t3.i*1000 + t2.i*100 + t1.i*10 + t0.i) selectedDate from
 (select 0 i union select 1 union select 2 union select 3 union select 4 union select 5 union select 6 union select 7 union select 8 union select 9) t0,
 (select 0 i union select 1 union select 2 union select 3 union select 4 union select 5 union select 6 union select 7 union select 8 union select 9) t1,
 (select 0 i union select 1 union select 2 union select 3 union select 4 union select 5 union select 6 union select 7 union select 8 union select 9) t2,
 (select 0 i union select 1 union select 2 union select 3 union select 4 union select 5 union select 6 union select 7 union select 8 union select 9) t3,
 (select 0 i union select 1 union select 2 union select 3 union select 4 union select 5 union select 6 union select 7 union select 8 union select 9) t4) v
where selectedDate between (SELECT DATE(sc.schoolStartDate) FROM schoolprofile sc WHERE sc.active=1) and (SELECT DATE(sch.schoolEndDate) FROM schoolprofile sch WHERE sch.active=1) AND DAYNAME(selectedDate) IN (SELECT d.dayName FROM days as d WHERE d.active=1) AND selectedDate NOT IN(SELECT h.holidayDate FROM holidays h WHERE h.active=1)   ORDER BY selectedDate) as table3 cross join (select @rownum := 0) r WHERE table3.selectedDate<=CURDATE() AND
table3.selectedDate NOT IN (SELECT DISTINCT(DATE(attt.attendanceDate)) FROM attendance as attt where 
attt.classId= table2.classId AND attt.divId=table2.divId) ORDER BY table3.selectedDate ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `dashboarddatacount` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `dashboarddatacount`()
    NO SQL
SELECT 
   ( SELECT count(st.id) FROM student st WHERE st.active=1  ) as totalstudent ,
   ( SELECT count(te.id) FROM teacher te WHERE te.active=1 ) as totalteacher,
   (select count(selected_date) from 
(select adddate('1970-01-01',t4.i*10000 + t3.i*1000 + t2.i*100 + t1.i*10 + t0.i) selected_date from
 (select 0 i union select 1 union select 2 union select 3 union select 4 union select 5 union select 6 union select 7 union select 8 union select 9) t0,
 (select 0 i union select 1 union select 2 union select 3 union select 4 union select 5 union select 6 union select 7 union select 8 union select 9) t1,
 (select 0 i union select 1 union select 2 union select 3 union select 4 union select 5 union select 6 union select 7 union select 8 union select 9) t2,
 (select 0 i union select 1 union select 2 union select 3 union select 4 union select 5 union select 6 union select 7 union select 8 union select 9) t3,
 (select 0 i union select 1 union select 2 union select 3 union select 4 union select 5 union select 6 union select 7 union select 8 union select 9) t4) as v
where selected_date between (SELECT DATE(sc.schoolStartDate) FROM schoolprofile sc WHERE sc.active=1) and (SELECT DATE(sch.schoolEndDate) FROM schoolprofile sch WHERE sch.active=1) AND DAYNAME(selected_date) IN (SELECT d.dayName FROM days as d WHERE d.active=1) AND selected_date NOT IN(SELECT h.holidayDate FROM holidays h WHERE h.active=1)) as totalschooldays,
(SELECT count(att.id) FROM attendance att WHERE att.active=1 AND att.attendanceDate=CURDATE() AND att.attendanceResult=0) as todaytotalabsentstudents,
(SELECT count(ho.id) FROM holidays ho WHERE ho.active=1) as totalholidays,
 (SELECT ho.holidayDate FROM holidays ho WHERE ho.active=1 AND ho.holidayDate>CURDATE() ORDER by ho.holidayDate LIMIT 1) as nextholiday ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetAttendanceInDateRange` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAttendanceInDateRange`(
    start_date DATE,
    end_date DATE
)
BEGIN
    SET @sql = NULL;
    SET SESSION group_concat_max_len = 1000000;

    SELECT GROUP_CONCAT(
        DISTINCT
        CONCAT(
            'MAX(CASE WHEN attendanceDate = ''',
            attendanceDate,
            ''' THEN attendanceResult END) AS ',
            attendanceDate
        )
    ) INTO @sql
    FROM attendance
    WHERE attendanceDate BETWEEN start_date AND end_date;

    SET @sql = CONCAT(
        'CREATE TEMPORARY TABLE IF NOT EXISTS temp_attendance AS
        SELECT studentId, ', @sql, '
        FROM attendance
        WHERE attendanceDate BETWEEN "', start_date, '" AND "', end_date, '"
        GROUP BY studentId;'
    );

    PREPARE dynamic_sql FROM @sql;
    EXECUTE dynamic_sql;
    DEALLOCATE PREPARE dynamic_sql;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `schoolworkingdays` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `schoolworkingdays`()
    NO SQL
select DAYNAME(selected_date) as day,selected_date from 
(select adddate('1970-01-01',t4.i*10000 + t3.i*1000 + t2.i*100 + t1.i*10 + t0.i) selected_date from
 (select 0 i union select 1 union select 2 union select 3 union select 4 union select 5 union select 6 union select 7 union select 8 union select 9) t0,
 (select 0 i union select 1 union select 2 union select 3 union select 4 union select 5 union select 6 union select 7 union select 8 union select 9) t1,
 (select 0 i union select 1 union select 2 union select 3 union select 4 union select 5 union select 6 union select 7 union select 8 union select 9) t2,
 (select 0 i union select 1 union select 2 union select 3 union select 4 union select 5 union select 6 union select 7 union select 8 union select 9) t3,
 (select 0 i union select 1 union select 2 union select 3 union select 4 union select 5 union select 6 union select 7 union select 8 union select 9) t4) as v
where selected_date between (SELECT DATE(sc.schoolStartDate) FROM schoolprofile sc WHERE sc.active=1) and (SELECT DATE(sch.schoolEndDate) FROM schoolprofile sch WHERE sch.active=1) AND DAYNAME(selected_date) IN (SELECT d.dayName FROM days as d WHERE d.active=1) AND selected_date NOT IN(SELECT h.holidayDate FROM holidays h WHERE h.active=1)  ORDER BY selected_date ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `teacherattendancependinglist` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `teacherattendancependinglist`(IN `teacherID` INT(20))
SELECT *,(@rownum := @rownum + 1) as rowNumber FROM (SELECT * FROM classdivisionlistview )AS table2, (select DAYNAME(selectedDate) as day,selectedDate from 
(select adddate('1970-01-01',t4.i*10000 + t3.i*1000 + t2.i*100 + t1.i*10 + t0.i) selectedDate from
 (select 0 i union select 1 union select 2 union select 3 union select 4 union select 5 union select 6 union select 7 union select 8 union select 9) t0,
 (select 0 i union select 1 union select 2 union select 3 union select 4 union select 5 union select 6 union select 7 union select 8 union select 9) t1,
 (select 0 i union select 1 union select 2 union select 3 union select 4 union select 5 union select 6 union select 7 union select 8 union select 9) t2,
 (select 0 i union select 1 union select 2 union select 3 union select 4 union select 5 union select 6 union select 7 union select 8 union select 9) t3,
 (select 0 i union select 1 union select 2 union select 3 union select 4 union select 5 union select 6 union select 7 union select 8 union select 9) t4) v
where selectedDate between (SELECT DATE(sc.schoolStartDate) FROM schoolprofile sc WHERE sc.active=1) and (SELECT DATE(sch.schoolEndDate) FROM schoolprofile sch WHERE sch.active=1) AND DAYNAME(selectedDate) IN (SELECT d.dayName FROM days as d WHERE d.active=1) AND selectedDate NOT IN(SELECT h.holidayDate FROM holidays h WHERE h.active=1)   ORDER BY selectedDate) as table3 cross join (select @rownum := 0) r WHERE table3.selectedDate<=CURDATE() AND
table3.selectedDate NOT IN (SELECT DISTINCT(DATE(attt.attendanceDate)) FROM attendance as attt where 
attt.classId= table2.classId AND attt.divId=table2.divId) AND table2.teacherId=teacherID ORDER BY table3.selectedDate,rowNumber ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `testranklist` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `testranklist`(IN `testID` BIGINT, IN `studentID` BIGINT, IN `classID` INT, IN `divID` INT)
    NO SQL
BEGIN
set @query='SELECT STA.studentId, STA.testId, STA.classId, STA.divId, STA.totalSubject, STA.profileImage, STA.studentName, STA.testName, STA.className, STA.subjectIds, STA.divName, STA.totalAvg,STA.class_rank,STB.batch_rank FROM (SELECT studentId, testId, classId, divId, totalSubject, profileImage, studentName, testName, className, subjectIds, divName, totalAvg,@rank := IF(@prev_testId = testId AND @prev_divId = divId AND @prev_classId = classId, @rank + 1,1) AS class_rank,@prev_testId := testId ,@prev_divId := divId , @prev_classId := classId FROM studenttestresultview,(SELECT @rank := 1, @prev_testId := NULL,@prev_divId := NULL, @prev_classId := NULL) AS X)AS STA ,(SELECT st1.studentId, st1.testId, st1.classId, st1.divId,@brank := IF(@bprev_testId = st1.testId  AND @bprev_classId = st1.classId, @brank + 1,1) AS batch_rank,@bprev_testId := st1.testId , @bprev_classId := st1.classId FROM studenttestresultview as st1,(SELECT @brank := 1, @bprev_testId := NULL,@bprev_classId := NULL) AS Y  ORDER BY  st1.testId,st1.classId,st1.totalAvg DESC) AS STB WHERE STA.testId=STB.testId AND STA.classId=STB.classId AND STA.studentId=STB.studentId AND STA.divId=STB.divId';

IF testID IS NOT NULL AND testID!='' THEN
SET @query=CONCAT(@query,' AND STA.testId=',testID);
 END IF;
 IF studentID IS NOT NULL AND studentID!='' THEN
SET @query=CONCAT(@query,' AND STA.studentId=',studentID);
 END IF;
 IF classID IS NOT NULL AND classID!='' THEN
SET @query=CONCAT(@query,' AND STA.classId=',classID);
 END IF;
  IF divID IS NOT NULL AND divID!='' THEN
SET @query=CONCAT(@query,' AND STA.divId=',divID);
 END IF;
 
PREPARE stmt FROM @query;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `testsubjectmarkspendinglist` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `testsubjectmarkspendinglist`()
    NO SQL
SELECT table1.*,ts.teacherId,CONCAT(t.firstName,' ',t.lastName) AS teacherName  from(select `te`.`id` AS `testId`,`cl`.`id` AS `classId`,`di`.`id` AS `divisionId`,`sub`.`id` AS `subjectId`,`te`.`testName` AS `testName`,`cl`.`className` AS `className`,`di`.`divName` AS `divName`,`sub`.`subName` AS `subName` from (((`school`.`class` `cl` join `school`.`subject` `sub`) join `school`.`test` `te`) join `school`.`division` `di`) where (find_in_set(`sub`.`id`,`cl`.`subjectIds`) and find_in_set(`te`.`id`,`cl`.`testIds`) and (`cl`.`active` = 1) and (`sub`.`active` = 1) and (`te`.`active` = 1) and (`di`.`active` = 1) and (not(exists(select 1 from `school`.`testmarks` `tm` where ((`tm`.`testId` = `te`.`id`) and (`tm`.`classId` = `cl`.`id`) and (`tm`.`divId` = `di`.`id`) and (`tm`.`subId` = `sub`.`id`)))))) order by `te`.`id`,`cl`.`id`,`di`.`id`,`sub`.`id`)as table1,teachersubject as ts ,teacher as t WHERE table1.classId=ts.classId AND table1.divisionId=ts.divId AND table1.subjectId=ts.subId AND ts.teacherId=t.id ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `testwiseclasslist` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `testwiseclasslist`()
    NO SQL
SELECT * FROM (SELECT cl.className,di.divName,t.testName,tm.`classId`, tm.`divId`, tm.`testId`, COUNT(DISTINCT(tm.`subId`)) testSubTotal,(LENGTH(cl.`subjectIds`)-LENGTH(REPLACE(cl.`subjectIds`,',',''))+1) as totalSub FROM `testmarks` tm INNER JOIN division di ON di.id=tm.`divId` INNER JOIN class cl ON cl.id=tm.`classId` INNER JOIN test t ON t.id=tm.`testId`  GROUP BY tm.`testId`,tm.`classId`,tm.`divId` ORDER BY tm.`testId`,tm.`classId`,tm.`divId`) as ft WHERE ft.testSubTotal=ft.totalSub ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `todayattendancependinglist` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `todayattendancependinglist`()
    NO SQL
SELECT *,@rownum := @rownum + 1 as rowNumber FROM (SELECT * FROM classdivisionlistview )AS table2, (select DAYNAME(selectedDate) as day,selectedDate from 
(select adddate('1970-01-01',t4.i*10000 + t3.i*1000 + t2.i*100 + t1.i*10 + t0.i) selectedDate from
 (select 0 i union select 1 union select 2 union select 3 union select 4 union select 5 union select 6 union select 7 union select 8 union select 9) t0,
 (select 0 i union select 1 union select 2 union select 3 union select 4 union select 5 union select 6 union select 7 union select 8 union select 9) t1,
 (select 0 i union select 1 union select 2 union select 3 union select 4 union select 5 union select 6 union select 7 union select 8 union select 9) t2,
 (select 0 i union select 1 union select 2 union select 3 union select 4 union select 5 union select 6 union select 7 union select 8 union select 9) t3,
 (select 0 i union select 1 union select 2 union select 3 union select 4 union select 5 union select 6 union select 7 union select 8 union select 9) t4) v
where selectedDate between (SELECT DATE(sc.schoolStartDate) FROM schoolprofile sc WHERE sc.active=1) and (SELECT DATE(sch.schoolEndDate) FROM schoolprofile sch WHERE sch.active=1) AND DAYNAME(selectedDate) IN (SELECT d.dayName FROM days as d WHERE d.active=1) AND selectedDate NOT IN(SELECT h.holidayDate FROM holidays h WHERE h.active=1)   ORDER BY selectedDate) as table3 cross join (select @rownum := 0) r WHERE table3.selectedDate=CURDATE() AND
table3.selectedDate NOT IN (SELECT DISTINCT(DATE(attt.attendanceDate)) FROM attendance as attt where 
attt.classId= table2.classId AND attt.divId=table2.divId) ORDER BY table3.selectedDate ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `absentstudentlistview`
--

/*!50001 DROP VIEW IF EXISTS `absentstudentlistview`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `absentstudentlistview` AS select `ab`.`id` AS `id`,`ab`.`studentId` AS `studentId`,`st`.`rollNo` AS `rollNo`,concat(`st`.`firstName`,' ',`st`.`lastName`) AS `studentName`,concat(`st`.`fatherName`,' ',`st`.`lastName`) AS `fatherName`,`st`.`parentNumber` AS `mobNumber`,`ab`.`classId` AS `classId`,`cl`.`className` AS `className`,`ab`.`divId` AS `divId`,`di`.`divName` AS `divName`,`ab`.`classTeacherId` AS `classTeacherId`,concat(`te`.`firstName`,' ',`st`.`lastName`) AS `teacherName`,`ab`.`attendanceDate` AS `attendanceDate`,`ab`.`attendanceResult` AS `attendanceResult` from ((((`attendance` `ab` left join `student` `st` on((`st`.`id` = `ab`.`studentId`))) left join `class` `cl` on((`cl`.`id` = `ab`.`classId`))) left join `division` `di` on((`di`.`id` = `ab`.`divId`))) left join `teacher` `te` on((`te`.`id` = `ab`.`classTeacherId`))) where ((`ab`.`active` = 1) and (`cl`.`active` = 1) and (`di`.`active` = 1) and (`st`.`active` = 1) and (`te`.`active` = 1) and (`ab`.`attendanceResult` = 0)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `addattendancestudentlistview`
--

/*!50001 DROP VIEW IF EXISTS `addattendancestudentlistview`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `addattendancestudentlistview` AS select `st`.`id` AS `studentId`,concat(`st`.`firstName`,' ',`st`.`lastName`) AS `studentName`,`st`.`classId` AS `classId`,`st`.`divId` AS `divId`,`di`.`divName` AS `divName`,`cl`.`className` AS `className`,`st`.`rollNo` AS `rollNo`,(select `ct`.`teacherId` from `classteacher` `ct` where ((`ct`.`divId` = `st`.`divId`) and (`ct`.`classId` = `st`.`classId`) and (`ct`.`active` = 1))) AS `classTeacherId` from ((`student` `st` join `division` `di` on((`di`.`id` = `st`.`divId`))) join `class` `cl` on((`cl`.`id` = `st`.`classId`))) where (`st`.`active` = 1) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `all_classteacherlistview`
--

/*!50001 DROP VIEW IF EXISTS `all_classteacherlistview`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `all_classteacherlistview` AS select `ct`.`id` AS `id`,`c`.`id` AS `classId`,`c`.`className` AS `className`,`d`.`id` AS `divId`,`d`.`divName` AS `divName`,`ct`.`teacherId` AS `teacherId`,concat(`t`.`firstName`,' ',`t`.`lastName`) AS `teacherName` from (((`class` `c` join `division` `d`) left join `classteacher` `ct` on(((`c`.`id` = `ct`.`classId`) and (`d`.`id` = `ct`.`divId`)))) left join `teacher` `t` on((`ct`.`teacherId` = `t`.`id`))) where (find_in_set(`d`.`id`,`c`.`divIds`) > 0) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `all_teacherclassdivisionsubject`
--

/*!50001 DROP VIEW IF EXISTS `all_teacherclassdivisionsubject`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `all_teacherclassdivisionsubject` AS select `c`.`id` AS `classId`,`c`.`className` AS `className`,`d`.`id` AS `divId`,`d`.`divName` AS `divName`,`s`.`id` AS `subId`,`s`.`subName` AS `subName`,`ts`.`teacherId` AS `teacherId`,concat(`t`.`firstName`,' ',`t`.`lastName`) AS `teacherName` from ((((`class` `c` join `division` `d`) join `subject` `s`) left join `teachersubject` `ts` on(((`c`.`id` = `ts`.`classId`) and (`d`.`id` = `ts`.`divId`) and (`s`.`id` = `ts`.`subId`)))) left join `teacher` `t` on((`ts`.`teacherId` = `t`.`id`))) where ((find_in_set(`d`.`id`,`c`.`divIds`) > 0) and ((find_in_set(`s`.`id`,`c`.`subjectIds`) > 0) or ((`c`.`optionalSubjectIds` is not null) and (find_in_set(`s`.`id`,`c`.`optionalSubjectIds`) > 0)))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `attendancelistview`
--

/*!50001 DROP VIEW IF EXISTS `attendancelistview`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `attendancelistview` AS select `at`.`classId` AS `classId`,`at`.`divId` AS `divId`,`cl`.`className` AS `className`,`di`.`divName` AS `divName`,concat(`t`.`firstName`,' ',`t`.`lastName`) AS `teacherName`,`at`.`classTeacherId` AS `teacherId`,`at`.`attendanceDate` AS `selectedDate`,count((case when (`at`.`attendanceResult` = 1) then 1 end)) AS `totalPresent`,count(`at`.`id`) AS `total` from (((`attendance` `at` join `class` `cl` on((`cl`.`id` = `at`.`classId`))) join `division` `di` on((`di`.`id` = `at`.`divId`))) join `teacher` `t` on((`t`.`id` = `at`.`classTeacherId`))) group by `at`.`classId`,`at`.`divId`,`at`.`classTeacherId`,`at`.`attendanceDate` order by `at`.`attendanceDate` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `attendancemonthlist`
--

/*!50001 DROP VIEW IF EXISTS `attendancemonthlist`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `attendancemonthlist` AS select `cl`.`className` AS `className`,`di`.`divName` AS `divName`,`att`.`classId` AS `classId`,`att`.`divId` AS `divId`,date_format(`att`.`attendanceDate`,'%M-%Y') AS `AttendanceMonth` from ((`attendance` `att` join `class` `cl` on((`cl`.`id` = `att`.`classId`))) join `division` `di` on((`di`.`id` = `att`.`divId`))) group by date_format(`att`.`attendanceDate`,'%M-%Y'),`att`.`classId`,`att`.`divId` order by date_format(`att`.`attendanceDate`,'%M-%Y'),`att`.`classId`,`att`.`divId` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `borrowed_books_view`
--

/*!50001 DROP VIEW IF EXISTS `borrowed_books_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `borrowed_books_view` AS select `bb`.`borrowId` AS `borrowId`,`bb`.`bookId` AS `bookId`,`bb`.`studentId` AS `studentId`,`bb`.`borrowDate` AS `borrowDate`,`bb`.`returnDate` AS `returnDate`,`bb`.`createdBy` AS `bbCreatedBy`,`bb`.`createdAt` AS `bbCreatedAt`,`bb`.`updatedBy` AS `bbUpdatedBy`,`bb`.`updatedAt` AS `bbUpdatedAt`,`bb`.`active` AS `active`,`b`.`title` AS `bookName`,concat(`s`.`firstName`,' ',`s`.`lastName`) AS `studentName`,`s`.`active` AS `studentActive` from ((`borrowedbooks` `bb` join `books` `b` on((`bb`.`bookId` = `b`.`bookId`))) join `student` `s` on((`bb`.`studentId` = `s`.`id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `classdetailsview`
--

/*!50001 DROP VIEW IF EXISTS `classdetailsview`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `classdetailsview` AS select `main`.`id` AS `id`,`main`.`className` AS `className`,`main`.`divIds` AS `divIds`,`main`.`subjectIds` AS `subjectIds`,`main`.`optionalSubjectIds` AS `optionalSubjectIds`,`main`.`testIds` AS `testIds`,group_concat(distinct `d`.`divName` order by `d`.`id` ASC separator ',') AS `divisionNames`,group_concat(distinct `s`.`subName` order by `s`.`id` ASC separator ',') AS `subjectNames`,group_concat(distinct `s1`.`subName` order by `s1`.`id` ASC separator ',') AS `optionalSubjectNames`,group_concat(distinct `t`.`testName` order by `t`.`id` ASC separator ',') AS `testNames`,`main`.`totalSeats` AS `totalSeats`,count(distinct `a`.`id`) AS `admissionCount`,count(distinct (case when (`a`.`isallocated` = 1) then `a`.`id` end)) AS `allocatedCount`,(`main`.`totalSeats` - count(distinct `a`.`id`)) AS `availableSeats`,`main`.`createdAt` AS `createdAt`,`main`.`active` AS `active` from (((((`class` `main` left join `division` `d` on((find_in_set(`d`.`id`,`main`.`divIds`) > 0))) left join `subject` `s` on((find_in_set(`s`.`id`,`main`.`subjectIds`) > 0))) left join `subject` `s1` on((find_in_set(`s1`.`id`,`main`.`optionalSubjectIds`) > 0))) left join `test` `t` on((find_in_set(`t`.`id`,`main`.`testIds`) > 0))) left join `admission` `a` on((`main`.`id` = `a`.`classId`))) group by `main`.`id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `classdivisionlistview`
--

/*!50001 DROP VIEW IF EXISTS `classdivisionlistview`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `classdivisionlistview` AS select `ct`.`id` AS `id`,`ct`.`classId` AS `classId`,`ct`.`divId` AS `divId`,`cl`.`className` AS `className`,`di`.`divName` AS `divName`,concat(`t`.`firstName`,' ',`t`.`lastName`) AS `teacherName`,`ct`.`teacherId` AS `teacherId` from (((`classteacher` `ct` join `class` `cl` on((`cl`.`id` = `ct`.`classId`))) join `division` `di` on((`di`.`id` = `ct`.`divId`))) join `teacher` `t` on((`t`.`id` = `ct`.`teacherId`))) where (`ct`.`active` = 1) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `classmonthlyattendanceview`
--

/*!50001 DROP VIEW IF EXISTS `classmonthlyattendanceview`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `classmonthlyattendanceview` AS select `ct`.`teacherId` AS `teacherId`,`ct`.`classId` AS `classId`,`ct`.`divId` AS `divId`,`atv`.`attendanceMonth` AS `attendanceMonth`,round((sum(`atv`.`monthAvg`) / count(`atv`.`monthAvg`)),2) AS `monthAvg` from (`studentmonthlyattendanceview` `atv` join `classteacher` `ct` on(((`atv`.`classId` = `ct`.`classId`) and (`atv`.`divId` = `ct`.`divId`)))) group by `atv`.`attendanceMonth`,`ct`.`teacherId`,`ct`.`classId`,`ct`.`divId` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `classtestresultview`
--

/*!50001 DROP VIEW IF EXISTS `classtestresultview`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `classtestresultview` AS select `ct`.`teacherId` AS `teacherId`,`ct`.`classId` AS `classId`,`ct`.`divId` AS `divId`,`strv`.`testName` AS `testName`,round((sum(`strv`.`totalAvg`) / count(`strv`.`totalAvg`)),2) AS `totalAvg` from (`studenttestresultview` `strv` join `classteacher` `ct` on(((`strv`.`classId` = `ct`.`classId`) and (`strv`.`divId` = `ct`.`divId`)))) group by `strv`.`testId`,`ct`.`teacherId`,`ct`.`classId`,`ct`.`divId`,`strv`.`testName` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `finalresultclassdivisionlist`
--

/*!50001 DROP VIEW IF EXISTS `finalresultclassdivisionlist`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `finalresultclassdivisionlist` AS select `ft`.`className` AS `className`,`ft`.`divName` AS `divName`,`ft`.`classId` AS `classId`,`ft`.`divId` AS `divId`,`ft`.`testTotal` AS `testTotal`,`ft`.`totaltest` AS `totaltest`,`ft`.`testSubTotal` AS `testSubTotal`,`ft`.`totalSub` AS `totalSub` from (select `cl`.`className` AS `className`,`di`.`divName` AS `divName`,`tm`.`classId` AS `classId`,`tm`.`divId` AS `divId`,count(distinct `tm`.`testId`) AS `testTotal`,((length(`cl`.`testIds`) - length(replace(`cl`.`testIds`,',',''))) + 1) AS `totaltest`,count(distinct `tm`.`subId`) AS `testSubTotal`,((length(`cl`.`subjectIds`) - length(replace(`cl`.`subjectIds`,',',''))) + 1) AS `totalSub` from (((`testmarks` `tm` join `division` `di` on((`di`.`id` = `tm`.`divId`))) join `class` `cl` on((`cl`.`id` = `tm`.`classId`))) join `test` `t` on((`t`.`id` = `tm`.`testId`))) group by `tm`.`classId`,`tm`.`divId` order by `tm`.`classId`,`tm`.`divId`) `ft` where ((`ft`.`testTotal` >= `ft`.`totaltest`) and (`ft`.`testSubTotal` >= `ft`.`totalSub`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `studentlistview`
--

/*!50001 DROP VIEW IF EXISTS `studentlistview`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `studentlistview` AS select `st`.`id` AS `id`,concat(`st`.`firstName`,' ',`st`.`lastName`) AS `studentName`,`st`.`classId` AS `classId`,`cl`.`className` AS `className`,`st`.`divId` AS `divId`,`di`.`divName` AS `divName`,`st`.`rollNo` AS `rollNo` from ((`student` `st` join `class` `cl` on((`cl`.`id` = `st`.`classId`))) join `division` `di` on((`di`.`id` = `st`.`divId`))) where (`st`.`active` <> 0) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `studentmonthlyattendanceview`
--

/*!50001 DROP VIEW IF EXISTS `studentmonthlyattendanceview`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `studentmonthlyattendanceview` AS select `att`.`studentId` AS `studentId`,concat(`st`.`firstName`,' ',`st`.`lastName`) AS `studentName`,`st`.`classId` AS `classId`,`st`.`divId` AS `divId`,date_format(`att`.`attendanceDate`,'%b') AS `attendanceMonth`,round(((sum((case when (`att`.`attendanceResult` <> 0) then 1 else 0 end)) / count(`att`.`id`)) * 100),2) AS `monthAvg`,sum((case when (`att`.`attendanceResult` <> 0) then 1 else 0 end)) AS `presentdays`,count(`att`.`id`) AS `totaldays` from (`attendance` `att` join `student` `st` on((`st`.`id` = `att`.`studentId`))) group by date_format(`att`.`attendanceDate`,'%b'),`att`.`studentId`,`st`.`firstName`,`st`.`lastName`,`st`.`classId`,`st`.`divId`,`att`.`attendanceDate` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `studenttestresultview`
--

/*!50001 DROP VIEW IF EXISTS `studenttestresultview`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `studenttestresultview` AS select `tm`.`studentId` AS `studentId`,`tm`.`testId` AS `testId`,`tm`.`classId` AS `classId`,`tm`.`divId` AS `divId`,count(`tm`.`subId`) AS `totalSubject`,`st`.`profileImage` AS `profileImage`,concat(`st`.`firstName`,' ',`st`.`lastName`) AS `studentName`,`t`.`testName` AS `testName`,`cl`.`className` AS `className`,`cl`.`subjectIds` AS `subjectIds`,`di`.`divName` AS `divName`,round(((sum(`tm`.`getMarks`) / sum(`tm`.`totalMarks`)) * 100),2) AS `totalAvg` from ((((`testmarks` `tm` join `student` `st` on((`st`.`id` = `tm`.`studentId`))) join `class` `cl` on((`cl`.`id` = `tm`.`classId`))) join `division` `di` on((`di`.`id` = `tm`.`divId`))) join `test` `t` on((`t`.`id` = `tm`.`testId`))) group by `tm`.`studentId`,`tm`.`testId`,`tm`.`classId`,`tm`.`divId` having (count(`tm`.`subId`) >= ((length(`cl`.`subjectIds`) - length(replace(`cl`.`subjectIds`,',',''))) + 1)) order by `tm`.`testId`,`tm`.`classId`,`tm`.`divId`,round(((sum(`tm`.`getMarks`) / sum(`tm`.`totalMarks`)) * 100),2) desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `subjectteacherview`
--

/*!50001 DROP VIEW IF EXISTS `subjectteacherview`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `subjectteacherview` AS select `ts`.`id` AS `id`,`ts`.`teacherId` AS `teacherId`,`ts`.`subId` AS `subId`,`ts`.`classId` AS `classId`,`ts`.`divId` AS `divId`,`s`.`subName` AS `subName`,`c`.`className` AS `className`,`d`.`divName` AS `divName`,concat(`t`.`firstName`,' ',`t`.`lastName`) AS `teacherName`,`t`.`mobileNumber` AS `mobileNumber` from ((((`teachersubject` `ts` join `subject` `s` on((`s`.`id` = `ts`.`subId`))) join `class` `c` on((`c`.`id` = `ts`.`classId`))) join `division` `d` on((`d`.`id` = `ts`.`divId`))) join `teacher` `t` on((`t`.`id` = `ts`.`teacherId`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `teachersubjectrecordview`
--

/*!50001 DROP VIEW IF EXISTS `teachersubjectrecordview`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `teachersubjectrecordview` AS select `tmv`.`classId` AS `classId`,`tmv`.`divId` AS `divId`,`tmv`.`subId` AS `subId`,`tmv`.`testId` AS `testId`,`tmv`.`teacherId` AS `teacherId`,`tmv`.`testName` AS `testName`,`tmv`.`className` AS `className`,`tmv`.`divName` AS `divName`,`tmv`.`subName` AS `subName`,`tmv`.`teacherName` AS `teacherName`,((sum(`tmv`.`getMarks`) / sum(`tmv`.`totalMarks`)) * 100) AS `avgRecord` from `testmarksview` `tmv` where (`tmv`.`getMarks` <> '') group by `tmv`.`classId`,`tmv`.`divId`,`tmv`.`subId`,`tmv`.`testId`,`tmv`.`teacherId` order by `tmv`.`classId`,`tmv`.`divId`,`tmv`.`subId`,`tmv`.`testId` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `testmarkslistview`
--

/*!50001 DROP VIEW IF EXISTS `testmarkslistview`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `testmarkslistview` AS select `testmarksview`.`teacherId` AS `teacherId`,`testmarksview`.`testId` AS `testId`,`testmarksview`.`subId` AS `subId`,`testmarksview`.`classId` AS `classId`,`testmarksview`.`divId` AS `divId`,`testmarksview`.`totalMarks` AS `totalMarks`,`testmarksview`.`testName` AS `testName`,`testmarksview`.`className` AS `className`,`testmarksview`.`divName` AS `divName`,`testmarksview`.`subName` AS `subName`,`testmarksview`.`teacherName` AS `teacherName`,avg(`testmarksview`.`getMarks`) AS `average` from `testmarksview` group by `testmarksview`.`teacherId`,`testmarksview`.`testId`,`testmarksview`.`subId`,`testmarksview`.`classId`,`testmarksview`.`divId`,`testmarksview`.`totalMarks`,`testmarksview`.`testName`,`testmarksview`.`className`,`testmarksview`.`divName`,`testmarksview`.`subName`,`testmarksview`.`teacherName` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `testmarkspendinglistview`
--

/*!50001 DROP VIEW IF EXISTS `testmarkspendinglistview`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `testmarkspendinglistview` AS select `te`.`id` AS `testId`,`cl`.`id` AS `classId`,`di`.`id` AS `divisionId`,`sub`.`id` AS `subjectId`,`te`.`testName` AS `testName`,`cl`.`className` AS `className`,`di`.`divName` AS `divName`,`sub`.`subName` AS `subName` from (((`class` `cl` join `subject` `sub`) join `test` `te`) join `division` `di`) where ((0 <> find_in_set(`sub`.`id`,`cl`.`subjectIds`)) and (0 <> find_in_set(`te`.`id`,`cl`.`testIds`)) and (`cl`.`active` = 1) and (`sub`.`active` = 1) and (`te`.`active` = 1) and (`di`.`active` = 1) and exists(select 1 from `testmarks` `tm` where ((`tm`.`testId` = `te`.`id`) and (`tm`.`classId` = `cl`.`id`) and (`tm`.`divId` = `di`.`id`) and (`tm`.`subId` = `sub`.`id`))) is false) order by `te`.`id`,`cl`.`id`,`di`.`id`,`sub`.`id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `testmarkspendingteacherlistview`
--

/*!50001 DROP VIEW IF EXISTS `testmarkspendingteacherlistview`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `testmarkspendingteacherlistview` AS select `tm`.`testId` AS `testId`,`tm`.`classId` AS `classId`,`tm`.`divisionId` AS `divisionId`,`tm`.`subjectId` AS `subjectId`,`tm`.`testName` AS `testName`,`tm`.`className` AS `className`,`tm`.`divName` AS `divName`,`tm`.`subName` AS `subName`,`ts`.`teacherId` AS `teacherId`,concat(`t`.`firstName`,' ',`t`.`lastName`) AS `teacherName` from ((`testmarkspendinglistview` `tm` join `teachersubject` `ts`) join `teacher` `t`) where ((`tm`.`classId` = `ts`.`classId`) and (`tm`.`divisionId` = `ts`.`divId`) and (`tm`.`subjectId` = `ts`.`subId`) and (`ts`.`teacherId` = `t`.`id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `testmarksview`
--

/*!50001 DROP VIEW IF EXISTS `testmarksview`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `testmarksview` AS select `tm`.`id` AS `id`,`tm`.`studentId` AS `studentId`,`tm`.`teacherId` AS `teacherId`,`tm`.`testId` AS `testId`,`tm`.`subId` AS `subId`,`tm`.`classId` AS `classId`,`tm`.`divId` AS `divId`,`tm`.`getMarks` AS `getMarks`,`tm`.`totalMarks` AS `totalMarks`,`t`.`testName` AS `testName`,`cl`.`className` AS `className`,`di`.`divName` AS `divName`,`s`.`subName` AS `subName`,concat(`te`.`firstName`,' ',`te`.`lastName`) AS `teacherName`,concat(`st`.`firstName`,' ',`st`.`middleName`,' ',`st`.`lastName`) AS `studentName`,`st`.`rollNo` AS `rollNo`,`tm`.`createdAt` AS `createdAt`,`tm`.`updatedAt` AS `updatedAt` from ((((((`testmarks` `tm` join `test` `t` on((`t`.`id` = `tm`.`testId`))) join `subject` `s` on((`s`.`id` = `tm`.`subId`))) join `teacher` `te` on((`te`.`id` = `tm`.`teacherId`))) join `student` `st` on((`st`.`id` = `tm`.`studentId`))) join `class` `cl` on((`cl`.`id` = `tm`.`classId`))) join `division` `di` on((`di`.`id` = `tm`.`divId`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `testsubjectclassdivisionlistview`
--

/*!50001 DROP VIEW IF EXISTS `testsubjectclassdivisionlistview`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `testsubjectclassdivisionlistview` AS select `te`.`id` AS `testId`,`cl`.`id` AS `classId`,`di`.`id` AS `divisionId`,`sub`.`id` AS `subjectId`,`te`.`testName` AS `testName`,`cl`.`className` AS `className`,`di`.`divName` AS `divName`,`sub`.`subName` AS `subName` from (((`class` `cl` join `subject` `sub`) join `test` `te`) join `division` `di`) where ((0 <> find_in_set(`sub`.`id`,`cl`.`subjectIds`)) and (0 <> find_in_set(`te`.`id`,`cl`.`testIds`)) and (`cl`.`active` = 1) and (`sub`.`active` = 1) and (`te`.`active` = 1) and (`di`.`active` <> 0)) order by `te`.`id`,`cl`.`id`,`di`.`id`,`sub`.`id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `timetabledetailview`
--

/*!50001 DROP VIEW IF EXISTS `timetabledetailview`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `timetabledetailview` AS select `tt`.`id` AS `id`,`ts`.`teacherId` AS `teacherId`,`tt`.`classId` AS `classId`,`tt`.`divId` AS `divId`,`tt`.`subId` AS `subId`,`tt`.`dayId` AS `dayId`,`tt`.`timeSlot` AS `timeSlot`,`tt`.`textData` AS `textData`,`tt`.`updatedAt` AS `updatedAt`,`cl`.`className` AS `className`,`di`.`divName` AS `divName`,`su`.`subName` AS `subName`,`da`.`dayName` AS `dayName`,concat(`t`.`firstName`,' ',`t`.`lastName`) AS `teacherName` from ((((((`timetable` `tt` join `class` `cl` on((`cl`.`id` = `tt`.`classId`))) join `division` `di` on((`di`.`id` = `tt`.`divId`))) left join `subject` `su` on((`su`.`id` = `tt`.`subId`))) join `days` `da` on((`da`.`id` = `tt`.`dayId`))) left join `teachersubject` `ts` on(((`ts`.`subId` = `tt`.`subId`) and (`ts`.`classId` = `tt`.`classId`) and (`ts`.`divId` = `tt`.`divId`)))) left join `teacher` `t` on((`t`.`id` = `ts`.`teacherId`))) */;
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

-- Dump completed on 2023-12-16 12:31:51
