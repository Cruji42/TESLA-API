-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 29, 2020 at 03:56 AM
-- Server version: 10.1.35-MariaDB
-- PHP Version: 7.2.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cars`
--

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `price` double DEFAULT NULL,
  `model` varchar(45) DEFAULT NULL,
  `image` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `price`, `model`, `image`) VALUES
(1, 'Tesla Model S', 1900000, '2016', 'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/tesla-model-s-1563301327.jpg'),
(2, 'Tesla Model X', 2100000, '2016', 'https://car-images.bauersecure.com/pagefiles/92539/01tesla-model-x.jpg'),
(3, 'Tesla Model 3', 1005000, '2017', 'https://www.diariomotor.com/imagenes/2016/03/tesla-model-3-01.jpg'),
(4, 'Tesla Model Y', 1134000, '2020', 'https://carsguide-res.cloudinary.com/image/upload/f_auto,fl_lossy,q_auto,t_default/v1/editorial/tesla-model-y-pre-1001x565-%281%29.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `id` int(11) NOT NULL,
  `date` date DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `products_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sales`
--

INSERT INTO `sales` (`id`, `date`, `amount`, `products_id`) VALUES
(1, '2019-01-01', 20, 1),
(2, '2019-01-07', 4, 1),
(3, '2019-01-13', 12, 1),
(4, '2019-01-20', 22, 1),
(5, '2019-01-15', 13, 1),
(6, '2019-01-11', 9, 1),
(7, '2019-01-24', 25, 1),
(8, '2019-02-01', 15, 1),
(9, '2019-02-02', 8, 1),
(10, '2019-02-03', 10, 1),
(11, '2019-02-04', 23, 1),
(12, '2019-02-05', 16, 1),
(13, '2019-03-01', 10, 1),
(14, '2019-03-02', 5, 1),
(15, '2019-03-03', 15, 1),
(16, '2019-03-04', 13, 1),
(17, '2019-03-05', 22, 1),
(18, '2019-04-01', 19, 1),
(19, '2019-04-02', 40, 1),
(20, '2019-04-03', 32, 1),
(21, '2019-04-04', 60, 1),
(22, '2019-04-05', 10, 1),
(23, '2019-05-01', 12, 1),
(24, '2019-05-02', 55, 1),
(25, '2019-05-03', 25, 1),
(26, '2019-05-04', 11, 1),
(27, '2019-05-05', 10, 1),
(28, '2019-06-01', 14, 1),
(29, '2019-06-02', 35, 1),
(30, '2019-06-03', 7, 1),
(31, '2019-06-04', 20, 1),
(32, '2019-06-05', 10, 1),
(33, '2019-07-01', 15, 1),
(34, '2019-07-02', 9, 1),
(35, '2019-07-03', 5, 1),
(36, '2019-07-04', 5, 1),
(37, '2019-07-05', 12, 1),
(38, '2019-08-01', 5, 1),
(39, '2019-08-02', 6, 1),
(40, '2019-08-03', 20, 1),
(41, '2019-08-04', 8, 1),
(42, '2019-08-05', 11, 1),
(43, '2019-09-01', 5, 1),
(44, '2019-09-02', 5, 1),
(45, '2019-09-03', 22, 1),
(46, '2019-09-04', 18, 1),
(47, '2019-09-05', 16, 1),
(48, '2019-10-01', 5, 1),
(49, '2019-10-02', 42, 1),
(50, '2019-10-03', 13, 1),
(51, '2019-10-04', 11, 1),
(52, '2019-10-05', 21, 1),
(53, '2019-11-01', 28, 1),
(54, '2019-11-02', 23, 1),
(55, '2019-11-03', 11, 1),
(56, '2019-11-04', 25, 1),
(57, '2019-11-05', 26, 1),
(58, '2019-12-01', 5, 1),
(59, '2019-12-02', 14, 1),
(60, '2019-12-03', 12, 1),
(61, '2019-12-04', 20, 1),
(62, '2019-12-05', 24, 1);

-- --------------------------------------------------------

--
-- Table structure for table `stores`
--

CREATE TABLE `stores` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `city` varchar(100) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `schedule` varchar(45) DEFAULT NULL,
  `image` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `stores`
--

INSERT INTO `stores` (`id`, `name`, `city`, `address`, `schedule`, `image`) VALUES
(1, 'Ciudad de México-Masaryk', 'Ciudad de México', 'Calle Presidente Masaryk 421', '+52 55 4163-7084', 'https://images.axios.com/QZ4hMw7YnpSSmrm_ffxDPNvffJE=/0x349:5000x3162/1920x1080/2019/03/01/1551400156930.jpg'),
(2, 'Tesla Los Angeles', 'Los Angeles California', 'Blv. Vinewood #430', '+60 8963125870', 'https://electrek.co/wp-content/uploads/sites/3/2015/09/tesla-store-los-angeles-photo-misha-bruk-mbh-architects_100449434_h-e1441584557926.jpg?quality=82&strip=all'),
(3, 'UK Tesla ', 'Londres', 'Sir. Percival #66', '+90 8531658742', 'https://content.fortune.com/wp-content/uploads/2015/05/tesla-pop-up-store.jpg'),
(4, 'Tesla España', 'Madrid', 'Franchesco #88', '+89 5321654721', 'https://assets.greentechmedia.com/assets/content/cache/made/assets/content/cache/remote/https_assets.greentechmedia.com/content/images/articles/Tesla_StoreXL_721_420_80_s_c1.jpg'),
(5, 'Germany Tesla', 'Stuttgart', 'Palace 20 #90', '+96 3214658709', 'https://content.fortune.com/wp-content/uploads/2015/05/tesla-pop-up-store.jpg'),
(6, 'Italy Tesla', 'Roma', 'Vendetti Salvatore #8', '+99 4521302145', 'https://media.bizj.us/view/img/10771563/tesla-13*750xx6016-3384-0-308.jpg'),
(7, 'Islandia Tesla', 'Valhalla ', 'Viking St #69', '+88 4569321008', 'https://image-cdn.hypb.st/https%3A%2F%2Fhypebeast.com%2Fimage%2F2019%2F03%2Ftesla-reverses-decision-to-close-stores-001.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `test`
--

CREATE TABLE `test` (
  `id` int(11) NOT NULL,
  `date` datetime DEFAULT NULL,
  `state` enum('Aceptada','Rechazada','Solicitada') DEFAULT 'Solicitada',
  `users_id` int(11) NOT NULL,
  `products_id` int(11) NOT NULL,
  `stores_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `test`
--

INSERT INTO `test` (`id`, `date`, `state`, `users_id`, `products_id`, `stores_id`) VALUES
(1, '2020-08-08 19:47:00', 'Solicitada', 1, 1, 1),
(4, '2020-07-29 20:49:00', 'Solicitada', 1, 3, 2),
(5, '2020-08-08 20:49:00', 'Solicitada', 1, 4, 7),
(6, '2020-10-20 20:50:00', 'Solicitada', 1, 2, 4);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `nickname` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `access` int(11) DEFAULT '100'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `nickname`, `email`, `password`, `access`) VALUES
(1, 'Edgar Mora', 'cruji42@gmail.com', '$2y$05$znOPv1uWt3nTR03WqczBHOrqs/CXNWkIdZrVRfGkydB4gd3dfcEDW', 100);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`id`,`products_id`),
  ADD KEY `fk_sales_products_idx` (`products_id`);

--
-- Indexes for table `stores`
--
ALTER TABLE `stores`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `test`
--
ALTER TABLE `test`
  ADD PRIMARY KEY (`id`,`users_id`,`products_id`,`stores_id`),
  ADD KEY `fk_test_users1_idx` (`users_id`),
  ADD KEY `fk_test_products1_idx` (`products_id`),
  ADD KEY `fk_test_stores1_idx` (`stores_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nickname_UNIQUE` (`nickname`),
  ADD UNIQUE KEY `email_UNIQUE` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE `sales`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT for table `stores`
--
ALTER TABLE `stores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `test`
--
ALTER TABLE `test`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `sales`
--
ALTER TABLE `sales`
  ADD CONSTRAINT `fk_sales_products` FOREIGN KEY (`products_id`) REFERENCES `products` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `test`
--
ALTER TABLE `test`
  ADD CONSTRAINT `fk_test_products1` FOREIGN KEY (`products_id`) REFERENCES `products` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_test_stores1` FOREIGN KEY (`stores_id`) REFERENCES `stores` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_test_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
