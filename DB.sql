-- MySQL dump 10.13  Distrib 8.0.25, for Win64 (x86_64)
--
-- Host: localhost    Database: web_thuc_tap
-- ------------------------------------------------------
-- Server version	8.0.25

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
INSERT INTO `classes` VALUES (1,'a0920i1'),(2,'a01020i1'),(3,'16N03'),(4,'16N04');
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
INSERT INTO `exam` VALUES (1,'jv','java',1,1,'admin'),(2,'pth','python',2,2,'trung'),(3,'vatly12c3','Câu hỏi trắc nghiệm lý thuyết vật lý 12 chương 3',2,2,'admin'),(4,'vatly12c4','Câu hỏi trắc nghiệm lý thuyết vật lý 12 chương 4',2,2,'trung'),(5,'vatly12c5','Câu hỏi trắc nghiệm lý thuyết vật lý 12 chương 5',2,3,'admin'),(6,'vatly12c6','Câu hỏi trắc nghiệm lý thuyết vật lý 12 chương 6',3,3,'trung'),(7,'vatly12c7','Câu hỏi trắc nghiệm lý thuyết vật lý 12 chương 7',3,2,'admin'),(8,'vatly12c8','Câu hỏi trắc nghiệm lý thuyết vật lý 12 chương 8',1,3,'trung'),(9,'vatly12c9','Câu hỏi trắc nghiệm lý thuyết vật lý 12 chương 9',2,3,'admin'),(10,'vatly12c10','Câu hỏi trắc nghiệm lý thuyết vật lý 12 chương 10',1,2,'trung'),(11,'vatly12c11','Câu hỏi trắc nghiệm lý thuyết vật lý 12 chương 11',2,3,'admin'),(12,'vatly12c12','Câu hỏi trắc nghiệm lý thuyết vật lý 12 chương 12',3,2,'trung'),(13,'vatly12c13','Câu hỏi trắc nghiệm lý thuyết vật lý 12 chương 13',2,3,'trung'),(14,'vatly12c14','Câu hỏi trắc nghiệm lý thuyết vật lý 12 chương 14',3,4,'admin'),(15,'vatly12c15','Câu hỏi trắc nghiệm lý thuyết vật lý 12 chương 15',3,2,'trung'),(16,'vatly12c16','Câu hỏi trắc nghiệm lý thuyết vật lý 12 chương 16',2,3,'admin'),(17,'vatly12c17','Câu hỏi trắc nghiệm lý thuyết vật lý 12 chương 17',1,4,'trung'),(18,'vatly12c18','Câu hỏi trắc nghiệm lý thuyết vật lý 12 chương 18',1,2,'admin'),(19,'vatly12c19','Câu hỏi trắc nghiệm lý thuyết vật lý 12 chương 19',2,1,'trung'),(20,'vatly12c20','Câu hỏi trắc nghiệm lý thuyết vật lý 12 chương 20',3,3,'trung');
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
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question`
--

LOCK TABLES `question` WRITE;
/*!40000 ALTER TABLE `question` DISABLE KEYS */;
INSERT INTO `question` VALUES (1,3,-1,'A. echo \"Hello World\"','B. printf(\"Hello World\")','C. System.out.println(\"Hello World\")','What is a correct syntax to output \"Hello World\" in Java?',1),(2,2,-1,'A. # This is a comment','B. // This is a comment','C. /* This is a comment','How do you insert COMMENTS in Java code?',1),(3,2,-1,'A. True','B. False','C. Partially True','Java is short for \"JavaScript.\"',1),(4,1,-1,'A. String','B. Char','C. Both','Which data type is used to create a variable that should store text?',1),(5,3,-1,'A. num x = 5','B. float x = 5','C. int x = 5','How do you create a variable with the numeric value 5?',1),(6,3,-1,'A. Ngôn ngữ java có phân biệt chữ hoa - chữ thường ','B. Java là ngôn ngữ lập trinhg hướng đối tượng','C. Chương B. trình viết bằng java chỉ chạy trên hệ điều hành win','Đâu là câu SAI về ngôn ngữ Java',1),(7,2,-1,'A. double','B. long float','C. int','Đâu không phải là một kiểu dữ liệu nguyên thủy trong Java?',1),(8,3,-1,'A. Tên của chương trình   ','B.   Số lượng tham số       ','C. Tham số đầu tiên của danh sách tham số','Trong câu lệnh sau: public static void main(String[] agrs) thì phần tử agrs[0] chứa giá trị gì?',1),(9,3,-1,'A. Nhập một số nguyên ','B.  Nhập một ký tự','C.  Nhập một chuỗi','Phương thức next() của lớp Scanner dùng để làm gì?',1),(10,3,-1,'A. Netbeans','B. Eclipse ','C. Java Platform','Muốn chạy được chương trình java, chỉ cần cài phần mền nào sau đây?',1),(11,3,-1,'A.  java.net  ','B.  java.io           ','C.  java.util','Gói nào trong java chứa lớp Scanner dùng để nhập dữ liệu từ bàn phím?',1),(12,2,-1,'A. Java','B. Oak','C. Cafe','Tên đầu tiên của Java là gì?',1),(13,1,-1,'A.  Biến','B.  Thuộc tính','C. Phương thức','Đâu KHÔNG phải là thành phần trong cấu trúc của lớp trong java.',1),(14,2,-1,'A. Các lớp được tạo thể hiện từ đó ','B. Một thể hiện của lớp','C. Một tham chiếu đến một thuộc tính  ','Đối tượng là gì',1),(15,2,-1,'A. 2','B. 9','C. 4','Với giá trị nào của x, biểu thức sau trả về giá trị true(x thuộc kiểu int).',1),(16,2,-1,'A. Dao động duy trì có tần số bằng tần số riêng của hệ dao động','B. Biên độ của dao động cưỡng bức là biên độ của lực cưỡng bức','C.  Dao động duy trì có tần số bằng tần số riêng của hệ dao động','Khi nói về dao động cưỡng bức và dao động duy trì, phát biểu nào sau đây là sai?',3),(17,1,-1,'A. máy đầm nền','B. giảm xóc ô tô, xe máy','C.   con lắc đồng hồ','Hiện tượng cộng hưởng cơ được ứng dụng trong',3),(18,1,-1,'A.tăng 4 lần','B. giảm 2 lần','C.  tăng 2 lần','Một con lắc lò xo gồm vật nhỏ có khối lượng m và lò xo có độ cứng k, dao động điều hòa. Nếu tăng độ cứng k lên 2 lần và giảm khối lượng m đi 8 lần thì tần số dao động của con lắc sẽ:',3),(19,2,-1,'A.6mm','B. 6cm','C. 12cm','Một vật dao động điều hòa theo phương trình x = 6cos2πt cm, biên độ dao động của vật là:',3),(20,1,-1,'A.biên độ của ngoại lực tuần hoàn tác dụng lên vật','B.  tần số của ngoại lực tuần hoàn tác dụng lên vật','C.  lực cản tác dụng lên vật dao động','Biên độ của dao động cưỡng bức không phụ thuộc vào:',3),(21,3,-1,'A.biên độ ngoại lực cưỡng bức đạt cực đại','B. tần số dao động cưỡng bức đạt cực đại','C. cả hai','Trong hiện tượng cộng hưởng thì',3),(22,2,-1,'A.Dao động tắt dần là một dao động có biên độ giảm dần theo thời gian','B. Dao động tắt dần có động năng và thế năng giảm đều theo thời gian','C. Lực ma sát càng lớn thì dao động tắt dần càng nhanh','Nhận định nào sau đây sai khi nói về dao động cơ học tắt dần?',3),(23,3,-1,'A.10','B. 15','C. 10','Một con lắc đơn có chiều dài dây treo là 64 cm. Lấy g = 10 m/s2. Số dao động toàn phần vật thực hiện được trong 24 giây là:',3),(24,3,-1,'A.100N','B. 10N','C. 1N','Vận tốc của một vật dao động điều hòa có phương trình v=20cos10t cm/s. Khối lượng của vật là m = 500 g. Hợp lực tác dụng lên vật có giá trị cực đại là:',3),(25,1,-1,'A.4cm','B. 8cm','C. 10cm','Một vật dao động điều hoà đi được quãng đường 16cm trong một chu kì dao động. Biên độ dao động của vật là',3),(26,2,-1,'A. locate','B. displace','C. establish','Using Facebook, you can ',5),(27,1,-1,'A. revealed','B. frequented','C. accessible','We ought to keep these proposals ',5),(28,1,-1,'A. large','B. limited','C. narrow','I have a  modest llittle glass fish where i keep a variety fish',5),(29,2,-1,'A. in facour of','B. refuse','C. agree','The majority of people in the town strongly support  the plans to build a new school.',5),(30,3,-1,'A. amicale','B. inapplicable','C. hostile','Mr. Smith’s new neighbors appear to be very friendly',5),(31,1,-1,'A. low','B. untouchable','C. far','I\'ve put the cake on a high shelf where he can\'t get at it.',5),(32,3,-1,'A. studious','B. learned','C. lazy','I\'ve put the cake on a high shelf where he can\'t get at it.',5),(33,2,-1,'A. voluntary','B. mandatory','C. pressure','Certain courses are compulsory; others are optional ',5),(34,1,-1,'A. weak','B. musculos','C. sick','She must be very strong to carry such a weight on her back.',5),(35,3,-1,'A. funny','B. satisfied','C. upset','Barry seem happy enough working for himself',5);
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
INSERT INTO `subject` VALUES (0,'Toán'),(1,'Vật lý'),(2,'Hóa học'),(3,'Anh');
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
INSERT INTO `user` VALUES ('admin','Nghệ An','hoale11@gmail.com','Lê Đức Hòa','avatar','$2a$10$52nJhv6TJlbwbzhl.ip0v.QRoafPZPVv97cdhkyHemq7WpWgBXXVS','0900009999','$2a$10$52nJhv6TJlbwbzhl.ip0v.QRoafPZPVv97cdhkyHemq7WpWgBXXVS'),('trung','Đà Nẵng','trung11@gmail.com','Thế Trung','anh1.jpg','$2a$10$52nJhv6TJlbwbzhl.ip0v.QRoafPZPVv97cdhkyHemq7WpWgBXXVS','0900009999','$2a$10$52nJhv6TJlbwbzhl.ip0v.QRoafPZPVv97cdhkyHemq7WpWgBXXVS');
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
INSERT INTO `user_role` VALUES ('admin',1);
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

-- Dump completed on 2021-09-09 20:31:40
