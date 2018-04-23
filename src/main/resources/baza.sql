/*
SQLyog Ultimate v12.09 (64 bit)
MySQL - 5.7.21-log : Database - shop
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`shop` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `shop`;

/*Table structure for table `atribute_value` */

DROP TABLE IF EXISTS `atribute_value`;

CREATE TABLE `atribute_value` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `value` varchar(255) DEFAULT NULL,
  `post_id` int(11) NOT NULL,
  `atributes_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`),
  KEY `post_id` (`post_id`),
  KEY `atribute_value_ibfk_2` (`atributes_id`),
  CONSTRAINT `atribute_value_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `post` (`id`) ON DELETE CASCADE,
  CONSTRAINT `atribute_value_ibfk_2` FOREIGN KEY (`atributes_id`) REFERENCES `atributes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8;

/*Data for the table `atribute_value` */

insert  into `atribute_value`(`id`,`value`,`post_id`,`atributes_id`) values (14,'Samsung',11,12),(15,'64gb',11,13),(16,'2',11,14),(17,'1080P',11,15),(18,'2560x1440',11,16),(19,'Android',11,17),(26,'Asus',13,12),(27,'32gb',13,13),(28,'2',13,14),(29,'1024x768',13,15),(30,'6\'\'',13,16),(31,'Android',13,17),(35,'MEIDI',15,18),(36,'5v',15,19),(37,'Usb 2,0',15,20),(38,'YOWOO POWER',16,21),(39,'185g',16,22),(40,'0.5C~1C(0.6A~1.3A)',16,23),(41,'Samsung',17,33),(42,'47\'\'',17,34),(43,'Jpeg, MP4, Av',17,35),(44,'Z8350',18,24),(45,'Intel(R) HD Graphics',18,25),(46,'Intel Atom',18,26),(47,'Windows 10',18,27),(48,'10,2\'\'',18,28),(49,'Samsung',19,36),(50,'Teclast ',20,24),(51,'Intel(R) HD Graphics',20,25),(52,'Intel Celeron',20,26),(53,'Windows 7',20,27),(54,'17\'\'',20,28);

/*Table structure for table `atributes` */

DROP TABLE IF EXISTS `atributes`;

CREATE TABLE `atributes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `atributes_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

/*Data for the table `atributes` */

insert  into `atributes`(`id`,`name`,`category_id`) values (12,'&#1041;&#1088;&#1077;&#1085;&#1076;',39),(13,'&#1054;&#1087;&#1077;&#1088;&#1072;&#1090;&#1080;&#1074;&#1085;&#1072;&#1103; &#1087;&#1072;&#1084;&#1103;&#1090;&#1100;',39),(14,'&#1050;&#1086;&#1083;&#1080;&#1095;&#1077;&#1089;&#1090;&#1074;&#1086; &#1082;&#1072;&#1084;&#1077;&#1088;',39),(15,'&#1056;&#1072;&#1079;&#1088;&#1077;&#1096;&#1077;&#1085;&#1080;&#1077; &#1074;&#1080;&#1076;&#1077;&#1086;&#1079;&#1072;&#1087;&#1080;&#1089;&#1080;',39),(16,'&#1044;&#1080;&#1072;&#1075;&#1086;&#1085;&#1072;&#1083;&#1100; &#1101;&#1082;&#1088;&#1072;&#1085;&#1072;',39),(17,'&#1054;&#1087;&#1077;&#1088;&#1072;&#1094;&#1080;&#1086;&#1085;&#1085;&#1072;&#1103; &#1089;&#1080;&#1089;&#1090;&#1077;&#1084;&#1072;',39),(18,'&#1041;&#1088;&#1077;&#1085;&#1076;',40),(19,'&#1053;&#1072;&#1087;&#1088;&#1103;&#1078;&#1077;&#1085;&#1080;&#1077;',40),(20,'&#1048;&#1085;&#1090;&#1077;&#1088;&#1092;&#1077;&#1081;&#1089;',40),(21,'&#1041;&#1088;&#1077;&#1085;&#1076;',41),(22,'&#1042;&#1077;&#1089;',41),(23,'&#1025;&#1084;&#1082;&#1086;&#1089;&#1090;&#1100; &#1073;&#1072;&#1090;&#1072;&#1088;&#1077;&#1080; (&#1084;&#1040;�&#1095;)',41),(24,'&#1052;&#1086;&#1076;&#1077;&#1083;&#1100;',42),(25,'&#1058;&#1080;&#1087; &#1074;&#1080;&#1076;&#1077;&#1086;&#1082;&#1072;&#1088;&#1090;&#1099;',42),(26,'&#1052;&#1086;&#1076;&#1077;&#1083;&#1100; &#1087;&#1088;&#1086;&#1094;&#1077;&#1089;&#1089;&#1086;&#1088;&#1072;',42),(27,'&#1054;&#1087;&#1077;&#1088;&#1072;&#1094;&#1080;&#1086;&#1085;&#1085;&#1072;&#1103; &#1089;&#1080;&#1089;&#1090;&#1077;&#1084;&#1072;',42),(28,'&#1056;&#1072;&#1079;&#1084;&#1077;&#1088; &#1101;&#1082;&#1088;&#1072;&#1085;&#1072;',42),(29,'&#1041;&#1088;&#1077;&#1085;&#1076;',43),(30,'&#1054;&#1073;&#1098;&#1105;&#1084; &#1087;&#1072;&#1084;&#1103;&#1090;&#1080;',43),(31,'&#1050;&#1072;&#1084;&#1077;&#1088;&#1072;',43),(32,'&#1057;&#1086;&#1089;&#1090;&#1086;&#1103;&#1085;&#1080;&#1077;',43),(33,'&#1041;&#1088;&#1077;&#1085;&#1076;',44),(34,'&#1056;&#1072;&#1079;&#1084;&#1077;&#1088;&#1099;',44),(35,'&#1055;&#1086;&#1076;&#1076;&#1077;&#1088;&#1078;&#1080;&#1074;&#1072;&#1077;&#1084;&#1099;&#1077; &#1092;&#1086;&#1088;&#1084;&#1072;&#1090;&#1099;',44),(36,'&#1041;&#1088;&#1077;&#1085;&#1076;',45);

/*Table structure for table `category` */

DROP TABLE IF EXISTS `category`;

CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;

/*Data for the table `category` */

insert  into `category`(`id`,`name`,`parent_id`) values (31,'&#1058;&#1077;&#1083;&#1077;&#1092;&#1086;&#1085;&#1099; &#1080; &#1072;&#1082;&#1089;&#1077;&#1089;&#1089;&#1091;&#1072;&#1088;&#1099;',0),(32,'&#1050;&#1086;&#1084;&#1087;&#1100;&#1102;&#1090;&#1077;&#1088;&#1099; &#1080; &#1086;&#1088;&#1075;&#1090;&#1077;&#1093;&#1085;&#1080;&#1082;&#1072;',0),(33,'&#1069;&#1083;&#1077;&#1082;&#1090;&#1088;&#1086;&#1085;&#1080;&#1082;&#1072;',0),(34,'&#1042;&#1089;&#1105; &#1076;&#1083;&#1103; &#1076;&#1077;&#1090;&#1077;&#1081;',0),(35,'&#1057;&#1091;&#1084;&#1082;&#1080; &#1080; &#1086;&#1073;&#1091;&#1074;&#1100;',0),(36,'&#1044;&#1083;&#1103; &#1076;&#1086;&#1084;&#1072; &#1080; &#1089;&#1072;&#1076;&#1072;',0),(37,'&#1041;&#1099;&#1090;&#1086;&#1074;&#1072;&#1103; &#1090;&#1077;&#1093;&#1085;&#1080;&#1082;&#1072;',0),(38,'&#1057;&#1087;&#1086;&#1088;&#1090; &#1080; &#1088;&#1072;&#1079;&#1074;&#1083;&#1077;&#1095;&#1077;&#1085;&#1080;&#1103;',0),(39,'&#1052;&#1086;&#1073;&#1080;&#1083;&#1100;&#1085;&#1099;&#1077; &#1090;&#1077;&#1083;&#1077;&#1092;&#1086;&#1085;&#1099;',31),(40,'&#1047;&#1072;&#1088;&#1103;&#1076;&#1085;&#1099;&#1077; &#1091;&#1089;&#1090;&#1088;&#1086;&#1081;&#1089;&#1090;&#1074;&#1072;',31),(41,'&#1041;&#1072;&#1090;&#1072;&#1088;&#1077;&#1080;',31),(42,'&#1053;&#1086;&#1091;&#1090;&#1073;&#1091;&#1082;&#1080;',32),(43,'&#1055;&#1083;&#1072;&#1085;&#1096;&#1077;&#1090;&#1099;',32),(44,'&#1058;&#1077;&#1083;&#1077;&#1074;&#1080;&#1079;&#1086;&#1088;&#1099;',33),(45,'&#1050;&#1072;&#1088;&#1090;&#1099; &#1087;&#1072;&#1084;&#1103;&#1090;&#1080;',33);

/*Table structure for table `country` */

DROP TABLE IF EXISTS `country`;

CREATE TABLE `country` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `region` varchar(255) NOT NULL,
  `parent_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8;

/*Data for the table `country` */

insert  into `country`(`id`,`region`,`parent_id`) values (37,'Erevan',1),(38,'Shiraki Marz',0),(39,'Gyumri',38),(40,'Axurjan',38),(41,'Maralik',38),(42,'Azatan',38),(43,'Loru Marz',0),(44,'Vanadzor',43),(45,'Alaverdi',43),(46,'Stepanavan',43);

/*Table structure for table `massage` */

DROP TABLE IF EXISTS `massage`;

CREATE TABLE `massage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `text` text NOT NULL,
  `to_id` int(11) NOT NULL,
  `from_id` int(11) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `to_id` (`to_id`),
  KEY `from_id` (`from_id`),
  CONSTRAINT `massage_ibfk_1` FOREIGN KEY (`to_id`) REFERENCES `user` (`id`) ON DELETE CASCADE,
  CONSTRAINT `massage_ibfk_2` FOREIGN KEY (`from_id`) REFERENCES `user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `massage` */

/*Table structure for table `picture` */

DROP TABLE IF EXISTS `picture`;

CREATE TABLE `picture` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pic_pat` varchar(255) DEFAULT NULL,
  `post_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `post_id` (`post_id`),
  CONSTRAINT `picture_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `post` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8;

/*Data for the table `picture` */

insert  into `picture`(`id`,`pic_pat`,`post_id`) values (67,'1524126810034_C1-062016.jpg',11),(68,'1524126810042_Vzn_GS6_FastCharging_gld_5_SM-G920VZDAVZW.jpg',11),(69,'1524126810046_Vzn_GS6_ReimaginedDesign_gld_1_SM-G920VZDAVZW.jpg',11),(70,'1524126810050_Vzn_GS6_StunningDisplay_gld_2_SM-G920VZDAVZW.jpg',11),(74,'1524127558711_HTB1e74.b_mWBKNjSZFBq6xxUFXa1.jpg',13),(75,'1524127558714_HTB1I3wahmtYBeNjSspkq6zU8VXaf.jpg',13),(76,'1524127558730_HTB1QTCwhXGWBuNjy0Fbq6z4sXXaB.jpg',13),(77,'1524127558734_HTB1zgrchh9YBuNjy0Ffq6xIsVXax.jpg',13),(78,'1524127558737_HTB18c0Lb2uSBuNkHFqDq6xfhVXa7.jpg',13),(82,'1524127894946_HTB1lw0OdBfM8KJjSZFhq6ARyFXaH.jpg',15),(83,'1524127894950_HTB1MD_tjv2H8KJjy0Fcq6yDlFXar.jpg',15),(84,'1524127894954_HTB1to6vjsrI8KJjy0Fhq6zfnpXaC.jpg',15),(85,'1524127894960_HTB1WD81dqLN8KJjSZFKq6z7NVXaC.jpg',15),(86,'1524127894967_HTB1x5b2jwfH8KJjy1zcq6ATzpXa3.jpg',15),(87,'1524127894970_HTB1XyRpcQfb_uJkSnhJq6zdDVXaP.jpg',15),(88,'1524128297623_HTB1_FMhfuuSBuNjSsziq6zq8pXaX.jpg',16),(89,'1524128297628_HTB1YkhVbDqWBKNjSZFxq6ApLpXa3.jpg',16),(90,'1524128297632_HTB14BqhfTtYBeNjy1Xdq6xXyVXaL.jpg',16),(91,'1524128653822_HTB1cSjlJVXXXXaBXpXXq6xXFXXXU.jpg',17),(92,'1524128653826_HTB1DYjdJVXXXXcCXFXXq6xXFXXXZ.jpg',17),(93,'1524128895822_HLB1B4pDFVXXXXb1XXXXq6xXFXXXp.jpg',18),(94,'1524128895825_HLB13JBDFVXXXXbcXpXXq6xXFXXXf.jpg',18),(95,'1524128895828_HTB1xLJ7OVXXXXbaXXXXq6xXFXXXD.jpg',18),(96,'1524133137349_HTB1HeZLRFXXXXbraXXXq6xXFXXXA.jpg',19),(97,'1524133137359_HTB1RUD4QFXXXXX5XVXXq6xXFXXXd.jpg',19),(98,'1524133522500_HTB1hGUIXpuWBuNjSszbq6AS7FXa0.jpg',20),(99,'1524133522505_HTB1LiwKXrSYBuNjSspfq6AZCpXaQ.jpg',20),(100,'1524133522510_HTB1MsZIXCCWBuNjy0Fhq6z6EVXau.jpg',20);

/*Table structure for table `post` */

DROP TABLE IF EXISTS `post`;

CREATE TABLE `post` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `price` double NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `country_id` int(11) NOT NULL,
  `view` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `category_id` (`category_id`),
  KEY `country_id` (`country_id`),
  CONSTRAINT `post_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`),
  CONSTRAINT `post_ibfk_4` FOREIGN KEY (`country_id`) REFERENCES `country` (`id`),
  CONSTRAINT `post_ibfk_5` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

/*Data for the table `post` */

insert  into `post`(`id`,`title`,`description`,`price`,`timestamp`,`user_id`,`category_id`,`country_id`,`view`) values (11,'Samsung Galaxy S6 Active','Samsung Galaxy S6 SM-C7100 3G RAM 32G ROM 16MP Front Camera dual sim Octa Core',1450,'2018-04-19 12:41:00',21,39,37,5),(13,'Original ASUS ZenFone','Original ASUS ZenFone 4 max Pegasus 4A 3GB RAM 32GB ROM Mobile Phones Quad Core MT6737 Android 7.0 Fingerprint ID 5\"Cellphone',19000,'2018-04-19 12:45:58',21,39,37,70),(15,'MEIDI Car Charger','[3 USB Ports Cable] MEIDI Car Charger Fast Mobile Phone Charger With Cable For iPhone7 SamsungS7 Xiaomi Type C in Stock',850,'2018-04-19 12:51:34',21,40,39,5),(16,'HRB RC Lipo 6S Battery','HRB RC Lipo 6S Battery 22.2V 1300mAh 90C 180C Drone AKKU RC Baterry For Helicopters RC KT Plate Airplane Car Quadcopter Boat UAV',250,'2018-04-19 12:58:17',21,41,42,10),(17,'Multi-Media Monitor 4K','Multi-Media Monitor 4K CCTV display Samsung LG display TV pc panel 46 47 55 inch DID full TFT HD LCD digital signage Video Wall',4870,'2018-04-19 13:49:00',21,44,37,3),(18,'10inch mini laptop','10inch mini laptop Windows 10 netbook Z8350 quad core processor touch capacitive screen dual cameras notebook computer',16500,'2018-04-19 13:08:15',21,42,40,40),(19,'SAMSUNG Micro SD','Original SAMSUNG Micro SD Memory Card EVO+ Plus 32GB Class10 waterproof TFFlash Memoria Card C10 SDHC/SDXCUHS-1 For Smart phones',140,'2018-04-19 14:18:57',22,45,42,1),(20,'Teclast F7','Teclast F7 Windows 10 14.0 inch Notebook Intel Celeron N3450 1.1GHz Quad Core 6GB RAM 64GB eMMC M.2 SSD Expansion HDMI Camera',5400,'2018-04-19 14:25:22',22,42,37,3);

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `surname` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `user_pic_pat` varchar(255) DEFAULT NULL,
  `country_id` int(11) NOT NULL,
  `tel_1` varchar(255) DEFAULT NULL,
  `tel_2` varchar(255) DEFAULT NULL,
  `type` enum('USER','VIP_USER','ADMIN') NOT NULL,
  `gender` enum('MALE','FEMALE') NOT NULL,
  `register_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `token` varchar(255) DEFAULT NULL,
  `verify` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `user_pic_id` (`user_pic_pat`),
  KEY `country_id` (`country_id`),
  CONSTRAINT `user_ibfk_1` FOREIGN KEY (`country_id`) REFERENCES `country` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

/*Data for the table `user` */

insert  into `user`(`id`,`name`,`surname`,`email`,`password`,`user_pic_pat`,`country_id`,`tel_1`,`tel_2`,`type`,`gender`,`register_time`,`token`,`verify`) values (20,'admin','admin','admin@mail.com','$2a$10$gNVoqkvJn3Ebcu3cNOblpesc0JGZ/JIh/cDJvx5rB8gBZ.jLLh9a2','1524125395025_04SC002.JPG',39,'093 007 000','095 005 001','ADMIN','MALE','2018-04-19 12:15:41',NULL,1),(21,'Styopa','Khachatryan','vahesimonyan650@gmail.com','$2a$10$x7Kqr5I3/oqoLxzuH4I8lOv8ZiGPGlVaQVsLx2QsavotLYs92KbNG','1524125215893_001.jpg',39,'093 880 887',' 099 999 999','USER','MALE','2018-04-19 14:57:39','',1),(22,'Vahe','Simonyan','vah@mail.ru','$2a$10$uLSRMQwlTiPtEYklaWW0Ye9tIxkPULhqBft74ASa2cnwgs4INAyvW','1524133203266_NGA02034.JPG',37,'093 005 006','','USER','MALE','2018-04-19 14:20:03',NULL,1);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
