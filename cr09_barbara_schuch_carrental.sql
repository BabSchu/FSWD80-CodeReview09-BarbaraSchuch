-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 09. Dez 2019 um 14:34
-- Server-Version: 10.3.16-MariaDB
-- PHP-Version: 7.3.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `cr09_barbara_schuch_carrental`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `car`
--

CREATE TABLE `car` (
  `car_ID` int(10) UNSIGNED NOT NULL,
  `licence_plate_nr` varchar(15) NOT NULL,
  `fk_model_ID` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `car`
--

INSERT INTO `car` (`car_ID`, `licence_plate_nr`, `fk_model_ID`) VALUES
(6, 'W-1234AA', 11),
(7, 'W-2345BB', 12),
(8, 'W-3456CC', 10),
(9, 'W-4567DD', 13),
(10, 'W-5678EE', 12),
(11, 'W-6789FF', 11);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `car_model`
--

CREATE TABLE `car_model` (
  `car_model_ID` int(10) UNSIGNED NOT NULL,
  `car_model_name` varchar(250) NOT NULL,
  `fk_manufacturer_ID` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `car_model`
--

INSERT INTO `car_model` (`car_model_ID`, `car_model_name`, `fk_manufacturer_ID`) VALUES
(10, 'Corsa', 4),
(11, 'Adam', 4),
(12, 'Citan Tourer', 5),
(13, 'SLC', 5);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `city`
--

CREATE TABLE `city` (
  `city_ID` int(10) UNSIGNED NOT NULL,
  `city` varchar(50) NOT NULL,
  `fk_country_ID` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `city`
--

INSERT INTO `city` (`city_ID`, `city`, `fk_country_ID`) VALUES
(3, 'Vienna', 1),
(4, 'Boston', 2),
(5, 'Patras', 5),
(6, 'Akureyri', 3),
(7, 'Sliema', 4),
(8, 'Guadaloupe', 6);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `country`
--

CREATE TABLE `country` (
  `country_ID` int(10) UNSIGNED NOT NULL,
  `country` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `country`
--

INSERT INTO `country` (`country_ID`, `country`) VALUES
(1, 'Austria'),
(2, 'USA'),
(3, 'Iceland'),
(4, 'Malta'),
(5, 'Greece'),
(6, 'Mexiko');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `customer`
--

CREATE TABLE `customer` (
  `customer_ID` int(10) UNSIGNED NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `password` varchar(300) NOT NULL,
  `email_adress` varchar(100) NOT NULL,
  `house_nr` int(5) UNSIGNED NOT NULL,
  `fk_ZIP_code_ID` int(10) UNSIGNED NOT NULL,
  `street_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `customer`
--

INSERT INTO `customer` (`customer_ID`, `first_name`, `last_name`, `password`, `email_adress`, `house_nr`, `fk_ZIP_code_ID`, `street_name`) VALUES
(1, 'John', 'Doe', '123456', 'john.doe@gmail.com', 257, 4, 'Hanover Street'),
(2, 'Geisli ', 'Danelíusson', '123456', 'geisli.danelíusson@gmail.com', 30, 6, 'Brekkugata'),
(5, 'Danzel  ', 'Glavina', '123456', 'danzel.glavina@gmail.com', 124, 6, 'Tower Road'),
(7, 'Anjo ', 'Verhallen', '123456', 'anjo.verhallen@gmail.com', 74, 5, 'General Konstantinopoulou');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `driver`
--

CREATE TABLE `driver` (
  `driver_ID` int(10) UNSIGNED NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `driving_licence_nr` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `driver`
--

INSERT INTO `driver` (`driver_ID`, `first_name`, `last_name`, `driving_licence_nr`) VALUES
(1, 'Dara ', 'Benavides Heredia', '123456789'),
(2, 'Cumelén ', 'Partida Alarcón', '76543218'),
(5, 'Anjo', 'Verhallen', '4567832'),
(6, 'John', 'Doe', '876439A'),
(7, 'Danzel  ', 'Glavina', 'XY45678');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `invoice`
--

CREATE TABLE `invoice` (
  `invoice_ID` int(10) UNSIGNED NOT NULL,
  `total` decimal(10,2) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `invoice`
--

INSERT INTO `invoice` (`invoice_ID`, `total`) VALUES
(1, '150.80'),
(2, '233.90'),
(3, '54.70'),
(4, '344.60');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `manufacturer`
--

CREATE TABLE `manufacturer` (
  `manufacturer_ID` int(10) UNSIGNED NOT NULL,
  `manufacturer_name` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `manufacturer`
--

INSERT INTO `manufacturer` (`manufacturer_ID`, `manufacturer_name`) VALUES
(4, 'Opel'),
(5, 'Mercedes');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `rental_contract`
--

CREATE TABLE `rental_contract` (
  `rental_contract_ID` int(10) UNSIGNED NOT NULL,
  `fk_customer_ID` int(10) UNSIGNED NOT NULL,
  `fk_car_ID` int(10) UNSIGNED NOT NULL,
  `fk_store_pickup_ID` int(10) UNSIGNED NOT NULL,
  `fk_store_return_ID` int(10) UNSIGNED NOT NULL,
  `pickup_datetime` datetime NOT NULL,
  `return_datetime` datetime NOT NULL,
  `mileage_start` int(10) UNSIGNED NOT NULL,
  `mileage_return` int(10) UNSIGNED NOT NULL,
  `fk_invoice_ID` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `rental_contract`
--

INSERT INTO `rental_contract` (`rental_contract_ID`, `fk_customer_ID`, `fk_car_ID`, `fk_store_pickup_ID`, `fk_store_return_ID`, `pickup_datetime`, `return_datetime`, `mileage_start`, `mileage_return`, `fk_invoice_ID`) VALUES
(3, 1, 6, 3, 1, '2019-11-03 08:30:00', '2019-11-06 16:00:00', 5240, 5345, 3),
(4, 2, 9, 2, 1, '2019-11-10 10:00:00', '2019-11-19 07:20:00', 3256, 3450, 2),
(5, 5, 10, 1, 3, '2019-12-01 13:18:00', '2019-12-03 10:21:00', 6780, 6830, 4);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `rental_driver`
--

CREATE TABLE `rental_driver` (
  `rental_driver_ID` int(10) UNSIGNED NOT NULL,
  `fk_rental_contract_ID` int(10) UNSIGNED NOT NULL,
  `fk_driver_ID` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `rental_driver`
--

INSERT INTO `rental_driver` (`rental_driver_ID`, `fk_rental_contract_ID`, `fk_driver_ID`) VALUES
(1, 3, 6),
(2, 4, 1),
(3, 4, 2),
(4, 5, 5),
(5, 5, 7);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `store`
--

CREATE TABLE `store` (
  `store_ID` int(10) UNSIGNED NOT NULL,
  `street_name` varchar(100) NOT NULL,
  `house_nr` int(5) UNSIGNED NOT NULL,
  `fk_ZIP_code_ID` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `store`
--

INSERT INTO `store` (`store_ID`, `street_name`, `house_nr`, `fk_ZIP_code_ID`) VALUES
(1, 'Wiedner Hauptstraße', 14, 22),
(2, 'Ullmanngasse', 36, 3),
(3, 'Neustiftgasse', 70, 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `zip_code`
--

CREATE TABLE `zip_code` (
  `ZIP_code_ID` int(10) UNSIGNED NOT NULL,
  `ZIP_code` varchar(20) NOT NULL,
  `fk_city_ID` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `zip_code`
--

INSERT INTO `zip_code` (`ZIP_code_ID`, `ZIP_code`, `fk_city_ID`) VALUES
(1, '1070', 3),
(2, '1020', 3),
(3, '1150', 3),
(4, '600', 6),
(5, '02113', 4),
(6, '1605', 7),
(17, '26331', 5),
(19, '07070', 8),
(21, '1100', 3),
(22, '1040', 3);

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `car`
--
ALTER TABLE `car`
  ADD PRIMARY KEY (`car_ID`),
  ADD KEY `fk_model_ID` (`fk_model_ID`);

--
-- Indizes für die Tabelle `car_model`
--
ALTER TABLE `car_model`
  ADD PRIMARY KEY (`car_model_ID`),
  ADD KEY `fk_manufacturer_ID` (`fk_manufacturer_ID`);

--
-- Indizes für die Tabelle `city`
--
ALTER TABLE `city`
  ADD PRIMARY KEY (`city_ID`),
  ADD KEY `fk_country_ID` (`fk_country_ID`);

--
-- Indizes für die Tabelle `country`
--
ALTER TABLE `country`
  ADD PRIMARY KEY (`country_ID`);

--
-- Indizes für die Tabelle `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customer_ID`),
  ADD KEY `fk_ZIP_code_ID` (`fk_ZIP_code_ID`);

--
-- Indizes für die Tabelle `driver`
--
ALTER TABLE `driver`
  ADD PRIMARY KEY (`driver_ID`);

--
-- Indizes für die Tabelle `invoice`
--
ALTER TABLE `invoice`
  ADD PRIMARY KEY (`invoice_ID`);

--
-- Indizes für die Tabelle `manufacturer`
--
ALTER TABLE `manufacturer`
  ADD PRIMARY KEY (`manufacturer_ID`);

--
-- Indizes für die Tabelle `rental_contract`
--
ALTER TABLE `rental_contract`
  ADD PRIMARY KEY (`rental_contract_ID`),
  ADD UNIQUE KEY `fk_invoice_ID` (`fk_invoice_ID`),
  ADD KEY `fk_store_pickup_ID` (`fk_store_pickup_ID`),
  ADD KEY `fk_store_return_ID` (`fk_store_return_ID`),
  ADD KEY `fk_customer_ID` (`fk_customer_ID`),
  ADD KEY `fk_car_ID` (`fk_car_ID`);

--
-- Indizes für die Tabelle `rental_driver`
--
ALTER TABLE `rental_driver`
  ADD PRIMARY KEY (`rental_driver_ID`),
  ADD KEY `fk_driver_ID` (`fk_driver_ID`),
  ADD KEY `fk_rental_contract_ID` (`fk_rental_contract_ID`);

--
-- Indizes für die Tabelle `store`
--
ALTER TABLE `store`
  ADD PRIMARY KEY (`store_ID`),
  ADD KEY `fk_ZIP_code_ID` (`fk_ZIP_code_ID`);

--
-- Indizes für die Tabelle `zip_code`
--
ALTER TABLE `zip_code`
  ADD PRIMARY KEY (`ZIP_code_ID`),
  ADD KEY `fk_city_ID` (`fk_city_ID`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `car`
--
ALTER TABLE `car`
  MODIFY `car_ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT für Tabelle `car_model`
--
ALTER TABLE `car_model`
  MODIFY `car_model_ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT für Tabelle `city`
--
ALTER TABLE `city`
  MODIFY `city_ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT für Tabelle `country`
--
ALTER TABLE `country`
  MODIFY `country_ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT für Tabelle `customer`
--
ALTER TABLE `customer`
  MODIFY `customer_ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT für Tabelle `driver`
--
ALTER TABLE `driver`
  MODIFY `driver_ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT für Tabelle `invoice`
--
ALTER TABLE `invoice`
  MODIFY `invoice_ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT für Tabelle `manufacturer`
--
ALTER TABLE `manufacturer`
  MODIFY `manufacturer_ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT für Tabelle `rental_contract`
--
ALTER TABLE `rental_contract`
  MODIFY `rental_contract_ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT für Tabelle `rental_driver`
--
ALTER TABLE `rental_driver`
  MODIFY `rental_driver_ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT für Tabelle `store`
--
ALTER TABLE `store`
  MODIFY `store_ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT für Tabelle `zip_code`
--
ALTER TABLE `zip_code`
  MODIFY `ZIP_code_ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `car`
--
ALTER TABLE `car`
  ADD CONSTRAINT `car_ibfk_2` FOREIGN KEY (`fk_model_ID`) REFERENCES `car_model` (`car_model_ID`);

--
-- Constraints der Tabelle `car_model`
--
ALTER TABLE `car_model`
  ADD CONSTRAINT `car_model_ibfk_1` FOREIGN KEY (`fk_manufacturer_ID`) REFERENCES `manufacturer` (`manufacturer_ID`);

--
-- Constraints der Tabelle `city`
--
ALTER TABLE `city`
  ADD CONSTRAINT `city_ibfk_1` FOREIGN KEY (`fk_country_ID`) REFERENCES `country` (`country_ID`);

--
-- Constraints der Tabelle `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`fk_ZIP_code_ID`) REFERENCES `zip_code` (`ZIP_code_ID`);

--
-- Constraints der Tabelle `rental_contract`
--
ALTER TABLE `rental_contract`
  ADD CONSTRAINT `rental_contract_ibfk_1` FOREIGN KEY (`fk_store_pickup_ID`) REFERENCES `store` (`store_ID`),
  ADD CONSTRAINT `rental_contract_ibfk_2` FOREIGN KEY (`fk_store_return_ID`) REFERENCES `store` (`store_ID`),
  ADD CONSTRAINT `rental_contract_ibfk_3` FOREIGN KEY (`fk_customer_ID`) REFERENCES `customer` (`customer_ID`),
  ADD CONSTRAINT `rental_contract_ibfk_4` FOREIGN KEY (`fk_car_ID`) REFERENCES `car` (`car_ID`),
  ADD CONSTRAINT `rental_contract_ibfk_5` FOREIGN KEY (`fk_invoice_ID`) REFERENCES `invoice` (`invoice_ID`);

--
-- Constraints der Tabelle `rental_driver`
--
ALTER TABLE `rental_driver`
  ADD CONSTRAINT `rental_driver_ibfk_1` FOREIGN KEY (`fk_driver_ID`) REFERENCES `driver` (`driver_ID`),
  ADD CONSTRAINT `rental_driver_ibfk_2` FOREIGN KEY (`fk_rental_contract_ID`) REFERENCES `rental_contract` (`rental_contract_ID`);

--
-- Constraints der Tabelle `store`
--
ALTER TABLE `store`
  ADD CONSTRAINT `store_ibfk_1` FOREIGN KEY (`fk_ZIP_code_ID`) REFERENCES `zip_code` (`ZIP_code_ID`);

--
-- Constraints der Tabelle `zip_code`
--
ALTER TABLE `zip_code`
  ADD CONSTRAINT `zip_code_ibfk_1` FOREIGN KEY (`fk_city_ID`) REFERENCES `city` (`city_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
