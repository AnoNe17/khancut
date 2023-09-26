-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 17, 2023 at 04:33 PM
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
(6, 'Maulana', '123', 'Doktter', '1641685791.png', '2023-06-18 10:20:48', '2023-06-18 12:02:59'),
(7, 'farkhhan', '123', 'dokter', '1230399211.jpg', '2023-06-23 08:49:19', '2023-06-23 08:49:19');

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
  `skor_kesulitan` varchar(11) NOT NULL,
  `hasil_kesulitan` varchar(255) NOT NULL,
  `skor_e` varchar(11) NOT NULL,
  `hasil_e` varchar(255) NOT NULL,
  `keterangan_e` text NOT NULL,
  `skor_c` varchar(11) NOT NULL,
  `hasil_c` varchar(255) NOT NULL,
  `keterangan_c` text NOT NULL,
  `skor_h` varchar(11) NOT NULL,
  `hasil_h` varchar(255) NOT NULL,
  `keterangan_h` text NOT NULL,
  `skor_p` varchar(11) NOT NULL,
  `hasil_p` varchar(255) NOT NULL,
  `keterangan_p` text NOT NULL,
  `skor_pro` varchar(11) NOT NULL,
  `hasil_pro` varchar(255) NOT NULL,
  `keterangan_pro` text NOT NULL,
  `skor_keseluruhan` varchar(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `hasil_sdq`
--

INSERT INTO `hasil_sdq` (`id`, `nama`, `instansi`, `skor_kesulitan`, `hasil_kesulitan`, `skor_e`, `hasil_e`, `keterangan_e`, `skor_c`, `hasil_c`, `keterangan_c`, `skor_h`, `hasil_h`, `keterangan_h`, `skor_p`, `hasil_p`, `keterangan_p`, `skor_pro`, `hasil_pro`, `keterangan_pro`, `skor_keseluruhan`, `user_id`, `created_at`, `updated_at`) VALUES
(24, 'LANA', 'POLINDRA', '30', 'NORMAL', '10', 'ABNORMAL', '1. Sering mengeluh sakit badan ( seperti sakit kepala )<br>2. Banyak kekhawatiran<br>3. Sering tidak bahagia, menangis<br>4. Gugup atau mudah hilang percaya diri<br>5. Mudah takut', '8', 'ABNORMAL', '1. Sering marah meledak-ledak<br>2. Umunya berprilaku tidak baik, tidak melakukan apa yang diminta orang dewasa<br>3. Sering berkelahi<br>4. Sering berbohong, curang<br>5. Mencuri', '6', 'BORDERLINE / AMBANG', '1.	Gelisah, terlalu aktif, tidak dapat diam lama.<br>2. Terus bergerak dengan resah.<br>3. Mudah teralih, konsentrasi buyar.<br>4. Tidak berpikir sebelum bertindak<br>5. Tidak mampu menyelesaikan tugas sampai selesai.', '6', 'ABNORMAL', '1.	Cenderung menyendiri, lebih senang main sendiri.<br>2. Tidak punya 1 teman baik.<br>3. Tidak disukai anak-anak lain.<br>4.	Diganggu/digerak oleh anak lain.<br>5. Bergaul lebih baik dengan orang dewasa dari pada anak-anak', '10', 'ABNORMAL', '1. Mampu mempertimbangkan perasaan orang lain.<br>2.	Bersedia berbagi dengan anak lain. - Suka Menolong.<br>3. Bersikap baik pada anak yang lebih muda.<br>4. Sering menawarkan diri membantu orang lain.', '40', NULL, '2023-07-16 07:51:25', '2023-07-16 07:51:25'),
(25, 'ADAM', 'SMK CIREBON', '22', 'NORMAL', '6', 'BORDERLINE / AMBANG', '1. Sering mengeluh sakit badan ( seperti sakit kepala )<br>2. Banyak kekhawatiran<br>3. Sering tidak bahagia, menangis<br>4. Gugup atau mudah hilang percaya diri<br>5. Mudah takut', '5', 'ABNORMAL', '1. Sering marah meledak-ledak<br>2. Umunya berprilaku tidak baik, tidak melakukan apa yang diminta orang dewasa<br>3. Sering berkelahi<br>4. Sering berbohong, curang<br>5. Mencuri', '6', 'BORDERLINE / AMBANG', '1.	Gelisah, terlalu aktif, tidak dapat diam lama.<br>2. Terus bergerak dengan resah.<br>3. Mudah teralih, konsentrasi buyar.<br>4. Tidak berpikir sebelum bertindak<br>5. Tidak mampu menyelesaikan tugas sampai selesai.', '5', 'ABNORMAL', '1.	Cenderung menyendiri, lebih senang main sendiri.<br>2. Tidak punya 1 teman baik.<br>3. Tidak disukai anak-anak lain.<br>4.	Diganggu/digerak oleh anak lain.<br>5. Bergaul lebih baik dengan orang dewasa dari pada anak-anak', '4', 'NORMAL', '1. Tidak Dapat menjaga perasaan orang lain<br>2. Cuek<br>3. Tidak suka membantu dengan orang lain / cuek<br>4. Memliki sikap yang tidak baik', '26', NULL, '2023-07-16 08:12:27', '2023-07-16 08:12:27');

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
  `total` varchar(11) NOT NULL,
  `hasil` varchar(255) NOT NULL,
  `masalah_psikologis` enum('ya','tidak') NOT NULL,
  `pengguna_narkoba` enum('ya','tidak') NOT NULL,
  `gangguan_psikotik` enum('ya','tidak') NOT NULL,
  `gangguan_ptsd` enum('ya','tidak') NOT NULL,
  `keterangan` text NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `hasil_srq`
--

INSERT INTO `hasil_srq` (`id`, `nama`, `umur`, `no_hp`, `alamat`, `pekerjaan`, `total`, `hasil`, `masalah_psikologis`, `pengguna_narkoba`, `gangguan_psikotik`, `gangguan_ptsd`, `keterangan`, `user_id`, `created_at`, `updated_at`) VALUES
(24, 'FARKHAN', '12', '98709809', 'BEKASI', 'MAHASISWA', '20', 'ABNORMAL', 'ya', 'tidak', 'ya', 'tidak', '- Terdapat masalah psikologis seperti cemas dan depresi<br>- Terdapat gejala gangguan psikotik (gangguan dalam penilaian realitas) yang perlu penanganan serius<br>', 0, '2023-07-05 00:19:26', '2023-07-05 00:19:26'),
(28, 'MAULANA', '12', '98709809', 'JATIBARANG', 'MAHASISWA', '27', 'ABNORMAL', 'tidak', 'ya', 'ya', 'tidak', '- Terdapat penggunaan zat psikoaktif/narkoba<br>- Terdapat gejala gangguan psikotik (gangguan dalam penilaian realitas) yang perlu penanganan serius<br>', 0, '2023-07-05 00:26:25', '2023-07-05 00:26:25'),
(29, 'SYAFIRA', '22', '0889787876876', 'INDRAMAYU', 'MAHASISWA', '21', 'ABNORMAL', 'ya', 'ya', 'ya', 'ya', '- Terdapat masalah psikologis seperti cemas dan depresi<br>- Terdapat penggunaan zat psikoaktif/narkoba<br>- Terdapat gejala gangguan psikotik (gangguan dalam penilaian realitas) yang perlu penanganan serius<br>- Terdapat gejala-gejala gangguan  PTSD (Post Traumatic Stress Disorder) / gangguan stres setelah trauma<br>', NULL, '2023-07-06 21:11:04', '2023-07-06 21:11:04'),
(30, 'SAFIRA', '23', '089787987', 'INDRAMAYU', 'MAHASISWA', '25', 'ABNORMAL', 'tidak', 'tidak', 'ya', 'tidak', '- Terdapat gejala gangguan psikotik (gangguan dalam penilaian realitas) yang perlu penanganan serius<br>', NULL, '2023-07-06 21:12:29', '2023-07-06 21:12:29'),
(33, 'ASD', '23', '08989787', 'INDRAMAYU', 'MAHASISWA', '29', 'ABNORMAL', 'tidak', 'tidak', 'ya', 'tidak', '- Terdapat gejala gangguan psikotik (gangguan dalam penilaian realitas) yang perlu penanganan serius<br>', NULL, '2023-07-06 21:29:00', '2023-07-06 21:29:00'),
(42, 'NANA', '23', '78654399', 'INDRAMAYU', 'MAHASISWA', '14', 'ABNORMAL', 'ya', 'tidak', 'ya', 'ya', '- Terdapat masalah psikologis seperti cemas dan depresi<br>- Terdapat gejala gangguan psikotik (gangguan dalam penilaian realitas) yang perlu penanganan serius<br>- Terdapat gejala-gejala gangguan  PTSD (Post Traumatic Stress Disorder) / gangguan stres setelah trauma<br>', NULL, '2023-07-07 00:00:06', '2023-07-07 00:00:06');

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
-- Table structure for table `notifikasi`
--

CREATE TABLE `notifikasi` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `kategori` varchar(255) NOT NULL,
  `tanggal` date DEFAULT NULL,
  `isi` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `notifikasi`
--

INSERT INTO `notifikasi` (`id`, `user_id`, `kategori`, `tanggal`, `isi`, `created_at`, `updated_at`) VALUES
(4, 23, 'Kategori', '2023-07-28', 'isi notifikasi', '2023-07-16 03:47:40', '2023-07-16 03:47:40');

-- --------------------------------------------------------

--
-- Table structure for table `pasien`
--

CREATE TABLE `pasien` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `umur` varchar(255) NOT NULL,
  `instansi` varchar(255) NOT NULL,
  `no_hp` varchar(255) NOT NULL,
  `alamat` varchar(255) NOT NULL,
  `pekerjaan` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pasien`
--

INSERT INTO `pasien` (`id`, `user_id`, `nama`, `umur`, `instansi`, `no_hp`, `alamat`, `pekerjaan`, `created_at`, `updated_at`) VALUES
(1, 23, 'Lana', '12', 'Polindrar', '089098', 'Jatibarang', 'Mahasiswa', '2023-07-07 23:04:46', '2023-07-07 23:04:46'),
(2, 24, 'asd', '12', 'polindra', '98709809', 'Jatibarang', 'Mahasiswa', '2023-07-07 23:10:24', '2023-07-07 23:10:24');

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
(2, 'App\\Models\\User', 2, 'auth_token', 'b74fdf1b977f91451a663188ae5124c6bcf2ec92f238ea9e741cde7b854d22b7', '[\"*\"]', NULL, NULL, '2023-05-16 08:35:20', '2023-05-16 08:35:20'),
(3, 'App\\Models\\User', 14, 'auth_token', '0d100742a5fe611e87c212a1d2d1dd3062a152be69c4cbcd1c5aac8c45e04ec6', '[\"*\"]', NULL, NULL, '2023-07-05 06:34:27', '2023-07-05 06:34:27'),
(4, 'App\\Models\\User', 14, 'auth_token', '37fdcbda031f85b2b70109a56d8219f4908a388d8f242ae0aa14986aeca8bdc8', '[\"*\"]', NULL, NULL, '2023-07-05 06:40:08', '2023-07-05 06:40:08'),
(5, 'App\\Models\\User', 14, 'auth_token', '76badc45a26897bfcd43a5dd04edc01a23cf0b356293ea201120052918b2f429', '[\"*\"]', NULL, NULL, '2023-07-05 09:25:19', '2023-07-05 09:25:19'),
(6, 'App\\Models\\User', 14, 'auth_token', 'fbf55fd1466e310648297a666999065f2888c1dcc3a638f61e4fcc1e012164c0', '[\"*\"]', NULL, NULL, '2023-07-05 09:26:07', '2023-07-05 09:26:07'),
(7, 'App\\Models\\User', 23, 'auth_token', '9407feb5b43b3bea96a4bd8fdf6f0884d3b6d951fc943bea641dbc05b43eb353', '[\"*\"]', NULL, NULL, '2023-07-07 23:05:13', '2023-07-07 23:05:13'),
(8, 'App\\Models\\User', 23, 'auth_token', '49a1506b2aecba6586ae806907196edf6825483a251fc2513e6ce46c0fbe2e41', '[\"*\"]', NULL, NULL, '2023-07-17 07:05:51', '2023-07-17 07:05:51');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL,
  `verif_code` varchar(255) DEFAULT NULL,
  `status_verif` enum('true','false') DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `role`, `verif_code`, `status_verif`, `created_at`, `updated_at`) VALUES
(1, 'syafira ndh', 'admin@admin.com', NULL, '$2y$10$FzsesU/rLxt7tUrtWWfOSeoAYApczk95R.UIIGPZXoFWblOXm.daC', NULL, 'admin', NULL, 'true', '2023-05-16 05:17:18', '2023-06-10 08:53:48'),
(2, 'Maulana', 'maulana@gmail.com', NULL, '$2y$10$pdvBGPwcwmsOIqxj9Zl7VukAOdSGDWUANvWJy91pa0Gxn1kPNFuYe', NULL, 'admin', NULL, 'true', '2023-05-16 08:35:20', '2023-05-16 08:35:20'),
(10, 'syafirandh', 'firand@gmail.com', NULL, '$2y$10$UAl7UF24JIVIkeqamZvHve8CFwvSEHk8T8tTxM8rKJOz1WyCGsHbm', NULL, 'pasien', NULL, 'true', '2023-05-24 22:09:41', '2023-05-24 22:09:41'),
(11, 'firrza', 'firrza@gmail.com', NULL, '$2y$10$Z8k1LrwBDXrwsxMO0JO0muOnHCgaQfhVuzM97eOIaaumjxVbp2Yp2', NULL, 'pasien', NULL, 'true', '2023-05-26 02:08:54', '2023-05-26 02:08:54'),
(14, 'lana', 'lana@lana.com', NULL, '$2y$10$5p4kOxKibFHkqMFKQsJ/0.tDcVg.xVh/WTX5XYvEnLd1wciQgvfkC', NULL, 'pasien', NULL, 'true', '2023-07-05 06:33:26', '2023-07-05 06:33:26'),
(23, 'empus202315', NULL, NULL, '$2y$10$xx/BTH/cKpk.RUDOk6uhZOFDCPhOiT1e5MajEKurmS8UoADQheseK', NULL, 'pasien', 'empus202315', 'true', '2023-07-07 22:18:54', '2023-07-07 23:04:46'),
(24, 'empus202324', NULL, NULL, '@empus202324', NULL, 'pasien', 'empus202324', 'true', '2023-07-07 23:10:24', '2023-07-07 23:10:24'),
(25, 'empus202325', NULL, NULL, '@empus202325', NULL, 'pasien', 'empus202325', 'true', '2023-07-07 23:17:50', '2023-07-07 23:17:50');

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
-- Indexes for table `notifikasi`
--
ALTER TABLE `notifikasi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pasien`
--
ALTER TABLE `pasien`
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hasil_sdq`
--
ALTER TABLE `hasil_sdq`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `hasil_srq`
--
ALTER TABLE `hasil_srq`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `notifikasi`
--
ALTER TABLE `notifikasi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `pasien`
--
ALTER TABLE `pasien`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
