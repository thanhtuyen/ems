-- phpMyAdmin SQL Dump
-- version 3.2.4
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Aug 19, 2013 at 02:28 PM
-- Server version: 5.1.41
-- PHP Version: 5.3.1

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `hrm`
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `activity_log`
--


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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `department`
--


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
  `department` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Department ID',
  `created_date` int(11) DEFAULT NULL COMMENT 'Employee Created Date',
  `updated_date` int(11) DEFAULT NULL COMMENT 'Employee Updated Date',
  `personal_email` varchar(255) DEFAULT NULL COMMENT 'Employee Personal Email',
  PRIMARY KEY (`id`),
  KEY `FK_employee_2` (`department`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`id`, `job_title`, `degree`, `degree_name`, `background`, `telephone`, `mobile`, `homeaddress`, `education`, `skill`, `experience`, `notes`, `avatar`, `cv`, `department`, `created_date`, `updated_date`, `personal_email`) VALUES
(2, 'Senior Developer', 'Bachelors', NULL, 'IT', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Software', 1370427816, 1370427816, NULL),
(3, 'Developer I', 'Bachelors', NULL, 'IT', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Software', 1370429069, 1370429069, NULL);

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
  `user_role` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=17 ;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `firstname`, `lastname`, `fullname`, `email`, `dob`, `password`, `activkey`, `status`, `lastvisit`, `created_date`, `type`, `updated_date`, `user_role`) VALUES
(1, 'Admin', 'EMS', 'Admin EMS', 'adm.ems.project@gmail.com', 561196800, '61bd60c60d9fb60cc8fc7767669d40a1', NULL, 1, 1370533160, 1370073600, 1, 1370533160, 0),
(2, 'Tuyen', 'Nguyen', 'Nguyen Thi Tuyen', 'thituyen24@gmail.com', 638443415, '61bd60c60d9fb60cc8fc7767669d40a1', NULL, 1, 1370701682, 1370427816, 0, 1370701682, 0),
(3, 'Tuan', 'Tran', 'Tran Thanh Tuan', 'tuandeveloper@gmail.com', 561219955, '61bd60c60d9fb60cc8fc7767669d40a1', NULL, 1, 1376648334, 1370429069, 0, 1370533120, 0),
(4, 'abc', 'abc', 'abc', 'a@gmail.com', -742892400, '01b1ca1fc25eaa57a1a7a213dee84e24', '137f49aa1e7655b855b84d54eb210698', 0, NULL, 1376642405, 0, NULL, 0),
(5, 'abc', 'abc', 'abc', 'a@gmail.com', -742892400, '3ebfa7143f3f1116e9a2c6029bcff6ba', '3035cafe6a3bdf29cc8160eb9164515b', 0, NULL, 1376642466, 0, NULL, 0),
(6, 'abc', 'abc', 'abc', 'a@gmail.com', -742892400, '1c502d03fa21f4bba9c21ce164bc7551', '0afab5741f9fd155463a8e1c43d042ec', 0, NULL, 1376642478, 0, NULL, 0),
(7, 'カナ', 'abc', 'カナ', 'a@gmail.com', -742892400, '475c9af4dc7c38ae04eae5ca82d78eec', '4f3e85855a68d13930df4d9dfa604010', 0, NULL, 1376642509, 0, NULL, 0),
(8, 'カナ', 'Tran', 'カナ', 'a@gmail.com', -742892400, 'e122c530138a192720b58218d9d452b8', '22517f7e4b768a9040cb10c90466fef8', 0, NULL, 1376642539, 0, NULL, 0),
(9, 'カナ', 'Tran', 'カナ', 'thituyen@gmail.com', 1371657600, 'b2de8088b78b593690f697ae581d3b13', 'ff1e50fc8929a4020e8aa8bca2bd5800', 0, NULL, 1376642738, 0, NULL, 0),
(10, 'カナ', 'tttt', 'カナ', 'thituyen@gmail.com', 1371657600, '317122d0e8d9c57b8014c0fddfaa5d93', '806100ab154fc3a6ecaa715bf549cff1', 0, NULL, 1376642763, 0, NULL, 0),
(11, 'TNT3', 'Tran', 'カナ', 'thituyen@gmail.com', 1371657600, '275cfcb6208e2a63196dc6ffdbc4bdd4', 'e70192abf0f8b604b3cfc78695782a4b', 0, NULL, 1376642802, 0, NULL, 0),
(12, 'TNT3', 'Tran', 'カナ', 'thituyen@gmail.com', 1371657600, 'e357185e4cb66e21119cbc698644a518', 'b20f6ffadcf59b356051a63c63ac2b3f', 0, NULL, 1376642808, 0, NULL, 0),
(13, 'TNT3', 'Tran', 'カナ', 'thituyen@gmail.com', 1371657600, '70d786678075b0115bc48d78dbeed39b', '572c028a50fc68eeadb88d2f4dfbb846', 0, NULL, 1376642810, 0, NULL, 0),
(14, 'カナ', 'Tran', 'カナ', 'thituyen24@gmail.com', 1371657600, '697f654665324617d45c6cdaaa6f5547', 'f3feb8aa20812dec83e9183cdddfd7ee', 0, NULL, 1376643208, 0, NULL, 0),
(15, 'カナ', 'Tran', 'カナ', 'thituyen24@gmail.com', 1371657600, '1e23fd23414e72faf42b99907d0d2a22', '8fcdf239897b6104d7370efc87434f24', 0, NULL, 1376643356, 0, NULL, 0),
(16, 'カナ', 'tttt', 'カナ', 'thituyen24@gmail.com', 1371657600, 'e5291d24c3acb38c29723004621ea5ef', '22ef62c776d17c25da8ca329dab183e1', 0, NULL, 1376643370, 0, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `vacation`
--

CREATE TABLE IF NOT EXISTS `vacation` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `start_date` int(11) NOT NULL COMMENT 'Vacation start date',
  `end_date` int(11) NOT NULL COMMENT 'Vacation end date',
  `total_date` decimal(4,1) NOT NULL COMMENT 'Vacation total date',
  `type` int(11) NOT NULL COMMENT '1:vacation, 2:illness, 3:wedding, 4:bereavement, 5:maternity;',
  `reason` varchar(2000) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'Reason for Vacation',
  `user_id` int(11) unsigned NOT NULL COMMENT 'User Request Vacation',
  `approve_id` int(11) unsigned DEFAULT NULL COMMENT 'User Approve Vacation',
  `created_date` int(11) DEFAULT NULL COMMENT 'Vacation Created Date',
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '1:waiting, 2:pending, 3:accept, 4:cancel, 5:decline;',
  `updated_date` int(11) DEFAULT NULL COMMENT 'Vacation Updated Date',
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
