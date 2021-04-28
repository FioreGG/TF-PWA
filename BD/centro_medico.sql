-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 28-04-2021 a las 22:21:19
-- Versión del servidor: 10.4.17-MariaDB
-- Versión de PHP: 8.0.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `centro_medico`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `consultas`
--

CREATE TABLE `consultas` (
  `id` int(11) NOT NULL,
  `nombre_paciente` varchar(255) COLLATE utf16_spanish2_ci NOT NULL,
  `apellido_paciente` varchar(255) COLLATE utf16_spanish2_ci NOT NULL,
  `tratamiento` varchar(255) COLLATE utf16_spanish2_ci NOT NULL,
  `dx` varchar(255) COLLATE utf16_spanish2_ci NOT NULL,
  `id_medico` int(11) NOT NULL,
  `habilitado` tinyint(1) NOT NULL DEFAULT 1,
  `ts_create` datetime NOT NULL DEFAULT current_timestamp(),
  `ts_update` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_spanish2_ci;

--
-- Volcado de datos para la tabla `consultas`
--

INSERT INTO `consultas` (`id`, `nombre_paciente`, `apellido_paciente`, `tratamiento`, `dx`, `id_medico`, `habilitado`, `ts_create`, `ts_update`) VALUES
(2, 'Fiorella', 'Garcia Galfione', 'Dioxaflex 600 mg y reposo durante 2 dias.', 'Dolor muscular - mal esfuerzo ', 23, 1, '2021-04-08 00:58:38', '2021-04-28 12:53:06'),
(3, 'Graciela Beatriz', 'Guizzardi', 'Losartan 800 mg', 'Hipertension arterial', 23, 1, '2021-04-08 01:41:48', '2021-04-28 13:46:52'),
(4, 'Bruno Luis', 'Busilli', 'Dioxaflex', 'Lumbalgia', 28, 0, '2021-04-08 02:32:25', '2021-04-27 17:29:45'),
(5, 'Alfonsina', 'Garcia Galfione', 'Qura muk 600 mg cada 8 hs', 'Congestion nasal', 35, 1, '2021-04-12 22:36:32', '2021-04-28 17:05:06'),
(6, 'Manuel', 'Nicola', 'Clonagin', 'Ansiedad', 23, 0, '2021-04-12 22:37:33', '2021-04-27 17:30:23'),
(7, 'Yanina Eliana', 'Galfione', 'Fisioterapia por 20 dias', 'Dorsalgia', 28, 1, '2021-04-12 22:38:59', '2021-04-28 13:46:11'),
(8, 'Enzo', 'Galfione Bossana', 'Athos cada 8 hs jarabe, Febratic 25 ml cada 12 hs.', 'Febricula y tos seca.', 31, 1, '2021-04-12 22:42:28', '2021-04-27 17:31:05'),
(9, 'Gino', 'Galfione Bossana', 'Athos y febratic cada 8 hs. jarabe', 'Tos seca y febricula.', 31, 1, '2021-04-12 22:42:58', '2021-04-27 17:31:19'),
(14, 'Silvina', 'Quetglas', 'Losartan 400 mg', 'Hipertension arterial', 23, 1, '2021-04-28 17:07:45', '2021-04-28 17:07:45');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_hc`
--

CREATE TABLE `detalle_hc` (
  `id` int(11) NOT NULL,
  `id_hc` int(11) NOT NULL,
  `id_medico` int(11) NOT NULL,
  `ts_create` datetime NOT NULL DEFAULT current_timestamp(),
  `ts_update` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `especialidades_medicas`
--

CREATE TABLE `especialidades_medicas` (
  `id` int(11) NOT NULL,
  `especialidad_medica` varchar(255) COLLATE utf16_spanish2_ci NOT NULL,
  `habilitado` tinyint(1) NOT NULL DEFAULT 1,
  `ts_create` datetime NOT NULL DEFAULT current_timestamp(),
  `ts_update` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_spanish2_ci;

--
-- Volcado de datos para la tabla `especialidades_medicas`
--

INSERT INTO `especialidades_medicas` (`id`, `especialidad_medica`, `habilitado`, `ts_create`, `ts_update`) VALUES
(1, 'Medicina Interna', 1, '2021-03-24 21:24:06', '2021-03-24 21:24:06'),
(2, 'Nutrición', 1, '2021-03-24 21:25:22', '2021-04-22 14:54:56'),
(3, 'Oftalmología', 1, '2021-03-24 21:26:59', '2021-04-22 14:53:58'),
(4, 'Ginecología', 1, '2021-03-24 21:27:09', '2021-04-22 14:54:08'),
(5, 'Pediatría', 1, '2021-03-24 21:27:18', '2021-04-22 14:54:15'),
(6, 'Fisioterapia', 1, '2021-03-24 21:27:28', '2021-03-24 21:27:28'),
(7, 'Radiología', 1, '2021-03-24 21:27:36', '2021-04-22 14:54:21'),
(8, 'Psicología', 1, '2021-03-24 21:27:44', '2021-04-22 14:54:27'),
(9, 'Laboratorios clínicos', 1, '2021-03-24 21:28:18', '2021-04-22 14:54:34'),
(10, 'Dermatología', 1, '2021-03-24 21:29:01', '2021-04-22 14:55:21'),
(11, 'Ortopedia y Traumatología', 1, '2021-03-24 21:29:32', '2021-04-22 14:55:29');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historia_clinica`
--

CREATE TABLE `historia_clinica` (
  `id` int(11) NOT NULL,
  `id_dni` int(11) NOT NULL,
  `ts_create` datetime NOT NULL DEFAULT current_timestamp(),
  `ts_update` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_spanish2_ci;

--
-- Volcado de datos para la tabla `historia_clinica`
--

INSERT INTO `historia_clinica` (`id`, `id_dni`, `ts_create`, `ts_update`) VALUES
(1, 40802037, '2021-03-26 00:10:19', '2021-03-26 00:10:19');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `medicos`
--

CREATE TABLE `medicos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) COLLATE utf16_spanish2_ci NOT NULL,
  `apellido` varchar(255) COLLATE utf16_spanish2_ci NOT NULL,
  `fecha_de_nacimiento` date NOT NULL,
  `edad` int(11) NOT NULL,
  `especialidad` int(11) NOT NULL,
  `habilitado` tinyint(1) NOT NULL DEFAULT 1,
  `ts_create` datetime NOT NULL DEFAULT current_timestamp(),
  `ts_update` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `antiguedad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_spanish2_ci;

--
-- Volcado de datos para la tabla `medicos`
--

INSERT INTO `medicos` (`id`, `nombre`, `apellido`, `fecha_de_nacimiento`, `edad`, `especialidad`, `habilitado`, `ts_create`, `ts_update`, `antiguedad`) VALUES
(22, 'Anahi', 'Zunino', '1991-08-25', 29, 9, 0, '2021-04-27 13:00:37', '2021-04-28 05:03:01', 2),
(23, 'Victor Hugo', 'Garcia', '1966-12-23', 54, 1, 1, '2021-04-27 17:00:41', '2021-04-28 13:12:18', 35),
(24, 'Yanina Eliana', 'Galfione', '1973-10-15', 47, 7, 1, '2021-04-27 17:07:15', '2021-04-27 17:09:27', 15),
(25, 'Marisa', 'Guerra', '1963-09-15', 57, 6, 1, '2021-04-27 17:11:00', '2021-04-27 17:11:00', 15),
(26, 'Selene', 'Galvalisi', '1996-02-16', 25, 2, 1, '2021-04-27 17:12:14', '2021-04-27 17:12:14', 1),
(27, 'Maria Pia', 'Aranda', '1991-05-16', 30, 10, 1, '2021-04-27 17:17:13', '2021-04-27 17:17:13', 3),
(28, 'Ariel Oscar', 'Dassetto', '1969-03-20', 52, 11, 1, '2021-04-27 17:18:30', '2021-04-27 17:18:30', 17),
(29, 'Nestor Osvaldo', 'Zunino', '1956-05-28', 64, 9, 1, '2021-04-27 17:19:29', '2021-04-27 17:19:29', 35),
(30, 'Silvia ', 'Perez', '1988-02-10', 32, 9, 1, '2021-04-27 17:21:30', '2021-04-27 17:21:30', 7),
(31, 'Veronica Mabel', 'Bongiovanni', '0000-00-00', 46, 5, 1, '2021-04-27 17:23:08', '2021-04-28 05:02:49', 18),
(32, 'Gustavo', 'Nunez', '1962-12-23', 58, 3, 1, '2021-04-27 17:24:06', '2021-04-27 17:24:06', 27),
(33, 'Macarena', 'Giuliano', '1995-01-27', 26, 8, 1, '2021-04-27 17:24:59', '2021-04-27 17:24:59', 1),
(34, 'Sandra ', 'Camandona', '1968-05-14', 52, 8, 1, '2021-04-27 17:25:54', '2021-04-27 17:25:54', 27),
(35, 'Joaquin', 'Bertola', '1985-07-25', 35, 8, 1, '2021-04-27 17:26:45', '2021-04-27 17:26:45', 8);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `medicos_imagenes`
--

CREATE TABLE `medicos_imagenes` (
  `id` int(11) NOT NULL,
  `idMedicos` int(11) NOT NULL,
  `uid` varchar(255) COLLATE utf16_spanish2_ci NOT NULL COMMENT 'Referencia de la imagen',
  `ts_create` datetime NOT NULL DEFAULT current_timestamp(),
  `ts_update` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_spanish2_ci;

--
-- Volcado de datos para la tabla `medicos_imagenes`
--

INSERT INTO `medicos_imagenes` (`id`, `idMedicos`, `uid`, `ts_create`, `ts_update`) VALUES
(1, 22, 'e81aa275-ea9e-4159-adc9-2860cbea9dd8.jpeg', '2021-04-27 13:00:37', '2021-04-27 13:00:37'),
(2, 23, '46b670cc-3cd3-421d-8bc1-3d875859de99.jpeg', '2021-04-27 17:00:41', '2021-04-27 17:00:41'),
(3, 24, '134fb4e8-4620-44bf-8877-cbd0a5081265.jpeg', '2021-04-27 17:07:15', '2021-04-27 17:07:15'),
(4, 25, 'dd4fccaa-db72-4fb9-974f-b236d73291b7.jpeg', '2021-04-27 17:11:00', '2021-04-27 17:11:00'),
(5, 26, '5178be91-f07a-42c0-a7fa-2ac55d4e04c1.jpeg', '2021-04-27 17:12:14', '2021-04-27 17:12:14'),
(6, 27, '850e7cb8-18a9-4121-a9d2-15b60d31ba3f.jpeg', '2021-04-27 17:17:13', '2021-04-27 17:17:13'),
(7, 28, '1446ba92-bb44-4883-8b7e-7e7d30760b56.jpeg', '2021-04-27 17:18:30', '2021-04-27 17:18:30'),
(8, 29, 'b24d38f0-a369-4133-9f37-aed21b1fb8a0.jpeg', '2021-04-27 17:19:29', '2021-04-27 17:19:29'),
(9, 30, 'f480f082-0e2d-42c9-a853-5d1c48c2d3c9.jpeg', '2021-04-27 17:21:30', '2021-04-27 17:21:30'),
(10, 31, 'e4eec4fd-c4c5-45b5-a022-ed7a37cc6663.jpeg', '2021-04-27 17:23:08', '2021-04-27 17:23:08'),
(11, 32, 'b6735209-634b-4db2-9d1e-2d63f2cb89d7.jpeg', '2021-04-27 17:24:06', '2021-04-27 17:24:06'),
(12, 33, '7384ac80-1445-4564-9b4e-3af541f11ff2.jpeg', '2021-04-27 17:24:59', '2021-04-27 17:24:59'),
(13, 34, '3e255121-1f15-41d6-b7fe-64b6141810e8.jpeg', '2021-04-27 17:25:54', '2021-04-27 17:25:54'),
(14, 35, '5165d2bf-7dcd-4071-aef9-92c0cd860a53.jpeg', '2021-04-27 17:26:45', '2021-04-27 17:26:45');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `obras_sociales`
--

CREATE TABLE `obras_sociales` (
  `id` int(11) NOT NULL,
  `nombre_obra` varchar(255) COLLATE utf16_spanish2_ci NOT NULL,
  `habilitado` tinyint(1) NOT NULL DEFAULT 1,
  `ts_create` datetime NOT NULL DEFAULT current_timestamp(),
  `ts_update` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_spanish2_ci;

--
-- Volcado de datos para la tabla `obras_sociales`
--

INSERT INTO `obras_sociales` (`id`, `nombre_obra`, `habilitado`, `ts_create`, `ts_update`) VALUES
(1, 'APROSS', 1, '2021-04-12 17:15:43', '2021-04-12 17:15:43'),
(2, 'SIPSSA', 1, '2021-04-12 17:15:50', '2021-04-12 17:15:50'),
(3, 'JERARQUICOS SALUD', 1, '2021-04-12 17:16:04', '2021-04-12 17:16:04'),
(4, 'PAMI', 1, '2021-04-12 17:16:11', '2021-04-12 17:16:11'),
(5, 'MUTUAL MEDICA', 1, '2021-04-12 17:16:20', '2021-04-12 17:16:20'),
(6, 'OSDE', 1, '2021-04-12 17:16:50', '2021-04-12 17:16:50'),
(7, 'MET', 1, '2021-04-12 17:16:59', '2021-04-12 17:16:59'),
(8, 'SANCOR SALUD', 1, '2021-04-12 17:17:25', '2021-04-12 17:17:25'),
(9, 'PLAN SOCIAL', 1, '2021-04-12 17:17:38', '2021-04-12 17:17:38'),
(10, 'PARTE PRIVADA', 1, '2021-04-12 17:17:50', '2021-04-12 17:17:50');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pacientes`
--

CREATE TABLE `pacientes` (
  `nombre` varchar(255) COLLATE utf16_spanish2_ci NOT NULL,
  `apellido` varchar(255) COLLATE utf16_spanish2_ci NOT NULL,
  `dni` int(11) NOT NULL,
  `fecha_de_nacimiento` date NOT NULL,
  `edad` int(3) NOT NULL,
  `obra_social` int(11) NOT NULL DEFAULT 10,
  `habilitado` tinyint(1) NOT NULL DEFAULT 1,
  `ts_update` datetime NOT NULL DEFAULT current_timestamp(),
  `ts_create` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_spanish2_ci;

--
-- Volcado de datos para la tabla `pacientes`
--

INSERT INTO `pacientes` (`nombre`, `apellido`, `dni`, `fecha_de_nacimiento`, `edad`, `obra_social`, `habilitado`, `ts_update`, `ts_create`) VALUES
('Ruben', 'Galfione', 4506897, '1938-05-01', 73, 4, 1, '2021-04-28 12:50:56', '2021-04-28 12:50:56'),
('Sarina', 'Suarez', 6708999, '1951-05-26', 70, 4, 1, '2021-04-22 15:14:01', '2021-04-22 15:14:01'),
('Calendario', 'Galicia', 12345654, '2232-02-12', 33, 8, 1, '2021-03-27 15:31:19', '2021-04-12 16:45:00'),
('Yanina Eliana', 'Galfione', 23135244, '1973-10-15', 47, 3, 1, '2021-04-28 05:31:55', '2021-04-28 05:31:55'),
('Dario Martin', 'Rosas', 23456912, '1965-02-23', 55, 10, 1, '2021-04-12 16:30:53', '2021-04-12 16:44:16'),
('Bruno Luis', 'Busilli', 32908555, '1986-10-09', 34, 5, 1, '2021-04-22 15:11:43', '2021-04-22 15:11:43'),
('Fiorella', 'Garcia Galfione', 38161719, '1994-11-14', 26, 3, 1, '2021-03-26 00:09:33', '2021-04-12 16:45:20'),
('Manuel', 'Nicola', 38456001, '1996-01-25', 24, 10, 1, '2021-03-27 15:32:54', '2021-04-12 16:44:51'),
('Alfonsina', 'Garcia Galfione', 40802037, '1998-09-23', 22, 2, 1, '2021-03-26 00:08:52', '2021-03-26 00:08:52'),
('Carlos Alberto', 'Lepore', 45908746, '2001-04-12', 26, 6, 1, '2021-04-12 17:19:04', '2021-04-12 17:19:04');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personal_centro`
--

CREATE TABLE `personal_centro` (
  `id` int(11) NOT NULL,
  `user` varchar(255) COLLATE utf16_spanish2_ci NOT NULL,
  `pass` varchar(255) COLLATE utf16_spanish2_ci NOT NULL,
  `admin` tinyint(1) NOT NULL DEFAULT 0,
  `habilitado` tinyint(1) NOT NULL DEFAULT 1,
  `ts_create` datetime NOT NULL DEFAULT current_timestamp(),
  `ts_update` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_spanish2_ci;

--
-- Volcado de datos para la tabla `personal_centro`
--

INSERT INTO `personal_centro` (`id`, `user`, `pass`, `admin`, `habilitado`, `ts_create`, `ts_update`) VALUES
(1, 'VictorHG', 'dca6844c099ce1cabd6890e2f5310166b11730b8', 1, 1, '2021-04-22 18:56:59', '2021-04-28 05:18:44'),
(2, 'YaninaEG', '9a6aa8b8b6919d3b97d0f40c9eda85f5523c7dd2', 1, 1, '2021-04-22 18:57:32', '2021-04-28 05:18:51'),
(3, 'MarisaG', 'b82b502826ef050669f0ed646305d1df7008feb3', 0, 1, '2021-04-22 18:57:48', '2021-04-28 04:41:58'),
(4, 'SeleneG', '7e697c3e9713c7546a6e99faee3562d059fb2b38', 0, 1, '2021-04-22 18:58:01', '2021-04-28 04:47:10'),
(5, 'MacarenaNG', '0f2880dd3c71f273cd6223c592e91e2da6e00b12', 0, 0, '2021-04-22 20:05:03', '2021-04-28 04:45:46'),
(6, 'BrunoLuis', '33873505cbecb01be0cd4b448a4df5e458135795', 1, 1, '2021-04-27 17:57:37', '2021-04-28 04:05:38'),
(7, 'FiorellaGG', '8f2fa9baba78434ffe4c93388e175ac9964251af', 1, 1, '2021-04-28 04:42:18', '2021-04-28 15:17:50');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sugerencias`
--

CREATE TABLE `sugerencias` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf16_spanish2_ci NOT NULL,
  `message` varchar(255) COLLATE utf16_spanish2_ci NOT NULL,
  `email` varchar(255) COLLATE utf16_spanish2_ci NOT NULL,
  `ts_create` datetime NOT NULL DEFAULT current_timestamp(),
  `ts_update` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_spanish2_ci;

--
-- Volcado de datos para la tabla `sugerencias`
--

INSERT INTO `sugerencias` (`id`, `name`, `message`, `email`, `ts_create`, `ts_update`) VALUES
(1, 'Julia Ponce', 'Seria muy bueno poder incorporar atención 24 hs los fines de semana.', 'juliaponce@hotmail.com', '2021-04-28 15:00:40', '2021-04-28 15:00:40');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `consultas`
--
ALTER TABLE `consultas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_medico` (`id_medico`);

--
-- Indices de la tabla `detalle_hc`
--
ALTER TABLE `detalle_hc`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_hc` (`id_hc`,`id_medico`),
  ADD KEY `id_medico` (`id_medico`);

--
-- Indices de la tabla `especialidades_medicas`
--
ALTER TABLE `especialidades_medicas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `historia_clinica`
--
ALTER TABLE `historia_clinica`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_dni` (`id_dni`);

--
-- Indices de la tabla `medicos`
--
ALTER TABLE `medicos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `especialidad` (`especialidad`);

--
-- Indices de la tabla `medicos_imagenes`
--
ALTER TABLE `medicos_imagenes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idMedicos` (`idMedicos`);

--
-- Indices de la tabla `obras_sociales`
--
ALTER TABLE `obras_sociales`
  ADD PRIMARY KEY (`id`),
  ADD KEY `nombre_obra` (`nombre_obra`);

--
-- Indices de la tabla `pacientes`
--
ALTER TABLE `pacientes`
  ADD PRIMARY KEY (`dni`),
  ADD KEY `obra_social` (`obra_social`);

--
-- Indices de la tabla `personal_centro`
--
ALTER TABLE `personal_centro`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `sugerencias`
--
ALTER TABLE `sugerencias`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `consultas`
--
ALTER TABLE `consultas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `detalle_hc`
--
ALTER TABLE `detalle_hc`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `especialidades_medicas`
--
ALTER TABLE `especialidades_medicas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `historia_clinica`
--
ALTER TABLE `historia_clinica`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `medicos`
--
ALTER TABLE `medicos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT de la tabla `medicos_imagenes`
--
ALTER TABLE `medicos_imagenes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `obras_sociales`
--
ALTER TABLE `obras_sociales`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `personal_centro`
--
ALTER TABLE `personal_centro`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `sugerencias`
--
ALTER TABLE `sugerencias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `consultas`
--
ALTER TABLE `consultas`
  ADD CONSTRAINT `consultas_ibfk_1` FOREIGN KEY (`id_medico`) REFERENCES `medicos` (`id`);

--
-- Filtros para la tabla `detalle_hc`
--
ALTER TABLE `detalle_hc`
  ADD CONSTRAINT `detalle_hc_ibfk_1` FOREIGN KEY (`id_hc`) REFERENCES `historia_clinica` (`id`),
  ADD CONSTRAINT `detalle_hc_ibfk_2` FOREIGN KEY (`id_medico`) REFERENCES `medicos` (`id`);

--
-- Filtros para la tabla `historia_clinica`
--
ALTER TABLE `historia_clinica`
  ADD CONSTRAINT `historia_clinica_ibfk_1` FOREIGN KEY (`id_dni`) REFERENCES `pacientes` (`dni`);

--
-- Filtros para la tabla `medicos`
--
ALTER TABLE `medicos`
  ADD CONSTRAINT `medicos_ibfk_1` FOREIGN KEY (`especialidad`) REFERENCES `especialidades_medicas` (`id`);

--
-- Filtros para la tabla `medicos_imagenes`
--
ALTER TABLE `medicos_imagenes`
  ADD CONSTRAINT `medicos_imagenes_ibfk_1` FOREIGN KEY (`idMedicos`) REFERENCES `medicos` (`id`);

--
-- Filtros para la tabla `pacientes`
--
ALTER TABLE `pacientes`
  ADD CONSTRAINT `pacientes_ibfk_1` FOREIGN KEY (`obra_social`) REFERENCES `obras_sociales` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
