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

/*Table structure for table `medication_situation` */

DROP TABLE IF EXISTS `medication_situation`;

CREATE TABLE `medication_situation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `person_id` int(11) NOT NULL,
  `medication_id` int(11) NOT NULL,
  `use_frequency` int(11) NOT NULL COMMENT '每日吃几次',
  `use_method` varchar(128) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

/*Data for the table `medication_situation` */

insert  into `medication_situation`(`id`,`person_id`,`medication_id`,`use_frequency`,`use_method`) values 
(1,1,1,2,'每次2粒'),
(2,1,2,3,'每次1片'),
(3,1,9,2,'每次1袋'),
(4,1,4,3,'每次1片'),
(5,1,10,2,'每次1瓶'),
(6,2,6,3,'每次1片'),
(7,2,7,2,'每次2片'),
(8,2,4,3,'每次1瓶'),
(9,2,9,2,'每次1袋'),
(10,3,3,3,'每次1瓶'),
(11,3,1,2,'每次2粒'),
(12,3,2,3,'每次1片'),
(13,3,3,2,'每次2粒'),
(14,4,4,3,'每次1片'),
(15,4,5,2,'每次3片'),
(16,5,4,3,'每次1瓶'),
(17,5,5,2,'每次2片'),
(18,5,3,2,'每次3粒'),
(19,5,7,2,'每次2片');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
