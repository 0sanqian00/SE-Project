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

/*Table structure for table `medical_records` */

DROP TABLE IF EXISTS `medical_records`;

CREATE TABLE `medical_records` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `person_id` int(11) NOT NULL,
  `doctor_id` int(11) NOT NULL,
  `condition` varchar(64) DEFAULT NULL COMMENT '什么病',
  `sympton` varchar(256) DEFAULT NULL,
  `datetime` datetime DEFAULT NULL,
  `advice` varchar(512) DEFAULT NULL COMMENT '医嘱',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

/*Data for the table `medical_records` */

insert  into `medical_records`(`id`,`person_id`,`doctor_id`,`condition`,`sympton`,`datetime`,`advice`) values 
(1,1,1,'感冒','咳嗽、流感、头痛','2024-03-26 09:30:00','多喝水，休息好'),
(2,2,2,'胃炎','腹痛、恶心、食欲不振','2024-03-23 10:45:00','少食多餐，禁辛辣食物'),
(3,3,3,'高血压','头晕、头痛、心悸','2024-03-25 11:15:00','控制饮食，定期测量血压'),
(4,4,4,'糖尿病','多饮、多尿、体重减轻','2024-03-25 13:00:00','控制饮食，定期检查血糖'),
(5,5,5,'感冒','咳嗽、流感、头痛','2024-03-26 14:30:00','多喝水，休息好'),
(6,6,6,'胃炎','腹痛、恶心、食欲不振','2024-03-28 15:45:00','少食多餐，禁辛辣食物'),
(7,7,7,'高血压','头晕、头痛、心悸','2024-03-23 17:00:00','控制饮食，定期测量血压'),
(8,8,8,'糖尿病','多饮、多尿、体重减轻','2024-03-24 18:30:00','控制饮食，定期检查血糖'),
(9,9,9,'感冒','咳嗽、流感、头痛','2024-03-27 20:00:00','多喝水，休息好'),
(10,10,10,'胃炎','腹痛、恶心、食欲不振','2024-03-26 21:15:00','少食多餐，禁辛辣食物');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
