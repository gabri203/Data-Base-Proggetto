-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Creato il: Feb 18, 2023 alle 11:22
-- Versione del server: 10.4.27-MariaDB
-- Versione PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `class`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `citta`
--

CREATE TABLE `citta` (
  `cap` int(11) NOT NULL,
  `Nome` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dump dei dati per la tabella `citta`
--

INSERT INTO `citta` (`cap`, `Nome`) VALUES
(12800, 'Roma'),
(20100, 'Milano'),
(45677, 'Montoro'),
(67587, 'Solofra'),
(83100, 'Avellino');

-- --------------------------------------------------------

--
-- Struttura della tabella `classe`
--

CREATE TABLE `classe` (
  `Codice_classe` varchar(20) NOT NULL,
  `Descrizione_Classe` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dump dei dati per la tabella `classe`
--

INSERT INTO `classe` (`Codice_classe`, `Descrizione_Classe`) VALUES
('3BS', 'La classe 3BS ha 19'),
('4BS', 'La classe 4BS ha 18'),
('5BS', 'La classe 5BS ha 23 ');

-- --------------------------------------------------------

--
-- Struttura della tabella `docente`
--

CREATE TABLE `docente` (
  `Codice_docente` varchar(20) NOT NULL,
  `Nome` varchar(20) NOT NULL,
  `Cognome_docente` varchar(20) NOT NULL,
  `Stipendio` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dump dei dati per la tabella `docente`
--

INSERT INTO `docente` (`Codice_docente`, `Nome`, `Cognome_docente`, `Stipendio`) VALUES
('1', 'Clara ', 'Vozzela', 1750),
('2', 'Liberato', 'Pizza', 1500),
('3', 'Maria Virginia', 'Pelecchia', 1800),
('4', 'Alberto ', 'Addamiano', 1250),
('5', 'Luisa', 'Pascale', 1350);

-- --------------------------------------------------------

--
-- Struttura della tabella `insegna`
--

CREATE TABLE `insegna` (
  `Codice_docente` varchar(20) NOT NULL,
  `Codice_classe` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dump dei dati per la tabella `insegna`
--

INSERT INTO `insegna` (`Codice_docente`, `Codice_classe`) VALUES
('1', '3BS'),
('1', '4BS'),
('1', '5BS'),
('2', '3BS'),
('2', '4BS'),
('2', '5BS'),
('3', '3BS'),
('3', '4BS'),
('3', '5BS'),
('4', '3BS'),
('4', '4BS'),
('4', '5BS'),
('5', '3BS'),
('5', '4BS'),
('5', '5BS');

-- --------------------------------------------------------

--
-- Struttura della tabella `studenti`
--

CREATE TABLE `studenti` (
  `Cognome` varchar(20) NOT NULL,
  `Codice_studente` varchar(20) NOT NULL,
  `Anno_Nascita` varchar(30) NOT NULL,
  `Nome` varchar(30) NOT NULL,
  `Numero_civico` int(11) NOT NULL,
  `Codice_classe` varchar(20) NOT NULL,
  `cap` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dump dei dati per la tabella `studenti`
--

INSERT INTO `studenti` (`Cognome`, `Codice_studente`, `Anno_Nascita`, `Nome`, `Numero_civico`, `Codice_classe`, `cap`) VALUES
('Gallo', '1', '02/05/2004', 'Carmine', 34, '5BS', 83100),
('lardo', '12', '07/01/2006', 'Pasquale', 89, '3BS', 20100),
('Peppe', '13', '09/11/2007', 'Aurelio', 45, '3BS', 67587),
('Conforti', '2', '05/06/2004', 'Fatima', 23, '5BS', 45677),
('Sarno', '3', '24/02/2004', 'Christian', 47, '5BS', 67587),
('Graziano', '4', '08/03/2005', 'Simone', 19, '5BS', 83100),
('Brito Ferlisi', '5', '07/11/2003', 'Said Gabriel', 40, '5BS', 83100),
('Schettino', '6', '09/10/2004', 'Vincenzo', 39, '5BS', 12800),
('Perrone', '7', '27/12/2004', 'Umberto', 11, '5BS', 83100),
('Gatto', '8', '28/10/2005', 'Giovanni', 56, '4BS', 20100),
('Olindo', '9', '09/02/2005', 'Francesco', 67, '4BS', 83100);

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `citta`
--
ALTER TABLE `citta`
  ADD PRIMARY KEY (`cap`);

--
-- Indici per le tabelle `classe`
--
ALTER TABLE `classe`
  ADD PRIMARY KEY (`Codice_classe`);

--
-- Indici per le tabelle `docente`
--
ALTER TABLE `docente`
  ADD PRIMARY KEY (`Codice_docente`);

--
-- Indici per le tabelle `insegna`
--
ALTER TABLE `insegna`
  ADD PRIMARY KEY (`Codice_docente`,`Codice_classe`),
  ADD KEY `Codice_classe` (`Codice_classe`);

--
-- Indici per le tabelle `studenti`
--
ALTER TABLE `studenti`
  ADD PRIMARY KEY (`Codice_studente`),
  ADD KEY `Codice_classe` (`Codice_classe`),
  ADD KEY `cap` (`cap`);

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `insegna`
--
ALTER TABLE `insegna`
  ADD CONSTRAINT `insegna_ibfk_1` FOREIGN KEY (`Codice_docente`) REFERENCES `docente` (`Codice_docente`),
  ADD CONSTRAINT `insegna_ibfk_2` FOREIGN KEY (`Codice_classe`) REFERENCES `classe` (`Codice_classe`);

--
-- Limiti per la tabella `studenti`
--
ALTER TABLE `studenti`
  ADD CONSTRAINT `studenti_ibfk_1` FOREIGN KEY (`Codice_classe`) REFERENCES `classe` (`Codice_classe`),
  ADD CONSTRAINT `studenti_ibfk_2` FOREIGN KEY (`cap`) REFERENCES `citta` (`cap`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
