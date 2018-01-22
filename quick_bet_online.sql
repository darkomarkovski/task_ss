
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `quick_bet_online`
--

-- --------------------------------------------------------

--
-- Table structure for table `odds_conversion_chart`
--

DROP TABLE IF EXISTS `odds_conversion_chart`;
CREATE TABLE IF NOT EXISTS `odds_conversion_chart` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `UK` varchar(10) NOT NULL,
  `EU` varchar(10) NOT NULL,
  `US` varchar(10) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARACTER SET utf8
DEFAULT COLLATE utf8_general_ci;

--
-- Dumping data for table `odds_conversion_chart`
--

INSERT INTO `odds_conversion_chart` (`ID`, `UK`, `EU`, `US`) VALUES
(1, '1/5', '1.20', '-500'),
(2, '2/9', '1.22', '-450');

-- .......  (INSERT THE REST OF THE TABLE)....

-- --------------------------------------------------------

--
-- Table structure for table `user_input_log`
--

DROP TABLE IF EXISTS `user_input_log`;
CREATE TABLE IF NOT EXISTS `user_input_log` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `user_input` varchar(50) NOT NULL,
  `field` varchar(50) NOT NULL,
  `user_ip` varchar(50) NOT NULL,
  `date_created` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARACTER SET utf8
DEFAULT COLLATE utf8_general_ci;


COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
