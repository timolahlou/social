-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: May 15, 2017 at 10:24 PM
-- Server version: 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `social`
--

-- --------------------------------------------------------

--
-- Table structure for table `arret_travail`
--

CREATE TABLE IF NOT EXISTS `arret_travail` (
  `id_at` int(11) NOT NULL AUTO_INCREMENT,
  `date_sortie` date NOT NULL,
  `nbr_jours` int(11) NOT NULL,
  `retenu_sur_salaire` int(11) DEFAULT NULL,
  `motif` varchar(255) DEFAULT NULL,
  `medecin` varchar(20) DEFAULT NULL,
  `N_omran` int(11) NOT NULL,
  PRIMARY KEY (`id_at`),
  KEY `FK_ARRET_TRAVAIL_N_omran` (`N_omran`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `asuurance`
--

CREATE TABLE IF NOT EXISTS `asuurance` (
  `id_assurance` int(11) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(255) NOT NULL,
  `type` varchar(10) NOT NULL,
  PRIMARY KEY (`id_assurance`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `beneficiere`
--

CREATE TABLE IF NOT EXISTS `beneficiere` (
  `id_benefi` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) DEFAULT NULL,
  `prenom` varchar(255) NOT NULL,
  `matricule_benef` varchar(255) DEFAULT NULL,
  `date_nassance` int(11) NOT NULL,
  `lien_parente` varchar(255) DEFAULT NULL,
  `N_omran` int(11) NOT NULL,
  PRIMARY KEY (`id_benefi`),
  KEY `FK_BENEFICIERE_N_omran` (`N_omran`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `dantaire`
--

CREATE TABLE IF NOT EXISTS `dantaire` (
  `id_dantaire` int(11) NOT NULL AUTO_INCREMENT,
  `date_soins` date DEFAULT NULL,
  `dent_traitees` varchar(255) DEFAULT NULL,
  `coeff_traveaux` varchar(255) DEFAULT NULL,
  `honoraires` varchar(255) DEFAULT NULL,
  `avis_medecin` varchar(255) DEFAULT NULL,
  `montant_dantaire` int(11) DEFAULT NULL,
  `id_cmim` varchar(255) NOT NULL,
  PRIMARY KEY (`id_dantaire`),
  KEY `FK_DANTAIRE_id_cmim` (`id_cmim`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `dossier_cmim`
--

CREATE TABLE IF NOT EXISTS `dossier_cmim` (
  `id_cmim` varchar(255) NOT NULL,
  `date_envoie` date NOT NULL,
  `montant_rembourse` int(11) NOT NULL,
  `motif` varchar(255) DEFAULT NULL,
  `id_benefi` int(11) NOT NULL,
  `id_pharmacie` int(11) NOT NULL,
  `id_dantaire` int(11) NOT NULL,
  PRIMARY KEY (`id_cmim`),
  KEY `FK_DOSSIER_CMIM_id_benefi` (`id_benefi`),
  KEY `FK_DOSSIER_CMIM_id_pharmacie` (`id_pharmacie`),
  KEY `FK_DOSSIER_CMIM_id_dantaire` (`id_dantaire`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `personnel`
--

CREATE TABLE IF NOT EXISTS `personnel` (
  `N_omran` int(11) NOT NULL,
  `nom` varchar(255) NOT NULL,
  `prenom` varchar(255) NOT NULL,
  `tel` varchar(255) NOT NULL,
  `adress` varchar(255) NOT NULL,
  `cin` varchar(255) DEFAULT NULL,
  `matricule_assu` varchar(255) NOT NULL,
  `mdp` varchar(255) NOT NULL,
  PRIMARY KEY (`N_omran`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `personnel`
--

INSERT INTO `personnel` (`N_omran`, `nom`, `prenom`, `tel`, `adress`, `cin`, `matricule_assu`, `mdp`) VALUES
(999, 'Lahlou', 'Timo', '0623232354', 'Imam Ali', 'CD789456', '556325', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `pharmacie`
--

CREATE TABLE IF NOT EXISTS `pharmacie` (
  `id_pharmacie` int(11) NOT NULL AUTO_INCREMENT,
  `detail_ordonance` varchar(255) DEFAULT NULL,
  `quantite` int(11) DEFAULT NULL,
  `montant_ph` int(11) NOT NULL,
  `observasion` varchar(255) DEFAULT NULL,
  `date_pharmacie` date DEFAULT NULL,
  `id_cmim` varchar(255) NOT NULL,
  PRIMARY KEY (`id_pharmacie`),
  KEY `FK_PHARMACIE_id_cmim` (`id_cmim`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `possede`
--

CREATE TABLE IF NOT EXISTS `possede` (
  `montant_retraite` int(11) DEFAULT NULL,
  `N_omran` int(11) NOT NULL,
  `id_retraite` int(11) NOT NULL,
  PRIMARY KEY (`N_omran`,`id_retraite`),
  KEY `FK_possede_id_retraite` (`id_retraite`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `prend`
--

CREATE TABLE IF NOT EXISTS `prend` (
  `montant_assur` int(11) DEFAULT NULL,
  `N_omran` int(11) NOT NULL,
  `id_assurance` int(11) NOT NULL,
  PRIMARY KEY (`N_omran`,`id_assurance`),
  KEY `FK_prend_id_assurance` (`id_assurance`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `prestation`
--

CREATE TABLE IF NOT EXISTS `prestation` (
  `id_prestation` int(11) NOT NULL AUTO_INCREMENT,
  `praticien` varchar(255) DEFAULT NULL,
  `date_debut_soins` date DEFAULT NULL,
  `date_fin_soins` date DEFAULT NULL,
  `actes_quantite_coefficient` varchar(255) DEFAULT NULL,
  `montant` int(11) DEFAULT NULL,
  `code_INP` varchar(255) DEFAULT NULL,
  `nom_maladie` varchar(255) DEFAULT NULL,
  `id_cmim` varchar(255) NOT NULL,
  PRIMARY KEY (`id_prestation`),
  KEY `FK_PRESTATION_id_cmim` (`id_cmim`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `prise_en_charge`
--

CREATE TABLE IF NOT EXISTS `prise_en_charge` (
  `id_prise` int(11) NOT NULL AUTO_INCREMENT,
  `date__hospitalisation` date DEFAULT NULL,
  `motif` varchar(255) DEFAULT NULL,
  `devis` int(11) DEFAULT NULL,
  `montant_accord` int(11) DEFAULT NULL,
  `id_benefi` int(11) NOT NULL,
  PRIMARY KEY (`id_prise`),
  KEY `FK_PRISE_EN_CHARGE_id_benefi` (`id_benefi`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `retraite`
--

CREATE TABLE IF NOT EXISTS `retraite` (
  `id_retraite` int(11) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  PRIMARY KEY (`id_retraite`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `arret_travail`
--
ALTER TABLE `arret_travail`
  ADD CONSTRAINT `FK_ARRET_TRAVAIL_N_omran` FOREIGN KEY (`N_omran`) REFERENCES `personnel` (`N_omran`);

--
-- Constraints for table `beneficiere`
--
ALTER TABLE `beneficiere`
  ADD CONSTRAINT `FK_BENEFICIERE_N_omran` FOREIGN KEY (`N_omran`) REFERENCES `personnel` (`N_omran`);

--
-- Constraints for table `dantaire`
--
ALTER TABLE `dantaire`
  ADD CONSTRAINT `FK_DANTAIRE_id_cmim` FOREIGN KEY (`id_cmim`) REFERENCES `dossier_cmim` (`id_cmim`);

--
-- Constraints for table `dossier_cmim`
--
ALTER TABLE `dossier_cmim`
  ADD CONSTRAINT `FK_DOSSIER_CMIM_id_benefi` FOREIGN KEY (`id_benefi`) REFERENCES `beneficiere` (`id_benefi`),
  ADD CONSTRAINT `FK_DOSSIER_CMIM_id_dantaire` FOREIGN KEY (`id_dantaire`) REFERENCES `dantaire` (`id_dantaire`),
  ADD CONSTRAINT `FK_DOSSIER_CMIM_id_pharmacie` FOREIGN KEY (`id_pharmacie`) REFERENCES `pharmacie` (`id_pharmacie`);

--
-- Constraints for table `pharmacie`
--
ALTER TABLE `pharmacie`
  ADD CONSTRAINT `FK_PHARMACIE_id_cmim` FOREIGN KEY (`id_cmim`) REFERENCES `dossier_cmim` (`id_cmim`);

--
-- Constraints for table `possede`
--
ALTER TABLE `possede`
  ADD CONSTRAINT `FK_possede_id_retraite` FOREIGN KEY (`id_retraite`) REFERENCES `retraite` (`id_retraite`),
  ADD CONSTRAINT `FK_possede_N_omran` FOREIGN KEY (`N_omran`) REFERENCES `personnel` (`N_omran`);

--
-- Constraints for table `prend`
--
ALTER TABLE `prend`
  ADD CONSTRAINT `FK_prend_id_assurance` FOREIGN KEY (`id_assurance`) REFERENCES `asuurance` (`id_assurance`),
  ADD CONSTRAINT `FK_prend_N_omran` FOREIGN KEY (`N_omran`) REFERENCES `personnel` (`N_omran`);

--
-- Constraints for table `prestation`
--
ALTER TABLE `prestation`
  ADD CONSTRAINT `FK_PRESTATION_id_cmim` FOREIGN KEY (`id_cmim`) REFERENCES `dossier_cmim` (`id_cmim`);

--
-- Constraints for table `prise_en_charge`
--
ALTER TABLE `prise_en_charge`
  ADD CONSTRAINT `FK_PRISE_EN_CHARGE_id_benefi` FOREIGN KEY (`id_benefi`) REFERENCES `beneficiere` (`id_benefi`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
