-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: localhost    Database: ola
-- ------------------------------------------------------
-- Server version	8.0.28

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
-- Table structure for table `books`
--

DROP TABLE IF EXISTS `books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `books` (
  `BookingID` varchar(12) NOT NULL,
  `CustomerID` varchar(15) NOT NULL,
  `StartAddress` varchar(50) NOT NULL,
  `DestinationAddress` varchar(50) NOT NULL,
  `RideDate` date NOT NULL,
  `RideTime` time NOT NULL,
  `Preferred_Vehicle_Type` varchar(2) DEFAULT NULL,
  `RideType` varchar(2) NOT NULL,
  `Approximate_Cost` float DEFAULT NULL,
  `BookingStatus` varchar(2) NOT NULL,
  PRIMARY KEY (`BookingID`),
  KEY `CustomerID` (`CustomerID`),
  CONSTRAINT `books_ibfk_1` FOREIGN KEY (`CustomerID`) REFERENCES `customer` (`CustomerID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books`
--

LOCK TABLES `books` WRITE;
/*!40000 ALTER TABLE `books` DISABLE KEYS */;
INSERT INTO `books` VALUES ('BK00000001','C0000000001','https://goo.gl/maps/fWt1X3pmCDr9i4Xw8','https://goo.gl/maps/73aMH3LAz1ZXJArV7','2022-05-25','16:00:00','AT','TX',245,'CF'),('BK00000002','C0000000001','https://goo.gl/maps/aH4AbanFgMW214c3A','https://g.page/SymbiosisEngineering?share','2022-06-18','16:45:00','MI','TX',162,'CF'),('BK00000003','C0000000001','https://goo.gl/maps/wueHr8bjkArpezKj7','https://g.page/BrowniePointMahim?share','2022-06-19','16:50:00','AT','TX',189,'CF'),('BK00000004','C0000000002','https://g.page/SymbiosisEngineering?share','https://goo.gl/maps/hVrGC8aSEy4fChcMA','2022-09-02','08:30:00','PS','TX',345,'CF'),('BK00000005','C0000000002','https://g.page/DELHICLUBHOUSE?share','https://goo.gl/maps/WACP5F2C8dGALDAd9','2022-10-13','06:00:00','PV','OS',412,'CF'),('BK00000006','C0000000003','https://goo.gl/maps/QZn1GNthyHNcA4Hq8','https://goo.gl/maps/5XY5N2WyWsU75vW76','2022-10-20','18:40:00','AT','TX',299,'CF'),('BK00000007','C0000000003','https://goo.gl/maps/dhpnVYDYaxp6P5VKA','https://goo.gl/maps/t2WrWNgSCSbKAuZi9','2022-10-22','19:00:00','AT','TX',150,'CF'),('BK00000008','C0000000004','https://goo.gl/maps/rVvtvDVZcUariRHf7','https://goo.gl/maps/5XY5N2WyWsU75vW76','2022-11-02','05:30:00','PS','OS',99,'CF'),('BK00000009','C0000000004','https://goo.gl/maps/RH16BcckEpvrHjYi8','https://goo.gl/maps/jk54qQvyBkWhnyMi8','2022-11-11','05:30:00','PP','OS',190,'CF'),('BK00000010','C0000000005','https://g.page/apricot-service-apartments?share','https://g.page/SymbiosisEngineering?share','2022-10-30','12:35:00','AT','TX',211,'CF'),('BK00000011','C0000000005','https://goo.gl/maps/eUjfM8XELXecjXck8','https://goo.gl/maps/AqPvvNNzNJxcGSva9','2022-11-04','14:00:00','MI','TX',120,'CF'),('BK00000012','C0000000005','https://goo.gl/maps/hVrGC8aSEy4fChcMA','https://goo.gl/maps/73aMH3LAz1ZXJArV7','2022-11-08','13:30:00','AT','TX',79,'CP');
/*!40000 ALTER TABLE `books` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `completed_trips`
--

DROP TABLE IF EXISTS `completed_trips`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `completed_trips` (
  `CRN` varchar(12) DEFAULT NULL,
  `CustomerID` varchar(15) DEFAULT NULL,
  `Driverid` varchar(15) DEFAULT NULL,
  `FinalCost` float DEFAULT NULL,
  KEY `CRN` (`CRN`),
  KEY `CustomerID` (`CustomerID`),
  KEY `Driverid` (`Driverid`),
  CONSTRAINT `completed_trips_ibfk_1` FOREIGN KEY (`CRN`) REFERENCES `trip` (`CRN`),
  CONSTRAINT `completed_trips_ibfk_2` FOREIGN KEY (`CustomerID`) REFERENCES `books` (`CustomerID`),
  CONSTRAINT `completed_trips_ibfk_3` FOREIGN KEY (`Driverid`) REFERENCES `trip` (`DriverID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `completed_trips`
--

LOCK TABLES `completed_trips` WRITE;
/*!40000 ALTER TABLE `completed_trips` DISABLE KEYS */;
/*!40000 ALTER TABLE `completed_trips` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `CustomerID` varchar(15) NOT NULL,
  `UserID` int NOT NULL,
  `ProfileType` varchar(1) NOT NULL,
  `EmailId` varchar(30) NOT NULL,
  `OlaWallet_Amount` float DEFAULT NULL,
  PRIMARY KEY (`CustomerID`),
  KEY `UserID` (`UserID`),
  CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES ('C0000000001',1,'P','akulz123@gmail.com',0),('C0000000002',2,'N','yajwanbabu@gmail.com',822),('C0000000003',3,'P','cclentina455@gmail.com',390),('C0000000004',4,'N','devi.vishare134@gmail.com',1500),('C0000000005',5,'N','ethanhuntMI@gmail.com',300);
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_card_details`
--

DROP TABLE IF EXISTS `customer_card_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_card_details` (
  `CustomerID` varchar(15) NOT NULL,
  `CardHolderName` varchar(30) DEFAULT NULL,
  `CardNumber` varchar(20) NOT NULL,
  `CVV` int DEFAULT NULL,
  `ExpiryDate` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`CustomerID`,`CardNumber`),
  CONSTRAINT `customer_card_details_ibfk_1` FOREIGN KEY (`CustomerID`) REFERENCES `customer` (`CustomerID`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_card_details`
--

LOCK TABLES `customer_card_details` WRITE;
/*!40000 ALTER TABLE `customer_card_details` DISABLE KEYS */;
INSERT INTO `customer_card_details` VALUES ('C0000000001','Akul Z','1520 8105 9802 5550',629,'05/30'),('C0000000002','Babu Yajwan','8098 6504 52330 5086',88,'06/26'),('C0000000003','Clentina Waghmare','0658 9852 1561 2608',988,'12/28'),('C0000000004','Devi Vishare','6801 5050 4098 9871',123,'03/29'),('C0000000004','Devi V','6804 9845 0288 9556',465,'01/31'),('C0000000005','Ethan Hunt','6480 8122 2348 3580',8,'06/26');
/*!40000 ALTER TABLE `customer_card_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_emergency_contact`
--

DROP TABLE IF EXISTS `customer_emergency_contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_emergency_contact` (
  `CustomerID` varchar(15) NOT NULL,
  `ContactNumber` varchar(12) NOT NULL,
  PRIMARY KEY (`CustomerID`,`ContactNumber`),
  CONSTRAINT `customer_emergency_contact_ibfk_1` FOREIGN KEY (`CustomerID`) REFERENCES `customer` (`CustomerID`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_emergency_contact`
--

LOCK TABLES `customer_emergency_contact` WRITE;
/*!40000 ALTER TABLE `customer_emergency_contact` DISABLE KEYS */;
INSERT INTO `customer_emergency_contact` VALUES ('C0000000001','9112306148'),('C0000000001','9446205053'),('C0000000002','6448029668'),('C0000000002','8660480269'),('C0000000003','8660795058'),('C0000000003','9556128020'),('C0000000004','6065556880'),('C0000000005','8866889804');
/*!40000 ALTER TABLE `customer_emergency_contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_favourite_location`
--

DROP TABLE IF EXISTS `customer_favourite_location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_favourite_location` (
  `CustomerID` varchar(15) NOT NULL,
  `Location` varchar(50) NOT NULL,
  PRIMARY KEY (`CustomerID`,`Location`),
  CONSTRAINT `customer_favourite_location_ibfk_1` FOREIGN KEY (`CustomerID`) REFERENCES `customer` (`CustomerID`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_favourite_location`
--

LOCK TABLES `customer_favourite_location` WRITE;
/*!40000 ALTER TABLE `customer_favourite_location` DISABLE KEYS */;
INSERT INTO `customer_favourite_location` VALUES ('C0000000001','https://goo.gl/maps/1zP1ANdtq1fRcGQw7'),('C0000000001','https://goo.gl/maps/47EgFkTPzEo4ATMT9'),('C0000000001','https://goo.gl/maps/XqTjpqeN9NyvoEHfA'),('C0000000002','https://goo.gl/maps/2n1d7i6a2Avw5mm9A'),('C0000000002','https://goo.gl/maps/3qag5CxKSJTzJ1Q38'),('C0000000002','https://goo.gl/maps/sgSfxzLkNavUwpnK6'),('C0000000003','https://goo.gl/maps/heyty5qVhuf3tHD56'),('C0000000003','https://goo.gl/maps/uuBheMHhWHRFvCmy7'),('C0000000004','https://goo.gl/maps/afrWYRMbHzEkMcw38'),('C0000000004','https://goo.gl/maps/Uh8UJtXkeR58xyBU6'),('C0000000005','https://goo.gl/maps/4JS43ULPbf77Ygtu8');
/*!40000 ALTER TABLE `customer_favourite_location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_upi_details`
--

DROP TABLE IF EXISTS `customer_upi_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_upi_details` (
  `CustomerID` varchar(15) NOT NULL,
  `UPIID` varchar(20) NOT NULL,
  PRIMARY KEY (`CustomerID`,`UPIID`),
  CONSTRAINT `customer_upi_details_ibfk_1` FOREIGN KEY (`CustomerID`) REFERENCES `customer` (`CustomerID`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_upi_details`
--

LOCK TABLES `customer_upi_details` WRITE;
/*!40000 ALTER TABLE `customer_upi_details` DISABLE KEYS */;
INSERT INTO `customer_upi_details` VALUES ('C0000000001','akul123@okhdfcbank'),('C0000000002','babuy15@okhdfcbank'),('C0000000003','clenty44@okicicibank'),('C0000000004','devdev909@okyesbank'),('C0000000005','ethanmi6@okaxisbank');
/*!40000 ALTER TABLE `customer_upi_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_user`
--

DROP TABLE IF EXISTS `customer_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_user` (
  `CustomerID` varchar(15) NOT NULL,
  `UserID` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_user`
--

LOCK TABLES `customer_user` WRITE;
/*!40000 ALTER TABLE `customer_user` DISABLE KEYS */;
INSERT INTO `customer_user` VALUES ('C0000000001',1),('C0000000002',2),('C0000000003',3),('C0000000004',4),('C0000000005',5);
/*!40000 ALTER TABLE `customer_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `driver`
--

DROP TABLE IF EXISTS `driver`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `driver` (
  `DriverID` varchar(15) NOT NULL,
  `PartnerID` varchar(15) NOT NULL,
  `VehicleNo` varchar(12) NOT NULL,
  `OperatorID` varchar(15) DEFAULT NULL,
  `LicenseNo` varchar(10) NOT NULL,
  `Rating` float DEFAULT NULL,
  `Status` varchar(3) NOT NULL,
  PRIMARY KEY (`DriverID`),
  UNIQUE KEY `PartnerID` (`PartnerID`),
  UNIQUE KEY `LicenseNo` (`LicenseNo`),
  KEY `VehicleNo` (`VehicleNo`),
  KEY `OperatorID` (`OperatorID`),
  CONSTRAINT `driver_ibfk_1` FOREIGN KEY (`PartnerID`) REFERENCES `partner` (`PartnerID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `driver_ibfk_2` FOREIGN KEY (`VehicleNo`) REFERENCES `vehicle` (`VehicleNo`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `driver_ibfk_3` FOREIGN KEY (`OperatorID`) REFERENCES `fleet_operator` (`OperatorID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `driver`
--

LOCK TABLES `driver` WRITE;
/*!40000 ALTER TABLE `driver` DISABLE KEYS */;
INSERT INTO `driver` VALUES ('DR00000001','P000000001','MH13 5005','F000000001','LIN34625',2.2,'ON'),('DR00000002','P000000002','MH12 5815','F000000001','LIN95672',3.7,'ON'),('DR00000003','P000000004','MH13 1602',NULL,'LIN56724',4.8,'OFF'),('DR00000004','P000000005','MH47 8820','F000000003','LIN59157',4.4,'OFF'),('DR00000005','P000000006','DL2C 0070','F000000002','LIN56242',4.6,'ON'),('DR00000006','P000000009','KA01 1975','F000000004','LIN87641',4.8,'ON');
/*!40000 ALTER TABLE `driver` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fleet_operator`
--

DROP TABLE IF EXISTS `fleet_operator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fleet_operator` (
  `OperatorID` varchar(15) NOT NULL,
  `PartnerID` varchar(15) NOT NULL,
  PRIMARY KEY (`OperatorID`),
  UNIQUE KEY `PartnerID` (`PartnerID`),
  CONSTRAINT `fleet_operator_ibfk_1` FOREIGN KEY (`PartnerID`) REFERENCES `partner` (`PartnerID`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fleet_operator`
--

LOCK TABLES `fleet_operator` WRITE;
/*!40000 ALTER TABLE `fleet_operator` DISABLE KEYS */;
INSERT INTO `fleet_operator` VALUES ('F000000001','P000000003'),('F000000002','P000000007'),('F000000003','P000000008'),('F000000004','P000000010');
/*!40000 ALTER TABLE `fleet_operator` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `partner`
--

DROP TABLE IF EXISTS `partner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `partner` (
  `PartnerID` varchar(15) NOT NULL,
  `UserID` int NOT NULL,
  `DateOfJoining` date NOT NULL,
  `PLang` varchar(2) NOT NULL,
  `AccHolderName` varchar(30) DEFAULT NULL,
  `BankAc` varchar(20) DEFAULT NULL,
  `Street` varchar(20) DEFAULT NULL,
  `City` varchar(20) DEFAULT NULL,
  `State` varchar(20) DEFAULT NULL,
  `PinCode` varchar(6) DEFAULT NULL,
  `PanCardNo` varchar(10) DEFAULT NULL,
  `AadharCardNo` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`PartnerID`),
  KEY `UserID` (`UserID`),
  CONSTRAINT `partner_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `partner`
--

LOCK TABLES `partner` WRITE;
/*!40000 ALTER TABLE `partner` DISABLE KEYS */;
INSERT INTO `partner` VALUES ('P000000001',6,'2022-11-23','EN','Sarfaraz Kapoor','SBI200708','Baner','Pune','Maharashtra','411021','N20156','5829 3294 4921'),('P000000002',7,'2022-02-11','HN','Gabriel McKenzee','SBI211202','Aundh Baner','Pune','Maharashtra','411007','N63421','5724 2472 9516'),('P000000003',8,'2022-01-10','MT','Harish Chatarjee','SBI299102','Balewadi','Pune','Maharashtra','411045','N53487','5692 4867 9862'),('P000000004',9,'2022-03-22','MT','Ishaan V Kulkarni','SBI233109',' Kalyani Nagar','Pune','Maharashtra','411014','N56581','7184 8767 9162'),('P000000005',10,'2021-12-23','EN','Jyn Russo','SBI201709','Goregaon','Mumbai','Maharashtra','210021','N73666','6692 9274 8966'),('P000000006',11,'2020-09-19','HN','Kareen Abdul','SBI287106','RK Puram','New Delhi','Delhi','110211','N58912','5491 4867 9424'),('P000000007',12,'2022-01-05','EN','Luke Skywalker','SBI293105','Azadpur','New Delhi','Delhi','110033','N65483','7292 6667 8765'),('P000000008',13,'2022-04-18','MT','Manish Paranzpe','SBI274309','Mahim','Mumbai','Maharashtra','400016','N95487','9876 5432 1234'),('P000000009',14,'2021-08-24','HN','Nikita Kumar','SBI288602','Brigade Road','Bangalore','Karnataka','560001','N42165','4321 9876 1198'),('P000000010',15,'2021-02-25','HN','Osama Raj','SBI205107','Adugodi','Bangalore','Karnataka','560030','N77248','5678 1234 1020');
/*!40000 ALTER TABLE `partner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment` (
  `PaymentID` varchar(12) NOT NULL,
  `PaymentType` varchar(2) NOT NULL,
  PRIMARY KEY (`PaymentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
INSERT INTO `payment` VALUES ('PAY0000001','CH'),('PAY0000002','CH'),('PAY0000003','UP'),('PAY0000004','UP'),('PAY0000005','OW'),('PAY0000006','OW'),('PAY0000008','CD'),('PAY0000009','CH');
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trip`
--

DROP TABLE IF EXISTS `trip`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trip` (
  `CRN` varchar(12) NOT NULL,
  `BookingID` varchar(15) NOT NULL,
  `DriverID` varchar(15) NOT NULL,
  `VehicleType` varchar(2) NOT NULL,
  `PaymentID` varchar(15) DEFAULT NULL,
  `FinalCost` float NOT NULL,
  `Status` varchar(2) NOT NULL,
  `TripRating` float DEFAULT NULL,
  PRIMARY KEY (`CRN`),
  KEY `DriverID` (`DriverID`),
  KEY `BookingID` (`BookingID`),
  KEY `PaymentID` (`PaymentID`),
  CONSTRAINT `trip_ibfk_1` FOREIGN KEY (`DriverID`) REFERENCES `driver` (`DriverID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `trip_ibfk_2` FOREIGN KEY (`BookingID`) REFERENCES `books` (`BookingID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `trip_ibfk_3` FOREIGN KEY (`PaymentID`) REFERENCES `payment` (`PaymentID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trip`
--

LOCK TABLES `trip` WRITE;
/*!40000 ALTER TABLE `trip` DISABLE KEYS */;
INSERT INTO `trip` VALUES ('6789343901','BK00000001','DR00000001','AT','PAY0000001',250,'RD',5),('6789343902','BK00000002','DR00000002','MI','PAY0000002',160,'RD',5),('6789343903','BK00000003','DR00000004','AT',NULL,0,'CC',NULL),('6789343904','BK00000004','DR00000003','PS','PAY0000003',345,'RD',3),('6789343905','BK00000005','DR00000005','PV','PAY0000004',410,'RD',5),('6789343906','BK00000006','DR00000001','AT','PAY0000005',300,'RD',5),('6789343907','BK00000007','DR00000004','AT','PAY0000006',150,'RD',4),('6789343909','BK00000009','DR00000006','PP',NULL,190,'CD',NULL),('6789343910','BK00000010','DR00000001','AT','PAY0000008',210,'RD',2),('6789343911','BK00000011','DR00000002','MI','PAY0000009',120,'RD',5);
/*!40000 ALTER TABLE `trip` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `UserID` int NOT NULL,
  `FirstName` varchar(30) NOT NULL,
  `LastName` varchar(30) DEFAULT NULL,
  `PhoneNumber` varchar(12) NOT NULL,
  `DOB` date NOT NULL,
  `Password` varchar(20) NOT NULL,
  PRIMARY KEY (`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Akul','Zameendar','9112348090','2000-05-19','**********'),(2,'Babu','Yajwan','8998685910','1997-02-01','**********'),(3,'Clentina','Waghmare','9668610050','1990-10-04','**********'),(4,'Devi','Vishare','8660807050','2002-12-21','**********'),(5,'Ethan','Hunt','9668012345','1994-08-30','**********'),(6,'Fatima','Kapoor','9847832293','1990-04-04','**********'),(7,'Gabriel','McKenzee','8661552505','1995-03-17','**********'),(8,'Harish','Chatarjee','6880492580','1978-06-23','**********'),(9,'Ishaan','Kulkarni','8622928850','1990-08-19','*********'),(10,'Jyn','Russo','8098553109','1987-05-30','**********'),(11,'Kareen','Abdul','94480152205','1991-04-01','**********'),(12,'Luke','Skywalker','7559050179','1993-10-16','**********'),(13,'Manish','Paranzpe','9660608042','1986-08-21','**********'),(14,'Nikita','Kumar','7980808050','1995-06-13','**********'),(15,'Osama','Raj','9005065018','1989-11-29','**********');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `AgeCheck` AFTER INSERT ON `user` FOR EACH ROW BEGIN
    IF YEAR(NEW.DOB) > '2004' THEN
     
SIGNAL SQLSTATE '50001' SET MESSAGE_TEXT = 'Person must be older than 18.';

    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `vehicle`
--

DROP TABLE IF EXISTS `vehicle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vehicle` (
  `VehicleNo` varchar(12) NOT NULL,
  `OperatorID` varchar(15) DEFAULT NULL,
  `Type` varchar(2) NOT NULL,
  `Company` varchar(15) NOT NULL,
  `Model` varchar(15) NOT NULL,
  `Color` varchar(15) NOT NULL,
  `ChassiNumber` varchar(17) NOT NULL,
  `RCNumber` varchar(15) NOT NULL,
  `InsuranceNumber` varchar(15) NOT NULL,
  PRIMARY KEY (`VehicleNo`),
  UNIQUE KEY `ChassiNumber` (`ChassiNumber`),
  UNIQUE KEY `RCNumber` (`RCNumber`),
  UNIQUE KEY `InsuranceNumber` (`InsuranceNumber`),
  KEY `OperatorID` (`OperatorID`),
  CONSTRAINT `vehicle_ibfk_1` FOREIGN KEY (`OperatorID`) REFERENCES `fleet_operator` (`OperatorID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicle`
--

LOCK TABLES `vehicle` WRITE;
/*!40000 ALTER TABLE `vehicle` DISABLE KEYS */;
INSERT INTO `vehicle` VALUES ('DL2C 0070','F000000002','PV','Chevrolet','Enjoy','Silver','CN202205','RC202205','ISN202205'),('KA01 1975','F000000004','PP','Toyota','Etios','Silver','CN202206','RC202206','ISN202206'),('MH12 5815','F000000001','MI','Nissan','Micra','Silver','CN202202','RC202202','ISN202202'),('MH13 1602',NULL,'PS','Maruti','Swift-Dzire','Silver','CN202203','RC202203','ISN202203'),('MH13 5005','F000000001','AT','Bajaj','Compact RE','Yellow-Green','CN202201','RC202201','ISN202201'),('MH47 8820','F000000003','AT','Mahindra','Alpha','Black-Yellow','CN202204','RC202204','ISN202204');
/*!40000 ALTER TABLE `vehicle` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-07-14  1:10:39
