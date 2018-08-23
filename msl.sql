/*
SQLyog Ultimate v11.27 (32 bit)
MySQL - 5.7.10-log : Database - mslibrary
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`mslibrary` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_bin */;

USE `mslibrary`;

/*Table structure for table `book` */

DROP TABLE IF EXISTS `book`;

CREATE TABLE `book` (
  `id` varchar(32) COLLATE utf8_bin NOT NULL,
  `bookname` varchar(15) COLLATE utf8_bin NOT NULL,
  `author` varchar(15) COLLATE utf8_bin NOT NULL,
  `category_id` varchar(32) COLLATE utf8_bin NOT NULL,
  `bookprice` double(16,2) unsigned NOT NULL,
  `borrowprice` double(16,2) unsigned NOT NULL,
  `borrowcount` int(10) unsigned NOT NULL,
  `restcount` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `book` */

insert  into `book`(`id`,`bookname`,`author`,`category_id`,`bookprice`,`borrowprice`,`borrowcount`,`restcount`) values ('1','刘恒传','慕帅','1',1.00,0.00,3,4),('10','庄子','不详','6',50.00,5.00,4,47),('11','六韬','姜子牙','7',50.00,5.00,3,49),('12','尉缭子','尉缭','7',60.00,6.00,1,79),('2','海风之旅','刘恒死体普','2',20.00,2.00,1,9),('253ad9b124d640b2930fc16cbd5e1fb2','小王子','安托万·德·圣·埃克苏佩里','8eae6e0cee4c4961a4b0630bcb17ebcb',28.00,0.10,1,4),('3','山海经','不详','3',50.00,5.00,1,13),('3453a5b30a364a60b2bd662b45dbcdef','蔡康永的说话之道','蔡康永','60e4e2dab7d14dbabd12a03f5962b0de',36.00,0.10,0,3),('4','聊斋','蒲松龄','3',30.00,3.00,1,20),('5','万历十五年','黄仁宇','4',46.00,10.00,1,33),('6','僵尸道长','林正英','5',100.00,20.00,0,90),('7','慕帅奇侠传','慕帅','5',200.00,50.00,0,400),('8','老子','不详','6',50.00,5.00,1,49),('9','孙子兵法','孙武','7',30.00,3.00,0,40),('b90aacb7831347bfa2727f05d5d5394d','魔鬼经济学','史蒂芬·列维特、史蒂芬·都伯纳','427f7c2ca00d447fbee92a3bcf127cfc',36.00,0.20,0,5),('caa5fca06d614df190e146c70fd04d17','如何提高你的洞察力','卡尔.卡耐基','28f6a9b4a24e4ccfb09aab93062ead3b',88.00,0.30,0,5);

/*Table structure for table `category` */

DROP TABLE IF EXISTS `category`;

CREATE TABLE `category` (
  `id` varchar(32) COLLATE utf8_bin NOT NULL,
  `category` varchar(15) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `category` */

insert  into `category`(`id`,`category`) values ('1','传记'),('2','游记'),('28f6a9b4a24e4ccfb09aab93062ead3b','心理学'),('3','志异'),('4','历史'),('427f7c2ca00d447fbee92a3bcf127cfc','经济学'),('5','玄幻'),('6','哲学'),('60e4e2dab7d14dbabd12a03f5962b0de','自传'),('7','兵书'),('8eae6e0cee4c4961a4b0630bcb17ebcb','文学');

/*Table structure for table `order` */

DROP TABLE IF EXISTS `order`;

CREATE TABLE `order` (
  `id` varchar(32) COLLATE utf8_bin NOT NULL,
  `book_id` varchar(32) COLLATE utf8_bin NOT NULL,
  `user_id` varchar(32) COLLATE utf8_bin NOT NULL,
  `borrowdate` datetime DEFAULT NULL,
  `expiredate` datetime DEFAULT NULL,
  `price` double(16,2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `book_id` (`book_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `order_ibfk_1` FOREIGN KEY (`book_id`) REFERENCES `book` (`id`),
  CONSTRAINT `order_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `order` */

insert  into `order`(`id`,`book_id`,`user_id`,`borrowdate`,`expiredate`,`price`) values ('040afca5d5924ec6b97179cfa7bb454e','1','902dba84c97d487a9559a74cdca23178','2017-08-08 13:27:26','2017-08-08 13:28:11',0.00),('2cba0e52db964525a53af38537717374','3','1e8ff41463c44cbd8ff7808e9ea1f3cb','2017-08-08 09:42:21','2017-08-08 09:43:04',5.00),('32db6fe2037c495d9375c762e1bee60f','253ad9b124d640b2930fc16cbd5e1fb2','dc4661d262a94ef29ce460f0172c9e29','2017-08-08 13:37:56',NULL,0.00),('580828f749b2417a9831d24af60d2215','10','902dba84c97d487a9559a74cdca23178','2017-08-08 13:27:55','2017-08-08 13:28:12',5.00),('5d3bffa53b324325a7a70ade819b80e5','11','1e8ff41463c44cbd8ff7808e9ea1f3cb','2017-08-08 09:42:10','2017-08-08 09:42:31',5.00),('603c4742f9ea4775b3fac1409ff8210e','1','1e8ff41463c44cbd8ff7808e9ea1f3cb','2017-08-02 10:16:27','2017-08-02 10:29:44',0.00),('6a7c63c77f2849f4a351720c258499dd','5','1e8ff41463c44cbd8ff7808e9ea1f3cb','2017-08-08 09:42:28',NULL,0.00),('75f56607ebe049528a8d51b54681835b','11','902dba84c97d487a9559a74cdca23178','2017-08-08 13:28:07',NULL,0.00),('8b3b909479b2447eafadc442b9119ec5','4','902dba84c97d487a9559a74cdca23178','2017-08-08 13:27:33','9999-12-31 00:00:00',60.00),('aed6434ddbcb40978823990bf78140ac','10','1e8ff41463c44cbd8ff7808e9ea1f3cb','2017-08-08 09:42:06',NULL,0.00),('c882c69083974ad8a4a8b80f711c620d','2','dc4661d262a94ef29ce460f0172c9e29','2017-08-08 13:37:50',NULL,0.00),('d02bb9529dd943b7b528517080bbaea4','11','902dba84c97d487a9559a74cdca23178','2017-08-08 13:27:30','2017-08-08 13:28:15',5.00),('d3f7bcc71a1441c9899fc056590400e8','1','1e8ff41463c44cbd8ff7808e9ea1f3cb','2017-08-08 09:42:03','9999-12-31 00:00:00',2.00),('d9cba5ad549841a1847ea17a6f440498','8','902dba84c97d487a9559a74cdca23178','2017-08-08 13:27:37',NULL,0.00),('de938852459a413fb8ffb10cb532e863','10','902dba84c97d487a9559a74cdca23178','2017-08-08 13:27:45',NULL,0.00),('e73862936d914bcbb9472c36df15f8ce','12','1e8ff41463c44cbd8ff7808e9ea1f3cb','2017-08-08 09:42:12','9999-12-31 00:00:00',120.00),('f668af2e56f8424e9f1839cbcfaee6de','10','902dba84c97d487a9559a74cdca23178','2017-08-08 13:27:39','9999-12-31 00:00:00',100.00);

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` char(32) COLLATE utf8_bin NOT NULL,
  `username` varchar(16) COLLATE utf8_bin NOT NULL,
  `password` varchar(16) COLLATE utf8_bin NOT NULL,
  `sex` varchar(4) COLLATE utf8_bin DEFAULT NULL,
  `balance` double(16,2) unsigned DEFAULT NULL,
  `tel` varchar(16) COLLATE utf8_bin DEFAULT NULL,
  `type` int(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `user` */

insert  into `user`(`id`,`username`,`password`,`sex`,`balance`,`tel`,`type`) values ('123','mjl','123','man',100.00,'123456789',1),('1e8ff41463c44cbd8ff7808e9ea1f3cb','刘恒','123','女',9873.00,'123456',2),('902dba84c97d487a9559a74cdca23178','张学友','123456','女',9830.00,'13966776677',2),('dc4661d262a94ef29ce460f0172c9e29','刘德华','123','男',110.00,'13866776677',2);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
