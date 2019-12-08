-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 08, 2019 at 10:12 PM
-- Server version: 10.1.36-MariaDB
-- PHP Version: 7.2.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `airport`
--

-- --------------------------------------------------------

--
-- Table structure for table `airplane`
--

CREATE TABLE `airplane` (
  `Reg_No` int(11) NOT NULL,
  `Hangar_number` int(11) NOT NULL,
  `Plane_model` varchar(10) COLLATE utf8_bin NOT NULL,
  `Owner_id` int(11) NOT NULL,
  `Pdate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `airplane`
--

INSERT INTO `airplane` (`Reg_No`, `Hangar_number`, `Plane_model`, `Owner_id`, `Pdate`) VALUES
(1, 1, 'C1200', 6, '2010-05-12'),
(2, 1, 'C1200', 7, '2008-04-13'),
(3, 2, 'CZ1211', 8, '2004-07-22'),
(4, 2, 'CZ1211', 9, '2006-02-14'),
(5, 2, 'C1200', 9, '2011-06-17'),
(6, 2, 'CZ1211', 10, '2002-04-19'),
(7, 2, 'B2000', 10, '2011-11-12'),
(8, 3, 'Columbus', 1, '2013-04-20'),
(9, 4, 'Sovereign', 2, '2015-11-02'),
(10, 4, 'Sovereign', 3, '2013-06-06'),
(11, 5, 'Embraer', 4, '2012-07-07'),
(12, 5, 'Embraer', 5, '2015-01-11');

-- --------------------------------------------------------

--
-- Table structure for table `corporation`
--

CREATE TABLE `corporation` (
  `Name` varchar(255) COLLATE utf8_bin NOT NULL,
  `Phone` char(11) COLLATE utf8_bin DEFAULT NULL,
  `Address` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `Owner_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `corporation`
--

INSERT INTO `corporation` (`Name`, `Phone`, `Address`, `Owner_id`) VALUES
('Aegean', '00223811813', 'New Cairo', 7),
('Delta Air Lines', '00221414232', 'Heliopolis', 9),
('EGYPTAIR', '00222780987', 'Sheraton', 6),
('Frontier Airlines', '00222113123', 'New Capital', 10),
('JetBlue', '00224234211', 'Nasr City', 8);

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `Person_ssn` char(12) COLLATE utf8_bin NOT NULL,
  `Salary` float DEFAULT NULL,
  `Shift` enum('pm','am') COLLATE utf8_bin DEFAULT NULL,
  `Working_hours` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`Person_ssn`, `Salary`, `Shift`, `Working_hours`) VALUES
('222115423355', 5000, 'am', 10),
('325565153253', 8000, 'am', 10),
('332444425444', 1300, 'pm', 12),
('463566585435', 1800, 'am', 9),
('585694251165', 2000, 'am', 8),
('622157535795', 2000, 'am', 7),
('624234312233', 2800, 'am', 8),
('634654865869', 1500, 'am', 6),
('656835612353', 3000, 'pm', 10),
('734613566421', 4000, 'pm', 8),
('759734532512', 5000, 'am', 9),
('776444363252', 6500, 'am', 7),
('793112232244', 4000, 'pm', 6),
('886544441211', 10000, 'pm', 10),
('987353512224', 6000, 'pm', 7);

-- --------------------------------------------------------

--
-- Table structure for table `flies`
--

CREATE TABLE `flies` (
  `Emp_ssn` char(12) COLLATE utf8_bin NOT NULL,
  `Model` varchar(10) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `flies`
--

INSERT INTO `flies` (`Emp_ssn`, `Model`) VALUES
('222115423355', 'Embraer'),
('222115423355', 'Sovereign'),
('622157535795', 'B2000'),
('622157535795', 'C1200'),
('759734532512', 'Columbus'),
('759734532512', 'Embraer'),
('759734532512', 'Sovereign'),
('793112232244', 'C1200'),
('987353512224', 'B2000'),
('987353512224', 'CZ1211');

-- --------------------------------------------------------

--
-- Table structure for table `flight_attendant`
--

CREATE TABLE `flight_attendant` (
  `Emp_ssn` char(12) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `flight_attendant`
--

INSERT INTO `flight_attendant` (`Emp_ssn`) VALUES
('332444425444'),
('463566585435'),
('624234312233'),
('776444363252'),
('886544441211');

-- --------------------------------------------------------

--
-- Table structure for table `hangar`
--

CREATE TABLE `hangar` (
  `Number` int(11) NOT NULL,
  `Location` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `Capacity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `hangar`
--

INSERT INTO `hangar` (`Number`, `Location`, `Capacity`) VALUES
(1, 'Zone A1', 12),
(2, 'Zone B1', 11),
(3, 'Zone C1', 12),
(4, 'Zone D1', 8),
(5, 'Zone E1', 10);

-- --------------------------------------------------------

--
-- Table structure for table `maintain`
--

CREATE TABLE `maintain` (
  `Emp_ssn` char(12) COLLATE utf8_bin NOT NULL,
  `Reg_No` int(11) NOT NULL,
  `Service_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `maintain`
--

INSERT INTO `maintain` (`Emp_ssn`, `Reg_No`, `Service_id`) VALUES
('325565153253', 1, 2),
('325565153253', 4, 6),
('325565153253', 6, 8),
('325565153253', 10, 13),
('325565153253', 12, 16),
('585694251165', 1, 1),
('585694251165', 2, 3),
('585694251165', 7, 10),
('585694251165', 12, 15),
('634654865869', 4, 5),
('634654865869', 9, 12),
('656835612353', 1, 1),
('656835612353', 1, 2),
('656835612353', 3, 4),
('656835612353', 8, 11),
('656835612353', 12, 15),
('734613566421', 1, 2),
('734613566421', 5, 7),
('734613566421', 7, 9),
('734613566421', 11, 14),
('734613566421', 12, 16);

-- --------------------------------------------------------

--
-- Table structure for table `owner`
--

CREATE TABLE `owner` (
  `Owner_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `owner`
--

INSERT INTO `owner` (`Owner_id`) VALUES
(1),
(2),
(3),
(4),
(5),
(6),
(7),
(8),
(9),
(10);

-- --------------------------------------------------------

--
-- Table structure for table `person`
--

CREATE TABLE `person` (
  `SSN` char(12) COLLATE utf8_bin NOT NULL,
  `Name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `Phone` char(11) COLLATE utf8_bin DEFAULT NULL,
  `Address` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `Owner_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `person`
--

INSERT INTO `person` (`SSN`, `Name`, `Phone`, `Address`, `Owner_id`) VALUES
('123165748192', 'Shawn Micheals', '01012744003', 'New Cairo', 1),
('222115423355', 'Mona Tarek', '01524161111', 'Ramsis', NULL),
('234124324132', 'Baher Ahmed', '01124541412', 'Ainshams', 4),
('325565153253', 'Anas Kfagy', '01241234132', 'Downtown', NULL),
('332444425444', 'John atef', '01578669696', 'Ramsis', NULL),
('421341234123', 'Shawn Cena', '01112312312', 'Maadi', 2),
('463566585435', 'Ashraf Taher', '01245235435', 'Maadi', NULL),
('585694251165', 'Samy Amr', '01013412341', 'Heliopolis', NULL),
('622157535795', 'Sara Ahmed', '01113830952', 'Attaba', NULL),
('624234312233', 'Ali saad', '01586939322', 'New Cairo', NULL),
('634654865869', 'Aya Ahmed', '01045634564', 'Dokki', NULL),
('643654654634', 'Eslam Tarek', '01234123111', 'Nasr City', 3),
('656835612353', 'Samer Mohsen', '01132231274', 'Giza', NULL),
('678567856867', 'Ahmed Amr', '01212312312', 'October', 5),
('734613566421', 'Yara atef', '01122142122', 'Heliopolis', NULL),
('759734532512', 'Diaa Adel', '01141445208', 'Ramsis', NULL),
('776444363252', 'Tom hanks', '01222395993', 'Maadi', NULL),
('793112232244', 'Khaled alfath', '01523412312', 'Maadi', NULL),
('886544441211', 'Scarlet Gomes', '01012234232', 'Heliopolis', NULL),
('987353512224', 'Said Ahmed', '01154563414', 'New Cairo', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `pilot`
--

CREATE TABLE `pilot` (
  `Emp_ssn` char(12) COLLATE utf8_bin NOT NULL,
  `License_No` char(8) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `pilot`
--

INSERT INTO `pilot` (`Emp_ssn`, `License_No`) VALUES
('222115423355', '75352353'),
('622157535795', '36353532'),
('759734532512', '15345433'),
('793112232244', '46344355'),
('987353512224', '53522255');

-- --------------------------------------------------------

--
-- Table structure for table `plane_type`
--

CREATE TABLE `plane_type` (
  `Model` varchar(10) COLLATE utf8_bin NOT NULL,
  `Capacity` int(11) DEFAULT NULL,
  `Weight` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `plane_type`
--

INSERT INTO `plane_type` (`Model`, `Capacity`, `Weight`) VALUES
('B2000', 320, 65000),
('C1200', 200, 41000),
('CZ1211', 400, 80000),
('Columbus', 4, 8000),
('Embraer', 2, 5000),
('Sovereign', 6, 6000);

-- --------------------------------------------------------

--
-- Table structure for table `service`
--

CREATE TABLE `service` (
  `Service_id` int(11) NOT NULL,
  `Reg_No` int(11) NOT NULL,
  `Date` date DEFAULT NULL,
  `Hours` float DEFAULT NULL,
  `Workcode` varchar(10) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `service`
--

INSERT INTO `service` (`Service_id`, `Reg_No`, `Date`, `Hours`, `Workcode`) VALUES
(1, 1, '2012-05-12', 2.5, 'C122A2'),
(2, 1, '2010-04-13', 1.5, 'D1221S'),
(3, 2, '2010-07-22', 4, 'CD2211A'),
(4, 3, '2008-02-14', 2, 'Z221A'),
(5, 4, '2012-06-17', 3, 'C122A2'),
(6, 4, '2003-04-19', 3.5, 'D1221S'),
(7, 5, '2012-11-12', 3, 'D1221S'),
(8, 6, '2014-04-20', 2.5, 'C122A2'),
(9, 7, '2017-11-02', 3.5, 'E1212'),
(10, 7, '2016-06-06', 2, 'E21SZZ'),
(11, 8, '2014-07-07', 3, 'C122A2'),
(12, 9, '2014-01-11', 3, 'A121AA'),
(13, 10, '2014-06-06', 2, 'E21SZZ'),
(14, 11, '2015-07-07', 3, 'Z221A'),
(15, 12, '2016-01-11', 2.5, 'E1212'),
(16, 12, '2017-01-11', 2, 'A121AA');

-- --------------------------------------------------------

--
-- Table structure for table `spoken_language`
--

CREATE TABLE `spoken_language` (
  `Emp_ssn` char(12) COLLATE utf8_bin NOT NULL,
  `Language` varchar(12) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `spoken_language`
--

INSERT INTO `spoken_language` (`Emp_ssn`, `Language`) VALUES
('332444425444', 'English'),
('332444425444', 'Spanish'),
('463566585435', 'Deutsch'),
('463566585435', 'English'),
('624234312233', 'English'),
('624234312233', 'French'),
('776444363252', 'English'),
('776444363252', 'Italian'),
('886544441211', 'English');

-- --------------------------------------------------------

--
-- Table structure for table `technician`
--

CREATE TABLE `technician` (
  `Emp_ssn` char(12) COLLATE utf8_bin NOT NULL,
  `Speciality` varchar(20) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `technician`
--

INSERT INTO `technician` (`Emp_ssn`, `Speciality`) VALUES
('325565153253', 'Electronic'),
('585694251165', 'Engine'),
('634654865869', 'Mechanical'),
('656835612353', 'Electrical'),
('734613566421', 'Engine');

-- --------------------------------------------------------

--
-- Table structure for table `works_on`
--

CREATE TABLE `works_on` (
  `Emp_ssn` char(12) COLLATE utf8_bin NOT NULL,
  `Reg_No` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `works_on`
--

INSERT INTO `works_on` (`Emp_ssn`, `Reg_No`) VALUES
('332444425444', 3),
('332444425444', 4),
('463566585435', 1),
('463566585435', 2),
('624234312233', 3),
('776444363252', 5),
('886544441211', 6),
('886544441211', 7),
('886544441211', 10);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `airplane`
--
ALTER TABLE `airplane`
  ADD PRIMARY KEY (`Reg_No`),
  ADD KEY `Hangar_number` (`Hangar_number`),
  ADD KEY `Plane_model` (`Plane_model`),
  ADD KEY `Owner_id` (`Owner_id`);

--
-- Indexes for table `corporation`
--
ALTER TABLE `corporation`
  ADD PRIMARY KEY (`Name`),
  ADD KEY `Owner_id` (`Owner_id`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`Person_ssn`);

--
-- Indexes for table `flies`
--
ALTER TABLE `flies`
  ADD PRIMARY KEY (`Emp_ssn`,`Model`),
  ADD KEY `Model` (`Model`);

--
-- Indexes for table `flight_attendant`
--
ALTER TABLE `flight_attendant`
  ADD PRIMARY KEY (`Emp_ssn`);

--
-- Indexes for table `hangar`
--
ALTER TABLE `hangar`
  ADD PRIMARY KEY (`Number`);

--
-- Indexes for table `maintain`
--
ALTER TABLE `maintain`
  ADD PRIMARY KEY (`Emp_ssn`,`Reg_No`,`Service_id`),
  ADD KEY `Reg_No` (`Reg_No`),
  ADD KEY `Service_id` (`Service_id`);

--
-- Indexes for table `owner`
--
ALTER TABLE `owner`
  ADD PRIMARY KEY (`Owner_id`);

--
-- Indexes for table `person`
--
ALTER TABLE `person`
  ADD PRIMARY KEY (`SSN`),
  ADD KEY `Owner_id` (`Owner_id`);

--
-- Indexes for table `pilot`
--
ALTER TABLE `pilot`
  ADD PRIMARY KEY (`Emp_ssn`);

--
-- Indexes for table `plane_type`
--
ALTER TABLE `plane_type`
  ADD PRIMARY KEY (`Model`);

--
-- Indexes for table `service`
--
ALTER TABLE `service`
  ADD PRIMARY KEY (`Service_id`,`Reg_No`),
  ADD KEY `Reg_No` (`Reg_No`);

--
-- Indexes for table `spoken_language`
--
ALTER TABLE `spoken_language`
  ADD PRIMARY KEY (`Emp_ssn`,`Language`);

--
-- Indexes for table `technician`
--
ALTER TABLE `technician`
  ADD PRIMARY KEY (`Emp_ssn`);

--
-- Indexes for table `works_on`
--
ALTER TABLE `works_on`
  ADD PRIMARY KEY (`Emp_ssn`,`Reg_No`),
  ADD KEY `Reg_No` (`Reg_No`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `airplane`
--
ALTER TABLE `airplane`
  MODIFY `Reg_No` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `hangar`
--
ALTER TABLE `hangar`
  MODIFY `Number` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `owner`
--
ALTER TABLE `owner`
  MODIFY `Owner_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `service`
--
ALTER TABLE `service`
  MODIFY `Service_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `airplane`
--
ALTER TABLE `airplane`
  ADD CONSTRAINT `airplane_ibfk_1` FOREIGN KEY (`Hangar_number`) REFERENCES `hangar` (`Number`) ON UPDATE CASCADE,
  ADD CONSTRAINT `airplane_ibfk_2` FOREIGN KEY (`Plane_model`) REFERENCES `plane_type` (`Model`) ON UPDATE CASCADE,
  ADD CONSTRAINT `airplane_ibfk_3` FOREIGN KEY (`Owner_id`) REFERENCES `owner` (`Owner_id`) ON UPDATE CASCADE;

--
-- Constraints for table `corporation`
--
ALTER TABLE `corporation`
  ADD CONSTRAINT `corporation_ibfk_1` FOREIGN KEY (`Owner_id`) REFERENCES `owner` (`Owner_id`) ON UPDATE CASCADE;

--
-- Constraints for table `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`Person_ssn`) REFERENCES `person` (`SSN`) ON UPDATE CASCADE;

--
-- Constraints for table `flies`
--
ALTER TABLE `flies`
  ADD CONSTRAINT `flies_ibfk_1` FOREIGN KEY (`Emp_ssn`) REFERENCES `pilot` (`Emp_ssn`) ON UPDATE CASCADE,
  ADD CONSTRAINT `flies_ibfk_2` FOREIGN KEY (`Model`) REFERENCES `plane_type` (`Model`) ON UPDATE CASCADE;

--
-- Constraints for table `flight_attendant`
--
ALTER TABLE `flight_attendant`
  ADD CONSTRAINT `flight_attendant_ibfk_1` FOREIGN KEY (`Emp_ssn`) REFERENCES `employee` (`Person_ssn`) ON UPDATE CASCADE;

--
-- Constraints for table `maintain`
--
ALTER TABLE `maintain`
  ADD CONSTRAINT `maintain_ibfk_1` FOREIGN KEY (`Emp_ssn`) REFERENCES `technician` (`Emp_ssn`) ON UPDATE CASCADE,
  ADD CONSTRAINT `maintain_ibfk_2` FOREIGN KEY (`Reg_No`) REFERENCES `airplane` (`Reg_No`) ON UPDATE CASCADE,
  ADD CONSTRAINT `maintain_ibfk_3` FOREIGN KEY (`Service_id`) REFERENCES `service` (`Service_id`) ON UPDATE CASCADE;

--
-- Constraints for table `person`
--
ALTER TABLE `person`
  ADD CONSTRAINT `person_ibfk_1` FOREIGN KEY (`Owner_id`) REFERENCES `owner` (`Owner_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `pilot`
--
ALTER TABLE `pilot`
  ADD CONSTRAINT `pilot_ibfk_1` FOREIGN KEY (`Emp_ssn`) REFERENCES `employee` (`Person_ssn`) ON UPDATE CASCADE;

--
-- Constraints for table `service`
--
ALTER TABLE `service`
  ADD CONSTRAINT `service_ibfk_1` FOREIGN KEY (`Reg_No`) REFERENCES `airplane` (`Reg_No`) ON UPDATE CASCADE;

--
-- Constraints for table `spoken_language`
--
ALTER TABLE `spoken_language`
  ADD CONSTRAINT `spoken_language_ibfk_1` FOREIGN KEY (`Emp_ssn`) REFERENCES `flight_attendant` (`Emp_ssn`) ON UPDATE CASCADE;

--
-- Constraints for table `technician`
--
ALTER TABLE `technician`
  ADD CONSTRAINT `technician_ibfk_1` FOREIGN KEY (`Emp_ssn`) REFERENCES `employee` (`Person_ssn`) ON UPDATE CASCADE;

--
-- Constraints for table `works_on`
--
ALTER TABLE `works_on`
  ADD CONSTRAINT `works_on_ibfk_1` FOREIGN KEY (`Emp_ssn`) REFERENCES `flight_attendant` (`Emp_ssn`) ON UPDATE CASCADE,
  ADD CONSTRAINT `works_on_ibfk_2` FOREIGN KEY (`Reg_No`) REFERENCES `airplane` (`Reg_No`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
