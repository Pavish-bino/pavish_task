-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 31, 2019 at 10:21 PM
-- Server version: 10.3.16-MariaDB
-- PHP Version: 7.3.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `people10_task`
--

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip_address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`id`, `name`, `ip_address`, `created_at`, `updated_at`) VALUES
(1, 'Pavish', '12.11.22.1', '2019-10-31 02:31:47', '2019-10-31 02:31:47'),
(2, 'Pavish12', '12.11.23.1', '2019-10-31 02:32:59', '2019-10-31 02:32:59'),
(3, 'Pavish22', '14.11.22.1', '2019-10-31 03:10:12', '2019-10-31 03:10:12'),
(5, 'Kumar', '13.18.22.11', '2019-10-31 07:49:07', '2019-10-31 07:49:07');

-- --------------------------------------------------------

--
-- Table structure for table `employeewebhistory`
--

CREATE TABLE `employeewebhistory` (
  `id` int(10) UNSIGNED NOT NULL,
  `employee_id` int(10) UNSIGNED NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `employeewebhistory`
--

INSERT INTO `employeewebhistory` (`id`, `employee_id`, `url`, `created_at`, `updated_at`) VALUES
(2, 2, 'http://www.google.com', '2019-10-31 05:41:30', '2019-10-31 05:41:30'),
(4, 2, 'http://www.google.com', '2019-10-31 05:42:03', '2019-10-31 05:42:03'),
(6, 2, 'http://www.google.com', '2019-10-31 05:43:32', '2019-10-31 05:43:32'),
(8, 2, 'http://www.google.com', '2019-10-31 05:45:21', '2019-10-31 05:45:21'),
(10, 2, 'http://www.google.com', '2019-10-31 05:45:49', '2019-10-31 05:45:49'),
(12, 2, 'http://www.google.com', '2019-10-31 05:46:44', '2019-10-31 05:46:44'),
(14, 2, 'http://www.google.com', '2019-10-31 05:47:40', '2019-10-31 05:47:40'),
(16, 2, 'http://www.google.com', '2019-10-31 05:49:51', '2019-10-31 05:49:51'),
(18, 2, 'http://www.google.com', '2019-10-31 05:50:57', '2019-10-31 05:50:57'),
(20, 2, 'http://www.google.com', '2019-10-31 05:51:15', '2019-10-31 05:51:15'),
(22, 2, 'http://www.google.com', '2019-10-31 05:52:11', '2019-10-31 05:52:11'),
(24, 5, 'http://facebook.com', '2019-10-31 08:58:58', '2019-10-31 08:58:58');

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
(13, '2014_10_12_000000_create_users_table', 1),
(14, '2014_10_12_100000_create_password_resets_table', 1),
(15, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
(16, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
(17, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
(18, '2016_06_01_000004_create_oauth_clients_table', 1),
(19, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
(20, '2019_10_31_055720_create_employees_table', 1),
(21, '2019_10_31_061142_create_employeewebhistory_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `client_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('11dd01ac4ca25c27edf218c1a5e79c5ff2043846ec7e980aebdafde16c8b67a6ec524a58ad8e7e8f', 6, 1, 'EmployeeApp', '[]', 0, '2019-10-31 07:51:06', '2019-10-31 07:51:06', '2020-10-31 13:21:06'),
('2946a278c568a50d5890862c1886257ecbab917243ad65185b6e0ae506bd6ffb91c52a2b3e0a0479', 7, 1, 'EmployeeApp', '[]', 0, '2019-10-31 08:01:06', '2019-10-31 08:01:06', '2020-10-31 13:31:06'),
('600266f653c0a484d551e8d71589d10aea2b4e02b04ee40cc7d10243476153bac949ec4ee6b64490', 9, 1, 'EmployeeApp', '[]', 0, '2019-10-31 08:38:22', '2019-10-31 08:38:22', '2020-10-31 14:08:22'),
('7ebfb33cf9b7c95ab4ac27dd09fa6c31795b359cd9c967cd131a5df98f4d4f4bf26fc1238a771570', 8, 1, 'EmployeeApp', '[]', 0, '2019-10-31 08:37:05', '2019-10-31 08:37:05', '2020-10-31 14:07:05'),
('8a31ec26e35055394e9c9f5d00cad32e2674db514bb210ad812a1847e4cd1cea85da327d28f23ca7', 4, 1, 'EmployeeApp', '[]', 0, '2019-10-31 03:14:17', '2019-10-31 03:14:17', '2020-10-31 08:44:17'),
('b6439b02c4b8651e5655512a2eefaaa189c325f9e361452551a3a62f0a88725d30492e4311132563', 5, 1, 'EmployeeApp', '[]', 0, '2019-10-31 07:49:07', '2019-10-31 07:49:07', '2020-10-31 13:19:07');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'EmployeeApp', 'Dd5m2jvOabyEhyBGu4LitMRDYLufsza7WIX1mW4p', 'http://localhost', 1, 0, 0, '2019-10-31 03:13:57', '2019-10-31 03:13:57');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `client_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2019-10-31 03:13:57', '2019-10-31 03:13:57');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employeewebhistory`
--
ALTER TABLE `employeewebhistory`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employeewebhistory_employee_id_foreign` (`employee_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_personal_access_clients_client_id_index` (`client_id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

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
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `employeewebhistory`
--
ALTER TABLE `employeewebhistory`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `employeewebhistory`
--
ALTER TABLE `employeewebhistory`
  ADD CONSTRAINT `employeewebhistory_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
