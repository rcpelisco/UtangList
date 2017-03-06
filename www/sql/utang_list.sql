-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Mar 06, 2017 at 08:39 AM
-- Server version: 10.1.16-MariaDB
-- PHP Version: 7.0.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `utang_list`
--

-- --------------------------------------------------------

--
-- Table structure for table `utang`
--

CREATE TABLE `utang` (
  `utang_id` int(11) NOT NULL,
  `created_on` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `amount` int(11) NOT NULL,
  `paid` tinyint(1) NOT NULL DEFAULT '0',
  `utanger_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `utang`
--

INSERT INTO `utang` (`utang_id`, `created_on`, `amount`, `paid`, `utanger_id`) VALUES
(1, '2017-03-03 09:41:41', 100, 0, 2),
(3, '2017-03-03 10:24:43', 50, 0, 1),
(5, '2017-03-04 19:35:30', 175, 0, 4),
(6, '2017-03-04 20:31:07', 250, 0, 4),
(9, '2017-03-06 15:29:28', 150, 0, 1),
(10, '2017-03-06 15:29:39', 150, 0, 5);

-- --------------------------------------------------------

--
-- Table structure for table `utangers`
--

CREATE TABLE `utangers` (
  `utanger_id` int(11) NOT NULL,
  `first_name` varchar(35) NOT NULL,
  `last_name` varchar(35) NOT NULL,
  `contact_no` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `utangers`
--

INSERT INTO `utangers` (`utanger_id`, `first_name`, `last_name`, `contact_no`) VALUES
(1, 'RC', 'Pelisco', '09482301926'),
(2, 'Shimbardo', 'Shadada', '09123456789'),
(3, 'Daryll', 'Cabagay', '09123456789'),
(4, 'Ivan', 'Alexander', '09123456789'),
(5, 'Andrew', 'Kramer', '09123456789');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `utang`
--
ALTER TABLE `utang`
  ADD PRIMARY KEY (`utang_id`),
  ADD KEY `utanger_id` (`utanger_id`);

--
-- Indexes for table `utangers`
--
ALTER TABLE `utangers`
  ADD PRIMARY KEY (`utanger_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `utang`
--
ALTER TABLE `utang`
  MODIFY `utang_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `utangers`
--
ALTER TABLE `utangers`
  MODIFY `utanger_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `utang`
--
ALTER TABLE `utang`
  ADD CONSTRAINT `utang_ibfk_1` FOREIGN KEY (`utanger_id`) REFERENCES `utangers` (`utanger_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
