-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 03, 2023 at 03:49 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `webboard`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(32) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `name`) VALUES
(5, 'เรื่องทั่วไป'),
(7, 'เรื่องเรียน'),
(8, 'เรื่องกีฬา'),
(12, 'เรื่องกิน');

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

CREATE TABLE `comment` (
  `id` int(11) NOT NULL,
  `content` varchar(20148) COLLATE utf8_unicode_ci NOT NULL,
  `post_date` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `comment`
--

INSERT INTO `comment` (`id`, `content`, `post_date`, `user_id`, `post_id`) VALUES
(9, 'อาจารย์พิมพ์โครตเร็วเลย คราวหน้าเดี๋ยวค่อยบอกจารย์กัน', '2023-10-17 10:29:36', 8, 2),
(11, 'เปิดครับ แต่ร้านอาหารจะน้อยหน่อย ส่วนร้านไหนเปิดบ้าง ผมจำไม่ได้ครับ ต้องลองมาดูกันเอง', '2023-10-27 09:26:13', 7, 11),
(14, 'ต้องไปหัดฝึกพิมพ์สัมผัสกันเพิ่มบ้างแล้วล่ะ จะได้พิมพ์เร็วขึ้น', '2023-11-03 10:43:22', 9, 2),
(15, 'ช่วงนี้น่าจะประมาณ 20-25 องศาเซลเซียส ในช่วงกลางวัน แต่กลางคืนน่าจะลดต่ำกว่านี้หน่อยครับ', '2023-11-03 09:10:37', 12, 12);

-- --------------------------------------------------------

--
-- Table structure for table `post`
--

CREATE TABLE `post` (
  `id` int(11) NOT NULL,
  `title` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `content` varchar(2048) COLLATE utf8_unicode_ci NOT NULL,
  `post_date` datetime NOT NULL,
  `cat_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `post`
--

INSERT INTO `post` (`id`, `title`, `content`, `post_date`, `cat_id`, `user_id`) VALUES
(2, 'พิมพ์โปรแกรมตตามอาจารย์ไม่ทันเลย', 'มีใครพิมพ์งานไม่ทันเหมือนเราบ้าง', '2023-10-17 10:27:03', 7, 7),
(3, 'ลิเวอร์พูล กับ แมนซิตี้ ผลเมื่อคืนเป็นยังไงบ้าง', 'เมื่อคืนผลบอลเป็นยังไงบ้างครับ ใครได้ดูบ้าง', '2023-10-25 09:48:45', 8, 7),
(5, 'วันนี้โดนอาจารย์คุมสอบไม่ให้เข้าสอบ ใครโดนแบบเราบ้าง ขอเสียงหน่อย', 'เราใส่กางเกงยีนส์เข้าสอบ อาจารย์บอกผิดระเบียบ เลยไม่ให้เข้าสอบ เซ็งเลย', '2023-10-27 09:59:48', 7, 12),
(6, 'แบดโธมัสคัพเริ่มแข่งวันที่เท่าไร', 'ใครรู้บ้างว่าแบดโธมัสคัพเริ่มแข่งวันที่เท่าไรครับ', '2023-10-23 23:13:57', 8, 11),
(7, 'ขอความร่วมมือ กรุณาใช้ข้อความสุภาพในการสนทนา', 'ขอให้ทุกๆท่านโปรดใช้ข้อความสุภาพ งดใช้คำหยาบในการสนทนาครับ', '2023-10-25 10:23:46', 5, 9),
(9, 'ร้านชาบูที่ไหนอร่อยบ้างครับ', 'ร้านชาบูใกล้ๆมอร้านไหนอร่อยบ้างครับ', '2023-10-24 15:29:50', 12, 6),
(11, 'ร้านข้าวบนโรงอาหาร วันเสาร์เปิดมั๊ยครับ', 'โรงอาหารกลางในมอวันเสาร์เปิดมั๊ยครับ แล้วมีร้านไหนเปิดบ้าง', '2023-10-25 10:37:20', 12, 11),
(12, 'ช่วงนี้อากาศที่โตเกียวเป็นไงบ้างครับ ผมจะไปช่วงสัปดาห์หน้าครับ', 'ผมจะเตรียมตัวไปโตเกียว ไม่ทราบว่าอากาศประมาณซักกี่องศาครับ จะต้องใส่ฮีทเทคมํ๊ยครับ', '2023-11-03 09:09:08', 5, 13);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `login` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `gender` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `role` char(1) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `login`, `password`, `name`, `gender`, `email`, `role`) VALUES
(6, 'member', 'b54df48c4c77522382a5a3c2f0358573ad43746e', 'สมชาย ยินดี', 'm', 't_phollakrit@yahoo.com', 'm'),
(7, 'pat', '01b307acba4f54f55aafc33bb06bbbf6ca803e9a', 'พลกฤษณ์ วงษ์สันติสุข', 'm', 'phollakrit@hotmail.com', 'a'),
(8, 'phollakrit', '01b307acba4f54f55aafc33bb06bbbf6ca803e9a', 'phollakrit wongsantisuk', 'f', 'phollakrit@kmutnb.ac.th', 'b'),
(9, 'admin', '8dc9fa69ec51046b4472bb512e292d959edd2aef', 'admin', 'f', 'admin@gmail.com', 'a'),
(11, 'klopp', '01b307acba4f54f55aafc33bb06bbbf6ca803e9a', 'klopp', 'm', 'klopp@hotmail.com', 'm'),
(12, 'harry', '01b307acba4f54f55aafc33bb06bbbf6ca803e9a', 'harry', 'm', 'harry@hotmail.com', 'b'),
(13, 'OS', '01b307acba4f54f55aafc33bb06bbbf6ca803e9a', 'กันต์พจน์ วงษ์สันติสุข', 'm', 'os@hotmail.com', 'm');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `comment`
--
ALTER TABLE `comment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `post`
--
ALTER TABLE `post`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
