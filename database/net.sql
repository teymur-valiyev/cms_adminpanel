-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Хост: 127.0.0.1
-- Время создания: Май 08 2016 г., 02:14
-- Версия сервера: 10.1.10-MariaDB
-- Версия PHP: 5.6.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `net`
--

-- --------------------------------------------------------

--
-- Структура таблицы `migrations`
--

CREATE TABLE `migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `migrations`
--

INSERT INTO `migrations` (`migration`, `batch`) VALUES
('2014_10_12_000000_create_users_table', 1),
('2014_10_12_100000_create_password_resets_table', 1),
('2016_04_29_120607_create_roles_table', 1),
('2016_04_29_120631_create_permissions_table', 1),
('2016_04_29_120647_create_permission_role_table', 1),
('2016_04_29_120700_create_role_user_table', 1),
('2016_04_30_235118_create_translations_table', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `permissions`
--

CREATE TABLE `permissions` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'user.create', NULL, '2016-05-07 16:42:28', '2016-05-07 16:42:28'),
(2, 'user.delete', NULL, '2016-05-07 16:42:28', '2016-05-07 16:42:28'),
(3, 'user.edit', NULL, '2016-05-07 16:42:28', '2016-05-07 16:42:28'),
(4, 'gallery.create', NULL, '2016-05-07 16:42:28', '2016-05-07 16:42:28'),
(5, 'gallery.edit', NULL, '2016-05-07 16:42:28', '2016-05-07 16:42:28'),
(6, 'gallery.delete', NULL, '2016-05-07 16:42:28', '2016-05-07 16:42:28');

-- --------------------------------------------------------

--
-- Структура таблицы `permission_role`
--

CREATE TABLE `permission_role` (
  `role_id` int(10) UNSIGNED NOT NULL,
  `permission_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `permission_role`
--

INSERT INTO `permission_role` (`role_id`, `permission_id`, `created_at`, `updated_at`) VALUES
(2, 3, NULL, NULL),
(2, 4, NULL, NULL),
(2, 5, NULL, NULL),
(2, 6, NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `roles`
--

INSERT INTO `roles` (`id`, `name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'super', NULL, '2016-05-07 16:42:29', '2016-05-07 16:42:29'),
(2, 'content', 'content manager', '2016-05-07 16:42:29', '2016-05-07 18:47:59');

-- --------------------------------------------------------

--
-- Структура таблицы `role_user`
--

CREATE TABLE `role_user` (
  `role_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `role_user`
--

INSERT INTO `role_user` (`role_id`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, NULL),
(2, 2, NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `translations`
--

CREATE TABLE `translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `locale` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `group` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `translations`
--

INSERT INTO `translations` (`id`, `status`, `locale`, `group`, `key`, `value`, `created_at`, `updated_at`) VALUES
(1, 1, 'az', 'auth', 'failed', 'These credentials do not match our records.', '2016-05-07 19:53:16', '2016-05-07 19:53:16'),
(2, 1, 'az', 'auth', 'throttle', 'Too many login attempts. Please try again in :seconds seconds.', '2016-05-07 19:53:16', '2016-05-07 19:53:16'),
(3, 1, 'az', 'pagination', 'previous', '&laquo; Previous', '2016-05-07 19:53:16', '2016-05-07 19:53:16'),
(4, 1, 'az', 'pagination', 'next', 'Sonrakı »', '2016-05-07 19:53:16', '2016-05-07 19:53:16'),
(5, 1, 'az', 'passwords', 'password', 'Passwords must be at least six characters and match the confirmation.', '2016-05-07 19:53:16', '2016-05-07 19:53:16'),
(6, 1, 'az', 'passwords', 'reset', 'Your password has been reset!', '2016-05-07 19:53:16', '2016-05-07 19:53:16'),
(7, 1, 'az', 'passwords', 'sent', 'We have e-mailed your password reset link!', '2016-05-07 19:53:16', '2016-05-07 19:53:16'),
(8, 1, 'az', 'passwords', 'token', 'This password reset token is invalid.', '2016-05-07 19:53:16', '2016-05-07 19:53:16'),
(9, 1, 'az', 'passwords', 'user', 'We can''t find a user with that e-mail address.', '2016-05-07 19:53:16', '2016-05-07 19:53:16'),
(10, 1, 'az', 'validation', 'accepted', 'The :attribute must be accepted.', '2016-05-07 19:53:16', '2016-05-07 19:53:16'),
(11, 1, 'az', 'validation', 'active_url', 'The :attribute is not a valid URL.', '2016-05-07 19:53:16', '2016-05-07 19:53:16'),
(12, 1, 'az', 'validation', 'after', 'The :attribute must be a date after :date.', '2016-05-07 19:53:16', '2016-05-07 19:53:16'),
(13, 1, 'az', 'validation', 'alpha', 'The :attribute may only contain letters.', '2016-05-07 19:53:16', '2016-05-07 19:53:16'),
(14, 1, 'az', 'validation', 'alpha_dash', 'The :attribute may only contain letters, numbers, and dashes.', '2016-05-07 19:53:16', '2016-05-07 19:53:16'),
(15, 1, 'az', 'validation', 'alpha_num', 'The :attribute may only contain letters and numbers.', '2016-05-07 19:53:16', '2016-05-07 19:53:16'),
(16, 1, 'az', 'validation', 'array', 'The :attribute must be an array.', '2016-05-07 19:53:16', '2016-05-07 19:53:16'),
(17, 1, 'az', 'validation', 'before', 'The :attribute must be a date before :date.', '2016-05-07 19:53:16', '2016-05-07 19:53:16'),
(18, 1, 'az', 'validation', 'between.numeric', 'The :attribute must be between :min and :max.', '2016-05-07 19:53:16', '2016-05-07 19:53:16'),
(19, 1, 'az', 'validation', 'between.file', 'The :attribute must be between :min and :max kilobytes.', '2016-05-07 19:53:16', '2016-05-07 19:53:16'),
(20, 1, 'az', 'validation', 'between.string', 'The :attribute must be between :min and :max characters.', '2016-05-07 19:53:16', '2016-05-07 19:53:16'),
(21, 1, 'az', 'validation', 'between.array', 'The :attribute must have between :min and :max items.', '2016-05-07 19:53:16', '2016-05-07 19:53:16'),
(22, 1, 'az', 'validation', 'boolean', 'The :attribute field must be true or false.', '2016-05-07 19:53:16', '2016-05-07 19:53:16'),
(23, 1, 'az', 'validation', 'confirmed', 'The :attribute confirmation does not match.', '2016-05-07 19:53:16', '2016-05-07 19:53:16'),
(24, 1, 'az', 'validation', 'date', 'The :attribute is not a valid date.', '2016-05-07 19:53:16', '2016-05-07 19:53:16'),
(25, 1, 'az', 'validation', 'date_format', 'The :attribute does not match the format :format.', '2016-05-07 19:53:16', '2016-05-07 19:53:16'),
(26, 1, 'az', 'validation', 'different', 'The :attribute and :other must be different.', '2016-05-07 19:53:16', '2016-05-07 19:53:16'),
(27, 1, 'az', 'validation', 'digits', 'The :attribute must be :digits digits.', '2016-05-07 19:53:17', '2016-05-07 19:53:17'),
(28, 1, 'az', 'validation', 'digits_between', 'The :attribute must be between :min and :max digits.', '2016-05-07 19:53:17', '2016-05-07 19:53:17'),
(29, 1, 'az', 'validation', 'distinct', 'The :attribute field has a duplicate value.', '2016-05-07 19:53:17', '2016-05-07 19:53:17'),
(30, 1, 'az', 'validation', 'email', 'The :attribute must be a valid email address.', '2016-05-07 19:53:17', '2016-05-07 19:53:17'),
(31, 1, 'az', 'validation', 'exists', 'The selected :attribute is invalid.', '2016-05-07 19:53:17', '2016-05-07 19:53:17'),
(32, 1, 'az', 'validation', 'filled', 'The :attribute field is required.', '2016-05-07 19:53:17', '2016-05-07 19:53:17'),
(33, 1, 'az', 'validation', 'image', 'The :attribute must be an image.', '2016-05-07 19:53:17', '2016-05-07 19:53:17'),
(34, 1, 'az', 'validation', 'in', 'The selected :attribute is invalid.', '2016-05-07 19:53:17', '2016-05-07 19:53:17'),
(35, 1, 'az', 'validation', 'in_array', 'The :attribute field does not exist in :other.', '2016-05-07 19:53:17', '2016-05-07 19:53:17'),
(36, 1, 'az', 'validation', 'integer', 'The :attribute must be an integer.', '2016-05-07 19:53:17', '2016-05-07 19:53:17'),
(37, 1, 'az', 'validation', 'ip', 'The :attribute must be a valid IP address.', '2016-05-07 19:53:17', '2016-05-07 19:53:17'),
(38, 1, 'az', 'validation', 'json', 'The :attribute must be a valid JSON string.', '2016-05-07 19:53:17', '2016-05-07 19:53:17'),
(39, 1, 'az', 'validation', 'max.numeric', 'The :attribute may not be greater than :max.', '2016-05-07 19:53:17', '2016-05-07 19:53:17'),
(40, 1, 'az', 'validation', 'max.file', 'The :attribute may not be greater than :max kilobytes.', '2016-05-07 19:53:17', '2016-05-07 19:53:17'),
(41, 1, 'az', 'validation', 'max.string', 'The :attribute may not be greater than :max characters.', '2016-05-07 19:53:17', '2016-05-07 19:53:17'),
(42, 1, 'az', 'validation', 'max.array', 'The :attribute may not have more than :max items.', '2016-05-07 19:53:17', '2016-05-07 19:53:17'),
(43, 1, 'az', 'validation', 'mimes', 'The :attribute must be a file of type: :values.', '2016-05-07 19:53:17', '2016-05-07 19:53:17'),
(44, 1, 'az', 'validation', 'min.numeric', 'The :attribute must be at least :min.', '2016-05-07 19:53:17', '2016-05-07 19:53:17'),
(45, 1, 'az', 'validation', 'min.file', 'The :attribute must be at least :min kilobytes.', '2016-05-07 19:53:17', '2016-05-07 19:53:17'),
(46, 1, 'az', 'validation', 'min.string', 'The :attribute must be at least :min characters.', '2016-05-07 19:53:17', '2016-05-07 19:53:17'),
(47, 1, 'az', 'validation', 'min.array', 'The :attribute must have at least :min items.', '2016-05-07 19:53:17', '2016-05-07 19:53:17'),
(48, 1, 'az', 'validation', 'not_in', 'The selected :attribute is invalid.', '2016-05-07 19:53:17', '2016-05-07 19:53:17'),
(49, 1, 'az', 'validation', 'numeric', 'The :attribute must be a number.', '2016-05-07 19:53:17', '2016-05-07 19:53:17'),
(50, 1, 'az', 'validation', 'present', 'The :attribute field must be present.', '2016-05-07 19:53:17', '2016-05-07 19:53:17'),
(51, 1, 'az', 'validation', 'regex', 'The :attribute format is invalid.', '2016-05-07 19:53:17', '2016-05-07 19:53:17'),
(52, 1, 'az', 'validation', 'required', 'The :attribute field is required.', '2016-05-07 19:53:17', '2016-05-07 19:53:17'),
(53, 1, 'az', 'validation', 'required_if', 'The :attribute field is required when :other is :value.', '2016-05-07 19:53:17', '2016-05-07 19:53:17'),
(54, 1, 'az', 'validation', 'required_unless', 'The :attribute field is required unless :other is in :values.', '2016-05-07 19:53:17', '2016-05-07 19:53:17'),
(55, 1, 'az', 'validation', 'required_with', 'The :attribute field is required when :values is present.', '2016-05-07 19:53:17', '2016-05-07 19:53:17'),
(56, 1, 'az', 'validation', 'required_with_all', 'The :attribute field is required when :values is present.', '2016-05-07 19:53:17', '2016-05-07 19:53:17'),
(57, 1, 'az', 'validation', 'required_without', 'The :attribute field is required when :values is not present.', '2016-05-07 19:53:17', '2016-05-07 19:53:17'),
(58, 1, 'az', 'validation', 'required_without_all', 'The :attribute field is required when none of :values are present.', '2016-05-07 19:53:17', '2016-05-07 19:53:17'),
(59, 1, 'az', 'validation', 'same', 'The :attribute and :other must match.', '2016-05-07 19:53:17', '2016-05-07 19:53:17'),
(60, 1, 'az', 'validation', 'size.numeric', 'The :attribute must be :size.', '2016-05-07 19:53:17', '2016-05-07 19:53:17'),
(61, 1, 'az', 'validation', 'size.file', 'The :attribute must be :size kilobytes.', '2016-05-07 19:53:17', '2016-05-07 19:53:17'),
(62, 1, 'az', 'validation', 'size.string', 'The :attribute must be :size characters.', '2016-05-07 19:53:17', '2016-05-07 19:53:17'),
(63, 1, 'az', 'validation', 'size.array', 'The :attribute must contain :size items.', '2016-05-07 19:53:17', '2016-05-07 19:53:17'),
(64, 1, 'az', 'validation', 'string', 'The :attribute must be a string.', '2016-05-07 19:53:17', '2016-05-07 19:53:17'),
(65, 1, 'az', 'validation', 'timezone', 'The :attribute must be a valid zone.', '2016-05-07 19:53:17', '2016-05-07 19:53:17'),
(66, 1, 'az', 'validation', 'unique', 'The :attribute has already been taken.', '2016-05-07 19:53:17', '2016-05-07 19:53:17'),
(67, 1, 'az', 'validation', 'url', 'The :attribute format is invalid.', '2016-05-07 19:53:17', '2016-05-07 19:53:17'),
(68, 1, 'az', 'validation', 'custom.attribute-name.rule-name', 'custom-message', '2016-05-07 19:53:17', '2016-05-07 19:53:17'),
(69, 1, 'en', 'auth', 'failed', 'These credentials do not match our records.', '2016-05-07 19:53:17', '2016-05-07 19:53:17'),
(70, 1, 'en', 'auth', 'throttle', 'Too many login attempts. Please try again in :seconds seconds.', '2016-05-07 19:53:17', '2016-05-07 19:53:17'),
(71, 1, 'en', 'pagination', 'previous', '&laquo; Previous', '2016-05-07 19:53:17', '2016-05-07 19:53:17'),
(72, 1, 'en', 'pagination', 'next', 'Next &raquo;', '2016-05-07 19:53:17', '2016-05-07 19:53:17'),
(73, 1, 'en', 'passwords', 'password', 'Passwords must be at least six characters and match the confirmation.', '2016-05-07 19:53:17', '2016-05-07 19:53:17'),
(74, 1, 'en', 'passwords', 'reset', 'Your password has been reset!', '2016-05-07 19:53:17', '2016-05-07 19:53:17'),
(75, 1, 'en', 'passwords', 'sent', 'We have e-mailed your password reset link!', '2016-05-07 19:53:17', '2016-05-07 19:53:17'),
(76, 1, 'en', 'passwords', 'token', 'This password reset token is invalid.', '2016-05-07 19:53:17', '2016-05-07 19:53:17'),
(77, 1, 'en', 'passwords', 'user', 'We can''t find a user with that e-mail address.', '2016-05-07 19:53:17', '2016-05-07 19:53:17'),
(78, 1, 'en', 'validation', 'accepted', 'The :attribute must be accepted.', '2016-05-07 19:53:17', '2016-05-07 19:53:17'),
(79, 1, 'en', 'validation', 'active_url', 'The :attribute is not a valid URL.', '2016-05-07 19:53:17', '2016-05-07 19:53:17'),
(80, 1, 'en', 'validation', 'after', 'The :attribute must be a date after :date.', '2016-05-07 19:53:17', '2016-05-07 19:53:17'),
(81, 1, 'en', 'validation', 'alpha', 'The :attribute may only contain letters.', '2016-05-07 19:53:17', '2016-05-07 19:53:17'),
(82, 1, 'en', 'validation', 'alpha_dash', 'The :attribute may only contain letters, numbers, and dashes.', '2016-05-07 19:53:17', '2016-05-07 19:53:17'),
(83, 1, 'en', 'validation', 'alpha_num', 'The :attribute may only contain letters and numbers.', '2016-05-07 19:53:17', '2016-05-07 19:53:17'),
(84, 1, 'en', 'validation', 'array', 'The :attribute must be an array.', '2016-05-07 19:53:17', '2016-05-07 19:53:17'),
(85, 1, 'en', 'validation', 'before', 'The :attribute must be a date before :date.', '2016-05-07 19:53:17', '2016-05-07 19:53:17'),
(86, 1, 'en', 'validation', 'between.numeric', 'The :attribute must be between :min and :max.', '2016-05-07 19:53:17', '2016-05-07 19:53:17'),
(87, 1, 'en', 'validation', 'between.file', 'The :attribute must be between :min and :max kilobytes.', '2016-05-07 19:53:17', '2016-05-07 19:53:17'),
(88, 1, 'en', 'validation', 'between.string', 'The :attribute must be between :min and :max characters.', '2016-05-07 19:53:17', '2016-05-07 19:53:17'),
(89, 1, 'en', 'validation', 'between.array', 'The :attribute must have between :min and :max items.', '2016-05-07 19:53:17', '2016-05-07 19:53:17'),
(90, 1, 'en', 'validation', 'boolean', 'The :attribute field must be true or false.', '2016-05-07 19:53:17', '2016-05-07 19:53:17'),
(91, 1, 'en', 'validation', 'confirmed', 'The :attribute confirmation does not match.', '2016-05-07 19:53:17', '2016-05-07 19:53:17'),
(92, 1, 'en', 'validation', 'date', 'The :attribute is not a valid date.', '2016-05-07 19:53:17', '2016-05-07 19:53:17'),
(93, 1, 'en', 'validation', 'date_format', 'The :attribute does not match the format :format.', '2016-05-07 19:53:17', '2016-05-07 19:53:17'),
(94, 1, 'en', 'validation', 'different', 'The :attribute and :other must be different.', '2016-05-07 19:53:17', '2016-05-07 19:53:17'),
(95, 1, 'en', 'validation', 'digits', 'The :attribute must be :digits digits.', '2016-05-07 19:53:17', '2016-05-07 19:53:17'),
(96, 1, 'en', 'validation', 'digits_between', 'The :attribute must be between :min and :max digits.', '2016-05-07 19:53:17', '2016-05-07 19:53:17'),
(97, 1, 'en', 'validation', 'distinct', 'The :attribute field has a duplicate value.', '2016-05-07 19:53:17', '2016-05-07 19:53:17'),
(98, 1, 'en', 'validation', 'email', 'The :attribute must be a valid email address.', '2016-05-07 19:53:17', '2016-05-07 19:53:17'),
(99, 1, 'en', 'validation', 'exists', 'The selected :attribute is invalid.', '2016-05-07 19:53:17', '2016-05-07 19:53:17'),
(100, 1, 'en', 'validation', 'filled', 'The :attribute field is required.', '2016-05-07 19:53:17', '2016-05-07 19:53:17'),
(101, 1, 'en', 'validation', 'image', 'The :attribute must be an image.', '2016-05-07 19:53:17', '2016-05-07 19:53:17'),
(102, 1, 'en', 'validation', 'in', 'The selected :attribute is invalid.', '2016-05-07 19:53:17', '2016-05-07 19:53:17'),
(103, 1, 'en', 'validation', 'in_array', 'The :attribute field does not exist in :other.', '2016-05-07 19:53:17', '2016-05-07 19:53:17'),
(104, 1, 'en', 'validation', 'integer', 'The :attribute must be an integer.', '2016-05-07 19:53:17', '2016-05-07 19:53:17'),
(105, 1, 'en', 'validation', 'ip', 'The :attribute must be a valid IP address.', '2016-05-07 19:53:17', '2016-05-07 19:53:17'),
(106, 1, 'en', 'validation', 'json', 'The :attribute must be a valid JSON string.', '2016-05-07 19:53:17', '2016-05-07 19:53:17'),
(107, 1, 'en', 'validation', 'max.numeric', 'The :attribute may not be greater than :max.', '2016-05-07 19:53:17', '2016-05-07 19:53:17'),
(108, 1, 'en', 'validation', 'max.file', 'The :attribute may not be greater than :max kilobytes.', '2016-05-07 19:53:17', '2016-05-07 19:53:17'),
(109, 1, 'en', 'validation', 'max.string', 'The :attribute may not be greater than :max characters.', '2016-05-07 19:53:17', '2016-05-07 19:53:17'),
(110, 1, 'en', 'validation', 'max.array', 'The :attribute may not have more than :max items.', '2016-05-07 19:53:17', '2016-05-07 19:53:17'),
(111, 1, 'en', 'validation', 'mimes', 'The :attribute must be a file of type: :values.', '2016-05-07 19:53:17', '2016-05-07 19:53:17'),
(112, 1, 'en', 'validation', 'min.numeric', 'The :attribute must be at least :min.', '2016-05-07 19:53:17', '2016-05-07 19:53:17'),
(113, 1, 'en', 'validation', 'min.file', 'The :attribute must be at least :min kilobytes.', '2016-05-07 19:53:17', '2016-05-07 19:53:17'),
(114, 1, 'en', 'validation', 'min.string', 'The :attribute must be at least :min characters.', '2016-05-07 19:53:17', '2016-05-07 19:53:17'),
(115, 1, 'en', 'validation', 'min.array', 'The :attribute must have at least :min items.', '2016-05-07 19:53:17', '2016-05-07 19:53:17'),
(116, 1, 'en', 'validation', 'not_in', 'The selected :attribute is invalid.', '2016-05-07 19:53:17', '2016-05-07 19:53:17'),
(117, 1, 'en', 'validation', 'numeric', 'The :attribute must be a number.', '2016-05-07 19:53:17', '2016-05-07 19:53:17'),
(118, 1, 'en', 'validation', 'present', 'The :attribute field must be present.', '2016-05-07 19:53:17', '2016-05-07 19:53:17'),
(119, 1, 'en', 'validation', 'regex', 'The :attribute format is invalid.', '2016-05-07 19:53:17', '2016-05-07 19:53:17'),
(120, 1, 'en', 'validation', 'required', 'The :attribute field is required.', '2016-05-07 19:53:17', '2016-05-07 19:53:17'),
(121, 1, 'en', 'validation', 'required_if', 'The :attribute field is required when :other is :value.', '2016-05-07 19:53:17', '2016-05-07 19:53:17'),
(122, 1, 'en', 'validation', 'required_unless', 'The :attribute field is required unless :other is in :values.', '2016-05-07 19:53:17', '2016-05-07 19:53:17'),
(123, 1, 'en', 'validation', 'required_with', 'The :attribute field is required when :values is present.', '2016-05-07 19:53:17', '2016-05-07 19:53:17'),
(124, 1, 'en', 'validation', 'required_with_all', 'The :attribute field is required when :values is present.', '2016-05-07 19:53:17', '2016-05-07 19:53:17'),
(125, 1, 'en', 'validation', 'required_without', 'The :attribute field is required when :values is not present.', '2016-05-07 19:53:17', '2016-05-07 19:53:17'),
(126, 1, 'en', 'validation', 'required_without_all', 'The :attribute field is required when none of :values are present.', '2016-05-07 19:53:17', '2016-05-07 19:53:17'),
(127, 1, 'en', 'validation', 'same', 'The :attribute and :other must match.', '2016-05-07 19:53:17', '2016-05-07 19:53:17'),
(128, 1, 'en', 'validation', 'size.numeric', 'The :attribute must be :size.', '2016-05-07 19:53:17', '2016-05-07 19:53:17'),
(129, 1, 'en', 'validation', 'size.file', 'The :attribute must be :size kilobytes.', '2016-05-07 19:53:17', '2016-05-07 19:53:17'),
(130, 1, 'en', 'validation', 'size.string', 'The :attribute must be :size characters.', '2016-05-07 19:53:17', '2016-05-07 19:53:17'),
(131, 1, 'en', 'validation', 'size.array', 'The :attribute must contain :size items.', '2016-05-07 19:53:17', '2016-05-07 19:53:17'),
(132, 1, 'en', 'validation', 'string', 'The :attribute must be a string.', '2016-05-07 19:53:17', '2016-05-07 19:53:17'),
(133, 1, 'en', 'validation', 'timezone', 'The :attribute must be a valid zone.', '2016-05-07 19:53:17', '2016-05-07 19:53:17'),
(134, 1, 'en', 'validation', 'unique', 'The :attribute has already been taken.', '2016-05-07 19:53:17', '2016-05-07 19:53:17'),
(135, 1, 'en', 'validation', 'url', 'The :attribute format is invalid.', '2016-05-07 19:53:17', '2016-05-07 19:53:17'),
(136, 1, 'en', 'validation', 'custom.attribute-name.rule-name', 'custom-message', '2016-05-07 19:53:17', '2016-05-07 19:53:17'),
(137, 1, 'ru', 'auth', 'failed', 'These credentials do not match our records.', '2016-05-07 19:53:17', '2016-05-07 19:53:17'),
(138, 1, 'ru', 'auth', 'throttle', 'Too many login attempts. Please try again in :seconds seconds.', '2016-05-07 19:53:17', '2016-05-07 19:53:17'),
(139, 1, 'ru', 'pagination', 'previous', '&laquo; Previous', '2016-05-07 19:53:17', '2016-05-07 19:53:17'),
(140, 1, 'ru', 'pagination', 'next', 'Next &raquo;', '2016-05-07 19:53:17', '2016-05-07 19:53:17'),
(141, 1, 'ru', 'passwords', 'password', 'Passwords must be at least six characters and match the confirmation.', '2016-05-07 19:53:17', '2016-05-07 19:53:17'),
(142, 1, 'ru', 'passwords', 'reset', 'Your password has been reset!', '2016-05-07 19:53:17', '2016-05-07 19:53:17'),
(143, 1, 'ru', 'passwords', 'sent', 'We have e-mailed your password reset link!', '2016-05-07 19:53:17', '2016-05-07 19:53:17'),
(144, 1, 'ru', 'passwords', 'token', 'This password reset token is invalid.', '2016-05-07 19:53:17', '2016-05-07 19:53:17'),
(145, 1, 'ru', 'passwords', 'user', 'We can''t find a user with that e-mail address.', '2016-05-07 19:53:17', '2016-05-07 19:53:17'),
(146, 1, 'ru', 'validation', 'accepted', 'The :attribute must be accepted.', '2016-05-07 19:53:17', '2016-05-07 19:53:17'),
(147, 1, 'ru', 'validation', 'active_url', 'The :attribute is not a valid URL.', '2016-05-07 19:53:17', '2016-05-07 19:53:17'),
(148, 1, 'ru', 'validation', 'after', 'The :attribute must be a date after :date.', '2016-05-07 19:53:17', '2016-05-07 19:53:17'),
(149, 1, 'ru', 'validation', 'alpha', 'The :attribute may only contain letters.', '2016-05-07 19:53:17', '2016-05-07 19:53:17'),
(150, 1, 'ru', 'validation', 'alpha_dash', 'The :attribute may only contain letters, numbers, and dashes.', '2016-05-07 19:53:17', '2016-05-07 19:53:17'),
(151, 1, 'ru', 'validation', 'alpha_num', 'The :attribute may only contain letters and numbers.', '2016-05-07 19:53:17', '2016-05-07 19:53:17'),
(152, 1, 'ru', 'validation', 'array', 'The :attribute must be an array.', '2016-05-07 19:53:17', '2016-05-07 19:53:17'),
(153, 1, 'ru', 'validation', 'before', 'The :attribute must be a date before :date.', '2016-05-07 19:53:17', '2016-05-07 19:53:17'),
(154, 1, 'ru', 'validation', 'between.numeric', 'The :attribute must be between :min and :max.', '2016-05-07 19:53:17', '2016-05-07 19:53:17'),
(155, 1, 'ru', 'validation', 'between.file', 'The :attribute must be between :min and :max kilobytes.', '2016-05-07 19:53:17', '2016-05-07 19:53:17'),
(156, 1, 'ru', 'validation', 'between.string', 'The :attribute must be between :min and :max characters.', '2016-05-07 19:53:17', '2016-05-07 19:53:17'),
(157, 1, 'ru', 'validation', 'between.array', 'The :attribute must have between :min and :max items.', '2016-05-07 19:53:17', '2016-05-07 19:53:17'),
(158, 1, 'ru', 'validation', 'boolean', 'The :attribute field must be true or false.', '2016-05-07 19:53:17', '2016-05-07 19:53:17'),
(159, 1, 'ru', 'validation', 'confirmed', 'The :attribute confirmation does not match.', '2016-05-07 19:53:17', '2016-05-07 19:53:17'),
(160, 1, 'ru', 'validation', 'date', 'The :attribute is not a valid date.', '2016-05-07 19:53:17', '2016-05-07 19:53:17'),
(161, 1, 'ru', 'validation', 'date_format', 'The :attribute does not match the format :format.', '2016-05-07 19:53:17', '2016-05-07 19:53:17'),
(162, 1, 'ru', 'validation', 'different', 'The :attribute and :other must be different.', '2016-05-07 19:53:17', '2016-05-07 19:53:17'),
(163, 1, 'ru', 'validation', 'digits', 'The :attribute must be :digits digits.', '2016-05-07 19:53:17', '2016-05-07 19:53:17'),
(164, 1, 'ru', 'validation', 'digits_between', 'The :attribute must be between :min and :max digits.', '2016-05-07 19:53:17', '2016-05-07 19:53:17'),
(165, 1, 'ru', 'validation', 'distinct', 'The :attribute field has a duplicate value.', '2016-05-07 19:53:17', '2016-05-07 19:53:17'),
(166, 1, 'ru', 'validation', 'email', 'The :attribute must be a valid email address.', '2016-05-07 19:53:17', '2016-05-07 19:53:17'),
(167, 1, 'ru', 'validation', 'exists', 'The selected :attribute is invalid.', '2016-05-07 19:53:17', '2016-05-07 19:53:17'),
(168, 1, 'ru', 'validation', 'filled', 'The :attribute field is required.', '2016-05-07 19:53:17', '2016-05-07 19:53:17'),
(169, 1, 'ru', 'validation', 'image', 'The :attribute must be an image.', '2016-05-07 19:53:17', '2016-05-07 19:53:17'),
(170, 1, 'ru', 'validation', 'in', 'The selected :attribute is invalid.', '2016-05-07 19:53:17', '2016-05-07 19:53:17'),
(171, 1, 'ru', 'validation', 'in_array', 'The :attribute field does not exist in :other.', '2016-05-07 19:53:17', '2016-05-07 19:53:17'),
(172, 1, 'ru', 'validation', 'integer', 'The :attribute must be an integer.', '2016-05-07 19:53:17', '2016-05-07 19:53:17'),
(173, 1, 'ru', 'validation', 'ip', 'The :attribute must be a valid IP address.', '2016-05-07 19:53:17', '2016-05-07 19:53:17'),
(174, 1, 'ru', 'validation', 'json', 'The :attribute must be a valid JSON string.', '2016-05-07 19:53:17', '2016-05-07 19:53:17'),
(175, 1, 'ru', 'validation', 'max.numeric', 'The :attribute may not be greater than :max.', '2016-05-07 19:53:17', '2016-05-07 19:53:17'),
(176, 1, 'ru', 'validation', 'max.file', 'The :attribute may not be greater than :max kilobytes.', '2016-05-07 19:53:17', '2016-05-07 19:53:17'),
(177, 1, 'ru', 'validation', 'max.string', 'The :attribute may not be greater than :max characters.', '2016-05-07 19:53:17', '2016-05-07 19:53:17'),
(178, 1, 'ru', 'validation', 'max.array', 'The :attribute may not have more than :max items.', '2016-05-07 19:53:17', '2016-05-07 19:53:17'),
(179, 1, 'ru', 'validation', 'mimes', 'The :attribute must be a file of type: :values.', '2016-05-07 19:53:17', '2016-05-07 19:53:17'),
(180, 1, 'ru', 'validation', 'min.numeric', 'The :attribute must be at least :min.', '2016-05-07 19:53:17', '2016-05-07 19:53:17'),
(181, 1, 'ru', 'validation', 'min.file', 'The :attribute must be at least :min kilobytes.', '2016-05-07 19:53:17', '2016-05-07 19:53:17'),
(182, 1, 'ru', 'validation', 'min.string', 'The :attribute must be at least :min characters.', '2016-05-07 19:53:17', '2016-05-07 19:53:17'),
(183, 1, 'ru', 'validation', 'min.array', 'The :attribute must have at least :min items.', '2016-05-07 19:53:17', '2016-05-07 19:53:17'),
(184, 1, 'ru', 'validation', 'not_in', 'The selected :attribute is invalid.', '2016-05-07 19:53:17', '2016-05-07 19:53:17'),
(185, 1, 'ru', 'validation', 'numeric', 'The :attribute must be a number.', '2016-05-07 19:53:17', '2016-05-07 19:53:17'),
(186, 1, 'ru', 'validation', 'present', 'The :attribute field must be present.', '2016-05-07 19:53:17', '2016-05-07 19:53:17'),
(187, 1, 'ru', 'validation', 'regex', 'The :attribute format is invalid.', '2016-05-07 19:53:17', '2016-05-07 19:53:17'),
(188, 1, 'ru', 'validation', 'required', 'The :attribute field is required.', '2016-05-07 19:53:17', '2016-05-07 19:53:17'),
(189, 1, 'ru', 'validation', 'required_if', 'The :attribute field is required when :other is :value.', '2016-05-07 19:53:17', '2016-05-07 19:53:17'),
(190, 1, 'ru', 'validation', 'required_unless', 'The :attribute field is required unless :other is in :values.', '2016-05-07 19:53:17', '2016-05-07 19:53:17'),
(191, 1, 'ru', 'validation', 'required_with', 'The :attribute field is required when :values is present.', '2016-05-07 19:53:17', '2016-05-07 19:53:17'),
(192, 1, 'ru', 'validation', 'required_with_all', 'The :attribute field is required when :values is present.', '2016-05-07 19:53:17', '2016-05-07 19:53:17'),
(193, 1, 'ru', 'validation', 'required_without', 'The :attribute field is required when :values is not present.', '2016-05-07 19:53:17', '2016-05-07 19:53:17'),
(194, 1, 'ru', 'validation', 'required_without_all', 'The :attribute field is required when none of :values are present.', '2016-05-07 19:53:17', '2016-05-07 19:53:17'),
(195, 1, 'ru', 'validation', 'same', 'The :attribute and :other must match.', '2016-05-07 19:53:17', '2016-05-07 19:53:17'),
(196, 1, 'ru', 'validation', 'size.numeric', 'The :attribute must be :size.', '2016-05-07 19:53:17', '2016-05-07 19:53:17'),
(197, 1, 'ru', 'validation', 'size.file', 'The :attribute must be :size kilobytes.', '2016-05-07 19:53:17', '2016-05-07 19:53:17'),
(198, 1, 'ru', 'validation', 'size.string', 'The :attribute must be :size characters.', '2016-05-07 19:53:17', '2016-05-07 19:53:17'),
(199, 1, 'ru', 'validation', 'size.array', 'The :attribute must contain :size items.', '2016-05-07 19:53:18', '2016-05-07 19:53:18'),
(200, 1, 'ru', 'validation', 'string', 'The :attribute must be a string.', '2016-05-07 19:53:18', '2016-05-07 19:53:18'),
(201, 1, 'ru', 'validation', 'timezone', 'The :attribute must be a valid zone.', '2016-05-07 19:53:18', '2016-05-07 19:53:18'),
(202, 1, 'ru', 'validation', 'unique', 'The :attribute has already been taken.', '2016-05-07 19:53:18', '2016-05-07 19:53:18'),
(203, 1, 'ru', 'validation', 'url', 'The :attribute format is invalid.', '2016-05-07 19:53:18', '2016-05-07 19:53:18'),
(204, 1, 'ru', 'validation', 'custom.attribute-name.rule-name', 'custom-message', '2016-05-07 19:53:18', '2016-05-07 19:53:18');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `email`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Teymur', 'teymur647', 'teymur.veliyev001@gmail.com', '$2y$10$MbMhJnWSbSTz9/J/zQ48b.UZpqrglXfXV4neoToF7l8J7xuP9b9HW', 'jGWGaPURd12d7BSGYN0XdyuABDWeenru4HqvDD9xKOd2pD6SVGTVrUx3ohWq', '2016-05-07 16:42:29', '2016-05-07 20:12:51'),
(2, 'Eziz', '@ziz', 'aziz.azizzadeh@gmail.com', '$2y$10$WCh8cq99GQIhIrXoVTu5WelJuzEnHxUp3knwTZ8LhgLmlAvjc0Yc6', 'onmCyr4CBh4oIcfm3zupertmGQC4CKG9Wo6XdmaTd72eK9qijjZ3UOMGAAcj', '2016-05-07 16:42:29', '2016-05-07 20:12:32');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`),
  ADD KEY `password_resets_token_index` (`token`);

--
-- Индексы таблицы `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_unique` (`name`);

--
-- Индексы таблицы `permission_role`
--
ALTER TABLE `permission_role`
  ADD PRIMARY KEY (`role_id`,`permission_id`),
  ADD KEY `permission_role_permission_id_foreign` (`permission_id`);

--
-- Индексы таблицы `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_unique` (`name`);

--
-- Индексы таблицы `role_user`
--
ALTER TABLE `role_user`
  ADD PRIMARY KEY (`role_id`,`user_id`),
  ADD KEY `role_user_user_id_foreign` (`user_id`);

--
-- Индексы таблицы `translations`
--
ALTER TABLE `translations`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_username_unique` (`username`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT для таблицы `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT для таблицы `translations`
--
ALTER TABLE `translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=205;
--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `permission_role`
--
ALTER TABLE `permission_role`
  ADD CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `role_user`
--
ALTER TABLE `role_user`
  ADD CONSTRAINT `role_user_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
