-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 22, 2023 at 05:26 PM
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
-- Database: `blooddonation`
--

-- --------------------------------------------------------

--
-- Table structure for table `bloodrequest`
--

CREATE TABLE `bloodrequest` (
  `request_id` int(11) NOT NULL,
  `donationdate` date DEFAULT NULL,
  `address` varchar(30) DEFAULT NULL,
  `bloodgroup` tinytext DEFAULT NULL,
  `content` varchar(1024) NOT NULL,
  `receiver_id` int(11) DEFAULT NULL,
  `createdat` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bloodrequest`
--

INSERT INTO `bloodrequest` (`request_id`, `donationdate`, `address`, `bloodgroup`, `content`, `receiver_id`, `createdat`) VALUES
(1, '2023-04-09', 'sadi', 'B-', 'Needs a donor for my mum who just gave birth and needs transfussion', 7, '2023-06-29 05:43:21'),
(2, '2023-09-13', 'akwa', 'A+', 'Please contact me if you\'re a potential A+ donor. ', 6, '2023-06-29 05:43:21'),
(4, '2024-09-08', 'Deido', 'AB-', 'My blood group is so rare and I need to undergo a surgery in less than a week. Help me!', 7, '2023-06-29 05:43:21'),
(38, '2023-04-05', 'Akwa Nord', 'O-', 'I\'m in desperate need of an O- blood donor in Douala', 8, '2023-06-29 06:44:44'),
(41, '2023-06-07', 'Bonaberi', 'O-', '', 7, '2023-06-29 08:19:32'),
(42, '2023-06-07', 'bonajo', 'O+', '', 7, '2023-06-29 08:20:36'),
(44, '2023-08-09', 'sadi', 'A+', 'Unfornately my child is diabetic and she needs a urgent transfussion', 7, '2023-07-01 07:49:03'),
(45, '2023-04-05', 'Makepe', 'AB+', 'Hello! Please in need of AB+ donor around my area', 7, '2023-07-01 08:08:27'),
(46, '2023-04-05', 'Makepe', 'AB+', 'Hello! Please in need of AB+ donor around my area', 7, '2023-07-01 08:14:17'),
(47, '2023-04-05', 'Makepe', 'AB+', 'Hello! Please in need of AB+ donor around my area', 7, '2023-07-01 08:15:16'),
(48, '2023-07-13', 'Bonamousadi', 'AB+', 'Need a donor Urgently', 7, '2023-07-02 09:42:59'),
(49, '2023-07-13', 'Bonamousadi', 'AB+', 'Need a donor Urgently', 7, '2023-07-02 09:43:40'),
(50, '2023-07-08', 'Deido', 'AB+', 'Please donate', 7, '2023-07-05 05:17:55'),
(51, '2023-08-07', 'kotto', 'AB+', 'donate', 7, '2023-07-05 05:22:53');

-- --------------------------------------------------------

--
-- Table structure for table `donor`
--

CREATE TABLE `donor` (
  `donor_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` text NOT NULL,
  `phonenumber` int(10) NOT NULL,
  `bloodgroup` text NOT NULL,
  `age` int(2) NOT NULL,
  `address` varchar(30) NOT NULL,
  `longitude` float NOT NULL,
  `latitude` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `donor`
--

INSERT INTO `donor` (`donor_id`, `name`, `email`, `phonenumber`, `bloodgroup`, `age`, `address`, `longitude`, `latitude`) VALUES
(1, 'Andrea', 'andy@gmail.com', 655145403, 'AB+', 22, 'bonamousadi', 9.73124, 4.07151),
(2, 'Arthur', 'arthur@gmail.com', 677665544, 'AB+', 22, 'Akwa', 9.69633, 4.05254);

-- --------------------------------------------------------

--
-- Table structure for table `notification`
--

CREATE TABLE `notification` (
  `notification_id` int(11) NOT NULL,
  `receiver_id` int(11) DEFAULT NULL,
  `request_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `notification`
--

INSERT INTO `notification` (`notification_id`, `receiver_id`, `request_id`) VALUES
(3, 7, 4),
(4, 8, 38),
(9, 8, 42);

-- --------------------------------------------------------

--
-- Table structure for table `receiver`
--

CREATE TABLE `receiver` (
  `receiver_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` text NOT NULL,
  `password` varchar(1024) NOT NULL,
  `phonenumber` int(10) NOT NULL,
  `bloodgroup` text NOT NULL,
  `age` int(2) NOT NULL,
  `address` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `receiver`
--

INSERT INTO `receiver` (`receiver_id`, `name`, `email`, `password`, `phonenumber`, `bloodgroup`, `age`, `address`) VALUES
(6, 'nadege', 'nadege@gmail.com', '$2b$10$1XqYdBJSHwDMLmktR1V6IO6mpxACRXXEDH4dxgUVVLMQv94lburSC', 698444567, 'AB-', 24, 'bonamousadi'),
(7, 'andy manuela', 'andy@gmail.com', '$2b$10$tPRyc2E65OjafZhLS33Ez.35CSfKg6mrHGaCA7cKc.rFvrkEIUsSa', 677445533, 'A+', 22, 'Akwa'),
(8, 'marlene', 'marlene@gmail.com', '$2b$10$JKGysEUJoeZkcArLIyGOUOF0bjSy0DOvniwwesirJsvg.OuZDXdFS', 655145403, 'O-', 22, 'bonangan');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bloodrequest`
--
ALTER TABLE `bloodrequest`
  ADD PRIMARY KEY (`request_id`),
  ADD KEY `receiver_id` (`receiver_id`);

--
-- Indexes for table `donor`
--
ALTER TABLE `donor`
  ADD PRIMARY KEY (`donor_id`);

--
-- Indexes for table `notification`
--
ALTER TABLE `notification`
  ADD PRIMARY KEY (`notification_id`),
  ADD KEY `receiver_id` (`receiver_id`),
  ADD KEY `request_id` (`request_id`);

--
-- Indexes for table `receiver`
--
ALTER TABLE `receiver`
  ADD PRIMARY KEY (`receiver_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bloodrequest`
--
ALTER TABLE `bloodrequest`
  MODIFY `request_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `donor`
--
ALTER TABLE `donor`
  MODIFY `donor_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `notification`
--
ALTER TABLE `notification`
  MODIFY `notification_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `receiver`
--
ALTER TABLE `receiver`
  MODIFY `receiver_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bloodrequest`
--
ALTER TABLE `bloodrequest`
  ADD CONSTRAINT `bloodrequest_ibfk_1` FOREIGN KEY (`receiver_id`) REFERENCES `receiver` (`receiver_id`);

--
-- Constraints for table `notification`
--
ALTER TABLE `notification`
  ADD CONSTRAINT `notification_ibfk_1` FOREIGN KEY (`receiver_id`) REFERENCES `receiver` (`receiver_id`),
  ADD CONSTRAINT `notification_ibfk_2` FOREIGN KEY (`request_id`) REFERENCES `bloodrequest` (`request_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
