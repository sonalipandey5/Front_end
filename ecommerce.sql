-- phpMyAdmin SQL Dump
-- version 3.3.9
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Nov 03, 2016 at 07:25 AM
-- Server version: 5.5.16
-- PHP Version: 5.3.5

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


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


-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE IF NOT EXISTS `orders` (
  `OrderID` int(11) NOT NULL DEFAULT '0',
  `SaleID` int(11) DEFAULT NULL,
  PRIMARY KEY (`OrderID`),
  KEY `fk_sid` (`SaleID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orders`
--


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
  `Price` double NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ProductID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`ProductID`, `CategoryID`, `productName`, `ProductDescription`, `Unit`, `Quantity`, `Price`, `date`) VALUES
(1, '2', 'Cotton Shirt', 'Cotton Shirt', 'Pcs', 0, 0, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `productimage`
--

CREATE TABLE IF NOT EXISTS `productimage` (
  `imageid` int(11) NOT NULL AUTO_INCREMENT,
  `ProductID` int(11) DEFAULT NULL,
  `ImagePath` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`imageid`),
  KEY `fk_k` (`ProductID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `productimage`
--


-- --------------------------------------------------------

--
-- Table structure for table `salestatement`
--

CREATE TABLE IF NOT EXISTS `salestatement` (
  `SaleID` int(11) NOT NULL AUTO_INCREMENT,
  `ProductID` int(11) DEFAULT NULL,
  `Quantity` int(11) DEFAULT NULL,
  `Rate` float(10,2) DEFAULT NULL,
  `Discount` float(10,2) DEFAULT NULL,
  `OrderLine` int(3) DEFAULT NULL,
  PRIMARY KEY (`SaleID`),
  KEY `fk_pid` (`ProductID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `salestatement`
--


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


-- --------------------------------------------------------

--
-- Table structure for table `shipping`
--

CREATE TABLE IF NOT EXISTS `shipping` (
  `OrderID` int(11) DEFAULT NULL,
  `ShipperID` int(11) DEFAULT NULL,
  `DateofShipping` date DEFAULT NULL,
  `Address` varchar(50) DEFAULT NULL,
  `RefID` varchar(25) DEFAULT NULL,
  KEY `fk_oid` (`OrderID`),
  KEY `fk_sidd` (`ShipperID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `shipping`
--


--
-- Constraints for dumped tables
--

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `fk_sid` FOREIGN KEY (`SaleID`) REFERENCES `salestatement` (`SaleID`);

--
-- Constraints for table `productimage`
--
ALTER TABLE `productimage`
  ADD CONSTRAINT `fk_k` FOREIGN KEY (`ProductID`) REFERENCES `product` (`ProductID`);

--
-- Constraints for table `salestatement`
--
ALTER TABLE `salestatement`
  ADD CONSTRAINT `fk_pid` FOREIGN KEY (`ProductID`) REFERENCES `product` (`ProductID`);

--
-- Constraints for table `shipping`
--
ALTER TABLE `shipping`
  ADD CONSTRAINT `fk_oid` FOREIGN KEY (`OrderID`) REFERENCES `orders` (`OrderID`),
  ADD CONSTRAINT `fk_sidd` FOREIGN KEY (`ShipperID`) REFERENCES `shipper` (`ShipperID`);
