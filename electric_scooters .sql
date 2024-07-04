-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Počítač: 127.0.0.1
-- Vytvořeno: Ned 30. čen 2024, 04:50
-- Verze serveru: 10.4.32-MariaDB
-- Verze PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Databáze: `electric_scooters`
--

-- --------------------------------------------------------

--
-- Struktura tabulky `ads`
--

CREATE TABLE `ads` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `description` text DEFAULT NULL,
  `manufacturer_id` int(11) NOT NULL,
  `model_id` int(11) NOT NULL,
  `performance` int(11) NOT NULL,
  `battery` int(11) NOT NULL,
  `speed` int(11) NOT NULL,
  `weight` int(11) NOT NULL,
  `battery_condition` varchar(255) NOT NULL,
  `damage` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `additional_images` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Vypisuji data pro tabulku `ads`
--

INSERT INTO `ads` (`id`, `user_id`, `name`, `price`, `description`, `manufacturer_id`, `model_id`, `performance`, `battery`, `speed`, `weight`, `battery_condition`, `damage`, `image`, `additional_images`) VALUES
(2, 1, 'kaboo mantins 8', 1212.00, 'dsada', 13, 59, 12, 12, 12, 12, '0', 'ASDsad', 'uploads/my237.png', NULL),
(3, 1, 'mantis 10 pro plus', 12000.00, 'zadnej', 13, 59, 2, 23, 100, 300, '400', '500', 'uploads/2E6027EE-012F-4CF4-80BC-DC3C5C6C118B.jpg', NULL),
(5, 1, 'asdas', 1212.00, 'kokotinec zkušinec', 4, 20, 12, 12, 12, 12, '0', 'asdas', '', NULL),
(6, 1, 'dasdas', 23232.00, 'asda', 1, 2, 23, 23, 23, 3, '0', 'SDASD', NULL, NULL),
(7, 1, 'dasda', 22222.00, '22222', 4, 19, 22, 22, 22, 22, '22', '22', NULL, NULL);

-- --------------------------------------------------------

--
-- Struktura tabulky `ad_images`
--

CREATE TABLE `ad_images` (
  `id` int(11) NOT NULL,
  `ad_id` int(11) NOT NULL,
  `image_path` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Vypisuji data pro tabulku `ad_images`
--

INSERT INTO `ad_images` (`id`, `ad_id`, `image_path`) VALUES
(1, 6, 'uploads/pozadi1.png'),
(2, 6, 'uploads/pozadi2.png'),
(3, 6, 'uploads/pozadi3.webp');

-- --------------------------------------------------------

--
-- Struktura tabulky `chat_rooms`
--

CREATE TABLE `chat_rooms` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_by` int(11) NOT NULL,
  `description` int(11) NOT NULL,
  `baterie` int(11) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Vypisuji data pro tabulku `chat_rooms`
--

INSERT INTO `chat_rooms` (`id`, `name`, `created_by`, `description`, `baterie`, `image`, `user_id`) VALUES
(5, 'fghgfh', 1, 0, 0, '', 0),
(6, 'fichtl', 1, 0, 0, '', 0),
(7, 'MANTIS 8', 1, 0, 0, 'uploads/286993_174934672576652_6799269_o.jpg', 0),
(8, 'minecraft', 1, 0, 0, 'uploads/IMG_0081.jpeg', 0),
(9, 'hej hej test ej', 3, 0, 0, '', 0),
(11, 'nabíjení kolobezek', 1, 0, 0, '', 0);

-- --------------------------------------------------------

--
-- Struktura tabulky `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `topic_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `comment` text NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Vypisuji data pro tabulku `comments`
--

INSERT INTO `comments` (`id`, `topic_id`, `user_id`, `comment`, `image`, `created_at`) VALUES
(1, 4, 1, 'kokos', '', '2024-06-29 07:14:04'),
(2, 4, 1, 'jo, to byl dan ještě mladej', '', '2024-06-29 07:55:50'),
(3, 6, 1, 'ne to dělat nebudeme !!', '', '2024-06-29 08:57:59'),
(4, 3, 1, 'ne to opvradu nejsou', '', '2024-06-29 21:51:59');

-- --------------------------------------------------------

--
-- Struktura tabulky `manufacturers`
--

CREATE TABLE `manufacturers` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Vypisuji data pro tabulku `manufacturers`
--

INSERT INTO `manufacturers` (`id`, `name`) VALUES
(10, 'Apollo'),
(14, 'Dualtron'),
(4, 'Gotrax'),
(7, 'Hover-1'),
(13, 'Kaabo'),
(12, 'Kugoo'),
(11, 'Mercane'),
(5, 'Ninebot'),
(3, 'Razor'),
(2, 'Segway'),
(6, 'Swagtron'),
(9, 'TurboAnt'),
(8, 'Unagi'),
(1, 'Xiaomi'),
(15, 'Zero');

-- --------------------------------------------------------

--
-- Struktura tabulky `messages`
--

CREATE TABLE `messages` (
  `id` int(11) NOT NULL,
  `room_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Vypisuji data pro tabulku `messages`
--

INSERT INTO `messages` (`id`, `room_id`, `user_id`, `message`, `image`, `created_at`) VALUES
(1, 5, 1, 'ahoj\r\n', '', '2024-06-29 07:50:44'),
(2, 8, 1, 'tak tady to nebude', 'uploads/IMG_5387.JPEG', '2024-06-29 08:11:42'),
(3, 8, 1, 'nene to máš pravdu', '', '2024-06-29 08:11:55'),
(4, 6, 1, 'aha', NULL, '2024-06-29 08:14:09'),
(5, 7, 1, 'kokot', 'uploads/IMG_5387.JPEG', '2024-06-29 08:16:03'),
(6, 9, 3, 'aha', '', '2024-06-29 08:56:46'),
(7, 9, 3, 'nene', '', '2024-06-29 08:56:57'),
(8, 7, 1, 'to jsem takhle jednou byl na koloběžce a jel jsem prostě rovně ', '', '2024-06-29 17:31:02'),
(9, 7, 1, 'faaaaaaaaaaaaakt, neříkej', '', '2024-06-29 17:31:13'),
(10, 8, 1, 'ty zmrde\r\n', NULL, '2024-06-29 21:40:57'),
(11, 8, 1, 'jak to pěkně funguje', NULL, '2024-06-29 21:41:03'),
(12, 8, 1, 'jen se teda po každé zprávě stránka relogne ..\r\n', NULL, '2024-06-29 21:41:14');

-- --------------------------------------------------------

--
-- Struktura tabulky `models`
--

CREATE TABLE `models` (
  `id` int(11) NOT NULL,
  `manufacturer_id` int(11) NOT NULL,
  `model_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Vypisuji data pro tabulku `models`
--

INSERT INTO `models` (`id`, `manufacturer_id`, `model_name`) VALUES
(1, 1, 'Mi Electric Scooter'),
(2, 1, 'Mi Electric Scooter Pro 2'),
(3, 1, 'Mi Electric Scooter Essential'),
(4, 1, 'Mi Electric Scooter 1S'),
(5, 1, 'Mi Electric Scooter M365'),
(6, 2, 'Ninebot MAX'),
(7, 2, 'Ninebot ES2'),
(8, 2, 'Ninebot ES4'),
(9, 2, 'Ninebot E22'),
(10, 2, 'Ninebot E25'),
(11, 3, 'E300'),
(12, 3, 'E100'),
(13, 3, 'E200'),
(14, 3, 'EcoSmart Metro'),
(15, 3, 'Power Core E90'),
(16, 4, 'GXL V2'),
(17, 4, 'XR Ultra'),
(18, 4, 'XR Elite'),
(19, 4, 'G2'),
(20, 4, 'G4'),
(21, 5, 'Air T15'),
(22, 5, 'ZING E8'),
(23, 5, 'ZING E10'),
(24, 5, 'KickScooter MAX'),
(25, 5, 'KickScooter ES1'),
(26, 6, 'Swagger 5'),
(27, 6, 'Swagger 7'),
(28, 6, 'Swagger 8'),
(29, 6, 'Swagger 9'),
(30, 6, 'Swagger 10'),
(31, 7, 'Alpha'),
(32, 7, 'Journey'),
(33, 7, 'Rally'),
(34, 7, 'Aviator'),
(35, 7, 'Eagle'),
(36, 8, 'Model One E250'),
(37, 8, 'Model One E500'),
(38, 9, 'X7 Pro'),
(39, 9, 'X7'),
(40, 9, 'M10'),
(41, 9, 'M10 Lite'),
(42, 9, 'S1'),
(43, 10, 'City'),
(44, 10, 'Explore'),
(45, 10, 'Ghost'),
(46, 10, 'Pro'),
(47, 10, 'Light'),
(48, 11, 'WideWheel'),
(49, 11, 'WideWheel Pro'),
(50, 11, 'MX60'),
(51, 11, 'Single Motor'),
(52, 11, 'Dual Motor'),
(53, 12, 'S1'),
(54, 12, 'S1 Pro'),
(55, 12, 'M2 Pro'),
(56, 12, 'Kirin M4'),
(57, 12, 'G-Booster'),
(58, 13, 'Wolf Warrior 11'),
(59, 13, 'Mantis'),
(60, 13, 'Skywalker 10S+'),
(61, 13, 'Skywalker 8H'),
(62, 13, 'Air'),
(63, 14, 'Thunder'),
(64, 14, 'Ultra'),
(65, 14, 'Compact'),
(66, 14, 'Spider'),
(67, 14, 'Eagle Pro'),
(68, 15, '8'),
(69, 15, '9'),
(70, 15, '10'),
(71, 15, '11X'),
(72, 15, '10X');

-- --------------------------------------------------------

--
-- Struktura tabulky `polls`
--

CREATE TABLE `polls` (
  `id` int(11) NOT NULL,
  `room_id` int(11) NOT NULL,
  `question` text NOT NULL,
  `duration` enum('10 minutes','1 day') NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktura tabulky `ratings`
--

CREATE TABLE `ratings` (
  `id` int(11) NOT NULL,
  `topic_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `rating` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Vypisuji data pro tabulku `ratings`
--

INSERT INTO `ratings` (`id`, `topic_id`, `user_id`, `rating`, `created_at`) VALUES
(1, 4, 1, 1, '2024-06-29 07:13:55'),
(2, 6, 1, 3, '2024-06-29 08:57:53');

-- --------------------------------------------------------

--
-- Struktura tabulky `topics`
--

CREATE TABLE `topics` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `image` varchar(255) DEFAULT NULL,
  `description` text NOT NULL,
  `view_count` int(11) DEFAULT 0,
  `comment_count` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Vypisuji data pro tabulku `topics`
--

INSERT INTO `topics` (`id`, `title`, `user_id`, `created_at`, `image`, `description`, `view_count`, `comment_count`) VALUES
(3, 'kokosy na stromu nejsou ', 1, '2024-06-29 07:08:28', '', '', 5, 1),
(4, 'dennis to mozna da', 1, '2024-06-29 07:13:36', 'uploads/IMG_0081.jpeg', 'tady budou nějaky slova a tak dile ', 16, 2),
(6, 'srážení cyklistů ', 3, '2024-06-29 08:57:25', 'uploads/pozadi3.webp', 'nebudem to dělat', 11, 1);

-- --------------------------------------------------------

--
-- Struktura tabulky `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `nickname` varchar(50) NOT NULL,
  `ip_address` varchar(255) NOT NULL,
  `profile_image` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Vypisuji data pro tabulku `users`
--

INSERT INTO `users` (`id`, `nickname`, `ip_address`, `profile_image`) VALUES
(1, 'jahodovydurex', '', 'uploads/profiles/DSCI1158.JPG'),
(3, 'kokotdoprdele', '::1', NULL),
(4, 'jahodovydurex', '78.108.108.159', 'uploads/profiles/DSCI1158.JPG'),
(5, 'admin', '78.108.108.159', NULL);

-- --------------------------------------------------------

--
-- Struktura tabulky `votes`
--

CREATE TABLE `votes` (
  `id` int(11) NOT NULL,
  `poll_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `vote` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexy pro exportované tabulky
--

--
-- Indexy pro tabulku `ads`
--
ALTER TABLE `ads`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `manufacturer_id` (`manufacturer_id`),
  ADD KEY `model_id` (`model_id`);

--
-- Indexy pro tabulku `ad_images`
--
ALTER TABLE `ad_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ad_id` (`ad_id`);

--
-- Indexy pro tabulku `chat_rooms`
--
ALTER TABLE `chat_rooms`
  ADD PRIMARY KEY (`id`),
  ADD KEY `created_by` (`created_by`);

--
-- Indexy pro tabulku `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `topic_id` (`topic_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexy pro tabulku `manufacturers`
--
ALTER TABLE `manufacturers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexy pro tabulku `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `room_id` (`room_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexy pro tabulku `models`
--
ALTER TABLE `models`
  ADD PRIMARY KEY (`id`),
  ADD KEY `manufacturer_id` (`manufacturer_id`);

--
-- Indexy pro tabulku `polls`
--
ALTER TABLE `polls`
  ADD PRIMARY KEY (`id`),
  ADD KEY `room_id` (`room_id`);

--
-- Indexy pro tabulku `ratings`
--
ALTER TABLE `ratings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `topic_id` (`topic_id`,`user_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexy pro tabulku `topics`
--
ALTER TABLE `topics`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexy pro tabulku `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexy pro tabulku `votes`
--
ALTER TABLE `votes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `poll_id` (`poll_id`),
  ADD KEY `user_id` (`user_id`);

--
-- AUTO_INCREMENT pro tabulky
--

--
-- AUTO_INCREMENT pro tabulku `ads`
--
ALTER TABLE `ads`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pro tabulku `ad_images`
--
ALTER TABLE `ad_images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pro tabulku `chat_rooms`
--
ALTER TABLE `chat_rooms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT pro tabulku `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pro tabulku `manufacturers`
--
ALTER TABLE `manufacturers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=77;

--
-- AUTO_INCREMENT pro tabulku `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT pro tabulku `models`
--
ALTER TABLE `models`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT pro tabulku `polls`
--
ALTER TABLE `polls`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pro tabulku `ratings`
--
ALTER TABLE `ratings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pro tabulku `topics`
--
ALTER TABLE `topics`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pro tabulku `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pro tabulku `votes`
--
ALTER TABLE `votes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Omezení pro exportované tabulky
--

--
-- Omezení pro tabulku `ads`
--
ALTER TABLE `ads`
  ADD CONSTRAINT `ads_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `ads_ibfk_2` FOREIGN KEY (`manufacturer_id`) REFERENCES `manufacturers` (`id`),
  ADD CONSTRAINT `ads_ibfk_3` FOREIGN KEY (`model_id`) REFERENCES `models` (`id`);

--
-- Omezení pro tabulku `ad_images`
--
ALTER TABLE `ad_images`
  ADD CONSTRAINT `ad_images_ibfk_1` FOREIGN KEY (`ad_id`) REFERENCES `ads` (`id`) ON DELETE CASCADE;

--
-- Omezení pro tabulku `chat_rooms`
--
ALTER TABLE `chat_rooms`
  ADD CONSTRAINT `chat_rooms_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`);

--
-- Omezení pro tabulku `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`topic_id`) REFERENCES `topics` (`id`),
  ADD CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Omezení pro tabulku `messages`
--
ALTER TABLE `messages`
  ADD CONSTRAINT `messages_ibfk_1` FOREIGN KEY (`room_id`) REFERENCES `chat_rooms` (`id`),
  ADD CONSTRAINT `messages_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Omezení pro tabulku `models`
--
ALTER TABLE `models`
  ADD CONSTRAINT `models_ibfk_1` FOREIGN KEY (`manufacturer_id`) REFERENCES `manufacturers` (`id`);

--
-- Omezení pro tabulku `polls`
--
ALTER TABLE `polls`
  ADD CONSTRAINT `polls_ibfk_1` FOREIGN KEY (`room_id`) REFERENCES `chat_rooms` (`id`);

--
-- Omezení pro tabulku `ratings`
--
ALTER TABLE `ratings`
  ADD CONSTRAINT `ratings_ibfk_1` FOREIGN KEY (`topic_id`) REFERENCES `topics` (`id`),
  ADD CONSTRAINT `ratings_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Omezení pro tabulku `topics`
--
ALTER TABLE `topics`
  ADD CONSTRAINT `topics_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Omezení pro tabulku `votes`
--
ALTER TABLE `votes`
  ADD CONSTRAINT `votes_ibfk_1` FOREIGN KEY (`poll_id`) REFERENCES `polls` (`id`),
  ADD CONSTRAINT `votes_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
