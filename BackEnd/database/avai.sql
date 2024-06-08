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

/*Table structure for table `available_time` */

DROP TABLE IF EXISTS `available_time`;

CREATE TABLE `available_time` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `doctor_id` int(11) NOT NULL,
  `time` time NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

/*Data for the table `available_time` */

insert  into `available_time`(`id`,`doctor_id`,`time`) values 
(1,1,'08:00:00'),
(2,1,'10:30:00'),
(3,1,'14:00:00'),
(4,2,'09:15:00'),
(5,2,'13:45:00'),
(6,2,'16:30:00'),
(7,3,'08:30:00'),
(8,3,'11:00:00'),
(9,3,'15:15:00'),
(10,4,'10:00:00'),
(11,4,'14:45:00'),
(12,4,'17:00:00'),
(13,5,'09:45:00'),
(14,5,'12:30:00'),
(15,5,'15:45:00'),
(16,6,'08:15:00'),
(17,6,'11:30:00'),
(18,6,'16:15:00'),
(19,7,'10:45:00'),
(20,7,'13:15:00'),
(21,7,'15:30:00'),
(22,8,'09:30:00'),
(23,8,'12:00:00'),
(24,8,'14:30:00'),
(25,9,'08:45:00'),
(26,9,'11:45:00'),
(27,9,'15:00:00'),
(28,10,'10:15:00'),
(29,10,'13:00:00'),
(30,10,'16:45:00');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
