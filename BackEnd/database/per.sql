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

/*Table structure for table `person` */

DROP TABLE IF EXISTS `person`;

CREATE TABLE `person` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `gender` enum('男','女') NOT NULL,
  `age` int(11) NOT NULL,
  `family_id` int(11) NOT NULL,
  `image` varchar(512) DEFAULT NULL COMMENT '头像',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

/*Data for the table `person` */

insert  into `person`(`id`,`name`,`gender`,`age`,`family_id`,`image`) values 
(1,'张三','男',30,1,'https://pic1.zhimg.com/70/v2-69069413a2568991cf05a1a505f3db14_1440w.avis?source=172ae18b&biz_tag=Post'),
(2,'李四','女',25,1,'https://pic2.zhimg.com/80/v2-0bb7f0970f98b2581b1617f198456e41_720w.webp'),
(3,'王五','男',40,1,'https://pic2.zhimg.com/80/v2-ce490c2f6ad849e4e517067974f0bac5_720w.webp'),
(4,'赵六','女',22,2,'https://picx.zhimg.com/80/v2-da2b0a3b96103d87a682409fc5a261a9_720w.webp?source=1def8aca'),
(5,'孙七','男',35,2,'https://pic1.zhimg.com/80/v2-45d4b2cb0a81528de7524fe014488890_720w.webp?source=1def8aca'),
(6,'周八','女',28,2,'https://pic1.zhimg.com/80/v2-9eb805aec6f0db153d31392b2dad275a_720w.webp?source=1def8aca'),
(7,'吴九','男',27,3,'https://picx.zhimg.com/80/v2-67dec783e351769ad5f451c8e259c3df_720w.webp?source=1def8aca'),
(8,'郑十','女',32,3,'https://picx.zhimg.com/80/v2-4126896fa5db24d9760d699691867a28_720w.webp?source=1def8aca'),
(9,'冯十一','男',45,3,'https://picx.zhimg.com/80/v2-05059f4b2154eb4b81b4a98640dfaa27_720w.webp?source=1def8aca'),
(10,'陈十二','女',23,4,'https://pic1.zhimg.com/80/v2-eb83bfea6921790b626736804c9a1ed8_720w.webp?source=1def8aca'),
(11,'蔡十三','男',38,4,'https://pic1.zhimg.com/80/v2-0d8fddedb7ca01999a3d468f57fb8c4f_720w.webp?source=1def8aca'),
(12,'曹十四','女',29,4,'https://picx.zhimg.com/80/v2-b3c7761123adb4125d02c7661996301d_720w.webp?source=1def8aca'),
(13,'黄十五','男',33,5,'https://pic1.zhimg.com/80/v2-fe45e9d17631d2fc37f552e851fccf49_720w.webp?source=1def8aca'),
(14,'何十六','女',26,5,'https://pic1.zhimg.com/80/v2-fe2f2525c184ca7b0fae70de8844f853_720w.webp?source=1def8aca'),
(15,'许十七','男',41,5,'https://pica.zhimg.com/80/v2-e424038dda41802a0bdd7d8d9e477ecd_720w.webp?source=1def8aca'),
(16,'李二','男',64,1,'https://pic3.zhimg.com/80/v2-cded18a56e0d84c472f1ae99bb032056_720w.webp');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
