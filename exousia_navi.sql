-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 13, 2023 at 08:41 PM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `exousia_navi`
--

-- --------------------------------------------------------

--
-- Table structure for table `abbrevs`
--

CREATE TABLE `abbrevs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `facility_id` bigint(20) UNSIGNED NOT NULL,
  `abbrev` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `abbrevs`
--

INSERT INTO `abbrevs` (`id`, `facility_id`, `abbrev`, `created_at`, `updated_at`) VALUES
(5, 5, 'GHQ', '2023-11-17 19:51:28', '2023-12-11 12:15:45'),
(6, 6, 'SL', '2023-11-17 19:51:28', '2023-12-11 12:15:45'),
(7, 7, 'SSP', '2023-11-17 19:51:28', '2023-12-11 12:15:45'),
(8, 8, 'P', '2023-11-17 19:51:28', '2023-12-11 12:15:45'),
(9, 9, 'AO', '2023-11-18 12:06:43', '2023-12-11 12:15:45'),
(10, 10, 'TFOI', '2023-11-18 12:06:43', '2023-12-11 12:16:59'),
(11, 11, 'L', '2023-11-18 12:06:43', '2023-11-18 12:06:43'),
(12, 12, 'R1', '2023-11-18 12:06:43', '2023-12-11 12:16:59'),
(13, 13, 'R1N', '2023-11-18 12:06:43', '2023-12-11 12:16:59'),
(14, 14, 'GOG', '2023-11-18 12:06:43', '2023-12-11 12:16:59'),
(15, 15, 'C', '2023-11-18 12:06:43', '2023-12-11 12:16:59'),
(16, 16, 'OOSA', '2023-11-18 12:06:43', '2023-12-11 12:19:02'),
(17, 17, 'DRR', '2023-11-18 12:06:43', '2023-12-11 12:19:02'),
(18, 18, 'EDFT', '2023-11-18 12:06:43', '2023-12-11 12:19:02'),
(19, 19, 'MRV', '2023-11-18 12:06:44', '2023-12-11 12:19:02'),
(20, 20, 'FRL', '2023-11-18 12:06:44', '2023-12-11 12:19:02'),
(21, 21, 'CR', '2023-11-28 23:35:39', '2023-12-02 23:41:28'),
(22, 22, 'LT', '2023-11-28 23:35:39', '2023-12-02 23:41:28'),
(23, 23, 'SRT', '2023-11-28 23:35:39', '2023-12-02 23:41:28'),
(24, 24, 'CL1', '2023-11-28 23:35:39', '2023-12-02 23:41:28'),
(25, 25, 'CL2', '2023-11-28 23:35:39', '2023-12-02 23:41:28'),
(26, 26, 'CL3', '2023-11-28 23:35:39', '2023-12-02 23:41:28'),
(27, 27, 'CDF', '2023-11-28 23:35:39', '2023-12-02 23:41:28'),
(28, 28, 'MRO', '2023-11-28 23:35:40', '2023-12-02 23:41:28'),
(29, 29, 'FRU', '2023-11-28 23:35:40', '2023-12-02 23:41:28'),
(30, 30, 'R3O', '2023-11-28 23:37:38', '2023-12-02 23:41:28'),
(31, 31, 'R3J', '2023-11-28 23:37:38', '2023-12-02 23:41:28'),
(32, 32, 'R3M', '2023-11-28 23:37:38', '2023-12-02 23:41:28'),
(33, 33, 'R3', '2023-11-28 23:37:38', '2023-12-02 23:41:28'),
(34, 34, 'CRA', '2023-11-28 23:37:39', '2023-12-02 23:41:28'),
(35, 35, 'SRS', '2023-11-28 23:37:39', '2023-12-02 23:41:28'),
(36, 36, 'GEFR', '2023-11-28 23:37:39', '2023-12-02 23:41:28'),
(37, 37, 'R4', '2023-11-28 23:40:02', '2023-12-02 23:41:28'),
(38, 38, 'R4U', '2023-11-28 23:40:02', '2023-12-02 23:41:29'),
(39, 39, 'R4J', '2023-11-28 23:40:02', '2023-12-02 23:41:29'),
(40, 40, 'CL', '2023-11-28 23:40:02', '2023-12-02 23:41:29'),
(41, 41, 'PLZ', '2023-11-28 23:40:02', '2023-12-11 09:24:25'),
(42, 42, 'MTRL', '2023-11-28 23:40:02', '2023-12-11 09:24:25'),
(43, 43, 'MRT', '2023-11-28 23:40:02', '2023-12-11 09:24:25'),
(44, 44, 'FRJ', '2023-11-28 23:40:02', '2023-12-11 09:24:25'),
(45, 45, 'R5V', '2023-11-28 23:43:09', '2023-12-11 09:24:25'),
(46, 46, 'R5', '2023-11-28 23:43:09', '2023-12-11 09:24:49'),
(47, 47, 'R5X', '2023-11-28 23:43:09', '2023-12-11 09:24:49'),
(48, 48, 'KLT', '2023-11-28 23:43:09', '2023-12-11 09:24:49'),
(49, 49, 'MBARE', '2023-11-28 23:43:09', '2023-12-11 09:24:49'),
(50, 50, 'PASW', '2023-11-28 23:43:09', '2023-12-11 09:24:49'),
(51, 51, 'SASR', '2023-11-28 23:43:09', '2023-12-02 23:41:29'),
(52, 52, 'HDF', '2023-11-28 23:43:09', '2023-12-02 23:41:29'),
(53, 53, 'MR', '2023-11-28 23:43:09', '2023-12-02 23:41:29'),
(54, 54, 'FR', '2023-11-28 23:43:09', '2023-12-02 23:41:29'),
(55, 55, 'T', '2023-12-12 10:02:19', '2023-12-12 10:02:19'),
(56, 56, 'TO', '2023-12-12 10:02:19', '2023-12-12 10:02:19'),
(57, 57, 'GH', '2023-12-13 10:31:34', '2023-12-13 11:02:35'),
(58, 58, 'SLX', '2023-12-13 10:31:34', '2023-12-13 11:02:35'),
(59, 59, 'SSPU', '2023-12-13 10:31:34', '2023-12-13 11:02:35'),
(60, 60, 'LZ', '2023-12-13 10:31:34', '2023-12-13 11:01:53'),
(61, 61, 'TFO', '2023-12-13 10:31:35', '2023-12-13 11:02:35'),
(62, 62, 'AOO', '2023-12-13 10:31:35', '2023-12-13 11:02:35'),
(63, 63, 'PR', '2023-12-13 10:31:35', '2023-12-13 11:03:50'),
(64, 64, 'R1I', '2023-12-13 10:31:35', '2023-12-13 11:03:50'),
(65, 65, 'R1Y', '2023-12-13 10:31:35', '2023-12-13 11:03:50'),
(66, 66, 'GO', '2023-12-13 10:31:35', '2023-12-13 11:03:51'),
(67, 67, 'CS', '2023-12-13 10:31:35', '2023-12-13 11:03:51'),
(68, 68, 'OOSAF', '2023-12-13 10:31:35', '2023-12-13 11:05:16'),
(69, 69, 'AOX', '2023-12-13 10:31:35', '2023-12-13 11:05:16'),
(70, 70, 'DRK', '2023-12-13 10:31:35', '2023-12-13 11:05:16'),
(71, 71, 'EDFG', '2023-12-13 10:31:35', '2023-12-13 11:05:16'),
(72, 72, 'MRI', '2023-12-13 10:31:35', '2023-12-13 11:05:16'),
(73, 73, 'FRP', '2023-12-13 10:31:35', '2023-12-13 11:39:56'),
(74, 74, 'CW', '2023-12-13 10:33:43', '2023-12-13 11:39:56'),
(75, 75, 'LA', '2023-12-13 10:33:43', '2023-12-13 11:39:56'),
(76, 76, 'SR', '2023-12-13 10:33:43', '2023-12-13 11:39:56'),
(77, 77, 'CL1D', '2023-12-13 10:33:43', '2023-12-13 11:39:56'),
(78, 78, 'CL2M', '2023-12-13 10:33:43', '2023-12-13 11:40:43'),
(79, 79, 'CL3A', '2023-12-13 10:33:43', '2023-12-13 11:40:44'),
(80, 80, 'CDFK', '2023-12-13 10:33:43', '2023-12-13 11:40:44'),
(81, 81, 'MRD', '2023-12-13 10:33:43', '2023-12-13 11:40:44'),
(82, 82, 'FRQ', '2023-12-13 10:33:43', '2023-12-13 11:40:44'),
(83, 83, 'R3X', '2023-12-13 10:35:09', '2023-12-13 10:35:09'),
(84, 84, 'R3Q', '2023-12-13 10:35:09', '2023-12-13 10:35:09'),
(85, 85, 'R3U', '2023-12-13 10:35:09', '2023-12-13 10:35:09'),
(86, 86, 'R3A', '2023-12-13 10:35:09', '2023-12-13 10:35:09'),
(87, 87, 'CRH', '2023-12-13 10:35:09', '2023-12-13 10:35:09'),
(88, 88, 'SRV', '2023-12-13 10:35:09', '2023-12-13 10:35:09'),
(89, 89, 'GEFRA', '2023-12-13 10:35:09', '2023-12-13 10:35:09'),
(90, 90, 'R4F', '2023-12-13 10:37:39', '2023-12-13 10:37:39'),
(91, 91, 'R4P', '2023-12-13 10:37:39', '2023-12-13 10:37:39'),
(92, 92, 'R4K', '2023-12-13 10:37:40', '2023-12-13 10:37:40'),
(93, 93, 'CLU', '2023-12-13 10:37:40', '2023-12-13 10:37:40'),
(94, 94, 'PL', '2023-12-13 10:37:40', '2023-12-13 10:37:40'),
(95, 95, 'MTR', '2023-12-13 10:37:40', '2023-12-13 10:37:40'),
(96, 96, 'MRY', '2023-12-13 10:37:41', '2023-12-13 10:37:41'),
(97, 97, 'FRC', '2023-12-13 10:37:41', '2023-12-13 10:37:41'),
(98, 98, 'R5W', '2023-12-13 10:40:32', '2023-12-13 10:40:32'),
(99, 99, 'R5A', '2023-12-13 10:40:32', '2023-12-13 10:40:32'),
(100, 100, 'R5O', '2023-12-13 10:40:32', '2023-12-13 10:40:32'),
(101, 101, 'KL', '2023-12-13 10:40:32', '2023-12-13 10:40:32'),
(102, 102, 'MB&R', '2023-12-13 10:40:32', '2023-12-13 10:40:32'),
(103, 103, 'P&S', '2023-12-13 10:40:32', '2023-12-13 10:40:32'),
(104, 104, 'S&SR', '2023-12-13 10:40:32', '2023-12-13 10:40:32'),
(105, 105, 'HDFO', '2023-12-13 10:40:32', '2023-12-13 10:40:32'),
(106, 106, 'MRJ', '2023-12-13 10:40:32', '2023-12-13 10:40:32'),
(107, 107, 'FRA', '2023-12-13 10:40:32', '2023-12-13 10:40:32');

-- --------------------------------------------------------

--
-- Table structure for table `default_facilities`
--

CREATE TABLE `default_facilities` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `facilities` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `floor` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `color` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `default_facilities`
--

INSERT INTO `default_facilities` (`id`, `facilities`, `floor`, `color`, `created_at`, `updated_at`) VALUES
(2, 'wall', 'all', '#0e8218', '2023-12-11 06:49:51', '2023-12-11 06:49:51'),
(3, 'front', 'all', '#0e8218', '2023-12-11 06:49:51', '2023-12-11 06:49:51'),
(4, 'stair-in', 'all', '#0e8218', '2023-12-11 06:49:51', '2023-12-11 06:49:51');

-- --------------------------------------------------------

--
-- Table structure for table `eastwoods_facilities`
--

CREATE TABLE `eastwoods_facilities` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `facilities` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `operation_time` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `floor` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `color` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '#999'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `eastwoods_facilities`
--

INSERT INTO `eastwoods_facilities` (`id`, `facilities`, `operation_time`, `created_at`, `updated_at`, `floor`, `color`) VALUES
(57, 'guard house', '2023-12-13 19:02:35', '2023-12-13 10:31:34', '2023-12-13 11:02:35', 'ground-floor', '#0770c0'),
(58, 'student lounge', '2023-12-13 19:02:35', '2023-12-13 10:31:34', '2023-12-13 11:02:35', 'ground-floor', '#cbc525'),
(59, 'school service parking', '2023-12-13 19:02:35', '2023-12-13 10:31:34', '2023-12-13 11:02:35', 'ground-floor', '#b6c214'),
(61, 'tesda focal office', '2023-12-13 19:02:35', '2023-12-13 10:31:34', '2023-12-13 11:02:35', 'ground-floor', '#107abc'),
(62, 'administration office', '2023-12-13 19:02:35', '2023-12-13 10:31:35', '2023-12-13 11:02:35', 'ground-floor', '#06366a'),
(63, 'pe room', '2023-12-13 19:03:50', '2023-12-13 10:31:35', '2023-12-13 11:03:50', 'ground-floor', '#405b2f'),
(64, 'room 101', '2023-12-13 19:03:50', '2023-12-13 10:31:35', '2023-12-13 11:03:50', 'ground-floor', '#3d9948'),
(65, 'room 102', '2023-12-13 19:03:50', '2023-12-13 10:31:35', '2023-12-13 11:03:50', 'ground-floor', '#409735'),
(66, 'guidance office', '2023-12-13 19:03:50', '2023-12-13 10:31:35', '2023-12-13 11:03:51', 'ground-floor', '#1e5571'),
(67, 'canteen', '2023-12-13 19:03:51', '2023-12-13 10:31:35', '2023-12-13 11:03:51', 'ground-floor', '#75661a'),
(68, 'office of student affairs', '2023-12-13 19:05:16', '2023-12-13 10:31:35', '2023-12-13 11:05:16', 'ground-floor', '#0e4477'),
(69, 'admission office', '2023-12-13 19:05:16', '2023-12-13 10:31:35', '2023-12-13 11:05:16', 'ground-floor', '#1652ca'),
(70, 'drawing room', '2023-12-13 19:05:16', '2023-12-13 10:31:35', '2023-12-13 11:05:16', 'ground-floor', '#155bcb'),
(71, 'engineering department faculty', '2023-12-13 19:05:16', '2023-12-13 10:31:35', '2023-12-13 11:05:16', 'ground-floor', '#1cb542'),
(72, 'male restroom', '2023-12-13 19:05:16', '2023-12-13 10:31:35', '2023-12-13 11:05:16', 'ground-floor', '#903752'),
(73, 'female restroom', '2023-12-13 19:39:56', '2023-12-13 10:31:35', '2023-12-13 11:39:56', 'ground-floor', '#974964'),
(74, 'clinic', '2023-12-13 19:39:56', '2023-12-13 10:33:43', '2023-12-13 11:39:56', 'floor-2', '#d32222'),
(75, 'library', '2023-12-13 19:39:56', '2023-12-13 10:33:43', '2023-12-13 11:39:56', 'floor-2', '#1c939c'),
(76, 'server room', '2023-12-13 19:39:56', '2023-12-13 10:33:43', '2023-12-13 11:39:56', 'floor-2', '#248ea3'),
(77, 'computer laboratory 1', '2023-12-13 19:39:56', '2023-12-13 10:33:43', '2023-12-13 11:39:56', 'floor-2', '#052542'),
(78, 'computer laboratory 2', '2023-12-13 19:40:43', '2023-12-13 10:33:43', '2023-12-13 11:40:43', 'floor-2', '#1c4c63'),
(79, 'computer laboratory 3', '2023-12-13 19:40:44', '2023-12-13 10:33:43', '2023-12-13 11:40:44', 'floor-2', '#306cab'),
(80, 'cs department faculty', '2023-12-13 19:40:44', '2023-12-13 10:33:43', '2023-12-13 11:40:44', 'floor-2', '#b76262'),
(81, 'male restroom', '2023-12-13 19:40:44', '2023-12-13 10:33:43', '2023-12-13 11:40:44', 'floor-2', '#b25353'),
(82, 'female restroom', '2023-12-13 19:40:44', '2023-12-13 10:33:43', '2023-12-13 11:40:44', 'floor-2', '#bc576b'),
(83, 'room 301', '2023-12-13 18:35:09', '2023-12-13 10:35:09', '2023-12-13 10:35:09', 'floor-3', '#999999'),
(84, 'room 302', '2023-12-13 18:35:09', '2023-12-13 10:35:09', '2023-12-13 10:35:09', 'floor-3', '#999999'),
(85, 'room 303', '2023-12-13 18:35:09', '2023-12-13 10:35:09', '2023-12-13 10:35:09', 'floor-3', '#999999'),
(86, 'room 304', '2023-12-13 18:35:09', '2023-12-13 10:35:09', '2023-12-13 10:35:09', 'floor-3', '#999999'),
(87, 'caregiving room', '2023-12-13 18:35:09', '2023-12-13 10:35:09', '2023-12-13 10:35:09', 'floor-3', '#999999'),
(88, 'storage room', '2023-12-13 18:35:09', '2023-12-13 10:35:09', '2023-12-13 10:35:09', 'floor-3', '#999999'),
(89, 'gen ed faculty room', '2023-12-13 18:35:09', '2023-12-13 10:35:09', '2023-12-13 10:35:09', 'floor-3', '#999999'),
(90, 'room 401', '2023-12-13 18:37:39', '2023-12-13 10:37:39', '2023-12-13 10:37:39', 'floor-4', '#999999'),
(91, 'room 402', '2023-12-13 18:37:39', '2023-12-13 10:37:39', '2023-12-13 10:37:39', 'floor-4', '#999999'),
(92, 'room 403', '2023-12-13 18:37:39', '2023-12-13 10:37:39', '2023-12-13 10:37:39', 'floor-4', '#999999'),
(93, 'chemistry laboratory', '2023-12-13 18:37:40', '2023-12-13 10:37:40', '2023-12-13 10:37:40', 'floor-4', '#999999'),
(94, 'physics laboratory', '2023-12-13 18:37:40', '2023-12-13 10:37:40', '2023-12-13 10:37:40', 'floor-4', '#999999'),
(95, 'massage therapy room', '2023-12-13 18:37:40', '2023-12-13 10:37:40', '2023-12-13 10:37:40', 'floor-4', '#999999'),
(96, 'male restroom', '2023-12-13 18:37:41', '2023-12-13 10:37:41', '2023-12-13 10:37:41', 'floor-4', '#999999'),
(97, 'female restroom', '2023-12-13 18:37:41', '2023-12-13 10:37:41', '2023-12-13 10:37:41', 'floor-4', '#999999'),
(98, 'room 501', '2023-12-13 18:40:32', '2023-12-13 10:40:32', '2023-12-13 10:40:32', 'floor-5', '#999999'),
(99, 'room 502', '2023-12-13 18:40:32', '2023-12-13 10:40:32', '2023-12-13 10:40:32', 'floor-5', '#999999'),
(100, 'room 503', '2023-12-13 18:40:32', '2023-12-13 10:40:32', '2023-12-13 10:40:32', 'floor-5', '#999999'),
(101, 'kitchen laboratory', '2023-12-13 18:40:32', '2023-12-13 10:40:32', '2023-12-13 10:40:32', 'floor-5', '#999999'),
(102, 'mini bar & restaurant', '2023-12-13 18:40:32', '2023-12-13 10:40:32', '2023-12-13 10:40:32', 'floor-5', '#999999'),
(103, 'pantry & storage', '2023-12-13 18:40:32', '2023-12-13 10:40:32', '2023-12-13 10:40:32', 'floor-5', '#999999'),
(104, 'standard & suite room', '2023-12-13 18:40:32', '2023-12-13 10:40:32', '2023-12-13 10:40:32', 'floor-5', '#999999'),
(105, 'hm department faculty', '2023-12-13 18:40:32', '2023-12-13 10:40:32', '2023-12-13 10:40:32', 'floor-5', '#999999'),
(106, 'male restroom', '2023-12-13 18:40:32', '2023-12-13 10:40:32', '2023-12-13 10:40:32', 'floor-5', '#999999'),
(107, 'female restroom', '2023-12-13 18:40:32', '2023-12-13 10:40:32', '2023-12-13 10:40:32', 'floor-5', '#999999');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `floorplans`
--

CREATE TABLE `floorplans` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `floor` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gridSize` bigint(20) NOT NULL,
  `gridDetails` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`gridDetails`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `floorplans`
--

INSERT INTO `floorplans` (`id`, `floor`, `gridSize`, `gridDetails`, `created_at`, `updated_at`) VALUES
(25, 'ground-floor', 140, '[{\"x\":\"0\",\"y\":\"0\",\"width\":\"60\",\"height\":\"60\",\"row\":\"1\",\"column\":\"1\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"0\",\"y\":\"1\",\"width\":\"60\",\"height\":\"60\",\"row\":\"2\",\"column\":\"1\",\"isBlock\":\"true\",\"label\":\"EDFG\",\"sublabel\":\"engineering department faculty\",\"abbrev\":null,\"door\":null,\"bgcolor\":\"#1cb542\"},{\"x\":\"0\",\"y\":\"2\",\"width\":\"60\",\"height\":\"60\",\"row\":\"3\",\"column\":\"1\",\"isBlock\":\"true\",\"label\":\"EDFG\",\"sublabel\":\"engineering department faculty\",\"abbrev\":null,\"door\":\"true\",\"bgcolor\":\"#1cb542\"},{\"x\":\"0\",\"y\":\"3\",\"width\":\"60\",\"height\":\"60\",\"row\":\"4\",\"column\":\"1\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"0\",\"y\":\"4\",\"width\":\"60\",\"height\":\"60\",\"row\":\"5\",\"column\":\"1\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"0\",\"y\":\"5\",\"width\":\"60\",\"height\":\"60\",\"row\":\"6\",\"column\":\"1\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"0\",\"y\":\"6\",\"width\":\"60\",\"height\":\"60\",\"row\":\"7\",\"column\":\"1\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"0\",\"y\":\"7\",\"width\":\"60\",\"height\":\"60\",\"row\":\"8\",\"column\":\"1\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"0\",\"y\":\"8\",\"width\":\"60\",\"height\":\"60\",\"row\":\"9\",\"column\":\"1\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"0\",\"y\":\"9\",\"width\":\"60\",\"height\":\"60\",\"row\":\"10\",\"column\":\"1\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"0\",\"y\":\"10\",\"width\":\"60\",\"height\":\"60\",\"row\":\"11\",\"column\":\"1\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"0\",\"y\":\"11\",\"width\":\"60\",\"height\":\"60\",\"row\":\"12\",\"column\":\"1\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"0\",\"y\":\"12\",\"width\":\"60\",\"height\":\"60\",\"row\":\"13\",\"column\":\"1\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"0\",\"y\":\"13\",\"width\":\"60\",\"height\":\"60\",\"row\":\"14\",\"column\":\"1\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"1\",\"y\":\"0\",\"width\":\"60\",\"height\":\"60\",\"row\":\"1\",\"column\":\"2\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"1\",\"y\":\"1\",\"width\":\"60\",\"height\":\"60\",\"row\":\"2\",\"column\":\"2\",\"isBlock\":\"true\",\"label\":\"DRK\",\"sublabel\":\"drawing room\",\"abbrev\":null,\"door\":null,\"bgcolor\":\"#155bcb\"},{\"x\":\"1\",\"y\":\"2\",\"width\":\"60\",\"height\":\"60\",\"row\":\"3\",\"column\":\"2\",\"isBlock\":\"true\",\"label\":\"DRK\",\"sublabel\":\"drawing room\",\"abbrev\":null,\"door\":\"true\",\"bgcolor\":\"#155bcb\"},{\"x\":\"1\",\"y\":\"3\",\"width\":\"60\",\"height\":\"60\",\"row\":\"4\",\"column\":\"2\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"1\",\"y\":\"4\",\"width\":\"60\",\"height\":\"60\",\"row\":\"5\",\"column\":\"2\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"1\",\"y\":\"5\",\"width\":\"60\",\"height\":\"60\",\"row\":\"6\",\"column\":\"2\",\"isBlock\":\"true\",\"label\":\"OOSAF\",\"sublabel\":\"office of student affairs\",\"abbrev\":null,\"door\":\"true\",\"bgcolor\":\"#0e4477\"},{\"x\":\"1\",\"y\":\"6\",\"width\":\"60\",\"height\":\"60\",\"row\":\"7\",\"column\":\"2\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"1\",\"y\":\"7\",\"width\":\"60\",\"height\":\"60\",\"row\":\"8\",\"column\":\"2\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"1\",\"y\":\"8\",\"width\":\"60\",\"height\":\"60\",\"row\":\"9\",\"column\":\"2\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"1\",\"y\":\"9\",\"width\":\"60\",\"height\":\"60\",\"row\":\"10\",\"column\":\"2\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"1\",\"y\":\"10\",\"width\":\"60\",\"height\":\"60\",\"row\":\"11\",\"column\":\"2\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"1\",\"y\":\"11\",\"width\":\"60\",\"height\":\"60\",\"row\":\"12\",\"column\":\"2\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"1\",\"y\":\"12\",\"width\":\"60\",\"height\":\"60\",\"row\":\"13\",\"column\":\"2\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"1\",\"y\":\"13\",\"width\":\"60\",\"height\":\"60\",\"row\":\"14\",\"column\":\"2\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"2\",\"y\":\"0\",\"width\":\"60\",\"height\":\"60\",\"row\":\"1\",\"column\":\"3\",\"isBlock\":\"true\",\"label\":\"CS\",\"sublabel\":\"canteen\",\"abbrev\":null,\"door\":null,\"bgcolor\":\"#75661a\"},{\"x\":\"2\",\"y\":\"1\",\"width\":\"60\",\"height\":\"60\",\"row\":\"2\",\"column\":\"3\",\"isBlock\":\"true\",\"label\":\"CS\",\"sublabel\":\"canteen\",\"abbrev\":null,\"door\":null,\"bgcolor\":\"#75661a\"},{\"x\":\"2\",\"y\":\"2\",\"width\":\"60\",\"height\":\"60\",\"row\":\"3\",\"column\":\"3\",\"isBlock\":\"true\",\"label\":\"CS\",\"sublabel\":\"canteen\",\"abbrev\":null,\"door\":null,\"bgcolor\":\"#75661a\"},{\"x\":\"2\",\"y\":\"3\",\"width\":\"60\",\"height\":\"60\",\"row\":\"4\",\"column\":\"3\",\"isBlock\":\"true\",\"label\":\"CS\",\"sublabel\":\"canteen\",\"abbrev\":null,\"door\":\"true\",\"bgcolor\":\"#75661a\"},{\"x\":\"2\",\"y\":\"4\",\"width\":\"60\",\"height\":\"60\",\"row\":\"5\",\"column\":\"3\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"2\",\"y\":\"5\",\"width\":\"60\",\"height\":\"60\",\"row\":\"6\",\"column\":\"3\",\"isBlock\":\"true\",\"label\":\"wall\",\"sublabel\":\"wall\",\"abbrev\":null,\"door\":null,\"bgcolor\":\"#0e8218\"},{\"x\":\"2\",\"y\":\"6\",\"width\":\"60\",\"height\":\"60\",\"row\":\"7\",\"column\":\"3\",\"isBlock\":\"true\",\"label\":\"PR\",\"sublabel\":\"pe room\",\"abbrev\":null,\"door\":null,\"bgcolor\":\"#405b2f\"},{\"x\":\"2\",\"y\":\"7\",\"width\":\"60\",\"height\":\"60\",\"row\":\"8\",\"column\":\"3\",\"isBlock\":\"true\",\"label\":\"PR\",\"sublabel\":\"pe room\",\"abbrev\":null,\"door\":null,\"bgcolor\":\"#405b2f\"},{\"x\":\"2\",\"y\":\"8\",\"width\":\"60\",\"height\":\"60\",\"row\":\"9\",\"column\":\"3\",\"isBlock\":\"true\",\"label\":\"PR\",\"sublabel\":\"pe room\",\"abbrev\":null,\"door\":null,\"bgcolor\":\"#405b2f\"},{\"x\":\"2\",\"y\":\"9\",\"width\":\"60\",\"height\":\"60\",\"row\":\"10\",\"column\":\"3\",\"isBlock\":\"true\",\"label\":\"PR\",\"sublabel\":\"pe room\",\"abbrev\":null,\"door\":null,\"bgcolor\":\"#405b2f\"},{\"x\":\"2\",\"y\":\"10\",\"width\":\"60\",\"height\":\"60\",\"row\":\"11\",\"column\":\"3\",\"isBlock\":\"true\",\"label\":\"PR\",\"sublabel\":\"pe room\",\"abbrev\":null,\"door\":null,\"bgcolor\":\"#405b2f\"},{\"x\":\"2\",\"y\":\"11\",\"width\":\"60\",\"height\":\"60\",\"row\":\"12\",\"column\":\"3\",\"isBlock\":\"true\",\"label\":\"PR\",\"sublabel\":\"pe room\",\"abbrev\":null,\"door\":null,\"bgcolor\":\"#405b2f\"},{\"x\":\"2\",\"y\":\"12\",\"width\":\"60\",\"height\":\"60\",\"row\":\"13\",\"column\":\"3\",\"isBlock\":\"true\",\"label\":\"SSPU\",\"sublabel\":\"school service parking\",\"abbrev\":null,\"door\":null,\"bgcolor\":\"#b6c214\"},{\"x\":\"2\",\"y\":\"13\",\"width\":\"60\",\"height\":\"60\",\"row\":\"14\",\"column\":\"3\",\"isBlock\":\"true\",\"label\":\"SSPU\",\"sublabel\":\"school service parking\",\"abbrev\":null,\"door\":null,\"bgcolor\":\"#b6c214\"},{\"x\":\"3\",\"y\":\"0\",\"width\":\"60\",\"height\":\"60\",\"row\":\"1\",\"column\":\"4\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"3\",\"y\":\"1\",\"width\":\"60\",\"height\":\"60\",\"row\":\"2\",\"column\":\"4\",\"isBlock\":\"true\",\"label\":\"CS\",\"sublabel\":\"canteen\",\"abbrev\":null,\"door\":null,\"bgcolor\":\"#75661a\"},{\"x\":\"3\",\"y\":\"2\",\"width\":\"60\",\"height\":\"60\",\"row\":\"3\",\"column\":\"4\",\"isBlock\":\"true\",\"label\":\"R1I\",\"sublabel\":\"room 101\",\"abbrev\":null,\"door\":null,\"bgcolor\":\"#3d9948\"},{\"x\":\"3\",\"y\":\"3\",\"width\":\"60\",\"height\":\"60\",\"row\":\"4\",\"column\":\"4\",\"isBlock\":\"true\",\"label\":\"R1I\",\"sublabel\":\"room 101\",\"abbrev\":null,\"door\":null,\"bgcolor\":\"#3d9948\"},{\"x\":\"3\",\"y\":\"4\",\"width\":\"60\",\"height\":\"60\",\"row\":\"5\",\"column\":\"4\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"3\",\"y\":\"5\",\"width\":\"60\",\"height\":\"60\",\"row\":\"6\",\"column\":\"4\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"3\",\"y\":\"6\",\"width\":\"60\",\"height\":\"60\",\"row\":\"7\",\"column\":\"4\",\"isBlock\":\"true\",\"label\":\"PR\",\"sublabel\":\"pe room\",\"abbrev\":null,\"door\":\"true\",\"bgcolor\":\"#405b2f\"},{\"x\":\"3\",\"y\":\"7\",\"width\":\"60\",\"height\":\"60\",\"row\":\"8\",\"column\":\"4\",\"isBlock\":\"true\",\"label\":\"PR\",\"sublabel\":\"pe room\",\"abbrev\":null,\"door\":null,\"bgcolor\":\"#405b2f\"},{\"x\":\"3\",\"y\":\"8\",\"width\":\"60\",\"height\":\"60\",\"row\":\"9\",\"column\":\"4\",\"isBlock\":\"true\",\"label\":\"PR\",\"sublabel\":\"pe room\",\"abbrev\":null,\"door\":null,\"bgcolor\":\"#405b2f\"},{\"x\":\"3\",\"y\":\"9\",\"width\":\"60\",\"height\":\"60\",\"row\":\"10\",\"column\":\"4\",\"isBlock\":\"true\",\"label\":\"PR\",\"sublabel\":\"pe room\",\"abbrev\":null,\"door\":null,\"bgcolor\":\"#405b2f\"},{\"x\":\"3\",\"y\":\"10\",\"width\":\"60\",\"height\":\"60\",\"row\":\"11\",\"column\":\"4\",\"isBlock\":\"true\",\"label\":\"PR\",\"sublabel\":\"pe room\",\"abbrev\":null,\"door\":null,\"bgcolor\":\"#405b2f\"},{\"x\":\"3\",\"y\":\"11\",\"width\":\"60\",\"height\":\"60\",\"row\":\"12\",\"column\":\"4\",\"isBlock\":\"true\",\"label\":\"PR\",\"sublabel\":\"pe room\",\"abbrev\":null,\"door\":null,\"bgcolor\":\"#405b2f\"},{\"x\":\"3\",\"y\":\"12\",\"width\":\"60\",\"height\":\"60\",\"row\":\"13\",\"column\":\"4\",\"isBlock\":\"true\",\"label\":\"SSPU\",\"sublabel\":\"school service parking\",\"abbrev\":null,\"door\":null,\"bgcolor\":\"#b6c214\"},{\"x\":\"3\",\"y\":\"13\",\"width\":\"60\",\"height\":\"60\",\"row\":\"14\",\"column\":\"4\",\"isBlock\":\"true\",\"label\":\"SSPU\",\"sublabel\":\"school service parking\",\"abbrev\":null,\"door\":null,\"bgcolor\":\"#b6c214\"},{\"x\":\"4\",\"y\":\"0\",\"width\":\"60\",\"height\":\"60\",\"row\":\"1\",\"column\":\"5\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"4\",\"y\":\"1\",\"width\":\"60\",\"height\":\"60\",\"row\":\"2\",\"column\":\"5\",\"isBlock\":\"true\",\"label\":\"MRI\",\"sublabel\":\"male restroom\",\"abbrev\":null,\"door\":\"true\",\"bgcolor\":\"#903752\"},{\"x\":\"4\",\"y\":\"2\",\"width\":\"60\",\"height\":\"60\",\"row\":\"3\",\"column\":\"5\",\"isBlock\":\"true\",\"label\":\"R1I\",\"sublabel\":\"room 101\",\"abbrev\":null,\"door\":null,\"bgcolor\":\"#3d9948\"},{\"x\":\"4\",\"y\":\"3\",\"width\":\"60\",\"height\":\"60\",\"row\":\"4\",\"column\":\"5\",\"isBlock\":\"true\",\"label\":\"R1I\",\"sublabel\":\"room 101\",\"abbrev\":null,\"door\":\"true\",\"bgcolor\":\"#3d9948\"},{\"x\":\"4\",\"y\":\"4\",\"width\":\"60\",\"height\":\"60\",\"row\":\"5\",\"column\":\"5\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"4\",\"y\":\"5\",\"width\":\"60\",\"height\":\"60\",\"row\":\"6\",\"column\":\"5\",\"isBlock\":\"true\",\"label\":\"FRP\",\"sublabel\":\"female restroom\",\"abbrev\":null,\"door\":\"true\",\"bgcolor\":\"#974964\"},{\"x\":\"4\",\"y\":\"6\",\"width\":\"60\",\"height\":\"60\",\"row\":\"7\",\"column\":\"5\",\"isBlock\":\"true\",\"label\":\"PR\",\"sublabel\":\"pe room\",\"abbrev\":null,\"door\":null,\"bgcolor\":\"#405b2f\"},{\"x\":\"4\",\"y\":\"7\",\"width\":\"60\",\"height\":\"60\",\"row\":\"8\",\"column\":\"5\",\"isBlock\":\"true\",\"label\":\"PR\",\"sublabel\":\"pe room\",\"abbrev\":null,\"door\":null,\"bgcolor\":\"#405b2f\"},{\"x\":\"4\",\"y\":\"8\",\"width\":\"60\",\"height\":\"60\",\"row\":\"9\",\"column\":\"5\",\"isBlock\":\"true\",\"label\":\"PR\",\"sublabel\":\"pe room\",\"abbrev\":null,\"door\":null,\"bgcolor\":\"#405b2f\"},{\"x\":\"4\",\"y\":\"9\",\"width\":\"60\",\"height\":\"60\",\"row\":\"10\",\"column\":\"5\",\"isBlock\":\"true\",\"label\":\"PR\",\"sublabel\":\"pe room\",\"abbrev\":null,\"door\":null,\"bgcolor\":\"#405b2f\"},{\"x\":\"4\",\"y\":\"10\",\"width\":\"60\",\"height\":\"60\",\"row\":\"11\",\"column\":\"5\",\"isBlock\":\"true\",\"label\":\"PR\",\"sublabel\":\"pe room\",\"abbrev\":null,\"door\":null,\"bgcolor\":\"#405b2f\"},{\"x\":\"4\",\"y\":\"11\",\"width\":\"60\",\"height\":\"60\",\"row\":\"12\",\"column\":\"5\",\"isBlock\":\"true\",\"label\":\"PR\",\"sublabel\":\"pe room\",\"abbrev\":null,\"door\":null,\"bgcolor\":\"#405b2f\"},{\"x\":\"4\",\"y\":\"12\",\"width\":\"60\",\"height\":\"60\",\"row\":\"13\",\"column\":\"5\",\"isBlock\":\"true\",\"label\":\"SSPU\",\"sublabel\":\"school service parking\",\"abbrev\":null,\"door\":null,\"bgcolor\":\"#b6c214\"},{\"x\":\"4\",\"y\":\"13\",\"width\":\"60\",\"height\":\"60\",\"row\":\"14\",\"column\":\"5\",\"isBlock\":\"true\",\"label\":\"SSPU\",\"sublabel\":\"school service parking\",\"abbrev\":null,\"door\":null,\"bgcolor\":\"#b6c214\"},{\"x\":\"5\",\"y\":\"0\",\"width\":\"60\",\"height\":\"60\",\"row\":\"1\",\"column\":\"6\",\"isBlock\":\"true\",\"label\":\"GO\",\"sublabel\":\"guidance office\",\"abbrev\":null,\"door\":null,\"bgcolor\":\"#1e5571\"},{\"x\":\"5\",\"y\":\"1\",\"width\":\"60\",\"height\":\"60\",\"row\":\"2\",\"column\":\"6\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"5\",\"y\":\"2\",\"width\":\"60\",\"height\":\"60\",\"row\":\"3\",\"column\":\"6\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"5\",\"y\":\"3\",\"width\":\"60\",\"height\":\"60\",\"row\":\"4\",\"column\":\"6\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"5\",\"y\":\"4\",\"width\":\"60\",\"height\":\"60\",\"row\":\"5\",\"column\":\"6\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"5\",\"y\":\"5\",\"width\":\"60\",\"height\":\"60\",\"row\":\"6\",\"column\":\"6\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"5\",\"y\":\"6\",\"width\":\"60\",\"height\":\"60\",\"row\":\"7\",\"column\":\"6\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"5\",\"y\":\"7\",\"width\":\"60\",\"height\":\"60\",\"row\":\"8\",\"column\":\"6\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"5\",\"y\":\"8\",\"width\":\"60\",\"height\":\"60\",\"row\":\"9\",\"column\":\"6\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"5\",\"y\":\"9\",\"width\":\"60\",\"height\":\"60\",\"row\":\"10\",\"column\":\"6\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"5\",\"y\":\"10\",\"width\":\"60\",\"height\":\"60\",\"row\":\"11\",\"column\":\"6\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"5\",\"y\":\"11\",\"width\":\"60\",\"height\":\"60\",\"row\":\"12\",\"column\":\"6\",\"isBlock\":\"true\",\"label\":\"stair-in\",\"sublabel\":\"stair-in\",\"abbrev\":null,\"door\":\"true\",\"bgcolor\":\"#0e8218\"},{\"x\":\"5\",\"y\":\"12\",\"width\":\"60\",\"height\":\"60\",\"row\":\"13\",\"column\":\"6\",\"isBlock\":\"true\",\"label\":\"SSPU\",\"sublabel\":\"school service parking\",\"abbrev\":null,\"door\":null,\"bgcolor\":\"#b6c214\"},{\"x\":\"5\",\"y\":\"13\",\"width\":\"60\",\"height\":\"60\",\"row\":\"14\",\"column\":\"6\",\"isBlock\":\"true\",\"label\":\"SSPU\",\"sublabel\":\"school service parking\",\"abbrev\":null,\"door\":null,\"bgcolor\":\"#b6c214\"},{\"x\":\"6\",\"y\":\"0\",\"width\":\"60\",\"height\":\"60\",\"row\":\"1\",\"column\":\"7\",\"isBlock\":\"true\",\"label\":\"GO\",\"sublabel\":\"guidance office\",\"abbrev\":null,\"door\":\"true\",\"bgcolor\":\"#1e5571\"},{\"x\":\"6\",\"y\":\"1\",\"width\":\"60\",\"height\":\"60\",\"row\":\"2\",\"column\":\"7\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"6\",\"y\":\"2\",\"width\":\"60\",\"height\":\"60\",\"row\":\"3\",\"column\":\"7\",\"isBlock\":\"true\",\"label\":\"R1Y\",\"sublabel\":\"room 102\",\"abbrev\":null,\"door\":\"true\",\"bgcolor\":\"#409735\"},{\"x\":\"6\",\"y\":\"3\",\"width\":\"60\",\"height\":\"60\",\"row\":\"4\",\"column\":\"7\",\"isBlock\":\"true\",\"label\":\"R1Y\",\"sublabel\":\"room 102\",\"abbrev\":null,\"door\":null,\"bgcolor\":\"#409735\"},{\"x\":\"6\",\"y\":\"4\",\"width\":\"60\",\"height\":\"60\",\"row\":\"5\",\"column\":\"7\",\"isBlock\":\"true\",\"label\":\"AOO\",\"sublabel\":\"administration office\",\"abbrev\":null,\"door\":null,\"bgcolor\":\"#06366a\"},{\"x\":\"6\",\"y\":\"5\",\"width\":\"60\",\"height\":\"60\",\"row\":\"6\",\"column\":\"7\",\"isBlock\":\"true\",\"label\":\"AOO\",\"sublabel\":\"administration office\",\"abbrev\":null,\"door\":\"true\",\"bgcolor\":\"#06366a\"},{\"x\":\"6\",\"y\":\"6\",\"width\":\"60\",\"height\":\"60\",\"row\":\"7\",\"column\":\"7\",\"isBlock\":\"true\",\"label\":\"AOO\",\"sublabel\":\"administration office\",\"abbrev\":null,\"door\":null,\"bgcolor\":\"#06366a\"},{\"x\":\"6\",\"y\":\"7\",\"width\":\"60\",\"height\":\"60\",\"row\":\"8\",\"column\":\"7\",\"isBlock\":\"true\",\"label\":\"AOO\",\"sublabel\":\"administration office\",\"abbrev\":null,\"door\":null,\"bgcolor\":\"#06366a\"},{\"x\":\"6\",\"y\":\"8\",\"width\":\"60\",\"height\":\"60\",\"row\":\"9\",\"column\":\"7\",\"isBlock\":\"true\",\"label\":\"AOO\",\"sublabel\":\"administration office\",\"abbrev\":null,\"door\":null,\"bgcolor\":\"#06366a\"},{\"x\":\"6\",\"y\":\"9\",\"width\":\"60\",\"height\":\"60\",\"row\":\"10\",\"column\":\"7\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"6\",\"y\":\"10\",\"width\":\"60\",\"height\":\"60\",\"row\":\"11\",\"column\":\"7\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"6\",\"y\":\"11\",\"width\":\"60\",\"height\":\"60\",\"row\":\"12\",\"column\":\"7\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"6\",\"y\":\"12\",\"width\":\"60\",\"height\":\"60\",\"row\":\"13\",\"column\":\"7\",\"isBlock\":\"true\",\"label\":\"SSPU\",\"sublabel\":\"school service parking\",\"abbrev\":null,\"door\":\"true\",\"bgcolor\":\"#b6c214\"},{\"x\":\"6\",\"y\":\"13\",\"width\":\"60\",\"height\":\"60\",\"row\":\"14\",\"column\":\"7\",\"isBlock\":\"true\",\"label\":\"SSPU\",\"sublabel\":\"school service parking\",\"abbrev\":null,\"door\":null,\"bgcolor\":\"#b6c214\"},{\"x\":\"7\",\"y\":\"0\",\"width\":\"60\",\"height\":\"60\",\"row\":\"1\",\"column\":\"8\",\"isBlock\":\"true\",\"label\":\"GO\",\"sublabel\":\"guidance office\",\"abbrev\":null,\"door\":null,\"bgcolor\":\"#1e5571\"},{\"x\":\"7\",\"y\":\"1\",\"width\":\"60\",\"height\":\"60\",\"row\":\"2\",\"column\":\"8\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"7\",\"y\":\"2\",\"width\":\"60\",\"height\":\"60\",\"row\":\"3\",\"column\":\"8\",\"isBlock\":\"true\",\"label\":\"R1Y\",\"sublabel\":\"room 102\",\"abbrev\":null,\"door\":null,\"bgcolor\":\"#409735\"},{\"x\":\"7\",\"y\":\"3\",\"width\":\"60\",\"height\":\"60\",\"row\":\"4\",\"column\":\"8\",\"isBlock\":\"true\",\"label\":\"R1Y\",\"sublabel\":\"room 102\",\"abbrev\":null,\"door\":null,\"bgcolor\":\"#409735\"},{\"x\":\"7\",\"y\":\"4\",\"width\":\"60\",\"height\":\"60\",\"row\":\"5\",\"column\":\"8\",\"isBlock\":\"true\",\"label\":\"AOO\",\"sublabel\":\"administration office\",\"abbrev\":null,\"door\":null,\"bgcolor\":\"#06366a\"},{\"x\":\"7\",\"y\":\"5\",\"width\":\"60\",\"height\":\"60\",\"row\":\"6\",\"column\":\"8\",\"isBlock\":\"true\",\"label\":\"AOO\",\"sublabel\":\"administration office\",\"abbrev\":null,\"door\":null,\"bgcolor\":\"#06366a\"},{\"x\":\"7\",\"y\":\"6\",\"width\":\"60\",\"height\":\"60\",\"row\":\"7\",\"column\":\"8\",\"isBlock\":\"true\",\"label\":\"AOO\",\"sublabel\":\"administration office\",\"abbrev\":null,\"door\":null,\"bgcolor\":\"#06366a\"},{\"x\":\"7\",\"y\":\"7\",\"width\":\"60\",\"height\":\"60\",\"row\":\"8\",\"column\":\"8\",\"isBlock\":\"true\",\"label\":\"AOO\",\"sublabel\":\"administration office\",\"abbrev\":null,\"door\":null,\"bgcolor\":\"#06366a\"},{\"x\":\"7\",\"y\":\"8\",\"width\":\"60\",\"height\":\"60\",\"row\":\"9\",\"column\":\"8\",\"isBlock\":\"true\",\"label\":\"AOO\",\"sublabel\":\"administration office\",\"abbrev\":null,\"door\":null,\"bgcolor\":\"#06366a\"},{\"x\":\"7\",\"y\":\"9\",\"width\":\"60\",\"height\":\"60\",\"row\":\"10\",\"column\":\"8\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"7\",\"y\":\"10\",\"width\":\"60\",\"height\":\"60\",\"row\":\"11\",\"column\":\"8\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"7\",\"y\":\"11\",\"width\":\"60\",\"height\":\"60\",\"row\":\"12\",\"column\":\"8\",\"isBlock\":\"true\",\"label\":\"front\",\"sublabel\":\"front\",\"abbrev\":null,\"door\":null,\"bgcolor\":\"#0e8218\"},{\"x\":\"7\",\"y\":\"12\",\"width\":\"60\",\"height\":\"60\",\"row\":\"13\",\"column\":\"8\",\"isBlock\":\"true\",\"label\":\"SSPU\",\"sublabel\":\"school service parking\",\"abbrev\":null,\"door\":null,\"bgcolor\":\"#b6c214\"},{\"x\":\"7\",\"y\":\"13\",\"width\":\"60\",\"height\":\"60\",\"row\":\"14\",\"column\":\"8\",\"isBlock\":\"true\",\"label\":\"SSPU\",\"sublabel\":\"school service parking\",\"abbrev\":null,\"door\":null,\"bgcolor\":\"#b6c214\"},{\"x\":\"8\",\"y\":\"0\",\"width\":\"60\",\"height\":\"60\",\"row\":\"1\",\"column\":\"9\",\"isBlock\":\"true\",\"label\":\"TFO\",\"sublabel\":\"tesda focal office\",\"abbrev\":null,\"door\":\"true\",\"bgcolor\":\"#107abc\"},{\"x\":\"8\",\"y\":\"1\",\"width\":\"60\",\"height\":\"60\",\"row\":\"2\",\"column\":\"9\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"8\",\"y\":\"2\",\"width\":\"60\",\"height\":\"60\",\"row\":\"3\",\"column\":\"9\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"8\",\"y\":\"3\",\"width\":\"60\",\"height\":\"60\",\"row\":\"4\",\"column\":\"9\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"8\",\"y\":\"4\",\"width\":\"60\",\"height\":\"60\",\"row\":\"5\",\"column\":\"9\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"8\",\"y\":\"5\",\"width\":\"60\",\"height\":\"60\",\"row\":\"6\",\"column\":\"9\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"8\",\"y\":\"6\",\"width\":\"60\",\"height\":\"60\",\"row\":\"7\",\"column\":\"9\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"8\",\"y\":\"7\",\"width\":\"60\",\"height\":\"60\",\"row\":\"8\",\"column\":\"9\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"8\",\"y\":\"8\",\"width\":\"60\",\"height\":\"60\",\"row\":\"9\",\"column\":\"9\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"8\",\"y\":\"9\",\"width\":\"60\",\"height\":\"60\",\"row\":\"10\",\"column\":\"9\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"8\",\"y\":\"10\",\"width\":\"60\",\"height\":\"60\",\"row\":\"11\",\"column\":\"9\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"8\",\"y\":\"11\",\"width\":\"60\",\"height\":\"60\",\"row\":\"12\",\"column\":\"9\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"8\",\"y\":\"12\",\"width\":\"60\",\"height\":\"60\",\"row\":\"13\",\"column\":\"9\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"8\",\"y\":\"13\",\"width\":\"60\",\"height\":\"60\",\"row\":\"14\",\"column\":\"9\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"9\",\"y\":\"0\",\"width\":\"60\",\"height\":\"60\",\"row\":\"1\",\"column\":\"10\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"9\",\"y\":\"1\",\"width\":\"60\",\"height\":\"60\",\"row\":\"2\",\"column\":\"10\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"9\",\"y\":\"2\",\"width\":\"60\",\"height\":\"60\",\"row\":\"3\",\"column\":\"10\",\"isBlock\":\"true\",\"label\":\"SLX\",\"sublabel\":\"student lounge\",\"abbrev\":null,\"door\":null,\"bgcolor\":\"#cbc525\"},{\"x\":\"9\",\"y\":\"3\",\"width\":\"60\",\"height\":\"60\",\"row\":\"4\",\"column\":\"10\",\"isBlock\":\"true\",\"label\":\"SLX\",\"sublabel\":\"student lounge\",\"abbrev\":null,\"door\":null,\"bgcolor\":\"#cbc525\"},{\"x\":\"9\",\"y\":\"4\",\"width\":\"60\",\"height\":\"60\",\"row\":\"5\",\"column\":\"10\",\"isBlock\":\"true\",\"label\":\"SLX\",\"sublabel\":\"student lounge\",\"abbrev\":null,\"door\":null,\"bgcolor\":\"#cbc525\"},{\"x\":\"9\",\"y\":\"5\",\"width\":\"60\",\"height\":\"60\",\"row\":\"6\",\"column\":\"10\",\"isBlock\":\"true\",\"label\":\"SLX\",\"sublabel\":\"student lounge\",\"abbrev\":null,\"door\":null,\"bgcolor\":\"#cbc525\"},{\"x\":\"9\",\"y\":\"6\",\"width\":\"60\",\"height\":\"60\",\"row\":\"7\",\"column\":\"10\",\"isBlock\":\"true\",\"label\":\"SLX\",\"sublabel\":\"student lounge\",\"abbrev\":null,\"door\":null,\"bgcolor\":\"#cbc525\"},{\"x\":\"9\",\"y\":\"7\",\"width\":\"60\",\"height\":\"60\",\"row\":\"8\",\"column\":\"10\",\"isBlock\":\"true\",\"label\":\"SLX\",\"sublabel\":\"student lounge\",\"abbrev\":null,\"door\":\"true\",\"bgcolor\":\"#cbc525\"},{\"x\":\"9\",\"y\":\"8\",\"width\":\"60\",\"height\":\"60\",\"row\":\"9\",\"column\":\"10\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"9\",\"y\":\"9\",\"width\":\"60\",\"height\":\"60\",\"row\":\"10\",\"column\":\"10\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"9\",\"y\":\"10\",\"width\":\"60\",\"height\":\"60\",\"row\":\"11\",\"column\":\"10\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"9\",\"y\":\"11\",\"width\":\"60\",\"height\":\"60\",\"row\":\"12\",\"column\":\"10\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"9\",\"y\":\"12\",\"width\":\"60\",\"height\":\"60\",\"row\":\"13\",\"column\":\"10\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"9\",\"y\":\"13\",\"width\":\"60\",\"height\":\"60\",\"row\":\"14\",\"column\":\"10\",\"isBlock\":\"true\",\"label\":\"GH\",\"sublabel\":\"guard house\",\"abbrev\":null,\"door\":\"true\",\"bgcolor\":\"#0770c0\"}]', '2023-12-13 11:25:31', '2023-12-13 11:39:56');
INSERT INTO `floorplans` (`id`, `floor`, `gridSize`, `gridDetails`, `created_at`, `updated_at`) VALUES
(26, 'floor-2', 140, '[{\"x\":\"0\",\"y\":\"0\",\"width\":\"60\",\"height\":\"60\",\"row\":\"1\",\"column\":\"1\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"0\",\"y\":\"1\",\"width\":\"60\",\"height\":\"60\",\"row\":\"2\",\"column\":\"1\",\"isBlock\":\"true\",\"label\":\"LA\",\"sublabel\":\"library\",\"abbrev\":null,\"door\":null,\"bgcolor\":\"#1c939c\"},{\"x\":\"0\",\"y\":\"2\",\"width\":\"60\",\"height\":\"60\",\"row\":\"3\",\"column\":\"1\",\"isBlock\":\"true\",\"label\":\"LA\",\"sublabel\":\"library\",\"abbrev\":null,\"door\":null,\"bgcolor\":\"#1c939c\"},{\"x\":\"0\",\"y\":\"3\",\"width\":\"60\",\"height\":\"60\",\"row\":\"4\",\"column\":\"1\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"0\",\"y\":\"4\",\"width\":\"60\",\"height\":\"60\",\"row\":\"5\",\"column\":\"1\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"0\",\"y\":\"5\",\"width\":\"60\",\"height\":\"60\",\"row\":\"6\",\"column\":\"1\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"0\",\"y\":\"6\",\"width\":\"60\",\"height\":\"60\",\"row\":\"7\",\"column\":\"1\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"0\",\"y\":\"7\",\"width\":\"60\",\"height\":\"60\",\"row\":\"8\",\"column\":\"1\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"0\",\"y\":\"8\",\"width\":\"60\",\"height\":\"60\",\"row\":\"9\",\"column\":\"1\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"0\",\"y\":\"9\",\"width\":\"60\",\"height\":\"60\",\"row\":\"10\",\"column\":\"1\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"0\",\"y\":\"10\",\"width\":\"60\",\"height\":\"60\",\"row\":\"11\",\"column\":\"1\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"0\",\"y\":\"11\",\"width\":\"60\",\"height\":\"60\",\"row\":\"12\",\"column\":\"1\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"0\",\"y\":\"12\",\"width\":\"60\",\"height\":\"60\",\"row\":\"13\",\"column\":\"1\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"0\",\"y\":\"13\",\"width\":\"60\",\"height\":\"60\",\"row\":\"14\",\"column\":\"1\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"1\",\"y\":\"0\",\"width\":\"60\",\"height\":\"60\",\"row\":\"1\",\"column\":\"2\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"1\",\"y\":\"1\",\"width\":\"60\",\"height\":\"60\",\"row\":\"2\",\"column\":\"2\",\"isBlock\":\"true\",\"label\":\"LA\",\"sublabel\":\"library\",\"abbrev\":null,\"door\":null,\"bgcolor\":\"#1c939c\"},{\"x\":\"1\",\"y\":\"2\",\"width\":\"60\",\"height\":\"60\",\"row\":\"3\",\"column\":\"2\",\"isBlock\":\"true\",\"label\":\"LA\",\"sublabel\":\"library\",\"abbrev\":null,\"door\":null,\"bgcolor\":\"#1c939c\"},{\"x\":\"1\",\"y\":\"3\",\"width\":\"60\",\"height\":\"60\",\"row\":\"4\",\"column\":\"2\",\"isBlock\":\"true\",\"label\":\"CDFK\",\"sublabel\":\"cs department faculty\",\"abbrev\":null,\"door\":null,\"bgcolor\":\"#b76262\"},{\"x\":\"1\",\"y\":\"4\",\"width\":\"60\",\"height\":\"60\",\"row\":\"5\",\"column\":\"2\",\"isBlock\":\"true\",\"label\":\"CDFK\",\"sublabel\":\"cs department faculty\",\"abbrev\":null,\"door\":null,\"bgcolor\":\"#b76262\"},{\"x\":\"1\",\"y\":\"5\",\"width\":\"60\",\"height\":\"60\",\"row\":\"6\",\"column\":\"2\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"1\",\"y\":\"6\",\"width\":\"60\",\"height\":\"60\",\"row\":\"7\",\"column\":\"2\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"1\",\"y\":\"7\",\"width\":\"60\",\"height\":\"60\",\"row\":\"8\",\"column\":\"2\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"1\",\"y\":\"8\",\"width\":\"60\",\"height\":\"60\",\"row\":\"9\",\"column\":\"2\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"1\",\"y\":\"9\",\"width\":\"60\",\"height\":\"60\",\"row\":\"10\",\"column\":\"2\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"1\",\"y\":\"10\",\"width\":\"60\",\"height\":\"60\",\"row\":\"11\",\"column\":\"2\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"1\",\"y\":\"11\",\"width\":\"60\",\"height\":\"60\",\"row\":\"12\",\"column\":\"2\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"1\",\"y\":\"12\",\"width\":\"60\",\"height\":\"60\",\"row\":\"13\",\"column\":\"2\",\"isBlock\":\"true\",\"label\":\"stair-in\",\"sublabel\":\"stair-in\",\"abbrev\":null,\"door\":\"true\",\"bgcolor\":\"#0e8218\"},{\"x\":\"1\",\"y\":\"13\",\"width\":\"60\",\"height\":\"60\",\"row\":\"14\",\"column\":\"2\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"2\",\"y\":\"0\",\"width\":\"60\",\"height\":\"60\",\"row\":\"1\",\"column\":\"3\",\"isBlock\":\"true\",\"label\":\"MRD\",\"sublabel\":\"male restroom\",\"abbrev\":null,\"door\":\"true\",\"bgcolor\":\"#b25353\"},{\"x\":\"2\",\"y\":\"1\",\"width\":\"60\",\"height\":\"60\",\"row\":\"2\",\"column\":\"3\",\"isBlock\":\"true\",\"label\":\"LA\",\"sublabel\":\"library\",\"abbrev\":null,\"door\":null,\"bgcolor\":\"#1c939c\"},{\"x\":\"2\",\"y\":\"2\",\"width\":\"60\",\"height\":\"60\",\"row\":\"3\",\"column\":\"3\",\"isBlock\":\"true\",\"label\":\"LA\",\"sublabel\":\"library\",\"abbrev\":null,\"door\":\"true\",\"bgcolor\":\"#1c939c\"},{\"x\":\"2\",\"y\":\"3\",\"width\":\"60\",\"height\":\"60\",\"row\":\"4\",\"column\":\"3\",\"isBlock\":\"true\",\"label\":\"CDFK\",\"sublabel\":\"cs department faculty\",\"abbrev\":null,\"door\":\"true\",\"bgcolor\":\"#b76262\"},{\"x\":\"2\",\"y\":\"4\",\"width\":\"60\",\"height\":\"60\",\"row\":\"5\",\"column\":\"3\",\"isBlock\":\"true\",\"label\":\"CDFK\",\"sublabel\":\"cs department faculty\",\"abbrev\":null,\"door\":null,\"bgcolor\":\"#b76262\"},{\"x\":\"2\",\"y\":\"5\",\"width\":\"60\",\"height\":\"60\",\"row\":\"6\",\"column\":\"3\",\"isBlock\":\"true\",\"label\":\"FRQ\",\"sublabel\":\"female restroom\",\"abbrev\":null,\"door\":\"true\",\"bgcolor\":\"#bc576b\"},{\"x\":\"2\",\"y\":\"6\",\"width\":\"60\",\"height\":\"60\",\"row\":\"7\",\"column\":\"3\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"2\",\"y\":\"7\",\"width\":\"60\",\"height\":\"60\",\"row\":\"8\",\"column\":\"3\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"2\",\"y\":\"8\",\"width\":\"60\",\"height\":\"60\",\"row\":\"9\",\"column\":\"3\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"2\",\"y\":\"9\",\"width\":\"60\",\"height\":\"60\",\"row\":\"10\",\"column\":\"3\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"2\",\"y\":\"10\",\"width\":\"60\",\"height\":\"60\",\"row\":\"11\",\"column\":\"3\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"2\",\"y\":\"11\",\"width\":\"60\",\"height\":\"60\",\"row\":\"12\",\"column\":\"3\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"2\",\"y\":\"12\",\"width\":\"60\",\"height\":\"60\",\"row\":\"13\",\"column\":\"3\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"2\",\"y\":\"13\",\"width\":\"60\",\"height\":\"60\",\"row\":\"14\",\"column\":\"3\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"3\",\"y\":\"0\",\"width\":\"60\",\"height\":\"60\",\"row\":\"1\",\"column\":\"4\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"3\",\"y\":\"1\",\"width\":\"60\",\"height\":\"60\",\"row\":\"2\",\"column\":\"4\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"3\",\"y\":\"2\",\"width\":\"60\",\"height\":\"60\",\"row\":\"3\",\"column\":\"4\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"3\",\"y\":\"3\",\"width\":\"60\",\"height\":\"60\",\"row\":\"4\",\"column\":\"4\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"3\",\"y\":\"4\",\"width\":\"60\",\"height\":\"60\",\"row\":\"5\",\"column\":\"4\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"3\",\"y\":\"5\",\"width\":\"60\",\"height\":\"60\",\"row\":\"6\",\"column\":\"4\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"3\",\"y\":\"6\",\"width\":\"60\",\"height\":\"60\",\"row\":\"7\",\"column\":\"4\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"3\",\"y\":\"7\",\"width\":\"60\",\"height\":\"60\",\"row\":\"8\",\"column\":\"4\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"3\",\"y\":\"8\",\"width\":\"60\",\"height\":\"60\",\"row\":\"9\",\"column\":\"4\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"3\",\"y\":\"9\",\"width\":\"60\",\"height\":\"60\",\"row\":\"10\",\"column\":\"4\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"3\",\"y\":\"10\",\"width\":\"60\",\"height\":\"60\",\"row\":\"11\",\"column\":\"4\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"3\",\"y\":\"11\",\"width\":\"60\",\"height\":\"60\",\"row\":\"12\",\"column\":\"4\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"3\",\"y\":\"12\",\"width\":\"60\",\"height\":\"60\",\"row\":\"13\",\"column\":\"4\",\"isBlock\":\"false\",\"label\":\"front\",\"sublabel\":\"front\",\"abbrev\":null,\"door\":null,\"bgcolor\":\"#0e8218\"},{\"x\":\"3\",\"y\":\"13\",\"width\":\"60\",\"height\":\"60\",\"row\":\"14\",\"column\":\"4\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"4\",\"y\":\"0\",\"width\":\"60\",\"height\":\"60\",\"row\":\"1\",\"column\":\"5\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"4\",\"y\":\"1\",\"width\":\"60\",\"height\":\"60\",\"row\":\"2\",\"column\":\"5\",\"isBlock\":\"true\",\"label\":\"CL3A\",\"sublabel\":\"computer laboratory 3\",\"abbrev\":null,\"door\":null,\"bgcolor\":\"#306cab\"},{\"x\":\"4\",\"y\":\"2\",\"width\":\"60\",\"height\":\"60\",\"row\":\"3\",\"column\":\"5\",\"isBlock\":\"true\",\"label\":\"CL3A\",\"sublabel\":\"computer laboratory 3\",\"abbrev\":null,\"door\":null,\"bgcolor\":\"#306cab\"},{\"x\":\"4\",\"y\":\"3\",\"width\":\"60\",\"height\":\"60\",\"row\":\"4\",\"column\":\"5\",\"isBlock\":\"false\",\"label\":\"CL3A\",\"sublabel\":\"computer laboratory 3\",\"abbrev\":null,\"door\":\"true\",\"bgcolor\":\"#306cab\"},{\"x\":\"4\",\"y\":\"4\",\"width\":\"60\",\"height\":\"60\",\"row\":\"5\",\"column\":\"5\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"4\",\"y\":\"5\",\"width\":\"60\",\"height\":\"60\",\"row\":\"6\",\"column\":\"5\",\"isBlock\":\"true\",\"label\":\"CL2M\",\"sublabel\":\"computer laboratory 2\",\"abbrev\":null,\"door\":\"true\",\"bgcolor\":\"#1c4c63\"},{\"x\":\"4\",\"y\":\"6\",\"width\":\"60\",\"height\":\"60\",\"row\":\"7\",\"column\":\"5\",\"isBlock\":\"true\",\"label\":\"CL2M\",\"sublabel\":\"computer laboratory 2\",\"abbrev\":null,\"door\":null,\"bgcolor\":\"#1c4c63\"},{\"x\":\"4\",\"y\":\"7\",\"width\":\"60\",\"height\":\"60\",\"row\":\"8\",\"column\":\"5\",\"isBlock\":\"true\",\"label\":\"CL2M\",\"sublabel\":\"computer laboratory 2\",\"abbrev\":null,\"door\":null,\"bgcolor\":\"#1c4c63\"},{\"x\":\"4\",\"y\":\"8\",\"width\":\"60\",\"height\":\"60\",\"row\":\"9\",\"column\":\"5\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"4\",\"y\":\"9\",\"width\":\"60\",\"height\":\"60\",\"row\":\"10\",\"column\":\"5\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"4\",\"y\":\"10\",\"width\":\"60\",\"height\":\"60\",\"row\":\"11\",\"column\":\"5\",\"isBlock\":\"true\",\"label\":\"CL1D\",\"sublabel\":\"computer laboratory 1\",\"abbrev\":null,\"door\":\"true\",\"bgcolor\":\"#052542\"},{\"x\":\"4\",\"y\":\"11\",\"width\":\"60\",\"height\":\"60\",\"row\":\"12\",\"column\":\"5\",\"isBlock\":\"true\",\"label\":\"CL1D\",\"sublabel\":\"computer laboratory 1\",\"abbrev\":null,\"door\":null,\"bgcolor\":\"#052542\"},{\"x\":\"4\",\"y\":\"12\",\"width\":\"60\",\"height\":\"60\",\"row\":\"13\",\"column\":\"5\",\"isBlock\":\"true\",\"label\":\"CL1D\",\"sublabel\":\"computer laboratory 1\",\"abbrev\":null,\"door\":null,\"bgcolor\":\"#052542\"},{\"x\":\"4\",\"y\":\"13\",\"width\":\"60\",\"height\":\"60\",\"row\":\"14\",\"column\":\"5\",\"isBlock\":\"true\",\"label\":\"CL1D\",\"sublabel\":\"computer laboratory 1\",\"abbrev\":null,\"door\":null,\"bgcolor\":\"#052542\"},{\"x\":\"5\",\"y\":\"0\",\"width\":\"60\",\"height\":\"60\",\"row\":\"1\",\"column\":\"6\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"5\",\"y\":\"1\",\"width\":\"60\",\"height\":\"60\",\"row\":\"2\",\"column\":\"6\",\"isBlock\":\"true\",\"label\":\"CL3A\",\"sublabel\":\"computer laboratory 3\",\"abbrev\":null,\"door\":null,\"bgcolor\":\"#306cab\"},{\"x\":\"5\",\"y\":\"2\",\"width\":\"60\",\"height\":\"60\",\"row\":\"3\",\"column\":\"6\",\"isBlock\":\"true\",\"label\":\"CL3A\",\"sublabel\":\"computer laboratory 3\",\"abbrev\":null,\"door\":null,\"bgcolor\":\"#306cab\"},{\"x\":\"5\",\"y\":\"3\",\"width\":\"60\",\"height\":\"60\",\"row\":\"4\",\"column\":\"6\",\"isBlock\":\"true\",\"label\":\"CL3A\",\"sublabel\":\"computer laboratory 3\",\"abbrev\":null,\"door\":null,\"bgcolor\":\"#306cab\"},{\"x\":\"5\",\"y\":\"4\",\"width\":\"60\",\"height\":\"60\",\"row\":\"5\",\"column\":\"6\",\"isBlock\":\"true\",\"label\":\"SR\",\"sublabel\":\"server room\",\"abbrev\":null,\"door\":\"true\",\"bgcolor\":\"#248ea3\"},{\"x\":\"5\",\"y\":\"5\",\"width\":\"60\",\"height\":\"60\",\"row\":\"6\",\"column\":\"6\",\"isBlock\":\"true\",\"label\":\"CL2M\",\"sublabel\":\"computer laboratory 2\",\"abbrev\":null,\"door\":null,\"bgcolor\":\"#1c4c63\"},{\"x\":\"5\",\"y\":\"6\",\"width\":\"60\",\"height\":\"60\",\"row\":\"7\",\"column\":\"6\",\"isBlock\":\"true\",\"label\":\"CL2M\",\"sublabel\":\"computer laboratory 2\",\"abbrev\":null,\"door\":null,\"bgcolor\":\"#1c4c63\"},{\"x\":\"5\",\"y\":\"7\",\"width\":\"60\",\"height\":\"60\",\"row\":\"8\",\"column\":\"6\",\"isBlock\":\"true\",\"label\":\"CL2M\",\"sublabel\":\"computer laboratory 2\",\"abbrev\":null,\"door\":null,\"bgcolor\":\"#1c4c63\"},{\"x\":\"5\",\"y\":\"8\",\"width\":\"60\",\"height\":\"60\",\"row\":\"9\",\"column\":\"6\",\"isBlock\":\"true\",\"label\":\"CW\",\"sublabel\":\"clinic\",\"abbrev\":null,\"door\":null,\"bgcolor\":\"#d32222\"},{\"x\":\"5\",\"y\":\"9\",\"width\":\"60\",\"height\":\"60\",\"row\":\"10\",\"column\":\"6\",\"isBlock\":\"true\",\"label\":\"CW\",\"sublabel\":\"clinic\",\"abbrev\":null,\"door\":\"true\",\"bgcolor\":\"#d32222\"},{\"x\":\"5\",\"y\":\"10\",\"width\":\"60\",\"height\":\"60\",\"row\":\"11\",\"column\":\"6\",\"isBlock\":\"true\",\"label\":\"CL1D\",\"sublabel\":\"computer laboratory 1\",\"abbrev\":null,\"door\":null,\"bgcolor\":\"#052542\"},{\"x\":\"5\",\"y\":\"11\",\"width\":\"60\",\"height\":\"60\",\"row\":\"12\",\"column\":\"6\",\"isBlock\":\"true\",\"label\":\"CL1D\",\"sublabel\":\"computer laboratory 1\",\"abbrev\":null,\"door\":null,\"bgcolor\":\"#052542\"},{\"x\":\"5\",\"y\":\"12\",\"width\":\"60\",\"height\":\"60\",\"row\":\"13\",\"column\":\"6\",\"isBlock\":\"true\",\"label\":\"CL1D\",\"sublabel\":\"computer laboratory 1\",\"abbrev\":null,\"door\":null,\"bgcolor\":\"#052542\"},{\"x\":\"5\",\"y\":\"13\",\"width\":\"60\",\"height\":\"60\",\"row\":\"14\",\"column\":\"6\",\"isBlock\":\"true\",\"label\":\"CL1D\",\"sublabel\":\"computer laboratory 1\",\"abbrev\":null,\"door\":null,\"bgcolor\":\"#052542\"},{\"x\":\"6\",\"y\":\"0\",\"width\":\"60\",\"height\":\"60\",\"row\":\"1\",\"column\":\"7\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"6\",\"y\":\"1\",\"width\":\"60\",\"height\":\"60\",\"row\":\"2\",\"column\":\"7\",\"isBlock\":\"true\",\"label\":\"CL3A\",\"sublabel\":\"computer laboratory 3\",\"abbrev\":null,\"door\":null,\"bgcolor\":\"#306cab\"},{\"x\":\"6\",\"y\":\"2\",\"width\":\"60\",\"height\":\"60\",\"row\":\"3\",\"column\":\"7\",\"isBlock\":\"true\",\"label\":\"CL3A\",\"sublabel\":\"computer laboratory 3\",\"abbrev\":null,\"door\":null,\"bgcolor\":\"#306cab\"},{\"x\":\"6\",\"y\":\"3\",\"width\":\"60\",\"height\":\"60\",\"row\":\"4\",\"column\":\"7\",\"isBlock\":\"true\",\"label\":\"CL3A\",\"sublabel\":\"computer laboratory 3\",\"abbrev\":null,\"door\":null,\"bgcolor\":\"#306cab\"},{\"x\":\"6\",\"y\":\"4\",\"width\":\"60\",\"height\":\"60\",\"row\":\"5\",\"column\":\"7\",\"isBlock\":\"true\",\"label\":\"SR\",\"sublabel\":\"server room\",\"abbrev\":null,\"door\":null,\"bgcolor\":\"#248ea3\"},{\"x\":\"6\",\"y\":\"5\",\"width\":\"60\",\"height\":\"60\",\"row\":\"6\",\"column\":\"7\",\"isBlock\":\"true\",\"label\":\"CL2M\",\"sublabel\":\"computer laboratory 2\",\"abbrev\":null,\"door\":null,\"bgcolor\":\"#1c4c63\"},{\"x\":\"6\",\"y\":\"6\",\"width\":\"60\",\"height\":\"60\",\"row\":\"7\",\"column\":\"7\",\"isBlock\":\"true\",\"label\":\"CL2M\",\"sublabel\":\"computer laboratory 2\",\"abbrev\":null,\"door\":null,\"bgcolor\":\"#1c4c63\"},{\"x\":\"6\",\"y\":\"7\",\"width\":\"60\",\"height\":\"60\",\"row\":\"8\",\"column\":\"7\",\"isBlock\":\"true\",\"label\":\"CL2M\",\"sublabel\":\"computer laboratory 2\",\"abbrev\":null,\"door\":null,\"bgcolor\":\"#1c4c63\"},{\"x\":\"6\",\"y\":\"8\",\"width\":\"60\",\"height\":\"60\",\"row\":\"9\",\"column\":\"7\",\"isBlock\":\"true\",\"label\":\"CW\",\"sublabel\":\"clinic\",\"abbrev\":null,\"door\":null,\"bgcolor\":\"#d32222\"},{\"x\":\"6\",\"y\":\"9\",\"width\":\"60\",\"height\":\"60\",\"row\":\"10\",\"column\":\"7\",\"isBlock\":\"true\",\"label\":\"CW\",\"sublabel\":\"clinic\",\"abbrev\":null,\"door\":null,\"bgcolor\":\"#d32222\"},{\"x\":\"6\",\"y\":\"10\",\"width\":\"60\",\"height\":\"60\",\"row\":\"11\",\"column\":\"7\",\"isBlock\":\"true\",\"label\":\"CL1D\",\"sublabel\":\"computer laboratory 1\",\"abbrev\":null,\"door\":null,\"bgcolor\":\"#052542\"},{\"x\":\"6\",\"y\":\"11\",\"width\":\"60\",\"height\":\"60\",\"row\":\"12\",\"column\":\"7\",\"isBlock\":\"true\",\"label\":\"CL1D\",\"sublabel\":\"computer laboratory 1\",\"abbrev\":null,\"door\":null,\"bgcolor\":\"#052542\"},{\"x\":\"6\",\"y\":\"12\",\"width\":\"60\",\"height\":\"60\",\"row\":\"13\",\"column\":\"7\",\"isBlock\":\"true\",\"label\":\"CL1D\",\"sublabel\":\"computer laboratory 1\",\"abbrev\":null,\"door\":null,\"bgcolor\":\"#052542\"},{\"x\":\"6\",\"y\":\"13\",\"width\":\"60\",\"height\":\"60\",\"row\":\"14\",\"column\":\"7\",\"isBlock\":\"true\",\"label\":\"CL1D\",\"sublabel\":\"computer laboratory 1\",\"abbrev\":null,\"door\":null,\"bgcolor\":\"#052542\"},{\"x\":\"7\",\"y\":\"0\",\"width\":\"60\",\"height\":\"60\",\"row\":\"1\",\"column\":\"8\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"7\",\"y\":\"1\",\"width\":\"60\",\"height\":\"60\",\"row\":\"2\",\"column\":\"8\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"7\",\"y\":\"2\",\"width\":\"60\",\"height\":\"60\",\"row\":\"3\",\"column\":\"8\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"7\",\"y\":\"3\",\"width\":\"60\",\"height\":\"60\",\"row\":\"4\",\"column\":\"8\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"7\",\"y\":\"4\",\"width\":\"60\",\"height\":\"60\",\"row\":\"5\",\"column\":\"8\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"7\",\"y\":\"5\",\"width\":\"60\",\"height\":\"60\",\"row\":\"6\",\"column\":\"8\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"7\",\"y\":\"6\",\"width\":\"60\",\"height\":\"60\",\"row\":\"7\",\"column\":\"8\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"7\",\"y\":\"7\",\"width\":\"60\",\"height\":\"60\",\"row\":\"8\",\"column\":\"8\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"7\",\"y\":\"8\",\"width\":\"60\",\"height\":\"60\",\"row\":\"9\",\"column\":\"8\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"7\",\"y\":\"9\",\"width\":\"60\",\"height\":\"60\",\"row\":\"10\",\"column\":\"8\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"7\",\"y\":\"10\",\"width\":\"60\",\"height\":\"60\",\"row\":\"11\",\"column\":\"8\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"7\",\"y\":\"11\",\"width\":\"60\",\"height\":\"60\",\"row\":\"12\",\"column\":\"8\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"7\",\"y\":\"12\",\"width\":\"60\",\"height\":\"60\",\"row\":\"13\",\"column\":\"8\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"7\",\"y\":\"13\",\"width\":\"60\",\"height\":\"60\",\"row\":\"14\",\"column\":\"8\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"8\",\"y\":\"0\",\"width\":\"60\",\"height\":\"60\",\"row\":\"1\",\"column\":\"9\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"8\",\"y\":\"1\",\"width\":\"60\",\"height\":\"60\",\"row\":\"2\",\"column\":\"9\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"8\",\"y\":\"2\",\"width\":\"60\",\"height\":\"60\",\"row\":\"3\",\"column\":\"9\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"8\",\"y\":\"3\",\"width\":\"60\",\"height\":\"60\",\"row\":\"4\",\"column\":\"9\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"8\",\"y\":\"4\",\"width\":\"60\",\"height\":\"60\",\"row\":\"5\",\"column\":\"9\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"8\",\"y\":\"5\",\"width\":\"60\",\"height\":\"60\",\"row\":\"6\",\"column\":\"9\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"8\",\"y\":\"6\",\"width\":\"60\",\"height\":\"60\",\"row\":\"7\",\"column\":\"9\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"8\",\"y\":\"7\",\"width\":\"60\",\"height\":\"60\",\"row\":\"8\",\"column\":\"9\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"8\",\"y\":\"8\",\"width\":\"60\",\"height\":\"60\",\"row\":\"9\",\"column\":\"9\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"8\",\"y\":\"9\",\"width\":\"60\",\"height\":\"60\",\"row\":\"10\",\"column\":\"9\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"8\",\"y\":\"10\",\"width\":\"60\",\"height\":\"60\",\"row\":\"11\",\"column\":\"9\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"8\",\"y\":\"11\",\"width\":\"60\",\"height\":\"60\",\"row\":\"12\",\"column\":\"9\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"8\",\"y\":\"12\",\"width\":\"60\",\"height\":\"60\",\"row\":\"13\",\"column\":\"9\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"8\",\"y\":\"13\",\"width\":\"60\",\"height\":\"60\",\"row\":\"14\",\"column\":\"9\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"9\",\"y\":\"0\",\"width\":\"60\",\"height\":\"60\",\"row\":\"1\",\"column\":\"10\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"9\",\"y\":\"1\",\"width\":\"60\",\"height\":\"60\",\"row\":\"2\",\"column\":\"10\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"9\",\"y\":\"2\",\"width\":\"60\",\"height\":\"60\",\"row\":\"3\",\"column\":\"10\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"9\",\"y\":\"3\",\"width\":\"60\",\"height\":\"60\",\"row\":\"4\",\"column\":\"10\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"9\",\"y\":\"4\",\"width\":\"60\",\"height\":\"60\",\"row\":\"5\",\"column\":\"10\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"9\",\"y\":\"5\",\"width\":\"60\",\"height\":\"60\",\"row\":\"6\",\"column\":\"10\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"9\",\"y\":\"6\",\"width\":\"60\",\"height\":\"60\",\"row\":\"7\",\"column\":\"10\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"9\",\"y\":\"7\",\"width\":\"60\",\"height\":\"60\",\"row\":\"8\",\"column\":\"10\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"9\",\"y\":\"8\",\"width\":\"60\",\"height\":\"60\",\"row\":\"9\",\"column\":\"10\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"9\",\"y\":\"9\",\"width\":\"60\",\"height\":\"60\",\"row\":\"10\",\"column\":\"10\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"9\",\"y\":\"10\",\"width\":\"60\",\"height\":\"60\",\"row\":\"11\",\"column\":\"10\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"9\",\"y\":\"11\",\"width\":\"60\",\"height\":\"60\",\"row\":\"12\",\"column\":\"10\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"9\",\"y\":\"12\",\"width\":\"60\",\"height\":\"60\",\"row\":\"13\",\"column\":\"10\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"9\",\"y\":\"13\",\"width\":\"60\",\"height\":\"60\",\"row\":\"14\",\"column\":\"10\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null}]', '2023-12-13 11:34:02', '2023-12-13 11:40:44');

-- --------------------------------------------------------

--
-- Table structure for table `floor_lists`
--

CREATE TABLE `floor_lists` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `floor` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `floor_lists`
--

INSERT INTO `floor_lists` (`id`, `floor`, `created_at`, `updated_at`) VALUES
(1, 'ground-floor', NULL, NULL),
(2, 'floor-1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, 'floor-2', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, 'floor-3', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5, 'floor-4', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(6, 'floor-5', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(7, 'floor-6', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(8, 'floor-7', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(9, 'floor-8', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(10, 'floor-9', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(11, 'floor-10', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `frequentlies`
--

CREATE TABLE `frequentlies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `frequently` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `frequentlies`
--

INSERT INTO `frequentlies` (`id`, `frequently`, `created_at`, `updated_at`) VALUES
(1, 'Where can i find pe?', NULL, '2023-12-11 03:34:26'),
(2, 'Where can i find the library?', '2023-11-29 03:44:24', '2023-11-29 04:02:19'),
(3, 'Where can i find cs department faculty?', '2023-11-29 03:47:29', '2023-11-29 04:02:19'),
(4, 'Navigate me to the male restroom', '2023-11-29 03:48:46', '2023-11-29 03:48:46'),
(5, 'Where is the canteen?', '2023-11-29 03:51:11', '2023-11-29 04:02:19'),
(6, 'Navigate me to the room 501.', '2023-11-29 04:01:53', '2023-12-11 03:34:18');

-- --------------------------------------------------------

--
-- Table structure for table `functionalities`
--

CREATE TABLE `functionalities` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `function` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `functionalities`
--

INSERT INTO `functionalities` (`id`, `function`, `status`, `created_at`, `updated_at`) VALUES
(1, 'speech', 0, NULL, '2023-12-13 08:29:20'),
(2, 'scanner', 0, NULL, '2023-12-13 08:33:01'),
(3, 'in', 0, NULL, '2023-12-13 08:29:04');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2023_09_06_074928_create_eastwoods_facilities_table', 1),
(6, '2023_09_10_021546_create_frequentlies_table', 1),
(7, '2023_09_10_091441_create_teachers_table', 1),
(8, '2023_09_14_154828_create_floorplans_table', 1),
(9, '2023_09_17_132424_update_table_name', 1),
(10, '2023_10_21_102124_create_updates_table', 1),
(11, '2023_10_21_131142_create_functionalities_table', 1),
(12, '2023_11_17_080645_create_abbrevs_table', 1),
(13, '2023_11_20_160201_create_floor_lists_table', 2),
(14, '2023_11_23_144102_create_school_h_m_v_s_table', 3),
(17, '2023_11_30_165508_add_gender_to_teachers', 4),
(18, '2023_12_02_093320_create_qr_models_table', 5),
(20, '2023_12_11_132441_add_color_to_eastwoods_facilities', 6),
(23, '2023_12_11_143542_create_default_facilities_table', 7);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `qr_models`
--

CREATE TABLE `qr_models` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `school_h_m_v_s`
--

CREATE TABLE `school_h_m_v_s` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `descriptions` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `school_h_m_v_s`
--

INSERT INTO `school_h_m_v_s` (`id`, `descriptions`, `type`, `path`, `created_at`, `updated_at`) VALUES
(1, 'A center of excellence in technical, vocational, health and higher education in Bataan pursuing dynamic program offerings paralleled to global standards to uplift the socio-economic growth of the province.', 'vision', NULL, NULL, '2023-11-23 21:56:54'),
(2, 'To develop and offer high quality technical, health and higher education programs that would ensure employability and productivity of young men and women, through proper values and principles as a means to achieve success with excellence.', 'mission', NULL, NULL, '2023-11-23 21:56:43'),
(3, 'hymn', 'hymn', 'mp4/hymn123456_2adac2f8-42e0-4b77-815b-b30b502b9ce7.mp4', NULL, '2023-11-23 21:23:26');

-- --------------------------------------------------------

--
-- Table structure for table `teachers`
--

CREATE TABLE `teachers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `facilities_id` int(10) UNSIGNED NOT NULL,
  `gender` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'male'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `teachers`
--

INSERT INTO `teachers` (`id`, `name`, `position`, `created_at`, `updated_at`, `facilities_id`, `gender`) VALUES
(44, 'Gutierrez Jessica C.', 'Temporarily Unavailable', '2023-12-13 10:45:35', '2023-12-13 10:45:35', 66, 'female'),
(45, 'Layug Romeo M.', 'Temporarily Unavailable', '2023-12-13 10:45:35', '2023-12-13 10:45:35', 89, 'male');

-- --------------------------------------------------------

--
-- Table structure for table `updates`
--

CREATE TABLE `updates` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `from` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `list` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `action` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `updates`
--

INSERT INTO `updates` (`id`, `from`, `list`, `action`, `status`, `created_at`, `updated_at`) VALUES
(111, 'Floor Plan', 'You have added a floor-5 layout.', 'added', 1, '2023-12-12 02:51:04', '2023-12-13 07:59:48'),
(112, 'Floor Plan', 'You have updated a ground-floor layout.', 'updated', 1, '2023-12-12 02:54:35', '2023-12-13 07:59:48'),
(113, 'Floor Plan', 'You have updated a ground-floor layout.', 'updated', 1, '2023-12-12 02:54:50', '2023-12-13 07:59:48'),
(114, 'Floor Plan', 'You have updated a ground-floor layout.', 'updated', 1, '2023-12-12 02:56:37', '2023-12-13 07:59:48'),
(115, 'Floor Plan', 'You have updated a ground-floor layout.', 'updated', 1, '2023-12-12 05:31:54', '2023-12-13 07:59:48'),
(116, 'Floor Plan', 'You have updated a ground-floor layout.', 'updated', 1, '2023-12-12 06:15:52', '2023-12-13 07:59:48'),
(117, 'Floor Plan', 'You have updated a ground-floor layout.', 'updated', 1, '2023-12-12 06:16:16', '2023-12-13 07:59:48'),
(118, 'Floor Plan', 'You have updated a ground-floor layout.', 'updated', 1, '2023-12-12 06:17:18', '2023-12-13 07:59:48'),
(119, 'Floor Plan', 'You have updated a ground-floor layout.', 'updated', 1, '2023-12-12 06:17:44', '2023-12-13 07:59:48'),
(120, 'Floor Plan', 'You have updated a ground-floor layout.', 'updated', 1, '2023-12-12 10:35:48', '2023-12-13 07:59:48'),
(121, 'Floor Plan', 'You have updated a ground-floor layout.', 'updated', 1, '2023-12-12 10:38:59', '2023-12-13 07:59:48'),
(122, 'Floor Plan', 'You have updated a ground-floor layout.', 'updated', 1, '2023-12-12 10:39:36', '2023-12-13 07:59:48'),
(123, 'Floor Plan', 'You have updated a ground-floor layout.', 'updated', 1, '2023-12-12 10:42:40', '2023-12-13 07:59:48'),
(124, 'Floor Plan', 'You have updated a ground-floor layout.', 'updated', 1, '2023-12-12 10:42:50', '2023-12-13 07:59:48'),
(125, 'Functionalities Update', 'You have disabled in function.', 'updated', 1, '2023-12-13 08:04:38', '2023-12-13 08:04:51'),
(126, 'Functionalities Update', 'You have enabled in function.', 'updated', 1, '2023-12-13 08:04:46', '2023-12-13 08:04:51'),
(127, 'Functionalities Update', 'You have disabled in function.', 'updated', 0, '2023-12-13 08:22:13', '2023-12-13 08:22:13'),
(128, 'Functionalities Update', 'You have enabled in function.', 'updated', 0, '2023-12-13 08:22:48', '2023-12-13 08:22:48'),
(129, 'Functionalities Update', 'You have enabled scanner function.', 'updated', 0, '2023-12-13 08:27:09', '2023-12-13 08:27:09'),
(130, 'Functionalities Update', 'You have disabled scanner function.', 'updated', 0, '2023-12-13 08:27:26', '2023-12-13 08:27:26'),
(131, 'Functionalities Update', 'You have disabled in function.', 'updated', 0, '2023-12-13 08:28:33', '2023-12-13 08:28:33'),
(132, 'Functionalities Update', 'You have enabled in function.', 'updated', 0, '2023-12-13 08:28:45', '2023-12-13 08:28:45'),
(133, 'Functionalities Update', 'You have disabled in function.', 'updated', 0, '2023-12-13 08:29:04', '2023-12-13 08:29:04'),
(134, 'Functionalities Update', 'You have disabled speech function.', 'updated', 0, '2023-12-13 08:29:20', '2023-12-13 08:29:20'),
(135, 'Functionalities Update', 'You have enabled scanner function.', 'updated', 0, '2023-12-13 08:29:36', '2023-12-13 08:29:36'),
(136, 'Functionalities Update', 'You have disabled scanner function.', 'updated', 0, '2023-12-13 08:33:01', '2023-12-13 08:33:01'),
(137, 'Floor Plan', 'You have added a ground-floor layout.', 'added', 0, '2023-12-13 11:25:31', '2023-12-13 11:25:31'),
(138, 'Floor Plan', 'You have added a floor-2 layout.', 'added', 0, '2023-12-13 11:34:02', '2023-12-13 11:34:02'),
(139, 'Floor Plan', 'You have updated a floor-2 layout.', 'updated', 0, '2023-12-13 11:34:12', '2023-12-13 11:34:12'),
(140, 'Floor Plan', 'You have updated a floor-2 layout.', 'updated', 0, '2023-12-13 11:36:22', '2023-12-13 11:36:22');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Administrator', 'ad.east2021@gmail.com', NULL, '$2y$10$xPed2OPu9Dtd6e4iriCheehtmkTsDaC78CkLzr5.U9BfB7AfN4dei', 'gyIguhkwDJZpJFOnSRuZY3VJ0YQpODzIejwQGXuaaVEhM6atN8AAUTeNHTHK', NULL, '2023-12-12 02:42:11');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `abbrevs`
--
ALTER TABLE `abbrevs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `default_facilities`
--
ALTER TABLE `default_facilities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `eastwoods_facilities`
--
ALTER TABLE `eastwoods_facilities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `floorplans`
--
ALTER TABLE `floorplans`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `floor_lists`
--
ALTER TABLE `floor_lists`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `frequentlies`
--
ALTER TABLE `frequentlies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `functionalities`
--
ALTER TABLE `functionalities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `qr_models`
--
ALTER TABLE `qr_models`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `school_h_m_v_s`
--
ALTER TABLE `school_h_m_v_s`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `teachers`
--
ALTER TABLE `teachers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `updates`
--
ALTER TABLE `updates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `abbrevs`
--
ALTER TABLE `abbrevs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=108;

--
-- AUTO_INCREMENT for table `default_facilities`
--
ALTER TABLE `default_facilities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `eastwoods_facilities`
--
ALTER TABLE `eastwoods_facilities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=108;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `floorplans`
--
ALTER TABLE `floorplans`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `floor_lists`
--
ALTER TABLE `floor_lists`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `frequentlies`
--
ALTER TABLE `frequentlies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `functionalities`
--
ALTER TABLE `functionalities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `qr_models`
--
ALTER TABLE `qr_models`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=117;

--
-- AUTO_INCREMENT for table `school_h_m_v_s`
--
ALTER TABLE `school_h_m_v_s`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `teachers`
--
ALTER TABLE `teachers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `updates`
--
ALTER TABLE `updates`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=141;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
