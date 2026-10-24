-- Struktur database Tugas Akhir dengan data contoh (fiktif).
-- Akun admin contoh: admin@example.com / admin123 (ganti sebelum dipakai sungguhan).

CREATE DATABASE IF NOT EXISTS `tugasakhir` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `tugasakhir`;

-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tugasakhir`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `admin_ID` char(2) NOT NULL,
  `admin_USER` char(30) NOT NULL,
  `admin_PASS` char(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bimbinganskripsi`
--

CREATE TABLE `bimbinganskripsi` (
  `dosen_NIDN` char(10) NOT NULL,
  `mhs_NPM` int(9) NOT NULL,
  `bimbingan_TGL` date NOT NULL,
  `bimbingan_ISI` text NOT NULL,
  `bimbingan_DOKUMEN` char(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dosen`
--

CREATE TABLE `dosen` (
  `dosen_NIDN` char(10) NOT NULL,
  `dosen_NIK` char(8) NOT NULL,
  `dosen_Nama` char(30) NOT NULL,
  `dosen_Ket` varchar(160) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jurnal`
--

CREATE TABLE `jurnal` (
  `jurnal_ID` int(10) NOT NULL,
  `jurnal_Nama` varchar(100) NOT NULL,
  `jurnal_ISSN` int(10) NOT NULL,
  `jurnal_SINTA` char(2) NOT NULL,
  `jurnal_URL` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE `kategori` (
  `kategori_ID` int(10) NOT NULL,
  `kategori_Nama` varchar(50) NOT NULL,
  `kategori_Metode` varchar(20) NOT NULL,
  `kategori_KET` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mahasiswa`
--

CREATE TABLE `mahasiswa` (
  `mhs_NPM` int(9) NOT NULL,
  `mhs_Nama` char(40) NOT NULL,
  `mhs_Alamat` varchar(100) NOT NULL,
  `mhs_DOB` date NOT NULL,
  `mhs_Ket` varchar(120) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `penasihat`
--

CREATE TABLE `penasihat` (
  `mhs_NPM` int(9) NOT NULL,
  `dosen_NIDN` char(10) NOT NULL,
  `penasihat_FILE` char(60) NOT NULL,
  `penasihat_KET` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pesertaskripsi`
--

CREATE TABLE `pesertaskripsi` (
  `mhs_NPM` int(9) NOT NULL,
  `peserta_SMT` char(6) NOT NULL,
  `peserta_THAKD` char(9) NOT NULL,
  `peserta_TGLDAFTAR` date NOT NULL,
  `peserta_JUDUL` char(80) NOT NULL,
  `peserta_KET` mediumtext NOT NULL,
  `peserta_DOKUMEN` char(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `skripsi`
--

CREATE TABLE `skripsi` (
  `publikasi_ID` int(10) NOT NULL,
  `mhs_NPM` int(9) NOT NULL,
  `kategori_ID` int(10) NOT NULL,
  `jurnal_ID` int(10) NOT NULL,
  `publikasi_JUDUL` varchar(50) NOT NULL,
  `publikasi_DATE` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ujianskripsi`
--

CREATE TABLE `ujianskripsi` (
  `mhs_NPM` int(9) NOT NULL,
  `ujian_TGL` date NOT NULL,
  `ujian_JAM` time NOT NULL,
  `ujian_FOTO` char(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Data contoh (fiktif)
--

INSERT INTO `admin` (`admin_ID`, `admin_USER`, `admin_PASS`) VALUES
('11', 'admin@example.com', 'admin123');

INSERT INTO `dosen` (`dosen_NIDN`, `dosen_NIK`, `dosen_Nama`, `dosen_Ket`) VALUES
('10010001', '31720001', 'Dosen Contoh Satu', 'S2 Universitas Contoh'),
('10010002', '31720002', 'Dosen Contoh Dua', 'S3 Universitas Contoh'),
('10010003', '31720003', 'Dosen Contoh Tiga', 'S2 Institut Contoh');

INSERT INTO `mahasiswa` (`mhs_NPM`, `mhs_Nama`, `mhs_Alamat`, `mhs_DOB`, `mhs_Ket`) VALUES
(100000001, 'Mahasiswa Contoh Satu', 'Jl. Contoh No. 1, Jakarta', '2002-01-01', 'Mahasiswa contoh'),
(100000002, 'Mahasiswa Contoh Dua', 'Jl. Contoh No. 2, Jakarta', '2002-02-02', 'Mahasiswa berprestasi'),
(100000003, 'Mahasiswa Contoh Tiga', 'Jl. Contoh No. 3, Jakarta', '2002-03-03', 'Mahasiswa contoh');

INSERT INTO `jurnal` (`jurnal_ID`, `jurnal_Nama`, `jurnal_ISSN`, `jurnal_SINTA`, `jurnal_URL`) VALUES
(1001, 'Jurnal Contoh Teknologi Informasi', 12345678, 'S2', 'https://example.com/jurnal-1'),
(1002, 'Jurnal Contoh Sistem Informasi', 23456789, 'S3', 'https://example.com/jurnal-2'),
(1003, 'Jurnal Contoh Rekayasa Perangkat Lunak', 34567890, 'S4', 'https://example.com/jurnal-3');

INSERT INTO `kategori` (`kategori_ID`, `kategori_Nama`, `kategori_Metode`, `kategori_KET`) VALUES
(1, 'Internasional', 'Kuantitatif', 'Contoh kategori publikasi internasional'),
(2, 'Nasional', 'Kualitatif', 'Contoh kategori publikasi nasional'),
(3, 'Internasional Bereputasi', 'Campuran', 'Contoh kategori publikasi internasional bereputasi');

INSERT INTO `penasihat` (`mhs_NPM`, `dosen_NIDN`, `penasihat_FILE`, `penasihat_KET`) VALUES
(100000001, '10010001', 'contoh.jpg', 'Mahasiswa semester 8'),
(100000002, '10010002', 'contoh.jpg', 'Mahasiswa semester 7'),
(100000003, '10010003', 'contoh.jpg', 'Mahasiswa semester 8');

INSERT INTO `pesertaskripsi` (`mhs_NPM`, `peserta_SMT`, `peserta_THAKD`, `peserta_TGLDAFTAR`, `peserta_JUDUL`, `peserta_KET`, `peserta_DOKUMEN`) VALUES
(100000001, 'Ganjil', '2024-2025', '2025-09-01', 'Contoh Judul Skripsi Satu', 'Keterangan contoh', 'contoh.png'),
(100000002, 'Ganjil', '2024-2025', '2025-09-02', 'Contoh Judul Skripsi Dua', 'Keterangan contoh', 'contoh.png'),
(100000003, 'Genap', '2024-2025', '2025-09-03', 'Contoh Judul Skripsi Tiga', 'Keterangan contoh', 'contoh.png');

INSERT INTO `bimbinganskripsi` (`dosen_NIDN`, `mhs_NPM`, `bimbingan_TGL`, `bimbingan_ISI`, `bimbingan_DOKUMEN`) VALUES
('10010001', 100000001, '2025-10-01', 'Bimbingan bab 1: latar belakang dan rumusan masalah.', 'nopdf.jpg'),
('10010002', 100000002, '2025-10-02', 'Bimbingan bab 2: tinjauan pustaka.', 'nopdf.jpg'),
('10010003', 100000003, '2025-10-03', 'Bimbingan bab 3: metodologi penelitian.', 'nopdf.jpg');

INSERT INTO `skripsi` (`publikasi_ID`, `mhs_NPM`, `kategori_ID`, `jurnal_ID`, `publikasi_JUDUL`, `publikasi_DATE`) VALUES
(2001, 100000001, 1, 1001, 'Contoh Judul Publikasi Satu', '2025-11-01'),
(2002, 100000002, 2, 1002, 'Contoh Judul Publikasi Dua', '2025-11-02'),
(2003, 100000003, 3, 1003, 'Contoh Judul Publikasi Tiga', '2025-11-03');

INSERT INTO `ujianskripsi` (`mhs_NPM`, `ujian_TGL`, `ujian_JAM`, `ujian_FOTO`) VALUES
(100000001, '2025-12-01', '08:30:00', 'contoh.jpg'),
(100000002, '2025-12-02', '09:00:00', 'contoh.jpg'),
(100000003, '2025-12-03', '13:30:00', 'contoh.jpg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_ID`);

--
-- Indexes for table `dosen`
--
ALTER TABLE `dosen`
  ADD PRIMARY KEY (`dosen_NIDN`);

--
-- Indexes for table `jurnal`
--
ALTER TABLE `jurnal`
  ADD PRIMARY KEY (`jurnal_ID`);

--
-- Indexes for table `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`kategori_ID`);

--
-- Indexes for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD PRIMARY KEY (`mhs_NPM`);

--
-- Indexes for table `pesertaskripsi`
--
ALTER TABLE `pesertaskripsi`
  ADD PRIMARY KEY (`mhs_NPM`);

--
-- Indexes for table `skripsi`
--
ALTER TABLE `skripsi`
  ADD PRIMARY KEY (`publikasi_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
