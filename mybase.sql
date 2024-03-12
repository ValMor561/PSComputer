-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Мар 12 2024 г., 11:44
-- Версия сервера: 10.4.28-MariaDB
-- Версия PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `mybase`
--

-- --------------------------------------------------------

--
-- Структура таблицы `pc`
--

CREATE TABLE `pc` (
  `id_pc` int(11) NOT NULL,
  `date_pc` timestamp NOT NULL DEFAULT current_timestamp(),
  `name_pc` varchar(255) NOT NULL,
  `domain_pc` varchar(255) NOT NULL,
  `owner_pc` varchar(255) NOT NULL,
  `totalmemory_pc` varchar(255) NOT NULL,
  `osCaption_pc` varchar(255) NOT NULL,
  `boardManufacturer_pc` varchar(255) NOT NULL,
  `boardProduct_pc` varchar(255) NOT NULL,
  `boardSerial_pc` varchar(255) NOT NULL,
  `procName_pc` varchar(255) NOT NULL,
  `procSocket_pc` varchar(255) NOT NULL,
  `memory_pc` varchar(512) NOT NULL,
  `drive_pc` text NOT NULL,
  `video_pc` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `pc`
--

INSERT INTO `pc` (`id_pc`, `date_pc`, `name_pc`, `domain_pc`, `owner_pc`, `totalmemory_pc`, `osCaption_pc`, `boardManufacturer_pc`, `boardProduct_pc`, `boardSerial_pc`, `procName_pc`, `procSocket_pc`, `memory_pc`, `drive_pc`, `video_pc`) VALUES
(1, '2024-03-12 10:40:09', 'DESKTOP-NVK3T6L', 'WORKGROUP', 'ValMor', '32 GB', 'Майкрософт Windows 10 Pro', 'Micro-Star International Co., Ltd.', 'MAG B660 TOMAHAWK WIFI DDR4 (MS-7D41)', '07D4111_M61E214170', '12th Gen Intel(R) Core(TM) i7-12700F', 'U3E1', '', 'Name=ADATA SX8200PNP -- SN=2M432LANBNEX        _00000001. -- Size=954 GB', 'NVIDIA GeForce RTX 3070 Ti');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `pc`
--
ALTER TABLE `pc`
  ADD PRIMARY KEY (`id_pc`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `pc`
--
ALTER TABLE `pc`
  MODIFY `id_pc` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
