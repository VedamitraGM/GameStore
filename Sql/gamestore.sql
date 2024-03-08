-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 08, 2024 at 01:58 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `gamestore`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `creationDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `updationDate` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `username`, `password`, `creationDate`, `updationDate`) VALUES
(1, 'admin', '21232f297a57a5a743894a0e4a801fc3', '2017-01-24 16:21:18', '21-02-2024 05:39:59 PM');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `categoryName` varchar(255) DEFAULT NULL,
  `categoryDescription` longtext DEFAULT NULL,
  `creationDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `updationDate` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `categoryName`, `categoryDescription`, `creationDate`, `updationDate`) VALUES
(7, 'Top Sellers', '', '2024-02-08 11:16:31', '08-02-2024 04:48:13 PM'),
(8, 'Action', '', '2024-02-08 11:16:46', '08-02-2024 04:48:24 PM'),
(9, 'Adventure', '', '2024-02-08 11:16:57', '08-02-2024 04:48:35 PM'),
(10, 'Racing', '', '2024-02-08 11:17:05', '08-02-2024 04:48:48 PM'),
(11, 'Sports', '', '2024-02-08 11:17:14', '08-02-2024 04:48:58 PM'),
(12, 'Strategy', '', '2024-02-08 11:17:27', '08-02-2024 04:49:03 PM');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  `productId` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `orderDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `paymentMethod` varchar(50) DEFAULT NULL,
  `orderStatus` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `userId`, `productId`, `quantity`, `orderDate`, `paymentMethod`, `orderStatus`) VALUES
(8, 4, 21, 1, '2024-02-10 15:05:09', 'Debit / Credit card', 'Delivered'),
(9, 4, 23, 1, '2024-02-10 15:05:09', 'Debit / Credit card', 'in Process'),
(10, 4, 24, 1, '2024-02-10 15:05:09', 'Debit / Credit card', NULL),
(11, 4, 25, 1, '2024-02-10 15:05:09', 'Debit / Credit card', 'in Process'),
(12, 4, 26, 1, '2024-02-10 15:05:09', 'Debit / Credit card', NULL),
(13, 4, 34, 1, '2024-02-21 11:21:22', 'Debit / Credit card', NULL),
(14, 4, 46, 1, '2024-02-21 11:57:30', 'Debit / Credit card', NULL),
(15, 4, 32, 1, '2024-02-22 10:40:53', 'Debit / Credit card', 'Delivered');

-- --------------------------------------------------------

--
-- Table structure for table `ordertrackhistory`
--

CREATE TABLE `ordertrackhistory` (
  `id` int(11) NOT NULL,
  `orderId` int(11) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `remark` mediumtext DEFAULT NULL,
  `postingDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `ordertrackhistory`
--

INSERT INTO `ordertrackhistory` (`id`, `orderId`, `status`, `remark`, `postingDate`) VALUES
(6, 11, 'in Process', 'Payment Processing', '2024-02-10 15:51:23'),
(7, 9, 'in Process', 'Payment Pending', '2024-02-21 12:11:32'),
(11, 15, 'Delivered', 'Thanks for purchasing', '2024-02-22 10:45:21'),
(12, 8, 'Delivered', 'GG', '2024-02-22 10:46:04');

-- --------------------------------------------------------

--
-- Table structure for table `productreviews`
--

CREATE TABLE `productreviews` (
  `id` int(11) NOT NULL,
  `productId` int(11) DEFAULT NULL,
  `quality` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `value` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `summary` varchar(255) DEFAULT NULL,
  `review` longtext DEFAULT NULL,
  `reviewDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `productreviews`
--

INSERT INTO `productreviews` (`id`, `productId`, `quality`, `price`, `value`, `name`, `summary`, `review`, `reviewDate`) VALUES
(2, 21, 4, 230, 5, 'Franklin', 'BEST PRODUCT FOR ME :)', 'BEST PRODUCT FOR ME :)', '2017-02-26 20:43:57'),
(3, 22, 3, 1299, 3, 'Micheal', 'Nice Product', 'Value for money', '2017-02-26 20:52:46'),
(4, 23, 3, 0, 3, 'Trevor', 'Nice Product', 'Value for money', '2017-02-26 20:59:19');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `category` int(11) NOT NULL,
  `subCategory` int(11) DEFAULT NULL,
  `productName` varchar(255) DEFAULT NULL,
  `productCompany` varchar(255) DEFAULT NULL,
  `productPrice` int(11) DEFAULT NULL,
  `productPriceBeforeDiscount` int(11) DEFAULT NULL,
  `productDescription` longtext DEFAULT NULL,
  `productImage1` varchar(255) DEFAULT NULL,
  `productImage2` varchar(255) DEFAULT NULL,
  `productImage3` varchar(255) DEFAULT NULL,
  `shippingCharge` int(11) DEFAULT NULL,
  `productAvailability` varchar(255) DEFAULT NULL,
  `postingDate` timestamp NULL DEFAULT current_timestamp(),
  `updationDate` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category`, `subCategory`, `productName`, `productCompany`, `productPrice`, `productPriceBeforeDiscount`, `productDescription`, `productImage1`, `productImage2`, `productImage3`, `shippingCharge`, `productAvailability`, `postingDate`, `updationDate`) VALUES
(21, 8, 18, 'Ori and the Will of the Wisps', 'Moon Studios GmbH', 230, 699, '<font face=\"Arial, Helvetica, sans-serif\" style=\"background-color: rgb(255, 255, 255);\" color=\"#000000\">Play the critically acclaimed masterpiece. Embark on a new journey in a vast, exotic world where you’ll encounter towering enemies and challenging puzzles on your quest to unravel Ori’s destiny.</font><br>', 'ori.jpg', 'ori1.webp', 'ori2.jpg', 0, 'In Stock', '2024-02-08 11:30:46', NULL),
(22, 8, 18, 'Battlefield™ 2042', ' DICE', 1299, 2, 'Master the unknown in Season 6: Dark Creations. Battlefield™ 2042 is a first-person shooter that marks the return to the iconic all-out warfare of the franchise.<br>', 'ori.jpg', 'ori1.avif', 'ori2.jpg', 50, 'In Stock', '2024-02-08 11:34:54', NULL),
(23, 8, 18, 'PUBG: BATTLEGROUNDS', ' KRAFTON, Inc.', 0, 0, 'Play PUBG: BATTLEGROUNDS for free. Land on strategic locations, loot weapons and supplies, and survive to become the last team standing across various, diverse Battlegrounds. Squad up and join the Battlegrounds for the original Battle Royale experience that only PUBG: BATTLEGROUNDS<br>', 'ori.jpg', 'ori1.avif', 'ori2.jpg', 0, 'In Stock', '2024-02-08 11:39:40', NULL),
(24, 8, 13, 'Suicide Squad: Kill the Justice League', 'Rocksteady Studios', 4999, 4999, 'From the creators of Batman: Arkham, Suicide Squad: Kill the Justice League is a genre-defying third-person action shooter where the ultimate band of misfits must do the impossible: Kill the Justice League.<br>', 'ori.jpg', 'ori1.avif', 'ori2.jpg', 50, 'In Stock', '2024-02-08 11:43:45', NULL),
(25, 8, 13, 'Jujutsu Kaisen Cursed Clash', ' Byking Inc.', 3599, 3599, 'Master the Jujutsu of your favorite Sorcerers and Cursed Spirits! Bring a friend and dive into the world of JUJUTSU KAISEN in this action-packed, 2-on-2 fighting game!<br>', 'ori.jpg', 'ori2.jpg', 'ori1.avif', 0, 'In Stock', '2024-02-08 11:47:25', NULL),
(26, 8, 13, 'Granblue Fantasy: Relink', ' Cygames, Inc.', 3499, 4799, 'A grand adventure in the skies awaits! Form a party of four from a diverse roster of skyfarers and slash—or shoot or hex—your way to victory against treacherous foes in this action RPG. Take on quests solo or with the help of others in up to 4-player co-op play!<br>', 'ori.jpg', 'ori1.avif', 'ori2.jpg', 50, 'In Stock', '2024-02-08 11:50:26', NULL),
(27, 9, 14, 'Touhou Danmaku Kagura Phantasia Lost', ' Alliance Arts', 1170, 1300, 'A rhythm game in which players can play popular arrangements of Touhou Project songs. A rebuild of \"Touhou Danmaku Kagura\" as a stand-alone version with a completely new storyline.<br>', 'ori.jpg', 'ori1.avif', 'ori2.jpg', 50, 'In Stock', '2024-02-08 11:59:20', NULL),
(28, 9, 14, 'Vampire: The Masquerade - Justice', 'Fast Travel Games', 1040, 1300, '<div>Become a vampire. Strike from the darkness and drink the blood of your prey. Use stealth, persuasion, and an arsenal of upgradable abilities to sneak past enemies undetected or punish the guilty in the seedy backstreets of nighttime Venice.</div><div><br></div>', 'ori.jpg', 'ori1.avif', 'ori2.jpg', 50, 'In Stock', '2024-02-08 12:01:33', NULL),
(29, 9, 14, 'Enshrouded', ' Keen Games GmbH', 1399, 1479, '<div>You are Flameborn, last ember of hope of a dying race. Awaken, survive the terror of a corrupting fog, and reclaim the lost beauty of your kingdom. Venture into a vast world, vanquish punishing bosses, build grand halls and forge your path in this co-op survival action RPG for up to 16 players.</div><div><br></div>', 'ori.jpg', 'ori1.avif', 'ori2.jpg', 0, 'In Stock', '2024-02-08 12:04:11', NULL),
(30, 9, 19, 'Terraria', ' Re-Logic', 1300, 1300, 'Dig, fight, explore, build! Nothing is impossible in this action-packed adventure game. Four Pack also available!<br>', 'ori.jpg', 'ori1.avif', 'ori2.jpg', 50, 'In Stock', '2024-02-08 12:06:31', NULL),
(31, 9, 19, 'The Witcher® 3: Wild Hunt', 'CD PROJEKT RED', 1249, 1249, '<div>You are Geralt of Rivia, mercenary monster slayer. Before you stands a war-torn, monster-infested continent you can explore at will. Your current contract? Tracking down Ciri — the Child of Prophecy, a living weapon that can alter the shape of the world.</div><div><br></div>', 'ori.jpg', 'ori1.avif', 'ori2.jpg', 50, 'In Stock', '2024-02-08 12:08:25', NULL),
(32, 9, 19, 'Tomb Raider', ' Crystal Dynamics, Eidos-Montréal, Feral Interactive (Mac), Nixxes', 649, 799, 'Tomb Raider explores the intense origin story of Lara Croft and her ascent from a young woman to a hardened survivor.<br>', 'ori.jpg', 'ori2.jpg', 'ori1.avif', 50, 'In Stock', '2024-02-08 12:11:23', NULL),
(33, 10, 20, 'Forza Horizon 4', ' Playground Games', 2499, 2499, '<div>Dynamic seasons change everything at the world’s greatest automotive festival. Go it alone or team up with others to explore beautiful and historic Britain in a shared open world.</div><div><br></div>', 'ori.jpg', 'ori1.avif', 'ori2.jpg', 50, 'In Stock', '2024-02-08 12:15:24', NULL),
(34, 10, 20, 'Need for Speed™ Heat', ' Ghost Games', 1799, 3499, '<div>Hustle by day and risk it all at night in Need for Speed™ Heat Deluxe Edition, a white-knuckle street racer, where the lines of the law fade as the sun starts to set.</div><div><br></div>', 'ori.jpg', 'ori1.avif', 'ori2.jpg', 50, 'In Stock', '2024-02-08 12:17:30', NULL),
(35, 10, 20, 'The Crew™ 2', ' Ivory Tower , Ubisoft', 2799, 4999, '<div>Take on the American motorsports scene as you explore and dominate the land, air, and sea across the entire USA. With a wide variety of cars, bikes, boats, and planes, compete in a wide range of driving disciplines.</div><div><br></div>', 'ori.jpg', 'ori2.jpg', 'ori1.avif', 50, 'In Stock', '2024-02-08 12:20:03', NULL),
(36, 10, 15, 'RC Revolution: High Voltage - ???', 'Phren Games', 0, 0, '<div>Dive into RC Revolution High Voltage, the exhilarating free version of RC Revolution. Select from three dynamic cars, unlock a fourth, and challenge our AI for a fifth. Customize for style and performance, and get ready for stunt-filled tracks and nitro-fueled speed craze.</div><div><br></div>', 'ori.jpg', 'ori1.avif', 'ori2.jpg', 0, 'In Stock', '2024-02-08 12:27:42', NULL),
(37, 10, 15, 'F1® 23', 'Codemasters', 2499, 3499, '<div>Be the last to brake in EA SPORTS™ F1® 23, the official video game of the 2023 FIA Formula One World Championship™. A new chapter in the thrilling \"Braking Point\" story mode delivers high-speed drama and heated rivalries.</div><div><br></div>', 'ori.jpg', 'ori2.jpg', 'ori1.avif', 50, 'In Stock', '2024-02-08 12:30:20', NULL),
(38, 10, 15, 'EA SPORTS™ WRC', ' Codemasters', 1799, 2599, '<div>Build the car of your dreams in our biggest rally game ever, EA SPORTS™ WRC, the all-new official videogame of the FIA World Rally Championship, the first developed by the award-winning team behind the DiRT Rally series.</div><div><br></div>', 'ori.jpg', 'ori1.avif', 'ori2.jpg', 50, 'In Stock', '2024-02-08 12:32:34', NULL),
(39, 11, 21, 'EA SPORTS FC™ 24', ' EA Canada & EA Romania', 3499, 5199, '<div>EA SPORTS FC™ 24 welcomes you to The World’s Game: the most true-to-football experience ever with HyperMotionV, PlayStyles optimised by Opta, and an enhanced Frostbite™ Engine.</div><div><br></div>', 'ori.jpg', 'ori2.jpg', 'ori1.avif', 50, 'In Stock', '2024-02-08 12:39:09', NULL),
(40, 11, 21, 'eFootball™ 2024', 'KONAMI', 0, 0, '<div>The classic action soccer game with the most up-to-date data! Enjoy the fever pitch of \"\"real soccer\"\" in eFootball™ 2024!</div><div><br></div>', 'ori.jpg', 'ori1.avif', 'ori2.jpg', 0, 'In Stock', '2024-02-08 12:42:48', NULL),
(41, 11, 21, 'WWE 2K23', 'Visual Concepts , 2K', 3170, 4999, '<div>WWE 2K23 is Even Stronger with expanded features, gorgeous graphics and a deep roster of WWE Superstars and Legends. 2K Showcase returns as an interactive sports documentary focusing on the 20-year career of John Cena and WarGames is finally here!</div><div><br></div>', 'ori.jpg', 'ori2.jpg', 'ori1.avif', 50, 'In Stock', '2024-02-08 12:45:07', NULL),
(42, 11, 16, 'Madden NFL 24', 'Tiburon , Electronic Arts', 2799, 3499, '<div>Experience the newest iteration of FieldSENSE™ in Madden NFL 24. More realistic character movement and smarter AI gives you control to play out your gameplay strategy with the confidence to dominate any opponent.</div><div><br></div>', 'ori.jpg', 'ori2.jpg', 'ori1.avif', 50, 'In Stock', '2024-02-08 12:47:30', NULL),
(43, 11, 16, 'NBA 2K24', 'Visual Concepts , 2K', 3299, 5599, '<div>Experience hoops culture in NBA 2K24. Enjoy loads of action and limitless personalized MyPLAYER options in MyCAREER. Build your perfect lineup in MyTEAM. Feel more responsive gameplay and polished visuals while playing with your favorite NBA and WNBA teams in PLAY NOW.</div><div><br></div>', 'ori.jpg', 'ori1.avif', 'ori2.jpg', 50, 'In Stock', '2024-02-08 12:51:11', NULL),
(44, 12, 31, 'Bloons TD 6', ' Ninja Kiwi', 439, 439, '<div>The Bloons are back and better than ever! Get ready for a massive 3D tower defense game designed to give you hours and hours of the best strategy gaming available.</div><div><br></div>', 'bb1.jpg', 'bb2.jpg', 'bb3.jpg', 50, 'In Stock', '2024-02-08 13:01:05', NULL),
(45, 11, 16, 'Tony Hawk Pro Skater™ ', 'Vicarious Visions, Iron Galaxy Studios', 1799, 2599, 'Play the fully-remastered Tony Hawk’s™ Pro Skater™ &amp; Tony Hawk’s™ Pro Skater™ 2 games in one epic collection, rebuilt from the ground up in incredible HD.<br>', 'ori.jpg', 'ori1.avif', '', 50, 'In Stock', '2024-02-08 13:04:12', NULL),
(46, 12, 31, 'Counter-Strike 2', ' Valve', 1190, 1190, '<div>For over two decades, Counter-Strike has offered an elite competitive experience, one shaped by millions of players from across the globe. And now the next chapter in the CS story is about to begin. This is Counter-Strike 2.</div><div><br></div>', 'bb1.jpg', 'bb2.jpg', 'bb3.jpg', 0, 'In Stock', '2024-02-08 13:09:24', NULL),
(47, 12, 17, 'Persona 3 Reload', 'ATLUS , SEGA', 4399, 5299, 'Dive into the Dark Hour and awaken the depths of your heart. Persona 3 Reload is a captivating reimagining of the genre-defining RPG, reborn for the modern era with cutting-edge graphics and gameplay.<br>', 'ori.jpg', 'ori1.avif', 'ori2.jpg', 0, 'In Stock', '2024-02-08 13:18:25', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `subcategory`
--

CREATE TABLE `subcategory` (
  `id` int(11) NOT NULL,
  `categoryid` int(11) DEFAULT NULL,
  `subcategory` varchar(255) DEFAULT NULL,
  `creationDate` timestamp NULL DEFAULT current_timestamp(),
  `updationDate` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `subcategory`
--

INSERT INTO `subcategory` (`id`, `categoryid`, `subcategory`, `creationDate`, `updationDate`) VALUES
(13, 8, 'New Releases', '2024-02-08 11:19:43', NULL),
(14, 9, 'New Releases', '2024-02-08 11:19:49', NULL),
(15, 10, 'New Releases', '2024-02-08 11:19:53', NULL),
(16, 11, 'New Releases', '2024-02-08 11:19:57', NULL),
(17, 12, 'New Releases', '2024-02-08 11:20:02', NULL),
(18, 8, 'All items', '2024-02-08 11:20:25', '08-02-2024 05:23:32 PM'),
(19, 9, 'All items', '2024-02-08 11:20:30', '08-02-2024 05:23:44 PM'),
(20, 10, 'All items', '2024-02-08 11:20:33', '08-02-2024 05:23:51 PM'),
(21, 11, 'All items', '2024-02-08 11:20:36', '08-02-2024 05:23:56 PM'),
(23, 7, 'SPECIAL OFFERS', '2024-02-08 11:21:41', NULL),
(24, 7, 'POPULAR TITLES', '2024-02-08 11:22:02', NULL),
(25, 7, 'DISCOUNTED', '2024-02-08 11:22:46', NULL),
(31, 12, 'All items', '2024-02-08 11:55:23', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `userlog`
--

CREATE TABLE `userlog` (
  `id` int(11) NOT NULL,
  `userEmail` varchar(255) DEFAULT NULL,
  `userip` binary(16) DEFAULT NULL,
  `loginTime` timestamp NULL DEFAULT current_timestamp(),
  `logout` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `userlog`
--

INSERT INTO `userlog` (`id`, `userEmail`, `userip`, `loginTime`, `logout`, `status`) VALUES
(24, 'rae@gmail.com', 0x3a3a3100000000000000000000000000, '2024-02-08 11:08:56', '08-02-2024 10:16:12 PM', 1),
(25, 'rae@gmail.com', 0x3a3a3100000000000000000000000000, '2024-02-10 15:00:35', NULL, 0),
(26, 'rae@gmail.com', 0x3a3a3100000000000000000000000000, '2024-02-10 15:00:51', '10-02-2024 08:37:50 PM', 1),
(27, 'rae@gmail.com', 0x3a3a3100000000000000000000000000, '2024-02-10 15:10:02', '21-02-2024 05:38:01 PM', 1),
(28, 'rae@gmail.com', 0x3a3a3100000000000000000000000000, '2024-02-21 12:19:06', NULL, 1),
(29, 'rae@gmail.com', 0x3a3a3100000000000000000000000000, '2024-02-22 10:39:43', '22-02-2024 04:13:35 PM', 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `contactno` bigint(11) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `shippingAddress` longtext DEFAULT NULL,
  `shippingState` varchar(255) DEFAULT NULL,
  `shippingCity` varchar(255) DEFAULT NULL,
  `shippingPincode` int(11) DEFAULT NULL,
  `billingAddress` longtext DEFAULT NULL,
  `billingState` varchar(255) DEFAULT NULL,
  `billingCity` varchar(255) DEFAULT NULL,
  `billingPincode` int(11) DEFAULT NULL,
  `regDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `updationDate` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `contactno`, `password`, `shippingAddress`, `shippingState`, `shippingCity`, `shippingPincode`, `billingAddress`, `billingState`, `billingCity`, `billingPincode`, `regDate`, `updationDate`) VALUES
(4, 'rae', 'rae@gmail.com', 123456798, 'b926306e53092f060667cc5f38eaf46b', 'g', 'g', 'g', 560001, 'g', 'g', 'g', 0, '2024-02-08 11:08:36', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `wishlist`
--

CREATE TABLE `wishlist` (
  `id` int(11) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  `productId` int(11) DEFAULT NULL,
  `postingDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `wishlist`
--

INSERT INTO `wishlist` (`id`, `userId`, `productId`, `postingDate`) VALUES
(3, 4, 21, '2024-02-10 15:02:18'),
(4, 4, 23, '2024-02-10 15:02:31'),
(5, 4, 24, '2024-02-10 15:02:49'),
(6, 4, 25, '2024-02-10 15:03:08'),
(7, 4, 26, '2024-02-10 15:03:12');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userId` (`userId`),
  ADD KEY `productId` (`productId`),
  ADD KEY `orderStatus` (`orderStatus`);

--
-- Indexes for table `ordertrackhistory`
--
ALTER TABLE `ordertrackhistory`
  ADD PRIMARY KEY (`id`),
  ADD KEY `status` (`status`);

--
-- Indexes for table `productreviews`
--
ALTER TABLE `productreviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `productId` (`productId`),
  ADD KEY `price` (`price`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category` (`category`),
  ADD KEY `subCategory` (`subCategory`),
  ADD KEY `productPrice` (`productPrice`);

--
-- Indexes for table `subcategory`
--
ALTER TABLE `subcategory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `userlog`
--
ALTER TABLE `userlog`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userEmail` (`userEmail`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `email` (`email`);

--
-- Indexes for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userId` (`userId`),
  ADD KEY `productId` (`productId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `ordertrackhistory`
--
ALTER TABLE `ordertrackhistory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `productreviews`
--
ALTER TABLE `productreviews`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `subcategory`
--
ALTER TABLE `subcategory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `userlog`
--
ALTER TABLE `userlog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `wishlist`
--
ALTER TABLE `wishlist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`productId`) REFERENCES `products` (`id`);

--
-- Constraints for table `productreviews`
--
ALTER TABLE `productreviews`
  ADD CONSTRAINT `productreviews_ibfk_1` FOREIGN KEY (`productId`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `productreviews_ibfk_2` FOREIGN KEY (`price`) REFERENCES `products` (`productPrice`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`category`) REFERENCES `category` (`id`),
  ADD CONSTRAINT `products_ibfk_2` FOREIGN KEY (`subCategory`) REFERENCES `subcategory` (`id`);

--
-- Constraints for table `userlog`
--
ALTER TABLE `userlog`
  ADD CONSTRAINT `userlog_ibfk_1` FOREIGN KEY (`userEmail`) REFERENCES `users` (`email`);

--
-- Constraints for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD CONSTRAINT `wishlist_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `wishlist_ibfk_2` FOREIGN KEY (`productId`) REFERENCES `products` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
