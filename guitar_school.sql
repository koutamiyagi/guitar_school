# ************************************************************
# Sequel Pro SQL dump
# バージョン 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# ホスト: 127.0.0.1 (MySQL 5.7.24)
# データベース: guitar_school
# 作成時刻: 2018-12-20 12:38:41 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# テーブルのダンプ news
# ------------------------------------------------------------

DROP TABLE IF EXISTS `news`;

CREATE TABLE `news` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL DEFAULT '',
  `content` varchar(1000) DEFAULT NULL,
  `time` datetime NOT NULL,
  `picture_id` int(11) DEFAULT NULL,
  `youtube_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `news` WRITE;
/*!40000 ALTER TABLE `news` DISABLE KEYS */;

INSERT INTO `news` (`id`, `title`, `content`, `time`, `picture_id`, `youtube_id`)
VALUES
	(3,'肉のひ','肉肉','2018-11-29 19:52:30',NULL,NULL),
	(4,'あああ','あああああああ\r\nいいいいいいいい\r\nううう\r\n\r\nえええおおお','2018-11-29 19:58:17',NULL,NULL),
	(5,'第10回 沖縄ギター倶楽部おさらい会','日曜日 ギター倶楽部おさらい会が \r\n開かれました( ^^)♪\r\n天候にも恵まれ 気持ちよく\r\nスタートすることができました(っ´ω`c)♪♬\r\n\r\n日頃の練習どおり\r\nうまくできた方、緊張で\r\n思い通りに弾けなかった方\r\nいろんな方がいらっしゃるかと\r\n思いますが、今回をステップに\r\nまた前に進めたらいいなと\r\n感じておりますm(__)m\r\n参加して下さった皆様\r\nどうもありがとうございました(っ´ω`c)♪♬♡\r\n\r\n\r\n今年は教室移転や \r\n私事ですが ちびちゃん出産など\r\nいろいろと重なり どうなるか\r\n気を揉んでいましたが、\r\n第10回目 ギター倶楽部を開催し\r\n無事終えることが出来\r\nほっとしています☆\r\n\r\n参加して下さった皆様をはじめ\r\nビデオや写真を担当して下さったKさん、\r\n子守りを引き受けてくれたSさん\r\nいろいろと会がスムーズになるよう\r\n協力して下さった皆様のおかげで\r\n今年も楽しく出来ました☆\r\nどうもありがとうございました(っ´ω`c)\r\n\r\n最後に はじめから最後まで\r\n進行から演奏など裏方のことまで\r\nいろいろとたくさんのことを\r\nして下さった師匠(>_<)ヽ\r\nどうもありがとうございました(>_<)\r\n大変お疲れ様でした！(≧◇≦)！\r\n\r\nまた来年は今年よりもいろいろと\r\nパワーアップすると思いますので\r\nどうぞ宜しくお願いいたします( ^^)♬  ','2018-12-01 15:57:15',NULL,NULL),
	(9,'test','test','2018-12-03 14:23:06',NULL,NULL),
	(10,'testes','testes','2018-12-03 14:23:26',NULL,NULL),
	(11,'こんにちは','こんにちは','2018-12-03 14:23:31',NULL,NULL),
	(12,'あいうえと','','2018-12-03 14:23:37',NULL,NULL),
	(13,'もう11月','あっという間に11月\r\n暑かったり寒くなったり\r\n季節の変わり目\r\n体調に気をつけてお過ごし下さいね(*´ω｀*)  ','2018-12-03 16:57:34',NULL,NULL),
	(14,'2018 夏','新しく携帯電話を変え<br>\r\n操作法などなれず（今も。。。(TT)）<br>\r\nいろいろと手こずっている間に<br>\r\nこんなに月日が。。。(*_*)<br>\r\n<br>\r\n夏の思い出写真をのせてみます(=^ェ^=)<br>','2018-12-03 16:58:35',NULL,NULL),
	(15,'修理中♪','パパさんが 車のパワーウィンドウの\r\nスイッチの取り替えをしてます(*^^*)\r\n\r\n2人とも興味深々?(*^-^*)\r\nいたずらばかりしますっ(^_^;','2018-12-03 16:59:15',NULL,NULL),
	(19,'こんちわ','こんちわ<br>\r\n<img src=\"assets/img/sp-053652400s1513648471.jpg\"><br>\r\n\r\nちわちわ','2018-12-03 18:03:00',NULL,NULL),
	(20,'12/9に発表会があります','本当にあります','2018-12-03 18:44:00',NULL,NULL),
	(22,'testes','test','2018-12-16 13:50:07',NULL,NULL);

/*!40000 ALTER TABLE `news` ENABLE KEYS */;
UNLOCK TABLES;


# テーブルのダンプ picture
# ------------------------------------------------------------

DROP TABLE IF EXISTS `picture`;

CREATE TABLE `picture` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `filename` varchar(100) NOT NULL DEFAULT '',
  `time` datetime DEFAULT NULL,
  `news_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `picture` WRITE;
/*!40000 ALTER TABLE `picture` DISABLE KEYS */;

INSERT INTO `picture` (`id`, `filename`, `time`, `news_id`)
VALUES
	(10,'sp-002704700s1513647472.jpg','2018-12-03 10:32:48',NULL),
	(11,'sp-097729000s1477454032.jpg','2018-12-03 10:32:56',NULL),
	(15,'dev-1.jpg','2018-12-03 17:44:54',NULL),
	(17,'bk4map-image.png','2018-12-03 17:54:40',NULL),
	(24,'img_0.jpeg','2018-12-16 13:48:16',NULL);

/*!40000 ALTER TABLE `picture` ENABLE KEYS */;
UNLOCK TABLES;


# テーブルのダンプ users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(11) NOT NULL DEFAULT '',
  `password` varchar(11) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;

INSERT INTO `users` (`id`, `name`, `password`)
VALUES
	(1,'admin','admin');

/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;


# テーブルのダンプ youtube
# ------------------------------------------------------------

DROP TABLE IF EXISTS `youtube`;

CREATE TABLE `youtube` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `url` varchar(11) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `news_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;




/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
