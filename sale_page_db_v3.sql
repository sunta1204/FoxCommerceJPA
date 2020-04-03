-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 03, 2020 at 08:32 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sale_page_db_v3`
--

-- --------------------------------------------------------

--
-- Table structure for table `files`
--

CREATE TABLE `files` (
  `id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `file_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `file_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `page_id` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `files`
--

INSERT INTO `files` (`id`, `file_name`, `file_type`, `page_id`) VALUES
('c0bb4b12-54b3-4918-8394-df469b59714c', 'Screenshot (12).png', 'image/png', 1),
('2ee4bea8-fc8e-4a88-a2c8-71632e5753fb', 'Screenshot (4).png', 'image/png', 1);

-- --------------------------------------------------------

--
-- Table structure for table `page_content`
--

CREATE TABLE `page_content` (
  `content_id` int(11) NOT NULL,
  `content` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `page_id` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `page_content`
--

INSERT INTO `page_content` (`content_id`, `content`, `page_id`) VALUES
(5, 'werwerwerwerwerwer', 1),
(4, 'wrwerwer', 1),
(6, 'Hello Mother Fucker', 1),
(7, 'WFH', 1),
(8, 'sdfsdfsdfsdfsdf', 1),
(9, 'tertecvbcvb', 1);

-- --------------------------------------------------------

--
-- Table structure for table `page_picture`
--

CREATE TABLE `page_picture` (
  `picture_id` int(11) NOT NULL,
  `page_id` int(11) DEFAULT NULL,
  `picture_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `page_video`
--

CREATE TABLE `page_video` (
  `video_id` int(11) NOT NULL,
  `page_id` int(11) DEFAULT NULL,
  `video_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `page_video`
--

INSERT INTO `page_video` (`video_id`, `page_id`, `video_name`) VALUES
(1, 1, 'https://www.youtube.com/embed/v6ZSMe-nasY'),
(2, 1, 'https://www.youtube.com/embed/JgFb6o09fJw');

-- --------------------------------------------------------

--
-- Table structure for table `sale_page`
--

CREATE TABLE `sale_page` (
  `page_id` int(11) NOT NULL,
  `page_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `u_id` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sale_page`
--

INSERT INTO `sale_page` (`page_id`, `page_name`, `status`, `u_id`) VALUES
(1, 'fdfgdfg', '1', 4);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `u_id` int(11) NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `expiry_date` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `inspector` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `tel` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`u_id`, `email`, `expiry_date`, `inspector`, `password`, `tel`, `type`, `username`) VALUES
(3, NULL, NULL, NULL, '123456789', NULL, 'D', 'topfine'),
(4, NULL, NULL, NULL, '0860896847', NULL, 'D', 'sunta1204');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `files`
--
ALTER TABLE `files`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `page_content`
--
ALTER TABLE `page_content`
  ADD PRIMARY KEY (`content_id`);

--
-- Indexes for table `page_picture`
--
ALTER TABLE `page_picture`
  ADD PRIMARY KEY (`picture_id`);

--
-- Indexes for table `page_video`
--
ALTER TABLE `page_video`
  ADD PRIMARY KEY (`video_id`);

--
-- Indexes for table `sale_page`
--
ALTER TABLE `sale_page`
  ADD PRIMARY KEY (`page_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`u_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `page_content`
--
ALTER TABLE `page_content`
  MODIFY `content_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `page_picture`
--
ALTER TABLE `page_picture`
  MODIFY `picture_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `page_video`
--
ALTER TABLE `page_video`
  MODIFY `video_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `sale_page`
--
ALTER TABLE `sale_page`
  MODIFY `page_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `u_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
