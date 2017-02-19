-- MySQL dump 10.13  Distrib 5.7.11, for osx10.10 (x86_64)
--
-- Host: localhost    Database: xuetangplus_db2
-- ------------------------------------------------------
-- Server version	5.7.13

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permissi_content_type_id_2f476e4b_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add user',2,'add_user'),(5,'Can change user',2,'change_user'),(6,'Can delete user',2,'delete_user'),(7,'Can add permission',3,'add_permission'),(8,'Can change permission',3,'change_permission'),(9,'Can delete permission',3,'delete_permission'),(10,'Can add group',4,'add_group'),(11,'Can change group',4,'change_group'),(12,'Can delete group',4,'delete_group'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add user has course',7,'add_userhascourse'),(20,'Can change user has course',7,'change_userhascourse'),(21,'Can delete user has course',7,'delete_userhascourse'),(22,'Can add follow user',8,'add_followuser'),(23,'Can change follow user',8,'change_followuser'),(24,'Can delete follow user',8,'delete_followuser'),(25,'Can add bbs post',9,'add_bbspost'),(26,'Can change bbs post',9,'change_bbspost'),(27,'Can delete bbs post',9,'delete_bbspost'),(28,'Can add bbs course',10,'add_bbscourse'),(29,'Can change bbs course',10,'change_bbscourse'),(30,'Can delete bbs course',10,'delete_bbscourse'),(31,'Can add bbs user',11,'add_bbsuser'),(32,'Can change bbs user',11,'change_bbsuser'),(33,'Can delete bbs user',11,'delete_bbsuser'),(34,'Can add user like post',12,'add_userlikepost'),(35,'Can change user like post',12,'change_userlikepost'),(36,'Can delete user like post',12,'delete_userlikepost'),(37,'Can add user follow post',13,'add_userfollowpost'),(38,'Can change user follow post',13,'change_userfollowpost'),(39,'Can delete user follow post',13,'delete_userfollowpost'),(40,'Can add user has node',14,'add_userhasnode'),(41,'Can change user has node',14,'change_userhasnode'),(42,'Can delete user has node',14,'delete_userhasnode'),(43,'Can add user follow label',15,'add_userfollowlabel'),(44,'Can change user follow label',15,'change_userfollowlabel'),(45,'Can delete user follow label',15,'delete_userfollowlabel'),(46,'Can add course label',16,'add_courselabel'),(47,'Can change course label',16,'change_courselabel'),(48,'Can delete course label',16,'delete_courselabel'),(49,'Can add user dislike course',17,'add_userdislikecourse'),(50,'Can change user dislike course',17,'change_userdislikecourse'),(51,'Can delete user dislike course',17,'delete_userdislikecourse');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `first_name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(254) COLLATE utf8_unicode_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$30000$S0cR90YmjH7k$T63/dsDmSNJqkRMT8zbOypckY26s7+XnSZOzh2670Eo=','2017-02-19 04:48:31.146370',1,'zzq','','','',1,1,'2016-12-07 17:03:09.715683'),(11,'pbkdf2_sha256$30000$lbzngSeQNtRw$ZCYsDANgpzEsMri1rtClW+NIh3Nxt5JlP8EL+h5pywI=','2017-02-02 13:22:55.503225',0,'2014013447','','','',0,1,'2016-12-29 03:17:38.258170'),(12,'pbkdf2_sha256$30000$hLkn6xKW0GTz$WFEXSi1Oum7AD2BGUlfLwVN2QEj2atZ6Gl6vLUEXm1o=','2016-12-29 03:19:45.559757',0,'2014013431','','','',0,1,'2016-12-29 03:19:45.395787'),(13,'pbkdf2_sha256$30000$qUlNbnGUhtvv$MgTWiM7RBCp02T3S1MCTX6jciUfYF6DlFQi9ba/SLKI=','2017-02-19 04:54:00.728077',0,'2014013458','','','',0,1,'2017-01-29 12:37:10.812597'),(14,'pbkdf2_sha256$30000$LupLIEiC5lS4$GzovptVzrct0xzB4WyWmtlMzA80iXrplG6pnMNeKK4U=','2017-02-16 12:33:10.016915',0,'test','','','',0,1,'2017-02-16 12:16:34.960143'),(16,'pbkdf2_sha256$30000$LCew3kU75Qx7$CFtAZUIHW5MmKE5sQLZ262YCk5yeozlDJ5QQ3IoZUI0=','2017-02-19 05:10:10.184427',0,'2014013449','','','',0,1,'2017-02-19 05:10:10.006541');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_perm_permission_id_1fbb5f2c_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_user_user_perm_permission_id_1fbb5f2c_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext COLLATE utf8_unicode_ci,
  `object_repr` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext COLLATE utf8_unicode_ci NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2016-12-07 17:13:48.415815','1','2014013458',2,'[{\"changed\": {\"fields\": [\"U_Image\"]}}]',11,1),(2,'2016-12-18 16:52:46.449482','2','2014013449',2,'[{\"changed\": {\"fields\": [\"U_GPB\"]}}]',11,1),(3,'2016-12-18 17:04:34.228634','2','2014013449',2,'[{\"changed\": {\"fields\": [\"U_Level\", \"U_GPB\"]}}]',11,1),(4,'2016-12-18 17:12:48.475122','1','2014013458',2,'[]',11,1),(5,'2016-12-27 12:06:27.499252','95','鬼铠笔记',2,'[{\"changed\": {\"fields\": [\"P_Type\", \"P_Level\"]}}]',9,1),(6,'2016-12-27 12:06:33.349439','96','次元突破笔记',2,'[{\"changed\": {\"fields\": [\"P_Level\"]}}]',9,1),(7,'2016-12-27 12:06:38.140190','97','月光笔记',2,'[{\"changed\": {\"fields\": [\"P_Level\"]}}]',9,1),(8,'2016-12-27 12:06:42.068007','98','白练笔记',2,'[{\"changed\": {\"fields\": [\"P_Level\"]}}]',9,1),(9,'2016-12-27 12:06:46.833666','99','强袭笔记',2,'[]',9,1),(10,'2016-12-27 12:06:54.259859','100','影舞冲击笔记',2,'[]',9,1),(11,'2016-12-27 12:07:01.929867','95','鬼铠笔记',2,'[]',9,1),(12,'2016-12-27 12:07:06.883320','96','次元突破笔记',2,'[{\"changed\": {\"fields\": [\"P_Type\"]}}]',9,1),(13,'2016-12-27 12:07:25.353947','97','月光笔记',2,'[{\"changed\": {\"fields\": [\"P_Type\"]}}]',9,1),(14,'2016-12-27 12:07:28.176280','96','次元突破笔记',2,'[]',9,1),(15,'2016-12-27 12:07:33.023083','98','白练笔记',2,'[{\"changed\": {\"fields\": [\"P_Type\"]}}]',9,1),(16,'2016-12-27 12:07:38.169529','99','强袭笔记',2,'[{\"changed\": {\"fields\": [\"P_Type\"]}}]',9,1),(17,'2016-12-27 12:07:42.399209','100','影舞冲击笔记',2,'[{\"changed\": {\"fields\": [\"P_Type\"]}}]',9,1),(18,'2016-12-27 12:07:49.440251','101','圣女祈祷笔记',2,'[{\"changed\": {\"fields\": [\"P_Type\", \"P_Level\"]}}]',9,1),(19,'2016-12-27 12:07:59.802042','101','圣女祈祷笔记',2,'[]',9,1),(20,'2016-12-27 12:08:15.257065','102','绯红笔记',2,'[{\"changed\": {\"fields\": [\"P_Type\", \"P_Level\"]}}]',9,1),(21,'2016-12-27 12:08:19.979500','102','绯红笔记',2,'[{\"changed\": {\"fields\": [\"P_Level\"]}}]',9,1),(22,'2016-12-27 12:08:25.028327','103','山吹笔记',2,'[{\"changed\": {\"fields\": [\"P_Type\", \"P_Level\"]}}]',9,1),(23,'2016-12-27 12:08:30.132377','104','雪地狙击笔记',2,'[{\"changed\": {\"fields\": [\"P_Type\", \"P_Level\"]}}]',9,1),(24,'2016-12-27 12:53:41.692635','2','2014013449',2,'[{\"changed\": {\"fields\": [\"U_Image\"]}}]',11,1),(25,'2016-12-27 15:19:26.511695','1','2014013458',2,'[{\"changed\": {\"fields\": [\"U_Identity\"]}}]',11,1),(26,'2016-12-27 16:31:23.325646','1','2014013458',2,'[{\"changed\": {\"fields\": [\"U_GPB\"]}}]',11,1),(27,'2016-12-27 16:36:57.339466','1','2014013458',2,'[{\"changed\": {\"fields\": [\"U_GPB\"]}}]',11,1),(28,'2016-12-28 12:08:16.222047','1','2014013458',3,'',11,1),(29,'2016-12-28 12:18:08.183350','2','2014013458',3,'',2,1),(30,'2016-12-28 12:26:04.003164','15','UserHasCourse object',1,'[{\"added\": {}}]',7,1),(31,'2016-12-28 13:19:02.600464','15','UserHasCourse object',3,'',7,1),(32,'2016-12-28 13:19:02.603989','14','UserHasCourse object',3,'',7,1),(33,'2016-12-28 13:19:02.604894','13','UserHasCourse object',3,'',7,1),(34,'2016-12-28 13:19:02.605639','12','UserHasCourse object',3,'',7,1),(35,'2016-12-28 13:19:02.606465','11','UserHasCourse object',3,'',7,1),(36,'2016-12-28 13:19:02.607250','10','UserHasCourse object',3,'',7,1),(37,'2016-12-28 13:19:02.607995','9','UserHasCourse object',3,'',7,1),(38,'2016-12-28 13:19:02.608580','8','UserHasCourse object',3,'',7,1),(39,'2016-12-28 13:19:02.609319','7','UserHasCourse object',3,'',7,1),(40,'2016-12-28 13:19:02.610063','6','UserHasCourse object',3,'',7,1),(41,'2016-12-28 13:20:13.419405','4','2014013458',3,'',2,1),(42,'2016-12-28 15:40:23.274110','5','2014013458',3,'',2,1),(43,'2016-12-28 15:55:22.931571','5','2014013458',3,'',11,1),(44,'2016-12-28 15:55:29.399472','6','2014013458',3,'',2,1),(45,'2016-12-28 16:56:32.832965','7','2014013458',3,'',2,1),(46,'2016-12-29 00:17:51.191007','41','日语课',2,'[{\"changed\": {\"fields\": [\"P_Type\"]}}]',9,1),(47,'2016-12-29 00:18:24.624441','7','2014013458',2,'[{\"changed\": {\"fields\": [\"U_GPB\"]}}]',11,1),(48,'2016-12-29 00:26:29.921708','128','0提问',2,'[{\"changed\": {\"fields\": [\"P_Type\", \"P_Level\"]}}]',9,1),(49,'2016-12-29 00:27:13.808445','128','0提问',2,'[{\"changed\": {\"fields\": [\"P_Course\"]}}]',9,1),(50,'2016-12-29 03:12:29.248444','3','2014013449',3,'',2,1),(51,'2016-12-29 03:15:31.620359','10','三年级男生网球',3,'',10,1),(52,'2016-12-29 03:15:31.626745','9','外国工艺美术史',3,'',10,1),(53,'2016-12-29 03:15:31.630228','8','多元文化中的音乐现象',3,'',10,1),(54,'2016-12-29 03:15:31.632980','7','大学生音乐知识与欣赏',3,'',10,1),(55,'2016-12-29 03:15:31.635686','6','环境保护与可持续发展',3,'',10,1),(56,'2016-12-29 03:15:31.638025','5','软件理论基础(2):函数式语言程序设计',3,'',10,1),(57,'2016-12-29 03:15:31.640354','4','计算机与网络体系结构（2）',3,'',10,1),(58,'2016-12-29 03:15:31.642605','3','软件工程（3）',3,'',10,1),(59,'2016-12-29 03:15:31.644898','2','计算机与网络体系结构(1)',3,'',10,1),(60,'2016-12-29 03:15:31.647143','1','三年级男生功夫扇',3,'',10,1),(61,'2016-12-29 03:15:48.871915','9','2014013449',3,'',2,1),(62,'2017-01-28 12:09:37.591097','64','UserHasCourse object',1,'[{\"added\": {}}]',7,1),(63,'2017-01-29 12:36:58.285938','8','2014013458',3,'',2,1),(64,'2017-02-01 09:46:27.430043','1','百合',1,'[{\"added\": {}}]',16,1),(65,'2017-02-01 09:46:51.186834','65','UserHasCourse object',1,'[{\"added\": {}}]',7,1),(66,'2017-02-01 09:47:15.112213','1','UserFollowLabel object',1,'[{\"added\": {}}]',15,1),(67,'2017-02-02 12:37:09.265814','2','燃',1,'[{\"added\": {}}]',16,1),(68,'2017-02-02 12:37:22.676480','5','UserFollowLabel object',1,'[{\"added\": {}}]',15,1),(69,'2017-02-02 13:07:05.274125','65','UserHasCourse object',2,'[]',7,1),(70,'2017-02-02 13:20:14.698814','65','UserHasCourse object',3,'',7,1),(71,'2017-02-02 13:20:26.877694','66','UserHasCourse object',1,'[{\"added\": {}}]',7,1),(72,'2017-02-16 12:16:35.049768','14','test',1,'[{\"added\": {}}]',2,1),(73,'2017-02-16 12:16:59.955030','13','test',1,'[{\"added\": {}}]',11,1),(74,'2017-02-19 04:48:41.323383','10','2014013449',3,'',2,1),(75,'2017-02-19 05:05:07.688878','67','UserHasCourse object',1,'[{\"added\": {}}]',7,1),(76,'2017-02-19 05:09:55.159471','15','2014013449',3,'',2,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `model` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(4,'auth','group'),(3,'auth','permission'),(2,'auth','user'),(5,'contenttypes','contenttype'),(6,'sessions','session'),(10,'web','bbscourse'),(9,'web','bbspost'),(11,'web','bbsuser'),(16,'web','courselabel'),(8,'web','followuser'),(17,'web','userdislikecourse'),(15,'web','userfollowlabel'),(13,'web','userfollowpost'),(7,'web','userhascourse'),(14,'web','userhasnode'),(12,'web','userlikepost');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2016-12-07 17:02:48.014286'),(2,'auth','0001_initial','2016-12-07 17:02:48.343245'),(3,'admin','0001_initial','2016-12-07 17:02:48.411307'),(4,'admin','0002_logentry_remove_auto_add','2016-12-07 17:02:48.463123'),(5,'contenttypes','0002_remove_content_type_name','2016-12-07 17:02:48.524554'),(6,'auth','0002_alter_permission_name_max_length','2016-12-07 17:02:48.553527'),(7,'auth','0003_alter_user_email_max_length','2016-12-07 17:02:48.580665'),(8,'auth','0004_alter_user_username_opts','2016-12-07 17:02:48.591998'),(9,'auth','0005_alter_user_last_login_null','2016-12-07 17:02:48.619268'),(10,'auth','0006_require_contenttypes_0002','2016-12-07 17:02:48.620609'),(11,'auth','0007_alter_validators_add_error_messages','2016-12-07 17:02:48.628850'),(12,'auth','0008_alter_user_username_max_length','2016-12-07 17:02:48.655515'),(13,'sessions','0001_initial','2016-12-07 17:02:48.695686'),(14,'web','0001_initial','2016-12-07 17:02:49.173922'),(15,'web','0002_bbspost_p_wanted','2016-12-17 16:10:50.284015'),(16,'web','0003_auto_20161218_0159','2016-12-17 17:59:19.877144'),(17,'web','0004_bbsuser_u_honor','2016-12-18 16:55:36.828832'),(18,'web','0005_userhasnode','2016-12-27 08:19:57.250653'),(19,'web','0006_bbspost_p_level','2016-12-27 11:32:52.808829'),(20,'web','0007_courselabel_userfollowlabel','2017-02-01 09:44:53.217237'),(21,'web','0008_userhascourse_score','2017-02-01 09:44:53.295510'),(22,'web','0009_auto_20170201_1018','2017-02-01 09:44:53.467876'),(23,'web','0010_auto_20170202_2114','2017-02-02 13:14:38.468425'),(24,'web','0011_userdislikecourse','2017-02-02 13:26:31.262422'),(25,'web','0012_bbsuser_u_newuser','2017-02-07 11:55:16.158947');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `session_data` longtext COLLATE utf8_unicode_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_de54fa62` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('1mwh7ovsgwbck66fxz3sktpczp785vvf','YTJkYjViNzYwMWUwMDU2YThkZmUwNzNkNmUzYzliODE5YmUyZGYxMTp7Il9hdXRoX3VzZXJfaGFzaCI6IjVhMTU0Y2RhMmRjYjc3YTA2OGZiZTAyNGI2Yjc4ZDA3NjI5ZDI3NjMiLCJfYXV0aF91c2VyX2lkIjoiMiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=','2017-01-10 17:18:56.646343'),('a0nhm8yihtxpop1w9ezop64ivfeoqv5o','YjkwODFlYThiZWZlYTA5YTNmMTU5OWQzNDdmMzg3MTcxM2FhMmMwOTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNGY4M2Q5NTRlZDNiZjhkZDM0ZGQ0NzAxYjMyZWZiOWRjZGM5MTk0ZiIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2017-01-12 03:12:19.627662'),('himasxjik91unzzijz3imwc2225qv50i','OWRlNTQ0MmFiMzdhMmU2NmY0Njg1MjljNjBiZWVlMzU3NTQ4NmQ4MDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMTFhYjlkMDlkNGZhYWFjYjYyNzU3ODdkYjQzMzk4ZGQzMzJlZWNjMiIsIl9hdXRoX3VzZXJfaWQiOiIxMiJ9','2017-01-12 03:19:45.893728'),('hzq7lgi7wou7dk8fw5h8dngooovilj99','YmI3NmMxODJlMjY5NzIzNjFmOGM1ZjI1NWI4MGVlZWI1OWY0ZWU3OTp7Il9hdXRoX3VzZXJfaGFzaCI6IjRmODNkOTU0ZWQzYmY4ZGQzNGRkNDcwMWIzMmVmYjlkY2RjOTE5NGYiLCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=','2017-01-10 12:00:48.447420'),('mkktpt42ntwn9i27uylbab1z6a29k75d','ZTNlZDcyODlhODdhNDZmZWU3OTRlYmRmYzFhN2FlMjcyN2U1Y2RkNjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0ZjgzZDk1NGVkM2JmOGRkMzRkZDQ3MDFiMzJlZmI5ZGNkYzkxOTRmIn0=','2017-03-05 04:48:31.147888'),('oamynhdcg19gwpe6827027crsyv45nhs','NzJmMWJmMjc4MzM4ZDc2YWRmNjcyMWEzMzY1OTFhNzcyZmU3YWIyODp7Il9hdXRoX3VzZXJfaWQiOiIxNiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiZmU4NmNhMWMyZjRmZmEyYzQ5NTE5NjU2NDE4MGUzNjljNThmMmZhMSJ9','2017-03-05 05:10:10.187054'),('r20aasp7296vagjk73oz3aqtlq34c1cj','YmI3NmMxODJlMjY5NzIzNjFmOGM1ZjI1NWI4MGVlZWI1OWY0ZWU3OTp7Il9hdXRoX3VzZXJfaGFzaCI6IjRmODNkOTU0ZWQzYmY4ZGQzNGRkNDcwMWIzMmVmYjlkY2RjOTE5NGYiLCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=','2017-02-11 12:08:46.087399');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `web_bbscourse`
--

DROP TABLE IF EXISTS `web_bbscourse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_bbscourse` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `C_Name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `C_SeqNum` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `C_Rank` double NOT NULL,
  `C_Ranknum` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `web_bbscourse`
--

LOCK TABLES `web_bbscourse` WRITE;
/*!40000 ALTER TABLE `web_bbscourse` DISABLE KEYS */;
INSERT INTO `web_bbscourse` VALUES (11,'环境保护与可持续发展','2016-2017-1-00050071-90',0,0),(12,'大学生音乐知识与欣赏','2016-2017-1-00780091-90',0,0),(13,'多元文化中的音乐现象','2016-2017-1-00781882-90',3,1),(14,'外国工艺美术史','2016-2017-1-00800042-90',0,0),(15,'三年级男生网球','2016-2017-1-10721041-12',0,0),(16,'计算机与网络体系结构(1)','2016-2017-1-34100294-0',0,0),(17,'软件工程（3）','2016-2017-1-34100325-0',0,0),(18,'计算机与网络体系结构（2）','2016-2017-1-34100344-0',0,0),(19,'软件理论基础(2):函数式语言程序设计','2016-2017-1-34100352-0',0,0),(20,'电影文化','2016-2017-1-00670143-90',5,1),(21,'大学生心理训练与潜能开发','2016-2017-1-02070071-96',0,0),(22,'计量经济学','2016-2017-1-00510513-2',0,0),(23,'公共财政学','2016-2017-1-00510523-0',0,0),(24,'三年级男生篮球提高课','2016-2017-1-10721011-1',0,0);
/*!40000 ALTER TABLE `web_bbscourse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `web_bbspost`
--

DROP TABLE IF EXISTS `web_bbspost`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_bbspost` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `P_Type` int(11) NOT NULL,
  `P_Title` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `P_Content` longtext COLLATE utf8_unicode_ci NOT NULL,
  `P_Time` datetime(6) NOT NULL,
  `P_LastComTime` datetime(6) NOT NULL,
  `P_LikeNum` int(11) NOT NULL,
  `P_Section` int(11) NOT NULL,
  `P_ReplyNum` int(11) NOT NULL,
  `P_Top` int(11) NOT NULL,
  `P_Course_id` int(11) NOT NULL,
  `P_Parent_id` int(11) DEFAULT NULL,
  `P_User_id` int(11) NOT NULL,
  `P_Wanted` int(11) NOT NULL,
  `P_BestChild_id` int(11) DEFAULT NULL,
  `P_Level` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `web_bbspost_P_Course_id_6173fade_fk_web_bbscourse_id` (`P_Course_id`),
  KEY `web_bbspost_01d48799` (`P_User_id`),
  KEY `web_bbspost_P_Parent_id_7711709a_fk_web_bbspost_id` (`P_Parent_id`),
  KEY `web_bbspost_8d4e3b11` (`P_BestChild_id`),
  CONSTRAINT `web_bbspost_P_BestChild_id_b081df58_fk_web_bbspost_id` FOREIGN KEY (`P_BestChild_id`) REFERENCES `web_bbspost` (`id`),
  CONSTRAINT `web_bbspost_P_Course_id_6173fade_fk_web_bbscourse_id` FOREIGN KEY (`P_Course_id`) REFERENCES `web_bbscourse` (`id`),
  CONSTRAINT `web_bbspost_P_Parent_id_7711709a_fk_web_bbspost_id` FOREIGN KEY (`P_Parent_id`) REFERENCES `web_bbspost` (`id`),
  CONSTRAINT `web_bbspost_P_User_id_2eb5c6aa_fk_web_bbsuser_id` FOREIGN KEY (`P_User_id`) REFERENCES `web_bbsuser` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `web_bbspost`
--

LOCK TABLES `web_bbspost` WRITE;
/*!40000 ALTER TABLE `web_bbspost` DISABLE KEYS */;
INSERT INTO `web_bbspost` VALUES (11,0,'【课程评价】好【评分：3.0/5.0】','好','2017-02-02 13:20:51.357502','2017-02-02 13:20:51.357514',0,1,0,0,13,NULL,12,0,NULL,0),(12,0,'233','233','2017-02-19 05:04:04.119785','2017-02-19 05:04:04.119795',0,1,0,0,13,NULL,12,0,NULL,0),(13,0,'【课程评价】333【评分：5.0/5.0】','333','2017-02-19 05:06:08.711768','2017-02-19 05:06:08.711782',0,1,0,0,20,NULL,12,0,NULL,0);
/*!40000 ALTER TABLE `web_bbspost` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `web_bbsuser`
--

DROP TABLE IF EXISTS `web_bbsuser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_bbsuser` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `U_studentid` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `U_password` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `U_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `U_RealName` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `U_Major` longtext COLLATE utf8_unicode_ci NOT NULL,
  `U_Description` longtext COLLATE utf8_unicode_ci,
  `U_Image` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `U_Identity` int(11) NOT NULL,
  `U_Level` int(11) NOT NULL,
  `U_GPB` int(11) NOT NULL,
  `U_FollowUserNum` int(11) NOT NULL,
  `U_FollowPostNum` int(11) NOT NULL,
  `U_PostNum` int(11) NOT NULL,
  `U_QuestionNum` int(11) NOT NULL,
  `U_AnswerNum` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `U_Honor` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `U_NewUser` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `web_bbsuser_user_id_04995852_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `web_bbsuser`
--

LOCK TABLES `web_bbsuser` WRITE;
/*!40000 ALTER TABLE `web_bbsuser` DISABLE KEYS */;
INSERT INTO `web_bbsuser` VALUES (10,'2014013447','19950729Liu..','','刘想','软件学院',NULL,'',1,0,0,0,0,0,0,0,11,'',1),(11,'2014013431','thulsa1996','','李书昂','软件学院',NULL,'',1,0,1000000,0,0,0,0,0,12,'',1),(12,'2014013458','vector202chitoge','绘夜城','','',NULL,'13944118_sLmn1Bi.jpeg',1,16,300,0,0,0,0,0,13,'不起眼女主',0),(13,'test','test12345678','233','233','233','233','',1,0,0,0,0,0,0,0,14,'233',1),(15,'2014013449','smile5105500','','','',NULL,'',1,0,0,0,0,0,0,0,16,'',0);
/*!40000 ALTER TABLE `web_bbsuser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `web_courselabel`
--

DROP TABLE IF EXISTS `web_courselabel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_courselabel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `L_Name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `web_courselabel`
--

LOCK TABLES `web_courselabel` WRITE;
/*!40000 ALTER TABLE `web_courselabel` DISABLE KEYS */;
INSERT INTO `web_courselabel` VALUES (1,'百合'),(2,'燃');
/*!40000 ALTER TABLE `web_courselabel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `web_followuser`
--

DROP TABLE IF EXISTS `web_followuser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_followuser` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `User1ID_id` int(11) NOT NULL,
  `User2ID_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `web_followuser_User1ID_id_6cae6afd_fk_web_bbsuser_id` (`User1ID_id`),
  KEY `web_followuser_User2ID_id_7206420e_fk_auth_user_id` (`User2ID_id`),
  CONSTRAINT `web_followuser_User1ID_id_6cae6afd_fk_web_bbsuser_id` FOREIGN KEY (`User1ID_id`) REFERENCES `web_bbsuser` (`id`),
  CONSTRAINT `web_followuser_User2ID_id_7206420e_fk_auth_user_id` FOREIGN KEY (`User2ID_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `web_followuser`
--

LOCK TABLES `web_followuser` WRITE;
/*!40000 ALTER TABLE `web_followuser` DISABLE KEYS */;
/*!40000 ALTER TABLE `web_followuser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `web_userdislikecourse`
--

DROP TABLE IF EXISTS `web_userdislikecourse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_userdislikecourse` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `CourseID_id` int(11) NOT NULL,
  `UserID_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `web_userdislikecourse_CourseID_id_d642fb52_fk_web_bbscourse_id` (`CourseID_id`),
  KEY `web_userdislikecourse_UserID_id_448fcc56_fk_web_bbsuser_id` (`UserID_id`),
  CONSTRAINT `web_userdislikecourse_CourseID_id_d642fb52_fk_web_bbscourse_id` FOREIGN KEY (`CourseID_id`) REFERENCES `web_bbscourse` (`id`),
  CONSTRAINT `web_userdislikecourse_UserID_id_448fcc56_fk_web_bbsuser_id` FOREIGN KEY (`UserID_id`) REFERENCES `web_bbsuser` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `web_userdislikecourse`
--

LOCK TABLES `web_userdislikecourse` WRITE;
/*!40000 ALTER TABLE `web_userdislikecourse` DISABLE KEYS */;
INSERT INTO `web_userdislikecourse` VALUES (1,11,12),(2,11,12),(3,24,12),(4,15,12),(5,16,12),(6,13,15),(7,13,15),(8,11,15),(9,23,15);
/*!40000 ALTER TABLE `web_userdislikecourse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `web_userfollowlabel`
--

DROP TABLE IF EXISTS `web_userfollowlabel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_userfollowlabel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `LabelID_id` int(11) NOT NULL,
  `UserID_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `web_userfollowlabel_LabelID_id_6403f4bb_fk_web_courselabel_id` (`LabelID_id`),
  KEY `web_userfollowlabel_UserID_id_a71102d8_fk_web_bbsuser_id` (`UserID_id`),
  CONSTRAINT `web_userfollowlabel_LabelID_id_6403f4bb_fk_web_courselabel_id` FOREIGN KEY (`LabelID_id`) REFERENCES `web_courselabel` (`id`),
  CONSTRAINT `web_userfollowlabel_UserID_id_a71102d8_fk_web_bbsuser_id` FOREIGN KEY (`UserID_id`) REFERENCES `web_bbsuser` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `web_userfollowlabel`
--

LOCK TABLES `web_userfollowlabel` WRITE;
/*!40000 ALTER TABLE `web_userfollowlabel` DISABLE KEYS */;
INSERT INTO `web_userfollowlabel` VALUES (5,2,12),(6,1,12);
/*!40000 ALTER TABLE `web_userfollowlabel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `web_userfollowpost`
--

DROP TABLE IF EXISTS `web_userfollowpost`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_userfollowpost` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `PostID_id` int(11) NOT NULL,
  `UserID_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `web_userfollowpost_PostID_id_e73df2b0_fk_web_bbspost_id` (`PostID_id`),
  KEY `web_userfollowpost_UserID_id_e2501853_fk_web_bbsuser_id` (`UserID_id`),
  CONSTRAINT `web_userfollowpost_PostID_id_e73df2b0_fk_web_bbspost_id` FOREIGN KEY (`PostID_id`) REFERENCES `web_bbspost` (`id`),
  CONSTRAINT `web_userfollowpost_UserID_id_e2501853_fk_web_bbsuser_id` FOREIGN KEY (`UserID_id`) REFERENCES `web_bbsuser` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `web_userfollowpost`
--

LOCK TABLES `web_userfollowpost` WRITE;
/*!40000 ALTER TABLE `web_userfollowpost` DISABLE KEYS */;
/*!40000 ALTER TABLE `web_userfollowpost` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `web_userhascourse`
--

DROP TABLE IF EXISTS `web_userhascourse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_userhascourse` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `CourseID_id` int(11) NOT NULL,
  `UserID_id` int(11) NOT NULL,
  `Score` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `web_userhascourse_CourseID_id_506aadc7_fk_web_bbscourse_id` (`CourseID_id`),
  KEY `web_userhascourse_UserID_id_49e5c833_fk_web_bbsuser_id` (`UserID_id`),
  CONSTRAINT `web_userhascourse_CourseID_id_506aadc7_fk_web_bbscourse_id` FOREIGN KEY (`CourseID_id`) REFERENCES `web_bbscourse` (`id`),
  CONSTRAINT `web_userhascourse_UserID_id_49e5c833_fk_web_bbsuser_id` FOREIGN KEY (`UserID_id`) REFERENCES `web_bbsuser` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `web_userhascourse`
--

LOCK TABLES `web_userhascourse` WRITE;
/*!40000 ALTER TABLE `web_userhascourse` DISABLE KEYS */;
INSERT INTO `web_userhascourse` VALUES (49,20,10,0),(50,12,10,0),(51,21,10,0),(52,15,10,0),(53,16,10,0),(54,17,10,0),(55,18,10,0),(56,19,10,0),(57,22,11,0),(58,23,11,0),(59,24,11,0),(60,16,11,0),(61,17,11,0),(62,18,11,0),(63,19,11,0),(66,13,12,3),(67,20,12,5);
/*!40000 ALTER TABLE `web_userhascourse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `web_userhasnode`
--

DROP TABLE IF EXISTS `web_userhasnode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_userhasnode` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `PostID_id` int(11) NOT NULL,
  `UserID_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `web_userhasnode_PostID_id_541498e9_fk_web_bbspost_id` (`PostID_id`),
  KEY `web_userhasnode_UserID_id_1371490f_fk_web_bbsuser_id` (`UserID_id`),
  CONSTRAINT `web_userhasnode_PostID_id_541498e9_fk_web_bbspost_id` FOREIGN KEY (`PostID_id`) REFERENCES `web_bbspost` (`id`),
  CONSTRAINT `web_userhasnode_UserID_id_1371490f_fk_web_bbsuser_id` FOREIGN KEY (`UserID_id`) REFERENCES `web_bbsuser` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `web_userhasnode`
--

LOCK TABLES `web_userhasnode` WRITE;
/*!40000 ALTER TABLE `web_userhasnode` DISABLE KEYS */;
/*!40000 ALTER TABLE `web_userhasnode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `web_userlikepost`
--

DROP TABLE IF EXISTS `web_userlikepost`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_userlikepost` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `PostID_id` int(11) NOT NULL,
  `UserID_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `web_userlikepost_PostID_id_67c9eb49_fk_web_bbspost_id` (`PostID_id`),
  KEY `web_userlikepost_UserID_id_e545ac31_fk_web_bbsuser_id` (`UserID_id`),
  CONSTRAINT `web_userlikepost_PostID_id_67c9eb49_fk_web_bbspost_id` FOREIGN KEY (`PostID_id`) REFERENCES `web_bbspost` (`id`),
  CONSTRAINT `web_userlikepost_UserID_id_e545ac31_fk_web_bbsuser_id` FOREIGN KEY (`UserID_id`) REFERENCES `web_bbsuser` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `web_userlikepost`
--

LOCK TABLES `web_userlikepost` WRITE;
/*!40000 ALTER TABLE `web_userlikepost` DISABLE KEYS */;
/*!40000 ALTER TABLE `web_userlikepost` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-02-19 13:54:29
