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
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attendance`
--

LOCK TABLES `attendance` WRITE;
/*!40000 ALTER TABLE `attendance` DISABLE KEYS */;
INSERT INTO `attendance` VALUES (1,1,1,1,1,'2019-04-23',0,'2018-10-07 09:57:56',NULL,'2018-10-07 09:57:56',NULL,1),(2,1,1,1,1,'2018-10-02',1,'2018-10-07 09:57:56',NULL,'2018-10-07 09:57:56',NULL,1),(3,1,1,1,1,'2018-09-26',1,'2018-10-07 09:58:40',NULL,'2018-10-07 09:58:40',NULL,1),(4,1,1,1,1,'2018-09-27',1,'2018-10-07 09:58:40',NULL,'2018-10-07 09:58:40',NULL,1),(6,1,1,1,1,'2018-09-24',1,'2018-10-07 09:58:40',NULL,'2018-10-07 09:58:40',NULL,1),(7,1,1,1,1,'2018-10-08',0,'2018-10-07 09:58:40',NULL,'2018-10-07 09:58:40',NULL,1),(8,1,1,1,1,'2018-10-03',1,'2018-10-07 09:57:56',NULL,'2018-10-07 09:57:56',NULL,1),(9,1,1,1,1,'2018-09-25',1,'2018-10-07 09:58:40',NULL,'2018-10-07 09:58:40',NULL,1),(11,2,1,1,2,'2018-09-25',1,'2018-10-07 09:58:40',NULL,'2018-10-07 09:58:40',NULL,1),(12,2,1,1,1,'2018-09-25',1,'2018-10-07 09:58:40',NULL,'2018-10-07 09:58:40',NULL,1),(13,1,2,1,2,'2018-10-08',0,'2018-10-07 09:58:40',NULL,'2018-10-07 09:58:40',NULL,1),(14,1,1,1,2,'2019-03-06',0,'2018-10-07 09:58:40',NULL,'2018-10-07 09:58:40',NULL,1),(15,1,2,1,2,'2018-07-25',0,'2018-10-07 09:58:40',NULL,'2018-10-07 09:58:40',NULL,1),(16,1,2,2,2,'2018-07-25',0,'2018-10-07 09:58:40',NULL,'2018-10-07 09:58:40',NULL,1),(21,1,1,1,1,'2019-03-07',1,'2019-03-24 09:08:13',NULL,'2019-03-24 09:08:13',NULL,1),(26,2,1,1,1,'2019-03-07',1,'2019-03-24 09:10:13',NULL,'2019-03-24 09:10:13',NULL,1),(27,1,1,1,1,'2019-03-08',1,'2019-03-24 09:12:37',NULL,'2019-04-18 18:03:30',NULL,1),(28,2,1,1,1,'2019-03-08',0,'2019-03-24 09:12:37',NULL,'2019-04-18 18:03:30',NULL,1),(51,1,1,1,1,'2019-04-10',1,'2019-04-11 17:49:37',NULL,'2019-04-20 04:16:25',NULL,1),(52,2,1,1,1,'2019-04-10',0,'2019-04-11 17:49:37',NULL,'2019-04-20 04:16:25',NULL,1),(53,1,1,1,1,'2018-07-17',1,'2019-04-20 04:33:44',NULL,'2019-04-20 04:33:44',NULL,1),(54,2,1,1,1,'2018-07-17',1,'2019-04-20 04:33:44',NULL,'2019-04-20 04:33:44',NULL,1),(55,7,1,2,2,'2018-07-17',1,'2019-04-20 04:35:05',NULL,'2019-04-20 04:35:05',NULL,1),(56,8,2,1,3,'2018-07-17',1,'2019-04-20 04:38:33',NULL,'2019-04-20 04:38:33',NULL,1),(57,10,2,1,3,'2018-07-17',1,'2019-04-20 04:38:33',NULL,'2019-04-20 04:38:33',NULL,1),(58,1,1,1,1,'2023-10-22',1,'2023-10-22 03:35:09',NULL,'2023-10-22 03:35:09',NULL,1),(59,2,1,1,1,'2023-10-22',1,'2023-10-22 03:35:09',NULL,'2023-10-22 03:35:09',NULL,1),(60,1,1,1,1,'2023-10-21',1,'2023-10-22 03:38:01',NULL,'2023-10-22 03:38:01',NULL,1),(61,2,1,1,1,'2023-10-21',1,'2023-10-22 03:38:01',NULL,'2023-10-22 03:38:01',NULL,1),(62,1,1,1,1,'2023-10-23',0,'2023-10-23 07:19:31',NULL,'2023-10-23 07:19:31',NULL,1),(63,2,1,1,1,'2023-10-23',1,'2023-10-23 07:19:31',NULL,'2023-10-23 07:19:31',NULL,1),(64,1,1,1,1,'2023-10-27',1,'2023-10-29 12:20:00',NULL,'2023-10-30 02:35:20',NULL,1),(65,2,1,1,1,'2023-10-27',1,'2023-10-29 12:20:00',NULL,'2023-10-30 02:35:20',NULL,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `city`
--

LOCK TABLES `city` WRITE;
/*!40000 ALTER TABLE `city` DISABLE KEYS */;
INSERT INTO `city` VALUES (1,'Pune',1,'2018-09-13 13:22:16',NULL,'2018-09-13 13:22:16',NULL,1),(2,'Mumbai',1,'2018-09-13 13:22:16',NULL,'2018-09-13 13:22:16',NULL,1);
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
INSERT INTO `class` VALUES (1,'1','1,2,3','1,2,3,4,5',NULL,'1,2','2018-09-13 13:21:09',NULL,'2018-09-13 13:21:09',NULL,1),(2,'2','1,2,3,4','1,2,3,4,5',NULL,'2,1,3','2018-09-13 13:21:09',NULL,'2023-10-30 12:48:17',NULL,1),(3,'3','1,2,3,4','1,2,3,4',NULL,'1,2,3','2018-09-13 13:21:09',NULL,'2018-09-13 13:21:09',NULL,1),(4,'4','1,2,3,4','1,2,3,4',NULL,'1,2,3','2018-09-13 13:21:09',NULL,'2018-09-13 13:21:09',NULL,1),(5,'5','1,2,3,4','1,2,3,4',NULL,'1,2,3','2018-09-13 13:21:09',NULL,'2018-09-13 13:21:09',NULL,1),(6,'6','1,2,3,4','1,2,3,4',NULL,'1,2,3','2019-04-23 07:53:22',NULL,'2019-04-23 07:53:22',NULL,1),(8,'7','1,2,3,4','1,3,4,5','6','1,2,3','2023-10-30 09:15:06',NULL,'2023-10-30 09:15:06',NULL,1),(12,'8','1,2,3,4','3,4,5',NULL,'2,4,1,3','2023-10-30 11:23:36',NULL,'2023-10-30 11:23:36',NULL,1),(13,'9','1,2,3,4','3,4,5,6','6','2,4,1,3','2023-10-30 11:26:35',NULL,'2023-10-30 11:26:35',NULL,1);
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
INSERT INTO `classteacher` VALUES (1,1,1,1,'2018-10-13 00:30:53',NULL,'2018-10-13 00:30:53',NULL,1),(2,6,1,2,'2018-10-13 00:30:53',NULL,'2023-11-03 07:18:28',NULL,1),(3,3,2,1,'2018-10-13 00:30:53',NULL,'2023-11-03 08:52:15',NULL,1),(4,5,2,2,'2018-10-13 00:30:53',NULL,'2023-11-03 08:01:18',NULL,1),(10,2,1,3,'2023-11-03 07:24:10',NULL,'2023-11-03 09:19:34',NULL,1);
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
-- Table structure for table `finalresult`
--

DROP TABLE IF EXISTS `finalresult`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `finalresult` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `studentId` bigint DEFAULT NULL,
  `classId` int DEFAULT NULL,
  `divId` int DEFAULT NULL,
  `subId` int DEFAULT NULL,
  `getMarks` int DEFAULT NULL,
  `totalMarks` int DEFAULT NULL,
  `resultDate` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createdBy` bigint DEFAULT NULL,
  `updatedAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedBy` bigint DEFAULT NULL,
  `active` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `finalresult_ibfk_1` (`studentId`),
  KEY `finalresult_ibfk_2` (`classId`),
  KEY `finalresult_ibfk_3` (`divId`),
  KEY `finalresult_ibfk_4` (`subId`),
  CONSTRAINT `finalresult_ibfk_1` FOREIGN KEY (`studentId`) REFERENCES `student` (`id`),
  CONSTRAINT `finalresult_ibfk_2` FOREIGN KEY (`classId`) REFERENCES `class` (`id`),
  CONSTRAINT `finalresult_ibfk_3` FOREIGN KEY (`divId`) REFERENCES `division` (`id`),
  CONSTRAINT `finalresult_ibfk_4` FOREIGN KEY (`subId`) REFERENCES `subject` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `finalresult`
--

LOCK TABLES `finalresult` WRITE;
/*!40000 ALTER TABLE `finalresult` DISABLE KEYS */;
/*!40000 ALTER TABLE `finalresult` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `holidays`
--

LOCK TABLES `holidays` WRITE;
/*!40000 ALTER TABLE `holidays` DISABLE KEYS */;
INSERT INTO `holidays` VALUES (1,'2019-04-25','2019-04-24 00:00:00',0,'2019-04-23 11:59:50',0,1),(2,'2023-10-24','2023-10-23 07:07:49',NULL,'2023-10-23 07:10:18',NULL,1),(3,'2023-10-31','2023-10-28 09:42:20',NULL,'2023-10-28 09:42:20',NULL,1);
/*!40000 ALTER TABLE `holidays` ENABLE KEYS */;
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
INSERT INTO `schoolprofile` VALUES (1,'M J School','At POst:pimpri kh, Tal-Dharangaon, Dist:Jalgaon, Pin-425105','7588646203','7588646201','dheerajmalu@ymail.com','www.mjs.com','23423fsdr53','2023-07-17 00:00:00','2024-06-30 00:00:00','0000-00-00 00:00:00',0,'2019-02-22 23:50:57',0,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `state`
--

LOCK TABLES `state` WRITE;
/*!40000 ALTER TABLE `state` DISABLE KEYS */;
INSERT INTO `state` VALUES (1,'Maharashtra','2018-09-13 13:21:45',NULL,'2018-09-13 13:21:45',NULL,1),(2,'Goa','2018-09-13 13:21:45',NULL,'2018-09-13 13:21:45',NULL,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES (1,'dheeraj','j','malu',NULL,1,'12-11-1990',1,1,'5','Sandhya','B.com','housewife','Jagdish','B.com','employee','7588646203','9860335008','Indian','maharashtra','Hindu','A+','at post:- pimpri kh. tal-dharangaon, jalgaon',2,1,NULL,'2018-09-13 13:36:13',NULL,'2019-06-08 18:34:14',NULL,1),(2,'Pavan','j','Patil',NULL,1,NULL,1,1,'6',NULL,NULL,NULL,'suraj',NULL,NULL,'9860335008',NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,'2018-09-13 13:36:13',NULL,'2018-09-13 13:36:13',NULL,1),(7,'Darpan','j','Patel',NULL,1,NULL,1,2,'1','shanti',NULL,'housewife','ashok',NULL,'working','8989989989','8988989889','Indian','maharashtra','hindi','A+','gujrat',NULL,1,NULL,'2019-03-16 07:58:07',NULL,'2019-03-16 07:58:07',NULL,1),(8,'Darpan','m','patil',NULL,1,NULL,2,1,'1','shanti',NULL,'housewife','ashok',NULL,'working','8989989989','8988989889','Indian','maharashtra','hindi','A+','gujrat',NULL,1,NULL,'2019-03-16 07:58:07',NULL,'2019-03-16 07:58:07',NULL,1),(9,'visal','m','patil',NULL,1,NULL,2,2,'1','shanti',NULL,'housewife','ashok',NULL,'working','8989989989','8988989889','Indian','maharashtra','hindi','A+','gujrat',NULL,1,NULL,'2019-03-16 07:58:07',NULL,'2019-03-16 07:58:07',NULL,1),(10,'naresh','m','patil',NULL,1,NULL,2,1,'1','shanti',NULL,'housewife','ashok',NULL,'working','8989989989','8988989889','Indian','maharashtra','hindi','A+','gujrat',NULL,1,NULL,'2019-03-16 07:58:07',NULL,'2019-03-16 07:58:07',NULL,1),(11,'deepak','l','dubal',NULL,1,'01/11/1990',3,1,NULL,'sandhya',NULL,'house wife','sanjay',NULL,'service','9877997111','9988776655','indian','hindu','hindu','A+','gfgdfgdfgdf dfgdfgdfg dfgdfg',1,1,NULL,'2019-06-08 18:25:30',NULL,'2019-06-08 18:25:30',NULL,1),(12,'Nikita','S','Mundada',NULL,2,NULL,2,2,'2','Sunita',NULL,'housewife','shamsundar',NULL,'business','8989890088','9800990000','Indian','hindu','marwari','A+','E601,Hermosa Casa',NULL,NULL,NULL,'2023-10-23 06:36:47',NULL,'2023-10-23 06:36:47',NULL,1),(13,'Manish','S','patil',NULL,1,NULL,3,2,NULL,'himali',NULL,'housewift','sand',NULL,'businees','8798990900','8877665544','indian','hindi','open','A+','testq',1,1,NULL,'2023-10-28 07:47:14',NULL,'2023-10-29 03:15:06',NULL,1),(14,'sunny','sds','singh',NULL,1,NULL,3,1,NULL,'dsfsd',NULL,'vcxv','XVCXV',NULL,'CXVCXV','9988664455','7788994455','indian','hindu','obc','O+','zxcxz',1,1,NULL,'2023-10-28 07:49:21',NULL,'2023-10-29 09:17:14',NULL,1),(15,'Gauri','c','patil',NULL,1,NULL,3,2,NULL,'sdfds',NULL,'dsfds','cxvcxv',NULL,'xcvvcxv','9988776655','9988774455','indian','hindu','obc','AB+','ddsfds',1,1,NULL,'2023-10-28 07:50:27',NULL,'2023-10-29 09:17:03',NULL,1),(16,'lalit','s','patil',NULL,1,NULL,2,1,NULL,'dffff fd',NULL,'cvxcvxvx zxcv','dnfksdnvkn ds',NULL,'dsvcx xc','8877665544','8877667788','indian','hindu','obc','A+','vcxvxc  xcxvvx',1,1,NULL,'2023-10-29 03:13:31',NULL,'2023-10-29 03:38:19',NULL,1);
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
 1 AS `monthAvg`*/;
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
INSERT INTO `teacher` VALUES (1,'Suredra','P','Sharma',NULL,1,'A-','01/11/1990','MA','3 years','Indian','open','9860335008','9860335008','dsfds',1,1,NULL,'12/12/2012',NULL,'2018-10-07 00:55:19',NULL,'2019-04-14 04:49:12',NULL,1),(2,'Ashwin','P','Patil',NULL,1,'A+','01/11/1990','MA','3 years','Indian','Open','9860335008','8989898998','baner',1,1,'425001','12/12/2012',NULL,'2018-10-07 00:55:19',NULL,'2019-03-16 11:47:54',NULL,1),(3,'jyotsna','P','Patil',NULL,1,NULL,'01/11/1990','MA','3 years',NULL,NULL,'9860335008',NULL,NULL,2,1,'425001','12/12/2012',NULL,'2018-10-07 00:55:19',NULL,'2018-10-07 00:55:19',NULL,1),(4,'Hiten','P','Patil',NULL,1,NULL,'01/11/1990','MA','3 years',NULL,NULL,'9860335008',NULL,NULL,2,1,'425001','12/12/2012',NULL,'2018-10-07 00:55:19',NULL,'2018-10-07 00:55:19',NULL,1),(5,'Dheeraj','P','Patil',NULL,1,NULL,'01/11/1990','MA','3 years',NULL,NULL,'9860335008',NULL,NULL,2,1,'425001','12/12/2012',NULL,'2018-10-07 00:55:19',NULL,'2018-10-07 00:55:19',NULL,1),(6,'Suraj','P','Patil',NULL,1,'o+','01/11/1990','MA','3 years','indian','open','9988223300','9911223322','E601',1,1,'425001','12/12/2012',NULL,'2018-10-07 00:55:19',NULL,'2023-10-29 09:25:41',NULL,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teachersubject`
--

LOCK TABLES `teachersubject` WRITE;
/*!40000 ALTER TABLE `teachersubject` DISABLE KEYS */;
INSERT INTO `teachersubject` VALUES (1,1,3,1,1,'2018-09-22 06:59:17',NULL,'2018-09-22 06:59:17',NULL,1),(2,1,2,1,2,'2018-09-22 06:59:37',NULL,'2018-09-22 06:59:37',NULL,1),(3,1,1,1,1,'2018-09-22 06:59:54',NULL,'2018-09-22 06:59:54',NULL,1),(4,2,4,2,2,'2018-09-22 06:59:54',NULL,'2018-09-22 06:59:54',NULL,1),(5,1,2,1,1,'2018-09-22 06:59:37',NULL,'2018-09-22 06:59:37',NULL,1),(6,1,1,1,2,'2018-09-22 06:59:54',NULL,'2018-09-22 06:59:54',NULL,1),(7,1,3,1,2,'2018-09-22 06:59:17',NULL,'2018-09-22 06:59:17',NULL,1),(8,2,4,2,1,'2018-09-22 06:59:54',NULL,'2018-09-22 06:59:54',NULL,1),(9,2,5,2,2,'2018-09-22 06:59:54',NULL,'2018-09-22 06:59:54',NULL,1),(10,2,2,2,2,'2018-09-22 06:59:54',NULL,'2018-09-22 06:59:54',NULL,1),(15,6,5,1,1,'2023-11-01 09:49:03',NULL,'2023-11-01 10:39:44',NULL,1),(16,3,5,1,2,'2023-11-01 10:44:38',NULL,'2023-11-01 10:44:38',NULL,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testmarks`
--

LOCK TABLES `testmarks` WRITE;
/*!40000 ALTER TABLE `testmarks` DISABLE KEYS */;
INSERT INTO `testmarks` VALUES (1,1,1,1,1,1,3,'91','100','2018-09-22 06:24:58',NULL,'2018-09-22 06:24:58',NULL,1),(2,1,1,1,1,1,2,'89','100','2018-09-22 06:24:58',NULL,'2018-09-22 06:24:58',NULL,1),(4,1,1,1,1,2,2,'84','100','2018-09-22 06:25:10',NULL,'2018-09-22 06:25:10',NULL,1),(5,2,1,1,1,1,3,'69','100','2018-09-22 06:24:58',NULL,'2018-09-22 06:24:58',NULL,1),(6,2,1,1,1,1,2,'98','100','2018-09-22 06:24:58',NULL,'2018-09-22 06:24:58',NULL,1),(7,2,1,1,1,2,3,'65','100','2018-09-22 06:25:10',NULL,'2018-09-22 06:25:10',NULL,1),(8,1,1,1,1,1,1,'89','100','2018-09-22 06:24:58',NULL,'2018-09-22 06:24:58',NULL,1),(9,1,1,1,1,2,1,'96','100','2018-09-22 06:25:10',NULL,'2018-09-22 06:25:10',NULL,1),(10,2,1,1,1,1,1,'99','100','2018-09-22 06:24:58',NULL,'2018-09-22 06:24:58',NULL,1),(11,1,1,1,1,2,3,'89','100','2018-09-22 06:24:58',NULL,'2018-09-22 06:24:58',NULL,1),(31,8,1,2,1,3,1,'99','100','2019-04-22 19:56:16',NULL,'2019-04-22 20:43:11',NULL,1),(32,10,1,2,1,3,1,'55','100','2019-04-22 19:56:16',NULL,'2019-04-22 20:43:11',NULL,1),(35,9,NULL,2,2,1,4,'98','100','2019-04-22 21:16:44',NULL,'2019-04-22 21:16:44',NULL,1),(36,9,NULL,2,2,2,4,'100','100','2019-04-22 21:17:39',NULL,'2019-04-22 21:17:39',NULL,1),(37,7,1,1,2,1,1,'80','100','2019-05-26 07:57:51',NULL,'2019-05-26 07:57:51',NULL,1),(38,7,1,1,2,1,3,'90','100','2019-05-26 07:58:11',NULL,'2019-05-26 07:58:11',NULL,1),(39,7,1,1,2,1,2,'90','100','2019-06-03 19:20:22',NULL,'2019-06-03 19:20:22',NULL,1),(40,7,1,1,2,2,2,'100','100','2019-06-03 19:22:28',NULL,'2019-06-03 19:22:28',NULL,1),(41,7,1,1,2,2,1,'99','100','2019-06-03 19:24:59',NULL,'2019-06-03 19:24:59',NULL,1),(42,7,1,1,2,2,3,'80','100','2019-06-03 19:25:13',NULL,'2019-06-03 19:25:13',NULL,1),(43,2,1,1,1,2,2,'75','100','2018-09-22 06:25:10',NULL,'2018-09-22 06:25:10',NULL,1),(44,2,1,1,1,2,1,'98','100','2018-09-22 06:25:10',NULL,'2018-09-22 06:25:10',NULL,1),(45,9,1,2,2,1,5,'90','100','2023-10-22 10:46:26',NULL,'2023-10-22 10:46:26',NULL,1),(46,8,1,2,1,1,4,'80','100','2023-10-22 10:46:49',NULL,'2023-10-22 10:46:49',NULL,1),(47,10,1,2,1,1,4,'90','100','2023-10-22 10:46:49',NULL,'2023-10-22 10:46:49',NULL,1),(48,9,1,2,2,1,2,'87','100','2023-10-22 10:47:06',NULL,'2023-10-22 10:47:06',NULL,1),(49,9,1,2,2,2,5,'98','100','2023-10-22 10:47:13',NULL,'2023-10-22 10:47:13',NULL,1),(50,8,1,2,1,2,4,'89','100','2023-10-22 10:49:09',NULL,'2023-10-22 10:49:09',NULL,1),(51,10,1,2,1,2,4,'77','100','2023-10-22 10:49:09',NULL,'2023-10-22 10:49:09',NULL,1),(52,8,1,2,1,3,4,'99','100','2023-10-22 10:49:40',NULL,'2023-10-22 10:49:40',NULL,1),(53,10,1,2,1,3,4,'56','100','2023-10-22 10:49:40',NULL,'2023-10-22 10:49:40',NULL,1),(54,9,1,2,2,3,5,'67','100','2023-10-23 06:41:10',NULL,'2023-10-23 06:41:10',NULL,1),(55,12,1,2,2,3,5,'91','100','2023-10-23 06:41:10',NULL,'2023-10-23 06:41:10',NULL,1),(56,9,1,2,2,2,2,'71','100','2023-10-23 06:41:25',NULL,'2023-10-23 06:41:25',NULL,1),(57,12,1,2,2,2,2,'81','100','2023-10-23 06:41:25',NULL,'2023-10-23 06:41:25',NULL,1),(58,9,1,2,2,3,4,'40','50','2023-10-23 06:41:57',NULL,'2023-10-23 06:41:57',NULL,1),(59,12,1,2,2,3,4,'40','100','2023-10-23 06:41:57',NULL,'2023-10-23 06:41:57',NULL,1),(60,9,1,2,2,3,2,'35','100','2023-10-28 08:45:04',NULL,'2023-10-28 08:45:04',NULL,1),(61,12,1,2,2,3,2,'78','100','2023-10-28 08:45:04',NULL,'2023-10-28 08:45:04',NULL,1),(62,1,1,1,1,1,4,'100','100','2023-11-01 02:40:22',NULL,'2023-11-01 02:40:22',NULL,1),(63,2,1,1,1,1,4,'98','100','2023-11-01 02:40:22',NULL,'2023-11-01 02:40:22',NULL,1),(64,1,1,1,1,2,4,'88','100','2023-11-01 02:41:55',NULL,'2023-11-01 02:41:55',NULL,1),(65,2,1,1,1,2,4,'99','100','2023-11-01 02:41:55',NULL,'2023-11-01 02:41:55',NULL,1),(66,7,1,1,2,2,4,'99','100','2023-11-01 02:42:10',NULL,'2023-11-01 02:42:10',NULL,1),(67,7,1,1,2,1,4,'99','100','2023-11-01 02:42:23',NULL,'2023-11-01 02:42:23',NULL,1),(68,1,1,1,1,1,5,'87','100','2023-11-01 02:49:35',NULL,'2023-11-01 02:49:35',NULL,1),(69,2,1,1,1,1,5,'66','100','2023-11-01 02:49:35',NULL,'2023-11-01 02:49:35',NULL,1),(70,7,1,1,2,1,5,'78','100','2023-11-01 02:49:47',NULL,'2023-11-01 02:49:47',NULL,1),(71,7,1,1,2,2,5,'99','100','2023-11-01 12:02:16',NULL,'2023-11-01 12:02:16',NULL,1);
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
  `subId` int NOT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=150 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `timetable`
--

LOCK TABLES `timetable` WRITE;
/*!40000 ALTER TABLE `timetable` DISABLE KEYS */;
INSERT INTO `timetable` VALUES (1,1,1,3,1,'10:00-11:00',NULL,'2018-09-24 00:00:00',NULL,'2023-10-30 13:52:38',NULL,1),(2,1,2,2,1,'10:00-11:00',NULL,'2018-09-24 00:00:00',NULL,'2023-10-31 08:38:38',NULL,1),(3,2,2,2,1,'09:00-10:45',NULL,'2018-09-24 00:00:00',NULL,'2018-09-24 00:00:00',NULL,1),(4,1,1,3,2,'10:00-11:00',NULL,'2018-09-24 00:00:00',NULL,'2023-10-30 13:52:38',NULL,1),(5,1,2,2,2,'10:00-11:00',NULL,'2018-09-24 00:00:00',NULL,'2023-10-31 08:38:38',NULL,1),(6,1,1,3,3,'10:00-11:00',NULL,'2018-09-24 00:00:00',NULL,'2023-10-30 13:52:38',NULL,1),(7,1,2,2,3,'10:00-11:00',NULL,'2018-09-24 00:00:00',NULL,'2023-10-31 08:38:38',NULL,1),(8,1,1,3,4,'10:00-11:00',NULL,'2018-09-24 00:00:00',NULL,'2023-10-30 13:52:38',NULL,1),(9,1,2,2,4,'10:00-11:00',NULL,'2018-09-24 00:00:00',NULL,'2023-10-31 08:38:38',NULL,1),(10,1,1,3,5,'16:00-17:45',NULL,'2018-09-24 00:00:00',NULL,'2023-10-30 13:52:38',NULL,1),(11,1,2,2,5,'10:00-11:00',NULL,'2018-09-24 00:00:00',NULL,'2023-10-31 08:38:38',NULL,1),(87,1,1,2,5,'10:00-10:00',NULL,'2023-10-30 13:52:38',NULL,'2023-10-30 13:52:38',NULL,1),(94,1,2,4,1,'11:00-11:30',NULL,'2023-10-30 13:55:10',NULL,'2023-10-31 08:38:38',NULL,1),(95,1,2,3,2,'11:00-11:30',NULL,'2023-10-30 13:55:10',NULL,'2023-10-31 08:38:38',NULL,1),(96,1,2,5,3,'11:00-11:30',NULL,'2023-10-30 13:55:10',NULL,'2023-10-31 08:38:38',NULL,1),(97,1,2,4,4,'11:00-11:00',NULL,'2023-10-30 13:55:10',NULL,'2023-10-31 08:38:38',NULL,1),(98,1,2,4,5,'11:00-11:30',NULL,'2023-10-30 13:55:10',NULL,'2023-10-31 08:38:38',NULL,1),(128,1,2,1,6,'10:00-10:50',NULL,'2023-10-31 08:37:20',NULL,'2023-10-31 08:38:38',NULL,1);
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
INSERT INTO `users` VALUES (1,'suraj','malu','surajmalu@ymail.com','7588646201','$2a$10$GUEiqZfR.1WlZn6SqaKN4.R83psL28FL/qgjxwH3w8iA1dK2Yb7o2','2018-09-06 17:33:17','2018-09-06 17:33:17',1),(3,'suraj','malu','dheerajmalu@ymail.com','7588646203','d9c59c1aa00818c948423d8d9f141f30','2018-09-06 17:33:17','2018-09-06 17:33:17',1),(5,NULL,NULL,'dheerajmalu143@gmail.com',NULL,'$2b$10$bHCOCGbpB0A2fds6QUZUoewEqEEVWqH7zryHuDjMqDzNMs.17Qe.e','2023-10-19 10:11:22','2023-10-19 10:11:22',1);
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
/*!50001 VIEW `classdetailsview` AS select `main`.`id` AS `id`,`main`.`className` AS `className`,`main`.`divIds` AS `divIds`,`main`.`subjectIds` AS `subjectIds`,`main`.`optionalSubjectIds` AS `optionalSubjectIds`,`main`.`testIds` AS `testIds`,group_concat(distinct `d`.`divName` order by `d`.`id` ASC separator ',') AS `divisionNames`,group_concat(distinct `s`.`subName` order by `s`.`id` ASC separator ',') AS `subjectNames`,group_concat(distinct `s1`.`subName` order by `s1`.`id` ASC separator ',') AS `optionalSubjectNames`,group_concat(distinct `t`.`testName` order by `t`.`id` ASC separator ',') AS `testNames`,`main`.`createdAt` AS `createdAt`,`main`.`active` AS `active` from ((((`class` `main` left join `division` `d` on((find_in_set(`d`.`id`,`main`.`divIds`) > 0))) left join `subject` `s` on((find_in_set(`s`.`id`,`main`.`subjectIds`) > 0))) left join `subject` `s1` on((find_in_set(`s1`.`id`,`main`.`optionalSubjectIds`) > 0))) left join `test` `t` on((find_in_set(`t`.`id`,`main`.`testIds`) > 0))) group by `main`.`id` */;
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
/*!50001 VIEW `studentmonthlyattendanceview` AS select `att`.`studentId` AS `studentId`,concat(`st`.`firstName`,' ',`st`.`lastName`) AS `studentName`,`st`.`classId` AS `classId`,`st`.`divId` AS `divId`,date_format(`att`.`attendanceDate`,'%b') AS `attendanceMonth`,round((((select count(`at1`.`id`) from `attendance` `at1` where ((`at1`.`attendanceResult` <> 0) and (`at1`.`studentId` = `att`.`studentId`) and (date_format(`at1`.`attendanceDate`,'%b') = date_format(`att`.`attendanceDate`,'%b')))) / (select count(`at2`.`id`) from `attendance` `at2` where ((`at2`.`studentId` = `att`.`studentId`) and (date_format(`at2`.`attendanceDate`,'%b') = date_format(`att`.`attendanceDate`,'%b'))))) * 100),2) AS `monthAvg` from (`attendance` `att` join `student` `st` on((`st`.`id` = `att`.`studentId`))) group by date_format(`att`.`attendanceDate`,'%b'),`att`.`studentId`,`st`.`firstName`,`st`.`lastName`,`st`.`classId`,`st`.`divId`,`att`.`attendanceDate` */;
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

-- Dump completed on 2023-11-03 15:01:52
