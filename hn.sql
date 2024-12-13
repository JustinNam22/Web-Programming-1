-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th12 13, 2024 lúc 09:54 AM
-- Phiên bản máy phục vụ: 10.4.32-MariaDB
-- Phiên bản PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `hn`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `admins`
--

CREATE TABLE `admins` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `admins`
--

INSERT INTO `admins` (`id`, `username`, `password`) VALUES
(17, 'lamron', '$2y$10$hXEUogIDhf8b1EOSTZV.kOZec3Cups47yJIdyYWYRl.gx8cFsE3X.');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `post_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `comments`
--

INSERT INTO `comments` (`id`, `post_id`, `name`, `comment`, `created_at`, `user_id`) VALUES
(68, 97, 'Hong Nam', 'Wow. Great !!', '2024-12-11 09:04:43', 28);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `modules`
--

CREATE TABLE `modules` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `modules`
--

INSERT INTO `modules` (`id`, `name`) VALUES
(1, 'Question'),
(2, 'Article'),
(3, 'Discussion'),
(12, 'Point of View');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `posts`
--

CREATE TABLE `posts` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `content` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `module_id` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `posts`
--

INSERT INTO `posts` (`id`, `title`, `image`, `content`, `created_at`, `user_id`, `name`, `module_id`, `updated_at`) VALUES
(96, 'Will England win the World Cup 2026?', NULL, 'dsa', '2024-12-11 08:04:58', 26, '', 3, '2024-12-11 17:34:31'),
(97, 'Greenwich University', 'uploads/67594820dbdef_Greenwich', 'According to Wikipedia, The University of Greenwich is a public university located in London and Kent, United Kingdom. Previous names include Woolwich Polytechnic and Thames Polytechnic.\r\n', '2024-12-11 08:06:56', 27, '', 2, '2024-12-11 17:31:45');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `ID` int(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(300) NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` date NOT NULL,
  `profile_pic` varchar(255) DEFAULT NULL,
  `reset_token_hash` varchar(64) DEFAULT NULL,
  `reset_token_expires_at` datetime DEFAULT NULL,
  `role` enum('admin','user') DEFAULT 'user'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`ID`, `email`, `password`, `name`, `created_at`, `profile_pic`, `reset_token_hash`, `reset_token_expires_at`, `role`) VALUES
(12, 'Justin@gmail.com', '$2y$10$PikPLokGuU535CKtTgP9Se8FmCiFBDNsoAbSP8eCOEn5y3pPT800O', 'Justin', '2024-11-18', NULL, '6383add0285db01659ae17b4dc440a85235da058bc7fcb796fb3af3a78148fdc', '2024-12-09 08:37:53', 'user'),
(17, 'Scott@gmail.com', '$2y$10$xXZEOSKvQsuoL9CjoqMz3ep3bTMx3Bnp5bD8viZql31IGf.RrAgsm', 'Scott', '2024-11-22', NULL, NULL, NULL, 'user'),
(18, 'Bradshaw@gmail.com', '$2y$10$uSuQ3GOftcsmNtyzy30wDurL1/25sb.UrPfTRfnj3SmBWn6OqGDTS', 'Bradshaw', '2024-11-22', NULL, NULL, NULL, 'user'),
(26, 'michaeljohnson@gmail.com', '$2y$10$Qelf7lWMdpiUGtlg0GleOOTxsTp88bgatIclHW.tByqafVQrN3inS', 'Michael Johnson', '2024-12-11', NULL, NULL, NULL, 'user'),
(27, 'rebeccalynch@gmail.com', '$2y$10$Oyx9L0MkQQQkh4WI0fz0m.jMPr65CFdkh5/7dfqKm5WVcNMsXqNLy', 'Rebecca Lynch', '2024-12-11', NULL, NULL, NULL, 'user'),
(33, 'hongnamjt@gmail.com', '$2y$10$SxFRV5qgNngYF802EClTpOgU.fKhYZ302jjNrI44xP6cryitNgiwW', 'Nguyen Nam', '2024-12-12', NULL, '6afbd797977d01d00728f8320df344e89151fcc34bdbc8ca1ae3c1dc4310d51c', '2024-12-12 08:28:05', 'user'),
(36, 'nguyenhongnamjt@gmail.com', '$2y$10$d3y1dWvfhlDTC1/FBCDSEuNnoq1FA7h6sQOARM/JvUVcXjqgYsRQW', 'Hong Nam', '2024-12-13', NULL, NULL, NULL, 'user'),
(37, 'nguyenho@gmail.com', '$2y$10$YERtbpfSCGB5FNoF/U7QDessSW5KR7FYExJfY3ixwOhXMsvi/pqkK', 'nguyenho', '2024-12-13', NULL, NULL, NULL, 'user');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Chỉ mục cho bảng `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `post_id` (`post_id`);

--
-- Chỉ mục cho bảng `modules`
--
ALTER TABLE `modules`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_user_id` (`user_id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `reset_token_hash` (`reset_token_hash`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT cho bảng `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT cho bảng `modules`
--
ALTER TABLE `modules`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT cho bảng `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=123;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `ID` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`ID`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
