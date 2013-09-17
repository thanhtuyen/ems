-- phpMyAdmin SQL Dump
-- version 3.2.4
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Sep 13, 2013 at 06:48 PM
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=58 ;

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
(57, 1379048060, 2, 1, 'user', 2, '127.0.0.1');

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
(3, 'Developer I', 'Bachelors', '', 'IT', 0, 0, '', '&aacute;dasd\r\n', 'adsasd\r\n', '&aacute;dasd\r\n', '&aacute;dasdas\r\n', NULL, 'ACC_VN.docx', 1, 1379055313, 1370429069, ''),
(18, 'Jr Developer', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 1378181687, NULL, NULL),
(22, 'Developer II', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1378364310, NULL, NULL),
(23, 'Jr Developer', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1378441555, NULL, NULL),
(24, 'Jr Developer', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1378952567, NULL, NULL);

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=25 ;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `firstname`, `lastname`, `fullname`, `email`, `dob`, `password`, `activkey`, `status`, `lastvisit`, `created_date`, `type`, `updated_date`, `roles`) VALUES
(1, 'Admin', 'EMS', 'Admin EMS', 'adm.ems.project@gmail.com', -25200, '61bd60c60d9fb60cc8fc7767669d40a1', NULL, 1, 1370533160, 1370073600, 1, 1378448109, 2),
(2, 'Tuyen', 'Nguyen', 'Nguyen Thi Tuyen', 'thituyen24@gmail.com', 638380800, '61bd60c60d9fb60cc8fc7767669d40a1', NULL, 1, 1370701682, 1370427816, 0, 1378448216, 1),
(3, 'Tuan', 'Tran', 'Tran Thanh Tuan', 'tuandeveloper@gmail.com', 561219955, '61bd60c60d9fb60cc8fc7767669d40a1', NULL, 1, 1376648334, 1370429069, 0, 1370533120, 0),
(18, 'thanhnghia', 'thanhnghia', 'thanhnghia', 'thanhnghia274@gmail.com', 1378137600, 'd8a29a2b64302c0faf82ca409f9a6b1a', '6f5f2bf768f7ebef1490bf5be145b68f', 1, NULL, 1378181687, 0, 1378183015, 3),
(22, 'dry', 'dhfdh', 'dhdfh', 'thituyen@gmail.com', 1375718400, '7a2704565b901024a2c0190ef3d8eb1e', '7c46aae1567a679fd8d482ae1fd9535f', 0, NULL, 1378364310, 0, NULL, 2),
(23, 'gfb', 'gffff', 'gffffff', 'thituyen24@gmail.com', 1378742400, 'ed49f226734685ab1074d9c47a723114', 'acd016a34cee16dea803a9e7bfb49539', 0, NULL, 1378441555, 0, NULL, 2),
(24, 'tuyen', 'tuyen', 'tuyen', 'tuyen.developer@gmail.com', 1378828800, '6e57f6e86d57b5d5ba9cdf13ee334890', '8a70ccec324a0fce500c017780e51f4a', 0, NULL, 1378952566, 0, NULL, 3);

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
  `comment` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_vacation_1` (`user_id`),
  KEY `FK_vacation_2` (`approve_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `vacation`
--


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
