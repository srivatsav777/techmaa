-- MySQL dump 10.13  Distrib 5.7.25, for Linux (x86_64)
--
-- Host: localhost    Database: test
-- ------------------------------------------------------
-- Server version	5.7.25-0ubuntu0.18.04.2

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
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add user',4,'add_user'),(11,'Can change user',4,'change_user'),(12,'Can delete user',4,'delete_user'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add event',7,'add_event'),(20,'Can change event',7,'change_event'),(21,'Can delete event',7,'delete_event'),(22,'Can add event_attended',8,'add_event_attended'),(23,'Can change event_attended',8,'change_event_attended'),(24,'Can delete event_attended',8,'delete_event_attended'),(25,'Can add participant',9,'add_participant'),(26,'Can change participant',9,'change_participant'),(27,'Can delete participant',9,'delete_participant');
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
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$100000$VQ4Br4oH31yz$+/nQVVw+jKm5wt6XlBeESk+tXe9CNvZZjTKsoGu6Vrg=','2019-02-11 13:47:10.446511',1,'admin','','','srivatsavkondragunta@gmail.com',1,1,'2019-02-11 13:46:35.539763');
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
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
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
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(6,'sessions','session'),(7,'tedmaa','event'),(8,'tedmaa','event_attended'),(9,'tedmaa','participant');
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
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2019-02-11 13:28:14.465000'),(2,'auth','0001_initial','2019-02-11 13:28:15.151792'),(3,'admin','0001_initial','2019-02-11 13:28:15.323588'),(4,'admin','0002_logentry_remove_auto_add','2019-02-11 13:28:15.353781'),(5,'contenttypes','0002_remove_content_type_name','2019-02-11 13:28:15.440901'),(6,'auth','0002_alter_permission_name_max_length','2019-02-11 13:28:15.453857'),(7,'auth','0003_alter_user_email_max_length','2019-02-11 13:28:15.470714'),(8,'auth','0004_alter_user_username_opts','2019-02-11 13:28:15.482433'),(9,'auth','0005_alter_user_last_login_null','2019-02-11 13:28:15.530556'),(10,'auth','0006_require_contenttypes_0002','2019-02-11 13:28:15.539677'),(11,'auth','0007_alter_validators_add_error_messages','2019-02-11 13:28:15.570579'),(12,'auth','0008_alter_user_username_max_length','2019-02-11 13:28:15.601739'),(13,'auth','0009_alter_user_last_name_max_length','2019-02-11 13:28:15.626056'),(14,'sessions','0001_initial','2019-02-11 13:28:15.673932'),(15,'tedmaa','0001_initial','2019-02-11 13:38:10.083228'),(16,'tedmaa','0002_auto_20190212_1319','2019-02-12 13:19:50.616163'),(17,'tedmaa','0003_auto_20190212_1319','2019-02-12 13:19:50.631582'),(18,'tedmaa','0004_auto_20190212_1322','2019-02-12 13:22:34.041620'),(19,'tedmaa','0005_auto_20190212_1334','2019-02-12 13:34:30.977551'),(20,'tedmaa','0006_remove_event_upload','2019-02-12 15:10:13.770295'),(21,'tedmaa','0007_auto_20190213_1803','2019-02-13 18:03:17.583694'),(22,'tedmaa','0008_event_attended_participant','2019-02-13 18:43:10.921148');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('ddbsfbw19biztfyjvvpcgjyx8vujvo5t','OTFiYTRkOWMwNTI3YTEwYjI5NzNhODVkNDY3NWQ1ZjVkYTRjMWIyYjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjZmNkMDMzOTUwODJkM2YwMDU3NTcyMmUyNGFjODg4NTIzYWRiYmFlIn0=','2019-02-25 13:47:10.450115');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tedmaa_event`
--

DROP TABLE IF EXISTS `tedmaa_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tedmaa_event` (
  `event_id` int(11) NOT NULL,
  `event_name` varchar(200) NOT NULL,
  `organizers_name` varchar(200) NOT NULL,
  `resource_person_name` varchar(200) NOT NULL,
  `from_date` date NOT NULL,
  `to_date` date NOT NULL,
  `type_of_event` varchar(200) NOT NULL,
  `aor` double NOT NULL,
  `asa` double NOT NULL,
  `type_of_proof` varchar(200) NOT NULL,
  PRIMARY KEY (`event_id`),
  UNIQUE KEY `tedmaa_event_event_id_35a03fd5_uniq` (`event_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tedmaa_event`
--

LOCK TABLES `tedmaa_event` WRITE;
/*!40000 ALTER TABLE `tedmaa_event` DISABLE KEYS */;
INSERT INTO `tedmaa_event` VALUES (0,'GATE Awareness Program','1 Mrs T Sri Lakshmi','Ms Navatha Vijayawada','2018-06-28','2018-06-28','Guest Lecture',5000,5000,'BROCHURE'),(1,'Research trends in Computer Field','1 Mrs D Sree Lakshmi','Dr D V L N Somayajulu NIT Warangal','2018-06-07','2018-06-07','Faculty Interaction Program',5000,5000,'BROCHURE'),(2,'I Year Orientation Program','All Faculty','Principal TPO I Year HOD sir All faculty members of CSE dept ','2018-06-18','2018-06-18','Orientation Program',5000,5000,'BROCHURE'),(3,'II Year Orientation Program','1 Mrs Ch Ratna Jyothi','Dr A Sudhir Babu','2018-02-07','2018-02-07','Orientation Program',5000,5000,'BROCHURE'),(4,'Awareness Program on Internships','1 Mrs D Swapna 2 Mr N V Ramana Gupta','datetime datetime strptime request POST get fdate d m Y strftime Y m d ','2018-11-07','2018-11-07','Awareness Program',5000,5000,'BROCHURE'),(5,'Intellectual Rights by Patents Hyderabad','1 Mr N V Ramana Gupta 2 Ms A Divya','Mr KVVS Krishna Prasad','2018-07-13','2018-07-13','Awareness Program',5000,5000,'BROCHURE'),(6,'Applications of programming languages in academics and industries','1 Mrs A Madhuri','Mr KV Krishna Rao Hyderabad','2018-07-18','2018-07-18','Seminar',5000,5000,'BROCHURE'),(7,'ROBOTICS','1 Mr K Vijay Kumar','Mr Mohapatra SAK Robotics','2018-07-19','2018-07-20','Student Training program',5000,5000,'BROCHURE'),(8,'Challengens and Opportunities in IT Sector','1 Mrs D Swapna','Dr K Sai Manoj Hyderabad','2018-07-25','2018-07-25','Seminar',5000,5000,'BROCHURE'),(9,'Analytics using Hadoop and NoSQL','1 Mr N V Ramana Gupta 2 Mrs D Sree Lakshmi','Mr Amar Sharma Founder CEO WOIR Software Pvt Ltd Hyderabad','2018-08-16','2018-08-18','Hands on Workshop',5000,5000,'BROCHURE'),(10,'Progressive Web Apps','Mr A Vanamala Kumar','P Hanuman kumar Trainer from APSSDC','2018-07-05','2018-07-11','Workshop',5000,5000,'BROCHURE'),(11,'Indian Game Development Challenge','Mr A Vanamala Kumar','P Naga Prasanna Lakshmi Trainer from APSSDC','2018-08-27','2018-09-28','workshop',5000,5000,'BROCHURE'),(12,'Embedded through IoT','Mr A Vanamala Kumar','B Mahidhar Trainer from APSSDC','2018-09-22','2018-09-24','workshop',5000,5000,'BROCHURE'),(13,'Technical Quiz In Association with ISTE','1 Mrs Ch Ratna Jyothi 2 Mr IMV Krishna','1 Mrs T Sri Lakshmi 2 Mrs Y Surekha 3 Mr S Phani Praveen','2018-09-14','2018-09-14','Student Development Program',5000,5000,'BROCHURE'),(14,'Group Discussion In Association with ISTE','1 Mrs Ch Ratna Jyothi 2 Mr IMV Krishna','1 Dr K Koteswara rao 2 Mrs D Sree Lakshmi 3 Mrs A Divya','2018-09-14','2018-09-14','Student Development Program',5000,5000,'BROCHURE'),(15,'Code Race In Association with ISTE','1 Mrs Ch Ratna Jyothi 2 Mr IMV Krishna','1 Mrs J Rama Devi 2 Mrs D Swapna 3 Mrs V Siva Parvathi 4 Mrs M Sailaja','2018-09-15','2018-09-15','Student Development Program',5000,5000,'BROCHURE'),(16,'Technical Paper Presentation In Association with ISTE','1 Mrs Ch Ratna Jyothi 2 Mr IMV Krishna','1 Dr B Janaki Ramayya 2 Mrs G Lalita Kumari 3 Mrs A Madhuri','2018-09-15','2018-09-15','Student Development Program',5000,5000,'BROCHURE'),(17,'Digital Marketing','1 Mrs Ch Ratna Jyothi 2 Mr IMV Krishna','S Siva Lalitha CEO Hyper Techno Solutions Vijayawada','2018-09-28','2018-08-29','STTP',5000,5000,'BROCHURE'),(18,'Higher education Opportunities in USA','1 Mrs J rama devi 2 Mrs A Divya','Mr J S PRASAD University of central oklahama','2018-01-10','2018-01-10','student interaction program',5000,5000,'BROCHURE'),(19,'Self motivation towards R D activities','Dr A Sudhir Babu','Dr P TRIMURTHY EX president of CSI INDIA','2018-06-10','2018-06-10','FDP',5000,5000,'BROCHURE'),(20,'Intellectual Rights by Patents','Mr N V Ramana Gupta','Ms Hema Vizag','2018-11-24','2018-11-24','Seminar',5000,5000,'BROCHURE'),(21,'Introduction to Python Programming','T Sri Lakshmi','K Aravind IV B Tech Student PVPSIT','2018-12-21','2018-12-21','Refresher Course',5000,5000,'BROCHURE'),(22,'Machine Learning and it s Applications','T Sri Lakshmi','Dr V Sunil Kumar Principal Scientist Philips Research India Ltd Bengaluru','2018-12-27','2018-12-29','Workshop',5000,5000,'BROCHURE'),(23,'Microsoft Azure Features and Its Applications','1 Mr N V Ramana Gupta 2 Mrs D Sree Lakshmi','Mr Somayajulu Pola Associate Architect Microsoft Hyderabad','2019-01-04','2019-01-05','STP',5000,5000,'BROCHURE'),(24,'Ensuring quality of Large software Projects','1 Ms G Lalitha Kumari 2 Ms Y Surekha','Dr V S R Krishnaiah Deputy Director General Retired NIC India','2018-09-01','2018-09-01','Student Seminar',5000,5000,'BROCHURE');
/*!40000 ALTER TABLE `tedmaa_event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tedmaa_event_attended`
--

DROP TABLE IF EXISTS `tedmaa_event_attended`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tedmaa_event_attended` (
  `event_id` int(11) NOT NULL,
  `event_name` varchar(200) NOT NULL,
  `organizers_name` varchar(200) NOT NULL,
  `resource_person_name` varchar(200) NOT NULL,
  `from_date` date NOT NULL,
  `to_date` date NOT NULL,
  `inst_name` varchar(200) NOT NULL,
  `type_of_event` varchar(200) NOT NULL,
  `aor` double NOT NULL,
  `asa` double NOT NULL,
  `type_of_proof` varchar(200) NOT NULL,
  PRIMARY KEY (`event_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tedmaa_event_attended`
--

LOCK TABLES `tedmaa_event_attended` WRITE;
/*!40000 ALTER TABLE `tedmaa_event_attended` DISABLE KEYS */;
INSERT INTO `tedmaa_event_attended` VALUES (1,'Artificial Intelligence and Deep Learning','Mrs sree lakshmi','','2019-01-26','2019-01-28','VRSEC Vijayawada','workshop',5000,3000,'BROCHURE'),(2,'1 Day NPTELWorkshop','Mrs sree lakshmi','','2019-01-19','2019-01-19','At IC SR by IIT Madras','workshop',5000,3000,'BROCHURE'),(3,'1 Day Workshop on Effective Mentoring in NPTEL Online Courses ','Mrs sree lakshmi','','2019-01-18','2019-01-18','IIT Madras','workshop',5000,3000,'BROCHURE'),(4,'Delivered a Guest Lecture on Soft Computing and it s applications ','Mrs sree lakshmi','','2018-12-31','2018-12-31','Swamy Vivekananda Engineering College Bobbili','Guest Lecture',5000,3000,'BROCHURE'),(5,'Delivered a Guest Lecture on Quality publications and Funding Schemes ','Mrs sree lakshmi','','2018-12-26','2018-12-26','Swamy Vivekananda Engineering College Bobbili','Guest Lecture',5000,3000,'BROCHURE'),(6,'Sixth Internation Conference on Big Data Analytics BDA 2018 ','Mrs sree lakshmi','','2018-12-18','2018-12-21','NITW Warangal','Conference',5000,3000,'BROCHURE'),(7,'Acted as SPOC for SWAYAM','Mrs sree lakshmi','','2018-06-01','2018-10-01','NPTEL','Online',5000,3000,'BROCHURE'),(8,'Scientific Computations with Python','Mrs sree lakshmi','1 S Srinivasan 2 Dr D Srinivasacharya 3 Dr S Ravichandra 4 Nagesh Batt','2018-11-20','2018-11-20','Dept of CSE and Mathematics NIT Warangal Warangal','FDP',5000,3000,'BROCHURE'),(9,'Scientific Computations with Python','Mrs sree lakshmi','1 S Srinivasan 2 Dr D Srinivasacharya 3 Dr S Ravichandra 4 Nagesh Batt','2018-11-20','2018-11-20','Dept of CSE and Mathematics NIT Warangal Warangal','FDP',5000,3000,'BROCHURE'),(10,'introduction to Network Security','Mrs sree lakshmi','','2018-12-03','2018-12-07','NITTTR Kolkata','STTP',5000,3000,'BROCHURE'),(11,'Scientific Computations with Python','Mrs sree lakshmi','1 S Srinivasan 2 Dr D Srinivasacharya 3 Dr S Ravichandra 4 Nagesh Batt','2018-11-20','2018-11-20','Dept of CSE and Mathematics NIT Warangal Warangal','FDP',5000,3000,'BROCHURE'),(12,'Scientific Computations with Python','Mrs sree lakshmi','1 S Srinivasan 2 Dr D Srinivasacharya 3 Dr S Ravichandra 4 Nagesh Batt','2018-11-20','2018-11-20','Dept of CSE and Mathematics NIT Warangal Warangal','FDP',5000,3000,'BROCHURE'),(13,'Delivered a Guest Lecture on How to Write a research paper ','Mrs sree lakshmi','Dr B JanakiRamaiah','2018-11-23','2018-11-23','Dept of CSE Gudlavalleru Engg College Gudlavalleru','FDP',5000,3000,'BROCHURE'),(14,'NPTEL Online Certification Joy of computing using Python','Mrs sree lakshmi','','2018-08-28','2018-10-28','IIT Ropar','workshop',5000,3000,'BROCHURE'),(15,'NPTEL Online Certification on Database Management System','Mrs sree lakshmi','','2018-08-28','2018-10-28','IIT Kanpur','workshop',5000,3000,'BROCHURE'),(16,'NPTEL Online Certificationon Introduction to Programming in C','Mrs sree lakshmi','','2018-08-28','2018-10-28','IIT Kanpur','workshop',5000,3000,'BROCHURE'),(17,'NPTEL Online Certification on Introduction to Programming in C','Mrs sree lakshmi','','2018-08-28','2018-10-28','IIT Kanpur','workshop',5000,3000,'BROCHURE'),(18,'International Conference on Nano Science Engineering Applications 2018','Mrs sree lakshmi','','2018-10-04','2018-10-06','JNTUH Hyderabad','Conference',5000,3000,'BROCHURE'),(19,'Data Science and Its Applications','Mrs sree lakshmi','','2018-09-28','2018-09-29','PVPSIT','Two Day FDP',5000,3000,'BROCHURE'),(20,'World Summit on Accreditation WOSA 2018 at New Delhi on Challenges and Opportunities in Outcome Based Accreditation','Mrs sree lakshmi','','2018-09-07','2018-09-09','New Delhi','Conference',5000,3000,'BROCHURE'),(21,'Analytics using HADOOP NOSQL','Mrs sree lakshmi','Mr Amar sharma WOIR Software solutions Hyderbad','2018-08-16','2018-08-18','PVPSIT','workshop',5000,3000,'BROCHURE'),(22,'NPTEL Workshop','Mrs sree lakshmi','','2018-07-14','2018-07-14','IIT Madras','workshop',5000,3000,'BROCHURE'),(23,'International conference on Validity Index Utilizing Supervised Classifiers on Clusters ','Mrs sree lakshmi','','2018-06-30','2018-06-30','Vikas College of Engineering Technology','Conference',5000,3000,'BROCHURE'),(24,'International conference on A Study on Performance Analysis of Hierarichal Clustering and Sparse Hierarichal Clustering ','Mrs sree lakshmi','','2018-06-30','2018-06-30','Vikas College of Engineering Technology','Conference',5000,3000,'BROCHURE'),(25,'ANN and Deep Learning','Mrs sree lakshmi','','2018-06-11','2018-06-15','NITW','FDP',5000,3000,'BROCHURE');
/*!40000 ALTER TABLE `tedmaa_event_attended` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tedmaa_participant`
--

DROP TABLE IF EXISTS `tedmaa_participant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tedmaa_participant` (
  `reg_num` int(11) NOT NULL,
  `ptp_name` varchar(200) NOT NULL,
  `inst_name` varchar(200) NOT NULL,
  `event_name` varchar(200) NOT NULL,
  `type_of_event` varchar(200) NOT NULL,
  `phone` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  PRIMARY KEY (`reg_num`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tedmaa_participant`
--

LOCK TABLES `tedmaa_participant` WRITE;
/*!40000 ALTER TABLE `tedmaa_participant` DISABLE KEYS */;
INSERT INTO `tedmaa_participant` VALUES (1,'sudhir babu','pvpsit','Higher Studies in USA','Guest Lecture','12345678','abc@gmail.com'),(2,'M.V Rama Krishna','pvpsit','Higher Studies in USA','Guest Lecture','12345678','abc@gmail.com'),(3,'J. Rama Devi','pvpsit','Higher Studies in USA','Guest Lecture','12345678','abc@gmail.com'),(4,'G. Lalitha Kumari','pvpsit','Higher Studies in USA','Guest Lecture','12345678','abc@gmail.com'),(5,'P. Anil Kumar','pvpsit','Higher Studies in USA','Guest Lecture','12345678','abc@gmail.com'),(6,'L. Yuva Krishna','pvpsit','Higher Studies in USA','Guest Lecture','12345678','abc@gmail.com'),(7,'M. Madhuri','pvpsit','Analytics using Hadoop and NoSQL','Guest Lecture','12345678','abc@gmail.com'),(8,'A. vanamala kumar','pvpsit','Artificial Intelligence and Deep Learning','Guest Lecture','12345678','abc@gmail.com'),(9,'A. vanamala kumar','pvpsit','1-Day NPTELWorkshop','Guest Lecture','12345678','abc@gmail.com'),(10,'Chandra Mohan','pvpsit','Sixth Internation Conference on Big Data Analytics(BDA-2018)','Guest Lecture','12345678','abc@gmail.com'),(11,'B. vishnu vardhan','pvpsit','Scientific Computations with Python','Guest Lecture','12345678','abc@gmail.com'),(12,'D. Lokesh kumar','Nit Warangal','Scientific Computations with Python','Guest Lecture','12345678','abc@gmail.com'),(13,'S. Madhavi','Nittr kolkatta','introduction to Network Security','Guest Lecture','12345678','abc@gmail.com'),(14,'A. Ramana Lakshmi','Nittr kolkatta','introduction to Network Security','Guest Lecture','12345678','abc@gmail.com'),(15,'K. vijay kumar','Nittr kolkatta','introduction to Network Security','Guest Lecture','12345678','abc@gmail.com'),(16,'N.V Ramana Gupta','Nittr kolkatta','introduction to Network Security','Guest Lecture','12345678','abc@gmail.com'),(17,'Lokesh kumar','Nittr kolkatta','introduction to Network Security','Guest Lecture','12345678','abc@gmail.com'),(18,'Sree Lakshmi','Nittr kolkatta','introduction to Network Security','Guest Lecture','12345678','abc@gmail.com'),(19,'Madhuri','Nit Warangal','Scientific Computations with Python','Guest Lecture','12345678','abc@gmail.com'),(20,'Sree Lakshmi','Nit Warangal','Scientific Computations with Python','Guest Lecture','12345678','abc@gmail.com');
/*!40000 ALTER TABLE `tedmaa_participant` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-03-02 17:38:02
