-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: localhost    Database: web_thuc_tap
-- ------------------------------------------------------
-- Server version	8.0.21

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `classes`
--

DROP TABLE IF EXISTS `classes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `classes` (
  `id` int NOT NULL,
  `name_class` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classes`
--

LOCK TABLES `classes` WRITE;
/*!40000 ALTER TABLE `classes` DISABLE KEYS */;
INSERT INTO `classes` VALUES (1,'a0920i1'),(2,'a01020i1'),(3,'16N03'),(4,'16N04'),(5,'16N05'),(6,'16N06'),(7,'16N07'),(8,'16N08'),(9,'16N09'),(10,'16N10'),(11,'17N01'),(12,'17N02'),(13,'17N03'),(14,'17N04'),(15,'17N05'),(16,'17N06'),(17,'17N08'),(18,'17N09'),(19,'17N10'),(20,'18N01'),(21,'18N02'),(22,'18N03'),(23,'18N04'),(24,'18N05'),(25,'18N06'),(26,'18N07'),(27,'18N08'),(28,'18N09'),(29,'18N10'),(30,'19N01'),(31,'19N02'),(32,'19N03'),(33,'19N04'),(34,'19N05'),(35,'19N06'),(36,'19N07'),(37,'19N08'),(38,'19N09'),(39,'19N10');
/*!40000 ALTER TABLE `classes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exam`
--

DROP TABLE IF EXISTS `exam`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exam` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_name` varchar(255) DEFAULT NULL,
  `name_exam` varchar(255) DEFAULT NULL,
  `classes_id` int DEFAULT NULL,
  `subject_id` int DEFAULT NULL,
  `users_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKp3wglafw35rxngx7hvqj39873` (`classes_id`),
  KEY `FKos7g6kn2748ll3ofc3w163gxh` (`subject_id`),
  KEY `FK8r1u489nyne7tau1vyl4h21yw` (`users_id`),
  CONSTRAINT `FK8r1u489nyne7tau1vyl4h21yw` FOREIGN KEY (`users_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FKos7g6kn2748ll3ofc3w163gxh` FOREIGN KEY (`subject_id`) REFERENCES `subject` (`id`),
  CONSTRAINT `FKp3wglafw35rxngx7hvqj39873` FOREIGN KEY (`classes_id`) REFERENCES `classes` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam`
--

LOCK TABLES `exam` WRITE;
/*!40000 ALTER TABLE `exam` DISABLE KEYS */;
INSERT INTO `exam` VALUES (1,'jv','java',1,1,'admin'),(2,'pth','python',2,2,'trung'),(3,'vatly12c3','Câu hỏi trắc nghiệm lý thuyết vật lý 12 chương 3',4,2,'admin'),(4,'vatly12c4','Câu hỏi trắc nghiệm lý thuyết vật lý 12 chương 4',10,2,'trung'),(5,'vatly12c5','Câu hỏi trắc nghiệm lý thuyết vật lý 12 chương 5',11,4,'admin'),(6,'vatly12c6','Câu hỏi trắc nghiệm lý thuyết vật lý 12 chương 6',3,5,'trung'),(7,'vatly12c7','Câu hỏi trắc nghiệm lý thuyết vật lý 12 chương 7',5,6,'admin'),(8,'vatly12c8','Câu hỏi trắc nghiệm lý thuyết vật lý 12 chương 8',6,3,'trung'),(9,'vatly12c9','Câu hỏi trắc nghiệm lý thuyết vật lý 12 chương 9',12,3,'admin'),(10,'vatly12c10','Câu hỏi trắc nghiệm lý thuyết vật lý 12 chương 10',11,4,'trung'),(11,'vatly12c11','Câu hỏi trắc nghiệm lý thuyết vật lý 12 chương 11',10,5,'admin'),(12,'vatly12c12','Câu hỏi trắc nghiệm lý thuyết vật lý 12 chương 12',9,6,'trung'),(13,'vatly12c13','Câu hỏi trắc nghiệm lý thuyết vật lý 12 chương 13',6,7,'trung'),(14,'vatly12c14','Câu hỏi trắc nghiệm lý thuyết vật lý 12 chương 14',4,8,'admin'),(15,'vatly12c15','Câu hỏi trắc nghiệm lý thuyết vật lý 12 chương 15',3,9,'trung'),(16,'vatly12c16','Câu hỏi trắc nghiệm lý thuyết vật lý 12 chương 16',2,9,'admin'),(17,'vatly12c17','Câu hỏi trắc nghiệm lý thuyết vật lý 12 chương 17',1,10,'trung'),(18,'vatly12c18','Câu hỏi trắc nghiệm lý thuyết vật lý 12 chương 18',6,11,'admin'),(19,'vatly12c19','Câu hỏi trắc nghiệm lý thuyết vật lý 12 chương 19',7,1,'trung'),(20,'vatly12c20','Câu hỏi trắc nghiệm lý thuyết vật lý 12 chương 20',8,3,'trung');
/*!40000 ALTER TABLE `exam` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hibernate_sequence`
--

DROP TABLE IF EXISTS `hibernate_sequence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hibernate_sequence` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hibernate_sequence`
--

LOCK TABLES `hibernate_sequence` WRITE;
/*!40000 ALTER TABLE `hibernate_sequence` DISABLE KEYS */;
INSERT INTO `hibernate_sequence` VALUES (1);
/*!40000 ALTER TABLE `hibernate_sequence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question`
--

DROP TABLE IF EXISTS `question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `question` (
  `ques_id` int NOT NULL AUTO_INCREMENT,
  `ans` int NOT NULL,
  `chose` int NOT NULL,
  `optiona` varchar(255) DEFAULT NULL,
  `optionb` varchar(255) DEFAULT NULL,
  `optionc` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `exams_id` int DEFAULT NULL,
  PRIMARY KEY (`ques_id`),
  KEY `FK9ygqpdcrpgrexfh0m37yby34o` (`exams_id`),
  CONSTRAINT `FK9ygqpdcrpgrexfh0m37yby34o` FOREIGN KEY (`exams_id`) REFERENCES `exam` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question`
--

LOCK TABLES `question` WRITE;
/*!40000 ALTER TABLE `question` DISABLE KEYS */;
INSERT INTO `question` VALUES (1,3,-1,'echo \"Hello World\"','printf(\"Hello World\")','System.out.println(\"Hello World\")','What is a correct syntax to output \"Hello World\" in Java?',1),(2,2,-1,'# This is a comment','// This is a comment','/* This is a comment','How do you insert COMMENTS in Java code?',2),(3,2,-1,'True','False','Partially True','Java is short for \"JavaScript.\"',1),(4,1,-1,'String','Char','Both','Which data type is used to create a variable that should store text?',2),(5,3,-1,'num x = 5','float x = 5','int x = 5','How do you create a variable with the numeric value 5?',1),(6,2,-1,'Dao động duy trì có tần số bằng tần số riêng của hệ dao động','Biên độ của dao động cưỡng bức là biên độ của lực cưỡng bức','Dao động duy trì có tần số bằng tần số riêng của hệ dao động','Khi nói về dao động cưỡng bức và dao động duy trì, phát biểu nào sau đây là sai?',3),(7,1,-1,' máy đầm nền','giảm xóc ô tô, xe máy','con lắc đồng hồ','Hiện tượng cộng hưởng cơ được ứng dụng trong',3),(8,1,-1,'tăng 4 lần','giảm 2 lần','tăng 2 lần','Một con lắc lò xo gồm vật nhỏ có khối lượng m và lò xo có độ cứng k, dao động điều hòa. Nếu tăng độ cứng k lên 2 lần và giảm khối lượng m đi 8 lần thì tần số dao động của con lắc sẽ:',3),(9,2,-1,'6mm','6cm','12cm','Một vật dao động điều hòa theo phương trình x = 6cos2πt cm, biên độ dao động của vật là:',3),(10,1,-1,'biên độ của ngoại lực tuần hoàn tác dụng lên vật',' tần số của ngoại lực tuần hoàn tác dụng lên vật',' lực cản tác dụng lên vật dao động','Biên độ của dao động cưỡng bức không phụ thuộc vào:',3),(11,3,-1,'biên độ ngoại lực cưỡng bức đạt cực đại','tần số dao động cưỡng bức đạt cực đại',' tần số của ngoại lực tuần hoàn tác dụng lên vật','Trong hiện tượng cộng hưởng thì',3),(12,2,-1,'Dao động tắt dần là một dao động có biên độ giảm dần theo thời gian','Dao động tắt dần có động năng và thế năng giảm đều theo thời gian','Lực ma sát càng lớn thì dao động tắt dần càng nhanh','Nhận định nào sau đây sai khi nói về dao động cơ học tắt dần?',4),(13,3,-1,'10','15','1.5','Một con lắc đơn có chiều dài dây treo là 64 cm. Lấy g = 10 m/s2. Số dao động toàn phần vật thực hiện được trong 24 giây là:',4),(14,3,-1,'100N','10N','1N','Vận tốc của một vật dao động điều hòa có phương trình v=20cos10t cm/s. Khối lượng của vật là m = 500 g. Hợp lực tác dụng lên vật có giá trị cực đại là:',4),(15,1,-1,'4cm','8cm','10cm','Một vật dao động điều hoà đi được quãng đường 16cm trong một chu kì dao động. Biên độ dao động của vật là',4),(16,3,-1,'Dòng điện là dòng các điện tích dịch chuyển có hướng','Cường độ dòng điện là đại lượng đặc trưng cho tác dụng mạnh, yếu của dòng điện và được đo bằng điện lượng chuyển qua tiết diện thẳng của vật dẫn trong một đơn vị thời gian','Chiều của dòng điện được quy ước là chiều chuyển dịch của các điện tích âm','Phát biểu nào sau đây là không chính xác ?',5),(17,3,-1,'Dòng điện có tác dụng từ. Ví dụ: nam châm điện','Dòng điện có tác dụng nhiệt. Ví dụ: bàn là điện','phương dao động của các phần tử môi trường','Phát biểu nào sau đây là không chính xác ?',5),(18,3,-1,'Trong nguồn điện hoá học (pin, acquy), có sự chuyển hoá từ nội năng thành điện năng','Trong nguồn điện hoá học (pin, acquy), có sự chuyển hoá từ cơ năng thành điện năng','Trong nguồn điện hoá học (pin, acquy), có sự chuyển hoá từ hóa năng thành điện năng',' Phát biểu nào sau đây là đúng?',5),(19,3,-1,'Công của dòng điện chạy qua một đoạn mạch là công của lực điện trường làm di chuyển các điện tích tự do trong đoạn mạch và bằng tích của hiệu điện thế giữa hai đầu đoạn mạch với cường độ dòng điện và thời gian dòng điện chạy qua đoạn mạch đó','Công suất của dòng điện chạy qua đoạn mạch bằng tích của hiệu điện thế giữa hai đầu đoạn mạch và cường độ dòng điện chạy qua đoạn mạch đó',' Nhiệt lượng tỏa ra trên một vật dẫn tỉ lệ thuận với điện trở của vật, với cường độ dòng điện và với thời gian dòng điện chạy qua vật','Phát biểu nào sau đây là không chính xác ?',5),(20,3,-1,'Tỉ lệ thuận với cường độ dòng điện chạy trong mạch','Tăng khi cường độ dòng điện trong mạch tăng','Giảm khi cường độ dòng điện trong mạch tăng','Đối với mạch điện kín gồm nguồn điện với mạch ngoài là điện trở thì hiệu điện thế mạch ngoài',5),(21,2,-1,'Độ sụt thế trên R2 giảm','Dòng điện qua R1 không thay đổi','Dòng điện qua R1 tăng lên','Cho một đoạn mạch gồm hai điện trở R1 và R2 mắc song song và mắc vào một hiệu điện thế không đổi. Nếu giảm trị số của điện trở R2 thì',10),(22,2,-1,'phương truyền sóng trong môi trường','phương dao động của các phần tử môi trường và phương truyền sóng','phương truyền sóng trong sóng truyền','Để phân loại sóng dọc hay sóng ngang người ta dựa vào:',10),(23,1,-1,'ngược pha với sóng tới tại B','lệch pha 0,25π với sóng tới tại B','vuông pha với sóng tới tại B','Xét hiện tượng sóng dừng trên dây đàn hồi nhẹ AB. Đầu A dao động theo phương vuông góc sợi dây với biên độ A. Khi đầu B cố định, sóng phản xạ tại B:',10),(24,1,-1,'một phần tư bước sóng','một số nguyên lần bước sóng','một nửa bước sóng','Khi có sóng dừng trên một sợi dây đàn hồi, khoảng cách từ một bụng đến nút gần nó nhất bằng:',10),(25,2,-1,'Tần số âm','Độ cao của âm','Mức cường độ âm','Đại lượng nào sau đây không phải là đặc trưng vật lý của âm?',10),(26,3,-1,'mức cường độ âm','năng lượng của âm','tần số của âm','Độ cao của âm là một đặc trưng sinh lý của âm gắn liền với:',10),(27,2,-1,'90cm/s','40m/s','40cm/s','Trên một sợi dây dài 0,9m có sóng dừng. Kể cả hai nút ở hai đầu dây thì trên dây có 10 nút sóng. Biết tần số của sóng truyền trên dây là 200Hz. Sóng truyền trên dây có tốc độ là:',10),(28,3,-1,'0','1cm','2cm','Hai nguồn sóng giống nhau S1, S2 có biên độ 2 cm đặt lần lượt tại hai điểm A, B cách nhau 40cm. Giữa C và đường trung trực của đoạn AB còn có 2 dãy cực đại khác. Nếu dịch chuyển nguồn S1 đến điểm C thì tại A biên độ dao động của sóng là:',10),(29,3,-1,'28dB','27dB','26dB','Một nguồn âm đặt tại O trong môi trường đẳng hướng. Hai điểm M và N trong môi trường tạo với O thành một tam giác đều. Mức cường độ âm tại M và N đều bằng 24,77 dB, mức cường độ âm lớn nhất mà một máy thu thu được đặt tại một điểm trên đoạn MN là:',10),(30,3,-1,'500Hz','1000Hz','1500Hz','Một sóng âm truyền trong không khí với tốc độ 340 m/s và bước sóng 34 cm. Tần số của sóng âm này là:',10);
/*!40000 ALTER TABLE `question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `result`
--

DROP TABLE IF EXISTS `result`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `result` (
  `id` int NOT NULL AUTO_INCREMENT,
  `total_correct` int NOT NULL,
  `questions_ques_id` int DEFAULT NULL,
  `users_user` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK8qjtmwcpdxr2l8tkd0j3syilo` (`questions_ques_id`),
  KEY `FKdjvgll8a3pvda9f9jthb2xvs1` (`users_user`),
  CONSTRAINT `FK8qjtmwcpdxr2l8tkd0j3syilo` FOREIGN KEY (`questions_ques_id`) REFERENCES `question` (`ques_id`),
  CONSTRAINT `FKdjvgll8a3pvda9f9jthb2xvs1` FOREIGN KEY (`users_user`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `result`
--

LOCK TABLES `result` WRITE;
/*!40000 ALTER TABLE `result` DISABLE KEYS */;
INSERT INTO `result` VALUES (1,5,1,'admin','hoa'),(2,4,2,'trung','hoa1'),(3,2,NULL,NULL,'hoa11'),(4,3,NULL,NULL,'Trung');
/*!40000 ALTER TABLE `result` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `id` int NOT NULL,
  `role_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'ROLE_ADMIN'),(2,'ROLE_KHACH');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subject`
--

DROP TABLE IF EXISTS `subject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subject` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subject`
--

LOCK TABLES `subject` WRITE;
/*!40000 ALTER TABLE `subject` DISABLE KEYS */;
INSERT INTO `subject` VALUES (0,'Anh 9'),(1,'lap trinh'),(2,'khoa hoc'),(3,'Vật Lý 8'),(4,'Vật Lý 9'),(5,'Vật Lý 10'),(6,'Vật Lý 11'),(7,'Vật Lý 12'),(8,'Toán 4'),(9,'Toán 5'),(10,'Toán 6'),(11,'Toán 7'),(12,'Toán 8'),(13,'Toán 9'),(14,'Toán 10'),(15,'Toán 11'),(16,'Toán 12'),(17,'Anh 6'),(18,'Anh 7'),(19,'Anh 8'),(21,'Anh 10'),(22,'Anh 11'),(23,'Anh 12'),(24,'Văn 6'),(25,'Văn 7'),(26,'Văn 8'),(27,'Văn 9'),(28,'Văn 10'),(29,'Văn 11'),(30,'Văn 12'),(31,'Hóa 8'),(32,'Hóa 9'),(33,'Hóa 10'),(34,'Hóa 11'),(35,'Hóa 12'),(36,'Sinh 6'),(37,'Sinh 7'),(38,'Sinh 8'),(39,'Sinh 9'),(40,'Sinh 10');
/*!40000 ALTER TABLE `subject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test_exam`
--

DROP TABLE IF EXISTS `test_exam`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `test_exam` (
  `id` int NOT NULL,
  `score_sum` double NOT NULL,
  `time_end` datetime(6) DEFAULT NULL,
  `time_start` datetime(6) DEFAULT NULL,
  `exams_id` int DEFAULT NULL,
  `users_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKl2hj4o10agy2fvr1uwgldotf6` (`exams_id`),
  KEY `FKlx08i2lwwbelxh4vguq2ho40g` (`users_id`),
  CONSTRAINT `FKl2hj4o10agy2fvr1uwgldotf6` FOREIGN KEY (`exams_id`) REFERENCES `exam` (`id`),
  CONSTRAINT `FKlx08i2lwwbelxh4vguq2ho40g` FOREIGN KEY (`users_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test_exam`
--

LOCK TABLES `test_exam` WRITE;
/*!40000 ALTER TABLE `test_exam` DISABLE KEYS */;
INSERT INTO `test_exam` VALUES (1,7,'2021-08-30 13:05:00.000000','2021-08-30 13:00:00.000000',1,'admin'),(2,5,'2021-08-30 13:10:00.000000','2021-08-30 13:05:00.000000',2,'trung');
/*!40000 ALTER TABLE `test_exam` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` varchar(255) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `full_name` varchar(255) DEFAULT NULL,
  `img` varchar(255) DEFAULT NULL,
  `pass_word` varchar(255) DEFAULT NULL,
  `phone_number` varchar(255) DEFAULT NULL,
  `re_pass_word` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('admin','Nghệ An','hoale@gmail.com','Lê Đức Hòa','avatar','$2a$10$52nJhv6TJlbwbzhl.ip0v.QRoafPZPVv97cdhkyHemq7WpWgBXXVS','0389225666','$2a$10$52nJhv6TJlbwbzhl.ip0v.QRoafPZPVv97cdhkyHemq7WpWgBXXVS'),('trung','Đà Nẵng','trung@gmail.com','Thế Trung','avatar','$2a$10$52nJhv6TJlbwbzhl.ip0v.QRoafPZPVv97cdhkyHemq7WpWgBXXVS','0389225677','$2a$10$52nJhv6TJlbwbzhl.ip0v.QRoafPZPVv97cdhkyHemq7WpWgBXXVS');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_role`
--

DROP TABLE IF EXISTS `user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_role` (
  `username` varchar(255) NOT NULL,
  `role_id` int NOT NULL,
  PRIMARY KEY (`username`,`role_id`),
  KEY `FKa68196081fvovjhkek5m97n3y` (`role_id`),
  CONSTRAINT `FKa68196081fvovjhkek5m97n3y` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`),
  CONSTRAINT `FKnircs1pyebpo0eucojumm0aed` FOREIGN KEY (`username`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_role`
--

LOCK TABLES `user_role` WRITE;
/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;
INSERT INTO `user_role` VALUES ('admin',1),('trung',2);
/*!40000 ALTER TABLE `user_role` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-09-01  9:25:54
