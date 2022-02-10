-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 13, 2022 at 09:35 AM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `shgemarket`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `username`, `password`) VALUES
(1, 'admin@gmail.com', '$2y$10$rmBnmFdpbtw4DatgAogaf.uAJp.EYQs8koJ.I7ThwspQw7SVYo3ce');

-- --------------------------------------------------------

--
-- Table structure for table `business_type`
--

CREATE TABLE `business_type` (
  `id` int(11) NOT NULL,
  `type` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `business_type`
--

INSERT INTO `business_type` (`id`, `type`) VALUES
(4, 'Partnership'),
(5, 'Nonprofit corporation');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `u_id` int(11) NOT NULL,
  `total` float NOT NULL,
  `is_applied` tinyint(1) NOT NULL,
  `promo` float NOT NULL,
  `is_add_w` tinyint(1) NOT NULL,
  `wl_amt` float NOT NULL,
  `final_amt` float NOT NULL,
  `ship_fee` tinyint(1) NOT NULL,
  `belonging_city` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `cart_detail`
--

CREATE TABLE `cart_detail` (
  `id` int(11) NOT NULL,
  `cart_id` int(11) NOT NULL,
  `p_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `category` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `category`, `status`) VALUES
(8, 'Handmade Bags', 1),
(9, 'Handmade Jwellery', 1),
(10, 'Decorative Items', 1),
(11, 'FlowerPots', 1);

-- --------------------------------------------------------

--
-- Table structure for table `city`
--

CREATE TABLE `city` (
  `id` int(11) NOT NULL,
  `s_id` int(11) NOT NULL,
  `c_id` int(11) NOT NULL,
  `city_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `city`
--

INSERT INTO `city` (`id`, `s_id`, `c_id`, `city_name`) VALUES
(3, 1, 1, 'kolkata'),
(5, 2, 1, 'Gandhinagar'),
(6, 3, 1, 'Hyderabad'),
(7, 5, 1, 'Banglore'),
(10, 8, 1, 'Wardha'),
(11, 8, 1, 'Nagpur');

-- --------------------------------------------------------

--
-- Table structure for table `cnfrm_delivery`
--

CREATE TABLE `cnfrm_delivery` (
  `id` int(11) NOT NULL,
  `od_id` int(11) NOT NULL,
  `dv_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `cnfrm_undelivery`
--

CREATE TABLE `cnfrm_undelivery` (
  `id` int(11) NOT NULL,
  `od_id` int(11) NOT NULL,
  `dv_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `commission`
--

CREATE TABLE `commission` (
  `id` int(11) NOT NULL,
  `scat_id` int(11) NOT NULL,
  `com` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `commission`
--

INSERT INTO `commission` (`id`, `scat_id`, `com`) VALUES
(12, 12, 1),
(13, 13, 2),
(14, 14, 1),
(15, 15, 3);

-- --------------------------------------------------------

--
-- Table structure for table `country`
--

CREATE TABLE `country` (
  `id` int(11) NOT NULL,
  `cntry_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `country`
--

INSERT INTO `country` (`id`, `cntry_name`) VALUES
(1, 'India');

-- --------------------------------------------------------

--
-- Table structure for table `dc`
--

CREATE TABLE `dc` (
  `id` int(11) NOT NULL,
  `dc` float NOT NULL,
  `pc` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `dc`
--

INSERT INTO `dc` (`id`, `dc`, `pc`) VALUES
(1, 10, 30);

-- --------------------------------------------------------

--
-- Table structure for table `dv_time`
--

CREATE TABLE `dv_time` (
  `id` int(11) NOT NULL,
  `from` varchar(100) NOT NULL,
  `tto` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `dv_time`
--

INSERT INTO `dv_time` (`id`, `from`, `tto`) VALUES
(2, '10:32', '11:33'),
(3, '12:34', '13:35'),
(4, '14:35', '15:36');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `o_id` text NOT NULL,
  `u_id` int(11) NOT NULL,
  `ad_id` int(11) NOT NULL,
  `dv_date` varchar(255) NOT NULL,
  `dv_time` varchar(255) NOT NULL,
  `payment_type` int(11) NOT NULL,
  `payment_status` int(11) NOT NULL,
  `order_status` int(11) NOT NULL,
  `txnid` varchar(255) NOT NULL,
  `total_amt` float NOT NULL,
  `ship_fee_order` float NOT NULL,
  `final_val` float NOT NULL,
  `isnew` int(11) NOT NULL,
  `u_cnfrm` int(11) NOT NULL,
  `is_p_app` int(11) NOT NULL,
  `is_w_ap` int(11) NOT NULL,
  `prmo` int(11) NOT NULL,
  `wlmt` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `o_id`, `u_id`, `ad_id`, `dv_date`, `dv_time`, `payment_type`, `payment_status`, `order_status`, `txnid`, `total_amt`, `ship_fee_order`, `final_val`, `isnew`, `u_cnfrm`, `is_p_app`, `is_w_ap`, `prmo`, `wlmt`) VALUES
(20, 'ODQ11641892573', 5, 13, '2', 'Today', 1, 0, 2, '1aef5259d7b9857137f9', 367.5, 0, 330.75, 0, 0, 1, 0, 37, 0),
(21, 'ODT121641892869', 4, 8, '4', 'Today', 1, 0, 2, '6dc836ad9bb9aaddbd77', 858.5, 0, 858.5, 0, 0, 0, 0, 0, 0),
(22, 'ODH571641892981', 5, 13, '3', 'Today', 1, 0, 2, '73c551b97291ae5d8297', 157.5, 0, 157.5, 0, 0, 0, 0, 0, 0),
(23, 'ODU851641893088', 5, 13, '3', 'Today', 1, 0, 2, '4cb62cdb729e42be4798', 391.88, 0, 391.88, 0, 0, 0, 0, 0, 0),
(24, 'ODH631641905087', 5, 13, '4', 'Today', 1, 0, 2, 'bdd1bccf553566fb85c8', 470, 0, 470, 0, 0, 0, 0, 0, 0),
(25, 'ODT631641905769', 5, 13, '3', 'Tomorrow', 2, 0, 1, '496a3fd5c45628e9119c', 399, 0, 399, 0, 0, 0, 0, 0, 0),
(26, 'ODB451641905843', 5, 13, '3', 'Tomorrow', 2, 0, 1, '33079fede6b6f99a5b5d', 399, 0, 399, 0, 0, 0, 0, 0, 0),
(27, 'ODE281641905928', 5, 13, '3', 'Tomorrow', 1, 0, 2, '2fbcb815ce628cc12789', 399, 0, 399, 0, 0, 0, 0, 0, 0),
(28, 'ODR241641906144', 5, 13, '4', 'Tomorrow', 1, 0, 2, 'c1922723594d68caf536', 388.5, 0, 310.8, 0, 0, 1, 0, 78, 0),
(29, 'ODK471641908638', 5, 13, '3', 'Today', 1, 0, 2, '1f7fcdae0bb8381e5c50', 858.5, 0, 858.5, 0, 0, 0, 0, 0, 0),
(30, 'ODD531641909029', 5, 13, '2', 'Today', 1, 0, 2, '1a363a92782b2fadbf7e', 207.9, 0, 207.9, 0, 0, 0, 0, 0, 0),
(31, 'ODW411641909647', 5, 13, '4', 'Today', 1, 0, 2, 'edb7973ec7c65f345dff', 668.5, 0, 668.5, 0, 0, 0, 0, 0, 0),
(32, 'ODX871641959618', 7, 14, '3', 'Today', 1, 0, 2, 'de32f21ffd7b9aa98905', 391.88, 0, 391.88, 0, 0, 0, 0, 0, 0),
(33, 'ODW141641977403', 7, 15, '4', 'Today', 1, 0, 2, 'feac97cf70589c8df100', 472.5, 0, 472.5, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `order_detail`
--

CREATE TABLE `order_detail` (
  `id` int(11) NOT NULL,
  `oid` int(11) NOT NULL,
  `p_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `hover` int(11) NOT NULL,
  `rcvd` int(11) NOT NULL,
  `delivered_qty` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `order_detail`
--

INSERT INTO `order_detail` (`id`, `oid`, `p_id`, `qty`, `hover`, `rcvd`, `delivered_qty`) VALUES
(2, 1, 3, 2, 1, 1, 2),
(3, 1, 2, 1, 1, 1, 1),
(4, 2, 1, 1, 0, 0, 0),
(5, 2, 3, 1, 0, 0, 0),
(6, 3, 1, 1, 0, 0, 0),
(7, 3, 3, 1, 0, 0, 0),
(8, 4, 1, 1, 1, 1, 1),
(9, 4, 3, 1, 1, 1, 0),
(10, 5, 2, 1, 1, 1, 0),
(11, 6, 1, 2, 0, 0, 0),
(12, 7, 1, 2, 0, 0, 0),
(13, 8, 1, 2, 1, 1, 2),
(14, 9, 2, 1, 1, 1, 1),
(15, 0, 3, 2, 0, 0, 0),
(16, 0, 2, 2, 0, 0, 0),
(17, 0, 3, 2, 0, 0, 0),
(18, 0, 2, 2, 0, 0, 0),
(19, 10, 20, 1, 0, 0, 0),
(20, 11, 19, 1, 0, 0, 0),
(21, 0, 17, 1, 0, 0, 0),
(22, 13, 17, 1, 0, 0, 0),
(23, 14, 20, 1, 0, 0, 0),
(24, 15, 22, 1, 0, 0, 0),
(25, 15, 15, 1, 0, 0, 0),
(26, 16, 21, 1, 0, 0, 0),
(27, 16, 23, 1, 0, 0, 0),
(28, 17, 19, 1, 0, 0, 0),
(29, 18, 26, 2, 0, 0, 0),
(30, 19, 14, 1, 0, 0, 0),
(31, 20, 25, 1, 0, 0, 0),
(32, 21, 22, 1, 0, 0, 0),
(33, 21, 17, 1, 0, 0, 0),
(34, 22, 21, 1, 0, 0, 0),
(35, 23, 26, 1, 0, 0, 0),
(36, 24, 17, 1, 0, 0, 0),
(37, 25, 18, 1, 0, 0, 0),
(38, 26, 18, 1, 0, 0, 0),
(39, 27, 18, 1, 0, 0, 0),
(40, 28, 22, 1, 0, 0, 0),
(41, 29, 22, 1, 0, 0, 0),
(42, 29, 17, 1, 0, 0, 0),
(43, 30, 27, 1, 0, 0, 0),
(44, 31, 16, 1, 0, 0, 0),
(45, 31, 15, 1, 0, 0, 0),
(46, 32, 26, 1, 0, 0, 0),
(47, 33, 20, 1, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `order_status`
--

CREATE TABLE `order_status` (
  `id` int(11) NOT NULL,
  `o_status` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `order_status`
--

INSERT INTO `order_status` (`id`, `o_status`) VALUES
(1, 'Placing'),
(2, 'Placed'),
(3, 'Assigned'),
(4, 'Out for delivery'),
(5, 'Delivered');

-- --------------------------------------------------------

--
-- Table structure for table `order_time`
--

CREATE TABLE `order_time` (
  `id` int(11) NOT NULL,
  `oid` int(11) NOT NULL,
  `o_status` int(11) NOT NULL,
  `added_on` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `order_time`
--

INSERT INTO `order_time` (`id`, `oid`, `o_status`, `added_on`) VALUES
(1, 1, 2, '2021-09-24 13:46:08'),
(2, 1, 3, '2021-09-24 13:49:21'),
(3, 1, 4, '2021-09-24 13:50:00'),
(5, 1, 5, '2021-09-24 13:51:08'),
(6, 2, 2, '2021-09-24 14:37:41'),
(7, 4, 2, '2021-09-24 14:40:44'),
(8, 4, 3, '2021-09-24 14:42:33'),
(9, 4, 4, '2021-09-24 14:43:05'),
(10, 4, 5, '2021-09-24 14:43:40'),
(11, 4, 7, '2021-09-24 14:43:40'),
(12, 5, 2, '2021-09-24 17:14:36'),
(20, 5, 3, '2021-09-24 18:00:10'),
(21, 5, 4, '2021-09-24 18:00:15'),
(22, 5, 6, '2021-09-24 18:00:29'),
(23, 6, 2, '2021-09-25 11:15:22'),
(24, 7, 2, '2021-09-25 11:15:22'),
(25, 8, 2, '2021-09-25 11:19:18'),
(26, 8, 3, '2021-09-25 11:21:50'),
(27, 8, 4, '2021-09-25 11:22:28'),
(29, 8, 5, '2021-09-25 11:23:35'),
(30, 9, 2, '2021-09-27 10:30:31'),
(31, 9, 3, '2021-09-27 10:32:32'),
(32, 9, 4, '2021-09-27 10:33:39'),
(33, 9, 5, '2021-09-27 10:34:35'),
(34, 10, 2, '2022-01-10 14:34:24'),
(35, 11, 2, '2022-01-10 14:56:41'),
(36, 13, 2, '2022-01-10 15:04:18'),
(37, 14, 2, '2022-01-10 15:34:21'),
(38, 15, 2, '2022-01-10 15:36:20'),
(39, 16, 2, '2022-01-10 15:38:17'),
(40, 17, 2, '2022-01-10 15:41:17'),
(41, 18, 2, '2022-01-10 15:42:12'),
(42, 19, 2, '2022-01-10 15:43:31'),
(43, 20, 2, '2022-01-11 09:16:13'),
(44, 21, 2, '2022-01-11 09:21:09'),
(45, 22, 2, '2022-01-11 09:23:01'),
(46, 23, 2, '2022-01-11 09:24:49'),
(47, 24, 2, '2022-01-11 12:44:47'),
(48, 27, 2, '2022-01-11 12:58:49'),
(49, 28, 2, '2022-01-11 13:02:24'),
(50, 29, 2, '2022-01-11 13:43:58'),
(51, 30, 2, '2022-01-11 13:50:29'),
(52, 31, 2, '2022-01-11 14:00:47'),
(53, 32, 2, '2022-01-12 03:53:39'),
(54, 33, 2, '2022-01-12 08:50:03');

-- --------------------------------------------------------

--
-- Table structure for table `pin`
--

CREATE TABLE `pin` (
  `id` int(11) NOT NULL,
  `c_id` int(11) NOT NULL,
  `s_id` int(11) NOT NULL,
  `cn_id` int(11) NOT NULL,
  `pincode` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pin`
--

INSERT INTO `pin` (`id`, `c_id`, `s_id`, `cn_id`, `pincode`) VALUES
(1, 2, 1, 1, '145879'),
(2, 3, 1, 1, '147858'),
(3, 4, 2, 1, '5787568'),
(4, 5, 2, 1, '567863'),
(5, 6, 3, 1, '452577'),
(6, 7, 3, 1, '564678'),
(7, 9, 4, 1, '478587'),
(8, 8, 4, 1, '75678678'),
(9, 10, 8, 1, '442001'),
(10, 11, 8, 1, '440001');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `cat_id` int(11) NOT NULL,
  `scat_id` int(11) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `img1` varchar(255) NOT NULL,
  `img2` varchar(255) NOT NULL,
  `img3` varchar(255) NOT NULL,
  `img4` varchar(255) NOT NULL,
  `price` float NOT NULL,
  `sell_price` float NOT NULL,
  `fa` float NOT NULL,
  `shrt_desc` text NOT NULL,
  `description` text NOT NULL,
  `qty` int(11) NOT NULL,
  `disclaimer` text NOT NULL,
  `isappp` int(11) NOT NULL,
  `isnew` tinyint(1) NOT NULL,
  `bs` tinyint(1) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `added_by` int(11) NOT NULL,
  `belonging_city` int(11) NOT NULL,
  `tax` float NOT NULL,
  `sku` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `cat_id`, `scat_id`, `product_name`, `img1`, `img2`, `img3`, `img4`, `price`, `sell_price`, `fa`, `shrt_desc`, `description`, `qty`, `disclaimer`, `isappp`, `isnew`, `bs`, `status`, `added_by`, `belonging_city`, `tax`, `sku`) VALUES
(14, 9, 13, 'Estele', '6404705071641059737.jpg', '6593052181641059737.jpg', '7479404021641059738.jpg', '6577147951641059738.jpg', 150, 150, 150, 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', 19, 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', 1, 0, 0, 1, 9, 10, 0, 'Q12BU33K'),
(15, 11, 15, 'Flower', '4892933501641059856.jpg', '1574421381641059856.jpg', '1656264271641059856.jpg', '1430171281641059856.jpg', 400, 350, 388.5, 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', 3, 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', 1, 0, 0, 1, 9, 10, 10, 'Q38FS65C'),
(16, 11, 15, 'FlowerPots', '4916963741641059952.jpg', '1785742551641059952.jpg', '9008233371641059952.jpg', '3401424781641059952.jpg', 300, 280, 280, 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', 9, 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', 1, 0, 0, 1, 9, 10, 0, 'N88KO31E'),
(17, 11, 15, 'Kraft Seeds Plastic Hanging Planter', '7190920041641060216.jpeg', '5647072581641060216.jpeg', '4893556641641060216.jpeg', '1532389551641060216.jpeg', 500, 470, 470, 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', 6, 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', 1, 0, 0, 1, 9, 10, 10, 'T30FL82I'),
(18, 11, 15, 'GARDENS NEED', '3996609271641060296.jpg', '9474428161641060296.jpg', '2223990491641060296.jpg', '9576220081641060296.jpg', 399, 380, 399, 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', 9, 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', 1, 0, 0, 1, 9, 10, 5, 'N34HK35P'),
(19, 9, 13, 'Generic', '4865346231641061013.jpg', '6098416521641061014.jpg', '7586908821641061014.jpg', '1294440261641061014.jpg', 300, 270, 283.5, 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', 18, 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', 1, 0, 0, 1, 10, 10, 5, 'A17WM27D'),
(20, 10, 14, 'Decoration', '8355347361641061093.jpg', '9666502691641061093.jpg', '5221892081641061093.jpg', '9750278411641061093.jpg', 500, 450, 472.5, 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', 17, 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', 1, 0, 0, 1, 10, 10, 5, 'W44UY34C'),
(21, 9, 13, 'ZENEME', '1758991241641061199.jpg', '5389483201641061199.jpg', '7757878611641061199.jpg', '3424783681641061199.jpg', 200, 150, 157.5, 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', 8, 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', 1, 0, 0, 1, 10, 10, 5, 'Y26SS75G'),
(22, 10, 14, 'Decorative items', '3672123061641061370.jpg', '6412355921641061370.jpg', '8420361051641061370.jpg', '6853976941641061370.jpg', 400, 350, 388.5, 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', 6, 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', 1, 0, 0, 1, 10, 10, 10, 'G78SH88J'),
(23, 10, 14, 'Zephyrr', '6173111701641061483.jpg', '5956085591641061483.jpg', '1376713181641061483.jpg', '3689873621641061483.jpg', 500, 450, 450, 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', 9, 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', 1, 0, 0, 1, 10, 10, 0, 'L11TD65X'),
(24, 8, 12, 'Fostelo', '5061723371641064321.jpg', '2913096661641064321.jpg', '5306451821641064321.jpg', '8776506771641064321.jpg', 300, 280, 282.8, 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', 10, 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', 1, 0, 0, 1, 11, 11, 1, 'C97IX85O'),
(25, 8, 12, 'Fristo', '7553257551641064388.jpg', '1310671241641064388.jpg', '4706658881641064388.jpg', '9105280101641064388.jpg', 400, 350, 367.5, 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', 19, 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', 1, 0, 0, 1, 11, 11, 5, 'T84KD52M'),
(26, 8, 12, 'Envias', '4969358511641064449.jpg', '9179874421641064449.jpg', '3399996971641064449.jpg', '5314414051641064449.jpg', 400, 388, 391.88, 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', 16, 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', 1, 0, 0, 1, 11, 11, 1, 'V32UR43M'),
(27, 11, 15, 'FLowerPot', '8123679241641906573.jpeg', '2082059711641906574.jpeg', '9927702151641906574.jpeg', '2479601541641906574.jpeg', 200, 198, 207.9, 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat', 49, 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat', 1, 0, 1, 1, 12, 10, 5, 'C27NB29M');

-- --------------------------------------------------------

--
-- Table structure for table `product_ad_on`
--

CREATE TABLE `product_ad_on` (
  `id` int(11) NOT NULL,
  `pid` int(11) NOT NULL,
  `added_on` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product_ad_on`
--

INSERT INTO `product_ad_on` (`id`, `pid`, `added_on`) VALUES
(9, 9, '2022-01-01 16:21:47'),
(10, 10, '2022-01-01 16:41:22'),
(11, 11, '2022-01-01 16:46:07'),
(12, 12, '2022-01-01 16:50:52'),
(13, 13, '2022-01-01 16:53:29'),
(14, 14, '2022-01-01 17:55:37'),
(15, 15, '2022-01-01 17:57:35'),
(16, 16, '2022-01-01 17:59:12'),
(17, 17, '2022-01-01 18:03:36'),
(18, 18, '2022-01-01 18:04:55'),
(19, 19, '2022-01-01 18:16:53'),
(20, 20, '2022-01-01 18:18:12'),
(21, 21, '2022-01-01 18:19:59'),
(22, 22, '2022-01-01 18:22:50'),
(23, 23, '2022-01-01 18:24:43'),
(24, 24, '2022-01-01 19:12:01'),
(25, 25, '2022-01-01 19:13:08'),
(26, 26, '2022-01-01 19:14:09'),
(27, 27, '2022-01-11 13:09:33');

-- --------------------------------------------------------

--
-- Table structure for table `promo`
--

CREATE TABLE `promo` (
  `id` int(11) NOT NULL,
  `code` varchar(60) NOT NULL,
  `dis` float NOT NULL,
  `minbal` float NOT NULL,
  `scat` int(11) NOT NULL,
  `adb` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `promo`
--

INSERT INTO `promo` (`id`, `code`, `dis`, `minbal`, `scat`, `adb`) VALUES
(2, '20', 10, 0, 12, 11),
(3, 'mamaearth20', 20, 100, 14, 9);

-- --------------------------------------------------------

--
-- Table structure for table `p_reject`
--

CREATE TABLE `p_reject` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `cause` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `rejection`
--

CREATE TABLE `rejection` (
  `id` int(11) NOT NULL,
  `s_id` int(11) NOT NULL,
  `reason` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `rejection`
--

INSERT INTO `rejection` (`id`, `s_id`, `reason`) VALUES
(4, 5, 'e');

-- --------------------------------------------------------

--
-- Table structure for table `sellers`
--

CREATE TABLE `sellers` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` text NOT NULL,
  `mobile` varchar(50) NOT NULL,
  `f_name` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `tob` int(11) NOT NULL,
  `country` int(11) NOT NULL,
  `state` int(11) NOT NULL,
  `city` int(11) NOT NULL,
  `pin` int(11) NOT NULL,
  `b_name` varchar(255) NOT NULL,
  `b_crft` varchar(255) NOT NULL,
  `is_gst` tinyint(1) NOT NULL,
  `gst_id` varchar(255) NOT NULL,
  `gst_crft` varchar(255) NOT NULL,
  `acc_num` varchar(255) NOT NULL,
  `acc_holder` varchar(255) NOT NULL,
  `ifsc` varchar(255) NOT NULL,
  `bank` varchar(255) NOT NULL,
  `branch` varchar(255) NOT NULL,
  `isapp` int(11) NOT NULL,
  `is_new` tinyint(1) NOT NULL,
  `is_cp` tinyint(1) NOT NULL,
  `adhar` varchar(255) NOT NULL,
  `pan` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sellers`
--

INSERT INTO `sellers` (`id`, `email`, `password`, `mobile`, `f_name`, `address`, `tob`, `country`, `state`, `city`, `pin`, `b_name`, `b_crft`, `is_gst`, `gst_id`, `gst_crft`, `acc_num`, `acc_holder`, `ifsc`, `bank`, `branch`, `isapp`, `is_new`, `is_cp`, `adhar`, `pan`, `status`) VALUES
(9, 'SHG1', '$2y$10$82.4lsHSl5RSar4P3I8sb.JD7YT.HmUHWM4WJcDqc0I9svA1FzyCe', '9632587410', 'SHG1', 'Wardha', 5, 1, 8, 10, 9, 'SHG1', '7951967301641059230.jpg', 2, 'No GST', '0', '9807865490', 'SHG1', '234567890', 'Axis Bank', 'Axis Bank', 1, 0, 1, '3476878601641059230.jpg', '7191216161641059230.png', 1),
(10, 'SHG2@gmail.com', '$2y$10$V3OyGn9GygYoj9HwEPHS/OzJwmDczTcdlye1UPzqD0LVMaIKU6MMS', '8965741235', 'SHG2', 'Nagpur', 5, 1, 8, 10, 9, 'SHG2', '5638819531641060832.jpg', 2, 'No GST', '0', '8965327412', 'SHG2', '741852', 'State Bank of India', 'State Bank of India', 1, 0, 1, '1634653491641060832.jpg', '9608478991641060832.png', 1),
(11, 'SHG3@gmail.com', '$2y$10$d2S5EkdaYEaRW0Xq6oAqm.2Q3yk2euqr39bbNhpxu9lHGjmbJTZOW', '7854632105', 'SHG3', 'Nagpur', 4, 1, 8, 11, 10, 'SHG3', '3087442841641064182.jpg', 2, 'No GST', '0', '9865321423', 'SHG3', '786523', 'SBI', 'SBI', 1, 0, 1, '9483467891641064182.jpg', '7430720061641064182.png', 1),
(12, 'SHG4@gmail.com', '$2y$10$0I/AaX33nH/mVhQjAQL/u.5fDhr0Ee8AtCoFl4k9aenzATJI6vzNe', '9876543210', 'SHG4', 'Wardha', 5, 1, 8, 10, 9, 'Self Help Group', '3122418421641905610.jpg', 1, '46633', '3819224611641905610.png', '456123789', 'SHG4', '456123', 'SBI', 'SBI', 1, 0, 1, '3926819641641905610.jpg', '8735197371641905610.png', 1),
(13, 'SHG5@gmail.com', '$2y$10$NTI/ym6alxHLjuMmSnxLJul7wojHLKJ0/FuN1mCC7ukyZqSHTghi.', '9876543210', 'SHG5', 'Wardha', 5, 1, 8, 10, 9, 'Self Help Group', '3311135941641977000.jpg', 2, 'No GST', '0', '9865354563', 'SHG5', '5465487', 'SBI', 'SBI', 1, 0, 1, '4658458141641977000.jpg', '3598955941641977000.png', 1);

-- --------------------------------------------------------

--
-- Table structure for table `state`
--

CREATE TABLE `state` (
  `id` int(11) NOT NULL,
  `c_id` int(11) NOT NULL,
  `state_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `state`
--

INSERT INTO `state` (`id`, `c_id`, `state_name`) VALUES
(2, 1, 'Gujarat'),
(3, 1, 'Andhra Pradesh'),
(5, 1, 'Karnataka'),
(8, 1, 'Maharashtra');

-- --------------------------------------------------------

--
-- Table structure for table `subcategories`
--

CREATE TABLE `subcategories` (
  `id` int(11) NOT NULL,
  `cat_id` int(11) NOT NULL,
  `subcat` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `subcategories`
--

INSERT INTO `subcategories` (`id`, `cat_id`, `subcat`, `status`) VALUES
(12, 8, 'Bags', 1),
(13, 9, 'Jwellery', 1),
(14, 10, 'Decoration', 1),
(15, 11, 'FlowerPots', 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` text NOT NULL,
  `mobile` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `m_vfd` tinyint(1) NOT NULL,
  `e_vfd` tinyint(1) NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `mobile`, `name`, `m_vfd`, `e_vfd`, `status`) VALUES
(4, 'vs@gmail.com', '$2y$10$VEMh8NhyfaF4GAC8to6gveY0zN0JV262h59.Xfh8cyORPZl6XHDc6', '1234567890', 'VS', 0, 1, 1),
(5, 'vaishnavisatone1107@gmail.com', '$2y$10$sgRQc3g0QA/0tihXOZLq0et/ei45JEeNRJPTuHcRa/cl3Hh1U/iBe', '1234567890', 'Vaishnavi', 1, 1, 1),
(6, 'anushree@gmail.com', '$2y$10$jlwaIZjx0AKXzA3GBT4U6.ec7tCnoIIZc2p61k/cKN2x.Etnc/z6K', '8965321475', 'Anushree', 1, 1, 1),
(7, 'user@gmail.com', '$2y$10$8kG/YSY0p9NEDbGWWm6u0uVqjN.arlE5x6JJVkeVH6zjVwprlgcpG', '9876543210', 'USER', 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `user_address`
--

CREATE TABLE `user_address` (
  `id` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `type_ad` varchar(255) NOT NULL,
  `user_name` varchar(255) NOT NULL,
  `user_mobile` varchar(255) NOT NULL,
  `user_city` int(11) NOT NULL,
  `user_add` varchar(255) NOT NULL,
  `user_pin` varchar(255) NOT NULL,
  `user_local` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_address`
--

INSERT INTO `user_address` (`id`, `uid`, `type_ad`, `user_name`, `user_mobile`, `user_city`, `user_add`, `user_pin`, `user_local`) VALUES
(4, 1, 'Home', 'Ayondip Jana', '4178589658', 3, 'wert frt fy5 tyty 6fgty', '721122', 'India'),
(8, 4, 'Home', 'VS', '2134567890', 10, 'Wardha', '442001', 'Wardha'),
(9, 4, 'on', 'Vaishnavi', '9865321475', 11, 'Nagpur', '896532', 'lk'),
(10, 5, 'Home', 'Vaishnavi', '9632587410', 11, 'Manish Nagar Nagpur', '440001', 'Nagpur'),
(11, 6, 'Home', 'Anushree', '8965321475', 10, 'Sudampuri Wardha', '442001', 'Wardha'),
(12, 6, 'Home', 'Anshree', '896532147', 3, 'Kolkata', '896523', 'kolkata'),
(13, 5, 'Home', 'VS', '1234567890', 10, '5', '442001', '12'),
(15, 7, 'Home', 'USER', '9876543210', 10, '5', '442001', 'Wardha');

-- --------------------------------------------------------

--
-- Table structure for table `user_wallet`
--

CREATE TABLE `user_wallet` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `ballance` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_wallet`
--

INSERT INTO `user_wallet` (`id`, `user_id`, `ballance`) VALUES
(0, 7, 0);

-- --------------------------------------------------------

--
-- Table structure for table `wishlist`
--

CREATE TABLE `wishlist` (
  `id` int(11) NOT NULL,
  `u_id` int(11) NOT NULL,
  `p_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `wishlist`
--

INSERT INTO `wishlist` (`id`, `u_id`, `p_id`) VALUES
(9, 5, 1),
(10, 5, 3),
(11, 4, 14);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `business_type`
--
ALTER TABLE `business_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cart_detail`
--
ALTER TABLE `cart_detail`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `city`
--
ALTER TABLE `city`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cnfrm_delivery`
--
ALTER TABLE `cnfrm_delivery`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cnfrm_undelivery`
--
ALTER TABLE `cnfrm_undelivery`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `commission`
--
ALTER TABLE `commission`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `country`
--
ALTER TABLE `country`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dv_time`
--
ALTER TABLE `dv_time`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_detail`
--
ALTER TABLE `order_detail`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_status`
--
ALTER TABLE `order_status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_time`
--
ALTER TABLE `order_time`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pin`
--
ALTER TABLE `pin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_ad_on`
--
ALTER TABLE `product_ad_on`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `promo`
--
ALTER TABLE `promo`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `p_reject`
--
ALTER TABLE `p_reject`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rejection`
--
ALTER TABLE `rejection`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sellers`
--
ALTER TABLE `sellers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `state`
--
ALTER TABLE `state`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subcategories`
--
ALTER TABLE `subcategories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_address`
--
ALTER TABLE `user_address`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `business_type`
--
ALTER TABLE `business_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `cart_detail`
--
ALTER TABLE `cart_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `city`
--
ALTER TABLE `city`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `cnfrm_delivery`
--
ALTER TABLE `cnfrm_delivery`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `cnfrm_undelivery`
--
ALTER TABLE `cnfrm_undelivery`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `commission`
--
ALTER TABLE `commission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `country`
--
ALTER TABLE `country`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `dv_time`
--
ALTER TABLE `dv_time`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `order_detail`
--
ALTER TABLE `order_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `order_status`
--
ALTER TABLE `order_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `order_time`
--
ALTER TABLE `order_time`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT for table `pin`
--
ALTER TABLE `pin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `product_ad_on`
--
ALTER TABLE `product_ad_on`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `promo`
--
ALTER TABLE `promo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `p_reject`
--
ALTER TABLE `p_reject`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `rejection`
--
ALTER TABLE `rejection`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `sellers`
--
ALTER TABLE `sellers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `state`
--
ALTER TABLE `state`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `subcategories`
--
ALTER TABLE `subcategories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `user_address`
--
ALTER TABLE `user_address`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `wishlist`
--
ALTER TABLE `wishlist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
