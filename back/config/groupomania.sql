-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: localhost    Database: groupomania
-- ------------------------------------------------------
-- Server version	8.0.29

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
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `idUser` int NOT NULL,
  `idPost` int NOT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idUser` (`idUser`),
  KEY `idPost` (`idPost`),
  CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`idUser`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_10` FOREIGN KEY (`idPost`) REFERENCES `posts` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_11` FOREIGN KEY (`idUser`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_12` FOREIGN KEY (`idPost`) REFERENCES `posts` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_13` FOREIGN KEY (`idUser`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_14` FOREIGN KEY (`idPost`) REFERENCES `posts` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_15` FOREIGN KEY (`idUser`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_16` FOREIGN KEY (`idPost`) REFERENCES `posts` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_17` FOREIGN KEY (`idUser`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_18` FOREIGN KEY (`idPost`) REFERENCES `posts` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_19` FOREIGN KEY (`idUser`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`idPost`) REFERENCES `posts` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_20` FOREIGN KEY (`idPost`) REFERENCES `posts` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_21` FOREIGN KEY (`idUser`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_22` FOREIGN KEY (`idPost`) REFERENCES `posts` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_23` FOREIGN KEY (`idUser`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_24` FOREIGN KEY (`idPost`) REFERENCES `posts` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_25` FOREIGN KEY (`idUser`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_26` FOREIGN KEY (`idPost`) REFERENCES `posts` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_27` FOREIGN KEY (`idUser`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_28` FOREIGN KEY (`idPost`) REFERENCES `posts` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_29` FOREIGN KEY (`idUser`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_3` FOREIGN KEY (`idUser`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_30` FOREIGN KEY (`idPost`) REFERENCES `posts` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_31` FOREIGN KEY (`idUser`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_32` FOREIGN KEY (`idPost`) REFERENCES `posts` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_33` FOREIGN KEY (`idUser`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_34` FOREIGN KEY (`idPost`) REFERENCES `posts` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_35` FOREIGN KEY (`idUser`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_36` FOREIGN KEY (`idPost`) REFERENCES `posts` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_37` FOREIGN KEY (`idUser`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_38` FOREIGN KEY (`idPost`) REFERENCES `posts` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_39` FOREIGN KEY (`idUser`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_4` FOREIGN KEY (`idPost`) REFERENCES `posts` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_40` FOREIGN KEY (`idPost`) REFERENCES `posts` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_41` FOREIGN KEY (`idUser`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_42` FOREIGN KEY (`idPost`) REFERENCES `posts` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_5` FOREIGN KEY (`idUser`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_6` FOREIGN KEY (`idPost`) REFERENCES `posts` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_7` FOREIGN KEY (`idUser`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_8` FOREIGN KEY (`idPost`) REFERENCES `posts` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_9` FOREIGN KEY (`idUser`) REFERENCES `users` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES (18,6,95,'bijour','2022-06-21 09:58:59','2022-06-21 09:58:59'),(19,6,96,'Vivement les vacances !!!','2022-06-21 10:08:08','2022-06-21 10:08:08');
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `content` text,
  `image` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `idUser` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idUser` (`idUser`),
  CONSTRAINT `posts_ibfk_1` FOREIGN KEY (`idUser`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `posts_ibfk_10` FOREIGN KEY (`idUser`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `posts_ibfk_11` FOREIGN KEY (`idUser`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `posts_ibfk_12` FOREIGN KEY (`idUser`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `posts_ibfk_13` FOREIGN KEY (`idUser`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `posts_ibfk_14` FOREIGN KEY (`idUser`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `posts_ibfk_15` FOREIGN KEY (`idUser`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `posts_ibfk_16` FOREIGN KEY (`idUser`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `posts_ibfk_17` FOREIGN KEY (`idUser`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `posts_ibfk_18` FOREIGN KEY (`idUser`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `posts_ibfk_19` FOREIGN KEY (`idUser`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `posts_ibfk_2` FOREIGN KEY (`idUser`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `posts_ibfk_20` FOREIGN KEY (`idUser`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `posts_ibfk_21` FOREIGN KEY (`idUser`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `posts_ibfk_22` FOREIGN KEY (`idUser`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `posts_ibfk_23` FOREIGN KEY (`idUser`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `posts_ibfk_24` FOREIGN KEY (`idUser`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `posts_ibfk_3` FOREIGN KEY (`idUser`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `posts_ibfk_4` FOREIGN KEY (`idUser`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `posts_ibfk_5` FOREIGN KEY (`idUser`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `posts_ibfk_6` FOREIGN KEY (`idUser`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `posts_ibfk_7` FOREIGN KEY (`idUser`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `posts_ibfk_8` FOREIGN KEY (`idUser`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `posts_ibfk_9` FOREIGN KEY (`idUser`) REFERENCES `users` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=99 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (95,'Welcome','Bienvenue sur le réseau social de Groupomania','http://localhost:3000/images/WELCOME.jpg1655805337574.jpg','2022-06-21 09:55:37','2022-06-21 09:55:37',6),(96,'Youpi !!!','C\'est bientôt les vacances','http://localhost:3000/images/C-est-les-vacances-2010.jpg1655805746074.jpg','2022-06-21 10:02:26','2022-06-21 10:02:26',7);
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `isAdmin` tinyint(1) NOT NULL DEFAULT '0',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQUE_EMAIL` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (6,'redouanekelai@yahoo.fr','Stéphanie','R','$2b$10$XfofDwDEOq9O3GhlapAnhOO.TwdmhXSyV.1RZEpDiQXbxSAdh6EMa',1,'2022-05-25 17:05:01','2022-06-21 10:33:31'),(7,'redouanekelai@gmail.com','Luffy','Monkey','$2b$10$OIpkC1c78OLe9anLcarPW.8xH0EzazenqllmQIA6wIezPqlKj6f0K',0,'2022-05-28 12:48:45','2022-06-21 10:02:56'),(9,'r.kelai@keyfirst.fr','Redouane','Kelai','$2b$10$whXNNpVa9ZlDPEmx4Be6VOz2Dimn8pPUZKQbAolnc2oQ5Fp57M83i',0,'2022-05-28 14:18:29','2022-05-28 14:18:29'),(15,'redouanekelai@yahoo.es','Kelai','radouane','$2b$10$tMHiV1zh4WZQPw2iSeAMX.90Aa.nwFUhjELkht6Ls6/FTszZdp7iW',0,'2022-06-13 15:48:34','2022-06-13 15:48:34');
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

-- Dump completed on 2022-06-25 13:20:01
