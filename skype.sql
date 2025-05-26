-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 26, 2025 at 01:00 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `skype`
--

-- --------------------------------------------------------

--
-- Table structure for table `call_logs`
--

CREATE TABLE `call_logs` (
  `call_id` int(11) NOT NULL,
  `conversation_id` int(11) DEFAULT NULL,
  `caller_id` int(11) DEFAULT NULL,
  `receiver_id` int(11) DEFAULT NULL,
  `started_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `ended_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `conversations`
--

CREATE TABLE `conversations` (
  `conversation_id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `is_group` tinyint(1) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `conversations`
--

INSERT INTO `conversations` (`conversation_id`, `name`, `is_group`, `created_at`) VALUES
(9, 'bimvasa', 0, '2024-10-22 13:26:25'),
(10, 'bim va bimsa', 0, '2024-11-18 15:03:52'),
(12, 'nhom1', 1, '2024-11-28 17:08:37');

-- --------------------------------------------------------

--
-- Table structure for table `conversation_participants`
--

CREATE TABLE `conversation_participants` (
  `conversation_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `joined_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `conversation_participants`
--

INSERT INTO `conversation_participants` (`conversation_id`, `user_id`, `joined_at`) VALUES
(9, 14, '2024-10-22 13:26:25'),
(9, 15, '2024-10-22 13:26:25'),
(10, 14, '2024-11-18 15:03:52'),
(10, 16, '2024-11-18 15:03:52'),
(12, 14, '2024-11-28 17:08:37'),
(12, 15, '2024-11-28 17:08:37'),
(12, 16, '2024-11-28 17:08:37');

-- --------------------------------------------------------

--
-- Table structure for table `files`
--

CREATE TABLE `files` (
  `file_id` int(11) NOT NULL,
  `message_id` int(11) DEFAULT NULL,
  `file_path` varchar(255) DEFAULT NULL,
  `file_name` varchar(255) DEFAULT NULL,
  `uploaded_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `files`
--

INSERT INTO `files` (`file_id`, `message_id`, `file_path`, `file_name`, `uploaded_at`) VALUES
(6, 85, 'C:/xampp/htdocs/server_token/FileClient', 'Báo cáo TTTT (Đức).docx', '2024-12-03 16:45:33'),
(7, 86, '192.168.1.8/server_token/FileClient', 'pass.txt', '2024-12-03 17:12:44'),
(8, 88, '192.168.1.8/server_token/FileClient', 'z5466830169909_d9edcd70fdff388a24d8a548e8dae2c5.jpg', '2024-12-03 17:51:11'),
(9, 89, '192.168.1.8/server_token/FileClient', '!.html', '2024-12-03 17:54:35'),
(10, 91, '192.168.1.8/server_token/FileClient', 'cucma1.docm', '2024-12-03 18:23:14'),
(11, 93, '192.168.1.8/server_token/FileClient', 'cucma1.docm', '2024-12-03 18:29:22'),
(12, 101, '192.168.1.8/server_token/FileClient', 'goiphutungoto.png', '2024-12-03 19:02:02'),
(13, 106, '192.168.1.8/server_token/FileClient', 'cucma1.docm', '2024-12-04 00:43:13'),
(14, 107, '192.168.1.8/server_token/FileClient', 'cucma1.docm', '2024-12-04 00:47:48'),
(15, 108, '192.168.1.8/server_token/FileClient', 'cucma1.docm', '2024-12-04 00:54:23'),
(16, 109, '192.168.1.8/server_token/FileClient', 'cucma1.docm', '2024-12-04 00:54:37');

-- --------------------------------------------------------

--
-- Table structure for table `friends`
--

CREATE TABLE `friends` (
  `user_id` int(11) NOT NULL,
  `friend_id` int(11) NOT NULL,
  `status` enum('pending','accepted','blocked') NOT NULL,
  `request_sent_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `friends`
--

INSERT INTO `friends` (`user_id`, `friend_id`, `status`, `request_sent_at`) VALUES
(14, 15, 'accepted', '2024-10-05 14:52:45'),
(14, 16, 'blocked', '2024-10-17 06:55:30'),
(15, 16, 'accepted', '2024-10-17 16:01:33'),
(16, 14, 'accepted', '2024-11-18 15:03:13'),
(16, 15, 'accepted', '2024-10-17 17:03:52');

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `message_id` int(11) NOT NULL,
  `conversation_id` int(11) DEFAULT NULL,
  `sender_id` int(11) DEFAULT NULL,
  `message_text` text DEFAULT NULL,
  `sent_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`message_id`, `conversation_id`, `sender_id`, `message_text`, `sent_at`) VALUES
(1, 9, 14, 'a', '2024-10-26 18:11:00'),
(2, 9, 14, 'alo', '2024-10-26 19:44:28'),
(3, 9, 15, 'gi', '2024-10-26 19:44:45'),
(4, 9, 14, 'alo', '2024-10-27 15:18:42'),
(5, 9, 14, 'alo', '2024-10-27 15:19:02'),
(6, 9, 14, 'aloâ', '2024-10-27 15:19:10'),
(7, 9, 14, 'aloâ', '2024-10-27 15:19:11'),
(8, 9, 14, 'aloâ', '2024-10-27 15:19:11'),
(9, 9, 15, 'aaa', '2024-10-27 15:19:21'),
(10, 9, 15, 'heloo', '2024-10-27 15:21:33'),
(11, 9, 14, 'gi b', '2024-10-27 15:22:05'),
(12, 9, 14, 'alo', '2024-10-27 16:50:05'),
(13, 9, 14, 'hom qua a di an keo o nha cu sa, ngon lam be oi em be aaaaaaaaaaaaaa', '2024-10-27 18:31:17'),
(14, 9, 14, 'hom nay la ngay chung ta yeu nhauuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuu', '2024-10-27 18:31:52'),
(15, 9, 14, 'Hom nay la ngay chung ta yeeuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuu nhau đó em bé ơi huus em beseeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee alo em béeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee', '2024-10-27 18:51:08'),
(16, 9, 14, 'hom nay la ngay chung ta yeu nhau do em be oiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii, anh yêu em nhiều lắm sa ơi, nhớ cu sa cụa a quá đi mất thôi', '2024-10-27 18:53:05'),
(17, 9, 14, 'alo', '2024-10-27 18:56:46'),
(18, 9, 14, 'j z ma', '2024-10-27 18:56:57'),
(19, 9, 14, 'chiu a', '2024-10-27 18:57:13'),
(20, 9, 14, 'cai j', '2024-10-27 18:57:20'),
(21, 9, 14, 'a', '2024-10-27 18:58:32'),
(22, 9, 14, 'a', '2024-10-27 19:00:22'),
(23, 9, 14, 'abc', '2024-10-27 19:01:17'),
(24, 9, 14, 'co cuc cut', '2024-10-27 19:08:18'),
(25, 9, 14, 'helu', '2024-10-27 19:10:22'),
(26, 9, 14, 'bim', '2024-10-27 19:13:19'),
(27, 9, 14, 'bim oi', '2024-10-27 19:13:50'),
(28, 9, 14, 'em nho bim', '2024-10-27 19:14:02'),
(29, 9, 14, 'hom qua sa di mo', '2024-10-27 19:14:55'),
(30, 9, 14, 'em di choi cho mo ma khuya k ve nha, ???????????????????????????????????????????????????????????????????????', '2024-10-27 19:15:15'),
(31, 9, 14, 'alo', '2024-10-28 14:41:43'),
(32, 10, 14, 'al', '2024-11-18 15:04:10'),
(33, 10, 16, 'a', '2024-11-18 15:05:06'),
(34, 10, 16, 'co ca', '2024-11-18 15:05:36'),
(35, 10, 14, 'alo dang lam gi do co cuc', '2024-11-18 15:16:29'),
(36, 10, 14, 'fsggggsdfg', '2024-11-26 12:25:50'),
(37, 10, 14, 'hom nay ban lam gi do', '2024-11-26 12:28:43'),
(38, 10, 14, 'ai ma biet duoc', '2024-11-26 12:28:50'),
(39, 9, 14, 'sfsfdsf', '2024-11-27 16:46:47'),
(40, 9, 14, 'gi vay', '2024-11-27 16:50:31'),
(41, 9, 14, 'dsafasdfdsaffasdffđà', '2024-11-27 17:02:10'),
(42, 9, 14, 'xsssdf', '2024-11-27 17:04:50'),
(43, 12, 14, 'alo', '2024-11-28 18:06:55'),
(44, 12, 14, 'a', '2024-11-28 18:10:31'),
(45, 12, 15, 'gi', '2024-11-28 18:10:38'),
(46, 12, 14, 'j z ba', '2024-11-28 18:11:12'),
(47, 12, 15, 'lam gi do', '2024-11-28 18:11:17'),
(48, 12, 14, 'adsffff', '2024-11-28 18:12:31'),
(49, 12, 15, 'aaffs', '2024-11-28 18:12:50'),
(50, 12, 14, 'fasdffasdf', '2024-11-28 18:20:05'),
(51, 12, 15, 'f', '2024-11-28 18:20:14'),
(52, 12, 14, 'f', '2024-11-28 18:20:21'),
(53, 12, 15, 'ádf', '2024-11-28 18:20:24'),
(54, 12, 14, 'co cuc cut', '2024-11-28 18:20:30'),
(55, 12, 15, 'alooo', '2024-11-28 18:20:34'),
(56, 12, 14, 'ádfasdf', '2024-11-28 18:20:37'),
(57, 12, 15, 'sdafsdf', '2024-11-28 18:20:41'),
(58, 12, 14, 'ádfasdf', '2024-11-28 18:20:43'),
(59, 12, 15, 'bbvsb', '2024-11-28 18:20:46'),
(60, 12, 15, 'sdafsadf', '2024-11-28 18:20:49'),
(61, 12, 15, 'df', '2024-11-28 18:21:22'),
(62, 12, 14, 'f', '2024-11-28 18:21:27'),
(63, 12, 14, 'f', '2024-11-28 18:21:31'),
(64, 12, 14, 'fsdaf', '2024-11-28 18:21:34'),
(65, 12, 15, 'fsdf', '2024-11-28 18:21:36'),
(66, 12, 14, 'f', '2024-11-28 18:21:40'),
(67, 12, 14, 'fdsa', '2024-11-28 18:21:54'),
(68, 12, 14, 'df', '2024-11-28 18:22:00'),
(69, 12, 15, 'ádf', '2024-11-28 18:22:05'),
(70, 12, 14, 'fsdaf', '2024-11-28 18:22:10'),
(71, 12, 15, 'fsdaf', '2024-11-28 18:22:13'),
(72, 12, 14, 'ádf', '2024-11-28 18:22:15'),
(73, 12, 14, 'ádff', '2024-11-28 18:25:34'),
(74, 12, 14, 'sadf', '2024-11-28 18:30:37'),
(75, 12, 15, 'ádff', '2024-11-28 18:30:44'),
(76, 12, 15, 'sadfdasfasdfsaf', '2024-11-28 18:30:53'),
(77, 12, 14, 'ádfasdfadsfasdfsadf', '2024-11-28 18:31:03'),
(78, 12, 15, 'sdf', '2024-11-28 18:31:12'),
(85, 9, 14, 'Sent a file: Báo cáo TTTT (Đức).docx', '2024-12-03 16:45:33'),
(86, 9, 14, 'Sent a file: pass.txt', '2024-12-03 17:12:44'),
(87, 9, 14, 'a', '2024-12-03 17:42:20'),
(88, 9, 14, 'Sent a file: z5466830169909_d9edcd70fdff388a24d8a548e8dae2c5.jpg', '2024-12-03 17:51:11'),
(89, 9, 14, 'Sent a file: !.html', '2024-12-03 17:54:35'),
(90, 9, 14, 'gi', '2024-12-03 18:22:56'),
(91, 9, 14, 'Sent a file: cucma1.docm', '2024-12-03 18:23:14'),
(92, 9, 14, 'gi', '2024-12-03 18:28:52'),
(93, 9, 14, 'Sent a file: cucma1.docm', '2024-12-03 18:29:22'),
(94, 9, 14, 'b', '2024-12-03 18:34:33'),
(95, 9, 14, 'b', '2024-12-03 18:34:40'),
(96, 9, 14, 'j', '2024-12-03 18:36:56'),
(97, 9, 14, 'alo', '2024-12-03 19:01:30'),
(98, 9, 15, 'j', '2024-12-03 19:01:34'),
(99, 9, 14, 'lam gi do', '2024-12-03 19:01:40'),
(100, 9, 15, 'k lam gi ca', '2024-12-03 19:01:47'),
(101, 9, 14, 'Sent a file: goiphutungoto.png', '2024-12-03 19:02:02'),
(102, 9, 15, 'alo', '2024-12-04 00:35:45'),
(103, 9, 14, 'alo', '2024-12-04 00:35:52'),
(104, 9, 15, 'alo', '2024-12-04 00:37:24'),
(105, 9, 14, 'hom nay khoe khong', '2024-12-04 00:37:33'),
(106, 9, 14, 'Sent a file: cucma1.docm', '2024-12-04 00:43:13'),
(107, 9, 15, 'Sent a file: cucma1.docm', '2024-12-04 00:47:48'),
(108, 9, 14, 'Sent a file: cucma1.docm', '2024-12-04 00:54:23'),
(109, 9, 14, 'Sent a file: cucma1.docm', '2024-12-04 00:54:37'),
(110, 9, 14, 'cu sa', '2024-12-25 05:13:23');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `password_hash`, `email`, `created_at`) VALUES
(14, 'bim', '20d8c276b8e9801568963497d299f2501dc18f078ca95b4a555d8646e7af720c', 'bim@gmail.com', '2024-10-01 13:23:00'),
(15, 'sa', 'dcb4b25a9059cc676c24dc36bd01784ce3acbaf94d6bcfc54bbe84deaf95ae93', 'sa@gmail.com', '2024-10-03 15:55:42'),
(16, 'bimsa', 'ed21f42023bc1d7707a5c194e50165d26d84ed484602185f8a01f2764a087a97', 'bimsa@gmail.com', '2024-10-05 14:29:21'),
(17, 'duc', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 'duc@gmail.com', '2024-11-29 16:36:02'),
(18, 'huyen', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 'huyen@gmail.com', '2024-11-29 16:44:07');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `call_logs`
--
ALTER TABLE `call_logs`
  ADD PRIMARY KEY (`call_id`),
  ADD KEY `conversation_id` (`conversation_id`),
  ADD KEY `caller_id` (`caller_id`),
  ADD KEY `receiver_id` (`receiver_id`);

--
-- Indexes for table `conversations`
--
ALTER TABLE `conversations`
  ADD PRIMARY KEY (`conversation_id`);

--
-- Indexes for table `conversation_participants`
--
ALTER TABLE `conversation_participants`
  ADD PRIMARY KEY (`conversation_id`,`user_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `files`
--
ALTER TABLE `files`
  ADD PRIMARY KEY (`file_id`),
  ADD KEY `message_id` (`message_id`);

--
-- Indexes for table `friends`
--
ALTER TABLE `friends`
  ADD PRIMARY KEY (`user_id`,`friend_id`),
  ADD KEY `friend_id` (`friend_id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`message_id`),
  ADD KEY `conversation_id` (`conversation_id`),
  ADD KEY `sender_id` (`sender_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `call_logs`
--
ALTER TABLE `call_logs`
  MODIFY `call_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `conversations`
--
ALTER TABLE `conversations`
  MODIFY `conversation_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `files`
--
ALTER TABLE `files`
  MODIFY `file_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `message_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=111;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `call_logs`
--
ALTER TABLE `call_logs`
  ADD CONSTRAINT `call_logs_ibfk_1` FOREIGN KEY (`conversation_id`) REFERENCES `conversations` (`conversation_id`),
  ADD CONSTRAINT `call_logs_ibfk_2` FOREIGN KEY (`caller_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `call_logs_ibfk_3` FOREIGN KEY (`receiver_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `conversation_participants`
--
ALTER TABLE `conversation_participants`
  ADD CONSTRAINT `conversation_participants_ibfk_1` FOREIGN KEY (`conversation_id`) REFERENCES `conversations` (`conversation_id`),
  ADD CONSTRAINT `conversation_participants_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `files`
--
ALTER TABLE `files`
  ADD CONSTRAINT `files_ibfk_1` FOREIGN KEY (`message_id`) REFERENCES `messages` (`message_id`);

--
-- Constraints for table `friends`
--
ALTER TABLE `friends`
  ADD CONSTRAINT `friends_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `friends_ibfk_2` FOREIGN KEY (`friend_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `messages`
--
ALTER TABLE `messages`
  ADD CONSTRAINT `messages_ibfk_1` FOREIGN KEY (`conversation_id`) REFERENCES `conversations` (`conversation_id`),
  ADD CONSTRAINT `messages_ibfk_2` FOREIGN KEY (`sender_id`) REFERENCES `users` (`user_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
