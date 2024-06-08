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

/*Table structure for table `measure_data` */

DROP TABLE IF EXISTS `measure_data`;

CREATE TABLE `measure_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `person_id` int(11) NOT NULL,
  `blood_oxygen` float DEFAULT NULL,
  `blood_sugar` float DEFAULT NULL,
  `high_preasure` float DEFAULT NULL,
  `low_preasure` float DEFAULT NULL,
  `body_tem` float DEFAULT NULL,
  `heart_rate` float DEFAULT NULL,
  `chest_pain` int(11) DEFAULT NULL,
  `angina_pectoris` int(11) DEFAULT NULL,
  `car_prediction` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

/*Data for the table `measure_data` */

insert  into `measure_data`(`id`,`person_id`,`blood_oxygen`,`blood_sugar`,`high_preasure`,`low_preasure`,`body_tem`,`heart_rate`,`chest_pain`,`angina_pectoris`,`car_prediction`) values 
(1,1,97.5,5.6,120,80,36.8,78,0,0,'81%'),
(2,2,98.2,6.2,118,75,36.8,80,0,0,'56%'),
(3,3,97.8,5.8,122,85,37,82,2,0,'12%'),
(16,16,97.8,5.8,120,80,36.9,82,2,0,'18%'),
(17,5,97.5,5.6,120,80,36.8,78,0,0,'57%'),
(18,6,98.2,6.1,116,75,33.8,77,0,0,'82%'),
(19,7,95.8,5.8,122,85,37,82,2,0,'68%'),
(20,8,97.8,5.8,120,77,36.9,82,2,0,'87%');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
