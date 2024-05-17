-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 15, 2024 at 07:55 PM
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
-- Table structure for table `medication_order`
--

CREATE TABLE `medication_order` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `user_id` int(13) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `medicine`
--

CREATE TABLE `medicine` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `dose` int(11) NOT NULL,
  `description` text NOT NULL,
  `effect` varchar(255) NOT NULL,
  `price` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `medicine`
--

INSERT INTO `medicine` (`id`, `name`, `dose`, `description`, `effect`, `price`) VALUES
(1, 'Febricet', 500, 'Lek Febricet se koristi u terapiji blagog do umerenog bola poput glavobolje, migrene, neuralgije, zubobolje, suvoće grla, kod menstrualnih bolova, za simptomatsko olakšanje kod istegnuća, uganuća i reumatskog bola i kod gripa, groznice i prehlade praćene povišenom telesnom temperaturom.\r\n\r\nDoziranje i način primene\r\nLek je namenjen za oralnu primenu.\r\n\r\nOdrasli (uključujući i starije) i deca uzrasta starijeg od 16 godina\r\n\r\n1 do 2 tablete na svakih 4-6 sati, do maksimalno 8 tableta dnevno.\r\n\r\nDeca od 10 do 15 godina\r\n\r\n1 tableta na svakih 4-6 sati, do maksimalno 4 tablete dnevno.\r\n\r\nKontraindikacije\r\nPreosetljivost na paracetamol ili na bilo koju od pomoćnih supstanci navedenih u odelku 6.1\r\n\r\nPosebna upozorenja\r\nSavetuje se oprez pri primeni paracetamola kod pacijenata sa teškim oštećenjem funkcije bubrega ili jetre. Opasnost od predoziranja je veća kod pacijenata sa oboljenjem jetre bez ciroze usled primene alkohola.\r\n\r\nNe sme se prekoračiti preporučena doza.\r\n\r\nUkoliko se pacijent ne oseća bolje, odnosno ukoliko simptomi perzistiraju duže od 3 dana, potrebno je obratiti se lekaru.\r\n\r\nSadrži paracetamol.\r\n\r\nPacijentima se ne savetuje da istovremeno uzimaju druge lekove koji sadrže paracetamol.\r\n\r\nU slučaju predoziranja, potreban je hitan medicinski nadzor, čak i ukoliko se pacijent oseća dobro, jer prekomerna doza paracetamola može dovesti do odloženog, teškog oštećenja jetre.\r\n\r\nPacijente treba upozoriti da primena paracetamola može dovesti do pojave teških neželjenih reakcija na koži. U slučaju pojave reakcija na koži u vidu crvenila, mehura ili osipa, neophodno je odmah prekinuti sa daljom primenom leka i potražiti medicinsku pomoć.\r\n\r\nLek Febricet tablete sadrži ulje ricinusa, koje može izazvati stomačne tegobe i dijareju.', 'Antiinflamator', '2.10');

-- --------------------------------------------------------

--
-- Table structure for table `therapy`
--

CREATE TABLE `therapy` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `medicine_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `UMCN` int(13) NOT NULL,
  `name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `user_type` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `user_type`
--

CREATE TABLE `user_type` (
  `id` int(11) NOT NULL,
  `type` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `medication_order`
--
ALTER TABLE `medication_order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `medicine`
--
ALTER TABLE `medicine`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `therapy`
--
ALTER TABLE `therapy`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`),
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
-- AUTO_INCREMENT for table `medication_order`
--
ALTER TABLE `medication_order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `medicine`
--
ALTER TABLE `medicine`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `therapy`
--
ALTER TABLE `therapy`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_type`
--
ALTER TABLE `user_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `medication_order`
--
ALTER TABLE `medication_order`
  ADD CONSTRAINT `medication_order_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`UMCN`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `therapy`
--
ALTER TABLE `therapy`
  ADD CONSTRAINT `therapy_ibfk_1` FOREIGN KEY (`medicine_id`) REFERENCES `medicine` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `therapy_ibfk_2` FOREIGN KEY (`order_id`) REFERENCES `medication_order` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`user_type`) REFERENCES `user_type` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
