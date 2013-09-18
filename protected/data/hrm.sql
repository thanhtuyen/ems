-- phpMyAdmin SQL Dump
-- version 3.2.4
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Sep 18, 2013 at 05:45 PM
-- Server version: 5.1.41
-- PHP Version: 5.3.1

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `hrm1`
--

-- --------------------------------------------------------

--
-- Table structure for table `activity_log`
--

CREATE TABLE IF NOT EXISTS `activity_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `activity_date` int(11) NOT NULL COMMENT 'Activity Date',
  `user_id` int(11) unsigned NOT NULL COMMENT 'ID of User execute action',
  `activity_type` int(11) unsigned NOT NULL COMMENT 'Activity Type',
  `action_group` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'Action Group',
  `action_id` int(11) unsigned NOT NULL COMMENT 'ID of user been action',
  `ip_logged` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'IP Adrress',
  PRIMARY KEY (`id`),
  KEY `FK_activity_log_1` (`user_id`),
  KEY `FK_activity_log_2` (`action_id`),
  KEY `FK_activity_log_3` (`activity_type`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=127 ;

--
-- Dumping data for table `activity_log`
--

INSERT INTO `activity_log` (`id`, `activity_date`, `user_id`, `activity_type`, `action_group`, `action_id`, `ip_logged`) VALUES
(1, 1378179631, 2, 2, 'user', 2, '127.0.0.1'),
(2, 1378180079, 2, 2, 'user', 2, '127.0.0.1'),
(3, 1378180185, 2, 2, 'user', 2, '127.0.0.1'),
(4, 1378181629, 2, 2, 'user', 2, '127.0.0.1'),
(5, 1378181687, 2, 5, 'user', 2, '127.0.0.1'),
(6, 1378181743, 2, 2, 'user', 2, '127.0.0.1'),
(7, 1378181799, 18, 2, 'user', 18, '127.0.0.1'),
(8, 1378183015, 18, 6, 'user', 18, '127.0.0.1'),
(9, 1378197998, 18, 2, 'user', 18, '127.0.0.1'),
(10, 1378199329, 2, 1, 'user', 2, '127.0.0.1'),
(11, 1378200443, 2, 1, 'user', 2, '127.0.0.1'),
(12, 1378202346, 2, 6, 'user', 2, '127.0.0.1'),
(13, 1378202855, 2, 11, 'user', 2, '127.0.0.1'),
(14, 1378260173, 2, 1, 'user', 2, '127.0.0.1'),
(15, 1378262592, 2, 1, 'user', 2, '127.0.0.1'),
(16, 1378349446, 2, 1, 'user', 2, '127.0.0.1'),
(17, 1378354424, 2, 5, 'user', 2, '127.0.0.1'),
(18, 1378354442, 2, 5, 'user', 2, '127.0.0.1'),
(19, 1378363605, 2, 5, 'user', 2, '127.0.0.1'),
(20, 1378363753, 2, 6, 'user', 2, '127.0.0.1'),
(21, 1378364310, 2, 5, 'user', 2, '127.0.0.1'),
(22, 1378438024, 2, 1, 'user', 2, '127.0.0.1'),
(23, 1378438031, 2, 2, 'user', 2, '127.0.0.1'),
(24, 1378438034, 2, 1, 'user', 2, '127.0.0.1'),
(25, 1378439207, 2, 1, 'user', 2, '127.0.0.1'),
(26, 1378440197, 2, 1, 'user', 2, '127.0.0.1'),
(27, 1378440208, 2, 2, 'user', 2, '127.0.0.1'),
(28, 1378440415, 2, 1, 'user', 2, '127.0.0.1'),
(29, 1378440501, 2, 2, 'user', 2, '127.0.0.1'),
(30, 1378441333, 2, 1, 'user', 2, '127.0.0.1'),
(31, 1378441513, 2, 6, 'user', 2, '127.0.0.1'),
(32, 1378441555, 2, 5, 'user', 2, '127.0.0.1'),
(33, 1378441644, 2, 2, 'user', 2, '127.0.0.1'),
(34, 1378441671, 3, 1, 'user', 3, '127.0.0.1'),
(35, 1378442016, 3, 2, 'user', 3, '127.0.0.1'),
(36, 1378442018, 2, 1, 'user', 2, '127.0.0.1'),
(37, 1378442308, 2, 1, 'user', 2, '127.0.0.1'),
(38, 1378442420, 2, 6, 'user', 2, '127.0.0.1'),
(39, 1378442452, 2, 6, 'user', 2, '127.0.0.1'),
(40, 1378442462, 2, 6, 'user', 2, '127.0.0.1'),
(41, 1378442517, 2, 6, 'user', 2, '127.0.0.1'),
(42, 1378442777, 2, 1, 'user', 2, '127.0.0.1'),
(43, 1378447647, 2, 1, 'user', 2, '127.0.0.1'),
(44, 1378447662, 2, 6, 'user', 2, '127.0.0.1'),
(45, 1378447816, 2, 6, 'user', 2, '127.0.0.1'),
(46, 1378448109, 2, 6, 'user', 2, '127.0.0.1'),
(47, 1378448216, 2, 6, 'user', 2, '127.0.0.1'),
(48, 1378458032, 2, 7, 'user', 18, '127.0.0.1'),
(49, 1378458082, 2, 7, 'user', 18, '127.0.0.1'),
(50, 1378463119, 2, 1, 'user', 2, '127.0.0.1'),
(51, 1378801339, 2, 1, 'user', 2, '127.0.0.1'),
(52, 1378952519, 2, 1, 'user', 2, '127.0.0.1'),
(53, 1378952567, 2, 5, 'user', 2, '127.0.0.1'),
(54, 1378977206, 2, 1, 'user', 2, '127.0.0.1'),
(55, 1379038894, 2, 1, 'user', 2, '127.0.0.1'),
(56, 1379048059, 2, 2, 'user', 2, '127.0.0.1'),
(57, 1379048060, 2, 1, 'user', 2, '127.0.0.1'),
(58, 1379299173, 2, 1, 'user', 2, '127.0.0.1'),
(59, 1379299293, 2, 1, 'user', 2, '127.0.0.1'),
(60, 1379315149, 2, 1, 'user', 2, '127.0.0.1'),
(61, 1379315422, 2, 5, 'user', 2, '127.0.0.1'),
(62, 1379316385, 2, 13, 'user', 2, '127.0.0.1'),
(63, 1379317334, 2, 13, 'user', 2, '127.0.0.1'),
(64, 1379317408, 2, 13, 'user', 2, '127.0.0.1'),
(65, 1379320953, 2, 13, 'user', 2, '127.0.0.1'),
(66, 1379321021, 2, 13, 'user', 2, '127.0.0.1'),
(67, 1379322620, 2, 13, 'user', 2, '127.0.0.1'),
(68, 1379322790, 2, 13, 'user', 2, '127.0.0.1'),
(69, 1379322894, 2, 13, 'user', 2, '127.0.0.1'),
(70, 1379322921, 2, 13, 'user', 2, '127.0.0.1'),
(71, 1379322942, 2, 13, 'user', 2, '127.0.0.1'),
(72, 1379323105, 2, 13, 'user', 2, '127.0.0.1'),
(73, 1379323116, 2, 13, 'user', 2, '127.0.0.1'),
(74, 1379324681, 2, 13, 'user', 2, '127.0.0.1'),
(75, 1379324786, 2, 13, 'user', 2, '127.0.0.1'),
(76, 1379325072, 2, 13, 'user', 2, '127.0.0.1'),
(77, 1379325083, 2, 13, 'user', 2, '127.0.0.1'),
(78, 1379325342, 2, 13, 'user', 2, '127.0.0.1'),
(79, 1379325432, 2, 13, 'user', 2, '127.0.0.1'),
(80, 1379325965, 2, 13, 'user', 2, '127.0.0.1'),
(81, 1379326580, 2, 13, 'user', 2, '127.0.0.1'),
(82, 1379326600, 2, 13, 'user', 2, '127.0.0.1'),
(83, 1379328264, 2, 1, 'user', 2, '127.0.0.1'),
(84, 1379328266, 2, 1, 'user', 2, '127.0.0.1'),
(85, 1379328268, 2, 1, 'user', 2, '127.0.0.1'),
(86, 1379328271, 2, 1, 'user', 2, '127.0.0.1'),
(87, 1379328273, 2, 1, 'user', 2, '127.0.0.1'),
(88, 1379328274, 2, 1, 'user', 2, '127.0.0.1'),
(89, 1379328274, 2, 1, 'user', 2, '127.0.0.1'),
(90, 1379328279, 2, 1, 'user', 2, '127.0.0.1'),
(91, 1379328356, 2, 1, 'user', 2, '127.0.0.1'),
(92, 1379328374, 2, 1, 'user', 2, '127.0.0.1'),
(93, 1379328375, 2, 1, 'user', 2, '127.0.0.1'),
(94, 1379328380, 2, 1, 'user', 2, '127.0.0.1'),
(95, 1379382310, 2, 1, 'user', 2, '127.0.0.1'),
(96, 1379382312, 2, 1, 'user', 2, '127.0.0.1'),
(97, 1379382903, 2, 1, 'user', 2, '127.0.0.1'),
(98, 1379383563, 2, 1, 'user', 2, '127.0.0.1'),
(99, 1379383605, 2, 1, 'user', 2, '127.0.0.1'),
(100, 1379385553, 2, 13, 'user', 2, '127.0.0.1'),
(101, 1379385997, 2, 13, 'vacation', 2, '127.0.0.1'),
(102, 1379404285, 2, 2, 'user', 2, '127.0.0.1'),
(103, 1379404287, 2, 1, 'user', 2, '127.0.0.1'),
(104, 1379404333, 2, 2, 'user', 2, '127.0.0.1'),
(105, 1379404370, 2, 1, 'user', 2, '127.0.0.1'),
(106, 1379404395, 2, 2, 'user', 2, '127.0.0.1'),
(107, 1379404435, 2, 1, 'user', 2, '127.0.0.1'),
(108, 1379404490, 2, 2, 'user', 2, '127.0.0.1'),
(109, 1379405744, 2, 1, 'user', 2, '127.0.0.1'),
(110, 1379405822, 2, 2, 'user', 2, '127.0.0.1'),
(111, 1379405843, 3, 1, 'user', 3, '127.0.0.1'),
(112, 1379405996, 3, 2, 'user', 3, '127.0.0.1'),
(113, 1379405997, 2, 1, 'user', 2, '127.0.0.1'),
(114, 1379406041, 2, 2, 'user', 2, '127.0.0.1'),
(115, 1379406043, 2, 1, 'user', 2, '127.0.0.1'),
(116, 1379406168, 2, 2, 'user', 2, '127.0.0.1'),
(117, 1379406179, 18, 1, 'user', 18, '127.0.0.1'),
(118, 1379410355, 18, 2, 'user', 18, '127.0.0.1'),
(119, 1379410357, 2, 1, 'user', 2, '127.0.0.1'),
(120, 1379474478, 2, 2, 'user', 2, '127.0.0.1'),
(121, 1379474546, 18, 1, 'user', 18, '127.0.0.1'),
(122, 1379474558, 18, 11, 'user', 18, '127.0.0.1'),
(123, 1379474639, 18, 2, 'user', 18, '127.0.0.1'),
(124, 1379474649, 3, 1, 'user', 3, '127.0.0.1'),
(125, 1379474693, 3, 2, 'user', 3, '127.0.0.1'),
(126, 1379474696, 2, 1, 'user', 2, '127.0.0.1');

-- --------------------------------------------------------

--
-- Table structure for table `activity_type`
--

CREATE TABLE IF NOT EXISTS `activity_type` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `activity_description` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'Activity Description',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=21 ;

--
-- Dumping data for table `activity_type`
--

INSERT INTO `activity_type` (`id`, `activity_description`) VALUES
(1, 'log in'),
(2, 'log out'),
(3, 'create user'),
(4, 'view user'),
(5, 'edit user'),
(6, 'manage user'),
(7, 'deactivate user'),
(8, 'activate user'),
(9, 'create profile'),
(10, 'view profile'),
(11, 'edit profile'),
(12, 'manage profile'),
(13, 'view owner profile'),
(14, 'edit owner profile'),
(15, 'create vacation'),
(16, 'view vacation'),
(17, 'edit vacation'),
(18, 'manage vacation'),
(19, 'view owner vacation'),
(20, 'edit owner vacation');

-- --------------------------------------------------------

--
-- Table structure for table `contract`
--

CREATE TABLE IF NOT EXISTS `contract` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `contract_start_date` int(11) NOT NULL COMMENT 'Contract start date',
  `contract_length` int(11) NOT NULL COMMENT 'Month',
  `contract_end_date` int(11) NOT NULL COMMENT 'Contract end date',
  `contract_stop_date` int(11) DEFAULT NULL COMMENT 'Contract stop date',
  `contract_stop_reason` varchar(1000) DEFAULT NULL COMMENT 'Reason stop contract',
  `type` enum('Probation Contract','Limitation Contract','Non Limitation Contract') NOT NULL COMMENT 'Contract Type',
  `employee_id` int(11) unsigned NOT NULL COMMENT 'Employee ID',
  `crreated_id` int(11) unsigned NOT NULL COMMENT 'Created ID',
  `updated_id` int(11) unsigned DEFAULT NULL COMMENT 'Updated ID',
  `contract_status` int(11) unsigned NOT NULL DEFAULT '1' COMMENT '1: working; 0: non-working;',
  `created_date` int(11) DEFAULT NULL COMMENT 'Contract Created Date',
  `updated_date` int(11) DEFAULT NULL COMMENT 'Contract updated Date',
  PRIMARY KEY (`id`),
  KEY `FK_contract_1` (`employee_id`),
  KEY `FK_contract_2` (`crreated_id`),
  KEY `FK_contract_3` (`updated_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `contract`
--


-- --------------------------------------------------------

--
-- Table structure for table `contract_salary`
--

CREATE TABLE IF NOT EXISTS `contract_salary` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `contract_start_date` int(11) DEFAULT NULL COMMENT 'Contract Start Date',
  `contract_end_date` int(11) DEFAULT NULL COMMENT 'Contract End Date',
  `contract_id` int(11) unsigned NOT NULL COMMENT 'Contract ID',
  `gross_salary` decimal(10,2) NOT NULL COMMENT 'Employee Gross Salary',
  `net_salary` decimal(10,2) NOT NULL COMMENT 'Employee Net Salary',
  `petrol_allowance` decimal(10,2) DEFAULT NULL COMMENT 'Employee Petrol Allowance',
  `lunch_allowance` decimal(10,2) DEFAULT NULL COMMENT 'Employee Lunch Allowance',
  `other_allowance` decimal(10,2) DEFAULT NULL COMMENT 'Employee Other Allowance',
  PRIMARY KEY (`id`),
  KEY `FK_contract_salary_1` (`contract_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `contract_salary`
--


-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE IF NOT EXISTS `department` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`id`, `name`, `description`) VALUES
(1, 'Bussiness', NULL),
(2, 'Programming', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE IF NOT EXISTS `employee` (
  `id` int(11) unsigned NOT NULL COMMENT 'Employee ID',
  `job_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'Employee Job Title',
  `degree` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Degree Type',
  `degree_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Degree Name',
  `background` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Background of Employee',
  `telephone` int(11) unsigned DEFAULT NULL,
  `mobile` int(11) unsigned DEFAULT NULL,
  `homeaddress` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Employee Home Address',
  `education` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci COMMENT 'Employee Education',
  `skill` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci COMMENT 'Employee Skills',
  `experience` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci COMMENT 'Employee Experience',
  `notes` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci COMMENT 'Employee Notes',
  `avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Employee Avatar',
  `cv` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Employee CV',
  `department_id` int(11) DEFAULT NULL COMMENT 'Department ID',
  `created_date` int(11) DEFAULT NULL COMMENT 'Employee Created Date',
  `updated_date` int(11) DEFAULT NULL COMMENT 'Employee Updated Date',
  `personal_email` varchar(255) DEFAULT NULL COMMENT 'Employee Personal Email',
  PRIMARY KEY (`id`),
  KEY `FK_employee_2` (`department_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`id`, `job_title`, `degree`, `degree_name`, `background`, `telephone`, `mobile`, `homeaddress`, `education`, `skill`, `experience`, `notes`, `avatar`, `cv`, `department_id`, `created_date`, `updated_date`, `personal_email`) VALUES
(2, 'HR Executive', 'Bachelors', 'aaaa', 'IT', 989280619, 989280619, 'aaaaaaaa', NULL, '<p>adasdasdasdasd</p>\r\n', NULL, NULL, NULL, NULL, 1, 1378460318, 1370427816, 'thituyen24@gmail.com'),
(3, 'Developer I', 'Bachelors', '', 'IT', 0, 0, '', '&aacute;dasd\r\n', 'adsasd\r\n', '&aacute;dasd\r\n', '&aacute;dasdas\r\n', NULL, NULL, 1, 1379301858, 1370429069, ''),
(18, 'Jr Developer', '', '', '', 0, 0, '', '', '', '', '', NULL, NULL, 2, 1379299248, NULL, ''),
(22, 'Developer II', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1378364310, NULL, NULL),
(23, 'Jr Developer', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1378441555, NULL, NULL),
(24, 'Jr Developer', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1378952567, NULL, NULL),
(25, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1379315422, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `employee_vacation`
--

CREATE TABLE IF NOT EXISTS `employee_vacation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `yearly_date` int(11) DEFAULT NULL COMMENT 'Number Vacation Date Yearly',
  `remaining_vacation` int(11) DEFAULT NULL COMMENT 'Remaining Vacation in Current Year',
  `employee_id` int(11) unsigned DEFAULT NULL COMMENT 'Employee ID',
  `year` int(11) DEFAULT NULL,
  `total_day_off` int(11) DEFAULT NULL COMMENT 'Total Date off in Current Year',
  `pre_year_date` int(11) DEFAULT NULL COMMENT 'Number Remaining Vacation in Last Year',
  PRIMARY KEY (`id`),
  KEY `FK_employee_vacation_1` (`employee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `employee_vacation`
--


-- --------------------------------------------------------

--
-- Table structure for table `message`
--

CREATE TABLE IF NOT EXISTS `message` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `types` int(11) unsigned NOT NULL COMMENT 'Message''s type',
  `status` int(11) unsigned DEFAULT NULL COMMENT 'Message''s status',
  `created_date` int(11) DEFAULT NULL COMMENT 'Created Date',
  `message_info` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'Message Content',
  `mod_user_id` int(11) unsigned NOT NULL COMMENT 'Receiver ID',
  `mod_sender_id` int(11) unsigned NOT NULL COMMENT 'Sender ID',
  `title` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'Title',
  PRIMARY KEY (`id`),
  KEY `FK_message_1` (`mod_user_id`),
  KEY `FK_message_2` (`mod_sender_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `message`
--


-- --------------------------------------------------------

--
-- Table structure for table `salary`
--

CREATE TABLE IF NOT EXISTS `salary` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID Monthly Salary',
  `employee_id` int(11) unsigned DEFAULT NULL COMMENT 'Employee ID',
  `net_salary` decimal(10,2) unsigned DEFAULT NULL COMMENT 'Employee Net Salary',
  `gross_salary` decimal(10,2) unsigned DEFAULT NULL COMMENT 'Employee Gross Salary',
  `month` int(11) unsigned DEFAULT NULL,
  `year` int(11) unsigned DEFAULT NULL,
  `petrol_allowance` decimal(10,2) DEFAULT NULL COMMENT 'Employee Petrol Allowance',
  `lunch_allowance` decimal(10,2) DEFAULT NULL COMMENT 'Employee Lunch Allowance',
  `other_allowance` decimal(10,2) DEFAULT NULL COMMENT 'Employee Other Allowance',
  `price` decimal(10,2) DEFAULT NULL COMMENT 'Exchange Rate',
  PRIMARY KEY (`id`),
  UNIQUE KEY `SALARY_UNIQUE` (`employee_id`,`month`,`year`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `salary`
--


-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'User ID',
  `firstname` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'User First Name',
  `lastname` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'User Last Name',
  `fullname` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'User Full Name',
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'User Email',
  `dob` int(11) NOT NULL COMMENT 'Date of Birth',
  `password` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'User Password',
  `activkey` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'User Activkey',
  `status` int(1) unsigned NOT NULL DEFAULT '0' COMMENT 'User Status: 0 Noactive, 1 Active, 2 Banned',
  `lastvisit` int(11) DEFAULT NULL COMMENT 'User Lastvisit',
  `created_date` int(11) DEFAULT NULL COMMENT 'User Create Date',
  `type` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '0: Non Supper Admin, 1: Supper Admin',
  `updated_date` int(11) DEFAULT NULL COMMENT 'User Update Date',
  `roles` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=26 ;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `firstname`, `lastname`, `fullname`, `email`, `dob`, `password`, `activkey`, `status`, `lastvisit`, `created_date`, `type`, `updated_date`, `roles`) VALUES
(1, 'Admin', 'EMS', 'Admin EMS', 'adm.ems.project@gmail.com', -25200, '61bd60c60d9fb60cc8fc7767669d40a1', NULL, 1, 1370533160, 1370073600, 1, 1378448109, 2),
(2, 'Tuyen', 'Nguyen', 'Nguyen Thi Tuyen', 'thituyen24@gmail.com', 638380800, '61bd60c60d9fb60cc8fc7767669d40a1', NULL, 1, 1370701682, 1370427816, 0, 1378448216, 1),
(3, 'Tuan', 'Tran', 'Tran Thanh Tuan', 'tuandeveloper@gmail.com', 561219955, '61bd60c60d9fb60cc8fc7767669d40a1', NULL, 1, 1376648334, 1370429069, 0, 1370533120, 0),
(18, 'thanhnghia', 'thanhnghia', 'thanhnghia', 'thanhnghia274@gmail.com', 1378137600, '61bd60c60d9fb60cc8fc7767669d40a1', '6f5f2bf768f7ebef1490bf5be145b68f', 1, NULL, 1378181687, 0, 1378183015, 2),
(22, 'dry', 'dhfdh', 'dhdfh', 'thituyen@gmail.com', 1375718400, '7a2704565b901024a2c0190ef3d8eb1e', '7c46aae1567a679fd8d482ae1fd9535f', 0, NULL, 1378364310, 0, NULL, 2),
(23, 'gfb', 'gffff', 'gffffff', 'thituyen24@gmail.com', 1378742400, 'ed49f226734685ab1074d9c47a723114', 'acd016a34cee16dea803a9e7bfb49539', 0, NULL, 1378441555, 0, NULL, 2),
(24, 'tuyen', 'tuyen', 'tuyen', 'tuyen.developer@gmail.com', 1378828800, '6e57f6e86d57b5d5ba9cdf13ee334890', '8a70ccec324a0fce500c017780e51f4a', 0, NULL, 1378952566, 0, NULL, 3),
(25, 'カナ', 'Nguyen', 'カナ', 'thituyen24@gmail.com', 1375718400, 'd46a3b7f518800551d52cc43da85fb4f', 'e97d0873f7f5e5ea257e9084d285e10d', 0, NULL, 1379315422, 0, NULL, 2);

-- --------------------------------------------------------

--
-- Table structure for table `vacation`
--

CREATE TABLE IF NOT EXISTS `vacation` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `start_date` int(11) NOT NULL COMMENT 'Vacation start date',
  `end_date` int(11) NOT NULL COMMENT 'Vacation end date',
  `total` decimal(4,1) NOT NULL COMMENT 'Vacation total date',
  `type` int(11) NOT NULL COMMENT '1:vacation, 2:illness, 3:wedding, 4:bereavement, 5:maternity;',
  `reason` varchar(2000) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'Reason for Vacation',
  `user_id` int(11) unsigned NOT NULL COMMENT 'User Request Vacation',
  `approve_id` int(11) unsigned DEFAULT NULL COMMENT 'User Approve Vacation',
  `created_date` int(11) DEFAULT NULL COMMENT 'Vacation Created Date',
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '1:waiting, 2:pending, 3:accept, 4:cancel, 5:decline;',
  `updated_date` int(11) DEFAULT NULL COMMENT 'Vacation Updated Date',
  `request_day` int(12) NOT NULL,
  `time` enum('am','pm') DEFAULT NULL,
  `comment_one` longtext NOT NULL,
  `comment_two` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_vacation_1` (`user_id`),
  KEY `FK_vacation_2` (`approve_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=67 ;

--
-- Dumping data for table `vacation`
--

INSERT INTO `vacation` (`id`, `start_date`, `end_date`, `total`, `type`, `reason`, `user_id`, `approve_id`, `created_date`, `status`, `updated_date`, `request_day`, `time`, `comment_one`, `comment_two`) VALUES
(1, 45000, 403200, '2.5', 1, '<p>sfsdferterterterter</p>\r\n\r\n<p>ertertert</p>\r\n\r\n<p>erter</p>\r\n\r\n<p>tert</p>\r\n\r\n<p>ertert</p>\r\n\r\n<p>ert</p>\r\n\r\n<p>erter</p>\r\n\r\n<p>etr</p>\r\n\r\n<p>ter</p>\r\n\r\n<p>terter</p>\r\n\r\n<p>erter</p>\r\n', 2, NULL, 1379306757, 4, NULL, 1379476844, 'pm', '', 'ertertertert'),
(2, 27000, 45000, '0.5', 3, 'sfsdf\r\n', 2, NULL, 1379307310, 1, NULL, 1379307310, 'am', '', ''),
(3, 27000, 45000, '0.5', 2, '<p>sdfsdfyrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr</p>\r\n\r\n<p>rrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr</p>\r\n\r\n<p>rrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr</p>\r\n\r\n<p>rrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrry</p>\r\n\r\n<p>ryyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>r</p>\r\n', 2, NULL, 1379307366, 1, NULL, 1379477158, 'am', '', ''),
(4, 27000, 45000, '0.5', 2, 'sdfsdf\r\n', 2, NULL, 1379307405, 1, NULL, 1379307405, 'am', '', ''),
(5, 27000, 45000, '0.5', 1, 'sfsdf\r\n', 2, NULL, 1379315350, 1, NULL, 1379315350, 'am', '', ''),
(6, 27000, 45000, '0.5', 4, 'asdasd\r\n', 2, NULL, 1379315442, 1, NULL, 1379315442, 'am', '', ''),
(7, 27000, 45000, '0.5', 2, 'as\r\n', 2, NULL, 1379315641, 1, NULL, 1379315641, 'am', '', ''),
(8, 27000, 403200, '2.0', 3, 'sdfsdfsdf\r\n', 2, NULL, 1379315828, 4, NULL, 1379315828, 'am', '', 'erterteeeeeeeeeeeeeeeeeeeee'),
(9, 27000, 45000, '0.5', 3, '<h3 class="flash_info" style="outline: none; margin: 4px 0px; padding: 4px; border: 0px; font-weight: normal; font-size: 13px; font-family: Arial, Helvetica, sans-serif; vertical-align: baseline; background-color: rgb(255, 215, 0); color: rgb(51, 51, 51); text-align: center; border-top-left-radius: 4px; border-top-right-radius: 4px; border-bottom-right-radius: 4px; border-bottom-left-radius: 4px; text-decoration: blink; line-height: 18px;">&nbsp;</h3>\r\n\r\n<p style="outline: none; margin: 1em 0px; padding: 0px; border: 0px; font-style: inherit; font-size: 16px; font-family: ''Times New Roman''; vertical-align: baseline; line-height: 20px; color: rgb(0, 0, 0); background-color: rgb(244, 245, 246);">nh Phạm Văn Tường (44 tuổi) sống cạnh b&ecirc;n nhận định, ngo&agrave;i vợ chồng &ocirc;ng Nguyễn Văn Y (44 tuổi) v&agrave; chị L&ecirc; Thị Chung (39 tuổi, qu&ecirc; Thanh H&oacute;a), trong nh&agrave; c&ograve;n c&oacute; 2 b&eacute; g&aacute;i, khả năng đang kẹt b&ecirc;n trong. Trong khi lửa vẫn b&ugrave;ng ch&aacute;y dữ dội dưới tầng trệt, mọi người h&ograve; nhau ph&aacute; cửa b&ecirc;n h&ocirc;ng của căn nh&agrave;. &ldquo;T&ocirc;i chạy l&ecirc;n ph&ograve;ng ngủ tr&ecirc;n lầu th&igrave; thấy 2 b&eacute; nằm bất động, người &aacute;m đầy kh&oacute;i&rdquo;, anh Tường kể.</p>\r\n\r\n<p class="Normal" style="outline: none; margin: 1em 0px; padding: 0px; border: 0px; font-style: inherit; font-size: 16px; font-family: ''Times New Roman ''; vertical-align: baseline; color: rgb(0, 0, 0); line-height: 20px; background-color: rgb(244, 245, 246);">D</p>\r\n', 2, NULL, 1379315991, 4, NULL, 1379476236, 'am', '', 'sfsdfsdfsdfsdf'),
(10, 1379392200, 1379565000, '2.0', 4, '<p>dfgdfgd</p>\r\n', 2, NULL, 1379316385, 4, NULL, 1379411699, 'pm', '', 'htyhtyh'),
(11, 45000, 57600, '0.5', 3, 'adasd\r\n', 2, NULL, 1379317334, 1, NULL, 1379317334, 'pm', '', ''),
(12, 27000, 45000, '0.5', 2, 'adasda\r\n', 2, NULL, 1379317408, 1, NULL, 1379317408, 'am', '', ''),
(13, 27000, 45000, '0.5', 2, 'When using &#39;compare&#39; rule for date fields the validation can fail if the date format is not in the default format, example:\r\n\r\npublic function rules()\r\n{\r\narray(&#39;start_date, end_date&#39;,&#39;date&#39;,&#39;format&#39;=&gt;&#39;dd-MM-yyyy&#39;)\r\narray(&#39;end_date&#39;, &#39;compare&#39;, &#39;compareAttribute&#39;=&gt;&#39;start_date&#39;, &#39;operator&#39;=&gt;&#39;&gt;&#39;),\r\n}\r\n\r\nIf, start_date=25-05-2012 AND end_date=20-06-2012 the comparison raises a failure. This is because the date comparison validator uses datetimestamps and it does not convert textual dates into timestamps.\r\n\r\nHowever, since all the information is set at the rules function, i.e. the date formats, the validation should be work fine and the user should not be forced to either create a custom validation rule or extende beforeValidate() method..\r\n', 2, NULL, 1379320953, 1, NULL, 1379320953, 'am', '', ''),
(14, 27000, 45000, '0.5', 3, 'When using &#39;compare&#39; rule for date fields the validation can fail if the date format is not in the default format, example:\r\n\r\npublic function rules()\r\n{\r\narray(&#39;start_date, end_date&#39;,&#39;date&#39;,&#39;format&#39;=&gt;&#39;dd-MM-yyyy&#39;)\r\narray(&#39;end_date&#39;, &#39;compare&#39;, &#39;compareAttribute&#39;=&gt;&#39;start_date&#39;, &#39;operator&#39;=&gt;&#39;&gt;&#39;),\r\n}\r\n\r\nIf, start_date=25-05-2012 AND end_date=20-06-2012 the comparison raises a failure. This is because the date comparison validator uses datetimestamps and it does not convert textual dates into timestamps.\r\n\r\nHowever, since all the information is set at the rules function, i.e. the date formats, the validation should be work fine and the user should not be forced to either create a custom validation rule or extende beforeValidate() method..\r\n', 2, NULL, 1379321020, 1, NULL, 1379321020, 'am', '', ''),
(15, 27000, 576000, '4.0', 3, 'adasda\r\n', 2, NULL, 1379322620, 1, NULL, 1379322620, 'am', '', ''),
(16, 27000, 477000, '2.5', 2, 'adasdas\r\n', 2, NULL, 1379322790, 1, NULL, 1379322790, 'am', '', ''),
(17, 27000, 477000, '2.5', 2, 'adasdas\r\n', 2, NULL, 1379322894, 1, NULL, 1379322894, 'am', '', ''),
(18, 27000, 477000, '2.5', 2, 'adasdas\r\n', 2, NULL, 1379322921, 1, NULL, 1379322921, 'am', '', ''),
(19, 27000, 662400, '5.0', 3, 'adasd\r\n', 2, NULL, 1379322942, 1, NULL, 1379322942, 'am', '', ''),
(20, 27000, 649800, '4.5', 4, 'adasda\r\n', 2, NULL, 1379323105, 1, NULL, 1379323105, 'am', '', ''),
(21, 27000, 489600, '3.0', 2, '&aacute;dasda\r\n', 2, NULL, 1379323116, 1, NULL, 1379323116, 'am', '', ''),
(22, 27000, 576000, '4.0', 4, 'etertert\r\n', 2, NULL, 1379324681, 1, NULL, 1379324681, 'am', '', ''),
(23, 27000, 563400, '3.5', 2, '&ecirc;trtertert\r\n', 2, NULL, 1379324786, 1, NULL, 1379324786, 'am', '', ''),
(24, 27000, 489600, '3.0', 4, 'sfsdfsdf\r\n', 2, NULL, 1379325072, 1, NULL, 1379325072, 'am', '', ''),
(25, 27000, 489600, '3.0', 4, 'sfsdfsdf\r\n', 2, NULL, 1379325083, 1, NULL, 1379325083, 'am', '', ''),
(26, 27000, 477000, '2.5', 2, 'adasd\r\n', 2, NULL, 1379325342, 1, NULL, 1379325342, 'am', '', ''),
(27, 45000, 8253000, '66.0', 5, 'adasd\r\n', 2, NULL, 1379325432, 1, NULL, 1379325432, 'pm', '', ''),
(28, 45000, 8253000, '66.0', 5, 'adasd\r\n', 2, NULL, 1379325483, 1, NULL, 1379325483, 'pm', '', ''),
(29, 45000, 8253000, '66.0', 5, 'adasd\r\n', 2, NULL, 1379325778, 1, NULL, 1379325778, 'pm', '', ''),
(30, 45000, 8253000, '66.0', 5, 'adasd\r\n', 2, NULL, 1379325889, 2, NULL, 1379325889, 'pm', '', ''),
(31, 45000, 8253000, '66.0', 5, 'adasd\r\n', 2, NULL, 1379325965, 1, NULL, 1379325965, 'pm', '', ''),
(32, 27000, 403200, '2.0', 3, 'uyutyu\r\n', 2, NULL, 1379326580, 1, NULL, 1379326580, 'am', '', ''),
(33, 27000, 477000, '2.5', 2, 'utyuty\r\n', 2, NULL, 1379326600, 1, NULL, 1379326600, 'am', '', ''),
(34, 27000, 489600, '3.0', 3, 'j;j;l\r\n', 2, NULL, 1379385553, 1, NULL, 1379385553, 'am', '', ''),
(35, 27000, 477000, '2.5', 2, 'asdasd\r\n', 2, NULL, 1379385997, 1, NULL, 1379385997, 'am', '', ''),
(36, 27000, 477000, '2.5', 3, 'hljkljk\r\n', 2, NULL, 1379386051, 1, NULL, 1379386051, 'am', '', ''),
(37, 1379374200, 1379565000, '2.5', 2, '<p>sdfsdf</p>\r\n', 2, NULL, NULL, 1, NULL, 1379386129, 'am', '', ''),
(38, 1379374200, 1379565000, '2.5', 2, '<p>sdfsdf</p>\r\n', 2, NULL, NULL, 1, NULL, 1379386142, 'am', '', ''),
(39, 1379374200, 1379577600, '3.0', 1, '<p>ertert</p>\r\n', 2, NULL, NULL, 1, NULL, 1379386154, 'am', '', ''),
(40, 1379374200, 1379491200, '2.0', 2, '<p>sdfsdf</p>\r\n', 2, NULL, NULL, 1, NULL, 1379386181, 'am', '', ''),
(41, 1379374200, 1379664000, '4.0', 4, '<p>sick</p>\r\n', 2, NULL, NULL, 1, NULL, 1379386259, 'am', '', ''),
(42, 1379392200, 1380096000, '6.5', 3, '<p>my wedding</p>\r\n', 2, NULL, NULL, 1, NULL, 1379386321, 'pm', '', ''),
(43, 1379374200, 1384502400, '44.0', 4, '<p>fdvbdfbgf</p>\r\n', 2, NULL, NULL, 1, NULL, 1379387185, 'am', '', ''),
(44, 1379392200, 1379682000, '4.0', 2, '<p>dbdfgd</p>\r\n', 2, NULL, NULL, 1, NULL, 1379389275, 'am', '', ''),
(45, 1379392200, 1379410200, '0.5', 2, '<p>adcasd</p>\r\n', 2, NULL, NULL, 1, NULL, 1379389443, 'am', '', ''),
(46, 1379374200, 1379565000, '2.5', 2, '<p>adasd</p>\r\n', 2, NULL, NULL, 1, NULL, 1379389538, 'am', '', ''),
(47, 1379374200, 1379392200, '0.5', 2, '<p>adasd</p>\r\n', 2, NULL, NULL, 1, NULL, 1379389566, 'am', '', ''),
(48, 1379374200, 1379577600, '3.0', 2, '<p>ấdasdas</p>\r\n', 2, NULL, NULL, 1, NULL, 1379389590, 'am', '', ''),
(49, 1379375200, 1379405800, '1.0', 1, '<p>&aacute;dasd</p>\r\n', 2, NULL, NULL, 1, NULL, 1379389994, 'am', '', ''),
(50, 1379378200, 1379408800, '1.0', 1, '<p>&aacute;dasd</p>\r\n', 2, NULL, NULL, 1, NULL, 1379390100, 'am', '', ''),
(51, 1379394200, 1379493200, '1.5', 1, '<p>adas</p>\r\n', 2, NULL, NULL, 1, NULL, 1379390145, 'pm', '', ''),
(52, 1379653200, 1379671200, '0.5', 2, '<p>adasd</p>\r\n', 2, NULL, NULL, 1, NULL, 1379390625, 'am', '', ''),
(53, 1379377800, 1379568600, '2.5', 2, '<p>sfsdf</p>\r\n', 2, NULL, NULL, 1, NULL, 1379390728, 'am', '', ''),
(54, 1379377800, 1379568600, '2.5', 1, '<p>wer</p>\r\n', 2, NULL, NULL, 1, NULL, 1379390793, 'am', '', ''),
(55, 1379377800, 1379408400, '1.0', 1, '<p>&aacute;dasd</p>\r\n', 2, NULL, NULL, 1, NULL, 1379390850, 'am', '', ''),
(56, 1379394000, 1379406600, '0.5', 1, '<p>&aacute;dasd</p>\r\n', 2, NULL, NULL, 1, NULL, 1379390878, 'pm', '', ''),
(57, 1379377800, 1379408400, '1.0', 1, '<p>dfhdfh</p>\r\n', 2, NULL, NULL, 1, NULL, 1379390986, 'am', '', ''),
(58, 1379374200, 1379392200, '0.5', 1, '<p>&aacute;das</p>\r\n', 2, NULL, NULL, 1, NULL, 1379391128, 'am', '', ''),
(59, 27000, 403200, '2.0', 1, '<p style="color: rgb(0, 0, 0); font-family: verdana, arial, helvetica, sans-serif; font-size: 14px;">my son sick, i need go to hopistal</p>\r\n', 2, NULL, NULL, 4, NULL, 1379477299, 'am', '', 'OK'),
(60, 1379374200, 1384502400, '44.0', 3, '<p>&aacute;dfasfa</p>\r\n', 2, NULL, NULL, 1, NULL, 1379391546, 'am', '', ''),
(61, 1379374200, 1379478600, '1.5', 1, '<p>aaaaaaaaaaaaaaaaaaaaaaaaaa</p>\r\n', 2, NULL, NULL, 1, NULL, 1379391874, 'am', '', ''),
(62, 1379374200, 1379565000, '2.5', 3, '<h2 class="h2leadHN" style="font-weight: normal; font-size: 12px; font-family: arial; color: rgb(0, 0, 0); margin: 0px 0px 10px; background-color: rgb(244, 245, 246);">Ban Ki-moon n&oacute;i &ocirc;ng cảm thấy &quot;ớn lạnh&quot; v&igrave; bản b&aacute;o c&aacute;o của Li&ecirc;n Hợp Quốc cho thấy bằng chứng r&otilde; r&agrave;ng v&agrave; thuyết phục, về việc vũ kh&iacute; h&oacute;a học được sử dụng trong vụ tấn&nbsp;c&ocirc;ng ở Syria l&agrave;m chết hơn 1.400 người h&ocirc;m 21/8.&nbsp;</h2>\r\n', 2, NULL, NULL, 1, NULL, 1379399531, 'am', '', ''),
(63, 1379374200, 1379478600, '1.5', 1, '<p class="Normal" style="font-family: ''Times New Roman ''; font-size: 16px; color: rgb(0, 0, 0); line-height: 20px; margin: 1em 0px; background-color: rgb(244, 245, 246);">C&aacute;c mẫu kiểm tra m&ocirc;i trường, h&oacute;a học v&agrave; y tế m&agrave; ch&uacute;ng t&ocirc;i thu thập được cung cấp bằng chứng r&otilde; r&agrave;ng v&agrave; thuyết phục rằng một t&ecirc;n lửa đất đối đất mang theo chất độc thần kinh Sarin đ&atilde; được sử dụng ở Ghouta&quot;, &nbsp;bản b&aacute;o c&aacute;o của thanh s&aacute;t vi&ecirc;n Li&ecirc;n Họp Quốc cho biết.</p>\r\n\r\n<p class="Normal" style="font-family: ''Times New Roman ''; font-size: 16px; color: rgb(0, 0, 0); line-height: 20px; margin: 1em 0px; background-color: rgb(244, 245, 246);">C&aacute;c chuy&ecirc;n gia kết luận &quot;vũ kh&iacute; h&oacute;a học đ&atilde; được sử dụng trong c&aacute;c cuộc xung đột giữa c&aacute;c b&ecirc;n trong Syria, chống lại cả thường d&acirc;n v&agrave; trẻ em tr&ecirc;n quy m&ocirc; tương đối lớn&quot;.</p>\r\n\r\n<p class="Normal" style="font-family: ''Times New Roman ''; font-size: 16px; color: rgb(0, 0, 0); line-height: 20px; margin: 1em 0px; background-color: rgb(244, 245, 246);">Tổng thư k&yacute; Li&ecirc;n Hợp Quốc Ban Ki-moon&nbsp;<span style="font-size: 11.8pt;">cho biết bản b&aacute;o c&aacute;o của c&aacute;c chuy&ecirc;n gia khiến &ocirc;ng &quot;ớn lạnh khi đọc&quot;. &Ocirc;ng l&ecirc;n &aacute;n h&agrave;nh động sử dụng vũ kh&iacute; h&oacute;a học ở Syria l&agrave; một &quot;tội &aacute;c chiến tranh&quot;&nbsp;</span></p>\r\n', 2, NULL, NULL, 4, NULL, 1379399584, 'am', '', 'rtyrtyrtttttttttttttttttttttttttttttttttttttttttttttttttttttttttttty'),
(64, 1379374200, 1379478600, '1.5', 2, '<p>thanh thanh thanh thanh thanh thanh thanh thanh thanh thanh thanh thanh thanh thanh</p>\r\n\r\n<p>thanh thanh thanh thanh thanh thanh thanh thanhath</p>\r\n\r\n<p>ajdhas</p>\r\n\r\n<p>adfjklasf</p>\r\n\r\n<p>afklasfjlasdf</p>\r\n', 2, NULL, NULL, 4, NULL, 1379401619, 'am', '', 'fyfutyutyutyuty'),
(65, 1379374200, 1379491200, '2.0', 4, '<p>dfgdfgdfgdf</p>\r\n', 3, NULL, NULL, 1, NULL, 1379405945, 'am', '', ''),
(66, 1379460600, 1379577600, '2.0', 1, '<p>adasdasd</p>\r\n', 3, NULL, NULL, 1, NULL, 1379474685, 'am', '', '');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `activity_log`
--
ALTER TABLE `activity_log`
  ADD CONSTRAINT `FK_activity_log_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_activity_log_2` FOREIGN KEY (`action_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_activity_log_3` FOREIGN KEY (`activity_type`) REFERENCES `activity_type` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `contract`
--
ALTER TABLE `contract`
  ADD CONSTRAINT `FK_contract_1` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_contract_2` FOREIGN KEY (`crreated_id`) REFERENCES `employee` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_contract_3` FOREIGN KEY (`updated_id`) REFERENCES `employee` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `contract_salary`
--
ALTER TABLE `contract_salary`
  ADD CONSTRAINT `FK_contract_salary_1` FOREIGN KEY (`contract_id`) REFERENCES `contract` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `FK_employee_1` FOREIGN KEY (`id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `employee_vacation`
--
ALTER TABLE `employee_vacation`
  ADD CONSTRAINT `FK_employee_vacation_1` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `message`
--
ALTER TABLE `message`
  ADD CONSTRAINT `FK_message_1` FOREIGN KEY (`mod_user_id`) REFERENCES `employee` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_message_2` FOREIGN KEY (`mod_sender_id`) REFERENCES `employee` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `salary`
--
ALTER TABLE `salary`
  ADD CONSTRAINT `FK_salary_1` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `vacation`
--
ALTER TABLE `vacation`
  ADD CONSTRAINT `FK_vacation_1` FOREIGN KEY (`user_id`) REFERENCES `employee` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_vacation_2` FOREIGN KEY (`approve_id`) REFERENCES `employee` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
