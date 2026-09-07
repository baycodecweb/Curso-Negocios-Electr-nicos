-- phpMyAdmin SQL Dump
-- version 5.2.4-dev+20260809.e0909b211bdeb1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 07-09-2026 a las 21:58:28
-- Versión del servidor: 11.8.8-MariaDB-1 from Debian
-- Versión de PHP: 8.4.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `grafiluz_db`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auditoria_admin_tb_baycodec`
--

CREATE TABLE `auditoria_admin_tb_baycodec` (
  `id` int(11) NOT NULL,
  `admin_usuario` varchar(60) NOT NULL,
  `accion` varchar(60) NOT NULL,
  `referencia_id` int(11) DEFAULT NULL,
  `detalle` varchar(255) NOT NULL DEFAULT '',
  `creado_en` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `calificaciones_vendedor_tb_baycodec`
--

CREATE TABLE `calificaciones_vendedor_tb_baycodec` (
  `id` int(11) NOT NULL,
  `vendedor_id` int(11) NOT NULL,
  `cliente_id` int(11) NOT NULL,
  `calificacion` tinyint(4) NOT NULL,
  `comentario` varchar(500) NOT NULL DEFAULT '',
  `creado_en` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carritos_tb_baycodec`
--

CREATE TABLE `carritos_tb_baycodec` (
  `id` int(11) NOT NULL,
  `cliente_id` int(11) NOT NULL,
  `actualizado_en` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `carritos_tb_baycodec`
--

INSERT INTO `carritos_tb_baycodec` (`id`, `cliente_id`, `actualizado_en`) VALUES
(1, 18, '2026-09-06 05:23:20'),
(2, 19, '2026-09-06 05:31:38');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carrito_items_tb_baycodec`
--

CREATE TABLE `carrito_items_tb_baycodec` (
  `id` int(11) NOT NULL,
  `carrito_id` int(11) NOT NULL,
  `producto_codigo` varchar(60) NOT NULL,
  `cantidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `carrito_items_tb_baycodec`
--

INSERT INTO `carrito_items_tb_baycodec` (`id`, `carrito_id`, `producto_codigo`, `cantidad`) VALUES
(1, 1, 'mi-tienda-c2c-llavero-01', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias_tb_baycodec`
--

CREATE TABLE `categorias_tb_baycodec` (
  `id` int(11) NOT NULL,
  `nombre` varchar(80) NOT NULL,
  `slug` varchar(80) NOT NULL DEFAULT '',
  `descripcion` varchar(255) NOT NULL DEFAULT '',
  `imagen_url` varchar(500) NOT NULL DEFAULT '',
  `creado_en` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `categorias_tb_baycodec`
--

INSERT INTO `categorias_tb_baycodec` (`id`, `nombre`, `slug`, `descripcion`, `imagen_url`, `creado_en`) VALUES
(1, 'Artículos Antiestrés', 'art-culos-antiestr-s', '', '', '2026-09-06 03:14:15'),
(2, 'Artículos de Escritorio', 'art-culos-de-escritorio', '', '', '2026-09-06 03:14:15'),
(3, 'Tomatodos y Tazas', 'tomatodos-y-tazas', '', '', '2026-09-06 03:14:15'),
(4, 'Llaveros', 'llaveros', '', '', '2026-09-06 03:14:15'),
(5, 'Bolsas Publicitarias', 'bolsas-publicitarias', '', '', '2026-09-06 03:14:15'),
(6, 'ARTICULOS Papeleria', 'articulos-papeleria', '', '', '2026-09-06 03:14:15');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes_tb_baycodec`
--

CREATE TABLE `clientes_tb_baycodec` (
  `id` int(11) NOT NULL,
  `usuario` varchar(120) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `nombre` varchar(180) NOT NULL,
  `apellidos` varchar(180) NOT NULL DEFAULT '',
  `dni` varchar(15) NOT NULL DEFAULT '',
  `telefono` varchar(20) NOT NULL DEFAULT '',
  `direccion` varchar(255) NOT NULL DEFAULT '',
  `latitud` decimal(10,7) DEFAULT NULL,
  `longitud` decimal(10,7) DEFAULT NULL,
  `tipo_cliente` enum('B2C','B2B','C2C') NOT NULL DEFAULT 'B2C',
  `ruc` varchar(20) DEFAULT '',
  `plataforma_reventa` varchar(180) DEFAULT '',
  `creado_en` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `clientes_tb_baycodec`
--

INSERT INTO `clientes_tb_baycodec` (`id`, `usuario`, `password_hash`, `nombre`, `apellidos`, `dni`, `telefono`, `direccion`, `latitud`, `longitud`, `tipo_cliente`, `ruc`, `plataforma_reventa`, `creado_en`) VALUES
(7, 'usuario', '$2y$12$S2qRvnwe8Ji3PlojA/peJOtCfyvuZK8xqx3dKgsygQ7t6NtGc/s7u', 'juan', 'diaz', '12345678', '999888777', 'Av. Prueba 123', -16.3709232, -71.5129521, 'B2C', '', '', '2026-09-05 16:08:52'),
(18, 'c2c', '$2y$12$B8k5ZvfeevlR3z9bSSWWSe8D44FNLq185r9rMNI4BUCuNetknr8iS', 'c2c', 'vendedor', '12345678', '970000001', 'Av. Prueba 123', -16.3916104, -71.5408498, 'C2C', '', 'feria', '2026-09-06 04:07:34'),
(19, 'b2b', '$2y$12$wYnLBaoIMl4cZGEZsk9t7eABu1BTIX1JJhDoswbb1WwMmH8Io4aSW', 'Vendedor Demo', 'b2b', '12345678', '999888777', 'Av. Prueba 123', -16.3928098, -71.5243542, 'B2B', '20123456789', '', '2026-09-06 05:30:04');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comisiones_tb_baycodec`
--

CREATE TABLE `comisiones_tb_baycodec` (
  `id` int(11) NOT NULL,
  `pedido_id` int(11) NOT NULL,
  `vendedor_id` int(11) NOT NULL,
  `monto_venta` decimal(10,2) NOT NULL,
  `porcentaje_comision` decimal(5,2) NOT NULL,
  `monto_comision` decimal(10,2) NOT NULL,
  `monto_vendedor` decimal(10,2) NOT NULL,
  `creado_en` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `configuracion_tb_baycodec`
--

CREATE TABLE `configuracion_tb_baycodec` (
  `clave` varchar(60) NOT NULL,
  `valor` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `configuracion_tb_baycodec`
--

INSERT INTO `configuracion_tb_baycodec` (`clave`, `valor`) VALUES
('comision_marketplace_porcentaje', '10'),
('igv_porcentaje', '18'),
('moneda_base', 'PEN'),
('whatsapp_numero', '51930910829');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cupones_tb_baycodec`
--

CREATE TABLE `cupones_tb_baycodec` (
  `id` int(11) NOT NULL,
  `codigo` varchar(40) NOT NULL,
  `tipo` enum('porcentaje','fijo') NOT NULL DEFAULT 'porcentaje',
  `valor` decimal(10,2) NOT NULL,
  `fecha_inicio` date DEFAULT NULL,
  `fecha_fin` date DEFAULT NULL,
  `usos_maximos` int(11) DEFAULT NULL,
  `usos_actuales` int(11) NOT NULL DEFAULT 0,
  `activo` tinyint(1) NOT NULL DEFAULT 1,
  `creado_en` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_pedido_tb_baycodec`
--

CREATE TABLE `detalle_pedido_tb_baycodec` (
  `id` int(11) NOT NULL,
  `pedido_id` int(11) NOT NULL,
  `producto_codigo` varchar(60) NOT NULL,
  `producto_nombre` varchar(180) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precio_unitario` decimal(10,2) NOT NULL,
  `vendedor_id` int(11) DEFAULT NULL,
  `variante_id` int(11) DEFAULT NULL,
  `variante_nombre` varchar(120) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `detalle_pedido_tb_baycodec`
--

INSERT INTO `detalle_pedido_tb_baycodec` (`id`, `pedido_id`, `producto_codigo`, `producto_nombre`, `cantidad`, `precio_unitario`, `vendedor_id`, `variante_id`, `variante_nombre`) VALUES
(10, 9, 'papeleria-001', 'Tarjetas de presentación', 1, 7.74, NULL, NULL, ''),
(11, 9, 'antiestres-005', 'Corazon Amtiestres', 1, 16.78, NULL, NULL, ''),
(12, 9, 'antiestres-008', 'Dado antiestres', 1, 16.82, NULL, NULL, ''),
(13, 9, 'antiestres-007', 'Dado antiestres', 1, 16.82, NULL, NULL, ''),
(14, 10, 'bolsas-009', 'Bolsa Notex plana', 1, 9.07, NULL, NULL, ''),
(15, 11, 'antiestres-007', 'Dado antiestres', 1, 16.82, NULL, NULL, ''),
(16, 12, 'mi-tienda-c2c-llavero-01', 'Llavero de Cuero Grabado', 1, 0.07, 18, NULL, ''),
(17, 12, 'antiestres-005', 'Corazon Amtiestres', 2, 16.78, NULL, NULL, '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `direcciones_tb_baycodec`
--

CREATE TABLE `direcciones_tb_baycodec` (
  `id` int(11) NOT NULL,
  `cliente_id` int(11) NOT NULL,
  `etiqueta` varchar(60) NOT NULL DEFAULT 'Principal',
  `direccion` varchar(255) NOT NULL,
  `latitud` decimal(10,7) DEFAULT NULL,
  `longitud` decimal(10,7) DEFAULT NULL,
  `predeterminada` tinyint(1) NOT NULL DEFAULT 0,
  `creado_en` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `direcciones_tb_baycodec`
--

INSERT INTO `direcciones_tb_baycodec` (`id`, `cliente_id`, `etiqueta`, `direccion`, `latitud`, `longitud`, `predeterminada`, `creado_en`) VALUES
(1, 18, 'Principal', 'Av. Prueba 123', -16.3916104, -71.5408498, 1, '2026-09-06 04:07:34'),
(2, 19, 'Principal', 'Av. Prueba 123', -16.3928098, -71.5243542, 1, '2026-09-06 05:30:04');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `eventos_analitica_tb_baycodec`
--

CREATE TABLE `eventos_analitica_tb_baycodec` (
  `id` int(11) NOT NULL,
  `tipo_evento` varchar(60) NOT NULL,
  `datos_json` varchar(1000) NOT NULL DEFAULT '{}',
  `pagina` varchar(80) NOT NULL DEFAULT '',
  `cliente_id` int(11) DEFAULT NULL,
  `creado_en` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `eventos_analitica_tb_baycodec`
--

INSERT INTO `eventos_analitica_tb_baycodec` (`id`, `tipo_evento`, `datos_json`, `pagina`, `cliente_id`, `creado_en`) VALUES
(1, 'visita', '[]', 'tienda.php', NULL, '2026-09-06 05:12:56'),
(2, 'visita', '[]', 'tienda.php', NULL, '2026-09-06 05:14:23'),
(3, 'visita', '[]', 'tienda.php', NULL, '2026-09-06 05:18:19'),
(4, 'visita', '[]', 'tienda.php', NULL, '2026-09-06 05:18:39'),
(5, 'visita', '[]', 'carrito.php', 18, '2026-09-06 05:19:23'),
(6, 'visita', '[]', 'tienda.php', 18, '2026-09-06 05:22:33'),
(7, 'visita', '[]', 'tienda.php', NULL, '2026-09-06 05:25:19'),
(8, 'visita', '[]', 'carrito.php', 7, '2026-09-06 05:25:50'),
(9, 'visita', '[]', 'tienda.php', 7, '2026-09-06 05:26:52'),
(10, 'visita', '[]', 'carrito.php', 7, '2026-09-06 05:26:56'),
(11, 'visita', '[]', 'carrito.php', 7, '2026-09-06 05:27:05'),
(12, 'visita', '[]', 'carrito.php', 7, '2026-09-06 05:27:10'),
(13, 'visita', '[]', 'tienda.php', NULL, '2026-09-06 05:27:15'),
(14, 'visita', '[]', 'tienda.php', NULL, '2026-09-06 05:27:19'),
(15, 'visita', '[]', 'tienda.php', NULL, '2026-09-06 05:27:22'),
(16, 'visita', '[]', 'carrito.php', 19, '2026-09-06 05:30:04'),
(17, 'visita', '[]', 'tienda.php', 19, '2026-09-06 05:30:22'),
(18, 'visita', '[]', 'tienda.php', 19, '2026-09-06 05:30:39'),
(19, 'visita', '[]', 'carrito.php', 19, '2026-09-06 05:30:56'),
(20, 'pedido_generado', '{\"total\":41.63}', 'carrito.php', 19, '2026-09-06 05:31:38'),
(21, 'pago_rechazado', '{\"pedidoId\":12,\"motivo\":\"rechazada\"}', 'carrito.php', 19, '2026-09-06 05:32:11'),
(22, 'pago_rechazado', '{\"pedidoId\":12,\"motivo\":\"numero_invalido\"}', 'carrito.php', 19, '2026-09-06 05:32:19'),
(23, 'pago_rechazado', '{\"pedidoId\":12,\"motivo\":\"rechazada\"}', 'carrito.php', 19, '2026-09-06 05:32:30'),
(24, 'pago_rechazado', '{\"pedidoId\":12,\"motivo\":\"rechazada\"}', 'carrito.php', 19, '2026-09-06 05:32:49'),
(25, 'visita', '[]', 'carrito.php', 19, '2026-09-06 05:33:47'),
(26, 'visita', '[]', 'carrito.php', NULL, '2026-09-06 11:33:17'),
(27, 'visita', '[]', 'tienda.php', NULL, '2026-09-06 11:33:20'),
(28, 'visita', '[]', 'tienda.php', NULL, '2026-09-06 16:36:29'),
(29, 'visita', '[]', 'tienda.php', NULL, '2026-09-06 16:36:39'),
(30, 'visita', '[]', 'tienda.php', NULL, '2026-09-06 16:36:42'),
(31, 'visita', '[]', 'tienda.php', NULL, '2026-09-06 16:37:47'),
(32, 'visita', '[]', 'carrito.php', 7, '2026-09-06 16:38:04'),
(33, 'visita', '[]', 'carrito.php', 7, '2026-09-06 16:38:23'),
(34, 'visita', '[]', 'carrito.php', 7, '2026-09-06 16:38:35'),
(35, 'visita', '[]', 'tienda.php', 7, '2026-09-06 16:38:39'),
(36, 'visita', '[]', 'tienda.php', 7, '2026-09-06 16:50:10'),
(37, 'visita', '[]', 'tienda.php', 7, '2026-09-06 16:51:33'),
(38, 'visita', '[]', 'tienda.php', 7, '2026-09-06 16:55:49'),
(39, 'visita', '[]', 'tienda.php', 7, '2026-09-06 16:56:06'),
(40, 'visita', '[]', 'tienda.php', 7, '2026-09-06 16:57:20'),
(41, 'busqueda_catalogo', '{\"texto\":\"baycodec\",\"categoria\":\"\"}', 'tienda.php', 7, '2026-09-06 16:57:31'),
(42, 'visita', '[]', 'tienda.php', 7, '2026-09-06 16:57:51'),
(43, 'visita', '[]', 'tienda.php', 7, '2026-09-06 16:58:42'),
(44, 'busqueda_catalogo', '{\"texto\":\"ba\",\"categoria\":\"\"}', 'tienda.php', 7, '2026-09-06 16:58:46'),
(45, 'busqueda_catalogo', '{\"texto\":\"bay\",\"categoria\":\"\"}', 'tienda.php', 7, '2026-09-06 16:58:47'),
(46, 'busqueda_catalogo', '{\"texto\":\"bayc\",\"categoria\":\"\"}', 'tienda.php', 7, '2026-09-06 16:58:50'),
(47, 'busqueda_catalogo', '{\"texto\":\"baycodec\",\"categoria\":\"\"}', 'tienda.php', 7, '2026-09-06 16:58:51'),
(48, 'visita', '[]', 'tienda.php', NULL, '2026-09-07 19:39:39'),
(49, 'visita', '[]', 'tienda.php', NULL, '2026-09-07 19:45:32');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `favoritos_tb_baycodec`
--

CREATE TABLE `favoritos_tb_baycodec` (
  `id` int(11) NOT NULL,
  `cliente_id` int(11) NOT NULL,
  `producto_codigo` varchar(60) NOT NULL,
  `creado_en` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `movimientos_inventario_tb_baycodec`
--

CREATE TABLE `movimientos_inventario_tb_baycodec` (
  `id` int(11) NOT NULL,
  `producto_codigo` varchar(60) NOT NULL,
  `tipo` enum('entrada','salida') NOT NULL,
  `cantidad` int(11) NOT NULL,
  `motivo` varchar(180) NOT NULL DEFAULT '',
  `creado_en` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `movimientos_inventario_tb_baycodec`
--

INSERT INTO `movimientos_inventario_tb_baycodec` (`id`, `producto_codigo`, `tipo`, `cantidad`, `motivo`, `creado_en`) VALUES
(1, 'prueba-audit-001', 'entrada', 5, 'Stock inicial al publicar el producto', '2026-09-06 04:23:29');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notificaciones_tb_baycodec`
--

CREATE TABLE `notificaciones_tb_baycodec` (
  `id` int(11) NOT NULL,
  `cliente_id` int(11) DEFAULT NULL,
  `tipo` varchar(60) NOT NULL,
  `asunto` varchar(180) NOT NULL,
  `cuerpo` varchar(500) NOT NULL DEFAULT '',
  `enviado` tinyint(1) NOT NULL DEFAULT 0,
  `creado_en` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `notificaciones_tb_baycodec`
--

INSERT INTO `notificaciones_tb_baycodec` (`id`, `cliente_id`, `tipo`, `asunto`, `cuerpo`, `enviado`, `creado_en`) VALUES
(1, 19, 'pedido_generado', 'Pedido #12 registrado — Grafiluz', 'Registramos tu pedido #12 (1 x Llavero de Cuero Grabado, 2 x Corazon Amtiestres) por un total de S/ 41.63.', 0, '2026-09-06 05:31:38'),
(2, 19, 'pago_rechazado', 'Tu pago del Pedido #12 fue rechazado — Grafiluz', 'Tu banco rechazó la operación (tarjeta de prueba de rechazo).', 0, '2026-09-06 05:32:11'),
(3, 19, 'pago_rechazado', 'Tu pago del Pedido #12 fue rechazado — Grafiluz', 'Tu banco rechazó la operación (tarjeta de prueba de rechazo).', 0, '2026-09-06 05:32:30'),
(4, 19, 'pago_rechazado', 'Tu pago del Pedido #12 fue rechazado — Grafiluz', 'Tu banco rechazó la operación (tarjeta de prueba de rechazo).', 0, '2026-09-06 05:32:49');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pagos_tb_baycodec`
--

CREATE TABLE `pagos_tb_baycodec` (
  `id` int(11) NOT NULL,
  `pedido_id` int(11) NOT NULL,
  `estado` varchar(20) NOT NULL DEFAULT 'Pendiente',
  `metodo` varchar(60) DEFAULT NULL,
  `transaccion_id` varchar(60) DEFAULT NULL,
  `creado_en` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `pagos_tb_baycodec`
--

INSERT INTO `pagos_tb_baycodec` (`id`, `pedido_id`, `estado`, `metodo`, `transaccion_id`, `creado_en`) VALUES
(8, 9, 'Pendiente', NULL, NULL, '2026-09-06 02:37:17'),
(9, 10, 'Pendiente', NULL, NULL, '2026-09-06 02:38:00'),
(10, 11, 'Pendiente', NULL, NULL, '2026-09-06 02:42:02'),
(11, 12, 'Rechazado', NULL, NULL, '2026-09-06 05:31:38');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pagos_vendedor_tb_baycodec`
--

CREATE TABLE `pagos_vendedor_tb_baycodec` (
  `id` int(11) NOT NULL,
  `vendedor_id` int(11) NOT NULL,
  `monto` decimal(10,2) NOT NULL,
  `metodo` varchar(60) NOT NULL DEFAULT '',
  `referencia` varchar(120) NOT NULL DEFAULT '',
  `creado_en` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos_tb_baycodec`
--

CREATE TABLE `pedidos_tb_baycodec` (
  `id` int(11) NOT NULL,
  `cliente_id` int(11) NOT NULL,
  `total` decimal(10,2) NOT NULL DEFAULT 0.00,
  `estado` varchar(20) NOT NULL DEFAULT 'Pendiente',
  `creado_en` timestamp NULL DEFAULT current_timestamp(),
  `direccion_id` int(11) DEFAULT NULL,
  `direccion_envio_texto` varchar(255) NOT NULL DEFAULT '',
  `cupon_id` int(11) DEFAULT NULL,
  `descuento_aplicado` decimal(10,2) NOT NULL DEFAULT 0.00,
  `subtotal` decimal(10,2) NOT NULL DEFAULT 0.00,
  `igv_monto` decimal(10,2) NOT NULL DEFAULT 0.00,
  `envio_costo` decimal(10,2) NOT NULL DEFAULT 0.00,
  `envio_zona` varchar(120) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `pedidos_tb_baycodec`
--

INSERT INTO `pedidos_tb_baycodec` (`id`, `cliente_id`, `total`, `estado`, `creado_en`, `direccion_id`, `direccion_envio_texto`, `cupon_id`, `descuento_aplicado`, `subtotal`, `igv_monto`, `envio_costo`, `envio_zona`) VALUES
(9, 7, 58.16, 'Pendiente', '2026-09-06 02:37:17', NULL, '', NULL, 0.00, 0.00, 0.00, 0.00, ''),
(10, 7, 9.07, 'Pendiente', '2026-09-06 02:38:00', NULL, '', NULL, 0.00, 0.00, 0.00, 0.00, ''),
(11, 7, 16.82, 'Pendiente', '2026-09-06 02:42:02', NULL, '', NULL, 0.00, 0.00, 0.00, 0.00, ''),
(12, 19, 41.63, 'Pendiente', '2026-09-06 05:31:38', 2, 'Av. Prueba 123', NULL, 0.00, 33.63, 5.13, 8.00, 'Arequipa Metropolitana');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos_tb_baycodec`
--

CREATE TABLE `productos_tb_baycodec` (
  `id` int(11) NOT NULL,
  `codigo` varchar(60) NOT NULL,
  `categoria` varchar(120) NOT NULL,
  `nombre` varchar(180) NOT NULL,
  `medidas` varchar(120) DEFAULT '',
  `material` varchar(180) DEFAULT '',
  `colores` varchar(255) DEFAULT '',
  `imagen_url` varchar(500) DEFAULT '',
  `precio_referencial_pen` decimal(10,2) NOT NULL DEFAULT 0.00,
  `stock` int(11) DEFAULT NULL,
  `activo` tinyint(1) NOT NULL DEFAULT 1,
  `vendedor_id` int(11) DEFAULT NULL,
  `creado_en` timestamp NULL DEFAULT current_timestamp(),
  `actualizado_en` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `productos_tb_baycodec`
--

INSERT INTO `productos_tb_baycodec` (`id`, `codigo`, `categoria`, `nombre`, `medidas`, `material`, `colores`, `imagen_url`, `precio_referencial_pen`, `stock`, `activo`, `vendedor_id`, `creado_en`, `actualizado_en`) VALUES
(1, 'antiestres-001', 'Artículos Antiestrés', 'Muñeco Antiestrés', '10.5 x 7 cm', 'Espuma de goma', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhlyPhuQc1jRsFVeeprlpS-188egRyQr32b3k00DrNMVCrhbOXocq0GsUkf_M7JGLg1Fh5tS-PhDCT5iORxdl6jws9JQQPv-i5OqPEuV1kU4Y5JCeNPpdiEc1WByamGoAGjn34Vehh1l6XcgZpuyKcPsl9vsBncVTtHzKQ_cPdVSYJz8fgM0HGxCuXAdk-Y/s800/1.png', 18.49, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 06:05:44'),
(2, 'antiestres-002', 'Artículos Antiestrés', 'Muñeco Antiestrés Minero', '10 x 7 cm', 'Espuma de goma', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgUbEFxKngKXEu8Sc5F8aKybtc3iONkUUXtQSjlW_CfjUUZSL9U1R8h92jTAY1wfhlWZC9_cr7XdyDEh6F_u2ryx-_0bXz1ilq7VWsdgV4OO92YrzfH5JVHrVyRVuZiWG7e33ES9q4qHSTT8zDgrQ6_bM-Ml6QQ_wo0OjJ8jW1GFe_9CdjqNxbE70aK7cIB/s800/2.png', 14.94, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(3, 'antiestres-003', 'Artículos Antiestrés', 'Muñeco Antiestrés Deportista', '9.3 x 7 cm', 'Espuma de goma', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEi5OBVEHld5hqcJ_tGlIjUGcPSrrL-vYITSFU4j-8EHoY9o9lFLHpthT7rXbKKdClOdxYJrgLVNphow1CqPUvwt4K8xHAm1A0LwTsDBKpCYsBnirQYPQUdCkLFqeT8QTSOvwWbYNtQtJ-1HItKXaQYtjyl-Wv4o1DXFQ_zV37q1xQAkuxl-TWnXty5TuSa0/s800/3.png', 15.17, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(4, 'antiestres-004', 'Artículos Antiestrés', 'Gota antiestres', '5.9 cm', 'Espuma de goma', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEi9B3ZfoAup0e4gSxMTZ1an3XhqRSDfAL9OjiOI5av1oWe7FYwxqO2WigOZbQ4dzbz5ola_9bHMOMPTEDW0ARbIdfbjuIE4kCRoSWthsXYl8gLjQsSpxKiZXq1fD2m4B9Jw1y7N7X9gQD9CwUjodO7n_dmdbZxTIBH4ApCJMjlLj-K9It4lnMa84VO2k0Or/s800/4.png', 14.69, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(5, 'antiestres-005', 'Artículos Antiestrés', 'Corazon Amtiestres', '7.0 cm x 7.0 cm', 'Espuma de goma', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEigArRucyy_E67bEmyF5Y6Z8SMFyBz-X0VKKDirxHSZiHxNlLisW7Ji6Ug_YLwy2MPg_ZNRlAuS6YDAJxTqQFBumblCB8It-os1GAEtaTqUKEp1e0evNn0Acn9RF945EhpwGMCqgfsF4ySM5Lq8us1TmFScHlIbqhc0QFDc9mXa0vx7SBJ9X1gcY9TjD3HE/s800/5.png', 16.78, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(6, 'antiestres-006', 'Artículos Antiestrés', 'Corazon Amtiestres', 'Ancho 7.0 cm x 7.0 cm', 'Espuma de goma', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgbuHQNJZ2UWGQO3H3Zf5yU2ecH3dha8lTlquJOCiaMrWXnC2lCy9ZwMW-hqiEMZR4TWrmRuCXJyKwN8Ny0Qz1r26012NCLVa3ymc_e7Mayj0Kqdel5G-EKQUOjpRdwZtFqshndDEuxN0E5vcXcE6moqEGhrEgdwokG4diXaYOzv6eCgsXauzC2zQTi29Nh/s800/6.png', 16.78, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(7, 'antiestres-007', 'Artículos Antiestrés', 'Dado antiestres', '7.0 cm x 7.0 cm', 'Espuma de goma', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEiZQ0q0L1MhULItgkC8ui1rDnTzdDjRhgFoepbtE_QQatnutArHF1nlKk7OpK6KCwEvFBvPFrwLjrNJzEfq7lGiFChoKt5A6QsL4QZ1-KSjbLWV3hT0XaEUsllA_mN1BGNev-y03aauVTvkBuo_5eTjqmIhSoFFpPvP8AwD6J7XbCh3M2oUHRbe6kB6fnOV/s800/7.png', 16.82, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(8, 'antiestres-008', 'Artículos Antiestrés', 'Dado antiestres', '11 x 8 cm', 'Espuma de poliuretano | Incluye casco', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgabIuegtlHtSpkMZSOCERowHYduUJG2nOzcdISxhfEUmxpTJkCui-r_aDDPP1VnOM0zzqSjGdEqHJczSVt6n_hgG4YjN6vmJvZR0ux8dgcdOqzELgF-3gX27JWoDWzjlwCgi2jxOpJosl_JkIT0rCezznbgtas-iEkp87wjO2c8ydO71YEImbcl23C_2nM/s800/8.png', 16.82, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(9, 'antiestres-009', 'Artículos Antiestrés', 'Dado antiestres', '10 x 7.5 cm', 'Espuma de goma', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjCz8eYYNcT6Hzw0I6L8URazR8CrgaOM3gXhxrBFebB4r7_pqvB-_rPWAjM8SpCyx1fyRt4LUsf99_otLGEmdWNY4AFlPXdkIP-b5WhNNPB67E8ug1V00BeGaZ5_h0cLsHVlx1IURBWn7w2PPTHtGjsdNBIxAlmleh1N4oRYbeV2yMP74Ek1wpRfmtQGpAV/s800/9.png', 16.82, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(10, 'antiestres-010', 'Artículos Antiestrés', 'Pelota fútbol antiestrés', '7 x 7 cm', 'Espuma de goma', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgnKFw4hQl51jxL_B0QYW64g-GZzumDKyVCfeIeA-IGR5GWJpxqVlzd6UTvZ_kWV5UKNI4WLq3GijPCetBDFllCy3IYSlG08b1SfLjH6cvfjSa4dbOsm9LdnbM3q7mdWR0SZvaQqxJ8_XTNSMpJmHR8L4u2PtpubPP17dO_1qQr6NyhoSH2_OKknBDSnuSZ/s800/10.png', 10.55, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(11, 'antiestres-011', 'Artículos Antiestrés', 'Pelota fútbol antiestrés', '7 x 7 cm', 'Espuma de goma', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgHuKrYSmI-Juf87TNXToO4bbQVYbDTMU5GXIZDjrDfvpnGzfRfCtCCjFHI2CfrRDFG9IYwM3hEalZ1FQTR8z7GHiUZF6xg-7sH0bXKbjJSP7Dsgxy96IGFrZ9iKm9U37M5ruPqZuRQ8Vce15iPBDUP46xgjH6Bw-XyOjB_U9boCPZ1G1cWAzmQQ3r2yTel/s800/11.png', 10.55, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(12, 'antiestres-012', 'Artículos Antiestrés', 'Pelota antiestrés', '10.5 x 7 cm', 'Poliuretano', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEirm1VsytbcDtlIAxVr0N9JWwKMqbf8QEM6ztFnO38goVuc7HVJLto9wtuJPWIsSZ9S3JyxflfAdGXcNMhskNTarw_Hy6LkoC1FzL6cZYLv4B5nKVohkz5GO1pZzsItuGRHY0kB_6SalpjNyTgTcBIWRZ-hA2RCFZch4TL03LM9k3cjO_0N9cd9nybt3gmE/s800/12.png', 19.51, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(13, 'antiestres-013', 'Artículos Antiestrés', 'Pelota antiestrés', '11 x 8 cm', 'Espuma de poliuretano | Incluye casco', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgb08S9A1qcHniTu1SFvn83VRX-yFirGa_Qpe2jAKR5A-u6K4oA-PRE10Fu5VSsBYqPeIMg9lyqSBx25bq5HGrkYNDE5nVKaQEZgWG_i_DX750gfISXC6fulVyJUu7_hltMITuL5tLnHKHTCxrocMI8j2_msFA7DfzvIA7KF9b6w8vdXlId3AqmImJ1L8hX/s800/13.png', 19.51, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(14, 'antiestres-014', 'Artículos Antiestrés', 'Pelota antiestrés', '10 x 7.5 cm', 'Espuma de goma suave | Con uniforme', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjQXE2ION5CuOQzfnrvO7vcjyW3kN7SOR7dTkChHnAdBQfXFh8ErdKXkoX46b10BEErP74_Q-RxK_ZtE-czrKso_UxbftsY8Wp4_C9V-xo4olM_JRdAHYMEnKfucmYaK-9J8itCwXw-DlAGhjSvazApMx_0e2xsdwkAECj6UFzd2BeDjhOXigYJvH5XHlgP/s800/14.png', 19.51, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(15, 'antiestres-015', 'Artículos Antiestrés', 'Muñeco médico', '10.5 x 7 cm', 'Espuma de goma', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhjVcOPygNT6oFPsN00p8_oHOL5U8yqAa7zkRC9ZXkK1vpy7JazqiVt7dd8it2PaCIvdUHKtyzYXeQnbUMZ185KJO1OmVFYZ_YQnzX3jBaZ2fzayYvZQXGI8PiNXxE3CDyf2cq525iAuuWwXHGAniEgO6vBw9xRDkhyrhFL4upd_NC3kKiMS24-AaHx0fYs/s800/13.png', 17.80, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(16, 'antiestres-016', 'Artículos Antiestrés', 'Muñeco Antiestrés - Modelo Minero', '11 x 8 cm', 'Espuma de poliuretano | Incluye casco', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhjVcOPygNT6oFPsN00p8_oHOL5U8yqAa7zkRC9ZXkK1vpy7JazqiVt7dd8it2PaCIvdUHKtyzYXeQnbUMZ185KJO1OmVFYZ_YQnzX3jBaZ2fzayYvZQXGI8PiNXxE3CDyf2cq525iAuuWwXHGAniEgO6vBw9xRDkhyrhFL4upd_NC3kKiMS24-AaHx0fYs/s800/13.png', 18.37, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(17, 'antiestres-017', 'Artículos Antiestrés', 'Muñeco Antiestrés - Modelo Deportista', '10 x 7.5 cm', 'Espuma de goma suave | Con uniforme', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhjVcOPygNT6oFPsN00p8_oHOL5U8yqAa7zkRC9ZXkK1vpy7JazqiVt7dd8it2PaCIvdUHKtyzYXeQnbUMZ185KJO1OmVFYZ_YQnzX3jBaZ2fzayYvZQXGI8PiNXxE3CDyf2cq525iAuuWwXHGAniEgO6vBw9xRDkhyrhFL4upd_NC3kKiMS24-AaHx0fYs/s800/13.png', 15.81, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(18, 'antiestres-018', 'Artículos Antiestrés', 'Muñeco chef', '10.5 x 7 cm', 'Espuma de goma', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgXsML-6qAHSkobWnTY60bAOiBYi0N2-HPg8b-mJ_jgu8yLV0jY3NaOekBhytKjW6YorTMS5qqTg0vyqIr9JfiI7amH4TMjZp4rSqm7gk4HlkDTd6kBOpUF7YCuLx4OYOPDEqDncRp5or7983Z18aWroSBNAJzvRTa851dmE4zUDdcKDmDVofe0jg5dAlqq/s800/14.png', 21.62, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(19, 'antiestres-019', 'Artículos Antiestrés', 'Muñeco Antiestrés - Modelo Minero', '11 x 8 cm', 'Espuma de poliuretano | Incluye casco', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgXsML-6qAHSkobWnTY60bAOiBYi0N2-HPg8b-mJ_jgu8yLV0jY3NaOekBhytKjW6YorTMS5qqTg0vyqIr9JfiI7amH4TMjZp4rSqm7gk4HlkDTd6kBOpUF7YCuLx4OYOPDEqDncRp5or7983Z18aWroSBNAJzvRTa851dmE4zUDdcKDmDVofe0jg5dAlqq/s800/14.png', 18.37, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(20, 'antiestres-020', 'Artículos Antiestrés', 'Muñeco Chef', '10 x 7.5 cm', 'Espuma de goma suave | Con uniforme', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgXsML-6qAHSkobWnTY60bAOiBYi0N2-HPg8b-mJ_jgu8yLV0jY3NaOekBhytKjW6YorTMS5qqTg0vyqIr9JfiI7amH4TMjZp4rSqm7gk4HlkDTd6kBOpUF7YCuLx4OYOPDEqDncRp5or7983Z18aWroSBNAJzvRTa851dmE4zUDdcKDmDVofe0jg5dAlqq/s800/14.png', 14.33, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(21, 'antiestres-021', 'Artículos Antiestrés', 'Casa Antiestrés', '10.5 x 7 cm', 'Espuma de goma', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhSxb2MFiZRecjtv5F4uRm-vpuP1fwY7DcVuSik8ks7euj2lBLuVZl9bT2LAE9UYljKr-BYVXyAtSHnXfe9tKfrusxqf_QQSsrWiekWNfgf_lNX5sXTAA0JvHJdnaBY7zJTvPZSh4t1N5-r9ON5KFRkI6B3L9bp8Q52Sl7UCgdv9sCQU-FlulGCRC9WVUi7/s800/15.png', 17.54, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(22, 'antiestres-022', 'Artículos Antiestrés', 'Muñeco Antiestrés - Modelo Minero', '11 x 8 cm', 'Espuma de poliuretano | Incluye casco', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhSxb2MFiZRecjtv5F4uRm-vpuP1fwY7DcVuSik8ks7euj2lBLuVZl9bT2LAE9UYljKr-BYVXyAtSHnXfe9tKfrusxqf_QQSsrWiekWNfgf_lNX5sXTAA0JvHJdnaBY7zJTvPZSh4t1N5-r9ON5KFRkI6B3L9bp8Q52Sl7UCgdv9sCQU-FlulGCRC9WVUi7/s800/15.png', 18.37, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(23, 'antiestres-023', 'Artículos Antiestrés', 'Muñeco Antiestrés - Modelo Deportista', '10 x 7.5 cm', 'Espuma de goma suave | Con uniforme', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhSxb2MFiZRecjtv5F4uRm-vpuP1fwY7DcVuSik8ks7euj2lBLuVZl9bT2LAE9UYljKr-BYVXyAtSHnXfe9tKfrusxqf_QQSsrWiekWNfgf_lNX5sXTAA0JvHJdnaBY7zJTvPZSh4t1N5-r9ON5KFRkI6B3L9bp8Q52Sl7UCgdv9sCQU-FlulGCRC9WVUi7/s800/15.png', 15.81, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(24, 'antiestres-024', 'Artículos Antiestrés', 'Casco Antiestrés', '10.5 x 7 cm', 'Espuma de goma', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjVz38etkUyDPW_GR6TFcNgfKyD_z0lvWfaDjFcVg-0OWDGBBhtR8CUsg7oHrHOP6iLokQeWOZXiYTfwuO3HpbxTe7Jx0-ewPQs4I4A36Ju40HL6GIFj3mJnMxBGIcRbLXIfrw1u-MHfMEsjZZnrSuSWYHrWXgOBQxKYk_LHMQRaIeIahO8znWfLdrCFXgc/s800/16.png', 21.97, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(25, 'antiestres-025', 'Artículos Antiestrés', 'Muñeco Antiestrés - Modelo Minero', '11 x 8 cm', 'Espuma de poliuretano | Incluye casco', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjVz38etkUyDPW_GR6TFcNgfKyD_z0lvWfaDjFcVg-0OWDGBBhtR8CUsg7oHrHOP6iLokQeWOZXiYTfwuO3HpbxTe7Jx0-ewPQs4I4A36Ju40HL6GIFj3mJnMxBGIcRbLXIfrw1u-MHfMEsjZZnrSuSWYHrWXgOBQxKYk_LHMQRaIeIahO8znWfLdrCFXgc/s800/16.png', 18.37, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(26, 'antiestres-026', 'Artículos Antiestrés', 'Muñeco Antiestrés - Modelo Deportista', '10 x 7.5 cm', 'Espuma de goma suave | Con uniforme', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjVz38etkUyDPW_GR6TFcNgfKyD_z0lvWfaDjFcVg-0OWDGBBhtR8CUsg7oHrHOP6iLokQeWOZXiYTfwuO3HpbxTe7Jx0-ewPQs4I4A36Ju40HL6GIFj3mJnMxBGIcRbLXIfrw1u-MHfMEsjZZnrSuSWYHrWXgOBQxKYk_LHMQRaIeIahO8znWfLdrCFXgc/s800/16.png', 15.81, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(27, 'antiestres-027', 'Artículos Antiestrés', 'Muñeco Antiestrés - Modelo Clásico', '10.5 x 7 cm', 'Espuma de goma', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgGt-q5hL8MbY_BhqRnruMeYI7f2Hn0bK1DwNxVtzcqT2MbNQmJRNPkuUvirclwpFAISJugvvcCsOZf_HcqCF6Qdlrl431ppE-kYeJisr0ure1-LRk8u56TCu_VQlRxELlAWniZtRSg37SidgPg3IsNNVrY4cx14v-5tZLDfJOFSzPEbv-AlFFcn1N0iuux/s800/17.png', 12.94, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(28, 'antiestres-028', 'Artículos Antiestrés', 'Ambulancia antiestrés', '11 x 8 cm', 'Espuma de goma', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgIjr4xnYDNsj-Enq7tMgaVqczFMYAulSyVc2UzM2i91JovPwvWSHQ2Zx_-vSIga_y5OXtQuZQl-Uy48zTQ_jdUf47Vtep6sZMepkUx600_lkk7V-UQ1l9Lgs6uWVa8FXvbQ_AQi1Vn0yubbJF5IhvTQxTro7ZTawV3uvK7D2qWY5vwpbUJdEzgwXrGC1LA/s800/160.png', 15.22, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(29, 'antiestres-029', 'Artículos Antiestrés', 'Ambulancia antiestrés', '10 x 7.5 cm', 'Espuma de goma', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhUYykoP_a-SuoduOIW9AKECvGOpCF8e6uxVMBj4C0EI0Go08RXJYXUtVTQXrSx_G5F2Tv1BFKWL3MB5QZAynHNtNbpzOfYSRiM6fzXS5LPCqa4CTI4w3OxLirZ88W2ppzXQW1NdoccJSL_2KUj90kE7rcM0rMprvs7Ny8qC7vOaA7LmmjcPVOQ12nlwty9/s800/161.png', 15.22, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(30, 'antiestres-030', 'Artículos Antiestrés', 'Muñeco Antiestrés -  Minero Modelo 1', '10.5 x 7 cm', 'Espuma de goma', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEiGuL5s_mUJ6buXEAK_XSPWPYJzvwHyvGtxHEV6fcZzofnYB_rATatMLGwbKAdbmvJkawNA4GsYMXYcLlcErC-oQYx_UJU98Oj6JbSNnmIlraRBlX_Jub499tzuQEWHzHdURtnygiIaMqorm4Ux9nu5qLIagDv2VucpNUo6HXYD1nWuzjK8tEWqdzX1m5_-/s800/2.png', 17.57, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(31, 'antiestres-031', 'Artículos Antiestrés', 'Muñeco Antiestrés -  Minero Modelo 2', '11 x 8 cm', 'Espuma de goma', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjrZSoHy2XsO-EVUWaWIbFZ6bY3Iwyt6tRj_6X1LF4Q5e8Ef5Q_nB1Ncbb5AVKRiXqvyE_wSfWj9uyY73hMoFdjRW1w7GzYZ1J7dFuqfhf9HMIiBE1Jjn-P_nXcRETFJ9zH2gfu3Uzee6W0tAQ_ZKV3Jzq43ez_Gd6Qmh3ZNOmjW9H3MNxRGh1qkk7a8qYM/s800/3.png', 11.90, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(32, 'antiestres-032', 'Artículos Antiestrés', 'Muñeco Antiestrés -  Minero Modelo 2', '10 x 7.5 cm', 'Espuma de goma suave | Con uniforme', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEiGuL5s_mUJ6buXEAK_XSPWPYJzvwHyvGtxHEV6fcZzofnYB_rATatMLGwbKAdbmvJkawNA4GsYMXYcLlcErC-oQYx_UJU98Oj6JbSNnmIlraRBlX_Jub499tzuQEWHzHdURtnygiIaMqorm4Ux9nu5qLIagDv2VucpNUo6HXYD1nWuzjK8tEWqdzX1m5_-/s800/2.png', 11.90, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(33, 'escritorio-001', 'Artículos de Escritorio', 'Pote de resaltadores', '7.5 x 7.5 cm', 'Espuma de goma', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjuqlhegpF5ZwSCq1lLHKgSK3-4YWFmtNTaAM3JWjHTro15mDb7bwF2R7RRb4V_H_llK3IGt1jRgc9__XBy65h5wMRhxJVcLAyplFa2tlI34QfCR9nLFrhoBiVQMpIB49J2BcXK3qBZeStcf2KdC-5B0Pp9je_HdXfpOvzdVu5XjYl9PABd61jPaCdMOhjW/s800/18.png', 5.08, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(34, 'escritorio-002', 'Artículos de Escritorio', 'Muñeco Antiestrés - Modelo Minero', '11 x 8 cm', 'Espuma de poliuretano | Incluye casco', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjuqlhegpF5ZwSCq1lLHKgSK3-4YWFmtNTaAM3JWjHTro15mDb7bwF2R7RRb4V_H_llK3IGt1jRgc9__XBy65h5wMRhxJVcLAyplFa2tlI34QfCR9nLFrhoBiVQMpIB49J2BcXK3qBZeStcf2KdC-5B0Pp9je_HdXfpOvzdVu5XjYl9PABd61jPaCdMOhjW/s800/18.png', 12.53, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(35, 'escritorio-003', 'Artículos de Escritorio', 'Muñeco Antiestrés - Modelo Deportista', '10 x 7.5 cm', 'Espuma de goma suave | Con uniforme', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjuqlhegpF5ZwSCq1lLHKgSK3-4YWFmtNTaAM3JWjHTro15mDb7bwF2R7RRb4V_H_llK3IGt1jRgc9__XBy65h5wMRhxJVcLAyplFa2tlI34QfCR9nLFrhoBiVQMpIB49J2BcXK3qBZeStcf2KdC-5B0Pp9je_HdXfpOvzdVu5XjYl9PABd61jPaCdMOhjW/s800/18.png', 8.48, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(36, 'escritorio-004', 'Artículos de Escritorio', 'Manito resaltadores', '7.5 cm x 9.5 cm', '', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhTyTjpoM54l45mEn5XjXFCOti9CPkDY-mnCTOEHtEQUNuIMPILQbsvQ9EsT6kmzc2NIFCxg3hLen1CqggIsMIdb7zlOVnjCC7OZuaq7kDEhjLDdkZVqvhczjKCf06IT-N9c69K649oz9GsTM_C-jN_sCOIXBkv-1uiR0e9LqiSJN4MrVyFkeGLVOjfWVUT/s800/19.png', 10.81, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(37, 'escritorio-005', 'Artículos de Escritorio', 'Pirámides', '7.8 x 8.6 cm', '', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEi7LbeI9RYfdy6FwqFFiANoRqrlqkly9sFyYqYlGePa_jvwf3Qp2gApjOQVPUfQFV9V1TC3LJJZa_8dkhhynX6JSNXzG4ZN38HbUKbcMiDOBb_hZm02KTL6mvN1q1qTuwwhuIYAz3CD2OqHkQKefbwrliAFBOY2OxzW1y7ehhFlUtDRlnJ1WBbyrO_-twts/s800/162.png', 13.94, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(38, 'escritorio-006', 'Artículos de Escritorio', 'Pirámides', '10.5 x 7 cm', 'Espuma de goma', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEi7LbeI9RYfdy6FwqFFiANoRqrlqkly9sFyYqYlGePa_jvwf3Qp2gApjOQVPUfQFV9V1TC3LJJZa_8dkhhynX6JSNXzG4ZN38HbUKbcMiDOBb_hZm02KTL6mvN1q1qTuwwhuIYAz3CD2OqHkQKefbwrliAFBOY2OxzW1y7ehhFlUtDRlnJ1WBbyrO_-twts/s800/162.png', 13.94, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(39, 'escritorio-007', 'Artículos de Escritorio', 'Crayón resaltador', '7.5 cm x 9.5 cm', '', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEh1fWpnkbLP_xjt4dp_bn9I7lHDjHTmClxT4ZE5jXazL8dFcdEQKptgVGAPX9jgq3kfU5Q0xxoIfKKheiyd-C2hRB8810aNMbrdtoimgVJmO20miHMg_-KV87EFu6_hfuxxfGJP7Qqox_g45k_cnbVIP2Pk4qxKMpWqtdLSdzQic4K8LXGPydiefstwrLLj/s800/163.png', 13.45, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(40, 'escritorio-008', 'Artículos de Escritorio', 'Dado antiestres', '11 x 8 cm', 'Espuma de poliuretano | Incluye casco', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEh1fWpnkbLP_xjt4dp_bn9I7lHDjHTmClxT4ZE5jXazL8dFcdEQKptgVGAPX9jgq3kfU5Q0xxoIfKKheiyd-C2hRB8810aNMbrdtoimgVJmO20miHMg_-KV87EFu6_hfuxxfGJP7Qqox_g45k_cnbVIP2Pk4qxKMpWqtdLSdzQic4K8LXGPydiefstwrLLj/s800/163.png', 6.01, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(41, 'escritorio-009', 'Artículos de Escritorio', 'Dado antiestres', '10 x 7.5 cm', 'Espuma de goma suave | Con uniforme', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEh1fWpnkbLP_xjt4dp_bn9I7lHDjHTmClxT4ZE5jXazL8dFcdEQKptgVGAPX9jgq3kfU5Q0xxoIfKKheiyd-C2hRB8810aNMbrdtoimgVJmO20miHMg_-KV87EFu6_hfuxxfGJP7Qqox_g45k_cnbVIP2Pk4qxKMpWqtdLSdzQic4K8LXGPydiefstwrLLj/s800/163.png', 6.01, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(42, 'escritorio-010', 'Artículos de Escritorio', 'Pie resaltador', '9.2 cm x 7.2 cm', '', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgrS88KNELZ7NDsbqUPVosANmyTpzW4N4Sur-eBEHUX0702Z0X68Abr-vUzAFDXwooHjbTfjoJvAs31hiVciEQcZinDezJ-sWHfJ_DxgtHL0CPzi_4GreH9ae5Wq5K9VZn7_Fbq35q7kwa7xkROz10joHsMqcHP7DpKZYo6FfGU2TIiLoAcHMaNs3-u00A4/s800/20.png', 6.67, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(43, 'escritorio-011', 'Artículos de Escritorio', 'Muñeco Antiestrés - Modelo Minero', '11 x 8 cm', 'Espuma de poliuretano | Incluye casco', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgrS88KNELZ7NDsbqUPVosANmyTpzW4N4Sur-eBEHUX0702Z0X68Abr-vUzAFDXwooHjbTfjoJvAs31hiVciEQcZinDezJ-sWHfJ_DxgtHL0CPzi_4GreH9ae5Wq5K9VZn7_Fbq35q7kwa7xkROz10joHsMqcHP7DpKZYo6FfGU2TIiLoAcHMaNs3-u00A4/s800/20.png', 12.53, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(44, 'escritorio-012', 'Artículos de Escritorio', 'Muñeco Antiestrés - Modelo Deportista', '10 x 7.5 cm', 'Espuma de goma suave | Con uniforme', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgrS88KNELZ7NDsbqUPVosANmyTpzW4N4Sur-eBEHUX0702Z0X68Abr-vUzAFDXwooHjbTfjoJvAs31hiVciEQcZinDezJ-sWHfJ_DxgtHL0CPzi_4GreH9ae5Wq5K9VZn7_Fbq35q7kwa7xkROz10joHsMqcHP7DpKZYo6FfGU2TIiLoAcHMaNs3-u00A4/s800/20.png', 8.48, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(45, 'escritorio-013', 'Artículos de Escritorio', 'Estrella resaltador', '8.0 cm x 8.0 cm', '', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEh66br_OxAl2TDi3uSuEEsRhlnMmVjzv6_luz0tqifHCWEYTTUZhFrHL99ds0ozHo30_gUOuaO2Ds0ZqFesoE-VBV8Vuc0tkI9GPhCJ3cDjT5m1WVt91qL0JptgrFIm05KmM9WchQkED1ViazifP1E6S878RQH3Tny6lG6Zs9lfRuG0tepHYNKzua7aSsR_/s800/21.png', 5.82, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(46, 'escritorio-014', 'Artículos de Escritorio', 'Muñeco Antiestrés - Modelo Minero', '11 x 8 cm', 'Espuma de poliuretano | Incluye casco', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEh66br_OxAl2TDi3uSuEEsRhlnMmVjzv6_luz0tqifHCWEYTTUZhFrHL99ds0ozHo30_gUOuaO2Ds0ZqFesoE-VBV8Vuc0tkI9GPhCJ3cDjT5m1WVt91qL0JptgrFIm05KmM9WchQkED1ViazifP1E6S878RQH3Tny6lG6Zs9lfRuG0tepHYNKzua7aSsR_/s800/21.png', 12.53, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(47, 'escritorio-015', 'Artículos de Escritorio', 'Muñeco Antiestrés - Modelo Deportista', '10 x 7.5 cm', 'Espuma de goma suave | Con uniforme', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEh66br_OxAl2TDi3uSuEEsRhlnMmVjzv6_luz0tqifHCWEYTTUZhFrHL99ds0ozHo30_gUOuaO2Ds0ZqFesoE-VBV8Vuc0tkI9GPhCJ3cDjT5m1WVt91qL0JptgrFIm05KmM9WchQkED1ViazifP1E6S878RQH3Tny6lG6Zs9lfRuG0tepHYNKzua7aSsR_/s800/21.png', 8.48, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(48, 'escritorio-016', 'Artículos de Escritorio', 'Estrella fibra de trigo', '', '', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEiffhaJhH44KrJokk0fspXXv-4jlOnUQm4SnmuPWQSc2aCgNEwx4mQvh9WbHfeTJuGKyTfZHBBCtnS2jl4j8qX6srK6Fnwov1x7H5SMe4XmDOCqJMvh_qLftjG0n8PB9mN1CSZkskUKYB8a6I7wFC6NHrMnGUrozWUwCegLirdRILuCRclh4QnlkNWLsGoV/s800/22.png', 6.42, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(49, 'escritorio-017', 'Artículos de Escritorio', 'Muñeco Antiestrés - Modelo Minero', '11 x 8 cm', 'Espuma de poliuretano | Incluye casco', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEiffhaJhH44KrJokk0fspXXv-4jlOnUQm4SnmuPWQSc2aCgNEwx4mQvh9WbHfeTJuGKyTfZHBBCtnS2jl4j8qX6srK6Fnwov1x7H5SMe4XmDOCqJMvh_qLftjG0n8PB9mN1CSZkskUKYB8a6I7wFC6NHrMnGUrozWUwCegLirdRILuCRclh4QnlkNWLsGoV/s800/22.png', 12.53, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(50, 'escritorio-018', 'Artículos de Escritorio', 'Muñeco Antiestrés - Modelo Deportista', '10 x 7.5 cm', 'Espuma de goma suave | Con uniforme', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEiffhaJhH44KrJokk0fspXXv-4jlOnUQm4SnmuPWQSc2aCgNEwx4mQvh9WbHfeTJuGKyTfZHBBCtnS2jl4j8qX6srK6Fnwov1x7H5SMe4XmDOCqJMvh_qLftjG0n8PB9mN1CSZkskUKYB8a6I7wFC6NHrMnGUrozWUwCegLirdRILuCRclh4QnlkNWLsGoV/s800/22.png', 8.48, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(51, 'escritorio-019', 'Artículos de Escritorio', 'Chanchito alcancía', '8 cm x 7.6 cm x 10 cm', 'Alcancía de PVC', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEg2A24y3iPosiILUYAAw2ODaaxfjrpMgxT7kMPi1_NCp5x-UeXiwNwkWHPKU1JGCsPXkLRd0cq0bviRjpSb76_vlHwNtyriUYo0UVfxvXHdkIzbXKhDrh12wRn4b9-FyiuKchO9pYmLZSQfjSva-Ox92zqR9wo8PCTsMrqi4fJ1fd_SErULYv8h0OYZ5xXh/s800/24.png', 8.78, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(52, 'escritorio-020', 'Artículos de Escritorio', 'Muñeco Antiestrés - Modelo Minero', '11 x 8 cm', 'Espuma de poliuretano | Incluye casco', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEg2A24y3iPosiILUYAAw2ODaaxfjrpMgxT7kMPi1_NCp5x-UeXiwNwkWHPKU1JGCsPXkLRd0cq0bviRjpSb76_vlHwNtyriUYo0UVfxvXHdkIzbXKhDrh12wRn4b9-FyiuKchO9pYmLZSQfjSva-Ox92zqR9wo8PCTsMrqi4fJ1fd_SErULYv8h0OYZ5xXh/s800/24.png', 12.53, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(53, 'escritorio-021', 'Artículos de Escritorio', 'Muñeco Antiestrés - Modelo Deportista', '10 x 7.5 cm', 'Espuma de goma suave | Con uniforme', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEg2A24y3iPosiILUYAAw2ODaaxfjrpMgxT7kMPi1_NCp5x-UeXiwNwkWHPKU1JGCsPXkLRd0cq0bviRjpSb76_vlHwNtyriUYo0UVfxvXHdkIzbXKhDrh12wRn4b9-FyiuKchO9pYmLZSQfjSva-Ox92zqR9wo8PCTsMrqi4fJ1fd_SErULYv8h0OYZ5xXh/s800/24.png', 8.48, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(54, 'escritorio-022', 'Artículos de Escritorio', 'Jabalí alcancía', '12 cm x 7.5 cm x 7.5 cm', 'Plástico en forma de jabalí', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEioAK-ejRZKoKkwoPbYuyN4sA-I77s6iCJP37H3M97EuEJ40X-md7oy3hWTbLaYREnlLekvKbreMFAbz-PCbHkmcmHOkdms9yx9D54NeTol-x-8vvcdJLBbs_F7EBDsizYc7rNLhyK-ofCjcwMtQ5Mv_vPhO8KJF6j1-RLl9US-2OowvA3ZaLbh5yGrbIB0/s800/25.png', 14.04, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(55, 'escritorio-023', 'Artículos de Escritorio', 'Muñeco Antiestrés - Modelo Minero', '11 x 8 cm', 'Espuma de poliuretano | Incluye casco', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEioAK-ejRZKoKkwoPbYuyN4sA-I77s6iCJP37H3M97EuEJ40X-md7oy3hWTbLaYREnlLekvKbreMFAbz-PCbHkmcmHOkdms9yx9D54NeTol-x-8vvcdJLBbs_F7EBDsizYc7rNLhyK-ofCjcwMtQ5Mv_vPhO8KJF6j1-RLl9US-2OowvA3ZaLbh5yGrbIB0/s800/25.png', 12.53, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(56, 'escritorio-024', 'Artículos de Escritorio', 'Muñeco Antiestrés - Modelo Deportista', '10 x 7.5 cm', 'Espuma de goma suave | Con uniforme', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEioAK-ejRZKoKkwoPbYuyN4sA-I77s6iCJP37H3M97EuEJ40X-md7oy3hWTbLaYREnlLekvKbreMFAbz-PCbHkmcmHOkdms9yx9D54NeTol-x-8vvcdJLBbs_F7EBDsizYc7rNLhyK-ofCjcwMtQ5Mv_vPhO8KJF6j1-RLl9US-2OowvA3ZaLbh5yGrbIB0/s800/25.png', 8.48, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(57, 'escritorio-025', 'Artículos de Escritorio', 'Reglas de polietileno', '10.5 x 7 cm', 'Espuma de goma', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEinoxEhiKsJY5i1OMLkSrrGszTjh1MqOzppSUj_XIPrBHoA1i2snJK20ZgY_DNygM_Zf-urhVj4wVN_q0KpTaWuNpvkkT6ME7VV7OsEnwnWCvQv0VZugWFdtpDXI4X05GiXRZBcXXh9vuE6CjPJdbW_C8OR9ZivB8T5YJqrkXizHBhI2FPxOo9z5U5dH6bi/s800/23.png', 15.88, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(58, 'escritorio-026', 'Artículos de Escritorio', 'Reglas de polietileno', '11 x 8 cm', 'Espuma de poliuretano | Incluye casco', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjUI3XGyB580I2sLZ-DleWrubgAytXpaguRXjdMVF6V_-2X9xN_z9aXXKiBeYP-7ZrFfrhg0tu82bzPjmIsOnTLivZ0BASvggxgtV_x4ZJB0D3tqFsq3xnc76zd3zm_z-qa7lu1s_vqZzZ-SIz0mBA0J7TfK4lmwD21cSKZ2Qi4ECPkoiEyoy2N0TWS3Xnq/s800/24.png', 15.88, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(59, 'escritorio-027', 'Artículos de Escritorio', 'Muñeco Antiestrés - Modelo Deportista', '10 x 7.5 cm', 'Espuma de goma suave | Con uniforme', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEinoxEhiKsJY5i1OMLkSrrGszTjh1MqOzppSUj_XIPrBHoA1i2snJK20ZgY_DNygM_Zf-urhVj4wVN_q0KpTaWuNpvkkT6ME7VV7OsEnwnWCvQv0VZugWFdtpDXI4X05GiXRZBcXXh9vuE6CjPJdbW_C8OR9ZivB8T5YJqrkXizHBhI2FPxOo9z5U5dH6bi/s800/23.png', 8.48, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(60, 'escritorio-028', 'Artículos de Escritorio', 'Memo clip', '10.5 x 7 cm', 'Espuma de goma', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEikrCx200flYxVTHzaYIIG_w6cwFkKr6VLNEjpa9oU-s3nDQ4wV_10OAsS5Ho_sgd6AKI1leqP0Azu2IAsvvtcasXqN0BF0qVbx84NDfFXWzPMk88rMr7ve3PE65a92xlKkLMKo6zJsX3d1rvXUkpc4tfzVebjsFWAx70268B_qrgEpiuRX8Zkm8RdK-wJl/s800/27.png', 11.80, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(61, 'escritorio-029', 'Artículos de Escritorio', 'Memo clip', '11 x 8 cm', 'Espuma de poliuretano | Incluye casco', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhXRmQW6VkVrAh26Xtk6VUAPo2lN7w328s0GbgX6G3w11MI8OvW63YU3Km9E4Q7HeRFTy_QjIs_BZtw1jdR8AfxLd4VbrsEr0hkA0Ku3n-vhyphenhyphenjUtwm0DCKaki32jLvRoDmAZZT75xU6vbRF61HDeU14TlmEzhbY850Vngfl2xAH9ilacY8SSKccqieCc2dC/s800/26.png', 11.80, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(62, 'escritorio-030', 'Artículos de Escritorio', 'Muñeco Antiestrés - Modelo Deportista', '10 x 7.5 cm', 'Espuma de goma suave | Con uniforme', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEikrCx200flYxVTHzaYIIG_w6cwFkKr6VLNEjpa9oU-s3nDQ4wV_10OAsS5Ho_sgd6AKI1leqP0Azu2IAsvvtcasXqN0BF0qVbx84NDfFXWzPMk88rMr7ve3PE65a92xlKkLMKo6zJsX3d1rvXUkpc4tfzVebjsFWAx70268B_qrgEpiuRX8Zkm8RdK-wJl/s800/27.png', 8.48, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(63, 'escritorio-031', 'Artículos de Escritorio', 'Mouse pad rectangular', '10.5 x 7 cm', 'Espuma de goma', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjz0QV8RsJGV-zxfpLRO9s_ybBfyBsfYJvKQKDGw5cAHblrtiEJnQ4r3UMiyTDKLpUNHG-i5UcHaWPYYs3U8-0cRypEs8TvZT1ycms2qUKX-ThH2NI5CF5hxHIggpzz1rul_e_uki7TlKjcpxJbvP2JsL0tTYOIo5qrDbzAq8EsUvrnhx70RfcU1IeUHg8Y/s800/29.png', 13.11, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(64, 'escritorio-032', 'Artículos de Escritorio', 'Muñeco Antiestrés - Modelo Minero', '11 x 8 cm', 'Espuma de poliuretano | Incluye casco', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjz0QV8RsJGV-zxfpLRO9s_ybBfyBsfYJvKQKDGw5cAHblrtiEJnQ4r3UMiyTDKLpUNHG-i5UcHaWPYYs3U8-0cRypEs8TvZT1ycms2qUKX-ThH2NI5CF5hxHIggpzz1rul_e_uki7TlKjcpxJbvP2JsL0tTYOIo5qrDbzAq8EsUvrnhx70RfcU1IeUHg8Y/s800/29.png', 12.53, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(65, 'escritorio-033', 'Artículos de Escritorio', 'Muñeco Antiestrés - Modelo Deportista', '10 x 7.5 cm', 'Espuma de goma suave | Con uniforme', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjz0QV8RsJGV-zxfpLRO9s_ybBfyBsfYJvKQKDGw5cAHblrtiEJnQ4r3UMiyTDKLpUNHG-i5UcHaWPYYs3U8-0cRypEs8TvZT1ycms2qUKX-ThH2NI5CF5hxHIggpzz1rul_e_uki7TlKjcpxJbvP2JsL0tTYOIo5qrDbzAq8EsUvrnhx70RfcU1IeUHg8Y/s800/29.png', 8.48, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(66, 'escritorio-034', 'Artículos de Escritorio', 'Mouse pad circular', '10.5 x 7 cm', 'Espuma de goma', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhkdnkzFt2ZmGn-Q_ajgOACPG8XCR7-DRjGMjUqi75purMrAqBcY-4lIlrkbc8tvz_uIdjzbB1GY7QZWbWIZckmM76Q8iR8A3VSOX_rvZUytBu9NEZ_9U9AE5bBm8eNzK-bJRWoTEhPSOmM6lG2YLieNy3LgF_aOgzjylR_d4AYw71CAI47D5pYLRhm1lLa/s800/30.png', 9.14, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(67, 'escritorio-035', 'Artículos de Escritorio', 'Muñeco Antiestrés - Modelo Minero', '11 x 8 cm', 'Espuma de poliuretano | Incluye casco', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhkdnkzFt2ZmGn-Q_ajgOACPG8XCR7-DRjGMjUqi75purMrAqBcY-4lIlrkbc8tvz_uIdjzbB1GY7QZWbWIZckmM76Q8iR8A3VSOX_rvZUytBu9NEZ_9U9AE5bBm8eNzK-bJRWoTEhPSOmM6lG2YLieNy3LgF_aOgzjylR_d4AYw71CAI47D5pYLRhm1lLa/s800/30.png', 12.53, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(68, 'escritorio-036', 'Artículos de Escritorio', 'Muñeco Antiestrés - Modelo Deportista', '10 x 7.5 cm', 'Espuma de goma suave | Con uniforme', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhkdnkzFt2ZmGn-Q_ajgOACPG8XCR7-DRjGMjUqi75purMrAqBcY-4lIlrkbc8tvz_uIdjzbB1GY7QZWbWIZckmM76Q8iR8A3VSOX_rvZUytBu9NEZ_9U9AE5bBm8eNzK-bJRWoTEhPSOmM6lG2YLieNy3LgF_aOgzjylR_d4AYw71CAI47D5pYLRhm1lLa/s800/30.png', 8.48, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(69, 'escritorio-037', 'Artículos de Escritorio', 'Mouse pad de silicona', '10.5 x 7 cm', 'Espuma de goma', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEi_gwYw3E8mZ_LJwkU3nWoaTK-9GDVGHedSxKXTb8JChpC9JWl2I-6OtLpop1xZ0GbTvjfOMngY1CvtufwoTRouOHbXLaObiI5t8luFxOau6f2zVU1BXAI8SUGcNOz4j1Kg-5ulkCw4OcjKZBP7n5OznPJU2HOyGlbuhl2ePBclHu5F0fy6IPkDS0X0Nbxt/s800/28.png', 7.74, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(70, 'escritorio-038', 'Artículos de Escritorio', 'Muñeco Antiestrés - Modelo Minero', '11 x 8 cm', 'Espuma de poliuretano | Incluye casco', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEi_gwYw3E8mZ_LJwkU3nWoaTK-9GDVGHedSxKXTb8JChpC9JWl2I-6OtLpop1xZ0GbTvjfOMngY1CvtufwoTRouOHbXLaObiI5t8luFxOau6f2zVU1BXAI8SUGcNOz4j1Kg-5ulkCw4OcjKZBP7n5OznPJU2HOyGlbuhl2ePBclHu5F0fy6IPkDS0X0Nbxt/s800/28.png', 12.53, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(71, 'escritorio-039', 'Artículos de Escritorio', 'Muñeco Antiestrés - Modelo Deportista', '10 x 7.5 cm', 'Espuma de goma suave | Con uniforme', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEi_gwYw3E8mZ_LJwkU3nWoaTK-9GDVGHedSxKXTb8JChpC9JWl2I-6OtLpop1xZ0GbTvjfOMngY1CvtufwoTRouOHbXLaObiI5t8luFxOau6f2zVU1BXAI8SUGcNOz4j1Kg-5ulkCw4OcjKZBP7n5OznPJU2HOyGlbuhl2ePBclHu5F0fy6IPkDS0X0Nbxt/s800/28.png', 8.48, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(72, 'escritorio-040', 'Artículos de Escritorio', 'Porta lapiceros', '10.5 x 7 cm', 'Espuma de goma', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEiWPbVfFMbC9RPPilNRlvqYNP5l6dVCr5CBRpXNUB36wFDUds4l7gtrI-AenNzJKYPh14clDX4vLcEB7jbzWEIZc8Qg5pjF7rUj5stE4j7u4L0zKFlJsaUhbQBXv6JYsc12kmB7cT_nbAuy7gQFqYimCIrKuywZPEEEDSgrC-KAjz1Yub0OCPuCteOixBqe/s800/31.png', 14.13, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(73, 'escritorio-041', 'Artículos de Escritorio', 'Muñeco Antiestrés - Modelo Minero', '11 x 8 cm', 'Espuma de poliuretano | Incluye casco', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEiWPbVfFMbC9RPPilNRlvqYNP5l6dVCr5CBRpXNUB36wFDUds4l7gtrI-AenNzJKYPh14clDX4vLcEB7jbzWEIZc8Qg5pjF7rUj5stE4j7u4L0zKFlJsaUhbQBXv6JYsc12kmB7cT_nbAuy7gQFqYimCIrKuywZPEEEDSgrC-KAjz1Yub0OCPuCteOixBqe/s800/31.png', 12.53, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(74, 'escritorio-042', 'Artículos de Escritorio', 'Muñeco Antiestrés - Modelo Deportista', '10 x 7.5 cm', 'Espuma de goma suave | Con uniforme', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEiWPbVfFMbC9RPPilNRlvqYNP5l6dVCr5CBRpXNUB36wFDUds4l7gtrI-AenNzJKYPh14clDX4vLcEB7jbzWEIZc8Qg5pjF7rUj5stE4j7u4L0zKFlJsaUhbQBXv6JYsc12kmB7cT_nbAuy7gQFqYimCIrKuywZPEEEDSgrC-KAjz1Yub0OCPuCteOixBqe/s800/31.png', 8.48, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(75, 'escritorio-043', 'Artículos de Escritorio', 'Regla calculadora', '10.5 x 7 cm', 'Espuma de goma', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjWtNJkJfXMzyfCCEjfvs4ySEMbNLj5V68sbR6ec_LT88-hRNK14pWczzW4v-13v3vECFjLmsFKMm6CQIT_G8IM30b9OomPmJDJALVFwlgyEDNm5fNFJwGfJeObu2UVjSZ1cB76BlphQJW6kIkitaoPeaBzm_9_9IkP0Yb1wQv5_wOVFP1TzxoZdleX_ihH/s800/32.png', 14.94, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(76, 'escritorio-044', 'Artículos de Escritorio', 'Muñeco Antiestrés - Modelo Minero', '11 x 8 cm', 'Espuma de poliuretano | Incluye casco', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEikWddAzyGhA8N8HcH-pYZCXfaCy3-Bgu6uHkY-2lgy-W3goQ1ahnQhpW1tHvaif_ffw1PSjk-fgeNYGsnV-XPMdry5WJowv4G_vaUOhKPX1GNe5HOl7usTCrOU5K5cobxFdyC_B9BXpilopg7-CHYj2dtVBtAIk2a-0mL4O60_sRvgUzsFVNt_3HW22fPY/s800/36.png', 12.53, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(77, 'escritorio-045', 'Artículos de Escritorio', 'Muñeco Antiestrés - Modelo Deportista', '10 x 7.5 cm', 'Espuma de goma suave | Con uniforme', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjWtNJkJfXMzyfCCEjfvs4ySEMbNLj5V68sbR6ec_LT88-hRNK14pWczzW4v-13v3vECFjLmsFKMm6CQIT_G8IM30b9OomPmJDJALVFwlgyEDNm5fNFJwGfJeObu2UVjSZ1cB76BlphQJW6kIkitaoPeaBzm_9_9IkP0Yb1wQv5_wOVFP1TzxoZdleX_ihH/s800/32.png', 8.48, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(78, 'escritorio-046', 'Artículos de Escritorio', 'Linterna manual', '10.5 x 7 cm', 'Espuma de goma', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhQvCPxF28upu7SqAVwQtxq2uukRdBhxdYOShdB3sXeJfgo0jBGzxFit363XidcljJhU3sNrkuElWRHEz7ojpz7WVkFOC553TtQ0uCyxctN42Lyv-3DHZLjmr4_ZrpGHi37mzyvG523aoE3Ggy2ReP2o_0phBI2Py0wy18Qq_-L_xtYzejVC-fHe65_D5wd/s800/164.png', 16.07, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(79, 'escritorio-047', 'Artículos de Escritorio', 'Linterna manual', '11 x 8 cm', 'Espuma de poliuretano | Incluye casco', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhYQkGxBxmQv9aRa2z4lG4l7McmGWhbABos0O6SbL1PjvuO4tdjkEUOJPcuKjpFHhLx4cHUKyUsmVG88DSjrswyY8woNmIJGmV_TdWUIm3uDRNjqsGrmKlnTo_Q5wTyXq7EV_YEzUZyWOyqFrIrAh5CNxM2MWC97UmNhq2VoPVFnQ_VfB09JFcV4ZoKAsNv/s800/11.png', 16.07, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(80, 'escritorio-048', 'Artículos de Escritorio', 'Muñeco Antiestrés - Modelo Deportista', '10 x 7.5 cm', 'Espuma de goma suave | Con uniforme', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhQvCPxF28upu7SqAVwQtxq2uukRdBhxdYOShdB3sXeJfgo0jBGzxFit363XidcljJhU3sNrkuElWRHEz7ojpz7WVkFOC553TtQ0uCyxctN42Lyv-3DHZLjmr4_ZrpGHi37mzyvG523aoE3Ggy2ReP2o_0phBI2Py0wy18Qq_-L_xtYzejVC-fHe65_D5wd/s800/164.png', 8.48, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(81, 'escritorio-049', 'Artículos de Escritorio', 'Posavasos con Abridor', '10.5 x 7 cm', 'Espuma de goma', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEg2CUILoHSzMGPpzc2nWN3R9oSX6T0ImbJwmmcsdrI_PqVep227pT7E-71B0bOo0fzkUAVL0JarSbl7UKjqkyHgpXZeeuXq8DwOa9aWGx1i4VhKM7eeOSwN1q5nsb7e7eO2aiPM_e6rrBcHwmA_nP8RWWAm-VwLcR9FzxrS8KBNFL99f4eu9wVdeaM4bunn/s800/33.png', 9.77, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(82, 'escritorio-050', 'Artículos de Escritorio', 'Posavasos con Abridor', '11 x 8 cm', 'Espuma de poliuretano | Incluye casco', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhSnuIFcgK6mOMtj2dR_mf3HPv5hOCtkXRFyXtdww7rN0YLbZdxCys0L9n9E01jCVj5E-wST0q-R2G3mkjDPVyCHWz0HCd7Nuj1VUrq_4XH5ndqjfg7kM870P9BovyaElarL9TBNlbBX6gFp24grCljRadOTzZeyGwYFRU4Wam0l1hx_K-GLu9dfM3VxuaT/s800/39.png', 9.77, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(83, 'escritorio-051', 'Artículos de Escritorio', 'Posavasos con Abridor', '10 x 7.5 cm', 'Espuma de goma suave | Con uniforme', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhzboOp4-1dgT1zE4D4glUgICWKniT-pI1VejfMQIvBX2DQXW7t0kfBiexVeum-sIlonWLwUOLmpMQv83YntQOCKBR5H2u_NQrwhaBc2rwXf2uZ56zd11N-tbuuFYLrt1BvDyWqrhbX8xl2k80Uq-0IE9mdkLfwdYaowXYpyVev-iWVB6wpIta_3CsbZb6V/s800/38.png', 9.77, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(84, 'escritorio-052', 'Artículos de Escritorio', 'Mini set de escritorio', '10.5 x 7 cm', 'Espuma de goma', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjBnery4G028X8w_8oW-gP5zMyChFLl8-m3uws83HDINBdY4135IAm-oblA5mSDuZDJajJGAg5qDjTR2RSUVcixsfpxk2CZAE0ZjdbkdNKehj-CwJhsbhmZ5zTbwofhmoxvYr43nogYiB3y_3H6eolEJQ2L0g_g1uMfXGfRLTcA3M6nsuKkQM2j-CKzPeTr/s800/34.png', 9.08, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(85, 'escritorio-053', 'Artículos de Escritorio', 'Mini set de escritorio', '11 x 8 cm', 'Espuma de poliuretano | Incluye casco', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEibMoa07a-Il7n5rCtFcFcjRzvG0-uPUP90v1CYtkphF5fhSp2PtVD3BoDrMFxBF6d_ABrN6JA1Gvv3fODly8Io1NjcUY-zYe8GsK6cZCvWK5YCBSz-X3nk7guvBkm2wlkpxOTHwo235lFHnIL7kXRxkjOMHTIfO2m2kENrq-bp9UBY7LEEe3UrZzaYQ8y3/s800/38.png', 9.08, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(86, 'escritorio-054', 'Artículos de Escritorio', 'Muñeco Antiestrés - Modelo Deportista', '10 x 7.5 cm', 'Espuma de goma suave | Con uniforme', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjBnery4G028X8w_8oW-gP5zMyChFLl8-m3uws83HDINBdY4135IAm-oblA5mSDuZDJajJGAg5qDjTR2RSUVcixsfpxk2CZAE0ZjdbkdNKehj-CwJhsbhmZ5zTbwofhmoxvYr43nogYiB3y_3H6eolEJQ2L0g_g1uMfXGfRLTcA3M6nsuKkQM2j-CKzPeTr/s800/34.png', 8.48, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(87, 'escritorio-055', 'Artículos de Escritorio', 'Wincha con lapicero y nivel', '10.5 x 7 cm', 'Espuma de goma', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjceX2vxAlO5WmqwycjFu6Iv-dPZBbfH5GhiBqfI_1Xrd5UbujtRIY6OWs4F4N1eu5ZCpNb9Jxr-Glp3032weX4RPLZhf8TzRiz7Z1mAG5dMJChJMmk8TL6Djor9T4fy7xr6QZRMtOt2i6DiiwEnuqQZqTgVHTVRoe4e0-zqSivTLc4FMD67A-pszassc_d/s800/35.png', 8.28, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(88, 'escritorio-056', 'Artículos de Escritorio', 'Muñeco Antiestrés - Modelo Minero', '11 x 8 cm', 'Espuma de poliuretano | Incluye casco', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEiYq55zQU8SXjaDR7pKPtSDyV5j0brcCLWOoIYxByg1ENTFPbTw9J63TbWcAkF4M2mc9UNDOidiL0Dkq9aPqJoIkYMYyKGrf5zYbj5nmWKo3-c1JUEzbynjUm8_3Jr-G-lhxXcWJyvfIMM-6qaP4SJorISt_H3alnOA-wRgVbVgYcOlsTQxdyMWzbS0JaJ6/s800/40.png', 12.53, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(89, 'escritorio-057', 'Artículos de Escritorio', 'Muñeco Antiestrés - Modelo Deportista', '10 x 7.5 cm', 'Espuma de goma suave | Con uniforme', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjceX2vxAlO5WmqwycjFu6Iv-dPZBbfH5GhiBqfI_1Xrd5UbujtRIY6OWs4F4N1eu5ZCpNb9Jxr-Glp3032weX4RPLZhf8TzRiz7Z1mAG5dMJChJMmk8TL6Djor9T4fy7xr6QZRMtOt2i6DiiwEnuqQZqTgVHTVRoe4e0-zqSivTLc4FMD67A-pszassc_d/s800/35.png', 8.48, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(90, 'escritorio-058', 'Artículos de Escritorio', 'Popsocket para celular', '10.5 x 7 cm', 'Espuma de goma', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEg53Y8KHutfsyIu8wk-wwxeu_bABAEzEGuF9tVsrAnhuUZXS1aNj_3wCJM_KfENljcDUIKruvGGzbsYKIQAisg_Ph7cTq6LeTKCCIOIbL5uFRN8DiO_Okx6JPKSwDbayA3kilq_iI6TGf9wn3yX094Xk4pOZ8ckCb4u7mB5R8zysyLlFfBOOvnBN-JO5kat/s800/37.png', 17.13, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(91, 'escritorio-059', 'Artículos de Escritorio', 'Popsocket para celular', '11 x 8 cm', 'Espuma de poliuretano | Incluye casco', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhEGDlvCPC3YJqRxfnHWRd2JcKoPMaP9GzsgVmAEV9M15w18Ch2i-CNZ7Y9LvwS0QmHE2qbA7R15Deokn4JjpBdhKxTEbSpoJ8Ltj5NbHqfyF7cnMJMQTa4qdJ8aPCKEEbEUVHUgsaJAAjvUBsnuVKuIszBpTysyBjZ15-ugBrQt2LHX6q9qLaaRZNDJDlA/s800/38.png', 17.13, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(92, 'escritorio-060', 'Artículos de Escritorio', 'Muñeco Antiestrés - Modelo Deportista', '10 x 7.5 cm', 'Espuma de goma suave | Con uniforme', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEg53Y8KHutfsyIu8wk-wwxeu_bABAEzEGuF9tVsrAnhuUZXS1aNj_3wCJM_KfENljcDUIKruvGGzbsYKIQAisg_Ph7cTq6LeTKCCIOIbL5uFRN8DiO_Okx6JPKSwDbayA3kilq_iI6TGf9wn3yX094Xk4pOZ8ckCb4u7mB5R8zysyLlFfBOOvnBN-JO5kat/s800/37.png', 8.48, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(93, 'escritorio-061', 'Artículos de Escritorio', 'Bolsillo para celular de silicona', '10.5 x 7 cm', 'Espuma de goma', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEizJuOj5soaH23JvxKwEVloQF4tqP8l7ZgylKEu19adtJCgBtKvQ_nASHg45jyOWvl1yk3mXe5vzibmos7jJaGaqMBw_SAF_KDFxRBdUWKE8si7SgY7yCWwdEMZsnP99UNWSmhB4SYI2Ah5_NnnEuscCNdsBnxf8X0cYnuWocu1qSk9-uoc_neaEJA35E58/s800/40.png', 11.54, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(94, 'escritorio-062', 'Artículos de Escritorio', 'Popsocket para celular', '11 x 8 cm', 'Espuma de poliuretano | Incluye casco', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjvZ7Ni1fSTvOhKB8ydPxSQIAFl5pdmJlDV3DzVH3em6VvWqLo_ARJNDoGzHzx5_QlEFvoLSo8bZkilO4So6MmvIbx8PDvJxhe5G-1FedtzEmNVddIgFGblgJ1_diMtYVKJ982GiFhemCG7mDNfdnbFanBeVa1dQOc-Ync1DK-iXFLzN5UqJ4PUw4az-G9e/s800/165.png', 17.13, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(95, 'escritorio-063', 'Artículos de Escritorio', 'Muñeco Antiestrés - Modelo Deportista', '10 x 7.5 cm', 'Espuma de goma suave | Con uniforme', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEizJuOj5soaH23JvxKwEVloQF4tqP8l7ZgylKEu19adtJCgBtKvQ_nASHg45jyOWvl1yk3mXe5vzibmos7jJaGaqMBw_SAF_KDFxRBdUWKE8si7SgY7yCWwdEMZsnP99UNWSmhB4SYI2Ah5_NnnEuscCNdsBnxf8X0cYnuWocu1qSk9-uoc_neaEJA35E58/s800/40.png', 8.48, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(96, 'escritorio-064', 'Artículos de Escritorio', 'Cuaderno corporativo', '10.5 x 7 cm', 'Espuma de goma', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgeQe5aNhI4DwSIIQImezyv623I1LhWiifIPzWOht8VZzCxW0u37tCasLcOblDlt5liSFt4tn8nCdMb2ZoP9br_nJxtsErlMyDlB3y0OqvWcQPopitCYq-GTUfdp_GiArjXkOw-CNNBmAypPEHESQy3jpeJ_LbEfKDDLPy0gujwMHeHy_SdO4yYOmzVmhKH/s800/67.png', 11.04, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(97, 'escritorio-065', 'Artículos de Escritorio', 'Muñeco Antiestrés - Modelo Minero', '11 x 8 cm', 'Espuma de poliuretano | Incluye casco', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgeQe5aNhI4DwSIIQImezyv623I1LhWiifIPzWOht8VZzCxW0u37tCasLcOblDlt5liSFt4tn8nCdMb2ZoP9br_nJxtsErlMyDlB3y0OqvWcQPopitCYq-GTUfdp_GiArjXkOw-CNNBmAypPEHESQy3jpeJ_LbEfKDDLPy0gujwMHeHy_SdO4yYOmzVmhKH/s800/67.png', 12.53, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(98, 'escritorio-066', 'Artículos de Escritorio', 'Libreta tapa cuerina', '10 x 7.5 cm', 'Espuma de goma suave | Con uniforme', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgeQe5aNhI4DwSIIQImezyv623I1LhWiifIPzWOht8VZzCxW0u37tCasLcOblDlt5liSFt4tn8nCdMb2ZoP9br_nJxtsErlMyDlB3y0OqvWcQPopitCYq-GTUfdp_GiArjXkOw-CNNBmAypPEHESQy3jpeJ_LbEfKDDLPy0gujwMHeHy_SdO4yYOmzVmhKH/s800/67.png', 9.32, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(99, 'escritorio-067', 'Artículos de Escritorio', 'Cuaderno corporativo', '10.5 x 7 cm', 'Espuma de goma', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhxOOLBRXBSbpipI3KdTy0N7mGjXG2ZUkHOwddbipgUrcG56UsZM93ddI5iCkkx-MZU17cCZqFN3b93BmpWN9YjzdMFg4Kqk-tqPRXxmCJmGnMW7iZqL3-ZWU7TAX1wkrho6K0nkMglxIQ4e2uR5rtAZwBCoOPQNNAXU_FOrHy1hsf969tcD-JJ6EX_OQ8-/s800/69.png', 11.04, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(100, 'escritorio-068', 'Artículos de Escritorio', 'Libreta tapa biocuero', '10.5 x 7 cm', 'Espuma de goma', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgR1hhjgMN96zhqvBL6GKUnKF0-dsLgbCGfUv_hbxMlD6ZGp8DjsMGMJAyUAvlUxIkFn69uxVUDAzsGSW5ursHxK-dHoo9ZLE0hpe7uZo__Okx7piccxcs8hgoDG7WFDkbfsEtT1Z1KH8D5suU1rgn_rErxAHrMs7FMKb7_j1rNgWUHv-SGFfW7jXaOFaLq/s800/72.png', 15.13, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(101, 'escritorio-069', 'Artículos de Escritorio', 'Corazon Amtiestres', '10.5 x 7 cm', 'Espuma de goma', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhoZSCEVkHfUO38guPAWZulqF9G3e4M0D5Rl1diLuZXUd3OMgLfoQjXaMLMFrQuOlqvS_uxBLg4UeSSboElcqok1SBkwczONYWGxs0CNPERdlych7W9ynqnk2X3vTdQEiPpDs5fE6Njfx6kYl4glFy7VBp_IsSRSrl7FZ39yjGxoXcHIZF2BsmHiLVwBeDd/s800/73.png', 11.21, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(102, 'escritorio-070', 'Artículos de Escritorio', 'Libreta porta celular', '10.5 x 7 cm', 'Espuma de goma', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhNS1O_0CfqPRa0D04lMDsZd1u6SqTFGJKKthtmcydZR18T9lKBHbnPlNeVOcBLs1pq0qdaO8fBphpL1XoJCDgg5WYq5jsbzZP-FCg5suBzS-i881R5b-r7dRNGWw-tPO5rpQoo9nEkZsO_A54gT7juiXGQGGmWNeRAQsMJS3eQHUdKuPSRqlSIkdllFX2V/s800/75.png', 14.67, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(103, 'escritorio-071', 'Artículos de Escritorio', 'Dado antiestres', '11 x 8 cm', 'Espuma de poliuretano | Incluye casco', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhNS1O_0CfqPRa0D04lMDsZd1u6SqTFGJKKthtmcydZR18T9lKBHbnPlNeVOcBLs1pq0qdaO8fBphpL1XoJCDgg5WYq5jsbzZP-FCg5suBzS-i881R5b-r7dRNGWw-tPO5rpQoo9nEkZsO_A54gT7juiXGQGGmWNeRAQsMJS3eQHUdKuPSRqlSIkdllFX2V/s800/75.png', 6.01, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44');
INSERT INTO `productos_tb_baycodec` (`id`, `codigo`, `categoria`, `nombre`, `medidas`, `material`, `colores`, `imagen_url`, `precio_referencial_pen`, `stock`, `activo`, `vendedor_id`, `creado_en`, `actualizado_en`) VALUES
(104, 'escritorio-072', 'Artículos de Escritorio', 'Dado antiestres', '10 x 7.5 cm', 'Espuma de goma suave | Con uniforme', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhNS1O_0CfqPRa0D04lMDsZd1u6SqTFGJKKthtmcydZR18T9lKBHbnPlNeVOcBLs1pq0qdaO8fBphpL1XoJCDgg5WYq5jsbzZP-FCg5suBzS-i881R5b-r7dRNGWw-tPO5rpQoo9nEkZsO_A54gT7juiXGQGGmWNeRAQsMJS3eQHUdKuPSRqlSIkdllFX2V/s800/75.png', 6.01, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(105, 'escritorio-073', 'Artículos de Escritorio', 'Libreta texturizada', '10.5 x 7 cm', 'Espuma de goma', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjTjFnar0yDk-NghNt4JWiqVFyHeUC9rf49v7pgrdtP1o_KM6aS_5MEoD8AOraq1NNM5Mm2BsSHk1CGPji5erXUsp2tUlQwp9T9O1AT3pukwEjXCIu_SM3tm_OrYL6LkJ7ggC0Ek6HaJm6wqGW0hDBDrT757CI33L6VPHwQBvlsJRoQfaN4ur-kJOgSaYvB/s800/74.png', 10.12, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(106, 'escritorio-074', 'Artículos de Escritorio', 'Muñeco Antiestrés - Modelo Minero', '11 x 8 cm', 'Espuma de poliuretano | Incluye casco', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjTjFnar0yDk-NghNt4JWiqVFyHeUC9rf49v7pgrdtP1o_KM6aS_5MEoD8AOraq1NNM5Mm2BsSHk1CGPji5erXUsp2tUlQwp9T9O1AT3pukwEjXCIu_SM3tm_OrYL6LkJ7ggC0Ek6HaJm6wqGW0hDBDrT757CI33L6VPHwQBvlsJRoQfaN4ur-kJOgSaYvB/s800/74.png', 12.53, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(107, 'escritorio-075', 'Artículos de Escritorio', 'Muñeco Antiestrés - Modelo Deportista', '10 x 7.5 cm', 'Espuma de goma suave | Con uniforme', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjTjFnar0yDk-NghNt4JWiqVFyHeUC9rf49v7pgrdtP1o_KM6aS_5MEoD8AOraq1NNM5Mm2BsSHk1CGPji5erXUsp2tUlQwp9T9O1AT3pukwEjXCIu_SM3tm_OrYL6LkJ7ggC0Ek6HaJm6wqGW0hDBDrT757CI33L6VPHwQBvlsJRoQfaN4ur-kJOgSaYvB/s800/74.png', 8.48, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(108, 'escritorio-076', 'Artículos de Escritorio', 'Cuaderno corporativo', '10.5 x 7 cm', 'Espuma de goma', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjIdBA_ORNOW3fu0feKK4ZCWh6FdfHFiGCyfOSkjtZCI1EHRDNR7PtLYqjQyD6Tm8Hg6tpFj_dZK_DsAgq40BRyIig3xJlBuv2Ql7Rk1_Aj5pR3BokPX8wnTdobnAVn177T6_YESngJSANsDBYHbpvvt7JEs6j3aq6TC0EncIYVzAawfQdVbyMM0Y3vXNN8/s800/76.png', 11.04, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(109, 'escritorio-077', 'Artículos de Escritorio', 'Muñeco Antiestrés - Modelo Minero', '11 x 8 cm', 'Espuma de poliuretano | Incluye casco', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjIdBA_ORNOW3fu0feKK4ZCWh6FdfHFiGCyfOSkjtZCI1EHRDNR7PtLYqjQyD6Tm8Hg6tpFj_dZK_DsAgq40BRyIig3xJlBuv2Ql7Rk1_Aj5pR3BokPX8wnTdobnAVn177T6_YESngJSANsDBYHbpvvt7JEs6j3aq6TC0EncIYVzAawfQdVbyMM0Y3vXNN8/s800/76.png', 12.53, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(110, 'escritorio-078', 'Artículos de Escritorio', 'Muñeco Antiestrés - Modelo Deportista', '10 x 7.5 cm', 'Espuma de goma suave | Con uniforme', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjIdBA_ORNOW3fu0feKK4ZCWh6FdfHFiGCyfOSkjtZCI1EHRDNR7PtLYqjQyD6Tm8Hg6tpFj_dZK_DsAgq40BRyIig3xJlBuv2Ql7Rk1_Aj5pR3BokPX8wnTdobnAVn177T6_YESngJSANsDBYHbpvvt7JEs6j3aq6TC0EncIYVzAawfQdVbyMM0Y3vXNN8/s800/76.png', 8.48, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(111, 'escritorio-079', 'Artículos de Escritorio', 'Libreta ecológica', '10.5 x 7 cm', 'Espuma de goma', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjndXQ-14oLh6ZNAOJklmIdI-TcQTVol3v2oDFj9WHjs67qCwve1R34nXQrWC0olXYSslAehIsQvpyIQry0AOdpHTzk4qqgn8YRTutGh7KFc_TR3SFvE7J65XmyF856aBUH0FqhVDhyphenhyphenuhI-j0f2YtCIOwR1elvuFaaMVAR_eUAKUowYmdqO-04MCJrsa8IH/s800/78.png', 17.08, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(112, 'escritorio-080', 'Artículos de Escritorio', 'Muñeco Antiestrés - Modelo Minero', '11 x 8 cm', 'Espuma de poliuretano | Incluye casco', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjY2pPck5RzWmwlrJT7IPLbvPeGOB9qXzztqIA7U2RHY6CWtNjpOHDuR-9jemrJv1j72PR3CalWOdRJLvBRbFQPAlGB7XVCREMlwnA6U3AzbTaZRN1JUTelCJmGcj6Y7Jq1gQtxoco0aR-4pz5utzIRj3tPNibofgo1kUs1VnbUdpEOzcH75Pp8C3q7rxln/s800/79.png', 12.53, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(113, 'escritorio-081', 'Artículos de Escritorio', 'Muñeco Antiestrés - Modelo Deportista', '10 x 7.5 cm', 'Espuma de goma suave | Con uniforme', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhfnU60-e5Z-qm-pH39DbgyqWoPkjoPvpFj4CCyN_RUojybhOvT0-PzA5fyA0WV_7mQ8tuFG3d5sFXuYbpjsBsOQmO7n64q8bfmDx7sWYSbNG6MbbVyFeWjYxZAef88BuXaQtZdh710qjQp2GAPGha6DH8LHgsHvBlA6-FxUgx5ISfqeAQYU1rdLPZqpEF1/s800/77.png', 8.48, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(114, 'escritorio-082', 'Artículos de Escritorio', 'Libreta ecológica con bolsillo', '10.5 x 7 cm', 'Espuma de goma', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhz5yJt0IHEOZlD_6V9X6CVKHU2iuCZi8zy2bEL1mHAap3zYhKd4O_dgt_YLQL8ZpcowI6hxVtxiHGpTcW4jj-pFTBZMvDegMFXV4vqGYbEuJZCJRvCzbfXidtF36t9e2YZmeAo6-bRkx_4B_J-tMbw5-pIIhdd3Te6H7nYt8NZLM_UyZV8yvZFKinEaP2M/s800/70.png', 15.36, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(115, 'escritorio-083', 'Artículos de Escritorio', 'Muñeco Antiestrés - Modelo Minero', '11 x 8 cm', 'Espuma de poliuretano | Incluye casco', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhz5yJt0IHEOZlD_6V9X6CVKHU2iuCZi8zy2bEL1mHAap3zYhKd4O_dgt_YLQL8ZpcowI6hxVtxiHGpTcW4jj-pFTBZMvDegMFXV4vqGYbEuJZCJRvCzbfXidtF36t9e2YZmeAo6-bRkx_4B_J-tMbw5-pIIhdd3Te6H7nYt8NZLM_UyZV8yvZFKinEaP2M/s800/70.png', 12.53, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(116, 'escritorio-084', 'Artículos de Escritorio', 'Muñeco Antiestrés - Modelo Deportista', '10 x 7.5 cm', 'Espuma de goma suave | Con uniforme', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhz5yJt0IHEOZlD_6V9X6CVKHU2iuCZi8zy2bEL1mHAap3zYhKd4O_dgt_YLQL8ZpcowI6hxVtxiHGpTcW4jj-pFTBZMvDegMFXV4vqGYbEuJZCJRvCzbfXidtF36t9e2YZmeAo6-bRkx_4B_J-tMbw5-pIIhdd3Te6H7nYt8NZLM_UyZV8yvZFKinEaP2M/s800/70.png', 8.48, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(117, 'escritorio-085', 'Artículos de Escritorio', 'Libreta ecológica con post-it + regla', '10.5 x 7 cm', 'Espuma de goma', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjMmEOygeekW9vTIFlmL4t3WtzI0Vo99WXCoWWQSXqiHeKV53gacUfNbqANhyphenhyphenxkEHSBT6Trw2OfgZrM1_SGfFzR-rxX8zHZn6Xb8jxs_nz8MZqu9CV-QvIzmrexbWBkkP079dsH8tnNdXtgbcpYN9vUcxmCZGXZgGUNw72q1cStRZ8yxW-YO6ftmUjcR0Dx/s800/71.png', 15.85, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(118, 'escritorio-086', 'Artículos de Escritorio', 'Muñeco Antiestrés - Modelo Minero', '11 x 8 cm', 'Espuma de poliuretano | Incluye casco', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjMmEOygeekW9vTIFlmL4t3WtzI0Vo99WXCoWWQSXqiHeKV53gacUfNbqANhyphenhyphenxkEHSBT6Trw2OfgZrM1_SGfFzR-rxX8zHZn6Xb8jxs_nz8MZqu9CV-QvIzmrexbWBkkP079dsH8tnNdXtgbcpYN9vUcxmCZGXZgGUNw72q1cStRZ8yxW-YO6ftmUjcR0Dx/s800/71.png', 12.53, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(119, 'escritorio-087', 'Artículos de Escritorio', 'Muñeco Antiestrés - Modelo Deportista', '10 x 7.5 cm', 'Espuma de goma suave | Con uniforme', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjMmEOygeekW9vTIFlmL4t3WtzI0Vo99WXCoWWQSXqiHeKV53gacUfNbqANhyphenhyphenxkEHSBT6Trw2OfgZrM1_SGfFzR-rxX8zHZn6Xb8jxs_nz8MZqu9CV-QvIzmrexbWBkkP079dsH8tnNdXtgbcpYN9vUcxmCZGXZgGUNw72q1cStRZ8yxW-YO6ftmUjcR0Dx/s800/71.png', 8.48, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(120, 'escritorio-088', 'Artículos de Escritorio', 'Libreta con post-it + lapicero', '10.5 x 7 cm', 'Espuma de goma', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhM9OMleczBWpocRw2ZgmJkrdcTMxPe5mmrCq7FibNJA0j4S-VOJzocK0kXhCGPLK3xdrBX933XtBPOyOMGazld3gd-ptQPFX-jyodcDP3xiXwL6C3nPIqXyJKVwnlh7hDahgwyBaneIS6unYAxTvzgTbZXHkQoTArmKjSgi1D1gKvXonjpuo3tdigJAZXv/s800/65.png', 9.51, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(121, 'escritorio-089', 'Artículos de Escritorio', 'Muñeco Antiestrés - Modelo Minero', '11 x 8 cm', 'Espuma de poliuretano | Incluye casco', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhM9OMleczBWpocRw2ZgmJkrdcTMxPe5mmrCq7FibNJA0j4S-VOJzocK0kXhCGPLK3xdrBX933XtBPOyOMGazld3gd-ptQPFX-jyodcDP3xiXwL6C3nPIqXyJKVwnlh7hDahgwyBaneIS6unYAxTvzgTbZXHkQoTArmKjSgi1D1gKvXonjpuo3tdigJAZXv/s800/65.png', 12.53, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(122, 'escritorio-090', 'Artículos de Escritorio', 'Muñeco Antiestrés - Modelo Deportista', '10 x 7.5 cm', 'Espuma de goma suave | Con uniforme', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhM9OMleczBWpocRw2ZgmJkrdcTMxPe5mmrCq7FibNJA0j4S-VOJzocK0kXhCGPLK3xdrBX933XtBPOyOMGazld3gd-ptQPFX-jyodcDP3xiXwL6C3nPIqXyJKVwnlh7hDahgwyBaneIS6unYAxTvzgTbZXHkQoTArmKjSgi1D1gKvXonjpuo3tdigJAZXv/s800/65.png', 8.48, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(123, 'escritorio-091', 'Artículos de Escritorio', 'Libreta ecológica cubierta gruesa', '10.5 x 7 cm', 'Espuma de goma', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhamldLP14NTTxGuOV8rHKmC44i4A_Zz88gB-kb7yTugX9EClDxeVSmi9Mz-YfyTVtndgnDsRHJziRby7Ru2CDHJjw8aM2bIP2HN_-XUjzs7M0FyTcqv3nGSOu__mzRoXKcxNrOr2Psczwgn15E4YvcyeHwUsNcFwRUTkM2109QeZGJBbKDNyMSNmJBdr3C/s800/62.png', 7.43, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(124, 'escritorio-092', 'Artículos de Escritorio', 'Muñeco Antiestrés - Modelo Minero', '11 x 8 cm', 'Espuma de poliuretano | Incluye casco', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhamldLP14NTTxGuOV8rHKmC44i4A_Zz88gB-kb7yTugX9EClDxeVSmi9Mz-YfyTVtndgnDsRHJziRby7Ru2CDHJjw8aM2bIP2HN_-XUjzs7M0FyTcqv3nGSOu__mzRoXKcxNrOr2Psczwgn15E4YvcyeHwUsNcFwRUTkM2109QeZGJBbKDNyMSNmJBdr3C/s800/62.png', 12.53, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(125, 'escritorio-093', 'Artículos de Escritorio', 'Muñeco Antiestrés - Modelo Deportista', '10 x 7.5 cm', 'Espuma de goma suave | Con uniforme', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhamldLP14NTTxGuOV8rHKmC44i4A_Zz88gB-kb7yTugX9EClDxeVSmi9Mz-YfyTVtndgnDsRHJziRby7Ru2CDHJjw8aM2bIP2HN_-XUjzs7M0FyTcqv3nGSOu__mzRoXKcxNrOr2Psczwgn15E4YvcyeHwUsNcFwRUTkM2109QeZGJBbKDNyMSNmJBdr3C/s800/62.png', 8.48, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(126, 'escritorio-094', 'Artículos de Escritorio', 'Libreta con lapicero', '10.5 x 7 cm', 'Espuma de goma', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEi_kZ2YjXwPhOOfRD9mdAioGTv1Ql70R5NDB_Y8U9qU9WMpgYqFBn2Ae34TB0xP4IFoBWELCUDauBZ3DlCkzMFq1g6Zbg4cMHLnqH5jt4MdouVQD8Q9HtpvtLLTpWjgtRIQXOnK9J63Mzawk5fD4lYOZ34eXzAzVismvdwBA46dn7aInQ9RgfytaeSFbuQf/s800/64.png', 6.92, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(127, 'escritorio-095', 'Artículos de Escritorio', 'Muñeco Antiestrés - Modelo Minero', '11 x 8 cm', 'Espuma de poliuretano | Incluye casco', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEi_kZ2YjXwPhOOfRD9mdAioGTv1Ql70R5NDB_Y8U9qU9WMpgYqFBn2Ae34TB0xP4IFoBWELCUDauBZ3DlCkzMFq1g6Zbg4cMHLnqH5jt4MdouVQD8Q9HtpvtLLTpWjgtRIQXOnK9J63Mzawk5fD4lYOZ34eXzAzVismvdwBA46dn7aInQ9RgfytaeSFbuQf/s800/64.png', 12.53, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(128, 'escritorio-096', 'Artículos de Escritorio', 'Muñeco Antiestrés - Modelo Deportista', '10 x 7.5 cm', 'Espuma de goma suave | Con uniforme', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEi_kZ2YjXwPhOOfRD9mdAioGTv1Ql70R5NDB_Y8U9qU9WMpgYqFBn2Ae34TB0xP4IFoBWELCUDauBZ3DlCkzMFq1g6Zbg4cMHLnqH5jt4MdouVQD8Q9HtpvtLLTpWjgtRIQXOnK9J63Mzawk5fD4lYOZ34eXzAzVismvdwBA46dn7aInQ9RgfytaeSFbuQf/s800/64.png', 8.48, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(129, 'escritorio-097', 'Artículos de Escritorio', 'Muñeco Antiestrés - Modelo Clásico', '10.5 x 7 cm', 'Espuma de goma', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgvORMvC_a6mJ683nTfEz31EWfXyrAJBhSwgwzw_S4IPx074YjyY3DkrTeSkWSJKpJWSDFsYpZhyDZPJ0dNe54jok6JFrA9diKfDMlu8hGET7-SxzIm8tqxaLlfy5EIiptXSXdFnsaLMrPaXjadktsrP87ytazbpaOeBT1BZiD8kSWSMxsztNSJXctxK4sS/s800/80.png', 15.37, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(130, 'escritorio-098', 'Artículos de Escritorio', 'Muñeco Antiestrés - Modelo Minero', '11 x 8 cm', 'Espuma de poliuretano | Incluye casco', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgvORMvC_a6mJ683nTfEz31EWfXyrAJBhSwgwzw_S4IPx074YjyY3DkrTeSkWSJKpJWSDFsYpZhyDZPJ0dNe54jok6JFrA9diKfDMlu8hGET7-SxzIm8tqxaLlfy5EIiptXSXdFnsaLMrPaXjadktsrP87ytazbpaOeBT1BZiD8kSWSMxsztNSJXctxK4sS/s800/80.png', 12.53, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(131, 'escritorio-099', 'Artículos de Escritorio', 'Mini portanotas con post-it', '10 x 7.5 cm', 'Espuma de goma suave | Con uniforme', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgvORMvC_a6mJ683nTfEz31EWfXyrAJBhSwgwzw_S4IPx074YjyY3DkrTeSkWSJKpJWSDFsYpZhyDZPJ0dNe54jok6JFrA9diKfDMlu8hGET7-SxzIm8tqxaLlfy5EIiptXSXdFnsaLMrPaXjadktsrP87ytazbpaOeBT1BZiD8kSWSMxsztNSJXctxK4sS/s800/80.png', 6.55, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(132, 'escritorio-100', 'Artículos de Escritorio', 'Portanotas cuerina', '10.5 x 7 cm', 'Espuma de goma', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjSsjRFDiYpjrZfV1VnO3fObe35m7YMuBZXbd2VamEWV14VRJIfdGzA8WLBx338b0HBxU0FR5-VOJ8zHVYsOkVVvb-OEb9GxLB_13Y0v9gcL6GAG9la3bpsklKnOECneM5IvmV94zUcngtuJaex767l9C09x5RdSpjVsCo5hkQr95nmw3BNQ85j4BxCF4i_/s800/81.png', 10.75, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(133, 'escritorio-101', 'Artículos de Escritorio', 'Corazon Amtiestres', '10.5 x 7 cm', 'Espuma de goma', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgI5Fw46vm3kY-bsGa3ugHlFpc13NUXF6vvUbCEqiTH5HF8Cnl1X17lDDRO87i9J7MvWVng0BRAR1AYLi0Ua69kjfIUtu-OeGvFx0Iu81pLtLgVVOTTqfH4LxBAJI_A1T2SnryxTyEzzHHFcRCvyNmXfePIMphLmtiVglbXFuwJzpwhKPiTRwytJwpJBLDA/s800/82.png', 11.21, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(134, 'escritorio-102', 'Artículos de Escritorio', 'Cubo portanotas', '10.5 x 7 cm', 'Espuma de goma', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgI5Fw46vm3kY-bsGa3ugHlFpc13NUXF6vvUbCEqiTH5HF8Cnl1X17lDDRO87i9J7MvWVng0BRAR1AYLi0Ua69kjfIUtu-OeGvFx0Iu81pLtLgVVOTTqfH4LxBAJI_A1T2SnryxTyEzzHHFcRCvyNmXfePIMphLmtiVglbXFuwJzpwhKPiTRwytJwpJBLDA/s800/82.png', 11.74, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(135, 'escritorio-103', 'Artículos de Escritorio', 'Porta notas bambú', '10.5 x 7 cm', 'Espuma de goma', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhB2IrRoHnwG8ri9hcT0l0N-0OU8QgefuST0sRMqbXOoJsEQnWLW4FH6lXxkO-vbbUAF7ZSLShT8UOdAgIN24yi3iVZ-VLePQ1E5i4SKvRoRGu9p2y9rN-o1WSD9hIaDClEbSJOUg51vUz8vVM-FTfzym_fZwPwkCnokHlEz3uWIefhDJGts1hgw-J-nOEI/s800/83.png', 10.81, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(136, 'escritorio-104', 'Artículos de Escritorio', 'Dado antiestres', '11 x 8 cm', 'Espuma de poliuretano | Incluye casco', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhB2IrRoHnwG8ri9hcT0l0N-0OU8QgefuST0sRMqbXOoJsEQnWLW4FH6lXxkO-vbbUAF7ZSLShT8UOdAgIN24yi3iVZ-VLePQ1E5i4SKvRoRGu9p2y9rN-o1WSD9hIaDClEbSJOUg51vUz8vVM-FTfzym_fZwPwkCnokHlEz3uWIefhDJGts1hgw-J-nOEI/s800/83.png', 6.01, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(137, 'escritorio-105', 'Artículos de Escritorio', 'Dado antiestres', '10 x 7.5 cm', 'Espuma de goma suave | Con uniforme', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhB2IrRoHnwG8ri9hcT0l0N-0OU8QgefuST0sRMqbXOoJsEQnWLW4FH6lXxkO-vbbUAF7ZSLShT8UOdAgIN24yi3iVZ-VLePQ1E5i4SKvRoRGu9p2y9rN-o1WSD9hIaDClEbSJOUg51vUz8vVM-FTfzym_fZwPwkCnokHlEz3uWIefhDJGts1hgw-J-nOEI/s800/83.png', 6.01, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(138, 'escritorio-106', 'Artículos de Escritorio', 'Separador de libros', '10.5 x 7 cm', 'Espuma de goma', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjmrTb1GuGtwhMLF0KmfAn1g2jfTIZBURacVue3xSWNNmfqfQWT8oQa50l_c3QWiSIvr15mFSjLEE4MT8LchxsucXGckibzuQNiC6wDOCCQHDBYBFbq5MWYBlWMJt68FVGQUJXlRSjkrvMmDU4zWGheY1-fpN74sSpNw1KUj8a6GxDV-K9MRpctK46hsnmo/s800/84.png', 11.99, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(139, 'escritorio-107', 'Artículos de Escritorio', 'Muñeco Antiestrés - Modelo Minero', '11 x 8 cm', 'Espuma de poliuretano | Incluye casco', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjmrTb1GuGtwhMLF0KmfAn1g2jfTIZBURacVue3xSWNNmfqfQWT8oQa50l_c3QWiSIvr15mFSjLEE4MT8LchxsucXGckibzuQNiC6wDOCCQHDBYBFbq5MWYBlWMJt68FVGQUJXlRSjkrvMmDU4zWGheY1-fpN74sSpNw1KUj8a6GxDV-K9MRpctK46hsnmo/s800/84.png', 12.53, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(140, 'escritorio-108', 'Artículos de Escritorio', 'Muñeco Antiestrés - Modelo Deportista', '10 x 7.5 cm', 'Espuma de goma suave | Con uniforme', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjmrTb1GuGtwhMLF0KmfAn1g2jfTIZBURacVue3xSWNNmfqfQWT8oQa50l_c3QWiSIvr15mFSjLEE4MT8LchxsucXGckibzuQNiC6wDOCCQHDBYBFbq5MWYBlWMJt68FVGQUJXlRSjkrvMmDU4zWGheY1-fpN74sSpNw1KUj8a6GxDV-K9MRpctK46hsnmo/s800/84.png', 8.48, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(141, 'escritorio-109', 'Artículos de Escritorio', 'Porta notas bambú', '10.5 x 7 cm', 'Espuma de goma', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEh17i1ha-_RuTbLGNEW5KHOmdCIuBWdmsxnWBMutqoEzEVacUSDVCNz6N9zY7kZAJ57YktQrzr8qTpYmiV9nHszxPWe3xbvGZ3YToxI3O5qFUh1w-9bF_1_aQ008u0R9fLbtrSTIZMTiDwmTPHRlg2bwR0oBKB_fDCkYKXueg0b7oYB_DPT3kSj7xVSR75D/s800/85.png', 10.81, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(142, 'escritorio-110', 'Artículos de Escritorio', 'Porta notas bambú', '11 x 8 cm', 'Espuma de poliuretano | Incluye casco', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEh17i1ha-_RuTbLGNEW5KHOmdCIuBWdmsxnWBMutqoEzEVacUSDVCNz6N9zY7kZAJ57YktQrzr8qTpYmiV9nHszxPWe3xbvGZ3YToxI3O5qFUh1w-9bF_1_aQ008u0R9fLbtrSTIZMTiDwmTPHRlg2bwR0oBKB_fDCkYKXueg0b7oYB_DPT3kSj7xVSR75D/s800/85.png', 10.81, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(143, 'escritorio-111', 'Artículos de Escritorio', 'Muñeco Antiestrés - Modelo Deportista', '10 x 7.5 cm', 'Espuma de goma suave | Con uniforme', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEh17i1ha-_RuTbLGNEW5KHOmdCIuBWdmsxnWBMutqoEzEVacUSDVCNz6N9zY7kZAJ57YktQrzr8qTpYmiV9nHszxPWe3xbvGZ3YToxI3O5qFUh1w-9bF_1_aQ008u0R9fLbtrSTIZMTiDwmTPHRlg2bwR0oBKB_fDCkYKXueg0b7oYB_DPT3kSj7xVSR75D/s800/85.png', 8.48, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(144, 'escritorio-112', 'Artículos de Escritorio', 'Lapicero plástico', '10.5 x 7 cm', 'Espuma de goma', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEj8Za9dJO_A4fZOnIU8MYfo8DeJF_HOpoPh5T4RS5g_JhVZgrg5ml-wvzEDIefZ3A-7Iz8uewYpReBWBaIkoBdnIJ2cljNWqSRDNQB6QHzRxlcJD7vIwgrk-RT028djUQ_XERmkSyuPxSGbupACb5VfHad-KvcZf6opWRtG5wkZPfwigkJtVX1OykPV4z66/s800/86.png', 6.46, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(145, 'escritorio-113', 'Artículos de Escritorio', 'Lapicero plástico', '11 x 8 cm', 'Espuma de poliuretano | Incluye casco', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgyK7s5keuj2F4bh-9td5pqVT5XLJCqtFCJ6j2hkxWfXZlqpLVuUwABGJyBe4hGX6ruHRwEMpAAuvB4acHLKx3Yc2_p2ffyqs2oVYdFosmR3kj0Ue8_cKlU7kcywVbkxj-oHmL2Xej4RHjPYio1mmRQxT4QsSN5qzhjUk52UMBIA2PyDYoM7_1Efym2t95a/s800/87.png', 6.46, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(146, 'escritorio-114', 'Artículos de Escritorio', 'Lapicero plástico', '10 x 7.5 cm', 'Espuma de goma suave | Con uniforme', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEiFhygasHxDSIsKFnDercuFEX9A4Pfm6Xl2RhzfKBnT6UOTfGCImmSmGIPJfin0ZKiKDOJHaxl1tqngF-ncLbdOKjIcCXy-zn7DGx3ZtHwXJXo9p_Xn66eB1fk8gYX_5tdhyTS75lkZOUh0obCygrwebjHSnBkF52xG7N3cjEGolDOR5wUDqLBby9jIMSPm/s800/90.png', 6.46, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(147, 'escritorio-115', 'Artículos de Escritorio', 'Lapicero plástico con clip metálico', '10.5 x 7 cm', 'Espuma de goma', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhuc7DV-_uBbc8KhknqMj41y9cBbFCGAW36dmA_sXvfLK2m6STRWLH9Bwne4T48sUywcmN8bNAsXh8iIzwNQYQmOW1ibZSPPeGzNnTTUl9t2p80w6CUJ_Sd7hXuFIBEfwv9tYJ77js5PU3W-f9To5yCo9CpsQ-qfdQFHS_yHiMKbxBzRlNFfBWIO5Rpzx91/s800/107.png', 14.73, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(148, 'escritorio-116', 'Artículos de Escritorio', 'Lapicero plástico con clip metálico', '11 x 8 cm', 'Espuma de poliuretano | Incluye casco', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgQh3G3WP6dPayH2iWnOUVyJ7VX_7dBrqUfOyaz1HpYyuF7uePPMKkKwwFXuI8QVr-MXloE0-Ean9ZxNUdqlejD3ZQdSawrNCIxW77Sow9Fmd2mvTWWmBtqnMMu_Ji-MTvtxcdCK8obaeJjsVTIRxTIsyq5UHnwr2WBgXqByKIotMVl5V2ORiQlJAH4w5mT/s800/88.png', 14.73, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(149, 'escritorio-117', 'Artículos de Escritorio', 'Lapicero plástico con clip metálico', '10 x 7.5 cm', 'Espuma de goma suave | Con uniforme', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjQWCqYoR_ZPSn45lHqOgFc3JXu-JacGUkFHhDAd8qt3tlWx7a00tKydAHMCX896s6QS2165MwtjKQHLsdBhE911UmVWT0bQS8LJjSj0HgY5w-lrNrjEwPxTmGyxIq9Q9RWYMPQkouIm3rn05du4x8EgO2d4WHr3XZfFAB51f01IS_e56VuMA8abTxpjyHz/s800/113.png', 14.73, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(150, 'escritorio-118', 'Artículos de Escritorio', 'Lapicero plástico color entero', '10.5 x 7 cm', 'Espuma de goma', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjLG44jucCeXUZcC1HQF7sJBJ6n35vsrr6UaiOMyHc0Ty1gryGHHZ5KTJyVAu1w9hQUFv2mtD4pkwoXtBQVedJLJc08ggNNQsVaYHQqhqQoXDv0YlSHh6-LmsacOD-MbcHtmU-dA1LyaWHsvqBSSIQBe8Av0WMyog3bM4Y2SjBqeJKEfD064RRsdqzNHr32/s800/98.png', 6.61, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(151, 'escritorio-119', 'Artículos de Escritorio', 'Corazon Amtiestres', '10.5 x 7 cm', 'Espuma de goma', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgR6sowB6nXffiqAr7WJRSPBfKxjMcggjLwgeZY8fHxYxbd823mLb9bQFdGXOUufZemeaGvh4ddGLw6bQYKCs6daAm7cS6CJO0sI_efPcUZs52UO9gZpVLV7oa6UIBPFzvSL1qGWQxOjsTt9clz56Z9iSdudPFUbb6oz_G_uHwSZMar7kP42kqkAtGCEyKE/s800/92.png', 11.21, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(152, 'escritorio-120', 'Artículos de Escritorio', 'Corazon Amtiestres', '10.5 x 7 cm', 'Espuma de goma', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEh4NRFb_539omvaENHtqcfoaH91P9OvwiSzsEzqGxkLP3gMIDtqCJouyKLEC29u5jWBdhh8tPybb0rWl5suFW-gslYCRQ_mL0lRAbXj-PwudZd_fkHrANKFR7bjA95nMt_eNdxkSC0Xyofii4AMa2T72c74uNHiRH5ji-aCVDUVjRUpnEpy126NZSlB8zFU/s800/89.png', 11.21, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(153, 'escritorio-121', 'Artículos de Escritorio', 'Lapicero plástico con resaltador', '10.5 x 7 cm', 'Espuma de goma', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEh_QrGLLdwf3Q8xBg_pZrLBfEahiN1knnWpgEvDI_0kqAiy921nquVWROagfh-XKppn8vGLJEgeH5kOJM4VIGecL_B_5sMxDPjdzxCMAlh7qtPuvEB1MQVZYduOrSzWVvjvu9E8PUcemtv08NvsDXm3ZvCIGEsRVrgUzgTBzKOpZOCRC0tcIeNvUM8DdBhG/s800/102.png', 17.75, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(154, 'escritorio-122', 'Artículos de Escritorio', 'Dado antiestres', '11 x 8 cm', 'Espuma de poliuretano | Incluye casco', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEh_QrGLLdwf3Q8xBg_pZrLBfEahiN1knnWpgEvDI_0kqAiy921nquVWROagfh-XKppn8vGLJEgeH5kOJM4VIGecL_B_5sMxDPjdzxCMAlh7qtPuvEB1MQVZYduOrSzWVvjvu9E8PUcemtv08NvsDXm3ZvCIGEsRVrgUzgTBzKOpZOCRC0tcIeNvUM8DdBhG/s800/102.png', 6.01, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(155, 'escritorio-123', 'Artículos de Escritorio', 'Dado antiestres', '10 x 7.5 cm', 'Espuma de goma suave | Con uniforme', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEh_QrGLLdwf3Q8xBg_pZrLBfEahiN1knnWpgEvDI_0kqAiy921nquVWROagfh-XKppn8vGLJEgeH5kOJM4VIGecL_B_5sMxDPjdzxCMAlh7qtPuvEB1MQVZYduOrSzWVvjvu9E8PUcemtv08NvsDXm3ZvCIGEsRVrgUzgTBzKOpZOCRC0tcIeNvUM8DdBhG/s800/102.png', 6.01, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(156, 'escritorio-124', 'Artículos de Escritorio', 'Lapicero plástico con touch', '10.5 x 7 cm', 'Espuma de goma', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhk3ZXnc7idPIojjQdAE3a-En_61YMvTQHLyAuksT7BPFjoT81fbmEGflISfaFJONU522NISCGQJAlXTvsmZwHEBGakoeLPkHO-NhhkwMX8o_3Sw1LHQGv8000hHA1KzvH-GPKDGk6prkOzRtryvrBnkCuT40A-k5VzvM-hhUbvpgkPnJjkIi3UjzLVAQZj/s800/97.png', 14.36, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(157, 'escritorio-125', 'Artículos de Escritorio', 'Lapicero plástico con touch', '11 x 8 cm', 'Espuma de poliuretano | Incluye casco', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjwQE2R4nBtn5bS4HuHMVP86dweqzIDxH5K8G2y7vF9HtLiSeZ_r6YlVYxJIT5g99BEQbJLLB0tcGheOEndMLd-WM-6g0Cs3Ypz2fUx7Vj3lGyFp5Z4aeYcPqlxXk7edlOYPJJJ7NsGqpwK1C1sESgRSGO4I9DYVuU5WK5uwnz_MIQ_dDUTH-slxjriiBrS/s800/104.png', 14.36, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(158, 'escritorio-126', 'Artículos de Escritorio', 'Lapicero plástico con touch', '10 x 7.5 cm', 'Espuma de goma suave | Con uniforme', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhk3ZXnc7idPIojjQdAE3a-En_61YMvTQHLyAuksT7BPFjoT81fbmEGflISfaFJONU522NISCGQJAlXTvsmZwHEBGakoeLPkHO-NhhkwMX8o_3Sw1LHQGv8000hHA1KzvH-GPKDGk6prkOzRtryvrBnkCuT40A-k5VzvM-hhUbvpgkPnJjkIi3UjzLVAQZj/s800/97.png', 14.36, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(159, 'escritorio-127', 'Artículos de Escritorio', 'Lapicero metálico con touch', '10.5 x 7 cm', 'Espuma de goma', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhjQN6yUU5EVvdU20ZUz0UuRQWFcKusQVQ2MsoxGXxOwedioFSPMeGL6n-NUvreEgWsXIDFV9pP9wcQnhQwf6nlbl9-43BfviQvjT-6PGJHB-2v8sOvIEfoEt3qjDCD9Xkp6f_dHzFchayT7JXG6NzXQtjiuMPEVS8bqEnK0zdKDviT6To0O3NGfNOycQH6/s800/108.png', 8.60, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(160, 'escritorio-128', 'Artículos de Escritorio', 'Lapicero metálico con touch', '11 x 8 cm', 'Espuma de poliuretano | Incluye casco', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhbd9GSNHdtmniQfAFouAkfbc7RrDwKbP0OlXVlRaoAznNcQcMCIU11COe1GAfT_EIH18I7uhZqvvH2J6G_ROtrUdhjIlJaI0xAtqFIpST9Bu-K1vqatfZ82zGt5SVJThJNvTM3mC8DqluJHughg5OBX-4dipeJecMDF2hPIbicL_bQTgM8QsSP8psq5IA7/s800/114.png', 8.60, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(161, 'escritorio-129', 'Artículos de Escritorio', 'Muñeco Antiestrés - Modelo Deportista', '10 x 7.5 cm', 'Espuma de goma suave | Con uniforme', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhjQN6yUU5EVvdU20ZUz0UuRQWFcKusQVQ2MsoxGXxOwedioFSPMeGL6n-NUvreEgWsXIDFV9pP9wcQnhQwf6nlbl9-43BfviQvjT-6PGJHB-2v8sOvIEfoEt3qjDCD9Xkp6f_dHzFchayT7JXG6NzXQtjiuMPEVS8bqEnK0zdKDviT6To0O3NGfNOycQH6/s800/108.png', 8.48, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(162, 'escritorio-130', 'Artículos de Escritorio', 'Lapicero de metal 7230', '10.5 x 7 cm', 'Espuma de goma', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEivyLXBp-ucj_RNKuCXtP0qeCLWr6i66EhsOs0iJpE06T1uy3yDvCcEkiILDCD-PC3NrKFk2x31IOeRObYWa4bfNvpwT_1mKeFiqte2CkBYcQm3gLptk3iv4HdS1-9FKa3Kpmag3MoVCbtHiZeWvjSiLOBstXjxeiEZBRv0ZPcFy8KXVucCYXtOjotb80bL/s800/109.png', 11.57, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(163, 'escritorio-131', 'Artículos de Escritorio', 'Lapicero de metal 7230', '11 x 8 cm', 'Espuma de poliuretano | Incluye casco', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEiSmJLJdk6ZUxjtrIhMcXkOLVZ1t5lAVy8AfMCA_aAlbjrBUOv3W-v0eu1nWSYo3cRu2e1qClvmuVY5aVis02izaN00iIS_aF-u0mUQ9ttnFRvRbwYCj-_qXtNPYtbguS3z5pE07e4xT-W07pVjFHFaObpddB8bxwoxYRZ4mpgyTq8en3UaboEPKlEF2O77/s800/112.png', 11.57, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(164, 'escritorio-132', 'Artículos de Escritorio', 'Lapicero de metal 7230', '10 x 7.5 cm', 'Espuma de goma suave | Con uniforme', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhjpDdcZTBbG6ukGw_eBVbrEzTzIY0JtT_RNVvA_ssCopZxhhwR7xnpVC3ryPSjh2QHQrsWdDgmdxtqAZ08u_GHjCxFs_yc2-JsFkIz6gfssFVKoJewklG1KcoRjnYA6g4P6n71WoJcZZA16g-gMJ_i6xdp_rT0cfW7vL_PCgGJspDYvqQlGNtmFLvjWN2F/s800/115.png', 11.57, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(165, 'escritorio-133', 'Artículos de Escritorio', 'Lapicero fibra de trigo', '10.5 x 7 cm', 'Espuma de goma', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjpJ3FM51JO67ZkKB9Qz6spOdVEzcAYwfYyGRsTlEqUUqbJrjvdbnqDDKoyShYu6zeClpZH9r_wyQaCvMt516fw1zy1jbNq76nWYVvjp3aVMXc1Y1vnQhhtTXymuDDXooBFvBTOsPSduWl9vtHRXDPWBYjFJNIAKZUsufPAlB-BX-Jh0ypDlgcTjNkbkv13/s800/116.png', 5.76, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(166, 'escritorio-134', 'Artículos de Escritorio', 'Lapicero fibra de trigo', '11 x 8 cm', 'Espuma de poliuretano | Incluye casco', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhy6ePCbpCPQYs9vOpjxpVq9XOwtV4JOhrZT77Q8lfVIik0W4l7jRV05Ce7vtV8A8HXvA-pIAQqOO0PuOZU7xwKDgjdE08oazRHHrGA6hTHERfHap6li0Lxq2nIWxzq2IlFJRrFcQlWSGVG6LXDu0vBtPT0a0fIvwHAb6CHAGfY_SE_QgGdPVaZXlSMv6UN/s800/118.png', 5.76, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(167, 'escritorio-135', 'Artículos de Escritorio', 'Lapicero bambú', '10.5 x 7 cm', 'Espuma de goma', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhhtKn2adomRV-9Z_E-18RPaLbXD0i8s9rL2STvPV8nlpQdVK9gl1x-G5fIHmSPLDDXcOkK3_pgjtnqJhu6M7Cd9_E3gc_rxicVvSUJC4R98c92LeMs15syWMjpzs7GK7wKtVwPqd3glD4GEUDsPdeH6qTbkdF_oJRr1R88Lo1bYaCEuHWUtayhyphenhyphenmjbJerp/s800/117.png', 15.62, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(168, 'escritorio-136', 'Artículos de Escritorio', 'Lapicero bambú', '11 x 8 cm', 'Espuma de poliuretano | Incluye casco', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjc-kHpN3vtQQW82kIaRHVa_P5qeHwFX4aYrcBYHa4nRFQZLVe8nqTq0wqGbNOfokWquYQ9sEAT6c8ItS3C6yRovST-7zrbMjf2wJorDOeVdc8UQ6o6-b5S_Ug3UseBgcN04OuSExsefVj4Es1b7DzNeN5pI8XiPq-pCwiI5Hks97bUANPgpHihxz3C-efC/s800/119.png', 15.62, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(169, 'escritorio-137', 'Artículos de Escritorio', 'Muñeco Antiestrés - Modelo Deportista', '10 x 7.5 cm', 'Espuma de goma suave | Con uniforme', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhhtKn2adomRV-9Z_E-18RPaLbXD0i8s9rL2STvPV8nlpQdVK9gl1x-G5fIHmSPLDDXcOkK3_pgjtnqJhu6M7Cd9_E3gc_rxicVvSUJC4R98c92LeMs15syWMjpzs7GK7wKtVwPqd3glD4GEUDsPdeH6qTbkdF_oJRr1R88Lo1bYaCEuHWUtayhyphenhyphenmjbJerp/s800/117.png', 8.48, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(170, 'escritorio-138', 'Artículos de Escritorio', 'Lapicero ecológico', '10.5 x 7 cm', 'Espuma de goma', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEi-7AMhQ0UW5F2e2zfLP8QruO9f07ZFwuLcwXVHoV1jdWWUntm2CijcGl7B1c7Knp0A3rbo348UBylBDjJ9sDd_9OaEqC8PTuNoBS3JNACeng1IBtSPlyAVq7KolQOm5tmrd3LmZeqBJfFWOmPTZFCSMs2ccExe1ER3gY6EMIatb5yB_9c6m-jj1ydchWmO/s800/120.png', 11.45, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(171, 'escritorio-139', 'Artículos de Escritorio', 'Lapicero ecológico', '11 x 8 cm', 'Espuma de poliuretano | Incluye casco', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhe_eab8204SdTAfN9H17AGievzJ8Pum90KVGgbsY0EjNk9RZ6JtqBIGLwjrZF5yRKBPO-bdV-OJz8vj3teMBx-aaGFGfxHMav07BhNDy5rvIJRSQWyIM-XXrCJWkSvDXIE1PM1_uQGcpQP1GUPj5Wp0I_cA69R66GXRB9mCtph0Xmu4xIeAoQVLP0uRygA/s800/121.png', 11.45, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(172, 'escritorio-140', 'Artículos de Escritorio', 'Muñeco Antiestrés - Modelo Deportista', '10 x 7.5 cm', 'Espuma de goma suave | Con uniforme', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEi-7AMhQ0UW5F2e2zfLP8QruO9f07ZFwuLcwXVHoV1jdWWUntm2CijcGl7B1c7Knp0A3rbo348UBylBDjJ9sDd_9OaEqC8PTuNoBS3JNACeng1IBtSPlyAVq7KolQOm5tmrd3LmZeqBJfFWOmPTZFCSMs2ccExe1ER3gY6EMIatb5yB_9c6m-jj1ydchWmO/s800/120.png', 8.48, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(173, 'escritorio-141', 'Artículos de Escritorio', 'Lapicero plástico', '10.5 x 7 cm', 'Espuma de goma', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhRSHM9h4OaQawRHk42JiIhqm3DMc7MyKDW-ndg28g6433PN92Tb24sB6dLZmZOCbPAD1EsWpIMihilKiuPSRjLQwzqqctD_fIg9utZ6QpkPmrvcNrjsLChajKJkwkUkgcBnfsqnwij91iCTbHdRwBansQF9TIrg5g8oqEIl70CTyeGFqbKRazIBifqcjYW/s800/106.png', 6.46, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(174, 'escritorio-142', 'Artículos de Escritorio', 'Lapicero plástico', '11 x 8 cm', 'Espuma de poliuretano | Incluye casco', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhJEctFuq_t2MMzXd79TTgeNk_MTO_m6SYIHAieH2h8NSUAnFConnviN8Z379ViFSwcfjlJ44lCPv4c_InrauVkitVg2Fn_TXNLl5K_GawkCQjz4g7f3b3e4CdKJZoMxvNyAwoFZrURyI-dvgxYKLZwdCzwi1lfMw0PjBwjWdfQeUwokvPYtJLwSSHUaDnG/s800/105.png', 6.46, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(175, 'escritorio-143', 'Artículos de Escritorio', 'Lapicero plástico', '10 x 7.5 cm', 'Espuma de goma suave | Con uniforme', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEijTbMY9ZQJ12YaGK5U8oX-tMWxOBDbDpEyKFI3WeTEq9GD8C6gU_V8u3DN7W3upPgxtkdUx8RMbaNaiINkrs5JY7t5AeQzPYVJxB7UlOQNOkMghSB2coWnp2ysQk5A73Yme9EMf97yNRPqfgJdOao1mfANAJtlYfjn_idMayXiclYustbe3PofofzkcjIP/s800/103.png', 6.46, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(176, 'escritorio-144', 'Artículos de Escritorio', 'Lapicero plástico', '10.5 x 7 cm', 'Espuma de goma', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEg_wisRHooSQvAKeu5DaYIv-sDZGgvqAyjOInw95FMT1nyxcmjjpvYVnzkIQPW-yE5JoS8-IFnjRy4IXl9dSBgileW4BcmNJKE_k_DSMdmaGdDRwLtF-JxN86yyG_wXN5hJTZKT_YyzhqxBICovM10IJvW10yiFRhfb_Hmxe45UjRfHw8G1462yOp7U-V3_/s800/100.png', 6.46, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(177, 'escritorio-145', 'Artículos de Escritorio', 'Lapicero plástico', '11 x 8 cm', 'Espuma de poliuretano | Incluye casco', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgNoUvDnI4NB3cGHzWUzsGmGuLcF0kN9wIbflRC6dUUOGL85ptvFlt9Og16XyIurPc_079BNh0-W4GiIkD-TYcNh1mci4sfpnWmcffbBaDwQcLiDLinq4DvZmhuerXC4dZSh2G6fEXOga2K6f5OOKTLQq7BaQhCCFYECnDuPEWb_iTwISy8pT11N9WFxnF3/s800/99.png', 6.46, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(178, 'escritorio-146', 'Artículos de Escritorio', 'Lapicero plástico', '10 x 7.5 cm', 'Espuma de goma suave | Con uniforme', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjGKEpubPSdcedJ_5_kYIUQR2FOR7PNJNwloTby6_RT1J4d_FESx8xF1W78t9pWGboZTsFj2ZG51UzAT2Sq2hR9ZvhoGX1eEOCAx0Eg0UKjPvyT3fNcdNjnPyGrvSGG1HUxtIFPhj6yF1PeUJMwGKeqbXK-KDKgY7NKD5gBrjBpt3_WVN-ZhVBgs1rpxRkA/s800/94.png', 6.46, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(179, 'tomatodos-001', 'Tomatodos y Tazas', 'Tomatodo Metálico', '10.5 x 7 cm', 'Espuma de goma', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhxRDc9QXFfmNLvJ9xEZvudBwZBIKLBnHYAbRqS_T9LQqesiSMT9GHje9cH7F8shLyQx9K2vFrrG4Ab9i91TGXCa0OL36QCJJPty7C_mjTQ9VAb2wiLJzm6bTT1sRak_950sMcGPX-MIiFddbqCxri6vrtX2pXCN3l6cqYCj-OK8IxoNi85nUU3ik0T6g8X/s800/122.png', 16.51, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(180, 'tomatodos-002', 'Tomatodos y Tazas', 'Muñeco Antiestrés - Modelo Minero', '11 x 8 cm', 'Espuma de poliuretano | Incluye casco', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEj-OlE5XjwJamdLA39yhNeFF6D5SE9Q6a-G1VtmLYCFEaO8H4Bq9tfoU7XrUNd6WYvktmfNp2clxzHPCI-D4Gt1g7wJk717WjgFP77qIFfHht7rxR_phceKY56svbr0Mjdsgjr004_oTOCiUqv41EuMdZuFO4mxu-1SkaRklIaB20FeahR0cXFvpYGtQoaM/s800/128.png', 19.76, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(181, 'tomatodos-003', 'Tomatodos y Tazas', 'Muñeco Antiestrés - Modelo Deportista', '10 x 7.5 cm', 'Espuma de goma suave | Con uniforme', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhxRDc9QXFfmNLvJ9xEZvudBwZBIKLBnHYAbRqS_T9LQqesiSMT9GHje9cH7F8shLyQx9K2vFrrG4Ab9i91TGXCa0OL36QCJJPty7C_mjTQ9VAb2wiLJzm6bTT1sRak_950sMcGPX-MIiFddbqCxri6vrtX2pXCN3l6cqYCj-OK8IxoNi85nUU3ik0T6g8X/s800/122.png', 20.85, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(182, 'tomatodos-004', 'Tomatodos y Tazas', 'Tomatodo de acero inoxidable Modelo 1', '10.5 x 7 cm', 'Espuma de goma', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhakwxq_v3bOcac6hQGjQ-08oNHuUgvTYegQsLa0Xbf7-Te8xyN4X69WgSbm8T3zpm6oqvqm4kPtmmhGXAJXJntOhjQiQhMsKoSA3WZpMJ13z3TpO3IVi-fZsulUXQ5aab2nVNbZIfsK1Sy74v8I2IyCXAulUb4t63nRCgu8uxUviRHhLg38nVZBN5d5Fdu/s800/123.png', 25.22, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(183, 'tomatodos-005', 'Tomatodos y Tazas', 'Tomatodo de acero inoxidable Modelo 2', '11 x 8 cm', 'Espuma de poliuretano | Incluye casco', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgCKgJ_brxSXu0-5KxpkK-BTzqJzPxHBFHmVMsAN207lj8mI5oYbjPbnU4h1vGQIoIPcwWQLKRTEu7m4jGQZQq6bBJSep29ZJHQ-2j9h6N_vbOUcBaPGOKB8YFPm4X0gdn98gGeQh7Q1_Eepm7-lxWvrSVUhrpgQ3y2U8pxw7mLLDJLdoajb6P6sNEU-emG/s800/125.png', 18.02, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(184, 'tomatodos-006', 'Tomatodos y Tazas', 'Tomatodo de acero inoxidable Modelo 3', '10 x 7.5 cm', 'Espuma de goma suave | Con uniforme', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgbtwJQxVuxZV8xZceCUylvq8NE8pMoREtwt0MQyvlyXIdnSoVVyXF6v7zthf_A40L8mkeGb07K_UUDgt3-Wp9e2kbZ_hWTU7OnMTlelsrokMo1fB65xLt8jfiZZPh7bQIcVO6An7LvDrZle0qS6YXObP6O79CBW_eIK0fra84lCb1pHQmyHUlxD2dZBToM/s800/126.png', 15.15, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(185, 'tomatodos-007', 'Tomatodos y Tazas', 'Termo metálico', '10.5 x 7 cm', 'Espuma de goma', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhPlymCno_onLxRMuDNorPQJvBROWBoL3Ysu10lUNWl0SbbwpqHu5vEh9zSOoisHmLvXgKtiz9DO6GGKlye9LqCYqmt-QmR117h59_uarrD4fDhXFAFiCBW7xDD_JMJOFKBdGyKC34Jp61d3T53nbb1c8kEpiUZcKLUvCs1A7p95pdI5JsB7JbillHxsJTo/s800/124.png', 18.42, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(186, 'tomatodos-008', 'Tomatodos y Tazas', 'Corazon Amtiestres', '10.5 x 7 cm', 'Espuma de goma', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhPlymCno_onLxRMuDNorPQJvBROWBoL3Ysu10lUNWl0SbbwpqHu5vEh9zSOoisHmLvXgKtiz9DO6GGKlye9LqCYqmt-QmR117h59_uarrD4fDhXFAFiCBW7xDD_JMJOFKBdGyKC34Jp61d3T53nbb1c8kEpiUZcKLUvCs1A7p95pdI5JsB7JbillHxsJTo/s800/124.png', 10.73, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(187, 'tomatodos-009', 'Tomatodos y Tazas', 'Botella aluminio', '10.5 x 7 cm', 'Espuma de goma', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEiu3W0gLF_DNIGO1UnuUrDGjU5HYGXIbcMy_4Shc4EWFicK8ty5plEeguAU_-EZhXpP3xu_qHPYOPUo1zWMI1Hql3U5dxCMp-NGg2dKPLjWxI2RnT3iI4fmg1mTEzv-JEVSiazFGxePsRU8GNgzwgXYNk1uoa87k_8XY4T6WnLItPH4btgb0Q7I0nBxC6y5/s800/127.png', 16.32, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(188, 'tomatodos-010', 'Tomatodos y Tazas', 'Dado antiestres', '11 x 8 cm', 'Espuma de poliuretano | Incluye casco', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEiu3W0gLF_DNIGO1UnuUrDGjU5HYGXIbcMy_4Shc4EWFicK8ty5plEeguAU_-EZhXpP3xu_qHPYOPUo1zWMI1Hql3U5dxCMp-NGg2dKPLjWxI2RnT3iI4fmg1mTEzv-JEVSiazFGxePsRU8GNgzwgXYNk1uoa87k_8XY4T6WnLItPH4btgb0Q7I0nBxC6y5/s800/127.png', 21.50, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(189, 'tomatodos-011', 'Tomatodos y Tazas', 'Dado antiestres', '10 x 7.5 cm', 'Espuma de goma suave | Con uniforme', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEiu3W0gLF_DNIGO1UnuUrDGjU5HYGXIbcMy_4Shc4EWFicK8ty5plEeguAU_-EZhXpP3xu_qHPYOPUo1zWMI1Hql3U5dxCMp-NGg2dKPLjWxI2RnT3iI4fmg1mTEzv-JEVSiazFGxePsRU8GNgzwgXYNk1uoa87k_8XY4T6WnLItPH4btgb0Q7I0nBxC6y5/s800/127.png', 21.50, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(190, 'tomatodos-012', 'Tomatodos y Tazas', 'Tomatodo plástico pavonado', '10.5 x 7 cm', 'Espuma de goma', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjsggfEU0Zl4q5FeFvNqpptzGyWLEX6FM6z0LvVGln-_YswUvdh-3OgNnzsstQY3XpZ1je0N7Xdqf1bCW_oav9lxWoRtRDifTrh3diIcMCJGA44mOWyZluSvhLjapf39QJrwZ27veroxJQhCWDa61bt-CCAXaX_Ka87NSDfl0W2f8Nj_SHnx56bXYF5KXQP/s800/130.png', 16.52, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(191, 'tomatodos-013', 'Tomatodos y Tazas', 'Muñeco Antiestrés - Modelo Minero', '11 x 8 cm', 'Espuma de poliuretano | Incluye casco', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjsggfEU0Zl4q5FeFvNqpptzGyWLEX6FM6z0LvVGln-_YswUvdh-3OgNnzsstQY3XpZ1je0N7Xdqf1bCW_oav9lxWoRtRDifTrh3diIcMCJGA44mOWyZluSvhLjapf39QJrwZ27veroxJQhCWDa61bt-CCAXaX_Ka87NSDfl0W2f8Nj_SHnx56bXYF5KXQP/s800/130.png', 19.76, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(192, 'tomatodos-014', 'Tomatodos y Tazas', 'Muñeco Antiestrés - Modelo Deportista', '10 x 7.5 cm', 'Espuma de goma suave | Con uniforme', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjsggfEU0Zl4q5FeFvNqpptzGyWLEX6FM6z0LvVGln-_YswUvdh-3OgNnzsstQY3XpZ1je0N7Xdqf1bCW_oav9lxWoRtRDifTrh3diIcMCJGA44mOWyZluSvhLjapf39QJrwZ27veroxJQhCWDa61bt-CCAXaX_Ka87NSDfl0W2f8Nj_SHnx56bXYF5KXQP/s800/130.png', 20.85, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(193, 'tomatodos-015', 'Tomatodos y Tazas', 'Mug fibra de trigo', '10.5 x 7 cm', 'Espuma de goma', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEj9ngzs9Ga9pTjYJm8ZwWFnX2WopzuqIj3j6foNEBy2vQQURu8gwW-qLjJ0310Cupm64e4dze7jDqTl6CRxzIk5F6L6pHTDDppplf3eh6a_7UGXdcMBCMvtpsdu5Bcu0-wqV9o-equH_JOnBLY4pdWcDa7E5b_ZGDkjsfx1dfsjkoiPWxHIuAAjLSBCO4IA/s800/131.png', 20.38, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(194, 'tomatodos-016', 'Tomatodos y Tazas', 'Muñeco Antiestrés - Modelo Minero', '11 x 8 cm', 'Espuma de poliuretano | Incluye casco', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEj9ngzs9Ga9pTjYJm8ZwWFnX2WopzuqIj3j6foNEBy2vQQURu8gwW-qLjJ0310Cupm64e4dze7jDqTl6CRxzIk5F6L6pHTDDppplf3eh6a_7UGXdcMBCMvtpsdu5Bcu0-wqV9o-equH_JOnBLY4pdWcDa7E5b_ZGDkjsfx1dfsjkoiPWxHIuAAjLSBCO4IA/s800/131.png', 19.76, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(195, 'tomatodos-017', 'Tomatodos y Tazas', 'Muñeco Antiestrés - Modelo Deportista', '10 x 7.5 cm', 'Espuma de goma suave | Con uniforme', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEj9ngzs9Ga9pTjYJm8ZwWFnX2WopzuqIj3j6foNEBy2vQQURu8gwW-qLjJ0310Cupm64e4dze7jDqTl6CRxzIk5F6L6pHTDDppplf3eh6a_7UGXdcMBCMvtpsdu5Bcu0-wqV9o-equH_JOnBLY4pdWcDa7E5b_ZGDkjsfx1dfsjkoiPWxHIuAAjLSBCO4IA/s800/131.png', 20.85, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(196, 'tomatodos-018', 'Tomatodos y Tazas', 'Tomatodo fibra de trigo', '10.5 x 7 cm', 'Espuma de goma', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjRJm88p_3khE3m-hZuTY6Yez7njBSs2AhmxmWz7lAOKP4qDaZy2QE_oxvWWaC6Z5Un797GvMU8OYyZPKsJwpqarzLvMR7Jax5oXMkh-kmxkpRGThwIKtOn44IVPgxAXZvASBQTKBzsXSOYrBNyZZp1cZnHIeNIwAblPvjS-GiqpL1dRjZjrr-1oU5tszcP/s800/132.png', 12.26, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(197, 'tomatodos-019', 'Tomatodos y Tazas', 'Muñeco Antiestrés - Modelo Minero', '11 x 8 cm', 'Espuma de poliuretano | Incluye casco', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjRJm88p_3khE3m-hZuTY6Yez7njBSs2AhmxmWz7lAOKP4qDaZy2QE_oxvWWaC6Z5Un797GvMU8OYyZPKsJwpqarzLvMR7Jax5oXMkh-kmxkpRGThwIKtOn44IVPgxAXZvASBQTKBzsXSOYrBNyZZp1cZnHIeNIwAblPvjS-GiqpL1dRjZjrr-1oU5tszcP/s800/132.png', 19.76, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(198, 'tomatodos-020', 'Tomatodos y Tazas', 'Muñeco Antiestrés - Modelo Deportista', '10 x 7.5 cm', 'Espuma de goma suave | Con uniforme', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjRJm88p_3khE3m-hZuTY6Yez7njBSs2AhmxmWz7lAOKP4qDaZy2QE_oxvWWaC6Z5Un797GvMU8OYyZPKsJwpqarzLvMR7Jax5oXMkh-kmxkpRGThwIKtOn44IVPgxAXZvASBQTKBzsXSOYrBNyZZp1cZnHIeNIwAblPvjS-GiqpL1dRjZjrr-1oU5tszcP/s800/132.png', 20.85, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(199, 'tomatodos-021', 'Tomatodos y Tazas', 'Jarro fibra de trigo', '10.5 x 7 cm', 'Espuma de goma', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjbjrFow35SD1WhwfrUZLE1qwb5D2SRi_zwkuTXDFkbehlZmo3MDmjRBCi09DSl4U6J6SyWJimWKBpVDMYxORew1BD8QTnauW3cNukozBeYIvmq8UwO4mJ133E8yLAnnPYgZoz-uwcbq4KGzruZWyNAMYhFr1NbvfgCE-2vsS6dv-MWb3V3YyyFP69XDcrq/s800/133.png', 18.66, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(200, 'tomatodos-022', 'Tomatodos y Tazas', 'Muñeco Antiestrés - Modelo Minero', '11 x 8 cm', 'Espuma de poliuretano | Incluye casco', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjbjrFow35SD1WhwfrUZLE1qwb5D2SRi_zwkuTXDFkbehlZmo3MDmjRBCi09DSl4U6J6SyWJimWKBpVDMYxORew1BD8QTnauW3cNukozBeYIvmq8UwO4mJ133E8yLAnnPYgZoz-uwcbq4KGzruZWyNAMYhFr1NbvfgCE-2vsS6dv-MWb3V3YyyFP69XDcrq/s800/133.png', 19.76, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(201, 'tomatodos-023', 'Tomatodos y Tazas', 'Muñeco Antiestrés - Modelo Deportista', '10 x 7.5 cm', 'Espuma de goma suave | Con uniforme', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjbjrFow35SD1WhwfrUZLE1qwb5D2SRi_zwkuTXDFkbehlZmo3MDmjRBCi09DSl4U6J6SyWJimWKBpVDMYxORew1BD8QTnauW3cNukozBeYIvmq8UwO4mJ133E8yLAnnPYgZoz-uwcbq4KGzruZWyNAMYhFr1NbvfgCE-2vsS6dv-MWb3V3YyyFP69XDcrq/s800/133.png', 20.85, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(202, 'tomatodos-024', 'Tomatodos y Tazas', 'Tomatodo plástico', '10.5 x 7 cm', 'Espuma de goma', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhk_9w-CUKeLS6sujWxXgyFVsedm_A-VgOFc6T4g67OLoKiPwDm9OOwV2UbzV8KXUsY1-Lyn-2KdTqZ5YtcqvUiLUD7QrqBIeSSersbzcy2_vDP3LNmr0tef-MLQG-WW085FGZgK7yWKopS2jmuyYE2dll4-uZy7g1SIFGTBQB09AE4OB__YA6cPL1XNJLm/s800/134.png', 24.94, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(203, 'tomatodos-025', 'Tomatodos y Tazas', 'Muñeco Antiestrés - Modelo Minero', '11 x 8 cm', 'Espuma de poliuretano | Incluye casco', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhk_9w-CUKeLS6sujWxXgyFVsedm_A-VgOFc6T4g67OLoKiPwDm9OOwV2UbzV8KXUsY1-Lyn-2KdTqZ5YtcqvUiLUD7QrqBIeSSersbzcy2_vDP3LNmr0tef-MLQG-WW085FGZgK7yWKopS2jmuyYE2dll4-uZy7g1SIFGTBQB09AE4OB__YA6cPL1XNJLm/s800/134.png', 19.76, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(204, 'tomatodos-026', 'Tomatodos y Tazas', 'Muñeco Antiestrés - Modelo Deportista', '10 x 7.5 cm', 'Espuma de goma suave | Con uniforme', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhk_9w-CUKeLS6sujWxXgyFVsedm_A-VgOFc6T4g67OLoKiPwDm9OOwV2UbzV8KXUsY1-Lyn-2KdTqZ5YtcqvUiLUD7QrqBIeSSersbzcy2_vDP3LNmr0tef-MLQG-WW085FGZgK7yWKopS2jmuyYE2dll4-uZy7g1SIFGTBQB09AE4OB__YA6cPL1XNJLm/s800/134.png', 20.85, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(205, 'tomatodos-027', 'Tomatodos y Tazas', 'Tomatodo económico', '10.5 x 7 cm', 'Espuma de goma', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjHXQZViXKFfOlsdizApYs0zf65KajWv6fMQ1wNIHTxYx1Rh6UHjq3aWokJSWyDKLnApDrTxYU5WIbk7IJHXwpbmCd-dSmopPcmbMsoPSDGzYjAgxI2mjYQfes2yEJ54LMABwlOgcOXYCV-4GPImopfw0GXLS0nxju-87QkGRyhjDK0EZjt6-jMnE8D_gAc/s800/136.png', 11.19, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(206, 'tomatodos-028', 'Tomatodos y Tazas', 'Muñeco Antiestrés - Modelo Minero', '11 x 8 cm', 'Espuma de poliuretano | Incluye casco', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjHXQZViXKFfOlsdizApYs0zf65KajWv6fMQ1wNIHTxYx1Rh6UHjq3aWokJSWyDKLnApDrTxYU5WIbk7IJHXwpbmCd-dSmopPcmbMsoPSDGzYjAgxI2mjYQfes2yEJ54LMABwlOgcOXYCV-4GPImopfw0GXLS0nxju-87QkGRyhjDK0EZjt6-jMnE8D_gAc/s800/136.png', 19.76, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44');
INSERT INTO `productos_tb_baycodec` (`id`, `codigo`, `categoria`, `nombre`, `medidas`, `material`, `colores`, `imagen_url`, `precio_referencial_pen`, `stock`, `activo`, `vendedor_id`, `creado_en`, `actualizado_en`) VALUES
(207, 'tomatodos-029', 'Tomatodos y Tazas', 'Muñeco Antiestrés - Modelo Deportista', '10 x 7.5 cm', 'Espuma de goma suave | Con uniforme', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjHXQZViXKFfOlsdizApYs0zf65KajWv6fMQ1wNIHTxYx1Rh6UHjq3aWokJSWyDKLnApDrTxYU5WIbk7IJHXwpbmCd-dSmopPcmbMsoPSDGzYjAgxI2mjYQfes2yEJ54LMABwlOgcOXYCV-4GPImopfw0GXLS0nxju-87QkGRyhjDK0EZjt6-jMnE8D_gAc/s800/136.png', 20.85, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(208, 'tomatodos-030', 'Tomatodos y Tazas', 'Mug térmico', '10.5 x 7 cm', 'Espuma de goma', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgItAHmkJR9I1NZ71dlkxitr_0FCCE16J4qaoZ3Up4e7LfpW5I4TY8uRptqzr8TlW2GuljjH6CMromrm8NNHMDLO8bttnBCGgyCFwdqZEGhhWogZ02Q5Wp2QogmulTs0uBuR5XLVfi0XpiHw9EMJKf2TaRRbAW7irQtMWxPTg6f4dxJPEFLl1i8NuCrQzmL/s800/138.png', 13.50, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(209, 'tomatodos-031', 'Tomatodos y Tazas', 'Muñeco Antiestrés - Modelo Minero', '11 x 8 cm', 'Espuma de poliuretano | Incluye casco', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgItAHmkJR9I1NZ71dlkxitr_0FCCE16J4qaoZ3Up4e7LfpW5I4TY8uRptqzr8TlW2GuljjH6CMromrm8NNHMDLO8bttnBCGgyCFwdqZEGhhWogZ02Q5Wp2QogmulTs0uBuR5XLVfi0XpiHw9EMJKf2TaRRbAW7irQtMWxPTg6f4dxJPEFLl1i8NuCrQzmL/s800/138.png', 19.76, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(210, 'tomatodos-032', 'Tomatodos y Tazas', 'Muñeco Antiestrés - Modelo Deportista', '10 x 7.5 cm', 'Espuma de goma suave | Con uniforme', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgItAHmkJR9I1NZ71dlkxitr_0FCCE16J4qaoZ3Up4e7LfpW5I4TY8uRptqzr8TlW2GuljjH6CMromrm8NNHMDLO8bttnBCGgyCFwdqZEGhhWogZ02Q5Wp2QogmulTs0uBuR5XLVfi0XpiHw9EMJKf2TaRRbAW7irQtMWxPTg6f4dxJPEFLl1i8NuCrQzmL/s800/138.png', 20.85, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(211, 'tomatodos-033', 'Tomatodos y Tazas', 'Jarro mug', '10.5 x 7 cm', 'Espuma de goma', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgJlxiE1PVkwhRa8Hg8PYRudtHcMc-SOdSE1BnzqDZkQTNdYka8UP3J3E2-9i8MokAJsGJnKsQnI7n2KeGre8VxLRoxxlcS35QyHI3wTrbaed2iGaHf-5BfXlgN05gNrpm6-PJMwGXYY43BSSXDE8FfM79NfYac0QEllFHOPrPjefRD3dyA5vyyhyphenhyphenh9_7Ay/s800/139.png', 11.36, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(212, 'tomatodos-034', 'Tomatodos y Tazas', 'Muñeco Antiestrés - Modelo Minero', '11 x 8 cm', 'Espuma de poliuretano | Incluye casco', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgJlxiE1PVkwhRa8Hg8PYRudtHcMc-SOdSE1BnzqDZkQTNdYka8UP3J3E2-9i8MokAJsGJnKsQnI7n2KeGre8VxLRoxxlcS35QyHI3wTrbaed2iGaHf-5BfXlgN05gNrpm6-PJMwGXYY43BSSXDE8FfM79NfYac0QEllFHOPrPjefRD3dyA5vyyhyphenhyphenh9_7Ay/s800/139.png', 19.76, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(213, 'tomatodos-035', 'Tomatodos y Tazas', 'Muñeco Antiestrés - Modelo Deportista', '10 x 7.5 cm', 'Espuma de goma suave | Con uniforme', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgJlxiE1PVkwhRa8Hg8PYRudtHcMc-SOdSE1BnzqDZkQTNdYka8UP3J3E2-9i8MokAJsGJnKsQnI7n2KeGre8VxLRoxxlcS35QyHI3wTrbaed2iGaHf-5BfXlgN05gNrpm6-PJMwGXYY43BSSXDE8FfM79NfYac0QEllFHOPrPjefRD3dyA5vyyhyphenhyphenh9_7Ay/s800/139.png', 20.85, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(214, 'llaveros-001', 'Llaveros', 'Llavero casco minero destapador', '10.5 x 7 cm', 'Espuma de goma', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEiyCHtFshDpJOFQTc7LYxhVxIvaIVPLZ3P9-MojXLa98fZsDqz6lM_i_EGJM05GpFkjL-Kst1YHEqNpAlIxGw-GG4ZoQbmo29cvrAEUhNnPlEAuy3IZ718v8l0c7DuoznWsmhIdvuKDgO7t6blOg00ODsh0btf5qA989Wzk8IE6zyEi7EahcUkLjzSDxHkn/s800/41.png', 5.95, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(215, 'llaveros-002', 'Llaveros', 'Muñeco Antiestrés - Modelo Minero', '11 x 8 cm', 'Espuma de poliuretano | Incluye casco', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEiyCHtFshDpJOFQTc7LYxhVxIvaIVPLZ3P9-MojXLa98fZsDqz6lM_i_EGJM05GpFkjL-Kst1YHEqNpAlIxGw-GG4ZoQbmo29cvrAEUhNnPlEAuy3IZ718v8l0c7DuoznWsmhIdvuKDgO7t6blOg00ODsh0btf5qA989Wzk8IE6zyEi7EahcUkLjzSDxHkn/s800/41.png', 5.87, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(216, 'llaveros-003', 'Llaveros', 'Llavero casco minero destapador', '10 x 7.5 cm', 'Espuma de goma suave | Con uniforme', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEiyCHtFshDpJOFQTc7LYxhVxIvaIVPLZ3P9-MojXLa98fZsDqz6lM_i_EGJM05GpFkjL-Kst1YHEqNpAlIxGw-GG4ZoQbmo29cvrAEUhNnPlEAuy3IZ718v8l0c7DuoznWsmhIdvuKDgO7t6blOg00ODsh0btf5qA989Wzk8IE6zyEi7EahcUkLjzSDxHkn/s800/41.png', 5.95, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(217, 'llaveros-004', 'Llaveros', 'Casco minero con linterna y destapador', '10.5 x 7 cm', 'Espuma de goma', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEixc9D2e3JlzGk69YEpxLkR523TV9oivUUBRdhUtu3d_W5cHQ5pEs9Lt4X3biENnhkEMqVQsgVCPITF8ZWgzbUL82l-vpN3bjHkZ_jmgGezWRpuV8_NvmxXUj3OCekDq2AU3SNy4ihMfKkf0O5fw4TezMazQ5DIdwdz5hXjdulQ5JD3asGYLitwSlCDcEIt/s800/42.png', 8.73, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(218, 'llaveros-005', 'Llaveros', 'Llavero destapador pines', '10.5 x 7 cm', 'Espuma de goma', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgsCbxsCZ-gx54Z5igcwpGw_B8LhTgsbKhbjk1sHGbM1NsK8BJk-rnBBRR2R6IJspwJ7eT8YBaggDluuGpfOb85CVzkXb_p56KLqw-BWLSxHs16G8qiOM4lNVdPM2OYUss7CF9hR1yZqzl_N9QOeSwUMFh5iZRKw2GVJaqfkbM_jt3aZ2RN8aGxMIx3iLrF/s800/43.png', 5.00, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(219, 'llaveros-006', 'Llaveros', 'Corazon Amtiestres', '10.5 x 7 cm', 'Espuma de goma', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgsCbxsCZ-gx54Z5igcwpGw_B8LhTgsbKhbjk1sHGbM1NsK8BJk-rnBBRR2R6IJspwJ7eT8YBaggDluuGpfOb85CVzkXb_p56KLqw-BWLSxHs16G8qiOM4lNVdPM2OYUss7CF9hR1yZqzl_N9QOeSwUMFh5iZRKw2GVJaqfkbM_jt3aZ2RN8aGxMIx3iLrF/s800/43.png', 3.52, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(220, 'llaveros-007', 'Llaveros', 'Llavero circular de madera', '10.5 x 7 cm', 'Espuma de goma', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgu31kf6kYk1Izj9_MilGjQmyw9wEZWX_nZHbev5yulPhAQAS_LR2LXEfSu2Si4J0f22r8YNFXUzmAVgabvPLYCwj77etXCe2qv7EHl_wbVVdKutafY7D-yH3p9EY5DyIdUzD_QF63jdMGKRvwYB7SC4IvNmSU2AEm5_J2RPK-_uVXvQ615XuctCXIlRGNy/s800/44.png', 8.70, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(221, 'llaveros-008', 'Llaveros', 'Llavero circular de madera', '11 x 8 cm', 'Espuma de poliuretano | Incluye casco', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEilkTai4a3Xax0O4PjPdxS1stJC_EUqo4ichxirou1bQJ-AGV6uC5jk86vGPL_BWp6puq2vMF_nAqsb6rpCcsY3KHPaA3mOTv-sxVzcuqSiLxYzN4cOu-gvtfMeiTClUN6vbXgPHo-A5qZ6DOXTB_WYsi821wlW31x-LDWNtDEcUfm-R0jT2dF8VsHLD91K/s800/51.png', 8.70, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(222, 'llaveros-009', 'Llaveros', 'Dado antiestres', '10 x 7.5 cm', 'Espuma de goma suave | Con uniforme', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgu31kf6kYk1Izj9_MilGjQmyw9wEZWX_nZHbev5yulPhAQAS_LR2LXEfSu2Si4J0f22r8YNFXUzmAVgabvPLYCwj77etXCe2qv7EHl_wbVVdKutafY7D-yH3p9EY5DyIdUzD_QF63jdMGKRvwYB7SC4IvNmSU2AEm5_J2RPK-_uVXvQ615XuctCXIlRGNy/s800/44.png', 6.44, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(223, 'llaveros-010', 'Llaveros', 'Llavero Metálico', '10.5 x 7 cm', 'Espuma de goma', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgBk9H_iZSKVF1h9QHcaVGHLzv42UofK1X2PkTs_HxwfwUIHvsJreLgIza0JZZrZ1ciAJox3i6Nbz88VTVXTPhMCWXLgjw92HtrOtP-H0C_ZPqv6y0G23QwDmthyMzh9xSMKBXZrLQVTiHuVpE_DzCw6EP9dcF-a3hljoxJljJJGUK73aDLvwZNeDLgT81q/s800/45.png', 4.98, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(224, 'llaveros-011', 'Llaveros', 'Muñeco Antiestrés - Modelo Minero', '11 x 8 cm', 'Espuma de poliuretano | Incluye casco', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgK5vOqnAeSjHMyVW8zFawSyZEBdo_J9s8pO6ZJpKlQC91-yBs9lfTQlcwEyYSNxK6hGq0GgUtaFln_M0y0hkRLZ3ujDyLP1k0hOV2-RKkfbse257ggzob7Cw2W5nmw6AEADjvVr3dvXb7BGKG9YJ-reTMAQDorODD-FdwWI_b9qK9cY-v5n8bWn1oK1YiQ/s800/53.png', 5.87, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(225, 'llaveros-012', 'Llaveros', 'Muñeco Antiestrés - Modelo Deportista', '10 x 7.5 cm', 'Espuma de goma suave | Con uniforme', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEibCtT4pevzxeuACRoEO3XxrJPQkMnmecgGcaTKCMDFzFid6BgAFqWqG2F-Le00sfYbHcKu316qmGHtVgPXES55RqxfPDGYFcOIwUnIuVZM0Fof4rVXbY8yiPA73S-K2H4YSoeHfqYXQtL8HLlFWlqdaWWCfAy7I49bzqJs_PxSI5mP99MI3F0K7e5GvYST/s800/52.png', 8.22, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(226, 'llaveros-013', 'Llaveros', 'Llavero de plástico', '10.5 x 7 cm', 'Espuma de goma', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhxa7ycwNb8cwzLNqYunvqL6-Ic1OSqH6YPaxnWci9yHDHwgHiNXvcqtmH0NSf-v5cEOACYyMKnkhRJdblYPR2t-YtlM7mdjvdp8HNnb-aAnbswm6igIZ9kL5nSDs-0hNNb7dnTtbwhmWPN6lls2qWNpZow1ZMGduzxRhngUE6iJzxe1zcEmH5hCbUNruuO/s800/46.png', 6.90, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(227, 'llaveros-014', 'Llaveros', 'Muñeco Antiestrés - Modelo Minero', '11 x 8 cm', 'Espuma de poliuretano | Incluye casco', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhxa7ycwNb8cwzLNqYunvqL6-Ic1OSqH6YPaxnWci9yHDHwgHiNXvcqtmH0NSf-v5cEOACYyMKnkhRJdblYPR2t-YtlM7mdjvdp8HNnb-aAnbswm6igIZ9kL5nSDs-0hNNb7dnTtbwhmWPN6lls2qWNpZow1ZMGduzxRhngUE6iJzxe1zcEmH5hCbUNruuO/s800/46.png', 5.87, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(228, 'llaveros-015', 'Llaveros', 'Muñeco Antiestrés - Modelo Deportista', '10 x 7.5 cm', 'Espuma de goma suave | Con uniforme', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhxa7ycwNb8cwzLNqYunvqL6-Ic1OSqH6YPaxnWci9yHDHwgHiNXvcqtmH0NSf-v5cEOACYyMKnkhRJdblYPR2t-YtlM7mdjvdp8HNnb-aAnbswm6igIZ9kL5nSDs-0hNNb7dnTtbwhmWPN6lls2qWNpZow1ZMGduzxRhngUE6iJzxe1zcEmH5hCbUNruuO/s800/46.png', 8.22, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(229, 'llaveros-016', 'Llaveros', 'Llavero mini linterna de bambú', '10.5 x 7 cm', 'Espuma de goma', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEh2uGje8CUwhKaQ-vadUYkvCAtmgyXOP6cdXx7Sw4bCefetMyNyesEf-42w2W3bMrpY1dmkHJlu9a1OwAVErtsKvZ0NWmzRoxi9EqgZEFyP7atajBdWCVFYyakNwqEQOsEkTW3FtwK2Q_Gdoht4q-21y7xt4QA59078FSgghVbBLpyUHZMIqVv4kWTgQBMe/s800/48.png', 5.25, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(230, 'llaveros-017', 'Llaveros', 'Muñeco Antiestrés - Modelo Minero', '11 x 8 cm', 'Espuma de poliuretano | Incluye casco', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEh2uGje8CUwhKaQ-vadUYkvCAtmgyXOP6cdXx7Sw4bCefetMyNyesEf-42w2W3bMrpY1dmkHJlu9a1OwAVErtsKvZ0NWmzRoxi9EqgZEFyP7atajBdWCVFYyakNwqEQOsEkTW3FtwK2Q_Gdoht4q-21y7xt4QA59078FSgghVbBLpyUHZMIqVv4kWTgQBMe/s800/48.png', 5.87, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(231, 'llaveros-018', 'Llaveros', 'Muñeco Antiestrés - Modelo Deportista', '10 x 7.5 cm', 'Espuma de goma suave | Con uniforme', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEh2uGje8CUwhKaQ-vadUYkvCAtmgyXOP6cdXx7Sw4bCefetMyNyesEf-42w2W3bMrpY1dmkHJlu9a1OwAVErtsKvZ0NWmzRoxi9EqgZEFyP7atajBdWCVFYyakNwqEQOsEkTW3FtwK2Q_Gdoht4q-21y7xt4QA59078FSgghVbBLpyUHZMIqVv4kWTgQBMe/s800/48.png', 8.22, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(232, 'llaveros-019', 'Llaveros', 'Muñeco Antiestrés - Modelo Clásico', '10.5 x 7 cm', 'Espuma de goma', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEifzW63_eWCDFwOQGVuZg5XQkAjZbzi3ocF8kGZnVCTydqr4CHP-Ft5MXR-biYGBE0vbbGH-MPRFAgbkeBaJTkdMtCzDlYck7SNoGPDjzc5HBurJGl0DpLcDKjpjPKQpvCdU-YTOYRGU0c-5U2Jxo9TxC7vlWu9XEw4NF-3TDXff7udCO63sPLJpg-hUdsM/s800/49.png', 6.25, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(233, 'llaveros-020', 'Llaveros', 'Muñeco Antiestrés - Modelo Minero', '11 x 8 cm', 'Espuma de poliuretano | Incluye casco', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEifzW63_eWCDFwOQGVuZg5XQkAjZbzi3ocF8kGZnVCTydqr4CHP-Ft5MXR-biYGBE0vbbGH-MPRFAgbkeBaJTkdMtCzDlYck7SNoGPDjzc5HBurJGl0DpLcDKjpjPKQpvCdU-YTOYRGU0c-5U2Jxo9TxC7vlWu9XEw4NF-3TDXff7udCO63sPLJpg-hUdsM/s800/49.png', 5.87, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(234, 'llaveros-021', 'Llaveros', 'Llavero mini linterna', '10 x 7.5 cm', 'Espuma de goma suave | Con uniforme', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEifzW63_eWCDFwOQGVuZg5XQkAjZbzi3ocF8kGZnVCTydqr4CHP-Ft5MXR-biYGBE0vbbGH-MPRFAgbkeBaJTkdMtCzDlYck7SNoGPDjzc5HBurJGl0DpLcDKjpjPKQpvCdU-YTOYRGU0c-5U2Jxo9TxC7vlWu9XEw4NF-3TDXff7udCO63sPLJpg-hUdsM/s800/49.png', 3.76, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(235, 'llaveros-022', 'Llaveros', 'Llavero herramientas', '10.5 x 7 cm', 'Espuma de goma', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjUEXS6Z-McvBOjpAwezGxMzTxGQ1-gayIxMoKyIoorQxtAWrG_VccQfvxuOVQdy8O4SZPlFsnPEQTwuMxsFOW1mGAxPgV11m2EpxS3lwrbaHYJl1bIEYZa8PC5E99_OMOI9IOIlVC59K003GY2dB57RHDE2ig9bTAEUdU7lFjhGvpmfdKpb5GKJV7JdzUx/s800/50.png', 7.70, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(236, 'llaveros-023', 'Llaveros', 'Muñeco Antiestrés - Modelo Minero', '11 x 8 cm', 'Espuma de poliuretano | Incluye casco', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEh1KpN4LztD88eDfNEm_zbHES0LwQUFgvW_uCvFNZUwWf5R9K_cLSABZE-cWVXpkZNrGQUbgTz3ommQdXpISLL9EpvWz5Z4u3z5AVwoMwN8qmAWBQRNRez2itsLVptd0lwM_WeTju4-UQdf-4YYEQXjNgYUFqdjUbec1ixFRCox7kZOSdQw4mX6m4dchkBL/s800/57.png', 5.87, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(237, 'llaveros-024', 'Llaveros', 'Muñeco Antiestrés - Modelo Deportista', '10 x 7.5 cm', 'Espuma de goma suave | Con uniforme', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjUEXS6Z-McvBOjpAwezGxMzTxGQ1-gayIxMoKyIoorQxtAWrG_VccQfvxuOVQdy8O4SZPlFsnPEQTwuMxsFOW1mGAxPgV11m2EpxS3lwrbaHYJl1bIEYZa8PC5E99_OMOI9IOIlVC59K003GY2dB57RHDE2ig9bTAEUdU7lFjhGvpmfdKpb5GKJV7JdzUx/s800/50.png', 8.22, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(238, 'llaveros-025', 'Llaveros', 'Llavero wincha con nivelador', '10.5 x 7 cm', 'Espuma de goma', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjen_jTInFyaSj0RGqTJ73l8q3dzvivDW7sPEIz8dHu7EYNIJtHvEMJtsPiWRSyAA7MmmEAOU827uEpcyIHBOoU6NUbChOv6335LFpO6uHNQdXJrFiL09-O2PsvhX2PRRT-rjicZih5J9fHO8TJbHQERzzxvrNteo931k9jixmuWQK-PSDGH4MLBdgR-ASG/s800/52.png', 4.18, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(239, 'llaveros-026', 'Llaveros', 'Muñeco Antiestrés - Modelo Minero', '11 x 8 cm', 'Espuma de poliuretano | Incluye casco', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjen_jTInFyaSj0RGqTJ73l8q3dzvivDW7sPEIz8dHu7EYNIJtHvEMJtsPiWRSyAA7MmmEAOU827uEpcyIHBOoU6NUbChOv6335LFpO6uHNQdXJrFiL09-O2PsvhX2PRRT-rjicZih5J9fHO8TJbHQERzzxvrNteo931k9jixmuWQK-PSDGH4MLBdgR-ASG/s800/52.png', 5.87, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(240, 'llaveros-027', 'Llaveros', 'Muñeco Antiestrés - Modelo Deportista', '10 x 7.5 cm', 'Espuma de goma suave | Con uniforme', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjen_jTInFyaSj0RGqTJ73l8q3dzvivDW7sPEIz8dHu7EYNIJtHvEMJtsPiWRSyAA7MmmEAOU827uEpcyIHBOoU6NUbChOv6335LFpO6uHNQdXJrFiL09-O2PsvhX2PRRT-rjicZih5J9fHO8TJbHQERzzxvrNteo931k9jixmuWQK-PSDGH4MLBdgR-ASG/s800/52.png', 8.22, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(241, 'llaveros-028', 'Llaveros', 'Llavero wincha con destapador', '10.5 x 7 cm', 'Espuma de goma', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhLpgPzF92FZWZtk76Frcc8KL33oEqUtNPdjO9Z35dC0VZiXOdVy3AvqYECdQORCqC9FSlT3dcod-caRgCGq239jSPesAhZxHX4fE9lWdBhr2GAHCDd0OZt70RxxZ01_IGaDQCGTbniQAkRqBu48iDImjq3wrsHvt7Vj23PCevp_3Su0iosyg2kz5CA_-Lo/s800/53.png', 5.24, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(242, 'llaveros-029', 'Llaveros', 'Muñeco Antiestrés - Modelo Minero', '11 x 8 cm', 'Espuma de poliuretano | Incluye casco', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhLpgPzF92FZWZtk76Frcc8KL33oEqUtNPdjO9Z35dC0VZiXOdVy3AvqYECdQORCqC9FSlT3dcod-caRgCGq239jSPesAhZxHX4fE9lWdBhr2GAHCDd0OZt70RxxZ01_IGaDQCGTbniQAkRqBu48iDImjq3wrsHvt7Vj23PCevp_3Su0iosyg2kz5CA_-Lo/s800/53.png', 5.87, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(243, 'llaveros-030', 'Llaveros', 'Muñeco Antiestrés - Modelo Deportista', '10 x 7.5 cm', 'Espuma de goma suave | Con uniforme', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhLpgPzF92FZWZtk76Frcc8KL33oEqUtNPdjO9Z35dC0VZiXOdVy3AvqYECdQORCqC9FSlT3dcod-caRgCGq239jSPesAhZxHX4fE9lWdBhr2GAHCDd0OZt70RxxZ01_IGaDQCGTbniQAkRqBu48iDImjq3wrsHvt7Vj23PCevp_3Su0iosyg2kz5CA_-Lo/s800/53.png', 8.22, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(244, 'llaveros-031', 'Llaveros', 'Llavero set de manicure', '10.5 x 7 cm', 'Espuma de goma', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEiVxlaibzoYmIKqUUx604RTT601WnXVBLYJho_PqLMBJGhc4R3k9CMRdRTikJCSUvjNhk6qN_sZF8Tpj916PM7TE9xmQlUMlQxSiZ2gfA6C8YVxufpThny9Sa970PHrxJaffLizLSkSgXVPJwytQMzUOlE-ZfBdTJiVfeslgwaqqYDpBqWJQwP183jpfQdT/s800/55.png', 7.02, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(245, 'llaveros-032', 'Llaveros', 'Llavero set de manicure', '11 x 8 cm', 'Espuma de poliuretano | Incluye casco', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEiPKp8tL210F7wA8F8Ywr2wu47B5ecgsVyyo-uPZRM7UR8q8IFD-ErCMVLztM-SG-AlSjBRJ75QQXHuaOmycysr6UscA5qupNGuBJzQKYaq3qxu_hLS4BJLiEUWP6QB5kX71NwMIg4JX3mvOA56iFOV2q0JFBGN7KGXx-HN6A0lzkAcG2gxBMAbHMwv-Eux/s800/69.png', 7.02, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(246, 'llaveros-033', 'Llaveros', 'Muñeco Antiestrés - Modelo Deportista', '10 x 7.5 cm', 'Espuma de goma suave | Con uniforme', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEiVxlaibzoYmIKqUUx604RTT601WnXVBLYJho_PqLMBJGhc4R3k9CMRdRTikJCSUvjNhk6qN_sZF8Tpj916PM7TE9xmQlUMlQxSiZ2gfA6C8YVxufpThny9Sa970PHrxJaffLizLSkSgXVPJwytQMzUOlE-ZfBdTJiVfeslgwaqqYDpBqWJQwP183jpfQdT/s800/55.png', 8.22, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(247, 'bolsas-001', 'Bolsas Publicitarias', 'Bolsa de papel kraft liner', '10.5 x 7 cm', 'Espuma de goma', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhBxILHfJucfMXB6ousHPw3zJKd9RaFJGX6aGeUHkxNxhozkYTBD_NKVpyQa9fc9cSdxbLURky3iFIBe0jEb1YOZcoNV2tzAriC1FhGiJMuddEaT1sEo6XcYfk2-DNJkP7CwG9LJ9jZf2W5jXPwdET6mW5MubymyHTTRZgj56L1hTz-owCy7h5w_5GHr42y/s800/152.png', 8.30, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(248, 'bolsas-002', 'Bolsas Publicitarias', 'Muñeco Antiestrés - Modelo Minero', '11 x 8 cm', 'Espuma de poliuretano | Incluye casco', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEiJZcvr8b8DSom7w5nWL-GS3J1m1uT1W0DQJoZwhKdczid-B1GzpuoduGjtYMRnpopySvejvwO33SFWktCZ1AgRHJGtrsr1RGj9o43agRNdnAv8KwQe3fT1qqA8gwkeB6_vJBa9_JultGlsoZuu1jkvHkobqV0DDqqK56-DDhvoOOBo8p_gXiGcfWZzt_90/s800/166.png', 11.66, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(249, 'bolsas-003', 'Bolsas Publicitarias', 'Muñeco Antiestrés - Modelo Deportista', '10 x 7.5 cm', 'Espuma de goma suave | Con uniforme', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhBxILHfJucfMXB6ousHPw3zJKd9RaFJGX6aGeUHkxNxhozkYTBD_NKVpyQa9fc9cSdxbLURky3iFIBe0jEb1YOZcoNV2tzAriC1FhGiJMuddEaT1sEo6XcYfk2-DNJkP7CwG9LJ9jZf2W5jXPwdET6mW5MubymyHTTRZgj56L1hTz-owCy7h5w_5GHr42y/s800/152.png', 10.37, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(250, 'bolsas-004', 'Bolsas Publicitarias', 'Bolso non woven', '10.5 x 7 cm', 'Espuma de goma', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhIY_lpQMMLG5q4kHKqHfvGKtJIE5s9I3dTGdzmOo7ZGcnTf-1X0p7dHkRW4LjOE11G34BgddhEVwoEK78sA9eBxZflZrQAyrj8aRaXSf9ulNqXOWkFE5SssOYZGdcEvGPI5_3e7YCa5MzmlwQWBd1IqdKRtJIGF2K4bhUjjH2J_X6ZaJEhKoD5kT4vTt87/s800/153.png', 4.18, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(251, 'bolsas-005', 'Bolsas Publicitarias', 'Bolso non woven', '11 x 8 cm', 'Espuma de poliuretano | Incluye casco', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhyB3rWFwHTDlZ0SeKVjjckWlFN_NpDw116eJ4JZkgUurrwP2ryZSTKSsJkA05RISo6exsIIRrC34mlSs76q3RP64U42PkkfzcOCoi5KF-BoeN6aM07bd7nCqgO5ghzNI6T13XzPkWzZDeiCtHu-S2UxqcTAxoH_a7X8aNfRDoEhr98fWp9UOuYRTSmJc5S/s800/167.png', 4.18, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(252, 'bolsas-006', 'Bolsas Publicitarias', 'Muñeco Antiestrés - Modelo Deportista', '10 x 7.5 cm', 'Espuma de goma suave | Con uniforme', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhIY_lpQMMLG5q4kHKqHfvGKtJIE5s9I3dTGdzmOo7ZGcnTf-1X0p7dHkRW4LjOE11G34BgddhEVwoEK78sA9eBxZflZrQAyrj8aRaXSf9ulNqXOWkFE5SssOYZGdcEvGPI5_3e7YCa5MzmlwQWBd1IqdKRtJIGF2K4bhUjjH2J_X6ZaJEhKoD5kT4vTt87/s800/153.png', 10.37, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(253, 'bolsas-007', 'Bolsas Publicitarias', 'Bolsa Notex plana', '10.5 x 7 cm', 'Espuma de goma', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhcCJtNoUvEK5ffMVcn7pPwItQwpEq-yNg3P6OZ61V_nff_ObwZ6cD-u6LI7ioJRTrDbrdyjIFIGGHQfsi3PJMT1-MVEwIhYjyx-pn9CorkBqkhnLd8HMvz7uvOSJoUO-WpsixkMNxAJ4b7zBbU9Rrt0TqpmUObUHMf_iMboq0WPHJynY24gkn3JkyQKHQB/s800/170.png', 9.07, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(254, 'bolsas-008', 'Bolsas Publicitarias', 'Bolsa Notex plana', '10.5 x 7 cm', 'Espuma de goma', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhp2H7Alm03vxEzKGaCXKk5jf7Qz7_hUo4ZVpOrunuqj3Wz9c0oSxk6pM0199ndJkcZO8UwlUIO16Fc6hcVbtP4dttJ0Lar6SwfdCQBsR3CKHHpdlmbAhsCzcv9hQc72jqNRdyv6RaXOPI-WET4wqzmOUVkpgJ7PoW8zBJBjwL4Ic16Aj-mHpKjsM24qGYV/s800/154.png', 9.07, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(255, 'bolsas-009', 'Bolsas Publicitarias', 'Bolsa Notex plana', '10.5 x 7 cm', 'Espuma de goma', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjqI6dX2fNenhXHZWI28v8PsSnLhs7aqGYEZPDL4ggIi0shgAvoY05Cg8seIjDwLvq1-I4R66nTXlv6l4mmzg-2NqI-jyzWLwKIUGg84YiqR8v0hSiNkoIDqAKPgWGjxPJ7SMxXcKt_LcOub5UVqKn53dGXKcSwiJUkUUUpSbd2juj__iucxqxem-fyAbpt/s800/171.png', 9.07, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(256, 'bolsas-010', 'Bolsas Publicitarias', 'Bolsa con asa driza', '10.5 x 7 cm', 'Espuma de goma', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhBhyJmBCusoIc_Jyl0TXurq1qUSKV9KXdT2-HTXoQHr2_4LGctqtMiNzKGllHRooLHRyx1k9RVnxT_cf0ys2pFO27BtXDV1CG1AyUL4j_6SlYkLTACqrjBnApG6Y38maSNDI9L7xIVjkmxwLVeYkETAWCNHRk9T9IEXphfhwKjJNxUJ4I7PvYqoD7nw2FG/s800/155.png', 11.70, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(257, 'bolsas-011', 'Bolsas Publicitarias', 'Bolsa con asa driza', '11 x 8 cm', 'Espuma de poliuretano | Incluye casco', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEh5bfI8sSppBTdSBYP7GtERiLpLvscEeriEW1Qp4G5vtlG-_UiF2yIt0K_7GBfUaMQ-NmJrM5d-cQdQctuiMte8kdbtwXIq_8eVF7sjir20KAAy-CTIrY6_u7TwmghUkMSsDuHVNbga-t6n6oQGXzwSEVAZvcMT5dpCUoZ8Gp5JUfgBR3S_ZY7qYu9xpCz6/s800/173.png', 11.70, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(258, 'bolsas-012', 'Bolsas Publicitarias', 'Dado antiestres', '10 x 7.5 cm', 'Espuma de goma suave | Con uniforme', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhBhyJmBCusoIc_Jyl0TXurq1qUSKV9KXdT2-HTXoQHr2_4LGctqtMiNzKGllHRooLHRyx1k9RVnxT_cf0ys2pFO27BtXDV1CG1AyUL4j_6SlYkLTACqrjBnApG6Y38maSNDI9L7xIVjkmxwLVeYkETAWCNHRk9T9IEXphfhwKjJNxUJ4I7PvYqoD7nw2FG/s800/155.png', 4.56, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(259, 'bolsas-013', 'Bolsas Publicitarias', 'Bolsa con asa cinta satinada', '10.5 x 7 cm', 'Espuma de goma', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhgeZ93_-iwbxNlduhY1oJlymWv3kiEIRxS07Vq_ddIhaDAIW9QEfkbJzElpZ5eSONwqUFsZFozYPMImbiJDGy0Nmx8-UhaqaHAWST8_Gf5vRpyEnZR3nraXX_ayIotaDT-JFzgm1A1PuUoNrXIFNVHZGiPlxduohHQrswHzEhy2xnTtM7sU4xUbaKNSYBy/s800/156.png', 6.82, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(260, 'bolsas-014', 'Bolsas Publicitarias', 'Muñeco Antiestrés - Modelo Minero', '11 x 8 cm', 'Espuma de poliuretano | Incluye casco', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEg10M_MBDwtGE2mqSN0wZaSjdziu3ltY5tVflzSaeQANKcqbvOTzH3Sh7xgdz7Yr5a7bnyNaxqw5M5uizXjn-_Dm8bcL90v0X_VDBKSNvVo5vy9weTCX9vkrdzE9wizPuRPGJfezXYcvD_jRE8IxjNJAN99xkQtvXTV-NSop3NyNeVaURfevKazvoFw0QEH/s800/175.png', 11.66, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(261, 'bolsas-015', 'Bolsas Publicitarias', 'Muñeco Antiestrés - Modelo Deportista', '10 x 7.5 cm', 'Espuma de goma suave | Con uniforme', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhgeZ93_-iwbxNlduhY1oJlymWv3kiEIRxS07Vq_ddIhaDAIW9QEfkbJzElpZ5eSONwqUFsZFozYPMImbiJDGy0Nmx8-UhaqaHAWST8_Gf5vRpyEnZR3nraXX_ayIotaDT-JFzgm1A1PuUoNrXIFNVHZGiPlxduohHQrswHzEhy2xnTtM7sU4xUbaKNSYBy/s800/156.png', 10.37, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(262, 'bolsas-016', 'Bolsas Publicitarias', 'Bolsa de papel kraft', '10.5 x 7 cm', 'Espuma de goma', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEiHKVDkuVfjCTq7tuafrSo9LQAGeXqbfKn2x3gngH4TIxe5rQJN1wGSHZAAwz8gH8Plq6mETYYoUDZMw0bcAjC26zf4xffBtNVncgVDXBp0Knhb0cPaBw84akWVm34LOYhOkk4XKFg6c17H686pcCUbMZf3WA4udY9sVQdtd2f4QdG79IrjrhSqYpH3sRFE/s800/157.png', 5.72, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(263, 'bolsas-017', 'Bolsas Publicitarias', 'Muñeco Antiestrés - Modelo Minero', '11 x 8 cm', 'Espuma de poliuretano | Incluye casco', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEiHKVDkuVfjCTq7tuafrSo9LQAGeXqbfKn2x3gngH4TIxe5rQJN1wGSHZAAwz8gH8Plq6mETYYoUDZMw0bcAjC26zf4xffBtNVncgVDXBp0Knhb0cPaBw84akWVm34LOYhOkk4XKFg6c17H686pcCUbMZf3WA4udY9sVQdtd2f4QdG79IrjrhSqYpH3sRFE/s800/157.png', 11.66, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(264, 'bolsas-018', 'Bolsas Publicitarias', 'Muñeco Antiestrés - Modelo Deportista', '10 x 7.5 cm', 'Espuma de goma suave | Con uniforme', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEiHKVDkuVfjCTq7tuafrSo9LQAGeXqbfKn2x3gngH4TIxe5rQJN1wGSHZAAwz8gH8Plq6mETYYoUDZMw0bcAjC26zf4xffBtNVncgVDXBp0Knhb0cPaBw84akWVm34LOYhOkk4XKFg6c17H686pcCUbMZf3WA4udY9sVQdtd2f4QdG79IrjrhSqYpH3sRFE/s800/157.png', 10.37, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(265, 'papeleria-001', 'ARTICULOS Papeleria', 'Tarjetas de presentación', '10.5 x 7 cm', 'Espuma de goma', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgkYUdiPcW6NNMb1NZva4nFw2Cr8Llugm6SkEYmlQwCr4mIqXxjkp1SB8Qbr0CooHLCpfLtDsaai8qcG1MENHw0xzpQOxs461cuTCzuDsd6RGr8p2uXOb0vpJu-KdZF0rutTKZOfooTbXW4Kmany29zELFzQ6G93qHWBQIEv2AFWqnSxg6nQzCT27c5CKji/s800/158.png', 7.74, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(266, 'papeleria-002', 'ARTICULOS Papeleria', 'Tarjetas de presentación', '11 x 8 cm', 'Espuma de poliuretano | Incluye casco', 'rojo,azul,gris,blanco', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEju-22bAwXwsDtLXqaIoyxAFR-IFQ6v6qIMUZM6CRRflsuL4K2b90oQdkpJ2NAlWCR1Gr6zUTtMwbOnPHd9or0Be6ZeDq4iUZmWCn0kp87X_U4HEdbeol3E9oldKu-86J4xTl-Y0XVe6Z5zCxbwfEAib9d1gSAk_wV7RFqLv8ZIzs8RC_9V-ifDDj_Tu2CH/s800/159.png', 7.74, NULL, 1, NULL, '2026-09-05 05:58:44', '2026-09-05 05:58:44'),
(272, 'mi-tienda-c2c-llavero-01', 'Artículos Antiestrés', 'Llavero de Cuero Grabado', '4 x 3 cm', 'Madera', 'marrón', 'https://kilarys.com/wp-content/uploads/2025/12/ChatGPT-Image-18-jun-2026-16_58_57_resultado.webp', 0.07, NULL, 1, 18, '2026-09-06 05:22:14', '2026-09-06 05:22:14');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto_variantes_tb_baycodec`
--

CREATE TABLE `producto_variantes_tb_baycodec` (
  `id` int(11) NOT NULL,
  `producto_codigo` varchar(60) NOT NULL,
  `nombre_variante` varchar(120) NOT NULL,
  `precio_extra` decimal(10,2) NOT NULL DEFAULT 0.00,
  `stock` int(11) NOT NULL DEFAULT 0,
  `activo` tinyint(1) NOT NULL DEFAULT 1,
  `creado_en` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `resenas_tb_baycodec`
--

CREATE TABLE `resenas_tb_baycodec` (
  `id` int(11) NOT NULL,
  `producto_codigo` varchar(60) NOT NULL,
  `cliente_id` int(11) NOT NULL,
  `calificacion` tinyint(4) NOT NULL,
  `comentario` varchar(500) NOT NULL DEFAULT '',
  `creado_en` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tarifas_envio_tb_baycodec`
--

CREATE TABLE `tarifas_envio_tb_baycodec` (
  `id` int(11) NOT NULL,
  `zona` varchar(120) NOT NULL,
  `costo` decimal(10,2) NOT NULL DEFAULT 0.00,
  `dias_estimados` varchar(60) NOT NULL DEFAULT '',
  `activo` tinyint(1) NOT NULL DEFAULT 1,
  `creado_en` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `tarifas_envio_tb_baycodec`
--

INSERT INTO `tarifas_envio_tb_baycodec` (`id`, `zona`, `costo`, `dias_estimados`, `activo`, `creado_en`) VALUES
(1, 'Recojo en tienda (Cercado, Arequipa)', 0.00, 'El mismo día', 1, '2026-09-06 03:44:47'),
(2, 'Arequipa Metropolitana', 8.00, '1-2 días', 1, '2026-09-06 03:44:47'),
(3, 'Arequipa Provincia', 15.00, '2-4 días', 1, '2026-09-06 03:44:47'),
(4, 'Lima', 18.00, '3-5 días', 1, '2026-09-06 03:44:47'),
(5, 'Otras regiones del Perú', 25.00, '4-7 días', 1, '2026-09-06 03:44:47');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tokens_recuperacion_tb_baycodec`
--

CREATE TABLE `tokens_recuperacion_tb_baycodec` (
  `id` int(11) NOT NULL,
  `tipo` enum('admin','cliente') NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `token` varchar(64) NOT NULL,
  `expira_en` timestamp NOT NULL,
  `usado` tinyint(1) NOT NULL DEFAULT 0,
  `creado_en` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios_admin_tb_baycodec`
--

CREATE TABLE `usuarios_admin_tb_baycodec` (
  `id` int(11) NOT NULL,
  `usuario` varchar(60) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `creado_en` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `usuarios_admin_tb_baycodec`
--

INSERT INTO `usuarios_admin_tb_baycodec` (`id`, `usuario`, `password_hash`, `creado_en`) VALUES
(1, 'baycodec', '$2y$12$OE3XvBm1J8P10Qajwfn2PeWXlik8DrKYfvQ9mAmoH1Ob1Fzm.AFBe', '2026-09-05 15:19:31');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `auditoria_admin_tb_baycodec`
--
ALTER TABLE `auditoria_admin_tb_baycodec`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `calificaciones_vendedor_tb_baycodec`
--
ALTER TABLE `calificaciones_vendedor_tb_baycodec`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `calificacion_vendedor_unica_baycodec` (`vendedor_id`,`cliente_id`),
  ADD KEY `cliente_id` (`cliente_id`);

--
-- Indices de la tabla `carritos_tb_baycodec`
--
ALTER TABLE `carritos_tb_baycodec`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `cliente_id` (`cliente_id`);

--
-- Indices de la tabla `carrito_items_tb_baycodec`
--
ALTER TABLE `carrito_items_tb_baycodec`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `carrito_item_unico_baycodec` (`carrito_id`,`producto_codigo`);

--
-- Indices de la tabla `categorias_tb_baycodec`
--
ALTER TABLE `categorias_tb_baycodec`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nombre` (`nombre`);

--
-- Indices de la tabla `clientes_tb_baycodec`
--
ALTER TABLE `clientes_tb_baycodec`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `usuario` (`usuario`);

--
-- Indices de la tabla `comisiones_tb_baycodec`
--
ALTER TABLE `comisiones_tb_baycodec`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `comision_unica_baycodec` (`pedido_id`,`vendedor_id`),
  ADD KEY `vendedor_id` (`vendedor_id`);

--
-- Indices de la tabla `configuracion_tb_baycodec`
--
ALTER TABLE `configuracion_tb_baycodec`
  ADD PRIMARY KEY (`clave`);

--
-- Indices de la tabla `cupones_tb_baycodec`
--
ALTER TABLE `cupones_tb_baycodec`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `codigo` (`codigo`);

--
-- Indices de la tabla `detalle_pedido_tb_baycodec`
--
ALTER TABLE `detalle_pedido_tb_baycodec`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pedido_id` (`pedido_id`);

--
-- Indices de la tabla `direcciones_tb_baycodec`
--
ALTER TABLE `direcciones_tb_baycodec`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cliente_id` (`cliente_id`);

--
-- Indices de la tabla `eventos_analitica_tb_baycodec`
--
ALTER TABLE `eventos_analitica_tb_baycodec`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `favoritos_tb_baycodec`
--
ALTER TABLE `favoritos_tb_baycodec`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `favorito_unico_baycodec` (`cliente_id`,`producto_codigo`);

--
-- Indices de la tabla `movimientos_inventario_tb_baycodec`
--
ALTER TABLE `movimientos_inventario_tb_baycodec`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `notificaciones_tb_baycodec`
--
ALTER TABLE `notificaciones_tb_baycodec`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cliente_id` (`cliente_id`);

--
-- Indices de la tabla `pagos_tb_baycodec`
--
ALTER TABLE `pagos_tb_baycodec`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pedido_id` (`pedido_id`);

--
-- Indices de la tabla `pagos_vendedor_tb_baycodec`
--
ALTER TABLE `pagos_vendedor_tb_baycodec`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vendedor_id` (`vendedor_id`);

--
-- Indices de la tabla `pedidos_tb_baycodec`
--
ALTER TABLE `pedidos_tb_baycodec`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cliente_id` (`cliente_id`);

--
-- Indices de la tabla `productos_tb_baycodec`
--
ALTER TABLE `productos_tb_baycodec`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `codigo` (`codigo`);

--
-- Indices de la tabla `producto_variantes_tb_baycodec`
--
ALTER TABLE `producto_variantes_tb_baycodec`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `resenas_tb_baycodec`
--
ALTER TABLE `resenas_tb_baycodec`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `resena_unica_baycodec` (`producto_codigo`,`cliente_id`),
  ADD KEY `cliente_id` (`cliente_id`);

--
-- Indices de la tabla `tarifas_envio_tb_baycodec`
--
ALTER TABLE `tarifas_envio_tb_baycodec`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `zona` (`zona`);

--
-- Indices de la tabla `tokens_recuperacion_tb_baycodec`
--
ALTER TABLE `tokens_recuperacion_tb_baycodec`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `token` (`token`);

--
-- Indices de la tabla `usuarios_admin_tb_baycodec`
--
ALTER TABLE `usuarios_admin_tb_baycodec`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `usuario` (`usuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `auditoria_admin_tb_baycodec`
--
ALTER TABLE `auditoria_admin_tb_baycodec`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `calificaciones_vendedor_tb_baycodec`
--
ALTER TABLE `calificaciones_vendedor_tb_baycodec`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `carritos_tb_baycodec`
--
ALTER TABLE `carritos_tb_baycodec`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `carrito_items_tb_baycodec`
--
ALTER TABLE `carrito_items_tb_baycodec`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `categorias_tb_baycodec`
--
ALTER TABLE `categorias_tb_baycodec`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1171;

--
-- AUTO_INCREMENT de la tabla `clientes_tb_baycodec`
--
ALTER TABLE `clientes_tb_baycodec`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT de la tabla `comisiones_tb_baycodec`
--
ALTER TABLE `comisiones_tb_baycodec`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `cupones_tb_baycodec`
--
ALTER TABLE `cupones_tb_baycodec`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `detalle_pedido_tb_baycodec`
--
ALTER TABLE `detalle_pedido_tb_baycodec`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `direcciones_tb_baycodec`
--
ALTER TABLE `direcciones_tb_baycodec`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `eventos_analitica_tb_baycodec`
--
ALTER TABLE `eventos_analitica_tb_baycodec`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT de la tabla `favoritos_tb_baycodec`
--
ALTER TABLE `favoritos_tb_baycodec`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `movimientos_inventario_tb_baycodec`
--
ALTER TABLE `movimientos_inventario_tb_baycodec`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `notificaciones_tb_baycodec`
--
ALTER TABLE `notificaciones_tb_baycodec`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `pagos_tb_baycodec`
--
ALTER TABLE `pagos_tb_baycodec`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `pagos_vendedor_tb_baycodec`
--
ALTER TABLE `pagos_vendedor_tb_baycodec`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pedidos_tb_baycodec`
--
ALTER TABLE `pedidos_tb_baycodec`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `productos_tb_baycodec`
--
ALTER TABLE `productos_tb_baycodec`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=273;

--
-- AUTO_INCREMENT de la tabla `producto_variantes_tb_baycodec`
--
ALTER TABLE `producto_variantes_tb_baycodec`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `resenas_tb_baycodec`
--
ALTER TABLE `resenas_tb_baycodec`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tarifas_envio_tb_baycodec`
--
ALTER TABLE `tarifas_envio_tb_baycodec`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=876;

--
-- AUTO_INCREMENT de la tabla `tokens_recuperacion_tb_baycodec`
--
ALTER TABLE `tokens_recuperacion_tb_baycodec`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuarios_admin_tb_baycodec`
--
ALTER TABLE `usuarios_admin_tb_baycodec`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `calificaciones_vendedor_tb_baycodec`
--
ALTER TABLE `calificaciones_vendedor_tb_baycodec`
  ADD CONSTRAINT `calificaciones_vendedor_tb_baycodec_ibfk_1` FOREIGN KEY (`vendedor_id`) REFERENCES `clientes_tb_baycodec` (`id`),
  ADD CONSTRAINT `calificaciones_vendedor_tb_baycodec_ibfk_2` FOREIGN KEY (`cliente_id`) REFERENCES `clientes_tb_baycodec` (`id`);

--
-- Filtros para la tabla `carritos_tb_baycodec`
--
ALTER TABLE `carritos_tb_baycodec`
  ADD CONSTRAINT `carritos_tb_baycodec_ibfk_1` FOREIGN KEY (`cliente_id`) REFERENCES `clientes_tb_baycodec` (`id`);

--
-- Filtros para la tabla `carrito_items_tb_baycodec`
--
ALTER TABLE `carrito_items_tb_baycodec`
  ADD CONSTRAINT `carrito_items_tb_baycodec_ibfk_1` FOREIGN KEY (`carrito_id`) REFERENCES `carritos_tb_baycodec` (`id`);

--
-- Filtros para la tabla `comisiones_tb_baycodec`
--
ALTER TABLE `comisiones_tb_baycodec`
  ADD CONSTRAINT `comisiones_tb_baycodec_ibfk_1` FOREIGN KEY (`pedido_id`) REFERENCES `pedidos_tb_baycodec` (`id`),
  ADD CONSTRAINT `comisiones_tb_baycodec_ibfk_2` FOREIGN KEY (`vendedor_id`) REFERENCES `clientes_tb_baycodec` (`id`);

--
-- Filtros para la tabla `detalle_pedido_tb_baycodec`
--
ALTER TABLE `detalle_pedido_tb_baycodec`
  ADD CONSTRAINT `detalle_pedido_tb_baycodec_ibfk_1` FOREIGN KEY (`pedido_id`) REFERENCES `pedidos_tb_baycodec` (`id`);

--
-- Filtros para la tabla `direcciones_tb_baycodec`
--
ALTER TABLE `direcciones_tb_baycodec`
  ADD CONSTRAINT `direcciones_tb_baycodec_ibfk_1` FOREIGN KEY (`cliente_id`) REFERENCES `clientes_tb_baycodec` (`id`);

--
-- Filtros para la tabla `favoritos_tb_baycodec`
--
ALTER TABLE `favoritos_tb_baycodec`
  ADD CONSTRAINT `favoritos_tb_baycodec_ibfk_1` FOREIGN KEY (`cliente_id`) REFERENCES `clientes_tb_baycodec` (`id`);

--
-- Filtros para la tabla `notificaciones_tb_baycodec`
--
ALTER TABLE `notificaciones_tb_baycodec`
  ADD CONSTRAINT `notificaciones_tb_baycodec_ibfk_1` FOREIGN KEY (`cliente_id`) REFERENCES `clientes_tb_baycodec` (`id`);

--
-- Filtros para la tabla `pagos_tb_baycodec`
--
ALTER TABLE `pagos_tb_baycodec`
  ADD CONSTRAINT `pagos_tb_baycodec_ibfk_1` FOREIGN KEY (`pedido_id`) REFERENCES `pedidos_tb_baycodec` (`id`);

--
-- Filtros para la tabla `pagos_vendedor_tb_baycodec`
--
ALTER TABLE `pagos_vendedor_tb_baycodec`
  ADD CONSTRAINT `pagos_vendedor_tb_baycodec_ibfk_1` FOREIGN KEY (`vendedor_id`) REFERENCES `clientes_tb_baycodec` (`id`);

--
-- Filtros para la tabla `pedidos_tb_baycodec`
--
ALTER TABLE `pedidos_tb_baycodec`
  ADD CONSTRAINT `pedidos_tb_baycodec_ibfk_1` FOREIGN KEY (`cliente_id`) REFERENCES `clientes_tb_baycodec` (`id`);

--
-- Filtros para la tabla `resenas_tb_baycodec`
--
ALTER TABLE `resenas_tb_baycodec`
  ADD CONSTRAINT `resenas_tb_baycodec_ibfk_1` FOREIGN KEY (`cliente_id`) REFERENCES `clientes_tb_baycodec` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
