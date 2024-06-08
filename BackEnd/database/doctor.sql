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

/*Table structure for table `doctor` */

DROP TABLE IF EXISTS `doctor`;

CREATE TABLE `doctor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `office` varchar(32) NOT NULL COMMENT '科室',
  `image` varchar(512) DEFAULT NULL,
  `title` varchar(64) DEFAULT NULL COMMENT '头衔',
  `introduction` varchar(256) DEFAULT NULL,
  `community_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

/*Data for the table `doctor` */

insert  into `doctor`(`id`,`name`,`office`,`image`,`title`,`introduction`,`community_id`) values 
(1,'王医生','心脏科','https://img.zcool.cn/community/0117825857a100a801219c778d2554.jpg@2o.jpg','心脏科主治医生','拥有20年以上的心脏疾病临床治疗和研究经验。在心脏病的诊断、治疗及术后管理方面积累了丰富的经验，尤其擅长复杂心律失常和心脏功能衰竭的综合管理。对于心脏功能衰竭的综合管理有深入研究，包括药物治疗、生活方式调整以及心脏重建手术等多种治疗方法。',1),
(2,'张医生','骨科','https://img.ixintu.com/upload/jpg/20210627/415d182d313bcdaf7e07fe0109b2aa95_72480_800_980.jpg!con','骨科主治医生','在骨折修复、关节置换和脊柱外科领域具有深厚的专业知识，并成功主持了多项复杂手术。擅长进行膝关节和髋关节置换手术，特别是在关节置换后的功能恢复方面有独到之处。对脊柱变形、椎间盘突出等疾病的诊断与治疗具有高度专业性，能够运用多种手术方法有效治疗。',1),
(3,'李医生','皮肤科','https://p4.itc.cn/q_70/images03/20220912/5f880a02504b40f7afb4c2fff1c1172d.png','皮肤科主治医生','擅长应用针灸、中药及中西医结合方法治疗眩晕症、头痛病、睡眠障碍、面瘫、耳鸣耳聋、各种神经痛、颈肩腰腿疼痛，对治疗肺系病、脾胃病等内科常见病有良好疗效。擅用内治与外治方法结合治疗皮肤科常见病，尤其对治疗痤疮、荨麻疹、各种皮炎、瘙痒症、急慢性湿疹、痒疹、手足癣、带状疱疹等各类皮肤疾病具有丰富的临床经验。',1),
(4,'赵医生','儿科','https://www.4lzr.com/uploads/images/20230309/51feae7ddfd5429ab9132fbd59016a2a.jpg','儿科主治医生','自2010年起儿童医院儿科工作，至今已有超过10年的儿科临床经验。他在新生儿疾病、儿童发育监测、预防接种及儿童常见疾病的诊断与治疗方面积累了丰富的经验。专注于儿童成长发育的监测与评估，能够早期识别发育迟缓或异常，并提供专业的干预建议。对新生儿黄疸、早产儿照护、新生儿感染等问题有深入研究和丰富的临床经验。',1),
(5,'刘医生','眼科','https://www.4lzr.com/uploads/images/20230309/d806422c6334317dec9b12622a8991d4.jpg','眼科主治医生','擅长眼科诊疗，致力于保护患者视力。',1),
(6,'孙医生','妇产科','https://p1.itc.cn/q_70/images03/20220808/bb3cec5d47834714ad3ba98467215c6c.png','妇产科主治医生','丰富的妇产科经验，关心女性健康。',1),
(7,'周医生','口腔科','https://pics7.baidu.com/feed/b219ebc4b74543a9f54d8b0ad4ebf38ebb0114ae.png@f_auto?token=13c918f617431447a0c78735c904aec4','口腔科主治医生','专业从事口腔科工作，提供各类口腔健康服务。',1),
(8,'吴医生','神经科','https://illust8.com/wp-content/uploads/2018/10/medical_doctor_illust_1530-400x490.png','神经科主治医生','治疗神经系统疾病，关注患者神经健康。',1),
(9,'郑医生','消化科','https://p0.itc.cn/q_70/images03/20220714/8e528ba8017b448e8585f5919cc8156f.png','消化科主治医生','擅长消化系统疾病诊治，致力于患者康复。',1),
(10,'冯医生','内科','https://www.4lzr.com/uploads/images/20230309/d806422c6334317dec9b12622a8991d4.jpg','内科主治医生','全面了解内科疾病，为患者提供专业医疗服务。',1),
(11,'张医生','心内科','http://mms2.baidu.com/it/u=389578735,2708098410&fm=253&app=138&f=JPEG?w=500&h=500','心内科主任医师','擅长心脏病诊治',1),
(12,'王医生','神经科','https://img.zcool.cn/community/0117825857a100a801219c778d2554.jpg@2o.jpg','神经科副主任医师','专注神经疾病治疗',1),
(13,'李医生','儿科','https://p4.itc.cn/q_70/images03/20220912/5f880a02504b40f7afb4c2fff1c1172d.png','儿科主治医师','专业儿童健康管理',1),
(14,'赵医生','外科','https://media.istockphoto.com/id/1717412352/vector/doctors-with-stethoscope-group-of-medical-students-or-nurses-vector-illustration.jpg?s=612x612&w=0&k=20&c=OoM-FVGkZaLY_FUqO5nubCzmuFdiP8OdF515ZlDe64U=','外科主任医师','精通外科手术技术',1),
(15,'刘医生','妇产科','https://www.4lzr.com/uploads/images/20230309/51feae7ddfd5429ab9132fbd59016a2a.jpg','妇产科副主任医师','经验丰富的妇科医生',1),
(16,'陈医生','眼科','https://static.vecteezy.com/system/resources/previews/001/858/875/non_2x/doctor-with-stethoscope-character-flat-style-free-vector.jpg','眼科主治医师','治疗各类眼病',1),
(17,'杨医生','耳鼻喉科','https://img.zcool.cn/community/01bec85857a107a8012060c8a045ab.jpg@1280w_1l_2o_100sh.jpg','耳鼻喉科主任医师','耳鼻喉疾病的专家',1),
(18,'周医生','骨科','https://img.ixintu.com/upload/jpg/20210627/415d182d313bcdaf7e07fe0109b2aa95_72480_800_980.jpg!con','骨科副主任医师','骨科手术的权威',1),
(19,'吴医生','肿瘤科','https://www.4lzr.com/uploads/images/20230309/198ea9113edbbb75d401c4df9079f1dd.jpg','肿瘤科主治医师','肿瘤综合治疗专家',1),
(20,'孙医生','皮肤科','https://static.vecteezy.com/system/resources/previews/001/851/827/non_2x/doctor-with-stethoscope-character-flat-style-free-vector.jpg','皮肤科主任医师','皮肤病诊治权威',1),
(21,'钱医生','消化内科','https://media.istockphoto.com/id/1717412352/vector/doctors-with-stethoscope-group-of-medical-students-or-nurses-vector-illustration.jpg?s=612x612&w=0&k=20&c=OoM-FVGkZaLY_FUqO5nubCzmuFdiP8OdF515ZlDe64U=','消化内科副主任医师','消化系统疾病治疗专家',1),
(22,'冯医生','内分泌科','https://p1.itc.cn/q_70/images03/20220808/bb3cec5d47834714ad3ba98467215c6c.png','内分泌科主治医师','内分泌失调的治疗专家',1),
(23,'蒋医生','肾内科','https://www.hospita.jp/media/46143/main.jpg','肾内科主任医师','肾脏疾病的专科医生',1),
(24,'沈医生','风湿免疫科','https://static.vecteezy.com/system/resources/previews/030/905/677/original/doctors-with-stethoscope-group-of-medical-students-or-nurses-illustration-vector.jpg','风湿免疫科副主任医师','风湿病和免疫性疾病的治疗专家',1),
(25,'丁医生','血液科','https://imagepphcloud.thepaper.cn/pph/image/184/840/306.jpg','血液科主治医师','血液病的诊断与治疗',1),
(26,'姜医生','整形美容科','https://pic2.zhimg.com/v2-8dce5e313dce342e56ff1c47dc8a149e_l.jpg?source=172ae18b','整形美容科主任医师','整形美容手术的专家',1),
(27,'黄医生','康复医学科','https://img.zcool.cn/community/01bec85857a107a8012060c8a045ab.jpg@1280w_1l_2o_100sh.jpg','康复医学科副主任医师','康复治疗的专家',1),
(28,'曹医生','口腔科','https://static.vecteezy.com/system/resources/previews/010/504/591/original/doctor-in-mask-illustration-cute-doctor-standing-hands-in-pockets-medical-healthcare-character-vector.jpg','口腔科主治医师','口腔疾病治疗专家',1),
(29,'庞医生','儿科','https://illust8.com/wp-content/uploads/2018/10/medical_doctor_illust_1530-400x490.png','儿科主任医师','儿科专家',1),
(30,'万医生','儿科','https://pics7.baidu.com/feed/b219ebc4b74543a9f54d8b0ad4ebf38ebb0114ae.png@f_auto?token=13c918f617431447a0c78735c904aec4','儿科副主任医师','儿科专家',1);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
