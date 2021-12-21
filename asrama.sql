-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 10, 2021 at 07:39 AM
-- Server version: 10.1.26-MariaDB
-- PHP Version: 7.1.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `asrama`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id_admin` varchar(50) NOT NULL,
  `nama` varchar(50) DEFAULT NULL,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `role` enum('Admin','Operator') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id_admin`, `nama`, `username`, `password`, `role`) VALUES
('09603593-562a-11ec-979e-a81e849f9379', 'Pemuda Tersesat', 'admin', 'd033e22ae348aeb5660fc2140aec35850c4da997', 'Admin'),
('5f09eb96-5644-11ec-979e-a81e849f9379', 'Noval Kurniawan Ubo', 'Noval Ubo', 'a25bd4653862001016b4b2ab658bca79ec6f719f', 'Operator');

-- --------------------------------------------------------

--
-- Table structure for table `kamar`
--

CREATE TABLE `kamar` (
  `id_kamar` int(11) NOT NULL,
  `tipe_kamar` varchar(100) DEFAULT NULL,
  `fasilitas` varchar(100) DEFAULT NULL,
  `stm_byr` text,
  `id_pemilik` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kamar`
--

INSERT INTO `kamar` (`id_kamar`, `tipe_kamar`, `fasilitas`, `stm_byr`, `id_pemilik`) VALUES
(1, '3 x 4', 'Kamar Mandi Dalam', 'Rek. 0192-01-157241-50-6', 1),
(3, '4 x 4', 'Kamar Mandi Dalam & Kipas Angin', 'Rek. 0217-01-057888-50-9', 3),
(4, '4 x 5', 'Penjaga Kos & Parkiran', 'Rek. 0192-01-0352-4453-9', 4),
(5, '5 x 5', 'Alat Makan & Alat Pembersih', 'Rek. 0183-01-083243-40-7', 5),
(6, '5 x 6', 'Clening Services Dari Japannese', 'Rek. 0174-01-182714-30-2', 6);

-- --------------------------------------------------------

--
-- Table structure for table `pemilik`
--

CREATE TABLE `pemilik` (
  `id_pemilik` int(11) NOT NULL,
  `nama_pemilik` varchar(50) DEFAULT NULL,
  `alamat` text,
  `foto_kos` text,
  `biaya` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pemilik`
--

INSERT INTO `pemilik` (`id_pemilik`, `nama_pemilik`, `alamat`, `foto_kos`, `biaya`) VALUES
(1, 'Helmi Adam', 'Lorong Salangga', 'images.jpeg', 'Rp. 470.000,00/bulan'),
(3, 'Muh. Amal Anugra S.', 'Lorong Pelangi', 'images (1).jpeg', 'Rp 520.000,00/bulan'),
(4, 'Muamar Amnan', 'Jalan Lumba - Lumba', 'images (2).jpeg', 'Rp 580.000,00/bulan'),
(5, 'Ahdar Al Murad', 'Jalan Kelapa', 'images (3).jpeg', 'Rp 400.000,00/bulan'),
(6, 'Musdiman Syahrul', 'Jalan Lumba - Lumba', 'images (4).jpeg', 'Rp 350.000,00/bulan');

-- --------------------------------------------------------

--
-- Table structure for table `penyewa`
--

CREATE TABLE `penyewa` (
  `no_ktp` varchar(100) NOT NULL,
  `nama` varchar(50) DEFAULT NULL,
  `no_hp` varchar(15) DEFAULT NULL,
  `kesanggupan_membayar` enum('Cash','Cicil') DEFAULT NULL,
  `peraturan_kos` text,
  `id_kamar` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id_admin`);

--
-- Indexes for table `kamar`
--
ALTER TABLE `kamar`
  ADD PRIMARY KEY (`id_kamar`),
  ADD KEY `id_pemilik` (`id_pemilik`);

--
-- Indexes for table `pemilik`
--
ALTER TABLE `pemilik`
  ADD PRIMARY KEY (`id_pemilik`);

--
-- Indexes for table `penyewa`
--
ALTER TABLE `penyewa`
  ADD PRIMARY KEY (`no_ktp`),
  ADD KEY `id_kamar` (`id_kamar`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `kamar`
--
ALTER TABLE `kamar`
  MODIFY `id_kamar` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `pemilik`
--
ALTER TABLE `pemilik`
  MODIFY `id_pemilik` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `kamar`
--
ALTER TABLE `kamar`
  ADD CONSTRAINT `kamar_ibfk_1` FOREIGN KEY (`id_pemilik`) REFERENCES `pemilik` (`id_pemilik`);

--
-- Constraints for table `penyewa`
--
ALTER TABLE `penyewa`
  ADD CONSTRAINT `penyewa_ibfk_1` FOREIGN KEY (`id_kamar`) REFERENCES `kamar` (`id_kamar`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
