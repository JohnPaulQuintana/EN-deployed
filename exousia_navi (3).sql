-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 16, 2024 at 04:00 AM
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
(1, 1, 'DR', '2024-01-14 13:21:21', '2024-01-15 12:47:16'),
(2, 2, 'EF', '2024-01-14 13:26:27', '2024-01-15 12:47:16'),
(3, 3, 'OOSA', '2024-01-14 13:32:44', '2024-01-15 12:47:16'),
(4, 4, 'TB', '2024-01-15 10:09:05', '2024-01-15 12:47:16'),
(5, 5, 'TI', '2024-01-15 10:19:26', '2024-01-15 12:47:16');

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
(1, 'female restroom', 'all', '#ff9999', '2024-01-14 13:15:07', '2024-01-14 13:15:07'),
(2, 'male', 'all', '#0066cc', '2024-01-14 13:15:07', '2024-01-14 13:15:07'),
(3, 'wall', 'all', '#ff9999', '2024-01-14 13:15:07', '2024-01-14 13:15:07'),
(4, 'front', 'all', '#0066cc', '2024-01-14 13:15:07', '2024-01-14 13:15:07'),
(5, 'stair-in', 'all', '#ff9999', '2024-01-14 13:15:07', '2024-01-14 13:15:07');

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
  `color` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '#999',
  `floor-img` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `eastwoods_facilities`
--

INSERT INTO `eastwoods_facilities` (`id`, `facilities`, `operation_time`, `created_at`, `updated_at`, `floor`, `color`, `floor-img`) VALUES
(1, 'drawing room', '2024-01-15 20:47:16', '2024-01-14 13:21:21', '2024-01-15 12:47:16', 'ground-floor', '#07216e', 'ground-floor.jpg'),
(2, 'engineering faculty', '2024-01-15 20:47:16', '2024-01-14 13:26:27', '2024-01-15 12:47:16', 'ground-floor', '#ef0b0b', 'ground-floor.jpg'),
(3, 'office of student affairs', '2024-01-15 20:47:16', '2024-01-14 13:32:44', '2024-01-15 12:47:16', 'ground-floor', '#da1616', 'ground-floor.jpg'),
(4, 'test1', '2024-01-15 20:47:16', '2024-01-15 10:09:04', '2024-01-15 12:47:16', 'floor-2', '#d31d1d', 'floor-2.jpg'),
(5, 'test2', '2024-01-15 20:47:16', '2024-01-15 10:19:26', '2024-01-15 12:47:16', 'floor-2', '#200404', 'floor-2.jpg');

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
  `gridSize` bigint(20) DEFAULT NULL,
  `gridDetails` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`gridDetails`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `floorplans`
--

INSERT INTO `floorplans` (`id`, `floor`, `gridSize`, `gridDetails`, `created_at`, `updated_at`) VALUES
(7, 'ground-floor', NULL, '[{\"x\":\"12\",\"y\":\"15\",\"isBlock\":\"false\",\"label\":\"drawing room\",\"abbrev\":\"DR\",\"color\":\"#07216e\"},{\"x\":\"21\",\"y\":\"23\",\"isBlock\":\"false\",\"label\":\"engineering faculty\",\"abbrev\":\"EF\",\"color\":\"#ef0b0b\"},{\"x\":\"25\",\"y\":\"38\",\"isBlock\":\"false\",\"label\":\"engineering faculty\",\"abbrev\":\"EF\",\"color\":\"#ef0b0b\"},{\"x\":\"30\",\"y\":\"17\",\"isBlock\":\"false\",\"label\":\"male\",\"abbrev\":\"undefined\",\"color\":\"#0066cc\"},{\"x\":\"36\",\"y\":\"17\",\"isBlock\":\"false\",\"label\":\"office of student affairs\",\"abbrev\":\"OOSA\",\"color\":\"#da1616\"},{\"x\":\"40\",\"y\":\"12\",\"isBlock\":\"false\",\"label\":\"male\",\"abbrev\":\"undefined\",\"color\":\"#0066cc\"},{\"x\":\"42\",\"y\":\"37\",\"isBlock\":\"false\",\"label\":\"female restroom\",\"abbrev\":\"undefined\",\"color\":\"#ff9999\"},{\"x\":\"46\",\"y\":\"60\",\"isBlock\":\"false\",\"label\":\"stair-in\",\"abbrev\":\"undefined\",\"color\":\"#ff9999\"},{\"x\":\"51\",\"y\":\"46\",\"isBlock\":\"true\",\"label\":\"wall\",\"abbrev\":\"undefined\",\"color\":\"#ff9999\"},{\"x\":\"51\",\"y\":\"47\",\"isBlock\":\"true\",\"label\":\"wall\",\"abbrev\":\"undefined\",\"color\":\"#ff9999\"},{\"x\":\"52\",\"y\":\"47\",\"isBlock\":\"true\",\"label\":\"wall\",\"abbrev\":\"undefined\",\"color\":\"#ff9999\"},{\"x\":\"52\",\"y\":\"48\",\"isBlock\":\"true\",\"label\":\"wall\",\"abbrev\":\"undefined\",\"color\":\"#ff9999\"},{\"x\":\"52\",\"y\":\"49\",\"isBlock\":\"true\",\"label\":\"wall\",\"abbrev\":\"undefined\",\"color\":\"#ff9999\"},{\"x\":\"53\",\"y\":\"48\",\"isBlock\":\"true\",\"label\":\"wall\",\"abbrev\":\"undefined\",\"color\":\"#ff9999\"},{\"x\":\"53\",\"y\":\"49\",\"isBlock\":\"true\",\"label\":\"wall\",\"abbrev\":\"undefined\",\"color\":\"#ff9999\"},{\"x\":\"54\",\"y\":\"49\",\"isBlock\":\"true\",\"label\":\"wall\",\"abbrev\":\"undefined\",\"color\":\"#ff9999\"},{\"x\":\"55\",\"y\":\"49\",\"isBlock\":\"true\",\"label\":\"wall\",\"abbrev\":\"undefined\",\"color\":\"#ff9999\"},{\"x\":\"56\",\"y\":\"49\",\"isBlock\":\"true\",\"label\":\"wall\",\"abbrev\":\"undefined\",\"color\":\"#ff9999\"},{\"x\":\"57\",\"y\":\"49\",\"isBlock\":\"true\",\"label\":\"wall\",\"abbrev\":\"undefined\",\"color\":\"#ff9999\"},{\"x\":\"58\",\"y\":\"49\",\"isBlock\":\"true\",\"label\":\"wall\",\"abbrev\":\"undefined\",\"color\":\"#ff9999\"},{\"x\":\"58\",\"y\":\"56\",\"isBlock\":\"false\",\"label\":\"front\",\"abbrev\":\"undefined\",\"color\":\"#0066cc\"},{\"x\":\"59\",\"y\":\"49\",\"isBlock\":\"true\",\"label\":\"wall\",\"abbrev\":\"undefined\",\"color\":\"#ff9999\"},{\"x\":\"60\",\"y\":\"49\",\"isBlock\":\"true\",\"label\":\"wall\",\"abbrev\":\"undefined\",\"color\":\"#ff9999\"},{\"x\":\"61\",\"y\":\"49\",\"isBlock\":\"true\",\"label\":\"wall\",\"abbrev\":\"undefined\",\"color\":\"#ff9999\"},{\"x\":\"62\",\"y\":\"49\",\"isBlock\":\"true\",\"label\":\"wall\",\"abbrev\":\"undefined\",\"color\":\"#ff9999\"},{\"x\":\"63\",\"y\":\"49\",\"isBlock\":\"true\",\"label\":\"wall\",\"abbrev\":\"undefined\",\"color\":\"#ff9999\"},{\"x\":\"64\",\"y\":\"48\",\"isBlock\":\"true\",\"label\":\"wall\",\"abbrev\":\"undefined\",\"color\":\"#ff9999\"},{\"x\":\"64\",\"y\":\"49\",\"isBlock\":\"true\",\"label\":\"wall\",\"abbrev\":\"undefined\",\"color\":\"#ff9999\"}]', '2024-01-15 18:01:47', '2024-01-15 18:09:16'),
(8, 'floor-2', NULL, '[{\"x\":\"33\",\"y\":\"22\",\"isBlock\":\"true\",\"label\":\"test2\",\"abbrev\":\"TI\",\"color\":\"#200404\"},{\"x\":\"37\",\"y\":\"15\",\"isBlock\":\"false\",\"label\":\"male\",\"abbrev\":\"undefined\",\"color\":\"#0066cc\"},{\"x\":\"39\",\"y\":\"15\",\"isBlock\":\"true\",\"label\":\"test2\",\"abbrev\":\"TI\",\"color\":\"#200404\"},{\"x\":\"40\",\"y\":\"37\",\"isBlock\":\"false\",\"label\":\"female restroom\",\"abbrev\":\"undefined\",\"color\":\"#ff9999\"},{\"x\":\"41\",\"y\":\"54\",\"isBlock\":\"false\",\"label\":\"front\",\"abbrev\":\"undefined\",\"color\":\"#0066cc\"},{\"x\":\"45\",\"y\":\"53\",\"isBlock\":\"false\",\"label\":\"stair-in\",\"abbrev\":\"undefined\",\"color\":\"#ff9999\"},{\"x\":\"53\",\"y\":\"23\",\"isBlock\":\"false\",\"label\":\"test1\",\"abbrev\":\"TB\",\"color\":\"#d31d1d\"}]', '2024-01-15 18:02:34', '2024-01-15 18:36:53');

-- --------------------------------------------------------

--
-- Table structure for table `floor_lists`
--

CREATE TABLE `floor_lists` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `floor` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `floor-img` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `floor_lists`
--

INSERT INTO `floor_lists` (`id`, `floor`, `created_at`, `updated_at`, `floor-img`) VALUES
(1, 'ground-floor', '2024-01-14 13:21:21', '2024-01-14 13:21:21', 'ground-floor.jpg'),
(2, 'floor-2', '2024-01-15 10:09:05', '2024-01-15 10:09:05', 'floor-2.jpg');

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
(1, 'no question', '2024-01-15 13:46:46', '2024-01-15 13:46:46'),
(2, 'yes', '2024-01-15 13:47:19', '2024-01-15 13:47:19'),
(3, 'where is drawing room', '2024-01-15 17:57:00', '2024-01-15 17:57:00'),
(4, 'where can i find drawing?', '2024-01-15 18:05:02', '2024-01-15 18:05:02'),
(5, 'where facn i find test2', '2024-01-15 18:46:05', '2024-01-15 18:46:05');

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
(1, 'speech', 0, NULL, NULL),
(2, 'in', 1, NULL, NULL);

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
(13, '2023_11_20_160201_create_floor_lists_table', 1),
(14, '2023_11_23_144102_create_school_h_m_v_s_table', 1),
(15, '2023_11_30_165508_add_gender_to_teachers', 1),
(16, '2023_12_02_093320_create_qr_models_table', 1),
(17, '2023_12_11_132441_add_color_to_eastwoods_facilities', 1),
(18, '2023_12_11_143542_create_default_facilities_table', 1),
(19, '2024_01_14_132017_add_floor_img_to_eastwoods_facilities', 1),
(20, '2024_01_14_135915_add_floor_img_to_floor_lists', 1);

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
  `descriptions` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `school_h_m_v_s`
--

INSERT INTO `school_h_m_v_s` (`id`, `descriptions`, `type`, `path`, `created_at`, `updated_at`) VALUES
(1, 'test', 'hymn', NULL, NULL, NULL),
(2, 'mission', 'mission', NULL, NULL, NULL),
(3, 'vision', 'vision', NULL, NULL, NULL);

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
  `gender` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'male',
  `facilities_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `teachers`
--

INSERT INTO `teachers` (`id`, `name`, `position`, `created_at`, `updated_at`, `gender`, `facilities_id`) VALUES
(1, 'Cordova Jr. Adelino B.', 'Temporarily Unavailable', '2024-01-15 11:58:18', '2024-01-15 11:58:18', 'male', 2);

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
(1, 'Floor Plan', 'You have added a ground-floor layout.', 'added', 0, '2024-01-14 13:46:41', '2024-01-14 13:46:41'),
(2, 'Floor Plan', 'You have added a 0 layout.', 'added', 0, '2024-01-14 14:16:10', '2024-01-14 14:16:10'),
(3, 'Floor Plan', 'You have updated a ground-floor layout.', 'updated', 0, '2024-01-14 14:20:21', '2024-01-14 14:20:21'),
(4, 'Floor Plan', 'You have updated a ground-floor layout.', 'updated', 0, '2024-01-14 14:20:36', '2024-01-14 14:20:36'),
(5, 'Floor Plan', 'You have added a ground-floor layout.', 'added', 0, '2024-01-15 04:39:36', '2024-01-15 04:39:36'),
(6, 'Floor Plan', 'You have updated a ground-floor layout.', 'updated', 0, '2024-01-15 05:08:29', '2024-01-15 05:08:29'),
(7, 'Floor Plan', 'You have updated a ground-floor layout.', 'updated', 0, '2024-01-15 06:22:12', '2024-01-15 06:22:12'),
(8, 'Floor Plan', 'You have added a ground-floor layout.', 'added', 0, '2024-01-15 07:53:05', '2024-01-15 07:53:05'),
(9, 'Floor Plan', 'You have updated a ground-floor layout.', 'updated', 0, '2024-01-15 09:06:26', '2024-01-15 09:06:26'),
(10, 'Floor Plan', 'You have updated a ground-floor layout.', 'updated', 0, '2024-01-15 09:06:42', '2024-01-15 09:06:42'),
(11, 'Floor Plan', 'You have updated a ground-floor layout.', 'updated', 0, '2024-01-15 09:25:23', '2024-01-15 09:25:23'),
(12, 'Floor Plan', 'You have updated a ground-floor layout.', 'updated', 0, '2024-01-15 09:50:43', '2024-01-15 09:50:43'),
(13, 'Floor Plan', 'You have updated a ground-floor layout.', 'updated', 0, '2024-01-15 09:57:03', '2024-01-15 09:57:03'),
(14, 'Floor Plan', 'You have updated a ground-floor layout.', 'updated', 0, '2024-01-15 09:57:36', '2024-01-15 09:57:36'),
(15, 'Floor Plan', 'You have updated a ground-floor layout.', 'updated', 0, '2024-01-15 10:03:36', '2024-01-15 10:03:36'),
(16, 'Floor Plan', 'You have updated a ground-floor layout.', 'updated', 0, '2024-01-15 10:06:09', '2024-01-15 10:06:09'),
(17, 'Floor Plan', 'You have updated a ground-floor layout.', 'updated', 0, '2024-01-15 10:06:25', '2024-01-15 10:06:25'),
(18, 'Floor Plan', 'You have updated a ground-floor layout.', 'updated', 0, '2024-01-15 10:06:42', '2024-01-15 10:06:42'),
(19, 'Floor Plan', 'You have added a floor-2 layout.', 'added', 0, '2024-01-15 10:35:55', '2024-01-15 10:35:55'),
(20, 'Floor Plan', 'You have updated a floor-2 layout.', 'updated', 0, '2024-01-15 11:13:23', '2024-01-15 11:13:23'),
(21, 'Floor Plan', 'You have updated a floor-2 layout.', 'updated', 0, '2024-01-15 11:13:56', '2024-01-15 11:13:56'),
(22, 'Floor Plan', 'You have updated a floor-2 layout.', 'updated', 0, '2024-01-15 11:14:18', '2024-01-15 11:14:18'),
(23, 'Floor Plan', 'You have updated a floor-2 layout.', 'updated', 0, '2024-01-15 11:15:19', '2024-01-15 11:15:19'),
(24, 'Floor Plan', 'You have updated a floor-2 layout.', 'updated', 0, '2024-01-15 11:17:38', '2024-01-15 11:17:38'),
(25, 'Floor Plan', 'You have updated a floor-2 layout.', 'updated', 0, '2024-01-15 11:21:13', '2024-01-15 11:21:13'),
(26, 'Floor Plan', 'You have updated a floor-2 layout.', 'updated', 0, '2024-01-15 11:21:34', '2024-01-15 11:21:34'),
(27, 'Floor Plan', 'You have updated a floor-2 layout.', 'updated', 0, '2024-01-15 11:21:51', '2024-01-15 11:21:51'),
(28, 'Floor Plan', 'You have updated a floor-2 layout.', 'updated', 0, '2024-01-15 11:22:17', '2024-01-15 11:22:17'),
(29, 'Floor Plan', 'You have updated a floor-2 layout.', 'updated', 0, '2024-01-15 11:23:16', '2024-01-15 11:23:16'),
(30, 'Floor Plan', 'You have updated a floor-2 layout.', 'updated', 0, '2024-01-15 11:23:30', '2024-01-15 11:23:30'),
(31, 'Floor Plan', 'You have updated a floor-2 layout.', 'updated', 0, '2024-01-15 11:24:06', '2024-01-15 11:24:06'),
(32, 'Floor Plan', 'You have updated a ground-floor layout.', 'updated', 0, '2024-01-15 11:32:23', '2024-01-15 11:32:23'),
(33, 'Floor Plan', 'You have updated a ground-floor layout.', 'updated', 0, '2024-01-15 11:33:00', '2024-01-15 11:33:00'),
(34, 'Floor Plan', 'You have updated a ground-floor layout.', 'updated', 0, '2024-01-15 11:34:53', '2024-01-15 11:34:53'),
(35, 'Floor Plan', 'You have updated a ground-floor layout.', 'updated', 0, '2024-01-15 11:35:41', '2024-01-15 11:35:41'),
(36, 'Floor Plan', 'You have updated a ground-floor layout.', 'updated', 0, '2024-01-15 11:35:53', '2024-01-15 11:35:53'),
(37, 'Floor Plan', 'You have updated a ground-floor layout.', 'updated', 0, '2024-01-15 11:36:22', '2024-01-15 11:36:22'),
(38, 'Floor Plan', 'You have updated a ground-floor layout.', 'updated', 0, '2024-01-15 11:36:46', '2024-01-15 11:36:46'),
(39, 'Floor Plan', 'You have updated a ground-floor layout.', 'updated', 0, '2024-01-15 11:36:56', '2024-01-15 11:36:56'),
(40, 'Floor Plan', 'You have updated a ground-floor layout.', 'updated', 0, '2024-01-15 11:37:18', '2024-01-15 11:37:18'),
(41, 'Floor Plan', 'You have updated a ground-floor layout.', 'updated', 0, '2024-01-15 11:37:25', '2024-01-15 11:37:25'),
(42, 'Floor Plan', 'You have updated a floor-2 layout.', 'updated', 0, '2024-01-15 11:38:14', '2024-01-15 11:38:14'),
(43, 'Floor Plan', 'You have updated a floor-2 layout.', 'updated', 0, '2024-01-15 11:38:34', '2024-01-15 11:38:34'),
(44, 'Floor Plan', 'You have updated a floor-2 layout.', 'updated', 0, '2024-01-15 11:40:07', '2024-01-15 11:40:07'),
(45, 'Floor Plan', 'You have updated a floor-2 layout.', 'updated', 0, '2024-01-15 11:40:20', '2024-01-15 11:40:20'),
(46, 'Floor Plan', 'You have updated a floor-2 layout.', 'updated', 0, '2024-01-15 11:41:20', '2024-01-15 11:41:20'),
(47, 'Floor Plan', 'You have updated a floor-2 layout.', 'updated', 0, '2024-01-15 11:42:56', '2024-01-15 11:42:56'),
(48, 'Floor Plan', 'You have updated a floor-2 layout.', 'updated', 0, '2024-01-15 11:49:09', '2024-01-15 11:49:09'),
(49, 'Floor Plan', 'You have updated a floor-2 layout.', 'updated', 0, '2024-01-15 11:49:48', '2024-01-15 11:49:48'),
(50, 'Floor Plan', 'You have updated a floor-2 layout.', 'updated', 0, '2024-01-15 11:50:01', '2024-01-15 11:50:01'),
(51, 'Floor Plan', 'You have updated a floor-2 layout.', 'updated', 0, '2024-01-15 11:51:00', '2024-01-15 11:51:00'),
(52, 'Floor Plan', 'You have updated a ground-floor layout.', 'updated', 0, '2024-01-15 12:41:32', '2024-01-15 12:41:32'),
(53, 'Floor Plan', 'You have updated a ground-floor layout.', 'updated', 0, '2024-01-15 12:46:53', '2024-01-15 12:46:53'),
(54, 'Floor Plan', 'You have updated a ground-floor layout.', 'updated', 0, '2024-01-15 12:47:38', '2024-01-15 12:47:38'),
(55, 'Floor Plan', 'You have added a ground-floor layout.', 'added', 0, '2024-01-15 15:48:24', '2024-01-15 15:48:24'),
(56, 'Floor Plan', 'You have updated a ground-floor layout.', 'updated', 0, '2024-01-15 15:49:32', '2024-01-15 15:49:32'),
(57, 'Floor Plan', 'You have updated a ground-floor layout.', 'updated', 0, '2024-01-15 15:59:48', '2024-01-15 15:59:48'),
(58, 'Floor Plan', 'You have updated a ground-floor layout.', 'updated', 0, '2024-01-15 16:00:27', '2024-01-15 16:00:27'),
(59, 'Floor Plan', 'You have updated a ground-floor layout.', 'updated', 0, '2024-01-15 16:01:06', '2024-01-15 16:01:06'),
(60, 'Floor Plan', 'You have updated a ground-floor layout.', 'updated', 0, '2024-01-15 16:01:15', '2024-01-15 16:01:15'),
(61, 'Floor Plan', 'You have updated a ground-floor layout.', 'updated', 0, '2024-01-15 16:03:03', '2024-01-15 16:03:03'),
(62, 'Floor Plan', 'You have updated a ground-floor layout.', 'updated', 0, '2024-01-15 16:03:21', '2024-01-15 16:03:21'),
(63, 'Floor Plan', 'You have updated a ground-floor layout.', 'updated', 0, '2024-01-15 16:18:09', '2024-01-15 16:18:09'),
(64, 'Floor Plan', 'You have added a ground-floor layout.', 'added', 0, '2024-01-15 18:01:47', '2024-01-15 18:01:47'),
(65, 'Floor Plan', 'You have added a floor-2 layout.', 'added', 0, '2024-01-15 18:02:34', '2024-01-15 18:02:34'),
(66, 'Floor Plan', 'You have updated a ground-floor layout.', 'updated', 0, '2024-01-15 18:03:35', '2024-01-15 18:03:35'),
(67, 'Floor Plan', 'You have updated a ground-floor layout.', 'updated', 0, '2024-01-15 18:03:57', '2024-01-15 18:03:57'),
(68, 'Floor Plan', 'You have updated a ground-floor layout.', 'updated', 0, '2024-01-15 18:09:16', '2024-01-15 18:09:16'),
(69, 'Floor Plan', 'You have updated a floor-2 layout.', 'updated', 0, '2024-01-15 18:36:53', '2024-01-15 18:36:53');

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
(1, 'Administrator', 'admin@email.com', '2024-01-14 13:15:07', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'VGJOwj3PYl', '2024-01-14 13:15:07', '2024-01-14 13:15:07');

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `default_facilities`
--
ALTER TABLE `default_facilities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `eastwoods_facilities`
--
ALTER TABLE `eastwoods_facilities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `floorplans`
--
ALTER TABLE `floorplans`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `floor_lists`
--
ALTER TABLE `floor_lists`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `frequentlies`
--
ALTER TABLE `frequentlies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `functionalities`
--
ALTER TABLE `functionalities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `qr_models`
--
ALTER TABLE `qr_models`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `school_h_m_v_s`
--
ALTER TABLE `school_h_m_v_s`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `teachers`
--
ALTER TABLE `teachers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `updates`
--
ALTER TABLE `updates`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
