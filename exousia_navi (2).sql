-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 12, 2023 at 08:36 PM
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
(56, 56, 'TO', '2023-12-12 10:02:19', '2023-12-12 10:02:19');

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
(5, 'guard house', '2023-12-11 20:15:45', '2023-11-17 19:51:28', '2023-12-11 12:15:45', 'ground-floor', '#4348e5'),
(6, 'student lounge', '2023-12-11 20:15:45', '2023-11-17 19:51:28', '2023-12-11 12:15:45', 'ground-floor', '#e4bb25'),
(7, 'school service parking', '2023-12-11 20:15:45', '2023-11-17 19:51:28', '2023-12-11 12:15:45', 'ground-floor', '#c09726'),
(8, 'pe', '2023-12-11 20:15:45', '2023-11-17 19:51:28', '2023-12-11 12:15:45', 'ground-floor', '#5fc874'),
(9, 'administration office', '2023-12-11 20:15:45', '2023-11-18 12:06:43', '2023-12-11 12:15:45', 'ground-floor', '#244beb'),
(10, 'tesda focal office', '2023-12-11 20:16:59', '2023-11-18 12:06:43', '2023-12-11 12:16:59', 'ground-floor', '#4054e7'),
(12, 'room 101', '2023-12-11 20:16:59', '2023-11-18 12:06:43', '2023-12-11 12:16:59', 'ground-floor', '#41c13e'),
(13, 'room 102', '2023-12-11 20:16:59', '2023-11-18 12:06:43', '2023-12-11 12:16:59', 'ground-floor', '#48d560'),
(14, 'guidance office', '2023-12-11 20:16:59', '2023-11-18 12:06:43', '2023-12-11 12:16:59', 'ground-floor', '#4675e2'),
(15, 'canteen', '2023-12-11 20:16:59', '2023-11-18 12:06:43', '2023-12-11 12:16:59', 'ground-floor', '#dfe246'),
(16, 'office of student affairs', '2023-12-11 20:19:02', '2023-11-18 12:06:43', '2023-12-11 12:19:02', 'ground-floor', '#368fd3'),
(17, 'drawing room', '2023-12-11 20:19:02', '2023-11-18 12:06:43', '2023-12-11 12:19:02', 'ground-floor', '#6ad26c'),
(18, 'engineering department faculty', '2023-12-11 20:19:02', '2023-11-18 12:06:43', '2023-12-11 12:19:02', 'ground-floor', '#3299cd'),
(19, 'male restroom', '2023-12-11 20:19:02', '2023-11-18 12:06:43', '2023-12-11 12:19:02', 'ground-floor', '#de6363'),
(20, 'female restroom', '2023-12-11 20:19:02', '2023-11-18 12:06:44', '2023-12-11 12:19:02', 'ground-floor', '#ea6666'),
(21, 'clinic', '2023-12-03 07:41:28', '2023-11-28 23:35:39', '2023-12-02 23:41:28', 'floor-2', '#999'),
(22, 'library', '2023-12-03 07:41:28', '2023-11-28 23:35:39', '2023-12-02 23:41:28', 'floor-2', '#999'),
(23, 'server room', '2023-12-03 07:41:28', '2023-11-28 23:35:39', '2023-12-02 23:41:28', 'floor-2', '#999'),
(24, 'computer laboratory 1', '2023-12-03 07:41:28', '2023-11-28 23:35:39', '2023-12-02 23:41:28', 'floor-2', '#999'),
(25, 'computer laboratory 2', '2023-12-03 07:41:28', '2023-11-28 23:35:39', '2023-12-02 23:41:28', 'floor-2', '#999'),
(26, 'computer laboratory 3', '2023-12-03 07:41:28', '2023-11-28 23:35:39', '2023-12-02 23:41:28', 'floor-2', '#999'),
(27, 'cs department faculty', '2023-12-03 07:41:28', '2023-11-28 23:35:39', '2023-12-02 23:41:28', 'floor-2', '#999'),
(28, 'male restroom', '2023-12-03 07:41:28', '2023-11-28 23:35:39', '2023-12-02 23:41:28', 'floor-2', '#999'),
(29, 'female restroom', '2023-12-03 07:41:28', '2023-11-28 23:35:40', '2023-12-02 23:41:28', 'floor-2', '#999'),
(30, 'room 301', '2023-12-03 07:41:28', '2023-11-28 23:37:38', '2023-12-02 23:41:28', 'floor-3', '#999'),
(31, 'room 302', '2023-12-03 07:41:28', '2023-11-28 23:37:38', '2023-12-02 23:41:28', 'floor-3', '#999'),
(32, 'room 303', '2023-12-03 07:41:28', '2023-11-28 23:37:38', '2023-12-02 23:41:28', 'floor-3', '#999'),
(33, 'room 304', '2023-12-03 07:41:28', '2023-11-28 23:37:38', '2023-12-02 23:41:28', 'floor-3', '#999'),
(34, 'caregiving room', '2023-12-03 07:41:28', '2023-11-28 23:37:38', '2023-12-02 23:41:28', 'floor-3', '#999'),
(35, 'storage room', '2023-12-03 07:41:28', '2023-11-28 23:37:39', '2023-12-02 23:41:28', 'floor-3', '#999'),
(36, 'gen ed faculty room', '2023-12-03 07:41:28', '2023-11-28 23:37:39', '2023-12-02 23:41:28', 'floor-3', '#999'),
(37, 'room 401', '2023-12-03 07:41:28', '2023-11-28 23:40:02', '2023-12-02 23:41:28', 'floor-4', '#999'),
(38, 'room 402', '2023-12-03 07:41:29', '2023-11-28 23:40:02', '2023-12-02 23:41:29', 'floor-4', '#999'),
(39, 'room 403', '2023-12-03 07:41:29', '2023-11-28 23:40:02', '2023-12-02 23:41:29', 'floor-4', '#999'),
(40, 'chemistry laboratory', '2023-12-03 07:41:29', '2023-11-28 23:40:02', '2023-12-02 23:41:29', 'floor-4', '#999'),
(41, 'physics laboratory', '2023-12-11 17:24:25', '2023-11-28 23:40:02', '2023-12-11 09:24:25', 'floor-4', '#000000'),
(42, 'massage therapy room', '2023-12-11 17:24:25', '2023-11-28 23:40:02', '2023-12-11 09:24:25', 'floor-4', '#000000'),
(43, 'male restroom', '2023-12-11 17:24:25', '2023-11-28 23:40:02', '2023-12-11 09:24:25', 'floor-4', '#000000'),
(44, 'female restroom', '2023-12-11 17:24:25', '2023-11-28 23:40:02', '2023-12-11 09:24:25', 'floor-4', '#000000'),
(45, 'room 501', '2023-12-11 17:24:25', '2023-11-28 23:43:09', '2023-12-11 09:24:25', 'floor-5', '#1f24bd'),
(46, 'room 502', '2023-12-11 17:24:49', '2023-11-28 23:43:09', '2023-12-11 09:24:49', 'floor-5', '#360fd2'),
(47, 'room 503', '2023-12-11 17:24:49', '2023-11-28 23:43:09', '2023-12-11 09:24:49', 'floor-5', '#4f9c70'),
(48, 'kitchen laboratory', '2023-12-11 17:24:49', '2023-11-28 23:43:09', '2023-12-11 09:24:49', 'floor-5', '#345535'),
(49, 'mini bar and restaurant', '2023-12-11 17:24:49', '2023-11-28 23:43:09', '2023-12-11 09:24:49', 'floor-5', '#e92525'),
(50, 'pantry and storage', '2023-12-11 17:24:49', '2023-11-28 23:43:09', '2023-12-11 09:24:49', 'floor-5', '#000000'),
(51, 'standard and suite room', '2023-12-03 07:41:29', '2023-11-28 23:43:09', '2023-12-02 23:41:29', 'floor-5', '#999'),
(52, 'hm department faculty', '2023-12-03 07:41:29', '2023-11-28 23:43:09', '2023-12-02 23:41:29', 'floor-5', '#999'),
(53, 'male restroom', '2023-12-03 07:41:29', '2023-11-28 23:43:09', '2023-12-02 23:41:29', 'floor-5', '#999'),
(54, 'female restroom', '2023-12-03 07:41:29', '2023-11-28 23:43:09', '2023-12-02 23:41:29', 'floor-5', '#999'),
(55, 'test1', '2023-12-12 18:02:19', '2023-12-12 10:02:19', '2023-12-12 10:02:19', 'ground-floor', '#e00606'),
(56, 'test2', '2023-12-12 18:02:19', '2023-12-12 10:02:19', '2023-12-12 10:02:19', 'ground-floor', '#ed0c0c');

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
(23, 'ground-floor', 140, '[{\"x\":\"0\",\"y\":\"0\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"1\",\"column\":\"1\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"0\",\"y\":\"1\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"2\",\"column\":\"1\",\"isBlock\":\"true\",\"label\":\"EDFT\",\"sublabel\":\"engineering department faculty\",\"abbrev\":null,\"door\":\"true\",\"bgcolor\":\"#3299cd\"},{\"x\":\"0\",\"y\":\"2\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"3\",\"column\":\"1\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"0\",\"y\":\"3\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"4\",\"column\":\"1\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"0\",\"y\":\"4\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"5\",\"column\":\"1\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"0\",\"y\":\"5\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"6\",\"column\":\"1\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"0\",\"y\":\"6\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"7\",\"column\":\"1\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"0\",\"y\":\"7\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"8\",\"column\":\"1\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"0\",\"y\":\"8\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"9\",\"column\":\"1\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"0\",\"y\":\"9\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"10\",\"column\":\"1\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"0\",\"y\":\"10\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"11\",\"column\":\"1\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"0\",\"y\":\"11\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"12\",\"column\":\"1\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"0\",\"y\":\"12\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"13\",\"column\":\"1\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"0\",\"y\":\"13\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"14\",\"column\":\"1\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"1\",\"y\":\"0\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"1\",\"column\":\"2\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"1\",\"y\":\"1\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"2\",\"column\":\"2\",\"isBlock\":\"true\",\"label\":\"DRR\",\"sublabel\":\"drawing room\",\"abbrev\":null,\"door\":null,\"bgcolor\":\"#6ad26c\"},{\"x\":\"1\",\"y\":\"2\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"3\",\"column\":\"2\",\"isBlock\":\"true\",\"label\":\"DRR\",\"sublabel\":\"drawing room\",\"abbrev\":null,\"door\":\"true\",\"bgcolor\":\"#6ad26c\"},{\"x\":\"1\",\"y\":\"3\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"4\",\"column\":\"2\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"1\",\"y\":\"4\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"5\",\"column\":\"2\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"1\",\"y\":\"5\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"6\",\"column\":\"2\",\"isBlock\":\"true\",\"label\":\"OOSA\",\"sublabel\":\"office of student affairs\",\"abbrev\":null,\"door\":\"true\",\"bgcolor\":\"#368fd3\"},{\"x\":\"1\",\"y\":\"6\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"7\",\"column\":\"2\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"1\",\"y\":\"7\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"8\",\"column\":\"2\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"1\",\"y\":\"8\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"9\",\"column\":\"2\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"1\",\"y\":\"9\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"10\",\"column\":\"2\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"1\",\"y\":\"10\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"11\",\"column\":\"2\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"1\",\"y\":\"11\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"12\",\"column\":\"2\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"1\",\"y\":\"12\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"13\",\"column\":\"2\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"1\",\"y\":\"13\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"14\",\"column\":\"2\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"2\",\"y\":\"0\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"1\",\"column\":\"3\",\"isBlock\":\"true\",\"label\":\"C\",\"sublabel\":\"canteen\",\"abbrev\":null,\"door\":null,\"bgcolor\":\"#dfe246\"},{\"x\":\"2\",\"y\":\"1\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"2\",\"column\":\"3\",\"isBlock\":\"true\",\"label\":\"C\",\"sublabel\":\"canteen\",\"abbrev\":null,\"door\":null,\"bgcolor\":\"#dfe246\"},{\"x\":\"2\",\"y\":\"2\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"3\",\"column\":\"3\",\"isBlock\":\"true\",\"label\":\"C\",\"sublabel\":\"canteen\",\"abbrev\":null,\"door\":null,\"bgcolor\":\"#dfe246\"},{\"x\":\"2\",\"y\":\"3\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"4\",\"column\":\"3\",\"isBlock\":\"true\",\"label\":\"C\",\"sublabel\":\"canteen\",\"abbrev\":null,\"door\":\"true\",\"bgcolor\":\"#dfe246\"},{\"x\":\"2\",\"y\":\"4\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"5\",\"column\":\"3\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"2\",\"y\":\"5\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"6\",\"column\":\"3\",\"isBlock\":\"true\",\"label\":\"wall\",\"sublabel\":\"wall\",\"abbrev\":null,\"door\":null,\"bgcolor\":\"#999\"},{\"x\":\"2\",\"y\":\"6\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"7\",\"column\":\"3\",\"isBlock\":\"true\",\"label\":\"P\",\"sublabel\":\"pe\",\"abbrev\":null,\"door\":null,\"bgcolor\":\"#5fc874\"},{\"x\":\"2\",\"y\":\"7\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"8\",\"column\":\"3\",\"isBlock\":\"true\",\"label\":\"P\",\"sublabel\":\"pe\",\"abbrev\":null,\"door\":null,\"bgcolor\":\"#5fc874\"},{\"x\":\"2\",\"y\":\"8\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"9\",\"column\":\"3\",\"isBlock\":\"true\",\"label\":\"P\",\"sublabel\":\"pe\",\"abbrev\":null,\"door\":null,\"bgcolor\":\"#5fc874\"},{\"x\":\"2\",\"y\":\"9\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"10\",\"column\":\"3\",\"isBlock\":\"true\",\"label\":\"P\",\"sublabel\":\"pe\",\"abbrev\":null,\"door\":null,\"bgcolor\":\"#5fc874\"},{\"x\":\"2\",\"y\":\"10\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"11\",\"column\":\"3\",\"isBlock\":\"true\",\"label\":\"P\",\"sublabel\":\"pe\",\"abbrev\":null,\"door\":null,\"bgcolor\":\"#5fc874\"},{\"x\":\"2\",\"y\":\"11\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"12\",\"column\":\"3\",\"isBlock\":\"true\",\"label\":\"P\",\"sublabel\":\"pe\",\"abbrev\":null,\"door\":null,\"bgcolor\":\"#5fc874\"},{\"x\":\"2\",\"y\":\"12\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"13\",\"column\":\"3\",\"isBlock\":\"true\",\"label\":\"SSP\",\"sublabel\":\"school service parking\",\"abbrev\":null,\"door\":null,\"bgcolor\":\"#c09726\"},{\"x\":\"2\",\"y\":\"13\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"14\",\"column\":\"3\",\"isBlock\":\"true\",\"label\":\"SSP\",\"sublabel\":\"school service parking\",\"abbrev\":null,\"door\":null,\"bgcolor\":\"#c09726\"},{\"x\":\"3\",\"y\":\"0\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"1\",\"column\":\"4\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"3\",\"y\":\"1\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"2\",\"column\":\"4\",\"isBlock\":\"true\",\"label\":\"C\",\"sublabel\":\"canteen\",\"abbrev\":null,\"door\":null,\"bgcolor\":\"#dfe246\"},{\"x\":\"3\",\"y\":\"2\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"3\",\"column\":\"4\",\"isBlock\":\"true\",\"label\":\"R1\",\"sublabel\":\"room 101\",\"abbrev\":null,\"door\":null,\"bgcolor\":\"#41c13e\"},{\"x\":\"3\",\"y\":\"3\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"4\",\"column\":\"4\",\"isBlock\":\"true\",\"label\":\"R1\",\"sublabel\":\"room 101\",\"abbrev\":null,\"door\":null,\"bgcolor\":\"#41c13e\"},{\"x\":\"3\",\"y\":\"4\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"5\",\"column\":\"4\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"3\",\"y\":\"5\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"6\",\"column\":\"4\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"3\",\"y\":\"6\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"7\",\"column\":\"4\",\"isBlock\":\"false\",\"label\":\"P\",\"sublabel\":\"pe\",\"abbrev\":null,\"door\":\"true\",\"bgcolor\":\"#5fc874\"},{\"x\":\"3\",\"y\":\"7\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"8\",\"column\":\"4\",\"isBlock\":\"true\",\"label\":\"P\",\"sublabel\":\"pe\",\"abbrev\":null,\"door\":null,\"bgcolor\":\"#5fc874\"},{\"x\":\"3\",\"y\":\"8\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"9\",\"column\":\"4\",\"isBlock\":\"true\",\"label\":\"P\",\"sublabel\":\"pe\",\"abbrev\":null,\"door\":null,\"bgcolor\":\"#5fc874\"},{\"x\":\"3\",\"y\":\"9\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"10\",\"column\":\"4\",\"isBlock\":\"true\",\"label\":\"P\",\"sublabel\":\"pe\",\"abbrev\":null,\"door\":null,\"bgcolor\":\"#5fc874\"},{\"x\":\"3\",\"y\":\"10\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"11\",\"column\":\"4\",\"isBlock\":\"true\",\"label\":\"P\",\"sublabel\":\"pe\",\"abbrev\":null,\"door\":null,\"bgcolor\":\"#5fc874\"},{\"x\":\"3\",\"y\":\"11\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"12\",\"column\":\"4\",\"isBlock\":\"true\",\"label\":\"P\",\"sublabel\":\"pe\",\"abbrev\":null,\"door\":null,\"bgcolor\":\"#5fc874\"},{\"x\":\"3\",\"y\":\"12\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"13\",\"column\":\"4\",\"isBlock\":\"true\",\"label\":\"SSP\",\"sublabel\":\"school service parking\",\"abbrev\":null,\"door\":null,\"bgcolor\":\"#c09726\"},{\"x\":\"3\",\"y\":\"13\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"14\",\"column\":\"4\",\"isBlock\":\"true\",\"label\":\"SSP\",\"sublabel\":\"school service parking\",\"abbrev\":null,\"door\":null,\"bgcolor\":\"#c09726\"},{\"x\":\"4\",\"y\":\"0\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"1\",\"column\":\"5\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"4\",\"y\":\"1\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"2\",\"column\":\"5\",\"isBlock\":\"true\",\"label\":\"MRV\",\"sublabel\":\"male restroom\",\"abbrev\":null,\"door\":\"true\",\"bgcolor\":\"#de6363\"},{\"x\":\"4\",\"y\":\"2\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"3\",\"column\":\"5\",\"isBlock\":\"true\",\"label\":\"R1\",\"sublabel\":\"room 101\",\"abbrev\":null,\"door\":null,\"bgcolor\":\"#41c13e\"},{\"x\":\"4\",\"y\":\"3\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"4\",\"column\":\"5\",\"isBlock\":\"true\",\"label\":\"R1\",\"sublabel\":\"room 101\",\"abbrev\":null,\"door\":\"true\",\"bgcolor\":\"#41c13e\"},{\"x\":\"4\",\"y\":\"4\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"5\",\"column\":\"5\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"4\",\"y\":\"5\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"6\",\"column\":\"5\",\"isBlock\":\"true\",\"label\":\"FRL\",\"sublabel\":\"female restroom\",\"abbrev\":null,\"door\":\"true\",\"bgcolor\":\"#ea6666\"},{\"x\":\"4\",\"y\":\"6\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"7\",\"column\":\"5\",\"isBlock\":\"true\",\"label\":\"P\",\"sublabel\":\"pe\",\"abbrev\":null,\"door\":null,\"bgcolor\":\"#5fc874\"},{\"x\":\"4\",\"y\":\"7\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"8\",\"column\":\"5\",\"isBlock\":\"true\",\"label\":\"P\",\"sublabel\":\"pe\",\"abbrev\":null,\"door\":null,\"bgcolor\":\"#5fc874\"},{\"x\":\"4\",\"y\":\"8\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"9\",\"column\":\"5\",\"isBlock\":\"true\",\"label\":\"P\",\"sublabel\":\"pe\",\"abbrev\":null,\"door\":null,\"bgcolor\":\"#5fc874\"},{\"x\":\"4\",\"y\":\"9\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"10\",\"column\":\"5\",\"isBlock\":\"true\",\"label\":\"P\",\"sublabel\":\"pe\",\"abbrev\":null,\"door\":null,\"bgcolor\":\"#5fc874\"},{\"x\":\"4\",\"y\":\"10\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"11\",\"column\":\"5\",\"isBlock\":\"true\",\"label\":\"P\",\"sublabel\":\"pe\",\"abbrev\":null,\"door\":null,\"bgcolor\":\"#5fc874\"},{\"x\":\"4\",\"y\":\"11\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"12\",\"column\":\"5\",\"isBlock\":\"true\",\"label\":\"P\",\"sublabel\":\"pe\",\"abbrev\":null,\"door\":null,\"bgcolor\":\"#5fc874\"},{\"x\":\"4\",\"y\":\"12\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"13\",\"column\":\"5\",\"isBlock\":\"true\",\"label\":\"SSP\",\"sublabel\":\"school service parking\",\"abbrev\":null,\"door\":null,\"bgcolor\":\"#c09726\"},{\"x\":\"4\",\"y\":\"13\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"14\",\"column\":\"5\",\"isBlock\":\"true\",\"label\":\"SSP\",\"sublabel\":\"school service parking\",\"abbrev\":null,\"door\":null,\"bgcolor\":\"#c09726\"},{\"x\":\"5\",\"y\":\"0\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"1\",\"column\":\"6\",\"isBlock\":\"true\",\"label\":\"GOG\",\"sublabel\":\"guidance office\",\"abbrev\":null,\"door\":null,\"bgcolor\":\"#4675e2\"},{\"x\":\"5\",\"y\":\"1\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"2\",\"column\":\"6\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"5\",\"y\":\"2\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"3\",\"column\":\"6\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"5\",\"y\":\"3\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"4\",\"column\":\"6\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"5\",\"y\":\"4\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"5\",\"column\":\"6\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"5\",\"y\":\"5\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"6\",\"column\":\"6\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"5\",\"y\":\"6\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"7\",\"column\":\"6\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"5\",\"y\":\"7\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"8\",\"column\":\"6\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"5\",\"y\":\"8\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"9\",\"column\":\"6\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"5\",\"y\":\"9\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"10\",\"column\":\"6\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"5\",\"y\":\"10\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"11\",\"column\":\"6\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"5\",\"y\":\"11\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"12\",\"column\":\"6\",\"isBlock\":\"true\",\"label\":\"stair-in\",\"sublabel\":\"stair-in\",\"abbrev\":null,\"door\":\"true\",\"bgcolor\":\"#0e8218\"},{\"x\":\"5\",\"y\":\"12\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"13\",\"column\":\"6\",\"isBlock\":\"true\",\"label\":\"SSP\",\"sublabel\":\"school service parking\",\"abbrev\":null,\"door\":null,\"bgcolor\":\"#c09726\"},{\"x\":\"5\",\"y\":\"13\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"14\",\"column\":\"6\",\"isBlock\":\"true\",\"label\":\"SSP\",\"sublabel\":\"school service parking\",\"abbrev\":null,\"door\":null,\"bgcolor\":\"#c09726\"},{\"x\":\"6\",\"y\":\"0\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"1\",\"column\":\"7\",\"isBlock\":\"true\",\"label\":\"GOG\",\"sublabel\":\"guidance office\",\"abbrev\":null,\"door\":\"true\",\"bgcolor\":\"#4675e2\"},{\"x\":\"6\",\"y\":\"1\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"2\",\"column\":\"7\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"6\",\"y\":\"2\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"3\",\"column\":\"7\",\"isBlock\":\"true\",\"label\":\"R1N\",\"sublabel\":\"room 102\",\"abbrev\":null,\"door\":\"true\",\"bgcolor\":\"#48d560\"},{\"x\":\"6\",\"y\":\"3\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"4\",\"column\":\"7\",\"isBlock\":\"true\",\"label\":\"R1N\",\"sublabel\":\"room 102\",\"abbrev\":null,\"door\":null,\"bgcolor\":\"#48d560\"},{\"x\":\"6\",\"y\":\"4\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"5\",\"column\":\"7\",\"isBlock\":\"true\",\"label\":\"AO\",\"sublabel\":\"administration office\",\"abbrev\":null,\"door\":null,\"bgcolor\":\"#244beb\"},{\"x\":\"6\",\"y\":\"5\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"6\",\"column\":\"7\",\"isBlock\":\"false\",\"label\":\"AO\",\"sublabel\":\"administration office\",\"abbrev\":null,\"door\":\"true\",\"bgcolor\":\"#244beb\"},{\"x\":\"6\",\"y\":\"6\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"7\",\"column\":\"7\",\"isBlock\":\"true\",\"label\":\"AO\",\"sublabel\":\"administration office\",\"abbrev\":null,\"door\":null,\"bgcolor\":\"#244beb\"},{\"x\":\"6\",\"y\":\"7\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"8\",\"column\":\"7\",\"isBlock\":\"true\",\"label\":\"AO\",\"sublabel\":\"administration office\",\"abbrev\":null,\"door\":null,\"bgcolor\":\"#244beb\"},{\"x\":\"6\",\"y\":\"8\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"9\",\"column\":\"7\",\"isBlock\":\"true\",\"label\":\"AO\",\"sublabel\":\"administration office\",\"abbrev\":null,\"door\":null,\"bgcolor\":\"#244beb\"},{\"x\":\"6\",\"y\":\"9\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"10\",\"column\":\"7\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"6\",\"y\":\"10\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"11\",\"column\":\"7\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"6\",\"y\":\"11\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"12\",\"column\":\"7\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"6\",\"y\":\"12\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"13\",\"column\":\"7\",\"isBlock\":\"true\",\"label\":\"SSP\",\"sublabel\":\"school service parking\",\"abbrev\":null,\"door\":\"true\",\"bgcolor\":\"#c09726\"},{\"x\":\"6\",\"y\":\"13\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"14\",\"column\":\"7\",\"isBlock\":\"true\",\"label\":\"SSP\",\"sublabel\":\"school service parking\",\"abbrev\":null,\"door\":null,\"bgcolor\":\"#c09726\"},{\"x\":\"7\",\"y\":\"0\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"1\",\"column\":\"8\",\"isBlock\":\"true\",\"label\":\"GOG\",\"sublabel\":\"guidance office\",\"abbrev\":null,\"door\":null,\"bgcolor\":\"#4675e2\"},{\"x\":\"7\",\"y\":\"1\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"2\",\"column\":\"8\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"7\",\"y\":\"2\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"3\",\"column\":\"8\",\"isBlock\":\"true\",\"label\":\"R1N\",\"sublabel\":\"room 102\",\"abbrev\":null,\"door\":null,\"bgcolor\":\"#48d560\"},{\"x\":\"7\",\"y\":\"3\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"4\",\"column\":\"8\",\"isBlock\":\"true\",\"label\":\"R1N\",\"sublabel\":\"room 102\",\"abbrev\":null,\"door\":null,\"bgcolor\":\"#48d560\"},{\"x\":\"7\",\"y\":\"4\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"5\",\"column\":\"8\",\"isBlock\":\"true\",\"label\":\"AO\",\"sublabel\":\"administration office\",\"abbrev\":null,\"door\":null,\"bgcolor\":\"#244beb\"},{\"x\":\"7\",\"y\":\"5\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"6\",\"column\":\"8\",\"isBlock\":\"true\",\"label\":\"AO\",\"sublabel\":\"administration office\",\"abbrev\":null,\"door\":null,\"bgcolor\":\"#244beb\"},{\"x\":\"7\",\"y\":\"6\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"7\",\"column\":\"8\",\"isBlock\":\"true\",\"label\":\"AO\",\"sublabel\":\"administration office\",\"abbrev\":null,\"door\":null,\"bgcolor\":\"#244beb\"},{\"x\":\"7\",\"y\":\"7\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"8\",\"column\":\"8\",\"isBlock\":\"true\",\"label\":\"AO\",\"sublabel\":\"administration office\",\"abbrev\":null,\"door\":null,\"bgcolor\":\"#244beb\"},{\"x\":\"7\",\"y\":\"8\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"9\",\"column\":\"8\",\"isBlock\":\"true\",\"label\":\"AO\",\"sublabel\":\"administration office\",\"abbrev\":null,\"door\":null,\"bgcolor\":\"#244beb\"},{\"x\":\"7\",\"y\":\"9\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"10\",\"column\":\"8\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"7\",\"y\":\"10\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"11\",\"column\":\"8\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"7\",\"y\":\"11\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"12\",\"column\":\"8\",\"isBlock\":\"false\",\"label\":\"front\",\"sublabel\":\"front\",\"abbrev\":null,\"door\":\"true\",\"bgcolor\":\"#0e8218\"},{\"x\":\"7\",\"y\":\"12\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"13\",\"column\":\"8\",\"isBlock\":\"true\",\"label\":\"SSP\",\"sublabel\":\"school service parking\",\"abbrev\":null,\"door\":null,\"bgcolor\":\"#c09726\"},{\"x\":\"7\",\"y\":\"13\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"14\",\"column\":\"8\",\"isBlock\":\"true\",\"label\":\"SSP\",\"sublabel\":\"school service parking\",\"abbrev\":null,\"door\":null,\"bgcolor\":\"#c09726\"},{\"x\":\"8\",\"y\":\"0\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"1\",\"column\":\"9\",\"isBlock\":\"true\",\"label\":\"TFOI\",\"sublabel\":\"tesda focal office\",\"abbrev\":null,\"door\":\"true\",\"bgcolor\":\"#4054e7\"},{\"x\":\"8\",\"y\":\"1\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"2\",\"column\":\"9\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"8\",\"y\":\"2\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"3\",\"column\":\"9\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"8\",\"y\":\"3\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"4\",\"column\":\"9\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"8\",\"y\":\"4\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"5\",\"column\":\"9\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"8\",\"y\":\"5\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"6\",\"column\":\"9\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"8\",\"y\":\"6\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"7\",\"column\":\"9\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"8\",\"y\":\"7\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"8\",\"column\":\"9\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"8\",\"y\":\"8\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"9\",\"column\":\"9\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"8\",\"y\":\"9\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"10\",\"column\":\"9\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"8\",\"y\":\"10\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"11\",\"column\":\"9\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"8\",\"y\":\"11\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"12\",\"column\":\"9\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"8\",\"y\":\"12\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"13\",\"column\":\"9\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"8\",\"y\":\"13\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"14\",\"column\":\"9\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"9\",\"y\":\"0\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"1\",\"column\":\"10\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"9\",\"y\":\"1\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"2\",\"column\":\"10\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"9\",\"y\":\"2\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"3\",\"column\":\"10\",\"isBlock\":\"true\",\"label\":\"SL\",\"sublabel\":\"student lounge\",\"abbrev\":null,\"door\":null,\"bgcolor\":\"#e4bb25\"},{\"x\":\"9\",\"y\":\"3\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"4\",\"column\":\"10\",\"isBlock\":\"true\",\"label\":\"SL\",\"sublabel\":\"student lounge\",\"abbrev\":null,\"door\":null,\"bgcolor\":\"#e4bb25\"},{\"x\":\"9\",\"y\":\"4\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"5\",\"column\":\"10\",\"isBlock\":\"true\",\"label\":\"SL\",\"sublabel\":\"student lounge\",\"abbrev\":null,\"door\":null,\"bgcolor\":\"#e4bb25\"},{\"x\":\"9\",\"y\":\"5\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"6\",\"column\":\"10\",\"isBlock\":\"true\",\"label\":\"SL\",\"sublabel\":\"student lounge\",\"abbrev\":null,\"door\":null,\"bgcolor\":\"#e4bb25\"},{\"x\":\"9\",\"y\":\"6\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"7\",\"column\":\"10\",\"isBlock\":\"true\",\"label\":\"SL\",\"sublabel\":\"student lounge\",\"abbrev\":null,\"door\":null,\"bgcolor\":\"#e4bb25\"},{\"x\":\"9\",\"y\":\"7\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"8\",\"column\":\"10\",\"isBlock\":\"true\",\"label\":\"SL\",\"sublabel\":\"student lounge\",\"abbrev\":null,\"door\":null,\"bgcolor\":\"#e4bb25\"},{\"x\":\"9\",\"y\":\"8\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"9\",\"column\":\"10\",\"isBlock\":\"false\",\"label\":\"SL\",\"sublabel\":\"student lounge\",\"abbrev\":null,\"door\":\"true\",\"bgcolor\":\"#e4bb25\"},{\"x\":\"9\",\"y\":\"9\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"10\",\"column\":\"10\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"9\",\"y\":\"10\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"11\",\"column\":\"10\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"9\",\"y\":\"11\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"12\",\"column\":\"10\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"9\",\"y\":\"12\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"13\",\"column\":\"10\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"9\",\"y\":\"13\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"14\",\"column\":\"10\",\"isBlock\":\"true\",\"label\":\"GHQ\",\"sublabel\":\"guard house\",\"abbrev\":null,\"door\":\"true\",\"bgcolor\":\"#4348e5\"}]', '2023-12-11 15:14:54', '2023-12-12 10:42:50');
INSERT INTO `floorplans` (`id`, `floor`, `gridSize`, `gridDetails`, `created_at`, `updated_at`) VALUES
(24, 'floor-5', 140, '[{\"x\":\"0\",\"y\":\"0\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"1\",\"column\":\"1\",\"isBlock\":\"true\",\"label\":\"stair-in\",\"sublabel\":\"stair-in\",\"abbrev\":null,\"door\":\"true\",\"bgcolor\":\"#FF000000\"},{\"x\":\"0\",\"y\":\"1\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"2\",\"column\":\"1\",\"isBlock\":\"true\",\"label\":\"KLT\",\"sublabel\":\"kitchen laboratory\",\"abbrev\":null,\"door\":\"true\",\"bgcolor\":\"#345535\"},{\"x\":\"0\",\"y\":\"2\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"3\",\"column\":\"1\",\"isBlock\":\"true\",\"label\":\"R5X\",\"sublabel\":\"room 503\",\"abbrev\":null,\"door\":null,\"bgcolor\":\"#4f9c70\"},{\"x\":\"0\",\"y\":\"3\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"4\",\"column\":\"1\",\"isBlock\":\"true\",\"label\":\"R5\",\"sublabel\":\"room 502\",\"abbrev\":null,\"door\":\"true\",\"bgcolor\":\"#360fd2\"},{\"x\":\"0\",\"y\":\"4\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"5\",\"column\":\"1\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"0\",\"y\":\"5\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"6\",\"column\":\"1\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"0\",\"y\":\"6\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"7\",\"column\":\"1\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"0\",\"y\":\"7\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"8\",\"column\":\"1\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"0\",\"y\":\"8\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"9\",\"column\":\"1\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"0\",\"y\":\"9\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"10\",\"column\":\"1\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"0\",\"y\":\"10\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"11\",\"column\":\"1\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"0\",\"y\":\"11\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"12\",\"column\":\"1\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"0\",\"y\":\"12\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"13\",\"column\":\"1\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"0\",\"y\":\"13\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"14\",\"column\":\"1\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"1\",\"y\":\"0\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"1\",\"column\":\"2\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"1\",\"y\":\"1\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"2\",\"column\":\"2\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"1\",\"y\":\"2\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"3\",\"column\":\"2\",\"isBlock\":\"true\",\"label\":\"R5X\",\"sublabel\":\"room 503\",\"abbrev\":null,\"door\":\"true\",\"bgcolor\":\"#4f9c70\"},{\"x\":\"1\",\"y\":\"3\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"4\",\"column\":\"2\",\"isBlock\":\"true\",\"label\":\"R5X\",\"sublabel\":\"room 503\",\"abbrev\":null,\"door\":null,\"bgcolor\":\"#4f9c70\"},{\"x\":\"1\",\"y\":\"4\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"5\",\"column\":\"2\",\"isBlock\":\"true\",\"label\":\"SASR\",\"sublabel\":\"standard and suite room\",\"abbrev\":null,\"door\":\"true\",\"bgcolor\":\"#999\"},{\"x\":\"1\",\"y\":\"5\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"6\",\"column\":\"2\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"1\",\"y\":\"6\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"7\",\"column\":\"2\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"1\",\"y\":\"7\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"8\",\"column\":\"2\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"1\",\"y\":\"8\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"9\",\"column\":\"2\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"1\",\"y\":\"9\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"10\",\"column\":\"2\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"1\",\"y\":\"10\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"11\",\"column\":\"2\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"1\",\"y\":\"11\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"12\",\"column\":\"2\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"1\",\"y\":\"12\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"13\",\"column\":\"2\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"1\",\"y\":\"13\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"14\",\"column\":\"2\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"2\",\"y\":\"0\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"1\",\"column\":\"3\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"2\",\"y\":\"1\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"2\",\"column\":\"3\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"2\",\"y\":\"2\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"3\",\"column\":\"3\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"2\",\"y\":\"3\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"4\",\"column\":\"3\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"2\",\"y\":\"4\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"5\",\"column\":\"3\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"2\",\"y\":\"5\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"6\",\"column\":\"3\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"2\",\"y\":\"6\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"7\",\"column\":\"3\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"2\",\"y\":\"7\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"8\",\"column\":\"3\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"2\",\"y\":\"8\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"9\",\"column\":\"3\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"2\",\"y\":\"9\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"10\",\"column\":\"3\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"2\",\"y\":\"10\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"11\",\"column\":\"3\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"2\",\"y\":\"11\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"12\",\"column\":\"3\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"2\",\"y\":\"12\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"13\",\"column\":\"3\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"2\",\"y\":\"13\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"14\",\"column\":\"3\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"3\",\"y\":\"0\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"1\",\"column\":\"4\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"3\",\"y\":\"1\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"2\",\"column\":\"4\",\"isBlock\":\"true\",\"label\":\"PASW\",\"sublabel\":\"pantry and storage\",\"abbrev\":null,\"door\":\"true\",\"bgcolor\":\"#000000\"},{\"x\":\"3\",\"y\":\"2\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"3\",\"column\":\"4\",\"isBlock\":\"true\",\"label\":\"PASW\",\"sublabel\":\"pantry and storage\",\"abbrev\":null,\"door\":null,\"bgcolor\":\"#000000\"},{\"x\":\"3\",\"y\":\"3\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"4\",\"column\":\"4\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"3\",\"y\":\"4\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"5\",\"column\":\"4\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"3\",\"y\":\"5\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"6\",\"column\":\"4\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"3\",\"y\":\"6\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"7\",\"column\":\"4\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"3\",\"y\":\"7\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"8\",\"column\":\"4\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"3\",\"y\":\"8\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"9\",\"column\":\"4\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"3\",\"y\":\"9\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"10\",\"column\":\"4\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"3\",\"y\":\"10\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"11\",\"column\":\"4\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"3\",\"y\":\"11\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"12\",\"column\":\"4\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"3\",\"y\":\"12\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"13\",\"column\":\"4\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"3\",\"y\":\"13\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"14\",\"column\":\"4\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"4\",\"y\":\"0\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"1\",\"column\":\"5\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"4\",\"y\":\"1\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"2\",\"column\":\"5\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"4\",\"y\":\"2\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"3\",\"column\":\"5\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"4\",\"y\":\"3\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"4\",\"column\":\"5\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"4\",\"y\":\"4\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"5\",\"column\":\"5\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"4\",\"y\":\"5\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"6\",\"column\":\"5\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"4\",\"y\":\"6\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"7\",\"column\":\"5\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"4\",\"y\":\"7\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"8\",\"column\":\"5\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"4\",\"y\":\"8\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"9\",\"column\":\"5\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"4\",\"y\":\"9\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"10\",\"column\":\"5\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"4\",\"y\":\"10\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"11\",\"column\":\"5\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"4\",\"y\":\"11\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"12\",\"column\":\"5\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"4\",\"y\":\"12\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"13\",\"column\":\"5\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"4\",\"y\":\"13\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"14\",\"column\":\"5\",\"isBlock\":\"true\",\"label\":\"front\",\"sublabel\":\"front\",\"abbrev\":null,\"door\":null,\"bgcolor\":\"#FF000000\"},{\"x\":\"5\",\"y\":\"0\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"1\",\"column\":\"6\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"5\",\"y\":\"1\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"2\",\"column\":\"6\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"5\",\"y\":\"2\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"3\",\"column\":\"6\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"5\",\"y\":\"3\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"4\",\"column\":\"6\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"5\",\"y\":\"4\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"5\",\"column\":\"6\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"5\",\"y\":\"5\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"6\",\"column\":\"6\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"5\",\"y\":\"6\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"7\",\"column\":\"6\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"5\",\"y\":\"7\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"8\",\"column\":\"6\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"5\",\"y\":\"8\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"9\",\"column\":\"6\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"5\",\"y\":\"9\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"10\",\"column\":\"6\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"5\",\"y\":\"10\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"11\",\"column\":\"6\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"5\",\"y\":\"11\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"12\",\"column\":\"6\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"5\",\"y\":\"12\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"13\",\"column\":\"6\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"5\",\"y\":\"13\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"14\",\"column\":\"6\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"6\",\"y\":\"0\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"1\",\"column\":\"7\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"6\",\"y\":\"1\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"2\",\"column\":\"7\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"6\",\"y\":\"2\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"3\",\"column\":\"7\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"6\",\"y\":\"3\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"4\",\"column\":\"7\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"6\",\"y\":\"4\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"5\",\"column\":\"7\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"6\",\"y\":\"5\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"6\",\"column\":\"7\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"6\",\"y\":\"6\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"7\",\"column\":\"7\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"6\",\"y\":\"7\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"8\",\"column\":\"7\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"6\",\"y\":\"8\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"9\",\"column\":\"7\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"6\",\"y\":\"9\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"10\",\"column\":\"7\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"6\",\"y\":\"10\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"11\",\"column\":\"7\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"6\",\"y\":\"11\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"12\",\"column\":\"7\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"6\",\"y\":\"12\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"13\",\"column\":\"7\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"6\",\"y\":\"13\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"14\",\"column\":\"7\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"7\",\"y\":\"0\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"1\",\"column\":\"8\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"7\",\"y\":\"1\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"2\",\"column\":\"8\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"7\",\"y\":\"2\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"3\",\"column\":\"8\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"7\",\"y\":\"3\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"4\",\"column\":\"8\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"7\",\"y\":\"4\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"5\",\"column\":\"8\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"7\",\"y\":\"5\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"6\",\"column\":\"8\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"7\",\"y\":\"6\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"7\",\"column\":\"8\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"7\",\"y\":\"7\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"8\",\"column\":\"8\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"7\",\"y\":\"8\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"9\",\"column\":\"8\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"7\",\"y\":\"9\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"10\",\"column\":\"8\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"7\",\"y\":\"10\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"11\",\"column\":\"8\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"7\",\"y\":\"11\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"12\",\"column\":\"8\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"7\",\"y\":\"12\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"13\",\"column\":\"8\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"7\",\"y\":\"13\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"14\",\"column\":\"8\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"8\",\"y\":\"0\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"1\",\"column\":\"9\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"8\",\"y\":\"1\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"2\",\"column\":\"9\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"8\",\"y\":\"2\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"3\",\"column\":\"9\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"8\",\"y\":\"3\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"4\",\"column\":\"9\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"8\",\"y\":\"4\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"5\",\"column\":\"9\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"8\",\"y\":\"5\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"6\",\"column\":\"9\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"8\",\"y\":\"6\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"7\",\"column\":\"9\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"8\",\"y\":\"7\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"8\",\"column\":\"9\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"8\",\"y\":\"8\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"9\",\"column\":\"9\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"8\",\"y\":\"9\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"10\",\"column\":\"9\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"8\",\"y\":\"10\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"11\",\"column\":\"9\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"8\",\"y\":\"11\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"12\",\"column\":\"9\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"8\",\"y\":\"12\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"13\",\"column\":\"9\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"8\",\"y\":\"13\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"14\",\"column\":\"9\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"9\",\"y\":\"0\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"1\",\"column\":\"10\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"9\",\"y\":\"1\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"2\",\"column\":\"10\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"9\",\"y\":\"2\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"3\",\"column\":\"10\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"9\",\"y\":\"3\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"4\",\"column\":\"10\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"9\",\"y\":\"4\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"5\",\"column\":\"10\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"9\",\"y\":\"5\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"6\",\"column\":\"10\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"9\",\"y\":\"6\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"7\",\"column\":\"10\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"9\",\"y\":\"7\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"8\",\"column\":\"10\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"9\",\"y\":\"8\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"9\",\"column\":\"10\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"9\",\"y\":\"9\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"10\",\"column\":\"10\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"9\",\"y\":\"10\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"11\",\"column\":\"10\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"9\",\"y\":\"11\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"12\",\"column\":\"10\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"9\",\"y\":\"12\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"13\",\"column\":\"10\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null},{\"x\":\"9\",\"y\":\"13\",\"width\":\"60.000003814697266\",\"height\":\"60.000003814697266\",\"row\":\"14\",\"column\":\"10\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null,\"door\":null,\"bgcolor\":null}]', '2023-12-12 02:51:04', '2023-12-12 02:51:04');

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
(1, 'speech', 1, NULL, '2023-11-17 19:36:22'),
(2, 'scanner', 0, NULL, '2023-12-02 04:12:41'),
(3, 'in', 1, NULL, '2023-12-02 04:12:43');

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

--
-- Dumping data for table `qr_models`
--

INSERT INTO `qr_models` (`id`, `type`, `path`, `created_at`, `updated_at`) VALUES
(1, 'Teacher', 'qrcodes/Teacher.png', '2023-12-02 01:44:02', '2023-12-02 01:44:02'),
(2, 'Student', 'qrcodes/Student.png', '2023-12-02 01:44:02', '2023-12-02 01:44:02'),
(3, 'Teacher', 'qrcodes/Teacher.png', '2023-12-02 01:46:14', '2023-12-02 01:46:14'),
(4, 'Student', 'qrcodes/Student.png', '2023-12-02 01:46:14', '2023-12-02 01:46:14'),
(5, 'Teacher', 'qrcodes/Teacher.png', '2023-12-02 01:48:39', '2023-12-02 01:48:39'),
(6, 'Student', 'qrcodes/Student.png', '2023-12-02 01:48:39', '2023-12-02 01:48:39'),
(7, 'Teacher', 'qrcodes/Teacher.png', '2023-12-02 01:52:15', '2023-12-02 01:52:15'),
(8, 'Student', 'qrcodes/Student.png', '2023-12-02 01:52:15', '2023-12-02 01:52:15'),
(9, 'Teacher', 'qrcodes/Teacher.png', '2023-12-02 01:55:11', '2023-12-02 01:55:11'),
(10, 'Student', 'qrcodes/Student.png', '2023-12-02 01:55:11', '2023-12-02 01:55:11'),
(11, 'Teacher', 'qrcodes/Teacher.png', '2023-12-02 01:56:06', '2023-12-02 01:56:06'),
(12, 'Student', 'qrcodes/Student.png', '2023-12-02 01:56:06', '2023-12-02 01:56:06'),
(13, 'Teacher', 'qrcodes/Teacher.png', '2023-12-02 02:00:26', '2023-12-02 02:00:26'),
(14, 'Student', 'qrcodes/Student.png', '2023-12-02 02:00:26', '2023-12-02 02:00:26'),
(15, 'Teacher', 'qrcodes/Teacher.png', '2023-12-02 02:01:19', '2023-12-02 02:01:19'),
(16, 'Student', 'qrcodes/Student.png', '2023-12-02 02:01:19', '2023-12-02 02:01:19'),
(17, 'Teacher', 'qrcodes/Teacher.png', '2023-12-02 02:02:46', '2023-12-02 02:02:46'),
(18, 'Student', 'qrcodes/Student.png', '2023-12-02 02:02:46', '2023-12-02 02:02:46'),
(19, 'Teacher', 'qrcodes/Teacher.png', '2023-12-02 02:03:57', '2023-12-02 02:03:57'),
(20, 'Student', 'qrcodes/Student.png', '2023-12-02 02:03:57', '2023-12-02 02:03:57'),
(21, 'Teacher', 'qrcodes/Teacher.png', '2023-12-02 02:07:08', '2023-12-02 02:07:08'),
(22, 'Student', 'qrcodes/Student.png', '2023-12-02 02:07:08', '2023-12-02 02:07:08'),
(23, 'Teacher', 'qrcodes/Teacher.png', '2023-12-02 02:07:09', '2023-12-02 02:07:09'),
(24, 'Student', 'qrcodes/Student.png', '2023-12-02 02:07:09', '2023-12-02 02:07:09'),
(25, 'Teacher', 'qrcodes/Teacher.png', '2023-12-02 02:07:52', '2023-12-02 02:07:52'),
(26, 'Student', 'qrcodes/Student.png', '2023-12-02 02:07:52', '2023-12-02 02:07:52'),
(27, 'Teacher', 'qrcodes/Teacher.png', '2023-12-02 02:19:20', '2023-12-02 02:19:20'),
(28, 'Student', 'qrcodes/Student.png', '2023-12-02 02:19:20', '2023-12-02 02:19:20'),
(29, 'Teacher', 'qrcodes/Teacher.png', '2023-12-02 02:20:41', '2023-12-02 02:20:41'),
(30, 'Student', 'qrcodes/Student.png', '2023-12-02 02:20:41', '2023-12-02 02:20:41'),
(31, 'Teacher', 'qrcodes/Teacher.png', '2023-12-02 02:23:39', '2023-12-02 02:23:39'),
(32, 'Student', 'qrcodes/Student.png', '2023-12-02 02:23:39', '2023-12-02 02:23:39'),
(33, 'Teacher', 'qrcodes/Teacher.png', '2023-12-02 02:26:42', '2023-12-02 02:26:42'),
(34, 'Student', 'qrcodes/Student.png', '2023-12-02 02:26:42', '2023-12-02 02:26:42'),
(35, 'Teacher', 'qrcodes/Teacher.png', '2023-12-02 02:28:01', '2023-12-02 02:28:01'),
(36, 'Student', 'qrcodes/Student.png', '2023-12-02 02:28:01', '2023-12-02 02:28:01'),
(37, 'Teacher', 'qrcodes/Teacher.png', '2023-12-02 02:29:48', '2023-12-02 02:29:48'),
(38, 'Student', 'qrcodes/Student.png', '2023-12-02 02:29:48', '2023-12-02 02:29:48'),
(39, 'Teacher', 'qrcodes/Teacher.png', '2023-12-02 02:31:08', '2023-12-02 02:31:08'),
(40, 'Student', 'qrcodes/Student.png', '2023-12-02 02:31:08', '2023-12-02 02:31:08'),
(41, 'Teacher', 'qrcodes/Teacher.png', '2023-12-02 02:32:05', '2023-12-02 02:32:05'),
(42, 'Student', 'qrcodes/Student.png', '2023-12-02 02:32:05', '2023-12-02 02:32:05'),
(43, 'Teacher', 'qrcodes/Teacher.png', '2023-12-02 02:33:40', '2023-12-02 02:33:40'),
(44, 'Student', 'qrcodes/Student.png', '2023-12-02 02:33:40', '2023-12-02 02:33:40'),
(45, 'Teacher', 'qrcodes/Teacher.png', '2023-12-02 02:35:14', '2023-12-02 02:35:14'),
(46, 'Student', 'qrcodes/Student.png', '2023-12-02 02:35:14', '2023-12-02 02:35:14'),
(47, 'Teacher', 'qrcodes/Teacher.png', '2023-12-02 02:36:02', '2023-12-02 02:36:02'),
(48, 'Student', 'qrcodes/Student.png', '2023-12-02 02:36:02', '2023-12-02 02:36:02'),
(49, 'Teacher', 'qrcodes/Teacher.png', '2023-12-02 02:36:43', '2023-12-02 02:36:43'),
(50, 'Student', 'qrcodes/Student.png', '2023-12-02 02:36:43', '2023-12-02 02:36:43'),
(51, 'Teacher', 'qrcodes/Teacher.png', '2023-12-02 02:37:20', '2023-12-02 02:37:20'),
(52, 'Student', 'qrcodes/Student.png', '2023-12-02 02:37:20', '2023-12-02 02:37:20'),
(53, 'Teacher', 'qrcodes/Teacher.png', '2023-12-02 02:38:04', '2023-12-02 02:38:04'),
(54, 'Student', 'qrcodes/Student.png', '2023-12-02 02:38:04', '2023-12-02 02:38:04'),
(55, 'Teacher', 'qrcodes/Teacher.png', '2023-12-02 02:38:43', '2023-12-02 02:38:43'),
(56, 'Student', 'qrcodes/Student.png', '2023-12-02 02:38:43', '2023-12-02 02:38:43'),
(57, 'Teacher', 'qrcodes/Teacher.png', '2023-12-02 02:39:13', '2023-12-02 02:39:13'),
(58, 'Student', 'qrcodes/Student.png', '2023-12-02 02:39:13', '2023-12-02 02:39:13'),
(59, 'Teacher', 'qrcodes/Teacher.png', '2023-12-02 02:39:56', '2023-12-02 02:39:56'),
(60, 'Student', 'qrcodes/Student.png', '2023-12-02 02:39:56', '2023-12-02 02:39:56'),
(61, 'Teacher', 'qrcodes/Teacher.png', '2023-12-02 02:40:27', '2023-12-02 02:40:27'),
(62, 'Student', 'qrcodes/Student.png', '2023-12-02 02:40:27', '2023-12-02 02:40:27'),
(63, 'Teacher', 'qrcodes/Teacher.png', '2023-12-02 02:40:54', '2023-12-02 02:40:54'),
(64, 'Student', 'qrcodes/Student.png', '2023-12-02 02:40:54', '2023-12-02 02:40:54'),
(65, 'Teacher', 'qrcodes/Teacher.png', '2023-12-02 02:41:23', '2023-12-02 02:41:23'),
(66, 'Student', 'qrcodes/Student.png', '2023-12-02 02:41:23', '2023-12-02 02:41:23'),
(67, 'Teacher', 'qrcodes/Teacher.png', '2023-12-02 02:41:47', '2023-12-02 02:41:47'),
(68, 'Student', 'qrcodes/Student.png', '2023-12-02 02:41:47', '2023-12-02 02:41:47'),
(69, 'Teacher', 'qrcodes/Teacher.png', '2023-12-02 02:42:10', '2023-12-02 02:42:10'),
(70, 'Student', 'qrcodes/Student.png', '2023-12-02 02:42:10', '2023-12-02 02:42:10'),
(71, 'Teacher', 'qrcodes/Teacher.png', '2023-12-02 02:42:39', '2023-12-02 02:42:39'),
(72, 'Student', 'qrcodes/Student.png', '2023-12-02 02:42:39', '2023-12-02 02:42:39'),
(73, 'Teacher', 'qrcodes/Teacher.png', '2023-12-02 02:44:32', '2023-12-02 02:44:32'),
(74, 'Student', 'qrcodes/Student.png', '2023-12-02 02:44:32', '2023-12-02 02:44:32'),
(75, 'Teacher', 'qrcodes/Teacher.png', '2023-12-02 02:48:43', '2023-12-02 02:48:43'),
(76, 'Student', 'qrcodes/Student.png', '2023-12-02 02:48:43', '2023-12-02 02:48:43'),
(77, 'Teacher', 'qrcodes/Teacher.png', '2023-12-02 02:50:07', '2023-12-02 02:50:07'),
(78, 'Student', 'qrcodes/Student.png', '2023-12-02 02:50:07', '2023-12-02 02:50:07'),
(79, 'Teacher', 'qrcodes/Teacher.png', '2023-12-02 02:50:45', '2023-12-02 02:50:45'),
(80, 'Student', 'qrcodes/Student.png', '2023-12-02 02:50:45', '2023-12-02 02:50:45'),
(81, 'Teacher', 'qrcodes/Teacher.png', '2023-12-02 02:51:36', '2023-12-02 02:51:36'),
(82, 'Student', 'qrcodes/Student.png', '2023-12-02 02:51:36', '2023-12-02 02:51:36'),
(83, 'Teacher', 'qrcodes/Teacher.png', '2023-12-02 02:51:58', '2023-12-02 02:51:58'),
(84, 'Student', 'qrcodes/Student.png', '2023-12-02 02:51:58', '2023-12-02 02:51:58'),
(85, 'Teacher', 'qrcodes/Teacher.png', '2023-12-02 02:54:00', '2023-12-02 02:54:00'),
(86, 'Student', 'qrcodes/Student.png', '2023-12-02 02:54:00', '2023-12-02 02:54:00'),
(87, 'Teacher', 'qrcodes/Teacher.png', '2023-12-02 02:55:26', '2023-12-02 02:55:26'),
(88, 'Student', 'qrcodes/Student.png', '2023-12-02 02:55:26', '2023-12-02 02:55:26'),
(89, 'Teacher', 'qrcodes/Teacher.png', '2023-12-02 02:56:23', '2023-12-02 02:56:23'),
(90, 'Student', 'qrcodes/Student.png', '2023-12-02 02:56:23', '2023-12-02 02:56:23'),
(91, 'Teacher', 'qrcodes/Teacher.png', '2023-12-02 02:56:57', '2023-12-02 02:56:57'),
(92, 'Student', 'qrcodes/Student.png', '2023-12-02 02:56:57', '2023-12-02 02:56:57'),
(93, 'Teacher', 'qrcodes/Teacher.png', '2023-12-02 02:57:34', '2023-12-02 02:57:34'),
(94, 'Student', 'qrcodes/Student.png', '2023-12-02 02:57:34', '2023-12-02 02:57:34'),
(95, 'Teacher', 'qrcodes/Teacher.png', '2023-12-02 02:57:52', '2023-12-02 02:57:52'),
(96, 'Student', 'qrcodes/Student.png', '2023-12-02 02:57:52', '2023-12-02 02:57:52'),
(97, 'Teacher', 'qrcodes/Teacher.png', '2023-12-02 02:58:12', '2023-12-02 02:58:12'),
(98, 'Student', 'qrcodes/Student.png', '2023-12-02 02:58:12', '2023-12-02 02:58:12'),
(99, 'Teacher', 'qrcodes/Teacher.png', '2023-12-02 02:58:38', '2023-12-02 02:58:38'),
(100, 'Student', 'qrcodes/Student.png', '2023-12-02 02:58:38', '2023-12-02 02:58:38'),
(101, 'Teacher', 'qrcodes/Teacher.png', '2023-12-02 02:59:08', '2023-12-02 02:59:08'),
(102, 'Student', 'qrcodes/Student.png', '2023-12-02 02:59:08', '2023-12-02 02:59:08'),
(103, 'Teacher', 'qrcodes/Teacher.png', '2023-12-02 02:59:27', '2023-12-02 02:59:27'),
(104, 'Student', 'qrcodes/Student.png', '2023-12-02 02:59:27', '2023-12-02 02:59:27'),
(105, 'Teacher', 'qrcodes/Teacher.png', '2023-12-02 02:59:39', '2023-12-02 02:59:39'),
(106, 'Student', 'qrcodes/Student.png', '2023-12-02 02:59:40', '2023-12-02 02:59:40'),
(107, 'Teacher', 'qrcodes/Teacher.png', '2023-12-02 02:59:58', '2023-12-02 02:59:58'),
(108, 'Student', 'qrcodes/Student.png', '2023-12-02 02:59:58', '2023-12-02 02:59:58'),
(109, 'Teacher', 'qrcodes/Teacher.png', '2023-12-02 03:00:32', '2023-12-02 03:00:32'),
(110, 'Student', 'qrcodes/Student.png', '2023-12-02 03:00:32', '2023-12-02 03:00:32'),
(111, 'Teacher', 'qrcodes/Teacher.png', '2023-12-02 03:01:39', '2023-12-02 03:01:39'),
(112, 'Student', 'qrcodes/Student.png', '2023-12-02 03:01:39', '2023-12-02 03:01:39'),
(113, 'Teacher', 'qrcodes/Teacher.png', '2023-12-11 04:43:32', '2023-12-11 04:43:32'),
(114, 'Student', 'qrcodes/Student.png', '2023-12-11 04:43:32', '2023-12-11 04:43:32'),
(115, 'Teacher', 'qrcodes/Teacher.png', '2023-12-12 03:02:48', '2023-12-12 03:02:48'),
(116, 'Student', 'qrcodes/Student.png', '2023-12-12 03:02:48', '2023-12-12 03:02:48');

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
(2, 'Acosta Allan L.', 'Temporarily Unavailable', '2023-11-19 22:30:54', '2023-11-30 21:10:53', 9, 'male'),
(3, 'Aleviado Nomer D.', 'Temporarily Unavailable', '2023-11-30 20:53:29', '2023-11-30 21:10:53', 27, 'male'),
(4, 'Araos Katherine V.', 'Temporarily Unavailable', '2023-11-30 20:53:29', '2023-11-30 21:14:42', 52, 'female'),
(5, 'Bartolome Sarah Jane B.', 'Temporarily Unavailable', '2023-11-30 20:53:29', '2023-11-30 21:15:07', 18, 'female'),
(6, 'Bautista Marie-Nel C.', 'Temporarily Unavailable', '2023-11-30 20:53:29', '2023-11-30 21:15:07', 21, 'female'),
(7, 'Borja Percian Joseph C.', 'Temporarily Unavailable', '2023-11-30 20:53:29', '2023-12-11 03:55:33', 27, 'male'),
(8, 'Carino Sherwin A.', 'Temporarily Unavailable', '2023-11-30 21:27:00', '2023-11-30 21:27:00', 5, 'male'),
(9, 'Cayabyab Aries John G.', 'Temporarily Unavailable', '2023-11-30 21:30:22', '2023-11-30 21:30:22', 27, 'male'),
(10, 'Clacio Corazon S.', 'Temporarily Unavailable', '2023-11-30 21:30:22', '2023-11-30 21:30:22', 36, 'female'),
(11, 'Chua Josephn V.', 'Temporarily Unavailable', '2023-11-30 21:30:22', '2023-11-30 21:30:22', 27, 'male'),
(12, 'Cordova Jr. Adelino B.', 'Temporarily Unavailable', '2023-12-01 01:35:15', '2023-12-01 01:35:15', 18, 'male'),
(13, 'Corpus Nino L.', 'Temporarily Unavailable', '2023-12-01 01:35:15', '2023-12-01 01:35:15', 52, 'male'),
(14, 'De Guzman Doreliza Pearl R.', 'Temporarily Unavailable', '2023-12-01 01:35:15', '2023-12-01 01:35:15', 9, 'female'),
(15, 'De Guzman Jairryl Anne L.', 'Temporarily Unavailable', '2023-12-01 01:35:15', '2023-12-01 01:35:15', 27, 'female'),
(16, 'De Guzman Paulo F.', 'Temporarily Unavailable', '2023-12-01 01:35:15', '2023-12-01 01:35:15', 27, 'male'),
(17, 'Delos Reyes Alexander John C.', 'Temporarily Unavailable', '2023-12-01 01:35:15', '2023-12-01 01:35:15', 36, 'male'),
(18, 'Enriquez Maria Deth A.', 'Temporarily Unavailable', '2023-12-01 01:35:15', '2023-12-01 01:35:15', 9, 'female'),
(19, 'Espiritu Ellaine R.', 'Temporarily Unavailable', '2023-12-01 01:35:15', '2023-12-01 01:35:15', 9, 'female'),
(20, 'Galeos Angelica Marie G.', 'Temporarily Unavailable', '2023-12-01 01:35:15', '2023-12-01 01:35:15', 16, 'female'),
(21, 'Gloria Gladys', 'Temporarily Unavailable', '2023-12-01 01:35:15', '2023-12-01 01:35:15', 9, 'female'),
(22, 'Gomez Mariz R.', 'Temporarily Unavailable', '2023-12-01 01:35:15', '2023-12-01 01:35:15', 9, 'female'),
(23, 'Gomez Rochelle V.', 'Temporarily Unavailable', '2023-12-01 01:35:15', '2023-12-01 01:35:15', 36, 'female'),
(24, 'Gutierrez Jessica C.', 'Temporarily Unavailable', '2023-12-01 01:35:15', '2023-12-01 01:35:15', 14, 'female'),
(25, 'Layug Romeo M.', 'Temporarily Unavailable', '2023-12-01 01:46:04', '2023-12-01 01:46:04', 36, 'male'),
(26, 'Macalinao Christian T.', 'Temporarily Unavailable', '2023-12-01 01:46:04', '2023-12-01 01:46:04', 18, 'male'),
(27, 'Mangayao Saira Marie S.', 'Temporarily Unavailable', '2023-12-01 01:46:04', '2023-12-01 01:46:04', 18, 'female'),
(28, 'Nopia Alexander B.', 'Temporarily Unavailable', '2023-12-01 01:46:04', '2023-12-01 01:46:04', 36, 'male'),
(29, 'Padal Ericka A.', 'Temporarily Unavailable', '2023-12-01 01:46:04', '2023-12-01 01:46:04', 36, 'female'),
(30, 'Palazo Moneliza D.', 'Temporarily Unavailable', '2023-12-01 01:46:04', '2023-12-01 01:46:04', 52, 'female'),
(31, 'Pelaez Evangeline L.', 'Temporarily Unavailable', '2023-12-01 01:46:04', '2023-12-01 01:46:04', 52, 'female'),
(32, 'Reyes Liza N.', 'Temporarily Unavailable', '2023-12-01 01:46:04', '2023-12-01 01:46:04', 9, 'female'),
(33, 'Rodriguez Arberlyn A.', 'Temporarily Unavailable', '2023-12-01 01:46:04', '2023-12-01 01:46:04', 18, 'female'),
(34, 'Roman Marijuane S.', 'Temporarily Unavailable', '2023-12-01 01:46:04', '2023-12-01 01:46:04', 36, 'female'),
(35, 'Sevilla Zenaida D.', 'Temporarily Unavailable', '2023-12-01 01:46:04', '2023-12-01 01:46:04', 10, 'female'),
(36, 'Seno Charmie Lyn N.', 'Temporarily Unavailable', '2023-12-01 01:46:04', '2023-12-01 01:46:04', 9, 'female'),
(37, 'Sioson Chrislyn Colleen I.', 'Temporarily Unavailable', '2023-12-01 01:46:04', '2023-12-01 01:46:04', 52, 'female'),
(38, 'Turalde Ma. Leilanie B.', 'Temporarily Unavailable', '2023-12-01 01:46:04', '2023-12-01 01:46:04', 52, 'female'),
(39, 'Ventura Jenny Rose D.', 'Temporarily Unavailable', '2023-12-01 01:46:04', '2023-12-01 01:46:04', 18, 'female'),
(40, 'Vibar Grace Kelly U.', 'Temporarily Unavailable', '2023-12-01 01:46:04', '2023-12-01 01:46:04', 52, 'female'),
(41, 'Visperas Jenice Anne Marie B.', 'Temporarily Unavailable', '2023-12-01 01:46:04', '2023-12-01 01:46:04', 27, 'female'),
(42, 'Zabala Sheila Marie M.', 'Temporarily Unavailable', '2023-12-01 01:46:04', '2023-12-01 01:46:04', 36, 'female'),
(43, 'test', 'Temporarily Unavailable', '2023-12-09 09:04:24', '2023-12-09 09:04:24', 5, 'male');

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
(111, 'Floor Plan', 'You have added a floor-5 layout.', 'added', 0, '2023-12-12 02:51:04', '2023-12-12 02:51:04'),
(112, 'Floor Plan', 'You have updated a ground-floor layout.', 'updated', 0, '2023-12-12 02:54:35', '2023-12-12 02:54:35'),
(113, 'Floor Plan', 'You have updated a ground-floor layout.', 'updated', 0, '2023-12-12 02:54:50', '2023-12-12 02:54:50'),
(114, 'Floor Plan', 'You have updated a ground-floor layout.', 'updated', 0, '2023-12-12 02:56:37', '2023-12-12 02:56:37'),
(115, 'Floor Plan', 'You have updated a ground-floor layout.', 'updated', 0, '2023-12-12 05:31:54', '2023-12-12 05:31:54'),
(116, 'Floor Plan', 'You have updated a ground-floor layout.', 'updated', 0, '2023-12-12 06:15:52', '2023-12-12 06:15:52'),
(117, 'Floor Plan', 'You have updated a ground-floor layout.', 'updated', 0, '2023-12-12 06:16:16', '2023-12-12 06:16:16'),
(118, 'Floor Plan', 'You have updated a ground-floor layout.', 'updated', 0, '2023-12-12 06:17:18', '2023-12-12 06:17:18'),
(119, 'Floor Plan', 'You have updated a ground-floor layout.', 'updated', 0, '2023-12-12 06:17:44', '2023-12-12 06:17:44'),
(120, 'Floor Plan', 'You have updated a ground-floor layout.', 'updated', 0, '2023-12-12 10:35:48', '2023-12-12 10:35:48'),
(121, 'Floor Plan', 'You have updated a ground-floor layout.', 'updated', 0, '2023-12-12 10:38:59', '2023-12-12 10:38:59'),
(122, 'Floor Plan', 'You have updated a ground-floor layout.', 'updated', 0, '2023-12-12 10:39:36', '2023-12-12 10:39:36'),
(123, 'Floor Plan', 'You have updated a ground-floor layout.', 'updated', 0, '2023-12-12 10:42:40', '2023-12-12 10:42:40'),
(124, 'Floor Plan', 'You have updated a ground-floor layout.', 'updated', 0, '2023-12-12 10:42:50', '2023-12-12 10:42:50');

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `default_facilities`
--
ALTER TABLE `default_facilities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `eastwoods_facilities`
--
ALTER TABLE `eastwoods_facilities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `floorplans`
--
ALTER TABLE `floorplans`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `updates`
--
ALTER TABLE `updates`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=125;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
