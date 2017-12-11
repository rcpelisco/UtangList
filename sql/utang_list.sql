-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Mar 23, 2017 at 04:46 PM
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
(2, '2017-03-09 18:19:52', 10, 1, 1),
(4, '2017-03-16 11:25:24', 456, 1, 7);

-- --------------------------------------------------------

--
-- Table structure for table `utangers`
--

CREATE TABLE `utangers` (
  `utanger_id` int(11) NOT NULL,
  `first_name` varchar(35) NOT NULL,
  `last_name` varchar(35) NOT NULL,
  `contact_no` varchar(15) NOT NULL,
  `address` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `utangers`
--

INSERT INTO `utangers` (`utanger_id`, `first_name`, `last_name`, `contact_no`, `address`) VALUES
(1, 'RC', 'Pelisco', '09482301926', 'P6-B Baan Riverside, Butuan City'),
(2, 'Shimbardo', 'Shadada', '09123456789', ''),
(3, 'Daryll', 'Cabagay', '09123456789', ''),
(4, 'Ivan', 'Alexander', '09123456789', ''),
(5, 'Andrew', 'Kramer', '09123456789', ''),
(6, 'Ching', 'Chang', '09123456789', ''),
(7, 'Bogart', 'Facundo', '0912345789', '');

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
  MODIFY `utang_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `utangers`
--
ALTER TABLE `utangers`
  MODIFY `utanger_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
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
