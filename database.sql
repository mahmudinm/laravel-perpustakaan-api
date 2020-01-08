-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.1.39-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             9.2.0.4947
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping database structure for laravel-react-perpustakaan-api
CREATE DATABASE IF NOT EXISTS `laravel-react-perpustakaan-api` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `laravel-react-perpustakaan-api`;


-- Dumping structure for table laravel-react-perpustakaan-api.books
CREATE TABLE IF NOT EXISTS `books` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `penerbit` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `tanggal_terbit` date NOT NULL,
  `stock` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table laravel-react-perpustakaan-api.books: ~4 rows (approximately)
/*!40000 ALTER TABLE `books` DISABLE KEYS */;
INSERT INTO `books` (`id`, `name`, `description`, `penerbit`, `tanggal_terbit`, `stock`, `created_at`, `updated_at`) VALUES
	(6, 'Bahasa Inggris ujpdate\n', 'asdasd', 'penerbit a', '2019-12-24', 17, '2019-12-24 06:51:56', '2020-01-08 06:46:43'),
	(7, 'asdasd', 'asdasda', 'asd', '2019-12-26', 118, '2020-01-01 07:10:19', '2020-01-08 06:44:45'),
	(10, 'Works', 'asdasda', 'ok', '2020-01-30', 11, '2020-01-01 07:32:28', '2020-01-06 08:28:01'),
	(14, 'work on it updated', 'descprition in here', 'asd', '2020-01-06', 20, '2020-01-06 08:02:01', '2020-01-06 08:02:16');
/*!40000 ALTER TABLE `books` ENABLE KEYS */;


-- Dumping structure for table laravel-react-perpustakaan-api.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table laravel-react-perpustakaan-api.migrations: ~2 rows (approximately)
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '2014_10_12_000000_create_users_table', 1),
	(2, '2014_10_12_100000_create_password_resets_table', 1),
	(3, '2019_12_23_074435_create_books_table', 1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;


-- Dumping structure for table laravel-react-perpustakaan-api.password_resets
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`),
  KEY `password_resets_token_index` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table laravel-react-perpustakaan-api.password_resets: ~0 rows (approximately)
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;


-- Dumping structure for table laravel-react-perpustakaan-api.peminjaman
CREATE TABLE IF NOT EXISTS `peminjaman` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `book_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `tgl_pinjam` date NOT NULL,
  `tgl_kembali` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table laravel-react-perpustakaan-api.peminjaman: ~4 rows (approximately)
/*!40000 ALTER TABLE `peminjaman` DISABLE KEYS */;
INSERT INTO `peminjaman` (`id`, `book_id`, `user_id`, `tgl_pinjam`, `tgl_kembali`) VALUES
	(3, 7, 5, '2020-01-08', '2020-01-07'),
	(4, 7, 5, '2020-01-08', '2020-01-01'),
	(5, 7, 2, '2020-01-08', '2020-01-25'),
	(6, 6, 2, '2020-01-08', '2020-01-15');
/*!40000 ALTER TABLE `peminjaman` ENABLE KEYS */;


-- Dumping structure for table laravel-react-perpustakaan-api.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table laravel-react-perpustakaan-api.users: ~3 rows (approximately)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `name`, `email`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
	(2, 'admin', 'admin@email.com', '$2y$10$EIB9cVknlyTe2/EzYerVVumSiRX3V.pnHx4iGCRULI.HXBYOknegu', NULL, '2019-12-24 08:23:46', '2019-12-24 08:23:46'),
	(5, 'English', 'asd@email.com', NULL, NULL, '2020-01-06 08:54:06', '2020-01-06 08:54:06'),
	(6, 'Works', 'works@email.com', NULL, NULL, '2020-01-06 08:54:53', '2020-01-06 08:54:53');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
