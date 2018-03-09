/*
SQLyog Ultimate v11.25 (64 bit)
MySQL - 5.7.17-log : Database - cqt1
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`cqt1` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `cqt1`;

/*Table structure for table `sys_dictionaries` */

DROP TABLE IF EXISTS `sys_dictionaries`;

CREATE TABLE `sys_dictionaries` (
  `ZD_ID` varchar(100) NOT NULL COMMENT '字典ID',
  `ZD_NAME` varchar(100) NOT NULL COMMENT '字典名称',
  `BIANMA` varchar(20) NOT NULL COMMENT '编码',
  `ORDER_BY` int(10) NOT NULL COMMENT '次序索引',
  `PARENT_ID` varchar(100) NOT NULL COMMENT '父字典ID',
  `JB` int(10) NOT NULL COMMENT '级别',
  `P_BM` varchar(100) NOT NULL COMMENT '父编码',
  PRIMARY KEY (`ZD_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `sys_dictionaries` */

LOCK TABLES `sys_dictionaries` WRITE;

insert  into `sys_dictionaries`(`ZD_ID`,`ZD_NAME`,`BIANMA`,`ORDER_BY`,`PARENT_ID`,`JB`,`P_BM`) values ('03179443511b4f71a571c4fa4e14ad6e','项目管理部','11_000_005',5,'d5e1264c3ea84b9f869f118c5fb28799',2,'CQT_11_000_005'),('05552810263b48e88d62206764e49b61','财务部','11_000_002',2,'d5e1264c3ea84b9f869f118c5fb28799',2,'CQT_11_000_002'),('059102ed8b7b4082b94f2772a526ba74','江苏省','32',32,'e1a366de89c54ae2a12d889715e94ef5',2,'SFDM_32'),('076b5b3b9f78434b81383df90024c6e0','电教技术部','11_000_004',4,'d5e1264c3ea84b9f869f118c5fb28799',2,'CQT_11_000_004'),('134ef8004fba473d99a32a0017ce7ef7','中文组','zwz',1,'6568cbf2c89245248febb14523d20c69',4,'jxb_zwz'),('173bec4d65214ca688ff64da8f2c6c44','托管部','tgb',4,'8a56f6565aec4f58962540c4c1b7f432',3,'11_000_101_tgb'),('2011f69892ed426f9f42ae4c937970c5','湖北省','42',42,'e1a366de89c54ae2a12d889715e94ef5',2,'SFDM_42'),('22570165b4304682a84152b3c117d1a7','河北省','13',13,'e1a366de89c54ae2a12d889715e94ef5',2,'SFDM_13'),('2626c6cf9c36484c941d2681ac6277a6','山西省','14',14,'e1a366de89c54ae2a12d889715e94ef5',2,'SFDM_14'),('3218eb8879be45aaaf844ee44b1e46b3','重庆市','50',50,'e1a366de89c54ae2a12d889715e94ef5',2,'SFDM_50'),('3647270ed5194a6d9647c3aee3b0eca9','香港特别行政区','81',81,'e1a366de89c54ae2a12d889715e94ef5',2,'SFDM_81'),('3d84df7651ab44929246e1260b6579c5','西藏自治区','54',54,'e1a366de89c54ae2a12d889715e94ef5',2,'SFDM_54'),('4135746775f04f5291a6fd3175a27742','吉林省','22',22,'e1a366de89c54ae2a12d889715e94ef5',2,'SFDM_22'),('45fa44effe8c4361946d34c72a80cb34','内蒙古自治区','15',15,'e1a366de89c54ae2a12d889715e94ef5',2,'SFDM_15'),('48724375640341deb5ef01ac51a89c34','北京','dq001',1,'cdba0b5ef20e4fc0a5231fa3e9ae246a',2,'DQ_dq001'),('4ada59d29b4e4c4785ebfd07c6f8934f','甘肃省','62',62,'e1a366de89c54ae2a12d889715e94ef5',2,'SFDM_62'),('4c335250f3664d6491027c0954ad88b8','福建省','35',35,'e1a366de89c54ae2a12d889715e94ef5',2,'SFDM_35'),('5066d02dc6c4400fb863d434a6248229','四川省','51',51,'e1a366de89c54ae2a12d889715e94ef5',2,'SFDM_51'),('512508eceacd4a6b85597157f4bab349','云南省','53',53,'e1a366de89c54ae2a12d889715e94ef5',2,'SFDM_53'),('5e3bfee04b89495bb9c8abe9a997b740','天津市','12',12,'e1a366de89c54ae2a12d889715e94ef5',2,'SFDM_12'),('5fedfa0593b549abbee5c998e8245d68','澳门特别行政区','82',82,'e1a366de89c54ae2a12d889715e94ef5',2,'SFDM_82'),('6568cbf2c89245248febb14523d20c69','教学部','jxb',1,'8a56f6565aec4f58962540c4c1b7f432',3,'11_000_101_jxb'),('6a0836638a8949e8b98ad773278bd67d','江西省','36',36,'e1a366de89c54ae2a12d889715e94ef5',2,'SFDM_36'),('6a94e0981c17475199180b04f197bd9c','黑龙江省','23',23,'e1a366de89c54ae2a12d889715e94ef5',2,'SFDM_23'),('83f89b64777d4d878bd3ebcf60054cc8','浙江省','33',33,'e1a366de89c54ae2a12d889715e94ef5',2,'SFDM_33'),('8a56f6565aec4f58962540c4c1b7f432','北京市昌平区常青滕儿童教育培训学校','11_000_101',101,'d5e1264c3ea84b9f869f118c5fb28799',2,'CQT_11_000_101'),('90043627642b47f58b31da64dcb9c8cf','宁夏回族自治区','64',64,'e1a366de89c54ae2a12d889715e94ef5',2,'SFDM_64'),('9216e4e4d6624523b25f3da261c9fcd9','山东省','37',37,'e1a366de89c54ae2a12d889715e94ef5',2,'SFDM_37'),('95019b245f30434299f539c6ea716ee9','河南省','41',41,'e1a366de89c54ae2a12d889715e94ef5',2,'SFDM_41'),('a23b65a977874ce1a69edd4ffbeacc2f','保健部','bjb',3,'8a56f6565aec4f58962540c4c1b7f432',3,'11_000_101_bjb'),('a5a1c8302e5c434a8ca76f0f90823445','贵州省','52',52,'e1a366de89c54ae2a12d889715e94ef5',2,'SFDM_52'),('ab126acf19a1426592a04b8e93213990','安徽省','34',34,'e1a366de89c54ae2a12d889715e94ef5',2,'SFDM_34'),('ae240179c311400991b0f5eb9c2fc4df','台湾省','71',71,'e1a366de89c54ae2a12d889715e94ef5',2,'SFDM_71'),('b686df09dfd846aabe74ebb011b5abcc','海南省','46',46,'e1a366de89c54ae2a12d889715e94ef5',2,'SFDM_46'),('b80609f5be5641d7a6b653200dcc213a','陕西省','61',61,'e1a366de89c54ae2a12d889715e94ef5',2,'SFDM_61'),('bbd184f9b5af43e3b58192e3e9e001e5','总经办','11_000_001',1,'d5e1264c3ea84b9f869f118c5fb28799',2,'CQT_11_000_001'),('bc6d2539098d43a79d19a572f4f5501f','上海市','31',31,'e1a366de89c54ae2a12d889715e94ef5',2,'SFDM_31'),('c38cc7969bf04ed8907a8b73f4f1e769','后勤部','hqb',2,'8a56f6565aec4f58962540c4c1b7f432',3,'11_000_101_hqb'),('c62f66f78ba2438f97d2cccdca0e7c9d','青海省','63',63,'e1a366de89c54ae2a12d889715e94ef5',2,'SFDM_63'),('cb5be22b6e6b4c7c820e3a0acf69d3fd','辽宁省 ','21',21,'e1a366de89c54ae2a12d889715e94ef5',2,'SFDM_21'),('cc6c6e386f7a4e5e9e4a39b7a05ae16e','北京市','11',11,'e1a366de89c54ae2a12d889715e94ef5',2,'SFDM_11'),('cd76d35c3beb4f5bac2c8ce508ea8793','新疆维吾尔自治区','65',65,'e1a366de89c54ae2a12d889715e94ef5',2,'SFDM_65'),('cdba0b5ef20e4fc0a5231fa3e9ae246a','地区','DQ',2,'0',1,'DQ'),('d5e0db0356c04120b90c84bffcfb608e','行政人事部','11_000_003',3,'d5e1264c3ea84b9f869f118c5fb28799',2,'CQT_11_000_003'),('d5e1264c3ea84b9f869f118c5fb28799','艾维常青滕教育科技（北京）有限公司','CQT',3,'0',1,'CQT'),('d7157c14e2e0472fa1557113e4a62b9a','广东省','44',44,'e1a366de89c54ae2a12d889715e94ef5',2,'SFDM_44'),('db621d17f34f4603900b69ddee915119','品牌战略及互联网事业部','11_000_006',6,'d5e1264c3ea84b9f869f118c5fb28799',2,'CQT_11_000_006'),('ddd48132dac84ef6a6e7167ec1ae0acb','早教部','zjb',5,'8a56f6565aec4f58962540c4c1b7f432',3,'11_000_101_zjb'),('dddcc240371e4f34841658815563e95b','广西壮族自治区','45',45,'e1a366de89c54ae2a12d889715e94ef5',2,'SFDM_45'),('e1a366de89c54ae2a12d889715e94ef5','省份代码','SFDM',1,'0',1,'SFDM'),('e4e51e79ec9c47f9b45145213056634c','湖南省','43',43,'e1a366de89c54ae2a12d889715e94ef5',2,'SFDM_43'),('f184bff5081d452489271a1bd57599ed','上海','SH',2,'cdba0b5ef20e4fc0a5231fa3e9ae246a',2,'DQ_SH');

UNLOCK TABLES;

/*Table structure for table `sys_identity` */

DROP TABLE IF EXISTS `sys_identity`;

CREATE TABLE `sys_identity` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '预定义身份ID',
  `identity_name` varchar(30) DEFAULT NULL COMMENT '身份名称',
  `identity_code` varchar(20) DEFAULT NULL COMMENT '编码',
  `type` varchar(30) DEFAULT NULL COMMENT '类型',
  `remarks` varchar(200) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

/*Data for the table `sys_identity` */

LOCK TABLES `sys_identity` WRITE;

insert  into `sys_identity`(`id`,`identity_name`,`identity_code`,`type`,`remarks`) values (1,'系统维护管理员','ZGS_001','总公司人员',NULL),(2,'系统业务管理员','ZGS_002','总公司人员',NULL),(3,'总公司人力资源','ZGS_003','总公司人员',NULL),(4,'班主任','JX_001','分园教学人员',NULL),(5,'副班主任','JX_002','分园教学人员',NULL),(6,'学科组长','JX_003','分园教学人员',NULL),(7,'普通教师','JX_004','分园教学人员',NULL),(8,'实习教师','JX_005','分园教学人员',NULL),(9,'园长','JW_001','分园教务人员',NULL),(10,'副园长','JW_002','分园教务人员',NULL),(11,'教学主管','JW_003','分园教务人员',NULL),(12,'招生主管','JW_004','分园教务人员',NULL),(13,'分园管理员','JW_005','分园教务人员',NULL),(14,'园长助理','JW_006','分园教务人员',NULL),(15,'分园行政人事','JW_007','分园教务人员',NULL),(16,'财务人员','JW_008','分园教务人员',NULL),(17,'保健医','JW_009','分园教务人员',NULL);

UNLOCK TABLES;

/*Table structure for table `sys_menu` */

DROP TABLE IF EXISTS `sys_menu`;

CREATE TABLE `sys_menu` (
  `MENU_ID` int(11) NOT NULL COMMENT '菜单ID',
  `MENU_NAME` varchar(255) NOT NULL COMMENT '菜单名称',
  `MENU_URL` varchar(255) DEFAULT NULL COMMENT '访问的URL',
  `PARENT_ID` int(11) NOT NULL COMMENT '父菜单ID',
  `MENU_ORDER` varchar(6) NOT NULL COMMENT '菜单次序',
  `MENU_ICON` varchar(20) DEFAULT NULL COMMENT '菜单图标',
  `MENU_TYPE` varchar(10) NOT NULL COMMENT '类型(0_系统菜单,1_员工菜单,2_家长菜单)',
  `MENU_STATUS` varchar(1) NOT NULL DEFAULT '0' COMMENT '菜单状态(0_启用,1_禁用)',
  PRIMARY KEY (`MENU_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `sys_menu` */

LOCK TABLES `sys_menu` WRITE;

insert  into `sys_menu`(`MENU_ID`,`MENU_NAME`,`MENU_URL`,`PARENT_ID`,`MENU_ORDER`,`MENU_ICON`,`MENU_TYPE`,`MENU_STATUS`) values (1,'系统管理','#',0,'21','icon-cogs','0','0'),(2,'角色管理','role.do',1,'2',NULL,'0','0'),(3,'分校管理员','user/listUsers.do',1,'3',NULL,'0','0'),(4,'机构管理','dictionaries.do?parentId=0',1,'4',NULL,'0','0'),(5,'分校管理','school/list.do',1,'5',NULL,'0','0'),(6,'操作日志','log.do',1,'6',NULL,'0','0'),(7,'菜单管理','menu.do',1,'7',NULL,'0','0'),(10,'班级管理','#',0,'16','icon-comments','1','0'),(11,'周学习记录','#',0,'11','icon-folder-open','1','0'),(12,'撰写','aaa.do',11,'1',NULL,'1','0'),(13,'校对','bb.do',11,'2',NULL,'1','0'),(14,'审核','cc.do',11,'3',NULL,'1','0'),(15,'已发布','dd.do',11,'4',NULL,'1','0'),(16,'月成长报告','#',0,'12','icon-folder-open','1','0'),(17,'撰写','#',16,'1',NULL,'1','0'),(18,'校对','#',16,'2',NULL,'1','0'),(19,'审核','#',16,'3',NULL,'1','0'),(20,'已发布','#',16,'4',NULL,'1','0'),(21,'年度测评表','#',0,'13','icon-folder-open','1','0'),(22,'阶段测评表','#',0,'14','icon-folder-open','1','0'),(23,'工作日志','#',0,'15','icon-book','1','0'),(24,'学生管理','#',0,'17','icon-comments','1','0'),(25,'教师管理','#',0,'18','icon-comments','1','0'),(26,'课程管理','#',0,'19','icon-comments','1','0'),(27,'食谱管理','#',0,'20','icon-list','1','0'),(28,'撰写','#',21,'1',NULL,'1','0'),(29,'已发布','#',21,'2',NULL,'1','0'),(30,'撰写','#',22,'1',NULL,'1','0'),(31,'已发布','#',22,'2',NULL,'1','0'),(32,'撰写','#',23,'1',NULL,'1','0'),(33,'已发布','#',23,'2',NULL,'1','0'),(34,'课程浏览','course/list.do',26,'2',NULL,'1','0'),(35,'课程导入','#',26,'3',NULL,'1','0'),(36,'食谱浏览','#',27,'1',NULL,'1','0'),(37,'食谱导入','#',27,'2',NULL,'1','0'),(38,'班级浏览','classes/listClasses.do',10,'1',NULL,'1','0'),(39,'查看学生','stu/listStudent.do',24,'1',NULL,'1','0'),(40,'教师查看','teacher/listTeacher.do',25,'1',NULL,'1','0'),(41,'职员管理','#',0,'20','icon-comments','1','0'),(42,'职员查询','employee/listEmployee.do',41,'1',NULL,'1','0'),(43,'课程表配置','courseConfig/list.do',26,'4',NULL,'1','0'),(44,'课程表查看','courseSchedule/list.do',26,'5',NULL,'1','0'),(45,'课程组浏览','courseGroup/list.do',26,'1',NULL,'1','0'),(46,'分配教师','classes/goBindTeacher.do',10,'2',NULL,'1','0'),(47,'分配学员','classes/goBindStudent.do',10,'3',NULL,'1','0');

UNLOCK TABLES;

/*Table structure for table `sys_role` */

DROP TABLE IF EXISTS `sys_role`;

CREATE TABLE `sys_role` (
  `ROLE_ID` varchar(100) NOT NULL COMMENT '角色ID',
  `ROLE_NAME` varchar(100) NOT NULL COMMENT '角色名称',
  `RIGHTS` varchar(255) DEFAULT NULL COMMENT '权限值',
  `IDENTITY` varchar(255) DEFAULT NULL COMMENT '身份值',
  `PARENT_ID` varchar(100) NOT NULL COMMENT '父角色ID',
  `LEVEL` int(1) DEFAULT '-1' COMMENT '角色级别',
  PRIMARY KEY (`ROLE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `sys_role` */

LOCK TABLES `sys_role` WRITE;

insert  into `sys_role`(`ROLE_ID`,`ROLE_NAME`,`RIGHTS`,`IDENTITY`,`PARENT_ID`,`LEVEL`) values ('1','管理员','70368744177662',NULL,'0',0),('154c4c71dcda443bafa4864b2dc717e9','班主任','1024',NULL,'1',1),('2','总部管理员','274877905930','112','1',1),('b59e0d532963496484a053a62d0b224b','1223','807403520',NULL,'1',1),('c33f4e548e2e4d11845f325e06b2b461','分校管理员','12910067712',NULL,'1',1);

UNLOCK TABLES;

/*Table structure for table `sys_user` */

DROP TABLE IF EXISTS `sys_user`;

CREATE TABLE `sys_user` (
  `USER_ID` varchar(100) NOT NULL COMMENT '用户ID',
  `USER_NAME` varchar(50) NOT NULL COMMENT '用户名称',
  `PASSWORD` varchar(100) NOT NULL COMMENT '用户密码',
  `USER_TYPE` varchar(10) NOT NULL COMMENT '用户类型(super_超级管理员,system_系统管理员,workers_员工,student_学生)',
  `TYPE_ID` varchar(100) DEFAULT NULL COMMENT '类型ID',
  `ID_NUMBER` varchar(20) DEFAULT NULL COMMENT '身份证号',
  `REL_NAME` varchar(30) DEFAULT NULL COMMENT '真实姓名',
  `PHONE` varchar(32) DEFAULT NULL COMMENT '手机',
  `EMAIL` varchar(32) DEFAULT NULL COMMENT '邮箱地址',
  `STATUS` varchar(1) NOT NULL DEFAULT '0' COMMENT '用户状态（0_启用，1_禁用）',
  `LOGIN_IP` varchar(20) DEFAULT NULL COMMENT '登录IP',
  `SCHOOL_ID` bigint(20) DEFAULT NULL COMMENT '学校ID',
  `ORG_ID` varchar(100) DEFAULT NULL COMMENT '机构组织ID',
  `ORG_BM` varchar(20) DEFAULT NULL COMMENT '机构组织编码',
  `ORG_NAME` varchar(50) DEFAULT NULL COMMENT '机构组织名称',
  `LAST_LOGIN` varchar(255) DEFAULT NULL COMMENT '最后登录时间',
  `SKIN` varchar(20) NOT NULL DEFAULT 'default' COMMENT '登录主界面皮肤',
  `BZ` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `sys_user` */

LOCK TABLES `sys_user` WRITE;

insert  into `sys_user`(`USER_ID`,`USER_NAME`,`PASSWORD`,`USER_TYPE`,`TYPE_ID`,`ID_NUMBER`,`REL_NAME`,`PHONE`,`EMAIL`,`STATUS`,`LOGIN_IP`,`SCHOOL_ID`,`ORG_ID`,`ORG_BM`,`ORG_NAME`,`LAST_LOGIN`,`SKIN`,`BZ`) values ('1','admin','de41b7fb99201d8334c23c014db35ecd92df81bc','super',NULL,NULL,'默认管理员','18788888888','admin@main.com','0','0:0:0:0:0:0:0:1',1,'d5e1264c3ea84b9f869f118c5fb28799',NULL,NULL,'2018-03-09 11:38:11','default','默认管理员'),('4cf9aa4f68494f3391d6357d5eb7659b','root','f26d10ba147555dfbf6936aee98449bcccfc2c0a','system',NULL,'1234567890','root','18873386572','root@cqt.com','0','0:0:0:0:0:0:0:1',1,'8a56f6565aec4f58962540c4c1b7f432','11_000_101',NULL,'2018-02-08 10:14:05','skin-3','总部管理员'),('8f147fba9c134a2386b67acbaf5cf3e2','test','ee89026a6c5603c51b4504d218ac60f6874b7750','teacher',NULL,'4302111706140010','test','18873386572','test@cqt.com','0','0:0:0:0:0:0:0:1',1,'134ef8004fba473d99a32a0017ce7ef7','zwz',NULL,'2018-01-30 13:29:04','default','');

UNLOCK TABLES;

/*Table structure for table `sys_user_role` */

DROP TABLE IF EXISTS `sys_user_role`;

CREATE TABLE `sys_user_role` (
  `USER_ID` varchar(100) NOT NULL COMMENT '用户ID',
  `ROLE_ID` varchar(100) NOT NULL COMMENT '角色ID',
  KEY `fk_user_role_pk_role` (`ROLE_ID`),
  KEY `fk_user_role_pk_user` (`USER_ID`),
  CONSTRAINT `fk_user_role_pk_role` FOREIGN KEY (`ROLE_ID`) REFERENCES `sys_role` (`ROLE_ID`),
  CONSTRAINT `fk_user_role_pk_user` FOREIGN KEY (`USER_ID`) REFERENCES `sys_user` (`USER_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `sys_user_role` */

LOCK TABLES `sys_user_role` WRITE;

insert  into `sys_user_role`(`USER_ID`,`ROLE_ID`) values ('1','1'),('4cf9aa4f68494f3391d6357d5eb7659b','2'),('8f147fba9c134a2386b67acbaf5cf3e2','154c4c71dcda443bafa4864b2dc717e9'),('8f147fba9c134a2386b67acbaf5cf3e2','b59e0d532963496484a053a62d0b224b');

UNLOCK TABLES;

/*Table structure for table `t_classes` */

DROP TABLE IF EXISTS `t_classes`;

CREATE TABLE `t_classes` (
  `classes_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '班级ID',
  `classes_name` varchar(50) DEFAULT NULL COMMENT '班级名称',
  `year` varchar(10) DEFAULT NULL COMMENT '班级年份',
  `school_id` bigint(20) DEFAULT NULL COMMENT '所属学校',
  `create_date` date DEFAULT NULL COMMENT '创建日期',
  PRIMARY KEY (`classes_id`),
  KEY `class_school_pk` (`school_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `t_classes` */

LOCK TABLES `t_classes` WRITE;

insert  into `t_classes`(`classes_id`,`classes_name`,`year`,`school_id`,`create_date`) values (1,'哈佛1班','2014',1,'2010-09-01'),(2,'哈佛2班','2014',1,'2010-09-01'),(3,'剑桥1班','2014',1,'2010-09-01');

UNLOCK TABLES;

/*Table structure for table `t_course` */

DROP TABLE IF EXISTS `t_course`;

CREATE TABLE `t_course` (
  `course_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '课程ID',
  `course_name` varchar(50) DEFAULT NULL COMMENT '课程中文名称',
  `course_ename` varchar(50) DEFAULT NULL COMMENT '课程英文名称',
  `course_group_id` bigint(20) DEFAULT NULL COMMENT '课程组ID',
  `school_id` bigint(20) DEFAULT NULL COMMENT '学校ID',
  PRIMARY KEY (`course_id`),
  KEY `fk_course_pk_course_group` (`course_group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8;

/*Data for the table `t_course` */

LOCK TABLES `t_course` WRITE;

insert  into `t_course`(`course_id`,`course_name`,`course_ename`,`course_group_id`,`school_id`) values (1,'拼音识字','Pin Yin',1,1),(2,'国学','Traditional Culture',1,1),(3,'故事与表演',NULL,1,NULL),(4,'基础书写',NULL,1,NULL),(5,'看图说话',NULL,1,NULL),(6,'语言技能',NULL,1,NULL),(7,'播音主持与表演',NULL,1,NULL),(8,'数学与逻辑',NULL,2,NULL),(9,'人体生理与健康习惯',NULL,2,NULL),(10,'魔术',NULL,2,NULL),(11,'儿童高尔夫',NULL,3,NULL),(12,'儿童网球',NULL,3,NULL),(13,'跆拳道',NULL,3,NULL),(14,'体能训练',NULL,3,NULL),(15,'体育游戏',NULL,3,NULL),(16,'儿童足球',NULL,3,NULL),(17,'武术',NULL,3,NULL),(18,'儿童跳绳',NULL,3,NULL),(19,'儿童轮滑',NULL,3,NULL),(20,'沙包游戏',NULL,3,NULL),(21,'美术',NULL,4,NULL),(22,'艺术手工',NULL,5,NULL),(23,'舞蹈',NULL,6,NULL),(24,'儿童篮球',NULL,7,NULL),(25,'感统训练与兴趣引导',NULL,7,NULL),(26,'视唱练耳与音乐基础',NULL,7,NULL),(27,'音乐启蒙与乐感培养',NULL,7,NULL),(28,'音乐欣赏与音乐基础',NULL,7,NULL),(29,'社会情绪主题',NULL,8,NULL),(30,'自由玩耍',NULL,8,NULL),(31,'自由阅读',NULL,8,NULL),(32,'班级主题活动',NULL,8,NULL),(33,'户外活动',NULL,8,NULL),(34,'科学实验',NULL,9,NULL),(35,'魔术',NULL,9,NULL),(36,'创意手工',NULL,9,NULL),(37,'民族舞',NULL,9,NULL),(38,'国画',NULL,9,NULL),(39,'乐高',NULL,9,NULL),(40,'音乐',NULL,9,NULL),(41,'外教户外课堂',NULL,10,NULL),(42,'外教律动',NULL,10,NULL),(43,'英文剧',NULL,10,NULL),(44,'外教科学实验',NULL,10,NULL),(45,'外教生活体验',NULL,10,NULL),(46,'外教讲故事','Story Telling',10,NULL),(47,'外教手工','Arts&Crafts',10,NULL),(48,'主题英语','Theme English',10,NULL),(49,'艺术手工(英)','Arts&Crafts',10,NULL),(50,'讲故事','Story Telling',10,NULL),(51,'英文剧','Drama',10,NULL),(52,'户外课堂','Outdoor Activities',10,NULL),(53,'外教科学实验','Science Activities',10,NULL),(54,'外教生活体验','Cooking',10,NULL),(55,'外教律动','Music&Dance',10,NULL);

UNLOCK TABLES;

/*Table structure for table `t_course_config` */

DROP TABLE IF EXISTS `t_course_config`;

CREATE TABLE `t_course_config` (
  `course_config_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '配置ID',
  `course_date` varchar(20) DEFAULT NULL COMMENT '课程表的年月',
  `start_date` date DEFAULT NULL COMMENT '开始日期',
  `end_date` date DEFAULT NULL COMMENT '结束日期',
  `weeks` int(2) DEFAULT NULL COMMENT '按排几周',
  PRIMARY KEY (`course_config_id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

/*Data for the table `t_course_config` */

LOCK TABLES `t_course_config` WRITE;

UNLOCK TABLES;

/*Table structure for table `t_course_group` */

DROP TABLE IF EXISTS `t_course_group`;

CREATE TABLE `t_course_group` (
  `course_group_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '课程组ID',
  `course_group_name` varchar(50) NOT NULL COMMENT '课程组名称',
  PRIMARY KEY (`course_group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

/*Data for the table `t_course_group` */

LOCK TABLES `t_course_group` WRITE;

insert  into `t_course_group`(`course_group_id`,`course_group_name`) values (1,'中文组'),(2,'数学组'),(3,'体育组'),(4,'美术组'),(5,'艺术组'),(6,'舞蹈组'),(7,'音乐组'),(8,'常规组'),(9,'社团组'),(10,'英语外教组');

UNLOCK TABLES;

/*Table structure for table `t_course_item` */

DROP TABLE IF EXISTS `t_course_item`;

CREATE TABLE `t_course_item` (
  `course_item_id` varchar(100) NOT NULL COMMENT '课程项ID',
  `course_schedule_id` varchar(100) DEFAULT NULL COMMENT '课程表ID',
  `z_index` int(2) DEFAULT NULL COMMENT '周几的索引标记',
  `start_time` varchar(10) DEFAULT NULL COMMENT '课程开始时间',
  `end_time` varchar(10) DEFAULT NULL COMMENT '课程结束时间',
  `course_name` varchar(100) DEFAULT NULL COMMENT '课程中文名称',
  `course_ename` varchar(50) DEFAULT NULL COMMENT '课程英文名称',
  `teacher_name` varchar(50) DEFAULT NULL COMMENT '教师中文名字',
  `headmaster` varchar(50) DEFAULT NULL COMMENT '辅教（班主任，副班主任，其它辅教）',
  PRIMARY KEY (`course_item_id`),
  KEY `fk_course_schedule_item_pk_course_schedule` (`course_schedule_id`),
  CONSTRAINT `fk_course_schedule_item_pk_course_schedule` FOREIGN KEY (`course_schedule_id`) REFERENCES `t_course_schedule` (`course_schedule_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_course_item` */

LOCK TABLES `t_course_item` WRITE;

insert  into `t_course_item`(`course_item_id`,`course_schedule_id`,`z_index`,`start_time`,`end_time`,`course_name`,`course_ename`,`teacher_name`,`headmaster`) values ('0027157ab9b341b1aea38c7eb36abaa2','8e212b16287d476699213b4e3bce4086',3,'10:30','11:00','自由阅读','FreeReading','马梦瑶','郭婷婷/原惠慧'),('005644a5d8c640fb8a8c2037921f9a24','bcdac4d1c5d845a48b53369b8436b131',2,'14:00','14:30','社会情绪主题','SEL','令狐慧谊','王科妮'),('006e78ad6e6f4ce8bb2ff8d37418c83e','0a543c589d72410e92929d9f224b18cc',0,'11:15','11:45','午餐   Lunch','','',''),('00c66d3537284adebf549b5478f81eea','e27e39be3b8e4b74a391a783f922b597',0,'9:40','9:55','视保操、加餐   Eyes Exercises and Snacks','','',''),('00fd882c7aa14726a6b09ea54bffc270','a21f951d755842d2b02932379080f892',1,'8:30','9:00','主题英语','ThemeEnglish','Sean/车柳英','刘蕊/吴本美'),('01242a6778c04a2599c9a023b0b80cf7','656ba48667bd48c0b9fb812ab14fbfd4',5,'10:30','11:00','故事与表演','StoryTelling','原惠慧','张亚'),('01567debd06c4a3c9d039fe1ee878f0a','8e212b16287d476699213b4e3bce4086',1,'9:10','9:40','故事与表演','StoryTelling','周琳','马梦瑶/郭婷婷/原惠慧'),('01d55f929ce44a7198c90d8d484a6f21','656ba48667bd48c0b9fb812ab14fbfd4',5,'8:30','9:00','班级主题活动','Themeactivities','赵雨晴','张亚'),('0209aaa2bb1740159c7ddc9f49891236','6440ca0e3fbf48218726c7b9bdf491c7',3,'9:10','9:40','儿童足球','Football','王强','田友美'),('024bd33a2d9d41dcbe4079951cdbe126','656ba48667bd48c0b9fb812ab14fbfd4',1,'15:50','16:20','外教户外课堂','OutdoorActivities','Dani/孟广鑫','赵雨晴/张亚'),('026153ead0954f31beb2193e33d70d2f','b06ababb8ada44958f6baf8fa20c41d4',1,'10:30','11:00','基础书写','BasicHandwriting','刘欢欢','赵翊彤/尤增强'),('0288c85352e448a6bf579fa0ba48af25','bcdac4d1c5d845a48b53369b8436b131',5,'14:00','14:30','艺术手工','ArtsandCrafts','董绮轩','王科妮/令狐慧谊'),('031fbedc478b4bd28d41c229db077037','a21f951d755842d2b02932379080f892',1,'10:30','11:00','外教户外课堂','OutdoorActivities','Sean/车柳英','吴本美'),('03a5a1749de943afb9103d7a658702f8','047372893e1144cf9a0a15669278ab53',2,'10:30','11:00','自由阅读','FreeReading','王世鹏','刘亚坤'),('043985bfbdd44ad8bc0a1273b4f54bee','047372893e1144cf9a0a15669278ab53',2,'9:55','10:25','数学与逻辑','Math&Logic','苏焕','刘亚坤/王世鹏'),('0517f24d6eb048eba5ffd49cabef14e4','7c9f1583f491433182867ff983c73d33',4,'15:50','16:20','自由阅读','FreeReading','魏苗','周琳'),('052a384019f04c87b0c87a5f4d829d8e','20ba9953cb534c88a6fdbe92ff93a107',3,'14:45','15:15','外教户外课堂','OutdoorActivities','Joe/马丽','王田田'),('05d5d95b432445779d06ccecbdbf172c','6440ca0e3fbf48218726c7b9bdf491c7',0,'9:40','9:55','视保操、加餐   Eyes Exercises and Snacks','','',''),('0632dbd60a3a44a996b0feeb6ad63dfc','0a543c589d72410e92929d9f224b18cc',4,'9:10','9:40','主题英语','ThemeEnglish','马丽','唐艾艺/杨新'),('068f1139d85f432fb413bb7bfb16f22c','b06ababb8ada44958f6baf8fa20c41d4',0,'15:15','15:20','喝水 休息  Drink water, Break Time','','',''),('0692c33c90f648dcb992931159757ec6','6440ca0e3fbf48218726c7b9bdf491c7',5,'9:10','9:40','人体生理与健康习惯','Healthcare','江慧涛','田友美'),('079056b46f4244be81ab5db90642e41c','047372893e1144cf9a0a15669278ab53',0,'14:30','14:45','加餐  Snacks','','',''),('07bb92650a5b49a7ba70b74e76ff5110','656ba48667bd48c0b9fb812ab14fbfd4',0,'9:00','9:10','常青藤武术操   IVY Kongfu Exercises','','',''),('07c1ab447ab748e3a1e84213af49a374','bcdac4d1c5d845a48b53369b8436b131',0,'8:00','8:30','早餐  Breakfast','','',''),('07c747da8b674bc39cd9f028c0b1e808','b06ababb8ada44958f6baf8fa20c41d4',5,'14:00','14:30','外教科学实验','ScienceActivities','Sean/慕海兰','赵翊彤/尤增强'),('0836e54dacf747e08cc43e1a3a6d7397','047372893e1144cf9a0a15669278ab53',1,'14:00','14:30','英文剧','Drama','唐任姣','刘亚坤/王世鹏'),('0858a85b050341c1bffa1c5ae61fe08e','60b0284aaf9d458ebcc04f47213a769b',0,'15:45','15:50','喝水 休息  Drink water, Break Time','','',''),('0886b39e56bb4b828ecab9eafbf0a561','047372893e1144cf9a0a15669278ab53',4,'9:10','9:40','班级主题活动','Themeactivities','刘亚坤','王世鹏'),('08bdefaa5daf46eb86335a25bb44df01','20ba9953cb534c88a6fdbe92ff93a107',4,'15:20','15:50','主题英语','ThemeEnglish','Joe/马丽',''),('09052a72d9c64e19942355fbc93aeffe','4bac307c43c3499794b367614d7fac5f',0,'10:25','10:30','喝水 休息  Drink Water, Break Time','','',''),('091aa37fa3ab425bbef8b9876d1c3c14','33e6bdae311d41a6ac77029ffb3c4c7d',2,'9:55','10:25','户外课堂','OutdoorActivities','杨国颖','梁丽/江慧涛'),('0929bddd0bc2401ba8e6dac070d19cd1','656ba48667bd48c0b9fb812ab14fbfd4',0,'10:25','10:30','喝水 休息  Drink Water, Break Time','','',''),('0966cd464d8d4986adaaab1f5632f4e4','0a543c589d72410e92929d9f224b18cc',2,'9:10','9:40','主题英语','ThemeEnglish','马丽','唐艾艺/杨新'),('09aff7317d604fe5a2d21f45e0d214b6','656ba48667bd48c0b9fb812ab14fbfd4',0,'15:00','15:15','加餐  Snacks','','',''),('09dcfbfd2e5e49b2af84f4ec4a9779d2','e27e39be3b8e4b74a391a783f922b597',1,'15:20','15:50','美术','ArtandDrawing','门娜','李玲玉'),('09fb9bf9e26240a685acc8412a4f89dc','7c9f1583f491433182867ff983c73d33',2,'14:00','14:30','看图说话','PictureDescription','王田田','魏苗/周琳'),('0a2673d171b94377957a537af965cb15','7c9f1583f491433182867ff983c73d33',3,'9:10','9:40','外教户外课堂','OutdoorActivities','Kim/唐任姣','魏苗/周琳'),('0a5de208748848fcb139f81fd7adf64e','047372893e1144cf9a0a15669278ab53',2,'8:30','9:00','拼音识字','PinYin','李玲玉','刘亚坤/王世鹏'),('0acf717778fe4909b3fb55f48e0332fb','0a543c589d72410e92929d9f224b18cc',3,'14:45','15:15','IVY社团活动','Clubactivities','',''),('0ae77c654847413f93036dbc91745ba1','0a543c589d72410e92929d9f224b18cc',2,'8:30','9:00','英文剧','Drama','马丽','杨新'),('0aef4c0cf52e415baa2fbca18efe4f56','6440ca0e3fbf48218726c7b9bdf491c7',4,'10:30','11:00','户外活动','OutdoorActivities','田友美',''),('0bde1f40ee99462ab2c5374046bd52ee','0a543c589d72410e92929d9f224b18cc',3,'10:30','11:00','讲故事','StoryTelling','马丽','唐艾艺/杨新'),('0c6d1cfa5a714b388c60e6310e7114b1','0a543c589d72410e92929d9f224b18cc',3,'14:00','14:30','拼音识字','PinYin','李玲玉','唐艾艺/杨新'),('0c7669656b5442fd9d31f82d6ab31bd7','20ba9953cb534c88a6fdbe92ff93a107',4,'14:45','15:15','主题英语','ThemeEnglish','Joe/马丽','王田田'),('0cf6cd92bac242d89592ade25464f364','a21f951d755842d2b02932379080f892',5,'9:10','9:40','外教生活体验','Cooking','Sean/车柳英','刘蕊/吴本美'),('0d07c16511264bbab68f1f69b6364c75','33e6bdae311d41a6ac77029ffb3c4c7d',1,'10:30','11:00','主题英语','ThemeEnglish','杨国颖','梁丽/江慧涛'),('0d1d653217bb4ac78b274458115312e3','b8a2048b3b644d5f86b644f808f13a16',5,'14:00','14:30','主题英语','ThemeEnglish','Eric/付晓雪','辛佳怡'),('0d496563d1754c97b53190c6e32ab8b7','8e212b16287d476699213b4e3bce4086',4,'8:30','9:00','自由阅读','FreeReading','马梦瑶','郭婷婷/原惠慧'),('0d79096461c94dd7905cb959f9529068','0a543c589d72410e92929d9f224b18cc',4,'15:50','16:20','视唱练耳与音乐基础','SolfeggioandMusicfoundation','梁丽','唐艾艺/杨新'),('0d8c9b68228b4043929ee7c27121face','6440ca0e3fbf48218726c7b9bdf491c7',0,'8:00','8:30','早餐  Breakfast','','',''),('0dbbf6b62ef945d6b6d32e85537a4344','047372893e1144cf9a0a15669278ab53',0,'9:00','9:10','常青藤武术操   IVY Kongfu Exercises','','',''),('0e49b655a2414461af21cfedefe43a5e','a21f951d755842d2b02932379080f892',1,'9:55','10:25','外教手工','Arts&Crafts','Sean/车柳英','刘蕊/吴本美'),('0ef3fdce89b44ad680257ad8931be2be','20ba9953cb534c88a6fdbe92ff93a107',4,'9:55','10:25','社会情绪主题','SEL','王田田',''),('100549f24274406ab1791e6dc491f71d','b8a2048b3b644d5f86b644f808f13a16',0,'16:35','17:00','晚餐 Dinner','','',''),('10531edab7dc4f4b8e94f22679530f0f','b8a2048b3b644d5f86b644f808f13a16',5,'15:20','15:50','外教科学实验','ScienceActivities','Eric/付晓雪','辛佳怡'),('1073ed96ec194de9bce6903041af4cd0','4b5011d1c18a4549af0b89054cfbf197',1,'15:15','15:45','户外课堂','OutdoorActivities','车柳英','潘菲'),('1119e8d344514bf1a42aeba78207916f','a21f951d755842d2b02932379080f892',2,'9:55','10:25','外教户外课堂','OutdoorActivities','Sean/车柳英','刘蕊/吴本美'),('1150b167ee384f749c2b6c8a97c089a3','0a543c589d72410e92929d9f224b18cc',2,'14:45','15:15','美术','ArtandDrawing','张文慧','唐艾艺/杨新'),('11c879642f4043e19787559bda6fc544','4bac307c43c3499794b367614d7fac5f',0,'8:00','8:30','早餐  Breakfast','','',''),('123a7966762f451e9b7bc237c8278d42','4bac307c43c3499794b367614d7fac5f',0,'9:40','9:55','视保操、加餐   Eyes Exercises and Snacks','','',''),('127ea42eb13d482c958571af315a4238','7c9f1583f491433182867ff983c73d33',3,'9:55','10:25','外教手工','Arts&Crafts','Kim/唐任姣','魏苗/周琳'),('12cc8de0f68f40a4ae0a5b0398dedf2d','b8a2048b3b644d5f86b644f808f13a16',4,'9:55','10:25','户外活动','OutdoorActivities','辛佳怡',''),('12d68db298b449c194655ce9a3743a86','656ba48667bd48c0b9fb812ab14fbfd4',0,'11:15','11:45','午餐   Lunch','','',''),('13015878abe44f42a11599d071b325ba','20ba9953cb534c88a6fdbe92ff93a107',3,'9:10','9:40','户外活动','OutdoorActivities','马丽','王田田'),('1362f15408904012b43eb78d02ec395b','a21f951d755842d2b02932379080f892',5,'15:15','15:45','舞蹈','Dancing','李可遐','刘蕊/吴本美'),('13650e35cf4b4903bdb06d992e0092ce','4bac307c43c3499794b367614d7fac5f',4,'9:10','9:40','户外活动','OutdoorActivities','陈亚楠','门娜/张欢'),('13dceeac4772494cb6bcda83e233f1aa','a21f951d755842d2b02932379080f892',0,'14:10','14:30','起床   Get up','','',''),('14aeec72f0964b6ea83b912bbf8f0ae0','16333413b51c43a3bd10996360419425',4,'14:45','15:15','户外活动','OutdoorActivities','曹艳','于菲'),('1559b68adbd84143b7076441a803d09b','047372893e1144cf9a0a15669278ab53',4,'14:00','14:30','户外课堂','OutdoorActivities','唐任姣','刘亚坤/王世鹏'),('1571565418184dc283c9a595f1b30f68','33e6bdae311d41a6ac77029ffb3c4c7d',0,'15:45','15:50','喝水 休息  Drink water, Break Time','','',''),('157bb7bfe9fb4b58b3765fec8ebd4f89','e27e39be3b8e4b74a391a783f922b597',2,'10:30','11:00','外教户外课堂','OutdoorActivities','Dani/孟广鑫','李玲玉/慕海兰'),('1628499d3a994297a353a44f31d933d2','b06ababb8ada44958f6baf8fa20c41d4',0,'9:40','9:55','视保操、加餐   Eyes Exercises and Snacks','','',''),('167f1ab77e30408ab84bfaee1bbad240','8e212b16287d476699213b4e3bce4086',1,'9:55','10:25','社会情绪主题','SEL','马梦瑶','郭婷婷/原惠慧'),('1683bacdefde44ac934d520187b766f6','b8a2048b3b644d5f86b644f808f13a16',2,'14:45','15:15','主题英语','ThemeEnglish','Eric/付晓雪','辛佳怡'),('16a6484c7f9b422fbbf79de5e501aa64','e27e39be3b8e4b74a391a783f922b597',0,'15:15','15:20','喝水 休息  Drink water, Break Time','','',''),('16bf4bcb621d498281f882d1e57f7065','e27e39be3b8e4b74a391a783f922b597',5,'9:55','10:25','主题英语','ThemeEnglish','Dani/孟广鑫','李玲玉/慕海兰'),('16cb53854a8e427d9a28d39a7de7ae1d','a21f951d755842d2b02932379080f892',0,'16:35','17:00','晚餐 Dinner','','',''),('17659dba72294683aa7f39489d238160','6440ca0e3fbf48218726c7b9bdf491c7',3,'8:30','9:00','社会情绪主题','SEL','田友美',''),('17da995f48c34037aa0421cfddded8cf','a21f951d755842d2b02932379080f892',4,'9:55','10:25','外教户外课堂','OutdoorActivities','Sean/车柳英','刘蕊/吴本美'),('17dc3044d09847efbaf196918b8581b1','e27e39be3b8e4b74a391a783f922b597',2,'15:20','15:50','户外活动','OutdoorActivities','李玲玉',''),('181d2b1f82af4a8c90ec8240c4f24b13','4b5011d1c18a4549af0b89054cfbf197',3,'8:30','9:00','自由玩耍','FreePlay','潘菲',''),('186dc5b196784cc08f2e5e142524c290','4bac307c43c3499794b367614d7fac5f',5,'15:35','15:55','主题英语','ThemeEnglish','Kim/张欢','陈亚楠/门娜/张欢'),('18a02a557ec240eb81d71c3a18f9f578','bcdac4d1c5d845a48b53369b8436b131',5,'8:30','9:00','主题英语','ThemeEnglish','Eric/石亚静','王科妮/令狐慧谊'),('1a11243d26894af8873dd5f21dd0644e','33e6bdae311d41a6ac77029ffb3c4c7d',4,'9:55','10:25','武术','MartialArts','外聘老师','梁丽/江慧涛'),('1a3ba446dd4747a79955187ff1a11b14','b06ababb8ada44958f6baf8fa20c41d4',2,'9:10','9:40','艺术手工','ArtsandCrafts','陈亚楠','赵翊彤/尤增强'),('1abcd6fef1f74f07833b77080c68588b','8e212b16287d476699213b4e3bce4086',5,'9:10','9:40','班级主题活动','Themeactivities','马梦瑶','郭婷婷/原惠慧'),('1b051dcc7c104513a276f32e69414065','b06ababb8ada44958f6baf8fa20c41d4',1,'8:30','9:00','美术','ArtandDrawing','门娜','赵翊彤/尤增强'),('1b8dceff7fc947a2af9d2f85d5c316ec','16333413b51c43a3bd10996360419425',1,'15:20','15:50','艺术手工','ArtsandCrafts','王婷婷','曹艳/于菲'),('1badf92096204a60bf3f98f16ad28d78','60b0284aaf9d458ebcc04f47213a769b',2,'10:30','11:00','外教户外课堂','OutdoorActivities','Joe/张欢','郑丽/杨伟伟'),('1bfa94968bc04302a7f3c352ad1aa40e','60b0284aaf9d458ebcc04f47213a769b',2,'8:30','9:00','主题英语','ThemeEnglish','Joe/张欢','郑丽/杨伟伟'),('1c115f6278c246d0829605d9815ee204','bcdac4d1c5d845a48b53369b8436b131',2,'14:45','15:15','体能训练','Physicaltraining','王世鹏','王科妮/令狐慧谊'),('1c17c91cd6504844a4e08c987fe9b948','047372893e1144cf9a0a15669278ab53',4,'14:45','15:15','外教生活体验','Cooking','唐任姣/Tarry','刘亚坤/王世鹏'),('1c4e7f9e5e0442c0bf57081b78ad8cea','047372893e1144cf9a0a15669278ab53',2,'15:50','16:20','主题英语','ThemeEnglish','唐任姣','王世鹏'),('1c636027043f48608b2302a532deb009','656ba48667bd48c0b9fb812ab14fbfd4',5,'9:55','10:25','美术','ArtandDrawing','康雪荣','赵雨晴/张亚'),('1c9470ebe58f48ca9bf6c24eb207321b','656ba48667bd48c0b9fb812ab14fbfd4',3,'10:30','11:00','语言技能','LanguageSkill','张英','赵雨晴/张亚'),('1c9afc5bfa294965aeb12ae6724e7a2b','4bac307c43c3499794b367614d7fac5f',2,'9:55','10:25','自由阅读','FreeReading','陈亚楠','门娜/张欢'),('1cdad0a4987345c3a9b4001cec83344d','047372893e1144cf9a0a15669278ab53',1,'9:55','10:25','基础书写','BasicHandwriting','刘欢欢','刘亚坤/王世鹏'),('1d1520b5344f492e9dfc0b18c0309c50','33e6bdae311d41a6ac77029ffb3c4c7d',3,'15:15','15:45','美术','ArtandDrawing','康雪荣','梁丽/江慧涛'),('1d21848cb07f4b34a8d4651826021c9a','6440ca0e3fbf48218726c7b9bdf491c7',3,'14:00','14:30','讲故事','StoryTelling','石亚静','田友美'),('1d58de5a6f1045fdab1e5684a1911cc5','6440ca0e3fbf48218726c7b9bdf491c7',0,'17:00','17:00','离校','','',''),('1dcc2c76d58b4bec971fede5389656c7','60b0284aaf9d458ebcc04f47213a769b',1,'9:55','10:25','主题英语','ThemeEnglish','Joe/张欢','郑丽/杨伟伟'),('1dfc125197b34aceb65f0ea04cdc8fed','a21f951d755842d2b02932379080f892',2,'8:30','9:00','主题英语','ThemeEnglish','Sean/车柳英',''),('1e1bfa8b5ee04c7dadba5b2d2ba2088f','b8a2048b3b644d5f86b644f808f13a16',2,'15:20','15:50','主题英语','ThemeEnglish','Eric/付晓雪','辛佳怡'),('1e2f1f0693c14752b33ac5a72692ca90','bcdac4d1c5d845a48b53369b8436b131',1,'8:30','9:00','主题英语','ThemeEnglish','Eric/石亚静','王科妮/令狐慧谊'),('1e5e96d329d14b2da01e35dad9d7bd6f','33e6bdae311d41a6ac77029ffb3c4c7d',5,'10:30','11:00','主题英语','ThemeEnglish','杨国颖','梁丽/江慧涛'),('1f306abc752d492dbd23763eeb57db00','6440ca0e3fbf48218726c7b9bdf491c7',5,'15:50','16:20','外教科学实验','ScienceActivities','石亚静/Tarry','田友美'),('1f4619d43ebf4b5399d47a464dad7eb8','16333413b51c43a3bd10996360419425',0,'9:40','9:55','视保操、加餐   Eyes Exercises and Snacks','','',''),('1fd01e8da03245e8a079cb9648f91864','33e6bdae311d41a6ac77029ffb3c4c7d',1,'15:50','16:20','故事与表演','StoryTelling','原惠慧','江慧涛'),('1fe515f8a74b4dfab0552be151cef78f','4bac307c43c3499794b367614d7fac5f',2,'15:00','15:30','外教户外课堂','OutdoorActivities','Kim/张欢','陈亚楠/门娜/张欢'),('1ff258a6ae2d44939da17e4b69332e1b','0a543c589d72410e92929d9f224b18cc',2,'9:55','10:25','主题英语','ThemeEnglish','马丽','杨新'),('21634d7e55a442d1ac5ab7f1674b61f3','4bac307c43c3499794b367614d7fac5f',1,'8:30','9:00','故事与表演','StoryTelling','周琳','陈亚楠'),('218239b7136e4c0dafb0fd08a5f1e006','b06ababb8ada44958f6baf8fa20c41d4',0,'9:00','9:10','常青藤武术操   IVY Kongfu Exercises','','',''),('21b89d94d0b841e197ab25e39c404542','047372893e1144cf9a0a15669278ab53',2,'9:10','9:40','沙包游戏','BeanbagGame','刘健康','王世鹏'),('21dc4750279a401d8a3d282e6e9630b0','bcdac4d1c5d845a48b53369b8436b131',1,'9:10','9:40','外教户外课堂','OutdoorActivities','Eric/石亚静','王科妮/令狐慧谊'),('21ee676417044cb99dc54edfb458ec9d','656ba48667bd48c0b9fb812ab14fbfd4',0,'15:45','15:50','喝水 休息  Drink water, Break Time','','',''),('21fe75c9a3994ba8b691519eddbcc11d','047372893e1144cf9a0a15669278ab53',2,'14:00','14:30','主题英语','ThemeEnglish','唐任姣','刘亚坤/王世鹏'),('22518ff0061749b6a394b39ede306ad9','20ba9953cb534c88a6fdbe92ff93a107',1,'14:00','14:30','主题英语','ThemeEnglish','Joe/马丽','王田田'),('22892e9e9ced48fab5530a177f73ae09','656ba48667bd48c0b9fb812ab14fbfd4',2,'14:30','15:00','外教户外课堂','OutdoorActivities','Dani/孟广鑫','赵雨晴/张亚'),('22925a42d30244068e544a9bb6e59e56','0a543c589d72410e92929d9f224b18cc',0,'17:00','17:00','离校','','',''),('22a247d3a2d44042a58ff43b1027939a','047372893e1144cf9a0a15669278ab53',4,'15:20','15:50','主题英语','ThemeEnglish','唐任姣','刘亚坤/王世鹏'),('2300764061ec41b8a2e39401124d63ec','4b5011d1c18a4549af0b89054cfbf197',1,'9:55','10:25','舞蹈','Dancing','李可遐','潘菲'),('236366d5c2f346d19351466a5ccd008c','e27e39be3b8e4b74a391a783f922b597',0,'16:35','17:00','晚餐 Dinner','','',''),('23c2c7947cb54af693e87958599aff50','bcdac4d1c5d845a48b53369b8436b131',2,'15:50','16:20','','','','yyyy'),('23e548496eb84b2a8ce45384569e69a0','8e212b16287d476699213b4e3bce4086',4,'16:00','16:20','主题英语','ThemeEnglish','马梦瑶','郭婷婷/原惠慧'),('24520b37ec0f46599343bd4bd423d270','7c9f1583f491433182867ff983c73d33',2,'14:45','15:15','舞蹈','Dancing','尤增强','魏苗/周琳'),('247b54a5ca7f42768749925f4fa61adf','4b5011d1c18a4549af0b89054cfbf197',0,'11:15','11:45','午餐   Lunch','','',''),('248c573339e148018a66a3a9dfb8b070','8e212b16287d476699213b4e3bce4086',1,'8:30','9:00','自由阅读','FreeReading','马梦瑶','郭婷婷/原惠慧'),('24e60ea08fef4daeb505496314ed7f8b','16333413b51c43a3bd10996360419425',0,'11:15','11:45','午餐   Lunch','','',''),('251246fcf872498dab00a6387ec7e162','b06ababb8ada44958f6baf8fa20c41d4',3,'15:50','16:20','英文剧','Drama','Sean/慕海兰','赵翊彤/尤增强'),('2529a705cef04cbca5453df9a018c5ec','4bac307c43c3499794b367614d7fac5f',3,'15:35','15:55','外教户外课堂','OutdoorActivities','Kim/张欢','陈亚楠/门娜/张欢'),('25a07bab5a124a8f87e4a0e687021c48','0a543c589d72410e92929d9f224b18cc',5,'8:30','9:00','主题英语','ThemeEnglish','马丽','唐艾艺/杨新'),('25b6305c198c479284c89b260b4d517e','0a543c589d72410e92929d9f224b18cc',2,'10:30','11:00','户外课堂','OutdoorActivities','马丽','唐艾艺/杨新'),('2600acc436ed4923bc90680c998b3b12','656ba48667bd48c0b9fb812ab14fbfd4',1,'9:10','9:40','户外活动','OutdoorActivities','赵雨晴','张亚'),('26101afccbac48e288f40c65b4d41550','a21f951d755842d2b02932379080f892',3,'14:30','15:00','人体生理与健康习惯','Healthcare','张亚','刘蕊/吴本美'),('2689440a3ef44445a0e749626990f8f3','7c9f1583f491433182867ff983c73d33',0,'9:00','9:10','常青藤武术操   IVY Kongfu Exercises','','',''),('26e2fe28babf47ac887a55aeec59f63c','4b5011d1c18a4549af0b89054cfbf197',2,'10:30','11:00','户外活动','OutdoorActivities','潘菲',''),('2710b0d179324272b59c3f32001eb27e','bcdac4d1c5d845a48b53369b8436b131',0,'14:30','14:45','加餐  Snacks','','',''),('27226673286d438caea2d23ef5b32080','b8a2048b3b644d5f86b644f808f13a16',0,'13:40','14:00','起床   Get up','','',''),('27c5045396c04c1285983fb561aa4117','4b5011d1c18a4549af0b89054cfbf197',1,'8:30','9:00','人体生理与健康习惯','Healthcare','张亚','潘菲'),('27dabe9f1c4442d1bfdd746a2e92f659','b8a2048b3b644d5f86b644f808f13a16',5,'15:50','16:20','外教户外课堂','OutdoorActivities','Eric/付晓雪','辛佳怡'),('2842b9ec534847beb6147a5d6deb894b','4b5011d1c18a4549af0b89054cfbf197',1,'9:10','9:40','体育游戏','OutdoorGames','辛佳怡','潘菲'),('2975351c63224f539a74126c53a57c92','b06ababb8ada44958f6baf8fa20c41d4',4,'15:50','16:20','主题英语','ThemeEnglish','Sean/慕海兰','赵翊彤/尤增强'),('2996f77d8cfb48b6abf5f897992ee19c','7c9f1583f491433182867ff983c73d33',3,'8:30','9:00','跆拳道','Taekwondo','外聘老师','魏苗/周琳'),('29e2e502cb944efab77eed62642a0434','20ba9953cb534c88a6fdbe92ff93a107',0,'15:15','15:20','喝水 休息  Drink water, Break Time','','',''),('2aa9c41096644c80bb074f8077b17e5a','0a543c589d72410e92929d9f224b18cc',3,'8:30','9:00','跆拳道','Taekwondo','外聘老师','唐艾艺'),('2b082ea4953a4e40a981447e1875ffee','047372893e1144cf9a0a15669278ab53',4,'15:50','16:20','主题英语','ThemeEnglish','唐任姣','刘亚坤/王世鹏'),('2b6e054481d14b4abb6136800ecaef2d','20ba9953cb534c88a6fdbe92ff93a107',5,'15:50','16:20','主题英语','ThemeEnglish','Joe/马丽','王田田'),('2b7f0c6c636847729185919dc53a6584','e27e39be3b8e4b74a391a783f922b597',3,'14:00','14:30','沙包游戏','BeanbagGame','令狐慧谊',''),('2b8de0d86fe64256b11bec5ddc6f163e','047372893e1144cf9a0a15669278ab53',5,'14:00','14:30','户外课堂','OutdoorActivities','唐任姣','刘亚坤/王世鹏'),('2c19af6104d84b42b696267ca3976945','8e212b16287d476699213b4e3bce4086',0,'11:15','11:45','午餐   Lunch','','',''),('2cbdc1545e104322a9130b14e278fb43','b8a2048b3b644d5f86b644f808f13a16',3,'9:55','10:25','跆拳道','Taekwondo','外聘老师','辛佳怡'),('2cc1ece2f395423eb7c627e19a0ad829','e27e39be3b8e4b74a391a783f922b597',0,'10:25','10:30','喝水 休息  Drink Water, Break Time','','',''),('2d2bdd8c1fca4b86920844cb8154aed3','8e212b16287d476699213b4e3bce4086',0,'14:30','15:00','起床   Get up','','',''),('2d4aa062dff34ccbb9ff23a97b12c095','6440ca0e3fbf48218726c7b9bdf491c7',1,'8:30','9:00','数学与逻辑','Math&Logic','唐艾艺','田友美'),('2d55c66674f144b18234c85db44752c9','6440ca0e3fbf48218726c7b9bdf491c7',2,'10:30','11:00','户外活动','OutdoorActivities','田友美',''),('2d72815bd003405db29204c679590ed5','16333413b51c43a3bd10996360419425',3,'8:30','9:00','主题英语','ThemeEnglish','付晓雪','曹艳/于菲'),('2dadc2e9ceb34bb9bf9ac602aa41b693','6440ca0e3fbf48218726c7b9bdf491c7',4,'9:55','10:25','美术','ArtandDrawing','杨伟伟','田友美/石亚静'),('2decb3181a8e4a7b817b26532db3fee1','7c9f1583f491433182867ff983c73d33',4,'10:30','11:00','外教科学实验','ScienceActivities','Kim/唐任姣','魏苗/周琳'),('2e1076920b2d44a1ac7f19c9629caee5','8e212b16287d476699213b4e3bce4086',0,'16:35','17:00','晚餐 Dinner','','',''),('2ea57f0b03f541efbda11f1811dcb702','0a543c589d72410e92929d9f224b18cc',3,'15:20','15:50','IVY社团活动','Clubactivities','',''),('2f0d5005cb6249058989423592308010','e27e39be3b8e4b74a391a783f922b597',2,'15:50','16:20','舞蹈','Dancing','刘亚坤','李玲玉'),('2f0d652d41234749ae7b539c2448244a','b8a2048b3b644d5f86b644f808f13a16',2,'8:30','9:00','艺术手工','ArtsandCrafts','董绮轩','辛佳怡'),('2f13add4cb704207ac28aa9282618849','20ba9953cb534c88a6fdbe92ff93a107',2,'15:50','16:20','外教户外课堂','OutdoorActivities','Joe/马丽','王田田'),('2f41e60b89f04eab9982966a645c49c6','6440ca0e3fbf48218726c7b9bdf491c7',0,'11:15','11:45','午餐   Lunch','','',''),('2f473c5a425d4fd6815d366ec81c3492','33e6bdae311d41a6ac77029ffb3c4c7d',0,'14:10','14:30','起床   Get up','','',''),('2f61334a19844eaea853c4e90a1f35eb','0a543c589d72410e92929d9f224b18cc',4,'9:55','10:25','户外课堂','OutdoorActivities','马丽','唐艾艺/杨新'),('301a464c5ae74f378ff25765baf56149','4bac307c43c3499794b367614d7fac5f',3,'9:55','10:25','自由阅读','FreeReading','陈亚楠','门娜/张欢'),('3021ce6cb90f456687de833cd67f9452','8e212b16287d476699213b4e3bce4086',2,'10:30','11:00','户外活动','OutdoorActivities','马梦瑶','郭婷婷/原惠慧'),('30578f1439904a2abbea379351bf8ece','656ba48667bd48c0b9fb812ab14fbfd4',0,'17:00','17:00','离校','','',''),('30aa44fe37e84d87a97419c843926de3','047372893e1144cf9a0a15669278ab53',5,'8:30','9:00','播音主持与表演','PublicSpeakingSkills','魏苗','刘亚坤/王世鹏'),('30c08c0ae3f24db9beee34e8eb7faa97','bcdac4d1c5d845a48b53369b8436b131',3,'14:00','14:30','音乐欣赏与音乐基础','Music','常晓燕','王科妮'),('316a4f6afd13468a9455b7af9671ac33','656ba48667bd48c0b9fb812ab14fbfd4',5,'9:10','9:40','体育游戏','OutdoorGames','王强','赵雨晴/张亚'),('320bcc46bb744d8ca7f807661fc5c48a','047372893e1144cf9a0a15669278ab53',0,'11:50','12:10','餐后散步、音乐欣赏   Walk after Lunch and Music Appreciation','','',''),('32491137344a4c18b35ffe48f3c36006','b06ababb8ada44958f6baf8fa20c41d4',0,'10:25','10:30','喝水 休息  Drink Water, Break Time','','',''),('328e2ef8fdcd438faea92594b15e4358','bcdac4d1c5d845a48b53369b8436b131',4,'10:30','11:00','英文剧','Drama','Eric/石亚静','王科妮/令狐慧谊'),('32d86bcd7f3c46a4a61e3a1abb966d33','33e6bdae311d41a6ac77029ffb3c4c7d',4,'10:30','11:00','户外课堂','OutdoorActivities','杨国颖','梁丽'),('32fd1d100e46407496713eb1d52eebc4','bcdac4d1c5d845a48b53369b8436b131',3,'8:30','9:00','主题英语','ThemeEnglish','Eric/石亚静','令狐慧谊'),('33204ed274f74804a3b663dae6061aad','20ba9953cb534c88a6fdbe92ff93a107',2,'14:45','15:15','主题英语','ThemeEnglish','Joe/马丽','王田田'),('3404fa36f04a488d9751b5cb19acc9dc','b06ababb8ada44958f6baf8fa20c41d4',0,'14:30','14:45','加餐  Snacks','','',''),('3415bf9c57ec4e76a2934074cae9eee1','16333413b51c43a3bd10996360419425',1,'10:30','11:00','艺术手工(英)','Arts&Crafts','付晓雪','于菲'),('342f83388f3741479e37522e43b653f7','33e6bdae311d41a6ac77029ffb3c4c7d',0,'11:50','12:10','餐后散步、音乐欣赏   Walk after Lunch and Music Appreciation','','',''),('349aa37f2fb3402e88fff664fd7c18ac','20ba9953cb534c88a6fdbe92ff93a107',0,'12:10','13:40','午休   Nap Time','','',''),('34cb31d4cde84acda0643b09a2cfdfc4','16333413b51c43a3bd10996360419425',5,'9:10','9:40','主题英语','ThemeEnglish','付晓雪','曹艳/于菲'),('35038d5e93d44756a854ce19beb81f6c','60b0284aaf9d458ebcc04f47213a769b',0,'10:25','10:30','喝水 休息  Drink Water, Break Time','','',''),('35040c1fa38546c2ac3518e4123fea83','047372893e1144cf9a0a15669278ab53',0,'17:00','17:00','离校','','',''),('350cc98db9614d2fbf3d93cc7d491bae','16333413b51c43a3bd10996360419425',4,'14:00','14:30','数学与逻辑','Math&Logic','苏焕','曹艳/于菲'),('350d546336454c86999245a53e10ef2a','4bac307c43c3499794b367614d7fac5f',1,'15:00','15:30','主题英语','ThemeEnglish','Kim/张欢','陈亚楠/门娜/张欢'),('355b5993e6bd480da9848a3cb622aacc','16333413b51c43a3bd10996360419425',5,'9:55','10:25','主题英语','ThemeEnglish','付晓雪','曹艳/于菲'),('360b3ea517324067b27bd1f9248b2870','6440ca0e3fbf48218726c7b9bdf491c7',0,'14:30','14:45','加餐  Snacks','','',''),('3691f4c3e2d9477ab365f7b52fd21a93','b06ababb8ada44958f6baf8fa20c41d4',4,'10:30','11:00','自由阅读','FreeReading','赵翊彤','尤增强'),('36bae5e87ede4cfcb011c5105dd13e0c','4bac307c43c3499794b367614d7fac5f',3,'8:30','9:00','自由玩耍','FreePlay','陈亚楠','门娜/张欢'),('36e44775a94b487db229d033ae13fddb','bcdac4d1c5d845a48b53369b8436b131',3,'9:55','10:25','外教科学实验','ScienceActivities','Eric/石亚静','王科妮/令狐慧谊'),('378e50a45fde42a893ad8a0d5cacca9e','7c9f1583f491433182867ff983c73d33',5,'10:30','11:00','主题英语','ThemeEnglish','Kim/唐任姣','魏苗'),('379949ea230c44c883fcbc16f2899296','8e212b16287d476699213b4e3bce4086',1,'15:35','15:55','主题英语','ThemeEnglish','马梦瑶','郭婷婷/原惠慧'),('37b0e857efef4c18bda6da0a7f137d5f','4bac307c43c3499794b367614d7fac5f',4,'15:35','15:55','主题英语','ThemeEnglish','Kim/张欢','陈亚楠/门娜/张欢'),('37c0458b94c14566872b654a0345f44b','33e6bdae311d41a6ac77029ffb3c4c7d',2,'9:10','9:40','主题英语','ThemeEnglish','杨国颖','梁丽/江慧涛'),('3808547d33204b46b7303c3607231315','656ba48667bd48c0b9fb812ab14fbfd4',2,'10:30','11:00','户外活动','OutdoorActivities','赵雨晴','张亚'),('38226195e3b14aa189f759326c0b17b3','7c9f1583f491433182867ff983c73d33',0,'12:10','13:40','午休   Nap Time','','',''),('3828e92d191f42eaa6389fe81290f309','656ba48667bd48c0b9fb812ab14fbfd4',0,'8:00','8:30','早餐  Breakfast','','',''),('383dd35f43d74ba483e11f218aa68121','8e212b16287d476699213b4e3bce4086',2,'9:10','9:40','感统训练与兴趣引导','SensoryIntegration','郭婷婷','马梦瑶'),('389c0946d16248369b38887840d21ee1','20ba9953cb534c88a6fdbe92ff93a107',2,'9:10','9:40','儿童足球','Football','王强','王田田'),('38afb0bb3fd54121b0c2e4299edcbd37','4b5011d1c18a4549af0b89054cfbf197',4,'14:30','15:00','主题英语','ThemeEnglish','车柳英','潘菲'),('38f02ad367c248098311a3a03558822e','e27e39be3b8e4b74a391a783f922b597',4,'8:30','9:00','主题英语','ThemeEnglish','Dani/孟广鑫','李玲玉/慕海兰'),('391030ad1d644cf7891540f687522f3a','656ba48667bd48c0b9fb812ab14fbfd4',4,'9:55','10:25','体能训练','Physicaltraining','王强','赵雨晴/张亚'),('394836ea7a5944afa86b8ab0c84cf232','4b5011d1c18a4549af0b89054cfbf197',2,'14:30','15:00','主题英语','ThemeEnglish','车柳英','潘菲'),('39730e2943404612a4ada2d4b702cde5','7c9f1583f491433182867ff983c73d33',4,'9:55','10:25','外教户外课堂','OutdoorActivities','Kim/唐任姣','魏苗'),('397e8204376746daa0d717def8254ab6','047372893e1144cf9a0a15669278ab53',2,'15:20','15:50','讲故事','StoryTelling','唐任姣','王世鹏'),('39916b46ea284724bb7ef2284f510f15','047372893e1144cf9a0a15669278ab53',0,'9:40','9:55','视保操、加餐   Eyes Exercises and Snacks','','',''),('399ff12cf3314e2faf8f2253a8cfe604','e27e39be3b8e4b74a391a783f922b597',5,'9:10','9:40','外教科学实验','ScienceActivities','Dani/孟广鑫','慕海兰'),('3a320dcb1f94473891f6a6763858ff1a','7c9f1583f491433182867ff983c73d33',0,'14:30','14:45','加餐  Snacks','','',''),('3a8114ad607d4109873dd263f54034a7','7c9f1583f491433182867ff983c73d33',1,'15:50','16:20','美术','ArtandDrawing','门娜','周琳'),('3b0fde25d489452680538c9d56581b32','33e6bdae311d41a6ac77029ffb3c4c7d',1,'15:15','15:45','音乐启蒙与乐感培养','Music','赵翊彤','梁丽/江慧涛'),('3c736509d38c4376ae4925c53e749c76','7c9f1583f491433182867ff983c73d33',5,'14:00','14:30','播音主持与表演','PublicSpeakingSkills','魏苗','周琳'),('3cdad74d64cf49bc8e411d36406ec973','e27e39be3b8e4b74a391a783f922b597',4,'10:30','11:00','外教户外课堂','OutdoorActivities','Dani/孟广鑫','李玲玉/慕海兰'),('3ce6dcaa6c0b40abbf4752f75e9201d0','4bac307c43c3499794b367614d7fac5f',0,'11:15','11:45','午餐   Lunch','','',''),('3dbae0e540ee4115ad144fec7d10ebae','6440ca0e3fbf48218726c7b9bdf491c7',2,'15:50','16:20','主题英语','ThemeEnglish','石亚静','田友美'),('3ddab7f115024df6a06828f716db6174','e27e39be3b8e4b74a391a783f922b597',5,'14:45','15:15','社会情绪主题','SEL','李玲玉',''),('3de67720f57445d886acda368ce7975f','4bac307c43c3499794b367614d7fac5f',0,'12:10','14:30','午休   Nap Time','','',''),('3fa27047683e4f1a96c5ebc5f07d764a','bcdac4d1c5d845a48b53369b8436b131',3,'15:50','16:20','舞蹈','Dancing','赵雨晴','王科妮'),('3fcbae55e0eb4a00afbb0256d2abaea4','bcdac4d1c5d845a48b53369b8436b131',2,'9:10','9:40','外教手工','Arts&Crafts','Eric/石亚静','王科妮/令狐慧谊'),('401fa05f824743a2ae261ef432c900fc','4b5011d1c18a4549af0b89054cfbf197',3,'14:30','15:00','主题英语','ThemeEnglish','车柳英','潘菲'),('40405ca42e474c32a0c8213c7288ace1','7c9f1583f491433182867ff983c73d33',5,'14:45','15:15','视唱练耳与音乐基础','SolfeggioandMusicfoundation','梁丽','魏苗/周琳'),('4043ff300de341b5aade7ef9174e3719','a21f951d755842d2b02932379080f892',0,'10:25','10:30','喝水 休息  Drink Water, Break Time','','',''),('4069f36af5b84bbea99773bf86a7b2fc','0a543c589d72410e92929d9f224b18cc',1,'8:30','9:00','主题英语','ThemeEnglish','马丽','杨新'),('40e4832468644e42a27efe4378c60f4e','656ba48667bd48c0b9fb812ab14fbfd4',2,'15:50','16:20','主题英语','ThemeEnglish','Dani/孟广鑫','赵雨晴/张亚'),('41134d8c22f84ec5a3a934ef56c75640','7c9f1583f491433182867ff983c73d33',2,'8:30','9:00','外教讲故事','StoryTelling','Kim/唐任姣','魏苗/周琳'),('41f96285811442c99a1049394566e40d','4b5011d1c18a4549af0b89054cfbf197',5,'15:50','16:20','讲故事','StoryTelling','车柳英','潘菲'),('4308aaae0a0a41b381dd40f32100b7f2','60b0284aaf9d458ebcc04f47213a769b',5,'9:10','9:40','外教户外课堂','OutdoorActivities','Joe/张欢','郑丽/杨伟伟'),('435467fddf3341e799f5c4d100e2d609','656ba48667bd48c0b9fb812ab14fbfd4',1,'14:30','15:00','英文剧','Drama','Dani/孟广鑫','赵雨晴/张亚'),('43c00339b8f14f95a436ebbe29bb5aab','e27e39be3b8e4b74a391a783f922b597',0,'17:00','17:00','离校','','',''),('43d1abfa0af44aefb5a312d79f8a7375','b8a2048b3b644d5f86b644f808f13a16',1,'15:50','16:20','主题英语','ThemeEnglish','Eric/付晓雪','辛佳怡'),('43e924e1bb6e4c999fe016c4241034e1','bcdac4d1c5d845a48b53369b8436b131',3,'9:10','9:40','主题英语','ThemeEnglish','Eric/石亚静','王科妮/令狐慧谊'),('43fe76a64ca24d2f8a5910deb7816412','bcdac4d1c5d845a48b53369b8436b131',5,'15:20','15:50','户外活动','OutdoorActivities','王科妮','令狐慧谊'),('447981a8df3b4aab940b64aafc5e58ae','6440ca0e3fbf48218726c7b9bdf491c7',0,'11:50','12:10','餐后散步、音乐欣赏   Walk after Lunch and Music Appreciation','','',''),('44f714c76d294687aada441c8de324fa','60b0284aaf9d458ebcc04f47213a769b',4,'15:50','16:20','体能训练','Physicaltraining','辛佳怡','郑丽/杨伟伟'),('4535c900d05b454d954e6418e963bca7','6440ca0e3fbf48218726c7b9bdf491c7',2,'8:30','9:00','国学','TraditionalCulture','吴本美',''),('453dfed5d8ff495792f8dc19f68cc9c1','0a543c589d72410e92929d9f224b18cc',0,'15:15','15:20','喝水 休息  Drink water, Break Time','','',''),('454c61656781452cbdf39343d5694004','a21f951d755842d2b02932379080f892',3,'15:15','15:45','音乐启蒙与乐感培养','Music','郭婷婷','刘蕊/吴本美'),('4551be2555a74c88a7dd2573b3cfe2c2','4bac307c43c3499794b367614d7fac5f',2,'15:35','15:55','外教手工','Arts&Crafts','Kim/张欢','陈亚楠/门娜/张欢'),('455e4a2408ae4fe483473e8739924d54','6440ca0e3fbf48218726c7b9bdf491c7',2,'9:55','10:25','自由玩耍','FreePlay','田友美',''),('45867c8ca5004dae8daf45fcd5032405','8e212b16287d476699213b4e3bce4086',2,'16:00','16:20','主题英语','ThemeEnglish','马梦瑶','郭婷婷/原惠慧'),('45f3a9c3fe894891a1c9ce96d095cfc4','e27e39be3b8e4b74a391a783f922b597',1,'10:30','11:00','主题英语','ThemeEnglish','Dani/孟广鑫','李玲玉/慕海兰'),('4636513c91a44035a3a4557a53df6dc1','16333413b51c43a3bd10996360419425',1,'8:30','9:00','主题英语','ThemeEnglish','付晓雪','曹艳/于菲'),('47807cabd16d481ba9448f9f4fe07dff','7c9f1583f491433182867ff983c73d33',3,'15:20','15:50','IVY社团活动','Clubactivities','',''),('478a2a648de64734881eaa615952d20a','4bac307c43c3499794b367614d7fac5f',5,'9:55','10:25','班级主题活动','Themeactivities','陈亚楠','门娜/张欢'),('47d72d11aac44608b5cb6f7a5b195169','16333413b51c43a3bd10996360419425',2,'8:30','9:00','主题英语','ThemeEnglish','付晓雪','曹艳/于菲'),('47fa8b73c4144f7ea7bd3004bd94d542','047372893e1144cf9a0a15669278ab53',3,'15:20','15:50','IVY社团活动','Clubactivities','',''),('48ca2fc1b2544308995d412c9030e412','7c9f1583f491433182867ff983c73d33',3,'10:30','11:00','主题英语','ThemeEnglish','Kim/唐任姣','魏苗/周琳'),('48de62c115684154bd29ebe421960cbc','7c9f1583f491433182867ff983c73d33',2,'10:30','11:00','主题英语','ThemeEnglish','Kim/唐任姣','魏苗/周琳'),('48e016ff88c140c9b7abcef069f58fba','33e6bdae311d41a6ac77029ffb3c4c7d',4,'8:30','9:00','艺术手工(英)','Arts&Crafts','杨国颖','梁丽/江慧涛'),('496edc8d7c6444b4ae3f9a5131d2c0c3','60b0284aaf9d458ebcc04f47213a769b',0,'15:00','15:15','加餐  Snacks','','',''),('49b4013bf1fa4171b53e23b38efd3fc7','16333413b51c43a3bd10996360419425',0,'10:25','10:30','喝水 休息  Drink Water, Break Time','','',''),('4a32585bae3f40be8ed0a814aec3db9f','33e6bdae311d41a6ac77029ffb3c4c7d',5,'9:55','10:25','外教科学实验','ScienceActivities','杨国颖/Tarry','梁丽/江慧涛'),('4affa38922fc4e1bab3b983fa1f25717','b8a2048b3b644d5f86b644f808f13a16',0,'9:00','9:10','常青藤武术操   IVY Kongfu Exercises','','',''),('4bcf3d4dc4864dce91ed470a680a9f54','33e6bdae311d41a6ac77029ffb3c4c7d',0,'11:15','11:45','午餐   Lunch','','',''),('4c54a878dc9d4c4bb725f20c5a1b22d8','a21f951d755842d2b02932379080f892',2,'9:10','9:40','外教讲故事','StoryTelling','Sean/车柳英','刘蕊/吴本美'),('4c61990a423a4ff0ba05efccac08e94f','4b5011d1c18a4549af0b89054cfbf197',0,'9:00','9:10','常青藤武术操   IVY Kongfu Exercises','','',''),('4c66a7db18fb4031894561b38470de1d','16333413b51c43a3bd10996360419425',4,'9:55','10:25','英文剧','Drama','付晓雪','曹艳/于菲'),('4c9a47d24b3b4df5949abaff515f9299','7c9f1583f491433182867ff983c73d33',0,'13:40','14:00','起床   Get up','','',''),('4ce7eefad2d443c58d078a8bbec09fc2','e27e39be3b8e4b74a391a783f922b597',2,'9:10','9:40','主题英语','ThemeEnglish','Dani/孟广鑫','李玲玉/慕海兰'),('4d0aa749383340d6a6a333144f35def6','e27e39be3b8e4b74a391a783f922b597',2,'8:30','9:00','外教手工','Arts&Crafts','Dani/孟广鑫','慕海兰'),('4d4f5e9f5b814c2d8acd12297bd62d47','6440ca0e3fbf48218726c7b9bdf491c7',5,'10:30','11:00','体能训练','Physicaltraining','王强','田友美'),('4db7d1edec4b491185430a46d7968d48','8e212b16287d476699213b4e3bce4086',4,'15:35','15:55','主题英语','ThemeEnglish','马梦瑶','郭婷婷/原惠慧'),('4ddf1fc15a2f434dac6152994bbaf32d','60b0284aaf9d458ebcc04f47213a769b',0,'8:00','8:30','早餐  Breakfast','','',''),('4f017529e6a5482aaad2d88aa3b61c97','4bac307c43c3499794b367614d7fac5f',2,'16:00','16:20','主题英语','ThemeEnglish','Kim/张欢','陈亚楠/门娜/张欢'),('5128e40adbed433f941ab747f6b3df82','b8a2048b3b644d5f86b644f808f13a16',4,'9:10','9:40','','','','yyyy'),('51efec04638d491ebc6714af06093a17','4b5011d1c18a4549af0b89054cfbf197',3,'9:55','10:25','美术','ArtandDrawing','康雪荣','潘菲'),('5263f8963fa7400088d5df065b4c93eb','8e212b16287d476699213b4e3bce4086',1,'10:30','11:00','户外活动','OutdoorActivities','马梦瑶','郭婷婷/原惠慧'),('534b4bd5c28b497189f9966278730475','16333413b51c43a3bd10996360419425',2,'9:55','10:25','主题英语','ThemeEnglish','付晓雪','曹艳/于菲'),('53623f5d98f642d28a201865126c167f','8e212b16287d476699213b4e3bce4086',0,'15:30','15:35','加餐  Snacks','','',''),('53c30d85504d480b831f4ad5964a8e04','33e6bdae311d41a6ac77029ffb3c4c7d',5,'15:50','16:20','户外活动','OutdoorActivities','梁丽','江慧涛'),('53da201232c04c8cb50a28bafb962765','60b0284aaf9d458ebcc04f47213a769b',4,'14:30','15:00','舞蹈','Dancing','尤增强','郑丽/杨伟伟'),('54c4844742de47a19d7b46c1f10d6f2e','60b0284aaf9d458ebcc04f47213a769b',1,'15:50','16:20','音乐启蒙与乐感培养','Music','梁丽','郑丽/杨伟伟'),('5508d0531b444a5cb643d68b240f8766','047372893e1144cf9a0a15669278ab53',1,'15:50','16:20','主题英语','ThemeEnglish','唐任姣','刘亚坤/王世鹏'),('553260375c9c426e856ba2425fddd62b','4b5011d1c18a4549af0b89054cfbf197',5,'8:30','9:00','艺术手工','ArtsandCrafts','赫秀佩','潘菲'),('55d1754d5cce4590a0a498cfad5d4e0e','047372893e1144cf9a0a15669278ab53',1,'14:45','15:15','主题英语','ThemeEnglish','唐任姣','刘亚坤/王世鹏'),('55df4ae64df648d7aa57d2eb199ba605','16333413b51c43a3bd10996360419425',5,'15:50','16:20','自由玩耍','FreePlay','曹艳','于菲'),('562e7c60833d4c97b4f70e7417e2085a','4bac307c43c3499794b367614d7fac5f',0,'9:00','9:10','常青藤武术操   IVY Kongfu Exercises','','',''),('56faa2ad19ee48d2a86bc109f114e2f8','7c9f1583f491433182867ff983c73d33',3,'14:00','14:30','沙包游戏','BeanbagGame','令狐慧谊','魏苗/周琳'),('5749b61e1f6748cfad0f86b73cb0ed29','6440ca0e3fbf48218726c7b9bdf491c7',4,'15:20','15:50','主题英语','ThemeEnglish','石亚静','田友美'),('576cd581e6b74000bab8be6d2ef2bdd3','16333413b51c43a3bd10996360419425',0,'12:10','13:40','午休   Nap Time','','',''),('57d38da3a3204512aafb6978fee55462','656ba48667bd48c0b9fb812ab14fbfd4',3,'14:30','15:00','主题英语','ThemeEnglish','Dani/孟广鑫','赵雨晴'),('57dbfa0bdec84cacb5a93255ae12972e','8e212b16287d476699213b4e3bce4086',1,'16:00','16:20','户外课堂','OutdoorActivities','马梦瑶','郭婷婷/原惠慧'),('57de5cd265b44489ad45fc1c4c502579','4bac307c43c3499794b367614d7fac5f',1,'10:30','11:00','自由玩耍','FreePlay','陈亚楠','门娜/张欢'),('57f2078588464be993ff3bb75b53de1d','7c9f1583f491433182867ff983c73d33',0,'9:40','9:55','视保操、加餐   Eyes Exercises and Snacks','','',''),('580a87e8519647b8ba266b89eac6aa3e','0a543c589d72410e92929d9f224b18cc',3,'9:10','9:40','户外课堂','OutdoorActivities','马丽','唐艾艺/杨新'),('588711636bba401f9e909f08e172360d','e27e39be3b8e4b74a391a783f922b597',0,'11:50','12:10','餐后散步、音乐欣赏   Walk after Lunch and Music Appreciation','','',''),('5974029174e249c39b8969b225872dcf','0a543c589d72410e92929d9f224b18cc',1,'15:20','15:50','数学与逻辑','Math&Logic','王科妮','唐艾艺/杨新'),('5979c8bcbef14cf4a08b407a17659f21','bcdac4d1c5d845a48b53369b8436b131',4,'15:50','16:20','美术','ArtandDrawing','张文慧','王科妮/令狐慧谊'),('598bb8eb13b84e0abba7ac3350b80111','b8a2048b3b644d5f86b644f808f13a16',5,'14:45','15:15','主题英语','ThemeEnglish','Eric/付晓雪','辛佳怡'),('59c47ba38f9140d6b8707c7aa0178bec','20ba9953cb534c88a6fdbe92ff93a107',5,'9:55','10:25','美术','ArtandDrawing','朱夏清','王田田'),('59e58c8bd71a4ac796410a4372ba3e99','b06ababb8ada44958f6baf8fa20c41d4',5,'8:30','9:00','视唱练耳与音乐基础','SolfeggioandMusicfoundation','李钊','赵翊彤/尤增强'),('5a21914e5a0d4744bdea1dd1b5963e66','a21f951d755842d2b02932379080f892',5,'9:55','10:25','主题英语','ThemeEnglish','Sean/车柳英','刘蕊/吴本美'),('5a2b00d4449f43d081271b3c8d64131a','8e212b16287d476699213b4e3bce4086',0,'9:40','9:55','视保操、加餐   Eyes Exercises and Snacks','','',''),('5a930d6bf28546cc995e13562904f551','bcdac4d1c5d845a48b53369b8436b131',0,'10:25','10:30','喝水 休息  Drink Water, Break Time','','',''),('5b23560c426a48eb8afc9f959aa772f0','6440ca0e3fbf48218726c7b9bdf491c7',1,'15:50','16:20','艺术手工(英)','Arts&Crafts','石亚静','田友美'),('5b43fc728dc648c2910a9cbf2e374ced','b8a2048b3b644d5f86b644f808f13a16',0,'14:30','14:45','加餐  Snacks','','',''),('5befe323f1cf41e6a592c783b5908cb6','047372893e1144cf9a0a15669278ab53',0,'12:10','13:40','午休   Nap Time','','',''),('5bf2e2d840bf4a56bc86f67e53b7eea1','b06ababb8ada44958f6baf8fa20c41d4',0,'13:40','14:00','起床   Get up','','',''),('5c836a019b21422f8932b58053b5f533','20ba9953cb534c88a6fdbe92ff93a107',5,'15:20','15:50','外教户外课堂','OutdoorActivities','Joe/马丽','王田田'),('5d0f6a87ace94b3d89487779abe703db','20ba9953cb534c88a6fdbe92ff93a107',3,'14:00','14:30','主题英语','ThemeEnglish','Joe/马丽','王田田'),('5e20ce848af04091ad03c4b053580922','b8a2048b3b644d5f86b644f808f13a16',1,'15:20','15:50','主题英语','ThemeEnglish','Eric/付晓雪','辛佳怡'),('5ed0535bbb3844c7987837c0021cd746','a21f951d755842d2b02932379080f892',3,'8:30','9:00','主题英语','ThemeEnglish','Sean/车柳英','刘蕊/吴本美'),('5f3fdbf6a6a84367b9b81611302b0572','16333413b51c43a3bd10996360419425',2,'14:45','15:15','户外活动','OutdoorActivities','曹艳','于菲'),('5fde4a5ece964be2b32ed5bb68f6ec0f','b8a2048b3b644d5f86b644f808f13a16',4,'15:20','15:50','外教生活体验','Cooking','Eric/付晓雪','辛佳怡'),('6023d4bbfae043eca86bc66fda2c1e23','4bac307c43c3499794b367614d7fac5f',1,'16:00','16:20','外教律动','Music&Dance','Kim/张欢','陈亚楠/门娜/张欢'),('607eba237f4d4abcb1533d3388031ff5','bcdac4d1c5d845a48b53369b8436b131',5,'14:45','15:15','艺术手工','ArtsandCrafts','董绮轩','王科妮/令狐慧谊'),('610719a889244d29a6c8de26e9acaa66','656ba48667bd48c0b9fb812ab14fbfd4',4,'15:50','16:20','主题英语','ThemeEnglish','Dani/孟广鑫','赵雨晴/张亚'),('613657bcde284075aa45f22db511b095','20ba9953cb534c88a6fdbe92ff93a107',2,'10:30','11:00','艺术手工','ArtsandCrafts','宋秀萍','王田田'),('6138ee864655443d9ab85d0a8ebb2e00','b06ababb8ada44958f6baf8fa20c41d4',2,'15:50','16:20','主题英语','ThemeEnglish','Sean/慕海兰','赵翊彤/尤增强'),('618fddf13460465a8c5702b116fa7d31','656ba48667bd48c0b9fb812ab14fbfd4',2,'9:55','10:25','舞蹈','Dancing','尤增强','赵雨晴/张亚'),('61a25a54fa5c492ba490a7e13702f5e7','20ba9953cb534c88a6fdbe92ff93a107',5,'10:30','11:00','美术','ArtandDrawing','朱夏清','王田田'),('61cc4ae6ee694652a570c9a8ced690ad','33e6bdae311d41a6ac77029ffb3c4c7d',4,'15:50','16:20','体能训练','Physicaltraining','辛佳怡','梁丽/江慧涛'),('61d03ed1be2e45cb83b55e23e4b8ef26','7c9f1583f491433182867ff983c73d33',0,'8:00','8:30','早餐  Breakfast','','',''),('61da17961b934e2285b356429fa68c2c','b06ababb8ada44958f6baf8fa20c41d4',1,'15:50','16:20','外教户外课堂','OutdoorActivities','Sean/慕海兰','赵翊彤/尤增强'),('623d9c0f34844c1aa41a9b1b5ee6582c','7c9f1583f491433182867ff983c73d33',1,'14:00','14:30','基础书写','BasicHandwriting','刘欢欢','魏苗/周琳'),('62ab03b13cf3400b90925351d71466f2','4bac307c43c3499794b367614d7fac5f',0,'11:50','12:10','餐后散步、音乐欣赏   Walk after Lunch and Music Appreciation','','',''),('62ea47b9ac1b49198473991318267208','0a543c589d72410e92929d9f224b18cc',5,'10:30','11:00','外教科学实验','ScienceActivities','马丽/Tarry','唐艾艺/杨新'),('6305dcda860342eeb3c3bcebdec1db74','16333413b51c43a3bd10996360419425',1,'15:50','16:20','户外活动','OutdoorActivities','曹艳','于菲'),('634bec8f01b04e52b558c547de42c105','16333413b51c43a3bd10996360419425',1,'14:45','15:15','艺术手工','ArtsandCrafts','王婷婷','曹艳/于菲'),('63739c1a8b8d40de9db85ca6757fcfd8','4bac307c43c3499794b367614d7fac5f',4,'9:55','10:25','感统训练与兴趣引导','SensoryIntegration','郭婷婷','陈亚楠/门娜/张欢'),('63d10d476ba24f7fb137cf270089f92d','bcdac4d1c5d845a48b53369b8436b131',4,'14:45','15:15','数学与逻辑','Math&Logic','唐艾艺','王科妮/令狐慧谊'),('63fa4dae24cc4b829aee3b30d8074e05','047372893e1144cf9a0a15669278ab53',3,'8:30','9:00','视唱练耳与音乐基础','SolfeggioandMusicfoundation','李钊','刘亚坤/王世鹏'),('6455e7ade714416882471dbf6d2f15a8','b8a2048b3b644d5f86b644f808f13a16',5,'8:30','9:00','国学','TraditionalCulture','吴本美','辛佳怡'),('6463730ec6414408b3a48310de6505a7','656ba48667bd48c0b9fb812ab14fbfd4',2,'8:30','9:00','人体生理与健康习惯','Healthcare','张亚','赵雨晴'),('64d46c6bbb1d475eb05d26d93952a6b3','33e6bdae311d41a6ac77029ffb3c4c7d',4,'15:15','15:45','舞蹈','Dancing','尤增强','梁丽/江慧涛'),('6633bac8023e4283966c2be5e5e4a8c2','6440ca0e3fbf48218726c7b9bdf491c7',0,'10:25','10:30','喝水 休息  Drink Water, Break Time','','',''),('66c76d7d60be49bca246b7e14449a883','16333413b51c43a3bd10996360419425',1,'9:55','10:25','户外课堂','OutdoorActivities','付晓雪','曹艳/于菲'),('67ab22b9c82c474080e31957a80c183a','b06ababb8ada44958f6baf8fa20c41d4',4,'9:55','10:25','儿童高尔夫','Golf','刘健康','赵翊彤/尤增强'),('68e2f81588324d53a23c353bf2678bab','4b5011d1c18a4549af0b89054cfbf197',2,'8:30','9:00','数学与逻辑','Math&Logic','刘蕊','潘菲'),('6975d97faeeb4dcb8d3f23466a71da32','bcdac4d1c5d845a48b53369b8436b131',2,'10:30','11:00','主题英语','ThemeEnglish','Eric/石亚静','王科妮/令狐慧谊'),('698e113c9e424310b004a86280e3a216','33e6bdae311d41a6ac77029ffb3c4c7d',2,'15:50','16:20','户外活动','OutdoorActivities','梁丽','江慧涛'),('698e64e09de84e25ba11875c06000c6a','a21f951d755842d2b02932379080f892',1,'15:50','16:20','户外活动','OutdoorActivities','刘蕊','吴本美'),('69a3958add8a4022ae24e9106c7bbcbc','60b0284aaf9d458ebcc04f47213a769b',1,'8:30','9:00','主题英语','ThemeEnglish','Joe/张欢','郑丽/杨伟伟'),('69e61c0a0ce94c1a877dc9b8acfc5e91','a21f951d755842d2b02932379080f892',0,'15:45','15:50','喝水 休息  Drink water, Break Time','','',''),('6a5a431fe8d94ede91032be07af8f751','bcdac4d1c5d845a48b53369b8436b131',4,'15:20','15:50','美术','ArtandDrawing','张文慧','王科妮'),('6b0d217ae3e14401995853d2cdf1f7d3','33e6bdae311d41a6ac77029ffb3c4c7d',1,'14:30','15:00','体育游戏','OutdoorGames','辛佳怡','梁丽/江慧涛'),('6b3df9e745fc4e4cb53e0ba7e4fefe49','33e6bdae311d41a6ac77029ffb3c4c7d',3,'8:30','9:00','主题英语','ThemeEnglish','杨国颖','梁丽/江慧涛'),('6b55069e364e4be48ac47de2ab3450da','656ba48667bd48c0b9fb812ab14fbfd4',4,'14:30','15:00','外教讲故事','StoryTelling','Dani/孟广鑫','赵雨晴/张亚'),('6b74e1b4bcb7422095233e4c44ecca02','8e212b16287d476699213b4e3bce4086',3,'8:30','9:00','自由玩耍','FreePlay','马梦瑶','郭婷婷/原惠慧'),('6b9c50ef6ef74763947dd8c2bbc9612f','047372893e1144cf9a0a15669278ab53',5,'15:20','15:50','主题英语','ThemeEnglish','唐任姣','刘亚坤'),('6bc8b0bbc9f541a3b78c4607e82bc53e','6440ca0e3fbf48218726c7b9bdf491c7',5,'15:20','15:50','主题英语','ThemeEnglish','石亚静','田友美'),('6c01a581320b4c099df4eba0e1b5908b','bcdac4d1c5d845a48b53369b8436b131',2,'8:30','9:00','主题英语','ThemeEnglish','Eric/石亚静','王科妮/令狐慧谊'),('6c2a714ac6f04cee85ea6e7c68cf01a8','e27e39be3b8e4b74a391a783f922b597',1,'15:50','16:20','自由阅读','FreeReading','李玲玉',''),('6c3b7bd02bd742338fb5cbb0eb8e7f9d','a21f951d755842d2b02932379080f892',4,'15:50','16:20','艺术手工','ArtsandCrafts','赫秀佩','刘蕊/吴本美'),('6c3dc9056a7349f18ab3b4328b3175d1','bcdac4d1c5d845a48b53369b8436b131',5,'9:10','9:40','主题英语','ThemeEnglish','Eric/石亚静','王科妮/令狐慧谊'),('6d5948e9eac34cdc8ada607b00a2c6a3','b8a2048b3b644d5f86b644f808f13a16',1,'8:30','9:00','舞蹈','Dancing','刘亚坤','辛佳怡'),('6d7f5ea19458464893a8af58c1cffade','656ba48667bd48c0b9fb812ab14fbfd4',5,'14:30','15:00','外教户外课堂','OutdoorActivities','Dani/孟广鑫','赵雨晴'),('6dfb674af2c245d69533fab2ca5d7a8d','a21f951d755842d2b02932379080f892',0,'11:15','11:45','午餐   Lunch','','',''),('6dfe5e40ecd542f4932e4a46db0d0b32','60b0284aaf9d458ebcc04f47213a769b',2,'15:15','15:45','艺术手工','ArtsandCrafts','宋秀萍','郑丽/杨伟伟'),('6eab3eaf2d0e4d9388d6463cb368256e','bcdac4d1c5d845a48b53369b8436b131',0,'13:40','14:00','起床   Get up','','',''),('6f776c0c71d44ed49c3f3b1067037cd8','047372893e1144cf9a0a15669278ab53',0,'10:25','10:30','喝水 休息  Drink Water, Break Time','','',''),('6fa6a386833d42358c0f849f4b53829d','b06ababb8ada44958f6baf8fa20c41d4',3,'15:20','15:50','IVY社团活动','Clubactivities','',''),('6fc810419e26477c821d033ceca318ea','047372893e1144cf9a0a15669278ab53',1,'10:30','11:00','户外活动','OutdoorActivities','刘亚坤','王世鹏'),('6fd6ba15562c48129ad21a7471d26e70','a21f951d755842d2b02932379080f892',5,'15:50','16:20','户外活动','OutdoorActivities','刘蕊','吴本美'),('6fe564481a884eb7a804392b1eabce83','656ba48667bd48c0b9fb812ab14fbfd4',4,'15:15','15:45','外教户外课堂','OutdoorActivities','Dani/孟广鑫','赵雨晴/张亚'),('7044664b1fe845518a724fcce45a8de7','8e212b16287d476699213b4e3bce4086',1,'15:00','15:30','艺术手工(英)','Arts&Crafts','马梦瑶/Tarry','郭婷婷/原惠慧'),('7202c9e9e7b14b4d901203ccf8561867','b06ababb8ada44958f6baf8fa20c41d4',5,'10:30','11:00','户外活动','OutdoorActivities','赵翊彤','尤增强'),('7281ecf27e5b491583c9771f0fa8fb1f','33e6bdae311d41a6ac77029ffb3c4c7d',1,'9:55','10:25','户外课堂','OutdoorActivities','杨国颖','梁丽/江慧涛'),('7284b362ba0a485f93336445adf8216a','b8a2048b3b644d5f86b644f808f13a16',1,'9:55','10:25','社会情绪主题','SEL','辛佳怡',''),('72de6e3a032e42a7a13227413e29d982','e27e39be3b8e4b74a391a783f922b597',0,'12:10','13:40','午休   Nap Time','','',''),('7316098b74f141e9959b1a8cb3dc424a','16333413b51c43a3bd10996360419425',0,'15:15','15:20','喝水 休息  Drink water, Break Time','','',''),('735035e1d53d407fa36e6df4a07d50bc','0a543c589d72410e92929d9f224b18cc',4,'10:30','11:00','外教生活体验','Cooking','马丽/Tarry','唐艾艺'),('73ed4b572c504990ab84bdbc3bf9ca31','b8a2048b3b644d5f86b644f808f13a16',1,'10:30','11:00','数学与逻辑','Math&Logic','唐艾艺','辛佳怡'),('740abedefab34e5595710ec7806d67f6','20ba9953cb534c88a6fdbe92ff93a107',1,'8:30','9:00','音乐欣赏与音乐基础','Music','常晓燕','王田田'),('74213a4f43e843a291e81c7ca14cc473','a21f951d755842d2b02932379080f892',1,'14:30','15:00','魔术','Magic','郑丽','吴本美'),('74244b2721634807bbcf91d3cdb4e304','7c9f1583f491433182867ff983c73d33',0,'15:15','15:20','喝水 休息  Drink water, Break Time','','',''),('74b70eadbbd946bf9a0de909718a6d6a','4b5011d1c18a4549af0b89054cfbf197',4,'10:30','11:00','语言技能','LanguageSkill','张英','潘菲'),('74b89a943e4742469ef157a5603fce8a','b8a2048b3b644d5f86b644f808f13a16',0,'10:25','10:30','喝水 休息  Drink Water, Break Time','','',''),('74c67d95d1ca4895b27049a6daa3def6','4b5011d1c18a4549af0b89054cfbf197',3,'9:10','9:40','体能训练','Physicaltraining','辛佳怡',''),('74d1b0921fce4860b6e05651f22f0cf7','33e6bdae311d41a6ac77029ffb3c4c7d',3,'10:30','11:00','主题英语','ThemeEnglish','杨国颖','梁丽/江慧涛'),('74ffee4fca18487bbf01cf7f448cb326','33e6bdae311d41a6ac77029ffb3c4c7d',3,'15:50','16:20','数学与逻辑','Math&Logic','刘蕊','梁丽/江慧涛'),('754ed24af118494baba2bcfec7c3475f','6440ca0e3fbf48218726c7b9bdf491c7',1,'14:45','15:15','主题英语','ThemeEnglish','石亚静','田友美'),('7552f416f66e4a86b592788ec10ddb69','33e6bdae311d41a6ac77029ffb3c4c7d',3,'14:30','15:00','户外活动','OutdoorActivities','梁丽','江慧涛'),('7562f7531d8a4b88b72e02cf4e66b221','20ba9953cb534c88a6fdbe92ff93a107',3,'15:50','16:20','外教讲故事','StoryTelling','Joe/马丽',''),('762b82a600fe40b0a3fe7611ac6d2fee','b06ababb8ada44958f6baf8fa20c41d4',4,'15:20','15:50','主题英语','ThemeEnglish','Sean/慕海兰','赵翊彤/尤增强'),('76ac01ea02794fa89ef6c64ca6f08842','b06ababb8ada44958f6baf8fa20c41d4',2,'10:30','11:00','户外活动','OutdoorActivities','赵翊彤','尤增强'),('76db8ffb84c347bcbba706476ab054f8','7c9f1583f491433182867ff983c73d33',5,'15:20','15:50','数学与逻辑','Math&Logic','王科妮','魏苗/周琳'),('7877ec21a1924a46ab2cd46f944b08b6','4bac307c43c3499794b367614d7fac5f',0,'16:35','17:00','晚餐 Dinner','','',''),('78878c7c0190471ba66f5535fdec549e','4bac307c43c3499794b367614d7fac5f',3,'10:30','11:00','语言技能','LanguageSkill','田友美','陈亚楠/门娜/张欢'),('791fb5773d2e46c9a3f84c4fa2b88b6c','20ba9953cb534c88a6fdbe92ff93a107',0,'10:25','10:30','喝水 休息  Drink Water, Break Time','','',''),('793c25e3be8b4d019819bbccaff0e307','4bac307c43c3499794b367614d7fac5f',5,'10:30','11:00','故事与表演','StoryTelling','周琳','陈亚楠/门娜/张欢'),('79432657a13841f0b10de222312cc4bd','a21f951d755842d2b02932379080f892',0,'9:40','9:55','视保操、加餐   Eyes Exercises and Snacks','','',''),('7a7a855197a6412ea15b3ff230d7d325','8e212b16287d476699213b4e3bce4086',5,'9:55','10:25','社会情绪主题','SEL','马梦瑶','郭婷婷/原惠慧'),('7a925abf47a94afabc75e473a514465b','4b5011d1c18a4549af0b89054cfbf197',0,'15:45','15:50','喝水 休息  Drink water, Break Time','','',''),('7ab529031b6149f695ad32cc7365fc96','33e6bdae311d41a6ac77029ffb3c4c7d',0,'9:00','9:10','常青藤武术操   IVY Kongfu Exercises','','',''),('7adac0db9d744e52a0204830538d5170','8e212b16287d476699213b4e3bce4086',3,'9:10','9:40','魔术','Magic','郑丽','马梦瑶/郭婷婷/原惠慧'),('7aeafd30931e493f83dc08f269849371','4bac307c43c3499794b367614d7fac5f',3,'16:00','16:20','主题英语','ThemeEnglish','Kim/张欢','陈亚楠/门娜/张欢'),('7b011b9cf86e4bddbea29dd8bce13126','60b0284aaf9d458ebcc04f47213a769b',5,'8:30','9:00','主题英语','ThemeEnglish','Joe/张欢','郑丽/杨伟伟'),('7b120d319fae4fa0ad12cdbde142e230','20ba9953cb534c88a6fdbe92ff93a107',4,'8:30','9:00','跆拳道','Taekwondo','外聘老师','王田田'),('7b5ab79930224ed0b09ab84c847c9515','0a543c589d72410e92929d9f224b18cc',5,'9:10','9:40','主题英语','ThemeEnglish','马丽','唐艾艺/杨新'),('7b83840c8a32426c81fa38e4de53725e','60b0284aaf9d458ebcc04f47213a769b',2,'9:10','9:40','外教手工','Arts&Crafts','Joe/张欢','杨伟伟'),('7bb73adaaee7469e9f7dec06cdc47e54','b8a2048b3b644d5f86b644f808f13a16',1,'14:45','15:15','外教讲故事','StoryTelling','Eric/付晓雪','辛佳怡'),('7bb905b195a34e58bb6fd97cef53cc2f','60b0284aaf9d458ebcc04f47213a769b',3,'8:30','9:00','主题英语','ThemeEnglish','Joe/张欢','郑丽/杨伟伟'),('7c46469d837e40d791c259af7f069dd5','e27e39be3b8e4b74a391a783f922b597',2,'9:55','10:25','主题英语','ThemeEnglish','Dani/孟广鑫','李玲玉/慕海兰'),('7c6cb5540e1a42cfb3de2c75b2e48893','16333413b51c43a3bd10996360419425',0,'17:00','17:00','离校','','',''),('7cbc50ef5c1342d3ae34634a46dd75df','16333413b51c43a3bd10996360419425',0,'8:00','8:30','早餐  Breakfast','','',''),('7cf65064b18c44a8b5cbeb0335904e00','b8a2048b3b644d5f86b644f808f13a16',3,'9:10','9:40','音乐欣赏与音乐基础','Music','潘菲',''),('7d0ec8e3832c43f497e7b802cb9bb45e','8e212b16287d476699213b4e3bce4086',0,'8:00','8:30','早餐  Breakfast','','',''),('7d2928ed55564ed494a8f47811d06d0b','16333413b51c43a3bd10996360419425',4,'8:30','9:00','主题英语','ThemeEnglish','付晓雪','曹艳/于菲'),('7d2b215060ee4976a0d910d9c5129cd6','0a543c589d72410e92929d9f224b18cc',5,'9:55','10:25','户外课堂','OutdoorActivities','马丽','唐艾艺/杨新'),('7d694f1e02dc4b288bb4e2b06c28ac87','bcdac4d1c5d845a48b53369b8436b131',3,'14:45','15:15','儿童足球','Football','王世鹏','王科妮/令狐慧谊'),('7d695c9195c642eea556b38fdd1c0476','b8a2048b3b644d5f86b644f808f13a16',0,'11:50','12:10','餐后散步、音乐欣赏   Walk after Lunch and Music Appreciation','','',''),('7dac155390d94610a1d380b3ae749e48','8e212b16287d476699213b4e3bce4086',0,'11:50','12:10','餐后散步、音乐欣赏   Walk after Lunch and Music Appreciation','','',''),('7dd9d6c240aa476083135acf0ed2bd3b','20ba9953cb534c88a6fdbe92ff93a107',1,'15:20','15:50','主题英语','ThemeEnglish','Joe/马丽','王田田'),('7de52083e72f48e39a3edea792e3c70c','0a543c589d72410e92929d9f224b18cc',5,'14:00','14:30','基础书写','BasicHandwriting','刘欢欢','唐艾艺/杨新'),('7e4d9365bb3b436b906ce6feadc7ce5e','7c9f1583f491433182867ff983c73d33',1,'15:20','15:50','社会情绪主题','SEL','周琳','魏苗'),('7e71080af0854f719d103f3bdd1dcd9a','60b0284aaf9d458ebcc04f47213a769b',4,'9:55','10:25','外教户外课堂','OutdoorActivities','Joe/张欢','郑丽'),('7e735f2f29244b5cbe9b8ceaa957a4fc','60b0284aaf9d458ebcc04f47213a769b',0,'11:50','12:10','餐后散步、音乐欣赏   Walk after Lunch and Music Appreciation','','',''),('7e7f7097c08a4dbaa1bb3d5ecfdff18c','b8a2048b3b644d5f86b644f808f13a16',2,'14:00','14:30','外教户外课堂','OutdoorActivities','Eric/付晓雪','辛佳怡'),('7ecd69763a904da682cb37445f9dd4fb','20ba9953cb534c88a6fdbe92ff93a107',0,'9:40','9:55','视保操、加餐   Eyes Exercises and Snacks','','',''),('7ed48a47d1234242a0d7ec4c18db9973','4b5011d1c18a4549af0b89054cfbf197',0,'15:00','15:15','加餐  Snacks','','',''),('7f01f1a9a25b4933868712d85e58198c','7c9f1583f491433182867ff983c73d33',2,'9:10','9:40','主题英语','ThemeEnglish','Kim/唐任姣','魏苗/周琳'),('7f1bcd3dcd774616a8356c905168a294','16333413b51c43a3bd10996360419425',5,'10:30','11:00','户外课堂','OutdoorActivities','付晓雪','曹艳/于菲'),('7f24d857656e4e65a3065147f514413f','e27e39be3b8e4b74a391a783f922b597',5,'15:50','16:20','户外活动','OutdoorActivities','李玲玉',''),('7f2d631cd1c847a4a204d41719f5a752','bcdac4d1c5d845a48b53369b8436b131',0,'9:40','9:55','视保操、加餐   Eyes Exercises and Snacks','','',''),('7f72363ef7114dcb80aab4c19201ee9a','8e212b16287d476699213b4e3bce4086',5,'15:00','15:30','户外课堂','OutdoorActivities','马梦瑶','郭婷婷/原惠慧'),('7ff574f9c415448280602cf42314c91d','8e212b16287d476699213b4e3bce4086',2,'8:30','9:00','语言技能','LanguageSkill','田友美','马梦瑶/郭婷婷/原惠慧'),('8036c1e23e504243b622e288e9d9080a','4b5011d1c18a4549af0b89054cfbf197',3,'15:15','15:45','户外课堂','OutdoorActivities','车柳英','潘菲'),('808eb85ba69d4933ae9de2548eadb1b9','4bac307c43c3499794b367614d7fac5f',4,'16:00','16:20','主题英语','ThemeEnglish','Kim/张欢','陈亚楠/门娜/张欢'),('80c103ba636449d694f467a3a3f2beb2','a21f951d755842d2b02932379080f892',1,'9:10','9:40','主题英语','ThemeEnglish','Sean/车柳英','刘蕊/吴本美'),('80c267233d694813bf3051dfc968fadb','0a543c589d72410e92929d9f224b18cc',3,'15:50','16:20','儿童足球','Football','令狐慧谊','唐艾艺'),('80c57ac8e2c548a983fa51e5f3d474b0','a21f951d755842d2b02932379080f892',0,'15:00','15:15','加餐  Snacks','','',''),('8214a6f6a1bc43a3933e681d989df7a9','7c9f1583f491433182867ff983c73d33',4,'14:00','14:30','儿童足球','Football','令狐慧谊','周琳'),('8266211f4d874c009ed126b479d3a2fc','16333413b51c43a3bd10996360419425',0,'13:40','14:00','起床   Get up','','',''),('82b71174c7974e7384c8f02c084191e3','b06ababb8ada44958f6baf8fa20c41d4',3,'10:30','11:00','儿童足球','Football','刘健康','赵翊彤/尤增强'),('82dbad2403674f129d71322761980218','20ba9953cb534c88a6fdbe92ff93a107',3,'8:30','9:00','自由玩耍','FreePlay','马丽','王田田'),('836b023161844a0ca6ea08bc1a092636','4b5011d1c18a4549af0b89054cfbf197',0,'8:00','8:30','早餐  Breakfast','','',''),('83b0af185e854e0294a708fbce99ecee','047372893e1144cf9a0a15669278ab53',5,'14:45','15:15','外教科学实验','ScienceActivities','唐任姣/Tarry','刘亚坤/王世鹏'),('84465ee46fff4cec90f0f9f06422f901','e27e39be3b8e4b74a391a783f922b597',5,'15:20','15:50','基础书写','BasicHandwriting','刘欢欢','李玲玉'),('84aceb681e5740e2a137a0b59de6044e','20ba9953cb534c88a6fdbe92ff93a107',0,'9:00','9:10','常青藤武术操   IVY Kongfu Exercises','','',''),('84c64361b6f1465baf8fab862d511458','e27e39be3b8e4b74a391a783f922b597',1,'14:00','14:30','拼音识字','PinYin','李玲玉',''),('84c6ef0ab43047458d7aa83a3f1c5caa','20ba9953cb534c88a6fdbe92ff93a107',1,'10:30','11:00','舞蹈','Dancing','李可遐','王田田'),('84d7595ccb564fc5887f94c316f6c187','60b0284aaf9d458ebcc04f47213a769b',2,'15:50','16:20','故事与表演','StoryTelling','田友美','郑丽/杨伟伟'),('8510e45315284dcb9ded47ec0db52e56','656ba48667bd48c0b9fb812ab14fbfd4',4,'9:10','9:40','武术','MartialArts','外聘老师','赵雨晴/张亚'),('859b57c044154170b9ba1d494ec7607c','e27e39be3b8e4b74a391a783f922b597',0,'11:15','11:45','午餐   Lunch','','',''),('85ada9ad68dd44a982a0dffbfe36a280','a21f951d755842d2b02932379080f892',4,'10:30','11:00','主题英语','ThemeEnglish','Sean/车柳英','刘蕊/吴本美'),('861ea1c29cf546e198204da30b463024','b06ababb8ada44958f6baf8fa20c41d4',2,'8:30','9:00','社会情绪主题','SEL','赵翊彤','尤增强'),('86b157acac2945c38a33246f8538931b','33e6bdae311d41a6ac77029ffb3c4c7d',0,'15:00','15:15','加餐  Snacks','','',''),('86c78c98430d42a1a5e27d0ae45a4bdd','4bac307c43c3499794b367614d7fac5f',5,'16:00','16:20','外教户外课堂','OutdoorActivities','Kim/张欢','陈亚楠/门娜/张欢'),('872698e04eb44aaf95a1305ff23e4a32','b06ababb8ada44958f6baf8fa20c41d4',1,'9:55','10:25','沙包游戏','BeanbagGame','刘健康','赵翊彤/尤增强'),('8850fee030b0416fbd66d00df4d819b8','33e6bdae311d41a6ac77029ffb3c4c7d',2,'14:30','15:00','魔术','Magic','曹艳','梁丽/江慧涛'),('889753c440714ab793a5d597ab1221e0','656ba48667bd48c0b9fb812ab14fbfd4',0,'14:10','14:30','起床   Get up','','',''),('889778c8a9c543599232d2f8539a828c','16333413b51c43a3bd10996360419425',5,'14:00','14:30','人体生理与健康习惯','Healthcare','江慧涛','曹艳/于菲'),('8923303717e442f3b5f97d2fd1561d7c','20ba9953cb534c88a6fdbe92ff93a107',4,'9:10','9:40','户外活动','OutdoorActivities','马丽',''),('89eed4243ff64568894d7d9512487a6c','6440ca0e3fbf48218726c7b9bdf491c7',2,'15:20','15:50','英文剧','Drama','石亚静','田友美'),('8a589ccbde5a4217a9258642e420cb8a','b06ababb8ada44958f6baf8fa20c41d4',5,'9:10','9:40','拼音识字','PinYin','李玲玉','赵翊彤/尤增强'),('8a60c52bf36345ef95c1709b3de3a7e6','33e6bdae311d41a6ac77029ffb3c4c7d',5,'8:30','9:00','主题英语','ThemeEnglish','杨国颖','梁丽'),('8a88e59dd0cc45c4b085302500df3e3e','16333413b51c43a3bd10996360419425',0,'9:00','9:10','常青藤武术操   IVY Kongfu Exercises','','',''),('8aa06cc7e0af42ea9a6c8ddabe521b65','4b5011d1c18a4549af0b89054cfbf197',2,'15:15','15:45','英文剧','Drama','车柳英','潘菲'),('8ab8f7bee37944738364de89726c43fd','b06ababb8ada44958f6baf8fa20c41d4',0,'11:15','11:45','午餐   Lunch','','',''),('8ac51d7001a04488bcf082d307b03aba','b8a2048b3b644d5f86b644f808f13a16',3,'15:50','16:20','主题英语','ThemeEnglish','Eric/付晓雪','辛佳怡'),('8aceeb7296474741af1128578c3acabb','60b0284aaf9d458ebcc04f47213a769b',0,'16:35','17:00','晚餐 Dinner','','',''),('8b940b6036044d4e880bf69388f7a4fa','20ba9953cb534c88a6fdbe92ff93a107',1,'15:50','16:20','外教手工','Arts&Crafts','Joe/马丽','王田田'),('8bd6a7d83d984376bd040287a4fbc3a7','16333413b51c43a3bd10996360419425',0,'11:50','12:10','餐后散步、音乐欣赏   Walk after Lunch and Music Appreciation','','',''),('8bf43c9220284f848ec52d32a16e94d2','e27e39be3b8e4b74a391a783f922b597',0,'8:00','8:30','早餐  Breakfast','','',''),('8c491d0e8884427d83c5b88c0c6394da','b06ababb8ada44958f6baf8fa20c41d4',5,'14:45','15:15','主题英语','ThemeEnglish','Sean/慕海兰','赵翊彤/尤增强'),('8cb10d7d8c1748fb80a340b85123e97d','b06ababb8ada44958f6baf8fa20c41d4',4,'14:45','15:15','外教户外课堂','OutdoorActivities','Sean/慕海兰','赵翊彤/尤增强'),('8cf0376b76b04355a4b387119274b43f','bcdac4d1c5d845a48b53369b8436b131',4,'9:10','9:40','外教户外课堂','OutdoorActivities','Eric/石亚静','王科妮/令狐慧谊'),('8cf685e9263742d7812f1ad1a70534de','0a543c589d72410e92929d9f224b18cc',2,'15:50','16:20','沙包游戏','BeanbagGame','令狐慧谊','唐艾艺/杨新'),('8d12ba0d693549e9b685cc5a3a53e0cd','4bac307c43c3499794b367614d7fac5f',0,'15:55','16:00','喝水 休息  Drink water, Break Time','','',''),('8e26cccaedf34dce8108e1a9d3bc8530','4b5011d1c18a4549af0b89054cfbf197',0,'16:35','17:00','晚餐 Dinner','','',''),('8e4e6001ecd1428f9f14e0f3d9c868d7','b8a2048b3b644d5f86b644f808f13a16',0,'15:15','15:20','喝水 休息  Drink water, Break Time','','',''),('8e739f93f33e4f399f5d6d1abd446a05','7c9f1583f491433182867ff983c73d33',1,'10:30','11:00','外教户外课堂','OutdoorActivities','Kim/唐任姣','魏苗/周琳'),('8e7c9bfb9b7a497aa25cfde0c1497ae7','16333413b51c43a3bd10996360419425',5,'15:20','15:50','儿童足球','Football','王世鹏','曹艳/于菲'),('8eebfcd867eb4cc6868a17e1a9c90974','0a543c589d72410e92929d9f224b18cc',2,'15:20','15:50','舞蹈','Dancing','刘亚坤','杨新'),('8f1f7e6774f2433fa7e39e1dad558417','7c9f1583f491433182867ff983c73d33',2,'9:55','10:25','外教户外课堂','OutdoorActivities','Kim/唐任姣','周琳'),('8f95f831a0ee4ab9a9bb1e782b556da8','4bac307c43c3499794b367614d7fac5f',2,'9:10','9:40','魔术','Magic','郑丽','门娜/张欢'),('8fecbb062ff8448a94a44d84577db715','6440ca0e3fbf48218726c7b9bdf491c7',2,'14:45','15:15','户外课堂','OutdoorActivities','石亚静','田友美'),('90ba4bcf505644998e42f8ac2b0c9281','60b0284aaf9d458ebcc04f47213a769b',3,'9:10','9:40','主题英语','ThemeEnglish','Joe/张欢','杨伟伟'),('9140267241444feabbc6d6733b948253','6440ca0e3fbf48218726c7b9bdf491c7',4,'9:10','9:40','美术','ArtandDrawing','杨伟伟','田友美'),('91463f02c2104d90bdbc0bfb41f72331','b06ababb8ada44958f6baf8fa20c41d4',4,'14:00','14:30','外教生活体验','Cooking','Sean/慕海兰','赵翊彤/尤增强'),('9184312cf315463288fc226a42ab53fa','656ba48667bd48c0b9fb812ab14fbfd4',1,'10:30','11:00','数学与逻辑','Math&Logic','刘蕊','赵雨晴/张亚'),('91d49bc338304ae392f0fdb17031a5d4','b8a2048b3b644d5f86b644f808f13a16',2,'15:50','16:20','英文剧','Drama','Eric/付晓雪','辛佳怡'),('93395194bd5a47589919d57cf02194d2','16333413b51c43a3bd10996360419425',4,'15:20','15:50','美术','ArtandDrawing','朱夏清','曹艳/于菲'),('93632bce2f224cfba094b40d5b619951','33e6bdae311d41a6ac77029ffb3c4c7d',0,'17:00','17:00','离校','','',''),('93db8e68f0124577835e8a6a8c4f78fa','047372893e1144cf9a0a15669278ab53',3,'9:55','10:25','户外活动','OutdoorActivities','刘亚坤','王世鹏'),('93fb5c1e6f4c45d08f0da45c7c22e74b','33e6bdae311d41a6ac77029ffb3c4c7d',4,'9:10','9:40','主题英语','ThemeEnglish','杨国颖','梁丽/江慧涛'),('9439bec67b424c4c8e41e6b7ceee9d06','656ba48667bd48c0b9fb812ab14fbfd4',0,'11:50','12:10','餐后散步、音乐欣赏   Walk after Lunch and Music Appreciation','','',''),('9558f8134f154805ba744f12fd557811','a21f951d755842d2b02932379080f892',2,'15:15','15:45','户外活动','OutdoorActivities','刘蕊','吴本美'),('960dadd2f2f94c50868f3a65c9989d3b','7c9f1583f491433182867ff983c73d33',1,'14:45','15:15','户外活动','OutdoorActivities','魏苗','周琳'),('9610157ac8e244d891d1de2cd8ba2ec6','6440ca0e3fbf48218726c7b9bdf491c7',0,'15:15','15:20','喝水 休息  Drink water, Break Time','','',''),('9746ff4c6c3e48419d8af5263fe03b91','6440ca0e3fbf48218726c7b9bdf491c7',3,'14:45','15:15','户外课堂','OutdoorActivities','石亚静','田友美'),('976f79337bf44a8cad23258dc8e9aca2','8e212b16287d476699213b4e3bce4086',3,'16:00','16:20','户外课堂','OutdoorActivities','马梦瑶','郭婷婷/原惠慧'),('976fbbe0db9243d1a97dec1dfae72574','bcdac4d1c5d845a48b53369b8436b131',1,'15:20','15:50','人体生理与健康习惯','Healthcare','江慧涛','令狐慧谊'),('9828d4b7a20c496baba510ae2e05cad7','33e6bdae311d41a6ac77029ffb3c4c7d',0,'10:25','10:30','喝水 休息  Drink Water, Break Time','','',''),('9880597bd3b8451d82c652463ce8af62','e27e39be3b8e4b74a391a783f922b597',0,'14:30','14:45','加餐  Snacks','','',''),('989be26fbdc740f685f4de637b87fa14','4bac307c43c3499794b367614d7fac5f',4,'8:30','9:00','语言技能','LanguageSkill','田友美','陈亚楠/门娜/张欢'),('98e5801882da44039f88f840401c206a','6440ca0e3fbf48218726c7b9bdf491c7',5,'14:00','14:30','户外课堂','OutdoorActivities','石亚静','田友美'),('991837e297254be6945008bbd9ae4b62','656ba48667bd48c0b9fb812ab14fbfd4',5,'15:50','16:20','外教生活体验','Cooking','Dani/孟广鑫','赵雨晴/张亚'),('993137f68e6048f2a1dd869b00535ff0','6440ca0e3fbf48218726c7b9bdf491c7',5,'8:30','9:00','','','','yyyy'),('99cd004a6ef84eb2a2434941861d8626','bcdac4d1c5d845a48b53369b8436b131',4,'8:30','9:00','主题英语','ThemeEnglish','Eric/石亚静','令狐慧谊'),('9a264c25d21e4cdd996b3666c1b9dd44','4bac307c43c3499794b367614d7fac5f',3,'9:10','9:40','体能训练','Physicaltraining','辛佳怡','陈亚楠/门娜/张欢'),('9a2ae85ee33e4bac8204c17cf6b32246','0a543c589d72410e92929d9f224b18cc',0,'14:30','14:45','加餐  Snacks','','',''),('9a9888cfeec54e3aa808a838d1625fbd','047372893e1144cf9a0a15669278ab53',4,'10:30','11:00','儿童高尔夫','Golf','刘健康','刘亚坤/王世鹏'),('9ab3a6433bd8402b9720d72ff9a3181e','16333413b51c43a3bd10996360419425',5,'14:45','15:15','','','','yyyy'),('9b0b9e4d33c043018ec9f4a18ac7c9c7','0a543c589d72410e92929d9f224b18cc',4,'14:00','14:30','户外活动','OutdoorActivities','唐艾艺','杨新'),('9b2f993ce4d44304a386d1ffe66b5af7','4b5011d1c18a4549af0b89054cfbf197',5,'14:30','15:00','主题英语','ThemeEnglish','车柳英','潘菲'),('9b33e3eebc4e44ac94f5cdf8881816ff','047372893e1144cf9a0a15669278ab53',3,'10:30','11:00','看图说话','PictureDescription','王田田','刘亚坤'),('9bc576e65e8d43da88ae8899a4014b49','60b0284aaf9d458ebcc04f47213a769b',3,'14:30','15:00','语言技能','LanguageSkill','张英','郑丽/杨伟伟'),('9bd3b0bc882049feace891a17fe7be7f','b8a2048b3b644d5f86b644f808f13a16',0,'11:15','11:45','午餐   Lunch','','',''),('9c136219552640aaadefea56f343d059','60b0284aaf9d458ebcc04f47213a769b',2,'14:30','15:00','户外活动','OutdoorActivities','郑丽','杨伟伟'),('9c262db33e764ad49dad205166fd8d9b','b8a2048b3b644d5f86b644f808f13a16',2,'9:55','10:25','数学与逻辑','Math&Logic','唐艾艺','辛佳怡'),('9c8187ac94644751ac2ab2ae11bafe0f','b06ababb8ada44958f6baf8fa20c41d4',3,'14:00','14:30','外教户外课堂','OutdoorActivities','Sean/慕海兰','赵翊彤/尤增强'),('9c884aa4265d49e7b07d37424295d525','7c9f1583f491433182867ff983c73d33',0,'11:15','11:45','午餐   Lunch','','',''),('9ce7227f81f44443b78226d7dd4110dd','e27e39be3b8e4b74a391a783f922b597',3,'8:30','9:00','主题英语','ThemeEnglish','Dani/孟广鑫','李玲玉/慕海兰'),('9d7381c3b22848c4b8788856ea3ee78a','a21f951d755842d2b02932379080f892',2,'15:50','16:20','数学与逻辑','Math&Logic','刘蕊','吴本美'),('9dc90ac504844cbd94e430a6ffb801bb','4bac307c43c3499794b367614d7fac5f',4,'15:00','15:30','外教户外课堂','OutdoorActivities','Kim/张欢','陈亚楠/门娜/张欢'),('9ddd8976b26b4d03b828d69923932fb0','6440ca0e3fbf48218726c7b9bdf491c7',2,'14:00','14:30','主题英语','ThemeEnglish','石亚静','田友美'),('9ddf650546f04ecf92cec89d93d6a3d5','7c9f1583f491433182867ff983c73d33',5,'15:50','16:20','儿童高尔夫','Golf','令狐慧谊','魏苗/周琳'),('9e62467a28fe465c8c5974b5b35d0546','a21f951d755842d2b02932379080f892',1,'15:15','15:45','故事与表演','StoryTelling','周琳','刘蕊/吴本美'),('9e857615d6a34f68a351fd57f91a6287','bcdac4d1c5d845a48b53369b8436b131',3,'10:30','11:00','外教户外课堂','OutdoorActivities','Eric/石亚静','王科妮/令狐慧谊'),('9e9f627a8445406ab96b83cadc583777','6440ca0e3fbf48218726c7b9bdf491c7',4,'8:30','9:00','数学与逻辑','Math&Logic','唐艾艺',''),('9ec2d511ba8c44119d562ff74bc35dcc','33e6bdae311d41a6ac77029ffb3c4c7d',2,'8:30','9:00','主题英语','ThemeEnglish','杨国颖','梁丽/江慧涛'),('9ee6cb508cb94384a187c3d024ee0380','60b0284aaf9d458ebcc04f47213a769b',0,'11:15','11:45','午餐   Lunch','','',''),('9f11f0d708fc459eb04735b0192e282a','4b5011d1c18a4549af0b89054cfbf197',3,'10:30','11:00','故事与表演','StoryTelling','原惠慧','潘菲/车柳英'),('9f7c99f1a54649dd819cc1b01f5968e5','7c9f1583f491433182867ff983c73d33',0,'17:00','17:00','离校','','',''),('a08e4894d1bd43308c79ba638c282b33','e27e39be3b8e4b74a391a783f922b597',1,'9:55','10:25','外教户外课堂','OutdoorActivities','Dani/孟广鑫','李玲玉/慕海兰'),('a112fe4da34c4212a086bdc4a708fed5','b06ababb8ada44958f6baf8fa20c41d4',3,'9:10','9:40','跆拳道','Taekwondo','外聘老师','赵翊彤/尤增强'),('a1515b2af9b44615a13dc30c5a503811','0a543c589d72410e92929d9f224b18cc',3,'9:55','10:25','主题英语','ThemeEnglish','马丽','唐艾艺'),('a169d270525a4514afe234f7eb891593','0a543c589d72410e92929d9f224b18cc',1,'15:50','16:20','播音主持与表演','PublicSpeakingSkills','魏苗','唐艾艺/杨新'),('a236fd8928d1466b9d7b13ab522d327c','16333413b51c43a3bd10996360419425',2,'15:50','16:20','社会情绪主题','SEL','于菲','曹艳'),('a293fe957a464dc79c728ac5f168fad4','0a543c589d72410e92929d9f224b18cc',5,'15:50','16:20','数学与逻辑','Math&Logic','王科妮','唐艾艺'),('a2ae9013f6c143438dac73edc2823258','16333413b51c43a3bd10996360419425',3,'15:20','15:50','体能训练','Physicaltraining','王世鹏','于菲'),('a316b64cbe8f4ac2af392938c41d4b3f','a21f951d755842d2b02932379080f892',2,'14:30','15:00','美术','ArtandDrawing','康雪荣','刘蕊/吴本美'),('a34ee2a79f1d448c8e05b42707ce32dc','4bac307c43c3499794b367614d7fac5f',4,'10:30','11:00','班级主题活动','Themeactivities','陈亚楠','门娜/张欢'),('a34f51236a014c28b4141006606695eb','0a543c589d72410e92929d9f224b18cc',0,'13:40','14:00','起床   Get up','','',''),('a37ab0e4c9184f5a96cf0b49183d8ac6','b8a2048b3b644d5f86b644f808f13a16',3,'14:45','15:15','主题英语','ThemeEnglish','Eric/付晓雪','辛佳怡'),('a3d960c11397406f934343d2e5fccbbc','16333413b51c43a3bd10996360419425',2,'14:00','14:30','','','','yyyy'),('a4393bbe5c1f48e7949cc34a36b6b6b9','16333413b51c43a3bd10996360419425',1,'14:00','14:30','数学与逻辑','Math&Logic','苏焕','曹艳/于菲'),('a4aebb1a9fc148608abcac5b11d41d88','047372893e1144cf9a0a15669278ab53',1,'8:30','9:00','社会情绪主题','SEL','王世鹏',''),('a59e18fd35b5480e894e35180a31c289','8e212b16287d476699213b4e3bce4086',5,'16:00','16:20','主题英语','ThemeEnglish','马梦瑶','郭婷婷/原惠慧'),('a5c10240d2534cb089d0a153442fd061','4b5011d1c18a4549af0b89054cfbf197',0,'9:40','9:55','视保操、加餐   Eyes Exercises and Snacks','','',''),('a6389e976387494782404778d858ca69','e27e39be3b8e4b74a391a783f922b597',5,'10:30','11:00','外教户外课堂','OutdoorActivities','Dani/孟广鑫','李玲玉/慕海兰'),('a65ccd1e5e394bdf97ba44cbb0a50c6f','0a543c589d72410e92929d9f224b18cc',0,'10:25','10:30','喝水 休息  Drink Water, Break Time','','',''),('a68253f44a2b412cab292e0f11ba757e','b06ababb8ada44958f6baf8fa20c41d4',1,'9:10','9:40','舞蹈','Dancing','赵雨晴','赵翊彤/尤增强'),('a69a75fa02ce4b0e9b9d9e94ebed8d10','a21f951d755842d2b02932379080f892',3,'9:10','9:40','英文剧','Drama','Sean/车柳英','刘蕊/吴本美'),('a777eafd78bd487499bc7784089f5343','e27e39be3b8e4b74a391a783f922b597',1,'8:30','9:00','主题英语','ThemeEnglish','Dani/孟广鑫','李玲玉/慕海兰'),('a7a0a47fd91a49438dbeda75807901f2','6440ca0e3fbf48218726c7b9bdf491c7',2,'9:10','9:40','舞蹈','Dancing','刘亚坤','田友美'),('a7ae7ef49e37421b80175c5af63d5a67','bcdac4d1c5d845a48b53369b8436b131',4,'9:55','10:25','跆拳道','Taekwondo','外聘老师','王科妮/令狐慧谊'),('a811dceeeb154a1f9421acc887055449','60b0284aaf9d458ebcc04f47213a769b',4,'15:15','15:45','故事与表演','StoryTelling','田友美','郑丽/杨伟伟'),('a8410420fc8e4a4d8b5b63a821156f77','047372893e1144cf9a0a15669278ab53',0,'16:35','17:00','晚餐 Dinner','','',''),('a842533deb7444058a0097d68569d48c','bcdac4d1c5d845a48b53369b8436b131',0,'15:15','15:20','喝水 休息  Drink water, Break Time','','',''),('a8c823e190e149a495047cc643f4491b','60b0284aaf9d458ebcc04f47213a769b',5,'15:50','16:20','魔术','Magic','曹艳','郑丽/杨伟伟'),('a8d0574f70a444749e522c3166c7f617','8e212b16287d476699213b4e3bce4086',2,'15:00','15:30','讲故事','StoryTelling','马梦瑶/Tarry','郭婷婷/原惠慧'),('a96033ab0aa042d5b1be795b0c61538b','6440ca0e3fbf48218726c7b9bdf491c7',4,'14:00','14:30','户外课堂','OutdoorActivities','石亚静','田友美'),('a97b3c342bc7420b901683d3f5ada6fe','a21f951d755842d2b02932379080f892',5,'14:30','15:00','故事与表演','StoryTelling','周琳','刘蕊/吴本美'),('a9e87310fed943258ff2bc5f38bef83b','b8a2048b3b644d5f86b644f808f13a16',5,'9:55','10:25','美术','ArtandDrawing','杨伟伟','辛佳怡'),('ab4a1b7c2ae34d4f9a4ed7eb6a0d6d70','33e6bdae311d41a6ac77029ffb3c4c7d',5,'15:15','15:45','人体生理与健康习惯','Healthcare','张亚','梁丽/江慧涛'),('ab5f1a19c8654dbcacb83c448bdb8686','e27e39be3b8e4b74a391a783f922b597',4,'15:20','15:50','儿童高尔夫','Golf','令狐慧谊','李玲玉'),('ab72ec7b81f04bfab4bbdcc6c6499e4a','60b0284aaf9d458ebcc04f47213a769b',1,'14:30','15:00','数学与逻辑','Math&Logic','刘蕊','杨伟伟'),('abc57aca45e8475d819fa03a1a2a1b07','33e6bdae311d41a6ac77029ffb3c4c7d',0,'12:10','14:10','午休   Nap Time','','',''),('ac3e8ba75f7541cc97caf0c016d6e309','60b0284aaf9d458ebcc04f47213a769b',0,'17:00','17:00','离校','','',''),('ac4aa236e23b46fda4f763498a74a190','6440ca0e3fbf48218726c7b9bdf491c7',0,'9:00','9:10','常青藤武术操   IVY Kongfu Exercises','','',''),('ac7f72f97db742978d16fcfab5b33b1b','b8a2048b3b644d5f86b644f808f13a16',2,'10:30','11:00','户外活动','OutdoorActivities','辛佳怡',''),('ac80b826093c4619998a3bdbd65a20a4','4bac307c43c3499794b367614d7fac5f',5,'9:10','9:40','体育游戏','OutdoorGames','辛佳怡','陈亚楠/门娜/张欢'),('ac960ddda0c94df3876fcee0aad52381','60b0284aaf9d458ebcc04f47213a769b',1,'10:30','11:00','外教户外课堂','OutdoorActivities','Joe/张欢','郑丽/杨伟伟'),('adb70280e9b6404c9d9aa3d9df4588ac','4b5011d1c18a4549af0b89054cfbf197',4,'9:55','10:25','户外活动','OutdoorActivities','潘菲',''),('adbfbfcb447a4b75861262cbc53303da','20ba9953cb534c88a6fdbe92ff93a107',5,'8:30','9:00','人体生理与健康习惯','Healthcare','江慧涛','王田田'),('ade4b82442a14dc6b05b50922eec9e8a','0a543c589d72410e92929d9f224b18cc',4,'14:45','15:15','艺术手工','ArtsandCrafts','陈亚楠','杨新'),('adf1c5b5ebef4af7aaec997cd6c627fc','656ba48667bd48c0b9fb812ab14fbfd4',2,'15:15','15:45','外教手工','Arts&Crafts','Dani/孟广鑫','赵雨晴/张亚'),('adfa851bbb4a42959c3fd3f2a1af5ea2','8e212b16287d476699213b4e3bce4086',0,'10:25','10:30','喝水 休息  Drink Water, Break Time','','',''),('ae15072ad87b47df83103d343455b6e8','b8a2048b3b644d5f86b644f808f13a16',0,'17:00','17:00','离校','','',''),('ae8fa024c6eb4aac8c0988bbfbada262','b8a2048b3b644d5f86b644f808f13a16',1,'14:00','14:30','外教户外课堂','OutdoorActivities','Eric/付晓雪','辛佳怡'),('ae9ecb8f933a416990e366882a9fe61a','e27e39be3b8e4b74a391a783f922b597',4,'9:10','9:40','主题英语','ThemeEnglish','Dani/孟广鑫','李玲玉/慕海兰'),('aec367390653441eb95f7426d59feed7','047372893e1144cf9a0a15669278ab53',0,'15:15','15:20','喝水 休息  Drink water, Break Time','','',''),('aede258da7b24024bb3b4ee589d45d47','a21f951d755842d2b02932379080f892',4,'14:30','15:00','语言技能','LanguageSkill','张英','刘蕊/吴本美'),('b01c8d6cc6514dda875000c9d956c2ec','8e212b16287d476699213b4e3bce4086',4,'9:55','10:25','故事与表演','StoryTelling','周琳','马梦瑶'),('b0a77546816e4704b5deb54cc0b8061d','bcdac4d1c5d845a48b53369b8436b131',2,'9:55','10:25','外教户外课堂','OutdoorActivities','Eric/石亚静','王科妮/令狐慧谊'),('b1133bdee88a4e90b94f1a2cefa2cc53','7c9f1583f491433182867ff983c73d33',0,'16:35','17:00','晚餐 Dinner','','',''),('b11bbb5307c64124a3bdd0053d2530de','16333413b51c43a3bd10996360419425',3,'9:10','9:40','户外课堂','OutdoorActivities','付晓雪','曹艳/于菲'),('b1b98c74f9e84f3babe0b2340ade6f0b','16333413b51c43a3bd10996360419425',4,'15:50','16:20','美术','ArtandDrawing','朱夏清','曹艳/于菲'),('b1ef63675f2d49da8f3dcfb03d1249a7','7c9f1583f491433182867ff983c73d33',0,'10:25','10:30','喝水 休息  Drink Water, Break Time','','',''),('b1fec8ccd8ea4beeb2beaab7323743ee','e27e39be3b8e4b74a391a783f922b597',4,'14:45','15:15','数学与逻辑','Math&Logic','苏焕',''),('b22f1481903444b7a344fb65aa7f0df1','a21f951d755842d2b02932379080f892',0,'12:10','14:10','午休   Nap Time','','',''),('b278c90af0c84a48a9f6c064d4616b53','b06ababb8ada44958f6baf8fa20c41d4',0,'12:10','13:40','午休   Nap Time','','',''),('b354092681bb4221bc3ab634f8fae528','b8a2048b3b644d5f86b644f808f13a16',4,'14:45','15:15','主题英语','ThemeEnglish','Eric/付晓雪','辛佳怡'),('b385d172b0dc492d8f44899775c7d737','0a543c589d72410e92929d9f224b18cc',0,'11:50','12:10','餐后散步、音乐欣赏   Walk after Lunch and Music Appreciation','','',''),('b38bfef756c64f0b873f3174c3272ee6','4b5011d1c18a4549af0b89054cfbf197',4,'9:10','9:40','社会情绪主题','SEL','潘菲',''),('b3fc24396b0b497697604de89cb2b58a','bcdac4d1c5d845a48b53369b8436b131',4,'14:00','14:30','户外活动','OutdoorActivities','王科妮',''),('b410e838e92f482594e6c0744e1dc345','7c9f1583f491433182867ff983c73d33',1,'9:55','10:25','主题英语','ThemeEnglish','Kim/唐任姣','魏苗/周琳'),('b44016ca40704948a3f91635908df97f','b06ababb8ada44958f6baf8fa20c41d4',0,'11:50','12:10','餐后散步、音乐欣赏   Walk after Lunch and Music Appreciation','','',''),('b4482956bcb44586ae6b6197f1e4b6dc','e27e39be3b8e4b74a391a783f922b597',3,'15:20','15:50','IVY社团活动','Clubactivities','',''),('b4755f0ed69e4461a6afaf921d5cc05c','4b5011d1c18a4549af0b89054cfbf197',5,'9:10','9:40','班级主题活动','Themeactivities','车柳英','潘菲'),('b47e9b17b5d04b04a7aa123181f15115','a21f951d755842d2b02932379080f892',5,'8:30','9:00','主题英语','ThemeEnglish','Sean/车柳英','刘蕊'),('b49b17e48a8f44f0b0cf9810a72fac13','6440ca0e3fbf48218726c7b9bdf491c7',1,'9:10','9:40','户外活动','OutdoorActivities','田友美',''),('b4e77f7e7f954c5b8d6dad41da4c61c9','a21f951d755842d2b02932379080f892',5,'10:30','11:00','外教户外课堂','OutdoorActivities','Sean/车柳英','刘蕊/吴本美'),('b5af2e87987940829b7c566810895d6c','656ba48667bd48c0b9fb812ab14fbfd4',5,'15:15','15:45','主题英语','ThemeEnglish','Dani/孟广鑫','赵雨晴'),('b5bb8709d980421fac026125ecd81797','20ba9953cb534c88a6fdbe92ff93a107',3,'15:20','15:50','主题英语','ThemeEnglish','Joe/马丽','王田田'),('b5d0904d67524b3faec0c31d96d7cbdb','e27e39be3b8e4b74a391a783f922b597',5,'8:30','9:00','主题英语','ThemeEnglish','Dani/孟广鑫','李玲玉/慕海兰'),('b5e9c5a20dc74724a5a6a591c399cb12','b06ababb8ada44958f6baf8fa20c41d4',3,'8:30','9:00','数学与逻辑','Math&Logic','王科妮','尤增强'),('b5f3642e1256458e8597b274f78778fa','0a543c589d72410e92929d9f224b18cc',1,'9:55','10:25','主题英语','ThemeEnglish','马丽','杨新'),('b625150f274847889402cb0ead98deb6','60b0284aaf9d458ebcc04f47213a769b',4,'9:10','9:40','主题英语','ThemeEnglish','Joe/张欢','郑丽'),('b631fb149cfb47f29f077379c1cac244','047372893e1144cf9a0a15669278ab53',3,'14:45','15:15','IVY社团活动','Clubactivities','',''),('b63436fc6a154e99816f60b66602fbb1','4b5011d1c18a4549af0b89054cfbf197',5,'10:30','11:00','户外活动','OutdoorActivities','潘菲',''),('b67129101cd4424d8eeabd8ee91b9b70','e27e39be3b8e4b74a391a783f922b597',5,'14:00','14:30','艺术手工','ArtsandCrafts','王婷婷','李玲玉'),('b696d968e5c34695922793114a557aea','b8a2048b3b644d5f86b644f808f13a16',5,'10:30','11:00','美术','ArtandDrawing','杨伟伟',''),('b6c4fec0b86f4cff822c7d967ca6a68a','b8a2048b3b644d5f86b644f808f13a16',4,'15:50','16:20','主题英语','ThemeEnglish','Eric/付晓雪','辛佳怡'),('b74077aaef1c4dbf8e21100c10dcde9b','6440ca0e3fbf48218726c7b9bdf491c7',1,'10:30','11:00','艺术手工','ArtsandCrafts','董绮轩','田友美'),('b74095007edb46edbb75ea23e3ef84a2','20ba9953cb534c88a6fdbe92ff93a107',0,'14:30','14:45','加餐  Snacks','','',''),('b7a2cf890b064427aec0ac1c8472432d','7c9f1583f491433182867ff983c73d33',4,'14:45','15:15','拼音识字','PinYin','李玲玉','魏苗/周琳'),('b7c144a500db4e558d48c53e2503ed59','4b5011d1c18a4549af0b89054cfbf197',4,'15:50','16:20','户外课堂','OutdoorActivities','车柳英','潘菲'),('b86922b97b024dbb89849f853cfba57f','0a543c589d72410e92929d9f224b18cc',1,'14:00','14:30','儿童高尔夫','Golf','令狐慧谊','唐艾艺/杨新'),('b8a31e91a7f34dc8a9de96b49d73c3b2','4b5011d1c18a4549af0b89054cfbf197',0,'17:00','17:00','离校','','',''),('b8b33707781d4b53b6fa9c39de947438','047372893e1144cf9a0a15669278ab53',5,'10:30','11:00','舞蹈','Dancing','赵雨晴','刘亚坤/王世鹏'),('b96a3046e2804f35803aa8e0ff061141','7c9f1583f491433182867ff983c73d33',1,'9:10','9:40','主题英语','ThemeEnglish','Kim/唐任姣','魏苗'),('b9da0245d9e74ea896030aa22d80c94c','bcdac4d1c5d845a48b53369b8436b131',5,'10:30','11:00','外教生活体验','Cooking','Eric/石亚静','王科妮/令狐慧谊'),('ba77ad22a1a74c078a66352081cacb79','4b5011d1c18a4549af0b89054cfbf197',4,'8:30','9:00','武术','MartialArts','外聘老师','潘菲'),('ba8ba805aaa643ef84bae8d81def61ba','8e212b16287d476699213b4e3bce4086',0,'17:00','17:00','离校','','',''),('ba9de133c3f944d0817a71186d54edac','60b0284aaf9d458ebcc04f47213a769b',5,'14:30','15:00','人体生理与健康习惯','Healthcare','张亚','郑丽/杨伟伟'),('bad29a94ce884eae9d640c3329a0d0c8','8e212b16287d476699213b4e3bce4086',3,'9:55','10:25','户外活动','OutdoorActivities','马梦瑶','郭婷婷/原惠慧'),('bb0e87055f4b4d39be33b9cac80f604e','6440ca0e3fbf48218726c7b9bdf491c7',3,'15:50','16:20','主题英语','ThemeEnglish','石亚静','田友美'),('bba8de0877224a20a64c35f546fa1028','bcdac4d1c5d845a48b53369b8436b131',0,'16:35','17:00','晚餐 Dinner','','',''),('bc2b8aae46ce4e4198ac563db65ae193','8e212b16287d476699213b4e3bce4086',2,'15:35','15:55','户外课堂','OutdoorActivities','马梦瑶','郭婷婷/原惠慧'),('bc659ec89f44478285e3782e5c49dc46','20ba9953cb534c88a6fdbe92ff93a107',1,'9:55','10:25','数学与逻辑','Math&Logic','唐艾艺','王田田'),('bcc605d7069f4ab7b5f9e0c35c9a8be6','4b5011d1c18a4549af0b89054cfbf197',5,'15:15','15:45','户外课堂','OutdoorActivities','车柳英','潘菲'),('bd2508677f5a47e8af88f873904aff63','e27e39be3b8e4b74a391a783f922b597',3,'9:55','10:25','跆拳道','Taekwondo','外聘老师','慕海兰'),('bdcc6174b29b46bd9bc5f80043a004d9','4b5011d1c18a4549af0b89054cfbf197',0,'11:50','12:10','餐后散步、音乐欣赏   Walk after Lunch and Music Appreciation','','',''),('bdd58a980b2443fdbb2d4067c6f0d4ac','16333413b51c43a3bd10996360419425',3,'9:55','10:25','外教生活体验','Cooking','付晓雪/Tarry','曹艳/于菲'),('bdd6806ec0d240eca81966ca7c7d15de','6440ca0e3fbf48218726c7b9bdf491c7',5,'14:45','15:15','主题英语','ThemeEnglish','石亚静','田友美'),('be595df73efc46158982aea5c9c6eec4','656ba48667bd48c0b9fb812ab14fbfd4',2,'9:10','9:40','魔术','Magic','曹艳','赵雨晴/张亚'),('be68db5f543948da8470d94040ee7db2','047372893e1144cf9a0a15669278ab53',1,'9:10','9:40','美术','ArtandDrawing','门娜','刘亚坤/王世鹏'),('bea682c1db344722bd59f6805476ed79','8e212b16287d476699213b4e3bce4086',4,'9:10','9:40','自由玩耍','FreePlay','马梦瑶','郭婷婷/原惠慧'),('bed49e2c44e743cbbe78c5522c694432','4b5011d1c18a4549af0b89054cfbf197',1,'10:30','11:00','魔术','Magic','曹艳','潘菲'),('bf27ca09f5c14d33a2ee9fe463756142','60b0284aaf9d458ebcc04f47213a769b',3,'10:30','11:00','外教生活体验','Cooking','Joe/张欢','郑丽/杨伟伟'),('bf40108de8cb4dac8a39ff1e637f26f1','bcdac4d1c5d845a48b53369b8436b131',5,'15:50','16:20','故事与表演','StoryTelling','杨新',''),('bfd0d43b5cdc45259ed7e9e91ee2cedd','bcdac4d1c5d845a48b53369b8436b131',0,'11:50','12:10','餐后散步、音乐欣赏   Walk after Lunch and Music Appreciation','','',''),('bffeeee886114408b532b53d4b021b54','4b5011d1c18a4549af0b89054cfbf197',5,'9:55','10:25','故事与表演','StoryTelling','原惠慧',''),('c05e0fbe32f845d59e4e0ffb0f326a52','8e212b16287d476699213b4e3bce4086',5,'15:35','15:55','主题英语','ThemeEnglish','马梦瑶','郭婷婷/原惠慧'),('c0879b7905754ab0a37df443d6820955','656ba48667bd48c0b9fb812ab14fbfd4',1,'15:15','15:45','主题英语','ThemeEnglish','Dani/孟广鑫','赵雨晴/张亚'),('c08aeff917704c15841860825643f04a','7c9f1583f491433182867ff983c73d33',3,'14:45','15:15','IVY社团活动','Clubactivities','',''),('c0bfdc2e6acc4620a4134b86edbc4a5f','a21f951d755842d2b02932379080f892',0,'11:50','12:10','餐后散步、音乐欣赏   Walk after Lunch and Music Appreciation','','',''),('c11e2bef85fc40d8b1a48689531aadac','16333413b51c43a3bd10996360419425',0,'14:30','14:45','加餐  Snacks','','',''),('c12e51738c4e492396bc5b184384c437','33e6bdae311d41a6ac77029ffb3c4c7d',3,'9:55','10:25','户外课堂','OutdoorActivities','杨国颖','梁丽/江慧涛'),('c1c67b2ea023415d890fd21c4c2d190a','7c9f1583f491433182867ff983c73d33',2,'15:20','15:50','数学与逻辑','Math&Logic','王科妮','魏苗/周琳'),('c2a84ddcca8f4c75ad4ce44bbc8ae6f9','7c9f1583f491433182867ff983c73d33',5,'9:10','9:40','外教户外课堂','OutdoorActivities','Kim/唐任姣','魏苗/周琳'),('c2eb3c68bada4149bb3846e293008893','20ba9953cb534c88a6fdbe92ff93a107',3,'10:30','11:00','','','','yyyy'),('c2ec0acfc2ac4e2888320699461d12fe','7c9f1583f491433182867ff983c73d33',2,'15:50','16:20','户外活动','OutdoorActivities','魏苗','周琳'),('c3718b8f348942ca9c90eb7ce1fb677c','b06ababb8ada44958f6baf8fa20c41d4',5,'9:55','10:25','班级主题活动','Themeactivities','尤增强','赵翊彤'),('c392028e476e43df9628ebb67e4ff1db','4bac307c43c3499794b367614d7fac5f',5,'8:30','9:00','社会情绪主题','SEL','陈亚楠','门娜/张欢'),('c46c8d67df5e49f19d586ed31fa97eb7','16333413b51c43a3bd10996360419425',3,'10:30','11:00','主题英语','ThemeEnglish','付晓雪','曹艳/于菲'),('c4dd448a686d4f91a957b47a8acf5cb8','b8a2048b3b644d5f86b644f808f13a16',3,'10:30','11:00','儿童足球','Football','王世鹏','辛佳怡'),('c59eccb50fc14d41a5c731be21a33980','047372893e1144cf9a0a15669278ab53',4,'8:30','9:00','艺术手工','ArtsandCrafts','王婷婷','刘亚坤/王世鹏'),('c5d8cf053d424c68aa944fd9da16beee','b06ababb8ada44958f6baf8fa20c41d4',0,'8:00','8:30','早餐  Breakfast','','',''),('c5f7e99d436d437db1425f384af6bffe','60b0284aaf9d458ebcc04f47213a769b',1,'15:15','15:45','户外活动','OutdoorActivities','郑丽','杨伟伟'),('c61e83b86a544d2fa6f5a9f9c87b94e8','a21f951d755842d2b02932379080f892',4,'9:10','9:40','外教科学实验','ScienceActivities','Sean/车柳英','刘蕊/吴本美'),('c63c3c761e76402f90ba86000e210dc3','20ba9953cb534c88a6fdbe92ff93a107',2,'8:30','9:00','数学与逻辑','Math&Logic','唐艾艺','王田田'),('c64b7eadea9444fe82c3cff7b0b6eb46','7c9f1583f491433182867ff983c73d33',4,'8:30','9:00','主题英语','ThemeEnglish','Kim/唐任姣','魏苗/周琳'),('c64cd0357c34485bacdd9de1226311b6','7c9f1583f491433182867ff983c73d33',4,'15:20','15:50','艺术手工','ArtsandCrafts','陈亚楠','魏苗/周琳'),('c6e8df5af1a6461a9e9d7462093a20e8','4bac307c43c3499794b367614d7fac5f',0,'14:30','15:00','起床   Get up','','',''),('c6ec3fa787824e83be6dbefd3a8d9b69','b06ababb8ada44958f6baf8fa20c41d4',1,'15:20','15:50','外教讲故事','StoryTelling','Sean/慕海兰','赵翊彤/尤增强'),('c70383ee4bbd45dbb83db42438c5023a','33e6bdae311d41a6ac77029ffb3c4c7d',0,'9:40','9:55','视保操、加餐   Eyes Exercises and Snacks','','',''),('c7076b9a8ff94a23a96abcaa8d32034a','20ba9953cb534c88a6fdbe92ff93a107',4,'15:50','16:20','外教户外课堂','OutdoorActivities','Joe/马丽','王田田'),('c745209fd9d74c8f9868127896a68328','33e6bdae311d41a6ac77029ffb3c4c7d',4,'14:30','15:00','故事与表演','StoryTelling','原惠慧','梁丽/江慧涛'),('c7522d7c266c4cb08738f4862ca50c47','047372893e1144cf9a0a15669278ab53',5,'9:55','10:25','数学与逻辑','Math&Logic','苏焕','刘亚坤/王世鹏'),('c768f756cb27439ab81d9e9a3d49ae69','20ba9953cb534c88a6fdbe92ff93a107',0,'13:40','14:00','起床   Get up','','',''),('c7ba03d422f344f0beb33da4167b7e2f','b06ababb8ada44958f6baf8fa20c41d4',0,'16:35','17:00','晚餐 Dinner','','',''),('c7c1da2c927141fa8bd393626d660eba','b06ababb8ada44958f6baf8fa20c41d4',2,'14:00','14:30','外教户外课堂','OutdoorActivities','Sean/慕海兰','赵翊彤/尤增强'),('c7d84d5ca621444f8e312d8b1d531c09','4b5011d1c18a4549af0b89054cfbf197',2,'15:50','16:20','户外课堂','OutdoorActivities','车柳英','潘菲'),('c857d84a7557494d9d8048fd6fe504de','16333413b51c43a3bd10996360419425',4,'10:30','11:00','户外课堂','OutdoorActivities','付晓雪','曹艳/于菲'),('c8b176323c9d43d0a667978bf757b984','0a543c589d72410e92929d9f224b18cc',5,'14:45','15:15','社会情绪主题','SEL','唐艾艺','杨新'),('c8bc1791e5d5451a9a3fc331f70a7130','a21f951d755842d2b02932379080f892',3,'15:50','16:20','体育游戏','OutdoorGames','王强','吴本美'),('c8df4407f366466e880372f4fea11c63','60b0284aaf9d458ebcc04f47213a769b',5,'15:15','15:45','体育游戏','OutdoorGames','辛佳怡','郑丽/杨伟伟'),('c8e3edd361d94066ac24cc82356a2b87','4bac307c43c3499794b367614d7fac5f',0,'17:00','17:00','离校','','',''),('c8f15be438264b548e1ce820cbbf6f72','16333413b51c43a3bd10996360419425',2,'9:10','9:40','讲故事','StoryTelling','付晓雪','于菲'),('c8f46618627242928c0b93ce41701686','20ba9953cb534c88a6fdbe92ff93a107',2,'15:20','15:50','主题英语','ThemeEnglish','Joe/马丽','王田田'),('ca00dd1a49974a27b741af199f0e5385','4bac307c43c3499794b367614d7fac5f',3,'15:00','15:30','主题英语','ThemeEnglish','Kim/张欢','陈亚楠/门娜/张欢'),('ca24fb3d4aaa4ffd95d0e44343a716b0','e27e39be3b8e4b74a391a783f922b597',3,'9:10','9:40','外教户外课堂','OutdoorActivities','Dani/孟广鑫','李玲玉/慕海兰'),('ca629a9f357c4d66b024a8a22704de6f','047372893e1144cf9a0a15669278ab53',5,'9:10','9:40','儿童足球','Football','刘健康','刘亚坤'),('cab8066b4d774ce187f9fe7eb5a919af','bcdac4d1c5d845a48b53369b8436b131',3,'15:20','15:50','国学','TraditionalCulture','吴本美','王科妮/令狐慧谊'),('cacee8c2596a4a4caa11d1df851200cf','33e6bdae311d41a6ac77029ffb3c4c7d',0,'8:00','8:30','早餐  Breakfast','','',''),('caf5f68e82974a3e8ca5f0e5afeaf7b3','20ba9953cb534c88a6fdbe92ff93a107',4,'14:00','14:30','外教科学实验','ScienceActivities','Joe/马丽','王田田'),('cb27bad1a9c041a2a3578cec01ddbc24','b06ababb8ada44958f6baf8fa20c41d4',3,'9:55','10:25','拼音识字','PinYin','李玲玉','赵翊彤/尤增强'),('cb93c2e58c70425f91613ca22eedcd73','4bac307c43c3499794b367614d7fac5f',1,'9:55','10:25','自由阅读','FreeReading','陈亚楠','门娜/张欢'),('cba19f1c6c734641b8165e2c8e7e3460','4bac307c43c3499794b367614d7fac5f',2,'10:30','11:00','户外活动','OutdoorActivities','陈亚楠','门娜/张欢'),('cbb5d98ca4584c7a8db5fddc9638388a','8e212b16287d476699213b4e3bce4086',5,'10:30','11:00','体能训练','Physicaltraining','辛佳怡','马梦瑶/郭婷婷/原惠慧'),('cbdbeb88ace244f9b2ccec865b701401','656ba48667bd48c0b9fb812ab14fbfd4',1,'9:55','10:25','艺术手工','ArtsandCrafts','赫秀佩','赵雨晴/张亚'),('cc01662d50184708b1367dab85a2f13f','a21f951d755842d2b02932379080f892',4,'8:30','9:00','主题英语','ThemeEnglish','Sean/车柳英','刘蕊/吴本美'),('cc115c44f3e54d338535a4e294f4bbab','60b0284aaf9d458ebcc04f47213a769b',1,'9:10','9:40','外教讲故事','StoryTelling','Joe/张欢','郑丽/杨伟伟'),('cc2c6463d13345288cd3554e249a13e7','a21f951d755842d2b02932379080f892',0,'17:00','17:00','离校','','',''),('cc4d01c14e4d4233ae4bb44b4a188d48','656ba48667bd48c0b9fb812ab14fbfd4',0,'9:40','9:55','视保操、加餐   Eyes Exercises and Snacks','','',''),('cc50701057cd41c88041451aab8e2dc2','047372893e1144cf9a0a15669278ab53',2,'14:45','15:15','户外课堂','OutdoorActivities','唐任姣','刘亚坤'),('ccffd5c3c8ea4becbd4faff066c092b7','a21f951d755842d2b02932379080f892',2,'10:30','11:00','主题英语','ThemeEnglish','Sean/车柳英','刘蕊/吴本美'),('cdbafcdf4a954f35be03484fc33ef1cc','e27e39be3b8e4b74a391a783f922b597',1,'14:45','15:15','儿童足球','Football','令狐慧谊','李玲玉'),('ce51eaf1bf064801b6540f7352705640','b8a2048b3b644d5f86b644f808f13a16',4,'14:00','14:30','外教户外课堂','OutdoorActivities','Eric/付晓雪','辛佳怡'),('ce641ceceaf0412e85e81ed566632cb3','4bac307c43c3499794b367614d7fac5f',5,'15:00','15:30','主题英语','ThemeEnglish','Kim/张欢','陈亚楠/门娜/张欢'),('cee0d90fa0bc439082fdd0ce4ed91922','0a543c589d72410e92929d9f224b18cc',0,'9:40','9:55','视保操、加餐   Eyes Exercises and Snacks','','',''),('cf53548de42a41f9a8820fff056873cb','60b0284aaf9d458ebcc04f47213a769b',3,'9:55','10:25','外教户外课堂','OutdoorActivities','Joe/张欢','郑丽/杨伟伟'),('d012524fe2c243bcaf7833b13d127e2d','33e6bdae311d41a6ac77029ffb3c4c7d',5,'9:10','9:40','户外课堂','OutdoorActivities','杨国颖','梁丽'),('d0abb56a8beb480bb5bf45bfd98875a0','60b0284aaf9d458ebcc04f47213a769b',3,'15:50','16:20','户外活动','OutdoorActivities','郑丽','杨伟伟'),('d26f2f0de39a421c931ae4ca2477dc3e','6440ca0e3fbf48218726c7b9bdf491c7',0,'13:40','14:00','起床   Get up','','',''),('d27dccde7c974974ae923f03c8e935b1','b06ababb8ada44958f6baf8fa20c41d4',0,'17:00','17:00','离校','','',''),('d292061d2cfc411fb16533220291b89c','0a543c589d72410e92929d9f224b18cc',0,'8:00','8:30','早餐  Breakfast','','',''),('d2deed908f2844dea1cec6a711e25fb0','20ba9953cb534c88a6fdbe92ff93a107',2,'9:55','10:25','艺术手工','ArtsandCrafts','宋秀萍','王田田'),('d359aadd703e4fee9c6f4ba448bbbbc4','0a543c589d72410e92929d9f224b18cc',1,'10:30','11:00','艺术手工(英)','Arts&Crafts','马丽','杨新'),('d3bcbfbc818340d2a016c1526aebbf61','33e6bdae311d41a6ac77029ffb3c4c7d',3,'9:10','9:40','外教生活体验','Cooking','杨国颖/Tarry','梁丽/江慧涛'),('d416722878bf47919358eed1baf467b3','60b0284aaf9d458ebcc04f47213a769b',0,'14:10','14:30','起床   Get up','','',''),('d457053e79ff49c489e7713647c243a7','20ba9953cb534c88a6fdbe92ff93a107',0,'11:50','12:10','餐后散步、音乐欣赏   Walk after Lunch and Music Appreciation','','',''),('d5492e92638e46708246319103558e34','b06ababb8ada44958f6baf8fa20c41d4',2,'15:20','15:50','外教手工','Arts&Crafts','Sean/慕海兰','赵翊彤/尤增强'),('d59f68b237634886aefac4caf148870e','16333413b51c43a3bd10996360419425',1,'9:10','9:40','主题英语','ThemeEnglish','付晓雪','曹艳/于菲'),('d5e491137724422482749b6ea165bdd5','60b0284aaf9d458ebcc04f47213a769b',2,'9:55','10:25','主题英语','ThemeEnglish','Joe/张欢','郑丽/杨伟伟'),('d5f7e50525d344d3a86f6e619c705fb2','bcdac4d1c5d845a48b53369b8436b131',0,'11:15','11:45','午餐   Lunch','','',''),('d61eaad2176c4739a415d33f6753e329','b06ababb8ada44958f6baf8fa20c41d4',1,'14:00','14:30','主题英语','ThemeEnglish','Sean/慕海兰','赵翊彤/尤增强'),('d6964995de3f422b91dbe2dd3b93dc7a','8e212b16287d476699213b4e3bce4086',5,'8:30','9:00','语言技能','LanguageSkill','田友美','马梦瑶/郭婷婷/原惠慧'),('d6fda3a679d14bb08028f11aef1f7d94','20ba9953cb534c88a6fdbe92ff93a107',1,'9:10','9:40','体能训练','Physicaltraining','王强','王田田'),('d76017ca65ad47a795f888a8c515ed14','bcdac4d1c5d845a48b53369b8436b131',1,'14:45','15:15','自由玩耍','FreePlay','王科妮',''),('d83d105aded74e998969d45397f552f3','047372893e1144cf9a0a15669278ab53',3,'14:00','14:30','艺术手工(英)','Arts&Crafts','唐任姣','刘亚坤/王世鹏'),('d8890026d3dd43739cf4586c31fb01dd','33e6bdae311d41a6ac77029ffb3c4c7d',2,'10:30','11:00','讲故事','StoryTelling','杨国颖','梁丽/江慧涛'),('d89d511ece9d481f8cf382ee0e8663fd','8e212b16287d476699213b4e3bce4086',2,'9:55','10:25','班级主题活动','Themeactivities','马梦瑶','郭婷婷/原惠慧'),('d8c6631b67724c8cb7beec5d9a6a761f','656ba48667bd48c0b9fb812ab14fbfd4',4,'8:30','9:00','故事与表演','StoryTelling','原惠慧','赵雨晴/张亚'),('d8e26cd7abdf4e47b5aa19c5f20f903c','047372893e1144cf9a0a15669278ab53',5,'15:50','16:20','主题英语','ThemeEnglish','唐任姣','刘亚坤/王世鹏'),('d8e39f3d56ce4e0c93d21d3c6a7f07a0','047372893e1144cf9a0a15669278ab53',0,'8:00','8:30','早餐  Breakfast','','',''),('d8f5cf9ac4fd45159d9f27db1f3e7dbc','6440ca0e3fbf48218726c7b9bdf491c7',0,'12:10','13:40','午休   Nap Time','','',''),('d9a70ca08cfe42d29f6c5d87842e643a','6440ca0e3fbf48218726c7b9bdf491c7',1,'15:20','15:50','户外课堂','OutdoorActivities','石亚静','田友美'),('da37b6f9ccc04c2eb3df394ebfa08731','656ba48667bd48c0b9fb812ab14fbfd4',3,'9:10','9:40','户外活动','OutdoorActivities','赵雨晴','张亚'),('daa234ca869e4188951bc568ac2f83f1','20ba9953cb534c88a6fdbe92ff93a107',5,'14:00','14:30','外教生活体验','Cooking','Joe/马丽','王田田'),('daca8334d50d4bb9add3fe014dd830c9','b06ababb8ada44958f6baf8fa20c41d4',2,'14:45','15:15','主题英语','ThemeEnglish','Sean/慕海兰','赵翊彤'),('db95051f118348668d7ecdc0622d29dd','4bac307c43c3499794b367614d7fac5f',1,'9:10','9:40','户外活动','OutdoorActivities','陈亚楠',''),('dbb0a39c8e2f4826aa266158e584f43f','e27e39be3b8e4b74a391a783f922b597',3,'15:50','16:20','看图说话','PictureDescription','王田田',''),('dc28c69845f3420ca027732625c27809','6440ca0e3fbf48218726c7b9bdf491c7',3,'10:30','11:00','跆拳道','Taekwondo','外聘老师',''),('dc35330ce6044903b1c8a4bdd5d5c3d0','0a543c589d72410e92929d9f224b18cc',0,'12:10','13:40','午休   Nap Time','','',''),('dc6bf7b5f9ee47c08dd179d99d6a910f','8e212b16287d476699213b4e3bce4086',0,'15:55','16:00','喝水 休息  Drink water, Break Time','','',''),('dca4a110add74908963e91f725827186','bcdac4d1c5d845a48b53369b8436b131',1,'14:00','14:30','户外活动','OutdoorActivities','王科妮',''),('dcd6636d6c8445b5ad5c875b13f38941','e27e39be3b8e4b74a391a783f922b597',4,'15:50','16:20','视唱练耳与音乐基础','SolfeggioandMusicfoundation','李钊','李玲玉'),('dd28fe197a5b42d6bac0a297e1cb9eb0','b06ababb8ada44958f6baf8fa20c41d4',3,'14:45','15:15','IVY社团活动','Clubactivities','',''),('dd59edbb5764408988ad959806bc34bc','4b5011d1c18a4549af0b89054cfbf197',0,'10:25','10:30','喝水 休息  Drink Water, Break Time','','',''),('dd73cecbeede420ca9d88753aafa3e7b','7c9f1583f491433182867ff983c73d33',5,'8:30','9:00','主题英语','ThemeEnglish','Kim/唐任姣','周琳'),('ddd30338a72d4eb39200cd72e01eebce','4b5011d1c18a4549af0b89054cfbf197',1,'14:30','15:00','主题英语','ThemeEnglish','车柳英','潘菲'),('de609891fa5e434689aafdc9e538251a','6440ca0e3fbf48218726c7b9bdf491c7',3,'9:55','10:25','故事与表演','StoryTelling','杨新','田友美'),('de65cb68313e4f578bfd0d5ab955d0c3','20ba9953cb534c88a6fdbe92ff93a107',1,'14:45','15:15','外教户外课堂','OutdoorActivities','Joe/马丽','王田田'),('de8491b11d3e4631b57bbd965b6d5cef','bcdac4d1c5d845a48b53369b8436b131',0,'17:00','17:00','离校','','',''),('dfb3a42bd49d4d58acfd96f5e79a6b89','20ba9953cb534c88a6fdbe92ff93a107',0,'8:00','8:30','早餐  Breakfast','','',''),('dfbe4f6a578f41bd8d1f8fc480d73158','0a543c589d72410e92929d9f224b18cc',1,'9:10','9:40','户外课堂','OutdoorActivities','马丽','唐艾艺/杨新'),('e0863e573d044b6a95ca246b29ca5d72','0a543c589d72410e92929d9f224b18cc',0,'9:00','9:10','常青藤武术操   IVY Kongfu Exercises','','',''),('e0a52149131540cc8340e9e510fe0af8','e27e39be3b8e4b74a391a783f922b597',4,'9:55','10:25','外教生活体验','Cooking','Dani/孟广鑫','慕海兰'),('e117e8ddff7a4239ab35972720246394','7c9f1583f491433182867ff983c73d33',0,'11:50','12:10','餐后散步、音乐欣赏   Walk after Lunch and Music Appreciation','','',''),('e128d3108fd449458d22cd6180a95561','b06ababb8ada44958f6baf8fa20c41d4',1,'14:45','15:15','主题英语','ThemeEnglish','Sean/慕海兰','赵翊彤/尤增强'),('e16f1ded53124891af2f9bacd756ecdf','60b0284aaf9d458ebcc04f47213a769b',5,'10:30','11:00','主题英语','ThemeEnglish','Joe/张欢','郑丽'),('e179a973694a45988332e1f31b5116c6','e27e39be3b8e4b74a391a783f922b597',0,'13:40','14:00','起床   Get up','','',''),('e18059bd56ea47daa694c884a7b9549e','656ba48667bd48c0b9fb812ab14fbfd4',4,'10:30','11:00','社会情绪主题','SEL','赵雨晴','张亚'),('e1b6c904dce74218b416ae9b7fc5b209','4bac307c43c3499794b367614d7fac5f',0,'15:30','15:35','加餐  Snacks','','',''),('e1dd43d0a2ef423289c64acaa3a77d6c','656ba48667bd48c0b9fb812ab14fbfd4',3,'15:15','15:45','外教户外课堂','OutdoorActivities','Dani/孟广鑫','赵雨晴/张亚'),('e1e1f1cf9b09432298509c227e5cce9e','20ba9953cb534c88a6fdbe92ff93a107',0,'17:00','17:00','离校','','',''),('e2f398b044e64cc99ef1963deed64fba','656ba48667bd48c0b9fb812ab14fbfd4',1,'8:30','9:00','自由阅读','FreeReading','赵雨晴',''),('e338f6efce3841fdb00206962a09fa59','b8a2048b3b644d5f86b644f808f13a16',5,'9:10','9:40','体能训练','Physicaltraining','王世鹏',''),('e34204afff9e4eafac87ab6091aa8644','a21f951d755842d2b02932379080f892',3,'9:55','10:25','外教户外课堂','OutdoorActivities','Sean/车柳英','刘蕊'),('e3914eff0522450d81dca3e7cad3f8fe','656ba48667bd48c0b9fb812ab14fbfd4',3,'9:55','10:25','自由玩耍','FreePlay','赵雨晴','张亚'),('e392b85878024c359be6d39e15101c5a','7c9f1583f491433182867ff983c73d33',1,'8:30','9:00','英文剧','Drama','Kim/唐任姣','魏苗'),('e3b5634e1a8d4d22b04f1460a18215b5','4b5011d1c18a4549af0b89054cfbf197',0,'14:10','14:30','起床   Get up','','',''),('e3c6501d3773474c940f6156a7c49f73','4b5011d1c18a4549af0b89054cfbf197',2,'9:10','9:40','自由阅读','FreeReading','潘菲',''),('e3eb62b66f2540eebe9eee11792ac31c','16333413b51c43a3bd10996360419425',3,'14:00','14:30','舞蹈','Dancing','赵雨晴','曹艳/于菲'),('e413d0332cb74c909439cd45d88e6d85','e27e39be3b8e4b74a391a783f922b597',0,'9:00','9:10','常青藤武术操   IVY Kongfu Exercises','','',''),('e42233f0ce464f95beb02ddba4e536ed','b06ababb8ada44958f6baf8fa20c41d4',4,'9:10','9:40','看图说话','PictureDescription','王田田','赵翊彤/尤增强'),('e439478580834cd79da37590f7f4c5de','7c9f1583f491433182867ff983c73d33',3,'15:50','16:20','拼音识字','PinYin','李玲玉','魏苗/周琳'),('e4421b43649846b88bc48191430daba7','60b0284aaf9d458ebcc04f47213a769b',4,'8:30','9:00','外教科学实验','ScienceActivities','Joe/张欢','郑丽/杨伟伟'),('e4b53b962f4d4a59b789b09c152454bb','16333413b51c43a3bd10996360419425',0,'16:35','17:00','晚餐 Dinner','','',''),('e4c497c630054b03a5ba0f9103461282','656ba48667bd48c0b9fb812ab14fbfd4',3,'8:30','9:00','音乐启蒙与乐感培养','Music','赵翊彤','赵雨晴/张亚'),('e4ea7f3b37674b478b7828f7c43f9045','16333413b51c43a3bd10996360419425',5,'8:30','9:00','外教科学实验','ScienceActivities','付晓雪/Tarry','曹艳/于菲'),('e50747832eee4163b6a47485643a3ed1','4b5011d1c18a4549af0b89054cfbf197',4,'15:15','15:45','外教科学实验','ScienceActivities','车柳英/Tarry','潘菲'),('e54d2f0dbd9343c8afb1cb6a6594e60a','a21f951d755842d2b02932379080f892',0,'8:00','8:30','早餐  Breakfast','','',''),('e56f49487e0640bb977f1c73862177b2','b06ababb8ada44958f6baf8fa20c41d4',2,'9:55','10:25','播音主持与表演','PublicSpeakingSkills','魏苗',''),('e5e5aaa2d53841dc9f18c22273da0e92','33e6bdae311d41a6ac77029ffb3c4c7d',0,'16:35','17:00','晚餐 Dinner','','',''),('e6096265ae484560bd1bbec8d340e69e','4bac307c43c3499794b367614d7fac5f',2,'8:30','9:00','社会情绪主题','SEL','陈亚楠','门娜/张欢'),('e609e5122a034af9b9c3ed31c7a7f279','4bac307c43c3499794b367614d7fac5f',1,'15:35','15:55','外教户外课堂','OutdoorActivities','Kim/张欢','陈亚楠/门娜/张欢'),('e613c7e266054308aa494c970dd1623b','b8a2048b3b644d5f86b644f808f13a16',0,'8:00','8:30','早餐  Breakfast','','',''),('e6e04379d0d4424cae2a3e16665aded9','16333413b51c43a3bd10996360419425',3,'14:45','15:15','音乐欣赏与音乐基础','Music','常晓燕','于菲'),('e6e0ac203b0049da973393e2f35581e1','bcdac4d1c5d845a48b53369b8436b131',1,'15:50','16:20','','','','yyyy'),('e72b4f1d7e6146a3896a161fe3e961cb','bcdac4d1c5d845a48b53369b8436b131',1,'9:55','10:25','外教讲故事','StoryTelling','Eric/石亚静','王科妮/令狐慧谊'),('e75ebc20793e4820ab579ff2dd21f069','e27e39be3b8e4b74a391a783f922b597',4,'14:00','14:30','播音主持与表演','PublicSpeakingSkills','魏苗','李玲玉'),('e76c3800c83d46e89a0f1d128459980a','33e6bdae311d41a6ac77029ffb3c4c7d',5,'14:30','15:00','艺术手工','ArtsandCrafts','宋秀萍','梁丽/江慧涛'),('e779a6dfaa2b4a4ab7dfb36b0b0b3e6f','047372893e1144cf9a0a15669278ab53',3,'15:50','16:20','户外课堂','OutdoorActivities','唐任姣','刘亚坤/王世鹏'),('e7be0472f5444faeb149867b1a8d91da','16333413b51c43a3bd10996360419425',2,'10:30','11:00','户外课堂','OutdoorActivities','付晓雪','曹艳/于菲'),('e7d77b0a69694f1280e593b07dfa20c0','656ba48667bd48c0b9fb812ab14fbfd4',0,'12:10','14:10','午休   Nap Time','','',''),('e7d7b4b3c14342b8a81da9088875e2b2','e27e39be3b8e4b74a391a783f922b597',3,'14:45','15:15','IVY社团活动','Clubactivities','',''),('e80b1a7ad56d4bd79989e8d43a266716','20ba9953cb534c88a6fdbe92ff93a107',0,'16:35','17:00','晚餐 Dinner','','',''),('e8121402f1434f658834cb329cce6a57','b8a2048b3b644d5f86b644f808f13a16',2,'9:10','9:40','艺术手工','ArtsandCrafts','董绮轩','辛佳怡'),('e849c2dd6ce148329711a99d1dd60555','8e212b16287d476699213b4e3bce4086',3,'15:00','15:30','主题英语','ThemeEnglish','马梦瑶','郭婷婷/原惠慧'),('e87927a165cc4bfb87e31c0f971be41b','bcdac4d1c5d845a48b53369b8436b131',1,'10:30','11:00','主题英语','ThemeEnglish','Eric/石亚静','王科妮/令狐慧谊'),('e88655038c174b33a9e827b933b3ac90','4b5011d1c18a4549af0b89054cfbf197',0,'12:10','14:10','午休   Nap Time','','',''),('e8f76c629dad4a87aa5501709e16d0c4','b8a2048b3b644d5f86b644f808f13a16',4,'8:30','9:00','自由玩耍','FreePlay','辛佳怡',''),('e9032cfa13ee45da8d8d43baed515b0a','e27e39be3b8e4b74a391a783f922b597',3,'10:30','11:00','英文剧','Drama','Dani/孟广鑫','李玲玉/慕海兰'),('e90d34e8353e43a6b47e296193f3a57f','7c9f1583f491433182867ff983c73d33',5,'9:55','10:25','外教生活体验','Cooking','Kim/唐任姣','魏苗/周琳'),('e95ae672486648fbbfa2169f4425c5b2','bcdac4d1c5d845a48b53369b8436b131',5,'9:55','10:25','外教户外课堂','OutdoorActivities','Eric/石亚静','王科妮/令狐慧谊'),('e96c9e164ee94a9cb8605a29e7727d3c','8e212b16287d476699213b4e3bce4086',4,'15:00','15:30','户外课堂','OutdoorActivities','马梦瑶','郭婷婷/原惠慧'),('e9dfe1d658834d09803e02d4fd854b0f','0a543c589d72410e92929d9f224b18cc',1,'14:45','15:15','自由阅读','FreeReading','唐艾艺','杨新'),('ea23fc1d338f449aad10b109d4e45b44','6440ca0e3fbf48218726c7b9bdf491c7',4,'15:50','16:20','外教生活体验','Cooking','石亚静/Tarry','田友美'),('ea8caea27a584c3fb940d9e2414c3509','33e6bdae311d41a6ac77029ffb3c4c7d',1,'9:10','9:40','主题英语','ThemeEnglish','杨国颖','梁丽/江慧涛'),('ead4384ec0a8468186e5329238543167','6440ca0e3fbf48218726c7b9bdf491c7',5,'9:55','10:25','音乐欣赏与音乐基础','Music','潘菲','田友美'),('eb098092d1fe4004a4e6c303089a5c74','20ba9953cb534c88a6fdbe92ff93a107',5,'9:10','9:40','户外活动','OutdoorActivities','马丽','王田田'),('eb200552be684284bb2e60682b7a735c','60b0284aaf9d458ebcc04f47213a769b',5,'9:55','10:25','英文剧','Drama','Joe/张欢','郑丽'),('eb50c602fa46432ca7013f11e2633bd4','8e212b16287d476699213b4e3bce4086',3,'15:35','15:55','主题英语','ThemeEnglish','马梦瑶','郭婷婷/原惠慧'),('eb576cbafec340b389b84190c5b64c6e','a21f951d755842d2b02932379080f892',4,'15:15','15:45','体能训练','Physicaltraining','王强','刘蕊/吴本美'),('eb6fff0b414f46ba9f35d4b2bcaf32a8','4b5011d1c18a4549af0b89054cfbf197',2,'9:55','10:25','音乐启蒙与乐感培养','Music','赵翊彤','潘菲'),('ec58b6ff4f694cdba435f84cbafdeacf','16333413b51c43a3bd10996360419425',3,'15:50','16:20','故事与表演','StoryTelling','杨新','曹艳/于菲'),('eda4e4264ba14cd5886a8a9019c6e9a6','b06ababb8ada44958f6baf8fa20c41d4',5,'15:50','16:20','外教户外课堂','OutdoorActivities','Sean/慕海兰','赵翊彤/尤增强'),('edfcc1bc6e02424e94e46c3c0ecba43d','b8a2048b3b644d5f86b644f808f13a16',3,'8:30','9:00','故事与表演','StoryTelling','杨新','辛佳怡'),('ef5132c72cda4ae6aba488ff1a5e3308','b8a2048b3b644d5f86b644f808f13a16',1,'9:10','9:40','户外活动','OutdoorActivities','辛佳怡',''),('efda3b204d714b66b91fd54f049dddf0','20ba9953cb534c88a6fdbe92ff93a107',4,'10:30','11:00','故事与表演','StoryTelling','杨新','王田田'),('eff764b143bc47fab6f89016883b7d7a','047372893e1144cf9a0a15669278ab53',4,'9:55','10:25','拼音识字','PinYin','李玲玉','刘亚坤/王世鹏'),('f0424a3f521e4fa7b2d5783c8cd79e79','60b0284aaf9d458ebcc04f47213a769b',0,'9:40','9:55','视保操、加餐   Eyes Exercises and Snacks','','',''),('f06759aedcb3452f8efac76afd3ba01f','e27e39be3b8e4b74a391a783f922b597',1,'9:10','9:40','外教讲故事','StoryTelling','Dani/孟广鑫','李玲玉/慕海兰'),('f0bc79cb64dc43d8aad1cd7325f2d642','bcdac4d1c5d845a48b53369b8436b131',2,'15:20','15:50','数学与逻辑','Math&Logic','唐艾艺','令狐慧谊'),('f0d105c712c14e30bfce2fa4528f0af9','b8a2048b3b644d5f86b644f808f13a16',3,'15:20','15:50','外教户外课堂','OutdoorActivities','Eric/付晓雪','辛佳怡'),('f0e0ce300a814d3c82010b5855f074f3','0a543c589d72410e92929d9f224b18cc',0,'16:35','17:00','晚餐 Dinner','','',''),('f1ce9e9ae51c4b0e9bef581d8d06555d','8e212b16287d476699213b4e3bce4086',0,'12:10','14:30','午休   Nap Time','','',''),('f1e87379392143acaf1f7d76c75df3d1','656ba48667bd48c0b9fb812ab14fbfd4',0,'16:35','17:00','晚餐 Dinner','','',''),('f200a0c09ce64ecda4319239bb5a0b95','bcdac4d1c5d845a48b53369b8436b131',0,'9:00','9:10','常青藤武术操   IVY Kongfu Exercises','','',''),('f24e664a61904b479e6753b0310325b5','6440ca0e3fbf48218726c7b9bdf491c7',3,'15:20','15:50','主题英语','ThemeEnglish','石亚静','田友美'),('f2e7489960c8461da2fece42b7dec8bb','8e212b16287d476699213b4e3bce4086',0,'9:00','9:10','常青藤武术操   IVY Kongfu Exercises','','',''),('f3779c372c1e4f25bceaec120feea32d','60b0284aaf9d458ebcc04f47213a769b',0,'9:00','9:10','常青藤武术操   IVY Kongfu Exercises','','',''),('f3a9ddeafdcd4d82892e77dec86b4dc5','047372893e1144cf9a0a15669278ab53',0,'11:15','11:45','午餐   Lunch','','',''),('f43c9a9a20de4d9685384a25f58100d6','a21f951d755842d2b02932379080f892',3,'10:30','11:00','武术','MartialArts','外聘老师','刘蕊/吴本美'),('f48c087625e84e0baa9fd8dae355b609','047372893e1144cf9a0a15669278ab53',3,'9:10','9:40','跆拳道','Taekwondo','外聘老师','刘亚坤/王世鹏'),('f4e17a20649844558a8a10433aea1710','4b5011d1c18a4549af0b89054cfbf197',1,'15:50','16:20','艺术手工(英)','Arts&Crafts','车柳英','潘菲'),('f52ae8c66ff84db5ae98185e77a29239','20ba9953cb534c88a6fdbe92ff93a107',5,'14:45','15:15','主题英语','ThemeEnglish','Joe/马丽','王田田'),('f53d876538dc48eea93ad296730aefaa','60b0284aaf9d458ebcc04f47213a769b',0,'12:10','14:10','午休   Nap Time','','',''),('f56a382ec22b49f2879ae31e2004ac8d','b8a2048b3b644d5f86b644f808f13a16',0,'9:40','9:55','视保操、加餐   Eyes Exercises and Snacks','','',''),('f5736bd406df4054b8c21b51c96306d6','0a543c589d72410e92929d9f224b18cc',2,'14:00','14:30','拼音识字','PinYin','李玲玉','唐艾艺/杨新'),('f6182c6cfe0d47eba3fa00ebfd14cd99','b06ababb8ada44958f6baf8fa20c41d4',5,'15:20','15:50','主题英语','ThemeEnglish','Sean/慕海兰','赵翊彤/尤增强'),('f64730babe454851bbf16893611859f5','0a543c589d72410e92929d9f224b18cc',5,'15:20','15:50','户外活动','OutdoorActivities','唐艾艺','杨新'),('f690d9a66eca40da8e7de2662af8e19e','20ba9953cb534c88a6fdbe92ff93a107',3,'9:55','10:25','国学','TraditionalCulture','吴本美','王田田'),('f6a794ff27214acd9d2dfd2772289eb4','047372893e1144cf9a0a15669278ab53',1,'15:20','15:50','户外课堂','OutdoorActivities','唐任姣','刘亚坤/王世鹏'),('f6e27a210fb44c67a64e3af1d0383101','33e6bdae311d41a6ac77029ffb3c4c7d',2,'15:15','15:45','语言技能','LanguageSkill','张英','梁丽/江慧涛'),('f6e3b31e8c7d4ea28f58d2c15402af84','0a543c589d72410e92929d9f224b18cc',4,'8:30','9:00','主题英语','ThemeEnglish','马丽','杨新'),('f6f52de7c5d84756b231201acc47e73b','60b0284aaf9d458ebcc04f47213a769b',4,'10:30','11:00','武术','MartialArts','外聘老师','郑丽/杨伟伟'),('f716c2aa9cb94c07aed1d1438109b5ef','b06ababb8ada44958f6baf8fa20c41d4',4,'8:30','9:00','数学与逻辑','Math&Logic','王科妮','赵翊彤/尤增强'),('f72fcc5acc9e4ddc9f8dbf6b2b3f20ea','16333413b51c43a3bd10996360419425',4,'9:10','9:40','跆拳道','Taekwondo','外聘老师','曹艳/于菲'),('f76dfaabb2e849e1a4e0511e3ecd8ff1','33e6bdae311d41a6ac77029ffb3c4c7d',1,'8:30','9:00','英文剧','Drama','杨国颖','梁丽/江慧涛'),('f7f790376a6e4fd6bdcd16db2500a154','60b0284aaf9d458ebcc04f47213a769b',3,'15:15','15:45','美术','ArtandDrawing','朱夏清','郑丽/杨伟伟'),('f8000ec0c34f4c9293f990c0f49f62d7','656ba48667bd48c0b9fb812ab14fbfd4',3,'15:50','16:20','外教科学实验','ScienceActivities','Dani/孟广鑫','赵雨晴/张亚'),('f821c9cea1f94c74915d33e06f73bbdd','b8a2048b3b644d5f86b644f808f13a16',0,'12:10','13:40','午休   Nap Time','','',''),('f879e0169f8f4b80b26a40c7a251fe54','4b5011d1c18a4549af0b89054cfbf197',3,'15:50','16:20','外教生活体验','Cooking','车柳英/Tarry','潘菲'),('f9471988e48b4c8d86bccad5cd8c46a0','0a543c589d72410e92929d9f224b18cc',4,'15:20','15:50','看图说话','PictureDescription','王田田','唐艾艺/杨新'),('f958e3f3037b45a48a2523715b2b5375','6440ca0e3fbf48218726c7b9bdf491c7',1,'9:55','10:25','艺术手工','ArtsandCrafts','董绮轩','田友美'),('f9cca5c71a434fc0b3cc20f5319f2aeb','16333413b51c43a3bd10996360419425',2,'15:20','15:50','国学','TraditionalCulture','吴本美','曹艳/于菲'),('fa61d1a959114a6f8c1a6977cb9f39b3','7c9f1583f491433182867ff983c73d33',4,'9:10','9:40','主题英语','ThemeEnglish','Kim/唐任姣','魏苗/周琳'),('fb0d243c234e4bfe9e7d44ba497e7130','b8a2048b3b644d5f86b644f808f13a16',3,'14:00','14:30','外教手工','Arts&Crafts','Eric/付晓雪','辛佳怡'),('fb243f50b9f64be2aa83fdfc3151c7ef','6440ca0e3fbf48218726c7b9bdf491c7',4,'14:45','15:15','主题英语','ThemeEnglish','石亚静','田友美'),('fbaac11109f144c280b595ba33a6a0e5','e27e39be3b8e4b74a391a783f922b597',2,'14:00','14:30','数学与逻辑','Math&Logic','苏焕',''),('fbeecd49dbdc49c0adfcac2408499365','e27e39be3b8e4b74a391a783f922b597',2,'14:45','15:15','拼音识字','PinYin','李玲玉',''),('fc8d09ddf0874a54a3b85571038d3a9b','6440ca0e3fbf48218726c7b9bdf491c7',0,'16:35','17:00','晚餐 Dinner','','',''),('fd413f05c7e2444c8ab1978ebfe31518','6440ca0e3fbf48218726c7b9bdf491c7',1,'14:00','14:30','主题英语','ThemeEnglish','石亚静','田友美'),('fdb04c23fcc94daa863f1451a61e3ea9','20ba9953cb534c88a6fdbe92ff93a107',0,'11:15','11:45','午餐   Lunch','','',''),('fe0de5290c3944948c75f52c942923fe','a21f951d755842d2b02932379080f892',0,'9:00','9:10','常青藤武术操   IVY Kongfu Exercises','','',''),('fe5bd09bc8654b64b7f2b910bb5f2eef','047372893e1144cf9a0a15669278ab53',0,'13:40','14:00','起床   Get up','','',''),('febb83ea34664215b42bd7e89e055a71','20ba9953cb534c88a6fdbe92ff93a107',2,'14:00','14:30','英文剧','Drama','Joe/马丽',''),('fed8eaf6602145aab96b3621d241b451','bcdac4d1c5d845a48b53369b8436b131',0,'12:10','13:40','午休   Nap Time','','',''),('ff30a8f249e64f2c8b992d3cdd43a418','b8a2048b3b644d5f86b644f808f13a16',4,'10:30','11:00','人体生理与健康习惯','Healthcare','江慧涛',''),('ff40764cde0d451c86efce0c0cb2947b','8e212b16287d476699213b4e3bce4086',4,'10:30','11:00','体育游戏','OutdoorGames','辛佳怡','马梦瑶/郭婷婷/原惠慧');

UNLOCK TABLES;

/*Table structure for table `t_course_item_run` */

DROP TABLE IF EXISTS `t_course_item_run`;

CREATE TABLE `t_course_item_run` (
  `course_item_id` varchar(100) NOT NULL COMMENT '课程项ID',
  `course_schedule_id` varchar(100) DEFAULT NULL COMMENT '课程表ID',
  `z_index` int(2) DEFAULT NULL COMMENT '周几的索引标记',
  `start_time` varchar(10) DEFAULT NULL COMMENT '课程开始时间',
  `end_time` varchar(10) DEFAULT NULL COMMENT '课程结束时间',
  `course_name` varchar(100) DEFAULT NULL COMMENT '课程中文名称',
  `course_ename` varchar(50) DEFAULT NULL COMMENT '课程英文名称',
  `teacher_name` varchar(50) DEFAULT NULL COMMENT '教师中文名字',
  `headmaster` varchar(50) DEFAULT NULL COMMENT '辅教（班主任，副班主任，其它辅教）',
  `week` int(1) DEFAULT NULL COMMENT '课程所属月的第几周',
  PRIMARY KEY (`course_item_id`),
  KEY `fk_course_schedule_item_run_pk_course_schedule_run` (`course_schedule_id`),
  CONSTRAINT `fk_course_schedule_item_run_pk_course_schedule_run` FOREIGN KEY (`course_schedule_id`) REFERENCES `t_course_schedule_run` (`course_schedule_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_course_item_run` */

LOCK TABLES `t_course_item_run` WRITE;

UNLOCK TABLES;

/*Table structure for table `t_course_schedule` */

DROP TABLE IF EXISTS `t_course_schedule`;

CREATE TABLE `t_course_schedule` (
  `course_schedule_id` varchar(100) NOT NULL COMMENT '课程表ID',
  `title` varchar(50) DEFAULT NULL COMMENT '课表标题名称',
  `e_title` varchar(50) DEFAULT NULL COMMENT '课表标题英文名称',
  `class_name` varchar(50) DEFAULT NULL COMMENT '班级名称',
  `course_date` varchar(50) DEFAULT NULL COMMENT '课表日期',
  `school_id` bigint(20) DEFAULT NULL COMMENT '学校ID',
  `classes_id` bigint(20) DEFAULT NULL COMMENT '班级ID',
  PRIMARY KEY (`course_schedule_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_course_schedule` */

LOCK TABLES `t_course_schedule` WRITE;

insert  into `t_course_schedule`(`course_schedule_id`,`title`,`e_title`,`class_name`,`course_date`,`school_id`,`classes_id`) values ('047372893e1144cf9a0a15669278ab53','学前三年级哈佛4班课表','SCHEDULE FOR HARVARD 4','哈佛4','2018-01',1,1),('0a543c589d72410e92929d9f224b18cc','学前三年级哈佛2班课表','SCHEDULE FOR HARVARD 2','哈佛2','2018-01',1,1),('16333413b51c43a3bd10996360419425','学前二年级剑桥4班课表','SCHEDULE FOR CAMBRIDGE4','剑桥4','2018-01',1,1),('20ba9953cb534c88a6fdbe92ff93a107','学前二年级剑桥3班课表','SCHEDULE FOR CAMBRIDGE3','剑桥3','2018-01',1,1),('33e6bdae311d41a6ac77029ffb3c4c7d','学前一年级耶鲁4班课表','SCHEDULE FOR YALE 4','耶鲁4','2018-01',1,1),('4b5011d1c18a4549af0b89054cfbf197','学前一年级耶鲁2班课表','SCHEDULE FOR YALE 2','耶鲁2','2018-01',1,1),('4bac307c43c3499794b367614d7fac5f','麻省1班课表','SCHEDULE FOR MASSACHUSETTS 1','麻省1','2018-01',1,1),('60b0284aaf9d458ebcc04f47213a769b','学前一年级耶鲁5班课表','SCHEDULE FOR YALE 5','耶鲁5','2018-01',1,1),('6440ca0e3fbf48218726c7b9bdf491c7','学前二年级剑桥2班课表','SCHEDULE FOR CAMBRIDGE2','剑桥2','2018-01',1,1),('656ba48667bd48c0b9fb812ab14fbfd4','学前一年级耶鲁3班课表','SCHEDULE FOR YALE 3','耶鲁3','2018-01',1,1),('7c9f1583f491433182867ff983c73d33','学前三年级哈佛1班课表','SCHEDULE FOR HARVARD 1','哈佛1','2018-01',1,1),('8e212b16287d476699213b4e3bce4086','麻省2班课表','SCHEDULE FOR MASSACHUSETTS 2','麻省2','2018-01',1,1),('a21f951d755842d2b02932379080f892','学前一年级耶鲁1班课表','SCHEDULE FOR YALE 1','耶鲁1','2018-01',1,1),('b06ababb8ada44958f6baf8fa20c41d4','学前三年级哈佛3班课表','SCHEDULE FOR HARVARD 3','哈佛3','2018-01',1,1),('b8a2048b3b644d5f86b644f808f13a16','学前二年级剑桥1班课表','SCHEDULE FOR CAMBRIDGE1','剑桥1','2018-01',1,1),('bcdac4d1c5d845a48b53369b8436b131','学前二年级剑桥5班课表','SCHEDULE FOR CAMBRIDGE 5','剑桥5','2018-01',1,1),('e27e39be3b8e4b74a391a783f922b597','学前三年级哈佛5班课表','SCHEDULE FOR HARVARD 5','哈佛5','2018-01',1,1);

UNLOCK TABLES;

/*Table structure for table `t_course_schedule_run` */

DROP TABLE IF EXISTS `t_course_schedule_run`;

CREATE TABLE `t_course_schedule_run` (
  `course_schedule_id` varchar(100) NOT NULL COMMENT '课程表ID',
  `title` varchar(50) DEFAULT NULL COMMENT '课表标题名称',
  `e_title` varchar(50) DEFAULT NULL COMMENT '课表标题英文名称',
  `class_name` varchar(50) DEFAULT NULL COMMENT '班级名称',
  `course_date` varchar(50) DEFAULT NULL COMMENT '课表日期',
  `school_id` bigint(20) DEFAULT NULL COMMENT '学校ID',
  `classes_id` bigint(20) DEFAULT NULL COMMENT '班级ID',
  PRIMARY KEY (`course_schedule_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_course_schedule_run` */

LOCK TABLES `t_course_schedule_run` WRITE;

UNLOCK TABLES;

/*Table structure for table `t_dict` */

DROP TABLE IF EXISTS `t_dict`;

CREATE TABLE `t_dict` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `type` varchar(20) DEFAULT NULL COMMENT '类型',
  `name` varchar(50) DEFAULT NULL COMMENT '名称',
  `code` varchar(20) DEFAULT NULL COMMENT '代号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

/*Data for the table `t_dict` */

LOCK TABLES `t_dict` WRITE;

insert  into `t_dict`(`id`,`type`,`name`,`code`) values (1,'Q_TYPE','基本能力习惯','1'),(2,'Q_TYPE','饮食习惯','2'),(3,'Q_TYPE','活动兴趣','3'),(4,'Q_TYPE','交往','4'),(5,'Q_TYPE','孩子需要特别关注的地方','5'),(6,'HOME_RELATION','妈妈','1'),(7,'HOME_RELATION','爸爸','2'),(8,'HOME_RELATION','爷爷','3'),(9,'HOME_RELATION','奶奶','4'),(10,'HOME_RELATION','外公','5'),(11,'HOME_RELATION','外婆','6'),(12,'HOME_RELATION','伯伯','7'),(13,'HOME_RELATION','伯妈','8'),(14,'HOME_RELATION','叔叔','9'),(15,'TC_RELATION1','班主任','1'),(16,'TC_RELATION1','副班主任','2'),(17,'TC_RELATION2','普通教师','1'),(18,'TC_RELATION2','实习教师','2');

UNLOCK TABLES;

/*Table structure for table `t_employee` */

DROP TABLE IF EXISTS `t_employee`;

CREATE TABLE `t_employee` (
  `employee_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '员工ID',
  `emp_number` varchar(20) DEFAULT NULL COMMENT '工号',
  `rel_name` varchar(50) DEFAULT NULL COMMENT '真实姓名',
  `id_number` varchar(20) DEFAULT NULL COMMENT '身份证号',
  `time_card` varchar(30) DEFAULT NULL COMMENT '考勤卡号',
  `sex` tinyint(1) DEFAULT NULL COMMENT '性别(0_女,1_男,2_其它)',
  `birth` date DEFAULT NULL COMMENT '出生日期',
  `nation` varchar(20) DEFAULT NULL COMMENT '民族',
  `political` varchar(10) DEFAULT NULL COMMENT '政治面貌',
  `marriage` tinyint(1) DEFAULT NULL COMMENT '婚姻状况(0_否,1_是)',
  `native_place` varchar(4) DEFAULT NULL COMMENT '籍贯',
  `home_address` varchar(50) DEFAULT NULL COMMENT '家庭住址',
  `contacts` varchar(50) DEFAULT NULL COMMENT '联系人',
  `contacts_phone` varchar(20) DEFAULT NULL COMMENT '联系人电话',
  `personal_hobby` varchar(30) DEFAULT NULL COMMENT '个人爱好',
  `phone` varchar(20) DEFAULT NULL COMMENT '手机号',
  `email` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `worker_type` varchar(50) DEFAULT NULL COMMENT '职工类别',
  `post` varchar(50) DEFAULT NULL COMMENT '岗位',
  `status` tinyint(1) DEFAULT '0' COMMENT '员工状态(0_未启用,1_试用期,2_合同期)',
  `remarks` varchar(50) DEFAULT NULL COMMENT '备注',
  `school_id` bigint(20) DEFAULT NULL COMMENT '学校ID',
  PRIMARY KEY (`employee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_employee` */

LOCK TABLES `t_employee` WRITE;

UNLOCK TABLES;

/*Table structure for table `t_employee_attach` */

DROP TABLE IF EXISTS `t_employee_attach`;

CREATE TABLE `t_employee_attach` (
  `employee_attach_id` bigint(20) NOT NULL COMMENT '员工附属ID',
  `employee_id` bigint(20) NOT NULL COMMENT '员工ID',
  `account_address` varchar(50) DEFAULT NULL COMMENT '户口地址',
  `qualification_cert` varchar(50) DEFAULT NULL COMMENT '老师资格证',
  `education` varchar(30) DEFAULT NULL COMMENT '学历',
  `degree` varchar(30) DEFAULT NULL COMMENT '学位',
  `graduate_school` varchar(50) DEFAULT NULL COMMENT '毕业学校',
  `file_address` varchar(50) DEFAULT NULL COMMENT '档案地址',
  `major` varchar(50) DEFAULT NULL COMMENT '所学专业',
  `graduate_time` date DEFAULT NULL COMMENT '毕业时间',
  `station_level` tinyint(1) DEFAULT NULL COMMENT '岗位级别',
  `technical_title` varchar(50) DEFAULT NULL COMMENT '技术职称',
  PRIMARY KEY (`employee_attach_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_employee_attach` */

LOCK TABLES `t_employee_attach` WRITE;

UNLOCK TABLES;

/*Table structure for table `t_employee_extend` */

DROP TABLE IF EXISTS `t_employee_extend`;

CREATE TABLE `t_employee_extend` (
  `employee_extend_id` bigint(20) NOT NULL COMMENT '员工扩展ID',
  `employee_id` bigint(20) NOT NULL COMMENT '员工ID',
  `internship_start` date DEFAULT NULL COMMENT '实习开始日期',
  `internship_end` date DEFAULT NULL COMMENT '实习结束日期',
  `trial_start` date DEFAULT NULL COMMENT '试用开始日期',
  `trial_end` date DEFAULT NULL COMMENT '试用结束日期',
  `correction_date` date DEFAULT NULL COMMENT '转正日期',
  `entry_date` date DEFAULT NULL COMMENT '入职日期',
  `posts_date` date DEFAULT NULL COMMENT '上岗日期',
  `title_date` date DEFAULT NULL COMMENT '职称日期',
  `contract_start` date DEFAULT NULL COMMENT '合同开始日期',
  `contract_end` date DEFAULT NULL COMMENT '合同结束日期',
  `leave_date` date DEFAULT NULL COMMENT '离职日期',
  `leave_type` varchar(20) DEFAULT NULL COMMENT '离职方式',
  `leave_reasons` varchar(20) DEFAULT NULL COMMENT '离职原因',
  PRIMARY KEY (`employee_extend_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_employee_extend` */

LOCK TABLES `t_employee_extend` WRITE;

UNLOCK TABLES;

/*Table structure for table `t_month_growth_record` */

DROP TABLE IF EXISTS `t_month_growth_record`;

CREATE TABLE `t_month_growth_record` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_month_growth_record` */

LOCK TABLES `t_month_growth_record` WRITE;

UNLOCK TABLES;

/*Table structure for table `t_month_growth_record_auditing` */

DROP TABLE IF EXISTS `t_month_growth_record_auditing`;

CREATE TABLE `t_month_growth_record_auditing` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_month_growth_record_auditing` */

LOCK TABLES `t_month_growth_record_auditing` WRITE;

UNLOCK TABLES;

/*Table structure for table `t_month_growth_record_check` */

DROP TABLE IF EXISTS `t_month_growth_record_check`;

CREATE TABLE `t_month_growth_record_check` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_month_growth_record_check` */

LOCK TABLES `t_month_growth_record_check` WRITE;

UNLOCK TABLES;

/*Table structure for table `t_question_template` */

DROP TABLE IF EXISTS `t_question_template`;

CREATE TABLE `t_question_template` (
  `question_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `question_lable` varchar(50) DEFAULT NULL COMMENT '问题描述',
  `question_type` varchar(10) DEFAULT NULL COMMENT '问题类型(字典表的代号)',
  `element_type` varchar(10) DEFAULT NULL COMMENT '元素类型(1_是否类型，2_描述类型)',
  `index` int(2) DEFAULT NULL COMMENT '序号',
  `status` int(2) DEFAULT '0' COMMENT '问题状态',
  PRIMARY KEY (`question_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

/*Data for the table `t_question_template` */

LOCK TABLES `t_question_template` WRITE;

insert  into `t_question_template`(`question_id`,`question_lable`,`question_type`,`element_type`,`index`,`status`) values (1,'是否有饮白开水习惯','1','1',1,0),(2,'是否会用杯子喝水','1','1',2,0),(3,'是否独睡','1','1',3,0),(4,'是否陪睡','1','1',4,0),(5,'是否尿床','1','1',5,0),(6,'是否自己穿脱衣服','1','1',6,0),(7,'是否由成人穿','1','1',7,0),(8,'玩具玩后是否自己收拾整齐','1','1',8,0),(9,'有无幼儿自己支配的空间','1','1',9,0),(10,'幼儿是否自己如厕大小便','1','1',10,0),(11,'是否由成人把屎/尿','1','1',11,0),(12,'喝水用具','1','1',12,0),(13,'是否经常患病','2','1',1,0),(14,'适应季节、环境的能力如何','2','1',2,0),(15,'是否自己吃饭','2','1',3,0),(16,'是否偏食','2','1',4,0),(17,'有无过敏史','2','1',5,0),(18,'有无抽风史','2','1',6,0),(19,'心理健康方面：是否经常保持情绪愉快','2','1',7,0),(20,'是否任性','2','1',8,0);

UNLOCK TABLES;

/*Table structure for table `t_school` */

DROP TABLE IF EXISTS `t_school`;

CREATE TABLE `t_school` (
  `school_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '学校ID',
  `school_code` varchar(10) DEFAULT NULL COMMENT '学校编码(前2位省份编码，后2位为序号)',
  `school_name` varchar(50) DEFAULT NULL COMMENT '学校名称',
  `province_code` varchar(5) DEFAULT NULL COMMENT '省份编码',
  `province_name` varchar(20) DEFAULT NULL COMMENT '省份名称',
  `address` varchar(50) DEFAULT NULL COMMENT '学校地址',
  `email1` varchar(50) DEFAULT NULL COMMENT '学校邮箱1',
  `email2` varchar(50) DEFAULT NULL COMMENT '学校邮箱2',
  `tel1` varchar(20) DEFAULT NULL COMMENT '联系电话1',
  `tel2` varchar(20) DEFAULT NULL COMMENT '联系电话2',
  `fax` varchar(20) DEFAULT NULL COMMENT '传真',
  `post` varchar(10) DEFAULT NULL COMMENT '邮编',
  `web` varchar(50) DEFAULT NULL COMMENT '网址',
  `business_license` varchar(20) DEFAULT NULL COMMENT '营业执照统一社会信用代码',
  `create_date` date DEFAULT NULL COMMENT '创办日期',
  PRIMARY KEY (`school_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `t_school` */

LOCK TABLES `t_school` WRITE;

insert  into `t_school`(`school_id`,`school_code`,`school_name`,`province_code`,`province_name`,`address`,`email1`,`email2`,`tel1`,`tel2`,`fax`,`post`,`web`,`business_license`,`create_date`) values (1,NULL,'北京回龙观常青滕智慧幼儿园','11','北京市','回龙观','cqt@qq.com','','18873386529','','12345678','100086','www.cqt.com','11111111','2011-02-12'),(2,NULL,'北京市知春路常青滕分园','11','北京市','北京市知春路113号','cqt@qq.com','','010-8826473','','010-8826473','','www.cqt.com','10000000000001','2010-05-21');

UNLOCK TABLES;

/*Table structure for table `t_student` */

DROP TABLE IF EXISTS `t_student`;

CREATE TABLE `t_student` (
  `student_id` bigint(20) NOT NULL COMMENT '学生ID',
  `stu_name` varchar(50) DEFAULT NULL COMMENT '学生姓名',
  `petname` varchar(50) DEFAULT NULL COMMENT '学生乳名',
  `birth` date DEFAULT NULL COMMENT '出生日期',
  `wstg` int(2) DEFAULT NULL COMMENT '体重',
  `sex` tinyint(2) DEFAULT NULL COMMENT '性别',
  `height` int(3) DEFAULT NULL COMMENT '身高',
  `nation` varchar(20) DEFAULT NULL COMMENT '民族',
  `age` int(3) DEFAULT '0' COMMENT '年龄',
  `home_address` varchar(50) DEFAULT NULL COMMENT '家庭址址',
  `stu_number` varchar(20) DEFAULT NULL COMMENT '学生学号',
  `school_id` bigint(20) DEFAULT NULL COMMENT '所属学校',
  `class_id` bigint(20) DEFAULT NULL COMMENT '所属班级',
  `left_vision` int(11) DEFAULT NULL COMMENT '左眼视力',
  `right_vision` int(11) DEFAULT NULL COMMENT '右眼视力',
  `nature` varchar(50) DEFAULT NULL COMMENT '性格',
  `constitution` varchar(20) DEFAULT NULL COMMENT '体质',
  `contacts` varchar(50) DEFAULT NULL COMMENT '联系人',
  `contacts_phone` varchar(20) DEFAULT NULL COMMENT '联系人电话',
  `contacts_email` varchar(50) DEFAULT NULL COMMENT '联系人邮箱',
  `shuttle_type` varchar(20) DEFAULT NULL COMMENT '接送方式(1_日托自接送,2_日托车接送,3_其他入园方式)',
  `shuttle_supplement` varchar(30) DEFAULT NULL COMMENT '其它入园方式说明',
  PRIMARY KEY (`student_id`),
  KEY `school_student_pk` (`school_id`),
  KEY `class_student_pk` (`class_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_student` */

LOCK TABLES `t_student` WRITE;

UNLOCK TABLES;

/*Table structure for table `t_student_parent` */

DROP TABLE IF EXISTS `t_student_parent`;

CREATE TABLE `t_student_parent` (
  `student_id` bigint(20) NOT NULL COMMENT '学生ID',
  `name` varchar(50) DEFAULT NULL COMMENT '名字',
  `company` varchar(50) DEFAULT NULL COMMENT '公司',
  `education` varchar(30) DEFAULT NULL COMMENT '学历',
  `id_number` varchar(20) DEFAULT NULL COMMENT '身份证号',
  `phone` varchar(20) DEFAULT NULL COMMENT '电话',
  `relation` varchar(20) DEFAULT NULL COMMENT '关系',
  PRIMARY KEY (`student_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_student_parent` */

LOCK TABLES `t_student_parent` WRITE;

UNLOCK TABLES;

/*Table structure for table `t_student_pic` */

DROP TABLE IF EXISTS `t_student_pic`;

CREATE TABLE `t_student_pic` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `student_id` bigint(20) DEFAULT NULL COMMENT '学生ID',
  `photo_path` varchar(100) DEFAULT NULL COMMENT '照片路径',
  `photo_name` varchar(50) DEFAULT NULL COMMENT '照片名称',
  `create_time` datetime DEFAULT NULL COMMENT '照片创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_student_pic` */

LOCK TABLES `t_student_pic` WRITE;

UNLOCK TABLES;

/*Table structure for table `t_student_shuttle` */

DROP TABLE IF EXISTS `t_student_shuttle`;

CREATE TABLE `t_student_shuttle` (
  `shuttle_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `student_id` bigint(20) DEFAULT NULL COMMENT '学生ID',
  `name` varchar(50) DEFAULT NULL COMMENT '接送人姓名',
  `phone` varchar(20) DEFAULT NULL COMMENT '接送人电话',
  `id_number` varchar(20) DEFAULT NULL COMMENT '接送人身份证号',
  `relation` varchar(20) DEFAULT NULL COMMENT '与学生关系',
  `index` int(2) DEFAULT NULL COMMENT '序号',
  PRIMARY KEY (`shuttle_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_student_shuttle` */

LOCK TABLES `t_student_shuttle` WRITE;

UNLOCK TABLES;

/*Table structure for table `t_teacher` */

DROP TABLE IF EXISTS `t_teacher`;

CREATE TABLE `t_teacher` (
  `teacher_id` bigint(20) NOT NULL COMMENT '教师ID',
  `employee_id` bigint(20) DEFAULT NULL COMMENT '员工ID',
  `teacher_name` varchar(50) DEFAULT NULL COMMENT '教师名字',
  `course_group_id` bigint(20) DEFAULT NULL COMMENT '老师所属课程组ID',
  `course_group_name` varchar(50) DEFAULT NULL COMMENT '老师所属课程组名称',
  `is_headman` tinyint(1) DEFAULT NULL COMMENT '是否是学科组长',
  PRIMARY KEY (`teacher_id`),
  KEY `fk_teacher_pk_employee` (`employee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_teacher` */

LOCK TABLES `t_teacher` WRITE;

UNLOCK TABLES;

/*Table structure for table `t_teacher_classes` */

DROP TABLE IF EXISTS `t_teacher_classes`;

CREATE TABLE `t_teacher_classes` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `teahcer_id` bigint(20) NOT NULL COMMENT '老师ID',
  `classes_id` bigint(20) NOT NULL COMMENT '班级ID',
  `relation` tinyint(4) DEFAULT NULL COMMENT '教师与班级关系',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_teacher_classes` */

LOCK TABLES `t_teacher_classes` WRITE;

UNLOCK TABLES;

/*Table structure for table `t_week_growth_record` */

DROP TABLE IF EXISTS `t_week_growth_record`;

CREATE TABLE `t_week_growth_record` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `author_id` bigint(20) DEFAULT NULL COMMENT '撰写者ID（对应教师ID）',
  `author_name` varchar(50) DEFAULT NULL COMMENT '撰写者名字（对应教师名字）',
  `classes_id` bigint(20) DEFAULT NULL COMMENT '班级ID',
  `classes_name` varchar(50) DEFAULT NULL COMMENT '班级名称',
  `course_group_id` bigint(20) DEFAULT NULL COMMENT '课程组ID',
  `course_group_name` varchar(50) DEFAULT NULL COMMENT '课程组名称',
  `course_id` bigint(20) DEFAULT NULL COMMENT '课程ID',
  `course_name` varchar(50) DEFAULT NULL COMMENT '课程名称',
  `record_date` varchar(20) DEFAULT NULL COMMENT '记录的年月',
  `record_week` int(1) DEFAULT NULL COMMENT '记录的月周次',
  `content` text COMMENT '教学内容',
  `target` text COMMENT '教学目标',
  `process` text COMMENT '教学过程',
  `method` text COMMENT '教学方法',
  `level` int(1) DEFAULT '0' COMMENT '记录处理级别(0:撰写,1:核对,2:审批,3:完成)',
  `check_num` int(1) DEFAULT '0' COMMENT '核对次数',
  `audit_num` int(1) DEFAULT '0' COMMENT '审批次数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_week_growth_record` */

LOCK TABLES `t_week_growth_record` WRITE;

UNLOCK TABLES;

/*Table structure for table `t_week_growth_record_auditing` */

DROP TABLE IF EXISTS `t_week_growth_record_auditing`;

CREATE TABLE `t_week_growth_record_auditing` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `week_growth_record_id` bigint(20) DEFAULT NULL COMMENT '周记录ID',
  `week_growth_record_check_id` bigint(20) DEFAULT NULL COMMENT '周记录的核对ID',
  `audit_teacher_id` bigint(20) DEFAULT NULL COMMENT '审批者ID（教师ID）',
  `audit_teacher_name` varchar(50) DEFAULT NULL COMMENT '审批者的名字（教师名字）',
  `audit_opinion` varchar(200) DEFAULT NULL COMMENT '审批者意见',
  `index` int(1) DEFAULT NULL COMMENT '审批批次',
  `start_time` datetime DEFAULT NULL COMMENT '审批记录开始时间',
  `finish_time` datetime DEFAULT NULL COMMENT '审批记录完成时间',
  `audit_status` int(1) DEFAULT NULL COMMENT '审批状态(0:成功,1:失败)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_week_growth_record_auditing` */

LOCK TABLES `t_week_growth_record_auditing` WRITE;

UNLOCK TABLES;

/*Table structure for table `t_week_growth_record_check` */

DROP TABLE IF EXISTS `t_week_growth_record_check`;

CREATE TABLE `t_week_growth_record_check` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `week_growth_record_id` bigint(20) DEFAULT NULL COMMENT '周学习记录ID',
  `check_teacher_id` bigint(20) DEFAULT NULL COMMENT '核对者ID（教师ID）',
  `check_teacher_name` varchar(50) DEFAULT NULL COMMENT '核对者的名字（教师名字）',
  `check_opinion` varchar(200) DEFAULT NULL COMMENT '核对意见',
  `index` int(1) DEFAULT NULL COMMENT '核对批次',
  `start_time` datetime DEFAULT NULL COMMENT '核对记录开始时间',
  `finish_time` datetime DEFAULT NULL COMMENT '核对记录完成时间',
  `check_status` int(1) DEFAULT NULL COMMENT '核对状态(0:成功,1:失败)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_week_growth_record_check` */

LOCK TABLES `t_week_growth_record_check` WRITE;

UNLOCK TABLES;

/*Table structure for table `t_week_growth_record_finish` */

DROP TABLE IF EXISTS `t_week_growth_record_finish`;

CREATE TABLE `t_week_growth_record_finish` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `week_growth_record_id` bigint(20) DEFAULT NULL COMMENT '周记录ID',
  `week_growth_record_check_id` bigint(20) DEFAULT NULL COMMENT '周记录的核对ID',
  `week_growth_record_audit_id` bigint(20) DEFAULT NULL COMMENT '周记录的审批ID',
  `author_id` bigint(20) DEFAULT NULL COMMENT '撰写者ID（对应教师ID）',
  `author_name` varchar(50) DEFAULT NULL COMMENT '撰写者名字（对应教师名字）',
  `classes_id` bigint(20) DEFAULT NULL COMMENT '班级ID',
  `classes_name` varchar(50) DEFAULT NULL COMMENT '班级名称',
  `course_group_id` bigint(20) DEFAULT NULL COMMENT '课程组ID',
  `course_group_name` varchar(50) DEFAULT NULL COMMENT '课程组名称',
  `course_id` bigint(20) DEFAULT NULL COMMENT '课程ID',
  `course_name` varchar(50) DEFAULT NULL COMMENT '课程名称',
  `record_date` varchar(20) DEFAULT NULL COMMENT '记录的日期',
  `record_week` int(1) DEFAULT NULL COMMENT '记录的月周次',
  `content` text COMMENT '教学内容',
  `target` text COMMENT '教学目标',
  `process` text COMMENT '教学过程',
  `method` text COMMENT '教学方法',
  `finish_time` datetime DEFAULT NULL COMMENT '完成时间(同审批完成的时间)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_week_growth_record_finish` */

LOCK TABLES `t_week_growth_record_finish` WRITE;

UNLOCK TABLES;

/*Table structure for table `t_year_growth_record` */

DROP TABLE IF EXISTS `t_year_growth_record`;

CREATE TABLE `t_year_growth_record` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_year_growth_record` */

LOCK TABLES `t_year_growth_record` WRITE;

UNLOCK TABLES;

/*Table structure for table `t_year_growth_record_auditing` */

DROP TABLE IF EXISTS `t_year_growth_record_auditing`;

CREATE TABLE `t_year_growth_record_auditing` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主建ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_year_growth_record_auditing` */

LOCK TABLES `t_year_growth_record_auditing` WRITE;

UNLOCK TABLES;

/*Table structure for table `t_year_growth_record_check` */

DROP TABLE IF EXISTS `t_year_growth_record_check`;

CREATE TABLE `t_year_growth_record_check` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_year_growth_record_check` */

LOCK TABLES `t_year_growth_record_check` WRITE;

UNLOCK TABLES;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
