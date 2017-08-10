-- MySQL dump 10.13  Distrib 5.7.11, for osx10.10 (x86_64)
--
-- Host: localhost    Database: xuetangplus_db5
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
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add group',1,'add_group'),(2,'Can change group',1,'change_group'),(3,'Can delete group',1,'delete_group'),(4,'Can add user',2,'add_user'),(5,'Can change user',2,'change_user'),(6,'Can delete user',2,'delete_user'),(7,'Can add permission',3,'add_permission'),(8,'Can change permission',3,'change_permission'),(9,'Can delete permission',3,'delete_permission'),(10,'Can add content type',4,'add_contenttype'),(11,'Can change content type',4,'change_contenttype'),(12,'Can delete content type',4,'delete_contenttype'),(13,'Can add honor',5,'add_honor'),(14,'Can change honor',5,'change_honor'),(15,'Can delete honor',5,'delete_honor'),(16,'Can add user report post',6,'add_userreportpost'),(17,'Can change user report post',6,'change_userreportpost'),(18,'Can delete user report post',6,'delete_userreportpost'),(19,'Can add user dislike course',7,'add_userdislikecourse'),(20,'Can change user dislike course',7,'change_userdislikecourse'),(21,'Can delete user dislike course',7,'delete_userdislikecourse'),(22,'Can add user has node',8,'add_userhasnode'),(23,'Can change user has node',8,'change_userhasnode'),(24,'Can delete user has node',8,'delete_userhasnode'),(25,'Can add user follow post',9,'add_userfollowpost'),(26,'Can change user follow post',9,'change_userfollowpost'),(27,'Can delete user follow post',9,'delete_userfollowpost'),(28,'Can add user follow label',10,'add_userfollowlabel'),(29,'Can change user follow label',10,'change_userfollowlabel'),(30,'Can delete user follow label',10,'delete_userfollowlabel'),(31,'Can add user has course',11,'add_userhascourse'),(32,'Can change user has course',11,'change_userhascourse'),(33,'Can delete user has course',11,'delete_userhascourse'),(34,'Can add bbs user',12,'add_bbsuser'),(35,'Can change bbs user',12,'change_bbsuser'),(36,'Can delete bbs user',12,'delete_bbsuser'),(37,'Can add user like course',13,'add_userlikecourse'),(38,'Can change user like course',13,'change_userlikecourse'),(39,'Can delete user like course',13,'delete_userlikecourse'),(40,'Can add user like post',14,'add_userlikepost'),(41,'Can change user like post',14,'change_userlikepost'),(42,'Can delete user like post',14,'delete_userlikepost'),(43,'Can add course label',15,'add_courselabel'),(44,'Can change course label',15,'change_courselabel'),(45,'Can delete course label',15,'delete_courselabel'),(46,'Can add bbs dept',16,'add_bbsdept'),(47,'Can change bbs dept',16,'change_bbsdept'),(48,'Can delete bbs dept',16,'delete_bbsdept'),(49,'Can add bbs post',17,'add_bbspost'),(50,'Can change bbs post',17,'change_bbspost'),(51,'Can delete bbs post',17,'delete_bbspost'),(52,'Can add follow user',18,'add_followuser'),(53,'Can change follow user',18,'change_followuser'),(54,'Can delete follow user',18,'delete_followuser'),(55,'Can add user dislike post',19,'add_userdislikepost'),(56,'Can change user dislike post',19,'change_userdislikepost'),(57,'Can delete user dislike post',19,'delete_userdislikepost'),(58,'Can add bbs course',20,'add_bbscourse'),(59,'Can change bbs course',20,'change_bbscourse'),(60,'Can delete bbs course',20,'delete_bbscourse'),(61,'Can add log entry',21,'add_logentry'),(62,'Can change log entry',21,'change_logentry'),(63,'Can delete log entry',21,'delete_logentry'),(64,'Can add session',22,'add_session'),(65,'Can change session',22,'change_session'),(66,'Can delete session',22,'delete_session');
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
) ENGINE=InnoDB AUTO_INCREMENT=154 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$30000$m53EGFAbGKgd$IkFtahSxNz25Kw00Yd186jkVICsfIbQyablr4sbgPIo=','2017-08-10 12:29:15.776515',1,'superuser','','','',1,1,'2017-07-10 05:10:26.932617'),(4,'pbkdf2_sha256$30000$B0jvLm6PPlxy$1OsVzyBwr8KM3gOrnVCLGN4+Az+YcEfFXb4EMEUDu0c=','2017-08-10 13:40:23.340969',0,'user0','','','',0,1,'2017-08-10 13:01:53.578416'),(5,'pbkdf2_sha256$30000$ndICSsyaJZaU$56+vk027CQ8WEpG0kbsNNTaK/ZCGoHEcWJNM6diK60U=',NULL,0,'user1','','','',0,1,'2017-08-10 13:01:53.670965'),(6,'pbkdf2_sha256$30000$Llk61RQVnojH$IB2xOE5N4sg7yvRFmOI1efAnoX3gSFOCtTOnnN+a4V0=',NULL,0,'user2','','','',0,1,'2017-08-10 13:01:53.754459'),(7,'pbkdf2_sha256$30000$vo0W6yWz8GiY$uT1YGd1h6E6vJ98zwbDl8PsQB3YCcyDKJhth+p5doOc=',NULL,0,'user3','','','',0,1,'2017-08-10 13:01:53.834565'),(8,'pbkdf2_sha256$30000$e9PeHiMyZLbx$cGsanVVOthZ3Muhxi3p9sYTdPXi+CK9gShvi5KWDxiY=',NULL,0,'user4','','','',0,1,'2017-08-10 13:01:53.916667'),(9,'pbkdf2_sha256$30000$2WO0iKnFiDiZ$FwhAI/I/uVwl4J+4dWgIvQES0/VSQFYVu4Nz7v7NMg4=',NULL,0,'user5','','','',0,1,'2017-08-10 13:01:54.007119'),(10,'pbkdf2_sha256$30000$5UayNB5Dzk7r$Ts32LCJc+P54QcuiwEz6CUY0HU8tzRfr37lS16eP/Qc=',NULL,0,'user6','','','',0,1,'2017-08-10 13:01:54.091252'),(11,'pbkdf2_sha256$30000$7WM5ahHbAipS$BGsFwmeI72JpeKfqYaAL6e2a1udbP7BZ0dmABYCZxBM=',NULL,0,'user7','','','',0,1,'2017-08-10 13:01:54.181966'),(12,'pbkdf2_sha256$30000$wL7ZvsL7dMZL$EQQj1P666ePc/EKfiZoxbQEpZX6UaqOHZHVWd7WNET8=',NULL,0,'user8','','','',0,1,'2017-08-10 13:01:54.266042'),(13,'pbkdf2_sha256$30000$RlsNFPB0SH9q$T6APmLrl7zOsyfr3Xz9BWg7vVWsJ1l4x3XVNKpokqSk=',NULL,0,'user9','','','',0,1,'2017-08-10 13:01:54.348932'),(14,'pbkdf2_sha256$30000$OUDaNxJjS5px$3j8tIb6v7BZuhAdcjmsQ3YTQR5EfUR4j1XKmhOfuMo8=',NULL,0,'user10','','','',0,1,'2017-08-10 13:01:54.442769'),(15,'pbkdf2_sha256$30000$I0PyHdw3hWab$z/C2xVJ9dvApErje4BBjcO9Phbyvh1Jqn8GuM0OshC4=',NULL,0,'user11','','','',0,1,'2017-08-10 13:01:54.525624'),(16,'pbkdf2_sha256$30000$V1sHnNVQ90eX$nceV1FiHifAQ+RpySM2KpGcVzzVoStkv2Bg9KSfx3co=',NULL,0,'user12','','','',0,1,'2017-08-10 13:01:54.612569'),(17,'pbkdf2_sha256$30000$YULPdZmwlyAu$d0lUL3RyYH2u2MPf+XRtOmi+gHKP71LygxcmHXXkQsI=',NULL,0,'user13','','','',0,1,'2017-08-10 13:01:54.707630'),(18,'pbkdf2_sha256$30000$btHeqG4Nx6Fm$0W/WH0KeW7F7LAP4BYevaCWtQYLQi9SaFmzCRdhf/Cg=',NULL,0,'user14','','','',0,1,'2017-08-10 13:01:54.794747'),(19,'pbkdf2_sha256$30000$GsB1a31U8CIZ$6qC4z7CHNX75mQG93Ht7Y/QTPVym5L+5haMkwCyuAos=',NULL,0,'user15','','','',0,1,'2017-08-10 13:01:54.885060'),(20,'pbkdf2_sha256$30000$xtfs4TtJEteE$7QvwVbn0aD64rtnMGFjCdSinK5jlWWdYRip5eoMRL9A=',NULL,0,'user16','','','',0,1,'2017-08-10 13:01:54.972001'),(21,'pbkdf2_sha256$30000$xz1DAPqAs7k1$cLAyYQVtiEUnPHsBBPPmmAxloheN/gx5rl+pWTjRviw=',NULL,0,'user17','','','',0,1,'2017-08-10 13:01:55.054491'),(22,'pbkdf2_sha256$30000$keHhQcSexHRQ$mTDV7XR8/GLokshFMbej2P8HCAzVbv3ugVUy1BbRa9Q=',NULL,0,'user18','','','',0,1,'2017-08-10 13:01:55.139977'),(23,'pbkdf2_sha256$30000$meNI5N1qgMvm$GnVa6H3zuzMZvpfzl1e+QjAf0OhsRAsNOMmVzR/Liks=',NULL,0,'user19','','','',0,1,'2017-08-10 13:01:55.223202'),(24,'pbkdf2_sha256$30000$DYmxHtYqupSu$827EBDcwnBvflK4hrmQJBgdOlurkoiNgT/iuQ/BUfcI=','2017-08-10 13:09:56.805668',0,'user20','','','',0,1,'2017-08-10 13:01:55.310185'),(25,'pbkdf2_sha256$30000$ovhq0QGX99VS$g6vPEkr+c3/vilMxttFztlO05bQT9mJ48XvMJ9eOz4I=',NULL,0,'user21','','','',0,1,'2017-08-10 13:01:55.394928'),(26,'pbkdf2_sha256$30000$6onNNu9uLhEy$ADw5lz7csbot4dyBHYazNTTQBnCGXIqzxPTfr03p8V0=',NULL,0,'user22','','','',0,1,'2017-08-10 13:01:55.483772'),(27,'pbkdf2_sha256$30000$JAjzqwZRhNFe$rO9DepptK9G+AQ677ihPpzpFQcQ4pTzmVZ6/ujlrg4U=',NULL,0,'user23','','','',0,1,'2017-08-10 13:01:55.570166'),(28,'pbkdf2_sha256$30000$6V4Ev9kanfC7$dyAMwkAZZ48X5pFgrOlE5cFgReQTvPBmOSzLFFmO+m8=',NULL,0,'user24','','','',0,1,'2017-08-10 13:01:55.677222'),(29,'pbkdf2_sha256$30000$PerezV76uoZI$MgNFdViIosjoirvnLyQHz65sc4m1fhGBjxJsg875iBY=',NULL,0,'user25','','','',0,1,'2017-08-10 13:01:55.766689'),(30,'pbkdf2_sha256$30000$taPpDGMWPyNd$4VdyOsiCrQUY4IE/ZKbxwPuf/rlPMe2oB3eiERjFdoE=',NULL,0,'user26','','','',0,1,'2017-08-10 13:01:55.860418'),(31,'pbkdf2_sha256$30000$SGYZYAyhdXIK$GTdu+oiS8CH0S7zI+ao6UKe8y+YDIfiapu/6/KfTMUk=',NULL,0,'user27','','','',0,1,'2017-08-10 13:01:55.952939'),(32,'pbkdf2_sha256$30000$ImjrIhPuQdT5$ViZ5Ew3zfQlFoQ7C0yTMPXrVkWxd67oQCWkB7rondGA=',NULL,0,'user28','','','',0,1,'2017-08-10 13:01:56.042155'),(33,'pbkdf2_sha256$30000$9uBCUqjxR7FW$MVxtegUExsEVut0fHQrceg+MEOzGtzKHxyd+w1N1e1g=',NULL,0,'user29','','','',0,1,'2017-08-10 13:01:56.141331'),(34,'pbkdf2_sha256$30000$mgALOuee9kh4$S+X5TpLiJeUJcyE4sraC50sIm9riePLhixpuv1mkZuk=',NULL,0,'user30','','','',0,1,'2017-08-10 13:01:56.223584'),(35,'pbkdf2_sha256$30000$C39XEE5MyFHe$NfEKoYTVPDl8pH+68+WNGr+FJjuP41QDDr6WneWZWIs=',NULL,0,'user31','','','',0,1,'2017-08-10 13:01:56.307100'),(36,'pbkdf2_sha256$30000$swqJj9rmheKp$9HnAEqvm1H16dJZqIJ0XTz1KfbY/pQIhIg65cPxEgjk=','2017-08-10 13:26:30.466384',0,'user32','','','',0,1,'2017-08-10 13:01:56.388941'),(37,'pbkdf2_sha256$30000$zkREbgqShDGW$pFeVoKPTlIqwmW+5SsWI8Iw1bJ/U9bf3I6RkSrZI0tg=',NULL,0,'user33','','','',0,1,'2017-08-10 13:01:56.476898'),(38,'pbkdf2_sha256$30000$osKSuAi4OFhr$+QcIX6G9pbq5JZoPE9qUNkLKnYUFfpoOMpqySQiHkPo=','2017-08-10 13:28:52.593102',0,'user34','','','',0,1,'2017-08-10 13:01:56.560801'),(39,'pbkdf2_sha256$30000$4kZJTVnKMpa2$JPrWmvjrh8lji1SVL1n6NQc1sP49RKQcX3EQpqyG7t0=',NULL,0,'user35','','','',0,1,'2017-08-10 13:01:56.647818'),(40,'pbkdf2_sha256$30000$pgHCtUgNABEM$6vlzcWozYWQmE+A29zUs2jtt4RWPu447v7dUat0o0ow=',NULL,0,'user36','','','',0,1,'2017-08-10 13:01:56.734696'),(41,'pbkdf2_sha256$30000$tNVMLadpYiSX$Yxoj4bos+qaGJIH6zaGAJ/JefrwwwlzRcCa9ZADl1e4=',NULL,0,'user37','','','',0,1,'2017-08-10 13:01:56.823533'),(42,'pbkdf2_sha256$30000$ynPKMVnuKQ64$ssSi9nU9oaw4KfOOtUE6vg1n3K42L9bOda+1BnARf5U=',NULL,0,'user38','','','',0,1,'2017-08-10 13:01:56.905640'),(43,'pbkdf2_sha256$30000$ufvmz4WVe7Yv$3qb61u/aEeQMa1wyS+NT2JjiKz1iXcABqbOtJi3MGiE=',NULL,0,'user39','','','',0,1,'2017-08-10 13:01:56.997418'),(44,'pbkdf2_sha256$30000$pHqcBUNoyGrZ$JBjXgcBmdu8XpkvqfLLJuFws0Sq/1+52+GVseS+FKAs=',NULL,0,'user40','','','',0,1,'2017-08-10 13:01:57.080602'),(45,'pbkdf2_sha256$30000$vbsa3kaDlJpx$hXSC1fMqa8/fNHQ/2ZsLlPAUrsfrVuDlH1OVANkVcf4=',NULL,0,'user41','','','',0,1,'2017-08-10 13:01:57.167713'),(46,'pbkdf2_sha256$30000$kdOs0Dm9ltBu$HfIe6wkSVQwi3JcyQAwKVLQ1TW1DkdMYH1HztVcc7Sc=',NULL,0,'user42','','','',0,1,'2017-08-10 13:01:57.250588'),(47,'pbkdf2_sha256$30000$bAbdl6Ig03Sd$DMPuaoLZlHEyv84wGng9/gIW59KNAbIEWE1QIV0pLTU=',NULL,0,'user43','','','',0,1,'2017-08-10 13:01:57.340122'),(48,'pbkdf2_sha256$30000$SaWxVaoNDsAy$dBZXf2c1UQTClNF4KkmVsB0FzM0ASJ40azz3brMFwsI=',NULL,0,'user44','','','',0,1,'2017-08-10 13:01:57.431401'),(49,'pbkdf2_sha256$30000$q2Zi0hbt8BDx$Ey+pG4p9x/RJC2NWpCSu90KYq1c20JR6GELwwN0yMYg=',NULL,0,'user45','','','',0,1,'2017-08-10 13:01:57.528039'),(50,'pbkdf2_sha256$30000$foDeRYPzq9vN$nhFDrwiihSAspSXIrePlqc4mgTMKIIG0RuhqvQhaX8w=',NULL,0,'user46','','','',0,1,'2017-08-10 13:01:57.609783'),(51,'pbkdf2_sha256$30000$iG0knJjIvec1$Lhc1VIkbdWyySsCFzrnPO3EoTyCto2q7G6skSyQMO9A=',NULL,0,'user47','','','',0,1,'2017-08-10 13:01:57.690638'),(52,'pbkdf2_sha256$30000$b3ryVl9IdC7B$USZqvwH84Zfw5FzNWwo7yKCyZu38Q5/iJfWQPg15oHw=',NULL,0,'user48','','','',0,1,'2017-08-10 13:01:57.773105'),(53,'pbkdf2_sha256$30000$hp2ftDw7KZUO$AUXlnELfNz8jg9zpPz6WslwvvCLsOpFU2qmjqrOsRJQ=',NULL,0,'user49','','','',0,1,'2017-08-10 13:01:57.854756'),(54,'pbkdf2_sha256$30000$xawgCqXaG71p$gSz1loqMgRTYrFoitXsqeb4PqNsH/qgSI/VBaPfNTpo=',NULL,0,'user50','','','',0,1,'2017-08-10 13:01:57.941258'),(55,'pbkdf2_sha256$30000$MkltCtpMS4BI$9ch65uSOlMRKo71nd3DVfSIQk0ZHDPqxY8yXKvqxhkY=',NULL,0,'user51','','','',0,1,'2017-08-10 13:01:58.025102'),(56,'pbkdf2_sha256$30000$bvbXnGgNADJL$zSeD3nky9tvvWitaPrINwhtQ3DzMBYvsWTuc03+CjYE=',NULL,0,'user52','','','',0,1,'2017-08-10 13:01:58.111993'),(57,'pbkdf2_sha256$30000$xWPyqciPuLR8$BPanS4eBfCVyIeMjyJR5hgXvrEOTXls3B69dx9Ktr/c=',NULL,0,'user53','','','',0,1,'2017-08-10 13:01:58.197629'),(58,'pbkdf2_sha256$30000$TjL4J3wq4XXw$JZunvRqloC3t2Q8DbVG1vUV6OTbD283AFl/giGYewb4=',NULL,0,'user54','','','',0,1,'2017-08-10 13:01:58.280650'),(59,'pbkdf2_sha256$30000$sJRnnRPQWT5v$6fUaBAcyYjDu1WWcT6EQw4wPLmFdbfDRR7AXwjZT9hQ=',NULL,0,'user55','','','',0,1,'2017-08-10 13:01:58.364049'),(60,'pbkdf2_sha256$30000$QjBoAibuCJk3$3NHng/dCiltXFbB3IpXnjhTDQAKiKrIL0eaosN0GWc8=',NULL,0,'user56','','','',0,1,'2017-08-10 13:01:58.449557'),(61,'pbkdf2_sha256$30000$74424AsugIRF$mXAp2uRAqU6HWZQ39Yek01lKbO/mvVnmB7OEaB1RWqM=',NULL,0,'user57','','','',0,1,'2017-08-10 13:01:58.544845'),(62,'pbkdf2_sha256$30000$QOCdm0AbN8Tg$0eQewwTawnqqDyB2S6djGbokHxeI3TqJgaywaSy9sPk=',NULL,0,'user58','','','',0,1,'2017-08-10 13:01:58.627953'),(63,'pbkdf2_sha256$30000$g8yszblpu4C8$M1SY9/xniZeKwijdcewaBcNED5UqKlmREh9OjPPAFlE=',NULL,0,'user59','','','',0,1,'2017-08-10 13:01:58.725757'),(64,'pbkdf2_sha256$30000$8LdPC2UyC6SG$9z27K+I8GU5Fut8wGyZDJCGY9nowHnqX1QsLKyTk7jY=',NULL,0,'user60','','','',0,1,'2017-08-10 13:01:58.826464'),(65,'pbkdf2_sha256$30000$OUeCjWomEUio$JVlISGmmJOknvY1X4Fz0FYtumYAdw837p2ufBIrxb2E=',NULL,0,'user61','','','',0,1,'2017-08-10 13:01:58.913637'),(66,'pbkdf2_sha256$30000$h5Bo2ZzlDuKf$+BfhfjQaaxVxchoqNd7wlcohN3yn5XK+TdRVq2qtfy0=',NULL,0,'user62','','','',0,1,'2017-08-10 13:01:58.996537'),(67,'pbkdf2_sha256$30000$Uzo624lDA7ZB$Io5LmYhCVwSnavbRBTlvrXFJYG6yGdk3Cc6eOdcbmVU=',NULL,0,'user63','','','',0,1,'2017-08-10 13:01:59.077439'),(68,'pbkdf2_sha256$30000$3afN8yWK99bn$UMStXM3x7iZ6yzAGpz6SwsA1+7y9VDTo9GyLh94Bm24=',NULL,0,'user64','','','',0,1,'2017-08-10 13:01:59.162164'),(69,'pbkdf2_sha256$30000$wLrSOjJjInnI$oP4RcTZ9Oswnd+zITcMkhFSHY6y4nPoH1CHprXZM/Hw=',NULL,0,'user65','','','',0,1,'2017-08-10 13:01:59.249442'),(70,'pbkdf2_sha256$30000$2Z24q2ISDJdt$eGZ7/o2OypViifSHWmEd9SMt3QpNS6LbynLAwxxzxyU=',NULL,0,'user66','','','',0,1,'2017-08-10 13:01:59.332379'),(71,'pbkdf2_sha256$30000$bBm69lPsavNa$bv3p0ymJwHbYF6MaywQAC0abuDOs4VbS28cdL6gkPFY=',NULL,0,'user67','','','',0,1,'2017-08-10 13:01:59.412559'),(72,'pbkdf2_sha256$30000$S4ukyxwE33ET$evYIIs0315NWlTUdaLSUatSiQooG+YOcCrk7Z6ze5GA=',NULL,0,'user68','','','',0,1,'2017-08-10 13:01:59.495941'),(73,'pbkdf2_sha256$30000$hDpEbqKr1SZ6$cKEwEkgiDcZI6CMpLDDrkG+GZHCceSVhnTRhE0B4bW8=',NULL,0,'user69','','','',0,1,'2017-08-10 13:01:59.579580'),(74,'pbkdf2_sha256$30000$G2IcRn3icMsg$UoqIpYyBeOx7evUtixmU+GOcNVbi3VSc/Acp3JQ2WW8=',NULL,0,'user70','','','',0,1,'2017-08-10 13:01:59.661499'),(75,'pbkdf2_sha256$30000$zxbX8GnHxw0m$s0w9SgouVqDHrLGpGylWqt2MTj7a3bs0JbWRAufHfBI=',NULL,0,'user71','','','',0,1,'2017-08-10 13:01:59.743153'),(76,'pbkdf2_sha256$30000$TvHSQw4HPhmy$/5x3RF3+svr1W7cNmn2aV477z2YFMDnox+88ctAPaM0=',NULL,0,'user72','','','',0,1,'2017-08-10 13:01:59.827050'),(77,'pbkdf2_sha256$30000$Dg1E5RKIO28S$CeQtn9+OuyDNYty86knZZe0nytavKYyrC2DrZoy3yU8=',NULL,0,'user73','','','',0,1,'2017-08-10 13:01:59.938826'),(78,'pbkdf2_sha256$30000$GXhofWoiDevi$oKd8fEKoaJ/JxspueC16iO1OzXRDQdtFkLmxK2+3m6U=',NULL,0,'user74','','','',0,1,'2017-08-10 13:02:00.032053'),(79,'pbkdf2_sha256$30000$eMAZxP1JIdJT$9EMOY/1P9Vn0QXK/Mkdu5hkZFRJ37BPncpqI+teGA5c=',NULL,0,'user75','','','',0,1,'2017-08-10 13:02:00.119887'),(80,'pbkdf2_sha256$30000$3daTpwEUIPSD$063bfKR64eS4lAecS1JhNLBoLLlJqrvyrOSJPZhDsHc=',NULL,0,'user76','','','',0,1,'2017-08-10 13:02:00.228082'),(81,'pbkdf2_sha256$30000$mCluPGhqIWpy$1N9zjSXBFimSjfhQ9AqE1olUB0WDYFdSgKlsNthnzdc=',NULL,0,'user77','','','',0,1,'2017-08-10 13:02:00.308472'),(82,'pbkdf2_sha256$30000$0qbEl6JllrOP$iqpc3KDcXHaZfGgByhMRykPVtWAWBA/bBYSTBEpLLlg=',NULL,0,'user78','','','',0,1,'2017-08-10 13:02:00.393009'),(83,'pbkdf2_sha256$30000$hH9ETX2w1o66$w1ZfwiQHFNfeMD2RDlS5vGDhgmbfCfxNAoSYeR1flzc=',NULL,0,'user79','','','',0,1,'2017-08-10 13:02:00.478025'),(84,'pbkdf2_sha256$30000$mLJHeTUnjt1y$lnXShzljYxy7O5JqTVTD1b2BFjCb2Hq4AaYssh9pSXQ=',NULL,0,'user80','','','',0,1,'2017-08-10 13:02:00.560637'),(85,'pbkdf2_sha256$30000$hKaJsQUEcwGP$Bf5yjGX9zwOxsFjXN5L7I7vwAJMLfSxz38EK167Lhkc=',NULL,0,'user81','','','',0,1,'2017-08-10 13:02:00.643618'),(86,'pbkdf2_sha256$30000$mGR7iLADiiar$1ZhRYFG3biRGdbqLoLfgFw5Qxoh1h6iiorQ6lGlU0bA=',NULL,0,'user82','','','',0,1,'2017-08-10 13:02:00.733107'),(87,'pbkdf2_sha256$30000$361cnNWaTM8A$zJWkothwLlVInn8t1nRum9FPmeZAsemXjbvNR+idNX4=',NULL,0,'user83','','','',0,1,'2017-08-10 13:02:00.817988'),(88,'pbkdf2_sha256$30000$WJVlxyNDdrYB$A64T5qOybpGgUslRbuqv5Lp8LOvZDTbg/i7cLDmrM44=',NULL,0,'user84','','','',0,1,'2017-08-10 13:02:00.902722'),(89,'pbkdf2_sha256$30000$bS17A6JbC6b8$bzdmsDiFFno6y9C7dGw2DFmSYmucLFST52SSU6M11TQ=',NULL,0,'user85','','','',0,1,'2017-08-10 13:02:00.986909'),(90,'pbkdf2_sha256$30000$LZpOHs0QOA8b$o9G4glQZIBV9GpJPYynodwyNIv7/++Kdq/1fAnXOjUQ=',NULL,0,'user86','','','',0,1,'2017-08-10 13:02:01.069836'),(91,'pbkdf2_sha256$30000$koJ9Qpq1gz2s$TMIlMpqqEJ1jxsjIDSxK+a/WlLh6Evcd+l57b1Lc3S0=',NULL,0,'user87','','','',0,1,'2017-08-10 13:02:01.152572'),(92,'pbkdf2_sha256$30000$1rWTsghbk2vc$7ed4WKjqqUu3+xfyWbS1JVjQ/yme+ES/zPxm38VLuU4=',NULL,0,'user88','','','',0,1,'2017-08-10 13:02:01.253612'),(93,'pbkdf2_sha256$30000$b6uR8x8a9mct$5giy+ldHR/dWrhTF1WWm6R+6va8Kt1MzpyYXIPHcaGA=',NULL,0,'user89','','','',0,1,'2017-08-10 13:02:01.345486'),(94,'pbkdf2_sha256$30000$FvsSEzWdsK37$711DIN0jJUWSpFNektHup3ChygztdVBfzAxK93RPl6M=',NULL,0,'user90','','','',0,1,'2017-08-10 13:02:01.441113'),(95,'pbkdf2_sha256$30000$XnuKSx2yclnP$+HIX/ECWWHyaYtGqC2Vc8AwVEfzoOETKIYy759tJJcc=',NULL,0,'user91','','','',0,1,'2017-08-10 13:02:01.537534'),(96,'pbkdf2_sha256$30000$GMIeUaBu7MS3$KVxhM4JoHrNRp6O1FfNCLdTZ7lLgIZ6JPEcgJldLpAI=',NULL,0,'user92','','','',0,1,'2017-08-10 13:02:01.630479'),(97,'pbkdf2_sha256$30000$PetB4o3pWhRa$JLBM+XcDjN1T7aNmosnh5PKaETP1JjtOQnK+ihxwwT8=',NULL,0,'user93','','','',0,1,'2017-08-10 13:02:01.729311'),(98,'pbkdf2_sha256$30000$VG8NeMS5B1Y6$ZiQrpJ9nY5qj2kfTOudr6fBoeQ9JYmJXT3EFCcdFNb0=',NULL,0,'user94','','','',0,1,'2017-08-10 13:02:01.824968'),(99,'pbkdf2_sha256$30000$mS0FgGRdEduB$DfZ0UN/v0AwyZv/ssHLk8f8iAbC8H66uftOrEs4hmns=',NULL,0,'user95','','','',0,1,'2017-08-10 13:02:01.920452'),(100,'pbkdf2_sha256$30000$vJ2ghETCdvpW$CC/KLSabpYMBrkNH6gLwP9tEAvPBx2rvgG7YBOLarfs=',NULL,0,'user96','','','',0,1,'2017-08-10 13:02:02.014022'),(101,'pbkdf2_sha256$30000$0O1Lr8nNYnFJ$ffkWBL9VzHmv06IJ4VV9qqkCxSp4DxLxNPjkapPOdMQ=',NULL,0,'user97','','','',0,1,'2017-08-10 13:02:02.114984'),(102,'pbkdf2_sha256$30000$P2ZlsqwE2f0u$FZmTECnDiVzHqj0MCBhg9+2yJKG0/MO24y8SQ9TedC8=',NULL,0,'user98','','','',0,1,'2017-08-10 13:02:02.200190'),(103,'pbkdf2_sha256$30000$qdHrVdYyzGTJ$EF/Iwv+pQWpg62dLy8BiZ1B3mI5RLXMOGT4WiagWtrg=',NULL,0,'user99','','','',0,1,'2017-08-10 13:02:02.307038'),(104,'pbkdf2_sha256$30000$EMEQN7GFPbEF$ukRXaXFWJcOZNKHBByAFhdlsM1rUCLhyijqPa6TOS+4=','2017-08-10 13:36:10.316501',0,'user100','','','',0,1,'2017-08-10 13:02:02.403214'),(105,'pbkdf2_sha256$30000$To4XyzFDWRE0$ZSK8iLft6mJP316IJKM/BZZXjUEi3U5tgPhPpsvXoeM=',NULL,0,'user101','','','',0,1,'2017-08-10 13:02:02.489899'),(106,'pbkdf2_sha256$30000$ZeC3CRCO8A43$b4zxYBqSIXeOXzcbfS0W4Qi5X2MyT/CEXRyFIJv7Vn8=',NULL,0,'user102','','','',0,1,'2017-08-10 13:02:02.590387'),(107,'pbkdf2_sha256$30000$tsi4BGDHAru6$eQM1eVF3lyQ/dmHM6HAHdrC+1AoeKsf+SQVPkP1X+Hg=',NULL,0,'user103','','','',0,1,'2017-08-10 13:02:02.689458'),(108,'pbkdf2_sha256$30000$FRRtVrL5caJN$Mvzy4wHyPF9anTT4hQf5GPfR+u/0utXpIU+EhBeIIqI=',NULL,0,'user104','','','',0,1,'2017-08-10 13:02:02.789912'),(109,'pbkdf2_sha256$30000$RRaMe5inolHE$unEUH2CdaKvBXvzEOnVN4RlRxI4mprefMS1dsDbnwq8=',NULL,0,'user105','','','',0,1,'2017-08-10 13:02:02.889005'),(110,'pbkdf2_sha256$30000$AeaNOjsMZ9OZ$ZjIfTx4xT10I2VL12afM2mzdtjZ5ojky90WUMJYjxHk=',NULL,0,'user106','','','',0,1,'2017-08-10 13:02:02.978131'),(111,'pbkdf2_sha256$30000$jUoUg4xtvMlt$xZr2uULOykFq5pFHZYoeZ/fEw/DjUYb1h7ZtQZGU07w=',NULL,0,'user107','','','',0,1,'2017-08-10 13:02:03.066332'),(112,'pbkdf2_sha256$30000$62bOng9pXutZ$7XgxSNYsudrml/tbsOh4Fbo2GtodYdZG8hRMFSJIPMU=',NULL,0,'user108','','','',0,1,'2017-08-10 13:02:03.160718'),(113,'pbkdf2_sha256$30000$QrypekywXr2Z$p/hNh7Q6u+inGIT+M70oWoZPYZExmRBPkIRmsYR6KVo=',NULL,0,'user109','','','',0,1,'2017-08-10 13:02:03.255599'),(114,'pbkdf2_sha256$30000$fMRdV3qZPWTl$AcODu9gA0ezgaqDZKrXkCMWYqRmv80Sna5qf+IsCNrI=',NULL,0,'user110','','','',0,1,'2017-08-10 13:02:03.344971'),(115,'pbkdf2_sha256$30000$hCF6w3lboFP3$+krDuiid5jmyjQfx/1zIimZFEAvCTrImIyK1B97S+5I=',NULL,0,'user111','','','',0,1,'2017-08-10 13:02:03.438821'),(116,'pbkdf2_sha256$30000$XgAFIjGnNd9B$31oOj84FIKY7DenJn8WO16cRKr11fADn54vJZ1joNWA=',NULL,0,'user112','','','',0,1,'2017-08-10 13:02:03.533260'),(117,'pbkdf2_sha256$30000$ZIbOknlcERkd$485xnwN+WldSN3bnMFVdSJOwBGcRYfmaYlKkdSzNQIU=',NULL,0,'user113','','','',0,1,'2017-08-10 13:02:03.626687'),(118,'pbkdf2_sha256$30000$JNd8xR4yrSKz$3khCClrXtfOmSin8eP/yP1t5+S5+BjddtHUcQOsS1KA=',NULL,0,'user114','','','',0,1,'2017-08-10 13:02:03.713988'),(119,'pbkdf2_sha256$30000$ZxZO3TAr9NW4$mIaCk7THgv7jm1dGWbg/KOXYemrxP0D9nGKeJA9h3hI=',NULL,0,'user115','','','',0,1,'2017-08-10 13:02:03.800115'),(120,'pbkdf2_sha256$30000$AFypReiiHuiF$GC7yXkcAO+cWw8RcQbBwFbBS9nHUWwVULNTvrMnjpZ8=',NULL,0,'user116','','','',0,1,'2017-08-10 13:02:03.896570'),(121,'pbkdf2_sha256$30000$5tOjPrl8tYTD$1dEX97Wiv4y7E6KTds4+ndAaiiTLGjr1n+yBkrN6CU8=',NULL,0,'user117','','','',0,1,'2017-08-10 13:02:03.984647'),(122,'pbkdf2_sha256$30000$kngZqfhRWmom$rXxpKb92cK7kZ/455IJm+dG8jaspOTIhn95MBaE/8yg=',NULL,0,'user118','','','',0,1,'2017-08-10 13:02:04.082488'),(123,'pbkdf2_sha256$30000$BAj9bz2TXSf5$atGxPbk2IDJQmUPtulpS2DFfaVxBKFZhjsJdiVJa/Rc=',NULL,0,'user119','','','',0,1,'2017-08-10 13:02:04.185314'),(124,'pbkdf2_sha256$30000$TBsuMeX9I58F$xq3zRdk7llkputoLT1aLQOUxB66PoaP4Aj/039xqVBM=',NULL,0,'user120','','','',0,1,'2017-08-10 13:02:04.275447'),(125,'pbkdf2_sha256$30000$1Jvb84djurVs$5tc6TqSJ3MVI2WQz8hvZtXdkp2we+GfK+h8zt2XCLPw=',NULL,0,'user121','','','',0,1,'2017-08-10 13:02:04.369903'),(126,'pbkdf2_sha256$30000$lPOUEFaEZlNf$zVlTHSEOa7DPqIfBDEO5hoHz8xmPqhbQMQ5OoAwy+u8=',NULL,0,'user122','','','',0,1,'2017-08-10 13:02:04.460181'),(127,'pbkdf2_sha256$30000$J6BFCKsk1Jnh$NBsR8c/uKFx6K3fXZatHHqOJXGBCXiX8y4i8GrtJ2HQ=',NULL,0,'user123','','','',0,1,'2017-08-10 13:02:04.548741'),(128,'pbkdf2_sha256$30000$Edasnkhj5PBJ$MUERU/jDecveD/bT1N26DU7bCjEtRwxabX0Wv2Vz+4c=',NULL,0,'user124','','','',0,1,'2017-08-10 13:02:04.636133'),(129,'pbkdf2_sha256$30000$Hc8oSITCjf7A$tFlD4F46djUrD9buJWaS6ZNLLj9Zsu31GkKyMicPoCs=',NULL,0,'user125','','','',0,1,'2017-08-10 13:02:04.724005'),(130,'pbkdf2_sha256$30000$wMaroMbw3RnZ$0UMuZEdT8fILexC4DK3lPPWqd8/P1v3O8tpbWi6TSuY=',NULL,0,'user126','','','',0,1,'2017-08-10 13:02:04.822205'),(131,'pbkdf2_sha256$30000$zEOiifuJ7szH$i7aHvH+43Xm7cN8UfFivK3z/PgfIYS5bXrUfacTb7ro=',NULL,0,'user127','','','',0,1,'2017-08-10 13:02:04.916419'),(132,'pbkdf2_sha256$30000$4M0onrevgKDV$Y5Yks5vuwlNWW5N9wUvmXmKRgX7GM0Rjm5ixFHNzdVo=',NULL,0,'user128','','','',0,1,'2017-08-10 13:02:05.009968'),(133,'pbkdf2_sha256$30000$RqoWSBcYkGwj$z4uviJXAyyGw4bf3+08aRwT8L0o+rDRqvhWggj4TKmg=',NULL,0,'user129','','','',0,1,'2017-08-10 13:02:05.108147'),(134,'pbkdf2_sha256$30000$WRu6ZZb1vTtD$gvrMy73Ne6shpy7GWNC/4TJbb9340j/rwqn/OVwMvT8=',NULL,0,'user130','','','',0,1,'2017-08-10 13:02:05.206329'),(135,'pbkdf2_sha256$30000$i9qAqlv7Hq5H$l40+uDpzithIEXdos0JzhkqfgnYH4wNg42d7GkkK+3M=',NULL,0,'user131','','','',0,1,'2017-08-10 13:02:05.297814'),(136,'pbkdf2_sha256$30000$30f2cJvpWnFn$BzFgq+UGoXYihaAHbFNYsWeMxsxRPINsBrEyf66yeLE=',NULL,0,'user132','','','',0,1,'2017-08-10 13:02:05.400067'),(137,'pbkdf2_sha256$30000$Rt7zQz9teeDl$unDeAhxqkTZs6aDGtopI+WrK8aOSNXbYkzhkdQAca20=',NULL,0,'user133','','','',0,1,'2017-08-10 13:02:05.494938'),(138,'pbkdf2_sha256$30000$QHbD2bsoi2zK$J22EjNySYGFNJiXY0X/zZTPynmmFSF3K+xUjgdY9bDY=',NULL,0,'user134','','','',0,1,'2017-08-10 13:02:05.587941'),(139,'pbkdf2_sha256$30000$7p6F4aWl9yYG$HFGQvRnYLlzKk4oWqvwij2nxb/rEcxTpMgc6wOzuXAE=',NULL,0,'user135','','','',0,1,'2017-08-10 13:02:05.675121'),(140,'pbkdf2_sha256$30000$6hGNxaRW5mbP$4Z29291CcbZT8pNVUNylnTyToQAHlmmhb6cH0CQOl0U=',NULL,0,'user136','','','',0,1,'2017-08-10 13:02:05.771589'),(141,'pbkdf2_sha256$30000$192EGi0w1Btz$GhIbnB0rY4JoPT/TMBSaIL7ARdcPV2e96lYK3E2cOME=',NULL,0,'user137','','','',0,1,'2017-08-10 13:02:05.866419'),(142,'pbkdf2_sha256$30000$6pVDSFLJM1nf$LYHef1uY5+sdcrdD3/yHfcfbSpZPp9Mhm1kHOLLM9OY=',NULL,0,'user138','','','',0,1,'2017-08-10 13:02:05.965312'),(143,'pbkdf2_sha256$30000$LV3f4q0inMEQ$VbC/RC4pZBLnZDpbhCkKaKEkGKpcO20X4fXl89BHBnQ=',NULL,0,'user139','','','',0,1,'2017-08-10 13:02:06.057017'),(144,'pbkdf2_sha256$30000$cZwK3c5vMthH$YYgUbfON17HtA9cB8wYMKdm0qe1qgTrKtYJX+gqur8Q=','2017-08-10 13:29:21.626890',0,'user140','','','',0,1,'2017-08-10 13:02:06.146357'),(145,'pbkdf2_sha256$30000$LwSSAIhOliDL$QBJYACXKec2KUDZ/FGtX0hkjRPmA+OC/b94wA967QOA=',NULL,0,'user141','','','',0,1,'2017-08-10 13:02:06.247766'),(146,'pbkdf2_sha256$30000$V0ZmK0MUuDSO$zP3rU5ECipwanPzMcyoXnFBVNj5XT5+K+PPvNXkwHy0=',NULL,0,'user142','','','',0,1,'2017-08-10 13:02:06.329991'),(147,'pbkdf2_sha256$30000$oN165PPrY8CO$PaYXw3jtUKU31gdYP+cvsjeLPLoUE7TF1XfoM2dtie8=',NULL,0,'user143','','','',0,1,'2017-08-10 13:02:06.411058'),(148,'pbkdf2_sha256$30000$3CtBgVKDhWn1$5Vc4w97U1FPaCmU3UjGK/4n0aMJ2lTe90MUxIECjRN4=',NULL,0,'user144','','','',0,1,'2017-08-10 13:02:06.506570'),(149,'pbkdf2_sha256$30000$B4BTdPwALNpA$NIwS2UZ0ZT4yYMDT0Hj1krdYMYQM+R9yRq5myEYRykw=',NULL,0,'user145','','','',0,1,'2017-08-10 13:02:06.604693'),(150,'pbkdf2_sha256$30000$ETlbns1Pra6a$q1szJoi5kRSRLlz5x153t1P+LPle4jsPvVlNCTwyofI=',NULL,0,'user146','','','',0,1,'2017-08-10 13:02:06.703161'),(151,'pbkdf2_sha256$30000$qGuXlUdRgDNu$DXxByTP2HltHDqoXk19UPkz+viGVtv7d88G+KQ5JdSQ=',NULL,0,'user147','','','',0,1,'2017-08-10 13:02:06.802993'),(152,'pbkdf2_sha256$30000$05BhvsFtLVeS$xUAHNj2Y+B8TiRztFUuWyZqtQ3uHg0VuGxlnKRp/E3U=',NULL,0,'user148','','','',0,1,'2017-08-10 13:02:06.912044'),(153,'pbkdf2_sha256$30000$jSEyMhHLhCk2$K70oaOcsG23sdjK/MVgD894EagbweRr8USwG+drrKsc=',NULL,0,'user149','','','',0,1,'2017-08-10 13:02:06.997484');
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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2017-07-10 05:45:51.184295','2','test',1,'[{\"added\": {}}]',2,1),(2,'2017-07-10 05:50:29.496993','1','test',1,'[{\"added\": {}}]',12,1),(3,'2017-07-10 05:50:55.609914','3','test2',1,'[{\"added\": {}}]',2,1),(4,'2017-07-10 05:51:14.004640','2','test2',1,'[{\"added\": {}}]',12,1),(5,'2017-07-10 05:52:11.224243','1','UserHasCourse object',1,'[{\"added\": {}}]',11,1),(6,'2017-07-10 05:52:17.907520','2','UserHasCourse object',1,'[{\"added\": {}}]',11,1),(7,'2017-07-10 05:52:24.825129','3','UserHasCourse object',1,'[{\"added\": {}}]',11,1),(8,'2017-07-10 05:52:31.847640','4','UserHasCourse object',1,'[{\"added\": {}}]',11,1),(9,'2017-08-10 13:07:15.558706','2','test2',2,'[{\"changed\": {\"fields\": [\"U_NewUser\"]}}]',12,1),(10,'2017-08-10 13:09:39.243960','1','test',2,'[{\"changed\": {\"fields\": [\"U_NewUser\"]}}]',12,1),(11,'2017-08-10 13:11:57.030975','3','user0',2,'[{\"changed\": {\"fields\": [\"U_NewUser\"]}}]',12,1),(12,'2017-08-10 13:40:47.405927','2','test',3,'',2,1),(13,'2017-08-10 13:40:47.408770','3','test2',3,'',2,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (21,'admin','logentry'),(1,'auth','group'),(3,'auth','permission'),(2,'auth','user'),(4,'contenttypes','contenttype'),(22,'sessions','session'),(20,'web','bbscourse'),(16,'web','bbsdept'),(17,'web','bbspost'),(12,'web','bbsuser'),(15,'web','courselabel'),(18,'web','followuser'),(5,'web','honor'),(7,'web','userdislikecourse'),(19,'web','userdislikepost'),(10,'web','userfollowlabel'),(9,'web','userfollowpost'),(11,'web','userhascourse'),(8,'web','userhasnode'),(13,'web','userlikecourse'),(14,'web','userlikepost'),(6,'web','userreportpost');
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
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2017-07-10 05:09:55.855350'),(2,'auth','0001_initial','2017-07-10 05:09:56.203533'),(3,'web','0001_initial','2017-07-10 05:09:56.714739'),(4,'web','0002_bbspost_p_wanted','2017-07-10 05:09:56.768447'),(5,'web','0003_auto_20161218_0159','2017-07-10 05:09:56.889154'),(6,'web','0004_bbsuser_u_honor','2017-07-10 05:09:56.934374'),(7,'web','0005_userhasnode','2017-07-10 05:09:57.009439'),(8,'web','0006_bbspost_p_level','2017-07-10 05:09:57.063860'),(9,'web','0007_courselabel_userfollowlabel','2017-07-10 05:09:57.158417'),(10,'web','0008_userhascourse_score','2017-07-10 05:09:57.206973'),(11,'web','0009_auto_20170201_1018','2017-07-10 05:09:57.274830'),(12,'web','0010_auto_20170202_2114','2017-07-10 05:09:57.383023'),(13,'web','0011_userdislikecourse','2017-07-10 05:09:57.466466'),(14,'web','0012_bbsuser_u_newuser','2017-07-10 05:09:57.517261'),(15,'web','0013_bbscourse_c_term','2017-07-10 05:09:57.569923'),(16,'web','0014_auto_20170218_1407','2017-07-10 05:09:57.586102'),(17,'web','0015_auto_20170218_1503','2017-07-10 05:09:57.668920'),(18,'web','0016_auto_20170218_1505','2017-07-10 05:09:57.688153'),(19,'web','0017_userlikecourse','2017-07-10 05:09:57.761560'),(20,'web','0018_bbspost_p_dislikenum','2017-07-10 05:09:57.817591'),(21,'web','0019_userreportpost','2017-07-10 05:09:57.894233'),(22,'web','0020_bbscourse_c_comnum','2017-07-10 05:09:57.943545'),(23,'web','0021_honor','2017-07-10 05:09:57.964421'),(24,'web','0022_userdislikepost','2017-07-10 05:09:58.046636'),(25,'web','0023_auto_20170322_1347','2017-07-10 05:09:58.114837'),(26,'web','0024_remove_bbsuser_u_password','2017-07-10 05:09:58.161901'),(27,'web','0025_auto_20170322_2249','2017-07-10 05:09:58.210404'),(28,'web','0026_bbsdept','2017-07-10 05:09:58.231233'),(29,'web','0027_auto_20170710_1229','2017-07-10 05:09:59.120914'),(30,'web','0028_auto_20170710_1238','2017-07-10 05:09:59.163078'),(31,'web','0029_auto_20170710_1239','2017-07-10 05:09:59.200848'),(32,'web','0030_auto_20170710_1252','2017-07-10 05:09:59.241807'),(33,'web','0031_auto_20170710_1257','2017-07-10 05:09:59.305798'),(34,'web','0032_auto_20170710_1258','2017-07-10 05:09:59.380460'),(35,'admin','0001_initial','2017-07-10 05:10:02.220246'),(36,'admin','0002_logentry_remove_auto_add','2017-07-10 05:10:02.274006'),(37,'contenttypes','0002_remove_content_type_name','2017-07-10 05:10:02.595852'),(38,'auth','0002_alter_permission_name_max_length','2017-07-10 05:10:02.641333'),(39,'auth','0003_alter_user_email_max_length','2017-07-10 05:10:02.686695'),(40,'auth','0004_alter_user_username_opts','2017-07-10 05:10:02.707924'),(41,'auth','0005_alter_user_last_login_null','2017-07-10 05:10:02.748817'),(42,'auth','0006_require_contenttypes_0002','2017-07-10 05:10:02.751021'),(43,'auth','0007_alter_validators_add_error_messages','2017-07-10 05:10:02.772748'),(44,'auth','0008_alter_user_username_max_length','2017-07-10 05:10:02.813163'),(45,'sessions','0001_initial','2017-07-10 05:10:02.847528'),(46,'web','0033_auto_20170710_1330','2017-07-10 05:30:31.506590'),(47,'web','0034_auto_20170710_1332','2017-07-10 05:32:48.088106'),(48,'web','0035_auto_20170710_1333','2017-07-10 05:33:20.198519'),(49,'web','0036_auto_20170710_1333','2017-07-10 05:33:43.236449'),(50,'web','0037_auto_20170710_1333','2017-07-10 05:33:53.012258');
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
INSERT INTO `django_session` VALUES ('scgl7q8fdvls8pyejytwmy7vhizlx9i0','N2E1YWMwMGM5NDM0MGFmNjA0Y2I3ODM2ZmIwMjNmYTY5NDcwOTgxMzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2hhc2giOiJkMGI0NzdjM2FmYmE4NTkxOGU1ZGVjYzJlNjk4ZmVjMmU0NWFkMjgwIn0=','2017-07-24 05:34:45.482964'),('tvh65rqtyynfsp0480jgho2ga159zkp9','NGFkNmEzMzFmNDA4YWE1Yzc2MzdmZGE0MDFlYmE0YjllNGQ2NDI1ZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJkMGI0NzdjM2FmYmE4NTkxOGU1ZGVjYzJlNjk4ZmVjMmU0NWFkMjgwIn0=','2017-08-24 12:29:15.781974');
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
  `C_SeqNum` int(11) NOT NULL,
  `C_Rank` decimal(2,1) NOT NULL,
  `C_Ranknum` int(11) NOT NULL,
  `C_Comnum` int(11) NOT NULL,
  `C_CorNum` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `C_Dept` int(11) DEFAULT NULL,
  `C_Exam` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `C_Feature` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `C_Grade` int(11) NOT NULL,
  `C_Guide` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `C_Intro` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `C_Level` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `C_PostG` int(11) NOT NULL,
  `C_Pre` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `C_Snd` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `C_Teacher` varchar(50) COLLATE utf8_unicode_ci,
  `C_Textbook` varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
  `C_UnderG` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=318 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `web_bbscourse`
--

LOCK TABLES `web_bbscourse` WRITE;
/*!40000 ALTER TABLE `web_bbscourse` DISABLE KEYS */;
INSERT INTO `web_bbscourse` VALUES (1,'自然辩证法概论',201,0.0,0,0,'60680021',14,'','',1,'','限:深圳学生选课；新能源、医院管理、化学制药等学术型','',110,'','否','1998990001','',0),(2,'自然辩证法概论',202,0.0,0,0,'60680021',14,'','',1,'','限:深圳学生选课；环境、电机、安全工程','',110,'','否','1998990002','',0),(3,'自然辩证法概论',203,0.0,0,0,'60680021',14,'','',1,'','限:深圳学生选课；精仪、机械、物流','',110,'','否','1998990003','',0),(4,'自然辩证法概论',204,0.0,0,0,'60680021',14,'','',1,'','限:深圳学生选课；计算机、电子','',110,'','否','1998990004','',0),(5,'自然辩证法概论',205,0.0,0,0,'60680021',14,'','',1,'','限:深圳学生选课；自动化、IC','',110,'','否','1998990005','',0),(6,'自然辩证法概论',206,0.0,0,0,'60680021',14,'','',1,'','限:深圳学生选课；材料、中法、生医','',110,'','否','1998990006','',0),(7,'物流地理信息系统',200,0.0,0,0,'70160523',5,'','',3,'','限:深圳学生选课','',40,'','否','1998990007','',0),(8,'高级运筹学',200,0.0,0,0,'70168023',5,'考试','',3,'','限:深圳学生选课','',40,'\"1.Linear programming\r\r2.Probability theory\r\r3.Differential and integral calculus\"','否','1998990008','\"[1] Wayne L. Winston，《Operations Research》， 清华大学出版社（影印版）， 2004.\r\r[2] Thomas H. Cormen et.al，《Introduction to Algorithms》， The MIT Press. 2001. \r\r[3] Edward P.C. Kao，《An Introduction to Stochastic Processes 》， 机械工业出版社（影印版）， 2003. \r\r\"',0),(9,'应用统计学',200,0.0,0,0,'70168033',5,'','',3,'','限:深圳学生选课','',40,'','否','1998990009','',0),(10,'国际组织与全球治理专题研讨',0,0.0,0,0,'90700023',14,'','',3,'','优先:政治学专业学生选课','',21,'','否','1998990010','',0),(11,'心理学入门',90,0.0,0,0,'701271',14,'考试','文化素质核心课',1,'','','',1,'','否','1998990011','',120),(12,'博弈论与行为决策',0,0.0,0,0,'90160122',5,'','',2,'','优先:工业工程学生选课','',40,'','否','1998990012','',0),(13,'工业工程博士生研讨课',0,0.0,0,0,'90160133',5,'','',3,'','网上不选课','',100,'','否','1998990013','',0),(14,'高等概率论I',0,0.0,0,0,'90160143',5,'','',3,'','优先:工业工程、数学系学生选课；先修初等概率论','',30,'','否','1998990014','',0),(15,'高等数理统计 I',0,0.0,0,0,'90160153',5,'','',3,'','优先:工业工程、数学系学生选课；先修初等概率论与数理统计','',30,'','否','1998990015','',0),(16,'政治科学的理论与方法',0,3.0,1,1,'90610403',14,'','',3,'','优先:社科学院学生选课','',10,'','否','1998990016','',0),(17,'经济全球化、中国经济外交政策与经济谈判',0,0.0,0,0,'80700352',14,'','',2,'','优先:政治学专业学生选课','',60,'','否','1998990017','',0),(18,'科学学与科技政策',0,0.0,0,0,'80700362',14,'','',2,'','','',20,'','否','1998990018','',0),(19,'组织管理与评估',0,0.0,0,0,'80700373',14,'','',3,'','限:社会工作专业学生选课','',40,'','否','1998990019','',0),(20,'心理咨询',0,0.0,0,0,'80700403',14,'','',3,'','限:社会工作专业学生选课','',40,'','否','1998990020','',0),(21,'社会保障工作',0,0.0,0,0,'80700413',14,'','',3,'','限:社会工作专业学生选课','',40,'','否','1998990021','',0),(22,'社会工作伦理',0,0.0,0,0,'80700423',14,'','',3,'','限:社会工作专业学生选课','',40,'','否','1998990022','',0),(23,'人类学经典著作导读',0,0.0,0,0,'80700443',14,'','',3,'','优先:社会学专业学生选课','',40,'','否','1998990023','',0),(24,'科技的社会研究',0,0.0,0,0,'80700502',14,'','',2,'','','',20,'','否','1998990024','',0),(25,'高级心理统计学',0,0.0,0,0,'80700572',14,'平时作业 + 课堂表现 + 大作业（机动）','',2,'','限:应用心理专业学生选课','',20,'一元统计基础知识（非必须）','否','1998990025','',0),(26,'国际能源与环境治理概论',0,0.0,0,0,'80700602',14,'','',2,'','限:政治学专业学生选课','',30,'','否','1998990026','',0),(27,'金融经济学与中国金融市场',0,0.0,0,0,'80700612',14,'','',2,'','限:政治学、理论经济学专业学生选课','',33,'','否','1998990027','',0),(28,'互联网经济学',0,0.0,0,0,'80700622',14,'','',2,'','','',30,'','否','1998990028','',0),(29,'应用社会心理学专题',0,0.0,0,0,'80700752',14,'','',2,'','限:应用心理专业学生选课','',40,'','否','1998990029','',0),(30,'消费心理学',0,0.0,0,0,'80700772',14,'','',2,'','优先:心理学专业学生选课','',10,'','否','1998990030','',0),(31,'情绪与决策专题',0,0.0,0,0,'80700783',14,'','',3,'','心理学决策方向','',10,'','否','1998990031','',1),(32,'《资本论》导读',0,0.0,0,0,'80700793',14,'','',3,'','','',30,'','否','1998990032','',0),(33,'视知觉',0,0.0,0,0,'80700802',14,'','',2,'','优先:心理学、外文系学生选课','',15,'','否','1998990033','',0),(34,'时间知觉',0,0.0,0,0,'80700812',14,'','',2,'','优先:心理学、外文系学生选课','',15,'','否','1998990034','',0),(35,'社会科学与数据科学工作坊',0,0.0,0,0,'80700823',14,'','',3,'','至少修习两门以上统计相关课程','',35,'','否','1998990035','',10),(36,'以色列与中东政治',0,0.0,0,0,'80700832',14,'','',2,'','','',50,'','否','1998990036','',0),(37,'中国政治经济案例分析(1)',0,0.0,0,0,'80700841',14,'','',1,'','霍普金斯双硕士项目课程','',20,'','否','1998990037','',0),(38,'政策实践 (一)',0,0.0,0,0,'80700851',14,'','',1,'','霍普金斯双硕士项目课程','',20,'','否','1998990038','',0),(39,'员工支持计划实务',0,0.0,0,0,'80708002',14,'','',2,'','限:应用心理专业学生选课','',40,'','否','1998990039','',0),(40,'高级心理测量',0,0.0,0,0,'80708012',14,'考试','',2,'','限:应用心理专业学生选课','',40,'','否','1998990040','',0),(41,'应用心理专业外语',0,0.0,0,0,'80708021',14,'考核','',1,'','限:应用心理专业学生选课','',40,'','否','1998990041','',0),(42,'离散选择模型及其应用',200,0.0,0,0,'80160352',5,'','',2,'','限:深圳学生选课','',40,'','否','1998990042','',0),(43,'项目管理',200,0.0,0,0,'80168162',5,'','',2,'','限:深圳学生选课','',120,'','否','1998990043','',0),(44,'物流技术与管理职业素养讲座',200,0.0,0,0,'80168171',5,'','',1,'','限:深圳学生选课','',40,'','否','1998990044','',0),(45,'健康心理学',200,0.0,0,0,'80615312',14,'','',2,'','限:深圳学生选课','',50,'','否','1998990045','',0),(46,'社会工作能力与创新领导力',200,0.0,0,0,'80700172',14,'','',2,'','限:深圳学生选课','',31,'','否','1998990046','',0),(47,'科学哲学及原著研读',0,0.0,0,0,'70611662',14,'','',2,'','','',20,'','否','1998990047','',0),(48,'高级政治经济学',0,0.0,0,0,'70612223',14,'','',3,'','','',40,'','否','1998990048','',0),(49,'科学编史学',0,0.0,0,0,'70612302',14,'','',2,'','限:哲学、科学技术史、社会学专业、美术学院学生选课','',20,'','否','1998990049','',0),(50,'体育统计学',0,0.0,0,0,'70612442',14,'上机实践操作和作业','',2,'必须具备从事体育科研工作的专业知识','','',25,'','否','1998990050','',0),(51,'社会统计学 （中级）',0,0.0,0,0,'70612463',14,'','',3,'','优先:社会学专业学生选课','',25,'','否','1998990051','',0),(52,'比较体育',0,0.0,0,0,'70612582',14,'一次书面作业，一次演讲作业。','',2,'','','',40,'','否','1998990052','',0),(53,'人类学研究专题',0,0.0,0,0,'70612603',14,'','',3,'','优先:社会学专业学生选课','',30,'','否','1998990053','',0),(54,'当代国际关系理论',0,0.0,0,0,'70612872',14,'','',2,'','限:政治学专业学生选课','',28,'','否','1998990054','',0),(55,'咨询心理学专题',0,0.0,0,0,'70612883',14,'','',3,'','优先:心理学专业学生选课','',19,'','否','1998990055','',0),(56,'政治经济学专题',0,0.0,0,0,'70613043',14,'\"总成绩=平时成绩60分+ 期末成绩40分\r\r平时成绩60分：3次课堂汇报，每次20分\r\r\"','',3,'','','',30,'','否','1998990056','Anwar Shaikh: Capitalism: Competition， Conflict， Crises， Oxford University Press',0),(57,'社会工作理论',0,0.0,0,0,'70700153',14,'','',3,'','限:社会工作专业学生选课','',40,'','否','1998990057','',0),(58,'科学技术史通史导论',1,0.0,0,0,'70700182',14,'','',2,'','限:哲学、科学技术史、社会学专业学生选课','',20,'','否','1998990058','',0),(59,'科学技术史通史导论',2,0.0,0,0,'70700182',14,'','',2,'','限:美术学院学生选课','',40,'','否','1998990059','',0),(60,'科学社会学：理论与方法',0,0.0,0,0,'70700212',14,'','',2,'','','',20,'','否','1998990060','',0),(61,'临床与咨询心理学研究',0,0.0,0,0,'70700223',14,'','',3,'','心理学系临床与咨询心理学方向','',12,'','否','1998990061','',0),(62,'心理学研究方法专题',0,0.0,0,0,'70700232',14,'','',2,'','优先:社会学、心理学专业学生选课','',30,'','否','1998990062','',0),(63,'心理学导论',0,0.0,0,0,'70700241',14,'','',1,'','限:心理学专业学生选课','',30,'','否','1998990063','',0),(64,'高级心理学研究方法',0,0.0,0,0,'70700272',14,'','',2,'','限:应用心理专业学生选课','',20,'','否','1998990064','',0),(65,'应用心理学专题',0,0.0,0,0,'70700282',14,'','',2,'','限:应用心理专业学生选课','',20,'','否','1998990065','',0),(66,'数理政治经济学',0,0.0,0,0,'70700313',14,'\"期末考试、课后作业及出席率，各占总成绩的60%、30%及10%。\r\r注：出席率不可低于学校规定的最低标准。\"','',3,'','','',20,'本课程要求学生有一定的政治经济学和矩阵数学基础，建议学生先修一些政治经济学及线性代数基础课程。','否','1998990066','\"藤森赖明、李帮喜《马克思经济学与数理分析》社会科学文献出版社2014\r\r\r\r李帮喜《线型经济理论与中国经济的大道路径》(日文)日本经济评论社2015\"',0),(67,'决策精英创意创新政策分析(上)',0,0.0,0,0,'70700321',14,'','',1,'','霍普金斯双硕士项目课程','',35,'','否','1998990067','',0),(68,'经济学研究和写作',0,0.0,0,0,'70700332',14,'','',2,'','','',30,'','否','1998990068','',0),(69,'心理病理与诊断',0,0.0,0,0,'70708002',14,'','',2,'','限:应用心理专业学生选课','',40,'','否','1998990069','',0),(70,'体育理论与方法I（体育教学与改革）',0,0.0,0,0,'70720012',14,'','',2,'','','',25,'','否','1998990070','',0),(71,'体育科学研究的一般过程与方法',0,0.0,0,0,'70720062',14,'','',2,'','','',25,'','否','1998990071','',0),(72,'体育管理',0,0.0,0,0,'70720072',14,'\"项目	分值\r\r出勤	20\r\r分组学习	20\r\r课堂案例讨论	30\r\r本科生	期末闭卷考试	30\r\r研究生	大作业	30\"','',2,'','','',40,'','否','1998990072','\"（1）张瑞林， 秦椿林主编. 体育管理学(第二版)[M]. 高等教育出版社， 北京: 2008\r\r（2）[美]伯尼·L·帕克豪斯等编著， 裴立新， 成琦等编译. 体育管理学基础与应用(第四版)[M]. 华东师范大学出版社， 上海: 2009\"',0),(73,'运动训练学',0,0.0,0,0,'70729002',14,'','',2,'','','',25,'','否','1998990073','',0),(74,'现代安全工程',0,0.0,0,0,'80160052',5,'','',2,'','限:工程管理硕士学生选课','',50,'','否','1998990074','',0),(75,'高级统计学',0,0.0,0,0,'80160232',5,'英文完成作业；期末综合测试；课程项目训练。','',2,'双语教学','优先:工业工程学生选课','',50,'Calculus; Linear Algebra; Probability and Statistics','否','1998990075','Richard A. Johnson and Dean W. Wichern (2007). Applied Multivariate Statistical Analysis， 6th Edition. Prentice Hall. (International Version， Tsinghua University Press， 2008)',1),(76,'管理信息系统',0,0.0,0,0,'80160242',5,'','',2,'','限:工程管理硕士学生选课','',50,'','否','1998990076','Gerald V. Post， David L. Anderson著，于明编译，管理信息系统，清华大学出版社，2009.10',0),(77,'系统化产品设计与开发',0,0.0,0,0,'80160283',5,'\"期末考试 \r\rFinal examination\r\r\"','',3,'This course is available only for “Tsinghua-Aachen Program” and “Global Manufacturing Program”. ','优先:工业工程留学生选课；清华-亚琛联合培养项目课程，机械学院参加此项目的中国学生及工业工程系留学生选课','',75,'','否','1998990077','\"K. T. Ulrich， S. D. Eppinger， Product Design and Development， \r\rFifth Edition， 2012， McGraw-Hill\r\r《产品设计与开发》（第5版）机械工业出版社影印版， 2014\r\rISBN: 978-7-111-47957-4 \r\r\"',0),(78,'高等人因学专题',0,0.0,0,0,'80160332',5,'','',2,'','优先:工业工程学生选课','',20,'','否','1998990078','',0),(79,'人因学测量',0,0.0,0,0,'80160382',5,'','',2,'','优先:工业工程学生选课；博二及以上年级具备条件的学生选课。其他学生需先向院系提交申请，获批后再选课','',35,'','否','1998990079','',0),(80,'定量分析',0,0.0,0,0,'80160393',5,'','',3,'','优先:工业工程留学生选课；全球制造英文项目、清华-亚琛双学位硕士项目课程','',50,'','否','1998990080','Statistics for business and economics 商务与经济统计 ',0),(81,'高等统计方法',0,0.0,0,0,'80160454',5,'','',4,'','优先:工业工程、数学系学生选课；先修数理统计','',20,'','否','1998990081','',0),(82,'因果推断和图模型',0,0.0,0,0,'80160463',5,'','',3,'','优先:工业工程、数学系学生选课','',20,'','否','1998990082','',20),(83,'工程经济学',0,0.0,0,0,'80168042',5,'','',2,'','限:工业工程系工程硕士学生选课；上海班、华北电力等班工程硕士课程。具体的上课时间及地点由院系提前通知','',40,'','否','1998990083','',0),(84,'产品开发管理',0,0.0,0,0,'80168102',5,'','',2,'','限:工程管理硕士学生选课','',50,'','否','1998990084','',0),(85,'质量与6西格玛',0,0.0,0,0,'80168222',5,'','',2,'','限:工程管理硕士学生选课','',50,'','否','1998990085','',0),(86,'工作组织与人力资源管理',1,0.0,0,0,'80168232',5,'','',2,'','限:工程管理专业学生选课','',40,'','否','1998990086','',0),(87,'工作组织与人力资源管理',2,0.0,0,0,'80168232',5,'','',2,'','限:工程管理硕士学生选课','',40,'','否','1998990087','',0),(88,'比较经济制度研究',0,0.0,0,0,'80610703',14,'','',3,'','','',15,'','否','1998990088','',0),(89,'创新与科技发展',0,0.0,0,0,'80611152',14,'\"平时考核（读书报告与参与研讨）：40%\r\r课程论文（学期末提交）：60%\"','',2,'','','',20,'','否','1998990089','\"李正风，曾国屏著：中国创新系统研究——技术制度与知识，山东教育出版社，1999\r\r曾国屏，李正风主编：世界各国创新系统——知识的生产、传播与利用，山东教育出版社，1999\"',0),(90,'国际问题研究方法',0,0.0,0,0,'80611402',14,'','',2,'','优先:政治学专业学生选课','',35,'','否','1998990090','',0),(91,'成功心理训练',0,0.0,0,0,'80611603',14,'平时课堂训练参与状况；平时课堂练习完成状况；课程结束时提交《成功心理训练课程报告》不少于2500字','',3,'\"选课范围：清华大学研究生\r\r对象要求：愿意探索自己；愿意与他人交往；能够开放自己；希望分享自己与别人的感受；具有良好的表达能力；身体健康；具有团队合作精神；愿意不断成长\"','优先:心理学专业学生选课','',25,'','否','1998990091','\"教材：无，课堂参考资料\r\r参考书：樊富珉等主编《心理素质：成功人生的基础》北京出版社2005；《成功心理与人才发展》贺淑曼等编著世界图书出版公司 1999；《快乐人生：成功的资本》斯宾赛&#8226;约翰逊延边出版社2002\"',0),(92,'经济学方法论',0,0.0,0,0,'80611732',14,'','',2,'','','',30,'','否','1998990092','',0),(93,'美国政治与对华政策',0,0.0,0,0,'80612083',14,'\"课堂参与：包括出勤、提问和讨论，20分；\r\r小组研究报告：40分\r\r4篇小论文：40分\"','',3,'\"熟悉美国史、中国对外关系史，有一定的政治学基础；\r\r具有一定的独立思考和研究问题的能力；\r\r\r\r\"','优先:政治学专业学生选课','',35,'政治学基础理论、国际关系史、国际关系概论','否','1998990093','伯恩斯等著《民治政府》、施密特等著《美国政府与政治》、托克维尔著《论美国的民主》、费正清著《美国与中国》',0),(94,'科学技术史专题研究（1）',0,0.0,0,0,'80612481',14,'','',1,'','限:哲学、科学技术史、社会学专业、美术学院学生选课','',20,'','否','1998990094','',0),(95,'科技传播与社会',0,0.0,0,0,'80612822',14,'','',2,'','限:哲学、科学技术史、社会学专业、美术学院学生选课','',40,'','否','1998990095','',0),(96,'发展中国家研究专题研讨',0,0.0,0,0,'80700182',14,'','',1,'','发展中国家研究博士项目一年级学生选课','',8,'本讨论课仅限学校发展中国家研究博士项目的学生修课。','否','1998990096','',0),(97,'认知心理学与电影专题',0,0.0,0,0,'80700202',14,'','',2,'','优先:心理学专业学生选课','',10,'','否','1998990097','',0),(98,'中国与发展中国家',0,0.0,0,0,'80700212',14,'','',2,'','限:政治学专业学生选课','',22,'','否','1998990098','',0),(99,'企业与企业史理论专题',0,0.0,0,0,'80700222',14,'','',2,'','','',20,'','否','1998990099','',0),(100,'研究设计与编写',0,0.0,0,0,'80700242',14,'','',2,'','限:政治学专业学生选课','',35,'','否','1998990100','',0),(101,'全球健康治理',0,0.0,0,0,'80700303',14,'','',3,'','','',50,'','否','1998990101','',0),(102,'临床心理与咨询实习',0,0.0,0,0,'80700323',14,'','',3,'','','',8,'','否','1998990102','',0),(103,'文献阅读与论文写作',0,0.0,0,0,'80168182',5,'','',2,'','限:工业工程系工程硕士选课','',30,'','否','1998990103','',0),(104,'学术规范与职业伦理',1,0.0,0,0,'70700191',14,'','',1,'','限:马克思主义学院、社科学院学生选课','',40,'','否','1998990104','',0),(105,'学术规范与职业伦理',2,0.0,0,0,'70700191',14,'','',1,'','限:马克思主义学院、社科学院学生选课','',40,'','否','1998990105','',0),(106,'物流与供应链管理概论',0,0.0,0,0,'80168122',5,'','',2,'','限:工业工程系工程硕士学生选课；专为兵装班工程硕士开设。具体上课时间、地点由院系通知','',50,'','否','1998990106','',0),(107,'工程硕士英语(第一外国语)',6,0.0,0,0,'60648003',5,'','',3,'','限:工业工程系工程硕士学生选课；专为兵装班工程硕士开设。具体上课时间、地点由院系通知','',50,'','否','1998990107','',0),(108,'工业工程伦理',0,0.0,0,0,'60160021',5,'','',1,'','优先:工业工程学生选课','',40,'','否','1998990108','',0),(109,'领导与沟通',1,0.0,0,0,'60168012',5,'','',2,'','限:工程管理专业学生选课','',40,'','否','1998990109','',0),(110,'领导与沟通',2,0.0,0,0,'60168012',5,'','',2,'','限:工程管理专业学生选课','',40,'','否','1998990110','',0),(111,'工程管理中的财务与投资',1,0.0,0,0,'60168022',5,'','',2,'','限:工程管理专业学生选课','',40,'','否','1998990111','',0),(112,'工程管理中的财务与投资',2,0.0,0,0,'60168022',5,'','',2,'','限:工程管理专业学生选课','',40,'','否','1998990112','',0),(113,'管理经济学',1,0.0,0,0,'60168032',5,'','',2,'','限:工程管理专业学生选课','',40,'','否','1998990113','',0),(114,'管理经济学',2,0.0,0,0,'60168032',5,'','',2,'','限:工程管理专业学生选课','',40,'','否','1998990114','',0),(115,'工程管理中的市场与营销',1,0.0,0,0,'60168042',5,'开卷考试+大作业+出勤','',2,'','限:工程管理专业学生选课','',40,'','否','1998990115','菲利普·科特勒，加里·阿姆斯特朗著，郭国庆翻译.《市场营销原理》（第14版），2013年。',0),(116,'工程管理中的市场与营销',2,0.0,0,0,'60168042',5,'开卷考试+大作业+出勤','',2,'','限:工程管理专业学生选课','',40,'','否','1998990116','菲利普·科特勒，加里·阿姆斯特朗著，郭国庆翻译.《市场营销原理》（第14版），2013年。',0),(117,'工程管理中的定量分析方法',1,0.0,0,0,'60168052',5,'','',2,'','限:工程管理硕士学生选课','',40,'','否','1998990117','',0),(118,'工程管理中的定量分析方法',2,0.0,0,0,'60168052',5,'','',2,'','限:工程管理硕士学生选课','',40,'','否','1998990118','',0),(119,'战略管理',1,0.0,0,0,'60168062',5,'','',2,'','限:工程管理专业学生选课','',40,'','否','1998990119','',0),(120,'战略管理',2,0.0,0,0,'60168062',5,'','',2,'','限:工程管理专业学生选课','',40,'','否','1998990120','',0),(121,'政治学经典导读——国家的秘密',0,0.0,0,0,'60610192',14,'\"积极的课堂参与    	30％成绩\r\r1份学术评述     	70％成绩\r\r就本课程所学的某一本名著写一篇读书笔记。\r\r注意：请特别关注对待经典的基本态度，我们首先需要的是同情的理解，而不是批判。\r\r\"','',2,'','','',30,'','否','1998990121','\"1、辅助读物：\r\r萨拜因：《政治学说史》（上、下），商务。\r\r斯特劳斯：《政治哲学史》（上、下），河北人民。\r\r奥克肖特：《政治思想史》，华东师大。\r\r古朗士：《古代城邦》，华东师大。\r\r丛日云：《在上帝与恺撒之间》，三联。\r\r斯金纳：《近代政治思想的基础》，商务。\r\r\r\r2、原著：\r\r1、柏拉图：《理想国》，商务。   \r\r2、亚里士多德：《政治学》，商务。\r\r3、西塞罗：《国家篇&#8226;法律篇》，商务。\r\r4、奥古斯丁：《奥古斯丁政治著作选》，中国政法。\r\r5、阿奎那：《阿奎那政治著作选》，商务。\r\r6、霍布斯：《利维坦》，商务。\r\r7、洛克：《政府论》（下），商务。\r\r8、孟德斯鸠：《论法的精神》，商务。   \r\r9、卢梭：《社会契约论》，商务。  \r\r10、汉密尔顿：《联邦党人文集》，商务。\r\r11、密尔：《代议制政府》，商务。  \r\r12、托克维尔：《论美国的民主》，商务。\r\r13、熊彼特：《资本主义、社会主义与民主》，商务。\r\r\r\r\"',0),(122,'幸福经济学',0,0.0,0,0,'60610202',14,'\"考查，记“通过”“不通过”。\r\r成绩由两部分构成：一篇阅读经典著作的小论文，一篇结课时的课堂作业。\"','',2,'','','',40,'','否','1998990122','曼昆：《经济学原理:微观经济学分册》',0),(123,'科研规范',1,0.0,0,0,'60610221',14,'','',1,'','','',34,'','否','1998990123','',0),(124,'科研规范',2,0.0,0,0,'60610221',14,'','',1,'','限:经管学院、理论经济学专业学生选课','',40,'','否','1998990124','',0),(125,'工程伦理',0,0.0,0,0,'60610231',14,'','',1,'','','',40,'','否','1998990125','',0),(126,'英语（第一外国语）',34,0.0,0,0,'60640012',5,'','',2,'','限:工程管理硕士学生选课','',40,'','否','1998990126','',0),(127,'英语（第一外国语）',35,0.0,0,0,'60640012',5,'','',2,'','限:工程管理硕士学生选课','',40,'','否','1998990127','',0),(128,'中国科学技术与社会导论',0,0.0,0,0,'60610112',14,'','',2,'','限:留学生选课','',60,'','否','1998990128','',0),(129,'工业生产管理概论',90,0.0,0,0,'160062',5,'\"考查课。\r\r以实验报告和随堂小测验的成绩进行评判。\r\r课程成绩为等级制。\"','外文教材，中文为主进行授课(双语课)',2,'本课程适合工科院系的大三、大四本科生。 将介绍一般性工业生产的管理方法与工具，培养工科学生的基本管理素质与能力。课程采取英中双语授课方式，教材与讲义为英文版，课堂讲授和实验使用中文。','限:2013、2014学生选课；建议工科院系大三大四学生选修。本课程介绍工业生产的管理方法，培养工科学生的管理素质和能力','',0,'无先修课程要求。','否','1998990129','教材：William J. Stevenson，Operations Management（运营管理），11th Edition，McGraw Hill，机械工业出版社影印版，2012年1月，ISBN： 978-7-111-36895-3',80),(130,'科学技术史系列讲座',90,0.0,0,0,'700302',14,'','文化素质核心课',2,'','','',0,'','否','1998990130','',260),(131,'生涯发展规划',90,0.0,0,0,'700381',14,'','新生研讨课',1,'','限:2016学生选课','2016',0,'','否','1998990131','',24),(132,'现代西方技术哲学',90,0.0,0,0,'700402',14,'','文化素质课',2,'','','',0,'','否','1998990132','',25),(133,'自然与文化（1）：诗画与炼丹',90,0.0,0,0,'700431',14,'','新生研讨课',1,'','限:2016学生选课','2016',0,'','否','1998990133','',15),(134,'戏剧中的科学',90,0.0,0,0,'700481',14,'','新生研讨课',1,'','限:2016学生选课','2016',0,'','否','1998990134','',15),(135,'技术社会学专题',90,0.0,0,0,'700692',14,'','',2,'','','',0,'','否','1998990135','',25),(136,'俄罗斯科学技术与社会',90,0.0,0,0,'700722',14,'','文化素质核心课',2,'','','',0,'','否','1998990136','',32),(137,'后现代科学哲学',90,0.0,0,0,'700752',14,'','文化素质核心课',2,'','','',0,'','否','1998990137','',40),(138,'嬗变与碰撞：现代中国科学观念的演变',90,0.0,0,0,'700852',14,'','文化素质核心课',2,'','','',0,'','否','1998990138','',40),(139,'信息技术、自我与社会',90,0.0,0,0,'701142',14,'课堂平时表现40%+期末小组报告60%','文化素质课',2,'本课程的受众定位但不局限于：（1）对人文社会科学感兴趣的理工科学生；（2）对信息技术感兴趣的文科学生。 ','','',0,'无','否','1998990139','\"[1] 曼纽尔&#8226;卡斯特. 网络社会的崛起. 北京: 社会科学文献出版社， 2006.\r\r[2] 安德鲁&#8226;查德威克. 互联网政治学：国家、公民与新传播技术. 北京: 华夏出版社， 2010.\r\r[3] 凯文&#8226;凯利. 科技想要什么. 北京: 中信出版社， 2011.\r\r[4] 亚当&#8226;乔伊森. 网络行为心理学：虚拟世界与真实生活. 北京: 商务印书馆， 2010. \r\r[5] 斯各特&#8226;拉什. 信息批判. 北京: 北京大学出版社， 2009.\r\r[6] 弗兰克&#8226;韦伯斯特. 信息社会理论. 北京: 北京大学出版社， 2011.\r\r[7] 项飚. 全球“猎身”：世界信息产业和印度的技术劳工. 北京: 北京大学出版社， 2012.\r\r[8] Turkle， S.， Alone together: why we expect more from technology and less from each other. 2011， New York: Basic Books.\r\r\"',30),(140,'沈括与《梦溪笔谈》',90,0.0,0,0,'701151',14,'','新生研讨课',1,'','限:2016学生选课','2016',0,'','否','1998990140','',15),(141,'西方政治制度',90,0.0,0,0,'701162',14,'','',2,'','','',0,'','否','1998990141','',30),(142,'国际关系分析',90,0.0,0,0,'701344',14,'','文化素质核心课',4,'','限:2015学生选课；基础读写认证课程','',0,'','否','1998990142','',60),(143,'健康产业发展与管理',90,0.0,0,0,'701352',14,'','文化素质课',2,'','','',0,'','否','1998990143','',100),(144,'科技创新的历史与未来',90,0.0,0,0,'701432',14,'','文化素质课',2,'','','',0,'','否','1998990144','',50),(145,'文学、电影与STS',90,0.0,0,0,'701442',14,'','文化素质课',2,'','','',0,'','否','1998990145','',30),(146,'自然辩证法概论',11,0.0,0,0,'60680021',14,'','',1,'','限:应用心理专业学生选课','',40,'','否','1998990146','',0),(147,'自然辩证法概论',14,0.0,0,0,'60680021',14,'','',1,'','限:土木系学生选课','',49,'','否','1998990147','',0),(148,'自然辩证法概论',15,0.0,0,0,'60680021',14,'','',1,'','限:公共卫生硕士学生选课；','',15,'','否','1998990148','',0),(149,'大数据分析（A）',0,0.0,0,0,'60700033',14,'\"平时作业	40%\r\r学期论文	60%\r\r\"','',3,'','','',130,'','否','1998990149','\"Data Mining and Business Analytics with R by Johannes Ledolter， 2013， Wiley\r\rAn Introduction to Statistical Learning: with Applications in R by Gareth James et al， 2013， Springer\r\rAnalyzing Social Networks by Stephen Borgatti et al， 2013， SAGE\"',1),(150,'改革与中国社会变迁',0,0.0,0,0,'60700081',14,'','',1,'','','',25,'','否','1998990150','',0),(151,'脑成像实验设计与数据分析',0,0.0,0,0,'60700092',14,'','',2,'','','',10,'','否','1998990151','',5),(152,'高级运筹学',0,0.0,0,0,'70160014',5,'','',4,'','优先:工业工程学生选课','',50,'','否','1998990152','',0),(153,'质量工程学',0,0.0,0,0,'70160023',5,'','',3,'','优先:工业工程留学生选课；清华-亚琛联合培养项目课程，机械学院参加此项目的中国学生及工业工程系留学生选课','',50,'','否','1998990153','',0),(154,'生产管理',0,0.0,0,0,'70160033',5,'\"期末考试\r\rFinal Examination\"','',3,'This course is available only for “Tsinghua-Aachen Program” and “Global Manufacturing Program”.','优先:工业工程留学生选课；清华-亚琛联合培养项目课程，机械学院参加此项目的中国学生及工业工程系留学生选课','',75,'','否','1998990154','',0),(155,'决策方法学',0,0.0,0,0,'70160513',5,'Homework + Exam + Course project','',3,'','优先:工业工程留学生选课；清华-亚琛联合培养项目课程，机械学院参加此项目的中国学生及工业工程系留学生选课','',50,'Calculus， Linear Algebra','否','1998990155','\"Winston， Wayne L. and S. Christian Albright， Practical Management Science. Revised， 3nd Ed. Cengage Learning， 2008.\r\r	\r\rHillier， Frederick S. and Gerald J. Lieberman， Introduction to Operations Research. 8th Ed. McGraw Hill， 2005 (Authorized Reprint Edition by Tsinghua University Press). \r\r\"',0),(156,'人因工程',1,0.0,0,0,'70160542',5,'','',2,'','限:工业工程系工程硕士学生选课；上海班及兵装班工程硕士课程。具体的上课时间及地点由院系提前通知','',40,'','否','1998990156','',0),(157,'人因工程',2,0.0,0,0,'70160542',5,'','',2,'','限:工业工程系工程硕士学生选课；上海班工程硕士课程。上课地点不在北京，具体上课时间及地点由院系提前通知','',40,'','否','1998990157','',0),(158,'工业工程实践',0,0.0,0,0,'70160591',5,'','',1,'','限:工业工程系留学生选课；全球制造英文项目','',20,'','否','1998990158','',0),(159,'工效学',0,0.0,0,0,'70160613',5,'','',3,'','优先:工业工程留学生选课；清华-亚琛联合培养项目课程，机械学院参加此项目的中国学生及工业工程系留学生选课','',50,'','否','1998990159','',0),(160,'当代国际关系史',0,0.0,0,0,'40700063',14,'','',3,'','优先:国际政治专业、社双（国政）学生选课','',0,'','否','1998990160','',45),(161,'西方社会学思想史(上)',0,0.0,0,0,'40700113',14,'','外文教材，中文为主进行授课(双语课)',3,'','优先:社科41、社双（社会）学生选课','2014',15,'','否','1998990161','',100),(162,'社会统计学',0,0.0,0,0,'40700133',14,'','',3,'','优先:社科41、社双（社会）学生选课','2014',1,'','否','1998990162','',74),(163,'组织社会学',0,0.0,0,0,'40700163',14,'','',3,'','优先:社科41、社双（社会）学生选课','2014',0,'','否','1998990163','',75),(164,'社会问题与社会政策',0,0.0,0,0,'40700173',14,'','外文教材，中文为主进行授课(双语课)',3,'','优先:社科31、社科41、社双（社会）学生选课','\"20',142,'013\"','0','','否',1998990164),(165,'国际组织',0,0.0,0,0,'40700213',14,'','外文授课比例≥50%(双语课)',3,'','优先:社双（国政）、社科33、环44学生选课','\"20',142,'013\"','0','','否',1998990165),(166,'政治学概论',0,0.0,0,0,'40700273',14,'','文化素质核心课',3,'','优先:社双（国政）、社科6学生选课','2016',0,'','否','1998990166','',128),(167,'中级宏观经济学',0,0.0,0,0,'40700283',14,'开卷考试','',3,'已经学习（自学）《经济学原理》课程的学生，均可选该课程。','优先:社双（经济）、社科42学生选课','2014',1,'','否','1998990167','\"威廉森身为里士满联邦储备银行的客座研究员，获得“切斯特&#8226;A&#8226;菲利普斯教授”荣誉称号，其所著的《宏观经济学》在北美地区广受好评。本书遵循当今研究宏观经济学普遍采用的现代方法，根据微观经济学原理构建宏观经济学模型。以强调实用、注重理论与实践相结合作为本书的一大特色，避免了理论的空洞化；同时辅以丰富的图形，生动再现了宏观经济学知识，有效配合了文字和数学说明。本书是对第一版进行修订的基础上完成的，进一步完善的独特的章节体系不仅展现了威廉森对宏观经济学知识框架的理解，更符合了师生的兴趣和要求，具有更强的灵活性、可读性、逻辑性和时代性。\r\r\"',46),(168,'科学技术哲学',0,0.0,0,0,'40700492',14,'','',2,'','','\"20',142,'013\"','0','','否',1998990168),(169,'世界经济史',0,0.0,0,0,'40700533',14,'','',3,'','优先:社双（经济）、社科42学生选课','2014',0,'','否','1998990169','',50),(170,'中国经济专题',0,0.0,0,0,'40700683',14,'\"期末考试、课堂讨论及出席率，各占总成绩的60%、30%及10%。\r\r注：出席率不可低于最低标准。\"','',3,'-','优先:经济学专业、社双（经济）学生选课','',0,'本课程要求学生有一定的经济学基础，建议学生先修一些经济学原理课程。','否','1998990170','\"教材：蔡P、林毅夫，《中国经济》（第1版），中国财政经济出版社，2003年。\r\r参考书：林毅夫，《中国经济专题》（第2版），北京大学出版社，2012年。\"',34),(171,'政治经济学原理',0,0.0,0,0,'40700723',14,'','外文教材，中文为主进行授课(双语课)',3,'','优先:社科学院、社双（经济）学生选课','',0,'','否','1998990171','',100),(172,'经济学方法论',0,0.0,0,0,'40700763',14,'','',3,'','优先:社科42、社双（经济）学生选课','2014',0,'','否','1998990172','',40),(173,'心理咨询与心理治疗',0,0.0,0,0,'40700813',14,'\"评定方式\r\r\r\r考勤；课堂投入程度；练习完成情况；作业完成情况；闭卷期末考试。\r\r（请允许教师进行修改调整的可能性）\r\r\"','',3,'\"本课程是心理学方向本科生专业课，先修课程要求有《变态心理学》和《普通心理学》。\r\r心理咨询与治疗本身以及教学过程都涉及到保密问题，因此不接受旁听。\"','优先:心理学专业、社双（心理）学生选课','2013',0,'《变态心理学》《普通心理学》','否','1998990173','',40),(174,'劳工社会学',0,0.0,0,0,'40700823',14,'','外文教材，中文为主进行授课(双语课)',3,'','优先:社科41、社双（社会）学生选课','2014',1,'','否','1998990174','',74),(175,'文化与国际关系',0,0.0,0,0,'40700832',14,'','',2,'','优先:社双（国政）、社科33、社科43学生选课','\"20',142,'013\"','0','','否',1998990175),(176,'当代美国经济与政治',0,0.0,0,0,'40700973',14,'','',3,'','优先:社双（经济）、社科42学生选课','2014',0,'','否','1998990176','',40),(177,'经济外交事务、礼仪与谈判',0,0.0,0,0,'40701003',14,'','',3,'','优先:社双（国政）、社科33、环34、环44学生选课','\"20',142,'013\"','0','','否',1998990177),(178,'经济外交法',0,0.0,0,0,'40701012',14,'','',2,'','优先:社双（国政）、社科33、社科43学生选课','\"20',142,'013\"','0','','否',1998990178),(179,'历史社会学',0,0.0,0,0,'40701083',14,'','外文教材，中文为主进行授课(双语课)',3,'','优先:心理学专业、社双（心理）学生选课','\"20',142,'013\"','0','','否',1998990179),(180,'工业工程概论',0,0.0,0,0,'30160012',5,'\"1.	Homework\r\r2.	Team project(s)\"','外文授课比例≥50%(双语课)',2,'','优先:工业工程、工业工程（辅修）专业学生选课','2016',0,'','否','1998990180','\"[1] The Engineering Student Survival Guide， Krista Donaldson， Third Edition， McGraw-Hill， 2004\r\r[2] Teamwork and Project Management， Karl Smith， Third Edition， McGraw-Hill， 2005\r\r[3] Ethics in Engineering， Mike W. Martin， Roland Schinzinger， Four Edition， McGraw-Hill，2003\r\r[3] Introduction to Industrial and Systems Engineering， by Wayne C. Turner， Joe H. Mize， Kenneth E. Case， and John W. Nazemetz， third edition， Prentice-Hall， 1993. \r\r\"',100),(181,'管理学基础',2,0.0,0,0,'30160112',5,'','外文授课比例≥50%(双语课)',2,'','优先:航院学生选课','\"20',142,'015\"','0','','否',1998990181),(182,'工程经济学',0,0.0,0,0,'30160152',5,'考试','全外文授课',2,'','优先:工业工程、工业工程（辅修）专业学生选课','2014',0,'','否','1998990182','',105),(183,'运筹学（2）（应用随机模型）',0,0.0,0,0,'30160162',5,'课堂出席 + 平时作业 + 期末考试（闭卷）','外文授课比例≥50%(双语课)',2,'','优先:工业工程学生选课','2014',0,'','否','1998990183','',90),(184,'数据库原理',0,0.0,0,0,'30160182',5,'考试+大作业','全外文授课',2,'','优先:工业工程学生选课','2014',0,'','否','1998990184','',75),(185,'概率论',0,0.0,0,0,'30160213',5,'综合评分（课堂作业，期中考试，期末考试，阅读报告）','外文教材，中文为主进行授课(双语课)',3,'工业工程系','优先:工业工程学生选课','2015',0,'\"微积分；线性代数\r\r\"','否','1998990185','',80),(186,'国际政治经济学概论',0,0.0,0,0,'30700173',14,'','外文教材，中文为主进行授课(双语课)',3,'','优先:社科32、社双（经济）学生选课','2013',0,'','否','1998990186','\"（教材）邝梅著：《国际政治经济学》，中国社会科学出版社，2008年版，或2011年（第二版），2013年重印\r\r\"',40),(187,'博弈论基础（英）',0,0.0,0,0,'30700193',14,'','外文授课比例≥50%(双语课)',3,'','优先:社双（经济）、社科5学生选课','2015',0,'','否','1998990187','',150),(188,'现代心理学前沿问题选讲',0,0.0,0,0,'30700272',14,'','外文授课比例≥50%(双语课)',2,'','优先:心理学专业、社双（心理）学生选课','2013',0,'','否','1998990188','',40),(189,'社会学概论',0,0.0,0,0,'30700283',14,'','',3,'','优先:社科6、社双（社会）学生选课','2016',15,'','否','1998990189','',157),(190,'人格心理学',0,0.0,0,0,'30700393',14,'','',3,'','优先:社科44、社双（心理）学生选课','2014',1,'','否','1998990190','',135),(191,'认知心理学',0,0.0,0,0,'30700403',14,'','外文教材，中文为主进行授课(双语课)',3,'','优先:社科44、社双（心理）学生选课','2014',0,'','否','1998990191','',120),(192,'认知神经科学基础',0,0.0,0,0,'30700413',14,'','外文教材，中文为主进行授课(双语课)',3,'','优先:社科44、社双（心理）学生选课','2014',0,'','否','1998990192','',25),(193,'实验心理学实验',0,0.0,0,0,'30700423',14,'考查，成绩录入方式为通过/不通过','实验课',3,'','优先:社科44、社双（心理）、心理学专业学生选课','2014',0,'先修课：《实验心理学》和《心理学统计》','否','1998990193','\"张学民，《实验心理学》（修订版），北京师范大学出版社，2007年。 \r\r孟庆茂、常建华，《实验心理学》，北京师范大学出版社，1999年。\r\r杨博民，《心理实验纲要》，北京大学出版社，1989年。\r\r朱滢，《实验心理学》，北京大学出版社，2009年。\r\r索尔索、麦克林，《实验心理学》，中国人民大学出版社，2009年。\r\r杨治良，《实验心理学》，浙江教育出版社，1998年。\r\r白学军，《实验心理学》，中国人民大学出版社，2012年。\"',26),(194,'异常心理学',0,0.0,0,0,'30700493',14,'','外文教材，中文为主进行授课(双语课)',3,'','优先:社双（心理）、社科44、心理学专业学生选课','2014',0,'','否','1998990194','',42),(195,'普通心理学',0,0.0,0,0,'30700504',14,'','',4,'','优先:社科5、社双（心理）、心理学专业学生选课; 准备修读心理学专业的社科5同学必修','',0,'','否','1998990195','',100),(196,'行为经济学（英）',0,0.0,0,0,'30700603',14,'weekly assignment(20%)， in class presentation(20%)， and final project(60%).','全外文授课',3,'','优先:心理学专业、社双（心理）学生选课','2013',0,'','否','1998990196','',50),(197,'西亚非洲研究',0,0.0,0,0,'30700612',14,'','外文教材，中文为主进行授课(双语课)',2,'','优先:社双（国政）学生选课','2014',0,'','否','1998990197','',33),(198,'社会调查与研究方法（2）',0,0.0,0,0,'30700633',14,'','',3,'','优先:社科41、社双（社会）学生选课','2014',0,'','否','1998990198','',75),(199,'计量经济学专题',0,0.0,0,0,'30700643',14,'','外文教材，中文为主进行授课(双语课)',3,'','优先:社科42、社双（经济）学生选课','2014',0,'','否','1998990199','',55),(200,'中级微观经济学',0,0.0,0,0,'30700693',14,'','',3,'','优先:社双（经济）、社科42学生选课','2014',0,'','否','1998990200','Intermediate Microeconomics：A Modern Approach， Ninth Edition，Hal R. Varian',60),(201,'中国概况',90,0.0,0,0,'30700712',14,'','',2,'','限:留学生选课','',0,'','否','1998990201','',150),(202,'心理学研究方法',0,0.0,0,0,'30700753',14,'','',3,'','优先:社科5、社双（心理）、心理学专业学生选课','2015',0,'','否','1998990202','',125),(203,'国家理论研究',0,0.0,0,0,'30700792',14,'','',2,'','优先:政治辅6学生选课','',1,'','否','1998990203','',29),(204,'行政管理学概论',0,0.0,0,0,'30700803',14,'','',3,'','优先:政治辅6学生选课','',0,'','否','1998990204','',29),(205,'政治学研究方法',0,0.0,0,0,'30700823',14,'','',3,'','优先:政治辅6学生选课','',10,'','否','1998990205','',10),(206,'设施规划及物流分析',0,0.0,0,0,'40160052',5,'','外文授课比例≥50%(双语课)',2,'','优先:工业工程学生选课','2013',0,'','否','1998990206','',30),(207,'综合论文训练',0,0.0,0,0,'40160130',5,'','',15,'','优先:工业工程学生选课；一学年课程，秋季为第一学期','2013',0,'','否','1998990207','',85),(208,'安全工程',0,0.0,0,0,'40160192',5,'\"Course Participation:	25 %\r\rHomework/Quizes:	15 %\r\rFinal Exam:	60 %\r\r\"','外文授课比例≥50%(双语课)',2,'','优先:工业工程学生选课','2013',0,'','否','1998990208','',30),(209,'人因工程基础',0,0.0,0,0,'40160323',5,'期中、期末考试成绩，人因设计大作业成绩，平时作业和课堂表现成绩组成。','外文授课比例≥50%(双语课)',3,'','优先:工业工程、工业工程（辅修）专业学生选课','2014',0,'','否','1998990209','\"工程和设计中的人因学（第7版）	Mark S. Sanders & Ernest J. McCormick	清华大学出版社 & 麦格劳－希尔教育出版集团\"',105),(210,'服务运作管理',0,0.0,0,0,'40160402',5,'期中考试，大作业','外文授课比例≥50%(双语课)',2,'','优先:工业工程学生选课','2013',0,'','否','1998990210','《Service Management Operations， Strategy， Information Technology》，James， A. Fitzsimmons and Mona， A. Fitzsimmons. McGraw Hill',35),(211,'国际物流（英）',0,0.0,0,0,'40160522',5,'Course project and exam','全外文授课',2,'','优先:工业工程学生选课','2013',0,'None','否','1998990211','See textbook information below',47),(212,'可靠性工程与设备管理',0,0.0,0,0,'40160532',5,'','外文教材，中文为主进行授课(双语课)',2,'','优先:工业工程学生选课','2013',0,'','否','1998990212','',50),(213,'工业工程课程设计',0,0.0,0,0,'40160614',5,'','',4,'','优先:工业工程学生选课','2013',0,'','否','1998990213','',80),(214,'建模与仿真',0,0.0,0,0,'40160622',5,'','外文授课比例≥50%(双语课)',2,'','优先:工业工程学生选课','2014',0,'','否','1998990214','',75),(215,'物流与供应链管理',0,0.0,0,0,'40160652',5,'40% - Final Exam， 20% - Mid-Term Exam，20% - Term Paper，10% - Assignments，10% - Attendance','外文教材，中文为主进行授课(双语课)',2,'对物流与供应链管理基本理论有兴趣，希望理论与实践相结合，解决供应链中利益分享的问题','优先:工业工程学生选课','2013',0,'高等数学，线性代数','否','1998990215','',40),(216,'用户体验设计',0,0.0,0,0,'40160682',5,'案例研究和专题研究','外文授课比例≥50%(双语课)',2,'','优先:工业工程学生选课','2013',0,'','否','1998990216','',35),(217,'初等概率论',0,0.0,0,0,'40160713',5,'','外文教材，中文为主进行授课(双语课)',3,'','优先:统计学(辅修)专业学生选课','',0,'','否','1998990217','',80),(218,'数据科学导论',0,0.0,0,0,'40160723',5,'作业、考勤、期末设计','外文教材，中文为主进行授课(双语课)',3,'因学校无法提供计算机实验室，学生上课必须自带电脑，否则无法完成上机课考勤。','优先:统计学(辅修)专业学生选课','',0,'编程基础、高等数学','否','1998990218','\"讲义。\r\rR Programming for Data Science， Roger D. Peng.\r\rR in Action: Data Analysis and Graphics with R， 2nd Edition， Robert Kabacoff.\"',62),(219,'民主的理论与实践',90,0.0,0,0,'700601',14,'考查课，开卷，写一篇文章。','文化素质课',1,'','面向全校本科生','',0,'','否','1998990219','\"张利华：《中国法治民主建设之路》，中国社会科学出版社2006年版；\r\r张利华、唐士其等著：《市场经济与民主政治》，民主与建设出版社2002年版。\"',30),(220,'运筹学(1)(确定性方法)',0,0.0,0,0,'30160023',5,'','外文教材，中文为主进行授课(双语课)',3,'','优先:工业工程学生选课','',0,'','否','1998990220','运筹学数学规划 Wayne L.Winston 清华大学出版社',65),(221,'科幻电影与人文',90,0.0,0,0,'701502',14,'','',2,'','','',0,'','否','1998990221','',50),(222,'国外马克思主义经济学说史',0,0.0,0,0,'30700833',14,'\"期末考试、课后作业及出席率，各占总成绩的60%、30%及10%。 \r\r注：出席率不可低于学校规定的最低标准。\"','',3,'','','',0,'本课程要求学生有一定的政治经济学或经济思想史基础，建议学生先修一些政治经济学基础课程。','否','1998990222','\"王志伟《现代西方经济学流派》北京大学出版社2002年\r\r谭晓军《日本马克思主义经济学派史》中国社会科学出版社2012年\"',30),(223,'经济学原理（上）',0,0.0,0,0,'30700842',14,'','外文教材，中文为主进行授课(双语课)',2,'','优先:社科6、社双（经济）学生选课','2016',1,'','否','1998990223','',150),(224,'社会分层与社会流动',0,0.0,0,0,'80613163',14,'\"课堂讨论表现\r\r作业与读书文章\r\r社会分层实证研究撰写小论文\r\r\r\r\"','',3,'','优先:社会学专业学生选课','',36,'','否','1998990224','\"李强：《社会分层十讲》北京：社会科学文献出版社2011年版。\r\r李强：《当代中国社会分层:测量与分析》北京师范大学出版社2010年4月\r\r李强《社会分层与贫富差别》，鹭江出版社，2000年9月\r\r李强:《农民工与中国社会分层》中国社会科学文献出版社2004年第一版，2011年第二版。\r\r李强：《当代中国社会分层与流动》中国经济出版社1993年。\r\r李强主编：《中国社会变迁30年：1978-2008》社会科学文献出版社2008年11月。\r\r李培林主编：《中国新时期阶级阶层报告》辽宁人民出版社1995年。\r\r格尔哈斯&#8226;伦斯基：《权力与特权：社会分层的理论》浙江人民出版社1988年。\r\r陆学艺：《当代中国社会阶层研究报告》社会科学文献出版社2002年1月。\r\r李春玲主编：《比较视野下的中产阶级形成：过程、影响以及社会经济后果》社会科学文献出版社2009年4月。\r\r李友梅、孙立平、沈原主编：《当代中国社会分层：理论与实证》社会科学文献出版社2006年3月。\r\r边燕杰：《市场转型与社会分层：美国社会学者分析中国》三联书店，2002年2月。\r\r\"',0),(225,'社会政策分析',0,0.0,0,0,'80613223',14,'','',3,'','限:社会工作专业学生选课','',40,'','否','1998990225','',0),(226,'文化人类学理论',0,0.0,0,0,'80613233',14,'','',3,'','优先:社会学专业学生选课','',40,'','否','1998990226','',0),(227,'社会网理论',0,0.0,0,0,'80613993',14,'','',3,'','优先:社会学专业学生选课','',20,'','否','1998990227','',0),(228,'运动与健康专题',0,0.0,0,0,'80614082',14,'','',2,'','','',25,'','否','1998990228','',0),(229,'科技创新与区域发展',0,0.0,0,0,'80614302',14,'课程的考核方式包括两个部分：课程参与（包括参与主题讲授，积极提出问题和解答问题，积极参与讨论等）40%；课程论文60%。','',2,'','','',20,'','否','1998990229','\"1)方齐云、王皓、李卫兵、王滨 著，增长经济学，湖北人民出版社. 2002\r\r2)方齐云、姚遂  主编，发展经济学，东北财经大学出版社，2008\r\r3)国务院发展研究中心发展战略和区域经济研究课题组著，中国区域科学发展研究，中国发展出版社，2007\r\r4)孙翠兰主编，区域经济学教程，北京大学出版社，2008\r\r5)辛晓梅 著，区域发展战略与规划，中国科学技术大学出版社，200\r\r6)肖广岭  等著，科技创新与区域发展——以区域创新体系建设为中心，中国科学技术出版社，2004\r\r7)方旋  著，科技创新与区域经济发展，广东经济出版社，2002\r\r8)王辑慈  等著，创新的空间——企业集群与区域发展，北京大学出版社，2001\r\r9)吴贵生、魏守华、徐建国  著，区域科技论，清华大学出版社，2007\r\r10)李国平、杨伯林 等编著，区域科技发展规划的理论与实践，海洋出版社，2002\r\r11)区域科技发展研究专题组，国家中长期区域科技发展研究专题报告，2004\r\r12)中国科技发展战略研究小组，中国区域创新能力报告 2008，科学出版社，2009\r\r13）David Doloreux， Saeed Parto. Regional innovation systems: current discourse and unresolved issues. Technology in Society， 2005，27:133-153\"',0),(230,'中国对外政策',0,0.0,0,0,'80615112',14,'','',2,'','限:政治学专业学生选课','',28,'','否','1998990230','',0),(231,'技术社会学',0,0.0,0,0,'80615142',14,'','',2,'','','',25,'','否','1998990231','',0),(232,'政治思想史原著选读',0,0.0,0,0,'80615203',14,'','',3,'','','',10,'','否','1998990232','\"参考书目：\r\r\r\r亚里士多德：《尼各马可伦理学》，廖申白译，商务印书馆，2003年。\r\r\r\r亚里士多德：《政治学》，吴寿彭译，商务印书馆，1965年。\r\r\r\r戴维斯：《哲学的政治》，华夏出版社，2012年。\r\r\r\rJudith A. Swanson and C. David Corbin， 2009， Aristotle’s Politics : A Reader’s Guide， Continuum International Publishing Group.\r\r\r\rDavid Keyt and F. D. Miller， JR.， 1991， A Companion to Aristotle’s Politics ， Oxford: Blackwell.\r\r\r\rKraut， Richard. 2002. Aristotle: Political Philosophy. Oxford: Oxford University Press.\r\r\r\rMiller， Fred D. Jr. 1995. Nature， Justice， and Rights in Aristotle’s Politics. New York: Oxford University Press.\r\r\"',0),(233,'比较政治学研究',0,0.0,0,0,'80615223',14,'','',3,'','','',10,'','否','1998990233','',0),(234,'注意的认知神经科学研究',0,0.0,0,0,'80615361',14,'\"课堂讨论60分；期末综述报告40分\r\r100分制\r\r\"','',1,'适于心理系、生物系神经科学方向以及医学院生物医学工程等相关专业的研究生选修。通过教学和研讨，协助学生了解注意研究的基本理论和方法，了解认知神经科学研究注意的基本技术，并了解注意研究的热点和最新进展。','','',10,'认知心理学/认知神经科学基础；或者有一定的神经解剖基础、统计知识和生物实验基础。','否','1998990234','The Cognitive Neuroscience of Attention， edited by Michael Posner',0),(235,'中国古代外交思想',0,0.0,0,0,'80615412',14,'\"1. Presentation in class 10%\r\r2. Mid-term taking home 30%\r\r3. Final taking home 60%.\"','',2,'','限:政治学专业学生选课','',25,'','否','1998990235','',0),(236,'国际战略分析',0,0.0,0,0,'80618032',14,'课堂纪律10分，课堂讨论及作业30分，期末论文成绩60分。','',2,'','优先:政治学专业学生选课','',40,'','否','1998990236','高金钿主编《国际战略概论》、李景治等著《国际战略学》、钮先钟著《战略研究》、滕藤主编《世纪之交中国的国际环境与邓小平的国际战略思想》、张志前、涂俊编著《国际油价谁主沉浮》、唐宝才主编《伊拉克战争后动荡的中东》、【法】菲利普 赛比耶-洛佩兹著，潘革平译《石油地缘政治》等。',0),(237,'日本经济、政治与外交',0,0.0,0,0,'80618042',14,'课堂纪律10分，课堂表现及完成作业30分，期末论文成绩60分。','',2,'','优先:政治学专业学生选课','',32,'','否','1998990237','刘江永著《中国与日本：变化中的“政冷经热”关系》、《中日关系二十讲》、《跨世纪的日本》等。',0),(238,'建筑的文化理解',90,0.0,0,0,'20041',1,'每人交两篇paper，批阅评分。','文化素质核心课',1,'面向全校非建筑学的本科生。清华美院环境艺术系的学生因为有建筑学和建筑史（艺术史）的相关课程，最好不要来选，把名额让给其他非建筑学的同学。','','',1,'','否','1981990001','自编ppt文本，上传至网络学堂。',120),(239,'环境保护与可持续发展',90,0.0,0,0,'50071',2,'','文化素质核心课',1,'','','',0,'','否','1981990002','',400),(240,'绿色制造与可持续发展',90,0.0,0,0,'120181',3,'','文化素质核心课',1,'','','',0,'','否','1981990003','',100),(241,'能源与气候变化/可持续发展',90,0.0,0,0,'140122',4,'\"本课程成绩记百分制，由四部分组成：\r\r1、	论文题目及提纲（10%）\r\r2、	最终论文报告（50%）\r\r3、	课堂展示（40%）\r\r4、	抽查点名（缺席1次扣2分）\r\r\"','文化素质核心课',2,'','','',0,'','否','1981990004','',100),(242,'数学建模引论',90,0.0,0,0,'420152',6,'\"1、数学建建模平时作业（一般为1-2次）。\r\r2、完成一篇自主选题的数学建模论文：可以三人以内合作完成；包括选题报告、中期报告、最终报告三个阶段。\r\r3、平时和期末1-2次随堂小测验（考试）。\"','文化素质核心课',2,'建议对数学的实际应用有兴趣的低年级同学选课（本学期限大一新生选课）。','限:2016学生选课；基础理工(STEM)认证课程','',0,'无；但建议自学一下有关数学软件（如Matlab等）的基本使用方法（也可以在需要用到时再学）。','否','1981990005','无教材（上课前后老师将提供讲稿）。市面上参考书很多，可自主选用。',200),(243,'文科数学',0,0.0,0,0,'10420844',6,'\"考试\r\r\r\r作业（20%)+期中考试(20%)+期末(60%)\"','文化素质核心课',4,'','限:法学院、新雅书院、经双学生选课','2016',0,'','是','1981990006','\"教材:数学的思想、方法和应用，张顺燕编著，北京大学出版社（第3版）\r\r\r\r参考书：大学文科数学，汪国柄编著，清华大学出版社\"',130),(244,'天文学导论',91,0.0,0,0,'430093',7,'期末闭卷考试（没有期中考试）。考试题型为填空题、是非题与选择题。另有室外认星、阅读与讨论等课外活动。考试成绩与课外成绩各占一定比例。','文化素质核心课',3,'本课程分为两个教学课堂，针对物理基础不同的学生。请根据个人的物理基础或个人的兴趣，按课表中的选课文字说明选课。课序号为91的，适合物理基础强的学生选课，课序号为92的，适合物理基础弱的学生选课。','基础理工(STEM)认证课程。物理基础强的学生选修','',0,'无先修要求。','否','1981990007','本课程的主教材为美国的英文版教材《21st Century Astronomy》。课程提供本教材的电子版。',270),(245,'天文学导论',92,0.0,0,0,'430093',7,'期末闭卷考试（没有期中考试）。考试题型为填空题、是非题与选择题。另有室外认星、阅读与讨论等课外活动。考试成绩与课外成绩各占一定比例。','文化素质核心课',3,'本课程分为两个教学课堂，针对物理基础不同的学生。请根据个人的物理基础或个人的兴趣，按课表中的选课文字说明选课。课序号为91的，适合物理基础强的学生选课，课序号为92的，适合物理基础弱的学生选课。','基础理工(STEM)认证课程。物理基础强的学生选修','',0,'无先修要求。','否','1981990008','本课程的主教材为美国的英文版教材《21st Century Astronomy》。课程提供本教材的电子版。',260),(246,'西方文学选读',91,0.0,0,0,'640282',9,'','文化素质核心课',2,'','','',0,'','否','1981990009','',40),(247,'西方文学选读',92,0.0,0,0,'640282',9,'','文化素质核心课',2,'','','',0,'','否','1981990010','',40),(248,'英语文学中的中国形象',92,0.0,0,0,'641452',9,'\"考试。\r\r\r\r出勤（10%）；期中作业（30%）；期末论文（60%）\"','文化素质核心课',2,'','','',0,'','否','1981990011','',40),(249,'英语文学中的中国形象',91,0.0,0,0,'641452',9,'\"考试。\r\r\r\r出勤（10%）；期中作业（30%）；期末论文（60%）\"','文化素质核心课',2,'','','',0,'','否','1981990012','',40),(250,'西方文明史',90,0.0,0,0,'640993',9,'期末完成一篇学术论文，要求1000字左右。于第16周周五下午五点以前上交外语系陈永国信箱，不收电子版.','文化素质核心课',3,'本课主要用中文授课，如有留学生选此课，请注意需有一定的中文听说能力。','','',0,'','否','1981990013','参考书:各类西方文明史教材.',151),(251,'主权与人权',90,0.0,0,0,'10660033',10,'','文化素质核心课',3,'','新雅书院2015级课程。基础读写认证课程','',0,'','否','1981990014','',29),(252,'法律与文学',90,0.0,0,0,'10660023',10,'','文化素质核心课',3,'每周花在课程上的时间总共不少于8小时，不是随便听听期末交一篇“论文”就有学分的水课。不能保证时间投入的同学请绕道，一开始就不要选课，省得期中退课还要花银子。本课也不欢迎旁听，不读书不写作业也学不到啥。','新雅书院2015级课程。基础读写认证课程','',0,'一年级新生，文理工不限。','否','1981990015','\"1）鲁迅：《彷徨》，人民文学出版社，1979。\r\r2）笛福：《鲁滨逊漂流记》，徐霞村译本，人民文学出版社，1959。\r\r3）加缪：《局外人》，郭宏安译本，见：《加缪文集1：局外人.西绪福斯神话》，译林出版社，1998。\r\r4）莎士比亚：《威尼斯商人》，朱生豪译本，人民文学出版社，2012\r\r5）莎士比亚：《李尔王》，孙大雨译本，上海译文出版社，2012。\r\r6）索福克勒斯：《安提戈涅》，罗念生译本，校订本见：伯纳德特：《神圣的罪业》，张新樟译，朱振宇校，华夏出版社，2005。	\r\r7）曹雪芹、无名氏：《红楼梦》，人民文学出版社， 2008。\"',29),(253,'法律基础',0,0.0,0,0,'10660012',10,'考试','文化素质核心课',2,'不需要先期课','','2016',0,'无','否','1981990016','李宏勃《浓缩法学》',100),(254,'绿色建筑与可持续发展',90,0.0,0,0,'990021',17,'','文化素质核心课',1,'','','',0,'','否','1981990017','',151),(255,'超越学科的认知基础',90,0.0,0,0,'11510033',19,'','文化素质核心课',3,'','新雅书院课程。基础读写认证课程','2015',0,'','否','1981990018','',29),(256,'工业系统基础',90,0.0,0,0,'11510023',19,'学生考核采取过程控制，成绩由3部分组成，考勤情况占30%，学习日志质量占20%，小组工程案例研讨和完成质量占50%。','文化素质核心课',3,'文科生必修课，文化素质教育核心基础课。','基础理工(STEM)认证课程','',0,'无','否','1981990019','汤彬等主编，工业系统概论（第三版），清华大学出版社，2016年3月 ',100),(257,'制造工程实践',91,0.0,0,0,'11510013',19,'','文化素质核心课',3,'','基础理工(STEM)认证课程。工科、理科学生勿选','',0,'','否','1981990020','',120),(258,'制造工程实践',92,0.0,0,0,'11510013',19,'','文化素质核心课',3,'','基础理工(STEM)认证课程。工科、理科学生勿选','',0,'','否','1981990021','',120),(259,'制造工程实践',93,0.0,0,0,'11510013',19,'','文化素质核心课',3,'','基础理工(STEM)认证课程。工科、理科学生勿选','',0,'','否','1981990022','',120),(260,'工业系统概论',90,0.0,0,0,'1510022',19,'','文化素质核心课',2,'','','',0,'','否','1981990023','',80),(261,'工业文明与工程文化',90,0.0,0,0,'1510142',19,'考查，以百分制计分','文化素质核心课',2,'本系列课程包括“工业系统概论1”（31510042）、“工业系统实践”（31510082）、“工业文明和工程文化”（01510142）和“工业系统概论”（01510022）等4门课程。只能选其一课程。','','',0,'无','否','1981990024','\"汤彬等主编，工业系统概论（第三版），清华大学出版社，2016年3月 \r\r\"',80),(262,'制造工程体验',91,0.0,0,0,'1510162',19,'','文化素质核心课',2,'','','',0,'','否','1981990025','',180),(263,'制造工程体验',92,0.0,0,0,'1510162',19,'','文化素质核心课',2,'','','',0,'','否','1981990026','',180),(264,'制造工程体验',93,0.0,0,0,'1510162',19,'','文化素质核心课',2,'','','',0,'','否','1981990027','',180),(265,'实验室科研探究（4）',90,0.0,0,0,'S1510051',19,'课程采用过程控制，以出勤记录表、学习日志为考核依据（课程进行减负，不再要求大作业），记通过/不通过。若有缺勤情况，在讲座单元有余量时（余量在网络学堂公布），可自动通过参加讲座单元来弥补。','文化素质核心课',1,'此课属于实验课系列，1级选课后必须在规定时间进行2级选课，选择8个单元。选课结束后，学生须通过登陆info到实验课栏目下查询是否已选教学单元周次及时间。本课程通常于前8周结束主要教学活动。','二级选课课程，共100多个项目，学生必须选8个项目，如果从未上过概论课，则概论课为必选项目','',0,'无先修要求，课程通常于前8周结束。','是','1981990028','\"课程尚无统一教材。\r\r　　各教学单元在网络学堂上已经上传了相关教学资料和视频资料，以供学生上课前预习使用。\r\r\"',200),(266,'实验室科研探究（3）',90,0.0,0,0,'S1510041',19,'课程采用过程控制，以出勤记录表、学习日志为考核依据（课程进行减负，不再要求大作业），记通过/不通过。若有缺勤情况，在讲座单元有余量时（余量在网络学堂公布），可自动通过参加讲座单元来弥补。','文化素质核心课',1,'此课属于实验课系列，1级选课后必须在规定时间进行2级选课，选择8个单元。选课结束后，学生须通过登陆info到实验课栏目下查询是否已选教学单元周次及时间。本课程通常于前8周结束主要教学活动。','二级选课课程，共100多个项目，学生必须选8个项目，如果从未上过概论课，则概论课为必选项目','',0,'无先修要求，课程通常于前8周结束','是','1981990029','\"课程尚无统一教材。\r\r　　各教学单元在网络学堂上已经上传了相关教学资料和视频资料，以供学生上课前预习使用。\"',200),(267,'实验室科研探究（2）',90,0.0,0,0,'S1510031',19,'课程采用过程控制，以出勤记录表、学习日志为考核依据（课程进行减负，不再要求大作业），记通过/不通过。若有缺勤情况，在讲座单元有余量时（余量在网络学堂公布），可自动通过参加讲座单元来弥补。','文化素质核心课',1,'此课属于实验课系列，1级选课后必须在规定时间进行2级选课，选择8个单元。选课结束后，学生须通过登陆info到实验课栏目下查询是否已选教学单元周次及时间。本课程通常于前8周结束主要教学活动。','二级选课课程，共100多个项目，学生必须选8个项目，如果从未上过概论课，则概论课为必选项目','',0,'无先修要求，课程通常于前8周结束 ','是','1981990030','\"课程尚无统一教材。\r\r　　各教学单元在网络学堂上已经上传了相关教学资料和视频资料，以供学生上课前预习使用。\r\r\"',400),(268,'实验室科研探究（1）',90,0.0,0,0,'S1510021',19,'课程采用过程控制，以出勤记录表、学习日志为考核依据（课程进行减负，不再要求大作业），记通过/不通过。若有缺勤情况，在讲座单元有余量时（余量在网络学堂公布），可自动通过参加讲座单元来弥补。','文化素质核心课',1,'此课属于实验课系列，1级选课后必须在规定时间进行2级选课，选择8个单元。选课结束后，学生须通过登陆info到实验课栏目下查询。本课程通常于前8周结束主要教学活动，但有部分单元安排后继“究”的学习。','二级选课课程，共100多个项目，学生必须选8个项目，如果从未上过概论课，则概论课为必选项目','',100,'无先修要求，课程通常于前8周结束 ','是','1981990031','\"课程尚无统一教材。\r\r　　各教学单元在网络学堂上已经上传了相关教学资料和视频资料，以供学生上课前预习使用。\r\r\"',1001),(269,'审美的历程',90,0.0,0,0,'680082',12,'\"日常学习小结与结课考核论文相结合，结课论文需达到2000字以上。\r\r（每次日常小结能认真思考，不限字数，且达到论文要求，结课论文可予以免除）。\r\r\"','文化素质核心课',2,'希望提升自身人文素养，有志于人文社会学科研究均可。','在线课程','',0,'','否','1981990032','\"1，《审美的历程》\r\r2，参考书目及资料届时将上传网络学堂。\"',801),(270,'中国政府与政治',90,0.0,0,0,'680042',12,'','文化素质核心课',2,'','','',0,'','否','1981990033','',100),(271,'《史记》研读',90,0.0,0,0,'10691093',13,'\"（1）平时作业3篇，占45%\r\r（2）实践报告1篇，占15%\r\r（3）期末开卷考试，占30%\r\r（4）课堂讨论，占10%\"','文化素质核心课',3,'\"（1）本课程每堂课均将采用圆桌式研讨的方式，师生共同探索、共同碰撞，完全避免灌输式讲授。\r\r（2）本课程预习量大，作业量大。请修习的同学做好充分的思想准备。\"','14:20开始上课','2016',0,'','否','1981990034','\"教材： \r\r◆《史记》（含三家注），中华书局1959/ 1982/1999/2013年版。\r\r参考书：\r\r1. 钱穆《中国史学名著》\r\r2. 鲁迅《故事新编》\"',29),(272,'西方文化与电影解读',90,0.0,0,0,'691272',13,'','文化素质核心课',2,'','','',0,'','否','1981990035','',40),(273,'不朽的艺术：走进大师与经典',90,0.0,0,0,'691153',13,'本课程以线上讨论、线下导修和期末现场作文考试三个环节考核情况为成绩评定依据。期末现场作文考试为限制性开卷：允许使用纸质参考资料，禁止携带笔记本电脑、手机等电子信息设备进入考场。','文化素质核心课',3,'','基础读写认证课程。混合式教学，线下辅导6次','',0,'','否','1981990036','《不朽的艺术》：东方出版社出版。',147),(274,'西方哲学精神探源',91,0.0,0,0,'691383',13,'','文化素质核心课',3,'','基础读写认证课程。讲授32学时，课外辅导16学时','',0,'','否','1981990037','',450),(275,'西方哲学精神探源',92,0.0,0,0,'691383',13,'','文化素质核心课',3,'','基础读写认证课程。混合式教学，线下辅导5次','',0,'','否','1981990038','',450),(276,'《孟子》研读',90,0.0,0,0,'10691173',13,'','文化素质核心课',3,'','基础读写认证课程','2016',0,'','否','1981990039','',29),(277,'民族文化与民族命运',90,0.0,0,0,'10691163',13,'','文化素质核心课',3,'','基础读写认证课程。讲授32学时，课外辅导16学时','',0,'','是','1981990040','',300),(278,'大学精神之源流',90,0.0,0,0,'10691153',13,'出勤率占10%；小组讨论占20%；课程论文答辩及报告、读书笔记等占30%；闭卷考试占40%。','文化素质核心课',3,'','基础读写认证课程。课程讲授32学时，课外辅导16学时','',0,'大一学生','否','1981990041','约翰&#8226;亨利&#8226;纽曼：《大学的理想》，浙江教育出版社，2001年；艾伦&#8226;布卢姆：《美国精神的封闭》译林出版社， 2011年；德里克&#8226;博克：《回归大学之道》华东师范大学出版社，2008年；哈瑞&#8226;刘易斯：《失去灵魂的卓越》，华东师范大学出版社，2007年；哈佛通识教育委员会：《哈佛通识教育红皮书》，北京大学出版社.2010年；陈洪捷： 《德国古典大学观及其对中国高等教育的影响》.北京大学出版社.2006年；邓洪波：《中国书院史》，中国出版集团东方出版中心，2006年；许美德：《中国大学1895-1995:一个文化冲突的世纪》，教育科学出版社；雅斯贝尔斯：《什么是教育》，生活·读书·新知三联书店，1991；大卫·帕尔菲曼（David Palfreyman）《高等教育何以为“高”——牛津导师制教学反思》，.北京大学出版社.2011；肯·贝恩：《如何成为卓越的大学生》.北京大学出版社.2015；庞海芍：《通识教育——困境与希望》，北京理工大学出版社2009年版。',30),(279,'中国现代文学经典',90,0.0,0,0,'10691143',13,'','文化素质核心课',3,'','基础读写认证课程','2016',0,'','否','1981990042','',29),(280,'隋唐五代史',90,0.0,0,0,'10691133',13,'','文化素质核心课',3,'','新雅书院课程。基础读写认证课程','',0,'','否','1981990043','',34),(281,'柏拉图哲学入门',90,0.0,0,0,'691263',13,'\"课堂授课、讨论（30%）\r\r个人阅读（20%）\r\r期末考试（50%）\"','文化素质核心课',3,'\"本课程为人文素质课，课容量15-20人。\r\r\"','已修西方哲学精神探源或其他西方哲学史课程','',0,'\"推荐先修课程：西方哲学精神探源（00690342）\r\r如未修此课，学生英文程度应较高，应事先阅读过希腊哲学史方面的著作。\"','否','1981990044','\"John M. Cooper， ed.， Plato Complete Works， Hackett Publishing Company， Inc. 1997.\r\r柏拉图：《柏拉图全集》，王晓朝译，北京：人民出版社，2003年。\r\r王晓朝译，《柏拉图全集》（修订版），待出。\r\r王晓朝著：《希腊哲学简史——从荷马到奥古斯丁》，上海：三联出版社，2007年。\"',20),(282,'宗教学基础知识',90,0.0,0,0,'691223',13,'期末考试为闭卷考，占50%；完成小组专题研究各环节占40%（包括：小组专题研究的报告或PPT，占20%；小组专题研究成果的课堂展示以及问答环节的表现，占20%）；平时表现（出勤等）占10%。','文化素质核心课',3,'按时上课，认真听讲，仔细阅读教材和原典；认真准备，分组讨论时积极发言；独立思考，分工协作，努力完成小组专题研究。','基础读写认证课程。讲授32学时，课外辅导16学时','',0,'无','否','1981990045','\"《马克思恩格斯列宁论宗教》，人民出版社，2010年。\r\r张志刚主编：《宗教研究指要》（修订版），北京大学出版社，2013年。\r\r王晓朝：《宗教学基础15讲》，北京大学出版社，2003年。\r\r吕大吉：《宗教学通论新编》，中国社会科学出版社， 1998年。\r\rWaardenburg， Jacques， Classical Approaches to the Study of Religion: Aims， Methods and Theories of Research， New York : Walter de Gruyter， 1999.\r\r\"',200),(283,'1966-1976年中国文化史论',90,0.0,0,0,'690702',13,'','文化素质核心课',2,'','','',0,'','否','1981990046','',248),(284,'唐宋词鉴赏',90,0.0,0,0,'690863',13,'','文化素质核心课',3,'','','',0,'','否','1981990047','',200),(285,'《庄子》导读',90,0.0,0,0,'690672',13,'课程论文50分；开卷考试50分。题型为问答题。重点为对讲授内容的理解。','文化素质核心课',2,'','','',0,'热爱中国传统文化，有较好古文阅读基础。最好读过《庄子》内篇。','否','1981990048','\"陈怡《庄子内篇精读》，高等教育出版社；\r\r陈鼓应《庄子今注今译》上，中华书局\"',450),(286,'《世说新语》与魏晋风度',90,0.0,0,0,'690292',13,'','文化素质核心课',2,'','','',0,'','否','1981990049','',152),(287,'《老子》与《论语》',92,0.0,0,0,'690262',13,'课程论文50分；开卷考试50分。题型为问答题，用于对讲授内容的考核。','文化素质核心课',2,'','','',0,'热爱中国传统文化，有较好古文阅读基础。','否','1981990050','\"陈怡、程钢：《老子论语今读》，高等教育出版社；\r\r陈鼓应：《老子注释及评介》，中华书局；\r\r杨伯峻：《论语注释》，中华书局\"',450),(288,'诗词格律与创作',90,0.0,0,0,'690793',13,'','文化素质核心课',3,'','','',0,'','否','1981990051','',80),(289,'大学语文',90,0.0,0,0,'690803',13,'','文化素质核心课',3,'','','',0,'','否','1981990052','',200),(290,'《老子》与《论语》',91,0.0,0,0,'690262',13,'','文化素质核心课',2,'','','',0,'','否','1981990053','',120),(291,'嬗变与碰撞：现代中国科学观念的演变',90,0.0,0,0,'700852',14,'','文化素质核心课',2,'','','',0,'','否','1981990054','',40),(292,'国际关系分析',90,0.0,0,0,'701344',14,'','文化素质核心课',4,'','限:2015学生选课；基础读写认证课程','',0,'','否','1981990055','',60),(293,'心理学入门',90,0.0,0,0,'701271',14,'考试','文化素质核心课',1,'','','',1,'','否','1981990056','',120),(294,'科学技术史系列讲座',90,0.0,0,0,'700302',14,'','文化素质核心课',2,'','','',0,'','否','1981990057','',260),(295,'俄罗斯科学技术与社会',90,0.0,0,0,'700722',14,'','文化素质核心课',2,'','','',0,'','否','1981990058','',32),(296,'后现代科学哲学',90,0.0,0,0,'700752',14,'','文化素质核心课',2,'','','',0,'','否','1981990059','',40),(297,'政治学概论',0,0.0,0,0,'40700273',14,'','文化素质核心课',3,'','优先:社双（国政）、社科6学生选课','2016',0,'','否','1981990060','',128),(298,'批判性思维与道德推理',4,0.0,0,0,'10510173',8,'','文化素质核心课',3,'','限:经管学院学生选课','2015',0,'','是','1981990061','',55),(299,'批判性思维与道德推理',1,0.0,0,0,'10510173',8,'','文化素质核心课',3,'','限:经管学院学生选课','2015',0,'','是','1981990062','',55),(300,'批判性思维与道德推理',2,0.0,0,0,'10510173',8,'','文化素质核心课',3,'','限:经管学院学生选课','2015',0,'','是','1981990063','',55),(301,'批判性思维与道德推理',3,0.0,0,0,'10510173',8,'','文化素质核心课',3,'','限:经管学院学生选课','2015',0,'','是','1981990064','',55),(302,'西方文明',2,0.0,0,0,'10510103',8,'总分100分，期中读书报告1篇（40%），期末闭卷考试（60%）。','文化素质核心课',3,'','限:经管学院学生选课','2016',0,'','否','1981990065','\"1.【美】列奥·施特劳斯、约瑟夫·克罗波西编，《政治哲学史》，河北人民出版社，1993年11月第1版。\r\r2．【美】雅克·巴尔赞著 林华译，《从黎明到衰落：西方文化生活五百年，1500年至今》（上下卷），中信出版社，2002年。\r\r\r\r\"',120),(303,'西方文明',1,0.0,0,0,'10510103',8,'','文化素质核心课',3,'','限:经管学院学生选课','2016',0,'','否','1981990066','',128),(304,'批判性思维与道德推理',5,0.0,0,0,'10510173',8,'','文化素质核心课',3,'','限:经管学院学生选课','2015',0,'','是','1981990067','',55),(305,'跨文化沟通',90,0.0,0,0,'670241',11,'\"平时作业60% （共三次，每次20%） \r\r课程小论文40%\"','文化素质核心课',1,'需要同学们有浓厚的国际交流意识，以及对我国与英美等国家文化差异的敏锐洞察。','','',0,'无','否','1981990068','\"教师每次课时提供复印材料（全部为英文）。\r\r\"',40),(306,'电影文化',90,0.0,0,0,'670143',11,'考试','文化素质核心课',3,'','','',10,'','否','1981990069','当代电影艺术导论，尹鸿著，高教出版社',245),(307,'艺术的启示',90,0.0,0,0,'10800163',16,'','文化素质核心课',3,'','限:新雅书院学生选课；14:20开始上课','2016',0,'','否','1981990070','',29),(308,'外国工艺美术史',90,0.0,0,0,'800042',16,'考试','文化素质核心课',2,'','全校性选修课','',0,'','否','1981990071','张夫也：《外国工艺美术史》，高等教育出版社',260),(309,'服饰赏析',90,0.0,0,0,'802961',16,'','文化素质核心课',1,'','','',0,'','否','1981990072','',20),(310,'中国工艺美术史',90,0.0,0,0,'800032',16,'','文化素质核心课',2,'','全校性选修课','',0,'','否','1981990073','',261),(311,'大学精神之源流',92,0.0,0,0,'11030013',18,'','文化素质核心课',3,'','限:2016、2015学生选课；基础读写认证课程','',0,'','是','1981990074','',100),(312,'大学精神之源流',91,0.0,0,0,'11030013',18,'','文化素质核心课',3,'','限:2016、2015学生选课；基础读写认证课程','',0,'','是','1981990075','',450),(313,'西方古典音乐文化',91,0.0,0,0,'781872',15,'设有期中闭卷考察和期末开卷论文一篇。','文化素质核心课',2,'需要学生学习态度积极端正','','',0,'','否','1981990076','\"\r\r《西方音乐史》唐纳德.格劳特\r\r《西方音乐通史》于润洋主编，985教材\r\r\r\r\r\r其他参考书:文史哲宗艺 各科，多多浏览阅读。\"',110),(314,'西方古典音乐文化',92,0.0,0,0,'781872',15,'设有期中闭卷考察和期末开卷论文一篇。','文化素质核心课',2,'需要学生学习态度积极端正','','',0,'','否','1981990077','\"\r\r《西方音乐史》唐纳德.格劳特\r\r《西方音乐通史》于润洋主编，985教材\r\r\r\r\r\r其他参考书:文史哲宗艺 各科，多多浏览阅读。\"',110),(315,'20世纪中国歌曲发展史',90,0.0,0,0,'781892',15,'','文化素质核心课',2,'','','',0,'','否','1981990078','',120),(316,'戏曲与中国传统文化',90,0.0,0,0,'781912',15,'','文化素质核心课',2,'','','',0,'','否','1981990079','',110),(317,'自我、他人与社会',0,0.0,0,0,'14700013',20,'','文化素质核心课',3,'','','2016',0,'','否','1981990080','',70);
/*!40000 ALTER TABLE `web_bbscourse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `web_bbsdept`
--

DROP TABLE IF EXISTS `web_bbsdept`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_bbsdept` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `D_Code` int(11) NOT NULL,
  `D_Name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `web_bbsdept`
--

LOCK TABLES `web_bbsdept` WRITE;
/*!40000 ALTER TABLE `web_bbsdept` DISABLE KEYS */;
/*!40000 ALTER TABLE `web_bbsdept` ENABLE KEYS */;
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
  `P_DislikeNum` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `web_bbspost_P_Course_id_6173fade_fk_web_bbscourse_id` (`P_Course_id`),
  KEY `web_bbspost_01d48799` (`P_User_id`),
  KEY `web_bbspost_P_Parent_id_7711709a_fk_web_bbspost_id` (`P_Parent_id`),
  KEY `web_bbspost_8d4e3b11` (`P_BestChild_id`),
  CONSTRAINT `web_bbspost_P_BestChild_id_b081df58_fk_web_bbspost_id` FOREIGN KEY (`P_BestChild_id`) REFERENCES `web_bbspost` (`id`),
  CONSTRAINT `web_bbspost_P_Course_id_6173fade_fk_web_bbscourse_id` FOREIGN KEY (`P_Course_id`) REFERENCES `web_bbscourse` (`id`),
  CONSTRAINT `web_bbspost_P_Parent_id_7711709a_fk_web_bbspost_id` FOREIGN KEY (`P_Parent_id`) REFERENCES `web_bbspost` (`id`),
  CONSTRAINT `web_bbspost_P_User_id_2eb5c6aa_fk_web_bbsuser_id` FOREIGN KEY (`P_User_id`) REFERENCES `web_bbsuser` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `web_bbspost`
--

LOCK TABLES `web_bbspost` WRITE;
/*!40000 ALTER TABLE `web_bbspost` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=153 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `web_bbsuser`
--

LOCK TABLES `web_bbsuser` WRITE;
/*!40000 ALTER TABLE `web_bbsuser` DISABLE KEYS */;
INSERT INTO `web_bbsuser` VALUES (3,'user0','','','','','',1,0,0,0,0,0,0,0,4,'',1),(4,'user1','','','',NULL,'',1,0,0,0,0,0,0,0,5,'',1),(5,'user2','','','',NULL,'',1,0,0,0,0,0,0,0,6,'',1),(6,'user3','','','',NULL,'',1,0,0,0,0,0,0,0,7,'',1),(7,'user4','','','',NULL,'',1,0,0,0,0,0,0,0,8,'',1),(8,'user5','','','',NULL,'',1,0,0,0,0,0,0,0,9,'',1),(9,'user6','','','',NULL,'',1,0,0,0,0,0,0,0,10,'',1),(10,'user7','','','',NULL,'',1,0,0,0,0,0,0,0,11,'',1),(11,'user8','','','',NULL,'',1,0,0,0,0,0,0,0,12,'',1),(12,'user9','','','',NULL,'',1,0,0,0,0,0,0,0,13,'',1),(13,'user10','','','',NULL,'',1,0,0,0,0,0,0,0,14,'',1),(14,'user11','','','',NULL,'',1,0,0,0,0,0,0,0,15,'',1),(15,'user12','','','',NULL,'',1,0,0,0,0,0,0,0,16,'',1),(16,'user13','','','',NULL,'',1,0,0,0,0,0,0,0,17,'',1),(17,'user14','','','',NULL,'',1,0,0,0,0,0,0,0,18,'',1),(18,'user15','','','',NULL,'',1,0,0,0,0,0,0,0,19,'',1),(19,'user16','','','',NULL,'',1,0,0,0,0,0,0,0,20,'',1),(20,'user17','','','',NULL,'',1,0,0,0,0,0,0,0,21,'',1),(21,'user18','','','',NULL,'',1,0,0,0,0,0,0,0,22,'',1),(22,'user19','','','',NULL,'',1,0,0,0,0,0,0,0,23,'',1),(23,'user20','','','',NULL,'',1,0,0,0,0,0,0,0,24,'',1),(24,'user21','','','',NULL,'',1,0,0,0,0,0,0,0,25,'',1),(25,'user22','','','',NULL,'',1,0,0,0,0,0,0,0,26,'',1),(26,'user23','','','',NULL,'',1,0,0,0,0,0,0,0,27,'',1),(27,'user24','','','',NULL,'',1,0,0,0,0,0,0,0,28,'',1),(28,'user25','','','',NULL,'',1,0,0,0,0,0,0,0,29,'',1),(29,'user26','','','',NULL,'',1,0,0,0,0,0,0,0,30,'',1),(30,'user27','','','',NULL,'',1,0,0,0,0,0,0,0,31,'',1),(31,'user28','','','',NULL,'',1,0,0,0,0,0,0,0,32,'',1),(32,'user29','','','',NULL,'',1,0,0,0,0,0,0,0,33,'',1),(33,'user30','','','',NULL,'',1,0,0,0,0,0,0,0,34,'',1),(34,'user31','','','',NULL,'',1,0,0,0,0,0,0,0,35,'',1),(35,'user32','','','',NULL,'',1,0,0,0,0,0,0,0,36,'',1),(36,'user33','','','',NULL,'',1,0,0,0,0,0,0,0,37,'',1),(37,'user34','','','',NULL,'',1,0,0,0,0,0,0,0,38,'',1),(38,'user35','','','',NULL,'',1,0,0,0,0,0,0,0,39,'',1),(39,'user36','','','',NULL,'',1,0,0,0,0,0,0,0,40,'',1),(40,'user37','','','',NULL,'',1,0,0,0,0,0,0,0,41,'',1),(41,'user38','','','',NULL,'',1,0,0,0,0,0,0,0,42,'',1),(42,'user39','','','',NULL,'',1,0,0,0,0,0,0,0,43,'',1),(43,'user40','','','',NULL,'',1,0,0,0,0,0,0,0,44,'',1),(44,'user41','','','',NULL,'',1,0,0,0,0,0,0,0,45,'',1),(45,'user42','','','',NULL,'',1,0,0,0,0,0,0,0,46,'',1),(46,'user43','','','',NULL,'',1,0,0,0,0,0,0,0,47,'',1),(47,'user44','','','',NULL,'',1,0,0,0,0,0,0,0,48,'',1),(48,'user45','','','',NULL,'',1,0,0,0,0,0,0,0,49,'',1),(49,'user46','','','',NULL,'',1,0,0,0,0,0,0,0,50,'',1),(50,'user47','','','',NULL,'',1,0,0,0,0,0,0,0,51,'',1),(51,'user48','','','',NULL,'',1,0,0,0,0,0,0,0,52,'',1),(52,'user49','','','',NULL,'',1,0,0,0,0,0,0,0,53,'',1),(53,'user50','','','',NULL,'',1,0,0,0,0,0,0,0,54,'',1),(54,'user51','','','',NULL,'',1,0,0,0,0,0,0,0,55,'',1),(55,'user52','','','',NULL,'',1,0,0,0,0,0,0,0,56,'',1),(56,'user53','','','',NULL,'',1,0,0,0,0,0,0,0,57,'',1),(57,'user54','','','',NULL,'',1,0,0,0,0,0,0,0,58,'',1),(58,'user55','','','',NULL,'',1,0,0,0,0,0,0,0,59,'',1),(59,'user56','','','',NULL,'',1,0,0,0,0,0,0,0,60,'',1),(60,'user57','','','',NULL,'',1,0,0,0,0,0,0,0,61,'',1),(61,'user58','','','',NULL,'',1,0,0,0,0,0,0,0,62,'',1),(62,'user59','','','',NULL,'',1,0,0,0,0,0,0,0,63,'',1),(63,'user60','','','',NULL,'',1,0,0,0,0,0,0,0,64,'',1),(64,'user61','','','',NULL,'',1,0,0,0,0,0,0,0,65,'',1),(65,'user62','','','',NULL,'',1,0,0,0,0,0,0,0,66,'',1),(66,'user63','','','',NULL,'',1,0,0,0,0,0,0,0,67,'',1),(67,'user64','','','',NULL,'',1,0,0,0,0,0,0,0,68,'',1),(68,'user65','','','',NULL,'',1,0,0,0,0,0,0,0,69,'',1),(69,'user66','','','',NULL,'',1,0,0,0,0,0,0,0,70,'',1),(70,'user67','','','',NULL,'',1,0,0,0,0,0,0,0,71,'',1),(71,'user68','','','',NULL,'',1,0,0,0,0,0,0,0,72,'',1),(72,'user69','','','',NULL,'',1,0,0,0,0,0,0,0,73,'',1),(73,'user70','','','',NULL,'',1,0,0,0,0,0,0,0,74,'',1),(74,'user71','','','',NULL,'',1,0,0,0,0,0,0,0,75,'',1),(75,'user72','','','',NULL,'',1,0,0,0,0,0,0,0,76,'',1),(76,'user73','','','',NULL,'',1,0,0,0,0,0,0,0,77,'',1),(77,'user74','','','',NULL,'',1,0,0,0,0,0,0,0,78,'',1),(78,'user75','','','',NULL,'',1,0,0,0,0,0,0,0,79,'',1),(79,'user76','','','',NULL,'',1,0,0,0,0,0,0,0,80,'',1),(80,'user77','','','',NULL,'',1,0,0,0,0,0,0,0,81,'',1),(81,'user78','','','',NULL,'',1,0,0,0,0,0,0,0,82,'',1),(82,'user79','','','',NULL,'',1,0,0,0,0,0,0,0,83,'',1),(83,'user80','','','',NULL,'',1,0,0,0,0,0,0,0,84,'',1),(84,'user81','','','',NULL,'',1,0,0,0,0,0,0,0,85,'',1),(85,'user82','','','',NULL,'',1,0,0,0,0,0,0,0,86,'',1),(86,'user83','','','',NULL,'',1,0,0,0,0,0,0,0,87,'',1),(87,'user84','','','',NULL,'',1,0,0,0,0,0,0,0,88,'',1),(88,'user85','','','',NULL,'',1,0,0,0,0,0,0,0,89,'',1),(89,'user86','','','',NULL,'',1,0,0,0,0,0,0,0,90,'',1),(90,'user87','','','',NULL,'',1,0,0,0,0,0,0,0,91,'',1),(91,'user88','','','',NULL,'',1,0,0,0,0,0,0,0,92,'',1),(92,'user89','','','',NULL,'',1,0,0,0,0,0,0,0,93,'',1),(93,'user90','','','',NULL,'',1,0,0,0,0,0,0,0,94,'',1),(94,'user91','','','',NULL,'',1,0,0,0,0,0,0,0,95,'',1),(95,'user92','','','',NULL,'',1,0,0,0,0,0,0,0,96,'',1),(96,'user93','','','',NULL,'',1,0,0,0,0,0,0,0,97,'',1),(97,'user94','','','',NULL,'',1,0,0,0,0,0,0,0,98,'',1),(98,'user95','','','',NULL,'',1,0,0,0,0,0,0,0,99,'',1),(99,'user96','','','',NULL,'',1,0,0,0,0,0,0,0,100,'',1),(100,'user97','','','',NULL,'',1,0,0,0,0,0,0,0,101,'',1),(101,'user98','','','',NULL,'',1,0,0,0,0,0,0,0,102,'',1),(102,'user99','','','',NULL,'',1,0,0,0,0,0,0,0,103,'',1),(103,'user100','','','',NULL,'',1,0,0,0,0,0,0,0,104,'',1),(104,'user101','','','',NULL,'',1,0,0,0,0,0,0,0,105,'',1),(105,'user102','','','',NULL,'',1,0,0,0,0,0,0,0,106,'',1),(106,'user103','','','',NULL,'',1,0,0,0,0,0,0,0,107,'',1),(107,'user104','','','',NULL,'',1,0,0,0,0,0,0,0,108,'',1),(108,'user105','','','',NULL,'',1,0,0,0,0,0,0,0,109,'',1),(109,'user106','','','',NULL,'',1,0,0,0,0,0,0,0,110,'',1),(110,'user107','','','',NULL,'',1,0,0,0,0,0,0,0,111,'',1),(111,'user108','','','',NULL,'',1,0,0,0,0,0,0,0,112,'',1),(112,'user109','','','',NULL,'',1,0,0,0,0,0,0,0,113,'',1),(113,'user110','','','',NULL,'',1,0,0,0,0,0,0,0,114,'',1),(114,'user111','','','',NULL,'',1,0,0,0,0,0,0,0,115,'',1),(115,'user112','','','',NULL,'',1,0,0,0,0,0,0,0,116,'',1),(116,'user113','','','',NULL,'',1,0,0,0,0,0,0,0,117,'',1),(117,'user114','','','',NULL,'',1,0,0,0,0,0,0,0,118,'',1),(118,'user115','','','',NULL,'',1,0,0,0,0,0,0,0,119,'',1),(119,'user116','','','',NULL,'',1,0,0,0,0,0,0,0,120,'',1),(120,'user117','','','',NULL,'',1,0,0,0,0,0,0,0,121,'',1),(121,'user118','','','',NULL,'',1,0,0,0,0,0,0,0,122,'',1),(122,'user119','','','',NULL,'',1,0,0,0,0,0,0,0,123,'',1),(123,'user120','','','',NULL,'',1,0,0,0,0,0,0,0,124,'',1),(124,'user121','','','',NULL,'',1,0,0,0,0,0,0,0,125,'',1),(125,'user122','','','',NULL,'',1,0,0,0,0,0,0,0,126,'',1),(126,'user123','','','',NULL,'',1,0,0,0,0,0,0,0,127,'',1),(127,'user124','','','',NULL,'',1,0,0,0,0,0,0,0,128,'',1),(128,'user125','','','',NULL,'',1,0,0,0,0,0,0,0,129,'',1),(129,'user126','','','',NULL,'',1,0,0,0,0,0,0,0,130,'',1),(130,'user127','','','',NULL,'',1,0,0,0,0,0,0,0,131,'',1),(131,'user128','','','',NULL,'',1,0,0,0,0,0,0,0,132,'',1),(132,'user129','','','',NULL,'',1,0,0,0,0,0,0,0,133,'',1),(133,'user130','','','',NULL,'',1,0,0,0,0,0,0,0,134,'',1),(134,'user131','','','',NULL,'',1,0,0,0,0,0,0,0,135,'',1),(135,'user132','','','',NULL,'',1,0,0,0,0,0,0,0,136,'',1),(136,'user133','','','',NULL,'',1,0,0,0,0,0,0,0,137,'',1),(137,'user134','','','',NULL,'',1,0,0,0,0,0,0,0,138,'',1),(138,'user135','','','',NULL,'',1,0,0,0,0,0,0,0,139,'',1),(139,'user136','','','',NULL,'',1,0,0,0,0,0,0,0,140,'',1),(140,'user137','','','',NULL,'',1,0,0,0,0,0,0,0,141,'',1),(141,'user138','','','',NULL,'',1,0,0,0,0,0,0,0,142,'',1),(142,'user139','','','',NULL,'',1,0,0,0,0,0,0,0,143,'',1),(143,'user140','','','',NULL,'',1,0,0,0,0,0,0,0,144,'',1),(144,'user141','','','',NULL,'',1,0,0,0,0,0,0,0,145,'',1),(145,'user142','','','',NULL,'',1,0,0,0,0,0,0,0,146,'',1),(146,'user143','','','',NULL,'',1,0,0,0,0,0,0,0,147,'',1),(147,'user144','','','',NULL,'',1,0,0,0,0,0,0,0,148,'',1),(148,'user145','','','',NULL,'',1,0,0,0,0,0,0,0,149,'',1),(149,'user146','','','',NULL,'',1,0,0,0,0,0,0,0,150,'',1),(150,'user147','','','',NULL,'',1,0,0,0,0,0,0,0,151,'',1),(151,'user148','','','',NULL,'',1,0,0,0,0,0,0,0,152,'',1),(152,'user149','','','',NULL,'',1,0,0,0,0,0,0,0,153,'',1);
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `web_courselabel`
--

LOCK TABLES `web_courselabel` WRITE;
/*!40000 ALTER TABLE `web_courselabel` DISABLE KEYS */;
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
-- Table structure for table `web_honor`
--

DROP TABLE IF EXISTS `web_honor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_honor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `H_Name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `H_Threshold` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `web_honor`
--

LOCK TABLES `web_honor` WRITE;
/*!40000 ALTER TABLE `web_honor` DISABLE KEYS */;
/*!40000 ALTER TABLE `web_honor` ENABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `web_userdislikecourse`
--

LOCK TABLES `web_userdislikecourse` WRITE;
/*!40000 ALTER TABLE `web_userdislikecourse` DISABLE KEYS */;
/*!40000 ALTER TABLE `web_userdislikecourse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `web_userdislikepost`
--

DROP TABLE IF EXISTS `web_userdislikepost`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_userdislikepost` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `PostID_id` int(11) NOT NULL,
  `UserID_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `web_userdislikepost_PostID_id_8d87e644_fk_web_bbspost_id` (`PostID_id`),
  KEY `web_userdislikepost_UserID_id_65cea421_fk_web_bbsuser_id` (`UserID_id`),
  CONSTRAINT `web_userdislikepost_PostID_id_8d87e644_fk_web_bbspost_id` FOREIGN KEY (`PostID_id`) REFERENCES `web_bbspost` (`id`),
  CONSTRAINT `web_userdislikepost_UserID_id_65cea421_fk_web_bbsuser_id` FOREIGN KEY (`UserID_id`) REFERENCES `web_bbsuser` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `web_userdislikepost`
--

LOCK TABLES `web_userdislikepost` WRITE;
/*!40000 ALTER TABLE `web_userdislikepost` DISABLE KEYS */;
/*!40000 ALTER TABLE `web_userdislikepost` ENABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `web_userfollowlabel`
--

LOCK TABLES `web_userfollowlabel` WRITE;
/*!40000 ALTER TABLE `web_userfollowlabel` DISABLE KEYS */;
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
  `Term` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `web_userhascourse_CourseID_id_506aadc7_fk_web_bbscourse_id` (`CourseID_id`),
  KEY `web_userhascourse_UserID_id_49e5c833_fk_web_bbsuser_id` (`UserID_id`),
  CONSTRAINT `web_userhascourse_CourseID_id_506aadc7_fk_web_bbscourse_id` FOREIGN KEY (`CourseID_id`) REFERENCES `web_bbscourse` (`id`),
  CONSTRAINT `web_userhascourse_UserID_id_49e5c833_fk_web_bbsuser_id` FOREIGN KEY (`UserID_id`) REFERENCES `web_bbsuser` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=934 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `web_userhascourse`
--

LOCK TABLES `web_userhascourse` WRITE;
/*!40000 ALTER TABLE `web_userhascourse` DISABLE KEYS */;
INSERT INTO `web_userhascourse` VALUES (604,185,63,-1,''),(605,214,63,-1,''),(606,83,63,-1,''),(607,185,64,-1,''),(608,214,64,-1,''),(609,83,64,-1,''),(610,185,65,-1,''),(611,214,65,-1,''),(612,83,65,-1,''),(613,185,66,-1,''),(614,214,66,-1,''),(615,83,66,-1,''),(616,185,67,-1,''),(617,214,67,-1,''),(618,83,67,-1,''),(619,185,68,-1,''),(620,214,68,-1,''),(621,83,68,-1,''),(622,185,69,-1,''),(623,214,69,-1,''),(624,83,69,-1,''),(625,185,70,-1,''),(626,214,70,-1,''),(627,83,70,-1,''),(628,185,71,-1,''),(629,214,71,-1,''),(630,83,71,-1,''),(631,185,72,-1,''),(632,214,72,-1,''),(633,83,72,-1,''),(634,185,73,-1,''),(635,214,73,-1,''),(636,83,73,-1,''),(637,185,74,-1,''),(638,214,74,-1,''),(639,83,74,-1,''),(640,185,75,-1,''),(641,214,75,-1,''),(642,83,75,-1,''),(643,185,76,-1,''),(644,214,76,-1,''),(645,83,76,-1,''),(646,185,77,-1,''),(647,214,77,-1,''),(648,83,77,-1,''),(649,185,78,-1,''),(650,214,78,-1,''),(651,83,78,-1,''),(652,185,79,-1,''),(653,214,79,-1,''),(654,83,79,-1,''),(655,185,80,-1,''),(656,214,80,-1,''),(657,83,80,-1,''),(658,185,81,-1,''),(659,214,81,-1,''),(660,83,81,-1,''),(661,185,82,-1,''),(662,214,82,-1,''),(663,83,82,-1,''),(664,185,83,-1,''),(665,214,83,-1,''),(666,83,83,-1,''),(667,185,84,-1,''),(668,214,84,-1,''),(669,83,84,-1,''),(670,185,85,-1,''),(671,214,85,-1,''),(672,83,85,-1,''),(673,185,86,-1,''),(674,214,86,-1,''),(675,83,86,-1,''),(676,185,87,-1,''),(677,214,87,-1,''),(678,83,87,-1,''),(679,185,88,-1,''),(680,214,88,-1,''),(681,83,88,-1,''),(682,185,89,-1,''),(683,214,89,-1,''),(684,83,89,-1,''),(685,185,90,-1,''),(686,214,90,-1,''),(687,83,90,-1,''),(688,185,91,-1,''),(689,214,91,-1,''),(690,83,91,-1,''),(691,185,92,-1,''),(692,214,92,-1,''),(693,83,92,-1,''),(694,185,93,-1,''),(695,214,93,-1,''),(696,83,93,-1,''),(697,185,94,-1,''),(698,214,94,-1,''),(699,83,94,-1,''),(700,185,95,-1,''),(701,214,95,-1,''),(702,83,95,-1,''),(703,185,96,-1,''),(704,214,96,-1,''),(705,83,96,-1,''),(706,185,97,-1,''),(707,214,97,-1,''),(708,83,97,-1,''),(709,185,98,-1,''),(710,214,98,-1,''),(711,83,98,-1,''),(712,185,99,-1,''),(713,214,99,-1,''),(714,83,99,-1,''),(715,185,100,-1,''),(716,214,100,-1,''),(717,83,100,-1,''),(718,185,101,-1,''),(719,214,101,-1,''),(720,83,101,-1,''),(721,185,102,-1,''),(722,214,102,-1,''),(723,83,102,-1,''),(724,185,103,-1,''),(725,214,103,-1,''),(726,83,103,-1,''),(727,185,104,-1,''),(728,214,104,-1,''),(729,83,104,-1,''),(730,185,105,-1,''),(731,214,105,-1,''),(732,83,105,-1,''),(733,185,106,-1,''),(734,214,106,-1,''),(735,83,106,-1,''),(736,185,107,-1,''),(737,214,107,-1,''),(738,83,107,-1,''),(739,185,108,-1,''),(740,214,108,-1,''),(741,83,108,-1,''),(742,185,109,-1,''),(743,214,109,-1,''),(744,83,109,-1,''),(745,185,110,-1,''),(746,214,110,-1,''),(747,83,110,-1,''),(748,185,111,-1,''),(749,214,111,-1,''),(750,83,111,-1,''),(751,185,112,-1,''),(752,214,112,-1,''),(753,83,112,-1,''),(754,185,113,-1,''),(755,214,113,-1,''),(756,83,113,-1,''),(757,185,114,-1,''),(758,214,114,-1,''),(759,83,114,-1,''),(760,185,115,-1,''),(761,214,115,-1,''),(762,83,115,-1,''),(763,185,116,-1,''),(764,214,116,-1,''),(765,83,116,-1,''),(766,185,117,-1,''),(767,214,117,-1,''),(768,83,117,-1,''),(769,185,118,-1,''),(770,214,118,-1,''),(771,83,118,-1,''),(772,185,119,-1,''),(773,214,119,-1,''),(774,83,119,-1,''),(775,185,120,-1,''),(776,214,120,-1,''),(777,83,120,-1,''),(778,185,121,-1,''),(779,214,121,-1,''),(780,83,121,-1,''),(781,185,122,-1,''),(782,214,122,-1,''),(783,83,122,-1,''),(784,185,123,-1,''),(785,214,123,-1,''),(786,83,123,-1,''),(787,185,124,-1,''),(788,214,124,-1,''),(789,83,124,-1,''),(790,185,125,-1,''),(791,214,125,-1,''),(792,83,125,-1,''),(793,185,126,-1,''),(794,214,126,-1,''),(795,83,126,-1,''),(796,185,127,-1,''),(797,214,127,-1,''),(798,83,127,-1,''),(799,185,128,-1,''),(800,214,128,-1,''),(801,83,128,-1,''),(802,185,129,-1,''),(803,214,129,-1,''),(804,83,129,-1,''),(805,185,130,-1,''),(806,214,130,-1,''),(807,83,130,-1,''),(808,185,131,-1,''),(809,214,131,-1,''),(810,83,131,-1,''),(811,185,132,-1,''),(812,214,132,-1,''),(813,83,132,-1,''),(814,185,133,-1,''),(815,214,133,-1,''),(816,83,133,-1,''),(817,185,134,-1,''),(818,214,134,-1,''),(819,83,134,-1,''),(820,185,135,-1,''),(821,214,135,-1,''),(822,83,135,-1,''),(823,185,136,-1,''),(824,214,136,-1,''),(825,83,136,-1,''),(826,185,137,-1,''),(827,214,137,-1,''),(828,83,137,-1,''),(829,185,138,-1,''),(830,214,138,-1,''),(831,83,138,-1,''),(832,185,139,-1,''),(833,214,139,-1,''),(834,83,139,-1,''),(835,185,140,-1,''),(836,214,140,-1,''),(837,83,140,-1,''),(838,185,141,-1,''),(839,214,141,-1,''),(840,83,141,-1,''),(841,185,142,-1,''),(842,214,142,-1,''),(843,83,142,-1,''),(844,185,143,-1,''),(845,214,143,-1,''),(846,83,143,-1,''),(847,185,144,-1,''),(848,214,144,-1,''),(849,83,144,-1,''),(850,185,145,-1,''),(851,214,145,-1,''),(852,83,145,-1,''),(853,185,146,-1,''),(854,214,146,-1,''),(855,83,146,-1,''),(856,185,147,-1,''),(857,214,147,-1,''),(858,83,147,-1,''),(859,185,148,-1,''),(860,214,148,-1,''),(861,83,148,-1,''),(862,185,149,-1,''),(863,214,149,-1,''),(864,83,149,-1,''),(865,185,150,-1,''),(866,214,150,-1,''),(867,83,150,-1,''),(868,185,151,-1,''),(869,214,151,-1,''),(870,83,151,-1,''),(871,185,152,-1,''),(872,214,152,-1,''),(873,83,152,-1,''),(874,185,3,-1,''),(875,185,4,-1,''),(876,185,5,-1,''),(877,185,6,-1,''),(878,185,7,-1,''),(879,185,8,-1,''),(880,185,9,-1,''),(881,185,10,-1,''),(882,185,11,-1,''),(883,185,12,-1,''),(884,185,13,-1,''),(885,185,14,-1,''),(886,185,15,-1,''),(887,185,16,-1,''),(888,185,17,-1,''),(889,185,18,-1,''),(890,185,19,-1,''),(891,185,20,-1,''),(892,185,21,-1,''),(893,185,22,-1,''),(894,185,23,-1,''),(895,185,24,-1,''),(896,185,25,-1,''),(897,185,26,-1,''),(898,185,27,-1,''),(899,185,28,-1,''),(900,185,29,-1,''),(901,185,30,-1,''),(902,185,31,-1,''),(903,185,32,-1,''),(904,185,33,-1,''),(905,185,34,-1,''),(906,185,35,-1,''),(907,185,36,-1,''),(908,185,37,-1,''),(909,185,38,-1,''),(910,185,39,-1,''),(911,185,40,-1,''),(912,185,41,-1,''),(913,185,42,-1,''),(914,185,43,-1,''),(915,185,44,-1,''),(916,185,45,-1,''),(917,185,46,-1,''),(918,185,47,-1,''),(919,185,48,-1,''),(920,185,49,-1,''),(921,185,50,-1,''),(922,185,51,-1,''),(923,185,52,-1,''),(924,185,53,-1,''),(925,185,54,-1,''),(926,185,55,-1,''),(927,185,56,-1,''),(928,185,57,-1,''),(929,185,58,-1,''),(930,185,59,-1,''),(931,185,60,-1,''),(932,185,61,-1,''),(933,185,62,-1,'');
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
-- Table structure for table `web_userlikecourse`
--

DROP TABLE IF EXISTS `web_userlikecourse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_userlikecourse` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `CourseID_id` int(11) NOT NULL,
  `UserID_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `web_userlikecourse_CourseID_id_b495f26a_fk_web_bbscourse_id` (`CourseID_id`),
  KEY `web_userlikecourse_UserID_id_dff84cc5_fk_web_bbsuser_id` (`UserID_id`),
  CONSTRAINT `web_userlikecourse_CourseID_id_b495f26a_fk_web_bbscourse_id` FOREIGN KEY (`CourseID_id`) REFERENCES `web_bbscourse` (`id`),
  CONSTRAINT `web_userlikecourse_UserID_id_dff84cc5_fk_web_bbsuser_id` FOREIGN KEY (`UserID_id`) REFERENCES `web_bbsuser` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `web_userlikecourse`
--

LOCK TABLES `web_userlikecourse` WRITE;
/*!40000 ALTER TABLE `web_userlikecourse` DISABLE KEYS */;
/*!40000 ALTER TABLE `web_userlikecourse` ENABLE KEYS */;
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

--
-- Table structure for table `web_userreportpost`
--

DROP TABLE IF EXISTS `web_userreportpost`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_userreportpost` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Reason` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `PostID_id` int(11) NOT NULL,
  `UserID_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `web_userreportpost_PostID_id_9573978c_fk_web_bbspost_id` (`PostID_id`),
  KEY `web_userreportpost_UserID_id_2ace42b1_fk_web_bbsuser_id` (`UserID_id`),
  CONSTRAINT `web_userreportpost_PostID_id_9573978c_fk_web_bbspost_id` FOREIGN KEY (`PostID_id`) REFERENCES `web_bbspost` (`id`),
  CONSTRAINT `web_userreportpost_UserID_id_2ace42b1_fk_web_bbsuser_id` FOREIGN KEY (`UserID_id`) REFERENCES `web_bbsuser` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `web_userreportpost`
--

LOCK TABLES `web_userreportpost` WRITE;
/*!40000 ALTER TABLE `web_userreportpost` DISABLE KEYS */;
/*!40000 ALTER TABLE `web_userreportpost` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-08-10 23:00:47
