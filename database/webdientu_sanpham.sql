-- MySQL dump 10.13  Distrib 8.0.23, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: webdientu
-- ------------------------------------------------------
-- Server version	8.0.23

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
-- Table structure for table `sanpham`
--

DROP TABLE IF EXISTS `sanpham`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sanpham` (
  `id` int NOT NULL AUTO_INCREMENT,
  `iddanhmuc` int DEFAULT NULL,
  `tensanpham` varchar(100) DEFAULT NULL,
  `giatien` bigint DEFAULT NULL,
  `hinhsanpham` varchar(100) DEFAULT NULL,
  `idthuonghieu` int DEFAULT NULL,
  `mota` text,
  `thongsokythuat` text,
  `ngaythem` timestamp NULL DEFAULT NULL,
  `hots` varchar(10) DEFAULT NULL,
  `news` varchar(10) DEFAULT NULL,
  `buys` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_sanpham_danhmuc_idx` (`iddanhmuc`),
  KEY `FKsy6e9nghw4psfd0tt2vy232rb` (`idthuonghieu`),
  CONSTRAINT `fk_sanpham_danhmuc` FOREIGN KEY (`iddanhmuc`) REFERENCES `danhmuc` (`id`),
  CONSTRAINT `FKsy6e9nghw4psfd0tt2vy232rb` FOREIGN KEY (`idthuonghieu`) REFERENCES `thuonghieu` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=118 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sanpham`
--

LOCK TABLES `sanpham` WRITE;
/*!40000 ALTER TABLE `sanpham` DISABLE KEYS */;
INSERT INTO `sanpham` VALUES (12,3,'USB ghi âm 8GB',975000,'1.jpg',9,NULL,NULL,NULL,NULL,NULL,NULL),(13,3,'USB Kingston Data',990000,'2.jpg',9,NULL,NULL,NULL,NULL,NULL,NULL),(14,3,'USB ADATA UE700 Pro',970000,'3.jpg',9,NULL,NULL,NULL,NULL,NULL,NULL),(20,3,'USB Kingston DT100G3',980000,'4.jpg',9,NULL,NULL,NULL,NULL,NULL,NULL),(21,3,'Thẻ nhớ 64GB',1250000,'5.jpg',9,NULL,NULL,NULL,NULL,NULL,NULL),(22,3,'Thẻ nhớ 16GB',940000,'6.jpg',9,NULL,NULL,NULL,NULL,NULL,NULL),(23,3,'Thẻ nhớ 8 GB',870000,'7.jpg',9,NULL,NULL,NULL,NULL,NULL,NULL),(24,3,'Thẻ nhớ 32 GB',940000,'8.jpg',9,NULL,NULL,NULL,NULL,NULL,NULL),(26,4,'Tai nghe Motospeed',980000,'1.jpg',9,NULL,NULL,NULL,NULL,NULL,NULL),(27,4,'Tai nghe không dây Sony',1200000,'2.jpg',9,NULL,NULL,NULL,NULL,NULL,NULL),(28,4,'Tai nghe Logitech',980000,'3.jpg',9,NULL,NULL,NULL,NULL,NULL,NULL),(29,4,'Tai nghe Xiaomi In Ear',760000,'4.jpg',9,NULL,NULL,NULL,NULL,NULL,NULL),(30,4,'Bluetooth Pisen LH100',2000000,'5.jpg',9,NULL,NULL,NULL,NULL,NULL,NULL),(31,4,'Bluetooth Konig K815',200000,'6.jpg',9,NULL,NULL,NULL,NULL,NULL,NULL),(32,4,'Tai nghe iSound SH20MB',999999,'7.jpg',9,NULL,NULL,NULL,NULL,NULL,NULL),(34,5,'Laptop 2 in 1 Dell Online',18500000,'1.jpg',9,NULL,NULL,NULL,NULL,NULL,NULL),(35,5,'Dell Vostro 5581',12500000,'2.jpg',9,NULL,NULL,NULL,NULL,NULL,NULL),(36,5,'Dell Vostro 5471',14500000,'3.jpg',9,NULL,NULL,NULL,NULL,NULL,NULL),(37,5,'Asus Vivobook 15',12000000,'4.jpg',9,NULL,NULL,NULL,NULL,NULL,NULL),(38,5,'HP Pavilion X2 10-n136TU',30000000,'5.jpg',9,NULL,NULL,NULL,NULL,NULL,NULL),(40,5,'Dell Inspiron 7359-C3I5019W',30000000,'7.jpg',9,NULL,NULL,NULL,NULL,NULL,NULL),(42,6,'Apple Ipad',18900000,'1.jpg',9,NULL,NULL,NULL,NULL,NULL,NULL),(43,6,'Lenovo',15400000,'2.jpg',9,NULL,NULL,NULL,NULL,NULL,NULL),(44,6,'Samsung Tab',19700000,'3.jpg',9,NULL,NULL,NULL,NULL,NULL,NULL),(45,6,'Teclast 98',18800000,'4.jpg',9,NULL,NULL,NULL,NULL,NULL,NULL),(46,6,'Huawei T1',17800000,'5.jpg',9,NULL,NULL,NULL,NULL,NULL,NULL),(47,6,'Samsung Tab A',16900000,'6.jpg',9,NULL,NULL,NULL,NULL,NULL,NULL),(48,6,'Samsung Tab S3',18700000,'7.jpg',9,NULL,NULL,NULL,NULL,NULL,NULL),(49,6,'Ipad Wifi 32GB',15900000,'8.jpg',9,NULL,NULL,NULL,NULL,NULL,NULL),(53,5,'Dell Inspiron N5458-70069879',22000000,'new-1.jpg',9,NULL,NULL,NULL,'','1',''),(55,5,'Asus TP501UA-DN094T',20000000,'hot-buys.jpg',9,NULL,NULL,NULL,'1','','1'),(57,4,'Tai nghe Microlab K300',200000,'buys-1.jpg',9,NULL,NULL,NULL,'','','1'),(70,2,'Tivi Led LG 43LH590T',22300000,'hot-buys.jpg',8,NULL,NULL,NULL,'1',NULL,'1'),(71,2,'Máy ảnh Nikon D300',2990000,'hots-1.jpg',3,NULL,NULL,NULL,'1',NULL,NULL),(72,1,'Apple iPhone 7 64GB',20000000,'hot-1.jpg',4,NULL,NULL,NULL,'1',NULL,NULL),(73,2,'TIVI LED LG UA24J4100-24',20000000,'new-buys.jpg',8,NULL,NULL,NULL,NULL,'1','1'),(78,2,'Tivi Led LG 43LH590T',22300000,'new-1.jpg',8,NULL,NULL,NULL,NULL,'1',NULL),(79,2,'TIVI LED Samsung UA43KU6000',20000000,'new-2.jpg',7,NULL,NULL,NULL,NULL,'1',NULL),(80,1,'Iphone 7 Plus 256 GB Black',21000000,'1.jpg',4,NULL,NULL,NULL,NULL,NULL,NULL),(81,1,'Iphone 7 Plus 128GB',19000000,'2.jpg',4,NULL,NULL,NULL,NULL,NULL,NULL),(82,1,'Iphone 7 Plus 256 GB Red',16000000,'3.jpg',4,NULL,NULL,NULL,NULL,NULL,NULL),(83,1,'Điện thoại Iphone 7 32GB',15000000,'4.jpg',4,NULL,NULL,NULL,NULL,NULL,NULL),(84,1,'Điện thoại Iphone 6s 32GB',10900000,'5.jpg',4,NULL,NULL,NULL,NULL,NULL,NULL),(85,1,'Điện thoại Iphone 6S Plus',9900000,'6.jpg',4,NULL,NULL,NULL,NULL,NULL,NULL),(86,1,'Điện thoại Iphone 6 64GB',9780000,'7.jpg',4,NULL,NULL,NULL,NULL,NULL,NULL),(87,1,'Điện thoại Iphone 6 32GB',9800000,'8.jpg',4,NULL,NULL,NULL,NULL,NULL,NULL),(88,1,'Samsung Galaxy J6',9000000,'Samsung Galaxy J6.jpg',7,NULL,NULL,NULL,NULL,NULL,NULL),(89,1,'Samsung Galaxy J7+',20000000,'Samsung Galaxy J7+.jpg',7,NULL,NULL,NULL,NULL,NULL,NULL),(90,1,'Samsung Galaxy Note 8',20000000,'Samsung Galaxy Note 8.jpg',7,NULL,NULL,NULL,NULL,NULL,NULL),(91,1,'Samsung Galaxy Note 9',20000000,'Samsung Galaxy Note 9.jpg',7,NULL,NULL,NULL,NULL,NULL,NULL),(92,1,'Sony C3',20000000,'Sony C3.jpg',5,NULL,NULL,NULL,NULL,NULL,NULL),(93,1,'Sony C4',20000000,'Sony C4.jpg',5,NULL,NULL,NULL,NULL,NULL,NULL),(94,1,'Sony C5',20000000,'Sony C5.png',5,NULL,NULL,NULL,NULL,NULL,NULL),(95,2,'Tivi Sony 4K 43 inch',21900000,'1.jpg',5,NULL,NULL,NULL,NULL,NULL,NULL),(96,2,'Tivi Sony KD - 43X800E',23900000,'2.jpg',5,NULL,NULL,NULL,NULL,NULL,NULL),(97,2,'Tivi Sony 43 inch',25900000,'3.jpg',5,NULL,NULL,NULL,NULL,NULL,NULL),(98,2,'Tivi Sony 40 inch',21800000,'4.jpg',5,NULL,NULL,NULL,NULL,NULL,NULL),(100,2,'Tivi LG 40LF630T',21900000,'6.jpg',8,NULL,NULL,NULL,NULL,NULL,NULL),(101,2,'Tivi LG 65 inch',23900000,'7.jpg',8,NULL,NULL,NULL,NULL,NULL,NULL),(102,2,'Tivi LG 32 inch',21900000,'8.jpg',8,NULL,NULL,NULL,NULL,NULL,NULL),(103,2,'Tivi Samsung 32FH4003K',22900000,'9.jpg',7,NULL,NULL,NULL,NULL,NULL,NULL),(104,2,'Tivi Samsung 43 inch',21900000,'10.jpg',7,NULL,NULL,NULL,NULL,NULL,NULL),(105,2,'Tivi Samsung LED UA58',23900000,'11.jpg',7,NULL,NULL,NULL,NULL,NULL,NULL),(106,2,'Tivi Samsung 4K 55 inch',21800000,'12.jpg',7,NULL,NULL,NULL,NULL,NULL,NULL),(107,2,'Máy ảnh Nikon P300',10000000,'13.jpg',3,NULL,NULL,NULL,NULL,NULL,NULL),(108,2,'Máy ảnh Nikon S9100',5000000,'14.jpg',3,NULL,NULL,NULL,NULL,NULL,NULL),(109,2,'Máy ảnh Nikon 5300',5000000,'15.jpg',3,NULL,NULL,NULL,NULL,NULL,NULL),(113,2,'Tivi Led Samsung UA49K5500',20000000,'211235_tivi_led_samsung_ua49k5500_1200x1200.jpg',7,'San pham dep\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n','chat luong tot','2021-05-29 12:52:04',NULL,NULL,NULL),(117,1,'Điện thoại Sony Z3',9800000,'Điện thoại Sony Z3.jpg',5,'hay','dep','2021-06-05 01:25:09',NULL,NULL,NULL);
/*!40000 ALTER TABLE `sanpham` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-06-19 17:22:49
