-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 08, 2024 at 08:52 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pharmacy`
--

-- --------------------------------------------------------

--
-- Table structure for table `medicine`
--

CREATE TABLE `medicine` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `dose` int(11) NOT NULL,
  `description` text NOT NULL,
  `effect` varchar(255) NOT NULL,
  `price` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `medicine`
--

INSERT INTO `medicine` (`id`, `name`, `image`, `dose`, `description`, `effect`, `price`) VALUES
(2, 'Febricet', 'febricet.jpg', 500, 'Lek Febricet se koristi u terapiji blagog do umerenog bola poput glavobolje, migrene, neuralgije, zubobolje, suvoće grla, kod menstrualnih bolova, za simptomatsko olakšanje kod istegnuća, uganuća i reumatskog bola i kod gripa, groznice i prehlade praćene povišenom telesnom temperaturom.', 'Antipiretik', '2.10'),
(3, 'Aspirin', 'aspirin.jpg', 500, 'Simptomatska terapija febrilnih stanja i blagog do umerenog bola.', 'Antikoagulans', '1.50'),
(4, 'Pressing', 'pressing.jpg', 10, 'Lek Pressing tablete pripada grupi lekova poznatih pod nazivom antihistaminici (blokatori H1 receptora).\r\n\r\nAntihistaminici pomažu u olakšanju alergijskih simptoma sprečavajući efekte supstance pod nazivom histamin, koja se stvara u organizmu.\r\n\r\nLek Pressing tablete ublažava simptome povezane sa alergijskim rinitisom (npr. polenska kijavica), koju karakteriše kijanje, curenje iz nosa, ili svrab i osećaj nadraženosti u nosu, peckanje ili svrab očiju.\r\n\r\nLek Pressing tablete se primenjuju i za ublažavanje simptoma hronične idiopatske urtikarije (koprivnjače) koju karakteriše svrab i crvenilo.', 'Antihistaminik', '2.50'),
(5, 'Tanakan', 'tanakan.jpg', 40, 'Tanakan sadrži kao aktivnu supstancu suvi ekstrakt lista Ginkgo biloba u količini od 40 mg po jednoj tableti i koristi se kao pomoćni lek (namenjen je za lečenje i poboljšanje) u terapiji demencije (zaboravnosti), vrtoglavice i zujanja u ušima koji su posledica poremećaja krvnih sudova i cirkulacije, i kod okluzivnog oboljenja perifernih arterija (začepljenje krvnih sudova kao posledica postojećeg oboljenja). \r\nUkoliko imate bilo kakva pitanja u vezi sa ovim lekom, pitajte Vašeg lekara ili farmaceuta.  ', 'vazodilatator', '3.00');

-- --------------------------------------------------------

--
-- Table structure for table `prescription`
--

CREATE TABLE `prescription` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `user_id` varchar(13) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `prescription`
--

INSERT INTO `prescription` (`id`, `name`, `date`, `user_id`) VALUES
(1, 'Za glavu', '2024-05-31', '1111111111111');

-- --------------------------------------------------------

--
-- Table structure for table `therapy`
--

CREATE TABLE `therapy` (
  `id` int(11) NOT NULL,
  `prescription_id` int(11) NOT NULL,
  `medicine_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `therapy`
--

INSERT INTO `therapy` (`id`, `prescription_id`, `medicine_id`, `quantity`) VALUES
(2, 1, 2, 1),
(4, 1, 5, 1);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `UMCN` varchar(13) NOT NULL,
  `name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `user_type` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`UMCN`, `name`, `last_name`, `username`, `password`, `phone`, `user_type`) VALUES
('1111111111111', 'Petar', 'Petrovic', 'pero', 'scrypt:32768:8:1$TluUUiRUE91uUxJN$8b97715d15910fb51a0c594667e72ebb65684d6b0f6363b4617d801947d9a23b2725b708a6473c0a2123f9fef13275cbe98b5e7221280249ed75f364bce9718d', '+38269111111', 1),
('2222222222222', 'admin', 'adminic', 'admin', 'scrypt:32768:8:1$rxI3HpPPuwNz9yuV$de1a3a392e1ae1b988ad5ce44893fb8bc21ba6eeea1380bbf60f2f98bab693718b41ed1bec8a1d0f73661a138756a2b1e3589c16d3ff1586bf0b471e5089d242', '+38269222222', 2);

-- --------------------------------------------------------

--
-- Table structure for table `user_type`
--

CREATE TABLE `user_type` (
  `id` int(11) NOT NULL,
  `type` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_type`
--

INSERT INTO `user_type` (`id`, `type`) VALUES
(1, 'pacijent'),
(2, 'farmaceut');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `medicine`
--
ALTER TABLE `medicine`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `prescription`
--
ALTER TABLE `prescription`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `therapy`
--
ALTER TABLE `therapy`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`prescription_id`),
  ADD KEY `medicine_id` (`medicine_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`UMCN`),
  ADD UNIQUE KEY `username` (`username`),
  ADD KEY `user_id` (`user_type`);

--
-- Indexes for table `user_type`
--
ALTER TABLE `user_type`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `medicine`
--
ALTER TABLE `medicine`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `prescription`
--
ALTER TABLE `prescription`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `therapy`
--
ALTER TABLE `therapy`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `user_type`
--
ALTER TABLE `user_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `prescription`
--
ALTER TABLE `prescription`
  ADD CONSTRAINT `prescription_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`UMCN`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `therapy`
--
ALTER TABLE `therapy`
  ADD CONSTRAINT `therapy_ibfk_1` FOREIGN KEY (`medicine_id`) REFERENCES `medicine` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `therapy_ibfk_2` FOREIGN KEY (`prescription_id`) REFERENCES `prescription` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`user_type`) REFERENCES `user_type` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
