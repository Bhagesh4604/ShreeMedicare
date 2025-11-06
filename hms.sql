-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 05, 2025 at 10:06 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hms`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts_payable`
--

CREATE TABLE `accounts_payable` (
  `id` int(11) NOT NULL,
  `invoiceNumber` varchar(50) NOT NULL,
  `vendorName` varchar(255) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `dueDate` date NOT NULL,
  `paymentStatus` enum('pending','paid','overdue','partial') DEFAULT 'pending',
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `accounts_payable`
--

INSERT INTO `accounts_payable` (`id`, `invoiceNumber`, `vendorName`, `amount`, `dueDate`, `paymentStatus`, `description`) VALUES
(1, 'INV-AP-001', 'Medical Supplies Co.', 5420.00, '2025-10-15', 'pending', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `accounts_receivable`
--

CREATE TABLE `accounts_receivable` (
  `id` int(11) NOT NULL,
  `invoiceNumber` varchar(50) NOT NULL,
  `patientId` int(11) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `dueDate` date NOT NULL,
  `paymentStatus` enum('pending','paid','overdue','partial') DEFAULT 'pending',
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `accounts_receivable`
--

INSERT INTO `accounts_receivable` (`id`, `invoiceNumber`, `patientId`, `amount`, `dueDate`, `paymentStatus`, `description`) VALUES
(1, 'INV-AR-001', 1, 1200.50, '2025-10-20', 'paid', NULL),
(2, 'INV-5208', 7, 23456.00, '2025-11-04', 'pending', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `username`, `password`) VALUES
(1, 'admin', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `admissions`
--

CREATE TABLE `admissions` (
  `id` int(11) NOT NULL,
  `patientId` int(11) NOT NULL,
  `admissionDate` datetime NOT NULL,
  `dischargeDate` datetime DEFAULT NULL,
  `wardId` int(11) DEFAULT NULL,
  `bedId` int(11) DEFAULT NULL,
  `notes` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admissions`
--

INSERT INTO `admissions` (`id`, `patientId`, `admissionDate`, `dischargeDate`, `wardId`, `bedId`, `notes`) VALUES
(1, 5, '2025-11-01 16:09:09', NULL, 2, 3, 'Assigned to bed'),
(2, 4, '2025-11-01 16:14:08', NULL, 1, 2, 'Assigned to bed'),
(3, 7, '2025-11-03 19:59:27', '2025-11-03 19:59:31', 3, 30, 'Assigned to bed'),
(4, 8, '2025-11-04 00:22:09', NULL, 3, 30, 'Assigned to bed'),
(5, 7, '2025-11-04 00:25:47', NULL, 2, 5, 'Assigned to bed'),
(6, 3, '2025-11-04 02:22:33', NULL, 2, 4, 'Assigned to bed');

-- --------------------------------------------------------

--
-- Table structure for table `appointments`
--

CREATE TABLE `appointments` (
  `id` int(11) NOT NULL,
  `patientId` int(11) NOT NULL,
  `doctorId` int(11) NOT NULL,
  `appointmentDate` timestamp NOT NULL,
  `notes` text DEFAULT NULL,
  `status` varchar(50) DEFAULT 'scheduled',
  `consultationType` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `appointments`
--

INSERT INTO `appointments` (`id`, `patientId`, `doctorId`, `appointmentDate`, `notes`, `status`, `consultationType`) VALUES
(1, 5, 4, '2025-11-01 22:30:00', '', 'scheduled', 'virtual'),
(2, 5, 4, '2025-11-02 02:00:00', NULL, 'scheduled', 'in-person'),
(3, 5, 4, '2025-11-02 22:00:00', NULL, 'scheduled', 'in-person'),
(4, 5, 4, '2025-11-01 12:27:26', NULL, 'canceled', 'virtual'),
(5, 5, 4, '2025-11-02 01:30:00', NULL, 'scheduled', 'virtual'),
(6, 5, 4, '2025-11-03 01:00:00', NULL, 'scheduled', 'virtual'),
(7, 5, 4, '2025-11-01 05:30:00', '', 'scheduled', 'virtual'),
(8, 5, 4, '2025-11-01 05:00:00', NULL, 'scheduled', 'in-person'),
(9, 5, 4, '2025-11-01 04:30:00', NULL, 'scheduled', 'virtual'),
(10, 7, 4, '2025-11-03 22:00:00', NULL, 'scheduled', 'in-person'),
(11, 7, 4, '2025-11-03 22:30:00', 'asdf', 'scheduled', 'virtual'),
(12, 7, 4, '2025-11-03 23:00:00', 'join on time ', 'scheduled', 'virtual'),
(13, 7, 4, '2025-11-03 23:00:00', 'join on time ', 'scheduled', 'virtual'),
(14, 7, 4, '2025-11-03 23:00:00', 'join on time ', 'scheduled', 'virtual'),
(15, 7, 4, '2025-11-03 23:30:00', 'Please join early', 'scheduled', NULL),
(16, 7, 4, '2025-11-04 22:30:00', '', 'scheduled', 'virtual'),
(17, 7, 4, '2025-11-04 23:00:00', '', 'scheduled', 'virtual'),
(18, 7, 4, '2025-11-05 22:30:00', '', 'scheduled', NULL),
(19, 12, 4, '2025-11-05 22:00:00', 'Hii bagesh baby ', 'scheduled', 'virtual'),
(20, 12, 4, '2025-11-04 00:00:00', 'Hii bhagesh sir', 'scheduled', NULL),
(21, 12, 4, '2025-11-04 00:30:00', '', 'scheduled', 'virtual'),
(22, 12, 4, '2025-11-04 01:00:00', '', 'scheduled', 'virtual'),
(23, 14, 4, '2025-11-04 22:00:00', '', 'scheduled', 'virtual');

-- --------------------------------------------------------

--
-- Table structure for table `beds`
--

CREATE TABLE `beds` (
  `id` int(11) NOT NULL,
  `bedNumber` varchar(50) NOT NULL,
  `wardId` int(11) DEFAULT NULL,
  `status` enum('available','occupied','maintenance','reserved','cleaning') DEFAULT 'available',
  `patientId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `beds`
--

INSERT INTO `beds` (`id`, `bedNumber`, `wardId`, `status`, `patientId`) VALUES
(1, 'ICU-001', 1, 'occupied', 1),
(2, 'ICU-002', 1, 'occupied', 4),
(3, 'GA-001', 2, 'occupied', 5),
(4, 'GA-002', 2, 'occupied', 3),
(5, 'GA-003', 2, 'occupied', 7),
(6, 'GA-004', 2, 'available', NULL),
(7, 'GA-005', 2, 'available', NULL),
(8, 'GA-006', 2, 'available', NULL),
(9, 'GA-007', 2, 'available', NULL),
(10, 'GA-008', 2, 'available', NULL),
(11, 'GA-009', 2, 'available', NULL),
(12, 'GA-010', 2, 'available', NULL),
(13, 'GA-011', 2, 'available', NULL),
(14, 'GA-012', 2, 'available', NULL),
(15, 'GA-013', 2, 'available', NULL),
(16, 'GA-014', 2, 'available', NULL),
(17, 'GA-015', 2, 'available', NULL),
(18, 'GA-016', 2, 'available', NULL),
(19, 'GA-017', 2, 'reserved', NULL),
(20, 'GA-018', 2, 'available', NULL),
(21, 'GA-019', 2, 'available', NULL),
(22, 'GA-020', 2, 'available', NULL),
(23, 'GA-021', 2, 'available', NULL),
(24, 'GA-022', 2, 'available', NULL),
(25, 'GA-023', 2, 'available', NULL),
(26, 'GA-024', 2, 'occupied', NULL),
(27, 'GA-025', 2, 'available', NULL),
(28, 'CW-001', 3, 'available', NULL),
(29, 'CW-002', 3, 'maintenance', NULL),
(30, 'CW-003', 3, 'cleaning', 8),
(31, 'CW-004', 3, 'available', NULL),
(32, 'CW-005', 3, 'cleaning', NULL),
(33, 'CW-006', 3, 'reserved', NULL),
(34, 'CW-007', 3, 'available', NULL),
(35, 'CW-008', 3, 'available', NULL),
(36, 'CW-009', 2, 'available', NULL),
(37, 'CW-010', 3, 'available', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `bill_items`
--

CREATE TABLE `bill_items` (
  `id` int(11) NOT NULL,
  `billId` int(11) NOT NULL,
  `description` text NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `serviceReference` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bill_items`
--

INSERT INTO `bill_items` (`id`, `billId`, `description`, `amount`, `serviceReference`) VALUES
(1, 1, 'ZerodalSp', 200.00, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`id`, `name`, `description`) VALUES
(1, 'Emergency', 'Emergency care and trauma'),
(2, 'Cardiology', 'Heart and cardiovascular care'),
(3, 'Pediatrics', 'Child healthcare'),
(4, 'Orthopedics', 'Bone and joint care'),
(5, 'Pharmacy', 'Medication dispensary');

-- --------------------------------------------------------

--
-- Table structure for table `doctors`
--

CREATE TABLE `doctors` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `doctors`
--

INSERT INTO `doctors` (`id`, `username`, `password`) VALUES
(1, 'doctor', 'doctor');

-- --------------------------------------------------------

--
-- Table structure for table `doctor_schedules`
--

CREATE TABLE `doctor_schedules` (
  `id` int(11) NOT NULL,
  `doctorId` int(11) NOT NULL,
  `dayOfWeek` int(1) NOT NULL COMMENT '0=Sunday, 1=Monday, ..., 6=Saturday',
  `startTime` time NOT NULL,
  `endTime` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `doctor_schedules`
--

INSERT INTO `doctor_schedules` (`id`, `doctorId`, `dayOfWeek`, `startTime`, `endTime`) VALUES
(5, 4, 0, '09:00:00', '17:00:00'),
(6, 4, 1, '09:00:00', '17:00:00'),
(7, 4, 2, '09:00:00', '17:00:00'),
(8, 4, 3, '09:00:00', '17:00:00'),
(9, 4, 4, '09:00:00', '17:00:00'),
(10, 4, 5, '09:00:00', '17:00:00'),
(11, 4, 6, '09:00:00', '17:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `id` int(11) NOT NULL,
  `employeeId` varchar(50) NOT NULL,
  `firstName` varchar(100) NOT NULL,
  `lastName` varchar(100) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `departmentId` int(11) DEFAULT NULL,
  `position` varchar(100) DEFAULT NULL,
  `role` enum('staff','doctor','admin') DEFAULT 'staff',
  `status` enum('active','inactive','on_leave') DEFAULT 'active',
  `hireDate` date DEFAULT NULL,
  `salary` decimal(10,2) DEFAULT NULL,
  `profileImageUrl` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`id`, `employeeId`, `firstName`, `lastName`, `email`, `password`, `phone`, `departmentId`, `position`, `role`, `status`, `hireDate`, `salary`, `profileImageUrl`) VALUES
(1, 'EMP001', 'Dr. Sarah', 'Johnson', 'sarah.j@hospital.com', NULL, '555-0101', 1, 'Chief Emergency Physician', 'doctor', 'active', '2020-01-15', 150000.00, NULL),
(2, 'EMP002', 'Dr. Michael', 'Chen', 'michael.c@hospital.com', NULL, '555-0102', 2, 'Cardiologist', 'doctor', 'active', '2019-03-20', 180000.00, NULL),
(3, 'EMP003', 'Admin', 'User', 'admin@hospital.com', '$2b$10$CJw5CCOKWCimEFN2jNh6Zumhm2cdlCFUkBmLRcfZc8U1j.taO3mI2', '555-0103', NULL, 'Administrator', 'admin', 'active', '2023-01-01', 70000.00, '/uploads/profilePhoto-1762203389968-620913514.jpg'),
(4, 'EMP2520', 'b', 'b', 'bhagesh2@gmail.com', '$2b$10$Hox1OIL2h2ln7lDUFarL4ezEFPzjVVRAtouB6PewYTdDTT5hzmnVq', '7483159830', 2, 'surgen', 'doctor', 'active', '2025-11-01', 50000.00, '/uploads/profilePhoto-1762203467826-857676115.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `immunizations`
--

CREATE TABLE `immunizations` (
  `id` int(11) NOT NULL,
  `patientId` int(11) NOT NULL,
  `vaccineName` varchar(255) NOT NULL,
  `vaccinationDate` date NOT NULL,
  `doseNumber` int(11) DEFAULT 1,
  `administeredByDoctorId` int(11) DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `nextDueDate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lab_tests`
--

CREATE TABLE `lab_tests` (
  `id` int(11) NOT NULL,
  `testNumber` varchar(50) NOT NULL,
  `patientId` int(11) NOT NULL,
  `doctorId` int(11) NOT NULL,
  `testName` varchar(255) NOT NULL,
  `testDate` date NOT NULL,
  `status` varchar(50) DEFAULT 'pending',
  `result_text` text DEFAULT NULL,
  `result_file_url` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `lab_tests`
--

INSERT INTO `lab_tests` (`id`, `testNumber`, `patientId`, `doctorId`, `testName`, `testDate`, `status`, `result_text`, `result_file_url`) VALUES
(1, 'LAB-001', 1, 1, 'Complete Blood Count', '2025-10-01', 'completed', NULL, NULL),
(2, 'LAB-002', 2, 1, 'Lipid Panel', '2025-10-01', 'pending', NULL, NULL),
(3, 'LAB2446', 7, 1, 'CT scan', '2025-11-04', 'completed', 'Disc bulg', NULL),
(4, 'LAB5890', 7, 1, 'MRI', '2025-11-04', 'completed', 'disc bulg', NULL),
(5, 'LAB3362', 7, 1, 'blood', '2025-11-05', 'completed', 'thjnbvffdfrtghn', NULL),
(6, 'LAB8184', 7, 1, 'CT scan', '2025-11-04', 'pending', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `medical_equipment`
--

CREATE TABLE `medical_equipment` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `quantity` int(11) NOT NULL,
  `status` varchar(50) DEFAULT 'available'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `medical_equipment`
--

INSERT INTO `medical_equipment` (`id`, `name`, `quantity`, `status`) VALUES
(1, 'Ventilator', 20, 'available'),
(2, 'X-Ray Machine', 5, 'in-use'),
(3, 'Ultrasound Machine', 10, 'available'),
(4, 'Defibrillator', 30, 'available');

-- --------------------------------------------------------

--
-- Table structure for table `medical_records`
--

CREATE TABLE `medical_records` (
  `id` int(11) NOT NULL,
  `patientId` int(11) NOT NULL,
  `doctorId` int(11) NOT NULL,
  `recordDate` date NOT NULL,
  `diagnosis` varchar(255) NOT NULL,
  `treatment` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `medical_records`
--

INSERT INTO `medical_records` (`id`, `patientId`, `doctorId`, `recordDate`, `diagnosis`, `treatment`) VALUES
(1, 1, 1, '2025-09-28', 'Hypertension', 'Prescribed Lisinopril.'),
(2, 5, 4, '2025-11-01', 'Virtual Consultation E-Prescription', 'Issued during virtual consult: ID 1'),
(3, 7, 4, '2025-11-04', 'Disc Bulge in C2 and D4', 'surgery'),
(4, 7, 4, '2025-11-04', 'Disc Bulge in C2 and D4', 'surgery'),
(5, 7, 4, '2025-11-04', 'Disc Bulge in C2 and D4', 'Surgery'),
(6, 7, 4, '2025-11-06', 'Abnormal Heart Beat', 'qwsd'),
(7, 7, 4, '2025-11-07', 'Abnormal Heart Beat', 'aaa');

-- --------------------------------------------------------

--
-- Table structure for table `medication_adherence`
--

CREATE TABLE `medication_adherence` (
  `id` int(11) NOT NULL,
  `patientId` int(11) NOT NULL,
  `prescriptionId` int(11) NOT NULL,
  `doseTime` datetime NOT NULL,
  `status` enum('taken','skipped','scheduled') NOT NULL DEFAULT 'scheduled',
  `recordedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `medication_adherence`
--

INSERT INTO `medication_adherence` (`id`, `patientId`, `prescriptionId`, `doseTime`, `status`, `recordedAt`) VALUES
(1, 7, 2, '2025-11-03 04:30:00', 'taken', '2025-11-03 19:27:17'),
(2, 7, 3, '2025-11-03 04:30:00', 'skipped', '2025-11-03 19:27:20'),
(3, 7, 4, '2025-11-03 04:30:00', 'taken', '2025-11-03 19:45:21'),
(4, 7, 4, '2025-11-03 04:30:00', 'taken', '2025-11-03 20:51:41'),
(5, 7, 5, '2025-11-03 04:30:00', 'skipped', '2025-11-03 20:51:42');

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` int(11) NOT NULL,
  `senderId` int(11) NOT NULL,
  `senderType` enum('patient','employee') NOT NULL,
  `receiverId` int(11) NOT NULL,
  `receiverType` enum('patient','employee') NOT NULL,
  `message` text NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  `read` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`id`, `senderId`, `senderType`, `receiverId`, `receiverType`, `message`, `timestamp`, `read`) VALUES
(1, 4, 'employee', 0, 'patient', 'hi', '2025-11-01 11:49:55', 0);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `expires` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `expires`) VALUES
('bhageshbiradar820@gmail.com', 'e188cc181406110d26f83d8b2e1a230bec636206', 1762368157435);

-- --------------------------------------------------------

--
-- Table structure for table `patients`
--

CREATE TABLE `patients` (
  `id` int(11) NOT NULL,
  `patientId` varchar(50) NOT NULL,
  `firstName` varchar(100) NOT NULL,
  `lastName` varchar(100) NOT NULL,
  `dateOfBirth` date DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `bloodGroup` varchar(5) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `emergencyContact` varchar(200) DEFAULT NULL,
  `emergencyPhone` varchar(20) DEFAULT NULL,
  `status` enum('active','discharged','transferred') DEFAULT 'active',
  `profileImageUrl` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `patients`
--

INSERT INTO `patients` (`id`, `patientId`, `firstName`, `lastName`, `dateOfBirth`, `gender`, `bloodGroup`, `phone`, `email`, `address`, `emergencyContact`, `emergencyPhone`, `status`, `profileImageUrl`) VALUES
(1, 'PAT001', 'John', 'Doe', '1985-05-15', 'Male', 'O+', '555-1001', 'john.doe@email.com', '123 Main St, City', 'Jane Doe', '555-1002', 'active', NULL),
(2, 'PAT002', 'Emma', 'Wilson', '1990-08-22', 'Female', 'A+', '555-1003', 'emma.w@email.com', '456 Oak Ave, City', 'Tom Wilson', '555-1004', 'active', NULL),
(3, 'PAT003', 'James', 'Brown', '1978-11-30', 'Male', 'B+', '555-1005', 'james.b@email.com', '789 Pine St, City', 'Susan Brown', '555-1006', 'active', NULL),
(4, 'PAT1498', 'Bhagesh', 'Biradar.', NULL, NULL, NULL, NULL, 'bhagesh@gmail.com', NULL, NULL, NULL, 'active', NULL),
(5, 'PAT3644', 'Bhagesh', 'B', NULL, NULL, NULL, NULL, 'bhagesh1@gmail.com', NULL, NULL, NULL, 'active', '/uploads/profilePhoto-1761998109058-143418986.jpg'),
(7, 'PAT6853', 'Bhagesh', 'Biradar.', NULL, NULL, NULL, '+917483159830', 'bhagesh11@gmail.com', NULL, NULL, NULL, 'active', '/uploads/profilePhoto-1762203116075-947610701.jpg'),
(8, 'PAT7178', 'B', 'B', NULL, NULL, NULL, NULL, 'bhagesh3@gmail.com', NULL, NULL, NULL, 'active', NULL),
(11, 'PAT5107', 'Bhagesh', 'Bbb', NULL, NULL, NULL, NULL, 'bhagesh22@gmail.com', NULL, NULL, NULL, 'active', NULL),
(12, 'PAT5647', 'Siddeshwar ', 'Shinde ', NULL, NULL, NULL, '+917483159830', 'shindesiddeshwar74@gmail.com', NULL, NULL, NULL, 'active', '/uploads/profilePhoto-1762274102307-163863191.jpg'),
(13, 'PAT2601', 'bhagesh', '123er', NULL, '', '', 'sdfgh', 'sdfvghn@gmail.com', '', '', '', 'active', NULL),
(14, 'PAT4787', 'Bhagesh', 'Biradar.', NULL, NULL, NULL, NULL, 'bhageshbiradar7@gmail.com', NULL, NULL, NULL, 'active', NULL),
(15, 'PAT5075', 'Bhagesh', 'Biradar.1', NULL, NULL, NULL, NULL, 'bhageshbiradar789@gmail.com', NULL, NULL, NULL, 'active', NULL),
(17, 'PAT5170', 'Bhagesh', 'Biradar.', NULL, NULL, NULL, NULL, 'bhageshbiradar123456789@gmail.com', NULL, NULL, NULL, 'active', NULL),
(19, 'PAT3956', 'Bhagesh', 'Biradar.', NULL, NULL, NULL, NULL, 'bhageshbiradar9797@gmail.com', NULL, NULL, NULL, 'active', NULL),
(21, 'PAT8661', 'Bhagesh', 'Biradar111', NULL, NULL, NULL, NULL, 'mayurmiraje39@gmail.com', NULL, NULL, NULL, 'active', NULL),
(22, 'PAT2029', 'bbbb', 'asd', NULL, NULL, NULL, NULL, 'ganeshjadhav84894@gmail.com', NULL, NULL, NULL, 'active', NULL),
(24, 'PAT7626', 'bbbb', 'asd', NULL, NULL, NULL, NULL, 'sagarshinded45@gmail.com', NULL, NULL, NULL, 'active', NULL),
(26, 'PAT2415', 'chetan', 'h', NULL, NULL, NULL, NULL, 'chetanhugar2004@gmail.com', NULL, NULL, NULL, 'active', NULL),
(28, 'PAT2609', 'Bhagesh', 'Biradar.', NULL, NULL, NULL, NULL, 'bhageshbiradar820@gmail.com', NULL, NULL, NULL, 'active', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `patients_auth`
--

CREATE TABLE `patients_auth` (
  `id` int(11) NOT NULL,
  `patientId` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `verificationToken` varchar(255) DEFAULT NULL,
  `isVerified` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `patients_auth`
--

INSERT INTO `patients_auth` (`id`, `patientId`, `email`, `password`, `verificationToken`, `isVerified`) VALUES
(1, 4, 'bhagesh@gmail.com', '$2b$10$j9ySvZOMQ/YAGfXZ5s2h6.cyf2c/GP1kVx9xfSQa0fx6DVGJDTatu', NULL, 0),
(2, 5, 'bhagesh1@gmail.com', '$2b$10$E9jafC0BC8W6/bj5lFf.0.5DAnVFTOq/tnEHyzsiMOnnW/g9EoOQO', NULL, 0),
(3, 7, 'bhagesh11@gmail.com', '$2b$10$VstsZTOfgZ3w5lgkUM/5oeELw48CQs34Pt9M19F2BbXMsjZkTtMra', NULL, 0),
(4, 8, 'bhagesh3@gmail.com', '$2b$10$4NHjyNeXjrWND3WzptplJu/i/6fFHoe94HZdUueoWDqqvN9xjmCAy', NULL, 0),
(5, 11, 'bhagesh22@gmail.com', '$2b$10$tKPe5vanuV3eMoQQBVXOaukXp3pE52eBYJhwutYFhPJoWKFUclSl.', NULL, 0),
(6, 12, 'shindesiddeshwar74@gmail.com', '$2b$10$GQvWXA63HU/iVx23yuXvXu2n9VaHXD1GUBvRIGdlxMha65JD10ZLO', NULL, 0),
(7, 14, 'bhageshbiradar7@gmail.com', '$2b$10$lk4vdjZXA1NtjPWMjjQB.eyhlBGbgwpahzvGC5wm5gG7ptYmvwB72', NULL, 0),
(8, 15, 'bhageshbiradar789@gmail.com', '$2b$10$MKqWuFuS5kQ5A0RrwADEYugEfrm7g6KE63Dhhg5Jj7VHXZIl6Oi0W', NULL, 0),
(9, 17, 'bhageshbiradar123456789@gmail.com', '$2b$10$GzuO7jKN7UVaAY9ekOoy3OrD5eqydVwkrYGNJ9u8R1u5Atcx9Dgym', NULL, 0),
(10, 19, 'bhageshbiradar9797@gmail.com', '$2b$10$5tpEbWCiy10Q85vaorAAGO.BzbjcRjmQp5RDIDBLWnB.FMncMYvJq', NULL, 0),
(11, 21, 'mayurmiraje39@gmail.com', '$2b$10$oSKLP3iH/OosQBVShwJn6ORUOzEPUO0m1Ymxl05pK5QZQ0LseO8Qe', NULL, 0),
(12, 26, 'chetanhugar2004@gmail.com', '$2b$10$PxAw/pRDgdksceSg9FQixeol9QMyfDuQmsQaUqWK9ejm13LO3z6yi', 'de807763e9e7b75eab0f035bf4731b7037fb86d6', 0),
(13, 28, 'bhageshbiradar820@gmail.com', '$2b$10$QDidRN5Cefufeo6dSt7p3uPyCoYZH75YytJM/tI9Q6PJvZ7dkxhI.', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `patient_bills`
--

CREATE TABLE `patient_bills` (
  `id` int(11) NOT NULL,
  `billNumber` varchar(50) NOT NULL,
  `patientId` int(11) NOT NULL,
  `billDate` datetime NOT NULL,
  `dueDate` date NOT NULL,
  `totalAmount` decimal(10,2) NOT NULL,
  `amountPaid` decimal(10,2) DEFAULT 0.00,
  `balanceDue` decimal(10,2) NOT NULL,
  `status` enum('pending','paid','partial','overdue') DEFAULT 'pending',
  `notes` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `patient_bills`
--

INSERT INTO `patient_bills` (`id`, `billNumber`, `patientId`, `billDate`, `dueDate`, `totalAmount`, `amountPaid`, `balanceDue`, `status`, `notes`) VALUES
(1, 'BILL-1762272821647-348', 11, '2025-11-04 16:13:41', '2025-11-04', 200.00, 0.00, 200.00, 'pending', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `payroll_records`
--

CREATE TABLE `payroll_records` (
  `id` int(11) NOT NULL,
  `employeeId` int(11) NOT NULL,
  `payPeriodStart` date NOT NULL,
  `payPeriodEnd` date NOT NULL,
  `basicSalary` decimal(10,2) NOT NULL,
  `allowances` decimal(10,2) DEFAULT NULL,
  `deductions` decimal(10,2) DEFAULT NULL,
  `netSalary` decimal(10,2) DEFAULT NULL,
  `paymentDate` date DEFAULT NULL,
  `status` varchar(50) DEFAULT 'pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payroll_records`
--

INSERT INTO `payroll_records` (`id`, `employeeId`, `payPeriodStart`, `payPeriodEnd`, `basicSalary`, `allowances`, `deductions`, `netSalary`, `paymentDate`, `status`) VALUES
(1, 1, '2025-09-01', '2025-09-30', 0.00, NULL, NULL, NULL, NULL, 'pending');

-- --------------------------------------------------------

--
-- Table structure for table `pharmaceuticals`
--

CREATE TABLE `pharmaceuticals` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `categoryId` int(11) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `dosageForm` varchar(50) DEFAULT NULL,
  `strength` varchar(50) DEFAULT NULL,
  `unitPrice` decimal(10,2) NOT NULL,
  `stockQuantity` int(11) NOT NULL,
  `reorderLevel` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pharmaceuticals`
--

INSERT INTO `pharmaceuticals` (`id`, `name`, `categoryId`, `description`, `dosageForm`, `strength`, `unitPrice`, `stockQuantity`, `reorderLevel`) VALUES
(1, 'Amoxicillin', 1, 'Broad-spectrum antibiotic', 'Capsule', '500mg', 15.99, 0, 100),
(2, 'Ibuprofen', 2, 'Pain and inflammation relief', 'Tablet', '200mg', 8.99, 0, 200);

-- --------------------------------------------------------

--
-- Table structure for table `pharmaceutical_categories`
--

CREATE TABLE `pharmaceutical_categories` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pharmaceutical_categories`
--

INSERT INTO `pharmaceutical_categories` (`id`, `name`, `description`) VALUES
(1, 'Antibiotics', 'Bacterial infection treatment'),
(2, 'Analgesics', 'Pain relief medications'),
(3, 'Cardiovascular', 'Heart and blood pressure medications'),
(4, 'Vitamins', 'Nutritional supplements');

-- --------------------------------------------------------

--
-- Table structure for table `prescriptions`
--

CREATE TABLE `prescriptions` (
  `id` int(11) NOT NULL,
  `prescriptionNumber` varchar(50) NOT NULL,
  `patientId` int(11) NOT NULL,
  `doctorId` int(11) NOT NULL,
  `prescriptionDate` date NOT NULL,
  `status` varchar(50) DEFAULT NULL,
  `medicationName` varchar(255) NOT NULL,
  `dosage` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `prescriptions`
--

INSERT INTO `prescriptions` (`id`, `prescriptionNumber`, `patientId`, `doctorId`, `prescriptionDate`, `status`, `medicationName`, `dosage`) VALUES
(1, 'PRES-1761997785668', 5, 4, '2025-11-01', 'active', '', NULL),
(2, 'PRES-1762180693473', 7, 4, '2025-11-04', 'active', '', NULL),
(3, 'PRES-1762197729720', 7, 4, '2025-11-04', 'active', '', NULL),
(4, 'PRES-1762199094326', 7, 4, '2025-11-04', 'filled', 'Zerodal Sp', '1'),
(5, 'PRES-1762199780269', 7, 4, '2025-11-06', 'canceled', 'sdcf', 'wsd'),
(6, 'PRES-1762200004350', 7, 4, '2025-11-07', 'canceled', 'asdf', '1');

-- --------------------------------------------------------

--
-- Table structure for table `prescription_schedules`
--

CREATE TABLE `prescription_schedules` (
  `id` int(11) NOT NULL,
  `prescriptionId` int(11) NOT NULL,
  `scheduledTime` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `prescription_schedules`
--

INSERT INTO `prescription_schedules` (`id`, `prescriptionId`, `scheduledTime`) VALUES
(1, 4, '10:00:00'),
(2, 5, '10:00:00'),
(3, 6, '01:30:00');

-- --------------------------------------------------------

--
-- Table structure for table `surgery_records`
--

CREATE TABLE `surgery_records` (
  `id` int(11) NOT NULL,
  `surgeryNumber` varchar(50) NOT NULL,
  `patientId` int(11) NOT NULL,
  `surgeonId` int(11) NOT NULL,
  `surgeryType` varchar(255) NOT NULL,
  `surgeryDate` datetime NOT NULL,
  `notes` text DEFAULT NULL,
  `status` enum('scheduled','completed','canceled') DEFAULT 'scheduled'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `surgery_records`
--

INSERT INTO `surgery_records` (`id`, `surgeryNumber`, `patientId`, `surgeonId`, `surgeryType`, `surgeryDate`, `notes`, `status`) VALUES
(1, 'SURG-001', 2, 2, 'Appendectomy', '2025-10-10 09:00:00', NULL, 'canceled'),
(2, 'SURG-6172', 7, 4, 'disc ', '2025-11-05 20:08:00', 'qwerf', 'completed'),
(3, 'SURG-3406', 7, 4, 'Bypass surgery', '2025-11-04 02:28:00', 'sdfgh', 'scheduled');

-- --------------------------------------------------------

--
-- Table structure for table `vendors`
--

CREATE TABLE `vendors` (
  `id` int(11) NOT NULL,
  `vendorName` varchar(255) NOT NULL,
  `contactPerson` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `vendorType` varchar(100) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `vendors`
--

INSERT INTO `vendors` (`id`, `vendorName`, `contactPerson`, `email`, `phone`, `address`, `vendorType`, `status`) VALUES
(1, 'Medical Supplies Co.', 'John Smith', 'contact@medsupplies.com', '555-9090', '789 Supply Rd', 'Supplies', 'active'),
(2, 'PharmaCorp', 'Jane Doe', 'jane@pharmacorp.com', '555-9091', '321 Pharma Ave', 'Pharmaceuticals', 'active');

-- --------------------------------------------------------

--
-- Table structure for table `virtual_consultation_rooms`
--

CREATE TABLE `virtual_consultation_rooms` (
  `id` int(11) NOT NULL,
  `appointmentId` int(11) NOT NULL,
  `roomUrl` varchar(255) NOT NULL,
  `startTime` datetime NOT NULL,
  `endTime` datetime NOT NULL,
  `status` enum('scheduled','active','completed','canceled') DEFAULT 'scheduled'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `virtual_consultation_rooms`
--

INSERT INTO `virtual_consultation_rooms` (`id`, `appointmentId`, `roomUrl`, `startTime`, `endTime`, `status`) VALUES
(1, 1, 'https://meet.jit.si/HMSConsultation-1-1761997414785', '2025-11-02 04:00:00', '2025-11-02 04:30:00', 'scheduled'),
(2, 7, 'https://meet.jit.si/HMSConsultation-7-1762001111470', '2025-11-01 11:00:00', '2025-11-01 11:30:00', 'scheduled'),
(3, 11, 'https://meet.jit.si/HMSConsultation-11-1762200223532', '2025-11-04 04:00:00', '2025-11-04 04:30:00', 'scheduled'),
(4, 12, 'https://meet.jit.si/HMSConsultation-12-1762200630772', '2025-11-04 04:30:00', '2025-11-04 05:00:00', 'scheduled'),
(5, 13, 'https://meet.jit.si/HMSConsultation-13-1762200635324', '2025-11-04 04:30:00', '2025-11-04 05:00:00', 'scheduled'),
(6, 14, 'https://meet.jit.si/HMSConsultation-14-1762200635332', '2025-11-04 04:30:00', '2025-11-04 05:00:00', 'scheduled'),
(7, 15, 'https://meet.jit.si/HMSConsultation-15-1762200862138', '2025-11-04 05:00:00', '2025-11-04 05:30:00', 'scheduled'),
(8, 17, 'https://meet.jit.si/HMSConsultation-17-1762202739309', '2025-11-05 04:30:00', '2025-11-05 05:00:00', 'scheduled'),
(9, 21, 'https://meet.jit.si/HMSConsultation-21-1762274161418', '2025-11-04 06:00:00', '2025-11-04 06:30:00', 'scheduled'),
(10, 22, 'https://meet.jit.si/HMSConsultation-22-1762274295641', '2025-11-04 06:30:00', '2025-11-04 07:00:00', 'scheduled');

-- --------------------------------------------------------

--
-- Table structure for table `wards`
--

CREATE TABLE `wards` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `departmentId` int(11) DEFAULT NULL,
  `floorNumber` int(11) DEFAULT NULL,
  `capacity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `wards`
--

INSERT INTO `wards` (`id`, `name`, `departmentId`, `floorNumber`, `capacity`) VALUES
(1, 'ICU Ward', 1, 2, 20),
(2, 'General Ward A', 1, 3, 50),
(3, 'Cardiac Ward', 2, 4, 10);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts_payable`
--
ALTER TABLE `accounts_payable`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `accounts_receivable`
--
ALTER TABLE `accounts_receivable`
  ADD PRIMARY KEY (`id`),
  ADD KEY `patientId_ar` (`patientId`);

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `admissions`
--
ALTER TABLE `admissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `patientId_adm` (`patientId`),
  ADD KEY `wardId_adm` (`wardId`),
  ADD KEY `bedId_adm` (`bedId`);

--
-- Indexes for table `appointments`
--
ALTER TABLE `appointments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `patientId_appt` (`patientId`),
  ADD KEY `doctorId_appt` (`doctorId`);

--
-- Indexes for table `beds`
--
ALTER TABLE `beds`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wardId` (`wardId`),
  ADD KEY `patientId_bed` (`patientId`);

--
-- Indexes for table `bill_items`
--
ALTER TABLE `bill_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `billId_bi` (`billId`);

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `doctors`
--
ALTER TABLE `doctors`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `doctor_schedules`
--
ALTER TABLE `doctor_schedules`
  ADD PRIMARY KEY (`id`),
  ADD KEY `doctorId` (`doctorId`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `employeeId` (`employeeId`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `departmentId` (`departmentId`);

--
-- Indexes for table `immunizations`
--
ALTER TABLE `immunizations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `patientId_imm` (`patientId`),
  ADD KEY `administeredByDoctorId_imm` (`administeredByDoctorId`);

--
-- Indexes for table `lab_tests`
--
ALTER TABLE `lab_tests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `patientId_lab` (`patientId`),
  ADD KEY `doctorId_lab` (`doctorId`);

--
-- Indexes for table `medical_equipment`
--
ALTER TABLE `medical_equipment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `medical_records`
--
ALTER TABLE `medical_records`
  ADD PRIMARY KEY (`id`),
  ADD KEY `patientId_mr` (`patientId`),
  ADD KEY `doctorId_mr` (`doctorId`);

--
-- Indexes for table `medication_adherence`
--
ALTER TABLE `medication_adherence`
  ADD PRIMARY KEY (`id`),
  ADD KEY `patientId` (`patientId`),
  ADD KEY `prescriptionId` (`prescriptionId`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `patients`
--
ALTER TABLE `patients`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `patientId` (`patientId`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `patients_auth`
--
ALTER TABLE `patients_auth`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `patientId_auth` (`patientId`);

--
-- Indexes for table `patient_bills`
--
ALTER TABLE `patient_bills`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `billNumber` (`billNumber`),
  ADD KEY `patientId_bill` (`patientId`);

--
-- Indexes for table `payroll_records`
--
ALTER TABLE `payroll_records`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employeeId` (`employeeId`);

--
-- Indexes for table `pharmaceuticals`
--
ALTER TABLE `pharmaceuticals`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categoryId` (`categoryId`);

--
-- Indexes for table `pharmaceutical_categories`
--
ALTER TABLE `pharmaceutical_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `prescriptions`
--
ALTER TABLE `prescriptions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `patientId` (`patientId`);

--
-- Indexes for table `prescription_schedules`
--
ALTER TABLE `prescription_schedules`
  ADD PRIMARY KEY (`id`),
  ADD KEY `prescriptionId` (`prescriptionId`);

--
-- Indexes for table `surgery_records`
--
ALTER TABLE `surgery_records`
  ADD PRIMARY KEY (`id`),
  ADD KEY `patientId_surgery` (`patientId`);

--
-- Indexes for table `vendors`
--
ALTER TABLE `vendors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `virtual_consultation_rooms`
--
ALTER TABLE `virtual_consultation_rooms`
  ADD PRIMARY KEY (`id`),
  ADD KEY `appointmentId` (`appointmentId`);

--
-- Indexes for table `wards`
--
ALTER TABLE `wards`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ward_departmentId` (`departmentId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accounts_payable`
--
ALTER TABLE `accounts_payable`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `accounts_receivable`
--
ALTER TABLE `accounts_receivable`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `admissions`
--
ALTER TABLE `admissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `appointments`
--
ALTER TABLE `appointments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `beds`
--
ALTER TABLE `beds`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `bill_items`
--
ALTER TABLE `bill_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `doctors`
--
ALTER TABLE `doctors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `doctor_schedules`
--
ALTER TABLE `doctor_schedules`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `immunizations`
--
ALTER TABLE `immunizations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lab_tests`
--
ALTER TABLE `lab_tests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `medical_equipment`
--
ALTER TABLE `medical_equipment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `medical_records`
--
ALTER TABLE `medical_records`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `medication_adherence`
--
ALTER TABLE `medication_adherence`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `patients`
--
ALTER TABLE `patients`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `patients_auth`
--
ALTER TABLE `patients_auth`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `patient_bills`
--
ALTER TABLE `patient_bills`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `payroll_records`
--
ALTER TABLE `payroll_records`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `pharmaceuticals`
--
ALTER TABLE `pharmaceuticals`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `pharmaceutical_categories`
--
ALTER TABLE `pharmaceutical_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `prescriptions`
--
ALTER TABLE `prescriptions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `prescription_schedules`
--
ALTER TABLE `prescription_schedules`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `surgery_records`
--
ALTER TABLE `surgery_records`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `vendors`
--
ALTER TABLE `vendors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `virtual_consultation_rooms`
--
ALTER TABLE `virtual_consultation_rooms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `wards`
--
ALTER TABLE `wards`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `accounts_receivable`
--
ALTER TABLE `accounts_receivable`
  ADD CONSTRAINT `ar_ibfk_1` FOREIGN KEY (`patientId`) REFERENCES `patients` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `admissions`
--
ALTER TABLE `admissions`
  ADD CONSTRAINT `adm_ibfk_1` FOREIGN KEY (`patientId`) REFERENCES `patients` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `adm_ibfk_2` FOREIGN KEY (`wardId`) REFERENCES `wards` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `adm_ibfk_3` FOREIGN KEY (`bedId`) REFERENCES `beds` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `appointments`
--
ALTER TABLE `appointments`
  ADD CONSTRAINT `appt_ibfk_1` FOREIGN KEY (`patientId`) REFERENCES `patients` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `appt_ibfk_2` FOREIGN KEY (`doctorId`) REFERENCES `employees` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `beds`
--
ALTER TABLE `beds`
  ADD CONSTRAINT `beds_ibfk_1` FOREIGN KEY (`wardId`) REFERENCES `wards` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `beds_ibfk_2` FOREIGN KEY (`patientId`) REFERENCES `patients` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `bill_items`
--
ALTER TABLE `bill_items`
  ADD CONSTRAINT `bi_ibfk_1` FOREIGN KEY (`billId`) REFERENCES `patient_bills` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `doctor_schedules`
--
ALTER TABLE `doctor_schedules`
  ADD CONSTRAINT `ds_ibfk_1` FOREIGN KEY (`doctorId`) REFERENCES `employees` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `employees`
--
ALTER TABLE `employees`
  ADD CONSTRAINT `employees_ibfk_1` FOREIGN KEY (`departmentId`) REFERENCES `departments` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `immunizations`
--
ALTER TABLE `immunizations`
  ADD CONSTRAINT `imm_ibfk_1` FOREIGN KEY (`patientId`) REFERENCES `patients` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `imm_ibfk_2` FOREIGN KEY (`administeredByDoctorId`) REFERENCES `employees` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `lab_tests`
--
ALTER TABLE `lab_tests`
  ADD CONSTRAINT `lt_ibfk_1` FOREIGN KEY (`patientId`) REFERENCES `patients` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `lt_ibfk_2` FOREIGN KEY (`doctorId`) REFERENCES `employees` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `medical_records`
--
ALTER TABLE `medical_records`
  ADD CONSTRAINT `mr_ibfk_1` FOREIGN KEY (`patientId`) REFERENCES `patients` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `mr_ibfk_2` FOREIGN KEY (`doctorId`) REFERENCES `employees` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `medication_adherence`
--
ALTER TABLE `medication_adherence`
  ADD CONSTRAINT `medication_adherence_ibfk_1` FOREIGN KEY (`patientId`) REFERENCES `patients` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `medication_adherence_ibfk_2` FOREIGN KEY (`prescriptionId`) REFERENCES `prescriptions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `patients_auth`
--
ALTER TABLE `patients_auth`
  ADD CONSTRAINT `pa_ibfk_1` FOREIGN KEY (`patientId`) REFERENCES `patients` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `patient_bills`
--
ALTER TABLE `patient_bills`
  ADD CONSTRAINT `pb_ibfk_1` FOREIGN KEY (`patientId`) REFERENCES `patients` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `payroll_records`
--
ALTER TABLE `payroll_records`
  ADD CONSTRAINT `pr_ibfk_1` FOREIGN KEY (`employeeId`) REFERENCES `employees` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `pharmaceuticals`
--
ALTER TABLE `pharmaceuticals`
  ADD CONSTRAINT `pharmaceuticals_ibfk_1` FOREIGN KEY (`categoryId`) REFERENCES `pharmaceutical_categories` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `prescriptions`
--
ALTER TABLE `prescriptions`
  ADD CONSTRAINT `p_ibfk_1` FOREIGN KEY (`patientId`) REFERENCES `patients` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `prescription_schedules`
--
ALTER TABLE `prescription_schedules`
  ADD CONSTRAINT `prescription_schedules_ibfk_1` FOREIGN KEY (`prescriptionId`) REFERENCES `prescriptions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `surgery_records`
--
ALTER TABLE `surgery_records`
  ADD CONSTRAINT `sr_ibfk_1` FOREIGN KEY (`patientId`) REFERENCES `patients` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `virtual_consultation_rooms`
--
ALTER TABLE `virtual_consultation_rooms`
  ADD CONSTRAINT `vcr_ibfk_1` FOREIGN KEY (`appointmentId`) REFERENCES `appointments` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `wards`
--
ALTER TABLE `wards`
  ADD CONSTRAINT `wards_ibfk_1` FOREIGN KEY (`departmentId`) REFERENCES `departments` (`id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
