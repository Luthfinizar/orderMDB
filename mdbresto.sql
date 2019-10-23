-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 23, 2019 at 01:41 PM
-- Server version: 10.1.32-MariaDB
-- PHP Version: 5.6.36

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mdbresto`
--

-- --------------------------------------------------------

--
-- Table structure for table `menu`
--

CREATE TABLE `menu` (
  `IDMenu` int(11) NOT NULL,
  `NamaMenu` varchar(100) NOT NULL,
  `Deskripsi` text NOT NULL,
  `URLGambar` text NOT NULL,
  `Jenis` enum('food','drink','desert') NOT NULL,
  `Harga` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `menu`
--

INSERT INTO `menu` (`IDMenu`, `NamaMenu`, `Deskripsi`, `URLGambar`, `Jenis`, `Harga`) VALUES
(1, 'Pizza hicken Loverz', 'Pizza Chiken Loverz adalah Pizza yang direkomendasikan untuk pencinta hidangan ayam', 'static/images/chickenloverz.png', 'food', 125000),
(2, 'Pasta', 'Pasta makanan, bukan pasta gigi yang biasa digunakan untuk sikat gigi. ini Pasta Sphageti. enak dimakan gak bikin kembung', 'static/images/pasta.jpg', 'food', 35000),
(3, 'Triple Choco Ice', 'Galau? Cocok nih es krim ini untuk menyemangati hari mu :)', 'static/images/triplechoco.png', 'desert', 15000),
(4, 'Gold Cake', 'Cocok buat kamu yang bingung menghabiskan uang, kue yang dilapisi emas 100 gram yang dapat dimakan tentunya. Auto panjat sosial..', 'static/images/goldcake.png', 'desert', 7456500),
(5, 'Choco Latte', 'Minuman Segar untuk pecinta kopi dan coklat yang nikmat diminum', 'static/images/chocolatte.png', 'drink', 20000);

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE `order` (
  `IDOrder` int(11) NOT NULL,
  `IDMenu` int(11) NOT NULL,
  `NamaPemesan` varchar(100) NOT NULL,
  `Phone` varchar(25) NOT NULL,
  `Alamat` text NOT NULL,
  `JumlahPesan` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `order`
--

INSERT INTO `order` (`IDOrder`, `IDMenu`, `NamaPemesan`, `Phone`, `Alamat`, `JumlahPesan`) VALUES
(1, 1, 'aa', '32423', 'sdfsdfsf', 3),
(2, 2, 'aaa', '098', '078', 9),
(3, 3, 'CobaOrder1', '33213', 'sfhfhh', 32);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`IDMenu`);

--
-- Indexes for table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`IDOrder`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `menu`
--
ALTER TABLE `menu`
  MODIFY `IDMenu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `order`
--
ALTER TABLE `order`
  MODIFY `IDOrder` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
