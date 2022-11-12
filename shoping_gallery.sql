-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Nov 12, 2022 at 12:27 PM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `shoping_gallery`
--

-- --------------------------------------------------------

--
-- Table structure for table `sp_product`
--

CREATE TABLE `sp_product` (
  `id` int(11) NOT NULL,
  `name` text DEFAULT NULL,
  `img` text DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `type` text DEFAULT NULL,
  `filezip` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sp_product`
--

INSERT INTO `sp_product` (`id`, `name`, `img`, `price`, `description`, `type`, `filezip`) VALUES
(8, 'Pepsi Max', 'm1668252435941.png', 50, 'asdasd', 'shoe', 'z1668252435941.zip');

-- --------------------------------------------------------

--
-- Table structure for table `sp_transaction`
--

CREATE TABLE `sp_transaction` (
  `id` int(11) NOT NULL,
  `transid` text DEFAULT NULL,
  `orderlist` text DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `shipping` int(11) DEFAULT NULL,
  `vat` int(11) DEFAULT NULL,
  `netamount` int(11) DEFAULT NULL,
  `operation` text DEFAULT NULL,
  `mil` bigint(20) DEFAULT NULL,
  `updated_at` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `sp_product`
--
ALTER TABLE `sp_product`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sp_transaction`
--
ALTER TABLE `sp_transaction`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `sp_product`
--
ALTER TABLE `sp_product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `sp_transaction`
--
ALTER TABLE `sp_transaction`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
