/*
SQLyog Community v13.1.6 (64 bit)
MySQL - 5.7.40-log : Database - new_web
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`new_web` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `new_web`;

/*Table structure for table `appointment` */

DROP TABLE IF EXISTS `appointment`;

CREATE TABLE `appointment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `person_id` int(11) NOT NULL,
  `doctor_id` int(11) NOT NULL,
  `time` datetime NOT NULL,
  `order` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

/*Data for the table `appointment` */

insert  into `appointment`(`id`,`person_id`,`doctor_id`,`time`,`order`) values 
(1,1,1,'2023-12-01 09:00:00',1),
(2,2,1,'2023-12-01 09:00:00',2),
(3,3,1,'2023-12-01 09:00:00',3),
(4,4,2,'2023-12-03 10:45:00',1),
(5,5,2,'2023-12-03 10:45:00',2),
(6,6,2,'2023-12-03 10:45:00',3),
(7,7,3,'2023-12-02 08:30:00',1),
(8,8,3,'2023-12-02 08:30:00',2),
(9,9,3,'2023-12-02 08:30:00',3),
(10,10,7,'2023-12-04 11:00:00',1),
(11,11,7,'2023-12-04 11:00:00',2),
(12,12,7,'2023-12-04 11:00:00',3),
(13,13,7,'2023-12-06 13:45:00',1),
(14,14,7,'2023-12-06 13:45:00',2),
(15,15,7,'2023-12-06 13:45:00',3),
(16,1,1,'2024-04-05 09:00:00',1),
(17,1,1,'2024-04-05 09:00:00',1),
(18,1,1,'2024-04-05 09:00:00',1),
(19,1,1,'2024-04-05 09:00:00',1),
(20,1,1,'2024-04-05 09:00:00',1),
(21,1,1,'2024-04-06 09:00:00',1),
(22,1,1,'2024-04-05 15:00:00',1),
(23,1,1,'2024-04-05 15:00:00',1),
(24,1,1,'2024-04-05 15:00:00',1),
(25,1,2,'2024-04-05 13:00:00',1),
(26,1,1,'2024-04-05 13:00:00',1),
(27,2,3,'2024-04-19 09:00:00',1),
(28,2,3,'2024-04-19 09:00:00',1),
(29,2,3,'2024-04-19 09:00:00',1),
(30,1,1,'2024-05-07 09:00:00',1),
(31,1,1,'2024-05-07 09:00:00',1),
(32,1,1,'2024-05-07 09:00:00',1),
(33,1,1,'2024-05-07 09:00:00',1),
(34,2,24,'2024-06-02 09:00:00',1);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
