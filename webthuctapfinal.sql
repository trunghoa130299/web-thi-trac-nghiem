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
INSERT INTO `classes` VALUES (1,'a0920i1'),(2,'a01020i1'),(3,'a0821i1'),(4,'a0921i1');
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
  PRIMARY KEY (`id`),
  KEY `FKp3wglafw35rxngx7hvqj39873` (`classes_id`),
  KEY `FKos7g6kn2748ll3ofc3w163gxh` (`subject_id`),
  CONSTRAINT `FKos7g6kn2748ll3ofc3w163gxh` FOREIGN KEY (`subject_id`) REFERENCES `subject` (`id`),
  CONSTRAINT `FKp3wglafw35rxngx7hvqj39873` FOREIGN KEY (`classes_id`) REFERENCES `classes` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam`
--

LOCK TABLES `exam` WRITE;
/*!40000 ALTER TABLE `exam` DISABLE KEYS */;
INSERT INTO `exam` VALUES (1,'MD-0001','Đề toán 2021',1,0),(2,'MD-8839','Toán đại cương 2020',2,0),(5,'MD-0283','Câu hỏi trắc nghiệm lý thuyết tiếng anh 1',3,3),(6,'MD-9383','Câu hỏi trắc nghiệm lý thuyết hóa học 1',1,2),(21,'MD-3882','Đề kiểm tra 1 tiết môn toán',1,0),(22,'MD-8329','Đề Toán 1',2,0),(28,'MD-9273','Đề kiểm tra 1 tiết môn vật lí',3,1),(29,'MD-3829','Đề kiểm tra 2 tiết môn vật lí',2,1),(30,'MD-3832','Đề kiểm tra 1 tiết môn vật lí 45',2,1);
/*!40000 ALTER TABLE `exam` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exam_question`
--

DROP TABLE IF EXISTS `exam_question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exam_question` (
  `exam_id` int NOT NULL,
  `ques_id` int NOT NULL,
  KEY `FKl7iemhe9amxumih4r8pmylqvb` (`ques_id`),
  KEY `FK75y5n4rt15oyfmshrwwi73d` (`exam_id`),
  CONSTRAINT `FK75y5n4rt15oyfmshrwwi73d` FOREIGN KEY (`exam_id`) REFERENCES `exam` (`id`),
  CONSTRAINT `FKl7iemhe9amxumih4r8pmylqvb` FOREIGN KEY (`ques_id`) REFERENCES `question` (`ques_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam_question`
--

LOCK TABLES `exam_question` WRITE;
/*!40000 ALTER TABLE `exam_question` DISABLE KEYS */;
INSERT INTO `exam_question` VALUES (21,1),(21,2),(21,3),(1,1),(1,2),(1,3),(1,4),(1,5),(1,6),(1,7),(1,8),(1,9),(1,10),(2,16),(2,17),(2,18),(2,19),(2,20),(2,21),(2,22),(2,23),(2,24),(2,25),(2,26),(5,113),(5,115),(5,116),(5,117),(5,118),(5,119),(5,120),(5,121),(5,122),(5,190),(6,88),(6,89),(6,90),(6,91),(6,92),(6,93),(6,94),(6,95),(6,96),(6,97),(6,98),(28,62),(28,63),(29,1),(29,31),(29,32),(29,33),(29,34),(29,35),(29,36),(29,37),(29,39),(29,40),(22,1),(22,2),(22,3),(22,4),(22,5),(22,6),(22,7),(22,8),(22,9),(22,10),(22,11),(22,12),(30,63),(30,1),(30,31),(30,32),(30,33),(30,34),(30,35),(30,36),(30,37),(30,39),(30,40);
/*!40000 ALTER TABLE `exam_question` ENABLE KEYS */;
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
  `optiond` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `id_subject` int DEFAULT NULL,
  PRIMARY KEY (`ques_id`),
  KEY `FKgkrmmhtghxqxio4ghkxqw8jbt` (`id_subject`),
  CONSTRAINT `FKgkrmmhtghxqxio4ghkxqw8jbt` FOREIGN KEY (`id_subject`) REFERENCES `subject` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=191 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question`
--

LOCK TABLES `question` WRITE;
/*!40000 ALTER TABLE `question` DISABLE KEYS */;
INSERT INTO `question` VALUES (1,2,-1,'Bốn nghìn sáu trăm bảy chín','Bốn nghìn sáu trăm bảy mươi chín','Bốn nghìn bảy trăm sáu mươi chín','Cả 3 đều sai','Số 4679 được đọc là:',0),(2,2,-1,'13506','13605','10653','Cả 3 đều sai','Số mười ba nghìn sáu trăm linh năm được viết là:',0),(3,3,-1,'Hàng chục nghìn','Hàng nghìn','Hàng trăm','Cả 3 đều sai','Chữ số 9 trong số 56931 thuộc hàng nào?',0),(4,3,-1,'50','500','5000','Cả 3 đều sai','Giá trị của chữ số 5 trong số 85246 là:',0),(5,2,0,'4936 = 4000 + 9000 + 30 + 6','4936 = 4000 + 90 + 300 + 6','4936 = 4000 + 900 + 30 + 6','Cả 3 đều sai','Viết số 4936 thành tổng (theo mẫu)',0),(6,2,-1,'2506','6250','625','Cả 3 đều sai','Chọn số thích hợp để điền vào ô trống (theo mẫu):6000 + 200 + 5 = ? ',0),(7,2,-1,'99999','99990','99900','Cả 3 đều sai','Số tròn chục liền trước số một trăm nghìn viết là:',0),(8,1,-1,'499','239','49900','Cả 3 đều sai','Điền số thích hợp vào ô trống: Số bé nhất có tổng các chữ số bằng 22 là....',0),(9,2,-1,'600','6000','6500','Cả 3 đều sai','Tính nhẩm: 5000+2000-1000= ???',0),(10,1,-1,'8000','800','900','Cả 3 đều sai','Điền số thích hợp vào ô trống: 9000-3000+2000= ???',0),(11,2,-1,'8755','8765','8675','Cả 3 đều sai','Tính: 5847 + 2918',0),(12,1,-1,'21276.','2127','212760','Cả 3 đều sai','Điền số thích hợp vào ô trống: 35048 - 13772 = ???',0),(13,1,-1,'>','<','=','Cả 3 đều sai','Chọn dấu thích hợp để điền vào chỗ chấm: 18903 ... 9987',0),(14,2,-1,'>','<','=','Cả 3 đều sai','Chọn dấu thích hợp để điền vào chỗ trống: 98988....989999..',0),(15,1,-1,'>','<','=','Cả 3 đều sai','Chọn dấu thích hợp để điền vào chỗ trống: 12034 ....99888',0),(16,1,-1,'29785;72895;87259;87925','29785;72895;87925; 87259','72895;87925; 29785;  87259','Cả 3 đều sai','Sắp xếp các số theo thứ tự từ bé đến lớn: 72895   87259   29785   87925',0),(17,3,-1,'=','>','<','Cả 3 đều sai','Chọn dấu thích hợp để điền vào chỗ chấm: 91483 - 28095…15848 × 4',0),(18,3,-1,'1460','2460','81732','Cả 3 đều sai','Tính giá trị biểu thức: (40136 - 12892) x 3',0),(19,2,-1,'4972','9427','9927','Cả 3 đều sai','Điền số thích hợp vào ô trống: Biết x × 6 = 56562',0),(20,1,-1,'1578','1728','1772','Cả 3 đều sai','Điền số thích hợp vào ô trống: Một nhà máy sản xuất trong 4 ngày được 1052 chiếc xe đạp. Vậy trong 6 ngày nhà máy đó sản xuất được....xe đạp.Biết số xe đạp sản xuất mỗi ngày là như nhau. ',0),(21,3,-1,'1488','3137','5002','Cả 3 đều sai','Tìm x biết: (x - 3245) × 4 = 24241 - 17213',0),(22,2,-1,'27000','2700','2500','Cả 3 đều sai','Điền số thích hợp vào ô trống: Tính nhẩm: 9000 × 3=',0),(23,3,-1,'Khi nhân một số tự nhiên với 10 ta chỉ việc thêm một chữ số 0 vào bên phải số đó','Khi nhân một số tự nhiên với 100 ta chỉ việc thêm hai chữ số 0 vào bên phải số đó','Cả 2 đáp án đều đúng','Cả 3 đều sai','Hãy chọn đáp án đúng nhất',0),(24,1,-1,'Đúng ','Sai','Cả 2 đều sai','Cả 3 đều sai','Khi chia số tròn chục, tròn trăm, tròn nghìn ... cho 10, 100, 1000,... ta chỉ việc bỏ bớt một, hai, ba, ... chữ số 0 ở bên phải số đó. Đúng hay sai?',0),(25,1,-1,'2916','29160','291600','Cả 3 đều sai','Tính: 32400∶100×9.',0),(26,2,-1,'430.','4430.','340','Cả 3 đều sai','Điền số thích hợp vào ô trống: Biết x : 10 = 378 + 65, x = ......',0),(27,3,-1,'>','<','=','Cả 3 đều sai','7480000 : 1000 ... 748 x 10',0),(28,1,-1,'2500','250','2510','Cả 3 đều sai','1 can nhựa chứa được 25 lít dầu. Vậy 100 can như thế chứa được .....lít dấu. ',0),(29,2,-1,'1189','1801','1901','Cả 3 đều sai','Biết trung bình cộng của 10 số là 1072, trung bình cộng của 9 số đầu là 991. Vậy số thứ 10 là:',0),(30,1,-1,'Đúng','Sai','Cả 2 đều đúng','Cả 3 đều sai','An tính nhẩm: 2020000 : 1000 = 202. An tính đúng hay sai?',0),(31,3,-1,' Ta nhìn thấy một vật khi có ánh sáng truyền từ vật đó đến mắt ta','Ta nhận biết được ánh sáng khi có ánh sáng truyền vào mắt ta','Vật sáng cũng là nguồn sáng','Cả 3 đều sai','Em hãy nhận ra câu sai trong những câu sau:',1),(32,3,-1,'Vì ta mở mắt hướng về phía vật','Vì mắt ta phát ra các tia sáng chiếu lên vật','Vì có ánh sáng từ vật truyền vào mắt ta','Cả 3 đều sai','Vì sao ta nhìn thấy một vật?',1),(33,1,-1,'Nguồn sáng là vật tự phát ánh sáng hoặc là vật được chiếu sáng','Vật được chiếu sáng gọi là vật sáng','Vật sáng bao gồm cả nguồn sáng và vật được chiếu sáng','Cả 3 đều sai','Chọn phát biểu sai',1),(34,2,-1,'Quyển sách','Mặt Trời','Bóng đèn bị đứt dây tóc','Cả 3 đều sai','Em hãy tìm nguồn sáng trong những vật sau:',1),(35,2,-1,'Ngọn nến đang cháy','Vỏ chai sáng chói dưới trời nắng','Mặt trời','Cả 3 đều sai',' Hãy chỉ ra vật nào dưới đây không phải là nguồn sáng?',1),(36,3,-1,'Đèn dầu đang cháy','Vỏ hộp sữa sáng chói dưới trời nắng','Mặt Trăng','Cả 3 đều sai','Hãy chỉ ra vật nào dưới đây là vật sáng?',1),(37,3,-1,'Ban đêm, bật đèn, có ánh trăng, nhưng nhắm mắt','Ban đêm, bật đèn, không có ánh trăng, nhưng nhắm mắt','Ban đêm, không bật đèn, không có ánh trăng, nhưng mở mắt','Cả 3 đều sai','Trong một phòng hoàn toàn đóng kín bằng cửa kính, ta có thể nhìn thấy đồ vật trong phòng khi:',1),(38,3,-1,'Những vì sao bằng nhựa phủ chất dạ quang dán trên trần nhà','Chiếc giường gỗ mà ta đang ngủ','Kim của chiếc dồng hồ có phủ chất dạ quang','Cả 3 đều sai','Trong bóng đêm tĩnh mịch ta có thể nhìn thấy được những vật nào sau đây:',1),(39,3,-1,'Môi trường trong suốt là môi trường để cho ánh sáng qua gần như hoàn toàn','Môi trường chắn sáng là môi trường không để cho ánh sáng qua','Một môi trường có thể là môi trường trong suốt hay môi trường chắn sáng tùy theo cường độ của chùm ánh sáng tới mạnh hay yếu','Cả 3 đều sai','Chọn câu trả lời sai',1),(40,3,-1,'Nước, không khí, đường cong','Trong suốt, không khí, không đồng tính','Trong suốt, đồng tính, đường thẳng','Cả 3 đều sai','Em hãy điền từ thích hợp vào các chỗ trống trong câu sau:',1),(41,2,-1,'Trong môi trường trong suốt, đồng tính và đẳng hướng thì ánh sáng truyền theo khắp mọi phương với cùng vận tốc','Trong môi trường trong suốt thì tia sáng là đường thẳng','Dùng định luật truyền thẳng ánh sáng có thể giải thích các hiện tượng nhật thực, nguyệt thực,….','Cả 3 đều sai','Chọn câu trả lời sai',1),(42,2,-1,'Tia sáng là đường truyền của ánh sáng. Đường đi của tia sáng giữa hai điểm là đường ngắn nhất của hai điểm đó','Chùm tia phân kỳ là chùm các tia sáng giao nhau trên đường truyền của chúng','Nguồn sáng là các vật tự phát ra ánh sáng','Cả 3 đều sai','Chọn câu sai',1),(43,3,-1,'Chùm tia phân kì là chùm sáng phát ra từ nguồn điểm','Chùm tia hội tụ là chùm sáng mà trong đó các tia sáng đồng qui tại một điểm','Chùm tia song song là chùm gồm các tia sáng song song coi như phát ra từ vật ở xa','Cả 3 đều sai','Chọn câu trả lời đúng',1),(44,3,-1,'Chùm sáng song song gồm các tia sáng giao nhau trên đường truyền của chúng','Chùm sáng càng xa càng loe rộng ra được gọi là chùm phân kì','Chùm sáng xuất phát từ bóng đèn tròn là chùm hội tụ','Cả 3 đều sai','Chọn câu trả lời đúng',1),(45,3,-1,'Góc phản xạ bằng góc tới','Pháp tuyến là đường phân giác của góc tạo bởi tia phản xạ và tia tới','Tia phản xạ và tia tới đối xứng nhau qua pháp tuyến','Cả 3 đều sai','Chọn câu trả lời đúng',1),(46,3,-1,'Ánh sáng truyền từ Mặt Trời đến Trái Đất','Ánh sáng từ bóng đèn truyền đến mắt ta','Ánh sáng truyền từ không khí vào chậu nước','Cả 3 đều sai','Trong những trường hợp sau, trường hợp nào ánh sáng truyền đi theo đường thẳng',1),(47,2,-1,'Là những vật làm cho vật khác phát ra âm thanh','Là những vật phát ra âm thanh','Là những âm thanh phát ra từ âm thoa','Cả 3 đều sai','Chọn câu trả lời đúng',1),(48,3,-1,'Khi kéo căng vật','Khi uốn cong vật','Khi nén vật','Cả 3 đều sai','Trong các trường hợp dưới đây, vật phát ra âm thanh khi nào?',1),(49,2,-1,'Các vật khi chuyển động đều phát ra âm thanh','Các vật phát ra âm thanh đều dao động','Các vật dao động đều phát ra âm thanh','Cả 3 đều sai','Đặc điểm chung của nguồn âm:',1),(50,2,-1,'Từ dùi gõ','Từ mặt trống','Từ cả dùi gõ và mặt trống','Cả 3 đều sai','Khi gõ vào mặt trống ta nghe được âm thanh phát ra. Vậy âm thanh đó phát ra từ đâu?',1),(51,3,-1,'Nguồn âm là vật phát ra âm','Dao động là sự dung động qua lại vị trí cân bằng','Mọi vật dao động đều phát ra âm','Cả 3 đều sai',' Em hãy chọn câu sai:',1),(52,3,-1,'Nhiệt','Điện','Ánh sáng','Cả 3 đều sai','Chọn câu trả lời đúng: Âm thanh được tạo ra nhờ:',1),(53,3,-1,'Màng nhĩ của bạn Na','Khí quản của bạn Tín','Lớp không khí giữa hai bạn','Cả 3 đều sai','Chọn câu trả lời đúng: Khi bạn Tín nói thầm và tai bạn Na, bộ phận nào dao động phát ra âm?',1),(54,3,-1,'Đầu máy bay','Cánh máy bay','ống phụt khí phản lực','Cả 3 đều sai','Chọn câu trả lời đúng: Nguồn âm của máy bay phản lực là',1),(55,2,-1,'Càng máy bay','Đầu máy bay','Cánh quạt quay','Cả 3 đều sai','Chọn câu trả lời đúng: Nguồn âm của máy bay trực thăng là:',1),(56,3,-1,'Con người có thể tạo ra nguồn âm từ những bộ phận của cơ thể','Nguồn âm của con ong là do miệng con ong phát ra','Con rắn không thể tạo ra nguồn âm','Cả 3 đều sai','Chọn câu trả lời đúng',1),(57,3,-1,'Miệng của người trọng tài','Chiếc còi','Dây thanh đới của người trọng tài','Cả 3 đều sai','Một người trọng tài đang thổi còi trong một trận đấu bóng đá. Nguồn âm ở đây là:',1),(58,3,-1,'Hơi ở trong miệng của các bạn','Do vỏ chai dao động','Do lớp nước trong trai dao động','Cả 3 đều sai','Khi uống trà lipton trai, các bạn Nguyện, Ngân, Tiến, Hải đã thử thổi vào miệng chai như đã quảng cáo trên ti vi và nghe thấy âm thanh phát ra. Theo em, cái gì đã phát ra âm?',1),(59,1,-1,'Lớp không khí trong ống trúc','Bàn tay của người đánh đàn','Ống trúc','Cả 3 đều sai','Ở Tây Nguyên có một loại đàn gọi là Krông – put, đàn này do một nghệ sĩ chơi bằng cách vỗ hai bàn tay để tạo ra một luồng khí vào trong ống, tùy huộc vào cách vỗ mà âm thanh phát ra khác nhau. Em hãy cho biết bộ phận nào đã dao động phát ra âm',1),(60,2,-1,'Các đám mây','Các lớp không khí dãn nở mạnh phát ra âm','Gió lớn','Cả 3 đều sai','Khi bầu trời xám xịt, có sấm chớp nguồn âm ở đây là:',1),(61,3,-1,'Còi không kêu nữa vì viên bi ở bên trong không xoay được','Còi vẫn kêu nhưng kêu nhỏ hơn','Còi không kêu nữa vì lớp không khí bên trong còi không dao động và thoát ra bên ngoài được','Cả 3 đều sai','Khi thổi còi mà bịt lỗ còi lại thì:',1),(62,3,-1,'Từ băng cát – xét','Từ loa máy','Từ màng lọc của loa','Cả 3 đều sai','Hai bố con Thủy cùng nghe nhạc bằng máy Cát – xét, bố Thủy bảo “đố con tiếng nhạc phát ra từ bộ phận nào?”. Em hãy giúp Thủy trả lời nhé',1),(63,3,-1,'Các lỗ sáo','Miệng người thổi sáo','Lớp không khí trong ống sáo','Cả 3 đều sai','Nguồn âm của cây sáo trúc là:',1),(64,3,-1,'Dây đàn','Hộp đàn','Ngón tay gảy đàn','Cả 3 đều sai','Nguồn âm của cây đàn ghi – ta là:',1),(65,1,-1,'Lá cây    ','Thân cây','Luồng gió  ','Cả 3 đều sai','Một lần đi du lịch ở Đà Lạt, ngồi trên đồi thông, Mai nghe có tiếng vi vu mỗi khi có gió thổi qua. Em hãy cho biết vật phát ra âm thanh là:',1),(66,2,-1,'Bãi cát','Gió','Song biển','Cả 3 đều sai','Vào ban đêm ở bờ biển ta thường nghe thấy tiếng rì rào, âm thanh ấy phát ra từ đâu?',1),(67,3,-1,'Nước','Không khí','Chân không','Cả 3 đều sai','Âm truyền đi được là do môi trường vậy những môi trường nào sau đây không truyền được âm',1),(68,3,-1,'Môi trường rắn, lỏng truyền được âm','Môi trường không khí và chân không không truyền được âm','Thép truyền âm tốt hơn gỗ','Cả 3 đều sai','Em hãy chọn câu sai',1),(69,2,-1,'Chỉ truyền được trong chất khí','Truyền được trong chất rắn và chất lỏng và chất khí','Truyền được trong chấ rắn, chất lỏng, chất khí và cả chân không','Cả 3 đều sai','Âm thanh:',1),(70,1,-1,'Miếng xốp','Tấm gỗ','Mặt gương','Cả 3 đều sai','Vật nào dưới đây phản xạ âm tốt?',1),(71,2,-1,'Như nhau, vận tốc, 340m/s, 6100m/s','Khác nhau, tần số, 20Hz, 20 000 Hz','Khác nhau, vận tốc, 6 100m/s, 340m/s','Cả 3 đều sai','Trong các môi trường… âm truyền đi với… khác nhau và phụ thuộc vào nhiều yếu tố. Vận tốc của âm truyền đi trong không khí là… và trong thép là…',1),(72,3,-1,'Có giá trị cực đại khi truyền trong chân không và bằng 3x108 m/s','Tăng khi mật độ vật chất của môi trường giảm','Giảm khi mật độ vật chất của môi trường càng lớn','Cả 3 đều sai','chọn câu trả lời sai: Tốc độ truyền âm:',1),(73,3,-1,'Tai chó nhạy với hạ âm','Tai chó thường hay áp xuống đất do vậy mà phát hiện được âm thanh nhỏ ngay cả khi đang ngủ','Tai chó nhạy với cả siêu âm','Cả 3 đều sai','Sở dĩ chó có thể phát ra những tiếng động lạ mà con người không nghe hấy là vì:',1),(74,2,-1,'Môi trường càng loãng khi âm truyền đi càng nhanh','Môi trường càng dày đặc thì âm truyền đi càng nhanh','Để nghe được âm thanh cần có môi trường truyền âm','Cả 3 đều sai','Em hãy chọn câu sai',1),(75,2,-1,'Âm thanh không thể truyền đi trong nước','Âm thanh không thể truyền đi trong chân không','Âm thanh không thể truyền đi được từ môi trường này sang môi trường khác','Cả 3 đều sai',' Chọn câu trả lời đúng',1),(76,1,-1,'Tổng của các số đó cộng với số các số hạng','Tổng của các số đó trừ đi số các số hạng','Tổng của các số đó nhân với số các số hạng','Cả 3 đều sai','Muốn tìm trung bình cộng của các số ta lấy:',1),(77,2,-1,'48','52','68','Cả 3 đều sai','Trung bình cộng của các số 25;47;84 là:',0),(78,3,-1,'50','48','46','Cả 3 đều sai','Điền số thích hợp vào ô trống: Bốn bao gạo có số cân nặng lần lượt là 38kg, 44kg, 48kg, 54kg. Vậy trung bình mỗi bao gạo cân nặng .....kg',0),(79,3,-1,'101','100','1000','Cả 3 đều sai','Trung bình cộng của số lớn nhất có 3 chữ số và số lẻ nhỏ nhất có 4 chữ số là',0),(80,2,-1,'36','102','35','Cả 3 đều sai','Điền số thích hợp vào ô trống: Ba xe tải màu trắng chở được số gạo lần lượt là 25 tấn, 34 tấn, 43 tấn. Hai xe tải màu vàng, mỗi xe chở đc 39 tấn gạo. Vậy trung bình mỗi xe tải chở được:....tấn gạo',0),(81,2,-1,'90','93','102','Cả 3 đều sai','Một đội công nhân tham gia trồng cây gồm 3 tổ. Tổ một có 8 người, mỗi người trồng được 12 cây. Tổ hai trồng được 80 cây, tổ ba trồng được nhiều hơn tổ hai 14 cây. Hỏi trung bình mỗi tổ trồng được bao nhiêu cây?',0),(82,1,-1,'272','277','703','Cả 3 đều sai',' Điền số thích hợp vào ô trống: Biết trung bình cộng của 4 số bằng 68. Tổng của 4 số đó là .....',0),(83,2,-1,'65','50','52','Cả 3 đều sai','Trung bình cộng của 2 số bằng 49, biết một trong hai số bằng 33. Vậy số còn lại là:',0),(84,2,-1,'1014','999','1002','Cả 3 đều sai','Trung bình cộng của dãy số lẻ từ 11 đến 2017 là.....',0),(85,3,-1,'36 tuổi','39 tuổi','42 tuổi','Cả 3 đều sai','Năm nay tuổi trung bình của 32 học sinh của một lớp là 9 tuổi. Nếu tính cả thầy giáo chủ nhiệm thì tuổi trung bình của thầy giáo và 32 học sinh là 10 tuổi. Tìm tuổi của thầy giáo chủ nhiệm sau 3 năm nữa.',0),(86,2,-1,'g','dag','hg','Cả 3 đều sai','Đề-ca-gam được viết tắt là:',0),(87,1,-1,'Tấn ','Tạ ','Yến','Cả 3 đều sai','Trong các đơn vị đo khối lượng sau, đơn vị nào lớn hơn ki-lô-gam?',0),(88,3,-1,'CnH2nN. ','CnH2n+1N.','CnH2n+3N.','Cả 3 đều sai','Amin no, đơn chức, mạch hở có công thức tổng quát là',2),(89,3,-1,'(CH3)3N.','CH3NHCH3.','CH3NH2. ','Cả 3 đều sai','Chất nào sau đây thuộc loại amin bậc một ?',2),(90,3,-1,'phenylamin','metylamin','đimetylamin','Cả 3 đều sai','Chất nào sau đây thuộc loại amin bậc hai ?',2),(91,1,-1,'(CH3)3N','CH3-NH2','C2H5-NH2','Cả 3 đều sai','Chất nào sau đây thuộc loại amin bậc ba ?',2),(92,3,-1,'2.','3.','4.','Cả 3 đều sai','Số đồng phân cấu tạo amin có cùng công thức phân tử C3H9N là:',2),(93,2,-1,'3.','4.','2.','Cả 3 đều sai','Số đồng phân amin bậc một, chứa vòng benzen, có cùng công thức phân tử C7H9N là:',2),(94,2,-1,'anilin, metylamin, amoniac','anilin, amoniac, metylamin','amoniac, etylamin, anilin','Cả 3 đều sai','Dãy nào sau đây gồm các chất được xếp theo thứ tự tăng dần lực bazơ .?',2),(95,3,-1,'18.67%.','12,96%.','15,05%.','Cả 3 đều sai','Thành phần phần trăm khối lượng nitơ trong phân từ anilin bằng',2),(96,1,-1,'2.','3.','4.','Cả 3 đều sai','Một amin đơn chức bậc một có 23,73% nitơ về khối lượng, số đồng phân cấu tạo có thể có của amin này là',2),(97,2,-1,'5.','4.','3.','Cả 3 đều sai','Cho 5,9 gam amin đơn chức X tác dụng vừa đủ với dung dịch HC1, tạo ra 9,55 gam muối, số công thức cấu tạo ứng với công thức phân tử của X là',2),(98,3,-1,'H2NCH2CH2CH2NH2.','CH3CH2CH2NH2.','H2NCH2NH2.','Cả 3 đều sai','Trung hòa hòàn toàn 12 gam một amin (bậc một, mạch cacbon không phân nhánh) bằng axit HCl, tạo ra 26,6 gam muối. Amin có công thức là',2),(99,2,-1,'C4H9N.','C3H7N.','C2H7N.','Cả 3 đều sai','Khi đốt cháy hoàn toàn một amin đơn chức X, thu được 1,344 lít khí CO2, 0, 24 lít khí N2 (các thể tích khí đo ở đktc) và 1,62 gam H2O. Công thức của X là',2),(100,1,-1,'propen ','stiren','isopren','Cả 3 đều sai','Chất nào sau đây khống có khả năng tham gia phản ứng trùng hợp ?',2),(101,3,-1,'801','808','8008','Cả 3 đều sai',' 8 tấn 8kg = ... kg. Số thích hợp điền vào chỗ chấm là:..',0),(102,2,-1,'6000','60000','600','Cả 3 đều sai','Giá trị của chữ số 6 trong số 8 365 927 là:',0),(103,1,-1,'329','3290','394','Cả 3 đều sai','Giá trị của biểu thức 25+38×m với m = 8 là ....',0),(104,1,-1,'8','9','6','Cả 3 đều sai','Số gồm hai tỉ và năm trăm nghìn có số chữ số 0 là:',0),(105,1,-1,'Thế kỉ XX','Thế kỉ XIX','Thế kỉ XVII','Cả 3 đều sai','Ngày 30 tháng 4 năm 2018 nước ta kỉ niệm 43 năm giải phóng miền Nam. Hỏi năm giải phóng miền Nam thuộc thế kỉ nào?',0),(106,1,-1,'Đúng','Sai','Cả 2 đều sai','Cả 3 đều sai','1 giờ = 60 phút. Đúng hay sai?',0),(107,2,-1,'VII','II','V','Cả 3 đều sai','Thế kỉ thứ hai được viết bằng chữ số La Mã là:',0),(108,3,-1,'Thế kỷ V','Thế kỷ VII','Thế kỷ VI','Cả 3 đều sai','Từ năm 701 đến năm 800 là thế kỉ nào?',0),(109,1,-1,'33','103','183','Cả 3 đều sai','3 phút 3 giây = … giây.',0),(110,3,-1,'XX','XXI','XIX','Cả 3 đều sai','Chiến thắng Điện Biên Phủ vào ngày 7 tháng 5 năm 1954. Vậy chiến thắng Điện Biên Phủ vào thế kỉ:',0),(111,2,-1,'Thế kỷ XVI; 730 năm','Thế kỷ XII; 630 năm','Thế kỷ XIII; 730 năm','Cả 3 đều sai','Chiến thắng Bạch Đằng năm 1288 đánh tan quân Mông Nguyên lần thứ ba thuộc thế kỉ nào? Tính đến nay đã được bao nhiêu năm?',0),(112,3,-1,'250','25','15','Cả 3 đều sai','Thế kỷ XX có năm 2000 là năm nhuận. Vậy trong thế kỷ XXI sẽ có....năm nhuận',0),(113,2,-1,'locate','displace','establish','All is incorrect','Using Facebook, you can ',3),(115,1,-1,'large','limited','narrow','All is incorrect','I have a  modest llittle glass fish where i keep a variety fish',3),(116,2,-1,'in facour of','refuse','agree','All is incorrect','The majority of people in the town strongly support  the plans to build a new school.',3),(117,3,-1,'amicale','inapplicable','hostile','All is incorrect','Mr. Smith’s new neighbors appear to be very friendly',3),(118,1,-1,'low','untouchable','far','All is incorrect','I\'ve put the cake on a high shelf where he can\'t get at it.',3),(119,3,-1,'studious','learned','lazy','All is incorrect','I\'ve put the cake on a high shelf where he can\'t get at it.',3),(120,2,-1,'voluntary','mandatory','pressure','All is incorrect','Certain courses are compulsory; others are optional ',3),(121,1,-1,'weak','musculos','sick','All is incorrect','She must be very strong to carry such a weight on her back.',3),(122,3,-1,'funny','satisfied','upset','All is incorrect','Barry seem happy enough working for himself',3),(190,1,-1,'revealed','frequented','accessible','All is incorrect','We ought to keep these proposals ',3);
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
  `username` varchar(255) DEFAULT NULL,
  `id_exam` int DEFAULT NULL,
  `users_user` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKqqmspitg4ogj84afc4g5rksp5` (`id_exam`),
  KEY `FKdjvgll8a3pvda9f9jthb2xvs1` (`users_user`),
  CONSTRAINT `FKdjvgll8a3pvda9f9jthb2xvs1` FOREIGN KEY (`users_user`) REFERENCES `user` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FKqqmspitg4ogj84afc4g5rksp5` FOREIGN KEY (`id_exam`) REFERENCES `exam` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `result`
--

LOCK TABLES `result` WRITE;
/*!40000 ALTER TABLE `result` DISABLE KEYS */;
INSERT INTO `result` VALUES (1,5,'hoa',1,'admin'),(6,5,'trung',NULL,NULL),(8,2,'admin',NULL,NULL),(9,2,'admin',NULL,'admin'),(10,2,'cuong',NULL,NULL),(11,2,'cuong',2,'cuong');
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  CONSTRAINT `FKlx08i2lwwbelxh4vguq2ho40g` FOREIGN KEY (`users_id`) REFERENCES `user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test_exam`
--

LOCK TABLES `test_exam` WRITE;
/*!40000 ALTER TABLE `test_exam` DISABLE KEYS */;
INSERT INTO `test_exam` VALUES (1,7,'2021-08-30 13:05:00.000000','2021-08-30 13:00:00.000000',1,'admin');
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
  `img` varchar(255) DEFAULT 'anh2.jpg',
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
INSERT INTO `user` VALUES ('admin','Nghệ An','hoale11@gmail.com','Lê Đức Hòa','lisa.jpg','$2a$10$kqO1cdaFjWKMQrijeT42deF4Q6K.PnMgMqPxDJQbZQ8ADLYG/0Rqu','0900009999','$2a$10$nWF.wVKaUNwPXR6o1yWw6uP6SU2BP7KpwLR7vfU3KmlpY8gw5.Cw.'),('cuong','thanh hoá 1','cuong374@gmail.com','hoàng cường le','anh2.jpg','$2a$10$VO34kACbAXb8AyS/xG6KzO9m794CS0NNazN1AR1hdrw9qxorh8LBG','0903636988','$2a$10$VO34kACbAXb8AyS/xG6KzO9m794CS0NNazN1AR1hdrw9qxorh8LBG'),('hau','quảng nam','hau8383@gmail.com','trung hau',NULL,'$2a$10$P3TVkD8Ol3BibjDpmj3NAO9RsYe3D8DU29y96CSwpattsGM50O.e.','0903636777','$2a$10$P3TVkD8Ol3BibjDpmj3NAO9RsYe3D8DU29y96CSwpattsGM50O.e.'),('nhu','đà lạt','ynhu738@gmail.com','ý như','anh2.jpg','$2a$10$LJeIzlANThwcA1JOjbYJN.SFe5/3vdm31P8C2oMEuDU4iDhsR8Utm','0903636985','$2a$10$LJeIzlANThwcA1JOjbYJN.SFe5/3vdm31P8C2oMEuDU4iDhsR8Utm'),('tram','đà nẵng','tram3993@gmail.com','thuỳ trâm','bg.jpg','$2a$10$CyW6b5J4EWO5wnAes1CFgeSbg07tMblQwurM4MomqYycqNqMQzRtW','0903636987','$2a$10$CyW6b5J4EWO5wnAes1CFgeSbg07tMblQwurM4MomqYycqNqMQzRtW'),('uyen','Quảng Ngãi','nguyenuyen552000@gmail.com','Uyen Nguyen 1','bg.jpg','$2a$10$ur/1EMia6EeHK3mhu/qAZ.y2mnGqGowWjjJ0o6TO51WxJxxM9fayS','0902001769','$2a$10$ur/1EMia6EeHK3mhu/qAZ.y2mnGqGowWjjJ0o6TO51WxJxxM9fayS');
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

-- Dump completed on 2021-09-29 12:47:47
