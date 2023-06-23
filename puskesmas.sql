-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 23, 2023 at 04:26 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `puskesmas`
--

-- --------------------------------------------------------

--
-- Table structure for table `dokter`
--

CREATE TABLE `dokter` (
  `id` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `nip` varchar(255) NOT NULL,
  `jabatan` varchar(255) NOT NULL,
  `image` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `dokter`
--

INSERT INTO `dokter` (`id`, `nama`, `nip`, `jabatan`, `image`, `created_at`, `updated_at`) VALUES
(6, 'Maulana', '123', 'Doktter', '1641685791.png', '2023-06-18 10:20:48', '2023-06-18 12:02:59');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hasil_sdq`
--

CREATE TABLE `hasil_sdq` (
  `id` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `instansi` varchar(255) NOT NULL,
  `total_kesulitan` varchar(255) NOT NULL,
  `hasil_e` varchar(255) NOT NULL,
  `hasil_c` varchar(255) NOT NULL,
  `hasil_h` varchar(255) NOT NULL,
  `hasil_p` varchar(255) NOT NULL,
  `hasil_pro` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `hasil_sdq`
--

INSERT INTO `hasil_sdq` (`id`, `nama`, `instansi`, `total_kesulitan`, `hasil_e`, `hasil_c`, `hasil_h`, `hasil_p`, `hasil_pro`, `created_at`, `updated_at`) VALUES
(12, 'FARKHAN', 'POLINDRA', 'ABNORMAL', 'ABNORMAL', 'NORMAL', 'NORMAL', 'NORMAL', 'NORMAL', '2023-06-01 11:26:17', '2023-06-01 11:26:17'),
(14, 'ISA', 'POLINDRA', 'ABNORMAL', 'NORMAL', 'ABNORMAL', 'NORMAL', 'ABNORMAL', 'BORDERLINE / AMBANG', '2023-06-10 01:33:30', '2023-06-10 01:33:30'),
(15, 'LANA', 'SMK PGRI JATIBARANG', 'ABNORMAL', 'BORDERLINE / AMBANG', 'ABNORMAL', 'ABNORMAL', 'ABNORMAL', 'ABNORMAL', '2023-06-10 01:39:17', '2023-06-10 01:39:17'),
(16, 'RAGIL', 'SMP PUI', 'ABNORMAL', 'NORMAL', 'ABNORMAL', 'NORMAL', 'ABNORMAL', 'BORDERLINE / AMBANG', '2023-06-10 05:08:46', '2023-06-10 05:08:46');

-- --------------------------------------------------------

--
-- Table structure for table `hasil_srq`
--

CREATE TABLE `hasil_srq` (
  `id` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `umur` varchar(255) NOT NULL,
  `no_hp` varchar(255) NOT NULL,
  `alamat` varchar(255) NOT NULL,
  `pekerjaan` varchar(255) NOT NULL,
  `hasil` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `hasil_srq`
--

INSERT INTO `hasil_srq` (`id`, `nama`, `umur`, `no_hp`, `alamat`, `pekerjaan`, `hasil`, `created_at`, `updated_at`) VALUES
(3, 'MAUALANA', '12', '0895642', 'JATIBARANG', 'KERJA', 'NORMAL', '2023-06-01 20:58:46', '2023-06-01 20:58:46'),
(4, 'FARKHAN', '21', '0895683754', 'BEKASI', 'KULIAH', 'NORMAL', '2023-06-01 20:59:56', '2023-06-01 20:59:56'),
(5, 'MAULANA', '11', '089098897', 'JATIBARANG', 'KULIAH', 'NORMAL', '2023-06-10 06:25:03', '2023-06-10 06:25:03'),
(6, 'MAULANA', '11', '089098897', 'JATIBARANG', 'KULIAH', 'NORMAL', '2023-06-10 06:26:32', '2023-06-10 06:26:32'),
(7, 'RAGIL', '11', '089098987', 'JATIBARANG', 'MAHASISWA', 'ABNORMAL', '2023-06-10 06:28:57', '2023-06-10 06:28:57');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 1, 'auth_token', 'f0a086d6c6964c7ca1ec64c241372eee8c863a2b35d7e50ecb5d0640a0cc6e70', '[\"*\"]', NULL, NULL, '2023-05-16 05:17:18', '2023-05-16 05:17:18'),
(2, 'App\\Models\\User', 2, 'auth_token', 'b74fdf1b977f91451a663188ae5124c6bcf2ec92f238ea9e741cde7b854d22b7', '[\"*\"]', NULL, NULL, '2023-05-16 08:35:20', '2023-05-16 08:35:20');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `role`, `created_at`, `updated_at`) VALUES
(1, 'syafira ndh', 'admin@admin.com', NULL, '$2y$10$FzsesU/rLxt7tUrtWWfOSeoAYApczk95R.UIIGPZXoFWblOXm.daC', NULL, 'admin', '2023-05-16 05:17:18', '2023-06-10 08:53:48'),
(2, 'Maulana', 'maulana@gmail.com', NULL, '$2y$10$pdvBGPwcwmsOIqxj9Zl7VukAOdSGDWUANvWJy91pa0Gxn1kPNFuYe', NULL, 'admin', '2023-05-16 08:35:20', '2023-05-16 08:35:20'),
(9, 'lana', 'lana@lana.com', NULL, '$2y$10$tyqpXiEOx1I5VzPYfuuTU.0Vp/R85qDsDt6pbYWhESJxzubyHf0tG', NULL, 'pasien', '2023-05-23 05:39:47', '2023-05-23 05:39:47'),
(10, 'syafirandh', 'firand@gmail.com', NULL, '$2y$10$UAl7UF24JIVIkeqamZvHve8CFwvSEHk8T8tTxM8rKJOz1WyCGsHbm', NULL, 'pasien', '2023-05-24 22:09:41', '2023-05-24 22:09:41'),
(11, 'firrza', 'firrza@gmail.com', NULL, '$2y$10$Z8k1LrwBDXrwsxMO0JO0muOnHCgaQfhVuzM97eOIaaumjxVbp2Yp2', NULL, 'pasien', '2023-05-26 02:08:54', '2023-05-26 02:08:54');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `dokter`
--
ALTER TABLE `dokter`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `hasil_sdq`
--
ALTER TABLE `hasil_sdq`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hasil_srq`
--
ALTER TABLE `hasil_srq`
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
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `dokter`
--
ALTER TABLE `dokter`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hasil_sdq`
--
ALTER TABLE `hasil_sdq`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `hasil_srq`
--
ALTER TABLE `hasil_srq`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
