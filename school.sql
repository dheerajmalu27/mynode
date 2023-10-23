-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 09, 2019 at 08:34 PM
-- Server version: 10.1.28-MariaDB
-- PHP Version: 7.0.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `school`
--
CREATE DATABASE IF NOT EXISTS `school` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `school`;

DELIMITER $$
--
-- Procedures
--
DROP PROCEDURE IF EXISTS `attendancependinglist`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `attendancependinglist` ()  NO SQL
SELECT *,@rownum := @rownum + 1 as rowNumber FROM (SELECT * FROM classdivisionlistview )AS table2, (select DAYNAME(selectedDate) as day,selectedDate from 
(select adddate('1970-01-01',t4.i*10000 + t3.i*1000 + t2.i*100 + t1.i*10 + t0.i) selectedDate from
 (select 0 i union select 1 union select 2 union select 3 union select 4 union select 5 union select 6 union select 7 union select 8 union select 9) t0,
 (select 0 i union select 1 union select 2 union select 3 union select 4 union select 5 union select 6 union select 7 union select 8 union select 9) t1,
 (select 0 i union select 1 union select 2 union select 3 union select 4 union select 5 union select 6 union select 7 union select 8 union select 9) t2,
 (select 0 i union select 1 union select 2 union select 3 union select 4 union select 5 union select 6 union select 7 union select 8 union select 9) t3,
 (select 0 i union select 1 union select 2 union select 3 union select 4 union select 5 union select 6 union select 7 union select 8 union select 9) t4) v
where selectedDate between (SELECT DATE(sc.schoolStartDate) FROM schoolprofile sc WHERE sc.active=1) and (SELECT DATE(sch.schoolEndDate) FROM schoolprofile sch WHERE sch.active=1) AND DAYNAME(selectedDate) IN (SELECT d.dayName FROM days as d WHERE d.active=1) AND selectedDate NOT IN(SELECT h.holidayDate FROM holidays h WHERE h.active=1)   ORDER BY selectedDate) as table3 cross join (select @rownum := 0) r WHERE table3.selectedDate<=CURDATE() AND
table3.selectedDate NOT IN (SELECT DISTINCT(DATE(attt.attendanceDate)) FROM attendance as attt where 
attt.classId= table2.classId AND attt.divId=table2.divId) ORDER BY table3.selectedDate$$

DROP PROCEDURE IF EXISTS `dashboarddatacount`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `dashboarddatacount` ()  NO SQL
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
 (SELECT ho.holidayDate FROM holidays ho WHERE ho.active=1 AND ho.holidayDate>CURDATE() ORDER by ho.holidayDate LIMIT 1) as nextholiday$$

DROP PROCEDURE IF EXISTS `schoolworkingdays`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `schoolworkingdays` ()  NO SQL
select DAYNAME(selected_date) as day,selected_date from 
(select adddate('1970-01-01',t4.i*10000 + t3.i*1000 + t2.i*100 + t1.i*10 + t0.i) selected_date from
 (select 0 i union select 1 union select 2 union select 3 union select 4 union select 5 union select 6 union select 7 union select 8 union select 9) t0,
 (select 0 i union select 1 union select 2 union select 3 union select 4 union select 5 union select 6 union select 7 union select 8 union select 9) t1,
 (select 0 i union select 1 union select 2 union select 3 union select 4 union select 5 union select 6 union select 7 union select 8 union select 9) t2,
 (select 0 i union select 1 union select 2 union select 3 union select 4 union select 5 union select 6 union select 7 union select 8 union select 9) t3,
 (select 0 i union select 1 union select 2 union select 3 union select 4 union select 5 union select 6 union select 7 union select 8 union select 9) t4) as v
where selected_date between (SELECT DATE(sc.schoolStartDate) FROM schoolprofile sc WHERE sc.active=1) and (SELECT DATE(sch.schoolEndDate) FROM schoolprofile sch WHERE sch.active=1) AND DAYNAME(selected_date) IN (SELECT d.dayName FROM days as d WHERE d.active=1) AND selected_date NOT IN(SELECT h.holidayDate FROM holidays h WHERE h.active=1)  ORDER BY selected_date$$

DROP PROCEDURE IF EXISTS `teacherattendancependinglist`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `teacherattendancependinglist` (IN `teacherID` INT(20))  SELECT *,(@rownum := @rownum + 1) as rowNumber FROM (SELECT * FROM classdivisionlistview )AS table2, (select DAYNAME(selectedDate) as day,selectedDate from 
(select adddate('1970-01-01',t4.i*10000 + t3.i*1000 + t2.i*100 + t1.i*10 + t0.i) selectedDate from
 (select 0 i union select 1 union select 2 union select 3 union select 4 union select 5 union select 6 union select 7 union select 8 union select 9) t0,
 (select 0 i union select 1 union select 2 union select 3 union select 4 union select 5 union select 6 union select 7 union select 8 union select 9) t1,
 (select 0 i union select 1 union select 2 union select 3 union select 4 union select 5 union select 6 union select 7 union select 8 union select 9) t2,
 (select 0 i union select 1 union select 2 union select 3 union select 4 union select 5 union select 6 union select 7 union select 8 union select 9) t3,
 (select 0 i union select 1 union select 2 union select 3 union select 4 union select 5 union select 6 union select 7 union select 8 union select 9) t4) v
where selectedDate between (SELECT DATE(sc.schoolStartDate) FROM schoolprofile sc WHERE sc.active=1) and (SELECT DATE(sch.schoolEndDate) FROM schoolprofile sch WHERE sch.active=1) AND DAYNAME(selectedDate) IN (SELECT d.dayName FROM days as d WHERE d.active=1) AND selectedDate NOT IN(SELECT h.holidayDate FROM holidays h WHERE h.active=1)   ORDER BY selectedDate) as table3 cross join (select @rownum := 0) r WHERE table3.selectedDate<=CURDATE() AND
table3.selectedDate NOT IN (SELECT DISTINCT(DATE(attt.attendanceDate)) FROM attendance as attt where 
attt.classId= table2.classId AND attt.divId=table2.divId) AND table2.teacherId=teacherID ORDER BY table3.selectedDate,rowNumber$$

DROP PROCEDURE IF EXISTS `testranklist`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `testranklist` (IN `testID` BIGINT, IN `studentID` BIGINT, IN `classID` INT, IN `divID` INT)  NO SQL
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
END$$

DROP PROCEDURE IF EXISTS `testsubjectmarkspendinglist`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `testsubjectmarkspendinglist` ()  NO SQL
SELECT table1.*,ts.teacherId,CONCAT(t.firstName,' ',t.lastName) AS teacherName  from(select `te`.`id` AS `testId`,`cl`.`id` AS `classId`,`di`.`id` AS `divisionId`,`sub`.`id` AS `subjectId`,`te`.`testName` AS `testName`,`cl`.`className` AS `className`,`di`.`divName` AS `divName`,`sub`.`subName` AS `subName` from (((`school`.`class` `cl` join `school`.`subject` `sub`) join `school`.`test` `te`) join `school`.`division` `di`) where (find_in_set(`sub`.`id`,`cl`.`subjectIds`) and find_in_set(`te`.`id`,`cl`.`testIds`) and (`cl`.`active` = 1) and (`sub`.`active` = 1) and (`te`.`active` = 1) and (`di`.`active` = 1) and (not(exists(select 1 from `school`.`testmarks` `tm` where ((`tm`.`testId` = `te`.`id`) and (`tm`.`classId` = `cl`.`id`) and (`tm`.`divId` = `di`.`id`) and (`tm`.`subId` = `sub`.`id`)))))) order by `te`.`id`,`cl`.`id`,`di`.`id`,`sub`.`id`)as table1,teachersubject as ts ,teacher as t WHERE table1.classId=ts.classId AND table1.divisionId=ts.divId AND table1.subjectId=ts.subId AND ts.teacherId=t.id$$

DROP PROCEDURE IF EXISTS `testwiseclasslist`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `testwiseclasslist` ()  NO SQL
SELECT * FROM (SELECT cl.className,di.divName,t.testName,tm.`classId`, tm.`divId`, tm.`testId`, COUNT(DISTINCT(tm.`subId`)) testSubTotal,(LENGTH(cl.`subjectIds`)-LENGTH(REPLACE(cl.`subjectIds`,',',''))+1) as totalSub FROM `testmarks` tm INNER JOIN division di ON di.id=tm.`divId` INNER JOIN class cl ON cl.id=tm.`classId` INNER JOIN test t ON t.id=tm.`testId`  GROUP BY tm.`testId`,tm.`classId`,tm.`divId` ORDER BY tm.`testId`,tm.`classId`,tm.`divId`) as ft WHERE ft.testSubTotal=ft.totalSub$$

DROP PROCEDURE IF EXISTS `todayattendancependinglist`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `todayattendancependinglist` ()  NO SQL
SELECT *,@rownum := @rownum + 1 as rowNumber FROM (SELECT * FROM classdivisionlistview )AS table2, (select DAYNAME(selectedDate) as day,selectedDate from 
(select adddate('1970-01-01',t4.i*10000 + t3.i*1000 + t2.i*100 + t1.i*10 + t0.i) selectedDate from
 (select 0 i union select 1 union select 2 union select 3 union select 4 union select 5 union select 6 union select 7 union select 8 union select 9) t0,
 (select 0 i union select 1 union select 2 union select 3 union select 4 union select 5 union select 6 union select 7 union select 8 union select 9) t1,
 (select 0 i union select 1 union select 2 union select 3 union select 4 union select 5 union select 6 union select 7 union select 8 union select 9) t2,
 (select 0 i union select 1 union select 2 union select 3 union select 4 union select 5 union select 6 union select 7 union select 8 union select 9) t3,
 (select 0 i union select 1 union select 2 union select 3 union select 4 union select 5 union select 6 union select 7 union select 8 union select 9) t4) v
where selectedDate between (SELECT DATE(sc.schoolStartDate) FROM schoolprofile sc WHERE sc.active=1) and (SELECT DATE(sch.schoolEndDate) FROM schoolprofile sch WHERE sch.active=1) AND DAYNAME(selectedDate) IN (SELECT d.dayName FROM days as d WHERE d.active=1) AND selectedDate NOT IN(SELECT h.holidayDate FROM holidays h WHERE h.active=1)   ORDER BY selectedDate) as table3 cross join (select @rownum := 0) r WHERE table3.selectedDate=CURDATE() AND
table3.selectedDate NOT IN (SELECT DISTINCT(DATE(attt.attendanceDate)) FROM attendance as attt where 
attt.classId= table2.classId AND attt.divId=table2.divId) ORDER BY table3.selectedDate$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Stand-in structure for view `absentstudentlistview`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `absentstudentlistview`;
CREATE TABLE `absentstudentlistview` (
`id` bigint(20)
,`studentId` bigint(20)
,`rollNo` varchar(255)
,`studentName` varchar(511)
,`fatherName` varchar(511)
,`mobNumber` varchar(255)
,`classId` int(11)
,`className` varchar(255)
,`divId` int(11)
,`divName` varchar(255)
,`classTeacherId` bigint(20)
,`teacherName` varchar(511)
,`attendanceDate` date
,`attendanceResult` tinyint(1)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `addattendancestudentlistview`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `addattendancestudentlistview`;
CREATE TABLE `addattendancestudentlistview` (
`studentId` bigint(20)
,`studentName` varchar(511)
,`classId` int(11)
,`divId` int(11)
,`divName` varchar(255)
,`className` varchar(255)
,`rollNo` varchar(255)
,`classTeacherId` bigint(20)
);

-- --------------------------------------------------------

--
-- Table structure for table `attendance`
--

DROP TABLE IF EXISTS `attendance`;
CREATE TABLE `attendance` (
  `id` bigint(20) NOT NULL,
  `studentId` bigint(20) DEFAULT NULL,
  `classId` int(11) DEFAULT NULL,
  `divId` int(11) DEFAULT NULL,
  `classTeacherId` bigint(20) DEFAULT NULL,
  `attendanceDate` date DEFAULT NULL,
  `attendanceResult` tinyint(1) DEFAULT NULL,
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createdBy` bigint(20) DEFAULT NULL,
  `updatedAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedBy` bigint(20) DEFAULT NULL,
  `active` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `attendance`
--

INSERT INTO `attendance` (`id`, `studentId`, `classId`, `divId`, `classTeacherId`, `attendanceDate`, `attendanceResult`, `createdAt`, `createdBy`, `updatedAt`, `updatedBy`, `active`) VALUES
(1, 1, 1, 1, 1, '2019-04-23', 0, '2018-10-07 09:57:56', NULL, '2018-10-07 09:57:56', NULL, 1),
(2, 1, 1, 1, 1, '2018-10-02', 1, '2018-10-07 09:57:56', NULL, '2018-10-07 09:57:56', NULL, 1),
(3, 1, 1, 1, 1, '2018-09-26', 1, '2018-10-07 09:58:40', NULL, '2018-10-07 09:58:40', NULL, 1),
(4, 1, 1, 1, 1, '2018-09-27', 1, '2018-10-07 09:58:40', NULL, '2018-10-07 09:58:40', NULL, 1),
(6, 1, 1, 1, 1, '2018-09-24', 1, '2018-10-07 09:58:40', NULL, '2018-10-07 09:58:40', NULL, 1),
(7, 1, 1, 1, 1, '2018-10-08', 0, '2018-10-07 09:58:40', NULL, '2018-10-07 09:58:40', NULL, 1),
(8, 1, 1, 1, 1, '2018-10-03', 1, '2018-10-07 09:57:56', NULL, '2018-10-07 09:57:56', NULL, 1),
(9, 1, 1, 1, 1, '2018-09-25', 1, '2018-10-07 09:58:40', NULL, '2018-10-07 09:58:40', NULL, 1),
(11, 2, 1, 1, 2, '2018-09-25', 1, '2018-10-07 09:58:40', NULL, '2018-10-07 09:58:40', NULL, 1),
(12, 2, 1, 1, 1, '2018-09-25', 1, '2018-10-07 09:58:40', NULL, '2018-10-07 09:58:40', NULL, 1),
(13, 1, 2, 1, 2, '2018-10-08', 0, '2018-10-07 09:58:40', NULL, '2018-10-07 09:58:40', NULL, 1),
(14, 1, 1, 1, 2, '2019-03-06', 0, '2018-10-07 09:58:40', NULL, '2018-10-07 09:58:40', NULL, 1),
(15, 1, 2, 1, 2, '2018-07-25', 0, '2018-10-07 09:58:40', NULL, '2018-10-07 09:58:40', NULL, 1),
(16, 1, 2, 2, 2, '2018-07-25', 0, '2018-10-07 09:58:40', NULL, '2018-10-07 09:58:40', NULL, 1),
(21, 1, 1, 1, 1, '2019-03-07', 1, '2019-03-24 09:08:13', NULL, '2019-03-24 09:08:13', NULL, 1),
(26, 2, 1, 1, 1, '2019-03-07', 1, '2019-03-24 09:10:13', NULL, '2019-03-24 09:10:13', NULL, 1),
(27, 1, 1, 1, 1, '2019-03-08', 1, '2019-03-24 09:12:37', NULL, '2019-04-18 18:03:30', NULL, 1),
(28, 2, 1, 1, 1, '2019-03-08', 0, '2019-03-24 09:12:37', NULL, '2019-04-18 18:03:30', NULL, 1),
(51, 1, 1, 1, 1, '2019-04-10', 1, '2019-04-11 17:49:37', NULL, '2019-04-20 04:16:25', NULL, 1),
(52, 2, 1, 1, 1, '2019-04-10', 0, '2019-04-11 17:49:37', NULL, '2019-04-20 04:16:25', NULL, 1),
(53, 1, 1, 1, 1, '2018-07-17', 1, '2019-04-20 04:33:44', NULL, '2019-04-20 04:33:44', NULL, 1),
(54, 2, 1, 1, 1, '2018-07-17', 1, '2019-04-20 04:33:44', NULL, '2019-04-20 04:33:44', NULL, 1),
(55, 7, 1, 2, 2, '2018-07-17', 1, '2019-04-20 04:35:05', NULL, '2019-04-20 04:35:05', NULL, 1),
(56, 8, 2, 1, 3, '2018-07-17', 1, '2019-04-20 04:38:33', NULL, '2019-04-20 04:38:33', NULL, 1),
(57, 10, 2, 1, 3, '2018-07-17', 1, '2019-04-20 04:38:33', NULL, '2019-04-20 04:38:33', NULL, 1);

-- --------------------------------------------------------

--
-- Stand-in structure for view `attendancelistview`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `attendancelistview`;
CREATE TABLE `attendancelistview` (
`classId` int(11)
,`divId` int(11)
,`className` varchar(255)
,`divName` varchar(255)
,`teacherName` varchar(511)
,`teacherId` bigint(20)
,`selectedDate` date
,`totalPresent` bigint(21)
,`total` bigint(21)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `attendancemonthlist`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `attendancemonthlist`;
CREATE TABLE `attendancemonthlist` (
`className` varchar(255)
,`divName` varchar(255)
,`classId` int(11)
,`divId` int(11)
,`AttendanceMonth` varchar(69)
);

-- --------------------------------------------------------

--
-- Table structure for table `city`
--

DROP TABLE IF EXISTS `city`;
CREATE TABLE `city` (
  `id` bigint(20) NOT NULL,
  `cityName` varchar(255) DEFAULT NULL,
  `stateId` bigint(20) DEFAULT NULL,
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createdBy` bigint(20) DEFAULT NULL,
  `updatedAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedBy` bigint(20) DEFAULT NULL,
  `active` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `city`
--

INSERT INTO `city` (`id`, `cityName`, `stateId`, `createdAt`, `createdBy`, `updatedAt`, `updatedBy`, `active`) VALUES
(1, 'Pune', 1, '2018-09-13 13:22:16', NULL, '2018-09-13 13:22:16', NULL, 1),
(2, 'Mumbai', 1, '2018-09-13 13:22:16', NULL, '2018-09-13 13:22:16', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `class`
--

DROP TABLE IF EXISTS `class`;
CREATE TABLE `class` (
  `id` int(11) NOT NULL,
  `className` varchar(255) DEFAULT NULL,
  `subjectIds` text,
  `testIds` text,
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createdBy` bigint(20) DEFAULT NULL,
  `updatedAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedBy` bigint(20) DEFAULT NULL,
  `active` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `class`
--

INSERT INTO `class` (`id`, `className`, `subjectIds`, `testIds`, `createdAt`, `createdBy`, `updatedAt`, `updatedBy`, `active`) VALUES
(1, '1', '1,2,3', '1,2', '2018-09-13 13:21:09', NULL, '2018-09-13 13:21:09', NULL, 1),
(2, '2', '1,2,3,4,5', '1,2,3', '2018-09-13 13:21:09', NULL, '2019-04-23 07:50:17', NULL, 1),
(3, '3', '1,2,3,4', '1,2,3', '2018-09-13 13:21:09', NULL, '2018-09-13 13:21:09', NULL, 1),
(4, '4', '1,2,3,4', '1,2,3', '2018-09-13 13:21:09', NULL, '2018-09-13 13:21:09', NULL, 1),
(5, '5', '1,2,3,4', '1,2,3', '2018-09-13 13:21:09', NULL, '2018-09-13 13:21:09', NULL, 1),
(6, '6', '1,2,3,4', NULL, '2019-04-23 07:53:22', NULL, '2019-04-23 07:53:22', NULL, 1);

-- --------------------------------------------------------

--
-- Stand-in structure for view `classdivisionlistview`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `classdivisionlistview`;
CREATE TABLE `classdivisionlistview` (
`id` int(11)
,`classId` int(11)
,`divId` int(11)
,`className` varchar(255)
,`divName` varchar(255)
,`teacherName` varchar(511)
,`teacherId` bigint(20)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `classmonthlyattendanceview`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `classmonthlyattendanceview`;
CREATE TABLE `classmonthlyattendanceview` (
`teacherId` bigint(20)
,`classId` int(11)
,`divId` int(11)
,`attendanceMonth` varchar(32)
,`monthAvg` decimal(49,2)
);

-- --------------------------------------------------------

--
-- Table structure for table `classteacher`
--

DROP TABLE IF EXISTS `classteacher`;
CREATE TABLE `classteacher` (
  `id` int(11) NOT NULL,
  `teacherId` bigint(20) DEFAULT NULL,
  `classId` int(11) DEFAULT NULL,
  `divId` int(11) DEFAULT NULL,
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createdBy` bigint(20) DEFAULT NULL,
  `updatedAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedBy` bigint(20) DEFAULT NULL,
  `active` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `classteacher`
--

INSERT INTO `classteacher` (`id`, `teacherId`, `classId`, `divId`, `createdAt`, `createdBy`, `updatedAt`, `updatedBy`, `active`) VALUES
(1, 1, 1, 1, '2018-10-13 00:30:53', NULL, '2018-10-13 00:30:53', NULL, 1),
(2, 2, 1, 2, '2018-10-13 00:30:53', NULL, '2018-10-13 00:30:53', NULL, 1),
(3, 3, 2, 1, '2018-10-13 00:30:53', NULL, '2018-10-13 00:30:53', NULL, 1),
(4, 5, 2, 2, '2018-10-13 00:30:53', NULL, '2018-10-13 00:30:53', NULL, 1),
(5, 4, 3, 1, '2018-10-13 00:30:53', NULL, '2018-10-13 00:30:53', NULL, 1);

-- --------------------------------------------------------

--
-- Stand-in structure for view `classtestresultview`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `classtestresultview`;
CREATE TABLE `classtestresultview` (
`teacherId` bigint(20)
,`classId` int(11)
,`divId` int(11)
,`testName` varchar(255)
,`totalAvg` double(19,2)
);

-- --------------------------------------------------------

--
-- Table structure for table `days`
--

DROP TABLE IF EXISTS `days`;
CREATE TABLE `days` (
  `id` int(11) NOT NULL,
  `dayName` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createdBy` bigint(20) DEFAULT NULL,
  `updatedAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedBy` bigint(20) DEFAULT NULL,
  `active` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `days`
--

INSERT INTO `days` (`id`, `dayName`, `createdAt`, `createdBy`, `updatedAt`, `updatedBy`, `active`) VALUES
(1, 'Monday', '2018-09-24 10:17:50', NULL, '2018-09-24 10:17:50', NULL, 1),
(2, 'Tuesday', '2018-09-24 10:17:50', NULL, '2018-09-24 10:17:50', NULL, 1),
(3, 'Wednesday', '2018-09-24 10:17:50', NULL, '2018-09-24 10:17:50', NULL, 1),
(4, 'Thursday', '2018-09-24 10:17:50', NULL, '2018-09-24 10:17:50', NULL, 1),
(5, 'Friday', '2018-09-24 10:17:50', NULL, '2018-09-24 10:17:50', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `division`
--

DROP TABLE IF EXISTS `division`;
CREATE TABLE `division` (
  `id` int(11) NOT NULL,
  `divName` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createdBy` bigint(20) DEFAULT NULL,
  `updatedAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedBy` bigint(20) DEFAULT NULL,
  `active` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `division`
--

INSERT INTO `division` (`id`, `divName`, `createdAt`, `createdBy`, `updatedAt`, `updatedBy`, `active`) VALUES
(1, 'A', '2018-09-13 13:21:22', NULL, '2018-09-13 13:21:22', NULL, 1),
(2, 'B', '2018-09-13 13:21:22', NULL, '2019-04-23 08:04:13', NULL, 1),
(3, 'C', '2019-04-23 08:04:20', NULL, '2019-04-23 08:04:20', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `finalresult`
--

DROP TABLE IF EXISTS `finalresult`;
CREATE TABLE `finalresult` (
  `id` bigint(20) NOT NULL,
  `studentId` bigint(20) DEFAULT NULL,
  `classId` int(11) DEFAULT NULL,
  `divId` int(11) DEFAULT NULL,
  `subId` int(11) DEFAULT NULL,
  `getMarks` int(11) DEFAULT NULL,
  `totalMarks` int(11) DEFAULT NULL,
  `resultDate` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createdBy` bigint(20) DEFAULT NULL,
  `updatedAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedBy` bigint(20) DEFAULT NULL,
  `active` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `holidays`
--

DROP TABLE IF EXISTS `holidays`;
CREATE TABLE `holidays` (
  `id` int(20) NOT NULL,
  `holidayDate` date NOT NULL,
  `createdAt` datetime DEFAULT NULL,
  `createdBy` int(20) DEFAULT NULL,
  `updatedAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedBy` int(20) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `holidays`
--

INSERT INTO `holidays` (`id`, `holidayDate`, `createdAt`, `createdBy`, `updatedAt`, `updatedBy`, `active`) VALUES
(1, '2019-04-25', '2019-04-24 00:00:00', 0, '2019-04-23 11:59:50', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `messageportal`
--

DROP TABLE IF EXISTS `messageportal`;
CREATE TABLE `messageportal` (
  `id` bigint(20) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  `parentId` bigint(20) DEFAULT NULL,
  `studentId` bigint(20) DEFAULT NULL,
  `messageType` int(11) DEFAULT NULL,
  `messageFrom` int(11) DEFAULT NULL,
  `messageText` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createdBy` bigint(20) DEFAULT NULL,
  `updatedAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedBy` bigint(20) DEFAULT NULL,
  `active` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `parentuser`
--

DROP TABLE IF EXISTS `parentuser`;
CREATE TABLE `parentuser` (
  `id` bigint(20) NOT NULL,
  `parentName` varchar(255) DEFAULT NULL,
  `parentMobileNumber` int(11) DEFAULT NULL,
  `parentPwd` varchar(255) DEFAULT NULL,
  `studentIds` varchar(255) DEFAULT NULL,
  `parentDevice` varchar(255) DEFAULT NULL,
  `parentDeviceVerify` int(11) DEFAULT NULL,
  `activeDevice` int(11) DEFAULT NULL,
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createdBy` bigint(20) DEFAULT NULL,
  `updatedAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedBy` bigint(20) DEFAULT NULL,
  `active` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `schoolprofile`
--

DROP TABLE IF EXISTS `schoolprofile`;
CREATE TABLE `schoolprofile` (
  `id` int(10) NOT NULL,
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
  `createdBy` int(20) DEFAULT NULL,
  `updatedAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedBy` int(20) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `schoolprofile`
--

INSERT INTO `schoolprofile` (`id`, `schoolName`, `schoolAddress`, `contactNo1`, `contactNo2`, `emailId`, `website`, `regNo`, `schoolStartDate`, `schoolEndDate`, `createdAt`, `createdBy`, `updatedAt`, `updatedBy`, `active`) VALUES
(1, 'M J School', 'At POst:pimpri kh, Tal-Dharangaon, Dist:Jalgaon, Pin-425105', '7588646203', '7588646201', 'dheerajmalu@ymail.com', 'www.mjs.com', '23423fsdr53', '2018-07-17 00:00:00', '2019-06-30 00:00:00', '0000-00-00 00:00:00', 0, '2019-02-22 23:50:57', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `sequelizemeta`
--

DROP TABLE IF EXISTS `sequelizemeta`;
CREATE TABLE `sequelizemeta` (
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sequelizemeta`
--

INSERT INTO `sequelizemeta` (`name`) VALUES
('201800113232323-create-attendance.js'),
('201800113232323-create-classteacher.js'),
('201800113232323-create-finalResult.js'),
('201800113232323-create-parentuser.js'),
('201800113232323-create-teacherSubject.js'),
('201800113232323-create-testMarks.js'),
('2018001132323233434343-create-messageportal.js'),
('20180116184149-create-user.js'),
('20180116184150-create-class.js'),
('20180116184150-create-days.js'),
('20180116184150-create-division.js'),
('20180116184150-create-state.js'),
('20180116184150-create-subject.js'),
('20180116184150-create-test.js'),
('20180116184151-create-city.js'),
('20180116184151-create-student.js'),
('20180116184151-create-teacher.js'),
('20180116184179-timetable.js'),
('20180901044400-create-todo.js');

-- --------------------------------------------------------

--
-- Table structure for table `state`
--

DROP TABLE IF EXISTS `state`;
CREATE TABLE `state` (
  `id` bigint(20) NOT NULL,
  `stateName` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createdBy` bigint(20) DEFAULT NULL,
  `updatedAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedBy` bigint(20) DEFAULT NULL,
  `active` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `state`
--

INSERT INTO `state` (`id`, `stateName`, `createdAt`, `createdBy`, `updatedAt`, `updatedBy`, `active`) VALUES
(1, 'Maharashtra', '2018-09-13 13:21:45', NULL, '2018-09-13 13:21:45', NULL, 1),
(2, 'Goa', '2018-09-13 13:21:45', NULL, '2018-09-13 13:21:45', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `id` bigint(20) NOT NULL,
  `firstName` varchar(255) DEFAULT NULL,
  `middleName` varchar(255) DEFAULT NULL,
  `lastName` varchar(255) DEFAULT NULL,
  `profileImage` varchar(255) DEFAULT NULL,
  `gender` int(11) DEFAULT NULL,
  `dateOfBirth` varchar(255) DEFAULT NULL,
  `classId` int(11) DEFAULT NULL,
  `divId` int(11) DEFAULT NULL,
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
  `cityId` bigint(20) DEFAULT NULL,
  `stateId` bigint(20) DEFAULT NULL,
  `pincode` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createdBy` bigint(20) DEFAULT NULL,
  `updatedAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedBy` bigint(20) DEFAULT NULL,
  `active` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`id`, `firstName`, `middleName`, `lastName`, `profileImage`, `gender`, `dateOfBirth`, `classId`, `divId`, `rollNo`, `motherName`, `motherQual`, `motherProf`, `fatherName`, `fatherQual`, `fatherProf`, `parentNumber`, `parentNumberSecond`, `nationality`, `religion`, `caste`, `bloodGroup`, `address`, `cityId`, `stateId`, `pincode`, `createdAt`, `createdBy`, `updatedAt`, `updatedBy`, `active`) VALUES
(1, 'dheeraj', 'j', 'malu', NULL, 1, '12-11-1990', 1, 1, '5', 'Sandhya', 'B.com', 'housewife', 'Jagdish', 'B.com', 'employee', '7588646203', '9860335008', 'Indian', 'maharashtra', 'Hindu', 'A+', 'at post:- pimpri kh. tal-dharangaon, jalgaon', 2, 1, NULL, '2018-09-13 13:36:13', NULL, '2019-06-08 18:34:14', NULL, 1),
(2, 'Pavan', 'j', 'Patil', NULL, 1, NULL, 1, 1, '6', NULL, NULL, NULL, 'suraj', NULL, NULL, '9860335008', NULL, NULL, NULL, NULL, NULL, NULL, 2, 1, NULL, '2018-09-13 13:36:13', NULL, '2018-09-13 13:36:13', NULL, 1),
(7, 'Darpan', 'j', 'Patel', NULL, 1, NULL, 1, 2, '1', 'shanti', NULL, 'housewife', 'ashok', NULL, 'working', '8989989989', '8988989889', 'Indian', 'maharashtra', 'hindi', 'A+', 'gujrat', NULL, 1, NULL, '2019-03-16 07:58:07', NULL, '2019-03-16 07:58:07', NULL, 1),
(8, 'Darpan', 'm', 'patil', NULL, 1, NULL, 2, 1, '1', 'shanti', NULL, 'housewife', 'ashok', NULL, 'working', '8989989989', '8988989889', 'Indian', 'maharashtra', 'hindi', 'A+', 'gujrat', NULL, 1, NULL, '2019-03-16 07:58:07', NULL, '2019-03-16 07:58:07', NULL, 1),
(9, 'visal', 'm', 'patil', NULL, 1, NULL, 2, 2, '1', 'shanti', NULL, 'housewife', 'ashok', NULL, 'working', '8989989989', '8988989889', 'Indian', 'maharashtra', 'hindi', 'A+', 'gujrat', NULL, 1, NULL, '2019-03-16 07:58:07', NULL, '2019-03-16 07:58:07', NULL, 1),
(10, 'naresh', 'm', 'patil', NULL, 1, NULL, 2, 1, '1', 'shanti', NULL, 'housewife', 'ashok', NULL, 'working', '8989989989', '8988989889', 'Indian', 'maharashtra', 'hindi', 'A+', 'gujrat', NULL, 1, NULL, '2019-03-16 07:58:07', NULL, '2019-03-16 07:58:07', NULL, 1),
(11, 'deepak', 'l', 'dubal', NULL, 1, '01/11/1990', 3, 1, NULL, 'sandhya', NULL, 'house wife', 'sanjay', NULL, 'service', '9877997111', '9988776655', 'indian', 'hindu', 'hindu', 'A+', 'gfgdfgdfgdf dfgdfgdfg dfgdfg', 1, 1, NULL, '2019-06-08 18:25:30', NULL, '2019-06-08 18:25:30', NULL, 1);

-- --------------------------------------------------------

--
-- Stand-in structure for view `studentlistview`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `studentlistview`;
CREATE TABLE `studentlistview` (
`id` bigint(20)
,`studentName` varchar(511)
,`classId` int(11)
,`className` varchar(255)
,`divId` int(11)
,`divName` varchar(255)
,`rollNo` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `studentmonthlyattendanceview`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `studentmonthlyattendanceview`;
CREATE TABLE `studentmonthlyattendanceview` (
`studentId` bigint(20)
,`studentName` varchar(511)
,`classId` int(11)
,`divId` int(11)
,`attendanceMonth` varchar(32)
,`monthAvg` decimal(26,2)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `studenttestresultview`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `studenttestresultview`;
CREATE TABLE `studenttestresultview` (
`studentId` bigint(20)
,`testId` bigint(20)
,`classId` int(11)
,`divId` int(11)
,`totalSubject` bigint(21)
,`profileImage` varchar(255)
,`studentName` varchar(511)
,`testName` varchar(255)
,`className` varchar(255)
,`subjectIds` text
,`divName` varchar(255)
,`totalAvg` double(19,2)
);

-- --------------------------------------------------------

--
-- Table structure for table `subject`
--

DROP TABLE IF EXISTS `subject`;
CREATE TABLE `subject` (
  `id` int(11) NOT NULL,
  `subName` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createdBy` bigint(20) DEFAULT NULL,
  `updatedAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedBy` bigint(20) DEFAULT NULL,
  `active` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `subject`
--

INSERT INTO `subject` (`id`, `subName`, `createdAt`, `createdBy`, `updatedAt`, `updatedBy`, `active`) VALUES
(1, 'Marathi', '2018-09-19 08:57:23', NULL, '2018-09-19 08:57:23', NULL, 1),
(2, 'Hindi', '2018-09-19 08:57:36', NULL, '2018-09-19 08:57:36', NULL, 1),
(3, 'English', '2018-09-19 08:57:48', NULL, '2018-09-19 08:57:48', NULL, 1),
(4, 'History', '2018-09-19 08:57:36', NULL, '2018-09-19 08:57:36', NULL, 1),
(5, 'Math', '2018-09-19 08:57:48', NULL, '2018-09-19 08:57:48', NULL, 1);

-- --------------------------------------------------------

--
-- Stand-in structure for view `subjectteacherview`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `subjectteacherview`;
CREATE TABLE `subjectteacherview` (
`id` int(11)
,`teacherId` bigint(20)
,`subId` int(11)
,`classId` int(11)
,`divId` int(11)
,`subName` varchar(255)
,`className` varchar(255)
,`divName` varchar(255)
,`teacherName` varchar(511)
,`mobileNumber` varchar(255)
);

-- --------------------------------------------------------

--
-- Table structure for table `teacher`
--

DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher` (
  `id` bigint(20) NOT NULL,
  `firstName` varchar(255) DEFAULT NULL,
  `middleName` varchar(255) DEFAULT NULL,
  `lastName` varchar(255) DEFAULT NULL,
  `profileImage` varchar(255) DEFAULT NULL,
  `gender` int(11) DEFAULT NULL,
  `bloodGroup` varchar(50) DEFAULT NULL,
  `dateOfBirth` varchar(255) DEFAULT NULL,
  `qualification` varchar(255) DEFAULT NULL,
  `experience` varchar(255) DEFAULT NULL,
  `nationality` varchar(50) DEFAULT NULL,
  `caste` varchar(50) DEFAULT NULL,
  `mobileNumber` varchar(255) DEFAULT NULL,
  `mobileNumberSecond` varchar(255) DEFAULT NULL,
  `address` text,
  `cityId` bigint(20) DEFAULT NULL,
  `stateId` bigint(20) DEFAULT NULL,
  `pincode` varchar(255) DEFAULT NULL,
  `joiningDate` varchar(255) DEFAULT NULL,
  `endDate` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createdBy` bigint(20) DEFAULT NULL,
  `updatedAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedBy` bigint(20) DEFAULT NULL,
  `active` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `teacher`
--

INSERT INTO `teacher` (`id`, `firstName`, `middleName`, `lastName`, `profileImage`, `gender`, `bloodGroup`, `dateOfBirth`, `qualification`, `experience`, `nationality`, `caste`, `mobileNumber`, `mobileNumberSecond`, `address`, `cityId`, `stateId`, `pincode`, `joiningDate`, `endDate`, `createdAt`, `createdBy`, `updatedAt`, `updatedBy`, `active`) VALUES
(1, 'Suredra', 'P', 'Sharma', NULL, 1, 'A-', '01/11/1990', 'MA', '3 years', 'Indian', 'open', '9860335008', '9860335008', 'dsfds', 1, 1, NULL, '12/12/2012', NULL, '2018-10-07 00:55:19', NULL, '2019-04-14 04:49:12', NULL, 1),
(2, 'Ashwin', 'P', 'Patil', NULL, 1, 'A+', '01/11/1990', 'MA', '3 years', 'Indian', 'Open', '9860335008', '8989898998', 'baner', 1, 1, '425001', '12/12/2012', NULL, '2018-10-07 00:55:19', NULL, '2019-03-16 11:47:54', NULL, 1),
(3, 'jyotsna', 'P', 'Patil', NULL, 1, NULL, '01/11/1990', 'MA', '3 years', NULL, NULL, '9860335008', NULL, NULL, 2, 1, '425001', '12/12/2012', NULL, '2018-10-07 00:55:19', NULL, '2018-10-07 00:55:19', NULL, 1),
(4, 'Hiten', 'P', 'Patil', NULL, 1, NULL, '01/11/1990', 'MA', '3 years', NULL, NULL, '9860335008', NULL, NULL, 2, 1, '425001', '12/12/2012', NULL, '2018-10-07 00:55:19', NULL, '2018-10-07 00:55:19', NULL, 1),
(5, 'Dheeraj', 'P', 'Patil', NULL, 1, NULL, '01/11/1990', 'MA', '3 years', NULL, NULL, '9860335008', NULL, NULL, 2, 1, '425001', '12/12/2012', NULL, '2018-10-07 00:55:19', NULL, '2018-10-07 00:55:19', NULL, 1),
(6, 'Suraj', 'P', 'Patil', NULL, 1, NULL, '01/11/1990', 'MA', '3 years', NULL, NULL, '9860335008', NULL, NULL, 2, 1, '425001', '12/12/2012', NULL, '2018-10-07 00:55:19', NULL, '2018-10-07 00:55:19', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `teachersubject`
--

DROP TABLE IF EXISTS `teachersubject`;
CREATE TABLE `teachersubject` (
  `id` int(11) NOT NULL,
  `teacherId` bigint(20) DEFAULT NULL,
  `subId` int(11) DEFAULT NULL,
  `classId` int(11) DEFAULT NULL,
  `divId` int(11) DEFAULT NULL,
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createdBy` bigint(20) DEFAULT NULL,
  `updatedAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedBy` bigint(20) DEFAULT NULL,
  `active` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `teachersubject`
--

INSERT INTO `teachersubject` (`id`, `teacherId`, `subId`, `classId`, `divId`, `createdAt`, `createdBy`, `updatedAt`, `updatedBy`, `active`) VALUES
(1, 1, 3, 1, 1, '2018-09-22 06:59:17', NULL, '2018-09-22 06:59:17', NULL, 1),
(2, 1, 2, 1, 2, '2018-09-22 06:59:37', NULL, '2018-09-22 06:59:37', NULL, 1),
(3, 1, 1, 1, 1, '2018-09-22 06:59:54', NULL, '2018-09-22 06:59:54', NULL, 1),
(4, 2, 4, 2, 2, '2018-09-22 06:59:54', NULL, '2018-09-22 06:59:54', NULL, 1),
(5, 1, 2, 1, 1, '2018-09-22 06:59:37', NULL, '2018-09-22 06:59:37', NULL, 1),
(6, 1, 1, 1, 2, '2018-09-22 06:59:54', NULL, '2018-09-22 06:59:54', NULL, 1),
(7, 1, 3, 1, 2, '2018-09-22 06:59:17', NULL, '2018-09-22 06:59:17', NULL, 1),
(8, 2, 4, 2, 1, '2018-09-22 06:59:54', NULL, '2018-09-22 06:59:54', NULL, 1),
(9, 2, 5, 2, 2, '2018-09-22 06:59:54', NULL, '2018-09-22 06:59:54', NULL, 1),
(10, 2, 2, 2, 2, '2018-09-22 06:59:54', NULL, '2018-09-22 06:59:54', NULL, 1);

-- --------------------------------------------------------

--
-- Stand-in structure for view `teachersubjectrecordview`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `teachersubjectrecordview`;
CREATE TABLE `teachersubjectrecordview` (
`classId` int(11)
,`divId` int(11)
,`subId` int(11)
,`testId` bigint(20)
,`teacherId` bigint(20)
,`testName` varchar(255)
,`className` varchar(255)
,`divName` varchar(255)
,`subName` varchar(255)
,`teacherName` varchar(511)
,`avgRecord` double
);

-- --------------------------------------------------------

--
-- Table structure for table `test`
--

DROP TABLE IF EXISTS `test`;
CREATE TABLE `test` (
  `id` bigint(20) NOT NULL,
  `testName` varchar(255) DEFAULT NULL,
  `testDate` datetime NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createdBy` bigint(20) DEFAULT NULL,
  `updatedAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedBy` bigint(20) DEFAULT NULL,
  `active` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `test`
--

INSERT INTO `test` (`id`, `testName`, `testDate`, `createdAt`, `createdBy`, `updatedAt`, `updatedBy`, `active`) VALUES
(1, 'test1', '2019-01-01 00:00:00', '2018-09-22 06:22:28', NULL, '2018-09-22 06:22:28', NULL, 1),
(2, 'test2', '2019-02-04 00:00:00', '2018-09-22 06:22:28', NULL, '2018-09-22 06:22:28', NULL, 1),
(3, 'test3', '2019-03-20 00:00:00', '2018-09-22 06:23:05', NULL, '2019-04-23 09:45:20', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `testmarks`
--

DROP TABLE IF EXISTS `testmarks`;
CREATE TABLE `testmarks` (
  `id` bigint(20) NOT NULL,
  `studentId` bigint(20) DEFAULT NULL,
  `teacherId` bigint(20) DEFAULT NULL,
  `classId` int(11) DEFAULT NULL,
  `divId` int(11) DEFAULT NULL,
  `testId` bigint(20) DEFAULT NULL,
  `subId` int(11) DEFAULT NULL,
  `getMarks` varchar(255) DEFAULT NULL,
  `totalMarks` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createdBy` bigint(20) DEFAULT NULL,
  `updatedAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedBy` bigint(20) DEFAULT NULL,
  `active` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `testmarks`
--

INSERT INTO `testmarks` (`id`, `studentId`, `teacherId`, `classId`, `divId`, `testId`, `subId`, `getMarks`, `totalMarks`, `createdAt`, `createdBy`, `updatedAt`, `updatedBy`, `active`) VALUES
(1, 1, 1, 1, 1, 1, 3, '91', '100', '2018-09-22 06:24:58', NULL, '2018-09-22 06:24:58', NULL, 1),
(2, 1, 1, 1, 1, 1, 2, '89', '100', '2018-09-22 06:24:58', NULL, '2018-09-22 06:24:58', NULL, 1),
(4, 1, 1, 1, 1, 2, 2, '84', '100', '2018-09-22 06:25:10', NULL, '2018-09-22 06:25:10', NULL, 1),
(5, 2, 1, 1, 1, 1, 3, '60', '100', '2018-09-22 06:24:58', NULL, '2018-09-22 06:24:58', NULL, 1),
(6, 2, 1, 1, 1, 1, 2, '98', '100', '2018-09-22 06:24:58', NULL, '2018-09-22 06:24:58', NULL, 1),
(7, 2, 1, 1, 1, 2, 3, '65', '100', '2018-09-22 06:25:10', NULL, '2018-09-22 06:25:10', NULL, 1),
(8, 1, 1, 1, 1, 1, 1, '89', '100', '2018-09-22 06:24:58', NULL, '2018-09-22 06:24:58', NULL, 1),
(9, 1, 1, 1, 1, 2, 1, '61', '100', '2018-09-22 06:25:10', NULL, '2018-09-22 06:25:10', NULL, 1),
(10, 2, 1, 1, 1, 1, 1, '99', '100', '2018-09-22 06:24:58', NULL, '2018-09-22 06:24:58', NULL, 1),
(11, 1, 1, 1, 1, 2, 3, '89', '100', '2018-09-22 06:24:58', NULL, '2018-09-22 06:24:58', NULL, 1),
(31, 8, 1, 2, 1, 3, 1, '99', '100', '2019-04-22 19:56:16', NULL, '2019-04-22 20:43:11', NULL, 1),
(32, 10, 1, 2, 1, 3, 1, '100', '100', '2019-04-22 19:56:16', NULL, '2019-04-22 20:43:11', NULL, 1),
(35, 9, NULL, 2, 2, 1, 4, '98', '100', '2019-04-22 21:16:44', NULL, '2019-04-22 21:16:44', NULL, 1),
(36, 9, NULL, 2, 2, 2, 4, '100', '100', '2019-04-22 21:17:39', NULL, '2019-04-22 21:17:39', NULL, 1),
(37, 7, 1, 1, 2, 1, 1, '80', '100', '2019-05-26 07:57:51', NULL, '2019-05-26 07:57:51', NULL, 1),
(38, 7, 1, 1, 2, 1, 3, '90', '100', '2019-05-26 07:58:11', NULL, '2019-05-26 07:58:11', NULL, 1),
(39, 7, 1, 1, 2, 1, 2, '90', '100', '2019-06-03 19:20:22', NULL, '2019-06-03 19:20:22', NULL, 1),
(40, 7, 1, 1, 2, 2, 2, '100', '100', '2019-06-03 19:22:28', NULL, '2019-06-03 19:22:28', NULL, 1),
(41, 7, 1, 1, 2, 2, 1, '99', '100', '2019-06-03 19:24:59', NULL, '2019-06-03 19:24:59', NULL, 1),
(42, 7, 1, 1, 2, 2, 3, '80', '100', '2019-06-03 19:25:13', NULL, '2019-06-03 19:25:13', NULL, 1),
(43, 2, 1, 1, 1, 2, 2, '75', '100', '2018-09-22 06:25:10', NULL, '2018-09-22 06:25:10', NULL, 1),
(44, 2, 1, 1, 1, 2, 1, '90', '100', '2018-09-22 06:25:10', NULL, '2018-09-22 06:25:10', NULL, 1);

-- --------------------------------------------------------

--
-- Stand-in structure for view `testmarkslistview`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `testmarkslistview`;
CREATE TABLE `testmarkslistview` (
`teacherId` bigint(20)
,`testId` bigint(20)
,`subId` int(11)
,`classId` int(11)
,`divId` int(11)
,`getMarks` varchar(255)
,`totalMarks` varchar(255)
,`testName` varchar(255)
,`className` varchar(255)
,`divName` varchar(255)
,`subName` varchar(255)
,`teacherName` varchar(511)
,`average` double
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `testmarkspendinglistview`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `testmarkspendinglistview`;
CREATE TABLE `testmarkspendinglistview` (
`testId` bigint(20)
,`classId` int(11)
,`divisionId` int(11)
,`subjectId` int(11)
,`testName` varchar(255)
,`className` varchar(255)
,`divName` varchar(255)
,`subName` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `testmarkspendingteacherlistview`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `testmarkspendingteacherlistview`;
CREATE TABLE `testmarkspendingteacherlistview` (
`testId` bigint(20)
,`classId` int(11)
,`divisionId` int(11)
,`subjectId` int(11)
,`testName` varchar(255)
,`className` varchar(255)
,`divName` varchar(255)
,`subName` varchar(255)
,`teacherId` bigint(20)
,`teacherName` varchar(511)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `testmarksview`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `testmarksview`;
CREATE TABLE `testmarksview` (
`id` bigint(20)
,`studentId` bigint(20)
,`teacherId` bigint(20)
,`testId` bigint(20)
,`subId` int(11)
,`classId` int(11)
,`divId` int(11)
,`getMarks` varchar(255)
,`totalMarks` varchar(255)
,`testName` varchar(255)
,`className` varchar(255)
,`divName` varchar(255)
,`subName` varchar(255)
,`teacherName` varchar(511)
,`studentName` varchar(511)
,`createdAt` datetime
,`updatedAt` datetime
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `testsubjectclassdivisionlistview`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `testsubjectclassdivisionlistview`;
CREATE TABLE `testsubjectclassdivisionlistview` (
`testId` bigint(20)
,`classId` int(11)
,`divisionId` int(11)
,`subjectId` int(11)
,`testName` varchar(255)
,`className` varchar(255)
,`divName` varchar(255)
,`subName` varchar(255)
);

-- --------------------------------------------------------

--
-- Table structure for table `timetable`
--

DROP TABLE IF EXISTS `timetable`;
CREATE TABLE `timetable` (
  `id` int(11) NOT NULL,
  `classId` int(11) DEFAULT NULL,
  `divId` int(11) DEFAULT NULL,
  `subId` int(11) DEFAULT NULL,
  `dayId` int(11) DEFAULT NULL,
  `timeSlot` varchar(255) DEFAULT NULL,
  `textData` text,
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createdBy` bigint(20) DEFAULT NULL,
  `updatedAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedBy` bigint(20) DEFAULT NULL,
  `active` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `timetable`
--

INSERT INTO `timetable` (`id`, `classId`, `divId`, `subId`, `dayId`, `timeSlot`, `textData`, `createdAt`, `createdBy`, `updatedAt`, `updatedBy`, `active`) VALUES
(1, 1, 1, 3, 1, '10:05-11:50', NULL, '2018-09-24 00:00:00', NULL, '2019-06-03 19:18:55', NULL, 1),
(2, 1, 2, 2, 1, '09:00-10:00', NULL, '2018-09-24 00:00:00', NULL, '2018-09-24 00:00:00', NULL, 1),
(3, 2, 2, 2, 1, '09:00-10:45', NULL, '2018-09-24 00:00:00', NULL, '2018-09-24 00:00:00', NULL, 1),
(4, 1, 1, 3, 2, '10:00-11:45', NULL, '2018-09-24 00:00:00', NULL, '2019-06-03 19:18:55', NULL, 1),
(5, 1, 2, 2, 2, '09:00-10:00', NULL, '2018-09-24 00:00:00', NULL, '2018-09-24 00:00:00', NULL, 1),
(6, 1, 1, 3, 3, '10:00-11:45', NULL, '2018-09-24 00:00:00', NULL, '2019-06-03 19:18:55', NULL, 1),
(7, 1, 2, 2, 3, '09:00-10:00', NULL, '2018-09-24 00:00:00', NULL, '2018-09-24 00:00:00', NULL, 1),
(8, 1, 1, 3, 4, '10:00-11:45', NULL, '2018-09-24 00:00:00', NULL, '2019-06-03 19:18:55', NULL, 1),
(9, 1, 2, 2, 4, '09:00-10:00', NULL, '2018-09-24 00:00:00', NULL, '2018-09-24 00:00:00', NULL, 1),
(10, 1, 1, 3, 5, '16:00-17:45', NULL, '2018-09-24 00:00:00', NULL, '2019-06-03 19:18:55', NULL, 1),
(11, 1, 2, 2, 5, '11:00-12:00', NULL, '2018-09-24 00:00:00', NULL, '2018-09-24 00:00:00', NULL, 1),
(12, 1, 1, NULL, 1, '12:00-13:45', NULL, '2018-09-24 00:00:00', NULL, '2019-06-03 19:18:55', NULL, 1),
(13, NULL, NULL, NULL, NULL, '10:00-10:00', NULL, '2019-05-01 18:14:20', NULL, '2019-05-01 18:14:20', NULL, 1),
(14, 1, 1, 1, NULL, '10:05-10:05', NULL, '2019-06-03 19:18:55', NULL, '2019-06-03 19:18:55', NULL, 1);

-- --------------------------------------------------------

--
-- Stand-in structure for view `timetabledetailview`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `timetabledetailview`;
CREATE TABLE `timetabledetailview` (
`id` int(11)
,`teacherId` bigint(20)
,`classId` int(11)
,`divId` int(11)
,`subId` int(11)
,`dayId` int(11)
,`timeSlot` varchar(255)
,`textData` text
,`updatedAt` datetime
,`className` varchar(255)
,`divName` varchar(255)
,`subName` varchar(255)
,`dayName` varchar(255)
,`teacherName` varchar(511)
);

-- --------------------------------------------------------

--
-- Table structure for table `todos`
--

DROP TABLE IF EXISTS `todos`;
CREATE TABLE `todos` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `first` varchar(255) DEFAULT NULL,
  `last` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `active` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first`, `last`, `email`, `phone`, `password`, `createdAt`, `updatedAt`, `active`) VALUES
(1, 'suraj', 'malu', 'surajmalu@ymail.com', '7588646201', '$2a$10$GUEiqZfR.1WlZn6SqaKN4.R83psL28FL/qgjxwH3w8iA1dK2Yb7o2', '2018-09-06 17:33:17', '2018-09-06 17:33:17', 1),
(3, 'suraj', 'malu', 'dheerajmalu@ymail.com', '7588646203', 'd9c59c1aa00818c948423d8d9f141f30', '2018-09-06 17:33:17', '2018-09-06 17:33:17', 1);

-- --------------------------------------------------------

--
-- Structure for view `absentstudentlistview`
--
DROP TABLE IF EXISTS `absentstudentlistview`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `absentstudentlistview`  AS  select `ab`.`id` AS `id`,`ab`.`studentId` AS `studentId`,`st`.`rollNo` AS `rollNo`,concat(`st`.`firstName`,' ',`st`.`lastName`) AS `studentName`,concat(`st`.`fatherName`,' ',`st`.`lastName`) AS `fatherName`,`st`.`parentNumber` AS `mobNumber`,`ab`.`classId` AS `classId`,`cl`.`className` AS `className`,`ab`.`divId` AS `divId`,`di`.`divName` AS `divName`,`ab`.`classTeacherId` AS `classTeacherId`,concat(`te`.`firstName`,' ',`st`.`lastName`) AS `teacherName`,`ab`.`attendanceDate` AS `attendanceDate`,`ab`.`attendanceResult` AS `attendanceResult` from ((((`attendance` `ab` left join `student` `st` on((`st`.`id` = `ab`.`studentId`))) left join `class` `cl` on((`cl`.`id` = `ab`.`classId`))) left join `division` `di` on((`di`.`id` = `ab`.`divId`))) left join `teacher` `te` on((`te`.`id` = `ab`.`classTeacherId`))) where ((`ab`.`active` = 1) and (`cl`.`active` = 1) and (`di`.`active` = 1) and (`st`.`active` = 1) and (`te`.`active` = 1) and (`ab`.`attendanceResult` = 0)) ;

-- --------------------------------------------------------

--
-- Structure for view `addattendancestudentlistview`
--
DROP TABLE IF EXISTS `addattendancestudentlistview`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `addattendancestudentlistview`  AS  select `st`.`id` AS `studentId`,concat(`st`.`firstName`,' ',`st`.`lastName`) AS `studentName`,`st`.`classId` AS `classId`,`st`.`divId` AS `divId`,`di`.`divName` AS `divName`,`cl`.`className` AS `className`,`st`.`rollNo` AS `rollNo`,(select `ct`.`teacherId` from `classteacher` `ct` where ((`ct`.`divId` = `st`.`divId`) and (`ct`.`classId` = `st`.`classId`) and (`ct`.`active` = 1))) AS `classTeacherId` from ((`student` `st` join `division` `di` on((`di`.`id` = `st`.`divId`))) join `class` `cl` on((`cl`.`id` = `st`.`classId`))) where (`st`.`active` = 1) ;

-- --------------------------------------------------------

--
-- Structure for view `attendancelistview`
--
DROP TABLE IF EXISTS `attendancelistview`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `attendancelistview`  AS  select `at`.`classId` AS `classId`,`at`.`divId` AS `divId`,`cl`.`className` AS `className`,`di`.`divName` AS `divName`,concat(`t`.`firstName`,' ',`t`.`lastName`) AS `teacherName`,`at`.`classTeacherId` AS `teacherId`,`at`.`attendanceDate` AS `selectedDate`,count((case when (`at`.`attendanceResult` = 1) then 1 end)) AS `totalPresent`,count(`at`.`id`) AS `total` from (((`attendance` `at` join `class` `cl` on((`cl`.`id` = `at`.`classId`))) join `division` `di` on((`di`.`id` = `at`.`divId`))) join `teacher` `t` on((`t`.`id` = `at`.`classTeacherId`))) group by `at`.`classId`,`at`.`divId`,`at`.`classTeacherId`,`at`.`attendanceDate` order by `at`.`attendanceDate` desc ;

-- --------------------------------------------------------

--
-- Structure for view `attendancemonthlist`
--
DROP TABLE IF EXISTS `attendancemonthlist`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `attendancemonthlist`  AS  select `cl`.`className` AS `className`,`di`.`divName` AS `divName`,`att`.`classId` AS `classId`,`att`.`divId` AS `divId`,date_format(`att`.`attendanceDate`,'%M-%Y') AS `AttendanceMonth` from ((`attendance` `att` join `class` `cl` on((`cl`.`id` = `att`.`classId`))) join `division` `di` on((`di`.`id` = `att`.`divId`))) group by date_format(`att`.`attendanceDate`,'%M-%Y'),`att`.`classId`,`att`.`divId` order by date_format(`att`.`attendanceDate`,'%M-%Y'),`att`.`classId`,`att`.`divId` ;

-- --------------------------------------------------------

--
-- Structure for view `classdivisionlistview`
--
DROP TABLE IF EXISTS `classdivisionlistview`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `classdivisionlistview`  AS  select `ct`.`id` AS `id`,`ct`.`classId` AS `classId`,`ct`.`divId` AS `divId`,`cl`.`className` AS `className`,`di`.`divName` AS `divName`,concat(`t`.`firstName`,' ',`t`.`lastName`) AS `teacherName`,`ct`.`teacherId` AS `teacherId` from (((`classteacher` `ct` join `class` `cl` on((`cl`.`id` = `ct`.`classId`))) join `division` `di` on((`di`.`id` = `ct`.`divId`))) join `teacher` `t` on((`t`.`id` = `ct`.`teacherId`))) where (`ct`.`active` = 1) ;

-- --------------------------------------------------------

--
-- Structure for view `classmonthlyattendanceview`
--
DROP TABLE IF EXISTS `classmonthlyattendanceview`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `classmonthlyattendanceview`  AS  select `ct`.`teacherId` AS `teacherId`,`ct`.`classId` AS `classId`,`ct`.`divId` AS `divId`,`atv`.`attendanceMonth` AS `attendanceMonth`,round((sum(`atv`.`monthAvg`) / count(`atv`.`monthAvg`)),2) AS `monthAvg` from (`studentmonthlyattendanceview` `atv` join `classteacher` `ct`) where ((`atv`.`classId` = `ct`.`classId`) and (`atv`.`divId` = `ct`.`divId`)) group by `atv`.`attendanceMonth` ;

-- --------------------------------------------------------

--
-- Structure for view `classtestresultview`
--
DROP TABLE IF EXISTS `classtestresultview`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `classtestresultview`  AS  select `ct`.`teacherId` AS `teacherId`,`ct`.`classId` AS `classId`,`ct`.`divId` AS `divId`,`strv`.`testName` AS `testName`,round((sum(`strv`.`totalAvg`) / count(`strv`.`totalAvg`)),2) AS `totalAvg` from (`studenttestresultview` `strv` join `classteacher` `ct`) where ((`strv`.`classId` = `ct`.`classId`) and (`strv`.`divId` = `ct`.`divId`)) group by `strv`.`testId` ;

-- --------------------------------------------------------

--
-- Structure for view `studentlistview`
--
DROP TABLE IF EXISTS `studentlistview`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `studentlistview`  AS  select `st`.`id` AS `id`,concat(`st`.`firstName`,' ',`st`.`lastName`) AS `studentName`,`st`.`classId` AS `classId`,`cl`.`className` AS `className`,`st`.`divId` AS `divId`,`di`.`divName` AS `divName`,`st`.`rollNo` AS `rollNo` from ((`student` `st` join `class` `cl` on((`cl`.`id` = `st`.`classId`))) join `division` `di` on((`di`.`id` = `st`.`divId`))) where (`st`.`active` <> 0) ;

-- --------------------------------------------------------

--
-- Structure for view `studentmonthlyattendanceview`
--
DROP TABLE IF EXISTS `studentmonthlyattendanceview`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `studentmonthlyattendanceview`  AS  select `att`.`studentId` AS `studentId`,concat(`st`.`firstName`,' ',`st`.`lastName`) AS `studentName`,`st`.`classId` AS `classId`,`st`.`divId` AS `divId`,date_format(`att`.`attendanceDate`,'%b') AS `attendanceMonth`,round((((select count(`at1`.`id`) from `attendance` `at1` where ((`at1`.`attendanceResult` <> 0) and (`at1`.`studentId` = `att`.`studentId`) and (date_format(`at1`.`attendanceDate`,'%b') = date_format(`att`.`attendanceDate`,'%b')))) / (select count(`at2`.`id`) from `attendance` `at2` where ((`at2`.`studentId` = `att`.`studentId`) and (date_format(`at2`.`attendanceDate`,'%b') = date_format(`att`.`attendanceDate`,'%b'))))) * 100),2) AS `monthAvg` from (`attendance` `att` join `student` `st` on((`st`.`id` = `att`.`studentId`))) group by date_format(`att`.`attendanceDate`,'%b'),`att`.`studentId` ;

-- --------------------------------------------------------

--
-- Structure for view `studenttestresultview`
--
DROP TABLE IF EXISTS `studenttestresultview`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `studenttestresultview`  AS  select `tm`.`studentId` AS `studentId`,`tm`.`testId` AS `testId`,`tm`.`classId` AS `classId`,`tm`.`divId` AS `divId`,count(`tm`.`subId`) AS `totalSubject`,`st`.`profileImage` AS `profileImage`,concat(`st`.`firstName`,' ',`st`.`lastName`) AS `studentName`,`t`.`testName` AS `testName`,`cl`.`className` AS `className`,`cl`.`subjectIds` AS `subjectIds`,`di`.`divName` AS `divName`,round(((sum(`tm`.`getMarks`) / sum(`tm`.`totalMarks`)) * 100),2) AS `totalAvg` from ((((`testmarks` `tm` join `student` `st` on((`st`.`id` = `tm`.`studentId`))) join `class` `cl` on((`cl`.`id` = `tm`.`classId`))) join `division` `di` on((`di`.`id` = `tm`.`divId`))) join `test` `t` on((`t`.`id` = `tm`.`testId`))) group by `tm`.`studentId`,`tm`.`testId`,`tm`.`classId`,`tm`.`divId` having (count(`tm`.`subId`) >= ((length(`cl`.`subjectIds`) - length(replace(`cl`.`subjectIds`,',',''))) + 1)) order by `tm`.`testId`,`tm`.`classId`,`tm`.`divId`,round(((sum(`tm`.`getMarks`) / sum(`tm`.`totalMarks`)) * 100),2) desc ;

-- --------------------------------------------------------

--
-- Structure for view `subjectteacherview`
--
DROP TABLE IF EXISTS `subjectteacherview`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `subjectteacherview`  AS  select `ts`.`id` AS `id`,`ts`.`teacherId` AS `teacherId`,`ts`.`subId` AS `subId`,`ts`.`classId` AS `classId`,`ts`.`divId` AS `divId`,`s`.`subName` AS `subName`,`c`.`className` AS `className`,`d`.`divName` AS `divName`,concat(`t`.`firstName`,' ',`t`.`lastName`) AS `teacherName`,`t`.`mobileNumber` AS `mobileNumber` from ((((`teachersubject` `ts` join `subject` `s` on((`s`.`id` = `ts`.`subId`))) join `class` `c` on((`c`.`id` = `ts`.`classId`))) join `division` `d` on((`d`.`id` = `ts`.`divId`))) join `teacher` `t` on((`t`.`id` = `ts`.`teacherId`))) ;

-- --------------------------------------------------------

--
-- Structure for view `teachersubjectrecordview`
--
DROP TABLE IF EXISTS `teachersubjectrecordview`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `teachersubjectrecordview`  AS  select `tmv`.`classId` AS `classId`,`tmv`.`divId` AS `divId`,`tmv`.`subId` AS `subId`,`tmv`.`testId` AS `testId`,`tmv`.`teacherId` AS `teacherId`,`tmv`.`testName` AS `testName`,`tmv`.`className` AS `className`,`tmv`.`divName` AS `divName`,`tmv`.`subName` AS `subName`,`tmv`.`teacherName` AS `teacherName`,((sum(`tmv`.`getMarks`) / sum(`tmv`.`totalMarks`)) * 100) AS `avgRecord` from `testmarksview` `tmv` where (`tmv`.`getMarks` <> '') group by `tmv`.`classId`,`tmv`.`divId`,`tmv`.`subId`,`tmv`.`testId` order by `tmv`.`classId`,`tmv`.`divId`,`tmv`.`subId`,`tmv`.`testId` ;

-- --------------------------------------------------------

--
-- Structure for view `testmarkslistview`
--
DROP TABLE IF EXISTS `testmarkslistview`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `testmarkslistview`  AS  select `testmarksview`.`teacherId` AS `teacherId`,`testmarksview`.`testId` AS `testId`,`testmarksview`.`subId` AS `subId`,`testmarksview`.`classId` AS `classId`,`testmarksview`.`divId` AS `divId`,`testmarksview`.`getMarks` AS `getMarks`,`testmarksview`.`totalMarks` AS `totalMarks`,`testmarksview`.`testName` AS `testName`,`testmarksview`.`className` AS `className`,`testmarksview`.`divName` AS `divName`,`testmarksview`.`subName` AS `subName`,`testmarksview`.`teacherName` AS `teacherName`,avg(`testmarksview`.`getMarks`) AS `average` from `testmarksview` group by `testmarksview`.`testId`,`testmarksview`.`classId`,`testmarksview`.`divId`,`testmarksview`.`subId` ;

-- --------------------------------------------------------

--
-- Structure for view `testmarkspendinglistview`
--
DROP TABLE IF EXISTS `testmarkspendinglistview`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `testmarkspendinglistview`  AS  select `te`.`id` AS `testId`,`cl`.`id` AS `classId`,`di`.`id` AS `divisionId`,`sub`.`id` AS `subjectId`,`te`.`testName` AS `testName`,`cl`.`className` AS `className`,`di`.`divName` AS `divName`,`sub`.`subName` AS `subName` from (((`class` `cl` join `subject` `sub`) join `test` `te`) join `division` `di`) where (find_in_set(`sub`.`id`,`cl`.`subjectIds`) and find_in_set(`te`.`id`,`cl`.`testIds`) and (`cl`.`active` = 1) and (`sub`.`active` = 1) and (`te`.`active` = 1) and (`di`.`active` = 1) and (not(exists(select 1 from `testmarks` `tm` where ((`tm`.`testId` = `te`.`id`) and (`tm`.`classId` = `cl`.`id`) and (`tm`.`divId` = `di`.`id`) and (`tm`.`subId` = `sub`.`id`)))))) order by `te`.`id`,`cl`.`id`,`di`.`id`,`sub`.`id` ;

-- --------------------------------------------------------

--
-- Structure for view `testmarkspendingteacherlistview`
--
DROP TABLE IF EXISTS `testmarkspendingteacherlistview`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `testmarkspendingteacherlistview`  AS  select `tm`.`testId` AS `testId`,`tm`.`classId` AS `classId`,`tm`.`divisionId` AS `divisionId`,`tm`.`subjectId` AS `subjectId`,`tm`.`testName` AS `testName`,`tm`.`className` AS `className`,`tm`.`divName` AS `divName`,`tm`.`subName` AS `subName`,`ts`.`teacherId` AS `teacherId`,concat(`t`.`firstName`,' ',`t`.`lastName`) AS `teacherName` from ((`testmarkspendinglistview` `tm` join `teachersubject` `ts`) join `teacher` `t`) where ((`tm`.`classId` = `ts`.`classId`) and (`tm`.`divisionId` = `ts`.`divId`) and (`tm`.`subjectId` = `ts`.`subId`) and (`ts`.`teacherId` = `t`.`id`)) ;

-- --------------------------------------------------------

--
-- Structure for view `testmarksview`
--
DROP TABLE IF EXISTS `testmarksview`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `testmarksview`  AS  select `tm`.`id` AS `id`,`tm`.`studentId` AS `studentId`,`tm`.`teacherId` AS `teacherId`,`tm`.`testId` AS `testId`,`tm`.`subId` AS `subId`,`tm`.`classId` AS `classId`,`tm`.`divId` AS `divId`,`tm`.`getMarks` AS `getMarks`,`tm`.`totalMarks` AS `totalMarks`,`t`.`testName` AS `testName`,`cl`.`className` AS `className`,`di`.`divName` AS `divName`,`s`.`subName` AS `subName`,concat(`te`.`firstName`,' ',`te`.`lastName`) AS `teacherName`,concat(`st`.`firstName`,' ',`st`.`lastName`) AS `studentName`,`tm`.`createdAt` AS `createdAt`,`tm`.`updatedAt` AS `updatedAt` from ((((((`testmarks` `tm` join `test` `t` on((`t`.`id` = `tm`.`testId`))) join `subject` `s` on((`s`.`id` = `tm`.`subId`))) join `teacher` `te` on((`te`.`id` = `tm`.`teacherId`))) join `student` `st` on((`st`.`id` = `tm`.`studentId`))) join `class` `cl` on((`cl`.`id` = `tm`.`classId`))) join `division` `di` on((`di`.`id` = `tm`.`divId`))) ;

-- --------------------------------------------------------

--
-- Structure for view `testsubjectclassdivisionlistview`
--
DROP TABLE IF EXISTS `testsubjectclassdivisionlistview`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `testsubjectclassdivisionlistview`  AS  select `te`.`id` AS `testId`,`cl`.`id` AS `classId`,`di`.`id` AS `divisionId`,`sub`.`id` AS `subjectId`,`te`.`testName` AS `testName`,`cl`.`className` AS `className`,`di`.`divName` AS `divName`,`sub`.`subName` AS `subName` from (((`class` `cl` join `subject` `sub`) join `test` `te`) join `division` `di`) where (find_in_set(`sub`.`id`,`cl`.`subjectIds`) and find_in_set(`te`.`id`,`cl`.`testIds`) and (`cl`.`active` = 1) and (`sub`.`active` = 1) and (`te`.`active` = 1) and (`di`.`active` <> 0)) order by `te`.`id`,`cl`.`id`,`di`.`id`,`sub`.`id` ;

-- --------------------------------------------------------

--
-- Structure for view `timetabledetailview`
--
DROP TABLE IF EXISTS `timetabledetailview`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `timetabledetailview`  AS  select `tt`.`id` AS `id`,`ts`.`teacherId` AS `teacherId`,`tt`.`classId` AS `classId`,`tt`.`divId` AS `divId`,`tt`.`subId` AS `subId`,`tt`.`dayId` AS `dayId`,`tt`.`timeSlot` AS `timeSlot`,`tt`.`textData` AS `textData`,`tt`.`updatedAt` AS `updatedAt`,`cl`.`className` AS `className`,`di`.`divName` AS `divName`,`su`.`subName` AS `subName`,`da`.`dayName` AS `dayName`,concat(`t`.`firstName`,' ',`t`.`lastName`) AS `teacherName` from ((((((`timetable` `tt` join `class` `cl` on((`cl`.`id` = `tt`.`classId`))) join `division` `di` on((`di`.`id` = `tt`.`divId`))) left join `subject` `su` on((`su`.`id` = `tt`.`subId`))) join `days` `da` on((`da`.`id` = `tt`.`dayId`))) left join `teachersubject` `ts` on(((`ts`.`subId` = `tt`.`subId`) and (`ts`.`classId` = `tt`.`classId`) and (`ts`.`divId` = `tt`.`divId`)))) left join `teacher` `t` on((`t`.`id` = `ts`.`teacherId`))) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `attendance`
--
ALTER TABLE `attendance`
  ADD PRIMARY KEY (`id`),
  ADD KEY `attendance_ibfk_2` (`classId`),
  ADD KEY `attendance_ibfk_3` (`divId`),
  ADD KEY `attendance_ibfk_1` (`studentId`),
  ADD KEY `attendance_ibfk_4` (`classTeacherId`);

--
-- Indexes for table `city`
--
ALTER TABLE `city`
  ADD PRIMARY KEY (`id`),
  ADD KEY `stateId` (`stateId`);

--
-- Indexes for table `class`
--
ALTER TABLE `class`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `classteacher`
--
ALTER TABLE `classteacher`
  ADD PRIMARY KEY (`id`),
  ADD KEY `classteacher_ibfk_1` (`teacherId`),
  ADD KEY `classteacher_ibfk_2` (`classId`),
  ADD KEY `classteacher_ibfk_3` (`divId`);

--
-- Indexes for table `days`
--
ALTER TABLE `days`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `division`
--
ALTER TABLE `division`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `finalresult`
--
ALTER TABLE `finalresult`
  ADD PRIMARY KEY (`id`),
  ADD KEY `finalresult_ibfk_1` (`studentId`),
  ADD KEY `finalresult_ibfk_2` (`classId`),
  ADD KEY `finalresult_ibfk_3` (`divId`),
  ADD KEY `finalresult_ibfk_4` (`subId`);

--
-- Indexes for table `holidays`
--
ALTER TABLE `holidays`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `messageportal`
--
ALTER TABLE `messageportal`
  ADD PRIMARY KEY (`id`),
  ADD KEY `messageportal_ibfk_1` (`userId`),
  ADD KEY `messageportal_ibfk_2` (`parentId`),
  ADD KEY `messageportal_ibfk_3` (`studentId`);

--
-- Indexes for table `parentuser`
--
ALTER TABLE `parentuser`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `schoolprofile`
--
ALTER TABLE `schoolprofile`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sequelizemeta`
--
ALTER TABLE `sequelizemeta`
  ADD PRIMARY KEY (`name`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `state`
--
ALTER TABLE `state`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_ibfk_1` (`classId`),
  ADD KEY `student_ibfk_2` (`divId`),
  ADD KEY `student_ibfk_3` (`cityId`),
  ADD KEY `student_ibfk_4` (`stateId`);

--
-- Indexes for table `subject`
--
ALTER TABLE `subject`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `teacher`
--
ALTER TABLE `teacher`
  ADD PRIMARY KEY (`id`),
  ADD KEY `teacher_ibfk_1` (`cityId`),
  ADD KEY `teacher_ibfk_2` (`stateId`);

--
-- Indexes for table `teachersubject`
--
ALTER TABLE `teachersubject`
  ADD PRIMARY KEY (`id`),
  ADD KEY `teachersubject_ibfk_1` (`teacherId`),
  ADD KEY `teachersubject_ibfk_2` (`subId`),
  ADD KEY `teachersubject_ibfk_3` (`classId`),
  ADD KEY `teachersubject_ibfk_4` (`divId`);

--
-- Indexes for table `test`
--
ALTER TABLE `test`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `testmarks`
--
ALTER TABLE `testmarks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `studentId` (`studentId`),
  ADD KEY `classId` (`classId`),
  ADD KEY `divId` (`divId`),
  ADD KEY `testId` (`testId`),
  ADD KEY `subId` (`subId`),
  ADD KEY `testmarks_ibfk_2` (`teacherId`);

--
-- Indexes for table `timetable`
--
ALTER TABLE `timetable`
  ADD PRIMARY KEY (`id`),
  ADD KEY `timetable_ibfk_1` (`classId`),
  ADD KEY `timetable_ibfk_2` (`divId`),
  ADD KEY `timetable_ibfk_3` (`subId`),
  ADD KEY `timetable_ibfk_4` (`dayId`);

--
-- Indexes for table `todos`
--
ALTER TABLE `todos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `phone` (`phone`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `attendance`
--
ALTER TABLE `attendance`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT for table `city`
--
ALTER TABLE `city`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `class`
--
ALTER TABLE `class`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `classteacher`
--
ALTER TABLE `classteacher`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `days`
--
ALTER TABLE `days`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `division`
--
ALTER TABLE `division`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `finalresult`
--
ALTER TABLE `finalresult`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `holidays`
--
ALTER TABLE `holidays`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `messageportal`
--
ALTER TABLE `messageportal`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `parentuser`
--
ALTER TABLE `parentuser`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `schoolprofile`
--
ALTER TABLE `schoolprofile`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `state`
--
ALTER TABLE `state`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `student`
--
ALTER TABLE `student`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `subject`
--
ALTER TABLE `subject`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `teacher`
--
ALTER TABLE `teacher`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `teachersubject`
--
ALTER TABLE `teachersubject`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `test`
--
ALTER TABLE `test`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `testmarks`
--
ALTER TABLE `testmarks`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `timetable`
--
ALTER TABLE `timetable`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `todos`
--
ALTER TABLE `todos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `attendance`
--
ALTER TABLE `attendance`
  ADD CONSTRAINT `attendance_ibfk_1` FOREIGN KEY (`studentId`) REFERENCES `student` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `attendance_ibfk_2` FOREIGN KEY (`classId`) REFERENCES `class` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `attendance_ibfk_3` FOREIGN KEY (`divId`) REFERENCES `division` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `attendance_ibfk_4` FOREIGN KEY (`classTeacherId`) REFERENCES `teacher` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `city`
--
ALTER TABLE `city`
  ADD CONSTRAINT `city_ibfk_1` FOREIGN KEY (`stateId`) REFERENCES `state` (`id`);

--
-- Constraints for table `classteacher`
--
ALTER TABLE `classteacher`
  ADD CONSTRAINT `classteacher_ibfk_1` FOREIGN KEY (`teacherId`) REFERENCES `teacher` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `classteacher_ibfk_2` FOREIGN KEY (`classId`) REFERENCES `class` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `classteacher_ibfk_3` FOREIGN KEY (`divId`) REFERENCES `division` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `finalresult`
--
ALTER TABLE `finalresult`
  ADD CONSTRAINT `finalresult_ibfk_1` FOREIGN KEY (`studentId`) REFERENCES `student` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `finalresult_ibfk_2` FOREIGN KEY (`classId`) REFERENCES `class` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `finalresult_ibfk_3` FOREIGN KEY (`divId`) REFERENCES `division` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `finalresult_ibfk_4` FOREIGN KEY (`subId`) REFERENCES `subject` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `messageportal`
--
ALTER TABLE `messageportal`
  ADD CONSTRAINT `messageportal_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `messageportal_ibfk_2` FOREIGN KEY (`parentId`) REFERENCES `parentuser` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `messageportal_ibfk_3` FOREIGN KEY (`studentId`) REFERENCES `student` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `student`
--
ALTER TABLE `student`
  ADD CONSTRAINT `student_ibfk_1` FOREIGN KEY (`classId`) REFERENCES `class` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `student_ibfk_2` FOREIGN KEY (`divId`) REFERENCES `division` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `student_ibfk_3` FOREIGN KEY (`cityId`) REFERENCES `city` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `student_ibfk_4` FOREIGN KEY (`stateId`) REFERENCES `state` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `teacher`
--
ALTER TABLE `teacher`
  ADD CONSTRAINT `teacher_ibfk_1` FOREIGN KEY (`cityId`) REFERENCES `city` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `teacher_ibfk_2` FOREIGN KEY (`stateId`) REFERENCES `state` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `teachersubject`
--
ALTER TABLE `teachersubject`
  ADD CONSTRAINT `teachersubject_ibfk_1` FOREIGN KEY (`teacherId`) REFERENCES `teacher` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `teachersubject_ibfk_2` FOREIGN KEY (`subId`) REFERENCES `subject` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `teachersubject_ibfk_3` FOREIGN KEY (`classId`) REFERENCES `class` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `teachersubject_ibfk_4` FOREIGN KEY (`divId`) REFERENCES `division` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `testmarks`
--
ALTER TABLE `testmarks`
  ADD CONSTRAINT `testmarks_ibfk_1` FOREIGN KEY (`studentId`) REFERENCES `student` (`id`),
  ADD CONSTRAINT `testmarks_ibfk_2` FOREIGN KEY (`teacherId`) REFERENCES `teacher` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  ADD CONSTRAINT `testmarks_ibfk_3` FOREIGN KEY (`classId`) REFERENCES `class` (`id`),
  ADD CONSTRAINT `testmarks_ibfk_4` FOREIGN KEY (`divId`) REFERENCES `division` (`id`),
  ADD CONSTRAINT `testmarks_ibfk_5` FOREIGN KEY (`testId`) REFERENCES `test` (`id`),
  ADD CONSTRAINT `testmarks_ibfk_6` FOREIGN KEY (`subId`) REFERENCES `subject` (`id`);

--
-- Constraints for table `timetable`
--
ALTER TABLE `timetable`
  ADD CONSTRAINT `timetable_ibfk_1` FOREIGN KEY (`classId`) REFERENCES `class` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `timetable_ibfk_2` FOREIGN KEY (`divId`) REFERENCES `division` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `timetable_ibfk_3` FOREIGN KEY (`subId`) REFERENCES `subject` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `timetable_ibfk_4` FOREIGN KEY (`dayId`) REFERENCES `days` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
