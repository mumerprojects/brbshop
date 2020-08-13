-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 31, 2020 at 09:51 PM
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
-- Database: `ckutz`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_login`
--

CREATE TABLE `admin_login` (
  `id` int(11) NOT NULL,
  `name` varchar(300) NOT NULL,
  `password` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin_login`
--

INSERT INTO `admin_login` (`id`, `name`, `password`) VALUES
(1, 'admin', 'admin12');

-- --------------------------------------------------------

--
-- Table structure for table `booking`
--

CREATE TABLE `booking` (
  `id` int(20) NOT NULL,
  `name` varchar(300) NOT NULL,
  `email` varchar(300) NOT NULL,
  `phone_no` int(20) NOT NULL,
  `package` varchar(300) NOT NULL,
  `time` time(6) NOT NULL,
  `Date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `gallery`
--

CREATE TABLE `gallery` (
  `id` int(11) NOT NULL,
  `image` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `gallery`
--

INSERT INTO `gallery` (`id`, `image`) VALUES
(4, '/imgs/1.jpg'),
(5, '/imgs/2.jpg'),
(6, '/imgs/3.jpg'),
(7, '/imgs/4.jpg'),
(8, '/imgs/5.jpg'),
(9, '/imgs/6.jpg'),
(10, '/imgs/7.jpg'),
(11, '/imgs/8.jpg'),
(12, '/imgs/9.jpg'),
(13, '/imgs/10.jpg'),
(14, '/imgs/11.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `galleryslider`
--

CREATE TABLE `galleryslider` (
  `id` int(11) NOT NULL,
  `image` varchar(300) CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `galleryslider`
--

INSERT INTO `galleryslider` (`id`, `image`) VALUES
(1, '../img/Capture 3.PNG');

-- --------------------------------------------------------

--
-- Table structure for table `members`
--

CREATE TABLE `members` (
  `M_ID` bigint(20) UNSIGNED NOT NULL,
  `FULLNAME` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `EMAIL` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `PASSWRD` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `MOBILENO` bigint(20) DEFAULT NULL,
  `VERIFIED` bigint(20) NOT NULL,
  `REGDATE` bigint(20) NOT NULL,
  `PN_ID` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `members`
--

INSERT INTO `members` (`M_ID`, `FULLNAME`, `EMAIL`, `PASSWRD`, `MOBILENO`, `VERIFIED`, `REGDATE`, `PN_ID`) VALUES
(15, 'Muhammad Umer', 'mumeroffice@gmail.com', '$2y$10$Ttqos6Vo3D9D4uZtDIrNjOvhILNYWwmqxTq//n9PwQp29/jjLWrjq', NULL, 0, 1595759259, 'uyhc6-097-oi88766'),
(16, 'Khalil Ullah', 'Khalil@gmail.com', '$2y$10$Njnx5y55UmlaI2yXzM.hCewqBpUVKWRUmmT6VG6DXQOC6QfDcojqC', NULL, 0, 1595759373, 'uyhc6-097-oi88766'),
(17, 'Adeel Ahmed', 'adeel@mail.com', '$2y$10$qgpV1Cb6oAzTn.4JwKOSZ.W0U.CkQIn6QReYasl89yqx5.BFDYQTa', NULL, 0, 1595764792, 'a8d6f85f-bb57-4cee-8503-568304a7d4ab'),
(18, 'Nectolink', 'nectolink@gmail.com', '$2y$10$DGfpV0tb9kFVlZWpEcau1eb8CJGiMOfvwB4bOuUeUg0S5kb7QrfEi', NULL, 0, 1595765985, 'a8d6f85f-bb57-4cee-8503-568304a7d4ab');

-- --------------------------------------------------------

--
-- Table structure for table `packages`
--

CREATE TABLE `packages` (
  `id` int(20) NOT NULL,
  `title` varchar(300) NOT NULL,
  `description` varchar(300) NOT NULL,
  `price` varchar(300) NOT NULL,
  `time` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `packages`
--

INSERT INTO `packages` (`id`, `title`, `description`, `price`, `time`) VALUES
(6, 'Pompadour Hairstyle', 'There are so many different types of haircuts for men that choosing the best hairstyle can sometimes require a little research.', '30$', '45 minutes'),
(7, 'Undercut Hairstyle', 'Often interchangeable with the term “taper”, a fade simply means you want the hair on the side of your head to gradually get shorter from top to bottom.', '30$', '30 minutes'),
(8, 'Fade and Taper', 'The pompadour is a type of undercut hairstyle that continues to have short sides and a long top. However, the pompadour is unique because a large volume of hair is swept upwards in the front to create a “pomp”.', '30$', '25 minutes'),
(9, 'Disconnected Pompadour', 'For a low-maintenance and easy cut with a bit more length than a buzzed top, the crew cut is the way to go.The textured fringe hairstyle has quickly become one of the best cuts of the year.The disconnected pompadour specifically refers to a hard part in the hair from the side to the top.', '50$', '40 minutes'),
(10, 'Crew Cut Style', 'For a low-maintenance and easy cut with a bit more length than a buzzed top, the crew cut is the way to go.The textured fringe hairstyle has quickly become one of the best cuts of the year.', '35$', '50 minutes');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_login`
--
ALTER TABLE `admin_login`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `booking`
--
ALTER TABLE `booking`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gallery`
--
ALTER TABLE `gallery`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `galleryslider`
--
ALTER TABLE `galleryslider`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `members`
--
ALTER TABLE `members`
  ADD PRIMARY KEY (`M_ID`);

--
-- Indexes for table `packages`
--
ALTER TABLE `packages`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_login`
--
ALTER TABLE `admin_login`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `booking`
--
ALTER TABLE `booking`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gallery`
--
ALTER TABLE `gallery`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `galleryslider`
--
ALTER TABLE `galleryslider`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `members`
--
ALTER TABLE `members`
  MODIFY `M_ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `packages`
--
ALTER TABLE `packages`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
