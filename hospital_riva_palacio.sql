-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 15-07-2026 a las 17:59:43
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `hospital_riva_palacio`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `citas`
--

CREATE TABLE `citas` (
  `id_cita` int(11) NOT NULL,
  `id_paciente` int(11) NOT NULL,
  `id_doctor` int(11) NOT NULL,
  `id_habitacion` int(11) DEFAULT NULL,
  `fecha_cita_inicio` datetime NOT NULL,
  `fecha_cita_fin` datetime NOT NULL,
  `motivo_detallado` text NOT NULL,
  `estado` enum('Programada','Atendida','Cancelada','No Asistió') DEFAULT 'Programada',
  `estado_clinico` varchar(50) NOT NULL DEFAULT 'Estable'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `citas`
--

INSERT INTO `citas` (`id_cita`, `id_paciente`, `id_doctor`, `id_habitacion`, `fecha_cita_inicio`, `fecha_cita_fin`, `motivo_detallado`, `estado`, `estado_clinico`) VALUES
(1, 154, 15, NULL, '2026-08-03 14:01:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(2, 188, 8, NULL, '2026-07-27 09:00:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(3, 110, 9, NULL, '2026-08-06 14:01:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(4, 134, 19, NULL, '2026-07-22 17:01:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(5, 34, 17, NULL, '2026-07-29 18:01:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(6, 34, 6, NULL, '2026-08-13 09:00:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(7, 217, 19, NULL, '2026-08-14 17:00:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(8, 72, 13, NULL, '2026-07-23 15:00:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(9, 150, 13, NULL, '2026-08-03 15:01:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(10, 138, 15, NULL, '2026-07-17 17:00:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(11, 153, 16, NULL, '2026-08-02 13:00:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(12, 159, 8, NULL, '2026-07-16 15:00:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(13, 67, 17, NULL, '2026-07-29 12:00:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(14, 59, 8, NULL, '2026-08-06 16:01:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(15, 26, 5, NULL, '2026-07-16 14:01:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(16, 244, 8, NULL, '2026-07-31 12:00:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(17, 148, 10, NULL, '2026-07-28 15:01:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(18, 79, 6, NULL, '2026-07-20 18:00:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(19, 143, 20, NULL, '2026-07-18 10:01:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(20, 221, 16, NULL, '2026-08-01 12:01:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(21, 87, 4, NULL, '2026-08-06 16:01:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(22, 104, 12, NULL, '2026-08-12 12:00:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(23, 178, 12, NULL, '2026-07-28 15:00:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(24, 59, 4, NULL, '2026-07-18 18:01:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(25, 217, 21, NULL, '2026-08-11 09:00:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(26, 68, 14, NULL, '2026-07-30 09:01:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(27, 204, 14, NULL, '2026-07-25 09:00:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(28, 79, 9, NULL, '2026-07-24 08:00:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(29, 206, 1, NULL, '2026-08-13 09:01:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(30, 231, 17, NULL, '2026-07-19 12:01:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(31, 44, 4, NULL, '2026-08-10 18:00:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(32, 122, 16, NULL, '2026-07-16 13:00:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(33, 121, 4, NULL, '2026-08-11 15:00:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(34, 76, 11, NULL, '2026-07-20 10:00:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(35, 243, 4, NULL, '2026-07-27 13:01:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(36, 54, 10, NULL, '2026-07-23 14:01:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(37, 143, 19, NULL, '2026-07-26 15:01:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(38, 165, 12, NULL, '2026-08-01 17:01:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(39, 160, 1, NULL, '2026-08-14 15:00:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(40, 183, 20, NULL, '2026-07-22 18:01:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(41, 230, 4, NULL, '2026-08-03 12:00:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(42, 142, 20, NULL, '2026-07-20 14:01:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(43, 217, 20, NULL, '2026-08-12 10:01:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(44, 70, 16, NULL, '2026-07-31 08:00:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(45, 15, 10, NULL, '2026-07-22 14:00:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(46, 69, 13, NULL, '2026-07-19 10:00:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(47, 62, 13, NULL, '2026-08-01 14:01:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(48, 188, 10, NULL, '2026-08-08 16:00:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(49, 158, 12, NULL, '2026-07-31 18:01:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(50, 82, 9, NULL, '2026-08-11 16:00:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(51, 182, 10, NULL, '2026-08-14 11:00:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(52, 23, 7, NULL, '2026-07-26 12:00:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(53, 117, 7, NULL, '2026-07-30 09:00:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(54, 88, 11, NULL, '2026-07-23 14:00:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(55, 30, 10, NULL, '2026-07-19 10:00:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(56, 177, 12, NULL, '2026-08-03 09:00:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(57, 195, 20, NULL, '2026-07-31 08:00:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(58, 19, 10, NULL, '2026-08-04 18:00:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(59, 14, 11, NULL, '2026-08-13 14:00:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(60, 173, 6, NULL, '2026-08-09 18:00:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(61, 73, 14, NULL, '2026-07-30 10:00:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(62, 77, 20, NULL, '2026-07-25 09:01:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(63, 230, 3, NULL, '2026-08-03 15:00:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(64, 144, 19, NULL, '2026-08-11 12:01:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(65, 73, 17, NULL, '2026-07-17 17:01:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(66, 91, 19, NULL, '2026-07-16 15:01:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(67, 185, 13, NULL, '2026-07-26 12:00:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(68, 227, 5, NULL, '2026-08-01 17:00:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(69, 3, 12, NULL, '2026-07-20 14:00:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(70, 31, 10, NULL, '2026-08-04 12:01:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(71, 132, 5, NULL, '2026-07-23 08:01:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(72, 158, 19, NULL, '2026-07-20 12:00:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(73, 103, 16, NULL, '2026-08-04 11:01:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(74, 121, 1, NULL, '2026-07-30 11:01:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(75, 6, 6, NULL, '2026-07-17 17:00:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(76, 150, 21, NULL, '2026-07-27 18:01:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(77, 94, 1, NULL, '2026-08-12 15:01:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(78, 94, 10, NULL, '2026-07-19 13:00:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(79, 117, 16, NULL, '2026-08-03 13:00:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(80, 144, 9, NULL, '2026-07-26 11:00:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(81, 30, 21, NULL, '2026-08-11 18:01:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(82, 218, 10, NULL, '2026-08-06 15:00:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(83, 157, 17, NULL, '2026-08-13 13:01:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(84, 77, 10, NULL, '2026-07-28 16:01:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(85, 238, 13, NULL, '2026-07-25 17:01:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(86, 43, 15, NULL, '2026-07-28 11:00:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(87, 104, 19, NULL, '2026-08-02 17:00:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(88, 107, 7, NULL, '2026-07-17 16:00:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(89, 88, 6, NULL, '2026-07-31 15:01:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(90, 115, 12, NULL, '2026-08-06 15:01:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(91, 88, 14, NULL, '2026-08-08 12:01:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(92, 178, 9, NULL, '2026-07-30 12:00:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(93, 244, 4, NULL, '2026-08-14 16:00:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(94, 33, 8, NULL, '2026-07-25 14:01:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(95, 107, 19, NULL, '2026-07-16 16:00:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(96, 164, 9, NULL, '2026-07-23 15:00:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(97, 22, 11, NULL, '2026-08-09 09:00:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(98, 49, 5, NULL, '2026-08-09 11:01:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(99, 101, 13, NULL, '2026-08-13 17:00:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(100, 78, 19, NULL, '2026-07-26 09:01:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(101, 198, 8, NULL, '2026-08-08 08:00:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(102, 200, 18, NULL, '2026-08-04 17:01:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(103, 25, 19, NULL, '2026-08-03 10:01:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(104, 223, 19, NULL, '2026-07-18 15:00:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(105, 119, 3, NULL, '2026-07-25 16:00:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(106, 239, 3, NULL, '2026-08-07 14:01:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(107, 155, 5, NULL, '2026-08-04 11:01:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(108, 8, 3, NULL, '2026-07-21 09:00:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(109, 208, 9, NULL, '2026-07-30 10:01:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(110, 14, 9, NULL, '2026-08-05 14:01:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(111, 75, 9, NULL, '2026-07-28 08:01:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(112, 57, 17, NULL, '2026-08-01 16:00:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(113, 93, 5, NULL, '2026-07-30 18:01:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(114, 14, 3, NULL, '2026-07-31 13:01:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(115, 201, 8, NULL, '2026-07-28 18:00:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(116, 97, 16, NULL, '2026-07-21 13:00:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(117, 188, 9, NULL, '2026-07-17 18:01:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(118, 231, 1, NULL, '2026-07-18 13:01:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(119, 225, 9, NULL, '2026-08-10 12:01:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(120, 82, 3, NULL, '2026-08-14 15:01:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(121, 30, 15, NULL, '2026-07-21 11:00:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(122, 214, 12, NULL, '2026-08-01 16:00:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(123, 167, 6, NULL, '2026-08-07 08:00:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(124, 65, 9, NULL, '2026-07-23 08:01:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(125, 28, 20, NULL, '2026-08-13 17:00:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(126, 123, 20, NULL, '2026-07-18 14:01:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(127, 93, 15, NULL, '2026-08-05 16:01:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(128, 22, 7, NULL, '2026-07-27 18:00:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(129, 46, 5, NULL, '2026-07-17 16:01:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(130, 168, 17, NULL, '2026-08-12 18:00:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(131, 67, 6, NULL, '2026-08-07 10:01:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(132, 68, 5, NULL, '2026-07-30 18:00:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(133, 141, 9, NULL, '2026-08-14 18:01:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(134, 194, 18, NULL, '2026-08-09 17:01:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(135, 204, 15, NULL, '2026-07-20 14:01:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(136, 72, 18, NULL, '2026-08-02 11:00:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(137, 2, 1, NULL, '2026-07-17 08:01:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(138, 80, 12, NULL, '2026-07-29 09:01:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(139, 205, 11, NULL, '2026-08-14 08:01:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(140, 182, 6, NULL, '2026-08-01 13:01:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(141, 160, 11, NULL, '2026-07-16 09:01:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(142, 250, 7, NULL, '2026-07-18 09:01:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(143, 225, 3, NULL, '2026-07-21 11:00:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(144, 112, 19, NULL, '2026-07-20 13:01:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(145, 150, 15, NULL, '2026-08-06 18:01:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(146, 134, 19, NULL, '2026-07-17 09:00:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(147, 214, 15, NULL, '2026-08-07 17:01:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(148, 225, 9, NULL, '2026-08-08 10:00:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(149, 58, 13, NULL, '2026-07-21 17:00:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(150, 146, 21, NULL, '2026-08-07 14:01:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(151, 154, 19, NULL, '2026-08-01 18:00:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(152, 51, 15, NULL, '2026-08-05 16:01:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(153, 249, 18, NULL, '2026-07-23 13:01:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(154, 192, 15, NULL, '2026-08-13 18:01:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(155, 121, 17, NULL, '2026-08-10 09:00:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(156, 71, 14, NULL, '2026-07-26 11:01:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(157, 103, 19, NULL, '2026-07-19 12:01:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(158, 200, 21, NULL, '2026-08-02 13:01:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(159, 61, 15, NULL, '2026-08-05 11:00:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(160, 39, 9, NULL, '2026-07-24 10:00:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(161, 249, 20, NULL, '2026-08-13 14:01:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(162, 83, 9, NULL, '2026-07-26 14:00:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(163, 159, 12, NULL, '2026-07-25 17:01:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(164, 58, 11, NULL, '2026-07-20 18:00:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(165, 91, 7, NULL, '2026-08-11 09:00:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(166, 98, 15, NULL, '2026-08-12 09:01:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(167, 183, 20, NULL, '2026-07-27 12:01:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(168, 88, 3, NULL, '2026-08-14 15:00:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(169, 139, 7, NULL, '2026-07-30 09:01:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(170, 216, 6, NULL, '2026-08-05 17:00:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(171, 100, 12, NULL, '2026-08-13 17:00:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(172, 167, 11, NULL, '2026-08-10 15:00:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(173, 215, 18, NULL, '2026-08-12 08:00:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(174, 4, 11, NULL, '2026-07-26 17:01:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(175, 232, 10, NULL, '2026-07-22 18:01:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(176, 139, 1, NULL, '2026-08-01 12:01:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(177, 45, 8, NULL, '2026-08-04 17:00:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(178, 80, 10, NULL, '2026-08-08 13:00:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(179, 39, 16, NULL, '2026-08-14 14:00:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(180, 129, 5, NULL, '2026-08-06 08:01:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(181, 215, 15, NULL, '2026-07-21 08:00:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(182, 145, 14, NULL, '2026-07-24 16:01:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(183, 223, 15, NULL, '2026-08-06 16:01:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(184, 31, 21, NULL, '2026-07-25 17:00:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(185, 154, 8, NULL, '2026-07-30 16:00:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(186, 53, 15, NULL, '2026-08-03 17:01:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(187, 225, 11, NULL, '2026-08-11 09:01:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(188, 160, 6, NULL, '2026-08-01 10:01:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(189, 73, 15, NULL, '2026-07-16 11:00:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(190, 131, 18, NULL, '2026-08-06 13:01:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(191, 145, 1, NULL, '2026-07-31 11:01:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(192, 234, 15, NULL, '2026-07-26 12:00:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(193, 171, 14, NULL, '2026-08-14 10:01:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(194, 91, 21, NULL, '2026-07-31 18:00:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(195, 226, 19, NULL, '2026-08-04 11:01:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(196, 169, 9, NULL, '2026-07-17 14:01:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(197, 129, 20, NULL, '2026-07-26 08:01:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(198, 106, 7, NULL, '2026-07-24 16:01:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(199, 126, 7, NULL, '2026-07-25 09:00:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(200, 1, 13, NULL, '2026-08-11 12:01:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(201, 171, 19, NULL, '2026-08-04 14:01:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(202, 51, 19, NULL, '2026-07-25 15:01:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(203, 76, 12, NULL, '2026-07-31 16:00:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(204, 208, 15, NULL, '2026-07-18 10:01:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(205, 97, 11, NULL, '2026-08-09 12:01:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(206, 96, 20, NULL, '2026-08-10 11:00:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(207, 28, 16, NULL, '2026-07-31 16:01:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(208, 50, 11, NULL, '2026-07-21 13:01:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(209, 4, 18, NULL, '2026-07-21 18:00:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(210, 138, 14, NULL, '2026-07-19 12:00:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(211, 84, 14, NULL, '2026-08-13 11:01:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(212, 107, 18, NULL, '2026-08-10 17:00:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(213, 103, 19, NULL, '2026-08-12 18:00:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(214, 120, 15, NULL, '2026-08-07 14:00:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(215, 156, 16, NULL, '2026-08-08 17:00:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(216, 182, 19, NULL, '2026-08-06 15:00:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(217, 129, 12, NULL, '2026-08-05 15:00:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(218, 60, 8, NULL, '2026-07-25 16:00:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(219, 185, 21, NULL, '2026-08-07 08:00:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(220, 108, 21, NULL, '2026-08-08 11:01:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(221, 59, 18, NULL, '2026-07-17 09:00:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(222, 68, 8, NULL, '2026-07-26 10:00:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(223, 196, 7, NULL, '2026-07-26 09:01:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(224, 128, 7, NULL, '2026-08-09 09:01:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(225, 40, 20, NULL, '2026-07-29 12:01:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(226, 196, 17, NULL, '2026-08-05 08:00:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(227, 128, 6, NULL, '2026-08-10 14:01:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(228, 17, 9, NULL, '2026-08-07 13:01:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(229, 222, 1, NULL, '2026-08-13 16:01:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(230, 125, 13, NULL, '2026-07-27 15:01:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(231, 96, 1, NULL, '2026-07-20 12:00:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(232, 7, 15, NULL, '2026-07-18 09:00:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(233, 163, 17, NULL, '2026-07-23 17:00:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(234, 22, 10, NULL, '2026-08-09 09:01:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(235, 166, 7, NULL, '2026-08-05 16:00:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(236, 76, 3, NULL, '2026-07-21 16:00:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(237, 192, 12, NULL, '2026-07-26 08:00:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(238, 50, 20, NULL, '2026-07-18 10:01:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(239, 138, 12, NULL, '2026-07-23 18:00:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(240, 169, 12, NULL, '2026-08-11 10:01:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(241, 140, 12, NULL, '2026-07-16 10:00:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(242, 4, 7, NULL, '2026-07-30 16:00:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(243, 14, 19, NULL, '2026-08-01 14:01:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(244, 30, 21, NULL, '2026-08-07 15:01:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(245, 27, 6, NULL, '2026-07-16 18:00:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(246, 102, 15, NULL, '2026-08-01 18:01:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(247, 221, 12, NULL, '2026-07-19 11:00:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(248, 127, 20, NULL, '2026-07-19 09:00:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(249, 10, 12, NULL, '2026-07-20 18:00:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(250, 128, 18, NULL, '2026-08-07 11:00:00', '0000-00-00 00:00:00', '', 'Programada', 'Estable'),
(251, 251, 45, NULL, '2026-07-13 22:11:00', '0000-00-00 00:00:00', 'Femur fracturado', 'Programada', 'En Observación');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `doctores`
--

CREATE TABLE `doctores` (
  `id_doctor` int(11) NOT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `nombre` varchar(100) NOT NULL,
  `apellidos` varchar(100) NOT NULL,
  `especialidad` varchar(100) NOT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `cedula_prof` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `doctores`
--

INSERT INTO `doctores` (`id_doctor`, `id_usuario`, `nombre`, `apellidos`, `especialidad`, `telefono`, `cedula_prof`) VALUES
(1, NULL, 'María 1', 'Cruz', 'Cardiología', NULL, ''),
(3, NULL, 'Ana 1', 'Pérez', 'Cardiología', NULL, '9847001'),
(4, NULL, 'Juan 2', 'Flores', 'Pediatría', NULL, '9847002'),
(5, NULL, 'Pedro 3', 'Flores', 'Pediatría', NULL, '9847003'),
(6, NULL, 'Luis 4', 'López', 'Medicina General', NULL, '9847004'),
(7, NULL, 'Elena 5', 'Morales', 'Pediatría', NULL, '9847005'),
(8, NULL, 'Miguel 6', 'Flores', 'Cardiología', NULL, '9847006'),
(9, NULL, 'Carlos 7', 'Rodríguez', 'Medicina General', NULL, '9847007'),
(10, NULL, 'Carlos 8', 'Ramírez', 'Traumatología', NULL, '9847008'),
(11, NULL, 'Carlos 9', 'Flores', 'Medicina General', NULL, '9847009'),
(12, NULL, 'Sofia 10', 'López', 'Medicina General', NULL, '9847010'),
(13, NULL, 'Sofia 11', 'Morales', 'Pediatría', NULL, '9847011'),
(14, NULL, 'Elena 12', 'Gómez', 'Urgencias', NULL, '9847012'),
(15, NULL, 'Pedro 13', 'Flores', 'Medicina General', NULL, '9847013'),
(16, NULL, 'Laura 14', 'Flores', 'Ginecología', NULL, '9847014'),
(17, NULL, 'Luis 15', 'Sánchez', 'Ginecología', NULL, '9847015'),
(18, NULL, 'Pedro 16', 'López', 'Cardiología', NULL, '9847016'),
(19, NULL, 'Juan 17', 'Cruz', 'Urgencias', NULL, '9847017'),
(20, NULL, 'Laura 18', 'Sánchez', 'Medicina General', NULL, '9847018'),
(21, NULL, 'María 19', 'Morales', 'Urgencias', NULL, '9847019'),
(22, NULL, 'Sofia 20', 'Rodríguez', 'Urgencias', NULL, '9847020'),
(44, NULL, 'Dr. Luis', 'Pérez', 'Pediatría', NULL, '9847901'),
(45, NULL, 'Dra. Ana', 'Gómez', 'Urgencias', NULL, '9847902');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `habitaciones`
--

CREATE TABLE `habitaciones` (
  `id_habitacion` int(11) NOT NULL,
  `numero` varchar(10) NOT NULL,
  `tipo` enum('General','Privada','Terapia Intensiva','Urgencias') NOT NULL,
  `estado` enum('Disponible','Ocupada','Mantenimiento') DEFAULT 'Disponible'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `habitaciones`
--

INSERT INTO `habitaciones` (`id_habitacion`, `numero`, `tipo`, `estado`) VALUES
(1, '', '', 'Ocupada'),
(3, '1', '', 'Ocupada'),
(4, '2', 'Urgencias', 'Ocupada'),
(5, '3', 'General', 'Ocupada'),
(6, '4', 'General', 'Ocupada'),
(7, '5', 'Urgencias', 'Ocupada'),
(8, '6', '', 'Ocupada'),
(9, '7', 'General', 'Ocupada'),
(10, '8', '', 'Ocupada'),
(11, '9', 'Urgencias', 'Ocupada'),
(12, '10', 'Urgencias', 'Ocupada'),
(13, '11', 'General', 'Ocupada'),
(14, '12', '', 'Ocupada'),
(15, '13', '', 'Ocupada'),
(16, '14', 'General', 'Ocupada'),
(17, '15', 'General', 'Ocupada'),
(18, '16', '', 'Ocupada'),
(19, '17', 'General', 'Ocupada'),
(20, '18', '', 'Ocupada'),
(21, '19', 'Urgencias', 'Ocupada'),
(22, '20', 'Urgencias', 'Disponible'),
(23, '21', '', 'Disponible'),
(24, '22', 'Urgencias', 'Disponible'),
(25, '23', 'Urgencias', 'Disponible'),
(26, '24', '', 'Disponible'),
(27, '25', '', 'Disponible'),
(28, '26', 'General', 'Disponible'),
(29, '27', 'General', 'Disponible'),
(30, '28', 'General', 'Disponible'),
(31, '29', 'Urgencias', 'Disponible'),
(32, '30', '', 'Disponible'),
(33, '31', '', 'Disponible'),
(34, '32', 'Urgencias', 'Disponible'),
(35, '33', '', 'Disponible'),
(36, '34', 'General', 'Disponible'),
(37, '35', '', 'Disponible'),
(38, '36', 'Urgencias', 'Disponible'),
(39, '37', 'General', 'Disponible'),
(40, '38', 'General', 'Disponible'),
(41, '39', 'General', 'Disponible'),
(42, '40', '', 'Disponible'),
(43, '41', '', 'Disponible'),
(44, '42', '', 'Disponible'),
(45, '43', 'General', 'Disponible'),
(46, '44', 'General', 'Disponible'),
(47, '45', 'General', 'Disponible');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pacientes`
--

CREATE TABLE `pacientes` (
  `id_paciente` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `apellidos` varchar(100) NOT NULL,
  `edad` int(11) NOT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `sexo` enum('Masculino','Femenino','Otro') NOT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `diagnostico_inicial` text DEFAULT NULL,
  `historial_alergias` text DEFAULT NULL,
  `fecha_ingreso` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pacientes`
--

INSERT INTO `pacientes` (`id_paciente`, `nombre`, `apellidos`, `edad`, `fecha_nacimiento`, `sexo`, `telefono`, `direccion`, `diagnostico_inicial`, `historial_alergias`, `fecha_ingreso`) VALUES
(1, 'Patricia 1', 'Ramírez', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(2, 'Monica 2', 'Cruz', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(3, 'Fernando 3', 'Flores', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(4, 'Gabriela 4', 'Flores', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(5, 'Silvia 5', 'Pérez', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(6, 'Diana 6', 'Cruz', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(7, 'Monica 7', 'Sánchez', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(8, 'Fernando 8', 'Rodríguez', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(9, 'Fernando 9', 'Pérez', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(10, 'Monica 10', 'Ramírez', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(11, 'Diana 11', 'Morales', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(12, 'Gabriela 12', 'Rodríguez', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(13, 'Javier 13', 'Gómez', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(14, 'Monica 14', 'Martínez', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(15, 'Roberto 15', 'López', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(16, 'Ricardo 16', 'Ramírez', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(17, 'Patricia 17', 'López', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(18, 'Alejandro 18', 'Sánchez', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(19, 'Diana 19', 'Rodríguez', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(20, 'Gabriela 20', 'Gómez', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(21, 'Fernando 21', 'Martínez', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(22, 'Roberto 22', 'Martínez', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(23, 'Alejandro 23', 'Cruz', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(24, 'Diana 24', 'Morales', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(25, 'Roberto 25', 'Gómez', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(26, 'Silvia 26', 'López', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(27, 'Javier 27', 'Cruz', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(28, 'Gabriela 28', 'Morales', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(29, 'Patricia 29', 'Morales', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(30, 'Gabriela 30', 'Morales', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(31, 'Alejandro 31', 'Ramírez', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(32, 'Silvia 32', 'Sánchez', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(33, 'Ricardo 33', 'Martínez', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(34, 'Roberto 34', 'López', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(35, 'Fernando 35', 'Ramírez', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(36, 'Javier 36', 'Morales', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(37, 'Alejandro 37', 'Gómez', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(38, 'Roberto 38', 'Flores', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(39, 'Patricia 39', 'Gómez', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(40, 'Ricardo 40', 'Sánchez', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(41, 'Monica 41', 'Martínez', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(42, 'Monica 42', 'Sánchez', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(43, 'Diana 43', 'Rodríguez', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(44, 'Ricardo 44', 'Morales', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(45, 'Silvia 45', 'Ramírez', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(46, 'Fernando 46', 'Sánchez', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(47, 'Alejandro 47', 'Flores', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(48, 'Diana 48', 'Martínez', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(49, 'Roberto 49', 'Ramírez', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(50, 'Gabriela 50', 'Flores', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(51, 'Roberto 51', 'Ramírez', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(52, 'Silvia 52', 'López', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(53, 'Patricia 53', 'Sánchez', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(54, 'Fernando 54', 'Ramírez', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(55, 'Fernando 55', 'López', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(56, 'Gabriela 56', 'Morales', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(57, 'Monica 57', 'Flores', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(58, 'Roberto 58', 'Morales', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(59, 'Fernando 59', 'Gómez', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(60, 'Patricia 60', 'Cruz', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(61, 'Fernando 61', 'Rodríguez', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(62, 'Fernando 62', 'Pérez', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(63, 'Gabriela 63', 'Rodríguez', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(64, 'Javier 64', 'Pérez', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(65, 'Diana 65', 'Flores', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(66, 'Roberto 66', 'Pérez', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(67, 'Gabriela 67', 'Ramírez', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(68, 'Ricardo 68', 'Rodríguez', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(69, 'Javier 69', 'Rodríguez', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(70, 'Silvia 70', 'Gómez', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(71, 'Roberto 71', 'Morales', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(72, 'Patricia 72', 'Rodríguez', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(73, 'Roberto 73', 'Flores', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(74, 'Monica 74', 'Rodríguez', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(75, 'Roberto 75', 'Flores', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(76, 'Monica 76', 'Martínez', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(77, 'Monica 77', 'Flores', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(78, 'Diana 78', 'Ramírez', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(79, 'Monica 79', 'Flores', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(80, 'Javier 80', 'Pérez', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(81, 'Alejandro 81', 'Ramírez', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(82, 'Javier 82', 'Ramírez', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(83, 'Javier 83', 'Sánchez', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(84, 'Patricia 84', 'Cruz', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(85, 'Silvia 85', 'Martínez', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(86, 'Alejandro 86', 'Ramírez', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(87, 'Ricardo 87', 'Martínez', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(88, 'Ricardo 88', 'Gómez', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(89, 'Ricardo 89', 'Ramírez', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(90, 'Fernando 90', 'López', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(91, 'Roberto 91', 'López', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(92, 'Silvia 92', 'Flores', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(93, 'Monica 93', 'López', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(94, 'Silvia 94', 'Cruz', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(95, 'Javier 95', 'Morales', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(96, 'Alejandro 96', 'Martínez', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(97, 'Alejandro 97', 'Sánchez', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(98, 'Alejandro 98', 'Morales', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(99, 'Monica 99', 'Sánchez', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(100, 'Silvia 100', 'Pérez', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(101, 'Fernando 101', 'Cruz', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(102, 'Monica 102', 'Pérez', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(103, 'Ricardo 103', 'Flores', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(104, 'Javier 104', 'Sánchez', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(105, 'Patricia 105', 'Rodríguez', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(106, 'Fernando 106', 'Sánchez', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(107, 'Diana 107', 'López', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(108, 'Silvia 108', 'Sánchez', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(109, 'Ricardo 109', 'Pérez', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(110, 'Javier 110', 'Cruz', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(111, 'Diana 111', 'Rodríguez', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(112, 'Silvia 112', 'Flores', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(113, 'Silvia 113', 'Flores', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(114, 'Javier 114', 'Morales', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(115, 'Monica 115', 'Cruz', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(116, 'Ricardo 116', 'López', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(117, 'Patricia 117', 'Flores', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(118, 'Patricia 118', 'Martínez', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(119, 'Roberto 119', 'Gómez', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(120, 'Gabriela 120', 'Sánchez', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(121, 'Silvia 121', 'López', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(122, 'Fernando 122', 'Sánchez', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(123, 'Ricardo 123', 'Rodríguez', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(124, 'Javier 124', 'Rodríguez', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(125, 'Ricardo 125', 'Sánchez', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(126, 'Diana 126', 'Cruz', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(127, 'Monica 127', 'López', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(128, 'Alejandro 128', 'López', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(129, 'Diana 129', 'López', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(130, 'Javier 130', 'Martínez', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(131, 'Patricia 131', 'Rodríguez', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(132, 'Javier 132', 'Rodríguez', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(133, 'Javier 133', 'Sánchez', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(134, 'Gabriela 134', 'Sánchez', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(135, 'Monica 135', 'Flores', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(136, 'Javier 136', 'Sánchez', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(137, 'Diana 137', 'Rodríguez', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(138, 'Roberto 138', 'López', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(139, 'Gabriela 139', 'Sánchez', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(140, 'Roberto 140', 'Sánchez', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(141, 'Silvia 141', 'Cruz', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(142, 'Roberto 142', 'Rodríguez', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(143, 'Patricia 143', 'Ramírez', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(144, 'Patricia 144', 'Cruz', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(145, 'Roberto 145', 'Ramírez', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(146, 'Silvia 146', 'Morales', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(147, 'Gabriela 147', 'Flores', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(148, 'Fernando 148', 'Flores', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(149, 'Roberto 149', 'Gómez', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(150, 'Patricia 150', 'Flores', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(151, 'Javier 151', 'Sánchez', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(152, 'Monica 152', 'Pérez', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(153, 'Diana 153', 'Morales', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(154, 'Monica 154', 'Gómez', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(155, 'Alejandro 155', 'Morales', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(156, 'Gabriela 156', 'Martínez', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(157, 'Monica 157', 'Ramírez', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(158, 'Ricardo 158', 'López', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(159, 'Javier 159', 'Flores', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(160, 'Patricia 160', 'Gómez', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(161, 'Diana 161', 'Sánchez', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(162, 'Alejandro 162', 'Morales', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(163, 'Javier 163', 'Sánchez', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(164, 'Silvia 164', 'Martínez', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(165, 'Monica 165', 'Rodríguez', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(166, 'Alejandro 166', 'Morales', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(167, 'Patricia 167', 'Gómez', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(168, 'Gabriela 168', 'Rodríguez', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(169, 'Monica 169', 'Cruz', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(170, 'Monica 170', 'Ramírez', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(171, 'Diana 171', 'Ramírez', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(172, 'Alejandro 172', 'López', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(173, 'Alejandro 173', 'Morales', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(174, 'Silvia 174', 'Pérez', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(175, 'Silvia 175', 'Ramírez', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(176, 'Gabriela 176', 'Flores', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(177, 'Silvia 177', 'Pérez', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(178, 'Roberto 178', 'Rodríguez', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(179, 'Fernando 179', 'Rodríguez', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(180, 'Roberto 180', 'Cruz', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(181, 'Javier 181', 'Ramírez', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(182, 'Ricardo 182', 'Ramírez', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(183, 'Fernando 183', 'Gómez', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(184, 'Alejandro 184', 'Sánchez', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(185, 'Fernando 185', 'Pérez', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(186, 'Silvia 186', 'Rodríguez', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(187, 'Ricardo 187', 'Martínez', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(188, 'Monica 188', 'Martínez', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(189, 'Javier 189', 'López', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(190, 'Diana 190', 'Martínez', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(191, 'Silvia 191', 'Sánchez', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(192, 'Fernando 192', 'Flores', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(193, 'Silvia 193', 'Ramírez', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(194, 'Monica 194', 'Martínez', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(195, 'Silvia 195', 'Rodríguez', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(196, 'Javier 196', 'Ramírez', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(197, 'Diana 197', 'Cruz', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(198, 'Fernando 198', 'Rodríguez', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(199, 'Ricardo 199', 'López', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(200, 'Roberto 200', 'Pérez', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(201, 'Alejandro 201', 'Gómez', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(202, 'Alejandro 202', 'Flores', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(203, 'Roberto 203', 'Sánchez', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(204, 'Roberto 204', 'Ramírez', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(205, 'Silvia 205', 'Cruz', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(206, 'Roberto 206', 'Rodríguez', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(207, 'Silvia 207', 'López', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(208, 'Roberto 208', 'Martínez', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(209, 'Diana 209', 'Flores', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(210, 'Silvia 210', 'Rodríguez', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(211, 'Diana 211', 'Ramírez', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(212, 'Ricardo 212', 'Martínez', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(213, 'Monica 213', 'Martínez', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(214, 'Diana 214', 'Sánchez', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(215, 'Alejandro 215', 'Pérez', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(216, 'Alejandro 216', 'Pérez', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(217, 'Roberto 217', 'Pérez', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(218, 'Fernando 218', 'Flores', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(219, 'Alejandro 219', 'Sánchez', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(220, 'Fernando 220', 'Cruz', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(221, 'Alejandro 221', 'Sánchez', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(222, 'Ricardo 222', 'Pérez', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(223, 'Silvia 223', 'Flores', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(224, 'Ricardo 224', 'Rodríguez', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(225, 'Monica 225', 'Flores', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(226, 'Roberto 226', 'López', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(227, 'Patricia 227', 'Cruz', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(228, 'Ricardo 228', 'Morales', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(229, 'Patricia 229', 'Rodríguez', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(230, 'Gabriela 230', 'Martínez', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(231, 'Roberto 231', 'López', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(232, 'Alejandro 232', 'Morales', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(233, 'Javier 233', 'Pérez', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(234, 'Monica 234', 'Flores', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(235, 'Monica 235', 'Ramírez', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(236, 'Roberto 236', 'Gómez', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(237, 'Diana 237', 'Pérez', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(238, 'Fernando 238', 'Sánchez', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(239, 'Fernando 239', 'López', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(240, 'Roberto 240', 'Martínez', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(241, 'Roberto 241', 'Cruz', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(242, 'Javier 242', 'Morales', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(243, 'Gabriela 243', 'Gómez', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(244, 'Monica 244', 'Gómez', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(245, 'Diana 245', 'López', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(246, 'Monica 246', 'Rodríguez', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(247, 'Diana 247', 'Rodríguez', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(248, 'Silvia 248', 'Flores', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(249, 'Monica 249', 'Gómez', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(250, 'Diana 250', 'López', 0, NULL, 'Masculino', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(251, 'Javier García Lara', 'García Lara', 0, '1986-03-17', 'Masculino', '5517971362', NULL, NULL, 'Alérgico a la carne de puerco', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `recetas`
--

CREATE TABLE `recetas` (
  `id_receta` int(11) NOT NULL,
  `id_cita` int(11) NOT NULL,
  `diagnostico` text NOT NULL,
  `medicamentos` text NOT NULL,
  `medicamento_instrucciones` text NOT NULL,
  `indicaciones_adicionales` text DEFAULT NULL,
  `fecha_emision` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `recetas`
--

INSERT INTO `recetas` (`id_receta`, `id_cita`, `diagnostico`, `medicamentos`, `medicamento_instrucciones`, `indicaciones_adicionales`, `fecha_emision`) VALUES
(1, 251, 'femur fracturado', 'paracetamol de 500mg cada 12 horas por 1 mes', '', NULL, '2026-07-15 04:37:45');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id_rol` int(11) NOT NULL,
  `nombre_rol` varchar(50) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id_rol`, `nombre_rol`, `descripcion`) VALUES
(1, 'Administrador Global', 'Acceso total y control de usuarios.'),
(2, 'Personal Medico', 'Control de citas asignadas y recetas.'),
(3, 'Recepcion', 'Altas de pacientes y asignación de habitaciones.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuario` int(11) NOT NULL,
  `id_rol` int(11) NOT NULL,
  `usuario` varchar(50) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `email` varchar(100) NOT NULL,
  `two_factor_secret` varchar(100) DEFAULT NULL,
  `two_factor_enabled` tinyint(1) DEFAULT 0,
  `estado` enum('Activo','Inactivo','Bloqueado') DEFAULT 'Activo'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `id_rol`, `usuario`, `password_hash`, `email`, `two_factor_secret`, `two_factor_enabled`, `estado`) VALUES
(1, 1, 'director_riva', '$2y$10$Yc7lqK98YpD8WvJ4qXzUeeMhFk9iE7m6FqXzUeeMhFk9iE7m6FqXz', 'director@rivapalacio.hospital', 'JBSWY3DPEHPK3PXP', 1, 'Activo'),
(4, 2, 'luis.medico', '9847901', 'luis.medico@rivapalacio.gob.mx', NULL, 0, 'Activo'),
(5, 2, 'ana.medico', '9847902', 'ana.medico@rivapalacio.gob.mx', NULL, 0, 'Activo');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `citas`
--
ALTER TABLE `citas`
  ADD PRIMARY KEY (`id_cita`),
  ADD KEY `id_paciente` (`id_paciente`),
  ADD KEY `id_doctor` (`id_doctor`),
  ADD KEY `id_habitacion` (`id_habitacion`);

--
-- Indices de la tabla `doctores`
--
ALTER TABLE `doctores`
  ADD PRIMARY KEY (`id_doctor`),
  ADD UNIQUE KEY `cedula_prof` (`cedula_prof`),
  ADD UNIQUE KEY `id_usuario` (`id_usuario`);

--
-- Indices de la tabla `habitaciones`
--
ALTER TABLE `habitaciones`
  ADD PRIMARY KEY (`id_habitacion`),
  ADD UNIQUE KEY `numero` (`numero`);

--
-- Indices de la tabla `pacientes`
--
ALTER TABLE `pacientes`
  ADD PRIMARY KEY (`id_paciente`);

--
-- Indices de la tabla `recetas`
--
ALTER TABLE `recetas`
  ADD PRIMARY KEY (`id_receta`),
  ADD KEY `id_cita` (`id_cita`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id_rol`),
  ADD UNIQUE KEY `nombre_rol` (`nombre_rol`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuario`),
  ADD UNIQUE KEY `usuario` (`usuario`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `id_rol` (`id_rol`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `citas`
--
ALTER TABLE `citas`
  MODIFY `id_cita` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=252;

--
-- AUTO_INCREMENT de la tabla `doctores`
--
ALTER TABLE `doctores`
  MODIFY `id_doctor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT de la tabla `habitaciones`
--
ALTER TABLE `habitaciones`
  MODIFY `id_habitacion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT de la tabla `pacientes`
--
ALTER TABLE `pacientes`
  MODIFY `id_paciente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=252;

--
-- AUTO_INCREMENT de la tabla `recetas`
--
ALTER TABLE `recetas`
  MODIFY `id_receta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id_rol` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `citas`
--
ALTER TABLE `citas`
  ADD CONSTRAINT `citas_ibfk_1` FOREIGN KEY (`id_paciente`) REFERENCES `pacientes` (`id_paciente`) ON DELETE CASCADE,
  ADD CONSTRAINT `citas_ibfk_2` FOREIGN KEY (`id_doctor`) REFERENCES `doctores` (`id_doctor`) ON DELETE CASCADE,
  ADD CONSTRAINT `citas_ibfk_3` FOREIGN KEY (`id_habitacion`) REFERENCES `habitaciones` (`id_habitacion`) ON DELETE SET NULL;

--
-- Filtros para la tabla `doctores`
--
ALTER TABLE `doctores`
  ADD CONSTRAINT `doctores_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`) ON DELETE SET NULL;

--
-- Filtros para la tabla `recetas`
--
ALTER TABLE `recetas`
  ADD CONSTRAINT `recetas_ibfk_1` FOREIGN KEY (`id_cita`) REFERENCES `citas` (`id_cita`) ON DELETE CASCADE;

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`id_rol`) REFERENCES `roles` (`id_rol`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
