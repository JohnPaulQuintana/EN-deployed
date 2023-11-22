-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 22, 2023 at 09:27 AM
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
(5, 5, 'GH', '2023-11-17 19:51:28', '2023-11-17 19:51:28'),
(6, 6, 'SL', '2023-11-17 19:51:28', '2023-11-17 19:51:28'),
(7, 7, 'SSP', '2023-11-17 19:51:28', '2023-11-17 19:51:28'),
(8, 8, 'P', '2023-11-17 19:51:28', '2023-11-17 19:51:28'),
(9, 9, 'AO', '2023-11-18 12:06:43', '2023-11-18 12:06:43'),
(10, 10, 'TFO', '2023-11-18 12:06:43', '2023-11-18 12:06:43'),
(11, 11, 'L', '2023-11-18 12:06:43', '2023-11-18 12:06:43'),
(12, 12, 'R1', '2023-11-18 12:06:43', '2023-11-18 12:06:43'),
(13, 13, 'R1Y', '2023-11-18 12:06:43', '2023-11-18 12:06:43'),
(14, 14, 'GO', '2023-11-18 12:06:43', '2023-11-18 12:06:43'),
(15, 15, 'C', '2023-11-18 12:06:43', '2023-11-18 12:06:43'),
(16, 16, 'OOSA(', '2023-11-18 12:06:43', '2023-11-18 12:06:43'),
(17, 17, 'DR', '2023-11-18 12:06:43', '2023-11-18 12:06:43'),
(18, 18, 'EDF', '2023-11-18 12:06:43', '2023-11-18 12:06:43'),
(19, 19, 'MR', '2023-11-18 12:06:44', '2023-11-18 12:06:44'),
(20, 20, 'FR', '2023-11-18 12:06:44', '2023-11-18 12:06:44');

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
  `floor` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `eastwoods_facilities`
--

INSERT INTO `eastwoods_facilities` (`id`, `facilities`, `operation_time`, `created_at`, `updated_at`, `floor`) VALUES
(5, 'guard house', '08:00 am', '2023-11-17 19:51:28', '2023-11-17 19:51:28', 'ground-floor'),
(6, 'student lounge', '08:00 am', '2023-11-17 19:51:28', '2023-11-17 19:51:28', 'ground-floor'),
(7, 'school service parking', '08:00 am', '2023-11-17 19:51:28', '2023-11-17 19:51:28', 'ground-floor'),
(8, 'pe', '08:00 am', '2023-11-17 19:51:28', '2023-11-17 19:51:28', 'ground-floor'),
(9, 'administration off', '8.00 am', '2023-11-18 12:06:43', '2023-11-18 12:06:43', 'ground-floor'),
(10, 'tesda focal office', '8.00 am', '2023-11-18 12:06:43', '2023-11-18 12:06:43', 'ground-floor'),
(11, 'lobby', '8.00 am', '2023-11-18 12:06:43', '2023-11-18 12:06:43', 'ground-floor'),
(12, 'room 101', '8.00 am', '2023-11-18 12:06:43', '2023-11-18 12:06:43', 'ground-floor'),
(13, 'room 102', '8.00 am', '2023-11-18 12:06:43', '2023-11-18 12:06:43', 'ground-floor'),
(14, 'guidance office', '8.00 am', '2023-11-18 12:06:43', '2023-11-18 12:06:43', 'ground-floor'),
(15, 'canteen', '8.00 am', '2023-11-18 12:06:43', '2023-11-18 12:06:43', 'ground-floor'),
(16, 'office of student affairs (osa)', '8.00 am', '2023-11-18 12:06:43', '2023-11-18 12:06:43', 'ground-floor'),
(17, 'drawing room', '8.00 am', '2023-11-18 12:06:43', '2023-11-18 12:06:43', 'ground-floor'),
(18, 'engineering department faculty', '8.00 am', '2023-11-18 12:06:43', '2023-11-18 12:06:43', 'ground-floor'),
(19, 'male restroom', '8.00 am', '2023-11-18 12:06:43', '2023-11-18 12:06:43', 'ground-floor'),
(20, 'female restroom', '8.00 am', '2023-11-18 12:06:44', '2023-11-18 12:06:44', 'ground-floor');

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
(5, 'ground-floor', 140, '[{\"x\":\"0\",\"y\":\"0\",\"width\":\"60\",\"height\":\"60\",\"row\":\"1\",\"column\":\"1\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null},{\"x\":\"0\",\"y\":\"1\",\"width\":\"61.2244873046875\",\"height\":\"61.22449493408203\",\"row\":\"2\",\"column\":\"1\",\"isBlock\":\"true\",\"label\":\"EDF\",\"sublabel\":\"engineering department faculty\",\"abbrev\":null},{\"x\":\"0\",\"y\":\"2\",\"width\":\"60\",\"height\":\"60\",\"row\":\"3\",\"column\":\"1\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null},{\"x\":\"0\",\"y\":\"3\",\"width\":\"60\",\"height\":\"60\",\"row\":\"4\",\"column\":\"1\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null},{\"x\":\"0\",\"y\":\"4\",\"width\":\"60\",\"height\":\"60\",\"row\":\"5\",\"column\":\"1\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null},{\"x\":\"0\",\"y\":\"5\",\"width\":\"60.60601806640625\",\"height\":\"60.60606384277344\",\"row\":\"6\",\"column\":\"1\",\"isBlock\":\"true\",\"label\":\"wall\",\"sublabel\":null,\"abbrev\":null},{\"x\":\"0\",\"y\":\"6\",\"width\":\"61.2244873046875\",\"height\":\"61.22449493408203\",\"row\":\"7\",\"column\":\"1\",\"isBlock\":\"true\",\"label\":\"OOSA(\",\"sublabel\":\"office of student affairs (osa)\",\"abbrev\":null},{\"x\":\"0\",\"y\":\"7\",\"width\":\"60.60601806640625\",\"height\":\"60.60606384277344\",\"row\":\"8\",\"column\":\"1\",\"isBlock\":\"true\",\"label\":\"wall\",\"sublabel\":null,\"abbrev\":null},{\"x\":\"0\",\"y\":\"8\",\"width\":\"60\",\"height\":\"60\",\"row\":\"9\",\"column\":\"1\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null},{\"x\":\"0\",\"y\":\"9\",\"width\":\"60\",\"height\":\"60\",\"row\":\"10\",\"column\":\"1\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null},{\"x\":\"0\",\"y\":\"10\",\"width\":\"60\",\"height\":\"60\",\"row\":\"11\",\"column\":\"1\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null},{\"x\":\"0\",\"y\":\"11\",\"width\":\"60\",\"height\":\"60\",\"row\":\"12\",\"column\":\"1\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null},{\"x\":\"0\",\"y\":\"12\",\"width\":\"61.224609375\",\"height\":\"61.22449493408203\",\"row\":\"13\",\"column\":\"1\",\"isBlock\":\"true\",\"label\":\"MR\",\"sublabel\":\"male restroom\",\"abbrev\":null},{\"x\":\"0\",\"y\":\"13\",\"width\":\"60\",\"height\":\"60\",\"row\":\"14\",\"column\":\"1\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null},{\"x\":\"1\",\"y\":\"0\",\"width\":\"60\",\"height\":\"60\",\"row\":\"1\",\"column\":\"2\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null},{\"x\":\"1\",\"y\":\"1\",\"width\":\"61.2244873046875\",\"height\":\"61.22449493408203\",\"row\":\"2\",\"column\":\"2\",\"isBlock\":\"true\",\"label\":\"DR\",\"sublabel\":\"drawing room\",\"abbrev\":null},{\"x\":\"1\",\"y\":\"2\",\"width\":\"61.2244873046875\",\"height\":\"61.22449493408203\",\"row\":\"3\",\"column\":\"2\",\"isBlock\":\"true\",\"label\":\"DR\",\"sublabel\":\"drawing room\",\"abbrev\":null},{\"x\":\"1\",\"y\":\"3\",\"width\":\"60\",\"height\":\"60\",\"row\":\"4\",\"column\":\"2\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null},{\"x\":\"1\",\"y\":\"4\",\"width\":\"60\",\"height\":\"60\",\"row\":\"5\",\"column\":\"2\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null},{\"x\":\"1\",\"y\":\"5\",\"width\":\"61.2244873046875\",\"height\":\"61.22449493408203\",\"row\":\"6\",\"column\":\"2\",\"isBlock\":\"true\",\"label\":\"OOSA(\",\"sublabel\":\"office of student affairs (osa)\",\"abbrev\":null},{\"x\":\"1\",\"y\":\"6\",\"width\":\"61.2244873046875\",\"height\":\"61.22449493408203\",\"row\":\"7\",\"column\":\"2\",\"isBlock\":\"true\",\"label\":\"OOSA(\",\"sublabel\":\"office of student affairs (osa)\",\"abbrev\":null},{\"x\":\"1\",\"y\":\"7\",\"width\":\"60.60601806640625\",\"height\":\"60.60606384277344\",\"row\":\"8\",\"column\":\"2\",\"isBlock\":\"true\",\"label\":\"wall\",\"sublabel\":null,\"abbrev\":null},{\"x\":\"1\",\"y\":\"8\",\"width\":\"60.60601806640625\",\"height\":\"60.60606384277344\",\"row\":\"9\",\"column\":\"2\",\"isBlock\":\"true\",\"label\":\"wall\",\"sublabel\":null,\"abbrev\":null},{\"x\":\"1\",\"y\":\"9\",\"width\":\"60.6060791015625\",\"height\":\"60.60606384277344\",\"row\":\"10\",\"column\":\"2\",\"isBlock\":\"true\",\"label\":\"wall\",\"sublabel\":null,\"abbrev\":null},{\"x\":\"1\",\"y\":\"10\",\"width\":\"60.606201171875\",\"height\":\"60.60606384277344\",\"row\":\"11\",\"column\":\"2\",\"isBlock\":\"true\",\"label\":\"wall\",\"sublabel\":null,\"abbrev\":null},{\"x\":\"1\",\"y\":\"11\",\"width\":\"60.6060791015625\",\"height\":\"60.60606384277344\",\"row\":\"12\",\"column\":\"2\",\"isBlock\":\"true\",\"label\":\"wall\",\"sublabel\":null,\"abbrev\":null},{\"x\":\"1\",\"y\":\"12\",\"width\":\"60\",\"height\":\"60\",\"row\":\"13\",\"column\":\"2\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null},{\"x\":\"1\",\"y\":\"13\",\"width\":\"60\",\"height\":\"60\",\"row\":\"14\",\"column\":\"2\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null},{\"x\":\"2\",\"y\":\"0\",\"width\":\"61.2244873046875\",\"height\":\"61.2244873046875\",\"row\":\"1\",\"column\":\"3\",\"isBlock\":\"true\",\"label\":\"C\",\"sublabel\":\"canteen\",\"abbrev\":null},{\"x\":\"2\",\"y\":\"1\",\"width\":\"61.2244873046875\",\"height\":\"61.2244873046875\",\"row\":\"2\",\"column\":\"3\",\"isBlock\":\"true\",\"label\":\"C\",\"sublabel\":\"canteen\",\"abbrev\":null},{\"x\":\"2\",\"y\":\"2\",\"width\":\"61.2244873046875\",\"height\":\"61.2244873046875\",\"row\":\"3\",\"column\":\"3\",\"isBlock\":\"true\",\"label\":\"C\",\"sublabel\":\"canteen\",\"abbrev\":null},{\"x\":\"2\",\"y\":\"3\",\"width\":\"61.2244873046875\",\"height\":\"61.2244873046875\",\"row\":\"4\",\"column\":\"3\",\"isBlock\":\"true\",\"label\":\"C\",\"sublabel\":\"canteen\",\"abbrev\":null},{\"x\":\"2\",\"y\":\"4\",\"width\":\"60\",\"height\":\"60\",\"row\":\"5\",\"column\":\"3\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null},{\"x\":\"2\",\"y\":\"5\",\"width\":\"60.60601806640625\",\"height\":\"60.60606384277344\",\"row\":\"6\",\"column\":\"3\",\"isBlock\":\"true\",\"label\":\"wall\",\"sublabel\":null,\"abbrev\":null},{\"x\":\"2\",\"y\":\"6\",\"width\":\"61.2244873046875\",\"height\":\"61.2244873046875\",\"row\":\"7\",\"column\":\"3\",\"isBlock\":\"true\",\"label\":\"P\",\"sublabel\":\"pe\",\"abbrev\":null},{\"x\":\"2\",\"y\":\"7\",\"width\":\"61.2244873046875\",\"height\":\"61.2244873046875\",\"row\":\"8\",\"column\":\"3\",\"isBlock\":\"true\",\"label\":\"P\",\"sublabel\":\"pe\",\"abbrev\":null},{\"x\":\"2\",\"y\":\"8\",\"width\":\"61.2244873046875\",\"height\":\"61.2244873046875\",\"row\":\"9\",\"column\":\"3\",\"isBlock\":\"true\",\"label\":\"P\",\"sublabel\":\"pe\",\"abbrev\":null},{\"x\":\"2\",\"y\":\"9\",\"width\":\"61.2244873046875\",\"height\":\"61.2244873046875\",\"row\":\"10\",\"column\":\"3\",\"isBlock\":\"true\",\"label\":\"P\",\"sublabel\":\"pe\",\"abbrev\":null},{\"x\":\"2\",\"y\":\"10\",\"width\":\"61.2244873046875\",\"height\":\"61.2244873046875\",\"row\":\"11\",\"column\":\"3\",\"isBlock\":\"true\",\"label\":\"P\",\"sublabel\":\"pe\",\"abbrev\":null},{\"x\":\"2\",\"y\":\"11\",\"width\":\"60\",\"height\":\"60\",\"row\":\"12\",\"column\":\"3\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null},{\"x\":\"2\",\"y\":\"12\",\"width\":\"60\",\"height\":\"60\",\"row\":\"13\",\"column\":\"3\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null},{\"x\":\"2\",\"y\":\"13\",\"width\":\"60\",\"height\":\"60\",\"row\":\"14\",\"column\":\"3\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null},{\"x\":\"3\",\"y\":\"0\",\"width\":\"60\",\"height\":\"60\",\"row\":\"1\",\"column\":\"4\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null},{\"x\":\"3\",\"y\":\"1\",\"width\":\"61.2244873046875\",\"height\":\"61.22447204589844\",\"row\":\"2\",\"column\":\"4\",\"isBlock\":\"true\",\"label\":\"C\",\"sublabel\":\"canteen\",\"abbrev\":null},{\"x\":\"3\",\"y\":\"2\",\"width\":\"61.2244873046875\",\"height\":\"61.22447204589844\",\"row\":\"3\",\"column\":\"4\",\"isBlock\":\"true\",\"label\":\"R1\",\"sublabel\":\"room 101\",\"abbrev\":null},{\"x\":\"3\",\"y\":\"3\",\"width\":\"61.2244873046875\",\"height\":\"61.22447204589844\",\"row\":\"4\",\"column\":\"4\",\"isBlock\":\"true\",\"label\":\"R1\",\"sublabel\":\"room 101\",\"abbrev\":null},{\"x\":\"3\",\"y\":\"4\",\"width\":\"60\",\"height\":\"60\",\"row\":\"5\",\"column\":\"4\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null},{\"x\":\"3\",\"y\":\"5\",\"width\":\"60\",\"height\":\"60\",\"row\":\"6\",\"column\":\"4\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null},{\"x\":\"3\",\"y\":\"6\",\"width\":\"61.2244873046875\",\"height\":\"61.22447204589844\",\"row\":\"7\",\"column\":\"4\",\"isBlock\":\"true\",\"label\":\"P\",\"sublabel\":\"pe\",\"abbrev\":null},{\"x\":\"3\",\"y\":\"7\",\"width\":\"61.2244873046875\",\"height\":\"61.22447204589844\",\"row\":\"8\",\"column\":\"4\",\"isBlock\":\"true\",\"label\":\"P\",\"sublabel\":\"pe\",\"abbrev\":null},{\"x\":\"3\",\"y\":\"8\",\"width\":\"61.2244873046875\",\"height\":\"61.22447204589844\",\"row\":\"9\",\"column\":\"4\",\"isBlock\":\"true\",\"label\":\"P\",\"sublabel\":\"pe\",\"abbrev\":null},{\"x\":\"3\",\"y\":\"9\",\"width\":\"61.2244873046875\",\"height\":\"61.22447204589844\",\"row\":\"10\",\"column\":\"4\",\"isBlock\":\"true\",\"label\":\"P\",\"sublabel\":\"pe\",\"abbrev\":null},{\"x\":\"3\",\"y\":\"10\",\"width\":\"61.2244873046875\",\"height\":\"61.22447204589844\",\"row\":\"11\",\"column\":\"4\",\"isBlock\":\"true\",\"label\":\"P\",\"sublabel\":\"pe\",\"abbrev\":null},{\"x\":\"3\",\"y\":\"11\",\"width\":\"60.6060791015625\",\"height\":\"60.606048583984375\",\"row\":\"12\",\"column\":\"4\",\"isBlock\":\"true\",\"label\":\"wall\",\"sublabel\":null,\"abbrev\":null},{\"x\":\"3\",\"y\":\"12\",\"width\":\"60\",\"height\":\"60\",\"row\":\"13\",\"column\":\"4\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null},{\"x\":\"3\",\"y\":\"13\",\"width\":\"60\",\"height\":\"60\",\"row\":\"14\",\"column\":\"4\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null},{\"x\":\"4\",\"y\":\"0\",\"width\":\"60\",\"height\":\"60\",\"row\":\"1\",\"column\":\"5\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null},{\"x\":\"4\",\"y\":\"1\",\"width\":\"61.2244873046875\",\"height\":\"61.2244873046875\",\"row\":\"2\",\"column\":\"5\",\"isBlock\":\"true\",\"label\":\"MR\",\"sublabel\":\"male restroom\",\"abbrev\":null},{\"x\":\"4\",\"y\":\"2\",\"width\":\"61.2244873046875\",\"height\":\"61.2244873046875\",\"row\":\"3\",\"column\":\"5\",\"isBlock\":\"true\",\"label\":\"R1\",\"sublabel\":\"room 101\",\"abbrev\":null},{\"x\":\"4\",\"y\":\"3\",\"width\":\"61.2244873046875\",\"height\":\"61.2244873046875\",\"row\":\"4\",\"column\":\"5\",\"isBlock\":\"true\",\"label\":\"R1\",\"sublabel\":\"room 101\",\"abbrev\":null},{\"x\":\"4\",\"y\":\"4\",\"width\":\"60\",\"height\":\"60\",\"row\":\"5\",\"column\":\"5\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null},{\"x\":\"4\",\"y\":\"5\",\"width\":\"61.2244873046875\",\"height\":\"61.2244873046875\",\"row\":\"6\",\"column\":\"5\",\"isBlock\":\"true\",\"label\":\"FR\",\"sublabel\":\"female restroom\",\"abbrev\":null},{\"x\":\"4\",\"y\":\"6\",\"width\":\"60.6060791015625\",\"height\":\"60.6060791015625\",\"row\":\"7\",\"column\":\"5\",\"isBlock\":\"true\",\"label\":\"wall\",\"sublabel\":null,\"abbrev\":null},{\"x\":\"4\",\"y\":\"7\",\"width\":\"60.60601806640625\",\"height\":\"60.6060791015625\",\"row\":\"8\",\"column\":\"5\",\"isBlock\":\"true\",\"label\":\"wall\",\"sublabel\":null,\"abbrev\":null},{\"x\":\"4\",\"y\":\"8\",\"width\":\"60.60601806640625\",\"height\":\"60.6060791015625\",\"row\":\"9\",\"column\":\"5\",\"isBlock\":\"true\",\"label\":\"wall\",\"sublabel\":null,\"abbrev\":null},{\"x\":\"4\",\"y\":\"9\",\"width\":\"60\",\"height\":\"60\",\"row\":\"10\",\"column\":\"5\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null},{\"x\":\"4\",\"y\":\"10\",\"width\":\"60.606201171875\",\"height\":\"60.6060791015625\",\"row\":\"11\",\"column\":\"5\",\"isBlock\":\"true\",\"label\":\"wall\",\"sublabel\":null,\"abbrev\":null},{\"x\":\"4\",\"y\":\"11\",\"width\":\"60.6060791015625\",\"height\":\"60.6060791015625\",\"row\":\"12\",\"column\":\"5\",\"isBlock\":\"true\",\"label\":\"wall\",\"sublabel\":null,\"abbrev\":null},{\"x\":\"4\",\"y\":\"12\",\"width\":\"60\",\"height\":\"60\",\"row\":\"13\",\"column\":\"5\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null},{\"x\":\"4\",\"y\":\"13\",\"width\":\"60\",\"height\":\"60\",\"row\":\"14\",\"column\":\"5\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null},{\"x\":\"5\",\"y\":\"0\",\"width\":\"61.2244873046875\",\"height\":\"61.2244873046875\",\"row\":\"1\",\"column\":\"6\",\"isBlock\":\"true\",\"label\":\"GO\",\"sublabel\":\"guidance office\",\"abbrev\":null},{\"x\":\"5\",\"y\":\"1\",\"width\":\"60\",\"height\":\"60\",\"row\":\"2\",\"column\":\"6\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null},{\"x\":\"5\",\"y\":\"2\",\"width\":\"60\",\"height\":\"60\",\"row\":\"3\",\"column\":\"6\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null},{\"x\":\"5\",\"y\":\"3\",\"width\":\"60\",\"height\":\"60\",\"row\":\"4\",\"column\":\"6\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null},{\"x\":\"5\",\"y\":\"4\",\"width\":\"60\",\"height\":\"60\",\"row\":\"5\",\"column\":\"6\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null},{\"x\":\"5\",\"y\":\"5\",\"width\":\"60\",\"height\":\"60\",\"row\":\"6\",\"column\":\"6\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null},{\"x\":\"5\",\"y\":\"6\",\"width\":\"60\",\"height\":\"60\",\"row\":\"7\",\"column\":\"6\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null},{\"x\":\"5\",\"y\":\"7\",\"width\":\"60\",\"height\":\"60\",\"row\":\"8\",\"column\":\"6\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null},{\"x\":\"5\",\"y\":\"8\",\"width\":\"60\",\"height\":\"60\",\"row\":\"9\",\"column\":\"6\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null},{\"x\":\"5\",\"y\":\"9\",\"width\":\"60\",\"height\":\"60\",\"row\":\"10\",\"column\":\"6\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null},{\"x\":\"5\",\"y\":\"10\",\"width\":\"60\",\"height\":\"60\",\"row\":\"11\",\"column\":\"6\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null},{\"x\":\"5\",\"y\":\"11\",\"width\":\"61.224365234375\",\"height\":\"61.2244873046875\",\"row\":\"12\",\"column\":\"6\",\"isBlock\":\"true\",\"label\":\"stair-in\",\"sublabel\":null,\"abbrev\":null},{\"x\":\"5\",\"y\":\"12\",\"width\":\"60\",\"height\":\"60\",\"row\":\"13\",\"column\":\"6\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null},{\"x\":\"5\",\"y\":\"13\",\"width\":\"60\",\"height\":\"60\",\"row\":\"14\",\"column\":\"6\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null},{\"x\":\"6\",\"y\":\"0\",\"width\":\"61.2244873046875\",\"height\":\"61.2244873046875\",\"row\":\"1\",\"column\":\"7\",\"isBlock\":\"true\",\"label\":\"GO\",\"sublabel\":\"guidance office\",\"abbrev\":null},{\"x\":\"6\",\"y\":\"1\",\"width\":\"60\",\"height\":\"60\",\"row\":\"2\",\"column\":\"7\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null},{\"x\":\"6\",\"y\":\"2\",\"width\":\"61.2244873046875\",\"height\":\"61.2244873046875\",\"row\":\"3\",\"column\":\"7\",\"isBlock\":\"true\",\"label\":\"R1Y\",\"sublabel\":\"room 102\",\"abbrev\":null},{\"x\":\"6\",\"y\":\"3\",\"width\":\"61.2244873046875\",\"height\":\"61.2244873046875\",\"row\":\"4\",\"column\":\"7\",\"isBlock\":\"true\",\"label\":\"R1Y\",\"sublabel\":\"room 102\",\"abbrev\":null},{\"x\":\"6\",\"y\":\"4\",\"width\":\"61.2244873046875\",\"height\":\"61.2244873046875\",\"row\":\"5\",\"column\":\"7\",\"isBlock\":\"true\",\"label\":\"AO\",\"sublabel\":\"administration off\",\"abbrev\":null},{\"x\":\"6\",\"y\":\"5\",\"width\":\"61.2244873046875\",\"height\":\"61.2244873046875\",\"row\":\"6\",\"column\":\"7\",\"isBlock\":\"true\",\"label\":\"AO\",\"sublabel\":\"administration off\",\"abbrev\":null},{\"x\":\"6\",\"y\":\"6\",\"width\":\"61.2244873046875\",\"height\":\"61.2244873046875\",\"row\":\"7\",\"column\":\"7\",\"isBlock\":\"true\",\"label\":\"AO\",\"sublabel\":\"administration off\",\"abbrev\":null},{\"x\":\"6\",\"y\":\"7\",\"width\":\"61.2244873046875\",\"height\":\"61.2244873046875\",\"row\":\"8\",\"column\":\"7\",\"isBlock\":\"true\",\"label\":\"AO\",\"sublabel\":\"administration off\",\"abbrev\":null},{\"x\":\"6\",\"y\":\"8\",\"width\":\"61.2244873046875\",\"height\":\"61.2244873046875\",\"row\":\"9\",\"column\":\"7\",\"isBlock\":\"true\",\"label\":\"AO\",\"sublabel\":\"administration off\",\"abbrev\":null},{\"x\":\"6\",\"y\":\"9\",\"width\":\"60\",\"height\":\"60\",\"row\":\"10\",\"column\":\"7\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null},{\"x\":\"6\",\"y\":\"10\",\"width\":\"60\",\"height\":\"60\",\"row\":\"11\",\"column\":\"7\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null},{\"x\":\"6\",\"y\":\"11\",\"width\":\"60\",\"height\":\"60\",\"row\":\"12\",\"column\":\"7\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null},{\"x\":\"6\",\"y\":\"12\",\"width\":\"60\",\"height\":\"60\",\"row\":\"13\",\"column\":\"7\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null},{\"x\":\"6\",\"y\":\"13\",\"width\":\"60\",\"height\":\"60\",\"row\":\"14\",\"column\":\"7\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null},{\"x\":\"7\",\"y\":\"0\",\"width\":\"61.2244873046875\",\"height\":\"61.224517822265625\",\"row\":\"1\",\"column\":\"8\",\"isBlock\":\"true\",\"label\":\"GO\",\"sublabel\":\"guidance office\",\"abbrev\":null},{\"x\":\"7\",\"y\":\"1\",\"width\":\"60\",\"height\":\"60\",\"row\":\"2\",\"column\":\"8\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null},{\"x\":\"7\",\"y\":\"2\",\"width\":\"60.6060791015625\",\"height\":\"60.6060791015625\",\"row\":\"3\",\"column\":\"8\",\"isBlock\":\"true\",\"label\":\"wall\",\"sublabel\":null,\"abbrev\":null},{\"x\":\"7\",\"y\":\"3\",\"width\":\"60.60601806640625\",\"height\":\"60.6060791015625\",\"row\":\"4\",\"column\":\"8\",\"isBlock\":\"true\",\"label\":\"wall\",\"sublabel\":null,\"abbrev\":null},{\"x\":\"7\",\"y\":\"4\",\"width\":\"61.2244873046875\",\"height\":\"61.224517822265625\",\"row\":\"5\",\"column\":\"8\",\"isBlock\":\"true\",\"label\":\"AO\",\"sublabel\":\"administration off\",\"abbrev\":null},{\"x\":\"7\",\"y\":\"5\",\"width\":\"61.2244873046875\",\"height\":\"61.224517822265625\",\"row\":\"6\",\"column\":\"8\",\"isBlock\":\"true\",\"label\":\"AO\",\"sublabel\":\"administration off\",\"abbrev\":null},{\"x\":\"7\",\"y\":\"6\",\"width\":\"61.2244873046875\",\"height\":\"61.224517822265625\",\"row\":\"7\",\"column\":\"8\",\"isBlock\":\"true\",\"label\":\"AO\",\"sublabel\":\"administration off\",\"abbrev\":null},{\"x\":\"7\",\"y\":\"7\",\"width\":\"61.2244873046875\",\"height\":\"61.224517822265625\",\"row\":\"8\",\"column\":\"8\",\"isBlock\":\"true\",\"label\":\"AO\",\"sublabel\":\"administration off\",\"abbrev\":null},{\"x\":\"7\",\"y\":\"8\",\"width\":\"61.2244873046875\",\"height\":\"61.224517822265625\",\"row\":\"9\",\"column\":\"8\",\"isBlock\":\"true\",\"label\":\"AO\",\"sublabel\":\"administration off\",\"abbrev\":null},{\"x\":\"7\",\"y\":\"9\",\"width\":\"60\",\"height\":\"60\",\"row\":\"10\",\"column\":\"8\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null},{\"x\":\"7\",\"y\":\"10\",\"width\":\"60\",\"height\":\"60\",\"row\":\"11\",\"column\":\"8\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null},{\"x\":\"7\",\"y\":\"11\",\"width\":\"61.224365234375\",\"height\":\"61.224517822265625\",\"row\":\"12\",\"column\":\"8\",\"isBlock\":\"false\",\"label\":\"front\",\"sublabel\":null,\"abbrev\":null},{\"x\":\"7\",\"y\":\"12\",\"width\":\"60\",\"height\":\"60\",\"row\":\"13\",\"column\":\"8\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null},{\"x\":\"7\",\"y\":\"13\",\"width\":\"60\",\"height\":\"60\",\"row\":\"14\",\"column\":\"8\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null},{\"x\":\"8\",\"y\":\"0\",\"width\":\"61.2244873046875\",\"height\":\"61.2244873046875\",\"row\":\"1\",\"column\":\"9\",\"isBlock\":\"true\",\"label\":\"TFO\",\"sublabel\":\"tesda focal office\",\"abbrev\":null},{\"x\":\"8\",\"y\":\"1\",\"width\":\"60\",\"height\":\"60\",\"row\":\"2\",\"column\":\"9\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null},{\"x\":\"8\",\"y\":\"2\",\"width\":\"60\",\"height\":\"60\",\"row\":\"3\",\"column\":\"9\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null},{\"x\":\"8\",\"y\":\"3\",\"width\":\"60\",\"height\":\"60\",\"row\":\"4\",\"column\":\"9\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null},{\"x\":\"8\",\"y\":\"4\",\"width\":\"60\",\"height\":\"60\",\"row\":\"5\",\"column\":\"9\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null},{\"x\":\"8\",\"y\":\"5\",\"width\":\"60\",\"height\":\"60\",\"row\":\"6\",\"column\":\"9\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null},{\"x\":\"8\",\"y\":\"6\",\"width\":\"60\",\"height\":\"60\",\"row\":\"7\",\"column\":\"9\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null},{\"x\":\"8\",\"y\":\"7\",\"width\":\"60\",\"height\":\"60\",\"row\":\"8\",\"column\":\"9\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null},{\"x\":\"8\",\"y\":\"8\",\"width\":\"60\",\"height\":\"60\",\"row\":\"9\",\"column\":\"9\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null},{\"x\":\"8\",\"y\":\"9\",\"width\":\"60\",\"height\":\"60\",\"row\":\"10\",\"column\":\"9\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null},{\"x\":\"8\",\"y\":\"10\",\"width\":\"60\",\"height\":\"60\",\"row\":\"11\",\"column\":\"9\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null},{\"x\":\"8\",\"y\":\"11\",\"width\":\"60\",\"height\":\"60\",\"row\":\"12\",\"column\":\"9\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null},{\"x\":\"8\",\"y\":\"12\",\"width\":\"60\",\"height\":\"60\",\"row\":\"13\",\"column\":\"9\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null},{\"x\":\"8\",\"y\":\"13\",\"width\":\"60\",\"height\":\"60\",\"row\":\"14\",\"column\":\"9\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null},{\"x\":\"9\",\"y\":\"0\",\"width\":\"60\",\"height\":\"60\",\"row\":\"1\",\"column\":\"10\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null},{\"x\":\"9\",\"y\":\"1\",\"width\":\"60\",\"height\":\"60\",\"row\":\"2\",\"column\":\"10\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null},{\"x\":\"9\",\"y\":\"2\",\"width\":\"60\",\"height\":\"60\",\"row\":\"3\",\"column\":\"10\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null},{\"x\":\"9\",\"y\":\"3\",\"width\":\"61.2244873046875\",\"height\":\"61.2244873046875\",\"row\":\"4\",\"column\":\"10\",\"isBlock\":\"true\",\"label\":\"SL\",\"sublabel\":\"student lounge\",\"abbrev\":null},{\"x\":\"9\",\"y\":\"4\",\"width\":\"61.2244873046875\",\"height\":\"61.2244873046875\",\"row\":\"5\",\"column\":\"10\",\"isBlock\":\"true\",\"label\":\"SL\",\"sublabel\":\"student lounge\",\"abbrev\":null},{\"x\":\"9\",\"y\":\"5\",\"width\":\"61.2244873046875\",\"height\":\"61.2244873046875\",\"row\":\"6\",\"column\":\"10\",\"isBlock\":\"true\",\"label\":\"SL\",\"sublabel\":\"student lounge\",\"abbrev\":null},{\"x\":\"9\",\"y\":\"6\",\"width\":\"61.2244873046875\",\"height\":\"61.2244873046875\",\"row\":\"7\",\"column\":\"10\",\"isBlock\":\"true\",\"label\":\"SL\",\"sublabel\":\"student lounge\",\"abbrev\":null},{\"x\":\"9\",\"y\":\"7\",\"width\":\"61.2244873046875\",\"height\":\"61.2244873046875\",\"row\":\"8\",\"column\":\"10\",\"isBlock\":\"true\",\"label\":\"SL\",\"sublabel\":\"student lounge\",\"abbrev\":null},{\"x\":\"9\",\"y\":\"8\",\"width\":\"60\",\"height\":\"60\",\"row\":\"9\",\"column\":\"10\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null},{\"x\":\"9\",\"y\":\"9\",\"width\":\"60\",\"height\":\"60\",\"row\":\"10\",\"column\":\"10\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null},{\"x\":\"9\",\"y\":\"10\",\"width\":\"60\",\"height\":\"60\",\"row\":\"11\",\"column\":\"10\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null},{\"x\":\"9\",\"y\":\"11\",\"width\":\"60\",\"height\":\"60\",\"row\":\"12\",\"column\":\"10\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null},{\"x\":\"9\",\"y\":\"12\",\"width\":\"60\",\"height\":\"60\",\"row\":\"13\",\"column\":\"10\",\"isBlock\":\"false\",\"label\":null,\"sublabel\":null,\"abbrev\":null},{\"x\":\"9\",\"y\":\"13\",\"width\":\"61.224365234375\",\"height\":\"61.2244873046875\",\"row\":\"14\",\"column\":\"10\",\"isBlock\":\"true\",\"label\":\"GH\",\"sublabel\":\"guard house\",\"abbrev\":null}]', '2023-11-18 13:00:49', '2023-11-20 22:13:02');

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
(1, 'Where can i find pe?', NULL, NULL);

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
(2, 'scanner', 1, NULL, '2023-11-18 16:50:25'),
(3, 'in', 0, NULL, '2023-11-17 19:37:04');

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
(13, '2023_11_20_160201_create_floor_lists_table', 2);

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
-- Table structure for table `teachers`
--

CREATE TABLE `teachers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `facilities_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `teachers`
--

INSERT INTO `teachers` (`id`, `name`, `position`, `created_at`, `updated_at`, `facilities_id`) VALUES
(1, 'test', 'test', NULL, NULL, 0),
(2, 'test', 'test', '2023-11-19 22:30:54', '2023-11-19 22:33:44', 17);

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
(33, 'Floor Plan', 'You have updated a ground-floor layout.', 'updated', 0, '2023-11-20 19:53:46', '2023-11-20 19:53:46'),
(34, 'Floor Plan', 'You have updated a ground-floor layout.', 'updated', 0, '2023-11-20 19:54:05', '2023-11-20 19:54:05'),
(35, 'Floor Plan', 'You have updated a ground-floor layout.', 'updated', 0, '2023-11-20 19:58:57', '2023-11-20 19:58:57'),
(36, 'Floor Plan', 'You have updated a ground-floor layout.', 'updated', 0, '2023-11-20 19:59:15', '2023-11-20 19:59:15'),
(37, 'Floor Plan', 'You have updated a ground-floor layout.', 'updated', 0, '2023-11-20 20:33:58', '2023-11-20 20:33:58'),
(38, 'Floor Plan', 'You have updated a ground-floor layout.', 'updated', 0, '2023-11-20 22:13:02', '2023-11-20 22:13:02');

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
(1, 'Administrator', 'administrator@email.com', '2023-11-17 14:53:39', '$2y$10$H2EXhgMPC2KaZU9UaPmxJ.6QHBaORCSQNRYEWWWmLELmRgU0QPik6', NULL, NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `abbrevs`
--
ALTER TABLE `abbrevs`
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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `eastwoods_facilities`
--
ALTER TABLE `eastwoods_facilities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `floorplans`
--
ALTER TABLE `floorplans`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `floor_lists`
--
ALTER TABLE `floor_lists`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `frequentlies`
--
ALTER TABLE `frequentlies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `functionalities`
--
ALTER TABLE `functionalities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `teachers`
--
ALTER TABLE `teachers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `updates`
--
ALTER TABLE `updates`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
