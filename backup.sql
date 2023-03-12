-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: movie_booking
-- ------------------------------------------------------
-- Server version	8.0.31

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
-- Table structure for table `bookings`
--

DROP TABLE IF EXISTS `bookings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bookings` (
  `bookingID` int NOT NULL AUTO_INCREMENT,
  `showtimeID` varchar(255) NOT NULL,
  `seatID` json NOT NULL,
  `userID` int NOT NULL,
  `price` int NOT NULL,
  `discountID` varchar(255) NOT NULL,
  PRIMARY KEY (`bookingID`),
  KEY `showtimeID` (`showtimeID`),
  KEY `userID` (`userID`),
  KEY `discountID` (`discountID`),
  CONSTRAINT `bookings_ibfk_1` FOREIGN KEY (`showtimeID`) REFERENCES `showtimes` (`showtimeID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `bookings_ibfk_2` FOREIGN KEY (`userID`) REFERENCES `users` (`userID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `bookings_ibfk_3` FOREIGN KEY (`discountID`) REFERENCES `discount` (`discountID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookings`
--

LOCK TABLES `bookings` WRITE;
/*!40000 ALTER TABLE `bookings` DISABLE KEYS */;
INSERT INTO `bookings` VALUES (1,'ST0001','[\"S0001\", \"S0002\", \"S0003\", \"S0004\"]',18,100,'D001'),(2,'ST0012','[\"S0010\"]',24,100,'D002'),(3,'ST0002','[\"S0021\", \"S0022\", \"S0023\", \"S0024\", \"S0025\"]',18,120,'D003'),(4,'ST0019','[\"S0045\", \"S0046\", \"S0047\"]',25,120,'D004'),(5,'ST0003','[\"S0054\", \"S0055\"]',18,100,'D005'),(6,'ST0013','[\"S0123\", \"S0124\", \"S0125\"]',18,100,'D006'),(7,'ST0014','[\"S0007\", \"S0008\", \"S0009\", \"S0010\"]',24,100,'D007'),(8,'ST0004','[\"S0023\", \"S0024\"]',25,100,'D008'),(9,'ST0025','[\"S0235\", \"S0236\", \"S0237\"]',18,120,'D009'),(10,'ST0026','[\"S0367\", \"S0368\"]',24,120,'D010'),(11,'ST0016','[\"S0395\", \"S0396\", \"S0397\"]',25,100,'D001'),(12,'ST0006','[\"S0022\", \"S0023\", \"S0024\", \"S0025\"]',25,100,'D002'),(13,'ST0017','[\"S0154\"]',25,120,'D003'),(14,'ST0007','[\"S0059\", \"S0060\"]',18,120,'D004'),(15,'ST0018','[\"S0349\", \"S0050\", \"S0051\"]',18,100,'D005'),(16,'ST0008','[\"S0016\", \"S0017\", \"S0018\", \"S0019\", \"S0020\", \"S0021\"]',18,100,'D006'),(17,'ST0028','[\"S0004\", \"S0005\"]',24,100,'D007'),(18,'ST0029','[\"S0009\"]',24,100,'D008'),(19,'ST0010','[\"S0019\", \"S0020\"]',24,120,'D009'),(20,'ST0013','[\"S0298\", \"S0299\", \"S0300\"]',18,120,'D010'),(21,'ST0015','[\"S0238\", \"S0239\"]',24,100,'D001'),(22,'ST0017','[\"S0294\", \"S0294\"]',25,100,'D002'),(23,'ST0011','[\"S0282\", \"S0283\", \"S0284\"]',18,120,'D003'),(24,'ST0012','[\"S0059\"]',24,120,'D004'),(25,'ST0019','[\"S0202\", \"S0203\", \"S0204\", \"S0205\"]',25,100,'D005'),(26,'ST0023','[\"S0308\", \"S0309\"]',18,100,'D006'),(27,'ST0023','[\"S0108\", \"S0109\"]',24,100,'D007'),(28,'ST0029','[\"S0199\"]',24,100,'D008'),(29,'ST0001','[\"S0017\"]',24,100,'D001'),(30,'ST0020','[\"S0029\", \"S0030\", \"S0031\"]',24,100,'D002'),(31,'ST0021','[\"S0066\", \"S0067\"]',25,120,'D003'),(32,'ST0027','[\"S0073\"]',25,120,'D004'),(33,'ST0027','[\"S0079\"]',25,100,'D005'),(34,'ST0003','[\"S0053\", \"S0054\", \"S0055\"]',18,100,'D006'),(35,'ST0016','[\"S0049\", \"S0050\"]',18,100,'D007'),(36,'ST0016','[\"S0246\", \"S0247\"]',18,100,'D008'),(37,'ST0016','[\"S0357\"]',24,120,'D009'),(38,'ST0028','[\"S0235\"]',18,120,'D010'),(39,'ST0030','[\"S0033\", \"S0034\", \"S0035\", \"S0036\"]',24,100,'D001'),(40,'ST0016','[\"S0077\", \"S0078\"]',24,100,'D002'),(41,'ST0024','[\"S0081\", \"S0082\"]',25,120,'D003'),(42,'ST0022','[\"S0178\"]',25,120,'D004'),(43,'ST0022','[\"S0187\", \"S0188\"]',25,100,'D005'),(44,'ST0017','[\"S0333\"]',18,100,'D006'),(45,'ST0011','[\"S0222\"]',25,100,'D007'),(46,'ST0011','[\"S0055\", \"S0056\", \"S0057\"]',18,100,'D008'),(47,'ST0014','[\"S0195\", \"S0196\", \"S0197\"]',25,120,'D009'),(48,'ST0026','[\"S0279\"]',24,120,'D010'),(49,'ST0024','[\"S0256\", \"S0257\"]',18,100,'D001'),(50,'ST0024','[\"S0169\", \"S0170\"]',18,100,'D002'),(51,'ST0022','[\"S0064\", \"S0065\", \"S0066\"]',24,120,'D003'),(52,'ST0001','[\"S0049\"]',25,120,'D004'),(53,'ST0002','[\"S0255\", \"S0256\", \"S0257\", \"S0258\"]',25,100,'D005'),(54,'ST0001','[\"S0373\", \"S0374\"]',18,100,'D006'),(55,'ST0007','[\"S0072\"]',24,100,'D007'),(56,'ST0006','[\"S0383\", \"S0384\"]',25,100,'D008'),(57,'ST0008','[\"S0299\", \"S0300\"]',18,100,'D005'),(58,'ST0009','[\"S0111\", \"S0112\", \"S0113\"]',24,100,'D006'),(59,'ST0005','[\"S0113\"]',25,100,'D007'),(60,'ST0004','[\"S0115\", \"S0116\", \"S0117\", \"S0118\"]',18,100,'D008'),(61,'ST0027','\"S0017\"',18,100,'D001'),(62,'ST0027','[\"S0017\", \"S0018\"]',18,100,'D001'),(67,'ST0027','[\"S0017\", \"S0018\"]',18,100,'D001'),(68,'ST0027','[\"S0017\", \"S0018\"]',18,100,'D001'),(69,'ST0027','[\"S0017\", \"S0018\"]',18,100,'D001'),(70,'ST0027','[\"S0017\", \"S0018\"]',18,100,'D001'),(71,'ST0027','[\"S0017\", \"S0018\"]',18,100,'D001'),(72,'ST0027','[\"S0017\", \"S0018\"]',18,100,'D001'),(73,'ST0027','[\"S0017\", \"S0018\"]',18,100,'D001'),(74,'ST0027','[\"S0017\", \"S0018\"]',18,100,'D001'),(75,'ST0027','[\"S0017\", \"S0018\"]',18,100,'D001'),(76,'ST0027','[\"S0017\", \"S0018\"]',18,100,'D001'),(77,'ST0027','[\"S0017\", \"S0018\"]',24,100,'D001'),(78,'ST0027','[\"S0017\", \"S0018\"]',25,100,'D001');
/*!40000 ALTER TABLE `bookings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discount`
--

DROP TABLE IF EXISTS `discount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `discount` (
  `discountID` varchar(255) NOT NULL,
  `number` int NOT NULL,
  `percentage` double NOT NULL,
  PRIMARY KEY (`discountID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discount`
--

LOCK TABLES `discount` WRITE;
/*!40000 ALTER TABLE `discount` DISABLE KEYS */;
INSERT INTO `discount` VALUES ('D001',5,0.1),('D002',3,0.05),('D003',2,0.02),('D004',1,0.01),('D005',5,0.2),('D006',2,0.1),('D007',4,0.15),('D008',3,0.1),('D009',2,0.05),('D010',5,0.25);
/*!40000 ALTER TABLE `discount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movies`
--

DROP TABLE IF EXISTS `movies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movies` (
  `movieID` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `category` varchar(255) NOT NULL,
  `director` varchar(255) NOT NULL,
  `casts` json NOT NULL,
  `release_date` date NOT NULL,
  `trailerURL` varchar(255) NOT NULL,
  `rating` int NOT NULL,
  `duration` varchar(45) NOT NULL,
  `ticket_count` int NOT NULL,
  PRIMARY KEY (`movieID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movies`
--

LOCK TABLES `movies` WRITE;
/*!40000 ALTER TABLE `movies` DISABLE KEYS */;
INSERT INTO `movies` VALUES ('M0001','The Shawshank Redemption','Two imprisoned men bond over a number of years, finding solace and eventual redemption through acts of common decency.','Drama','Frank Darabont','[\"Tim Robbins\", \"Morgan Freeman\"]','1994-10-14','https://www.youtube.com/watch?v=6hB3S9bIaco',9,'2h 22m',100),('M0002','The Godfather','The aging patriarch of an organized crime dynasty transfers control of his clandestine empire to his reluctant son.','Crime','Francis Ford Coppola','[\"Marlon Brando\", \"Al Pacino\", \"James Caan\"]','1972-03-24','https://www.youtube.com/watch?v=sY1S34973zA',9,'2h 58m',150),('M0003','The Dark Knight','When the menace known as the Joker wreaks havoc and chaos on the people of Gotham, Batman must accept one of the greatest psychological and physical tests of his ability to fight injustice.','Action','Christopher Nolan','[\"Christian Bale\", \"Heath Ledger\", \"Aaron Eckhart\"]','2008-07-18','https://www.youtube.com/watch?v=EXeTwQWrcwY',9,'2h 32m',200),('M0004','The Shawshank Redemption','Two imprisoned men bond over a number of years, finding solace and eventual redemption through acts of common decency.','Drama','Frank Darabont','[\"Tim Robbins\", \"Morgan Freeman\"]','1994-10-14','https://www.youtube.com/watch?v=6hB3S9bIaco',9,'2h 22m',100),('M0005','The Godfather','The aging patriarch of an organized crime dynasty transfers control of his clandestine empire to his reluctant son.','Crime','Francis Ford Coppola','[\"Marlon Brando\", \"Al Pacino\", \"James Caan\"]','1972-03-24','https://www.youtube.com/watch?v=sY1S34973zA',9,'2h 58m',150),('M0006','The Matrix','A computer hacker learns from mysterious rebels about the true nature of his reality and his role in the war against its controllers.','Action','Lana Wachowski','[\"Keanu Reeves\", \"Laurence Fishburne\", \"Carrie-Anne Moss\"]','1999-03-31','https://www.youtube.com/watch?v=vKQi3bBA1y8',9,'2h 16m',200),('M0007','Forrest Gump','Forrest Gump, while not intelligent, has accidentally been present at many historic moments, but his true love, Jenny Curran, eludes him.','Drama','Robert Zemeckis','[\"Tom Hanks\", \"Robin Wright\", \"Gary Sinise\"]','1994-07-06','https://www.youtube.com/watch?v=uPIEn0M8su0',9,'2h 22m',250),('M0008','The Shawshank Redemption','Two imprisoned men bond over a number of years, finding solace and eventual redemption through acts of common decency.','Drama','Frank Darabont','[\"Tim Robbins\", \"Morgan Freeman\", \"Bob Gunton\"]','1994-09-23','https://www.youtube.com/watch?v=6hB3S9bIaco',9,'2h 22m',300),('M0009','The Godfather','The aging patriarch of an organized crime dynasty transfers control of his clandestine empire to his reluctant son.','Crime','Francis Ford Coppola','[\"Marlon Brando\", \"Al Pacino\", \"James Caan\"]','1972-03-24','https://www.youtube.com/watch?v=sY1S34973zA',9,'2h 58m',400),('M0010','Pulp Fiction','The lives of two mob hitmen, a boxer, a gangster and his wife, and a pair of diner bandits intertwine in four tales of violence and redemption.','Crime','Quentin Tarantino','[\"John Travolta\", \"Samuel L. Jackson\", \"Uma Thurman\"]','1994-10-14','https://www.youtube.com/watch?v=s7EdQ4FqbhY',9,'2h 34m',150),('M0011','The New Year','A heartwarming story about new beginnings','Drama','Jane Smith','[\"John Doe\", \"Mary Johnson\", \"Bob Brown\"]','2021-01-01','https://www.youtube.com/watch?v=sY1S34973zA',8,'1h 45m',500),('M0012','Escape to Paradise','A thrilling adventure on a tropical island','Action','Tom Johnson','[\"Emma Brown\", \"Alex Jones\", \"Oliver Garcia\"]','2021-05-15','https://www.youtube.com/watch?v=hkP4tVTdsz8',7,'2h 10m',800),('M0013','Love in Paris','A romantic comedy set in the City of Love','Romance','Lucy Lee','[\"Sophia Lee\", \"David Chen\", \"Emily Wang\"]','2022-02-14','https://www.youtube.com/watch?v=5-vPutKEgcc',9,'1h 55m',1200),('M0014','The Last Samurai','An epic story of a warrior in ancient Japan','Drama','Hiroshi Nakamura','[\"Ken Watanabe\", \"Tom Cruise\", \"Rinko Kikuchi\"]','2022-07-03','https://www.youtube.com/watch?v=T50_qHEOahQ',8,'2h 30m',1500),('M0015','The Space Race','A sci-fi adventure set in outer space','Science Fiction','Mike Johnson','[\"John Smith\", \"Sara Lee\", \"Samuel Kim\"]','2023-01-20','https://www.youtube.com/watch?v=VKe9RhX8Ra0',7,'2h 20m',900),('M0016','The Lost City','A treasure hunt in the Amazon jungle','Adventure','Anna Martinez','[\"Daniel Brown\", \"Sophie Wilson\", \"Carlos Gomez\"]','2023-03-05','https://www.youtube.com/watch?v=nfKO9rYDmE8',9,'2h 15m',1000),('M0017','The Enigma Code','A spy thriller set in World War II','Thriller','Mark Johnson','[\"Tom Hardy\", \"Keira Knightley\", \"Mark Ruffalo\"]','2023-06-30','https://www.youtube.com/watch?v=4bIBaf2MF18',8,'2h 05m',1200),('M0018','The Future is Now','A dystopian tale set in the year 2050','Science Fiction','Emily Lee','[\"Alex Wong\", \"Sophia Kim\", \"David Chen\"]','2023-09-10','https://www.youtube.com/watch?v=QGwtPfjt9Zc',7,'2h 25m',800),('M0019','The Art of Forgery','A documentary about the world of art forgery','Documentary','Lucas Brown','[\"Alex Wong\", \"Sophia Kim\", \"David Chen\"]','2022-11-01','https://www.youtube.com/watch?v=TS6a3XochQU',9,'1h 30m',500);
/*!40000 ALTER TABLE `movies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment` (
  `paymentID` int NOT NULL AUTO_INCREMENT,
  `bookingID` int NOT NULL,
  `payment_method` varchar(255) NOT NULL,
  `received` tinyint(1) NOT NULL,
  PRIMARY KEY (`paymentID`),
  KEY `bookingID` (`bookingID`),
  CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`bookingID`) REFERENCES `bookings` (`bookingID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
INSERT INTO `payment` VALUES (1,14,' credit card ',0),(2,38,'visa',1),(3,51,' visa ',0),(4,4,'master card',0),(5,12,' credit card ',0),(6,7,'credit card',1),(7,24,' credit card ',1),(8,35,'master card',1),(9,13,' master card ',0),(10,21,' credit card ',1),(11,9,' master card ',1),(12,44,' visa ',1),(13,37,' credit card ',0),(14,45,' credit card ',0),(15,58,' master card ',1),(16,46,' credit card ',1),(17,13,' master card ',0),(18,51,' master card ',0),(19,31,' master card ',1),(20,26,' credit card ',1),(21,43,' credit card ',0),(22,8,' visa ',1),(23,9,' visa ',1),(24,38,' visa ',1),(25,2,' visa ',0),(26,12,' master card ',0),(27,3,' credit card ',1),(28,51,' master card ',1),(29,47,' visa ',1),(30,46,' visa ',1);
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seats`
--

DROP TABLE IF EXISTS `seats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seats` (
  `seatID` varchar(255) NOT NULL,
  `theaterID` varchar(255) NOT NULL,
  `r_number` varchar(255) NOT NULL,
  `c_number` int NOT NULL,
  PRIMARY KEY (`seatID`),
  KEY `theaterID` (`theaterID`),
  CONSTRAINT `seats_ibfk_1` FOREIGN KEY (`theaterID`) REFERENCES `theaters` (`theaterID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seats`
--

LOCK TABLES `seats` WRITE;
/*!40000 ALTER TABLE `seats` DISABLE KEYS */;
INSERT INTO `seats` VALUES ('S0000','T0001','A',0),('S0001','T0001','A',1),('S0002','T0001','A',2),('S0003','T0001','A',3),('S0004','T0001','A',4),('S0005','T0001','A',5),('S0006','T0001','A',6),('S0007','T0001','A',7),('S0008','T0001','A',8),('S0009','T0001','A',9),('S0010','T0001','B',0),('S0011','T0001','B',1),('S0012','T0001','B',2),('S0013','T0001','B',3),('S0014','T0001','B',4),('S0015','T0001','B',5),('S0016','T0001','B',6),('S0017','T0001','B',7),('S0018','T0001','B',8),('S0019','T0001','B',9),('S0020','T0001','C',0),('S0021','T0001','C',1),('S0022','T0001','C',2),('S0023','T0001','C',3),('S0024','T0001','C',4),('S0025','T0001','C',5),('S0026','T0001','C',6),('S0027','T0001','C',7),('S0028','T0001','C',8),('S0029','T0001','C',9),('S0030','T0001','D',0),('S0031','T0001','D',1),('S0032','T0001','D',2),('S0033','T0001','D',3),('S0034','T0001','D',4),('S0035','T0001','D',5),('S0036','T0001','D',6),('S0037','T0001','D',7),('S0038','T0001','D',8),('S0039','T0001','D',9),('S0040','T0001','E',0),('S0041','T0001','E',1),('S0042','T0001','E',2),('S0043','T0001','E',3),('S0044','T0001','E',4),('S0045','T0001','E',5),('S0046','T0001','E',6),('S0047','T0001','E',7),('S0048','T0001','E',8),('S0049','T0001','E',9),('S0050','T0001','F',0),('S0051','T0001','F',1),('S0052','T0001','F',2),('S0053','T0001','F',3),('S0054','T0001','F',4),('S0055','T0001','F',5),('S0056','T0001','F',6),('S0057','T0001','F',7),('S0058','T0001','F',8),('S0059','T0001','F',9),('S0060','T0001','G',0),('S0061','T0001','G',1),('S0062','T0001','G',2),('S0063','T0001','G',3),('S0064','T0001','G',4),('S0065','T0001','G',5),('S0066','T0001','G',6),('S0067','T0001','G',7),('S0068','T0001','G',8),('S0069','T0001','G',9),('S0070','T0001','H',0),('S0071','T0001','H',1),('S0072','T0001','H',2),('S0073','T0001','H',3),('S0074','T0001','H',4),('S0075','T0001','H',5),('S0076','T0001','H',6),('S0077','T0001','H',7),('S0078','T0001','H',8),('S0079','T0001','H',9),('S0080','T0001','I',0),('S0081','T0001','I',1),('S0082','T0001','I',2),('S0083','T0001','I',3),('S0084','T0001','I',4),('S0085','T0001','I',5),('S0086','T0001','I',6),('S0087','T0001','I',7),('S0088','T0001','I',8),('S0089','T0001','I',9),('S0090','T0001','J',0),('S0091','T0001','J',1),('S0092','T0001','J',2),('S0093','T0001','J',3),('S0094','T0001','J',4),('S0095','T0001','J',5),('S0096','T0001','J',6),('S0097','T0001','J',7),('S0098','T0001','J',8),('S0099','T0001','J',9),('S0100','T0002','A',0),('S0101','T0002','A',1),('S0102','T0002','A',2),('S0103','T0002','A',3),('S0104','T0002','A',4),('S0105','T0002','A',5),('S0106','T0002','A',6),('S0107','T0002','A',7),('S0108','T0002','A',8),('S0109','T0002','A',9),('S0110','T0002','B',0),('S0111','T0002','B',1),('S0112','T0002','B',2),('S0113','T0002','B',3),('S0114','T0002','B',4),('S0115','T0002','B',5),('S0116','T0002','B',6),('S0117','T0002','B',7),('S0118','T0002','B',8),('S0119','T0002','B',9),('S0120','T0002','C',0),('S0121','T0002','C',1),('S0122','T0002','C',2),('S0123','T0002','C',3),('S0124','T0002','C',4),('S0125','T0002','C',5),('S0126','T0002','C',6),('S0127','T0002','C',7),('S0128','T0002','C',8),('S0129','T0002','C',9),('S0130','T0002','D',0),('S0131','T0002','D',1),('S0132','T0002','D',2),('S0133','T0002','D',3),('S0134','T0002','D',4),('S0135','T0002','D',5),('S0136','T0002','D',6),('S0137','T0002','D',7),('S0138','T0002','D',8),('S0139','T0002','D',9),('S0140','T0002','E',0),('S0141','T0002','E',1),('S0142','T0002','E',2),('S0143','T0002','E',3),('S0144','T0002','E',4),('S0145','T0002','E',5),('S0146','T0002','E',6),('S0147','T0002','E',7),('S0148','T0002','E',8),('S0149','T0002','E',9),('S0150','T0002','F',0),('S0151','T0002','F',1),('S0152','T0002','F',2),('S0153','T0002','F',3),('S0154','T0002','F',4),('S0155','T0002','F',5),('S0156','T0002','F',6),('S0157','T0002','F',7),('S0158','T0002','F',8),('S0159','T0002','F',9),('S0160','T0002','G',0),('S0161','T0002','G',1),('S0162','T0002','G',2),('S0163','T0002','G',3),('S0164','T0002','G',4),('S0165','T0002','G',5),('S0166','T0002','G',6),('S0167','T0002','G',7),('S0168','T0002','G',8),('S0169','T0002','G',9),('S0170','T0002','H',0),('S0171','T0002','H',1),('S0172','T0002','H',2),('S0173','T0002','H',3),('S0174','T0002','H',4),('S0175','T0002','H',5),('S0176','T0002','H',6),('S0177','T0002','H',7),('S0178','T0002','H',8),('S0179','T0002','H',9),('S0180','T0002','I',0),('S0181','T0002','I',1),('S0182','T0002','I',2),('S0183','T0002','I',3),('S0184','T0002','I',4),('S0185','T0002','I',5),('S0186','T0002','I',6),('S0187','T0002','I',7),('S0188','T0002','I',8),('S0189','T0002','I',9),('S0190','T0002','J',0),('S0191','T0002','J',1),('S0192','T0002','J',2),('S0193','T0002','J',3),('S0194','T0002','J',4),('S0195','T0002','J',5),('S0196','T0002','J',6),('S0197','T0002','J',7),('S0198','T0002','J',8),('S0199','T0002','J',9),('S0200','T0003','A',0),('S0201','T0003','A',1),('S0202','T0003','A',2),('S0203','T0003','A',3),('S0204','T0003','A',4),('S0205','T0003','A',5),('S0206','T0003','A',6),('S0207','T0003','A',7),('S0208','T0003','A',8),('S0209','T0003','A',9),('S0210','T0003','B',0),('S0211','T0003','B',1),('S0212','T0003','B',2),('S0213','T0003','B',3),('S0214','T0003','B',4),('S0215','T0003','B',5),('S0216','T0003','B',6),('S0217','T0003','B',7),('S0218','T0003','B',8),('S0219','T0003','B',9),('S0220','T0003','C',0),('S0221','T0003','C',1),('S0222','T0003','C',2),('S0223','T0003','C',3),('S0224','T0003','C',4),('S0225','T0003','C',5),('S0226','T0003','C',6),('S0227','T0003','C',7),('S0228','T0003','C',8),('S0229','T0003','C',9),('S0230','T0003','D',0),('S0231','T0003','D',1),('S0232','T0003','D',2),('S0233','T0003','D',3),('S0234','T0003','D',4),('S0235','T0003','D',5),('S0236','T0003','D',6),('S0237','T0003','D',7),('S0238','T0003','D',8),('S0239','T0003','D',9),('S0240','T0003','E',0),('S0241','T0003','E',1),('S0242','T0003','E',2),('S0243','T0003','E',3),('S0244','T0003','E',4),('S0245','T0003','E',5),('S0246','T0003','E',6),('S0247','T0003','E',7),('S0248','T0003','E',8),('S0249','T0003','E',9),('S0250','T0003','F',0),('S0251','T0003','F',1),('S0252','T0003','F',2),('S0253','T0003','F',3),('S0254','T0003','F',4),('S0255','T0003','F',5),('S0256','T0003','F',6),('S0257','T0003','F',7),('S0258','T0003','F',8),('S0259','T0003','F',9),('S0260','T0003','G',0),('S0261','T0003','G',1),('S0262','T0003','G',2),('S0263','T0003','G',3),('S0264','T0003','G',4),('S0265','T0003','G',5),('S0266','T0003','G',6),('S0267','T0003','G',7),('S0268','T0003','G',8),('S0269','T0003','G',9),('S0270','T0003','H',0),('S0271','T0003','H',1),('S0272','T0003','H',2),('S0273','T0003','H',3),('S0274','T0003','H',4),('S0275','T0003','H',5),('S0276','T0003','H',6),('S0277','T0003','H',7),('S0278','T0003','H',8),('S0279','T0003','H',9),('S0280','T0003','I',0),('S0281','T0003','I',1),('S0282','T0003','I',2),('S0283','T0003','I',3),('S0284','T0003','I',4),('S0285','T0003','I',5),('S0286','T0003','I',6),('S0287','T0003','I',7),('S0288','T0003','I',8),('S0289','T0003','I',9),('S0290','T0003','J',0),('S0291','T0003','J',1),('S0292','T0003','J',2),('S0293','T0003','J',3),('S0294','T0003','J',4),('S0295','T0003','J',5),('S0296','T0003','J',6),('S0297','T0003','J',7),('S0298','T0003','J',8),('S0299','T0003','J',9),('S0300','T0004','A',0),('S0301','T0004','A',1),('S0302','T0004','A',2),('S0303','T0004','A',3),('S0304','T0004','A',4),('S0305','T0004','A',5),('S0306','T0004','A',6),('S0307','T0004','A',7),('S0308','T0004','A',8),('S0309','T0004','A',9),('S0310','T0004','B',0),('S0311','T0004','B',1),('S0312','T0004','B',2),('S0313','T0004','B',3),('S0314','T0004','B',4),('S0315','T0004','B',5),('S0316','T0004','B',6),('S0317','T0004','B',7),('S0318','T0004','B',8),('S0319','T0004','B',9),('S0320','T0004','C',0),('S0321','T0004','C',1),('S0322','T0004','C',2),('S0323','T0004','C',3),('S0324','T0004','C',4),('S0325','T0004','C',5),('S0326','T0004','C',6),('S0327','T0004','C',7),('S0328','T0004','C',8),('S0329','T0004','C',9),('S0330','T0004','D',0),('S0331','T0004','D',1),('S0332','T0004','D',2),('S0333','T0004','D',3),('S0334','T0004','D',4),('S0335','T0004','D',5),('S0336','T0004','D',6),('S0337','T0004','D',7),('S0338','T0004','D',8),('S0339','T0004','D',9),('S0340','T0004','E',0),('S0341','T0004','E',1),('S0342','T0004','E',2),('S0343','T0004','E',3),('S0344','T0004','E',4),('S0345','T0004','E',5),('S0346','T0004','E',6),('S0347','T0004','E',7),('S0348','T0004','E',8),('S0349','T0004','E',9),('S0350','T0004','F',0),('S0351','T0004','F',1),('S0352','T0004','F',2),('S0353','T0004','F',3),('S0354','T0004','F',4),('S0355','T0004','F',5),('S0356','T0004','F',6),('S0357','T0004','F',7),('S0358','T0004','F',8),('S0359','T0004','F',9),('S0360','T0004','G',0),('S0361','T0004','G',1),('S0362','T0004','G',2),('S0363','T0004','G',3),('S0364','T0004','G',4),('S0365','T0004','G',5),('S0366','T0004','G',6),('S0367','T0004','G',7),('S0368','T0004','G',8),('S0369','T0004','G',9),('S0370','T0004','H',0),('S0371','T0004','H',1),('S0372','T0004','H',2),('S0373','T0004','H',3),('S0374','T0004','H',4),('S0375','T0004','H',5),('S0376','T0004','H',6),('S0377','T0004','H',7),('S0378','T0004','H',8),('S0379','T0004','H',9),('S0380','T0004','I',0),('S0381','T0004','I',1),('S0382','T0004','I',2),('S0383','T0004','I',3),('S0384','T0004','I',4),('S0385','T0004','I',5),('S0386','T0004','I',6),('S0387','T0004','I',7),('S0388','T0004','I',8),('S0389','T0004','I',9),('S0390','T0004','J',0),('S0391','T0004','J',1),('S0392','T0004','J',2),('S0393','T0004','J',3),('S0394','T0004','J',4),('S0395','T0004','J',5),('S0396','T0004','J',6),('S0397','T0004','J',7),('S0398','T0004','J',8),('S0399','T0004','J',9);
/*!40000 ALTER TABLE `seats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `showtimes`
--

DROP TABLE IF EXISTS `showtimes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `showtimes` (
  `showtimeID` varchar(255) NOT NULL,
  `movieID` varchar(255) NOT NULL,
  `theaterID` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  PRIMARY KEY (`showtimeID`),
  KEY `movieID` (`movieID`),
  KEY `theaterID` (`theaterID`),
  CONSTRAINT `showtimes_ibfk_1` FOREIGN KEY (`movieID`) REFERENCES `movies` (`movieID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `showtimes_ibfk_2` FOREIGN KEY (`theaterID`) REFERENCES `theaters` (`theaterID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `showtimes`
--

LOCK TABLES `showtimes` WRITE;
/*!40000 ALTER TABLE `showtimes` DISABLE KEYS */;
INSERT INTO `showtimes` VALUES ('ST0001','M0001','T0001','2023-03-01','09:00:00'),('ST0002','M0002','T0002','2023-03-01','11:30:00'),('ST0003','M0003','T0003','2023-03-01','14:00:00'),('ST0004','M0004','T0004','2023-03-01','16:30:00'),('ST0005','M0005','T0001','2023-03-01','19:00:00'),('ST0006','M0006','T0002','2023-03-02','09:00:00'),('ST0007','M0007','T0003','2023-03-02','11:30:00'),('ST0008','M0008','T0004','2023-03-02','14:00:00'),('ST0009','M0009','T0001','2023-03-02','16:30:00'),('ST0010','M0010','T0002','2023-03-02','19:00:00'),('ST0011','M0001','T0001','2023-02-20','13:00:00'),('ST0012','M0003','T0002','2023-02-20','15:30:00'),('ST0013','M0004','T0003','2023-02-21','19:00:00'),('ST0014','M0002','T0001','2023-02-21','16:00:00'),('ST0015','M0005','T0004','2023-02-22','14:30:00'),('ST0016','M0006','T0002','2023-02-22','17:00:00'),('ST0017','M0007','T0003','2023-02-23','20:00:00'),('ST0018','M0008','T0001','2023-02-23','15:00:00'),('ST0019','M0009','T0004','2023-02-24','18:30:00'),('ST0020','M0010','T0002','2023-02-24','21:00:00'),('ST0021','M0001','T0001','2023-02-17','13:00:00'),('ST0022','M0002','T0002','2023-02-17','14:30:00'),('ST0023','M0003','T0003','2023-02-17','16:00:00'),('ST0024','M0004','T0004','2023-02-17','18:00:00'),('ST0025','M0005','T0001','2023-02-17','19:30:00'),('ST0026','M0006','T0002','2023-02-18','12:00:00'),('ST0027','M0007','T0003','2023-02-18','13:30:00'),('ST0028','M0008','T0004','2023-02-18','15:00:00'),('ST0029','M0009','T0001','2023-02-18','17:00:00'),('ST0030','M0010','T0002','2023-02-18','19:00:00');
/*!40000 ALTER TABLE `showtimes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `theaters`
--

DROP TABLE IF EXISTS `theaters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `theaters` (
  `theaterID` varchar(255) NOT NULL,
  `theater_name` varchar(255) NOT NULL,
  `capacity` int NOT NULL,
  `address` varchar(255) NOT NULL,
  PRIMARY KEY (`theaterID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `theaters`
--

LOCK TABLES `theaters` WRITE;
/*!40000 ALTER TABLE `theaters` DISABLE KEYS */;
INSERT INTO `theaters` VALUES ('T0001','Cineplex 1',100,'123 Main St'),('T0002','AMC Theaters',150,'456 Broadway'),('T0003','Regal Cinema',100,'789 5th Ave'),('T0004','MegaPlex',150,'111 8th Ave');
/*!40000 ALTER TABLE `theaters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `token_black_list`
--

DROP TABLE IF EXISTS `token_black_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `token_black_list` (
  `id` int NOT NULL AUTO_INCREMENT,
  `token` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `token_black_list`
--

LOCK TABLES `token_black_list` WRITE;
/*!40000 ALTER TABLE `token_black_list` DISABLE KEYS */;
INSERT INTO `token_black_list` VALUES (1,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySUQiOjEzLCJpYXQiOjE2NzgwMjI5NzMsImV4cCI6MTc2NDQyMjk3M30.q6aFSJPfyW8p53qUCcjcNyLSdb7QGzQQ7AoW-UTrbE0'),(2,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpYXQiOjE2NzgwMjcxMjYsImV4cCI6MTY3ODExMzUyNn0.8-7IWywo574sAvRTYbIFY8PXNKCPlVaVx_ab_2644-4'),(3,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpYXQiOjE2NzgwMjc1MzgsImV4cCI6MTY3ODExMzkzOH0.u_wKOJM4mYk1vWtzVNENdyhsYse3WVt3S0ZNvqZ2A1E'),(4,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpYXQiOjE2NzgwMjc4MDYsImV4cCI6MTY3ODExNDIwNn0.ruGoQupOnBfOV3G5c8vyP5ss_gHvHYwWUfwdXAt70Lw');
/*!40000 ALTER TABLE `token_black_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tokens`
--

DROP TABLE IF EXISTS `tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tokens` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userID` int NOT NULL,
  `token` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `userID` (`userID`),
  CONSTRAINT `tokens_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `users` (`userID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tokens`
--

LOCK TABLES `tokens` WRITE;
/*!40000 ALTER TABLE `tokens` DISABLE KEYS */;
INSERT INTO `tokens` VALUES (11,18,'106df7adf9bda753312d7855348d02f1'),(17,24,'385c996bb60fefe2dfd790217e8b5bbb'),(18,25,'1731ce28957ee5cd86410b63a391ea7b');
/*!40000 ALTER TABLE `tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `userID` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `credit_card` varchar(255) DEFAULT NULL,
  `booking_history` json DEFAULT NULL,
  `wishlist` json DEFAULT NULL,
  `isVerified` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`userID`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (18,'phong','$2b$10$jVOX6BZfvZMBzYxZuWpBWeei5T.b5DSlMrRN4Us2rz..Ji3lB4wsu','phongnguyenhai2308@gmail.com','0123456785','123456785','[]','[]',1),(24,'phong nguyen','$2b$10$uK1pSSdomsll3.xUr3ZO1.WU2T4E5gfshO4wbeol2/oufpaXckw9u','nguyenhaiphong2308@gmail.com','0123456781',NULL,'[\"ST0001\", \"ST0027\"]','[\"M0005\"]',1),(25,'Phong Nguyễn Hải','$2b$10$K3LbK.Dek7AwvSXAiugasuGSwq6JzZC4Rltln9rJDrVfplrwW8uLy','phongnh@cystack.net','0123456780','11111111','[\"ST0027\"]','[\"M0003\", \"M0004\", \"M0005\"]',1);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-03-12 20:56:53
