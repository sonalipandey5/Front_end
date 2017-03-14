-- phpMyAdmin SQL Dump
-- version 3.5.4
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Nov 09, 2016 at 10:32 PM
-- Server version: 5.5.28-log
-- PHP Version: 5.4.9

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `ecommerce`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE IF NOT EXISTS `admin` (
  `AdminID` int(11) DEFAULT NULL,
  `AdminFirstName` varchar(20) DEFAULT NULL,
  `AdminLastName` varchar(20) DEFAULT NULL,
  `AdminPassword` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`AdminID`, `AdminFirstName`, `AdminLastName`, `AdminPassword`) VALUES
(1, 'admin', 'portal', 'f865b53623b121fd34ee5426c792e5c33af8c227');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE IF NOT EXISTS `category` (
  `CategoryID` int(20) NOT NULL AUTO_INCREMENT,
  `CategoryName` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`CategoryID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`CategoryID`, `CategoryName`) VALUES
(1, 'Jeans'),
(2, 'Casual Shirt');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE IF NOT EXISTS `customer` (
  `customerID` int(11) NOT NULL DEFAULT '0',
  `FirstName` varchar(20) DEFAULT NULL,
  `LastName` varchar(20) DEFAULT NULL,
  `Phone` int(10) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`customerID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`customerID`, `FirstName`, `LastName`, `Phone`, `email`, `address`) VALUES
(1, 'Abhis', 'Cho', 2147483647, 'abhishekhome48@gmail.com', 'Add'),
(2, 'Abhis', 'Cho', 2147483647, 'abhishekhome48@gmail.com', 'Add'),
(3, 'Abhis', 'Cho', 2147483647, 'abhishekhome48@gmail.com', 'Add'),
(4, 'Abhis', 'Cho', 2147483647, 'abhishekhome48@gmail.com', 'Add'),
(5, 'Abhis', 'Cho', 2147483647, 'abhishekhome48@gmail.com', 'Add'),
(6, 'Abhis', 'Cho', 2147483647, 'abhishekhome48@gmail.com', 'Add');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE IF NOT EXISTS `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `OrderID` varchar(15) DEFAULT NULL,
  `SaleID` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_sid` (`SaleID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `OrderID`, `SaleID`) VALUES
(1, '58234e3f2c42d', 1);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE IF NOT EXISTS `product` (
  `ProductID` int(20) NOT NULL AUTO_INCREMENT,
  `CategoryID` varchar(20) NOT NULL,
  `productName` varchar(100) NOT NULL,
  `ProductDescription` varchar(60) DEFAULT NULL,
  `Unit` varchar(20) DEFAULT NULL,
  `Quantity` int(15) NOT NULL,
  `Price` double(10,2) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ProductID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`ProductID`, `CategoryID`, `productName`, `ProductDescription`, `Unit`, `Quantity`, `Price`, `date`) VALUES
(1, '2', 'Cotton Shirt', 'Cotton Shirt', 'Pcs', 10, 250.00, '2016-11-03 09:30:00');

-- --------------------------------------------------------

--
-- Table structure for table `salestatement`
--

CREATE TABLE IF NOT EXISTS `salestatement` (
  `SaleID` int(11) NOT NULL AUTO_INCREMENT,
  `ProductID` int(11) DEFAULT NULL,
  `SaleQuantity` int(11) DEFAULT NULL,
  `Rate` float(10,2) DEFAULT NULL,
  `OrderLine` int(3) DEFAULT NULL,
  PRIMARY KEY (`SaleID`),
  KEY `fk_pid` (`ProductID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `salestatement`
--

INSERT INTO `salestatement` (`SaleID`, `ProductID`, `SaleQuantity`, `Rate`, `OrderLine`) VALUES
(1, 1, 1, 250.00, 1);

-- --------------------------------------------------------

--
-- Table structure for table `shipper`
--

CREATE TABLE IF NOT EXISTS `shipper` (
  `ShipperID` int(20) NOT NULL DEFAULT '0',
  `CompanyName` varchar(30) DEFAULT NULL,
  `Phone` int(12) DEFAULT NULL,
  PRIMARY KEY (`ShipperID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `shipper`
--

INSERT INTO `shipper` (`ShipperID`, `CompanyName`, `Phone`) VALUES
(0, 'Apparel Shop Logistic', 1234567890);

-- --------------------------------------------------------

--
-- Table structure for table `shipping`
--

CREATE TABLE IF NOT EXISTS `shipping` (
  `OrderID` varchar(15) DEFAULT NULL,
  `ShipperID` int(11) DEFAULT NULL,
  `DateofShipping` date DEFAULT NULL,
  `Address` varchar(50) DEFAULT NULL,
  `CustomerID` varchar(25) DEFAULT NULL,
  KEY `fk_sidd` (`ShipperID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `shipping`
--

INSERT INTO `shipping` (`OrderID`, `ShipperID`, `DateofShipping`, `Address`, `CustomerID`) VALUES
('58234e3f2c42d', 0, '0000-00-00', 'Add', '4'),
('58234e3f2c42d', 0, '0000-00-00', 'Add', '5'),
('58234e3f2c42d', 0, '0000-00-00', 'Add', '6');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `fk_sid` FOREIGN KEY (`SaleID`) REFERENCES `salestatement` (`SaleID`);

--
-- Constraints for table `salestatement`
--
ALTER TABLE `salestatement`
  ADD CONSTRAINT `fk_pid` FOREIGN KEY (`ProductID`) REFERENCES `product` (`ProductID`);

--
-- Constraints for table `shipping`
--
ALTER TABLE `shipping`
  ADD CONSTRAINT `fk_sidd` FOREIGN KEY (`ShipperID`) REFERENCES `shipper` (`ShipperID`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
