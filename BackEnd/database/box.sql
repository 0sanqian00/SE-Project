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

/*Table structure for table `box` */

DROP TABLE IF EXISTS `box`;

CREATE TABLE `box` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `family_id` int(11) NOT NULL,
  `medication_id` int(11) NOT NULL,
  `box_id` int(11) NOT NULL,
  `number` int(11) NOT NULL COMMENT '药品数量',
  `unit` varchar(32) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8;

/*Data for the table `box` */

insert  into `box`(`id`,`family_id`,`medication_id`,`box_id`,`number`,`unit`) values 
(1,1,1,1,20,'盒'),
(2,1,2,2,30,'瓶'),
(3,1,3,3,40,'片'),
(4,1,4,4,25,'袋'),
(5,1,5,5,15,'瓶'),
(6,2,6,1,18,'盒'),
(7,2,7,2,22,'瓶'),
(8,2,8,3,35,'片'),
(9,2,9,4,28,'袋'),
(10,2,10,5,12,'瓶'),
(11,3,1,1,15,'盒'),
(12,3,2,2,25,'瓶'),
(13,3,3,3,30,'片'),
(14,3,4,4,20,'袋'),
(15,3,5,5,10,'瓶'),
(16,4,6,1,12,'盒'),
(17,4,7,2,18,'瓶'),
(18,4,8,3,28,'片'),
(19,4,9,4,22,'袋'),
(20,4,10,5,15,'瓶'),
(21,5,1,1,20,'盒'),
(22,5,2,2,30,'瓶'),
(23,5,3,3,40,'片'),
(24,5,4,4,25,'袋'),
(25,5,5,5,15,'瓶'),
(26,6,6,1,18,'盒'),
(27,6,7,2,22,'瓶'),
(28,6,8,3,35,'片'),
(29,6,9,4,28,'袋'),
(30,6,10,5,12,'瓶'),
(31,7,1,1,15,'盒'),
(32,7,2,2,25,'瓶'),
(33,7,3,3,30,'片'),
(34,7,4,4,20,'袋'),
(35,7,5,5,10,'瓶'),
(36,8,6,1,12,'盒'),
(37,8,7,2,18,'瓶'),
(38,8,8,3,28,'片'),
(39,8,9,4,22,'袋'),
(40,8,10,5,15,'瓶'),
(41,9,1,1,20,'盒'),
(42,9,2,2,30,'瓶'),
(43,9,3,3,40,'片'),
(44,9,4,4,25,'袋'),
(45,9,5,5,15,'瓶'),
(46,1,9,3,10,'袋'),
(47,1,10,5,5,'瓶');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
