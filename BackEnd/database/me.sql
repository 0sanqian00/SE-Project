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

/*Table structure for table `medication` */

DROP TABLE IF EXISTS `medication`;

CREATE TABLE `medication` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL COMMENT '药品名称',
  `description` varchar(512) NOT NULL,
  `type` varchar(64) NOT NULL COMMENT '药品类型',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

/*Data for the table `medication` */

insert  into `medication`(`id`,`name`,`description`,`type`) values 
(1,'阿莫西林','用于治疗感染性疾病，如呼吸道感染等','capsule'),
(2,'维生素C片','补充维生素C，增强免疫力，预防感冒','tablet'),
(3,'布洛芬','用于缓解轻至中度疼痛和发热。','capsule'),
(4,'对乙酰氨基酚','缓解轻至中度疼痛，适用于感冒、头痛等','tablet'),
(5,'氨酚烷胺','镇咳化痰，缓解感冒引起的咳嗽症状','tablet'),
(6,'甲硝唑片','用于治疗阴道滴虫感染、阴道炎等疾病','tablet'),
(7,'奥美拉唑','抑制胃酸分泌，用于治疗消化性溃疡','tablet'),
(8,'复方氨酚烷胺口服液','退热、缓解感冒引起的咳嗽、鼻塞等症状','liquid'),
(9,'阿司匹林','用于缓解轻至中度疼痛，降低血小板聚集','pellet'),
(10,'利巴韦林口服液','用于治疗感冒引起的咳嗽、喉咙痛等症状','liquid'),
(11,'头孢','用于治疗各种感染','pellet'),
(12,'布洛芬','用于缓解轻至中度疼痛和发热','tablet'),
(13,'氨溴索','用于缓解肌肉痉挛','liquid'),
(14,'硝酸甘油','用于急性心肌梗死和心绞痛','tablet'),
(15,'甲钴胺','用于治疗巨幼红细胞性贫血','liquid'),
(16,'阿莫西林','用于治疗各种细菌感染','pellet'),
(17,'布地奈德','用于治疗哮喘和鼻炎','liquid'),
(18,'扑尔敏','用于缓解过敏症状','tablet'),
(19,'氯化钠','用于补充体液和调节渗透压','liquid'),
(20,'阿托伐他汀','用于降低胆固醇水平','capsule'),
(21,'肾上腺素','用于治疗严重哮喘和休克','liquid'),
(22,'布地奈德','用于治疗哮喘和鼻炎','pellet'),
(23,'雷公藤','用于治疗风湿性关节炎','tablet'),
(24,'硝酸甘油','用于急性心肌梗死和心绞痛','liquid'),
(25,'氨溴索','用于缓解肌肉痉挛','pellet');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
