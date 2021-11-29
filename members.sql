-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- 主機： 127.0.0.1
-- 產生時間： 2021-11-24 15:15:37
-- 伺服器版本： 10.4.18-MariaDB
-- PHP 版本： 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 資料庫： `pet-platform`
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
  `coupon_signup` datetime DEFAULT NULL,
  `coupon_petid` datetime DEFAULT NULL,
  `hash` varchar(255) DEFAULT NULL,
  `activated` varchar(255) DEFAULT NULL,
  `create_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 傾印資料表的資料 `members`
--

INSERT INTO `members` (`id`, `avatar`, `name`, `nickname`, `email`, `password`, `mobile`, `birthday`, `address`, `coupon_signup`, `coupon_petid`, `hash`, `activated`, `create_at`) VALUES
(1, 'S__4292684.jpg.jpg', '褚小淵', '圓圓', 'sharon097@gmail.com', 'abc123456', '0900974033', '2013-08-01', '新北市中正區233號五樓', NULL, NULL, NULL, '0', '2021-08-16 13:21:50'),
(4, '20180702092006121.jpg.jpg', '可達鴨', '鴨子', 'swqqw99@yahoo.com.tw', 'Qp0987211', '0920965055', '2021-08-11', '新北市', NULL, NULL, NULL, NULL, '2021-08-18 18:46:43'),
(5, '64e2027739a3d075959471d0e82249ec.jpg.jpg', '伊布', '阿布', '8230232k@yahoo.com.tw', 'pQ098u943', '0975976543', '2021-08-19', '新北市', NULL, NULL, NULL, NULL, '2021-08-18 18:51:22'),
(6, 'S__4333628.jpg.jpg', '小次郎', '次郎', 'fff99088@yahoo.com.tw', 'ui0987543', '0975976543', '2021-08-19', '新北市', NULL, NULL, NULL, NULL, '2021-08-18 19:03:30'),
(12, '20h51md.jpg.jpg', '皮卡丘', '小丘', 'pikacyo@gmail.com', 'pikacyo99', '0962819635', '2021-08-13', '永和區', NULL, NULL, NULL, NULL, '2021-08-19 16:56:45'),
(13, 'Dl2MXmCV4AAdxsS.jpg.jpg', '郎人人', '小貓貓', 'jj1623123@gmail.com', 'hj6890087', '0927816537', '2021-06-09', '永和', NULL, NULL, NULL, NULL, '2021-08-19 19:36:31'),
(14, 'D2Q0RQyUkAAjvap.jpg.jpg', '小星星', '小星', 'hjw979102@gmail.com', 'ty78972213', '0991725398', '2012-06-19', '高雄市', NULL, NULL, NULL, NULL, '2021-08-19 19:47:13'),
(20, '311C02ED-7A00-48B1-B063-D83DF53EF175.jpg.jpg', '陸特', '陸陸', 'sharon0912312@gmail.com', '123aee1133', '0927816537', '2021-08-18', '新北市永和區', NULL, NULL, NULL, NULL, '2021-08-20 14:34:07'),
(28, '0_1024.jpg.jpg', '廖圓圓', '大圓', '12340930@yahoo.com.tw', 'aa123124214', '0975976909', '2021-04-14', '新北市', NULL, NULL, NULL, NULL, '2021-08-23 13:41:40'),
(29, '0_1024.jpg.jpg', '新北市', '新北市', '12312op@gmail.com', 'Q098u943213', '0918132098', '2021-08-19', '新北市', NULL, NULL, NULL, NULL, '2021-08-23 21:07:22'),
(31, 'EFdnlIcU4AAMk24.jpg.jpg', '草莓王子', '草莓', '123130@yahoo.com.tw', 'wqe21312323', '0927816345', '2021-08-13', '日本', NULL, NULL, NULL, NULL, '2021-08-23 23:13:12'),
(32, NULL, '', '23423', '23413240@yahoo.com.tw', '$2a$10$cgnRldGahVkdCCS/LR9.zerur2vuXmBbrWe9Se.HH9s5zG8p3gcsu', '4324', '2021-09-10', '', NULL, NULL, NULL, NULL, '2021-09-15 10:52:16'),
(33, '636332cb-bc91-4b8d-962e-f6ffd01f1667.jpg', '獅子', '叉燒燒', '12312@gmail.com', '$2a$10$cF4O2thf9hNnHhBJONHJLeMESpI14DO4l4KyaGQYbyOqb8QtBS.76', '213102213', '2021-07-16', '新北', NULL, NULL, NULL, NULL, '2021-09-15 12:43:34'),
(34, NULL, '', '哈哈', '4567@gmail.com', '$2a$10$VRsTys1HEcyaWgHnun7JVe5aTgL1nuMAmFaxBq/VSAUNrVW3UMNG6', '0921312213', '2021-09-03', '', NULL, NULL, NULL, NULL, '2021-09-15 21:50:39'),
(36, NULL, '', '23123', '123123122131231p@gmail.com', '$2a$10$lJ.30y7nyeoFB8CrK3XQzuNJV1EGrst9.Vh/3wqSajGYpNtsEnTv2', '123123', '2021-09-16', '', NULL, NULL, NULL, NULL, '2021-09-18 16:07:51'),
(37, NULL, '', '小小名', '5678@gmail.com', '$2a$10$AWZLjAd08HCgUrskGvlnXOhsjF6KFDiPMqjkEDL9UmrRiq3EG4f26', '09272131', '2021-09-11', '', NULL, NULL, NULL, NULL, '2021-09-18 18:18:54'),
(38, NULL, '軍曹', '傻瓜青蛙', 'keroro@gmail.com', '$2a$10$DJ.V64nsabkSIEXJU1P03eKDHql0RZ5rw8mB2Fluq1rz3r9j6Dfcm', '09278123123', '2021-09-10', '新北市', NULL, NULL, NULL, NULL, '2021-09-21 18:31:35'),
(39, '105fb0ed-bbf1-41ee-976b-c2db733b31b5.jpg', '3123', 'vvdsfsf', '123123312@gmail.com', '$2a$10$Wh3ITCuXa3OyZoxhGTBVauO5x.TDem2Lelw3o3htPcI4YnM/eXRXG', '3123124214', '2021-09-10', 'wrwer', NULL, NULL, NULL, NULL, '2021-09-22 00:55:08'),
(40, NULL, '12313', '312312', 'sdfsdfs@gmail.com', '$2a$10$4funPKHdwGMKYlqfkCk.A.YMwVG9CEdUZ1dmyG2/JMhNXeWiqH7bu', '21312321', '2021-09-04', '213123', NULL, NULL, NULL, NULL, '2021-09-22 01:04:20'),
(41, NULL, '元源源', '小卡', '2342342@gmail.com', '$2a$10$f057zEZB/1PnScjdmE36/.bQo1YaQZ/RaAmkQ.sY20wcznnlQ5eWO', '091123123', '2021-09-03', '3123', NULL, NULL, NULL, NULL, '2021-09-23 18:43:43'),
(42, NULL, 'rewrw', 'wrwer', '423543532@gmail.com', '$2a$10$0SFIy9I3zNtIrkIID8zd6O81ugmjLLCVSrN2RhaJcF1ENniQqYXze', '0910973423', '2021-09-02', '32423', NULL, NULL, NULL, NULL, '2021-09-24 00:03:21'),
(43, '', '星星', '星一', '2141312@gmail.com', '123456', '0967893652', NULL, '信北市', NULL, NULL, NULL, NULL, '2021-10-22 13:53:46'),
(45, NULL, '', '興溪', 'dfewfwe@yahoo.com.tw', '$2a$10$sKWHMH5K7rNNbXQ/ah.ca.nbkDIZEwDIQhAiNA.aOccOYGfVgj.8a', '0918132899', NULL, '', NULL, NULL, NULL, NULL, '2021-10-22 14:08:30'),
(46, NULL, '', '它她', '3412op@gmail.com', '$2a$10$w1TEk.8Ob4o0TA46p19V4.2GFNY2gUHKIga8DIBBWlQbLlUXWm8Rm', '0927812222', NULL, '', NULL, NULL, NULL, NULL, '2021-10-22 14:11:58'),
(47, NULL, '', '你的', '214124@yahoo.com.tw', '$2a$10$HbR66ZC3xmMUdIuWqQDGsu5D/oD4e0VKL8vKOoTZohaz9wqQQ9ocO', '09213312', NULL, '', NULL, NULL, NULL, NULL, '2021-10-22 14:16:52'),
(48, '', '星星', '叉燒燒', '324234124e@gmail.com', '123456', '0918132133', NULL, '台東', NULL, NULL, NULL, NULL, '2021-10-22 14:23:32'),
(49, '', '系秀', '出吃', 'gregttr@gmail.com', '123456', '0927816537', NULL, '213', NULL, NULL, NULL, NULL, '2021-10-22 14:24:57'),
(50, '', '32r', 'e123', 'ewrew@yahoo.com.tw', '123456', '09181321312', '2021-10-08', '213', NULL, NULL, NULL, NULL, '2021-10-22 14:38:02'),
(53, '', '我我', '妳你', 'fgerq@yahoo.com.tw', '123456', '09278132432', '2021-10-08', '新北', NULL, NULL, NULL, NULL, '2021-10-22 15:04:00'),
(55, '7aab9293-1f9f-441b-a147-ac612023ef13.jpg', '我我', '妳你', '423422@yahoo.com.tw', '123456', '09278132432', '2021-10-08', '新北', NULL, NULL, NULL, NULL, '2021-10-22 15:09:47'),
(56, '7aab9293-1f9f-441b-a147-ac612023ef13.jpg', '我我', '妳你', '43677@yahoo.com.tw', '123456', '09278132432', '2021-10-08', '新北', NULL, NULL, NULL, NULL, '2021-10-22 15:13:46'),
(58, '37ae8fc1-1f36-4ea1-b1f7-d16118ee59ec.jpg', '21312', '叉燒燒', 'efwe2@yahoo.com.tw', '$2a$10$VSIZPTj9hLss7MqtrjmIoOZlHLhuQ1yVIh5fgtnkXNqJKVQQQEMeO', '053453453452', '2021-10-15', 'eqwe', NULL, NULL, NULL, NULL, '2021-10-22 15:22:48'),
(59, 'f73086df-16ed-4fd9-8db8-155572f8df03.jpg', '小海獺', '海海', 'werw@gmail.com', '$2a$10$4HpAQej2tvEG21NktuPE4ee7PkFNlluLUyUCRAnWh/JwKpLnVwmDe', '091098087', '2021-10-14', '中和', NULL, NULL, NULL, NULL, '2021-10-22 15:52:12'),
(63, '92f5ad99-290e-44ad-a522-441847ba08d3.jpg', '海獺', '貓咪', '2142134eew@yahoo.com.tw', '$2a$10$pULh/oH1x/GUScnoIJyXwesSdCfSVmJN9R7hqlrsyUQcyAua3XrLW', '09278112312', '2021-10-02', '永和區', NULL, NULL, NULL, NULL, '2021-10-23 21:27:58'),
(64, '2689ce86-fcf5-4138-ad47-16a7e31dff98.jpg', '21312', '1231', '2342134w@yahoo.com.tw', '$2a$10$YqCE8s.br7CDIZYRCJClJ.0RrJmPnB3IK.bEeau90Alqk6Acj0Sk.', '0918131231', '2021-10-08', '12312312', NULL, NULL, NULL, NULL, '2021-10-24 23:48:24'),
(65, 'a7e8b0dd-3357-4a85-ac8c-6eb668ae884d.jpg', '風獅爺', 'dsswq', '2312@gmail.com', '$2a$10$svPjPw4.DVET7vCzA6k3IuKVYmKDhCXbOacS31hq94n4krshrz3Nu', '0975021312', '2021-10-16', '永和區', NULL, NULL, NULL, NULL, '2021-10-25 21:18:01'),
(67, '4181e366-9aa7-4cfc-8bbb-aa26cc26b2b7.jpg', '一步步不', '小布', '24312@yahoo.com.tw', '$2a$10$3wcUd3RfVSHNy.ej.R4SuuPnm3qnzbjzmEdu.r3THViTjumBJMw7q', '099786856tt', '2021-10-14', '', NULL, '2021-11-04 19:09:47', NULL, NULL, '2021-10-26 12:53:39'),
(69, '4077bd4b-bafe-4bd6-b05c-8e11bbd4518a.jpg', '213123', 'gg', '89797@gmail.com', '$2a$10$3FHxtJNDN4WHqV1o.7pXHeAoAu2yXuPy.aG/DQXVUmvOkuV5JfoTK', '8892312', '2021-10-16', '大安', NULL, NULL, NULL, NULL, '2021-10-28 16:55:35'),
(70, '5380844a-ec1c-4d9c-9797-3c4f4159f982.jpg', '小舞', '老師', 'hytht@gmail.com', '$2a$10$.ii3l/uWIUX2ftNoqFz1TOJyw/pt6yx8ThpfiPh/q3a3NEksYko2a', '09234124', '2021-10-02', '2312', NULL, NULL, NULL, NULL, '2021-10-28 17:16:13'),
(71, '3712b259-5d8b-4424-ab4c-23993f0e0fc1.jpg', '可達壓', '壓壓', '432534534@yahoo.com.tw', '$2a$10$GtBAalhlwKqet1nipDgFe.IqnEPTvRLEkMgE.WPrifMyP6SVnNTRe', '09759732432', '2021-10-08', '台灣', NULL, NULL, NULL, NULL, '2021-10-31 19:06:59'),
(72, '0a46168f-4eb4-44b5-ae64-5d152598c748.jpg', '叉叉圈', '小差', '898098@yahoo.com.tw', '$2a$10$Kfii9Z70Dr5E7NY4J0UoDudq0..I9zx.FjxOX/KdWW/RPbMttloJu', '097900900', '2021-11-12', '高雄市', NULL, '2021-11-04 19:09:47', NULL, NULL, '2021-11-05 15:58:07'),
(73, 'a04b6148-2223-4aaa-b005-db145d3db673.png', '嘩嘩嘩', '花', '7890@gmail.com', '$2a$10$W6x6BUMX5JwraKoXSUMbP.WAi/Irpy0qN45Yn8XEy3NHoNDCH1RYu', '09787969689', '2021-11-05', '新北市中和區', NULL, NULL, NULL, NULL, '2021-11-09 14:22:52'),
(74, '012ad520-c239-4aa0-844b-795dc842e36e.jpg', '廖圓圓', '小圓', 'ronron123@gmail.com', '$2a$10$.euWkm5M5Zr763f.mIy1re7fzBE/FymCeot.PRm8h8t2Pmfi2SizS', '0912345678', '1995-02-16', '新北市永和區123巷12號五樓', NULL, '2021-11-04 19:09:47', NULL, NULL, '2021-11-10 01:46:43'),
(75, 'b8b73857-79c2-4f37-b1c9-df965d4b7568.jpg', '廖圓圓', '小圓', 'ronron1234@gmail.com', '$2a$10$pamZvq7hKKTARzW7c/jd9.7xnUbvhqFZ/GacZJR6ddhIDa5Nkt9lm', '0927816537', '1899-09-08', '新北市永和區', NULL, '2021-11-04 19:09:47', NULL, NULL, '2021-11-10 15:28:38'),
(76, 'c954a564-e8e8-4221-8ff0-7ca3430d3eb5.jpg', '小小圓', '小圓', 'ronron1@gmail.com', '$2a$10$XHGULD4BMUpVQ4DK.y.hNu/Wpa6F8P/rw.0H75gfNaLjP86HuDOnS', '092090023423', '2021-11-05', '新北市板橋區123號', NULL, '2021-11-04 19:09:47', NULL, NULL, '2021-11-10 23:57:38'),
(77, 'a91d5719-242e-40ab-a796-8ef4eeddd8bc.jpg', '圓', '圓', '3432@yahoo.com.tw', '$2a$10$z.5d6W5ptuk.26/8EMFfIOJnisNvJs.kIDdliNhVEjWxwZdXqru66', '', '0000-00-00', '', NULL, NULL, NULL, NULL, '2021-11-11 00:02:22'),
(78, '2ab2a7c2-fe62-4ef0-adcf-43860d98e78b.jpg', '湯圓元', '湯湯', 'ronron2@gmail.com', '$2a$10$rqrXEvGCT40suLNofqls7erJxjMsvpMsoiLsDAYTdy/JebmeCebRS', '', '0000-00-00', '', NULL, '2021-11-04 19:09:47', NULL, NULL, '2021-11-11 15:28:37'),
(79, 'a7353c41-1ea1-44c1-a621-3c2f2a8a9db4.jpg', '廖圓圓', '小圓', 'ronron3@gmail.com', '$2a$10$7bUg4v7QC9sxqlc3lkNOf.VzCrdA2PiOnJzV4ogOotP/NzDq4v8Ku', '', '0000-00-00', '', NULL, NULL, NULL, NULL, '2021-11-11 17:23:11'),
(80, 'c0387150-d358-4505-829a-bfdb6ab57e5b.jpg', '廖圓圓', '小圓', 'ronron4@gmail.com', '$2a$10$aagGwoAwv7Mf4hT/W9QgROfaZNv4i8KL.cex4lAxxRdeNi4jcC7di', '092341242', '1899-11-10', '新北市永和區', NULL, '2021-11-04 19:09:47', NULL, NULL, '2021-11-11 17:40:13'),
(81, 'cf84f8d6-9dcf-4fe9-883e-bf5eff665390.jpg', '廖圓圓', '小圓', 'ronron5@gmail.com', '$2a$10$eV82nZ9cb44zwYKm8WQoX.CwFlnfkb6R8Hy9d.GyJVAZCkI6wfOBS', '09342342322', '2021-11-06', '新北市永和區123巷', NULL, '2021-11-04 19:09:47', NULL, NULL, '2021-11-11 18:01:34'),
(82, 'd0988961-97d5-4df0-8eda-dd3cb4b45421.jpg', '廖圓圓', '小圓', 'ronron6@gmail.com', '$2a$10$zJ4u3q8Dw7yARvb.w/RGVejPjYzQkphPBc/yN2uLVYP.22fI/365u', '09213127768686', '2021-11-05', '新北市永和區123巷', NULL, '2021-11-04 19:09:47', NULL, NULL, '2021-11-11 18:54:28'),
(83, '81291eb9-b411-466a-b243-eafb092c14cb.jpg', 'ewrwr', '12312', 'ronron7@gmail.com', '$2a$10$j1xE3DtFDBl.JtdT6LtYpO23x.kw.yfblP65OYv4L1kZzaFXH/zNK', '908909', '2021-11-06', 'ewqeqwewq', NULL, '2021-11-04 19:09:47', NULL, NULL, '2021-11-11 20:41:14'),
(85, 'a1670afb-ff8d-4eda-b2e9-ecc31c80eb80.jpg', 'wrerq', 'ewreqwr', 'ronron8@gmail.com', '$2a$10$.yTAgjkkKGepYJyLYnUtReWJ/YwIdCIs5CnzRBlOBpjTeJaB7hpXW', '535234', '2021-11-05', '中和', NULL, '2021-11-04 19:09:47', NULL, NULL, '2021-11-11 22:13:10'),
(86, '55c91c8a-0a44-46c0-9927-d312c0a8c4a7.jpg', '廖圓圓', '小圓', 'ronron9@gmail.com', '$2a$10$4yN7w9.O1.4eM6R1PQAFkOwqVEai2uK6B9j3a0b8vaYNYT0RAxmLG', '092424214221', '2021-11-06', '新北市永和區中正路', NULL, '2021-11-04 19:09:47', NULL, NULL, '2021-11-11 23:26:17'),
(87, '2090a018-3fca-4351-8aff-927707cd164f.jpg', '廖圓圓', '小圓', 'ronron10@gmail.com', '$2a$10$ohgzvjuy485Knd3hsqYeeu1mefomy5XeWk6XUREMLJsKOOGEsxweC', '09213124124', '2021-11-05', '新北市永和區中正路283巷', NULL, '2021-11-04 19:09:47', NULL, NULL, '2021-11-12 18:00:04'),
(88, 'b6a855fb-71ee-4b1f-b207-ed691dd9f205.jpg', '廖圓圓', '小圓', 'ronron11@gmail.com', '$2a$10$fHqYkMQ4iTdQLEk7EyKjeOoP8d68sY1M429ihqbW3Ig2VWucCbAVu', '09312312', '2021-11-05', '新北市永和區', NULL, '2021-11-04 19:09:47', NULL, NULL, '2021-11-12 23:27:12'),
(91, '7d3202d1-a8c9-4291-b63d-236dcd59a3ae.jpg', '廖圓圓', '小圓', 'ronron12@gmail.com', '$2a$10$20/OJ76XKtjlt6Ua6z.iAe22OEw8PuTYN3yUEEN9uOU2X4TKFGYE2', '09213124', '2021-11-05', '中正路283巷4樓之五', NULL, '2021-11-04 19:09:47', NULL, NULL, '2021-11-13 00:11:53'),
(94, '905c3552-657d-44ba-b106-d6b3425ca276.jpg', '廖圓圓', '小圓', 'ronron16@gmail.com', '$2a$10$FlEgWwBaimnOIZoIK0Ga5O/BYUh5DAWkP13OkOchJ9dmS7OXnXaHO', '0920987654', '2001-09-20', '新北市永和區中正路123巷七樓', NULL, '2021-11-04 19:09:47', NULL, NULL, '2021-11-13 01:18:31'),
(96, '4ec509ca-ed96-4525-8206-5ff9a56270a2.jpg', '廖圓圓', '小圓', 'ronron13@gmail.com', '$2a$10$OhU5oa3eULGIVudxfCiY2usRBBuugVolfI726RYm7vs5X4o.MBgIm', '0920987654', '2001-09-20', '新北市中正路123巷五樓之4', NULL, '2021-11-04 19:09:47', NULL, NULL, '2021-11-13 21:23:16'),
(97, '4e9f372c-7764-4f1a-bf87-79941949ab90.jpg', '廖圓圓', '小圓', 'ronron17@gmail.com', '$2a$10$1eZ1TiyOZPBGwXW3SoHkzO79OezMBey/R9H.YIA/kNaqgYwvJkt5G', '0920987654', '2001-09-20', '新北市中正路123巷10樓', NULL, '2021-11-04 19:09:47', NULL, NULL, '2021-11-13 21:39:21'),
(100, '6e33f08e-6257-4b59-b9cc-1fafbc67a336.jpg', '廖圓圓', '小圓', 'ronron18@gmail.com', '$2a$10$80TeC7hu.8RImqh4kaiFbO5NzX6UVzdfFDD66XL1KzOH4DXm3fkmC', '0920987654', '2001-09-20', '新北市中正路123巷五樓', NULL, NULL, NULL, NULL, '2021-11-14 18:21:45'),
(101, 'c80a9a8c-7612-4b91-abb9-5a0ec82da90d.jpg', '廖圓圓', '小圓', 'ronron19@gmail.com', '$2a$10$PNDdOcjvWxqzOOdZcZV7DO5BseYcKUrwpWx1sRul2kvP6n6I1KOdu', '0920987654', '2001-09-20', '新北市中正路123巷七樓', NULL, '2021-11-04 19:09:47', NULL, NULL, '2021-11-14 18:24:53'),
(102, '00781266-bd28-48f9-8e4c-17901daac3e8.jpg', '廖圓圓', '小圓', 'ronron14@gmail.com', '$2a$10$8X8pYJKYCmNpIjrQGUBA4uFkHdxe3K3I5r3l5OunEAd2tQrMooYCe', '0920987654', '2001-09-20', '新北市中正路123巷五樓', NULL, NULL, NULL, NULL, '2021-11-14 19:59:15'),
(103, '6fc4afbd-9856-41cd-b340-08b8612bc468.jpg', '廖圓圓', '小圓', 'ronron22@gmail.com', '$2a$10$32wJ4LrJeOCvNhtZ2VqQauQN/OgyqkLZCRDe5ckJ2zp9uUVK9adS6', '0920987654', '2001-09-20', '新北市中正路123巷八樓', NULL, '2021-11-04 19:09:47', NULL, NULL, '2021-11-14 20:14:32'),
(104, '46820123-0c3b-4a26-bd15-1ada43caf3f3.jpg', '廖圓圓', '小圓', 'ronron23@gmail.com', '$2a$10$VwYpT5LHEl1j5wGf7ZrgveiAkQaowiXWqWjOF4Xwz64YJPyv.eXjS', '0920987654', '2001-09-20', '新北市中正路123巷八樓', NULL, NULL, NULL, NULL, '2021-11-14 20:44:50'),
(105, 'e211452c-8b7b-4b42-aae6-1c6fc2057852.jpg', '廖圓圓', '小圓', 'ronron24@gmail.com', '$2a$10$KnfD37lXq/tPYQH3ij0Rb.MO3nmw9LRqtTigCcxnx5PquNUkCLljy', '0920987654', '2001-09-20', '新北市中正路123巷18樓', NULL, '2021-11-04 19:09:47', NULL, NULL, '2021-11-14 20:55:58'),
(106, 'adb5dbd9-7ac0-4750-a78e-0c40fd3a7a9f.jpg', '廖圓圓', '小圓', 'ronron25@gmail.com', '$2a$10$niGCTtKRUhVsn.q5ZERJEO5jZOdmAJffur50lqjvCuCmVwaepF3Py', '0920987654', '2001-09-20', '新北市中正路123巷7樓', NULL, '2021-11-04 19:09:47', NULL, NULL, '2021-11-16 14:18:07'),
(107, 'ce29a225-6c98-4ff9-af08-d4c49dda0e89.jpg', '廖圓圓', '小圓', 'ronron15@gmail.com', '$2a$10$IYVWLujB2Irb/d3swhv2O.P/xkgMAVgngpVKAal/y5SfNrLADLqAC', '0920987654', '2001-09-20', '新北市中正路123巷18樓', NULL, '2021-11-04 19:09:47', NULL, NULL, '2021-11-16 16:03:10'),
(108, '3297053c-8790-4950-9640-57f4423a7e10.jpg', '廖圓圓', '小圓', 'ronron30@gmail.com', '$2a$10$GqRa5YbmBANkABB9PUb1c.HOTPs0tDaNCUF5WJgjAJFZcJBMK9eVq', '0920987654', '2001-09-20', '新北市中正路123巷12樓', NULL, '2021-11-04 19:09:47', NULL, NULL, '2021-11-18 12:10:41'),
(109, '93f34001-38e9-4a98-a20d-e98a1e064ca0.jpg', '廖圓圓', '小圓', 'ronron20@gmail.com', '$2a$10$ldJcMdjXShA0A/EnRefhDemecMi6DolMp41M1OuSd1xWepq.0VnHy', '0920987654', '2001-09-20', '新北市中正路123巷12樓', NULL, '2021-11-04 19:09:47', NULL, NULL, '2021-11-18 15:28:42'),
(110, '1c04a1f3-097b-4320-895e-d068fa393911.jpg', '廖圓圓', '小圓', 'ronron39@gmail.com', '$2a$10$emazCCLYwQSFeZsvbAUijOD.6WNRCG9ya35YFPcQffVZRDog.q7cS', '0920987654', '2001-09-20', '新北市中正路123巷12樓', NULL, '2021-11-04 19:09:47', NULL, NULL, '2021-11-18 18:05:28'),
(112, 'd83cc76f-2bcd-43ad-829c-0cdbc48b648d.jpg', '廖圓圓', '小圓', 'ronron99@gmail.com', '$2a$10$lTO09I/bID8KtxhSzkje8.KiA5QOlPd8BroV3HhpoPBsCHHApLfw6', '0920987654', '2001-09-20', '新北市中正路123巷12樓', NULL, '2021-11-04 19:09:47', NULL, NULL, '2021-11-19 09:01:38'),
(113, 'd3ad2108-9de0-4c88-bc73-fee1d57f03c7.jpg', '廖圓圓', '小圓', 'ronron100@gmail.com', '$2a$10$.denQ0LLmR9AUhIBL1.rBOwTKKg3gW48VdFUNCDyK5LxWtL3ezYPK', '0920987654', '2001-09-20', '新北市中正路123巷12樓', NULL, '2021-11-04 19:09:47', NULL, NULL, '2021-11-19 11:26:22');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=114;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
