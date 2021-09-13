-- MySQL dump 10.13  Distrib 8.0.23, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: web_thuc_tap
-- ------------------------------------------------------
-- Server version	8.0.23

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
INSERT INTO `exam` VALUES (1,'t001','Đề toán 2021',1,0,'trung'),(2,'t002','Toán đại cương 2020',2,0,'trung'),(3,'vatly1','Câu hỏi trắc nghiệm lý thuyết vật lý 1',2,1,'admin'),(4,'vatly2','Câu hỏi trắc nghiệm lý thuyết vật lý 2',2,1,'trung'),(5,'ta1','Câu hỏi trắc nghiệm lý thuyết tiếng anh 1',3,3,'trung'),(6,'hoa1','Câu hỏi trắc nghiệm lý thuyết hóa học 1',1,2,'trung');
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
) ENGINE=InnoDB AUTO_INCREMENT=191 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question`
--

LOCK TABLES `question` WRITE;
/*!40000 ALTER TABLE `question` DISABLE KEYS */;
INSERT INTO `question` VALUES (1,2,-1,'A. Bốn nghìn sáu trăm bảy chín','B. Bốn nghìn sáu trăm bảy mươi chín','C. Bốn nghìn bảy trăm sáu mươi chín','Số 4679 được đọc là:',1),(2,2,-1,'A. 13506','B. 13605','D. 10653',' Số mười ba nghìn sáu trăm linh năm được viết là:',1),(3,3,-1,'A. Hàng chục nghìn','B. Hàng nghìn','C. Hàng trăm','Chữ số 9 trong số 56931 thuộc hàng nào?',1),(4,3,-1,'A. 50','B. 500','C. 5000','Giá trị của chữ số 5 trong số 85246 là:',1),(5,3,-1,'A. 4936 = 4000 + 9000 + 30 + 6','B. 4936 = 4000 + 90 + 300 + 6','C. 4936 = 4000 + 900 + 30 + 6','Viết số 4936 thành tổng (theo mẫu)',1),(6,2,-1,'A.2506','B. 6250','B. 625','Chọn số thích hợp để điền vào ô trống (theo mẫu):6000 + 200 + 5 = ? ',1),(7,2,-1,'A. 99999','B. 99990','C. 99900','Số tròn chục liền trước số một trăm nghìn viết là:',1),(8,1,-1,'A.499','B.239','C. 49900',' Điền số thích hợp vào ô trống: Số bé nhất có tổng các chữ số bằng 22 là....',1),(9,2,-1,'A.600','B.6000','C.6500','Tính nhẩm: 5000+2000-1000= ???',1),(10,1,-1,'A.8000','B.800','c. 900','Điền số thích hợp vào ô trống: 9000-3000+2000= ???',1),(11,2,-1,'A. 8755','B. 8765','C. 8675','Tính: 5847 + 2918',1),(12,1,-1,'A. 21276.','B. 2127','C. 212760','Điền số thích hợp vào ô trống: 35048 - 13772 = ???',1),(13,1,-1,'A. >','B. <','C. =','Chọn dấu thích hợp để điền vào chỗ chấm: 18903 ... 9987',1),(14,2,-1,'A.>','B. <','C. =','Chọn dấu thích hợp để điền vào chỗ trống: 98988....989999..',1),(15,1,-1,'A.>','B. <','C. =','Chọn dấu thích hợp để điền vào chỗ trống: 12034 ....99888',1),(16,1,-1,'A. 29785;72895;87259;87925','B. 29785;72895;87925; 87259','C. 72895;87925; 29785;  87259','Sắp xếp các số theo thứ tự từ bé đến lớn: 72895   87259   29785   87925',2),(17,3,-1,'A. =','B. >','C. <','Chọn dấu thích hợp để điền vào chỗ chấm: 91483 - 28095…15848 × 4',2),(18,3,-1,'A. 1460','B. 2460','C. 81732','Tính giá trị biểu thức: (40136 - 12892) x 3',2),(19,2,-1,'A. 4972','B. 9427','C.9927','Điền số thích hợp vào ô trống: Biết x × 6 = 56562',2),(20,1,-1,'A. 1578','B. 1728','C. 1772','Điền số thích hợp vào ô trống: Một nhà máy sản xuất trong 4 ngày được 1052 chiếc xe đạp. Vậy trong 6 ngày nhà máy đó sản xuất được....xe đạp.Biết số xe đạp sản xuất mỗi ngày là như nhau. ',2),(21,3,-1,'A. 1488','B. 3137','C. 5002','Tìm x biết: (x - 3245) × 4 = 24241 - 17213',2),(22,2,-1,'A. 27000','B. 2700','C. 2500','Điền số thích hợp vào ô trống: Tính nhẩm: 9000 × 3=',2),(23,3,-1,'A. Khi nhân một số tự nhiên với 10 ta chỉ việc thêm một chữ số 0 vào bên phải số đó','B. Khi nhân một số tự nhiên với 100 ta chỉ việc thêm hai chữ số 0 vào bên phải số đó','C. Cả 2 đáp án đều đúng','Hãy chọn đáp án đúng nhất',2),(24,1,-1,'A. Đúng ','B. Sai','C. Cả 2 đều sai','Khi chia số tròn chục, tròn trăm, tròn nghìn ... cho 10, 100, 1000,... ta chỉ việc bỏ bớt một, hai, ba, ... chữ số 0 ở bên phải số đó. Đúng hay sai?',2),(25,1,-1,'A. 2916','B. 29160','C. 291600','Tính: 32400∶100×9.',2),(26,2,-1,'A. 430.','B. 4430.','C. 340','Điền số thích hợp vào ô trống: Biết x : 10 = 378 + 65, x = ......',2),(27,3,-1,'A. >','B. <','C. =','7480000 : 1000 ... 748 x 10',2),(28,1,-1,'A. 2500','B. 250','C. 2510','1 can nhựa chứa được 25 lít dầu. Vậy 100 can như thế chứa được .....lít dấu. ',2),(29,2,-1,'A. 1189','B. 1801','C. 1901','Biết trung bình cộng của 10 số là 1072, trung bình cộng của 9 số đầu là 991. Vậy số thứ 10 là:',2),(30,1,-1,'A. Đúng','B. Sai','C. Cả 2 đều đúng','An tính nhẩm: 2020000 : 1000 = 202. An tính đúng hay sai?',2),(31,3,-1,'A. Ta nhìn thấy một vật khi có ánh sáng truyền từ vật đó đến mắt ta','B. Ta nhận biết được ánh sáng khi có ánh sáng truyền vào mắt ta','C. Vật sáng cũng là nguồn sáng','Em hãy nhận ra câu sai trong những câu sau:',3),(32,3,-1,'A. Vì ta mở mắt hướng về phía vật','B. Vì mắt ta phát ra các tia sáng chiếu lên vật','C. Vì có ánh sáng từ vật truyền vào mắt ta','Vì sao ta nhìn thấy một vật?',3),(33,1,-1,'A. Nguồn sáng là vật tự phát ánh sáng hoặc là vật được chiếu sáng','B. Vật được chiếu sáng gọi là vật sáng','C. Vật sáng bao gồm cả nguồn sáng và vật được chiếu sáng','Chọn phát biểu sai',3),(34,2,-1,'A. Quyển sách','B. Mặt Trời','C. Bóng đèn bị đứt dây tóc','Em hãy tìm nguồn sáng trong những vật sau:',3),(35,2,-1,'A. Ngọn nến đang cháy','B. Vỏ chai sáng chói dưới trời nắng','C. Mặt trời',' Hãy chỉ ra vật nào dưới đây không phải là nguồn sáng?',3),(36,3,-1,'A. Đèn dầu đang cháy','B. Vỏ hộp sữa sáng chói dưới trời nắng','C. Mặt Trăng','Hãy chỉ ra vật nào dưới đây là vật sáng?',3),(37,3,-1,'A. Ban đêm, bật đèn, có ánh trăng, nhưng nhắm mắt','B. Ban đêm, bật đèn, không có ánh trăng, nhưng nhắm mắt','C. Ban đêm, không bật đèn, không có ánh trăng, nhưng mở mắt','Trong một phòng hoàn toàn đóng kín bằng cửa kính, ta có thể nhìn thấy đồ vật trong phòng khi:',3),(38,3,-1,'A. Những vì sao bằng nhựa phủ chất dạ quang dán trên trần nhà','B. Chiếc giường gỗ mà ta đang ngủ','C. Kim của chiếc dồng hồ có phủ chất dạ quang','Trong bóng đêm tĩnh mịch ta có thể nhìn thấy được những vật nào sau đây:',3),(39,3,-1,'A. Môi trường trong suốt là môi trường để cho ánh sáng qua gần như hoàn toàn','B. Môi trường chắn sáng là môi trường không để cho ánh sáng qua','C. Một môi trường có thể là môi trường trong suốt hay môi trường chắn sáng tùy theo cường độ của chùm ánh sáng tới mạnh hay yếu','Chọn câu trả lời sai',3),(40,3,-1,'A. Nước, không khí, đường cong','B. Trong suốt, không khí, không đồng tính','C. Trong suốt, đồng tính, đường thẳng','Em hãy điền từ thích hợp vào các chỗ trống trong câu sau:',3),(41,2,-1,'A. Trong môi trường trong suốt, đồng tính và đẳng hướng thì ánh sáng truyền theo khắp mọi phương với cùng vận tốc','B. Trong môi trường trong suốt thì tia sáng là đường thẳng','C. Dùng định luật truyền thẳng ánh sáng có thể giải thích các hiện tượng nhật thực, nguyệt thực,….','Chọn câu trả lời sai',3),(42,2,-1,'A. Tia sáng là đường truyền của ánh sáng. Đường đi của tia sáng giữa hai điểm là đường ngắn nhất của hai điểm đó','B. Chùm tia phân kỳ là chùm các tia sáng giao nhau trên đường truyền của chúng','C. Nguồn sáng là các vật tự phát ra ánh sáng','Chọn câu sai',3),(43,3,-1,'A. Chùm tia phân kì là chùm sáng phát ra từ nguồn điểm','B. Chùm tia hội tụ là chùm sáng mà trong đó các tia sáng đồng qui tại một điểm','C. Chùm tia song song là chùm gồm các tia sáng song song coi như phát ra từ vật ở xa','Chọn câu trả lời đúng',3),(44,3,-1,'A. Chùm sáng song song gồm các tia sáng giao nhau trên đường truyền của chúng','B. Chùm sáng càng xa càng loe rộng ra được gọi là chùm phân kì','C. Chùm sáng xuất phát từ bóng đèn tròn là chùm hội tụ','Chọn câu trả lời đúng',3),(45,3,-1,'A. Góc phản xạ bằng góc tới','B. Pháp tuyến là đường phân giác của góc tạo bởi tia phản xạ và tia tới','C. Tia phản xạ và tia tới đối xứng nhau qua pháp tuyến','Chọn câu trả lời đúng',3),(46,3,-1,'A. Ánh sáng truyền từ Mặt Trời đến Trái Đất','B. Ánh sáng từ bóng đèn truyền đến mắt ta','C. Ánh sáng truyền từ không khí vào chậu nước','Trong những trường hợp sau, trường hợp nào ánh sáng truyền đi theo đường thẳng',4),(47,2,-1,'A. Là những vật làm cho vật khác phát ra âm thanh','B. Là những vật phát ra âm thanh','C. Là những âm thanh phát ra từ âm thoa','Chọn câu trả lời đúng',4),(48,3,-1,'A. Khi kéo căng vật','B. Khi uốn cong vật','C. Khi nén vật','Trong các trường hợp dưới đây, vật phát ra âm thanh khi nào?',4),(49,2,-1,'A. Các vật khi chuyển động đều phát ra âm thanh','B. Các vật phát ra âm thanh đều dao động','C. Các vật dao động đều phát ra âm thanh','Đặc điểm chung của nguồn âm:',4),(50,2,-1,'A. Từ dùi gõ','B. Từ mặt trống','C. Từ cả dùi gõ và mặt trống','Khi gõ vào mặt trống ta nghe được âm thanh phát ra. Vậy âm thanh đó phát ra từ đâu?',4),(51,3,-1,'A. Nguồn âm là vật phát ra âm','B. Dao động là sự dung động qua lại vị trí cân bằng','C. Mọi vật dao động đều phát ra âm',' Em hãy chọn câu sai:',4),(52,3,-1,'A. Nhiệt','B. Điện','C. Ánh sáng','Chọn câu trả lời đúng: Âm thanh được tạo ra nhờ:',4),(53,3,-1,'A. Màng nhĩ của bạn Na','B. Khí quản của bạn Tín','C. Lớp không khí giữa hai bạn','Chọn câu trả lời đúng: Khi bạn Tín nói thầm và tai bạn Na, bộ phận nào dao động phát ra âm?',4),(54,3,-1,'A. Đầu máy bay','B. Cánh máy bay','C. ống phụt khí phản lực','Chọn câu trả lời đúng: Nguồn âm của máy bay phản lực là',4),(55,2,-1,'A. Càng máy bay','B. Đầu máy bay','C. Cánh quạt quay','Chọn câu trả lời đúng: Nguồn âm của máy bay trực thăng là:',4),(56,3,-1,'A. Con người có thể tạo ra nguồn âm từ những bộ phận của cơ thể','B. Nguồn âm của con ong là do miệng con ong phát ra','C. Con rắn không thể tạo ra nguồn âm','Chọn câu trả lời đúng',4),(57,3,-1,'A. Miệng của người trọng tài','B. Chiếc còi','C. Dây thanh đới của người trọng tài','Một người trọng tài đang thổi còi trong một trận đấu bóng đá. Nguồn âm ở đây là:',4),(58,3,-1,'A. Hơi ở trong miệng của các bạn','B. Do vỏ chai dao động','C. Do lớp nước trong trai dao động','Khi uống trà lipton trai, các bạn Nguyện, Ngân, Tiến, Hải đã thử thổi vào miệng chai như đã quảng cáo trên ti vi và nghe thấy âm thanh phát ra. Theo em, cái gì đã phát ra âm?',4),(59,1,-1,'A. Lớp không khí trong ống trúc','B. Bàn tay của người đánh đàn','C. Ống trúc','Ở Tây Nguyên có một loại đàn gọi là Krông – put, đàn này do một nghệ sĩ chơi bằng cách vỗ hai bàn tay để tạo ra một luồng khí vào trong ống, tùy huộc vào cách vỗ mà âm thanh phát ra khác nhau. Em hãy cho biết bộ phận nào đã dao động phát ra âm',4),(60,2,-1,'A. Các đám mây','B. Các lớp không khí dãn nở mạnh phát ra âm','C. Gió lớn','Khi bầu trời xám xịt, có sấm chớp nguồn âm ở đây là:',4),(61,3,-1,'A. Còi không kêu nữa vì viên bi ở bên trong không xoay được','B. Còi vẫn kêu nhưng kêu nhỏ hơn','C. Còi không kêu nữa vì lớp không khí bên trong còi không dao động và thoát ra bên ngoài được','Khi thổi còi mà bịt lỗ còi lại thì:',4),(62,3,-1,'A. Từ băng cát – xét','B. Từ loa máy','C. Từ màng lọc của loa','Hai bố con Thủy cùng nghe nhạc bằng máy Cát – xét, bố Thủy bảo “đố con tiếng nhạc phát ra từ bộ phận nào?”. Em hãy giúp Thủy trả lời nhé',4),(63,3,-1,'A. Các lỗ sáo','B. Miệng người thổi sáo','C. Lớp không khí trong ống sáo','Nguồn âm của cây sáo trúc là:',4),(64,3,-1,'A. Dây đàn','B. Hộp đàn','C. Ngón tay gảy đàn','Nguồn âm của cây đàn ghi – ta là:',3),(65,1,-1,'A. Lá cây    ',' B. Thân cây','C. Luồng gió  ','Một lần đi du lịch ở Đà Lạt, ngồi trên đồi thông, Mai nghe có tiếng vi vu mỗi khi có gió thổi qua. Em hãy cho biết vật phát ra âm thanh là:',3),(66,2,-1,'A. Bãi cát','B. Gió','C. Song biển','Vào ban đêm ở bờ biển ta thường nghe thấy tiếng rì rào, âm thanh ấy phát ra từ đâu?',3),(67,3,-1,'A. Nước','B. Không khí','C. Chân không','Âm truyền đi được là do môi trường vậy những môi trường nào sau đây không truyền được âm',3),(68,3,-1,'A. Môi trường rắn, lỏng truyền được âm','B. Môi trường không khí và chân không không truyền được âm','C. Thép truyền âm tốt hơn gỗ','Em hãy chọn câu sai',3),(69,2,-1,'A. Chỉ truyền được trong chất khí','B. Truyền được trong chất rắn và chất lỏng và chất khí','C. Truyền được trong chấ rắn, chất lỏng, chất khí và cả chân không','Âm thanh:',3),(70,1,-1,'A. Miếng xốp','B. Tấm gỗ','C. Mặt gương','Vật nào dưới đây phản xạ âm tốt?',3),(71,2,-1,'A. Như nhau, vận tốc, 340m/s, 6100m/s','B. Khác nhau, tần số, 20Hz, 20 000 Hz','C. Khác nhau, vận tốc, 6 100m/s, 340m/s','Trong các môi trường… âm truyền đi với… khác nhau và phụ thuộc vào nhiều yếu tố. Vận tốc của âm truyền đi trong không khí là… và trong thép là…',3),(72,3,-1,'A. Có giá trị cực đại khi truyền trong chân không và bằng 3x108 m/s','B. Tăng khi mật độ vật chất của môi trường giảm','C. Giảm khi mật độ vật chất của môi trường càng lớn','chọn câu trả lời sai: Tốc độ truyền âm:',3),(73,3,-1,'A. Tai chó nhạy với hạ âm','B. Tai chó thường hay áp xuống đất do vậy mà phát hiện được âm thanh nhỏ ngay cả khi đang ngủ','C. Tai chó nhạy với cả siêu âm','Sở dĩ chó có thể phát ra những tiếng động lạ mà con người không nghe hấy là vì:',3),(74,2,-1,'A. Môi trường càng loãng khi âm truyền đi càng nhanh','B. Môi trường càng dày đặc thì âm truyền đi càng nhanh','C. Để nghe được âm thanh cần có môi trường truyền âm','Em hãy chọn câu sai',3),(75,2,-1,'A. Âm thanh không thể truyền đi trong nước','B. Âm thanh không thể truyền đi trong chân không','C. Âm thanh không thể truyền đi được từ môi trường này sang môi trường khác',' Chọn câu trả lời đúng',3),(76,1,-1,'A. Tổng của các số đó cộng với số các số hạng','B. Tổng của các số đó trừ đi số các số hạng','C. Tổng của các số đó nhân với số các số hạng','Muốn tìm trung bình cộng của các số ta lấy:',1),(77,2,-1,'A. 48','B. 52','C. 68','Trung bình cộng của các số 25;47;84 là:',1),(78,3,-1,'A. 50','B. 48','C. 46','Điền số thích hợp vào ô trống: Bốn bao gạo có số cân nặng lần lượt là 38kg, 44kg, 48kg, 54kg. Vậy trung bình mỗi bao gạo cân nặng .....kg',1),(79,3,-1,'A. 101','B. 100','C. 1000','Trung bình cộng của số lớn nhất có 3 chữ số và số lẻ nhỏ nhất có 4 chữ số là',1),(80,2,-1,'A. 36','B. 102','C. 35','Điền số thích hợp vào ô trống: Ba xe tải màu trắng chở được số gạo lần lượt là 25 tấn, 34 tấn, 43 tấn. Hai xe tải màu vàng, mỗi xe chở đc 39 tấn gạo. Vậy trung bình mỗi xe tải chở được:....tấn gạo',1),(81,2,-1,'A. 90','B. 93','C. 102','Một đội công nhân tham gia trồng cây gồm 3 tổ. Tổ một có 8 người, mỗi người trồng được 12 cây. Tổ hai trồng được 80 cây, tổ ba trồng được nhiều hơn tổ hai 14 cây. Hỏi trung bình mỗi tổ trồng được bao nhiêu cây?',1),(82,1,-1,'A. 272','B. 277','C. 703',' Điền số thích hợp vào ô trống: Biết trung bình cộng của 4 số bằng 68. Tổng của 4 số đó là .....',2),(83,2,-1,'A. 65','B. 50','C. 52','Trung bình cộng của 2 số bằng 49, biết một trong hai số bằng 33. Vậy số còn lại là:',1),(84,2,-1,'A. 1014','B. 999','C. 1002','Trung bình cộng của dãy số lẻ từ 11 đến 2017 là.....',1),(85,3,-1,'A. 36 tuổi','B. 39 tuổi','C. 42 tuổi','Năm nay tuổi trung bình của 32 học sinh của một lớp là 9 tuổi. Nếu tính cả thầy giáo chủ nhiệm thì tuổi trung bình của thầy giáo và 32 học sinh là 10 tuổi. Tìm tuổi của thầy giáo chủ nhiệm sau 3 năm nữa.',1),(86,2,-1,'A. g','B. dag','C. hg','Đề-ca-gam được viết tắt là:',2),(87,1,-1,'A. Tấn ','B. Tạ ','C. Yến','Trong các đơn vị đo khối lượng sau, đơn vị nào lớn hơn ki-lô-gam?',2),(88,3,-1,'A. CnH2nN. ','B. CnH2n+1N.','C. CnH2n+3N.','Amin no, đơn chức, mạch hở có công thức tổng quát là',6),(89,3,-1,'A. (CH3)3N.','B. CH3NHCH3.','C. CH3NH2. ','Chất nào sau đây thuộc loại amin bậc một ?',6),(90,3,-1,'A. phenylamin','B. metylamin','C. đimetylamin','Chất nào sau đây thuộc loại amin bậc hai ?',6),(91,1,-1,'A.(CH3)3N','B. CH3-NH2','C. C2H5-NH2','Chất nào sau đây thuộc loại amin bậc ba ?',6),(92,3,-1,'A. 2.','B. 3.','C. 4.','Số đồng phân cấu tạo amin có cùng công thức phân tử C3H9N là:',6),(93,2,-1,'A. 3.','B. 4.','C. 2.','Số đồng phân amin bậc một, chứa vòng benzen, có cùng công thức phân tử C7H9N là:',6),(94,2,-1,'A. anilin, metylamin, amoniac','B. anilin, amoniac, metylamin','C. amoniac, etylamin, anilin','Dãy nào sau đây gồm các chất được xếp theo thứ tự tăng dần lực bazơ .?',6),(95,3,-1,'A. 18.67%.','B. 12,96%.','C. 15,05%.','Thành phần phần trăm khối lượng nitơ trong phân từ anilin bằng',6),(96,1,-1,'A. 2.','B. 3.','C. 4.','Một amin đơn chức bậc một có 23,73% nitơ về khối lượng, số đồng phân cấu tạo có thể có của amin này là',6),(97,2,-1,'A. 5.','B.4.','C. 3.','Cho 5,9 gam amin đơn chức X tác dụng vừa đủ với dung dịch HC1, tạo ra 9,55 gam muối, số công thức cấu tạo ứng với công thức phân tử của X là',6),(98,3,-1,'A. H2NCH2CH2CH2NH2.','B. CH3CH2CH2NH2.','C. H2NCH2NH2.','Trung hòa hòàn toàn 12 gam một amin (bậc một, mạch cacbon không phân nhánh) bằng axit HCl, tạo ra 26,6 gam muối. Amin có công thức là',6),(99,2,-1,'A. C4H9N.','B. C3H7N.','C.C2H7N.','Khi đốt cháy hoàn toàn một amin đơn chức X, thu được 1,344 lít khí CO2, 0, 24 lít khí N2 (các thể tích khí đo ở đktc) và 1,62 gam H2O. Công thức của X là',6),(100,1,-1,'A. propen ','B. stiren','C.isopren','Chất nào sau đây khống có khả năng tham gia phản ứng trùng hợp ?',6),(101,3,-1,'A. 801','B. 808','C. 8008',' 8 tấn 8kg = ... kg. Số thích hợp điền vào chỗ chấm là:..',1),(102,2,-1,'A. 6000','B. 60000','C. 600','Giá trị của chữ số 6 trong số 8 365 927 là:',1),(103,1,-1,'A. 329','B. 3290','C. 394','Giá trị của biểu thức 25+38×m với m = 8 là ....',1),(104,1,-1,'A. 8','B. 9','C. 6','Số gồm hai tỉ và năm trăm nghìn có số chữ số 0 là:',2),(105,1,-1,'A. Thế kỉ XX','B. Thế kỉ XIX','C. Thế kỉ XVII','Ngày 30 tháng 4 năm 2018 nước ta kỉ niệm 43 năm giải phóng miền Nam. Hỏi năm giải phóng miền Nam thuộc thế kỉ nào?',2),(106,1,-1,'A. Đúng','B. Sai','C. Cả 2 đều sai','1 giờ = 60 phút. Đúng hay sai?',1),(107,2,-1,'A. VII','B. II','C. V','Thế kỉ thứ hai được viết bằng chữ số La Mã là:',1),(108,3,-1,'A. Thế kỷ V','B. Thế kỷ VII','C. Thế kỷ VI','Từ năm 701 đến năm 800 là thế kỉ nào?',1),(109,1,-1,'A. 33','B. 103','C. 183','3 phút 3 giây = … giây.',1),(110,3,-1,'A. XX','B. XXI','C. XIX',' Chiến thắng Điện Biên Phủ vào ngày 7 tháng 5 năm 1954. Vậy chiến thắng Điện Biên Phủ vào thế kỉ:',1),(111,2,-1,'A. Thế kỷ XVI; 730 năm','B. Thế kỷ XII; 630 năm','C. Thế kỷ XIII; 730 năm','Chiến thắng Bạch Đằng năm 1288 đánh tan quân Mông Nguyên lần thứ ba thuộc thế kỉ nào? Tính đến nay đã được bao nhiêu năm?',1),(112,3,-1,'A. 250','B. 25','C. 15','Thế kỷ XX có năm 2000 là năm nhuận. Vậy trong thế kỷ XXI sẽ có....năm nhuận',2),(113,2,-1,'A. locate','B. displace','C. establish','Using Facebook, you can ',5),(115,1,-1,'A. large','B. limited','C. narrow','I have a  modest llittle glass fish where i keep a variety fish',5),(116,2,-1,'A. in facour of','B. refuse','C. agree','The majority of people in the town strongly support  the plans to build a new school.',5),(117,3,-1,'A. amicale','B. inapplicable','C. hostile','Mr. Smith’s new neighbors appear to be very friendly',5),(118,1,-1,'A. low','B. untouchable','C. far','I\'ve put the cake on a high shelf where he can\'t get at it.',5),(119,3,-1,'A. studious','B. learned','C. lazy','I\'ve put the cake on a high shelf where he can\'t get at it.',5),(120,2,-1,'A. voluntary','B. mandatory','C. pressure','Certain courses are compulsory; others are optional ',5),(121,1,-1,'A. weak','B. musculos','C. sick','She must be very strong to carry such a weight on her back.',5),(122,3,-1,'A. funny','B. satisfied','C. upset','Barry seem happy enough working for himself',5),(190,1,-1,'A. revealed','B. frequented','C. accessible','We ought to keep these proposals ',5);
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `result`
--

LOCK TABLES `result` WRITE;
/*!40000 ALTER TABLE `result` DISABLE KEYS */;
INSERT INTO `result` VALUES (1,5,1,'admin','hoa'),(2,4,2,'trung','hoa1'),(3,2,1,'trung','hoa11'),(4,3,2,'trung','Trung'),(5,1,1,'trung','trung');
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
INSERT INTO `user` VALUES ('admin','Nghệ An','hoale11@gmail.com','Lê Đức Hòa','avatar','$2a$10$52nJhv6TJlbwbzhl.ip0v.QRoafPZPVv97cdhkyHemq7WpWgBXXVS','0900009999','$2a$10$52nJhv6TJlbwbzhl.ip0v.QRoafPZPVv97cdhkyHemq7WpWgBXXVS'),('trung','Đà Nẵng','trung11@gmail.com','Thế Trung','anh2.jpg','$2a$10$52nJhv6TJlbwbzhl.ip0v.QRoafPZPVv97cdhkyHemq7WpWgBXXVS','0900009999','$2a$10$52nJhv6TJlbwbzhl.ip0v.QRoafPZPVv97cdhkyHemq7WpWgBXXVS');
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

-- Dump completed on 2021-09-13 10:04:25
