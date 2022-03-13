-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- 主機： localhost
-- 產生時間： 2022 年 03 月 13 日 12:44
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
-- 資料表結構 `members_pet_id`
--

CREATE TABLE `members_pet_id` (
  `user_id` int(11) NOT NULL,
  `pet_id` int(11) NOT NULL,
  `pet_avatar` varchar(225) DEFAULT NULL,
  `pet_name` varchar(225) NOT NULL,
  `pet_breed` varchar(225) NOT NULL,
  `pet_birthday` date NOT NULL,
  `create_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 傾印資料表的資料 `members_pet_id`
--

INSERT INTO `members_pet_id` (`user_id`, `pet_id`, `pet_avatar`, `pet_name`, `pet_breed`, `pet_birthday`, `create_at`) VALUES
(143, 142, '寵物小虎-1647164098095.png', '小虎', '貓', '2022-03-03', '2022-03-13 17:34:58'),
(143, 143, '換大頭照-1647164098097.jpeg', '小貓', '狗', '2022-03-11', '2022-03-13 17:34:58'),
(144, 144, '寵物小虎-1647170448983.png', '小美', '狗', '2022-03-02', '2022-03-13 19:20:49'),
(144, 147, '換大頭照-1647170500100.jpeg', '咪咪', '貓', '2022-03-10', '2022-03-13 19:21:40'),
(144, 148, '寵物小虎-1647170576323.png', '毛毛', '貓', '2022-03-23', '2022-03-13 19:22:56');

--
-- 已傾印資料表的索引
--

--
-- 資料表索引 `members_pet_id`
--
ALTER TABLE `members_pet_id`
  ADD PRIMARY KEY (`pet_id`);

--
-- 在傾印的資料表使用自動遞增(AUTO_INCREMENT)
--

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `members_pet_id`
--
ALTER TABLE `members_pet_id`
  MODIFY `pet_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=150;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
