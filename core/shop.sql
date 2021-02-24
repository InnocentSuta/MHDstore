-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jan 13, 2018 at 12:45 PM
-- Server version: 10.1.13-MariaDB
-- PHP Version: 5.6.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `shop`
--

-- --------------------------------------------------------

--
-- Table structure for table `brand`
--

CREATE TABLE `brand` (
  `id` int(11) NOT NULL,
  `brand` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `brand`
--

INSERT INTO `brand` (`id`, `brand`) VALUES
(1, 'addidas'),
(2, 'polo'),
(3, 'gucci'),
(9, 'Nike'),
(12, 'Vans');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `items` text COLLATE utf8_unicode_ci NOT NULL,
  `expire_date` datetime NOT NULL,
  `paid` tinyint(4) NOT NULL DEFAULT '0',
  `shipped` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `items`, `expire_date`, `paid`, `shipped`) VALUES
(15, '[{"id":"28","size":"45","quantity":4}]', '2018-02-07 18:48:01', 0, 0),
(16, '[{"id":"26","size":"boya ebele","quantity":1},{"id":"22","size":"extrasmall","quantity":1}]', '2018-02-07 18:50:41', 0, 0),
(17, '[{"id":"25","size":"elengi","quantity":"1"}]', '2018-02-08 21:02:18', 1, 0),
(18, '[{"id":"27","size":"30","quantity":3},{"id":"23","size":"small","quantity":"1"},{"id":"29","size":"41","quantity":"1"},{"id":"28","size":"45","quantity":"2"},{"id":"22","size":"extrasmall","quantity":"2"}]', '2018-02-08 21:13:24', 1, 0),
(19, '[{"id":"27","size":"30","quantity":"2"},{"id":"25","size":"suka na bord","quantity":"2"},{"id":"28","size":"12","quantity":"2"}]', '2018-02-08 21:21:58', 1, 1),
(20, '[{"id":"26","size":"balansoire","quantity":"1"},{"id":"22","size":"extrasmall","quantity":"2"},{"id":"27","size":"30","quantity":"1"}]', '2018-02-08 21:46:25', 1, 0),
(21, '[{"id":"28","size":"45","quantity":"3"},{"id":"27","size":"28","quantity":"2"}]', '2018-02-08 22:44:24', 1, 0),
(23, '[{"id":"29","size":"41","quantity":"1"},{"id":"22","size":"extrasmall","quantity":"2"}]', '2018-02-08 23:04:52', 1, 0),
(24, '[{"id":"22","size":"2","quantity":"1"}]', '2018-02-08 23:11:19', 1, 1),
(25, '[{"id":"30","size":"extra-small","quantity":"1"}]', '2018-02-08 23:21:48', 1, 1),
(26, '[{"id":"30","size":"1","quantity":"1"}]', '2018-02-08 23:27:12', 1, 1),
(27, '[{"id":"27","size":"small","quantity":"2"},{"id":"22","size":"28","quantity":"2"}]', '2018-02-09 10:26:18', 1, 1),
(28, '[{"id":"22","size":"28","quantity":"3"}]', '2018-02-09 10:40:53', 1, 1),
(32, '[{"id":"35","size":"small","quantity":"2"}]', '2018-02-09 23:44:26', 1, 1),
(33, '[{"id":"23","size":"small","quantity":"1"},{"id":"35","size":"small","quantity":"1"}]', '2018-02-10 14:47:01', 1, 1),
(34, '[{"id":"27","size":"small","quantity":"1"},{"id":"22","size":"30","quantity":"1"}]', '2018-02-10 14:56:52', 1, 1),
(35, '[{"id":"22","size":"30","quantity":"1"}]', '2018-02-10 15:13:06', 1, 1),
(36, '[{"id":"36","size":"medium","quantity":1}]', '2018-02-10 19:16:49', 1, 1),
(37, '[{"id":"24","size":"medium","quantity":"6"},{"id":"22","size":"30","quantity":"2"}]', '2018-02-10 20:37:02', 1, 1),
(38, '[{"id":"36","size":"small","quantity":"14"}]', '2018-02-10 23:52:36', 1, 1),
(39, '[{"id":"28","size":"36","quantity":"2"}]', '2018-02-11 00:04:33', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `category` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `parent` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `category`, `parent`) VALUES
(1, 'Men', 0),
(2, 'Women', 0),
(3, 'Boys', 0),
(4, 'Girls', 0),
(5, 'Shirt', 1),
(7, 'Shoes', 1),
(8, 'Accessories', 1),
(9, 'Shirts', 2),
(10, 'Pants', 2),
(13, 'Shoes', 2),
(14, 'Dresses', 2),
(15, 'Shirst', 3),
(16, 'Pants', 3),
(17, 'Dresses', 4),
(18, 'Shoes', 4),
(21, 'Beauty', 4),
(30, 'Home decor', 29),
(41, 'twenty-four', 0),
(42, 'lingwala', 41),
(43, 'mongafula', 41),
(44, 'lemba', 41),
(52, 'Shirt', 1),
(53, 'Gibango', 0),
(54, 'Ndunde', 53),
(55, 'Mafuta', 53),
(56, 'Muyima', 53),
(57, 'Sona', 53),
(58, 'Long Skirt', 2),
(59, 'Short', 3);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `list_price` decimal(10,2) NOT NULL,
  `brand` int(11) NOT NULL,
  `categories` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `image` text COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `featured` tinyint(4) NOT NULL DEFAULT '0',
  `sizes` text COLLATE utf8_unicode_ci NOT NULL,
  `deleted` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `title`, `price`, `list_price`, `brand`, `categories`, `image`, `description`, `featured`, `sizes`, `deleted`) VALUES
(22, 'Skirt', '77.56', '96.44', 1, '58', '/eCommerce/images/products/f0f5abfb1b0b1ffffaab02daa08d01cd.png', 'The greatest quality,\r\nPlease buy you won&#039;t be dissapointed', 1, '28:2:5,30:3:2,32:5:0,40:5:2', 0),
(23, 'niks', '28.99', '30.99', 9, '7', '/eCommerce/images/products/735cd2351519ad141cae5007c589475a.jpg', 'nous somme terroris&eacute; et  masacr&eacute;', 1, 'small:2:2', 1),
(24, 'bugatty', '10.99', '12.99', 3, '17', '/eCommerce/images/products/5d75527f12cdf23472ee6eb78c0fd1c4.png', 'bana africa', 1, 'extralarge:10:4,medium:15:5', 1),
(25, 'range over', '5.77', '7.99', 2, '52', '/eCommerce/images/products/2ce1b25c47a43b7e1222abad934d7c61.png', 'tamtam', 1, 'suka na bord:3:6,elengi:2:15', 1),
(26, 'likemba', '600.00', '800.00', 3, '8', '/eCommerce/images/products/6a9879d8b6cc685959287c3d80683c0c.jpg', 'acheter vou ne serais pas decu', 1, 'boya ebele:2,balansoire:2', 1),
(27, 'Levis Jean  ', '45.99', '55.99', 2, '10', '/eCommerce/images/products/6701f5243826a3ddaf94388ded453a87.png', 'Look at  these beatiful jeans', 1, 'small:2:12,extra-small:0:5,medium:5:5,large:5:8', 0),
(28, 'Short', '54.99', '65.99', 3, '18', '/eCommerce/images/products/1c9a209288bcbc5eb3b6d19a7859eddc.jpg', 'Go find your item', 1, '35:3:3,36:1:7,37:3:7,38:3:6', 0),
(29, 'movie', '31.99', '35.99', 9, '16', '/eCommerce/images/products/286afe23694be1a14b57699e6e96fa70.jpg', 'A great movie I&#039;ve never seen before', 1, '2:2:13,2:2:3', 1),
(30, 'kanga', '279.99', '289.99', 3, '16', '/eCommerce/images/products/7fd9552607b8f9e10cde02cd085cd807.jpg', 'wana suka', 1, '28:4:3,32:4:2', 1),
(31, 'Tommy', '1199.99', '2000.00', 9, '59', '/eCommerce/images/products/3b1a91a65e5b7b038377ec97bde4c1e8.png', 'Buy the nicest short', 1, '40:0:3,42:5:4', 0),
(32, 'Cullote', '77.56', '96.44', 1, '8', '/eCommerce/images/products/b0f10bf79c5ed206dd69958077e1e1b4.jpg', '', 1, '28:3:5,32:3:8', 0),
(35, 'test', '10.99', '15.99', 1, '16', '/eCommerce/images/products/57c31e7b4732baecf3732398c4ed7345.gif,/eCommerce/images/products/2d3a1b0bc8748d34c42d36b74299bf4d.jpg,/eCommerce/images/products/4d416a1539719b05793bb498c3354ffb.png,/eCommerce/images/products/5124659fafd65203cf907976cf731c89.jpg,/eCommerce/images/products/7ff56460b03971a3db5158d99c6642df.png,/eCommerce/images/products/0d16823c2958ca9a8c389cadb74c0708.jpg', 'Multiple upload', 1, 'small:3:4', 1),
(36, 'Jacket', '5.99', '10.45', 12, '14', '/eCommerce/images/products/d74dffda58cabc8d4a043727d88326cb.jpg', 'This is good for winter...', 1, 'medium:0:,small:-27:', 0);

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` int(11) NOT NULL,
  `charge_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `cart_id` int(11) NOT NULL,
  `full_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(175) COLLATE utf8_unicode_ci NOT NULL,
  `street` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `street2` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `city` varchar(175) COLLATE utf8_unicode_ci NOT NULL,
  `state` varchar(175) COLLATE utf8_unicode_ci NOT NULL,
  `zip_code` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `country` varchar(175) COLLATE utf8_unicode_ci NOT NULL,
  `sub_total` decimal(10,0) NOT NULL,
  `tax` decimal(10,0) NOT NULL,
  `grand_total` decimal(10,0) NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `txn_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `txn_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `charge_id`, `cart_id`, `full_name`, `email`, `street`, `street2`, `city`, `state`, `zip_code`, `country`, `sub_total`, `tax`, `grand_total`, `description`, `txn_type`, `txn_date`) VALUES
(13, '', 19, 'Gevyn Gibango', 'gfocus0504@gmail.com', '66 Alsatian Road', '', 'Midrand', 'Midrand', '0083', 'South Africa', '214', '30', '243', '6items from Daniella&#039;s Shop.', '', '2018-01-09 22:23:48'),
(26, '', 24, 'papy ndambo', 'pius@fmlly.com', 'av mbele 9', '', 'Mongafula', 'Mongafula', '0089', 'DR Congo', '78', '11', '88', '1item from Daniella&#039;s Shop.', '', '2018-01-10 00:14:34'),
(29, '', 25, 'Jeremy Gibango', 'andre@ville.cd', '66 Alsatian Road', '', 'Midrand', 'Midrand', '0083', 'South Africa', '280', '39', '319', '1item from Daniella&#039;s Shop.', '', '2018-01-10 00:26:52'),
(31, '', 26, 'Sam Gibango', 'ndunde@gibangolyrics.com', '66 Alsatian Road', '', 'Tswana', 'Pretoria', '0083', 'South Africa', '280', '39', '319', '1item from Daniella&#039;s Shop.', '', '2018-01-10 00:27:40'),
(34, '', 27, 'Priscilla Gibango Matondo', 'prsci@work.com', '61 Blouvalk NinaPark Estate', '', 'Tswane', 'Pretoria', '0156', 'South Africa', '247', '35', '282', '4items from Daniella&#039;s Shop.', '', '2018-01-10 11:29:06'),
(35, '', 28, 'Rebecca Engone', 'rebecca@gmail.com', '502 Becket Street', '', 'Tswane', 'Pretoria', '0083', 'South Africa', '233', '33', '265', '3items from Daniella&#039;s Shop.', '', '2018-01-10 11:42:43'),
(36, '', 32, 'Lydia Gibango', 'lg@gmail.com', '61 blouvalk Ninapark', '', 'Tswane', 'Pretoria', '0156', 'South Africa', '22', '3', '25', '2items from Daniella&#039;s Shop.', '', '2018-01-11 00:46:12'),
(37, '', 32, 'Lydia Gibango', 'lg@gmail.com', '61 blouvalk Ninapark', '', 'Tswane', 'Pretoria', '0156', 'South Africa', '22', '3', '25', '2items from Daniella&#039;s Shop.', '', '2018-01-11 15:38:08'),
(38, '', 33, 'Sarah Kinsala', 'sk@france.fr', 'Charles Roi', '', 'Paris', 'Paris', '1236', 'France', '40', '6', '46', '2items from Daniella&#039;s Shop.', '', '2018-01-11 15:48:20'),
(39, '', 34, 'Priscilla Gibango Matondo', 'ndunde@gibangolyrics.com', '61 Blouvalk NinaPark Estate', '', 'Tswane', 'Pretoria', '0089', 'South Africa', '124', '17', '141', '2items from Daniella&#039;s Shop.', '', '2018-01-11 16:00:35'),
(40, '', 35, 'Jeremy Gibango', 'jeremy@gmail.com', '61 blouvalk Ninapark', '', 'Tswana', 'Pretoria', '0156', 'South Africa', '78', '11', '88', '1item from Daniella&#039;s Shop.', '', '2018-01-11 16:17:07'),
(41, '', 36, 'Lydia Gibango', 'lg@gmail.com', '458 Paul Kruger', '61 Blouvalk Ninapark Estate', 'Tswana', 'Pretoria', '0083', 'South Africa', '6', '1', '7', '1item from Daniella&#039;s Shop.', '', '2018-01-11 20:19:14'),
(42, '', 37, 'papy ndambo', 'pius@fmlly.com', 'av mbele 9', '', 'Mongafula', 'Mongafula', '1236', 'DR Congo', '221', '31', '252', '8items from Daniella&#039;s Shop.', '', '2018-01-11 21:37:56'),
(43, '', 38, 'Priscilla Gibango Matondo', 'prsci@work.com', '61 Blouvalk NinaPark Estate', '', 'Tswane', 'Pretoria', '0156', 'South Africa', '84', '12', '96', '14items from Daniella&#039;s Shop.', '', '2018-01-12 00:53:40'),
(44, '', 38, 'Priscilla Gibango Matondo', 'prsci@work.com', '61 Blouvalk NinaPark Estate', '', 'Tswane', 'Pretoria', '0156', 'South Africa', '84', '12', '96', '14items from Daniella&#039;s Shop.', '', '2018-01-12 00:55:27'),
(45, '', 38, 'Priscilla Gibango Matondo', 'prsci@work.com', '61 Blouvalk NinaPark Estate', '', 'Tswane', 'Pretoria', '0156', 'South Africa', '84', '12', '96', '14items from Daniella&#039;s Shop.', '', '2018-01-12 00:55:36'),
(46, '', 39, 'Rebecca Engone', 'rebecca@gmail.com', '502 Becket Street', '', 'Tswane', 'Pretoria', '0083', 'South Africa', '110', '15', '125', '2items from Daniella&#039;s Shop.', '', '2018-01-12 01:05:12'),
(47, '', 0, '', '', '', '', '', '', '', '', '0', '0', '0', '', '', '2018-01-13 13:44:10');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `full_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(175) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `join_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_login` datetime NOT NULL,
  `permissions` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `image` text COLLATE utf8_unicode_ci NOT NULL,
  `featured` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `full_name`, `email`, `password`, `join_date`, `last_login`, `permissions`, `image`, `featured`) VALUES
(13, 'Gedeon Ndunde Gibango', 'ndunde@gibangolyrics.com', '$2y$10$R5yTKsIZYj3PFEYOUq1Wp.7v0OX5F2TP6b9vjXHTdeUn0Tb.jW6Vm', '2017-12-24 21:30:34', '2018-01-11 22:34:48', 'admin,editor', '/hdlyric/images/users/5bb2404b934609aef4bba125232096b5.jpg', 1),
(16, 'Iscou Bidimbu', 'iscou@gibangolyrics.com', '$2y$10$H/MzxzpUG/zom/C5hJ7FMOWIydWrBwuHJ61HPHRNDTfXCGIo4Fj3W', '2018-01-04 14:46:15', '2018-01-11 16:58:01', 'editor', '/hdlyric/images/users/218d93b9eb3e78d8f9440befa943976d.jpg', 1),
(18, 'Jeremy Kantin Gibango', 'jk@ecomerce.com', '$2y$10$ZBe4gQKO99wHHUNeYA7PKuylFp9Mh.NNV3Qd6qvTZbnvZRv..ay7m', '2018-01-05 17:29:22', '2018-01-05 17:15:27', 'editor', '', 1),
(19, 'Andre kimbuta', 'andre@ville.cda', '$2y$10$W0zcvOhnBS8YUJvw90GGQ.vcwDnc4HaeH4PDhUlLZqFkI3aNOZLxS', '2018-01-05 21:28:05', '2018-01-05 21:08:53', 'editor', '', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `brand`
--
ALTER TABLE `brand`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `brand`
--
ALTER TABLE `brand`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;
--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;
--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;
--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
