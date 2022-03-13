-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- 主機： localhost
-- 產生時間： 2022 年 03 月 13 日 12:43
-- 伺服器版本： 10.4.21-MariaDB
-- PHP 版本： 7.4.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 資料庫: `pet-platform`
--

-- --------------------------------------------------------

--
-- 資料表結構 `members`
--

CREATE TABLE `members` (
  `id` int(11) NOT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `nickname` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `mobile` varchar(255) NOT NULL,
  `birthday` date DEFAULT NULL,
  `address` varchar(255) NOT NULL,
  `shipping_name` varchar(255) DEFAULT NULL,
  `shipping_mobile` varchar(255) DEFAULT NULL,
  `shipping_address` varchar(255) DEFAULT NULL,
  `coupon_petid` datetime DEFAULT NULL,
  `create_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 傾印資料表的資料 `members`
--

INSERT INTO `members` (`id`, `avatar`, `name`, `nickname`, `email`, `password`, `mobile`, `birthday`, `address`, `shipping_name`, `shipping_mobile`, `shipping_address`, `coupon_petid`, `create_at`) VALUES
(138, 'aa704723-c2a0-4edd-a140-5e5e2f7eb5e7.jpg', '廖圓圓', '小圓', 'ronron0987@gmail.com', '$2a$10$STe1rzNeK8lMUg0I7I3.eu8fWD6JuvmGmJSC2IHeCALfeHsEzQB2O', '0920987654', '2001-09-20', '新北市中正路123巷五樓', NULL, NULL, NULL, '2021-11-04 19:09:47', '2022-03-12 21:56:04'),
(139, '1e03729f-5e73-40be-8ebd-53af46865bec.png', '廖美美', '小圓', 'ronron23423@gmail.com', '$2a$10$ORPZ0WSkeR6mDu.yXuqQ9eaBBS63r1LlinmdbMOumgIqrdkL0APBa', '0920987654', '2001-09-20', '新北市中正路123巷五樓', NULL, NULL, NULL, '2021-11-04 19:09:47', '2022-03-12 22:24:05'),
(140, '1bb8541f-c960-4a2b-a5f5-11595b8cadbc.jpg', '廖花花', '小圓', 'ronron09876@gmail.com', '$2a$10$1XqebFsJyr1FwnmxyIN1TuX5ApzBkPVHqNtw52A2WzoyAAwJNoPz6', '09209876', '2001-09-20', '新北市中正路123巷18樓', '廖圓圓', '0920987654', '新北市中正路123巷五樓', '2021-11-04 19:09:47', '2022-03-12 22:37:12'),
(142, '1ac70757-5a30-4e3c-ac6d-b9305a0b0b27.jpg', '廖毛毛', '小圓', 'ronronfhjklk@gmail.com', '$2a$10$x8J/hgdjDoJLeOd7m3lc6ug.kXudczpY6x4vs0IKnMJVgKHzV34lW', '0920987654', '2001-09-20', '新北市中正路123巷18樓', '廖', '0920987', '新北市中正路123巷18樓', '2021-11-04 19:09:47', '2022-03-13 15:59:11'),
(143, '93ecf6d8-84eb-420f-bc80-275c96adf46a.jpg', '廖泡泡', '小圓', 'ronronbjgjk@gmail.com', '$2a$10$RiBolIxxXjMkd7Bn.tp4XeDB6YiH2HR9ES2.hGuwIPnS6QQYM8mSm', '092098765', '2001-09-20', '新北市中正路123巷五樓', '廖圓', '0920987654', '新北市中正路123巷五樓', '2021-11-04 19:09:47', '2022-03-13 16:04:46');

--
-- 已傾印資料表的索引
--

--
-- 資料表索引 `members`
--
ALTER TABLE `members`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email_2` (`email`),
  ADD KEY `email` (`email`);

--
-- 在傾印的資料表使用自動遞增(AUTO_INCREMENT)
--

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `members`
--
ALTER TABLE `members`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=145;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
