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

/*Table structure for table `family` */

DROP TABLE IF EXISTS `family`;

CREATE TABLE `family` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `community_id` int(11) NOT NULL COMMENT '社区id',
  `location` varchar(128) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

/*Data for the table `family` */

insert  into `family`(`id`,`community_id`,`location`) values 
(1,1,'北京市朝阳区'),
(2,1,'北京市海淀区'),
(3,1,'北京市丰台区'),
(4,2,'上海市浦东新区'),
(5,2,'上海市黄浦区'),
(6,2,'上海市徐汇区'),
(7,3,'广州市天河区'),
(8,3,'广州市荔湾区'),
(9,3,'广州市越秀区'),
(10,4,'深圳市福田区'),
(11,4,'深圳市南山区'),
(12,4,'深圳市宝安区'),
(13,5,'杭州市西湖区'),
(14,5,'杭州市余杭区'),
(15,5,'杭州市拱墅区'),
(16,6,'成都市武侯区'),
(17,6,'成都市锦江区'),
(18,6,'成都市青羊区'),
(19,7,'武汉市江汉区'),
(20,7,'武汉市武昌区'),
(21,7,'武汉市洪山区'),
(22,8,'南京市玄武区'),
(23,8,'南京市鼓楼区'),
(24,8,'南京市建邺区'),
(25,9,'重庆市渝中区'),
(26,9,'重庆市江北区'),
(27,9,'重庆市渝北区'),
(28,10,'西安市雁塔区'),
(29,10,'西安市碑林区'),
(30,10,'西安市新城区');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
