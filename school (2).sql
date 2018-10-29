-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 29, 2018 at 04:13 AM
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

-- --------------------------------------------------------

--
-- Table structure for table `attendance`
--

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
(1, 1, 1, 1, 1, '2018-10-01', 1, '2018-10-07 09:57:56', NULL, '2018-10-07 09:57:56', NULL, 1),
(2, 1, 1, 1, 1, '2018-10-02', 1, '2018-10-07 09:57:56', NULL, '2018-10-07 09:57:56', NULL, 1),
(3, 1, 1, 1, 1, '2018-09-26', 1, '2018-10-07 09:58:40', NULL, '2018-10-07 09:58:40', NULL, 1),
(4, 1, 1, 1, 1, '2018-09-27', 1, '2018-10-07 09:58:40', NULL, '2018-10-07 09:58:40', NULL, 1),
(5, 1, 1, 1, 1, '2018-09-28', 0, '2018-10-07 09:58:40', NULL, '2018-10-07 09:58:40', NULL, 1),
(6, 1, 1, 1, 1, '2018-09-24', 0, '2018-10-07 09:58:40', NULL, '2018-10-07 09:58:40', NULL, 1),
(7, 1, 1, 1, 1, '2018-10-08', 0, '2018-10-07 09:58:40', NULL, '2018-10-07 09:58:40', NULL, 1),
(8, 1, 1, 1, 1, '2018-10-03', 1, '2018-10-07 09:57:56', NULL, '2018-10-07 09:57:56', NULL, 1),
(9, 1, 1, 1, 1, '2018-09-25', 1, '2018-10-07 09:58:40', NULL, '2018-10-07 09:58:40', NULL, 1),
(10, 2, 1, 1, 1, '2018-09-24', 0, '2018-10-07 09:58:40', NULL, '2018-10-07 09:58:40', NULL, 1),
(11, 2, 1, 1, 1, '2018-09-25', 1, '2018-10-07 09:58:40', NULL, '2018-10-07 09:58:40', NULL, 1),
(12, 2, 1, 1, 1, '2018-09-25', 1, '2018-10-07 09:58:40', NULL, '2018-10-07 09:58:40', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `city`
--

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
(1, '1', NULL, NULL, '2018-09-13 13:21:09', NULL, '2018-09-13 13:21:09', NULL, 1),
(2, '2', NULL, NULL, '2018-09-13 13:21:09', NULL, '2018-09-13 13:21:09', NULL, 1);

-- --------------------------------------------------------

--
-- Stand-in structure for view `classmonthlyattendanceview`
-- (See below for the actual view)
--
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
(1, 1, 1, 1, '2018-10-13 00:30:53', NULL, '2018-10-13 00:30:53', NULL, 1);

-- --------------------------------------------------------

--
-- Stand-in structure for view `classtestresultview`
-- (See below for the actual view)
--
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
(2, 'Tuesday', '2018-09-24 10:17:50', NULL, '2018-09-24 10:17:50', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `division`
--

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
(2, 'B', '2018-09-13 13:21:22', NULL, '2018-09-13 13:21:22', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `finalresult`
--

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
-- Table structure for table `messageportal`
--

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
-- Table structure for table `sequelizemeta`
--

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

INSERT INTO `student` (`id`, `firstName`, `middleName`, `lastName`, `profileImage`, `gender`, `dateOfBirth`, `classId`, `divId`, `rollNo`, `motherName`, `motherQual`, `motherProf`, `fatherName`, `fatherQual`, `fatherProf`, `parentNumber`, `parentNumberSecond`, `address`, `cityId`, `stateId`, `pincode`, `createdAt`, `createdBy`, `updatedAt`, `updatedBy`, `active`) VALUES
(1, 'dheeraj', 'j', 'malu', NULL, NULL, '12-11-1990', 1, 1, '5', 'Sandhya', 'B.com', NULL, 'Jagdish', 'B.com', NULL, '7588646203', '9860335008', 'at post:- pimpri kh. tal-dharangaon, jalgaon', 2, 1, NULL, '2018-09-13 13:36:13', NULL, '2018-09-13 13:36:13', NULL, 1),
(2, 'Pavan', 'j', 'Patil', NULL, NULL, NULL, 1, 1, '5', NULL, NULL, NULL, 'suraj', NULL, NULL, '9860335008', NULL, NULL, 2, 1, NULL, '2018-09-13 13:36:13', NULL, '2018-09-13 13:36:13', NULL, 1);

-- --------------------------------------------------------

--
-- Stand-in structure for view `studentmonthlyattendanceview`
-- (See below for the actual view)
--
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
CREATE TABLE `studenttestresultview` (
`studentId` bigint(20)
,`testId` bigint(20)
,`classId` int(11)
,`divId` int(11)
,`totalSubject` bigint(21)
,`testName` varchar(255)
,`className` varchar(255)
,`divName` varchar(255)
,`totalAvg` double(19,2)
);

-- --------------------------------------------------------

--
-- Table structure for table `subject`
--

CREATE TABLE `subject` (
  `id` int(11) NOT NULL,
  `subName` varchar(255) DEFAULT NULL,
  `classId` int(11) DEFAULT NULL,
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createdBy` bigint(20) DEFAULT NULL,
  `updatedAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedBy` bigint(20) DEFAULT NULL,
  `active` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `subject`
--

INSERT INTO `subject` (`id`, `subName`, `classId`, `createdAt`, `createdBy`, `updatedAt`, `updatedBy`, `active`) VALUES
(1, 'Marathi', 1, '2018-09-19 08:57:23', NULL, '2018-09-19 08:57:23', NULL, 1),
(2, 'Hindi', 1, '2018-09-19 08:57:36', NULL, '2018-09-19 08:57:36', NULL, 1),
(3, 'English', 1, '2018-09-19 08:57:48', NULL, '2018-09-19 08:57:48', NULL, 1),
(4, 'Hindi', 2, '2018-09-19 08:57:36', NULL, '2018-09-19 08:57:36', NULL, 1),
(5, 'English', 2, '2018-09-19 08:57:48', NULL, '2018-09-19 08:57:48', NULL, 1);

-- --------------------------------------------------------

--
-- Stand-in structure for view `subjectteacherview`
-- (See below for the actual view)
--
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

CREATE TABLE `teacher` (
  `id` bigint(20) NOT NULL,
  `firstName` varchar(255) DEFAULT NULL,
  `middleName` varchar(255) DEFAULT NULL,
  `lastName` varchar(255) DEFAULT NULL,
  `profileImage` varchar(255) DEFAULT NULL,
  `gender` int(11) DEFAULT NULL,
  `dateOfBirth` varchar(255) DEFAULT NULL,
  `qualification` varchar(255) DEFAULT NULL,
  `experience` varchar(255) DEFAULT NULL,
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

INSERT INTO `teacher` (`id`, `firstName`, `middleName`, `lastName`, `profileImage`, `gender`, `dateOfBirth`, `qualification`, `experience`, `mobileNumber`, `mobileNumberSecond`, `address`, `cityId`, `stateId`, `pincode`, `joiningDate`, `endDate`, `createdAt`, `createdBy`, `updatedAt`, `updatedBy`, `active`) VALUES
(1, 'Suredra', 'P', 'Sharma', NULL, 1, NULL, 'MA', '3 years', '9860335008', NULL, NULL, 2, 1, NULL, NULL, NULL, '2018-10-07 00:55:19', NULL, '2018-10-07 00:55:19', NULL, 1),
(2, 'Ashwin', 'P', 'Patil', NULL, 1, '01/11/1990', 'MA', '3 years', '9860335008', NULL, NULL, 2, 1, '425001', '12/12/2012', NULL, '2018-10-07 00:55:19', NULL, '2018-10-07 00:55:19', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `teachersubject`
--

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
(3, 2, 1, 1, 1, '2018-09-22 06:59:54', NULL, '2018-09-22 06:59:54', NULL, 1),
(4, 2, 2, 2, 2, '2018-09-22 06:59:54', NULL, '2018-09-22 06:59:54', NULL, 1);

-- --------------------------------------------------------

--
-- Stand-in structure for view `teachersubjectrecordview`
-- (See below for the actual view)
--
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

CREATE TABLE `test` (
  `id` bigint(20) NOT NULL,
  `testName` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createdBy` bigint(20) DEFAULT NULL,
  `updatedAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedBy` bigint(20) DEFAULT NULL,
  `active` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `test`
--

INSERT INTO `test` (`id`, `testName`, `createdAt`, `createdBy`, `updatedAt`, `updatedBy`, `active`) VALUES
(1, 'test1', '2018-09-22 06:22:28', NULL, '2018-09-22 06:22:28', NULL, 1),
(2, 'test2', '2018-09-22 06:22:28', NULL, '2018-09-22 06:22:28', NULL, 1),
(3, 'test11', '2018-09-22 06:23:05', NULL, '2018-09-22 06:23:05', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `testmarks`
--

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
(3, 1, 1, 1, 1, 2, 3, '90', '100', '2018-09-22 06:25:10', NULL, '2018-09-22 06:25:10', NULL, 1),
(4, 1, 1, 1, 1, 2, 2, '84', '100', '2018-09-22 06:25:10', NULL, '2018-09-22 06:25:10', NULL, 1),
(5, 2, 1, 1, 1, 1, 3, '60', '100', '2018-09-22 06:24:58', NULL, '2018-09-22 06:24:58', NULL, 1),
(6, 2, 1, 1, 1, 1, 2, '98', '100', '2018-09-22 06:24:58', NULL, '2018-09-22 06:24:58', NULL, 1),
(7, 2, 1, 1, 1, 2, 3, '65', '100', '2018-09-22 06:25:10', NULL, '2018-09-22 06:25:10', NULL, 1),
(8, 1, 1, 1, 1, 1, 1, '89', '100', '2018-09-22 06:24:58', NULL, '2018-09-22 06:24:58', NULL, 1),
(9, 1, 1, 1, 1, 2, 1, '61', '100', '2018-09-22 06:25:10', NULL, '2018-09-22 06:25:10', NULL, 1),
(10, 2, 1, 1, 1, 1, 1, '99', '100', '2018-09-22 06:24:58', NULL, '2018-09-22 06:24:58', NULL, 1);

-- --------------------------------------------------------

--
-- Stand-in structure for view `testmarksview`
-- (See below for the actual view)
--
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
-- Table structure for table `timetable`
--

CREATE TABLE `timetable` (
  `id` int(11) NOT NULL,
  `classId` int(11) DEFAULT NULL,
  `divId` int(11) DEFAULT NULL,
  `subId` int(11) DEFAULT NULL,
  `dayId` int(11) DEFAULT NULL,
  `timeSlot` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createdBy` bigint(20) DEFAULT NULL,
  `updatedAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedBy` bigint(20) DEFAULT NULL,
  `active` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `timetable`
--

INSERT INTO `timetable` (`id`, `classId`, `divId`, `subId`, `dayId`, `timeSlot`, `createdAt`, `createdBy`, `updatedAt`, `updatedBy`, `active`) VALUES
(1, 1, 1, 3, 1, '10:00-11:45', '2018-09-24 00:00:00', NULL, '2018-09-24 00:00:00', NULL, 1),
(2, 1, 2, 2, 1, '09:00-10:00', '2018-09-24 00:00:00', NULL, '2018-09-24 00:00:00', NULL, 1),
(3, 2, 2, 2, 1, '09:00-10:45', '2018-09-24 00:00:00', NULL, '2018-09-24 00:00:00', NULL, 1);

-- --------------------------------------------------------

--
-- Stand-in structure for view `timetabledetailview`
-- (See below for the actual view)
--
CREATE TABLE `timetabledetailview` (
`id` int(11)
,`teacherId` bigint(20)
,`classId` int(11)
,`divId` int(11)
,`subId` int(11)
,`dayId` int(11)
,`timeSlot` varchar(255)
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
(1, 'suraj', 'malu', 'surajmalu@ymail.com', '7588646201', '$2a$10$GUEiqZfR.1WlZn6SqaKN4.R83psL28FL/qgjxwH3w8iA1dK2Yb7o2', '2018-09-06 17:33:17', '2018-09-06 17:33:17', 1);

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
-- Structure for view `studentmonthlyattendanceview`
--
DROP TABLE IF EXISTS `studentmonthlyattendanceview`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `studentmonthlyattendanceview`  AS  select `att`.`studentId` AS `studentId`,concat(`st`.`firstName`,' ',`st`.`lastName`) AS `studentName`,`st`.`classId` AS `classId`,`st`.`divId` AS `divId`,date_format(`att`.`attendanceDate`,'%b') AS `attendanceMonth`,round((((select count(`at1`.`id`) from `attendance` `at1` where ((`at1`.`attendanceResult` <> 0) and (`at1`.`studentId` = `att`.`studentId`) and (date_format(`at1`.`attendanceDate`,'%b') = date_format(`att`.`attendanceDate`,'%b')))) / (select count(`at2`.`id`) from `attendance` `at2` where ((`at2`.`studentId` = `att`.`studentId`) and (date_format(`at2`.`attendanceDate`,'%b') = date_format(`att`.`attendanceDate`,'%b'))))) * 100),2) AS `monthAvg` from (`attendance` `att` join `student` `st` on((`st`.`id` = `att`.`studentId`))) group by date_format(`att`.`attendanceDate`,'%b'),`att`.`studentId` ;

-- --------------------------------------------------------

--
-- Structure for view `studenttestresultview`
--
DROP TABLE IF EXISTS `studenttestresultview`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `studenttestresultview`  AS  select `tm`.`studentId` AS `studentId`,`tm`.`testId` AS `testId`,`tm`.`classId` AS `classId`,`tm`.`divId` AS `divId`,count(`tm`.`subId`) AS `totalSubject`,`t`.`testName` AS `testName`,`cl`.`className` AS `className`,`di`.`divName` AS `divName`,round(((sum(`tm`.`getMarks`) / sum(`tm`.`totalMarks`)) * 100),2) AS `totalAvg` from (((`testmarks` `tm` join `class` `cl` on((`cl`.`id` = `tm`.`classId`))) join `division` `di` on((`di`.`id` = `tm`.`divId`))) join `test` `t` on((`t`.`id` = `tm`.`testId`))) group by `tm`.`studentId`,`tm`.`testId` having (count(`tm`.`subId`) >= (select count(`sub`.`id`) from `subject` `sub` where (`sub`.`classId` = `tm`.`classId`))) ;

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
-- Structure for view `testmarksview`
--
DROP TABLE IF EXISTS `testmarksview`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `testmarksview`  AS  select `tm`.`id` AS `id`,`tm`.`studentId` AS `studentId`,`tm`.`teacherId` AS `teacherId`,`tm`.`testId` AS `testId`,`tm`.`subId` AS `subId`,`tm`.`classId` AS `classId`,`tm`.`divId` AS `divId`,`tm`.`getMarks` AS `getMarks`,`tm`.`totalMarks` AS `totalMarks`,`t`.`testName` AS `testName`,`cl`.`className` AS `className`,`di`.`divName` AS `divName`,`s`.`subName` AS `subName`,concat(`te`.`firstName`,' ',`te`.`lastName`) AS `teacherName`,concat(`st`.`firstName`,' ',`st`.`lastName`) AS `studentName`,`tm`.`createdAt` AS `createdAt`,`tm`.`updatedAt` AS `updatedAt` from ((((((`testmarks` `tm` join `test` `t` on((`t`.`id` = `tm`.`testId`))) join `subject` `s` on((`s`.`id` = `tm`.`subId`))) join `teacher` `te` on((`te`.`id` = `tm`.`teacherId`))) join `student` `st` on((`st`.`id` = `tm`.`studentId`))) join `class` `cl` on((`cl`.`id` = `tm`.`classId`))) join `division` `di` on((`di`.`id` = `tm`.`divId`))) ;

-- --------------------------------------------------------

--
-- Structure for view `timetabledetailview`
--
DROP TABLE IF EXISTS `timetabledetailview`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `timetabledetailview`  AS  select `tt`.`id` AS `id`,`ts`.`teacherId` AS `teacherId`,`tt`.`classId` AS `classId`,`tt`.`divId` AS `divId`,`tt`.`subId` AS `subId`,`tt`.`dayId` AS `dayId`,`tt`.`timeSlot` AS `timeSlot`,`tt`.`updatedAt` AS `updatedAt`,`cl`.`className` AS `className`,`di`.`divName` AS `divName`,`su`.`subName` AS `subName`,`da`.`dayName` AS `dayName`,concat(`t`.`firstName`,' ',`t`.`lastName`) AS `teacherName` from ((((((`timetable` `tt` join `class` `cl` on((`cl`.`id` = `tt`.`classId`))) join `division` `di` on((`di`.`id` = `tt`.`divId`))) join `subject` `su` on((`su`.`id` = `tt`.`subId`))) join `days` `da` on((`da`.`id` = `tt`.`dayId`))) join `teachersubject` `ts` on(((`ts`.`subId` = `tt`.`subId`) and (`ts`.`classId` = `tt`.`classId`) and (`ts`.`divId` = `tt`.`divId`)))) join `teacher` `t` on((`t`.`id` = `ts`.`teacherId`))) ;

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
  ADD KEY `classId` (`classId`),
  ADD KEY `divId` (`divId`),
  ADD KEY `classteacher_ibfk_1` (`teacherId`);

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
  ADD KEY `studentId` (`studentId`),
  ADD KEY `classId` (`classId`),
  ADD KEY `divId` (`divId`),
  ADD KEY `subId` (`subId`);

--
-- Indexes for table `messageportal`
--
ALTER TABLE `messageportal`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userId` (`userId`),
  ADD KEY `parentId` (`parentId`),
  ADD KEY `studentId` (`studentId`);

--
-- Indexes for table `parentuser`
--
ALTER TABLE `parentuser`
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
  ADD KEY `classId` (`classId`),
  ADD KEY `divId` (`divId`),
  ADD KEY `cityId` (`cityId`),
  ADD KEY `stateId` (`stateId`);

--
-- Indexes for table `subject`
--
ALTER TABLE `subject`
  ADD PRIMARY KEY (`id`),
  ADD KEY `classId` (`classId`);

--
-- Indexes for table `teacher`
--
ALTER TABLE `teacher`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cityId` (`cityId`),
  ADD KEY `stateId` (`stateId`);

--
-- Indexes for table `teachersubject`
--
ALTER TABLE `teachersubject`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subId` (`subId`),
  ADD KEY `classId` (`classId`),
  ADD KEY `divId` (`divId`),
  ADD KEY `teachersubject_ibfk_1` (`teacherId`);

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
  ADD KEY `classId` (`classId`),
  ADD KEY `divId` (`divId`),
  ADD KEY `subId` (`subId`),
  ADD KEY `dayId` (`dayId`);

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
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `city`
--
ALTER TABLE `city`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `class`
--
ALTER TABLE `class`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `classteacher`
--
ALTER TABLE `classteacher`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `days`
--
ALTER TABLE `days`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `division`
--
ALTER TABLE `division`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `finalresult`
--
ALTER TABLE `finalresult`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

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
-- AUTO_INCREMENT for table `state`
--
ALTER TABLE `state`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `student`
--
ALTER TABLE `student`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `subject`
--
ALTER TABLE `subject`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `teacher`
--
ALTER TABLE `teacher`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `teachersubject`
--
ALTER TABLE `teachersubject`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `test`
--
ALTER TABLE `test`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `testmarks`
--
ALTER TABLE `testmarks`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `timetable`
--
ALTER TABLE `timetable`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `todos`
--
ALTER TABLE `todos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `attendance`
--
ALTER TABLE `attendance`
  ADD CONSTRAINT `attendance_ibfk_1` FOREIGN KEY (`studentId`) REFERENCES `student` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  ADD CONSTRAINT `attendance_ibfk_2` FOREIGN KEY (`classId`) REFERENCES `class` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `attendance_ibfk_3` FOREIGN KEY (`divId`) REFERENCES `division` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `attendance_ibfk_4` FOREIGN KEY (`classTeacherId`) REFERENCES `teacher` (`id`) ON DELETE SET NULL ON UPDATE SET NULL;

--
-- Constraints for table `city`
--
ALTER TABLE `city`
  ADD CONSTRAINT `city_ibfk_1` FOREIGN KEY (`stateId`) REFERENCES `state` (`id`);

--
-- Constraints for table `classteacher`
--
ALTER TABLE `classteacher`
  ADD CONSTRAINT `classteacher_ibfk_1` FOREIGN KEY (`teacherId`) REFERENCES `teacher` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  ADD CONSTRAINT `classteacher_ibfk_2` FOREIGN KEY (`classId`) REFERENCES `class` (`id`),
  ADD CONSTRAINT `classteacher_ibfk_3` FOREIGN KEY (`divId`) REFERENCES `division` (`id`);

--
-- Constraints for table `finalresult`
--
ALTER TABLE `finalresult`
  ADD CONSTRAINT `finalresult_ibfk_1` FOREIGN KEY (`studentId`) REFERENCES `student` (`id`),
  ADD CONSTRAINT `finalresult_ibfk_2` FOREIGN KEY (`classId`) REFERENCES `class` (`id`),
  ADD CONSTRAINT `finalresult_ibfk_3` FOREIGN KEY (`divId`) REFERENCES `division` (`id`),
  ADD CONSTRAINT `finalresult_ibfk_4` FOREIGN KEY (`subId`) REFERENCES `subject` (`id`);

--
-- Constraints for table `messageportal`
--
ALTER TABLE `messageportal`
  ADD CONSTRAINT `messageportal_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `messageportal_ibfk_2` FOREIGN KEY (`parentId`) REFERENCES `parentuser` (`id`),
  ADD CONSTRAINT `messageportal_ibfk_3` FOREIGN KEY (`studentId`) REFERENCES `student` (`id`);

--
-- Constraints for table `student`
--
ALTER TABLE `student`
  ADD CONSTRAINT `student_ibfk_1` FOREIGN KEY (`classId`) REFERENCES `class` (`id`),
  ADD CONSTRAINT `student_ibfk_2` FOREIGN KEY (`divId`) REFERENCES `division` (`id`),
  ADD CONSTRAINT `student_ibfk_3` FOREIGN KEY (`cityId`) REFERENCES `city` (`id`),
  ADD CONSTRAINT `student_ibfk_4` FOREIGN KEY (`stateId`) REFERENCES `state` (`id`);

--
-- Constraints for table `subject`
--
ALTER TABLE `subject`
  ADD CONSTRAINT `subject_ibfk_1` FOREIGN KEY (`classId`) REFERENCES `class` (`id`);

--
-- Constraints for table `teacher`
--
ALTER TABLE `teacher`
  ADD CONSTRAINT `teacher_ibfk_1` FOREIGN KEY (`cityId`) REFERENCES `city` (`id`),
  ADD CONSTRAINT `teacher_ibfk_2` FOREIGN KEY (`stateId`) REFERENCES `state` (`id`);

--
-- Constraints for table `teachersubject`
--
ALTER TABLE `teachersubject`
  ADD CONSTRAINT `teachersubject_ibfk_1` FOREIGN KEY (`teacherId`) REFERENCES `teacher` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  ADD CONSTRAINT `teachersubject_ibfk_2` FOREIGN KEY (`subId`) REFERENCES `subject` (`id`),
  ADD CONSTRAINT `teachersubject_ibfk_3` FOREIGN KEY (`classId`) REFERENCES `class` (`id`),
  ADD CONSTRAINT `teachersubject_ibfk_4` FOREIGN KEY (`divId`) REFERENCES `division` (`id`);

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
  ADD CONSTRAINT `timetable_ibfk_1` FOREIGN KEY (`classId`) REFERENCES `class` (`id`),
  ADD CONSTRAINT `timetable_ibfk_2` FOREIGN KEY (`divId`) REFERENCES `division` (`id`),
  ADD CONSTRAINT `timetable_ibfk_3` FOREIGN KEY (`subId`) REFERENCES `subject` (`id`),
  ADD CONSTRAINT `timetable_ibfk_4` FOREIGN KEY (`dayId`) REFERENCES `days` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
