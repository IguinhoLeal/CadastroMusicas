-- phpMyAdmin SQL Dump
-- version 4.0.4
-- http://www.phpmyadmin.net
--
-- Máquina: 127.0.0.1
-- Data de Criação: 09-Nov-2015 às 21:54
-- Versão do servidor: 5.5.32
-- versão do PHP: 5.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de Dados: `cadastromusicas`
--
CREATE DATABASE IF NOT EXISTS `cadastromusicas` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `cadastromusicas`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `album`
--

CREATE TABLE IF NOT EXISTS `album` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Nome` varchar(20) NOT NULL,
  `Ano` int(11) NOT NULL,
  `FK_Artista` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_Artista` (`FK_Artista`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Extraindo dados da tabela `album`
--

INSERT INTO `album` (`ID`, `Nome`, `Ano`, `FK_Artista`) VALUES
(1, 'Beyonce', 2014, 1),
(2, 'This is a not Test', 2015, 2),
(3, 'Royal Tailor', 2013, 3);

-- --------------------------------------------------------

--
-- Estrutura da tabela `artista`
--

CREATE TABLE IF NOT EXISTS `artista` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Nome` varchar(20) NOT NULL,
  `FK_Genero` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_Genero` (`FK_Genero`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Extraindo dados da tabela `artista`
--

INSERT INTO `artista` (`ID`, `Nome`, `FK_Genero`) VALUES
(1, 'Beyonce', 1),
(2, 'TobyMac', 2),
(3, 'Royal Tailor', 3),
(4, 'Royal Tailor', 3);

-- --------------------------------------------------------

--
-- Estrutura da tabela `genero`
--

CREATE TABLE IF NOT EXISTS `genero` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Tipo` varchar(20) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Extraindo dados da tabela `genero`
--

INSERT INTO `genero` (`ID`, `Tipo`) VALUES
(1, 'Pop'),
(2, 'Gospel'),
(3, 'Samba '),
(4, 'Pop gospel');

-- --------------------------------------------------------

--
-- Estrutura da tabela `musica`
--

CREATE TABLE IF NOT EXISTS `musica` (
  `Nome` varchar(20) NOT NULL,
  `Duracao` float NOT NULL,
  `Nota` varchar(2) NOT NULL,
  `FK_Album` int(11) NOT NULL,
  KEY `FK_Album` (`FK_Album`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `musica`
--

INSERT INTO `musica` (`Nome`, `Duracao`, `Nota`, `FK_Album`) VALUES
('Blow', 300, '10', 1),
('Flawless', 315, '10', 1),
('Light shine brights', 400, '10', 2),
('Love Feels like ', 215, '10', 2),
('Move ', 300, '8', 2);

--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `album`
--
ALTER TABLE `album`
  ADD CONSTRAINT `album_ibfk_1` FOREIGN KEY (`FK_Artista`) REFERENCES `artista` (`ID`);

--
-- Limitadores para a tabela `artista`
--
ALTER TABLE `artista`
  ADD CONSTRAINT `artista_ibfk_1` FOREIGN KEY (`FK_Genero`) REFERENCES `genero` (`ID`);

--
-- Limitadores para a tabela `musica`
--
ALTER TABLE `musica`
  ADD CONSTRAINT `musica_ibfk_1` FOREIGN KEY (`FK_Album`) REFERENCES `album` (`ID`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
