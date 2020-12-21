-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 21, 2020 at 06:21 AM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `web_voucher`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `created` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `name`, `email`, `password`, `created`) VALUES
(1, 'Goo', 'admin@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', 2147483647),
(2, 'Mod', 'mod@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', 2147483647);

-- --------------------------------------------------------

--
-- Table structure for table `danhmuc`
--

CREATE TABLE `danhmuc` (
  `id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `parent_id` int(11) NOT NULL,
  `sx_donhang` tinyint(4) NOT NULL,
  `created` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `danhmuc`
--

INSERT INTO `danhmuc` (`id`, `name`, `description`, `parent_id`, `sx_donhang`, `created`) VALUES
(1, 'Ẩm Thực', '', 0, 1, '2017-04-22 05:35:21'),
(2, 'Spa & Làm Đẹp', '', 0, 2, '2017-04-22 05:35:48'),
(3, 'Giải Trí & Thể Thao', '', 0, 3, '2017-04-22 05:35:59'),
(4, 'Massage Nam Nữ', '', 0, 4, '2017-04-22 05:36:13'),
(5, 'Hotel & Resort', '', 0, 6, '2017-04-22 05:36:49'),
(7, 'Buffet', '', 1, 1, '2017-04-22 05:37:23'),
(8, 'Nhà Hàng', '', 1, 2, '2017-04-22 05:37:36'),
(9, 'Điều Trị & Chăm Sóc da', '', 2, 1, '2020-04-22 05:37:23'),
(10, 'Nha Khoa', '', 2, 2, '2020-04-22 05:37:36'),
(12, 'Giải Trí', '', 3, 1, '2017-04-22 05:37:23'),
(13, 'Thể Thao', '', 3, 2, '2017-04-22 05:37:36'),
(14, 'Massage Cặp Đôi', '', 4, 1, '2017-04-22 05:37:23'),
(15, 'Massage Nam', '', 4, 1, '2017-04-22 05:37:23'),
(16, 'Massage Nữ', '', 4, 2, '2017-04-22 05:37:36');

-- --------------------------------------------------------

--
-- Table structure for table `donhang`
--

CREATE TABLE `donhang` (
  `id` int(11) NOT NULL,
  `transaction_id` int(100) NOT NULL,
  `voucher_id` int(100) NOT NULL,
  `amount` decimal(15,2) NOT NULL DEFAULT 0.00,
  `status` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `slider`
--

CREATE TABLE `slider` (
  `id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `image_link` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `link` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `sort_order` int(11) NOT NULL,
  `created` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `slider`
--

INSERT INTO `slider` (`id`, `name`, `image_link`, `link`, `sort_order`, `created`) VALUES
(1, '1', 'ban1.jpg', '', 1, '2017-04-25 15:24:43'),
(4, '2', 'ban2.png', '', 2, '2017-04-25 15:36:41'),
(5, '3', 'ban3.jpg', '', 3, '2017-04-25 15:37:00');

-- --------------------------------------------------------

--
-- Table structure for table `transaction`
--

CREATE TABLE `transaction` (
  `id` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `message` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `amount` decimal(15,2) NOT NULL DEFAULT 0.00,
  `payment` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `created` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `name`, `email`, `password`, `phone`, `address`, `created`) VALUES
(1, 'huypro', 'huy@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', '0123456789', 'Hồ Chí Minh', 2020),
(2, 'Nguyen An', 'khachhang1@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', '01201212222', 'Thủy Nguyên - Hải Phòng', 2147483647),
(3, 'User', 'user@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', '01215345336', 'Hải Phòng', 2147483647),
(4, 'TEST@gmail.com', 'TEST@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', '01215345336', 'Hải Phòng', 2017),
(80, 'anh1', 'n@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', '0123456789', 'dadad', 2020),
(79, 'qui', 'qui@gmail.com', 'c20ad4d76fe97759aa27a0c99bff6710', '0123456789', 'Long an', 2020);

-- --------------------------------------------------------

--
-- Table structure for table `voucher`
--

CREATE TABLE `voucher` (
  `id` int(255) NOT NULL,
  `danhmuc_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `content` text COLLATE utf8_unicode_ci NOT NULL,
  `gia` decimal(15,2) NOT NULL DEFAULT 0.00,
  `discount` int(11) DEFAULT 0,
  `image_link` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `image_list` text COLLATE utf8_unicode_ci NOT NULL,
  `view` int(11) NOT NULL DEFAULT 0,
  `buyed` int(255) NOT NULL,
  `rate_total` int(255) NOT NULL DEFAULT 4,
  `rate_count` int(255) NOT NULL DEFAULT 1,
  `created` int(11) NOT NULL,
  `han` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `voucher`
--

INSERT INTO `voucher` (`id`, `danhmuc_id`, `name`, `content`, `gia`, `discount`, `image_link`, `image_list`, `view`, `buyed`, `rate_total`, `rate_count`, `created`, `han`) VALUES
(1, 7, 'Buffet Lẩu Hải Sản', '- Póc chuyên phục vụ các món Nướng ăn chơi, ăn thiệt, ăn no, ăn quên lối về cùng với hàng chục loại Bia ngon tuyệt hảo.\r\n\r\n- Póc Nướng & Bia sở hữu không gian rộng rãi thoáng mát, thích hợp là không gian thích hợp cho những buổi chill cùng bạn bè và người thân. Quán còn phục vụ acoustic, giúp thực khách vừa được ăn, vừa được “feel” cùng âm nhạc mộc mạc.\r\n\r\n- Menu đa dạng luôn là sự là một trong những điểm thu hút khách hàng của Póc, với đầy đủ các món nướng, chiên, xaod, lẩu,..\r\n\r\n- Póc Nướng & Bia luôn sử dụng nguồn nguyên liệu tươi ngon mang đến khách hàng.', '119000.00', 20000, 'a.jpg', '', 24, 1, 14, 3, 2020, '2021-01-29 09:26:34'),
(2, 7, 'Windsor Plaza Hotel – Buffet 5*', 'Windsor Plaza Hotel – Buffet 5* Trưa Thứ 7, Chủ Nhật Hải Sản Cao Cấp - Free Bia Nước Ngọt & Rượu Vang Nổ', '740000.00', 30000, 'lau-5sao.jpg', '', 24, 1, 14, 3, 2020, '2021-01-29 09:26:34'),
(3, 7, 'Buffet Trưa 70 Món Hải Sản Nướng', 'Buffet Trưa 70 Món Hải Sản Nướng, Miễn Phí Nước Uống Tại Liberty Saigon Parkview Hotel', '288000.00', 30000, '362183-buffet-trua-70-mon-hai-san-nuong-mien-phi-nuoc-uong-tai-liberty-saigon-parkview-hotel.jpg', '', 24, 1, 14, 3, 2020, '2021-01-29 09:26:34'),
(4, 7, 'Sài Gòn Prince Hotel 4*', 'Sài Gòn Prince Hotel 4* - Buffet Tối T7 & CN Hải Sản, Tôm Hùm, Cua, Ghẹ, Hàu Sang Trọng View Phố Đi Bộ Nguyễn Huệ - Miễn Phí Nước Ngọt Không Giới Hạn, Đã Gồm VAT', '288000.00', 30000, 'buffet-haisan.jpg', '', 24, 1, 14, 3, 2020, '2021-01-29 09:26:34'),
(5, 8, 'Saiko Sushi', 'Saiko Sushi - Set 08 Món Nhật Sang Trọng Đẳng Cấp 5* Cho 02 Người. Voucher 480,000 VNĐ, Còn 299,000 VNĐ, Giảm 38%. Chỉ Có Tại Hotdeal.vn!', '480000.00', 50000, '361955-saiko-sushi-set-08-mon-nhat-sang-trong-dang-cap-5-cho-02-nguoi.jpg', '', 24, 1, 14, 3, 2020, '2021-01-29 09:26:34'),
(6, 8, 'Hệ Thống Kiki Hotpot', 'Hệ Thống Kiki Hotpot - Lẩu Tự Chọn Cho 1 Người Với 8 Hương Vị Đặc Sắc - Miễn Phí Nước Uống + Kem Tươi Không Giới Hạn. Voucher 158,000 VNĐ, Còn 126,000 VNĐ, Giảm 20%. Chỉ Có Tại Hotdeal.vn!', '188000.00', 30000, 'b.jpg', '', 24, 1, 14, 3, 2020, '2021-01-29 09:26:34'),
(7, 8, 'Thuyền Sashimi', 'Thuyền Sashimi, Sushi 12 Món Dành Cho 02 Người - Sushi House. Voucher 218,000 VNĐ, Còn 145,000 VNĐ, Giảm 33%. Chỉ Có Tại Hotdeal.vn!', '288000.00', 130000, '361802-thuyen-sashimi-sushi-12-mon-danh-cho-02-nguoi-sushi-house.jpg', '', 24, 1, 14, 3, 2020, '2021-01-29 09:26:34'),
(8, 9, 'Điêu Khắc Chân Mày Hiệu Ứng/ Chạm Màu Môi', 'Điêu Khắc Chân Mày Hiệu Ứng/ Chạm Màu Môi Tươi Bắt Trend/ Chạm Mày Hiệu Ứng Ombre/ Shading (Phun/ Thêu) Tại Yenni Beauty Center. Voucher 3,000,000 VNĐ, Còn 499,000 VNĐ, Giảm 83%. Chỉ Có Tại Hotdeal.vn!', '499000.00', 50000, '362347-dieu-khac-chan-may-hieu-ung-cham-mau-moi-tuoi-bat-trend-lip-2021-cham-may-hieu-ung-ombre-shading-phun-theu-tai-yenni-beauty-center.jpg', '', 24, 1, 14, 3, 2020, '2021-01-29 09:26:34'),
(9, 9, 'Nâng Cơ & Trẻ Hóa Da Với Hifu Cao Cấp Ultra', 'Nâng Cơ & Trẻ Hóa Da Với Hifu Cao Cấp Ultra Therapy 2021, Tặng Liệu Trình Chăm Sóc Da Chuyên Sâu Trị Giá 1.000.000đ Tại Yenni Beauty Center.', '5000000.00', 30000, '362346-nang-co-tre-hoa-da-voi-hifu-cao-cap-ultra-therapy-2021-tang-lieu-trinh-cham-soc-da-chuyen-sau-tri-gia-1000000d-tai-yenni-beauty-center.jpg', '', 24, 1, 14, 3, 2020, '2021-01-29 09:26:34'),
(10, 9, 'An Toàn Tại Thẩm Mỹ Jo Beauty', 'Miễn Tip - Lấy Sạch Nhân Mụn + Điều Trị Mụn, Thâm, Phục Hồi Da Mụn/ Chạy Vitamin C Chăm Sóc Da Toàn Diện Hiệu Quả, An Toàn Tại Thẩm Mỹ Jo Beauty.', '2880000.00', 130000, '361999-mien-tip-lay-sach-nhan-mun-dieu-tri-mun-tham-phuc-hoi-da-mun-chay-vitamin-c-cham-soc-da-toan-dien-hieu-qua-an-toan-tai-tham-my-jo-beauty.jpg', '', 24, 1, 14, 3, 2020, '2021-01-29 09:26:34'),
(11, 10, 'Hệ Thống Nha Khoa Việt Nha', 'Hệ Thống Nha Khoa Việt Nha - Răng Toàn Sứ Zirconia 100% Của Đức - Bảo Hành 10 Năm.', '499000.00', 50000, '361668-he-thong-nha-khoa-viet-nha-rang-toan-su-zirconia-100-cua-duc-bao-hanh-10-nam.jpg', '', 24, 1, 14, 3, 2020, '2021-01-29 09:26:34'),
(12, 10, 'Cạo Vôi, Đánh Bóng Hoặc Trám Răng', 'NCạo Vôi, Đánh Bóng Hoặc Trám Răng Chất Lượng Cao Tại Nha Khoa Sao Việt', '49000.00', 3000, '362142-cao-voi-danh-bong-hoac-tram-rang-chat-luong-cao-tai-nha-khoa-sao-viet.jpg', '', 24, 1, 14, 3, 2020, '2021-01-29 09:26:34'),
(14, 12, 'Khu Tuyết Snow Town Sài Gòn', 'Khu Tuyết Snow Town Sài Gòn - Vé Trọn Gói Vui Chơi Trượt Tuyết Cực Thích Với Bốn Mùa Tuyết Rơi Giữa Lòng Sài Gòn Duy Nhất Tại Việt Nam', '120000.00', 50000, '361598-khu-tuyet-snow-town-sai-gon-ve-tron-goi-vui-choi-truot-tuyet-cuc-thich-voi-bon-mua-tuyet-roi-giua-long-sai-gon-duy-nhat-tai-viet-nam.jpg', '', 24, 1, 14, 3, 2020, '2021-01-29 09:26:34'),
(15, 12, 'Đầm Sen', 'Đầm Sen - Chơi Thả Ga, Giá Cực Đã - Vé Trọn Gói Vào Cổng + Tham Gia 35 Trò Chơi Hiện Đại Siêu Hấp Dẫn', '150000.00', 30000, '359866-dam-sen-choi-tha-ga-gia-cuc-da-ve-tron-goi-vao-cong-tham-gia-35-tro-choi-hien-dai-sieu-hap-dan.jpg', '', 24, 1, 14, 3, 2020, '2021-01-29 09:26:34'),
(16, 12, 'SUỐI TIÊN', 'SUỐI TIÊN - Vui Chơi Trở Lại Đầy Hấp Dẫn Tại Biển Tiên Đồng Ngọc Nữ', '120000.00', 50000, '357888-suoi-tien-vui-choi-tro-lai-day-hap-dan-tai-bien-tien-dong-ngoc-nu.jpg', '', 24, 1, 14, 3, 2020, '2021-01-29 09:26:34'),
(17, 13, '60 Gym & Yoga – Trọn Gói 1 Tháng', '60 Gym & Yoga – Trọn Gói 1 Tháng Tập Gym, Yoga, Zumba & Sử Dụng Không Giới Hạn Các Tiện Ích, Thiết Bị Hiện Đại Nhập Khẩu 100% – Tặng 01 Buổi PT Cá Nhân', '290000.00', 50000, '361711-60-gym-yoga-tron-goi-1-thang-tap-gym-yoga-zumba-su-dung-khong-gioi-han-cac-tien-ich-thiet-bi-hien-dai-nhap-khau-100-tang-01-buoi-pt-ca-nhan.jpg', '', 24, 1, 14, 3, 2020, '2021-01-29 09:26:34'),
(18, 13, 'Vyoga World', 'Vyoga World - Hệ Thống Yoga Lớn Nhất Việt Nam - 6 CN Chuẩn Quốc Tế - 1 Tháng Học Yoga, Dance Với HLV Ấn Độ, Philippines', '299000.00', 30000, '362113-vyoga-world-he-thong-yoga-lon-nhat-viet-nam-6-cn-chuan-quoc-te-1-thang-hoc-yoga-dance-voi-hlv-an-do-philippines.jpg', '', 24, 1, 14, 3, 2020, '2021-01-29 09:26:34'),
(19, 13, 'Gym Thể Lực Vàng', 'Gym Thể Lực Vàng - Trọn Gói 1 Tháng Tập Gym, Boxing, Kick Boxing, TRX, Crossfit, Beautiful Fitness - Tặng 2 Buổi Tập Cùng PT', '290000.00', 50000, '361637-gym-the-luc-vang-tron-goi-1-thang-tap-gym-boxing-kick-boxing-trx-crossfit-beautiful-fitness-tang-2-buoi-tap-cung-pt.jpg', '', 24, 1, 14, 3, 2020, '2021-01-29 09:26:34'),
(20, 14, 'Thuốc Bắc Xông Hơi', 'Massage Body/ Massage Foot Trị Liệu + Đá Muối Kết Hợp Ấn Huyệt + Ngâm Chân Thuốc Bắc Xông Hơi Không Giới Hạn – Massage Giỏi', '75000.00', 10000, '361667-massage-body-massage-foot-tri-lieu-da-muoi-ket-hop-an-huyet-ngam-chan-thuoc-bac-xong-hoi-khong-gioi-han-massage-gioi.jpg', '', 24, 1, 14, 3, 2020, '2021-01-29 09:26:34'),
(23, 15, '105 Phút Massage Body', '105 Phút Massage Body, Tẩy Tế Bào Chết Cho Nam Tại F Miss Spa', '89000.00', 10000, '362077-105-phut-massage-body-tay-te-bao-chet-cho-nam-tai-fmiss-spa.jpg', '', 24, 1, 14, 3, 2020, '2021-01-29 09:26:34'),
(24, 16, 'Massage Trị Liệu Đá Nóng', 'Massage Trị Liệu Đá Nóng Kết Hợp Gừng Tươi, Thưởng Thức Trà Thảo Mộc Và Sữa Chua Nhà Làm - Garden Spa Vân Trang', '199000.00', 10000, '361785-massage-tri-lieu-da-nong-ket-hop-gung-tuoi-thuong-thuc-tra-thao-moc-va-sua-chua-nha-lam-garden-spa-van-trang.jpg', '', 24, 1, 14, 3, 2020, '2021-01-29 09:26:34'),
(21, 16, 'Massage Body Đá Nóng', 'Buffet Spa 4 Combo 100 Phút - Massage Body Đá Nóng + Bấm Huyệt/ Foot Massage/ Trị Liệu Đông Y Cổ + Nhấn Huyệt Vai, Gáy Giúp Lưu Thông Máu Huyết/ Gội Đầu Thảo Dược Tại Lá Sen Spa', '270000.00', 30000, '361705-buffet-spa-4-combo-100-phut-massage-body-da-nong-bam-huyet-foot-massage-tri-lieu-dong-y-co-nhan-huyet-vai-gay-giup-luu-thong-mau-huyet-goi-dau-thao-duoc-tai-la-sen-spa.jpg', '', 24, 1, 14, 3, 2020, '2021-01-29 09:26:34'),
(22, 16, 'Yan Beauty & Spa', 'Ưu Đãi Buffet Làm Đẹp 5 Combo Massage Body/ Gội Đầu Dưỡng Sinh/ Ngâm Chân Thảo Dược/ Nối Mi/ Làm Nails Tại Yan Beauty & Spa ', '290000.00', 50000, '361544-uu-dai-buffet-lam-dep-5-combo-massage-body-goi-dau-duong-sinh-ngam-chan-thao-duoc-noi-mi-lam-nails-tai-yan-beauty-spa.jpg', '', 24, 1, 14, 3, 2020, '2021-01-29 09:26:34'),
(25, 5, 'MeGarden Home Stay ĐakNong', 'MeGarden Home Stay ĐakNong - 2 Đêm Nghỉ Dưỡng Tại Căn Nhà Màu Tím - Trải Nghiệm Mới Lạ Độc Đáo - Dành Cho 02 Khách', '1999000.00', 10000, '361948-megarden-home-stay-daknong-2-dem-nghi-duong-tai-can-nha-mau-tim-trai-nghiem-moi-la-doc-dao-danh-cho-02-khach.jpg', '', 24, 1, 14, 3, 2020, '2021-01-29 09:26:34');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `danhmuc`
--
ALTER TABLE `danhmuc`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `donhang`
--
ALTER TABLE `donhang`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `slider`
--
ALTER TABLE `slider`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transaction`
--
ALTER TABLE `transaction`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `voucher`
--
ALTER TABLE `voucher`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `danhmuc`
--
ALTER TABLE `danhmuc`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `donhang`
--
ALTER TABLE `donhang`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `slider`
--
ALTER TABLE `slider`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `transaction`
--
ALTER TABLE `transaction`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT for table `voucher`
--
ALTER TABLE `voucher`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
