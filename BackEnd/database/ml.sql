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

/*Table structure for table `measure_log` */

DROP TABLE IF EXISTS `measure_log`;

CREATE TABLE `measure_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `person_id` int(11) NOT NULL,
  `type` enum('blood_oxygen','blood_sugar','body_tem','heart_rate','low_preassure','high_preassure') NOT NULL,
  `datetime` datetime NOT NULL,
  `data` float NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=utf8;

/*Data for the table `measure_log` */

insert  into `measure_log`(`id`,`person_id`,`type`,`datetime`,`data`) values 
(1,1,'blood_oxygen','2024-03-20 08:00:00',98.5),
(2,1,'blood_sugar','2024-03-29 10:30:00',5.6),
(3,2,'body_tem','2023-12-03 12:45:00',36.7),
(4,1,'heart_rate','2024-03-28 14:15:00',78),
(5,1,'high_preassure','2024-03-24 16:30:00',110),
(6,6,'low_preassure','2023-12-06 18:00:00',70),
(7,1,'blood_oxygen','2024-03-24 08:30:00',97.2),
(8,1,'blood_sugar','2023-12-08 11:00:00',6.2),
(9,1,'body_tem','2024-03-23 13:15:00',37),
(10,1,'heart_rate','2024-03-21 15:45:00',80),
(11,1,'high_preassure','2024-03-21 17:30:00',115),
(12,12,'low_preassure','2023-12-12 19:00:00',75),
(13,1,'blood_oxygen','2024-03-28 09:30:00',97.8),
(14,1,'blood_sugar','2023-12-14 12:15:00',5.8),
(15,2,'body_tem','2023-12-15 14:45:00',36.9),
(16,1,'heart_rate','2024-03-26 16:30:00',78),
(17,1,'high_preassure','2024-03-21 18:00:00',112),
(18,3,'low_preassure','2023-12-18 08:30:00',72),
(19,1,'blood_oxygen','2024-03-26 11:00:00',97.8),
(20,5,'blood_sugar','2023-12-20 13:30:00',6),
(21,1,'body_tem','2024-03-28 19:19:33',36.8),
(22,1,'body_tem','2024-03-25 19:33:00',36.8),
(23,1,'body_tem','2024-03-26 19:37:36',36.8),
(24,1,'body_tem','2024-03-24 19:40:59',36.8),
(25,1,'heart_rate','2024-03-24 20:37:33',77),
(26,1,'heart_rate','2024-03-21 20:37:45',78),
(27,1,'high_preassure','2024-03-28 20:38:19',120),
(28,1,'high_preassure','2024-03-24 20:38:21',114),
(29,1,'blood_oxygen','2024-03-24 20:39:43',97.5),
(30,1,'blood_sugar','2024-03-24 20:40:13',6.4),
(31,1,'low_preassure','2024-03-25 20:42:48',78),
(32,1,'low_preassure','2024-03-22 20:42:49',79),
(33,1,'low_preassure','2024-03-21 20:42:49',89),
(34,1,'low_preassure','2024-03-24 20:42:50',75),
(35,1,'low_preassure','2024-03-27 20:42:50',80),
(36,3,'blood_oxygen','2024-03-20 08:00:00',98.5),
(37,5,'blood_sugar','2024-03-29 10:30:00',5.6),
(38,2,'body_tem','2023-12-03 12:45:00',36.7),
(39,12,'blood_oxygen','2024-03-24 08:30:00',97.2),
(40,4,'blood_sugar','2023-12-08 11:00:00',6.2),
(41,5,'body_tem','2024-03-23 13:15:00',37),
(42,7,'heart_rate','2024-03-21 15:45:00',80),
(43,9,'high_preassure','2024-03-21 17:30:00',115),
(44,2,'blood_oxygen','2024-03-30 21:06:30',98.2),
(45,3,'blood_oxygen','2024-03-30 21:06:42',97.8),
(46,16,'blood_oxygen','2024-03-30 21:06:43',97.8),
(47,2,'blood_sugar','2024-03-29 21:08:00',6.2),
(48,3,'blood_sugar','2024-03-29 21:08:01',5.8),
(49,16,'blood_sugar','2024-03-29 21:08:01',5.8),
(50,2,'high_preassure','2024-03-29 21:09:13',118),
(51,3,'high_preassure','2024-03-29 21:09:13',122),
(52,16,'high_preassure','2024-03-29 21:09:13',120),
(53,2,'low_preassure','2024-03-30 21:10:02',75),
(54,3,'low_preassure','2024-03-29 21:10:07',85),
(55,16,'low_preassure','2024-03-30 21:10:09',80),
(56,2,'body_tem','2024-03-30 21:10:51',36.8),
(57,3,'body_tem','2024-03-30 21:10:55',37),
(58,16,'body_tem','2024-03-29 21:10:57',36.9),
(59,2,'heart_rate','2024-03-27 21:13:06',80),
(60,3,'heart_rate','2024-03-27 21:13:09',82),
(61,16,'heart_rate','2024-03-26 21:13:11',82),
(62,5,'blood_oxygen','2024-03-27 21:21:02',97.5),
(63,5,'blood_sugar','2024-03-25 21:21:55',5.6),
(64,5,'high_preassure','2024-03-25 21:22:45',120),
(65,5,'low_preassure','2024-03-25 21:23:32',80),
(66,5,'body_tem','2024-03-28 21:24:15',36.8),
(67,5,'heart_rate','2024-03-26 21:25:01',78),
(68,6,'blood_oxygen','2024-03-30 21:21:09',98.2),
(69,6,'blood_sugar','2024-03-28 21:21:59',6.1),
(70,6,'high_preassure','2024-03-28 21:22:47',116),
(71,6,'low_preassure','2024-03-24 21:23:35',75),
(72,6,'body_tem','2024-03-27 21:24:20',33.8),
(73,6,'heart_rate','2024-03-25 21:25:04',77),
(74,7,'blood_oxygen','2024-03-28 21:21:11',95.8),
(75,7,'blood_sugar','2024-03-28 21:22:01',5.8),
(76,7,'high_preassure','2024-03-27 21:22:50',122),
(77,7,'low_preassure','2024-03-23 21:23:37',85),
(78,7,'body_tem','2024-03-27 21:24:24',37),
(79,7,'heart_rate','2024-03-26 21:25:06',82),
(80,8,'blood_oxygen','2024-03-25 21:21:14',97.8),
(81,8,'blood_sugar','2024-03-29 21:22:04',5.8),
(82,8,'high_preassure','2024-03-29 21:22:53',120),
(83,8,'low_preassure','2024-03-27 21:23:40',77),
(84,8,'body_tem','2024-03-25 21:24:26',36.9),
(85,8,'heart_rate','2024-03-27 21:25:09',82);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
