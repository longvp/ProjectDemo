-- MySQL dump 10.13  Distrib 8.0.23, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: webdientu
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
-- Table structure for table `tintuc`
--

DROP TABLE IF EXISTS `tintuc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tintuc` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tieude` text,
  `hinhtintuc` varchar(100) DEFAULT NULL,
  `motangan` text,
  `noidung` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tintuc`
--

LOCK TABLES `tintuc` WRITE;
/*!40000 ALTER TABLE `tintuc` DISABLE KEYS */;
INSERT INTO `tintuc` VALUES (1,'ĐÁNH GIÁ SAMSUNG GALAXY A7 MỚI NHẤT','1.jpg','Hồi đầu tháng 9/2018, ông DJ Koh, phụ trách mảng di động của Samsung chia sẻ hãng điện tử Hàn Quốc đang thay đổi chiến lược ở phần khúc tâm trung, ưu tiên đưa các tính năng mới và các sáng tạo công nghệ vào dòng sản phẩm này trước cả phân khúc cao cấp.','Mục tiêu của Samsung trong quyết định thay đổi chiến lược này là muốn vực dậy phân khúc tầm trung đang bị cạnh tranh mạnh mẽ bởi các nhà sản xuất điện thoại Trung Quốc. Chiếc Galaxy A7 2018 là sản phẩm đầu tiên ra đời từ chiến lược mới đó. Vì vậy, máy có những thứ mới mẻ lần đầu tiên xuất hiện trên điện thoại của hãng điện tử Hàn Quốc. Cụ thể, Galaxy A7 2018 là smartphone Samsung đầu tiên có 3 camera ở phía sau (gồm 1 camera góc siêu rộng để chụp phong cảnh cùng với 2 chiếc camera 24MP và camera 5MP để chụp ảnh thông thường và xóa phông) và là điện thoại dòng A đầu tiên có cảm biến vân tay trên cạnh. Một điều mới mẻ nữa là mức giá của Galaxy A7 2018 hiện tại còn rẻ hơn cả phiên bản đàn em Galaxy A6+. Có lẽ đây là lần đầu tiên Samsung định giá sản phẩm dòng A lớn hơn lại rẻ hơn dòng A đàn em. Ở các khía cạnh khác, Galaxy A7 2018 có nhiều điểm giống với chiếc Galaxy A6+: màn hình AMOLED 6 inch, RAM 4GB, bộ nhớ trong 64GB cùng khe cắm thẻ nhớ ngoài và camera trước 24MP. Tuy vậy, vi xử lý của Galaxy A7 2018 là con chip Exynos 7885 tám lõi kế thừa từ sản phẩm Galaxy A8/A8+ ở phân khúc cận cao cấp, mạnh mẽ hơn đáng kể con chip Snapdragon 450 trên Galaxy A6+. Gần đây, Samsung đã thay đổi thiết kế của dòng Galaxy A, chuyển sang dùng khung kim loại mặt lưng kính thay vì thiết kế kim loại nguyên khối như trước. Trên chiếc Galaxy A7 2018, hãng này lại tiếp tục thay đổi chất liệu cả ở mặt lưng và khung máy. Mặt lưng sử dụng chất liệu nhựa trong suốt như kính, sờ vào cũng rất khó nhận biết đây là kính hay nhựa. Với khung máy, Samsung không nói rõ làm bằng chất liệu gì nhưng theo phỏng đoán của chúng tôi thì đó là chất liệu nhựa. Khung máy sờ vào không có cảm giác lạnh của kim loại và cũng không có các vạch ăng-ten, chi tiết thường thấy trên các điện thoại dùng khung kim loại. Khung máy vẫn cho cảm nhận chắc chắn, cứng cáp nhưng rõ ràng không còn \"chất\" như khung kim loại trên các dòng A trước đó. Việc loại bỏ khung kim loại và mặt lưng kính trên Galaxy A7 2018 có thể là chi tiết đánh đổi để đầu tư cho camera và hiệu năng trong khi vẫn duy trì được mức giá thấp hơn cả đàn em Galaxy A6+.'),(2,'ĐIỆN THOẠI NOKIA CỦA NƯỚC NÀO? DÙNG CÓ TỐT KHÔNG?','2.jpg','Điện thoại Nokia của nước nào? Dùng có tốt không?','Điện thoại Nokia là một trong  những thương hiệu vang bóng một thời với hàng chục năm đứng trên đỉnh thị trường điện thoại di động thế giới. Được đông đảo người dùng lựa chọn bởi thiết kế đẹp mắt, độ bền cao và giá cả phải chăng. Vậy điện thoại Nokia của nước nào? Dùng có thực sự tốt không? Hãy cùng Điện Máy Chợ Lớn tìm hiểu nhé! Nokia ra đời vào năm 1871 tại Phần Lan, nhưng mãi tới tận năm 1967, tập đoàn Nokia mới thực sự được thành lập sau khi 3 công ty con sáp nhập từ năm 1922. Trong top 20 điện thoại bán chạy nhất trong lịch sử thế giới, thì thương hiệu Nokia đã chiếm quá nửa trong con số đó. Thương hiệu Nokia được thán phục và trầm trồ bởi sự sáng tạo và dẫn đầu của mình. Sau nhiều giai đoạn biến cố, các kết quả kinh doanh thua lỗ từ chính chiến lượt kinh doanh không thực sự hiệu quả đã đẩy cái tên Nokia về tay Microsoft vào năm 2014. Mãi cho đến 2017, Nokia đã quay trở lại thị trường điện thoại di động dưới sự điều hành của công ty HMD Global.'),(3,'4 ĐIỂM MÀ ĐIỆN THOẠI VẪN PHẢI CHÀO THUA MÁY TÍNH','3.jpg','4 ĐIỂM MÀ ĐIỆN THOẠI VẪN PHẢI CHÀO THUA MÁY TÍNH','Theo Gizmodo, rất nhiều người trong chúng ta check mail trên điện thoại rồi trả lời ngay nếu cần, nhưng không phải lúc nào đó cũng là ý tưởng hay. Ứng dụng email trên điện thoại không thể cho bạn trải nghiệm giống hệt như máy tính được. Hãy lấy Gmail nền web và ứng dụng Gmail cho di động làm ví dụ, một vài tính năng sau chỉ có thể làm trên web: di chuyển email giữa các danh mục bằng thao tác kéo, nhóm email theo liên hệ, chuyển giữa văn bản thuần túy và văn bản đã format hay gửi tiền với một tin nhắn. Bạn cũng không thể tạo bộ lọc mail trên điện thoại - một trong những tính năng tuyệt vời nhất của Gmail, thêm vào đó là sự bất tiện khi gõ trên màn hình nhỏ. Đôi khi lưu email để xử lý sau trên máy tính hóa ra lại hay hơn. Phần mềm sửa ảnh trên điện thoại thì có đầy, nhưng đa số chỉ đơn giản là cắt xén, thêm chữ, áp bộ lọc cho các nhu cầu \"mì ăn liền\" như gửi bạn bè, tải lên Instagram, Facebook,... Nếu có nhu cầu cao hơn thế, việc sử dụng các phần mềm trên máy tính vẫn tốt hơn.');
/*!40000 ALTER TABLE `tintuc` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-06-19 17:22:50
