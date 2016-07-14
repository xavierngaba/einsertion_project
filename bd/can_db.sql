-- phpMyAdmin SQL Dump
-- version 3.5.2.2
-- http://www.phpmyadmin.net
--
-- Client: 127.0.0.1
-- Généré le: Ven 07 Février 2014 à 13:38
-- Version du serveur: 5.5.27
-- Version de PHP: 5.4.7

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

CREATE DATABASE can_db;
use can_db;
--
-- Base de données: `can_db`
--

-- --------------------------------------------------------

--
-- Structure de la table `administration`
--

CREATE TABLE IF NOT EXISTS `administration` (
  `idadmin` int(5) NOT NULL AUTO_INCREMENT,
  `nom_admin` varchar(30) DEFAULT NULL,
  `prenom_admin` varchar(30) DEFAULT NULL,
  `statut` varchar(50) DEFAULT NULL,
  `idequipe` int(2) DEFAULT NULL,
  PRIMARY KEY (`idadmin`),
  KEY `FK_administration_idequipe` (`idequipe`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `demi`
--

CREATE TABLE IF NOT EXISTS `demi` (
  `iddemi` int(1) NOT NULL AUTO_INCREMENT,
  `libelled` text,
  `idedition` int(3) DEFAULT NULL,
  PRIMARY KEY (`iddemi`),
  KEY `FK_demi_idedition` (`idedition`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Contenu de la table `demi`
--

INSERT INTO `demi` (`iddemi`, `libelled`, `idedition`) VALUES
(1, 'Vainqueur 1A-2B/1C-2D', NULL),
(2, 'Vainqueur 1B-2A/1D-2C', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `edition`
--

CREATE TABLE IF NOT EXISTS `edition` (
  `idedition` int(3) NOT NULL AUTO_INCREMENT,
  `annee` varchar(4) DEFAULT NULL,
  `paysorg` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`idedition`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Contenu de la table `edition`
--

INSERT INTO `edition` (`idedition`, `annee`, `paysorg`) VALUES
(1, '2012', 'EquatoGuinée-Gabon');

-- --------------------------------------------------------

--
-- Structure de la table `entraineur`
--

CREATE TABLE IF NOT EXISTS `entraineur` (
  `identraineur` int(5) NOT NULL AUTO_INCREMENT,
  `nom_ent` varchar(30) DEFAULT NULL,
  `prenom_ent` varchar(30) DEFAULT NULL,
  `nationalite` varchar(50) DEFAULT NULL,
  `statut_ent` varchar(30) DEFAULT NULL,
  `idequipe` int(2) DEFAULT NULL,
  PRIMARY KEY (`identraineur`),
  KEY `FK_entraineur_idequipe` (`idequipe`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `equipe`
--

CREATE TABLE IF NOT EXISTS `equipe` (
  `idequipe` int(2) NOT NULL AUTO_INCREMENT,
  `nom_eq` varchar(50) DEFAULT NULL,
  `rg` int(1) DEFAULT NULL,
  `jr` int(1) DEFAULT NULL,
  `g` int(1) DEFAULT NULL,
  `n` int(1) DEFAULT NULL,
  `p` int(1) DEFAULT NULL,
  `bm` int(2) DEFAULT NULL,
  `be` int(2) DEFAULT NULL,
  `diff` int(2) DEFAULT NULL,
  `pts` int(2) DEFAULT NULL,
  `nbpar` int(3) DEFAULT NULL,
  `quart` bit(1) DEFAULT NULL,
  `demi` bit(1) DEFAULT NULL,
  `pfinale` bit(1) DEFAULT NULL,
  `finale` bit(1) DEFAULT NULL,
  `vainqueur` bit(1) DEFAULT NULL,
  `idpoule` int(1) DEFAULT NULL,
  PRIMARY KEY (`idequipe`),
  KEY `FK_equipe_idpoule` (`idpoule`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=17 ;

--
-- Contenu de la table `equipe`
--

INSERT INTO `equipe` (`idequipe`, `nom_eq`, `rg`, `jr`, `g`, `n`, `p`, `bm`, `be`, `diff`, `pts`, `nbpar`, `quart`, `demi`, `pfinale`, `finale`, `vainqueur`, `idpoule`) VALUES
(1, 'GUINEE-EQUATORIAL', NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, '0', '0', '0', '0', '0', 1),
(2, 'ZAMBIE', NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, '0', '0', '0', '0', '0', 1),
(3, 'SENEGAL', NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, '0', '0', '0', '0', '0', 1),
(4, 'LYBIE', NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, '0', '0', '0', '0', '0', 1),
(5, 'CÔTE-IVOIRE', NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, '0', '0', '0', '0', '0', 2),
(6, 'ANGOLA', NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, '0', '0', '0', '0', '0', 2),
(7, 'BURKINA-FASO', NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, '0', '0', '0', '0', '0', 2),
(8, 'SOUDAN', NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, '0', '0', '0', '0', '0', 2),
(9, 'GABON', NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, '0', '0', '0', '0', '0', 3),
(10, 'TUNISIE', NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, '0', '0', '0', '0', '0', 3),
(11, 'MAROC', NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, '0', '0', '0', '0', '0', 3),
(12, 'NIGER', NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, '0', '0', '0', '0', '0', 3),
(13, 'GHANA', NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, '0', '0', '0', '0', '0', 4),
(14, 'GUINEE', NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, '0', '0', '0', '0', '0', 4),
(15, 'MALI', NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, '0', '0', '0', '0', '0', 4),
(16, 'BOTSWANA', NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, '0', '0', '0', '0', '0', 4);

-- --------------------------------------------------------

--
-- Structure de la table `equipe_matchs`
--

CREATE TABLE IF NOT EXISTS `equipe_matchs` (
  `idequipe` int(2) NOT NULL,
  `idmatchs` int(2) NOT NULL,
  `score` int(2) DEFAULT NULL,
  PRIMARY KEY (`idequipe`,`idmatchs`),
  KEY `FK_equipe_matchs_idmatchs` (`idmatchs`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `equipe_matchs`
--

INSERT INTO `equipe_matchs` (`idequipe`, `idmatchs`, `score`) VALUES
(1, 3, NULL),
(1, 6, NULL),
(1, 7, NULL),
(2, 4, NULL),
(2, 5, NULL),
(2, 7, NULL),
(3, 4, NULL),
(3, 6, NULL),
(3, 8, NULL),
(4, 3, NULL),
(4, 5, NULL),
(4, 8, NULL),
(5, 9, NULL),
(5, 12, NULL),
(5, 14, NULL),
(6, 10, NULL),
(6, 11, NULL),
(6, 14, NULL),
(7, 10, NULL),
(7, 12, NULL),
(7, 13, NULL),
(8, 9, NULL),
(8, 11, NULL),
(8, 13, NULL),
(9, 15, NULL),
(9, 18, NULL),
(9, 19, NULL),
(10, 16, NULL),
(10, 17, NULL),
(10, 19, NULL),
(11, 16, NULL),
(11, 18, NULL),
(11, 20, NULL),
(12, 15, NULL),
(12, 17, NULL),
(12, 20, NULL),
(13, 21, NULL),
(13, 24, NULL),
(13, 26, NULL),
(14, 22, NULL),
(14, 23, NULL),
(14, 26, NULL),
(15, 22, NULL),
(15, 24, NULL),
(15, 25, NULL),
(16, 21, NULL),
(16, 23, NULL),
(16, 25, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `finale`
--

CREATE TABLE IF NOT EXISTS `finale` (
  `idfinale` int(1) NOT NULL AUTO_INCREMENT,
  `libellef` text,
  `idedition` int(3) DEFAULT NULL,
  PRIMARY KEY (`idfinale`),
  KEY `FK_finale_idedition` (`idedition`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Contenu de la table `finale`
--

INSERT INTO `finale` (`idfinale`, `libellef`, `idedition`) VALUES
(1, 'Vainqueur 1A-2B/1C-2D vs 1B-2A/1D-2C', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `joueur`
--

CREATE TABLE IF NOT EXISTS `joueur` (
  `idjoueur` int(10) NOT NULL AUTO_INCREMENT,
  `nom_j` varchar(100) DEFAULT NULL,
  `prenom_j` varchar(100) DEFAULT NULL,
  `date_naiss` varchar(15) DEFAULT NULL,
  `poste` varchar(3) DEFAULT NULL,
  `dossard` int(2) DEFAULT NULL,
  `butc` int(3) DEFAULT NULL,
  `butt` int(3) DEFAULT NULL,
  `idequipe` int(2) DEFAULT NULL,
  PRIMARY KEY (`idjoueur`),
  KEY `FK_joueur_idequipe` (`idequipe`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=365 ;

--
-- Contenu de la table `joueur`
--

INSERT INTO `joueur` (`idjoueur`, `nom_j`, `prenom_j`, `date_naiss`, `poste`, `dossard`, `butc`, `butt`, `idequipe`) VALUES
(6, 'drogba', 'didier', '1978-3-11', 'AV', 11, 0, 0, 5),
(7, 'DIAKITE', 'DAOUDA', '1983-3-30', 'GK', 1, 0, 0, 7),
(8, 'GNANOU', 'ibrahim', '1986-11-08', 'DC', 2, 0, 0, 7),
(9, 'kone', 'DJAKARIDJA', '1986-1-01', 'MCD', 3, 0, 0, 7),
(10, 'tall', 'HAMADOU', '1982-12-04', 'DC', 4, 0, 0, 7),
(11, 'KOFFI', 'MOHAMED', '1986-12-30', 'MD', 5, 0, 0, 7),
(12, 'Kone', 'bakary', '1988-4-27', 'MD', 6, 0, 0, 7),
(13, 'ROUAMBA', 'FLORENT', '1986-12-31', 'MCD', 7, 0, 0, 7),
(14, 'KERE', 'MAHAMOUDOU', '1982-1-02', 'MCG', 8, 0, 0, 7),
(15, 'DAGANO Beli', 'MOUMOUNI', '1981-1-03', 'AV', 9, 0, 0, 7),
(16, 'TRAORE', 'S. ALAIN', '1988-1-01', 'MO', 10, 0, 0, 7),
(17, 'PITROIPA', 'BENINWENDE YANN JONATHAN', '1986-3-12', 'MCD', 11, 0, 0, 7),
(18, 'NAKOULMA', 'NIGUIMBE PREJUCE', '1987-3-21', 'AV', 12, 0, 0, 7),
(19, 'BANCE', 'ARISTIDE', '1984-9-19', 'AV', 13, 0, 0, 7),
(20, 'BALIMA', 'BENJAMIN', '1986-3-20', 'MCG', 14, 0, 0, 7),
(21, 'YAMEOGO', 'NARCISSE', '1980-11-19', 'MD', 15, 0, 0, 7),
(23, 'SAWADOGO', 'ADAMA', '1990-1-20', 'GK', 16, 0, 0, 7),
(24, 'KOULIBALY', 'KEBA PAUL', '1986-3-24', 'DC', 17, 0, 0, 7),
(25, 'KABORE', 'CHARLES', '1988-2-09', 'MD', 18, 0, 0, 7),
(26, 'TRAORE', 'BERTRAND ISIDORE', '1995-9-06', 'MD', 19, 0, 0, 7),
(27, 'OUEDRAOGO', 'ISSIAKA', '1988-8-19', 'AV', 20, 0, 0, 7),
(28, 'TRAORE', 'ABDOU RAZACK', '1988-12-28', 'MD', 21, 0, 0, 7),
(29, 'PANANDETIGUIRI', 'SAIDOU MADY', '1984-3-22', 'DC', 22, 0, 0, 7),
(30, 'SANOU', 'MOUSSA GERMAIN', '1992-5-26', 'GK', 23, 0, 0, 7),
(31, 'Mohamed Abdalla Raihan', 'Baha Eldin', '1978-1-01', 'GK', 1, 0, 0, 8),
(32, 'Shaikh Eldin Salhain', 'Mohamed', '1990-12-20', 'AV', 2, 0, 0, 8),
(33, 'Bashir Koko Osman', 'Muawia', '1986-5-15', 'DC', 3, 0, 0, 8),
(34, 'Abdalla Abdelgabar', 'Abdalla Abdelgabar', '1987-11-17', 'DC', 4, 0, 0, 8),
(35, 'Yousif Hado Kano', 'Ala Eldin', '1982-1-03', 'MD', 5, 0, 0, 8),
(36, 'Omer Maaz Mussa', 'Musaab', '1986-6-04', 'DC', 6, 0, 0, 8),
(37, 'Agab Shareif Ferein', 'Ramadan', '1989-9-19', 'AV', 7, 0, 0, 8),
(38, 'Mostfa Krar', 'Hitham', '1978-8-30', 'MD', 8, 0, 0, 8),
(39, 'Ali Idris Farah', 'Saif Eldin', '1981-1-01', 'DC', 9, 0, 0, 8),
(40, 'Tahir Osman', 'Mohamed', '1984-12-03', 'MO', 10, 0, 0, 8),
(41, 'Musa Hussein Idris', 'Faisal', '1986-1-01', 'MCG', 11, 0, 0, 8),
(42, 'Aldod Abdalli Kasali', 'Badr Eldin', '1981-4-10', 'MO', 12, 0, 0, 8),
(43, 'Kamal Suliman Mohamed', 'Amir', '1992-7-24', 'MD', 13, 0, 0, 8),
(44, 'Gabir Kortokaila Adam', 'Balla', '1985-9-12', 'DC', 14, 0, 0, 8),
(45, 'Ahmed Mohamed Hamouda', 'Khalifa', '1986-1-01', 'DC', 15, 0, 0, 8),
(46, 'Mahgoub Abdalla El Hadi', 'Almoiz', '1983-8-14', 'GK', 16, 0, 0, 8),
(47, 'Eltaib Ibrahim', 'Mudather', '1986-2-18', 'SA', 17, 0, 0, 8),
(48, 'Ahmed Bashir Abdalla', 'Mohamed', '1983-7-22', 'MCD', 19, 0, 0, 8),
(49, 'Musa Mohamed Abdalla', 'Mohamed', '1982-5-09', 'MCG', 20, 0, 0, 8),
(50, 'Elhadi Salim Abdeltam', 'Akram', '1987-2-27', 'GK', 21, 0, 0, 8),
(51, 'Ishag Hassan Abakar', 'Abdelrahman', '1991-1-01', 'AV', 22, 0, 0, 8),
(52, 'Hamid Nassir', 'Nazar', '1989-1-01', 'MD', 23, 0, 0, 8),
(53, 'BARRY', 'BOUBACAR', '1979-12-30', 'GK', 1, 0, 0, 5),
(54, 'ANGOUA', 'BROU BENJAMIN', '1986-11-28', 'DC', 2, 0, 0, 5),
(55, 'BOKA', 'ETIENNE ARTHUR', '1983-4-02', 'DG', 3, 0, 0, 5),
(56, 'TOURE', 'KOLO ABIB', '1981-3-19', 'DC', 4, 0, 0, 5),
(57, 'ZOKORA', 'DEGUY ALAIN DIDIER', '1980-12-14', 'MD', 5, 0, 0, 5),
(58, 'GOSSO', 'GOSSO JEANJACQUES', '1983-3-15', 'MCD', 6, 0, 0, 5),
(59, 'DOUMBIA', 'SEYDOU', '1987-12-31', 'SA', 7, 0, 0, 5),
(60, 'TIOTE', 'CHEIK ISMAËL', '1986-6-21', 'MD', 9, 0, 0, 5),
(61, 'YAO', 'KOUASSI GERVAIS', '1987-5-27', 'AD', 10, 0, 0, 5),
(62, 'BONY', 'WILFRIED GUEMIAND', '1988-12-10', 'SA', 12, 0, 0, 5),
(63, 'YA', 'KONAN DIDIER', '1984-5-22', 'MD', 13, 0, 0, 5),
(64, 'COULIBALY', 'KAFOUMBA', '1985-10-26', 'MCG', 14, 0, 0, 5),
(65, 'GRADEL', 'MAX ALAIN', '1987-11-30', 'AG', 15, 0, 0, 5),
(66, 'YEBOAH', 'DANIEL TECHI', '1984-11-13', 'GK', 16, 0, 0, 5),
(67, 'TIENE', 'SIAKA', '1982-2-22', 'DG', 17, 0, 0, 5),
(68, 'KEITA', 'ABDUL KADER', '1981-8-06', 'AD', 18, 0, 0, 5),
(69, 'TOURE', 'YAYA GNEGNERI', '1983-5-13', 'MO', 19, 0, 0, 5),
(70, 'LOLO', 'IGOR ALEXANDRE', '1982-7-22', 'DD', 20, 0, 0, 5),
(71, 'EBOUE', 'EMMANUEL', '1983-6-04', 'DD', 21, 0, 0, 5),
(72, 'BAMBA', 'SOULEMAN', '1985-1-13', 'DC', 22, 0, 0, 5),
(73, 'GNANHOUAN', 'AMOUKOU GERARD OKOSIAS', '1979-2-12', 'GK', 23, 0, 0, 5),
(74, 'ALEGRE', 'ilson Edgar Pereira', '1984-7-22', 'GK', 1, 0, 0, 6),
(75, 'AIROSA', 'Marco Ibraim de Sousa', '1984-8-06', 'DC', 2, 0, 0, 6),
(76, 'CARVALHO', 'Osório Smith de Freitas', '1981-7-24', 'MD', 3, 0, 0, 6),
(77, 'AFONSO', 'Massunguna Alex', '1986-5-01', 'DC', 4, 0, 0, 6),
(78, 'ALONSO', 'Carlos Manuel Gonçalves', '1978-10-11', 'DC', 5, 0, 0, 6),
(79, 'DE CARVALHO', 'Aderito Waldemar Alves', '1981-7-04', 'MD', 6, 0, 0, 6),
(80, 'CAMPOS', 'Djalma Braune Manuel Abel', '1987-5-30', 'MCD', 7, 0, 0, 6),
(81, 'MACANGA', 'Andre Venceslau Valentim', '1978-5-14', 'MCG', 8, 0, 0, 6),
(82, 'ALBERTO', 'Mateus Contreiras', '1983-3-07', 'SA', 9, 0, 0, 6),
(83, 'SANTOS', 'Zuela Francisco', '1983-8-03', 'DD', 10, 0, 0, 6),
(84, 'AMARAL', 'Felisberto Sebastiao da Graça', '1982-9-21', 'MO', 11, 0, 0, 6),
(85, 'LINARES', 'Jaime Miguel', '1982-5-21', 'DC', 12, 0, 0, 6),
(86, 'FERNANDES', 'Carlos Alberto', '1979-12-08', 'GK', 13, 0, 0, 6),
(87, 'DA COSTA', 'Amandio Manuel Filipe', '1986-11-12', 'DC', 14, 0, 0, 6),
(88, 'QUIAMI', 'Miguel Geraldo', '1991-9-17', 'DC', 14, 0, 0, 6),
(90, 'AMADO', 'Flávio da Silva', '1979-12-30', 'AV', 16, 0, 0, 6),
(91, 'DA COSTA', 'Mateus Galiano', '1984-6-18', 'MCG', 17, 0, 0, 6),
(92, 'CABUNGULA', 'Arsénio Sebastião', '1979-3-14', 'SA', 18, 0, 0, 6),
(93, 'RAFAEL', 'Nando', '1984-1-10', 'AD', 19, 0, 0, 6),
(94, 'BARROS', 'João Hernani Rosa', '1985-3-21', 'SA', 20, 0, 0, 6),
(95, 'ZALATA', 'Régio Francisco Congo', '1987-6-15', 'DC', 21, 0, 0, 6),
(96, 'MARQUES', 'Hugo Miguel B Henriques', '1986-1-15', 'GK', 22, 0, 0, 6),
(97, 'VUNGUIDICA', 'José Pierre', '1990-1-03', 'SA', 23, 0, 0, 6),
(98, 'Marumo', 'Modiri', '1976-6-07', 'GK', 16, 0, 0, 16),
(99, 'Maposa', 'Noah', '1985-1-03', 'GK', 1, 0, 0, 16),
(100, 'Dambe', 'Kabelo', '1990-5-10', 'GK', 20, 0, 0, 16),
(101, 'Thuma', 'Mompati', '1980-4-05', 'DC', 5, 0, 0, 16),
(102, 'Letsholathebe', 'Ndiyapo', '1983-2-25', 'DC', 2, 0, 0, 16),
(103, 'Motlhabankwe', 'Tshepo M.', '1981-3-17', 'DC', 22, 0, 0, 16),
(104, 'Ramohibidu', 'Mosimanegape', '1985-6-15', 'DC', 3, 0, 0, 16),
(105, 'Gabonamong', 'Mogogi', '1982-9-10', 'DC', 18, 0, 0, 16),
(106, 'Ohilwe', 'Mmusa', '1986-4-17', 'DC', 4, 0, 0, 16),
(107, 'Nato', 'Ofentse', '1989-12-01', 'MD', 6, 0, 0, 16),
(108, 'Motsepe', 'Patrick', '1981-7-01', 'MCG', 12, 0, 0, 16),
(109, 'Selolwane', 'Dipsy', '1978-1-27', 'MCD', 11, 0, 0, 16),
(110, 'ABENDICO', 'POWELL', '1983-1-28', 'MO', 17, 0, 0, 16),
(111, 'Mafoko', 'Boitumelo', '1980-8-29', 'MCD', 13, 0, 0, 16),
(112, 'Mongala', 'Phenyo', '1985-6-10', 'MO', 8, 0, 0, 16),
(113, 'Ngele', 'Mogakolodi', '1990-10-06', 'AV', 19, 0, 0, 16),
(114, 'Ramatlhakwana', 'Jerome', '1985-5-29', 'AV', 9, 0, 0, 16),
(115, 'Moloi', 'Pontsho', '1981-11-28', 'MCD', 7, 0, 0, 16),
(116, 'Tshekiso', 'Onalethata', '1980-5-14', 'SA', 14, 0, 0, 16),
(117, 'Tshireletso', 'Lemponye', '1987-8-26', 'MCG', 21, 0, 0, 16),
(118, 'Kelebale', 'Monametsi', '1980-1-09', 'DD', 15, 0, 0, 16),
(119, 'Moatlhaping', 'Moemedi', '1985-7-14', 'AV', 10, 0, 0, 16),
(120, 'Pilane', 'Othusitse', '1983-2-26', 'MD', 23, 0, 0, 16),
(121, 'AGYEI', 'DANIEL', '1989-11-10', 'GK', 1, 0, 0, 13),
(122, 'OPARE', 'DANEIL TAWIAH', '1990-10-18', 'DC', 2, 0, 0, 13),
(123, 'GYAN', 'ASAMOAH', '1985-11-22', 'AV', 3, 0, 0, 13),
(124, 'PANTSIL', 'JOHN', '1981-6-15', 'DC', 4, 0, 0, 13),
(125, 'MENSAH', 'JOHN', '1982-11-29', 'DC', 5, 0, 0, 13),
(126, 'ANNAN', 'ANTHONY', '1986-7-21', 'MD', 6, 0, 0, 13),
(127, 'INKOOM', 'SAMUEL', '1989-6-01', 'DC', 7, 0, 0, 13),
(128, 'BADU', 'EMMANUEL AGYEMANG', '1990-12-02', 'MCD', 8, 0, 0, 13),
(129, 'BOATENG', 'DEREK OWUSU', '1983-5-02', 'MCG', 9, 0, 0, 13),
(130, 'AYEW', 'ANDRE MORGAN RAMI', '1989-12-17', 'MCG', 10, 0, 0, 13),
(131, 'MUNTARI', 'SULLEY ALI', '1984-8-27', 'MD', 11, 0, 0, 13),
(132, 'TAGOE', 'PRINCE', '1986-11-09', 'AV', 12, 0, 0, 13),
(133, 'AYEW', 'JORDAN PIERRE', '1991-9-11', 'SA', 13, 0, 0, 13),
(134, 'ALHASSAN', 'MASAHUDU', '1992-12-01', 'DC', 14, 0, 0, 13),
(135, 'VORSAH', 'ISAAC', '1988-6-21', 'DC', 15, 0, 0, 13),
(136, 'KWARASEY', 'ADAMBATHIA LARSEN', '1987-1-12', 'GK', 16, 0, 0, 13),
(137, 'ADDY', 'LEE', '1990-7-07', 'DC', 17, 0, 0, 13),
(138, 'TAKYI', 'CHARLES KWAME', '1984-11-12', 'MD', 18, 0, 0, 13),
(139, 'ASAMOAH', 'KWADWO', '1988-12-09', 'MO', 20, 0, 0, 13),
(140, 'BOYE', 'JOHN', '1987-4-23', 'DD', 21, 0, 0, 13),
(141, 'SOWAH', 'ERNEST', '1988-3-31', 'GK', 22, 0, 0, 13),
(142, 'ABU', 'MOHAMMED', '1991-11-14', 'MD', 23, 0, 0, 13),
(143, 'SISSOKO', 'Oumar', '1987-9-13', 'GK', 1, 0, 0, 15),
(144, 'MAIGA', 'Abdoulaye Youssouf', '1988-12-20', 'DC', 2, 0, 0, 15),
(145, 'TAMBOURA', 'Adama', '1985-5-18', 'DC', 3, 0, 0, 15),
(146, 'BERTHE', 'Ousmane', '1982-2-05', 'DC', 4, 0, 0, 15),
(147, 'KANTE', 'Cédric', '1979-7-06', 'DD', 5, 0, 0, 15),
(148, 'YATABARE', 'Mustapha', '1986-1-26', 'SA', 6, 0, 0, 15),
(149, 'TRAORE', 'Abdou', '1988-1-17', 'MD', 7, 0, 0, 15),
(150, 'KEITA', 'SOULEYMANE', '1986-11-24', 'MCG', 8, 0, 0, 15),
(151, 'DIABATE', 'Cheick Tidiane', '1988-1-25', 'AV', 9, 0, 0, 15),
(152, 'MAIGA', 'Modibo', '1987-9-03', 'AV', 10, 0, 0, 15),
(153, 'DEMBELE', 'Garra', '1986-2-21', 'AV', 11, 0, 0, 15),
(154, 'KEITA', 'Seydou', '1981-12-13', 'MO', 12, 0, 0, 15),
(155, 'COULIBALY', 'Idrissa', '1987-12-19', 'DC', 13, 0, 0, 15),
(156, 'DIAKITE', 'Drissa', '1985-2-18', 'DC', 14, 0, 0, 15),
(157, 'TRAORE', 'Bakaye', '1985-3-06', 'MO', 15, 0, 0, 15),
(158, 'DIAKITE', 'Soumaïla', '1984-8-25', 'GK', 16, 0, 0, 15),
(159, 'TRAORE', 'Elhadji Mahamane', '1988-8-31', 'MD', 17, 0, 0, 15),
(160, 'SOW', 'Samba', '1989-4-29', 'MCG', 18, 0, 0, 15),
(161, 'KONE', 'Sidi', '1992-6-06', 'MD', 19, 0, 0, 15),
(162, 'DIAKITE', 'Samba', '1989-1-24', 'MCD', 20, 0, 0, 15),
(163, 'N’DIAYE', 'Mahamadou', '1990-7-21', 'DC', 21, 0, 0, 15),
(164, 'SOGOBA', 'Almamy', '1988-7-05', 'GK', 22, 0, 0, 15),
(165, 'COULIBALY', 'Ousmane', '1989-7-09', 'DC', 23, 0, 0, 15),
(166, 'YATTARA', 'NABY MOUSSA', '1984-1-12', 'GK', 1, 0, 0, 14),
(167, 'FEINDOUNO', 'PASCAL', '1981-2-27', 'MO', 2, 0, 0, 14),
(168, 'BANGOURA', 'IBRAHIMA SORY', '1987-7-25', 'DC', 3, 0, 0, 14),
(169, 'BAH', 'MAMADOU DIOULDE', '1988-4-25', 'MD', 4, 0, 0, 14),
(170, 'BALDE', 'DIAN BOBO', '1975-10-05', 'DC', 5, 0, 0, 14),
(171, 'ZAYATTE', 'KAMIL', '1985-3-07', 'DC', 6, 0, 0, 14),
(172, 'SOUMAH', 'NABY', '1985-8-04', 'MCG', 14, 0, 0, 14),
(173, 'TRAORE', 'IBRAHIMA', '1988-4-21', 'AV', 8, 0, 0, 14),
(174, 'BANGOURA', 'ALHASSANE', '1992-3-30', 'AV', 19, 0, 0, 14),
(175, 'BANGOURA', 'ISMAEL', '1985-6-02', 'AV', 10, 0, 0, 14),
(176, 'YATTARA', 'IBRAHIMA', '1980-6-03', 'AV', 11, 0, 0, 14),
(177, 'CONTE', 'IBRAHIMA SORY', '1991-4-03', 'MCD', 12, 0, 0, 14),
(178, 'CISSE', 'MORLAYE', '1983-12-19', 'MO', 13, 0, 0, 14),
(179, 'CAMARA', 'LANFIA', '1986-10-03', 'MCG', 23, 0, 0, 14),
(180, 'KALABANE', 'OUMAR', '1981-4-08', 'DC', 15, 0, 0, 14),
(181, 'KEITA', 'ABDOUL AZIZ', '1989-2-16', 'GK', 16, 0, 0, 14),
(182, 'BAH', 'THIERNO LAMINE', '1982-10-05', 'DC', 17, 0, 0, 14),
(183, 'DIALLO', 'IBRAHIMA', '1985-9-26', 'DC', 18, 0, 0, 14),
(184, 'CAMARA', 'ABDOUL RAZZAGUI', '1990-2-20', 'AV', 7, 0, 0, 14),
(185, 'BALDE', 'HABIB', '1985-4-08', 'MCG', 20, 0, 0, 14),
(186, 'BARRY', 'OUSMANE', '1993-1-27', 'GK', 21, 0, 0, 14),
(187, 'CAMARA', 'ABOUBACAR', '1993-1-01', 'GK', 22, 0, 0, 14),
(188, 'DIALLO', 'SADIO', '1990-12-28', 'MD', 9, 0, 0, 14),
(189, 'clementino silva', 'emanuel danilo', '1982-3-5', 'GK', 1, 0, 0, 1),
(190, 'vazquez evuy', 'daniel', '1985-3-11', 'DC', 2, 0, 0, 1),
(191, 'alvarez aguirre', 'david', '1984-2-5', 'DC', 3, 0, 0, 1),
(192, 'da gracia gomez', 'rui fernando', '1985-5-28', 'DD', 4, 0, 0, 1),
(193, 'kamisoko', 'fousseny', '1983-4-5', 'DG', 5, 0, 0, 1),
(194, 'EDJOGO OWONO MONTALBAN', 'juvenal', '1979-4-03', 'MCD', 6, 0, 0, 1),
(195, 'DE LA CRUZ BIYOGO', 'Rolan', '1984-10-03', 'MCG', 7, 0, 0, 1),
(196, 'IYANGA TRAVIESO', 'Iban', '1987-6-02', 'MD', 8, 0, 0, 1),
(197, 'BODIPO DIAZ', 'Rodolfo', '1977-10-25', 'SA', 9, 0, 0, 1),
(198, 'BOLADO PALACIOS', 'ivan', '1989-7-03', 'SA', 10, 0, 0, 1),
(199, 'BALBOA OSA', 'Javier-Ángel', '1985-5-13', 'SA', 11, 0, 0, 1),
(200, 'OVONO OVONO', 'Felipe', '1993-7-26', 'GK', 22, 0, 0, 1),
(201, 'EYAMA NDONG', 'Juan-Maximo', '1992-11-08', 'MO', 13, 0, 0, 1),
(202, 'KONATE MAMADOU', 'Ben - Esono', '1989-1-3', 'MCD', 14, 0, 0, 1),
(203, 'DOE', 'Laurence', '1986-9-3', 'DC', 15, 0, 0, 1),
(204, 'SIPOTO BOHALE', 'Armando Aqueriaco', '1988-4-21', 'DD', 16, 0, 0, 1),
(205, 'EKANGA AMIA', 'Narcisse', '1987-7-30', 'MCG', 17, 0, 0, 1),
(206, 'DOUALLA VIERA', 'Ellong', '1987-6-14', 'MD', 18, 0, 0, 1),
(207, 'FABIANI BOSIO', 'Raul-Ivan', '1984-2-23', 'SA', 19, 0, 0, 1),
(208, 'EKEDO CHIGOZIRIN', 'Daniel- Bladimir', '1984-9-19', 'MO', 20, 0, 0, 1),
(209, 'PENSY MOUKEMBE', 'Achille', '1987-1-5', 'GK', 21, 0, 0, 1),
(210, 'FIDJEU TAZEMETA', 'Thierry', '1982-10-13', 'SA', 12, 0, 0, 1),
(211, 'BOKUNG ALOGO', 'José', '1989-12-01', 'DC', 23, 0, 0, 1),
(212, 'ABOD', 'SAMIR', '1972-9-29', 'GK', 1, 0, 0, 4),
(213, 'ABOUBAKER', 'RABEA', '1991-4-23', 'DC', 2, 0, 0, 4),
(214, 'BERRISH', 'ABDULAZIZ', '1990-3-2', 'DC', 3, 0, 0, 4),
(215, 'ALWANI', 'AHMED', '1981-8-19', 'DD', 4, 0, 0, 4),
(216, 'SHIBANI', 'YOUNES', '1981-6-27', 'DG', 5, 0, 0, 4),
(217, 'ESNANI', 'MOHAMED', '1984-5-13', 'MCD', 6, 0, 0, 4),
(218, 'AL SHERIF', 'ABDALAH', '1985-3-30', 'MCG', 8, 0, 0, 4),
(219, 'GHANUDI', 'MOHAMED', '1992-11-22', 'AV', 9, 0, 0, 4),
(220, 'OSMAN', 'AHMED', '1974-8-7', 'MO', 10, 0, 0, 4),
(221, 'EL MUGHRABI', 'MOHAMED', '1985-4-19', 'DC', 11, 0, 0, 4),
(222, 'ESHTIBA', 'OSAMA', '1988-9-27', 'MCD', 7, 0, 0, 4),
(223, 'MOUSA', 'GUMA', '1978-1-1', 'GK', 12, 0, 0, 4),
(224, 'ELMONIR', 'MOHAMED', '1992-4-8', 'DC', 13, 0, 0, 4),
(225, 'SALAMA', 'ALI', '1987-9-18', 'DC', 14, 0, 0, 4),
(226, 'AHMED', 'MARWAN', '1989-12-15', 'MCD', 15, 0, 0, 4),
(227, 'SUIUEINEI', 'ABUBAKER', '1981-10-27', 'MCG', 16, 0, 0, 4),
(228, 'ELKHATROUSHI', 'WALID', '1985-11-6', 'SA', 17, 0, 0, 4),
(229, 'SALEH', 'FAISAL', '1990-6-4', 'MO', 18, 0, 0, 4),
(230, 'ZUWAY', 'AHMED', '1982-12-28', 'AG', 19, 0, 0, 4),
(231, 'ALBUSAIFI', 'IHAB', '1985-6-23', 'AD', 20, 0, 0, 4),
(232, 'BEN AMER', 'MUATAZ', '1981-2-2', 'MO', 21, 0, 0, 4),
(233, 'NASHNUSH', 'MOHAMED', '1988-6-14', 'GK', 22, 0, 0, 4),
(234, 'MOHAMED', 'JAMAL', '1983-4-26', 'SA', 23, 0, 0, 4),
(235, 'COUNDOUL', 'BOUNA', '1982-3-4', 'GK', 1, 0, 0, 3),
(236, 'GOMIS', 'RÉMI', '1984-2-14', 'MCD', 2, 0, 0, 3),
(237, 'SANÉ', 'LUDOVIC LAMINE', '1987-3-22', 'DC', 3, 0, 0, 3),
(238, 'DIAKHATÉ', 'PAPA MALICKOU', '1984-6-21', 'DC', 4, 0, 0, 3),
(239, 'DIAWARA', 'SOULEYMANE', '1987-12-24', 'DC', 5, 0, 0, 3),
(240, 'MANGANE', 'ABDOU KADER', '1983-3-23', 'DC', 6, 0, 0, 3),
(241, 'SOW', 'MOUSSA', '1986-1-19', 'AV', 7, 0, 0, 3),
(242, 'NIANG', 'MAMADOU HAMIDOU', '1979-10-13', 'AV', 8, 0, 0, 3),
(243, 'CAMARA', 'SOULEYMANE', '1982-12-22', 'SA', 9, 0, 0, 3),
(244, 'DIA', 'ISSIAR', '1987-6-8', 'MO', 10, 0, 0, 3),
(245, 'NDOYE', 'DAME', '1985-2-21', 'AG', 11, 0, 0, 3),
(246, 'SALL', 'MOUSTAPHA BAYAL', '1985-11-30', 'DD', 12, 0, 0, 3),
(247, 'FATY', 'JACQUES DOUDOU', '1984-2-25', 'DG', 13, 0, 0, 3),
(248, 'NDIAYE', 'DEME NDIAYE', '1985-2-6', 'MCD', 14, 0, 0, 3),
(249, 'CISSÉ', 'PAPISS DEMBA', '1985-6-3', 'AD', 15, 0, 0, 3),
(250, 'NDIAYE', 'KHADIM', '1985-4-5', 'GK', 16, 0, 0, 3),
(251, 'DAF', 'OMAR', '1977-2-12', 'DG', 17, 0, 0, 3),
(252, 'NDAW', 'GUIRANE', '1984-4-24', 'MCG', 18, 0, 0, 3),
(253, 'BA', 'DEMBA', '1985-5-25', 'AG', 19, 0, 0, 3),
(254, 'TRAORÉ', 'ARMAND MOHAMED', '1989-10-8', 'DG', 20, 0, 0, 3),
(255, 'DIAMÉ', 'MOHAMED', '1987-6-14', 'MD', 21, 0, 0, 3),
(256, 'MBENGUE', 'CHEIKH SIDI BOUYA', '1988-7-23', 'DD', 22, 0, 0, 3),
(257, 'NDIAYE', 'PAPE LATYRE', '1977-11-30', 'GK', 23, 0, 0, 3),
(258, 'MWEENE', 'KENNEDY', '1984-12-11', 'GK', 16, 0, 0, 2),
(259, 'KALILILO', 'KAKONJE', '1985-1-1', 'GK', 1, 0, 0, 2),
(260, 'KALABA', 'RAINFORD', '1992-1-20', 'MCD', 17, 0, 0, 2),
(261, 'MBESUMA', 'COLLINS', '1984-2-3', 'AV', 9, 0, 0, 2),
(262, 'SUNZU', 'STOPPILA', '1989-6-22', 'DC', 13, 0, 0, 2),
(263, 'SINKALA', 'NATHAN', '1990-11-22', 'MCG', 19, 0, 0, 2),
(264, 'CHAMANGA', 'JAMES', '1980-2-2', 'GK', 12, 0, 0, 2),
(265, 'KATONGO', 'CHRISTOPHER', '1982-8-31', 'MO', 11, 0, 0, 2),
(266, 'KATONGO', 'FELIX', '1984-4-18', 'MD', 10, 0, 0, 2),
(267, 'CHANSA', 'ISAAC', '1984-3-23', 'AD', 8, 0, 0, 2),
(268, 'CHINTU', 'KAMPAMBA', '1980-12-28', 'DC', 15, 0, 0, 2),
(269, 'LUNGU', 'CHISAMBA', '1991-1-31', 'MCD', 3, 0, 0, 2),
(270, 'MULENGA', 'NYAMBE henri', '1987-8-27', 'DD', 23, 0, 0, 2),
(271, 'MULENGA', 'CLIFFORD', '1987-8-5', 'AG', 7, 0, 0, 2),
(272, 'KASONDE', 'FRANCIS', '1986-9-1', 'DG', 2, 0, 0, 2),
(273, 'MAYUKA', 'EMMANUEL', '1990-11-21', 'SA', 20, 0, 0, 2),
(274, 'CHIVUTA', 'NOAH SIKOMBE', '1983-12-25', 'MD', 14, 0, 0, 2),
(275, 'KANGWA', 'EVANS', '1992-10-9', 'AV', 18, 0, 0, 2),
(276, 'NKAUSU', 'DAVIES', '1986-1-1', 'DD', 6, 0, 0, 2),
(277, 'HIMOONDE', 'HICHANI', '1987-8-1', 'DG', 5, 0, 0, 2),
(278, 'MUSONDA', 'JOSEPH', '1977-5-30', 'DC', 4, 0, 0, 2),
(279, 'SAKUWAHA', 'JONAS', '1983-7-22', 'GK', 21, 0, 0, 2),
(280, 'OVONO EBANG', 'DIDIER', '1983-1-23', 'GK', 1, 0, 0, 9),
(281, 'AMBOUROUET', 'GEORGES', '1986-5-1', 'DC', 2, 0, 0, 9),
(282, 'MOUELE', 'EDMOND', '1988-10-13', 'DC', 3, 0, 0, 9),
(283, 'EBANEGA EKWA', 'REMY NENET', '1989-11-17', 'DD', 4, 0, 0, 9),
(284, 'ECUELE MANGA', 'BRUNO', '1988-7-16', 'DG', 5, 0, 0, 9),
(285, 'BOUSSOUGHOU MABIKOU', 'CEDRIC', '1991-7-20', 'MCD', 6, 0, 0, 9),
(286, 'NGUEMA ONDO', 'STEPHANE', '1984-11-20', 'AV', 7, 0, 0, 9),
(287, 'PALUN', 'LLOYD', '1988-11-28', 'MCG', 8, 0, 0, 9),
(288, 'AUBAMEYANG', 'PIERRE EMERICK', '1989-6-18', 'AV', 9, 0, 0, 9),
(289, 'COUSIN', 'DANIEL MICHEL', '1977-2-7', 'SA', 10, 0, 0, 9),
(290, 'MOULOUNGUI', 'ERIC', '1984-4-1', 'AG', 11, 0, 0, 9),
(291, 'NDONG', 'HENRI JUNIOR', '1992-8-23', 'DC', 12, 0, 0, 9),
(292, 'MBANANGOYE', 'BRUNO-ZITA', '1980-7-15', 'MD', 13, 0, 0, 9),
(293, 'MADINDA', 'LEVY CLEMENT', '1992-6-11', 'MO', 14, 0, 0, 9),
(294, 'BIYOGO POKO', 'ANDRE', '1993-1-1', 'MD', 15, 0, 0, 9),
(295, 'BIDONGA', 'YANNE WILF', '1981-5-20', 'GK', 16, 0, 0, 9),
(296, 'BROU APANGA', 'MOÏSE', '1982-2-4', 'DG', 17, 0, 0, 9),
(297, 'MOUBAMBA', 'CEDRIC', '1979-10-13', 'MCG', 18, 0, 0, 9),
(298, 'MOUNDOUGA MOUNDOUGA', 'RODRIGUE', '1982-8-28', 'DC', 19, 0, 0, 9),
(299, 'DO MARCOLINO ANGUILET', 'FABRICE', '1983-3-14', 'SA', 20, 0, 0, 9),
(300, 'MEYE', 'ROGUY', '1986-10-7', 'AD', 21, 0, 0, 9),
(301, 'MOUSSONO MOUSSONO', 'CHARLY', '1984-11-15', 'DG', 22, 0, 0, 9),
(302, 'BITSEKI MOTO', 'YVES STEPHANE', '1983-4-23', 'GK', 23, 0, 0, 9),
(303, 'RABO KABARA', 'SAMINOU', '1981-8-23', 'GK', 1, 0, 0, 12),
(304, 'OUWO MOUSSA', 'MAAZOU', '1988-8-25', 'AV', 2, 0, 0, 12),
(305, 'LANCINA', 'KARIM', '1987-3-20', 'MCD', 3, 0, 0, 12),
(306, 'AMADOU', 'KADER', '1989-4-3', 'DC', 4, 0, 0, 12),
(307, 'BULUS', 'JIMMY', '1986-10-22', 'DC', 5, 0, 0, 12),
(308, 'MOUSSA SOUNA', 'DJIBRIL', '1992-5-7', 'DD', 12, 0, 0, 12),
(309, 'CHICOTO', 'MOHAMED', '1989-8-1', 'DG', 13, 0, 0, 12),
(310, 'BOUBACAR GARBA M.', 'ISSOUFOU', '1990-2-2', 'SA', 14, 0, 0, 12),
(311, 'MAZADOU', 'SULLIMAN JOHAN', '1985-4-11', 'DC', 15, 0, 0, 12),
(312, 'DAOUDA', 'KASSALY', '1983-8-19', 'GK', 16, 0, 0, 12),
(313, 'TONJI NGOUNOU', 'WILLIAM', '1983-7-31', 'MCG', 17, 0, 0, 12),
(314, 'DANKWAE', 'KOFI', '1989-9-17', 'DC', 18, 0, 0, 12),
(315, 'KOUDIZE', 'ISSIAKOU', '1990-10-18', 'MD', 19, 0, 0, 12),
(316, 'AMADOU', 'MOUTARI', '1994-1-19', 'MO', 20, 0, 0, 12),
(317, 'SEYDOU ALI', 'YACOUBA', '1992-4-06', 'MD', 21, 0, 0, 12),
(318, 'LOSSEINY DOUMBIA', 'ISSA', '1992-4-5', 'GK', 22, 0, 0, 12),
(319, 'SOUMAILA A', 'MOHAMED', '1994-10-30', 'DD', 23, 0, 0, 12),
(320, 'LAMYAGHRI', 'NADIR', '1976-2-13', 'GK', 1, 0, 0, 11),
(321, 'BASSER', 'MICHAEL', '1984-7-10', 'DC', 2, 0, 0, 11),
(322, 'EL KADDOURI', 'BADR', '1981-1-31', 'DC', 3, 0, 0, 11),
(323, 'KANTARI', 'AHMED', '1985-6-28', 'DD', 4, 0, 0, 11),
(324, 'EL MOUTTAQUI', 'MEHDI AMINE', '1987-4-17', 'DG', 5, 0, 0, 11),
(325, 'HERMACH', 'ADIL', '1986-6-27', 'MCD', 6, 0, 0, 11),
(326, 'TAARABT', 'ADEL', '1989-5-24', 'AV', 7, 0, 0, 11),
(327, 'EL AHMADI AROUSSI', 'KARIM', '1985-1-27', 'MCG', 8, 0, 0, 11),
(328, 'EL ARABI', 'YOUSSEF', '1987-2-3', 'SA', 9, 0, 0, 11),
(329, 'BELHANDA', 'YOUNES', '1990-2-25', 'MO', 10, 0, 0, 11),
(330, 'ASSAIDI', 'OSSAMA', '1988-8-15', 'MD', 11, 0, 0, 11),
(331, 'AMSIF', 'MOHAMED', '1989-2-7', 'GK', 12, 0, 0, 11),
(332, 'KHARJA', 'HOUSSINE', '1982-11-9', 'MD', 13, 0, 0, 11),
(333, 'BOUSSOUFA', 'MBARK', '1984-8-15', 'MCG', 14, 0, 0, 11),
(334, 'EL KAOUTARI', 'ABDELHAMID', '1990-3-17', 'DC', 15, 0, 0, 11),
(335, 'ALIOUI', 'JAMAL', '1982-6-2', 'DD', 16, 0, 0, 11),
(336, 'CHAMAKH', 'MAROUANE', '1984-1-10', 'AG', 17, 0, 0, 11),
(337, 'BOUKHRISS', 'ABDELFETTAH', '1986-10-22', 'DG', 18, 0, 0, 11),
(338, 'CARCELA GONZALEZ', 'MEHDI FRANCOIS', '1989-7-1', 'MCD', 19, 0, 0, 11),
(339, 'HADJI', 'YOUSSOUF', '1980-2-25', 'AV', 20, 0, 0, 11),
(340, 'AMRABAT', 'BADDA', '1983-5-10', 'GK', 22, 0, 0, 11),
(341, 'MRANI', 'MUSTAPHA', '1978-3-2', 'DC', 23, 0, 0, 11),
(342, 'BEN CHERIFIA', 'MOEZ', '1991-6-24 ', 'GK', 1, 0, 0, 10),
(343, 'IFA', 'BILEL', '1990-3-9', 'DC', 2, 0, 0, 10),
(344, 'HAGGUI', 'KARIM', '1984-1-20', 'DC', 3, 0, 0, 10),
(345, 'CHEDELI', 'ADEL', '1987-4-16', 'MCD', 4, 0, 0, 10),
(346, 'JEMAL', 'AMMAR', '1987-4-20', 'DD', 5, 0, 0, 10),
(347, 'RAGUED', 'HOCINE', '1983-2-11', 'MCG', 6, 0, 0, 10),
(348, 'MSAKNI', 'YOUSSEF', '1990-10-28', 'MD', 7, 0, 0, 10),
(349, 'KORBI', 'KHALED', '1985-12-16', 'MO', 8, 0, 0, 10),
(350, 'CHIKHAOUI', 'YASINE', '1986-9-22', 'SA', 9, 0, 0, 10),
(351, 'DARRAGI', 'OUSAMA', '1987-4-3', 'AG', 10, 0, 0, 10),
(352, 'ALLAGUI', 'SAMI', '1986-5-28', 'AV', 11, 0, 0, 10),
(353, 'CHAMMEM', 'KHELIL', '19871-7-24', 'DC', 12, 0, 0, 10),
(354, 'BEN YAHIA', 'WISSEM', '1984-9-9', 'DC', 13, 0, 0, 10),
(355, 'TRAOUI', 'MEJDI', '1983-12-13', 'MCD', 14, 0, 0, 10),
(356, 'DHAOUADI', 'ZOUHAIER', '1988-1-1', 'AD', 15, 0, 0, 10),
(357, 'MATHLOUTHI', 'AYMEN', '1984-9-14', 'GK', 16, 0, 0, 10),
(358, 'JEMAA', 'ISSAM', '1984-1-28', 'AV', 17, 0, 0, 10),
(359, 'BOUSSAIDI', 'ANIS', '1981-4-10', 'DD', 18, 0, 0, 10),
(360, 'KHALIFA', 'SABER', '1986-10-14', 'AG', 19, 0, 0, 10),
(361, 'ABDENNOUR', 'AYMEN', '1989-8-6', 'DG', 20, 0, 0, 10),
(362, 'SAIHI', 'JAMEL', '1987-1-27', 'MCG', 21, 0, 0, 10),
(363, 'JERIDI', 'RAMI', '1984-9-15', 'GK', 22, 0, 0, 10),
(364, 'CHERMITI', 'AMINE', '1987-12-26', 'AV', 23, 0, 0, 10);

-- --------------------------------------------------------

--
-- Structure de la table `joueur_matchs`
--

CREATE TABLE IF NOT EXISTS `joueur_matchs` (
  `idjoueur` int(10) NOT NULL,
  `idmatchs` int(2) NOT NULL,
  `nbut` int(2) NOT NULL,
  PRIMARY KEY (`idjoueur`,`idmatchs`),
  KEY `FK_joueur_matchs_idmatchs` (`idmatchs`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `matchs`
--

CREATE TABLE IF NOT EXISTS `matchs` (
  `idmatchs` int(2) NOT NULL AUTO_INCREMENT,
  `lieu` varchar(50) DEFAULT NULL,
  `arbitre` varchar(100) DEFAULT NULL,
  `datem` varchar(30) DEFAULT NULL,
  `joue` bit(1) DEFAULT NULL,
  `idquart` int(1) DEFAULT NULL,
  `iddemi` int(1) DEFAULT NULL,
  `idpfinale` int(1) DEFAULT NULL,
  `idfinale` int(1) DEFAULT NULL,
  `idpoule` int(1) DEFAULT NULL,
  PRIMARY KEY (`idmatchs`),
  KEY `FK_matchs_idquart` (`idquart`),
  KEY `FK_matchs_iddemi` (`iddemi`),
  KEY `FK_matchs_idpfinale` (`idpfinale`),
  KEY `FK_matchs_idfinale` (`idfinale`),
  KEY `FK_matchs_idpoule` (`idpoule`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=27 ;

--
-- Contenu de la table `matchs`
--

INSERT INTO `matchs` (`idmatchs`, `lieu`, `arbitre`, `datem`, `joue`, `idquart`, `iddemi`, `idpfinale`, `idfinale`, `idpoule`) VALUES
(3, 'stade de bata', 'desire doue noumandiez', '2012-1-21 19:30: 00', '0', NULL, NULL, NULL, NULL, 1),
(4, 'stade de bata', 'alioum', '2012-1-21 22:00: 00', '0', NULL, NULL, NULL, NULL, 1),
(5, 'stade de bata', 'koman coulibaly', '2012-1-25 17:00: 00', '0', NULL, NULL, NULL, NULL, 1),
(6, 'stade de bata', 'khalid abdel rahman', '2012-1-25 20:00: 00', '0', NULL, NULL, NULL, NULL, 1),
(7, 'satde de malado', 'mohamed benouza', '2012-1-29 19:00: 00', '0', NULL, NULL, NULL, NULL, 1),
(8, 'stade de bata', 'rajindraparsad seechum', '2012-1-29 19:00: 00', '0', NULL, NULL, NULL, NULL, 1),
(9, 'stade de malabo', 'Rajindraparsad Seechurn', '2012-1-22 17:00: 00', '0', NULL, NULL, NULL, NULL, 2),
(10, 'malabo', 'Mohamed Benouza', '2012-1-22 20:00: 00', '0', NULL, NULL, NULL, NULL, 2),
(11, 'stade de malabo', 'Ali Lemghaifry', '2012-1-26 17:00: 00', '0', NULL, NULL, NULL, NULL, 2),
(12, 'stade de malabo', 'Gihed Gricha', '2012-1-26 20:00: 00', '0', NULL, NULL, NULL, NULL, 2),
(13, 'stade de bata', 'Eric Otogo', '2012-1-30 19:00: 00', '0', NULL, NULL, NULL, NULL, 2),
(14, 'stade de malabo', 'Selim Jedidi', '2012-1-30 19:00: 00', '0', NULL, NULL, NULL, NULL, 2),
(15, 'Stade Angondjé', 'Eddy Maillet', '2012-1-23 17:00: 00', '0', NULL, NULL, NULL, NULL, 3),
(16, 'Stade Angondjé', 'Daniel Bennett', '2012-1-23 20:00: 00', '0', NULL, NULL, NULL, NULL, 3),
(17, 'Stade Angondjé', 'Janny Sikazwe', '2012-1-27 17:00: 00', '0', NULL, NULL, NULL, NULL, 3),
(18, 'Stade Angondjé', 'Bakary Gassama', '2012-1-27 20:00: 00', '0', NULL, NULL, NULL, NULL, 3),
(19, 'Stade de Franceville', 'Désiré Doué Noumandiez', '2012-1-31 19:00: 00', '0', NULL, NULL, NULL, NULL, 3),
(20, 'Stade Angondjé', 'Hamada Nampiandraza', '2012-1-31 19:00: 00', '0', NULL, NULL, NULL, NULL, 3),
(21, 'Stade de Franceville', 'Badara Diatta', '2012-1-24 17:00: 00', '0', NULL, NULL, NULL, NULL, 4),
(22, 'Stade de Franceville', 'Selim Jedidi', '2012-1-24 20:00: 00', '0', NULL, NULL, NULL, NULL, 4),
(23, 'Stade de Franceville', 'Bouchaïb El Ahrach', '2012-1-28 17:00: 00', '0', NULL, NULL, NULL, NULL, 4),
(24, 'Stade de Franceville', 'Djamel Haimoudi', '2012-1-28 20:00: 00', '0', NULL, NULL, NULL, NULL, 4),
(25, 'Stade Angondjé', 'Khalid Abdel Rahman', '2012-2-1 19:00: 00', '0', NULL, NULL, NULL, NULL, 4),
(26, 'Stade de Franceville', 'Daniel Bennett', '2012-2-1 19:00: 00', '0', NULL, NULL, NULL, NULL, 4);

-- --------------------------------------------------------

--
-- Structure de la table `participer`
--

CREATE TABLE IF NOT EXISTS `participer` (
  `idequipe` int(2) NOT NULL,
  `idedition` int(3) NOT NULL,
  PRIMARY KEY (`idequipe`,`idedition`),
  KEY `FK_participer_idedition` (`idedition`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `participer`
--

INSERT INTO `participer` (`idequipe`, `idedition`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1);

-- --------------------------------------------------------

--
-- Structure de la table `pfinale`
--

CREATE TABLE IF NOT EXISTS `pfinale` (
  `idpfinale` int(1) NOT NULL AUTO_INCREMENT,
  `libellepf` text,
  `idedition` int(3) DEFAULT NULL,
  PRIMARY KEY (`idpfinale`),
  KEY `FK_pfinale_idedition` (`idedition`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Contenu de la table `pfinale`
--

INSERT INTO `pfinale` (`idpfinale`, `libellepf`, `idedition`) VALUES
(1, 'Perdant 1A-2B/1C-2D vs 1B-2A/1D-2C', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `poule`
--

CREATE TABLE IF NOT EXISTS `poule` (
  `idpoule` int(1) NOT NULL AUTO_INCREMENT,
  `nom` char(1) DEFAULT NULL,
  `idedition` int(3) DEFAULT NULL,
  PRIMARY KEY (`idpoule`),
  KEY `idedition` (`idedition`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Contenu de la table `poule`
--

INSERT INTO `poule` (`idpoule`, `nom`, `idedition`) VALUES
(1, 'A', 1),
(2, 'B', 1),
(3, 'C', 1),
(4, 'D', 1);

-- --------------------------------------------------------

--
-- Structure de la table `quart`
--

CREATE TABLE IF NOT EXISTS `quart` (
  `idquart` int(1) NOT NULL AUTO_INCREMENT,
  `libelle` text,
  `idedition` int(3) DEFAULT NULL,
  PRIMARY KEY (`idquart`),
  KEY `FK_quart_idedition` (`idedition`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Contenu de la table `quart`
--

INSERT INTO `quart` (`idquart`, `libelle`, `idedition`) VALUES
(1, '1A-2B', NULL),
(2, '1B-2A', NULL),
(3, '1C-2D', NULL),
(4, '1D-2C', NULL);

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `administration`
--
ALTER TABLE `administration`
  ADD CONSTRAINT `FK_administration_idequipe` FOREIGN KEY (`idequipe`) REFERENCES `equipe` (`idequipe`);

--
-- Contraintes pour la table `demi`
--
ALTER TABLE `demi`
  ADD CONSTRAINT `FK_demi_idedition` FOREIGN KEY (`idedition`) REFERENCES `edition` (`idedition`);

--
-- Contraintes pour la table `entraineur`
--
ALTER TABLE `entraineur`
  ADD CONSTRAINT `FK_entraineur_idequipe` FOREIGN KEY (`idequipe`) REFERENCES `equipe` (`idequipe`);

--
-- Contraintes pour la table `equipe`
--
ALTER TABLE `equipe`
  ADD CONSTRAINT `FK_equipe_idpoule` FOREIGN KEY (`idpoule`) REFERENCES `poule` (`idpoule`);

--
-- Contraintes pour la table `equipe_matchs`
--
ALTER TABLE `equipe_matchs`
  ADD CONSTRAINT `FK_equipe_matchs_idequipe` FOREIGN KEY (`idequipe`) REFERENCES `equipe` (`idequipe`),
  ADD CONSTRAINT `FK_equipe_matchs_idmatchs` FOREIGN KEY (`idmatchs`) REFERENCES `matchs` (`idmatchs`);

--
-- Contraintes pour la table `finale`
--
ALTER TABLE `finale`
  ADD CONSTRAINT `FK_finale_idedition` FOREIGN KEY (`idedition`) REFERENCES `edition` (`idedition`);

--
-- Contraintes pour la table `joueur`
--
ALTER TABLE `joueur`
  ADD CONSTRAINT `FK_joueur_idequipe` FOREIGN KEY (`idequipe`) REFERENCES `equipe` (`idequipe`);

--
-- Contraintes pour la table `joueur_matchs`
--
ALTER TABLE `joueur_matchs`
  ADD CONSTRAINT `FK_joueur_matchs_idjoueur` FOREIGN KEY (`idjoueur`) REFERENCES `joueur` (`idjoueur`),
  ADD CONSTRAINT `FK_joueur_matchs_idmatchs` FOREIGN KEY (`idmatchs`) REFERENCES `matchs` (`idmatchs`);

--
-- Contraintes pour la table `matchs`
--
ALTER TABLE `matchs`
  ADD CONSTRAINT `FK_matchs_iddemi` FOREIGN KEY (`iddemi`) REFERENCES `demi` (`iddemi`),
  ADD CONSTRAINT `FK_matchs_idfinale` FOREIGN KEY (`idfinale`) REFERENCES `finale` (`idfinale`),
  ADD CONSTRAINT `FK_matchs_idpfinale` FOREIGN KEY (`idpfinale`) REFERENCES `pfinale` (`idpfinale`),
  ADD CONSTRAINT `FK_matchs_idpoule` FOREIGN KEY (`idpoule`) REFERENCES `poule` (`idpoule`),
  ADD CONSTRAINT `FK_matchs_idquart` FOREIGN KEY (`idquart`) REFERENCES `quart` (`idquart`);

--
-- Contraintes pour la table `participer`
--
ALTER TABLE `participer`
  ADD CONSTRAINT `FK_participer_idedition` FOREIGN KEY (`idedition`) REFERENCES `edition` (`idedition`),
  ADD CONSTRAINT `FK_participer_idequipe` FOREIGN KEY (`idequipe`) REFERENCES `equipe` (`idequipe`);

--
-- Contraintes pour la table `pfinale`
--
ALTER TABLE `pfinale`
  ADD CONSTRAINT `FK_pfinale_idedition` FOREIGN KEY (`idedition`) REFERENCES `edition` (`idedition`);

--
-- Contraintes pour la table `poule`
--
ALTER TABLE `poule`
  ADD CONSTRAINT `poule_ibfk_1` FOREIGN KEY (`idedition`) REFERENCES `edition` (`idedition`) ON DELETE SET NULL ON UPDATE SET NULL;

--
-- Contraintes pour la table `quart`
--
ALTER TABLE `quart`
  ADD CONSTRAINT `FK_quart_idedition` FOREIGN KEY (`idedition`) REFERENCES `edition` (`idedition`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
