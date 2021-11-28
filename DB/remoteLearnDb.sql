-- MySQL dump 10.13  Distrib 8.0.23, for Win64 (x86_64)
--
-- Host: localhost    Database: remotelearndb
-- ------------------------------------------------------
-- Server version	8.0.23

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `a1`
--

DROP TABLE IF EXISTS `a1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `a1` (
  `Rollno` int DEFAULT NULL,
  `SubjectCode` int DEFAULT NULL,
  `ScheduledDate` varchar(20) DEFAULT NULL,
  `SubmissionDate` varchar(20) DEFAULT NULL,
  `Marks` int DEFAULT NULL,
  `Approved` int DEFAULT NULL,
  KEY `SubjectCode` (`SubjectCode`),
  CONSTRAINT `a1_ibfk_1` FOREIGN KEY (`SubjectCode`) REFERENCES `subjecttable` (`SubjectCode`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `a1`
--

LOCK TABLES `a1` WRITE;
/*!40000 ALTER TABLE `a1` DISABLE KEYS */;
/*!40000 ALTER TABLE `a1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `a3`
--

DROP TABLE IF EXISTS `a3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `a3` (
  `Rollno` int DEFAULT NULL,
  `SubjectCode` int DEFAULT NULL,
  `ScheduledDate` varchar(20) DEFAULT NULL,
  `SubmissionDate` varchar(20) DEFAULT NULL,
  `Marks` int DEFAULT NULL,
  `Approved` int DEFAULT NULL,
  KEY `SubjectCode` (`SubjectCode`),
  CONSTRAINT `a3_ibfk_1` FOREIGN KEY (`SubjectCode`) REFERENCES `subjecttable` (`SubjectCode`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `a3`
--

LOCK TABLES `a3` WRITE;
/*!40000 ALTER TABLE `a3` DISABLE KEYS */;
/*!40000 ALTER TABLE `a3` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `a6`
--

DROP TABLE IF EXISTS `a6`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `a6` (
  `Rollno` int DEFAULT NULL,
  `SubjectCode` int DEFAULT NULL,
  `ScheduledDate` varchar(20) DEFAULT NULL,
  `SubmissionDate` varchar(20) DEFAULT NULL,
  `Marks` int DEFAULT NULL,
  `Approved` int DEFAULT NULL,
  KEY `SubjectCode` (`SubjectCode`),
  CONSTRAINT `a6_ibfk_1` FOREIGN KEY (`SubjectCode`) REFERENCES `subjecttable` (`SubjectCode`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `a6`
--

LOCK TABLES `a6` WRITE;
/*!40000 ALTER TABLE `a6` DISABLE KEYS */;
/*!40000 ALTER TABLE `a6` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `a7`
--

DROP TABLE IF EXISTS `a7`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `a7` (
  `Rollno` int DEFAULT NULL,
  `SubjectCode` int DEFAULT NULL,
  `ScheduledDate` varchar(20) DEFAULT NULL,
  `SubmissionDate` varchar(20) DEFAULT NULL,
  `Marks` int DEFAULT NULL,
  `Approved` int DEFAULT NULL,
  KEY `SubjectCode` (`SubjectCode`),
  CONSTRAINT `a7_ibfk_1` FOREIGN KEY (`SubjectCode`) REFERENCES `subjecttable` (`SubjectCode`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `a7`
--

LOCK TABLES `a7` WRITE;
/*!40000 ALTER TABLE `a7` DISABLE KEYS */;
/*!40000 ALTER TABLE `a7` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assignmentexist`
--

DROP TABLE IF EXISTS `assignmentexist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assignmentexist` (
  `AssignmentName` varchar(5) NOT NULL,
  `SubjectCode` int NOT NULL,
  PRIMARY KEY (`AssignmentName`,`SubjectCode`),
  KEY `SubjectCode` (`SubjectCode`),
  CONSTRAINT `AssignmentExist_ibfk_1` FOREIGN KEY (`SubjectCode`) REFERENCES `subjecttable` (`SubjectCode`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assignmentexist`
--

LOCK TABLES `assignmentexist` WRITE;
/*!40000 ALTER TABLE `assignmentexist` DISABLE KEYS */;
/*!40000 ALTER TABLE `assignmentexist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `filedatabase`
--

DROP TABLE IF EXISTS `filedatabase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `filedatabase` (
  `FileName` varchar(255) DEFAULT NULL,
  `FileContent` longblob,
  `UserID` varchar(10) DEFAULT NULL,
  `SubjectName` varchar(40) DEFAULT NULL,
  `GroupName` varchar(40) DEFAULT NULL,
  `FileID` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`FileID`),
  KEY `UserID` (`UserID`),
  CONSTRAINT `FileDatabase_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `logintable` (`UserID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `filedatabase`
--

LOCK TABLES `filedatabase` WRITE;
/*!40000 ALTER TABLE `filedatabase` DISABLE KEYS */;
/*!40000 ALTER TABLE `filedatabase` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grouptable`
--

DROP TABLE IF EXISTS `grouptable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `grouptable` (
  `GroupCode` int NOT NULL AUTO_INCREMENT,
  `GroupName` varchar(10) DEFAULT NULL,
  `StartRollNo` int DEFAULT NULL,
  `EndRollNo` int DEFAULT NULL,
  PRIMARY KEY (`GroupCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grouptable`
--

LOCK TABLES `grouptable` WRITE;
/*!40000 ALTER TABLE `grouptable` DISABLE KEYS */;
/*!40000 ALTER TABLE `grouptable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logintable`
--

DROP TABLE IF EXISTS `logintable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `logintable` (
  `UserID` varchar(10) NOT NULL,
  `UserName` varchar(255) NOT NULL,
  `Password` varchar(15) NOT NULL,
  PRIMARY KEY (`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logintable`
--

LOCK TABLES `logintable` WRITE;
/*!40000 ALTER TABLE `logintable` DISABLE KEYS */;
/*!40000 ALTER TABLE `logintable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subjectcoordinator`
--

DROP TABLE IF EXISTS `subjectcoordinator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subjectcoordinator` (
  `UserID` varchar(10) NOT NULL,
  `SubjectCode` int NOT NULL,
  PRIMARY KEY (`UserID`,`SubjectCode`),
  KEY `SubjectCode` (`SubjectCode`),
  CONSTRAINT `SubjectCoordinator_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `logintable` (`UserID`) ON DELETE CASCADE,
  CONSTRAINT `SubjectCoordinator_ibfk_2` FOREIGN KEY (`SubjectCode`) REFERENCES `subjecttable` (`SubjectCode`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subjectcoordinator`
--

LOCK TABLES `subjectcoordinator` WRITE;
/*!40000 ALTER TABLE `subjectcoordinator` DISABLE KEYS */;
/*!40000 ALTER TABLE `subjectcoordinator` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subjecttable`
--

DROP TABLE IF EXISTS `subjecttable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subjecttable` (
  `SubjectCode` int NOT NULL AUTO_INCREMENT,
  `SubjectName` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`SubjectCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subjecttable`
--

LOCK TABLES `subjecttable` WRITE;
/*!40000 ALTER TABLE `subjecttable` DISABLE KEYS */;
/*!40000 ALTER TABLE `subjecttable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `submissionticket`
--

DROP TABLE IF EXISTS `submissionticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `submissionticket` (
  `RollNo` int NOT NULL,
  `Approved` tinyint(1) DEFAULT NULL,
  `SubjectCode` int NOT NULL,
  PRIMARY KEY (`RollNo`,`SubjectCode`),
  KEY `SubjectCode` (`SubjectCode`),
  CONSTRAINT `SubmissionTicket_ibfk_1` FOREIGN KEY (`SubjectCode`) REFERENCES `subjecttable` (`SubjectCode`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submissionticket`
--

LOCK TABLES `submissionticket` WRITE;
/*!40000 ALTER TABLE `submissionticket` DISABLE KEYS */;
/*!40000 ALTER TABLE `submissionticket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `termwork`
--

DROP TABLE IF EXISTS `termwork`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `termwork` (
  `RollNo` int NOT NULL,
  `OutOf25` int DEFAULT NULL,
  `OutOf50` int DEFAULT NULL,
  `SubjectCode` int NOT NULL,
  PRIMARY KEY (`RollNo`,`SubjectCode`),
  KEY `SubjectCode` (`SubjectCode`),
  CONSTRAINT `TermWork_ibfk_1` FOREIGN KEY (`SubjectCode`) REFERENCES `subjecttable` (`SubjectCode`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `termwork`
--

LOCK TABLES `termwork` WRITE;
/*!40000 ALTER TABLE `termwork` DISABLE KEYS */;
/*!40000 ALTER TABLE `termwork` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unittest`
--

DROP TABLE IF EXISTS `unittest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `unittest` (
  `RollNo` int NOT NULL,
  `UT1` int DEFAULT '0',
  `SubjectCode` int NOT NULL,
  `UT2` int DEFAULT NULL,
  `OutOfMarks` int DEFAULT '30',
  PRIMARY KEY (`RollNo`,`SubjectCode`),
  KEY `SubjectCode` (`SubjectCode`),
  CONSTRAINT `UnitTest_ibfk_1` FOREIGN KEY (`SubjectCode`) REFERENCES `subjecttable` (`SubjectCode`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unittest`
--

LOCK TABLES `unittest` WRITE;
/*!40000 ALTER TABLE `unittest` DISABLE KEYS */;
/*!40000 ALTER TABLE `unittest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userinfo`
--

DROP TABLE IF EXISTS `userinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userinfo` (
  `UserID` varchar(10) NOT NULL,
  `UserName` varchar(255) DEFAULT NULL,
  `SubjectCode` int NOT NULL,
  `GroupCode` int NOT NULL,
  `AssignCount` int DEFAULT '10',
  PRIMARY KEY (`UserID`,`GroupCode`,`SubjectCode`),
  KEY `GroupCode` (`GroupCode`),
  KEY `SubjectCode` (`SubjectCode`),
  KEY `UserID` (`UserID`),
  CONSTRAINT `UserInfo_ibfk_4` FOREIGN KEY (`UserID`) REFERENCES `logintable` (`UserID`) ON DELETE CASCADE,
  CONSTRAINT `UserInfo_ibfk_5` FOREIGN KEY (`GroupCode`) REFERENCES `grouptable` (`GroupCode`) ON DELETE CASCADE,
  CONSTRAINT `UserInfo_ibfk_6` FOREIGN KEY (`SubjectCode`) REFERENCES `subjecttable` (`SubjectCode`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userinfo`
--

LOCK TABLES `userinfo` WRITE;
/*!40000 ALTER TABLE `userinfo` DISABLE KEYS */;
/*!40000 ALTER TABLE `userinfo` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-11-28 14:55:13
