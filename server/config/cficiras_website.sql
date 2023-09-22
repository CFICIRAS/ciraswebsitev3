-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : ven. 22 sep. 2023 à 08:37
-- Version du serveur : 5.7.40
-- Version de PHP : 8.0.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `cficiras_website`
--
CREATE DATABASE IF NOT EXISTS `cficiras_website` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `cficiras_website`;

-- --------------------------------------------------------

--
-- Structure de la table `cfi_actenais`
--

DROP TABLE IF EXISTS `cfi_actenais`;
CREATE TABLE IF NOT EXISTS `cfi_actenais` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `inscription` int(5) NOT NULL,
  `nomfichier` varchar(50) COLLATE utf8_bin NOT NULL DEFAULT 'acte de naissance',
  `files` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Déchargement des données de la table `cfi_actenais`
--

INSERT INTO `cfi_actenais` (`Id`, `inscription`, `nomfichier`, `files`) VALUES
(1, 1, 'actes de naissance', 'class-1.jpg'),
(2, 1, 'actes de naissance', 'blog-3.jpg'),
(3, 1, 'actes de naissance', 'class-1.jpg'),
(4, 1, 'actes de naissance', 'about-1.jpg'),
(5, 1, 'actes de naissance', 'class-1.jpg'),
(6, 1, 'actes de naissance', 'class-2.jpg'),
(7, 1, 'actes de naissance', 'about-1.jpg');

-- --------------------------------------------------------

--
-- Structure de la table `cfi_candidat`
--

DROP TABLE IF EXISTS `cfi_candidat`;
CREATE TABLE IF NOT EXISTS `cfi_candidat` (
  `ins_Id` int(5) NOT NULL AUTO_INCREMENT,
  `ins_nom` varchar(255) CHARACTER SET utf8 NOT NULL,
  `ins_prenom` varchar(255) CHARACTER SET utf8 NOT NULL,
  `ins_email` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `ins_statut` varchar(255) CHARACTER SET utf8 NOT NULL,
  `ins_tel` varchar(60) CHARACTER SET utf8 NOT NULL,
  `ins_bac` varchar(60) CHARACTER SET utf8 NOT NULL,
  `ins_filiere` varchar(60) CHARACTER SET utf8 NOT NULL,
  `ins_cycle` varchar(60) CHARACTER SET utf8 NOT NULL,
  `dossier` int(5) DEFAULT '14',
  PRIMARY KEY (`ins_Id`),
  KEY `FK_dossiercandidat_` (`dossier`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Déchargement des données de la table `cfi_candidat`
--

INSERT INTO `cfi_candidat` (`ins_Id`, `ins_nom`, `ins_prenom`, `ins_email`, `ins_statut`, `ins_tel`, `ins_bac`, `ins_filiere`, `ins_cycle`, `dossier`) VALUES
(1, 'LEKOUNDA', 'Gedeon', NULL, 'Bachelier', '066578123', 'bac a', 'informatique', 'licence', 14);

-- --------------------------------------------------------

--
-- Structure de la table `cfi_contact`
--

DROP TABLE IF EXISTS `cfi_contact`;
CREATE TABLE IF NOT EXISTS `cfi_contact` (
  `con_id` int(11) NOT NULL AUTO_INCREMENT,
  `con_nom` varchar(255) NOT NULL,
  `con_prenom` varchar(255) NOT NULL,
  `con_email` varchar(255) NOT NULL,
  `con_sujet` varchar(255) NOT NULL,
  `con_description` varchar(525) NOT NULL,
  PRIMARY KEY (`con_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `cfi_dossier`
--

DROP TABLE IF EXISTS `cfi_dossier`;
CREATE TABLE IF NOT EXISTS `cfi_dossier` (
  `dos_Id` int(5) NOT NULL,
  `doss_actenais` varchar(255) CHARACTER SET utf8 NOT NULL,
  `doss_diplome` varchar(255) CHARACTER SET utf8 NOT NULL,
  `doss_photoI` varchar(255) CHARACTER SET utf8 NOT NULL,
  `doss_autorisation` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `doss_arrete` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `candidat` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Structure de la table `cfi_feedback`
--

DROP TABLE IF EXISTS `cfi_feedback`;
CREATE TABLE IF NOT EXISTS `cfi_feedback` (
  `feed_id` int(5) NOT NULL AUTO_INCREMENT,
  `feed_nom` varchar(255) CHARACTER SET utf8 NOT NULL,
  `feed_prenom` varchar(255) CHARACTER SET utf8 NOT NULL,
  `feed_sujet` varchar(255) CHARACTER SET utf8 NOT NULL,
  `feed_message` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`feed_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `cfi_feedback`
--

INSERT INTO `cfi_feedback` (`feed_id`, `feed_nom`, `feed_prenom`, `feed_sujet`, `feed_message`) VALUES
(1, 'LEKOUNDA', 'Gedeon', 'Demande', NULL),
(2, 'NGOLO', 'Mardochet', 'Demande de stage', NULL),
(3, 'gedeon', 'LEKOUNDA', 'declaration de resultat', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `cfi_resultat`
--

DROP TABLE IF EXISTS `cfi_resultat`;
CREATE TABLE IF NOT EXISTS `cfi_resultat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `etudiant_id` int(11) NOT NULL,
  `classe_id` int(11) NOT NULL,
  `semestre1` int(11) NOT NULL,
  `semestre2` int(11) NOT NULL,
  `parcours_id` int(11) NOT NULL,
  `rang` int(11) DEFAULT NULL,
  `moyenne` decimal(5,2) NOT NULL,
  `observation` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `etudiant_id` (`etudiant_id`),
  KEY `semestre1` (`semestre1`),
  KEY `semestre2` (`semestre2`),
  KEY `parcours_id` (`parcours_id`),
  KEY `classe_id` (`classe_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `cfi_resultat`
--

INSERT INTO `cfi_resultat` (`id`, `etudiant_id`, `classe_id`, `semestre1`, `semestre2`, `parcours_id`, `rang`, `moyenne`, `observation`) VALUES
(1, 1, 1, 1, 1, 1, 2, '12.50', 'Valider');

-- --------------------------------------------------------

--
-- Structure de la table `cfi_statutfinancier`
--

DROP TABLE IF EXISTS `cfi_statutfinancier`;
CREATE TABLE IF NOT EXISTS `cfi_statutfinancier` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `etudiant_id` int(11) DEFAULT NULL,
  `mois` date DEFAULT NULL,
  `est_paye` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `etudiant_id` (`etudiant_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `cfi_statutfinancier`
--

INSERT INTO `cfi_statutfinancier` (`id`, `etudiant_id`, `mois`, `est_paye`) VALUES
(1, 1, '2023-07-20', 1);

-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `empl_allprofmodules`
-- (Voir ci-dessous la vue réelle)
--
DROP VIEW IF EXISTS `empl_allprofmodules`;
CREATE TABLE IF NOT EXISTS `empl_allprofmodules` (
`Heure` varchar(20)
,`Jour` varchar(255)
,`Enseignant` varchar(20)
,`Intitule` varchar(60)
,`Anneacad` varchar(20)
);

-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `empl_dutam1`
-- (Voir ci-dessous la vue réelle)
--
DROP VIEW IF EXISTS `empl_dutam1`;
CREATE TABLE IF NOT EXISTS `empl_dutam1` (
`Heure` varchar(20)
,`Jour` varchar(255)
,`Enseignant` varchar(20)
,`Intitule` varchar(60)
,`nomClasse` varchar(20)
);

-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `empl_dutam2`
-- (Voir ci-dessous la vue réelle)
--
DROP VIEW IF EXISTS `empl_dutam2`;
CREATE TABLE IF NOT EXISTS `empl_dutam2` (
`Heure` varchar(20)
,`Jour` varchar(255)
,`Enseignant` varchar(20)
,`Intitule` varchar(60)
,`nomClasse` varchar(20)
);

-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `empl_dutig1`
-- (Voir ci-dessous la vue réelle)
--
DROP VIEW IF EXISTS `empl_dutig1`;
CREATE TABLE IF NOT EXISTS `empl_dutig1` (
`Heure` varchar(20)
,`Jour` varchar(255)
,`Enseignant` varchar(20)
,`Intitule` varchar(60)
,`nomClasse` varchar(20)
);

-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `empl_dutig2`
-- (Voir ci-dessous la vue réelle)
--
DROP VIEW IF EXISTS `empl_dutig2`;
CREATE TABLE IF NOT EXISTS `empl_dutig2` (
`Heure` varchar(20)
,`Jour` varchar(255)
,`Enseignant` varchar(20)
,`Intitule` varchar(60)
,`nomClasse` varchar(20)
);

-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `empl_licinfoa`
-- (Voir ci-dessous la vue réelle)
--
DROP VIEW IF EXISTS `empl_licinfoa`;
CREATE TABLE IF NOT EXISTS `empl_licinfoa` (
`Heure` varchar(20)
,`Jour` varchar(255)
,`Enseignant` varchar(20)
,`Intitule` varchar(60)
,`nomClasse` varchar(20)
);

-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `etudiants_par_classe`
-- (Voir ci-dessous la vue réelle)
--
DROP VIEW IF EXISTS `etudiants_par_classe`;
CREATE TABLE IF NOT EXISTS `etudiants_par_classe` (
`Matricule` varchar(255)
,`Nom` varchar(255)
,`Prenom` varchar(255)
,`Tel` varchar(20)
,`Classe` varchar(60)
,`clas_abrev` varchar(20)
);

-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `etudiants_par_classe_cplet`
-- (Voir ci-dessous la vue réelle)
--
DROP VIEW IF EXISTS `etudiants_par_classe_cplet`;
CREATE TABLE IF NOT EXISTS `etudiants_par_classe_cplet` (
`matricule` varchar(255)
,`Nom` varchar(255)
,`Prenom` varchar(255)
,`Tel` varchar(20)
,`Classe` varchar(60)
,`clas_abrev` varchar(20)
,`ispasswordChange` tinyint(4)
);

-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `modules_dutig1`
-- (Voir ci-dessous la vue réelle)
--
DROP VIEW IF EXISTS `modules_dutig1`;
CREATE TABLE IF NOT EXISTS `modules_dutig1` (
`mod_libelle` varchar(60)
,`mod_coef` varchar(20)
,`mod_nbreh` varchar(10)
,`clas_libelle` varchar(60)
,`clas_abrev` varchar(20)
);

-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `modules_dutig2`
-- (Voir ci-dessous la vue réelle)
--
DROP VIEW IF EXISTS `modules_dutig2`;
CREATE TABLE IF NOT EXISTS `modules_dutig2` (
`mod_libelle` varchar(60)
,`mod_coef` varchar(20)
,`mod_nbreh` varchar(10)
,`clas_libelle` varchar(60)
,`clas_abrev` varchar(20)
);

-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `modules_lap1`
-- (Voir ci-dessous la vue réelle)
--
DROP VIEW IF EXISTS `modules_lap1`;
CREATE TABLE IF NOT EXISTS `modules_lap1` (
`mod_libelle` varchar(60)
,`mod_coef` varchar(20)
,`mod_nbreh` varchar(10)
,`clas_libelle` varchar(60)
,`clas_abrev` varchar(20)
);

-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `modules_lap2`
-- (Voir ci-dessous la vue réelle)
--
DROP VIEW IF EXISTS `modules_lap2`;
CREATE TABLE IF NOT EXISTS `modules_lap2` (
`mod_libelle` varchar(60)
,`mod_coef` varchar(20)
,`mod_nbreh` varchar(10)
,`clas_libelle` varchar(60)
,`clas_abrev` varchar(20)
);

-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `modules_lap3`
-- (Voir ci-dessous la vue réelle)
--
DROP VIEW IF EXISTS `modules_lap3`;
CREATE TABLE IF NOT EXISTS `modules_lap3` (
`mod_libelle` varchar(60)
,`mod_coef` varchar(20)
,`mod_nbreh` varchar(10)
,`clas_libelle` varchar(60)
,`clas_abrev` varchar(20)
);

-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `modules_licinfoa`
-- (Voir ci-dessous la vue réelle)
--
DROP VIEW IF EXISTS `modules_licinfoa`;
CREATE TABLE IF NOT EXISTS `modules_licinfoa` (
`intitule` varchar(60)
,`coefficient` varchar(20)
,`nombre_heure` varchar(10)
,`date_debut` datetime
,`classe` varchar(60)
,`abrev` varchar(20)
);

-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `modules_licinfob`
-- (Voir ci-dessous la vue réelle)
--
DROP VIEW IF EXISTS `modules_licinfob`;
CREATE TABLE IF NOT EXISTS `modules_licinfob` (
`intitule` varchar(60)
,`coefficient` varchar(20)
,`nombre_heure` varchar(10)
,`date_debut` datetime
,`classe` varchar(60)
,`abrev` varchar(20)
);

-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `modules_licinfoc`
-- (Voir ci-dessous la vue réelle)
--
DROP VIEW IF EXISTS `modules_licinfoc`;
CREATE TABLE IF NOT EXISTS `modules_licinfoc` (
`intitule` varchar(60)
,`coefficient` varchar(20)
,`nombre_heure` varchar(10)
,`date_debut` datetime
,`classe` varchar(60)
,`abrev` varchar(20)
);

-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `modules_licinfo_a`
-- (Voir ci-dessous la vue réelle)
--
DROP VIEW IF EXISTS `modules_licinfo_a`;
CREATE TABLE IF NOT EXISTS `modules_licinfo_a` (
`mod_libelle` varchar(60)
,`mod_coef` varchar(20)
,`mod_nbreh` varchar(10)
,`clas_libelle` varchar(60)
,`clas_abrev` varchar(20)
);

-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `modules_licinfo_b`
-- (Voir ci-dessous la vue réelle)
--
DROP VIEW IF EXISTS `modules_licinfo_b`;
CREATE TABLE IF NOT EXISTS `modules_licinfo_b` (
`mod_libelle` varchar(60)
,`mod_coef` varchar(20)
,`mod_nbreh` varchar(10)
,`clas_libelle` varchar(60)
,`clas_abrev` varchar(20)
);

-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `modules_licinfo_c`
-- (Voir ci-dessous la vue réelle)
--
DROP VIEW IF EXISTS `modules_licinfo_c`;
CREATE TABLE IF NOT EXISTS `modules_licinfo_c` (
`mod_libelle` varchar(60)
,`mod_coef` varchar(20)
,`mod_nbreh` varchar(10)
,`clas_libelle` varchar(60)
,`clas_abrev` varchar(20)
);

-- --------------------------------------------------------

--
-- Structure de la table `modules_par_classe`
--

DROP TABLE IF EXISTS `modules_par_classe`;
CREATE TABLE IF NOT EXISTS `modules_par_classe` (
  `mod_libelle` varchar(60) DEFAULT NULL,
  `mod_coef` varchar(20) DEFAULT NULL,
  `mod_nbreh` varchar(10) DEFAULT NULL,
  `mod_datedebut` datetime DEFAULT NULL,
  `clas_libelle` varchar(60) DEFAULT NULL,
  `clas_abrev` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `portal_anneacad`
--

DROP TABLE IF EXISTS `portal_anneacad`;
CREATE TABLE IF NOT EXISTS `portal_anneacad` (
  `ac_id` int(5) NOT NULL AUTO_INCREMENT,
  `ac_libelle` varchar(20) CHARACTER SET utf8 NOT NULL,
  `ac_parcours` varchar(20) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`ac_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Déchargement des données de la table `portal_anneacad`
--

INSERT INTO `portal_anneacad` (`ac_id`, `ac_libelle`, `ac_parcours`) VALUES
(1, '1er Année', '2020-2021'),
(2, '2e Annee', '2021-2022'),
(3, '3e Année', '2022-2023'),
(4, '1er Année', '2022-2023'),
(5, '2e Année', '2023-2024'),
(6, '3e Année', '2024-2025');

-- --------------------------------------------------------

--
-- Structure de la table `portal_classe`
--

DROP TABLE IF EXISTS `portal_classe`;
CREATE TABLE IF NOT EXISTS `portal_classe` (
  `clas_Id` int(5) NOT NULL AUTO_INCREMENT,
  `clas_libelle` varchar(60) CHARACTER SET utf8 NOT NULL,
  `clas_abrev` varchar(20) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`clas_Id`),
  UNIQUE KEY `clas_libelle` (`clas_libelle`),
  UNIQUE KEY `clas_abrev` (`clas_abrev`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Déchargement des données de la table `portal_classe`
--

INSERT INTO `portal_classe` (`clas_Id`, `clas_libelle`, `clas_abrev`) VALUES
(1, 'LICENCE INFORMATIQUE A', 'LIC INFO A'),
(2, 'LICENCE INFORMATIQUE B', 'LIC INFO B'),
(3, 'LICENCE INFORMATIQUE C', 'LIC INFO C'),
(4, 'LICENCE ADMINISTRATIF PUBLIQUE A', 'LAP A'),
(5, 'LICENCE ADMINISTRATIF PUBLIQUE B', 'LAP B'),
(6, 'LICENCE ADMINISTRATIF PUBLIQUE C', 'LAP C');

-- --------------------------------------------------------

--
-- Structure de la table `portal_compte`
--

DROP TABLE IF EXISTS `portal_compte`;
CREATE TABLE IF NOT EXISTS `portal_compte` (
  `compt_Id` int(5) NOT NULL AUTO_INCREMENT,
  `compt_matricule` varchar(60) COLLATE utf8_bin NOT NULL,
  `compt_password` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `firstLogin` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`compt_Id`),
  KEY `FK_etudiantCompte_` (`compt_matricule`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Déchargement des données de la table `portal_compte`
--

INSERT INTO `portal_compte` (`compt_Id`, `compt_matricule`, `compt_password`, `firstLogin`) VALUES
(1, '20231145', '$2b$10$WbnFPbBhJ7Lo04/cl2f6cOE/zpLXJO6Tvb4BTux5e.k0cKftMbe8q', 0),
(2, '20231146', 'password123', 1),
(3, '20231148', '$2b$10$Fgdo/U.onMBmRZxRYCaQh.FATIzoGToNud6QtWIOlim9rM78oCuRC', 0),
(4, '20231170', 'password123', 1),
(5, '20231172', 'password123', 1),
(6, '20231174', '$2b$10$l4AvkxdoYHq1//.z1JnKZO9rmvtwgKiRfnQMbO1qdsCYmOn9BQX/m', 0),
(7, '20231180', '$2b$10$GQm6mBrrDyP1.cukYq5lJOxXPpvlkPWmtrn4rXB7AdgljskHhMgmi', 0),
(9, '20231199', '$2b$10$0AVtgMpkh8cK.Rug4jDiEu1eUrck678zQGjO0aMjsLtiRfsEpxlI6', 1);

-- --------------------------------------------------------

--
-- Structure de la table `portal_control_s1`
--

DROP TABLE IF EXISTS `portal_control_s1`;
CREATE TABLE IF NOT EXISTS `portal_control_s1` (
  `con_id` int(5) NOT NULL AUTO_INCREMENT,
  `con_note1` varchar(20) CHARACTER SET utf8 NOT NULL,
  `con_note2` varchar(20) CHARACTER SET utf8 NOT NULL,
  `et_id` varchar(20) COLLATE utf8_bin NOT NULL,
  `modules` varchar(10) COLLATE utf8_bin NOT NULL,
  `anneacad` date NOT NULL,
  PRIMARY KEY (`con_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Déchargement des données de la table `portal_control_s1`
--

INSERT INTO `portal_control_s1` (`con_id`, `con_note1`, `con_note2`, `et_id`, `modules`, `anneacad`) VALUES
(1, '10', '10', '1', '4', '2023-07-20'),
(2, '12', '12', '1', '3', '2023-07-20'),
(3, '10', '10', '2', '5', '2023-07-20'),
(4, '12', '14', '6', '1', '2023-07-20');

-- --------------------------------------------------------

--
-- Structure de la table `portal_control_s2`
--

DROP TABLE IF EXISTS `portal_control_s2`;
CREATE TABLE IF NOT EXISTS `portal_control_s2` (
  `con_id` int(5) NOT NULL AUTO_INCREMENT,
  `con_note1` varchar(20) CHARACTER SET utf8 NOT NULL,
  `con_note2` varchar(20) CHARACTER SET utf8 NOT NULL,
  `et_id` varchar(20) COLLATE utf8_bin NOT NULL,
  `modules` varchar(10) COLLATE utf8_bin NOT NULL,
  `anneacad` date NOT NULL,
  PRIMARY KEY (`con_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Déchargement des données de la table `portal_control_s2`
--

INSERT INTO `portal_control_s2` (`con_id`, `con_note1`, `con_note2`, `et_id`, `modules`, `anneacad`) VALUES
(1, '10', '10', '2', '5', '2023-07-20'),
(2, '12', '14', '6', '1', '2023-07-20'),
(3, '10', '10', '1', '4', '2023-07-20'),
(4, '10', '12', '6', '1', '2023-07-20'),
(5, '10', '10', '1', '4', '2023-07-20'),
(6, '', '12', '6', '1', '2023-07-20');

-- --------------------------------------------------------

--
-- Structure de la table `portal_dash_empdt`
--

DROP TABLE IF EXISTS `portal_dash_empdt`;
CREATE TABLE IF NOT EXISTS `portal_dash_empdt` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `intitule` varchar(30) NOT NULL,
  `date` varchar(30) NOT NULL,
  `jour` varchar(30) NOT NULL,
  `horaire` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `portal_dash_session`
--

DROP TABLE IF EXISTS `portal_dash_session`;
CREATE TABLE IF NOT EXISTS `portal_dash_session` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `intitule` varchar(60) NOT NULL,
  `date` date NOT NULL,
  `semestre` varchar(20) NOT NULL,
  `annee` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `portal_dash_session`
--

INSERT INTO `portal_dash_session` (`id`, `intitule`, `date`, `semestre`, `annee`) VALUES
(1, 'Session Ordinaire', '2023-03-14', 'impaire(1,3,5)', '2022-2023'),
(2, 'Session de rappelle', '2023-05-16', 'impaire(1,3,5)', '2022-2023'),
(3, 'Session ordinaire', '2023-08-07', 'paire(2,4,6)', '2022-2023'),
(4, 'Session de rappelle', '2023-09-11', 'paire(2,4,6)', '2022-2023');

-- --------------------------------------------------------

--
-- Structure de la table `portal_declaration`
--

DROP TABLE IF EXISTS `portal_declaration`;
CREATE TABLE IF NOT EXISTS `portal_declaration` (
  `dec_id` int(5) NOT NULL AUTO_INCREMENT,
  `dec_description` varchar(255) CHARACTER SET utf8 NOT NULL,
  `dec_nature` varchar(20) CHARACTER SET utf8 NOT NULL,
  `anneacad` date NOT NULL,
  PRIMARY KEY (`dec_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Structure de la table `portal_document`
--

DROP TABLE IF EXISTS `portal_document`;
CREATE TABLE IF NOT EXISTS `portal_document` (
  `doc_id` int(5) NOT NULL AUTO_INCREMENT,
  `doc_file` varchar(20) CHARACTER SET utf8 NOT NULL,
  `doc_path` varchar(20) CHARACTER SET utf8 NOT NULL,
  `modules` varchar(10) COLLATE utf8_bin NOT NULL,
  `anneacad` date NOT NULL,
  PRIMARY KEY (`doc_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Structure de la table `portal_emploitemps`
--

DROP TABLE IF EXISTS `portal_emploitemps`;
CREATE TABLE IF NOT EXISTS `portal_emploitemps` (
  `emp_id` int(5) NOT NULL AUTO_INCREMENT,
  `emp_jour` varchar(255) COLLATE utf8_bin NOT NULL,
  `emp_heure` varchar(20) CHARACTER SET utf8 NOT NULL,
  `emp_prof` varchar(20) CHARACTER SET utf8 NOT NULL,
  `modules` varchar(10) COLLATE utf8_bin NOT NULL,
  `classe` int(11) NOT NULL,
  `anneacad` date NOT NULL,
  PRIMARY KEY (`emp_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Déchargement des données de la table `portal_emploitemps`
--

INSERT INTO `portal_emploitemps` (`emp_id`, `emp_jour`, `emp_heure`, `emp_prof`, `modules`, `classe`, `anneacad`) VALUES
(1, 'Lundi', '08h-10h', 'Jean François', '1', 1, '2023-07-28'),
(2, 'Lundi', '10h-12h', 'Jean MBENGA', '2', 1, '2023-07-29'),
(3, 'Lundi', '08h-10h', 'Jean François', '1', 1, '2023-07-28'),
(4, 'Lundi', '10h-12h', 'Jean MBEMBA', '2', 1, '2023-07-29'),
(5, 'Lundi', '13h-15h', 'Jean MBANGA', '4', 1, '2023-07-29'),
(6, 'Lundi', '15h-17h', 'Jean MBENGA', '3', 1, '2023-07-29');

-- --------------------------------------------------------

--
-- Structure de la table `portal_enseignant`
--

DROP TABLE IF EXISTS `portal_enseignant`;
CREATE TABLE IF NOT EXISTS `portal_enseignant` (
  `ens_Id` int(5) NOT NULL AUTO_INCREMENT,
  `ens_nom` varchar(255) CHARACTER SET utf8 NOT NULL,
  `ens_prenom` varchar(255) CHARACTER SET utf8 NOT NULL,
  `module` int(5) NOT NULL,
  PRIMARY KEY (`ens_Id`),
  KEY `FK_EnseignerUnModule` (`module`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Structure de la table `portal_etudiant`
--

DROP TABLE IF EXISTS `portal_etudiant`;
CREATE TABLE IF NOT EXISTS `portal_etudiant` (
  `et_id` int(5) NOT NULL AUTO_INCREMENT,
  `et_matricule` varchar(255) CHARACTER SET utf8 NOT NULL,
  `et_nom` varchar(255) CHARACTER SET utf8 NOT NULL,
  `et_prenom` varchar(255) CHARACTER SET utf8 NOT NULL,
  `et_datenais` varchar(255) CHARACTER SET utf8 NOT NULL,
  `et_tel` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `classe` int(5) NOT NULL,
  PRIMARY KEY (`et_id`),
  KEY `FK_etudiantDansUneClasse_` (`classe`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Déchargement des données de la table `portal_etudiant`
--

INSERT INTO `portal_etudiant` (`et_id`, `et_matricule`, `et_nom`, `et_prenom`, `et_datenais`, `et_tel`, `classe`) VALUES
(1, '20231145', 'LEKOUNDA', 'GEDEON', '29-01-2023', '066034357', 1),
(2, '20231146', 'MBENZA', 'STEEV SAVY', '29-02-2023', '066044578', 1),
(3, '20231148', 'NGOLO', 'Mardochet', '29-02-2023', '0660411452', 1),
(4, '20231145', 'LEKOUNDA', 'GEDEON', '29-01-2023', '066034357', 1),
(5, '20231146', 'MBENZA', 'STEEV SAVY', '29-02-2023', '066044578', 1),
(6, '20231148', 'NGOLO', 'Mardochet', '29-02-2023', '0660411452', 1),
(7, '20231145', 'OKO', 'Alain', '29-01-2023', '066034357', 2),
(8, '20231146', 'MAKOLA', 'SAVY', '29-02-2023', '066044578', 2),
(9, '20231148', 'LECK', 'Teddy Jim', '29-02-2023', '0660411452', 2),
(10, '20231170', 'ITOUA', 'Claver', '23-03-2023', '066002514', 3),
(11, '20231172', 'EKONDZI', 'Alain', '03-03-2023', '066002514', 2),
(12, '20231174', 'OYERE', 'Morel G', '03-03-2023', '066002514', 5),
(13, '20231180', 'MATONDO', 'Sylvie', '23-03-2023', '066002514', 4),
(14, '20231199', 'NZOKO ELLOMI', 'Yacoub', '24-05-2023', '066034357', 5);

-- --------------------------------------------------------

--
-- Structure de la table `portal_examens_s1`
--

DROP TABLE IF EXISTS `portal_examens_s1`;
CREATE TABLE IF NOT EXISTS `portal_examens_s1` (
  `exa_id` int(5) NOT NULL AUTO_INCREMENT,
  `exa_note1` varchar(20) CHARACTER SET utf8 NOT NULL,
  `exa_note2` varchar(20) CHARACTER SET utf8 NOT NULL,
  `et_id` varchar(20) COLLATE utf8_bin NOT NULL,
  `modules` varchar(10) COLLATE utf8_bin NOT NULL,
  `anneacad` date NOT NULL,
  PRIMARY KEY (`exa_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Déchargement des données de la table `portal_examens_s1`
--

INSERT INTO `portal_examens_s1` (`exa_id`, `exa_note1`, `exa_note2`, `et_id`, `modules`, `anneacad`) VALUES
(1, '10', '10', '1', '4', '2023-07-20'),
(2, '12', '11', '1', '3', '2023-07-20');

-- --------------------------------------------------------

--
-- Structure de la table `portal_examens_s2`
--

DROP TABLE IF EXISTS `portal_examens_s2`;
CREATE TABLE IF NOT EXISTS `portal_examens_s2` (
  `exa_id` int(5) NOT NULL AUTO_INCREMENT,
  `exa_note1` varchar(20) CHARACTER SET utf8 NOT NULL,
  `exa_note2` varchar(20) CHARACTER SET utf8 NOT NULL,
  `et_id` varchar(20) COLLATE utf8_bin NOT NULL,
  `modules` varchar(10) COLLATE utf8_bin NOT NULL,
  `anneacad` date NOT NULL,
  PRIMARY KEY (`exa_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Déchargement des données de la table `portal_examens_s2`
--

INSERT INTO `portal_examens_s2` (`exa_id`, `exa_note1`, `exa_note2`, `et_id`, `modules`, `anneacad`) VALUES
(1, '10', '10', '1', '4', '2023-07-20'),
(2, '12', '11', '1', '3', '2023-07-20'),
(3, '10', '10', '1', '1', '2023-07-25'),
(4, '12', '11', '1', '3', '2023-07-20'),
(5, '10', '10', '1', '1', '2023-07-25'),
(6, '12', '11', '1', '4', '2023-07-20');

-- --------------------------------------------------------

--
-- Structure de la table `portal_modules`
--

DROP TABLE IF EXISTS `portal_modules`;
CREATE TABLE IF NOT EXISTS `portal_modules` (
  `mod_id` int(5) NOT NULL AUTO_INCREMENT,
  `mod_libelle` varchar(60) CHARACTER SET utf8 NOT NULL,
  `mod_coef` varchar(20) CHARACTER SET utf8 NOT NULL,
  `mod_nbreh` varchar(10) COLLATE utf8_bin NOT NULL,
  `mod_datedebut` datetime NOT NULL,
  `classe_id` int(11) NOT NULL,
  PRIMARY KEY (`mod_id`),
  KEY `FK_DISPENSER_` (`classe_id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Déchargement des données de la table `portal_modules`
--

INSERT INTO `portal_modules` (`mod_id`, `mod_libelle`, `mod_coef`, `mod_nbreh`, `mod_datedebut`, `classe_id`) VALUES
(1, 'ALGORITHME ET PROGRAMMATION', '5', '80', '2023-02-02 00:00:00', 2),
(2, 'BASE DE DONNEE', '5', '70', '2023-02-02 00:00:00', 2),
(3, 'CIRCUIT LOGIQUE', '4', '60', '2023-02-02 00:00:00', 1),
(4, 'CISCO', '5', '80', '2023-02-02 00:00:00', 1),
(5, 'MATHS INFORMATIQUE', '3', '40', '2023-02-02 00:00:00', 1),
(6, 'GESTION DE PROJETS', '3', '80', '2023-02-02 00:00:00', 2),
(7, 'ALGORITHME ET PROGRAMMATION', '5', '80', '2023-02-02 00:00:00', 1),
(8, 'BASE DE DONNEE', '5', '70', '2023-02-02 00:00:00', 3),
(9, 'CIRCUIT LOGIQUE', '4', '60', '2023-02-02 00:00:00', 2),
(10, 'CISCO', '5', '80', '2023-02-02 00:00:00', 3),
(11, 'MATHS INFORMATIQUE', '3', '40', '2023-02-02 00:00:00', 3),
(12, 'GESTION DE PROJETS', '3', '80', '2023-02-02 00:00:00', 3);

-- --------------------------------------------------------

--
-- Structure de la table `portal_notification`
--

DROP TABLE IF EXISTS `portal_notification`;
CREATE TABLE IF NOT EXISTS `portal_notification` (
  `notif_Id` int(5) NOT NULL AUTO_INCREMENT,
  `notif_description` varchar(255) NOT NULL,
  `notif_date` date NOT NULL,
  `notif_cat` varchar(10) NOT NULL,
  PRIMARY KEY (`notif_Id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `portal_notification`
--

INSERT INTO `portal_notification` (`notif_Id`, `notif_description`, `notif_date`, `notif_cat`) VALUES
(1, 'Espace étudiant disponible dès maintenant', '2023-07-24', 'Inform'),
(2, 'Mise a jour emploi du temps', '2023-07-24', 'inform'),
(3, 'Bonne rentrée des classes\r\n', '2023-07-17', 'Inform'),
(4, 'Bonne chance pour le semestre 2', '2023-07-24', 'inform'),
(5, 'Les examens c\'est pour bientot', '2023-07-25', 'inform'),
(6, 'Bientot la fin de l\'année, preparez-vous déjà', '2023-07-24', 'event');

-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `viewallemploitemps`
-- (Voir ci-dessous la vue réelle)
--
DROP VIEW IF EXISTS `viewallemploitemps`;
CREATE TABLE IF NOT EXISTS `viewallemploitemps` (
`jour` varchar(255)
,`heure` varchar(20)
,`prof` varchar(20)
,`modules` varchar(60)
,`classe` varchar(20)
);

-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `viewallmodule`
-- (Voir ci-dessous la vue réelle)
--
DROP VIEW IF EXISTS `viewallmodule`;
CREATE TABLE IF NOT EXISTS `viewallmodule` (
`ID` int(5)
,`intitule` varchar(60)
,`coefficient` varchar(20)
,`nombre_heure` varchar(10)
,`classe` varchar(60)
,`abrev` varchar(20)
);

-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `viewnotecontroleetudiant`
-- (Voir ci-dessous la vue réelle)
--
DROP VIEW IF EXISTS `viewnotecontroleetudiant`;
CREATE TABLE IF NOT EXISTS `viewnotecontroleetudiant` (
`matricule` varchar(255)
,`nom` varchar(255)
,`prenom` varchar(255)
,`intitule` varchar(60)
,`coef` varchar(20)
,`note1` varchar(20)
,`note2` varchar(20)
);

-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `viewnotecontroles2etudiant`
-- (Voir ci-dessous la vue réelle)
--
DROP VIEW IF EXISTS `viewnotecontroles2etudiant`;
CREATE TABLE IF NOT EXISTS `viewnotecontroles2etudiant` (
`matricule` varchar(255)
,`nom` varchar(255)
,`prenom` varchar(255)
,`intitule` varchar(60)
,`coef` varchar(20)
,`note1` varchar(20)
,`note2` varchar(20)
);

-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `viewnoteexamens1etudiant`
-- (Voir ci-dessous la vue réelle)
--
DROP VIEW IF EXISTS `viewnoteexamens1etudiant`;
CREATE TABLE IF NOT EXISTS `viewnoteexamens1etudiant` (
`matricule` varchar(255)
,`nom` varchar(255)
,`prenom` varchar(255)
,`intitule` varchar(60)
,`coef` varchar(20)
,`note1` varchar(20)
,`note2` varchar(20)
);

-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `viewnoteexamens2etudiant`
-- (Voir ci-dessous la vue réelle)
--
DROP VIEW IF EXISTS `viewnoteexamens2etudiant`;
CREATE TABLE IF NOT EXISTS `viewnoteexamens2etudiant` (
`matricule` varchar(255)
,`nom` varchar(255)
,`prenom` varchar(255)
,`intitule` varchar(60)
,`coef` varchar(20)
,`note1` varchar(20)
,`note2` varchar(20)
);

-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `viewresultatalletudiant`
-- (Voir ci-dessous la vue réelle)
--
DROP VIEW IF EXISTS `viewresultatalletudiant`;
CREATE TABLE IF NOT EXISTS `viewresultatalletudiant` (
`matricule` varchar(255)
,`nom` varchar(255)
,`prenom` varchar(255)
,`classe` varchar(20)
,`semestre1` int(11)
,`semestre2` int(11)
,`rang` int(11)
,`moyenne` decimal(5,2)
);

-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `viewsession`
-- (Voir ci-dessous la vue réelle)
--
DROP VIEW IF EXISTS `viewsession`;
CREATE TABLE IF NOT EXISTS `viewsession` (
`name_session` varchar(60)
,`session_date` date
,`semestre` varchar(20)
);

-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `viewstatutfinancieretudiant`
-- (Voir ci-dessous la vue réelle)
--
DROP VIEW IF EXISTS `viewstatutfinancieretudiant`;
CREATE TABLE IF NOT EXISTS `viewstatutfinancieretudiant` (
`matricule` varchar(255)
,`nom` varchar(255)
,`et_prenom` varchar(255)
,`classe` varchar(20)
,`mois` date
,`est_paye` tinyint(1)
);

-- --------------------------------------------------------

--
-- Structure de la vue `empl_allprofmodules`
--
DROP TABLE IF EXISTS `empl_allprofmodules`;

DROP VIEW IF EXISTS `empl_allprofmodules`;
CREATE VIEW `empl_allprofmodules`  AS SELECT `temps`.`emp_heure` AS `Heure`, `temps`.`emp_jour` AS `Jour`, `temps`.`emp_prof` AS `Enseignant`, `modules`.`mod_libelle` AS `Intitule`, `anneacad`.`ac_parcours` AS `Anneacad` FROM ((`portal_emploitemps` `temps` join `portal_modules` `modules`) join `portal_anneacad` `anneacad`) WHERE ((`temps`.`modules` = `modules`.`mod_id`) AND (`anneacad`.`ac_id` = `temps`.`anneacad`))  ;

-- --------------------------------------------------------

--
-- Structure de la vue `empl_dutam1`
--
DROP TABLE IF EXISTS `empl_dutam1`;

DROP VIEW IF EXISTS `empl_dutam1`;
CREATE VIEW `empl_dutam1`  AS SELECT `temps`.`emp_heure` AS `Heure`, `temps`.`emp_jour` AS `Jour`, `temps`.`emp_prof` AS `Enseignant`, `modules`.`mod_libelle` AS `Intitule`, `classe`.`clas_abrev` AS `nomClasse` FROM ((`portal_emploitemps` `temps` join `portal_modules` `modules`) join `portal_classe` `classe`) WHERE ((`temps`.`modules` = `modules`.`mod_id`) AND (`classe`.`clas_Id` = `modules`.`mod_id`) AND (`classe`.`clas_abrev` = 'DUT AM 1'))  ;

-- --------------------------------------------------------

--
-- Structure de la vue `empl_dutam2`
--
DROP TABLE IF EXISTS `empl_dutam2`;

DROP VIEW IF EXISTS `empl_dutam2`;
CREATE VIEW `empl_dutam2`  AS SELECT `temps`.`emp_heure` AS `Heure`, `temps`.`emp_jour` AS `Jour`, `temps`.`emp_prof` AS `Enseignant`, `modules`.`mod_libelle` AS `Intitule`, `classe`.`clas_abrev` AS `nomClasse` FROM ((`portal_emploitemps` `temps` join `portal_modules` `modules`) join `portal_classe` `classe`) WHERE ((`temps`.`modules` = `modules`.`mod_id`) AND (`classe`.`clas_Id` = `modules`.`mod_id`) AND (`classe`.`clas_abrev` = 'DUT AM 2'))  ;

-- --------------------------------------------------------

--
-- Structure de la vue `empl_dutig1`
--
DROP TABLE IF EXISTS `empl_dutig1`;

DROP VIEW IF EXISTS `empl_dutig1`;
CREATE VIEW `empl_dutig1`  AS SELECT `temps`.`emp_heure` AS `Heure`, `temps`.`emp_jour` AS `Jour`, `temps`.`emp_prof` AS `Enseignant`, `modules`.`mod_libelle` AS `Intitule`, `classe`.`clas_abrev` AS `nomClasse` FROM ((`portal_emploitemps` `temps` join `portal_modules` `modules`) join `portal_classe` `classe`) WHERE ((`temps`.`modules` = `modules`.`mod_id`) AND (`classe`.`clas_Id` = `modules`.`mod_id`) AND (`classe`.`clas_abrev` = 'DUT IG 1'))  ;

-- --------------------------------------------------------

--
-- Structure de la vue `empl_dutig2`
--
DROP TABLE IF EXISTS `empl_dutig2`;

DROP VIEW IF EXISTS `empl_dutig2`;
CREATE VIEW `empl_dutig2`  AS SELECT `temps`.`emp_heure` AS `Heure`, `temps`.`emp_jour` AS `Jour`, `temps`.`emp_prof` AS `Enseignant`, `modules`.`mod_libelle` AS `Intitule`, `classe`.`clas_abrev` AS `nomClasse` FROM ((`portal_emploitemps` `temps` join `portal_modules` `modules`) join `portal_classe` `classe`) WHERE ((`temps`.`modules` = `modules`.`mod_id`) AND (`classe`.`clas_Id` = `modules`.`mod_id`) AND (`classe`.`clas_abrev` = 'DUT IG 2'))  ;

-- --------------------------------------------------------

--
-- Structure de la vue `empl_licinfoa`
--
DROP TABLE IF EXISTS `empl_licinfoa`;

DROP VIEW IF EXISTS `empl_licinfoa`;
CREATE VIEW `empl_licinfoa`  AS SELECT `temps`.`emp_heure` AS `Heure`, `temps`.`emp_jour` AS `Jour`, `temps`.`emp_prof` AS `Enseignant`, `modules`.`mod_libelle` AS `Intitule`, `classe`.`clas_abrev` AS `nomClasse` FROM ((`portal_emploitemps` `temps` join `portal_modules` `modules`) join `portal_classe` `classe`) WHERE ((`temps`.`modules` = `modules`.`mod_id`) AND (`classe`.`clas_Id` = `modules`.`mod_id`) AND (`classe`.`clas_abrev` = 'LIC INFO A'))  ;

-- --------------------------------------------------------

--
-- Structure de la vue `etudiants_par_classe`
--
DROP TABLE IF EXISTS `etudiants_par_classe`;

DROP VIEW IF EXISTS `etudiants_par_classe`;
CREATE VIEW `etudiants_par_classe`  AS SELECT `etudiant`.`et_matricule` AS `Matricule`, `etudiant`.`et_nom` AS `Nom`, `etudiant`.`et_prenom` AS `Prenom`, `etudiant`.`et_tel` AS `Tel`, `classe`.`clas_libelle` AS `Classe`, `classe`.`clas_abrev` AS `clas_abrev` FROM (`portal_etudiant` `etudiant` join `portal_classe` `classe`) WHERE (`etudiant`.`classe` = `classe`.`clas_Id`) ORDER BY `classe`.`clas_abrev` ASC, `etudiant`.`et_nom` ASC  ;

-- --------------------------------------------------------

--
-- Structure de la vue `etudiants_par_classe_cplet`
--
DROP TABLE IF EXISTS `etudiants_par_classe_cplet`;

DROP VIEW IF EXISTS `etudiants_par_classe_cplet`;
CREATE VIEW `etudiants_par_classe_cplet`  AS SELECT `etudiant`.`et_matricule` AS `matricule`, `etudiant`.`et_nom` AS `Nom`, `etudiant`.`et_prenom` AS `Prenom`, `etudiant`.`et_tel` AS `Tel`, `classe`.`clas_libelle` AS `Classe`, `classe`.`clas_abrev` AS `clas_abrev`, `compte`.`firstLogin` AS `ispasswordChange` FROM ((`portal_etudiant` `etudiant` join `portal_compte` `compte`) join `portal_classe` `classe`) WHERE ((`etudiant`.`classe` = `classe`.`clas_Id`) AND (`etudiant`.`et_matricule` = `compte`.`compt_matricule`))  ;

-- --------------------------------------------------------

--
-- Structure de la vue `modules_dutig1`
--
DROP TABLE IF EXISTS `modules_dutig1`;

DROP VIEW IF EXISTS `modules_dutig1`;
CREATE VIEW `modules_dutig1`  AS SELECT `portal_modules`.`mod_libelle` AS `mod_libelle`, `portal_modules`.`mod_coef` AS `mod_coef`, `portal_modules`.`mod_nbreh` AS `mod_nbreh`, `portal_classe`.`clas_libelle` AS `clas_libelle`, `portal_classe`.`clas_abrev` AS `clas_abrev` FROM (`portal_modules` join `portal_classe`) WHERE ((`portal_modules`.`classe_id` = `portal_classe`.`clas_Id`) AND (`portal_classe`.`clas_abrev` = 'DUT IG1')) ORDER BY `portal_modules`.`mod_libelle` ASC  ;

-- --------------------------------------------------------

--
-- Structure de la vue `modules_dutig2`
--
DROP TABLE IF EXISTS `modules_dutig2`;

DROP VIEW IF EXISTS `modules_dutig2`;
CREATE VIEW `modules_dutig2`  AS SELECT `portal_modules`.`mod_libelle` AS `mod_libelle`, `portal_modules`.`mod_coef` AS `mod_coef`, `portal_modules`.`mod_nbreh` AS `mod_nbreh`, `portal_classe`.`clas_libelle` AS `clas_libelle`, `portal_classe`.`clas_abrev` AS `clas_abrev` FROM (`portal_modules` join `portal_classe`) WHERE ((`portal_modules`.`classe_id` = `portal_classe`.`clas_Id`) AND (`portal_classe`.`clas_abrev` = 'DUT IG2')) ORDER BY `portal_modules`.`mod_libelle` ASC  ;

-- --------------------------------------------------------

--
-- Structure de la vue `modules_lap1`
--
DROP TABLE IF EXISTS `modules_lap1`;

DROP VIEW IF EXISTS `modules_lap1`;
CREATE VIEW `modules_lap1`  AS SELECT `portal_modules`.`mod_libelle` AS `mod_libelle`, `portal_modules`.`mod_coef` AS `mod_coef`, `portal_modules`.`mod_nbreh` AS `mod_nbreh`, `portal_classe`.`clas_libelle` AS `clas_libelle`, `portal_classe`.`clas_abrev` AS `clas_abrev` FROM (`portal_modules` join `portal_classe`) WHERE ((`portal_modules`.`classe_id` = `portal_classe`.`clas_Id`) AND (`portal_classe`.`clas_abrev` = 'LAP 1')) ORDER BY `portal_modules`.`mod_libelle` ASC  ;

-- --------------------------------------------------------

--
-- Structure de la vue `modules_lap2`
--
DROP TABLE IF EXISTS `modules_lap2`;

DROP VIEW IF EXISTS `modules_lap2`;
CREATE VIEW `modules_lap2`  AS SELECT `portal_modules`.`mod_libelle` AS `mod_libelle`, `portal_modules`.`mod_coef` AS `mod_coef`, `portal_modules`.`mod_nbreh` AS `mod_nbreh`, `portal_classe`.`clas_libelle` AS `clas_libelle`, `portal_classe`.`clas_abrev` AS `clas_abrev` FROM (`portal_modules` join `portal_classe`) WHERE ((`portal_modules`.`classe_id` = `portal_classe`.`clas_Id`) AND (`portal_classe`.`clas_abrev` = 'LAP 2')) ORDER BY `portal_modules`.`mod_libelle` ASC  ;

-- --------------------------------------------------------

--
-- Structure de la vue `modules_lap3`
--
DROP TABLE IF EXISTS `modules_lap3`;

DROP VIEW IF EXISTS `modules_lap3`;
CREATE VIEW `modules_lap3`  AS SELECT `portal_modules`.`mod_libelle` AS `mod_libelle`, `portal_modules`.`mod_coef` AS `mod_coef`, `portal_modules`.`mod_nbreh` AS `mod_nbreh`, `portal_classe`.`clas_libelle` AS `clas_libelle`, `portal_classe`.`clas_abrev` AS `clas_abrev` FROM (`portal_modules` join `portal_classe`) WHERE ((`portal_modules`.`classe_id` = `portal_classe`.`clas_Id`) AND (`portal_classe`.`clas_abrev` = 'LAP 3')) ORDER BY `portal_modules`.`mod_libelle` ASC  ;

-- --------------------------------------------------------

--
-- Structure de la vue `modules_licinfoa`
--
DROP TABLE IF EXISTS `modules_licinfoa`;

DROP VIEW IF EXISTS `modules_licinfoa`;
CREATE VIEW `modules_licinfoa`  AS SELECT `modules`.`mod_libelle` AS `intitule`, `modules`.`mod_coef` AS `coefficient`, `modules`.`mod_nbreh` AS `nombre_heure`, `modules`.`mod_datedebut` AS `date_debut`, `classe`.`clas_libelle` AS `classe`, `classe`.`clas_abrev` AS `abrev` FROM (`portal_modules` `modules` join `portal_classe` `classe`) WHERE ((`modules`.`classe_id` = `classe`.`clas_Id`) AND (`classe`.`clas_abrev` = 'LIC INFO A')) GROUP BY `modules`.`mod_libelle``mod_libelle`  ;

-- --------------------------------------------------------

--
-- Structure de la vue `modules_licinfob`
--
DROP TABLE IF EXISTS `modules_licinfob`;

DROP VIEW IF EXISTS `modules_licinfob`;
CREATE VIEW `modules_licinfob`  AS SELECT `modules`.`mod_libelle` AS `intitule`, `modules`.`mod_coef` AS `coefficient`, `modules`.`mod_nbreh` AS `nombre_heure`, `modules`.`mod_datedebut` AS `date_debut`, `classe`.`clas_libelle` AS `classe`, `classe`.`clas_abrev` AS `abrev` FROM (`portal_modules` `modules` join `portal_classe` `classe`) WHERE ((`modules`.`classe_id` = `classe`.`clas_Id`) AND (`classe`.`clas_abrev` = 'LIC INFO B')) GROUP BY `modules`.`mod_libelle``mod_libelle`  ;

-- --------------------------------------------------------

--
-- Structure de la vue `modules_licinfoc`
--
DROP TABLE IF EXISTS `modules_licinfoc`;

DROP VIEW IF EXISTS `modules_licinfoc`;
CREATE VIEW `modules_licinfoc`  AS SELECT `modules`.`mod_libelle` AS `intitule`, `modules`.`mod_coef` AS `coefficient`, `modules`.`mod_nbreh` AS `nombre_heure`, `modules`.`mod_datedebut` AS `date_debut`, `classe`.`clas_libelle` AS `classe`, `classe`.`clas_abrev` AS `abrev` FROM (`portal_modules` `modules` join `portal_classe` `classe`) WHERE ((`modules`.`classe_id` = `classe`.`clas_Id`) AND (`classe`.`clas_abrev` = 'LIC INFO C')) GROUP BY `modules`.`mod_libelle``mod_libelle`  ;

-- --------------------------------------------------------

--
-- Structure de la vue `modules_licinfo_a`
--
DROP TABLE IF EXISTS `modules_licinfo_a`;

DROP VIEW IF EXISTS `modules_licinfo_a`;
CREATE VIEW `modules_licinfo_a`  AS SELECT `portal_modules`.`mod_libelle` AS `mod_libelle`, `portal_modules`.`mod_coef` AS `mod_coef`, `portal_modules`.`mod_nbreh` AS `mod_nbreh`, `portal_classe`.`clas_libelle` AS `clas_libelle`, `portal_classe`.`clas_abrev` AS `clas_abrev` FROM (`portal_modules` join `portal_classe`) WHERE ((`portal_modules`.`classe_id` = `portal_classe`.`clas_Id`) AND (`portal_classe`.`clas_abrev` = 'LIC INFO A')) ORDER BY `portal_modules`.`mod_libelle` ASC  ;

-- --------------------------------------------------------

--
-- Structure de la vue `modules_licinfo_b`
--
DROP TABLE IF EXISTS `modules_licinfo_b`;

DROP VIEW IF EXISTS `modules_licinfo_b`;
CREATE VIEW `modules_licinfo_b`  AS SELECT `portal_modules`.`mod_libelle` AS `mod_libelle`, `portal_modules`.`mod_coef` AS `mod_coef`, `portal_modules`.`mod_nbreh` AS `mod_nbreh`, `portal_classe`.`clas_libelle` AS `clas_libelle`, `portal_classe`.`clas_abrev` AS `clas_abrev` FROM (`portal_modules` join `portal_classe`) WHERE ((`portal_modules`.`classe_id` = `portal_classe`.`clas_Id`) AND (`portal_classe`.`clas_abrev` = 'LIC INFO B')) ORDER BY `portal_modules`.`mod_libelle` ASC  ;

-- --------------------------------------------------------

--
-- Structure de la vue `modules_licinfo_c`
--
DROP TABLE IF EXISTS `modules_licinfo_c`;

DROP VIEW IF EXISTS `modules_licinfo_c`;
CREATE VIEW `modules_licinfo_c`  AS SELECT `portal_modules`.`mod_libelle` AS `mod_libelle`, `portal_modules`.`mod_coef` AS `mod_coef`, `portal_modules`.`mod_nbreh` AS `mod_nbreh`, `portal_classe`.`clas_libelle` AS `clas_libelle`, `portal_classe`.`clas_abrev` AS `clas_abrev` FROM (`portal_modules` join `portal_classe`) WHERE ((`portal_modules`.`classe_id` = `portal_classe`.`clas_Id`) AND (`portal_classe`.`clas_abrev` = 'LIC INFO C')) ORDER BY `portal_modules`.`mod_libelle` ASC  ;

-- --------------------------------------------------------

--
-- Structure de la vue `viewallemploitemps`
--
DROP TABLE IF EXISTS `viewallemploitemps`;

DROP VIEW IF EXISTS `viewallemploitemps`;
CREATE VIEW `viewallemploitemps`  AS SELECT `empt`.`emp_jour` AS `jour`, `empt`.`emp_heure` AS `heure`, `empt`.`emp_prof` AS `prof`, `md`.`mod_libelle` AS `modules`, `cl`.`clas_abrev` AS `classe` FROM ((`portal_emploitemps` `empt` join `portal_classe` `cl`) join `portal_modules` `md`) WHERE ((`empt`.`classe` = `cl`.`clas_Id`) AND (`empt`.`modules` = `md`.`mod_id`)) ORDER BY `cl`.`clas_abrev` ASC  ;

-- --------------------------------------------------------

--
-- Structure de la vue `viewallmodule`
--
DROP TABLE IF EXISTS `viewallmodule`;

DROP VIEW IF EXISTS `viewallmodule`;
CREATE VIEW `viewallmodule`  AS SELECT `md`.`mod_id` AS `ID`, `md`.`mod_libelle` AS `intitule`, `md`.`mod_coef` AS `coefficient`, `md`.`mod_nbreh` AS `nombre_heure`, `cl`.`clas_libelle` AS `classe`, `cl`.`clas_abrev` AS `abrev` FROM (`portal_modules` `md` join `portal_classe` `cl`) WHERE (`md`.`classe_id` = `cl`.`clas_Id`) ORDER BY `cl`.`clas_abrev` ASC  ;

-- --------------------------------------------------------

--
-- Structure de la vue `viewnotecontroleetudiant`
--
DROP TABLE IF EXISTS `viewnotecontroleetudiant`;

DROP VIEW IF EXISTS `viewnotecontroleetudiant`;
CREATE VIEW `viewnotecontroleetudiant`  AS SELECT `et`.`et_matricule` AS `matricule`, `et`.`et_nom` AS `nom`, `et`.`et_prenom` AS `prenom`, `m`.`mod_libelle` AS `intitule`, `m`.`mod_coef` AS `coef`, `c`.`con_note1` AS `note1`, `c`.`con_note2` AS `note2` FROM ((`portal_modules` `m` join `portal_control_s1` `c`) join `portal_etudiant` `et`) WHERE ((`m`.`mod_id` = `c`.`modules`) AND (`c`.`et_id` = `et`.`et_id`)) ORDER BY `et`.`et_matricule` ASC  ;

-- --------------------------------------------------------

--
-- Structure de la vue `viewnotecontroles2etudiant`
--
DROP TABLE IF EXISTS `viewnotecontroles2etudiant`;

DROP VIEW IF EXISTS `viewnotecontroles2etudiant`;
CREATE VIEW `viewnotecontroles2etudiant`  AS SELECT `et`.`et_matricule` AS `matricule`, `et`.`et_nom` AS `nom`, `et`.`et_prenom` AS `prenom`, `m`.`mod_libelle` AS `intitule`, `m`.`mod_coef` AS `coef`, `c`.`con_note1` AS `note1`, `c`.`con_note2` AS `note2` FROM ((`portal_modules` `m` join `portal_control_s2` `c`) join `portal_etudiant` `et`) WHERE ((`m`.`mod_id` = `c`.`modules`) AND (`c`.`et_id` = `et`.`et_id`)) ORDER BY `et`.`et_matricule` ASC  ;

-- --------------------------------------------------------

--
-- Structure de la vue `viewnoteexamens1etudiant`
--
DROP TABLE IF EXISTS `viewnoteexamens1etudiant`;

DROP VIEW IF EXISTS `viewnoteexamens1etudiant`;
CREATE VIEW `viewnoteexamens1etudiant`  AS SELECT `et`.`et_matricule` AS `matricule`, `et`.`et_nom` AS `nom`, `et`.`et_prenom` AS `prenom`, `m`.`mod_libelle` AS `intitule`, `m`.`mod_coef` AS `coef`, `ex`.`exa_note1` AS `note1`, `ex`.`exa_note2` AS `note2` FROM ((`portal_modules` `m` join `portal_examens_s1` `ex`) join `portal_etudiant` `et`) WHERE ((`m`.`mod_id` = `ex`.`modules`) AND (`ex`.`et_id` = `et`.`et_id`)) ORDER BY `et`.`et_matricule` ASC  ;

-- --------------------------------------------------------

--
-- Structure de la vue `viewnoteexamens2etudiant`
--
DROP TABLE IF EXISTS `viewnoteexamens2etudiant`;

DROP VIEW IF EXISTS `viewnoteexamens2etudiant`;
CREATE VIEW `viewnoteexamens2etudiant`  AS SELECT `et`.`et_matricule` AS `matricule`, `et`.`et_nom` AS `nom`, `et`.`et_prenom` AS `prenom`, `m`.`mod_libelle` AS `intitule`, `m`.`mod_coef` AS `coef`, `ex`.`exa_note1` AS `note1`, `ex`.`exa_note2` AS `note2` FROM ((`portal_modules` `m` join `portal_examens_s2` `ex`) join `portal_etudiant` `et`) WHERE ((`m`.`mod_id` = `ex`.`modules`) AND (`ex`.`et_id` = `et`.`et_id`)) ORDER BY `et`.`et_matricule` ASC  ;

-- --------------------------------------------------------

--
-- Structure de la vue `viewresultatalletudiant`
--
DROP TABLE IF EXISTS `viewresultatalletudiant`;

DROP VIEW IF EXISTS `viewresultatalletudiant`;
CREATE VIEW `viewresultatalletudiant`  AS SELECT `et`.`et_matricule` AS `matricule`, `et`.`et_nom` AS `nom`, `et`.`et_prenom` AS `prenom`, `cl`.`clas_abrev` AS `classe`, `res`.`semestre1` AS `semestre1`, `res`.`semestre2` AS `semestre2`, `res`.`rang` AS `rang`, `res`.`moyenne` AS `moyenne` FROM ((`cfi_resultat` `res` join `portal_etudiant` `et`) join `portal_classe` `cl`) WHERE ((`res`.`etudiant_id` = `et`.`et_id`) AND (`et`.`classe` = `cl`.`clas_Id`))  ;

-- --------------------------------------------------------

--
-- Structure de la vue `viewsession`
--
DROP TABLE IF EXISTS `viewsession`;

DROP VIEW IF EXISTS `viewsession`;
CREATE VIEW `viewsession`  AS SELECT `portal_dash_session`.`intitule` AS `name_session`, `portal_dash_session`.`date` AS `session_date`, `portal_dash_session`.`semestre` AS `semestre` FROM `portal_dash_session``portal_dash_session`  ;

-- --------------------------------------------------------

--
-- Structure de la vue `viewstatutfinancieretudiant`
--
DROP TABLE IF EXISTS `viewstatutfinancieretudiant`;

DROP VIEW IF EXISTS `viewstatutfinancieretudiant`;
CREATE VIEW `viewstatutfinancieretudiant`  AS SELECT `et`.`et_matricule` AS `matricule`, `et`.`et_nom` AS `nom`, `et`.`et_prenom` AS `et_prenom`, `cl`.`clas_abrev` AS `classe`, `sf`.`mois` AS `mois`, `sf`.`est_paye` AS `est_paye` FROM ((`cfi_statutfinancier` `sf` join `portal_etudiant` `et`) join `portal_classe` `cl`) WHERE ((`sf`.`etudiant_id` = `et`.`et_id`) AND (`et`.`classe` = `cl`.`clas_Id`))  ;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
