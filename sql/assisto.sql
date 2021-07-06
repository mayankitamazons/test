-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 03, 2021 at 09:27 AM
-- Server version: 10.4.19-MariaDB
-- PHP Version: 8.0.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `assisto`
--

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `status` enum('1','0') NOT NULL DEFAULT '1' COMMENT '1 Means Active 0 Means not active',
  `created_by` int(11) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `icon_for_web` varchar(255) DEFAULT NULL,
  `icon_for_app` varchar(255) DEFAULT NULL,
  `banner_image` varchar(255) DEFAULT NULL,
  `about` text DEFAULT NULL,
  `how_it_work` text DEFAULT NULL,
  `banner_lines` varchar(255) DEFAULT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `status` enum('1','0') NOT NULL DEFAULT '1' COMMENT '1 Means Active 0 Means not active',
  `created_by` int(11) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `category_faqs`
--

CREATE TABLE `category_faqs` (
  `id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL COMMENT 'Comes from category table',
  `question` varchar(255) DEFAULT NULL,
  `answer` text DEFAULT NULL,
  `status` enum('1','0') NOT NULL DEFAULT '1' COMMENT '1 Means Active 0 Means not active',
  `created_by` int(11) DEFAULT NULL,
  `created` date DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `home_page_settings`
--

CREATE TABLE `home_page_settings` (
  `id` int(11) NOT NULL,
  `banner_image` text DEFAULT NULL,
  `tag_line` varchar(255) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `locations`
--

CREATE TABLE `locations` (
  `id` int(11) NOT NULL,
  `city` varchar(255) DEFAULT NULL,
  `allow_categories` varchar(255) DEFAULT NULL COMMENT 'Comes from category table',
  `status` enum('1','0') NOT NULL DEFAULT '1' COMMENT '1 Means Active 0 Means not active',
  `created_by` int(11) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `location_based_services`
--

CREATE TABLE `location_based_services` (
  `id` int(11) NOT NULL,
  `location_id` int(11) DEFAULT NULL COMMENT 'Comes from location table',
  `category_id` int(11) DEFAULT NULL COMMENT 'Comes from category table',
  `sub_category_id` int(11) DEFAULT NULL COMMENT 'Comes from sub category table',
  `service_json` text DEFAULT NULL COMMENT 'carried full service json for location wise ',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `offers`
--

CREATE TABLE `offers` (
  `id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL COMMENT 'Comes from category table',
  `sub_category_id` int(11) DEFAULT NULL COMMENT 'Comes from sub category table',
  `image` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `start_from` datetime DEFAULT NULL,
  `end_to` datetime DEFAULT NULL,
  `min_amount` int(11) DEFAULT NULL,
  `max_amount` int(11) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `offer_type` enum('1','2') NOT NULL DEFAULT '1' COMMENT '1 Means %(Percent) 2 means flat',
  `discount_amount` int(11) DEFAULT NULL,
  `coupon_count` int(11) DEFAULT NULL,
  `coupon_value` int(11) DEFAULT NULL,
  `use_per_user` int(11) DEFAULT NULL,
  `visibility` enum('1','0') NOT NULL DEFAULT '1' COMMENT '1 means visible for all 0 means individual coupon for private',
  `use_per_coupon` int(11) DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `status` enum('1','0') NOT NULL DEFAULT '1' COMMENT '1 Means Active 0 Means not active',
  `created_by` int(11) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `packages`
--

CREATE TABLE `packages` (
  `id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL COMMENT 'Comes from category table',
  `sub_category_id` int(11) DEFAULT NULL COMMENT 'Comes from sub category table',
  `name` varchar(255) DEFAULT NULL,
  `service_json` text DEFAULT NULL COMMENT 'In this we are going to store pre selected service ids in this package',
  `description` text DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `video` varchar(255) DEFAULT NULL,
  `status` enum('1','0') NOT NULL DEFAULT '1' COMMENT '1 Means active and 0 Means not active',
  `created_by` int(11) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `partners`
--

CREATE TABLE `partners` (
  `id` int(11) NOT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `lass_name` varchar(255) DEFAULT NULL,
  `profile_image` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `location_id` int(11) DEFAULT NULL COMMENT 'Comes from location table',
  `email` varchar(255) DEFAULT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `login_otp` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `pincode` varchar(255) DEFAULT NULL,
  `father_name` varchar(255) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `marital_status` enum('0','1','2') NOT NULL DEFAULT '1' COMMENT '0 For Unmarried, 1 For Married, 2 For Widow',
  `rating` int(11) DEFAULT NULL,
  `no_of_rating` int(11) DEFAULT NULL,
  `no_of_service` int(11) NOT NULL COMMENT 'Means how many time he/she had given service to customer',
  `ref_code` varchar(255) DEFAULT NULL,
  `ref_by` int(11) DEFAULT NULL,
  `status` enum('1','0','2') NOT NULL DEFAULT '1' COMMENT '1 For Active 0 For Not Active 2 means block',
  `approved_by` int(11) DEFAULT NULL COMMENT 'Admin id who had given approval to this profile',
  `last_login` datetime DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `partner_kyc_details`
--

CREATE TABLE `partner_kyc_details` (
  `id` int(11) NOT NULL,
  `partner_id` int(11) DEFAULT NULL COMMENT 'Comes from partner table',
  `aadhar_no` varchar(255) DEFAULT NULL,
  `addhar_front_image` varchar(255) DEFAULT NULL,
  `aadhar_back_image` varchar(255) DEFAULT NULL,
  `addhar_status` enum('1','0') DEFAULT '0' COMMENT '1 For Approve 0 For not approve',
  `pan_card_no` varchar(255) DEFAULT NULL,
  `pan_card_image` varchar(255) DEFAULT NULL,
  `pan_card_status` enum('1','0') NOT NULL DEFAULT '0' COMMENT '1 means approve and 0 means not approve',
  `signed_cheque_image` varchar(255) DEFAULT NULL,
  `singed_cheque_status` enum('1','0') NOT NULL DEFAULT '0' COMMENT '1 for approve and 0 means not approve',
  `bank_statement` varchar(255) DEFAULT NULL,
  `bank_statement_status` enum('1','0') NOT NULL DEFAULT '0' COMMENT '1 means approve and 0 means not approve',
  `passbook` varchar(255) DEFAULT NULL,
  `passbook_status` enum('1','0') NOT NULL DEFAULT '0' COMMENT '1 means approve and 0 means not approve',
  `cancelled_cheque` varchar(255) DEFAULT NULL,
  `cancelled_cheque_status` enum('1','0') NOT NULL DEFAULT '0' COMMENT '1 means approve and 0 means not approve',
  `other_doc_json` text DEFAULT NULL,
  `status` enum('0','1','2') NOT NULL DEFAULT '0' COMMENT '1 means partial approve 2 means approve and 0 means pending',
  `approved_by` int(11) DEFAULT NULL COMMENT 'Comes from admin who approve this kyc',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `partner_reviews`
--

CREATE TABLE `partner_reviews` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL COMMENT 'Comes from customer table who gives review to partner',
  `partner_id` int(11) DEFAULT NULL COMMENT 'Comes from partner table who got the review from the customers',
  `review` varchar(255) DEFAULT NULL,
  `rating` int(11) DEFAULT NULL,
  `status` enum('1','0') NOT NULL DEFAULT '1' COMMENT '1 Means show to screen 0 means don''t show on screen',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pincodes`
--

CREATE TABLE `pincodes` (
  `id` int(11) NOT NULL,
  `location_id` int(11) DEFAULT NULL COMMENT 'Comes from location table',
  `pincode` varchar(255) DEFAULT NULL,
  `status` enum('1','0') NOT NULL DEFAULT '1' COMMENT '1 Means Active 0 Means not active',
  `created_by` int(11) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL COMMENT 'Comes from tags table',
  `category_id` int(11) DEFAULT NULL COMMENT 'Comes from category table',
  `sub_category_id` int(11) DEFAULT NULL COMMENT 'Comes from sub category table',
  `name` varchar(255) DEFAULT NULL,
  `image_json` text DEFAULT NULL,
  `vedio` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `having_topup` enum('1','0') NOT NULL DEFAULT '0' COMMENT '0 Means no top-up 1 means yes',
  `rating` int(11) DEFAULT NULL,
  `no_of_rating` int(11) DEFAULT NULL,
  `aprox_time` int(11) DEFAULT NULL COMMENT 'Approx time to take in this product/service',
  `status` enum('1','0') NOT NULL DEFAULT '1' COMMENT '1 Means Active 0 Means not active',
  `created_by` int(11) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `service_configuration`
--

CREATE TABLE `service_configuration` (
  `id` int(11) NOT NULL,
  `location_id` int(11) DEFAULT NULL,
  `service_id` int(11) DEFAULT NULL COMMENT 'Comes from service table',
  `topup_details_json` text DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `discount_price` int(11) DEFAULT NULL,
  `status` enum('1','0') NOT NULL DEFAULT '1',
  `created_by` int(11) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sub_categories`
--

CREATE TABLE `sub_categories` (
  `id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL COMMENT 'Comes from category table',
  `name` varchar(255) DEFAULT NULL,
  `icon_for_web` varchar(255) DEFAULT NULL,
  `icon_for_app` varchar(255) DEFAULT NULL,
  `banner_image` varchar(255) DEFAULT NULL,
  `status` enum('1','0') NOT NULL DEFAULT '1' COMMENT '1 Means Active 0 Means not active',
  `created_by` int(11) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sub_category_sliders`
--

CREATE TABLE `sub_category_sliders` (
  `id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL COMMENT 'Comes from category table',
  `sub_category_id` int(11) DEFAULT NULL COMMENT 'Comes from sub category table',
  `image` varchar(255) DEFAULT NULL,
  `status` enum('1','0') NOT NULL DEFAULT '1' COMMENT '1 Means Active 0 Means not active',
  `created_by` int(11) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE `tags` (
  `id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL COMMENT 'Comes from category table',
  `sub_category_id` int(11) DEFAULT NULL COMMENT 'Comes from sub category table',
  `name` varchar(255) DEFAULT NULL,
  `status` enum('1','0') NOT NULL DEFAULT '1' COMMENT '1 Means Active 0 Means not active',
  `created_by` int(11) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `used_coupons`
--

CREATE TABLE `used_coupons` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL COMMENT 'Comes from user table',
  `offer_id` int(11) DEFAULT NULL COMMENT 'Comes from offer table',
  `code` varchar(255) DEFAULT NULL,
  `discount_amount` int(11) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `otp` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `preferred_payment_method` enum('1','2') NOT NULL DEFAULT '1' COMMENT '1 means online 2 means offline',
  `plateform` enum('1','2','3') NOT NULL DEFAULT '1' COMMENT '1 means Web 2 means Android 3 means IOS',
  `device_id` varchar(255) DEFAULT NULL,
  `device_agent` varchar(255) DEFAULT NULL,
  `device_ip` varchar(255) DEFAULT NULL,
  `ref_code` varchar(255) DEFAULT NULL,
  `ref_by` int(11) NOT NULL COMMENT 'User id who refer you',
  `last_login` datetime DEFAULT NULL,
  `status` enum('1','0') NOT NULL DEFAULT '1' COMMENT '1 means active 0 means In-active',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user_addresses`
--

CREATE TABLE `user_addresses` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL COMMENT 'Comes from user table',
  `address_name` varchar(255) DEFAULT NULL,
  `address_type` enum('1','2','3') NOT NULL DEFAULT '1' COMMENT '1 For Home, 2 for Office 3 for Others',
  `address` varchar(255) DEFAULT NULL,
  `default_address` enum('1','0') NOT NULL DEFAULT '0' COMMENT '1 Means this address as default address 0 means not default address',
  `status` enum('1','0') NOT NULL DEFAULT '1' COMMENT '1 For active 2 for inactive',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category_faqs`
--
ALTER TABLE `category_faqs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `home_page_settings`
--
ALTER TABLE `home_page_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `locations`
--
ALTER TABLE `locations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `location_based_services`
--
ALTER TABLE `location_based_services`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `offers`
--
ALTER TABLE `offers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `sub_category_id` (`sub_category_id`);

--
-- Indexes for table `packages`
--
ALTER TABLE `packages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `partners`
--
ALTER TABLE `partners`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `partner_kyc_details`
--
ALTER TABLE `partner_kyc_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `partner_reviews`
--
ALTER TABLE `partner_reviews`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pincodes`
--
ALTER TABLE `pincodes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `location_id` (`location_id`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`),
  ADD KEY `service_id` (`tag_id`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `sub_category_id` (`sub_category_id`);

--
-- Indexes for table `service_configuration`
--
ALTER TABLE `service_configuration`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sub_categories`
--
ALTER TABLE `sub_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `sub_category_sliders`
--
ALTER TABLE `sub_category_sliders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `sub_category_id` (`sub_category_id`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `sub_category_id` (`sub_category_id`);

--
-- Indexes for table `used_coupons`
--
ALTER TABLE `used_coupons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_addresses`
--
ALTER TABLE `user_addresses`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `category_faqs`
--
ALTER TABLE `category_faqs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `home_page_settings`
--
ALTER TABLE `home_page_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `locations`
--
ALTER TABLE `locations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `location_based_services`
--
ALTER TABLE `location_based_services`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `offers`
--
ALTER TABLE `offers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `packages`
--
ALTER TABLE `packages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `partners`
--
ALTER TABLE `partners`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `partner_kyc_details`
--
ALTER TABLE `partner_kyc_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `partner_reviews`
--
ALTER TABLE `partner_reviews`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pincodes`
--
ALTER TABLE `pincodes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `service_configuration`
--
ALTER TABLE `service_configuration`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sub_categories`
--
ALTER TABLE `sub_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sub_category_sliders`
--
ALTER TABLE `sub_category_sliders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `used_coupons`
--
ALTER TABLE `used_coupons`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_addresses`
--
ALTER TABLE `user_addresses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
