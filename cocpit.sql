-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1
-- Üretim Zamanı: 05 Eyl 2019, 10:02:55
-- Sunucu sürümü: 10.1.39-MariaDB
-- PHP Sürümü: 7.3.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `cocpit`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `article_has_attachments`
--

CREATE TABLE `article_has_attachments` (
  `id` bigint(20) NOT NULL,
  `article_id` bigint(20) DEFAULT NULL,
  `filename` varchar(250) DEFAULT NULL,
  `savename` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `attributes`
--

CREATE TABLE `attributes` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `active` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `attributes`
--

INSERT INTO `attributes` (`id`, `name`, `active`) VALUES
(4, 'üretime hazır', 1),
(5, 'hazır', 1);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `attribute_value`
--

CREATE TABLE `attribute_value` (
  `id` int(11) NOT NULL,
  `value` varchar(255) NOT NULL,
  `attribute_parent_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `attribute_value`
--

INSERT INTO `attribute_value` (`id`, `value`, `attribute_parent_id`) VALUES
(5, 'Blue', 2),
(6, 'White', 2),
(7, 'M', 3),
(8, 'L', 3),
(9, 'Green', 2),
(10, 'Black', 2),
(12, 'Grey', 2),
(13, 'S', 3),
(14, 'üretim etiketi', 4),
(15, 'istediğin değer :)', 5);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `brands`
--

CREATE TABLE `brands` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `active` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `brands`
--

INSERT INTO `brands` (`id`, `name`, `active`) VALUES
(4, 'ABC Inc.', 1),
(5, 'Akcelep Salata', 1);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `active` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `categories`
--

INSERT INTO `categories` (`id`, `name`, `active`) VALUES
(4, 'Microscope', 1),
(5, 'Üretim', 1);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `clients`
--

CREATE TABLE `clients` (
  `id` int(11) NOT NULL,
  `company_id` int(140) DEFAULT NULL,
  `firstname` varchar(100) DEFAULT NULL,
  `lastname` varchar(100) DEFAULT NULL,
  `email` varchar(180) DEFAULT NULL,
  `phone` varchar(25) DEFAULT NULL,
  `mobile` varchar(25) DEFAULT NULL,
  `address` varchar(150) DEFAULT NULL,
  `zipcode` varchar(30) DEFAULT NULL,
  `userpic` varchar(150) DEFAULT 'no-pic.png',
  `city` varchar(45) DEFAULT NULL,
  `hashed_password` varchar(255) DEFAULT NULL,
  `inactive` tinyint(4) DEFAULT '0',
  `access` varchar(150) DEFAULT '0',
  `last_active` varchar(50) DEFAULT NULL,
  `last_login` varchar(50) DEFAULT NULL,
  `twitter` varchar(255) DEFAULT NULL,
  `skype` varchar(255) DEFAULT NULL,
  `linkedin` varchar(255) DEFAULT NULL,
  `facebook` varchar(255) DEFAULT NULL,
  `instagram` varchar(255) DEFAULT NULL,
  `googleplus` varchar(255) DEFAULT NULL,
  `youtube` varchar(255) DEFAULT NULL,
  `pinterest` varchar(255) DEFAULT NULL,
  `token` varchar(255) DEFAULT NULL,
  `language` varchar(255) DEFAULT NULL,
  `signature` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `clients`
--

INSERT INTO `clients` (`id`, `company_id`, `firstname`, `lastname`, `email`, `phone`, `mobile`, `address`, `zipcode`, `userpic`, `city`, `hashed_password`, `inactive`, `access`, `last_active`, `last_login`, `twitter`, `skype`, `linkedin`, `facebook`, `instagram`, `googleplus`, `youtube`, `pinterest`, `token`, `language`, `signature`) VALUES
(1, 2, 'Erdogan', 'Abacı', 'erdoganabaci97@gmail.com', '+905518005753', '+905518005753', '202/42sok No:4 Daire:40 Buca/Izmir', '35390', 'f99b154cc33c2e4a6a95f68dbc2f3d88.jpg', 'izmir', '262877326d4223386f402d2447443d357d3841716d764f315e6d4b2656342c715beb0d5c6b5c35c00d4e6ce06e27b94cf063a7e931ac23290b06af75a73a2015', 0, '103,101,102,107,104,106', NULL, NULL, '', '', '', '', '', '', '', '', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `companies`
--

CREATE TABLE `companies` (
  `id` int(11) NOT NULL,
  `reference` int(11) NOT NULL,
  `name` varchar(140) DEFAULT NULL,
  `client_id` varchar(140) DEFAULT NULL,
  `phone` varchar(25) DEFAULT NULL,
  `mobile` varchar(25) DEFAULT NULL,
  `address` varchar(150) DEFAULT NULL,
  `zipcode` varchar(30) NOT NULL,
  `city` varchar(45) DEFAULT NULL,
  `inactive` tinyint(4) DEFAULT '0',
  `website` varchar(250) DEFAULT NULL,
  `country` varchar(250) DEFAULT NULL,
  `vat` varchar(250) DEFAULT NULL,
  `note` longtext,
  `province` varchar(255) DEFAULT NULL,
  `twitter` varchar(255) DEFAULT NULL,
  `skype` varchar(255) DEFAULT NULL,
  `linkedin` varchar(255) DEFAULT NULL,
  `facebook` varchar(255) DEFAULT NULL,
  `instagram` varchar(255) DEFAULT NULL,
  `googleplus` varchar(255) DEFAULT NULL,
  `youtube` varchar(255) DEFAULT NULL,
  `pinterest` varchar(255) DEFAULT NULL,
  `terms` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `companies`
--

INSERT INTO `companies` (`id`, `reference`, `name`, `client_id`, `phone`, `mobile`, `address`, `zipcode`, `city`, `inactive`, `website`, `country`, `vat`, `note`, `province`, `twitter`, `skype`, `linkedin`, `facebook`, `instagram`, `googleplus`, `youtube`, `pinterest`, `terms`) VALUES
(1, 41001, 'Akcalep', NULL, '45645646', '54656', 'sfaçlsaflkşşsalfşlsaffsa', '45666', 'izmir', 0, 'http://erdoganabaci.biz', 'Turkey', '12455', NULL, 'İzmir', '', '', '', '', 'Erdogan Abacı', '', '', '', '<p>Tüm koşullarımız gizlidir</p>'),
(2, 41002, 'Carrera', '1', '44846645456645', '545454546', 'Bayraklı', '36589', 'İzmir', 0, '', 'Turkey', '6989899', '&lt;pre&gt;&lt;span style=&quot;background-color: rgb(255, 255, 0); font-size: 36px;&quot;&gt;&lt;b&gt;Acil Yapın!!&lt;/b&gt;&lt;/span&gt;&lt;span style=&quot;font-size: 36px;&quot;&gt;﻿&lt;/span&gt;&lt;/pre&gt;', 'İzmir', '', '', 'erdoganabaci/', '', '', '', '', '', 'Her Hakkı Saklıdır.Veri Gizliliği Vardır.');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `company_has_admins`
--

CREATE TABLE `company_has_admins` (
  `id` int(10) NOT NULL,
  `company_id` int(10) DEFAULT NULL,
  `user_id` int(10) DEFAULT NULL,
  `access` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `company_has_admins`
--

INSERT INTO `company_has_admins` (`id`, `company_id`, `user_id`, `access`) VALUES
(1, 1, 1, NULL),
(2, 2, 1, NULL);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `core`
--

CREATE TABLE `core` (
  `id` int(11) NOT NULL,
  `version` char(10) NOT NULL DEFAULT '0',
  `domain` varchar(65) DEFAULT NULL,
  `email` varchar(80) DEFAULT NULL,
  `company` varchar(100) DEFAULT NULL,
  `tax` varchar(5) DEFAULT NULL,
  `second_tax` varchar(5) DEFAULT NULL,
  `currency` varchar(20) DEFAULT NULL,
  `autobackup` int(11) DEFAULT NULL,
  `cronjob` int(11) DEFAULT NULL,
  `last_cronjob` int(11) DEFAULT NULL,
  `last_autobackup` int(11) DEFAULT NULL,
  `invoice_terms` mediumtext,
  `company_reference` int(6) DEFAULT NULL,
  `project_reference` int(6) DEFAULT NULL,
  `invoice_reference` int(6) DEFAULT NULL,
  `subscription_reference` int(6) DEFAULT NULL,
  `ticket_reference` int(10) DEFAULT NULL,
  `date_format` varchar(20) DEFAULT NULL,
  `date_time_format` varchar(20) DEFAULT NULL,
  `invoice_mail_subject` varchar(150) DEFAULT NULL,
  `pw_reset_mail_subject` varchar(150) DEFAULT NULL,
  `pw_reset_link_mail_subject` varchar(150) DEFAULT NULL,
  `credentials_mail_subject` varchar(150) DEFAULT NULL,
  `notification_mail_subject` varchar(150) DEFAULT NULL,
  `language` varchar(150) DEFAULT NULL,
  `invoice_address` varchar(200) DEFAULT NULL,
  `invoice_city` varchar(200) DEFAULT NULL,
  `invoice_contact` varchar(200) DEFAULT NULL,
  `invoice_tel` varchar(50) DEFAULT NULL,
  `subscription_mail_subject` varchar(250) DEFAULT NULL,
  `logo` varchar(150) DEFAULT NULL,
  `template` varchar(200) DEFAULT 'default',
  `paypal` varchar(5) DEFAULT '1',
  `paypal_currency` varchar(200) DEFAULT 'EUR',
  `paypal_account` varchar(200) DEFAULT 'luxsys@luxsys-apps.com',
  `invoice_logo` varchar(150) DEFAULT 'assets/blackline/img/invoice_logo.png',
  `pc` varchar(150) DEFAULT NULL,
  `vat` varchar(150) DEFAULT NULL,
  `ticket_email` varchar(250) DEFAULT NULL,
  `ticket_default_owner` int(10) DEFAULT '1',
  `ticket_default_queue` int(10) DEFAULT '1',
  `ticket_default_type` int(10) DEFAULT '1',
  `ticket_default_status` varchar(200) DEFAULT 'new',
  `ticket_config_host` varchar(250) DEFAULT NULL,
  `ticket_config_login` varchar(250) DEFAULT NULL,
  `ticket_config_pass` varchar(250) DEFAULT NULL,
  `ticket_config_port` varchar(250) DEFAULT NULL,
  `ticket_config_ssl` varchar(250) DEFAULT NULL,
  `ticket_config_email` varchar(250) DEFAULT NULL,
  `ticket_config_flags` varchar(250) DEFAULT '/notls',
  `ticket_config_search` varchar(250) DEFAULT 'UNSEEN',
  `ticket_config_timestamp` int(11) DEFAULT NULL,
  `ticket_config_mailbox` varchar(250) DEFAULT NULL,
  `ticket_config_delete` int(11) DEFAULT NULL,
  `ticket_config_active` int(11) DEFAULT NULL,
  `ticket_config_imap` int(11) DEFAULT '1',
  `stripe` int(11) DEFAULT '0',
  `stripe_key` varchar(250) DEFAULT NULL,
  `stripe_p_key` varchar(255) DEFAULT NULL,
  `bank_transfer` int(11) DEFAULT NULL,
  `bank_transfer_text` longtext,
  `stripe_currency` varchar(255) NOT NULL DEFAULT 'USD',
  `estimate_terms` longtext,
  `estimate_prefix` varchar(255) NOT NULL DEFAULT 'EST',
  `estimate_pdf_template` varchar(255) NOT NULL DEFAULT 'templates/estimate/default',
  `invoice_pdf_template` varchar(255) NOT NULL DEFAULT 'invoices/preview',
  `estimate_mail_subject` varchar(255) NOT NULL DEFAULT 'New Estimate #{estimate_id}',
  `money_currency_position` int(5) NOT NULL DEFAULT '1',
  `money_format` int(5) NOT NULL DEFAULT '1',
  `pdf_font` varchar(255) NOT NULL DEFAULT 'NotoSans',
  `pdf_path` int(10) NOT NULL DEFAULT '1',
  `registration` int(10) NOT NULL DEFAULT '0',
  `authorize_api_login_id` varchar(255) DEFAULT NULL,
  `authorize_api_transaction_key` varchar(255) DEFAULT NULL,
  `authorize_net` int(20) DEFAULT '0',
  `authorize_currency` varchar(30) DEFAULT NULL,
  `invoice_prefix` varchar(255) DEFAULT NULL,
  `company_prefix` varchar(255) DEFAULT NULL,
  `quotation_prefix` varchar(255) DEFAULT NULL,
  `project_prefix` varchar(255) DEFAULT NULL,
  `subscription_prefix` varchar(255) DEFAULT NULL,
  `calendar_google_api_key` varchar(255) DEFAULT NULL,
  `calendar_google_event_address` varchar(255) DEFAULT NULL,
  `default_client_modules` varchar(255) DEFAULT NULL,
  `estimate_reference` int(10) DEFAULT '0',
  `login_background` varchar(255) DEFAULT 'blur.jpg',
  `custom_colors` int(1) DEFAULT '1',
  `top_bar_background` varchar(60) DEFAULT '#FFFFFF',
  `top_bar_color` varchar(60) DEFAULT '#333333',
  `body_background` varchar(60) DEFAULT '#e3e6ed',
  `menu_background` varchar(60) DEFAULT '#173240',
  `menu_color` varchar(60) DEFAULT '#FFFFFF',
  `primary_color` varchar(60) DEFAULT '#356cc9',
  `twocheckout_seller_id` varchar(250) DEFAULT NULL,
  `twocheckout_publishable_key` varchar(250) DEFAULT NULL,
  `twocheckout_private_key` varchar(250) DEFAULT NULL,
  `twocheckout` int(11) DEFAULT '0',
  `twocheckout_currency` varchar(250) DEFAULT NULL,
  `login_logo` varchar(255) DEFAULT NULL,
  `login_style` varchar(255) DEFAULT 'left',
  `reference_lenght` int(20) DEFAULT NULL,
  `stripe_ideal` int(1) DEFAULT NULL,
  `zip_position` varchar(60) DEFAULT 'left',
  `timezone` varchar(255) DEFAULT NULL,
  `notifications` int(1) UNSIGNED DEFAULT '0',
  `last_notification` varchar(100) DEFAULT NULL,
  `receipt_mail_subject` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `core`
--

INSERT INTO `core` (`id`, `version`, `domain`, `email`, `company`, `tax`, `second_tax`, `currency`, `autobackup`, `cronjob`, `last_cronjob`, `last_autobackup`, `invoice_terms`, `company_reference`, `project_reference`, `invoice_reference`, `subscription_reference`, `ticket_reference`, `date_format`, `date_time_format`, `invoice_mail_subject`, `pw_reset_mail_subject`, `pw_reset_link_mail_subject`, `credentials_mail_subject`, `notification_mail_subject`, `language`, `invoice_address`, `invoice_city`, `invoice_contact`, `invoice_tel`, `subscription_mail_subject`, `logo`, `template`, `paypal`, `paypal_currency`, `paypal_account`, `invoice_logo`, `pc`, `vat`, `ticket_email`, `ticket_default_owner`, `ticket_default_queue`, `ticket_default_type`, `ticket_default_status`, `ticket_config_host`, `ticket_config_login`, `ticket_config_pass`, `ticket_config_port`, `ticket_config_ssl`, `ticket_config_email`, `ticket_config_flags`, `ticket_config_search`, `ticket_config_timestamp`, `ticket_config_mailbox`, `ticket_config_delete`, `ticket_config_active`, `ticket_config_imap`, `stripe`, `stripe_key`, `stripe_p_key`, `bank_transfer`, `bank_transfer_text`, `stripe_currency`, `estimate_terms`, `estimate_prefix`, `estimate_pdf_template`, `invoice_pdf_template`, `estimate_mail_subject`, `money_currency_position`, `money_format`, `pdf_font`, `pdf_path`, `registration`, `authorize_api_login_id`, `authorize_api_transaction_key`, `authorize_net`, `authorize_currency`, `invoice_prefix`, `company_prefix`, `quotation_prefix`, `project_prefix`, `subscription_prefix`, `calendar_google_api_key`, `calendar_google_event_address`, `default_client_modules`, `estimate_reference`, `login_background`, `custom_colors`, `top_bar_background`, `top_bar_color`, `body_background`, `menu_background`, `menu_color`, `primary_color`, `twocheckout_seller_id`, `twocheckout_publishable_key`, `twocheckout_private_key`, `twocheckout`, `twocheckout_currency`, `login_logo`, `login_style`, `reference_lenght`, `stripe_ideal`, `zip_position`, `timezone`, `notifications`, `last_notification`, `receipt_mail_subject`) VALUES
(1, '3.3.1', 'http://localhost:8080/cocpit/', 'erdoganabaci97@gmail.com', 'webfirmam', '0', '', 'USD', 1, 1, 1566811956, 1566811956, 'Thank you for your business. We do expect payment within {due_date}, so please process this invoice within that time.', 41003, 51006, 31003, 61002, 10003, 'Y/m/d', 'g:i A', 'New Invoice', 'Password Reset', 'Password Reset', 'Login Details', 'Notification', 'turkish', 'dfsfsd', 'izmir', '432424', '324242', 'New Subscription', 'assets/blueline/images/FC2_logo_light.png', 'blueline', '0', 'USD', '', 'assets/blueline/images/FC2_logo_dark.png', 'nulled', '', NULL, 1, 1, 1, 'new', NULL, NULL, NULL, NULL, NULL, NULL, '/notls', 'UNSEEN', NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, 'USD', '', 'EST', 'templates/estimate/default', 'invoices/preview', 'New Estimate #{estimate_id}', 1, 1, 'NotoSans', 1, 0, NULL, NULL, 0, NULL, '', '', '', '', '', NULL, NULL, NULL, 20001, 'city.jpg', 1, '#ffffff', '#333333', '#e3e6ed', '#173240', '#ffffff', '#356cc9', NULL, NULL, NULL, 0, NULL, 'files/media/google.png', 'left', NULL, NULL, 'left', 'Australia/Adelaide', 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `custom_quotations`
--

CREATE TABLE `custom_quotations` (
  `id` int(10) NOT NULL,
  `name` varchar(250) DEFAULT NULL,
  `formcontent` longtext,
  `inactive` int(250) DEFAULT '0',
  `user_id` int(11) DEFAULT NULL,
  `created` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `custom_quotations`
--

INSERT INTO `custom_quotations` (`id`, `name`, `formcontent`, `inactive`, `user_id`, `created`) VALUES
(1, 'Erdogan Abacı', '{\"fields\":[{\"label\":\"Untitled\",\"field_type\":\"text\",\"required\":true,\"field_options\":{\"size\":\"small\"},\"cid\":\"c6\"},{\"label\":\"Untitled\",\"field_type\":\"text\",\"required\":true,\"field_options\":{\"size\":\"small\"},\"cid\":\"c2\"},{\"label\":\"Untitled\",\"field_type\":\"section_break\",\"required\":true,\"field_options\":{},\"cid\":\"c10\"}]}', 0, 1, NULL);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `custom_quotation_requests`
--

CREATE TABLE `custom_quotation_requests` (
  `id` int(10) NOT NULL,
  `form` longtext,
  `custom_quotation_id` int(11) DEFAULT NULL,
  `date` varchar(50) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `user_id` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `events`
--

CREATE TABLE `events` (
  `id` bigint(20) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` text,
  `allday` varchar(30) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `classname` varchar(255) DEFAULT NULL,
  `start` varchar(255) DEFAULT NULL,
  `end` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT '0',
  `access` varchar(255) DEFAULT NULL,
  `reminder` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `events`
--

INSERT INTO `events` (`id`, `title`, `description`, `allday`, `url`, `classname`, `start`, `end`, `user_id`, `access`, `reminder`) VALUES
(1, 'Acil Hammadde Stoğu ', 'hammadde Stoğu Azaldı Acill', NULL, NULL, 'bgColor1', '2019-08-27 12:00', '2019-08-31 12:00', 1, NULL, NULL),
(2, 'hammadde bitti çabukj alın', 'acilll', NULL, NULL, 'bgColor4', '2019-09-02 12:00', '2019-08-06 12:00', 1, NULL, NULL),
(3, 'sallama', 'gdgdsggsdsdg', NULL, NULL, 'bgColor14', '2019-10-01 12:00', '2019-10-09 12:00', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `expenses`
--

CREATE TABLE `expenses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `category` varchar(255) DEFAULT NULL,
  `date` varchar(255) DEFAULT NULL,
  `currency` varchar(255) DEFAULT NULL,
  `value` float(20,2) DEFAULT '0.00',
  `vat` varchar(255) DEFAULT NULL,
  `reference` varchar(255) DEFAULT NULL,
  `project_id` bigint(20) DEFAULT '0',
  `rebill` int(20) DEFAULT '0',
  `invoice_id` bigint(20) DEFAULT '0',
  `attachment` varchar(255) DEFAULT NULL,
  `attachment_description` varchar(255) DEFAULT NULL,
  `recurring` varchar(255) DEFAULT NULL,
  `recurring_until` varchar(255) DEFAULT NULL,
  `user_id` int(20) DEFAULT '0',
  `expense_id` int(20) DEFAULT '0',
  `next_payment` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `expenses`
--

INSERT INTO `expenses` (`id`, `description`, `type`, `category`, `date`, `currency`, `value`, `vat`, `reference`, `project_id`, `rebill`, `invoice_id`, `attachment`, `attachment_description`, `recurring`, `recurring_until`, `user_id`, `expense_id`, `next_payment`, `status`) VALUES
(1, 'Bilgisayar anakart yandı', 'payment', 'Computer Hardware', '2019-08-25', 'TRY', 50.00, '12', '51001', 1, 1, 0, '60f218bdacd932d66a37748d37afcd4a.xlsx', 'Akcelep Excel ', '+1 month', '', 1, 0, NULL, 'Open'),
(2, 'Telefon Alındı', 'payment', 'Cell Phone', '2019-08-26', 'USD', 30.00, '', '', 0, 0, 0, NULL, NULL, '+1 month', '', 2, 0, NULL, 'Open');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `invoices`
--

CREATE TABLE `invoices` (
  `id` int(11) NOT NULL,
  `sum` float NOT NULL DEFAULT '0',
  `estimate_sent` varchar(255) NOT NULL DEFAULT '0',
  `estimate_status` varchar(255) NOT NULL DEFAULT '0',
  `project_id` int(11) DEFAULT '0',
  `reference` int(11) DEFAULT '0',
  `company_id` int(11) DEFAULT '0',
  `status` varchar(50) DEFAULT NULL,
  `currency` varchar(20) DEFAULT NULL,
  `issue_date` varchar(20) DEFAULT NULL,
  `due_date` varchar(20) DEFAULT NULL,
  `sent_date` varchar(20) DEFAULT NULL,
  `paid_date` varchar(20) DEFAULT NULL,
  `terms` mediumtext,
  `discount` varchar(50) DEFAULT NULL,
  `subscription_id` varchar(50) DEFAULT NULL,
  `tax` varchar(255) DEFAULT NULL,
  `second_tax` varchar(5) DEFAULT NULL,
  `estimate` int(11) DEFAULT '0',
  `estimate_accepted_date` varchar(255) DEFAULT NULL,
  `paid` float DEFAULT '0',
  `outstanding` float DEFAULT NULL,
  `estimate_reference` int(10) DEFAULT '0',
  `po_number` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `invoices`
--

INSERT INTO `invoices` (`id`, `sum`, `estimate_sent`, `estimate_status`, `project_id`, `reference`, `company_id`, `status`, `currency`, `issue_date`, `due_date`, `sent_date`, `paid_date`, `terms`, `discount`, `subscription_id`, `tax`, `second_tax`, `estimate`, `estimate_accepted_date`, `paid`, `outstanding`, `estimate_reference`, `po_number`) VALUES
(1, -11, '0', 'Open', 2, 0, 1, 'Open', 'USD', '2019-08-27', '2019-08-30', NULL, NULL, '<p><b><i>Her Hakkı Saklıdır yeni hesap oluşturma deneme</i></b></p>', '10', NULL, '10', '', 1, NULL, 0, NULL, 20000, NULL),
(2, 0, '0', '0', 2, 31001, 1, 'Open', 'USD', '2019-08-27', '2019-08-31', NULL, NULL, 'Thank you for your business. We do expect payment within {due_date}, so please process this invoice within that time.', '5', NULL, '0', '', 0, NULL, 0, NULL, 0, 'Salatalık Alındı'),
(3, -10, '0', '0', 3, 31002, 2, 'Open', 'USD', '2019-08-27', '2019-08-30', NULL, NULL, 'Thank you for your business. We do expect payment within {due_date}, so please process this invoice within that time.', '10', NULL, '0', '', 0, NULL, 0, -10, 0, 'Fitness');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `invoice_has_items`
--

CREATE TABLE `invoice_has_items` (
  `id` int(10) NOT NULL,
  `invoice_id` int(11) DEFAULT '0',
  `item_id` int(11) DEFAULT '0',
  `amount` char(11) DEFAULT NULL,
  `description` mediumtext,
  `value` float DEFAULT '0',
  `name` varchar(250) DEFAULT NULL,
  `type` varchar(250) DEFAULT NULL,
  `task_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `invoice_has_payments`
--

CREATE TABLE `invoice_has_payments` (
  `id` bigint(20) NOT NULL,
  `invoice_id` bigint(20) DEFAULT '0',
  `reference` varchar(255) DEFAULT NULL,
  `amount` float DEFAULT '0',
  `date` varchar(20) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `notes` text,
  `user_id` bigint(20) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `items`
--

CREATE TABLE `items` (
  `id` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `value` float DEFAULT '0',
  `type` varchar(45) DEFAULT NULL,
  `inactive` tinyint(4) DEFAULT '0',
  `description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `items`
--

INSERT INTO `items` (`id`, `name`, `value`, `type`, `inactive`, `description`) VALUES
(1, 'Erdogan Abacı', 50, 'DAğıtım', 0, 'Dağıtım Bileşenidir'),
(2, 'Fitness', 100, 'DAğıtım', 0, 'Spor ');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `leads`
--

CREATE TABLE `leads` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `status_id` bigint(20) DEFAULT '0',
  `source` varchar(250) DEFAULT NULL,
  `name` varchar(250) DEFAULT NULL,
  `position` varchar(250) DEFAULT NULL,
  `address` varchar(250) DEFAULT NULL,
  `city` varchar(250) DEFAULT NULL,
  `state` varchar(250) DEFAULT NULL,
  `country` varchar(250) DEFAULT NULL,
  `zipcode` varchar(250) DEFAULT NULL,
  `language` varchar(250) DEFAULT NULL,
  `email` varchar(250) DEFAULT NULL,
  `website` varchar(250) DEFAULT NULL,
  `phone` varchar(250) DEFAULT NULL,
  `mobile` varchar(250) DEFAULT NULL,
  `company` varchar(250) DEFAULT NULL,
  `tags` varchar(255) DEFAULT '',
  `description` text,
  `first_contact` varchar(250) DEFAULT NULL,
  `last_contact` varchar(250) DEFAULT NULL,
  `valid_until` varchar(250) DEFAULT NULL,
  `created` varchar(20) DEFAULT NULL,
  `modified` varchar(20) DEFAULT NULL,
  `private` varchar(20) DEFAULT '0',
  `custom` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT '0',
  `icon` varchar(255) DEFAULT NULL,
  `order` float DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `leads`
--

INSERT INTO `leads` (`id`, `status_id`, `source`, `name`, `position`, `address`, `city`, `state`, `country`, `zipcode`, `language`, `email`, `website`, `phone`, `mobile`, `company`, `tags`, `description`, `first_contact`, `last_contact`, `valid_until`, `created`, `modified`, `private`, `custom`, `user_id`, `icon`, `order`) VALUES
(1, 2, 'Facebook', 'dssda', 'sfafsa', '202/42sok No:4 Daire:40 Buca/Izmir', 'izmir', 'İzmir', 'Turkey', '35390', NULL, 'erdoganabaci97@gmail.com', 'http://erdoganabaci.biz', '+905518005753', '', 'd', 'acil,hızlı', '					', NULL, NULL, NULL, '2019-08-26 18:52', '2019-09-02 02:59', '0', NULL, 1, '', 15),
(2, 1, 'fsfas', 'Erdogan Abacı', 'fsafs', '202/42sok No:4 Daire:40 Buca/Izmir', 'izmir', 'İzmir', 'Turkey', '35390', NULL, 'erdoganabaci97@gmail.com', 'http://erdoganabaci.biz', '+905518005753', '3232523', 'd', '', 'ads', NULL, NULL, NULL, '2019-08-26 18:52', '2019-08-26 18:52', '0', NULL, 1, NULL, -45);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `lead_has_comments`
--

CREATE TABLE `lead_has_comments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `attachment` varchar(250) DEFAULT NULL,
  `attachment_link` varchar(250) DEFAULT NULL,
  `datetime` varchar(250) DEFAULT NULL,
  `message` text,
  `user_id` bigint(20) DEFAULT '0',
  `lead_id` bigint(20) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `lead_status`
--

CREATE TABLE `lead_status` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(250) DEFAULT NULL,
  `description` text,
  `order` float DEFAULT '0',
  `offset` bigint(200) DEFAULT '0',
  `limit` bigint(200) DEFAULT '50',
  `color` varchar(100) DEFAULT '#5071ab'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `lead_status`
--

INSERT INTO `lead_status` (`id`, `name`, `description`, `order`, `offset`, `limit`, `color`) VALUES
(1, 'Erdogan Abacı', '<p>hfhfdhhfddhhd</p>', 1, 0, 50, '#1261cb'),
(2, 'saddsasd', '<p>safasffas</p>', 2, 0, 50, '#1261cb');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `messages`
--

CREATE TABLE `messages` (
  `id` int(11) NOT NULL,
  `project_id` int(11) DEFAULT '0',
  `media_id` int(11) DEFAULT '0',
  `from` varchar(120) DEFAULT NULL,
  `text` text,
  `datetime` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `migrations`
--

CREATE TABLE `migrations` (
  `version` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `migrations`
--

INSERT INTO `migrations` (`version`) VALUES
(44);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `modules`
--

CREATE TABLE `modules` (
  `id` int(10) NOT NULL,
  `name` varchar(250) DEFAULT NULL,
  `link` varchar(250) DEFAULT NULL,
  `type` varchar(250) DEFAULT NULL,
  `icon` varchar(150) DEFAULT NULL,
  `sort` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `modules`
--

INSERT INTO `modules` (`id`, `name`, `link`, `type`, `icon`, `sort`) VALUES
(1, 'Dashboard', 'dashboard', 'main', 'icon dripicons-meter', 1),
(2, 'Messages', 'messages', 'main', 'icon dripicons-message', 2),
(3, 'Projects', 'projects', 'main', 'icon dripicons-rocket', 3),
(4, 'Clients', 'clients', 'main', 'icon dripicons-user', 4),
(5, 'Invoices', 'invoices', 'main', 'icon dripicons-document', 5),
(6, 'Items', 'items', 'main', 'icon dripicons-shopping-bag', 7),
(7, 'Quotations', 'quotations', 'main', 'icon dripicons-blog', 8),
(8, 'Subscriptions', 'subscriptions', 'main', 'icon dripicons-retweet', 6),
(9, 'Settings', 'settings', 'main', 'icon dripicons-toggles', 20),
(10, 'QuickAccess', 'quickaccess', 'widget', '', 50),
(11, 'User Online', 'useronline', 'widget', '', 51),
(12, 'Estimates', 'estimates', 'main', 'icon dripicons-document-edit', 5),
(13, 'Expenses', 'expenses', 'main', 'icon dripicons-cart', 5),
(20, 'Calendar', 'calendar', 'main', 'icon dripicons-calendar', 8),
(33, 'Reports', 'reports', 'main', 'icon dripicons-graph-pie', 8),
(101, 'Projects', 'cprojects', 'client', 'icon dripicons-rocket', 2),
(102, 'Invoices', 'cinvoices', 'client', 'icon dripicons-document', 3),
(103, 'Messages', 'cmessages', 'client', 'icon dripicons-message', 1),
(104, 'Subscriptions', 'csubscriptions', 'client', 'icon dripicons-retweet', 4),
(105, 'Tickets', 'tickets', 'main', 'icon dripicons-ticket', 8),
(106, 'Tickets', 'ctickets', 'client', 'icon dripicons-ticket', 4),
(107, 'Estimates', 'cestimates', 'client', 'icon dripicons-document-edit', 3),
(108, 'Leads', 'leads', 'main', 'icon dripicons-phone', 4);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `privatemessages`
--

CREATE TABLE `privatemessages` (
  `id` int(11) UNSIGNED NOT NULL,
  `status` varchar(150) DEFAULT NULL,
  `sender` varchar(250) DEFAULT NULL,
  `recipient` varchar(250) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `message` text,
  `time` varchar(100) DEFAULT NULL,
  `conversation` varchar(255) DEFAULT '',
  `deleted` int(11) DEFAULT '0',
  `attachment` varchar(255) DEFAULT NULL,
  `attachment_link` varchar(255) DEFAULT NULL,
  `receiver_delete` int(11) DEFAULT '0',
  `marked` int(1) DEFAULT '0',
  `read` int(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `privatemessages`
--

INSERT INTO `privatemessages` (`id`, `status`, `sender`, `recipient`, `subject`, `message`, `time`, `conversation`, `deleted`, `attachment`, `attachment_link`, `receiver_delete`, `marked`, `read`) VALUES
(1, 'Read', 'u1', 'u2', 'Ayın 28 inde kontrol var', '<p>Acil işi yap ve bilgi ver</p>', '2019-08-26 17:51', '41850ba0d9b2456b5d98ddf1c6959943167b6b45', 0, 'Akcelep_Üretim_Süreci.xlsx', 'e9022004909bc3a9ec54548d1a288776.xlsx', 0, 0, 0),
(2, 'deleted', 'u1', 'u2', 'İşi kontrol', '<p>devam et</p>', '2019-08-26 17:53', 'fd42ba45f355ea617ab69660f1ef245e922351e9', 1, NULL, NULL, 0, 0, 0),
(3, 'Read', 'u1', 'u2', 'fsafs', '<p>fafs</p>', '2019-08-26 17:53', 'bbe1a5925302cedc8045e5120f6a1e00dd88213a', 0, NULL, NULL, 0, 0, 0),
(4, 'Read', 'u1', 'u2', 'aerqwer', '<p>qrqrwrwqwr</p>', '2019-08-26 18:35', 'd68688e0b51302be520fba0826508f07050bc51d', 0, NULL, NULL, 0, 0, 0);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `sku` varchar(255) NOT NULL,
  `price` varchar(255) NOT NULL,
  `qty` varchar(255) NOT NULL,
  `image` text NOT NULL,
  `description` text NOT NULL,
  `attribute_value_id` text,
  `brand_id` text NOT NULL,
  `category_id` text NOT NULL,
  `store_id` int(11) NOT NULL,
  `availability` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `products`
--

INSERT INTO `products` (`id`, `name`, `sku`, `price`, `qty`, `image`, `description`, `attribute_value_id`, `brand_id`, `category_id`, `store_id`, `availability`) VALUES
(2, 'Salatalık', 'N19211000410', '10000', '2', '<p>You did not select a file to upload.</p>', '<p>Ürün salatlık üretime hazır</p>', '[\"14\"]', '[\"5\"]', '[\"5\"]', 3, 1),
(3, 'Turşu', 'N19211000410', '1800', '9965', '<p>You did not select a file to upload.</p>', '<p>Turşu barcode eklendi</p>', '[\"14\",\"15\"]', '[\"5\"]', '[\"5\"]', 3, 1),
(4, 'erdo', '432432', '12', '-5', '<p>You did not select a file to upload.</p>', '<p>5 tane kaldı</p>', '[\"14\",\"15\"]', '[\"5\"]', '[\"5\"]', 3, 1),
(5, 'erdo', '432432', '12', '-5', '<p>You did not select a file to upload.</p>', '<p>5 tane kaldı</p>', '[\"14\",\"15\"]', '[\"5\"]', '[\"5\"]', 3, 1),
(6, 'Erd', '', '', '', '', '', NULL, '', '', 0, 1),
(7, 'saddsa', '', '', '', '', '', NULL, '', '', 0, 1),
(8, 'fsasfafsa', '', '', '', '', '', NULL, '', '', 0, 1),
(9, 'safsasffsa', '', '', '', '', '', NULL, '', '', 0, 1),
(10, 'fsa', '', '', '', '', '', NULL, '', '', 0, 1),
(11, 'fsa', '', '', '', '', '', NULL, '', '', 0, 1),
(12, 'fsa', '', '', '', '', '', NULL, '', '', 0, 1),
(14, 'fsa', '3141412443', '100', '5', 'assets/images/product_image/5d6fd50536a55.jpg', '<p>adsd</p>', 'false', 'false', 'false', 3, 1),
(15, 'erd', '4323', '243', '2', 'assets/images/product_image/5d6fd48f1e2d0.jpg', '<p>wqeq</p>', '[\"14\",\"15\"]', '[\"5\"]', '[\"4\"]', 3, 1);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `projects`
--

CREATE TABLE `projects` (
  `id` int(11) NOT NULL,
  `reference` int(11) DEFAULT '0',
  `name` varchar(65) DEFAULT NULL,
  `description` text,
  `start` varchar(20) DEFAULT NULL,
  `end` varchar(20) DEFAULT NULL,
  `progress` decimal(3,0) DEFAULT NULL,
  `phases` varchar(150) DEFAULT NULL,
  `tracking` int(11) DEFAULT '0',
  `time_spent` int(11) DEFAULT '0',
  `datetime` int(11) DEFAULT '0',
  `sticky` enum('1','0') DEFAULT '0',
  `category` varchar(150) DEFAULT NULL,
  `company_id` int(11) DEFAULT '0',
  `note` longtext,
  `progress_calc` tinyint(4) DEFAULT '0',
  `hide_tasks` int(1) DEFAULT '0',
  `enable_client_tasks` int(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `projects`
--

INSERT INTO `projects` (`id`, `reference`, `name`, `description`, `start`, `end`, `progress`, `phases`, `tracking`, `time_spent`, `datetime`, `sticky`, `category`, `company_id`, `note`, `progress_calc`, `hide_tasks`, `enable_client_tasks`) VALUES
(1, 51001, 'Erdogan Abacı', 'Acil Üretim gerekiyor', '2019-08-23', '2019-08-23', '53', 'Planning, Developing, Testing', 0, 0, 1566564549, '0', 'Üretim', 0, NULL, 0, 1, 1),
(2, 51002, 'Anıl Orbey', 'Üretim Aşamasına Geçilecektir.', '2019-08-26', '2019-08-31', '21', 'Planning, Developing, Testing', 0, 83400, 1566804455, '0', 'Üretim', 1, NULL, 0, 1, 0),
(3, 51003, 'Erdogan Abacı', 'Deneme', '2019-08-27', '2019-09-16', '55', 'Planning, Developing, Testing', 0, 0, 1566805961, '0', 'Üretim', 2, NULL, 0, 0, 1),
(4, 51004, 'Erdogan Abacı', 'sdad', '2019-08-13', '2019-08-31', '94', 'Planning, Developing, Testing', 0, 0, 1566810600, '0', 'Üretim', 1, NULL, 0, 0, 0),
(5, 51005, 'buse', 'dsad', '2019-08-12', '2019-08-22', '0', 'Planning, Developing, Testing', 0, 0, 1566810625, '0', 'Üretim', 0, NULL, 0, 0, 0);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `project_has_activities`
--

CREATE TABLE `project_has_activities` (
  `id` bigint(20) NOT NULL,
  `project_id` bigint(20) DEFAULT '0',
  `user_id` bigint(20) DEFAULT '0',
  `client_id` bigint(20) DEFAULT '0',
  `datetime` varchar(250) DEFAULT NULL,
  `subject` varchar(250) DEFAULT NULL,
  `message` text,
  `type` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `project_has_files`
--

CREATE TABLE `project_has_files` (
  `id` int(10) NOT NULL,
  `project_id` int(10) DEFAULT '0',
  `user_id` int(10) DEFAULT '0',
  `client_id` int(10) DEFAULT '0',
  `type` varchar(80) DEFAULT NULL,
  `name` varchar(120) DEFAULT NULL,
  `filename` varchar(150) DEFAULT NULL,
  `description` text,
  `savename` varchar(200) DEFAULT NULL,
  `phase` varchar(100) DEFAULT NULL,
  `date` varchar(50) DEFAULT NULL,
  `download_counter` int(10) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `project_has_invoices`
--

CREATE TABLE `project_has_invoices` (
  `id` bigint(20) NOT NULL,
  `project_id` bigint(20) NOT NULL,
  `invoice_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `project_has_milestones`
--

CREATE TABLE `project_has_milestones` (
  `id` int(11) UNSIGNED NOT NULL,
  `project_id` int(11) DEFAULT '0',
  `name` varchar(255) DEFAULT NULL,
  `description` longtext,
  `due_date` varchar(255) DEFAULT NULL,
  `orderindex` int(11) DEFAULT '0',
  `start_date` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `project_has_tasks`
--

CREATE TABLE `project_has_tasks` (
  `id` int(10) NOT NULL,
  `project_id` int(10) DEFAULT NULL,
  `name` varchar(250) DEFAULT NULL,
  `user_id` int(10) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `public` int(10) DEFAULT NULL,
  `datetime` int(11) DEFAULT NULL,
  `due_date` varchar(250) DEFAULT NULL,
  `description` text,
  `start_date` varchar(250) DEFAULT NULL,
  `value` float DEFAULT '0',
  `priority` smallint(6) DEFAULT '0',
  `time` int(11) DEFAULT NULL,
  `client_id` int(30) DEFAULT '0',
  `created_by_client` int(30) DEFAULT '0',
  `tracking` int(11) DEFAULT '0',
  `time_spent` int(11) DEFAULT '0',
  `milestone_id` int(11) DEFAULT '0',
  `invoice_id` int(60) DEFAULT '0',
  `milestone_order` int(11) DEFAULT '0',
  `task_order` int(11) DEFAULT '0',
  `progress` int(11) DEFAULT '0',
  `created_at` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `project_has_tasks`
--

INSERT INTO `project_has_tasks` (`id`, `project_id`, `name`, `user_id`, `status`, `public`, `datetime`, `due_date`, `description`, `start_date`, `value`, `priority`, `time`, `client_id`, `created_by_client`, `tracking`, `time_spent`, `milestone_id`, `invoice_id`, `milestone_order`, `task_order`, `progress`, `created_at`) VALUES
(1, 2, 'Fren', 1, 'done', 1, NULL, '', '', '', 0, 3, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2019-08-26 17:18:33'),
(2, 4, 'Buse işi düzgün yap', 2, 'done', 1, NULL, '2019-08-16', '<p>fafsda</p>', '2019-08-27', 100, 3, NULL, 0, 0, 0, 137, 0, 0, 0, 0, 0, '2019-08-26 18:47:16');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `project_has_timesheets`
--

CREATE TABLE `project_has_timesheets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `project_id` int(11) DEFAULT '0',
  `user_id` int(11) DEFAULT '0',
  `time` varchar(250) DEFAULT '0',
  `task_id` int(11) DEFAULT '0',
  `client_id` int(11) DEFAULT '0',
  `start` varchar(250) DEFAULT '0',
  `end` varchar(250) DEFAULT '0',
  `invoice_id` int(11) DEFAULT '0',
  `description` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `project_has_timesheets`
--

INSERT INTO `project_has_timesheets` (`id`, `project_id`, `user_id`, `time`, `task_id`, `client_id`, `start`, `end`, `invoice_id`, `description`) VALUES
(1, 4, 2, '3', 2, 0, '1566811041', '1566811044', 0, NULL),
(2, 4, 2, '134', 2, 0, '1566811047', '1566811181', 0, NULL);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `project_has_workers`
--

CREATE TABLE `project_has_workers` (
  `id` int(10) NOT NULL,
  `project_id` int(10) DEFAULT NULL,
  `user_id` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `project_has_workers`
--

INSERT INTO `project_has_workers` (`id`, `project_id`, `user_id`) VALUES
(1, 1, 1),
(2, 2, 1),
(4, 3, 1),
(5, 4, 1),
(6, 5, 2),
(7, 4, 2);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `pw_reset`
--

CREATE TABLE `pw_reset` (
  `id` int(10) NOT NULL,
  `email` varchar(250) DEFAULT NULL,
  `timestamp` varchar(250) DEFAULT NULL,
  `token` varchar(250) DEFAULT NULL,
  `user` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `queues`
--

CREATE TABLE `queues` (
  `id` bigint(20) NOT NULL,
  `name` varchar(250) DEFAULT NULL,
  `description` varchar(250) DEFAULT NULL,
  `inactive` tinyint(4) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `queues`
--

INSERT INTO `queues` (`id`, `name`, `description`, `inactive`) VALUES
(1, 'Service', 'First service queue', 0),
(2, 'Second Level', 'Second Level Queue', 0);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `quotations`
--

CREATE TABLE `quotations` (
  `id` int(11) NOT NULL,
  `q1` varchar(50) DEFAULT NULL,
  `q2` varchar(50) DEFAULT NULL,
  `q3` varchar(50) DEFAULT NULL,
  `q4` varchar(150) DEFAULT NULL,
  `q5` text,
  `q6` varchar(50) DEFAULT NULL,
  `company` varchar(150) DEFAULT '-',
  `fullname` varchar(150) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `phone` varchar(150) DEFAULT NULL,
  `address` varchar(150) DEFAULT NULL,
  `city` varchar(150) DEFAULT NULL,
  `zip` varchar(150) DEFAULT NULL,
  `country` varchar(150) DEFAULT NULL,
  `comment` text,
  `date` varchar(50) DEFAULT NULL,
  `status` varchar(150) DEFAULT NULL,
  `user_id` int(50) DEFAULT '0',
  `replied` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `quotations`
--

INSERT INTO `quotations` (`id`, `q1`, `q2`, `q3`, `q4`, `q5`, `q6`, `company`, `fullname`, `email`, `phone`, `address`, `city`, `zip`, `country`, `comment`, `date`, `status`, `user_id`, `replied`) VALUES
(1, '5', '1', '1', 'NO', 'sddsada', '2', 'd', 'Erdogan Abacı', 'erdoganabaci97@gmail.com', '5518005753', '202/42sok No:4 Daire:40 Buca/Izmir', 'izmir', '35390', 'Turkey', 'acil ihtiyac', '2019-08-25 23:01', 'New', 1, NULL);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `reminders`
--

CREATE TABLE `reminders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `module` varchar(250) DEFAULT NULL,
  `source_id` bigint(20) DEFAULT '0',
  `title` varchar(250) DEFAULT NULL,
  `body` text,
  `email_notification` int(1) DEFAULT '0',
  `done` int(1) DEFAULT '0',
  `datetime` varchar(50) DEFAULT NULL,
  `sent_at` varchar(50) DEFAULT NULL,
  `user_id` int(20) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `stores`
--

CREATE TABLE `stores` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `active` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `stores`
--

INSERT INTO `stores` (`id`, `name`, `active`) VALUES
(3, 'AKCELEP STORE', 1);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `subscriptions`
--

CREATE TABLE `subscriptions` (
  `id` int(10) NOT NULL,
  `reference` varchar(50) DEFAULT NULL,
  `company_id` int(10) DEFAULT '0',
  `status` varchar(50) DEFAULT NULL,
  `currency` varchar(20) DEFAULT NULL,
  `issue_date` varchar(20) DEFAULT NULL,
  `end_date` varchar(20) DEFAULT NULL,
  `frequency` varchar(20) DEFAULT NULL,
  `next_payment` varchar(20) DEFAULT NULL,
  `terms` mediumtext,
  `discount` varchar(50) DEFAULT NULL,
  `tax` varchar(250) DEFAULT NULL,
  `second_tax` varchar(255) DEFAULT NULL,
  `subscribed` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `subscriptions`
--

INSERT INTO `subscriptions` (`id`, `reference`, `company_id`, `status`, `currency`, `issue_date`, `end_date`, `frequency`, `next_payment`, `terms`, `discount`, `tax`, `second_tax`, `subscribed`) VALUES
(1, '61001', 1, 'Active', 'USD', '2019-08-27', '2019-08-29', '+7 day', '2019-08-27', 'Thank you for your business. We do expect payment within {due_date}, so please process this invoice within that time.', '', '10', '', NULL);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `subscription_has_items`
--

CREATE TABLE `subscription_has_items` (
  `id` int(10) NOT NULL,
  `subscription_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `amount` char(11) DEFAULT '0',
  `description` mediumtext,
  `value` float DEFAULT '0',
  `name` varchar(250) DEFAULT NULL,
  `type` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `subscription_has_items`
--

INSERT INTO `subscription_has_items` (`id`, `subscription_id`, `item_id`, `amount`, `description`, `value`, `name`, `type`) VALUES
(1, 1, 1, '1', 'Dağıtım Bileşenidir', 50, 'Erdogan Abacı', 'DAğıtım');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `task_has_comments`
--

CREATE TABLE `task_has_comments` (
  `id` bigint(255) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `client_id` int(11) DEFAULT NULL,
  `message` text,
  `datetime` varchar(20) DEFAULT NULL,
  `attachment` varchar(255) DEFAULT NULL,
  `task_id` bigint(20) DEFAULT NULL,
  `attachment_link` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `task_has_comments`
--

INSERT INTO `task_has_comments` (`id`, `user_id`, `client_id`, `message`, `datetime`, `attachment`, `task_id`, `attachment_link`) VALUES
(1, 1, NULL, 'aferin işi zamanında yaptın', '1566811263', NULL, 2, NULL),
(2, 2, NULL, 'tmm', '1566814447', NULL, 2, NULL);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `templates`
--

CREATE TABLE `templates` (
  `id` int(11) NOT NULL,
  `type` varchar(250) NOT NULL,
  `name` varchar(250) NOT NULL,
  `text` text,
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `tickets`
--

CREATE TABLE `tickets` (
  `id` bigint(20) NOT NULL,
  `from` varchar(250) DEFAULT NULL,
  `reference` varchar(250) DEFAULT NULL,
  `type_id` smallint(6) DEFAULT '1',
  `lock` smallint(6) DEFAULT NULL,
  `subject` varchar(250) DEFAULT NULL,
  `text` text,
  `status` varchar(50) DEFAULT NULL,
  `client_id` int(11) DEFAULT '0',
  `company_id` int(11) DEFAULT '0',
  `user_id` int(11) DEFAULT '0',
  `escalation_time` int(11) DEFAULT '0',
  `priority` varchar(50) DEFAULT NULL,
  `created` int(11) DEFAULT '0',
  `queue_id` int(11) DEFAULT '0',
  `updated` tinyint(4) DEFAULT '0',
  `project_id` bigint(20) DEFAULT '0',
  `raw` longtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `tickets`
--

INSERT INTO `tickets` (`id`, `from`, `reference`, `type_id`, `lock`, `subject`, `text`, `status`, `client_id`, `company_id`, `user_id`, `escalation_time`, `priority`, `created`, `queue_id`, `updated`, `project_id`, `raw`) VALUES
(1, 'Erdogan Abacı - erdoganabaci97@gmail.com', '10000', 1, NULL, 'Ayın 28 inde kontrol var', '<p>acil temizlik yapılsın</p>', 'open', 0, 0, 1, 0, NULL, 1566767211, 1, 1, 0, NULL),
(2, 'Erdogan Abacı - erdoganabaci97@gmail.com', '10001', 1, NULL, 'Hammadde Stoğu Azaldı', '<p>Acil Hammadde Stoğuna Bakınız</p>', 'closed', 0, 0, 2, 0, NULL, 1566770775, 1, 1, 0, NULL),
(3, 'Buse Gündüz - busegunduz@hotmail.com', '10002', 1, NULL, 'Hammadde stoğu kontrol altında', '<p>Hammadde stoğu kontrol altına alındı.Eski sistemine döndürüldü.</p>', 'open', 0, 0, 2, 0, NULL, 1566804262, 1, 1, 0, NULL);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `ticket_has_articles`
--

CREATE TABLE `ticket_has_articles` (
  `id` bigint(20) NOT NULL,
  `ticket_id` int(11) DEFAULT '0',
  `from` varchar(250) NOT NULL,
  `reply_to` varchar(250) DEFAULT NULL,
  `to` varchar(250) DEFAULT NULL,
  `cc` varchar(250) DEFAULT NULL,
  `subject` varchar(250) DEFAULT NULL,
  `message` text,
  `datetime` varchar(250) DEFAULT NULL,
  `internal` int(10) DEFAULT '1',
  `user_id` bigint(20) DEFAULT '0',
  `note` int(1) DEFAULT '0',
  `raw` longtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `ticket_has_articles`
--

INSERT INTO `ticket_has_articles` (`id`, `ticket_id`, `from`, `reply_to`, `to`, `cc`, `subject`, `message`, `datetime`, `internal`, `user_id`, `note`, `raw`) VALUES
(1, 2, 'Buse Gündüz - busegunduz@hotmail.com', 'busegunduz@hotmail.com', 'erdoganabaci97@gmail.com', NULL, 'Kapa', 'stok güncellendi', '1566810008', 0, 0, 0, NULL);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `ticket_has_attachments`
--

CREATE TABLE `ticket_has_attachments` (
  `id` bigint(20) NOT NULL,
  `ticket_id` bigint(20) DEFAULT NULL,
  `filename` varchar(250) DEFAULT NULL,
  `savename` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `ticket_has_attachments`
--

INSERT INTO `ticket_has_attachments` (`id`, `ticket_id`, `filename`, `savename`) VALUES
(1, 1, 'Akcelep_Üretim_Süreci.xlsx', '4adb87f2afbdd761aad35746cc2806a4.xlsx'),
(2, 2, 'Akcelep_Üretim_Süreci.xlsx', 'b96d160b864b60518b5d136896f40104.xlsx'),
(3, 3, 'Akcelep_Üretim_Süreci.xlsx', '2271948324fcd8b7fff5997fb2d7af87.xlsx');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `types`
--

CREATE TABLE `types` (
  `id` bigint(20) NOT NULL,
  `name` varchar(250) DEFAULT NULL,
  `description` varchar(250) DEFAULT NULL,
  `inactive` tinyint(4) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `types`
--

INSERT INTO `types` (`id`, `name`, `description`, `inactive`) VALUES
(1, 'Service Request', 'Service Requests', 0);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(45) DEFAULT NULL,
  `firstname` varchar(120) DEFAULT NULL,
  `lastname` varchar(120) DEFAULT NULL,
  `hashed_password` varchar(128) DEFAULT NULL,
  `email` varchar(60) DEFAULT NULL,
  `status` enum('active','inactive','deleted') DEFAULT NULL,
  `admin` enum('0','1') DEFAULT '0',
  `created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `userpic` varchar(250) DEFAULT 'no-pic.png',
  `title` varchar(150) DEFAULT NULL,
  `access` varchar(150) NOT NULL DEFAULT '1,2',
  `last_active` varchar(50) DEFAULT NULL,
  `last_login` varchar(50) DEFAULT NULL,
  `queue` bigint(20) DEFAULT '0',
  `token` varchar(255) DEFAULT NULL,
  `language` varchar(255) DEFAULT NULL,
  `signature` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `users`
--

INSERT INTO `users` (`id`, `username`, `firstname`, `lastname`, `hashed_password`, `email`, `status`, `admin`, `created`, `userpic`, `title`, `access`, `last_active`, `last_login`, `queue`, `token`, `language`, `signature`) VALUES
(1, 'admin', 'Erdogan', 'Abacı', '6d4c3e5e23573f437a55365a2765332e7247713925383e79724b6421723923447afb9f0b4a6a4672132290c2c4b9c39509799abbf4f71c1f41f4886da5923064', 'erdoganabaci97@gmail.com', 'active', '1', '2019-08-23 11:48:03', 'cde414dc8f185477b08117acafb8e170.jpg', 'Administrator', '1,2,3,4,108,5,12,13,8,6,7,20,33,105,9,10,11', '1567610428', '1567610426', 1, 'e1916f7d668ebc1119b55510611792f2', NULL, ''),
(2, 'buse', 'Buse', 'Gündüz', '414638407d366a6479304a2d6e3c26615077225d244b575f27265543717b4465dd889c0dbc38c15b9c1f9d4fb143a8d873c3e8c7fe9d5a38fb9abca2fac72e45', 'busegunduz@hotmail.com', 'active', '0', '2019-08-25 22:04:22', 'a2ea504c5678b6503b00b0cf638deec6.jpg', 'Yedek Parça', '1,2,3,4,108,5,12,13,8,6,7,20,33,105,9,10,11', '1566814528', '1566814434', 1, NULL, NULL, '');

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `article_has_attachments`
--
ALTER TABLE `article_has_attachments`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `attributes`
--
ALTER TABLE `attributes`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `attribute_value`
--
ALTER TABLE `attribute_value`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `companies`
--
ALTER TABLE `companies`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `company_has_admins`
--
ALTER TABLE `company_has_admins`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `core`
--
ALTER TABLE `core`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `custom_quotations`
--
ALTER TABLE `custom_quotations`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `custom_quotation_requests`
--
ALTER TABLE `custom_quotation_requests`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `expenses`
--
ALTER TABLE `expenses`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `invoice_has_items`
--
ALTER TABLE `invoice_has_items`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `invoice_has_payments`
--
ALTER TABLE `invoice_has_payments`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `leads`
--
ALTER TABLE `leads`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `lead_has_comments`
--
ALTER TABLE `lead_has_comments`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `lead_status`
--
ALTER TABLE `lead_status`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `modules`
--
ALTER TABLE `modules`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `privatemessages`
--
ALTER TABLE `privatemessages`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `projects`
--
ALTER TABLE `projects`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `project_has_activities`
--
ALTER TABLE `project_has_activities`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `project_has_files`
--
ALTER TABLE `project_has_files`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `project_has_invoices`
--
ALTER TABLE `project_has_invoices`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `project_has_milestones`
--
ALTER TABLE `project_has_milestones`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `project_has_tasks`
--
ALTER TABLE `project_has_tasks`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `project_has_timesheets`
--
ALTER TABLE `project_has_timesheets`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `project_has_workers`
--
ALTER TABLE `project_has_workers`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `pw_reset`
--
ALTER TABLE `pw_reset`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `queues`
--
ALTER TABLE `queues`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `quotations`
--
ALTER TABLE `quotations`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `reminders`
--
ALTER TABLE `reminders`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `stores`
--
ALTER TABLE `stores`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `subscriptions`
--
ALTER TABLE `subscriptions`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `subscription_has_items`
--
ALTER TABLE `subscription_has_items`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `task_has_comments`
--
ALTER TABLE `task_has_comments`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `templates`
--
ALTER TABLE `templates`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `tickets`
--
ALTER TABLE `tickets`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `ticket_has_articles`
--
ALTER TABLE `ticket_has_articles`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `ticket_has_attachments`
--
ALTER TABLE `ticket_has_attachments`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `types`
--
ALTER TABLE `types`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Dökümü yapılmış tablolar için AUTO_INCREMENT değeri
--

--
-- Tablo için AUTO_INCREMENT değeri `article_has_attachments`
--
ALTER TABLE `article_has_attachments`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `attributes`
--
ALTER TABLE `attributes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Tablo için AUTO_INCREMENT değeri `attribute_value`
--
ALTER TABLE `attribute_value`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Tablo için AUTO_INCREMENT değeri `brands`
--
ALTER TABLE `brands`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Tablo için AUTO_INCREMENT değeri `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Tablo için AUTO_INCREMENT değeri `clients`
--
ALTER TABLE `clients`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Tablo için AUTO_INCREMENT değeri `companies`
--
ALTER TABLE `companies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Tablo için AUTO_INCREMENT değeri `company_has_admins`
--
ALTER TABLE `company_has_admins`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Tablo için AUTO_INCREMENT değeri `core`
--
ALTER TABLE `core`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Tablo için AUTO_INCREMENT değeri `custom_quotations`
--
ALTER TABLE `custom_quotations`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Tablo için AUTO_INCREMENT değeri `custom_quotation_requests`
--
ALTER TABLE `custom_quotation_requests`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `events`
--
ALTER TABLE `events`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Tablo için AUTO_INCREMENT değeri `expenses`
--
ALTER TABLE `expenses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Tablo için AUTO_INCREMENT değeri `invoices`
--
ALTER TABLE `invoices`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Tablo için AUTO_INCREMENT değeri `invoice_has_items`
--
ALTER TABLE `invoice_has_items`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `invoice_has_payments`
--
ALTER TABLE `invoice_has_payments`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `items`
--
ALTER TABLE `items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Tablo için AUTO_INCREMENT değeri `leads`
--
ALTER TABLE `leads`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Tablo için AUTO_INCREMENT değeri `lead_has_comments`
--
ALTER TABLE `lead_has_comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `lead_status`
--
ALTER TABLE `lead_status`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Tablo için AUTO_INCREMENT değeri `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `modules`
--
ALTER TABLE `modules`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=109;

--
-- Tablo için AUTO_INCREMENT değeri `privatemessages`
--
ALTER TABLE `privatemessages`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Tablo için AUTO_INCREMENT değeri `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Tablo için AUTO_INCREMENT değeri `projects`
--
ALTER TABLE `projects`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Tablo için AUTO_INCREMENT değeri `project_has_activities`
--
ALTER TABLE `project_has_activities`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `project_has_files`
--
ALTER TABLE `project_has_files`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `project_has_invoices`
--
ALTER TABLE `project_has_invoices`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `project_has_milestones`
--
ALTER TABLE `project_has_milestones`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `project_has_tasks`
--
ALTER TABLE `project_has_tasks`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Tablo için AUTO_INCREMENT değeri `project_has_timesheets`
--
ALTER TABLE `project_has_timesheets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Tablo için AUTO_INCREMENT değeri `project_has_workers`
--
ALTER TABLE `project_has_workers`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Tablo için AUTO_INCREMENT değeri `pw_reset`
--
ALTER TABLE `pw_reset`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `queues`
--
ALTER TABLE `queues`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Tablo için AUTO_INCREMENT değeri `quotations`
--
ALTER TABLE `quotations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Tablo için AUTO_INCREMENT değeri `reminders`
--
ALTER TABLE `reminders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `stores`
--
ALTER TABLE `stores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Tablo için AUTO_INCREMENT değeri `subscriptions`
--
ALTER TABLE `subscriptions`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Tablo için AUTO_INCREMENT değeri `subscription_has_items`
--
ALTER TABLE `subscription_has_items`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Tablo için AUTO_INCREMENT değeri `task_has_comments`
--
ALTER TABLE `task_has_comments`
  MODIFY `id` bigint(255) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Tablo için AUTO_INCREMENT değeri `templates`
--
ALTER TABLE `templates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `tickets`
--
ALTER TABLE `tickets`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Tablo için AUTO_INCREMENT değeri `ticket_has_articles`
--
ALTER TABLE `ticket_has_articles`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Tablo için AUTO_INCREMENT değeri `ticket_has_attachments`
--
ALTER TABLE `ticket_has_attachments`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Tablo için AUTO_INCREMENT değeri `types`
--
ALTER TABLE `types`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Tablo için AUTO_INCREMENT değeri `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
