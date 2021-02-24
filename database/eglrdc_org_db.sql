-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: eglrdc.org.mysql.service.one.com:3306
-- Generation Time: Oct 06, 2019 at 03:42 PM
-- Server version: 10.3.17-MariaDB-1:10.3.17+maria~bionic
-- PHP Version: 7.2.19-0ubuntu0.18.04.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `eglrdc_org_db`
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
(15, 'HP'),
(16, 'Asus'),
(17, 'Nike'),
(18, 'Levi&#039;s'),
(19, 'Polo'),
(20, 'Zara'),
(21, 'H&amp;M'),
(22, 'Addidas'),
(23, 'Continental'),
(24, 'Bridgestone'),
(25, 'Microsoft'),
(26, 'Avast'),
(27, 'Adobe'),
(30, 'Yamaha'),
(31, 'Suzuki'),
(32, 'BMW'),
(34, 'Samsung'),
(35, 'Apple'),
(36, 'Shell'),
(37, 'Shield'),
(38, 'Meguiar'),
(39, 'Karcher'),
(40, 'Mucc-Off');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `items` text COLLATE utf8_unicode_ci NOT NULL,
  `expire_date` datetime NOT NULL,
  `paid` tinyint(4) NOT NULL DEFAULT 0,
  `shipped` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `items`, `expire_date`, `paid`, `shipped`) VALUES
(55, '[{\"id\":\"42\",\"size\":\"225/40R18\",\"quantity\":\"2\"}]', '2019-11-02 21:59:37', 1, 0),
(57, '[{\"id\":\"42\",\"size\":\"225/40R18\",\"quantity\":6}]', '2019-11-02 23:50:55', 1, 0),
(64, '[{\"id\":\"45\",\"size\":\"220/50R18\",\"quantity\":\"3\"},{\"id\":\"55\",\"size\":\"S\",\"quantity\":\"2\"}]', '2019-11-04 00:01:27', 0, 0),
(66, '[{\"id\":\"83\",\"size\":\"\",\"quantity\":\"1\"},{\"id\":\"81\",\"size\":\"\",\"quantity\":\"2\"},{\"id\":\"51\",\"size\":\"\",\"quantity\":\"1\"},{\"id\":\"42\",\"size\":\"\",\"quantity\":\"2\"}]', '2019-11-04 12:01:51', 1, 0),
(67, '[{\"id\":\"45\",\"size\":\"\",\"quantity\":\"2\"}]', '2019-11-04 12:20:35', 1, 0),
(68, '[{\"id\":\"55\",\"size\":\"S\",\"quantity\":\"2\"}]', '2019-11-04 12:22:49', 1, 0),
(69, '[{\"id\":\"76\",\"size\":\"5\",\"quantity\":\"1\"}]', '2019-11-04 12:29:27', 1, 0),
(70, '[{\"id\":\"71\",\"size\":\"6\",\"quantity\":\"3\"}]', '2019-11-04 12:31:10', 1, 0),
(71, '[{\"id\":\"124\",\"size\":\"\",\"quantity\":\"1\"}]', '2019-11-04 16:28:59', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `category` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `parent` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `category`, `parent`) VALUES
(1, 'Cars &amp; Motorcycles', 0),
(2, 'Electronics &amp; Computers', 0),
(3, 'Clothing', 0),
(30, 'Home decor', 29),
(60, 'Shoes', 0),
(61, 'Wheels &amp; Tires', 1),
(62, 'Motorcycle Helmets ', 1),
(63, 'Laptops', 2),
(64, 'Computers', 2),
(65, 'Men', 3),
(66, 'Woman', 3),
(67, 'Men', 60),
(68, 'Woman', 60),
(69, 'Care &amp; Cleaning', 1),
(72, 'Softwares', 2),
(74, 'Wearable Tech.', 2),
(76, 'Kids', 3),
(78, 'Kids', 60);

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `fd_id` int(11) NOT NULL,
  `fd_name` varchar(100) NOT NULL,
  `fd_message` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `feedback`
--

INSERT INTO `feedback` (`fd_id`, `fd_name`, `fd_message`) VALUES
(2, 'Mosunmola Phebian Adeyinka Olubo', 'I love love this site, everything I need in one website? That’s lekker.'),
(3, 'David', 'The site is easy to use and straight forward'),
(6, 'Kim', 'I love your service, I got my item a day after I ordered even when it says 7days.'),
(7, 'Adorable', 'I got the best kids shoes for my niece’s birthday, thank you.'),
(8, 'Jo', 'Nice site and easy to use'),
(9, 'juju', 'good service keep it up '),
(10, 'bintu', 'The website is good but I feel like something is missing');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `list_price` decimal(10,2) DEFAULT NULL,
  `brand` int(11) NOT NULL,
  `categories` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `image` text COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `featured` tinyint(4) NOT NULL DEFAULT 0,
  `sizes` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `deleted` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `title`, `price`, `list_price`, `brand`, `categories`, `image`, `description`, `featured`, `sizes`, `deleted`) VALUES
(38, 'product1', '300.00', '350.00', 3, '66', '/eCommerce/images/products/7d9c5fc0f8bbd0a4e0b7cca5f4da5ab7.jpg,/eCommerce/images/products/9543fc6c51364e17a5cf5a9eb4ae6403.jpg', 'na', 1, 'Large:15:20', 0),
(39, 'Dress', '250.00', '300.00', 21, '66', '/eCommerce/images/products/680c2c8b8b86c0b4b7661beceadc27cb.jpg', 'na', 1, 'S:20:20,M:20:20,L:20:20,XL:20:20', 0),
(42, 'Continental Sport Contact 5 SUV', '1000.00', '1500.00', 23, '61', '/eCommerce/images/products/24faf32503a9f9c7298eb57dd235eb25.jpg', 'Substantial road noise reduction for a smooth and quiet everyday ride.\r\nExcellent wet braking performance.\r\nEnhanced snow and wet traction for better driving safety.', 1, '225/40R18:278:300,195/65R15:200:300,265/65HR17:250:400', 0),
(45, 'ContiCrossContact&trade; AT', '2500.00', '3000.00', 23, '61', '/eCommerce/images/products/2079034a6b8cae66235b2643b9cc21e1.png', 'Especially good directional stability and smooth running performance\r\nExceptional braking and traction performance on wet and dry road surfaces\r\nEspecially good directional stability and smooth running performance', 1, '195/65R15:150:300,220/50R18:120:300,260/80R15:200:300', 0),
(46, 'Suzuki Intruder 150 Helmet', '1200.00', '1500.00', 31, '62', '/eCommerce/images/products/8863ca87cc918a228277359e35cd5c43.jpg', '', 1, '', 0),
(47, 'SHOE ADIDAS KIDS', '450.00', '500.00', 22, '78', '/eCommerce/images/products/c19ffea9477cee18ff296b8c64db2cf2.jpg', 'SHOE ADIDAS KIDS BA7458 HIGH WHITE SPORT BLACK WITH RIPS', 1, '5:200:300,4:148:200,3:120:373,6:123:200', 0),
(48, 'Dettagli su Bambini Adidas Stan Smith', '500.00', '650.00', 22, '78', '/eCommerce/images/products/b8dd5f7254243e5fda86dc52dfced7f1.jpg', 'Dettagli su Bambini Adidas Stan Smith Cf TD 3-9 Bianco Verde Kids- mostra il titolo originale', 1, '5:20:100,4:120:200', 0),
(49, 'conti-road attack 3', '1500.00', '1750.00', 23, '61', '/eCommerce/images/products/e0cd06a0f9b6a98b8cfaaf9a0e72a5c2.png', '', 1, '180/60:200:300,160/40:300:600', 0),
(50, 'Nike Pico 4', '449.99', '500.00', 17, '78', '/eCommerce/images/products/302b49227b4d2f086f1070b7624ff52c.jpg', 'The Nike Pico 4 (1.5&ndash;9.5) Baby and Toddler Girls&#039; Shoe has adjustable straps and a built-in kick-off groove for a comfortable fit that&#039;s easy to put on and take off.\r\n\r\nColour Shown: White/Spark/Prism Pink\r\nStyle: 454478-103', 1, '4:12:30', 0),
(51, 'ContiTrailAttack 3', '2000.00', '0.00', 23, '61', '/eCommerce/images/products/ff024afc255a9e31aa19e2cd01f674ad.png', '', 1, '180/40:600:700,150/65:197:200', 0),
(52, 'ContiSportAttack 3', '3000.00', '0.00', 23, '61', '/eCommerce/images/products/f295ebcc3067d4a255d7a86756a407d8.png', '', 1, '110/70:300:400,120/60:600:600', 0),
(53, 'Balmain x H&amp;M Green Sequin Plunge Mini Dress', '500.00', '700.00', 21, '66', '/eCommerce/images/products/e9e7b4bda149d0e6b6ac7eb70850e904.jpg', '', 1, 'M:18:50,S:10:24', 0),
(54, 'Adidas black Tracksuit UPS2295', '899.99', '949.99', 22, '65', '/eCommerce/images/products/8cb95348d22015b387857210cba3b371.jpg', 'Adidas Tracksuit Men Manchester United Football Club Training Kit Track Jacket Size Vintage Authentic Ac Milan Soccer Pants Black Red', 1, '32:123:200,31:8:10', 0),
(55, 'Shamrock Adidas T-shirt', '450.49', '672.49', 22, '65', '/eCommerce/images/products/91864d27cc4cf9f203c05a9a40a9269f.jpg', 'Are you looking for a funny and special St. Patrick&#039;s Day outfits. This Canadiens Carey Price St. Patrick&#039;s Day Green Lucky Shamrock Adidas T-shirt', 1, 'M:10:15,S:1:6,XL:12:16', 0),
(56, 'Formal shirt', '349.99', '450.00', 42, '65', '/eCommerce/images/products/f6ecc9edfb6c529741a5a1c726f4d278.jpg', 'Long Sleeve Formal Shirt', 1, 's:10:20,M:32:60,L:46:50', 0),
(57, 'Formal shirt', '450.49', '600.00', 42, '65', '/eCommerce/images/products/2b5b53f5025fdfee5b07ba6ee0c23789.jpg', 'Full Sleeves Designer Formal Shirt', 1, 'M:12:33', 0),
(58, 'Slim Fit Wedding Suits', '1149.99', '1500.99', 18, '65', '/eCommerce/images/products/ff646dc2873eca0df3407fa04cd09ba9.jpg', 'Slim Fit Wedding Suits For Men Shawl Collar 3 Pieces Burgundy Suit Mens Royal Blue', 1, '', 0),
(59, 'Tuxedo', '3500.99', '4000.00', 18, '65', '/eCommerce/images/products/9d2dbf497dee29fb8be2233a7fdc3e31.jpg', 'Tuxedo wedding party wedding reception parties presentation of formal cheap size order Black Black tuxedo03', 1, 'small:18:25,XL:20:25,large:20:25,XXL:20:25', 0),
(60, 'blazer', '1500.99', '2000.00', 42, '65', '/eCommerce/images/products/5ff8149079d240696c3ed0de9839d6ac.jpg', 'This Black Leather Blazer for Men is stylishly constructed and comes with unique options to make you look trendy', 1, '', 0),
(61, 'kids clothes', '99.99', '120.49', 21, '76', '/eCommerce/images/products/de25affb257194093c2d0aa9c0c7b4d1.jpg', 'Summer kids clothing', 1, 'M:200:500', 0),
(62, 'Jumpsuit kids', '120.99', '230.99', 22, '76', '/eCommerce/images/products/3a8405537ea1e3970f1f0d9ede8cf910.jpg', 'Price the whole outfit', 1, '', 0),
(63, 'adidas for kids', '500.49', '550.99', 22, '76', '/eCommerce/images/products/f2404e6ebb5b8008ad762f296b3bf9bc.jpg', 'Baby jacket and shoes. Price for all outfits.', 1, '', 0),
(64, 'nike kids', '89.99', '99.99', 17, '76', '/eCommerce/images/products/770eaf9304cbd5a941901c32393ac268.jpg', 'Nike kids jacket navy white', 1, '', 0),
(65, 'Nike jackets', '210.99', '300.00', 17, '76', '/eCommerce/images/products/4e132e7b338c1ef899a2cbc87209d0b4.jpg', 'Kids Nike Jackets', 1, '', 0),
(66, 'Sleeveless jersey dress', '210.00', '300.00', 21, '76', '/eCommerce/images/products/caf9b9f7ca9a8709ce3f99301b0c076d.jpg', 'Sleeveless dress in printed cotton jersey with a gathered seam at the waist and flared skirt.', 1, '', 0),
(67, 'Dresses &amp; Skirts For Girls', '459.00', '500.00', 21, '76', '/eCommerce/images/products/516e3053bae37918a3c3b7100f3372ed.jpg', 'Dresses &amp; Skirts For Girls | H&amp;M GB', 1, '', 0),
(68, '2-pack Chino Shorts', '123.49', '200.00', 21, '76', '/eCommerce/images/products/969fe08e3a32e5aee5322f580426a576.jpg', '2-pack Chino Shorts', 1, '', 0),
(69, 'Adidas sneakers', '999.99', '1200.99', 22, '67', '/eCommerce/images/products/154ad49aa9a0a880170d5e0942a678d5.jpg', 'Excellent condition adidas equipment ADV. worn one time only. Colors are grey and black. Super comfy just have too many shoes.', 1, '6:31:70,7:20:100,8:4:25', 0),
(70, 'adidas Originals Samoa ', '899.99', '999.99', 22, '67', '/eCommerce/images/products/87de049dd65f4af85c7e7aa1c640034c.jpg', 'Shop the adidas Originals Samoa Sneakers Mens White Black on the Studio 88 site.', 1, '7:45:100,6:12:120,7.5:120:300,8:30:120', 0),
(71, 'adidas superstar black and white', '899.99', '999.99', 22, '67', '/eCommerce/images/products/099d0e81598f3a3241f4c960834672c4.jpg', 'adidas superstar black and white', 1, '4:45:100,9:3:10,6:31:212,7:12:120', 0),
(72, 'Nike Air Force ', '1149.99', '1200.00', 17, '67', '/eCommerce/images/products/8ee9e75fcdde3d33faadb27354d942cb.jpg', 'Nike Air Force 1 Shoes Score an iconic look with the Nike&reg; Air Force One fashion sneakers. Designed for performance or casual', 1, '7:120:240,8:5:12,6:40:120', 0),
(73, 'Nike Air Max 270 Big Kids&#039; Shoe', '229.89', '250.99', 17, '78', '/eCommerce/images/products/2e5f092e58cc049d39c32e101dea9802.jpg', '', 1, '3:40:100,4:30:123', 0),
(74, 'Nike Shox', '899.99', '900.00', 17, '68', '/eCommerce/images/products/080cf0634da6d466dc29fdf973c94f23.jpg', 'A thoroughly modern take on a 1970&#039;s running classic, the Nike Shox Deliver women&#039;s Shoe lives up to its name with plush cushioning and a sleek ...', 1, '4:30:122,5:12:100', 0),
(75, 'Nike Air Max 270', '599.99', '600.00', 17, '68', '/eCommerce/images/products/48f10b39737ea2eae4ab7e99c682135f.jpeg', 'Nike Air Max 270 Pink Womens Running Shoes ', 1, '4:30:122,5:12:100', 0),
(76, 'adidas Originals POD-S3.1', '550.49', '600.00', 22, '68', '/eCommerce/images/products/37dacebc91fd1204389062f3d2aa3466.jpg', '', 1, '5:11:1212,7:121:134', 0),
(77, 'Women&#039;s Adidas Ultimafusion Slip-On Sneakers', '550.99', '600.00', 22, '68', '/eCommerce/images/products/eec5ccb35a079e7008d39bbe94d9c34b.jpg', 'Women&#039;s Adidas Ultimafusion Slip-On Sneakers', 1, '5:40:100,4:20:100', 0),
(78, 'Adidas Alpha Bounce', '450.99', '500.00', 22, '68', '/eCommerce/images/products/f93f0c92da07dbbad9ecd0e731a52858.jpg', 'Shop your adidas shoes online in Philippines. See online reviews and find discounts. Shopee Guarantee ensures safety in buying adidas shoes online', 1, '5:40:100,4:20:100', 0),
(79, 'Asus X552CL-SX019D', '17000.00', '0.00', 16, '63', '/eCommerce/images/products/a196eade130620d97507f7eb8a20b8d5.jpg', ' Core i3 3rd Gen / 4 GB / 500 GB / DOS / 1 GB', 1, '', 0),
(80, 'Asus VivoBook Max X441UR', '31000.00', '35000.00', 16, '63', '/eCommerce/images/products/694763f01a22da95bd147241e41341c2.jpg', 'It comes with a 14 inch HD glare panel display, 500GB or 1TB HDD, powers by Intel Core i3/i5/i7 processor and runs on Windows 10 Home/10 Pro software.', 1, '', 0),
(81, 'Asus X540 ', '20000.00', '0.00', 16, '63', '/eCommerce/images/products/d377aaba30084aeb92750c423ca26a92.jpg', 'Intel Celeron N3350 processor.\r\nDual core processor.\r\n1.1GHz processor speed.\r\n4GB RAM.\r\n1TB.\r\nHard drive speed 5400RPM.\r\nMicrosoft Windows 10.', 1, ':-4:', 0),
(82, 'HP Laptop - 15z', '10000.00', '12000.00', 15, '63', '/eCommerce/images/products/35f53fcb0daf80e3ab93057610e577be.png', 'Windows 10 Home 64\r\nAMD A9-9425 Dual-Core\r\nAMD Radeon&trade; R5 Graphics\r\n8 GB memory; 1 TB HDD storage', 1, '', 0),
(83, 'HP Laptop - 17z touch optional', '19000.00', '22000.00', 15, '63', '/eCommerce/images/products/3304285bcdf8f6327c17e006935080e0.png', 'Windows 10 Home 64\r\nAMD A9-9425 Dual-Core\r\nAMD Radeon&trade; R5 Graphics\r\n8 GB memory; 1 TB HDD storage', 1, ':-2:', 0),
(84, 'HP EliteBook x360 1030 G2 Notebook PC', '32000.00', '0.00', 15, '63', '/eCommerce/images/products/f2d63a6258bada9de0819875ec952cb2.png', 'Windows 10 Pro 64\r\n7th Generation Intel&reg; Core&trade; i7 processor\r\n8 GB memory; 128 GB SSD storage\r\n13.3&quot; diagonal FHD touch display', 1, '', 0),
(85, 'HP ProBook x360 440 G1 Notebook PC', '8000.00', '9500.00', 15, '63', '/eCommerce/images/products/ea9d20042e85b50deaf19ea3d5d16e10.png', 'Windows 10 Pro 64\r\nIntel&reg; Celeron&reg; processor\r\n8 GB memory; 256 GB NVMe SSD\r\n14&quot; FHD (1920x1080) display', 1, '', 0),
(86, 'Apple MacBook Air 2018', '14000.00', '17500.00', 35, '63', '/eCommerce/images/products/1ad4c8362d34e396a69f087e4f601c2b.jpg', 'Available in silver, space grey and gold, the new thinner and lighter MacBook Air features a brilliant Retina display, Touch ID, the latest-generation keyboard and a Force Touch trackpad. The iconic wedge is created from 100 per cent recycled aluminium, making it the greenest Mac ever. ', 1, '', 0),
(87, 'Apple MacBook Pro 2019', '45000.00', '50000.00', 35, '63', '/eCommerce/images/products/18fd7691f702779b96504177b1d5a480.jpg', 'The new MacBook Pro has 8-core Intel Core processors for up to 70 per cent faster compute speeds. A brilliant and colorful Retina display featuring True Tone technology for a more true-to-life viewing experience. And the versatile Touch Bar for more ways to be productive. ', 1, '', 0),
(88, 'Apple Macbook Pro Touch Bar', '21000.00', '0.00', 35, '63', '/eCommerce/images/products/b7eb40940f6d6e41e7897fbbca0d73bf.jpg', 'Touch Bar - Silver\r\nRetina Display\r\n128GB SSD\r\n1.4GHz quad-core Intel Core i5\r\nThunderbolt 3\r\nTrue Tone Technology\r\n8GB of 2133MHz LPDDR3 onboard memory', 1, '', 0),
(89, 'ASUS TUF Gaming i5 GTX1050 4GB Notebook', '21000.00', '0.00', 16, '63', '/eCommerce/images/products/1721fa62404977b2a6e2ec5477bbbbbf.jpg', 'FHD 15.6-Inch Anti-Glare Display\r\nIntel&reg; Core&trade; i5-8300H Processor\r\n8GB RAM &amp; 1TB Hard Drive\r\nNVIDIA GeForce GTX1050 4GB Graphics\r\nWindows 10 Home', 1, '', 0),
(90, 'MacBook Air 1.6GHz dual-core Intel Core i5', '13000.00', '15500.00', 35, '63', '/eCommerce/images/products/b3ded8239f6ac88841b7515b785c5af4.jpeg', 'The new thinner and lighter MacBook Air features a stunning Retina display, Touch ID, the latest Apple-designed keyboard and a Force Touch trackpad &mdash; all housed in an iconic wedge design made from 100% recycled aluminium. And with all-day battery life, MacBook Air is your perfectly portable, do-it-all notebook.', 1, '', 0),
(91, 'HP DESKTOP COMPU', '4000.00', '0.00', 15, '64', '/eCommerce/images/products/4972e2afbaba01793dd4a252c1a9a097.jpg', 'Chipset-	Intel H110\r\nProcessor-	i5\r\nDisplay-	20 Inches\r\nPower-	450 W\r\nMemory Size-	1000 GB\r\nColor-	Black\r\nMinimum Order Quantity	10 Piece', 1, '', 0),
(92, 'HP 500B Intel Pentium Dual Core Desktop PC + 19&quot; Monitor', '2500.00', '0.00', 15, '64', '/eCommerce/images/products/825ab9df7cd27b9fdde0d0b2b2d49b22.png', 'Intel Pentium Duo Core 3.2GHz\r\nTower\r\n4GB DDR3 memory\r\n500GB SATA @7200RPM HDD\r\n6 x USB 2.0 ports\r\nDVD Optical Drive\r\n17&rdquo; LCD monitor\r\nWindows 7 Professional\r\n1 Year carry-warranty\r\nKeyboard, Mouse &amp; Power cables included', 1, '', 0),
(93, 'Desktop Computers HP Windows 10 Tower PC', '3600.00', '0.00', 15, '64', '/eCommerce/images/products/23b4cf13eec6f699b43162ada14d4af2.jpeg', 'Intel 2.13GHz Processor 4GB Ram 500GB Hard Drive DVD Wifi with a 17&quot; LCD', 1, '', 0),
(94, 'HP EliteOne 800', '8000.00', '9500.00', 15, '64', '/eCommerce/images/products/8813fe72b46d7fe58f65f62d0daad406.jpg', '23.8-Inch FHD Touch Display\r\nIntel Core i5 8250U Processor\r\n8GB RAM Plus 1TB Hard Drive\r\nNVIDIA GeForce MX110 2GB Graphics\r\nWindows 10 home', 1, '', 0),
(95, 'HP EliteOne 800 G5 All-in-One', '25000.00', '0.00', 15, '64', '/eCommerce/images/products/ce893ddb408f3c1796089ac664479e7a.jpg', '9th Gen Intel Core i5-9500 CPU (9M Cache, 3.00 GHz, up to 4.40 GHz, 6 cores)\r\n8GB DDR4 2666MHz RAM (1 x 8GB, 1 slot free, 32GB Max)\r\n256GB M.2 PCIe NVMe Solid State Drive\r\n23.8-inch Full HD IPS LED 250 nit Touchscreen Display (1920 x 1080)\r\nIntel UHD Graphics 630\r\nWindows 10 Pro 64-Bit', 1, '', 0),
(96, 'HP EliteOne 800 G4', '23000.00', '0.00', 15, '64', '/eCommerce/images/products/ba741121229c24719ccda22ea370ea18.jpg', 'Core i7 8700 3.2 GHz - 8 GB - 2 TB - LED 23.8&quot;', 1, '', 0),
(97, 'Apple ME086LL/A 21.5', '32000.00', '0.00', 35, '64', '/eCommerce/images/products/1d18e4f9761c985beeaf0c06103aae33.jpg', '21.5-inch (1920 x 1080) LED Display\r\nIntel Core i5-4570R Processor (Quad-Core, 2.7GHz, 4MB Cache)\r\n8GB DDR3 Memory\r\n1TB (5400RPM) SATA Hard Disk Drive (HDD)\r\nDedicated Intel Iris Graphics 5200 (0.1MB Dedicated Video Memory)\r\n4 x USB 3.0, 1 x Microphone-in\r\nWireless Keyboard and Wireless Mouse\r\n1MP Webcam\r\n10/100/1000 Gigabit Ethernet, 802.11AACBGN and Bluetooth 4.0 + HS\r\n170W Power Supply\r\nApple Mac OS X 10.8 Operating System\r\n17.7&quot; x 20.8&quot; x 6.9&quot; (HxWxD); 12.5lbs', 1, '', 0),
(98, 'ASUS Personal Computer GeForce', '16000.00', '0.00', 16, '64', '/eCommerce/images/products/4dde8cab56bf6eb34074c8de475f605b.jpg', 'Asus GTX 1650 4GB GDDR5 Graphics Card\r\nIntel Core i7 8700 3.20GHz LGA 1151\r\nAsus Motherboard B360M A PRIME 1151 DDR4\r\nKingston 8GB 2666MHz DDR4 CL19 DIMM\r\nKingston 480GB SSDNOW UV500 SATA3 2.5&quot;\r\nCooler Master Case K500L ATX Black Red\r\nCooler Master MWE 450W PSU', 1, '', 0),
(99, 'Gaming Desktop Core i7 8700 8GB 480GB SSD GTX 1650 6GB ', '20000.00', '25000.00', 16, '64', '/eCommerce/images/products/81d45423b2ca3ff2eb508d8c69575a1b.jpg', 'Asus GTX 1650 4GB GDDR5 Graphics Card\r\nIntel Core i7 8700 3.20GHz LGA 1151\r\nAsus Motherboard B360M A PRIME 1151 DDR4\r\nKingston 8GB 2666MHz DDR4 CL19 DIMM\r\nKingston 480GB SSDNOW UV500 SATA3 2.5&quot;\r\nCooler Master Case K500L ATX Black Red\r\nCooler Master MWE 450W PSU\r\nISO9001: 2000 Quality Assurance\r\nNo OS', 1, '', 0),
(100, 'HP Pavilion Gaming Desktop i5-8400', '18000.00', '20000.00', 15, '64', '/eCommerce/images/products/d7cb17087064706476dd6ced579e639d.jpg', 'Powerful graphics\r\n- Get lost in fluid gameplay and smooth visuals. With up to NVIDIA&reg; GeForce&reg; GTX 1060 or AMD&reg; Radeon&trade; RX 580 discrete graphics, lag and slowdowns are a thing of the past.\r\n\r\nHigh-speed performance\r\n- Unleash the full potential of your PC with an either an Intel&reg; Core&trade; processor or an AMD&reg; Ryzen&trade; processor and up to 16 GB of DDR4 RAM.\r\n\r\nBold, standout design\r\n- With a distinct angular bezel, brushed finishing, and green LED lighting this desktop is built to make a statement. - To complement it all, interior expansion slots let you upgrade your graphics card, memory, and more to keep performance up-to-date.', 1, '', 0),
(101, 'HP EliteOne 800 G4', '40000.00', '0.00', 15, '64', '/eCommerce/images/products/630e5cec313989ca2f3634d1d69997ee.jpg', '', 1, '', 0),
(102, 'HP ProOne 600 G3', '20000.00', '22000.00', 15, '64', '/eCommerce/images/products/54db2a976f3dce949fb5297dece91454.jpg', 'Core i5 7500 3.4 GHz - 4 GB - 500 GB - LED 21.5', 1, '', 0),
(103, 'Microsoft Office 2019 Professional Plus', '8400.00', '0.00', 25, '72', '/eCommerce/images/products/fc1e04f2a43897310427b97fc3dc071f.png', '', 1, '', 0),
(104, 'Microsoft Office 2019 Professional', '4000.00', '4500.00', 25, '72', '/eCommerce/images/products/468745c1ffc14da2cae9702a466a8e50.png', '', 1, '', 0),
(105, 'Microsoft Office 2019 Home and Student for Mac', '1400.00', '0.00', 25, '72', '/eCommerce/images/products/918f193aa25b90b7f53e9185328f08b7.png', '', 1, '', 0),
(106, 'Microsoft Office 2019 Home and Business for Mac', '2900.00', '3000.00', 25, '72', '/eCommerce/images/products/58bb858fe9ccca0ba30b0ec142439cad.png', '', 1, '', 0),
(107, 'Microsoft Office 2019 Home and Student', '1500.00', '0.00', 25, '72', '/eCommerce/images/products/28dada13d6d76ead31a2b66e9a6510be.png', '', 1, '', 0),
(108, 'ADOBE ACROBAT PRO DC', '500.00', '0.00', 27, '72', '/eCommerce/images/products/7f687b88ea36d17e77164aadacc9fcd8.png', '', 1, '', 0),
(109, 'Adobe Illustrator CC 2019', '470.00', '0.00', 27, '72', '/eCommerce/images/products/512bcbe3538005983ccba8f73f4d7e62.jpg', '', 1, '', 0),
(110, 'Adobe Premier Pro CC 2019', '500.00', '0.00', 27, '72', '/eCommerce/images/products/de4cfe8c328d21184838469a142a9241.jpg', '', 1, '', 0),
(111, 'Adobe Dreamweaver Creative Cloud Annual Subscription', '2000.00', '0.00', 27, '72', '/eCommerce/images/products/40cec72da1c3d13b1dcecb120ccc54c7.jpg', '', 1, '', 0),
(112, 'Adobe Illustrator Creative Cloud Annual Subscription', '8000.00', '0.00', 27, '72', '/eCommerce/images/products/551ee242729cde87687223e896d6f242.jpg', '', 1, '', 0),
(113, 'Avast Antivirus Software', '800.00', '0.00', 26, '72', '/eCommerce/images/products/b67703e016d9b6f60517264160e864a1.jpeg', '', 1, '', 0),
(114, 'Avast Premier 1-Year', '900.00', '0.00', 26, '72', '/eCommerce/images/products/7c4228f57778fed0bb091cc7bcb67ee4.jpg', '', 1, '', 0),
(115, 'Samsung Galaxy 46mm Watch', '7000.00', '0.00', 34, '74', '/eCommerce/images/products/5a7b740094dc0f9154cac3037990548b.jpg', '', 1, '', 0),
(116, 'Samsung Gear S3 Frontier Smartwatch', '6000.00', '0.00', 34, '74', '/eCommerce/images/products/48003f04ca779326c92686d0f0d8e0a0.jpg', '', 1, '', 0),
(117, 'Samsung Galaxy Active Smart ', '3500.00', '0.00', 34, '74', '/eCommerce/images/products/524bd6032b2753a5824cee946852a0db.jpg', '', 1, '', 0),
(118, 'Samsung Gear Fit 2 PRO Small', '3500.00', '0.00', 34, '74', '/eCommerce/images/products/80ec303aba0b409487f8de3a4dbdbc98.jpg', '', 1, '', 0),
(119, 'Samsung Fit-e Fitness Tracker', '700.00', '1200.00', 34, '74', '/eCommerce/images/products/82cffeca2c49156e83f6a5a9a24f00a4.jpg', '', 1, '', 0),
(120, 'Samsung Gear Fit 2 PRO Large', '2900.00', '0.00', 34, '74', '/eCommerce/images/products/ed919941dfb919aac6722cab1af3a33e.jpg', '', 1, '', 0),
(121, 'Samsung Fit E Activity Tracker', '689.00', '0.00', 34, '74', '/eCommerce/images/products/7d67c2dd4d84a88f33cc0f5a9dd4aa29.jpg', '', 1, '', 0),
(122, 'Samsung Gear VR', '1800.00', '2000.00', 34, '74', '/eCommerce/images/products/24d6479fb8fc359b0c15372fbc8e6eba.jpg', '', 1, '', 0),
(123, '40mm GPS Gold Aluminium Case with Pink Sand Sport Band - Series 4', '6000.00', '7500.00', 35, '74', '/eCommerce/images/products/bfef7b0e9f4625642a2bdebb3a554608.jpg', '', 1, '', 0),
(124, '38mm GPS Silver Aluminium Case with White Sport Band - Series 3', '3900.00', '4100.00', 35, '74', '/eCommerce/images/products/038ec7e9eae30a90dfac12820a433c96.jpeg', '', 1, '', 0),
(125, 'Apple Watch Series 3 42mm GPS Only Space Grey Aluminum', '4000.00', '0.00', 35, '74', '/eCommerce/images/products/5febfce07b4e151d34fbb0fc518827a0.jpg', '', 1, '', 0),
(126, 'SUZUKI ARAI DT-X HELMET', '1200.00', '0.00', 31, '62', '/eCommerce/images/products/33018f66b4466aa6b544ece07106147f.jpg', '', 1, '', 0),
(127, 'Suzuki Intruder 150 Helmet', '2000.00', '0.00', 31, '62', '/eCommerce/images/products/7b87954aab80b6dfeea99d3230301ad2.jpg', '', 1, '', 0),
(128, 'BMW Helmet Carbon GS Xplore', '1500.00', '0.00', 32, '62', '/eCommerce/images/products/f97d19c66202c28e4b305b68cbe17a0e.jpg', '', 1, '', 0),
(129, 'GS Trophy', '1300.00', '0.00', 32, '62', '/eCommerce/images/products/1ef657f26fafc84ea9dbb1fcc1d853d8.jpg', '', 1, '', 0),
(130, 'Yamaha R1', '680.00', '800.00', 30, '62', '/eCommerce/images/products/47d6e94b0255db5b327838c292c5343e.png', '', 1, '', 0),
(131, 'Yamaha YX-5 Off-Road', '1200.00', '0.00', 30, '62', '/eCommerce/images/products/b1c1d1d5de91d64cf1152547e0a01384.jpg', '', 1, '', 0),
(132, 'Yamaha Y17', '1000.00', '0.00', 30, '62', '/eCommerce/images/products/d19a6300c1e3db8fe031765d92a4a22b.jpg', '', 0, '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` int(11) NOT NULL,
  `charge_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cart_id` int(11) NOT NULL,
  `full_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(175) COLLATE utf8_unicode_ci NOT NULL,
  `street` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `street2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `city` varchar(175) COLLATE utf8_unicode_ci NOT NULL,
  `state` varchar(175) COLLATE utf8_unicode_ci NOT NULL,
  `zip_code` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `country` varchar(175) COLLATE utf8_unicode_ci NOT NULL,
  `sub_total` decimal(10,0) NOT NULL,
  `tax` decimal(10,0) NOT NULL,
  `grand_total` decimal(10,0) NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `txn_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `txn_date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `charge_id`, `cart_id`, `full_name`, `email`, `street`, `street2`, `city`, `state`, `zip_code`, `country`, `sub_total`, `tax`, `grand_total`, `description`, `txn_type`, `txn_date`) VALUES
(52, NULL, 67, 'Wayne F', 'gndundeg@gmail.com', 'alsation 44', 'useless', 'Midrand', 'Gauteng', '1235', 'South Africa', '5000', '750', '5750', '2items from MHDstore.', NULL, '2019-10-05 12:21:34'),
(53, NULL, 68, 'Ramaano', 'gndundeg@gmail.com', 'Hamilton 305', '', 'Pretoria', 'Gauteng', '0083', 'Congo Rdc', '901', '135', '1036', '2items from MHDstore.', NULL, '2019-10-05 12:23:25'),
(54, NULL, 69, 'Daniel', 'david@gmail.com', 'Lemba 42', '', 'Pretoria', 'Kinshasa', '1235', 'Nigeria', '550', '83', '633', '1item from MHDstore.', NULL, '2019-10-05 12:30:19'),
(55, NULL, 70, 'hd', 'ndunde@gibangolyrics.com', '61 BLOUVALK', '', 'Johannesburg', 'Pretoria', '0083', 'South Africa', '2700', '405', '3105', '3items from MHDstore.', NULL, '2019-10-05 12:35:13');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `full_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(175) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `join_date` datetime NOT NULL DEFAULT current_timestamp(),
  `last_login` datetime DEFAULT NULL,
  `permissions` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `image` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `featured` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `full_name`, `email`, `password`, `join_date`, `last_login`, `permissions`, `image`, `featured`) VALUES
(13, 'Gedeon Ndunde Gibango', 'ndunde@gibangolyrics.com', '$2y$10$R5yTKsIZYj3PFEYOUq1Wp.7v0OX5F2TP6b9vjXHTdeUn0Tb.jW6Vm', '2017-12-24 21:30:34', '2019-10-05 23:12:27', 'admin,editor', '/hdlyric/images/users/5bb2404b934609aef4bba125232096b5.jpg', 1),
(20, 'Victoir Mpwanga', 'vmpwanga51@gmail.com', '$2y$10$qzDvquNcwai2Q7ZvL.dWh.2rQq39mI0KcziwMsK851oz0k8V6Pawa', '2019-10-02 14:24:28', '2019-10-06 14:21:13', 'admin,editor', '', 1),
(21, 'Innocent Suta', 'suta@innocent.com', '$2y$10$CWYpBLLe4NHh85zm5mnUoO78YFAYkidBWi/1c6t0r9i6y97nKxF8G', '2019-10-04 13:40:23', '2019-10-05 16:41:15', 'admin,editor', '', 1),
(22, 'Anna Watanga', 'anna@mhdstore.com', '$2y$10$DG6AwMllDGDQyMCRWd29y.MkIK.MHffws4BbZJthkMuSeouT8CeXa', '2019-10-04 18:56:04', '2019-10-04 23:52:50', 'editor', '', 1);

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
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`fd_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cart_trans_fk` (`cart_id`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT for table `feedback`
--
ALTER TABLE `feedback`
  MODIFY `fd_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=133;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `cart_trans_fk` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
