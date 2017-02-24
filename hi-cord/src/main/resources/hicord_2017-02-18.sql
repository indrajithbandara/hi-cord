INSERT INTO `TB_USER_PROFILE` (`USER_PROFILE_ID`, `USER_PROFILE_TYPE`)
VALUES
	(5,'ADMIN'),
	(3,'CAPTAIN'),
	(4,'DIRECTOR'),
	(1,'GUEST'),
	(2,'PLAYER'),
	(6,'SUPERADMIN');

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table TB_BOARD
# ------------------------------------------------------------

DROP TABLE IF EXISTS `TB_BOARD`;

CREATE TABLE `TB_BOARD` (
  `BOARD_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `BOARD_COMMENT_DEPTH` int(11) DEFAULT NULL,
  `BOARD_CONTENT` longtext NOT NULL,
  `BOARD_CREATED_BY` varchar(60) NOT NULL,
  `BOARD_CREATED_DATE` datetime DEFAULT NULL,
  `BOARD_DELCHECK` varchar(5) NOT NULL,
  `BOARD_HITS` int(11) DEFAULT NULL,
  `BOARD_LIKES` int(11) DEFAULT NULL,
  `BOARD_MODIFIED_BY` varchar(60) DEFAULT NULL,
  `BOARD_MODIFIED_DATE` datetime DEFAULT NULL,
  `BOARD_REPLY_DEPTH` int(11) DEFAULT NULL,
  `BOARD_SUBJECT` varchar(255) NOT NULL,
  `BOARD_TYPE` varchar(10) NOT NULL,
  PRIMARY KEY (`BOARD_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table TB_COMMENT
# ------------------------------------------------------------

DROP TABLE IF EXISTS `TB_COMMENT`;

CREATE TABLE `TB_COMMENT` (
  `COMMENT_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `COMMENT_CONTENT` varchar(300) NOT NULL,
  `COMMENT_CREATED_BY` varchar(60) NOT NULL,
  `COMMENT_CREATED_DATE` datetime NOT NULL,
  `COMMENT_DELCHECK` varchar(5) NOT NULL,
  `COMMENT_COMMENT_DEPTH` int(11) NOT NULL,
  `COMMENT_LIKES` int(11) DEFAULT NULL,
  `COMMENT_MODIFIED_BY` varchar(60) DEFAULT NULL,
  `COMMENT_MODIFIED_DATE` datetime DEFAULT NULL,
  `COMMENT_TYPE` varchar(10) NOT NULL,
  `COMMENT_BOARD_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`COMMENT_ID`),
  KEY `COMMENT_BOARD_FK` (`COMMENT_BOARD_ID`),
  CONSTRAINT `COMMENT_BOARD_FK` FOREIGN KEY (`COMMENT_BOARD_ID`) REFERENCES `TB_BOARD` (`BOARD_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table TB_FILE_DATA
# ------------------------------------------------------------

DROP TABLE IF EXISTS `TB_FILE_DATA`;

CREATE TABLE `TB_FILE_DATA` (
  `FILE_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `FILE_CREATED_BY` varchar(60) NOT NULL,
  `FILE_CREATED_DATE` datetime NOT NULL,
  `FILE_DELCHECK` varchar(5) NOT NULL,
  `FILE_MODIFIED_BY` varchar(60) DEFAULT NULL,
  `FILE_MODIFIED_DATE` datetime DEFAULT NULL,
  `FILE_ORIGIN_NAME` varchar(100) NOT NULL,
  `FILE_SAVED_DIR` varchar(200) NOT NULL,
  `FILE_SAVED_NAME` varchar(200) NOT NULL,
  `FILE_TYPE` varchar(20) NOT NULL,
  `FILE_BOARD_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`FILE_ID`),
  KEY `FILE_BOARD_FK` (`FILE_BOARD_ID`),
  CONSTRAINT `FILE_BOARD_FK` FOREIGN KEY (`FILE_BOARD_ID`) REFERENCES `TB_BOARD` (`BOARD_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table TB_HISTORY_MESSAGE
# ------------------------------------------------------------

DROP TABLE IF EXISTS `TB_HISTORY_MESSAGE`;

CREATE TABLE `TB_HISTORY_MESSAGE` (
  `HISTORY_MESSAGE_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `HISTORY_MESSAGE_CONTENT` varchar(60) NOT NULL,
  `HISTORY_MESSAGE_CREATED_BY` varchar(60) NOT NULL,
  `HISTORY_MESSAGE_CREATED_DATE` datetime DEFAULT NULL,
  `HISTORY_MESSAGE_DELCHECK` varchar(5) NOT NULL,
  `HISTORY_MESSAGE_MODIFIED_BY` varchar(60) DEFAULT NULL,
  `HISTORY_MESSAGE_MODIFIED_DATE` datetime DEFAULT NULL,
  `HISTORY_MESSAGE_TO_USER` varchar(60) NOT NULL,
  PRIMARY KEY (`HISTORY_MESSAGE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table TB_MUSIC
# ------------------------------------------------------------

DROP TABLE IF EXISTS `TB_MUSIC`;

CREATE TABLE `TB_MUSIC` (
  `MUSIC_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `MUSIC_CREATED_BY` varchar(60) NOT NULL,
  `MUSIC_CREATED_DATE` datetime DEFAULT NULL,
  `MUSIC_DELCHECK` varchar(5) NOT NULL,
  `MUSIC_IMAGE` varchar(255) NOT NULL,
  `MUSIC_LYRICS` longtext,
  `MUSIC_MODIFIED_BY` varchar(60) DEFAULT NULL,
  `MUSIC_MODIFIED_DATE` datetime DEFAULT NULL,
  `MUSIC_SINGER` varchar(50) NOT NULL,
  `MUSIC_TITLE` varchar(100) NOT NULL,
  `MUSIC_URL` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`MUSIC_ID`),
  UNIQUE KEY `UK_ob5rehkbntk2tb1mfthewlw0x` (`MUSIC_TITLE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table TB_MUSIC_CHART
# ------------------------------------------------------------

DROP TABLE IF EXISTS `TB_MUSIC_CHART`;

CREATE TABLE `TB_MUSIC_CHART` (
  `MUSIC_CHART_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `MUSIC_CHART_CREATED_BY` varchar(60) NOT NULL,
  `MUSIC_CHART_CREATED_DATE` datetime DEFAULT NULL,
  `MUSIC_CHART_DELCHECK` varchar(5) NOT NULL,
  `MUSIC_CHART_JSON_DATA` longtext,
  `MUSIC_CHART_MODIFIED_BY` varchar(60) DEFAULT NULL,
  `MUSIC_CHART_MODIFIED_DATE` datetime DEFAULT NULL,
  PRIMARY KEY (`MUSIC_CHART_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table TB_PRICE
# ------------------------------------------------------------

DROP TABLE IF EXISTS `TB_PRICE`;

CREATE TABLE `TB_PRICE` (
  `PRICE_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `PRICE_CREATED_BY` varchar(60) NOT NULL,
  `PRICE_CREATED_DATE` datetime NOT NULL,
  `PRICE_DELCHECK` varchar(5) NOT NULL,
  `PRICE_DISCOUNT_RATE` int(11) DEFAULT NULL,
  `PRICE_EVENT_END_DATE` datetime NOT NULL,
  `PRICE_EVENT_START_DATE` datetime NOT NULL,
  `PRICE_MODIFIED_BY` varchar(60) DEFAULT NULL,
  `PRICE_MODIFIED_DATE` datetime DEFAULT NULL,
  `PRICE_NAME` varchar(50) NOT NULL,
  `PRICE_VALUE` int(11) NOT NULL,
  PRIMARY KEY (`PRICE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table TB_PRICE_RECORD
# ------------------------------------------------------------

DROP TABLE IF EXISTS `TB_PRICE_RECORD`;

CREATE TABLE `TB_PRICE_RECORD` (
  `PRICE_RECORD_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `PRICE_RECORD_ALLOW_STATE` varchar(10) NOT NULL,
  `PRICE_RECORD_CREATED_DATE` datetime NOT NULL,
  `PRICE_RECORD_DELCHECK` varchar(5) NOT NULL,
  `PRICE_RECORD_DISCOUNT_RATE` varchar(20) DEFAULT NULL,
  `PRICE_RECORD_DISCOUNTED_VALUE` int(11) DEFAULT NULL,
  `PRICE_RECORD_END_DATE` datetime NOT NULL,
  `PRICE_RECORD_MODIFIED_DATE` datetime DEFAULT NULL,
  `PRICE_RECORD_NAME` varchar(50) NOT NULL,
  `PRICE_RECORD_ORIGINAL_VALUE` int(11) NOT NULL,
  `PRICE_RECORD_PAID_BY_USER` bigint(20) NOT NULL,
  `PRICE_VALUE_FROM_PRICE` bigint(20) NOT NULL,
  PRIMARY KEY (`PRICE_RECORD_ID`),
  KEY `PRICE_USER_FK` (`PRICE_RECORD_PAID_BY_USER`),
  KEY `PRICE_RECOURD_FK` (`PRICE_VALUE_FROM_PRICE`),
  CONSTRAINT `PRICE_RECOURD_FK` FOREIGN KEY (`PRICE_VALUE_FROM_PRICE`) REFERENCES `TB_PRICE` (`PRICE_ID`),
  CONSTRAINT `PRICE_USER_FK` FOREIGN KEY (`PRICE_RECORD_PAID_BY_USER`) REFERENCES `TB_USER` (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table TB_REPLY
# ------------------------------------------------------------

DROP TABLE IF EXISTS `TB_REPLY`;

CREATE TABLE `TB_REPLY` (
  `REPLY_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `REPLY_COMMENT_DEPTH` int(11) DEFAULT NULL,
  `REPLY_CONTENT` longtext NOT NULL,
  `REPLY_CREATED_BY` varchar(60) NOT NULL,
  `REPLY_CREATION_DATE` datetime NOT NULL,
  `REPLY_DELCHECK` varchar(5) NOT NULL,
  `REPLY_HITS` int(11) DEFAULT NULL,
  `REPLY_LIKES` int(11) DEFAULT NULL,
  `REPLY_MODIFIED_BY` varchar(60) DEFAULT NULL,
  `REPLY_MODIFICATION_DATE` datetime DEFAULT NULL,
  `REPLY_SUBJECT` varchar(200) NOT NULL,
  `REPLY_TYPE` varchar(10) NOT NULL,
  `REPLY_BOARD_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`REPLY_ID`),
  KEY `REPLY_BOARD_FK` (`REPLY_BOARD_ID`),
  CONSTRAINT `REPLY_BOARD_FK` FOREIGN KEY (`REPLY_BOARD_ID`) REFERENCES `TB_BOARD` (`BOARD_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table TB_USER
# ------------------------------------------------------------

DROP TABLE IF EXISTS `TB_USER`;

CREATE TABLE `TB_USER` (
  `USER_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `USER_ACCOUNT_NON_EXPIRED` int(11) DEFAULT NULL,
  `USER_ACCOUNT_NON_LOCKED` int(11) DEFAULT NULL,
  `USER_CREATED_DATE` datetime DEFAULT NULL,
  `USER_CREDENTIALS_NON_EXPIRED` int(11) DEFAULT NULL,
  `USER_DELCHECK` int(11) DEFAULT NULL,
  `USER_EMAIL` varchar(60) NOT NULL,
  `USER_MODIFIED_BY` varchar(60) DEFAULT NULL,
  `USER_MODIFIED_DATE` datetime DEFAULT NULL,
  `USER_NAME` varchar(30) NOT NULL,
  `USER_PASSWORD` varchar(100) NOT NULL,
  `USER_RECEIVE_MAIL` int(11) DEFAULT NULL,
  `USER_STATE` varchar(20) NOT NULL,
  PRIMARY KEY (`USER_ID`),
  UNIQUE KEY `UK_idwnephhbxa1ssgxrodu90pru` (`USER_EMAIL`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table TB_USER_ATTEMPTS
# ------------------------------------------------------------

DROP TABLE IF EXISTS `TB_USER_ATTEMPTS`;

CREATE TABLE `TB_USER_ATTEMPTS` (
  `USER_ATTEMPTS_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `USER_ATTEMPTS_ATTEMPT` int(11) NOT NULL,
  `USER_ATTEMPTS_EMAIL` varchar(255) NOT NULL,
  `USER_ATTEMPTS_LATESTDATE` datetime NOT NULL,
  `USER_ATTEMPTS_LOGIN_IP` varchar(255) DEFAULT NULL,
  `USER_ATTEMPTS_SUCCESS_FLAG` int(11) DEFAULT NULL,
  PRIMARY KEY (`USER_ATTEMPTS_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table TB_USER_PERSISTENT_LOGINS
# ------------------------------------------------------------

DROP TABLE IF EXISTS `TB_USER_PERSISTENT_LOGINS`;

CREATE TABLE `TB_USER_PERSISTENT_LOGINS` (
  `PERSISTENT_LOGINS_SERIES` varchar(50) NOT NULL,
  `PERSISTENT_LOGINS_EMAIL` varchar(60) NOT NULL,
  `PERSISTENT_LOGINS_LATESTDATE` datetime NOT NULL,
  `PERSISTENT_LOGINS_TOKEN` varchar(255) NOT NULL,
  PRIMARY KEY (`PERSISTENT_LOGINS_SERIES`),
  UNIQUE KEY `UK_l6wxhslhcfo51p962kfeoo6w2` (`PERSISTENT_LOGINS_EMAIL`),
  UNIQUE KEY `UK_nttclvc32im2x2xr3yyfvsq76` (`PERSISTENT_LOGINS_TOKEN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table TB_USER_PROFILE
# ------------------------------------------------------------

DROP TABLE IF EXISTS `TB_USER_PROFILE`;

CREATE TABLE `TB_USER_PROFILE` (
  `USER_PROFILE_ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_PROFILE_TYPE` varchar(15) NOT NULL,
  PRIMARY KEY (`USER_PROFILE_ID`),
  UNIQUE KEY `UK_28lgbv40bmqn2twgoy5kxn5fx` (`USER_PROFILE_TYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `TB_USER_PROFILE` WRITE;
/*!40000 ALTER TABLE `TB_USER_PROFILE` DISABLE KEYS */;

/*!40000 ALTER TABLE `TB_USER_PROFILE` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table TB_USER_PROFILE_REFER
# ------------------------------------------------------------

DROP TABLE IF EXISTS `TB_USER_PROFILE_REFER`;

CREATE TABLE `TB_USER_PROFILE_REFER` (
  `USER_ID` bigint(20) NOT NULL,
  `USER_PROFILE_ID` int(11) NOT NULL,
  PRIMARY KEY (`USER_ID`,`USER_PROFILE_ID`),
  KEY `USER_PROFILE_REFER_FK` (`USER_PROFILE_ID`),
  CONSTRAINT `USER_PROFILE_REFER_FK` FOREIGN KEY (`USER_PROFILE_ID`) REFERENCES `TB_USER_PROFILE` (`USER_PROFILE_ID`),
  CONSTRAINT `USER_REFER_FK` FOREIGN KEY (`USER_ID`) REFERENCES `TB_USER` (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;




/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
