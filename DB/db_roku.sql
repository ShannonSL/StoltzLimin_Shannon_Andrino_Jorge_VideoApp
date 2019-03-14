-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Mar 14, 2019 at 03:50 PM
-- Server version: 5.7.24
-- PHP Version: 7.2.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_roku`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_adult_genre`
--

DROP TABLE IF EXISTS `tbl_adult_genre`;
CREATE TABLE IF NOT EXISTS `tbl_adult_genre` (
  `id` int(11) NOT NULL,
  `Genre` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_adult_tv`
--

DROP TABLE IF EXISTS `tbl_adult_tv`;
CREATE TABLE IF NOT EXISTS `tbl_adult_tv` (
  `tv_id` int(11) NOT NULL,
  `tv_title` varchar(75) NOT NULL,
  `tv_year` varchar(5) NOT NULL,
  `tv_genre` varchar(10) NOT NULL,
  `tv_cover` varchar(20) NOT NULL,
  `tv_storyline` varchar(250) NOT NULL,
  `tv_trailer` varchar(500) NOT NULL,
  PRIMARY KEY (`tv_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_audio`
--

DROP TABLE IF EXISTS `tbl_audio`;
CREATE TABLE IF NOT EXISTS `tbl_audio` (
  `audio_id` int(11) NOT NULL,
  `audio_title` varchar(50) NOT NULL,
  `audio_year` varchar(4) NOT NULL,
  `audio_artist` varchar(75) NOT NULL,
  `audio_cover` varchar(20) NOT NULL,
  `audio_src` varchar(1000) NOT NULL,
  PRIMARY KEY (`audio_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_audio`
--

INSERT INTO `tbl_audio` (`audio_id`, `audio_title`, `audio_year`, `audio_artist`, `audio_cover`, `audio_src`) VALUES
(1, '22', '2013', 'Taylor Swift', 'taylor.jpg', 'https://www.youtube.com/watch?v=AgFeZr5ptV8'),
(2, 'Amercian Idiot', '2004', 'Green Day', 'greenday.jpg', 'https://www.youtube.com/watch?v=Ee_uujKuJMI'),
(3, 'True Blue', '1986', 'Madonna', 'madonnatrue.jpg', 'https://www.youtube.com/watch?v=J6bxuX8D_ng'),
(4, 'Lucy In The Sky With Diamonds', '1967', 'The Beatles', 'thebeatles.jpg', 'https://www.youtube.com/watch?v=O4hTUPFBaaQ'),
(5, 'Sunday Bloody Sunday', '1983', 'U2', 'u2war.jpg', 'https://www.youtube.com/watch?v=EM4vblG6BVQ'),
(6, 'Bad', '1987', 'Michael Jackson', 'mjbad.jpg', 'https://www.youtube.com/watch?v=Sd4SJVsTulc'),
(7, 'Back in Black', '1980', 'ACDC', 'acdcbackinblack.jpg', 'https://www.youtube.com/watch?v=pAgnJDJN4VA'),
(8, 'Jailhouse Rock', '1957', 'Elvis Presley', 'elvispresley.jpg', 'https://www.youtube.com/watch?v=gj0Rz-uP4Mk'),
(9, ' Last Friday Night (T.G.I.F) ', '2010', 'Katy Perry', 'katyperrytgif.jpg', 'https://www.youtube.com/watch?v=azKgBCv2kLo'),
(10, 'Schoolin\' Life', '2011', 'Beyoncé ', 'beyonce.jpg', 'https://www.youtube.com/watch?v=oAmnkPUFMHg'),
(11, 'Someone Like You', '2011', 'Adele', 'adele21.jpg', 'https://www.youtube.com/watch?v=hLQl3WQQoQ0'),
(12, 'Please Please Me', '1963', 'The Beatles', 'beatlesplease.jpg', 'https://www.youtube.com/watch?v=q3NTVkHwD5I'),
(13, 'London Calling', '1979', 'The Clash', 'clashlondon.jpg', 'https://www.youtube.com/watch?v=EfK-WX2pa8c'),
(14, 'Love Gun', '1977', 'Kiss', 'kisslovegun.jpg', 'https://www.youtube.com/watch?v=trR5ROuf1Uk'),
(15, 'Wild Horses', '1971', 'The Rolling Stones', 'rollingstones.jpg', 'https://www.youtube.com/watch?v=UFLJFl7ws_0');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_genres`
--

DROP TABLE IF EXISTS `tbl_genres`;
CREATE TABLE IF NOT EXISTS `tbl_genres` (
  `genre_id` int(11) NOT NULL,
  `genre_name` varchar(10) NOT NULL,
  PRIMARY KEY (`genre_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_genre_kids`
--

DROP TABLE IF EXISTS `tbl_genre_kids`;
CREATE TABLE IF NOT EXISTS `tbl_genre_kids` (
  `id` int(11) NOT NULL,
  `genre` varchar(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_kids_genre_connect`
--

DROP TABLE IF EXISTS `tbl_kids_genre_connect`;
CREATE TABLE IF NOT EXISTS `tbl_kids_genre_connect` (
  `id` int(11) NOT NULL,
  `kids_genre` int(11) NOT NULL,
  `genre_kids_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_kids_tv`
--

DROP TABLE IF EXISTS `tbl_kids_tv`;
CREATE TABLE IF NOT EXISTS `tbl_kids_tv` (
  `kidstv_id` int(11) NOT NULL,
  `kids_title` varchar(50) NOT NULL,
  `kids_cover` varchar(50) NOT NULL,
  `kids_storyline` varchar(250) NOT NULL,
  `kids_genre` varchar(20) NOT NULL,
  `kids_trailer` varchar(500) NOT NULL,
  PRIMARY KEY (`kidstv_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_kids_tv`
--

INSERT INTO `tbl_kids_tv` (`kidstv_id`, `kids_title`, `kids_cover`, `kids_storyline`, `kids_genre`, `kids_trailer`) VALUES
(1, 'Gargoyles', 'gargoyles.jpg', 'After spending a thousand years in an enchanted petrified state, the gargoyles (who have been transported from medieval Scotland) are reawakened in modern-day New York City, and take on roles as the city\'s secret night-time protectors.', 'Animated', 'https://www.youtube.com/watch?v=ygrEVnrg3Ic'),
(2, 'Dexter\'s Laboratory', 'dexter.jpg', 'Your fate lies safely in the hands of Dexter, a child genius who whips up dazzling, world-saving inventions in his secret laboratory.', 'Animated', 'https://www.youtube.com/watch?v=FvTwxXTaISQ'),
(3, 'The Littlest Hobo', 'littlesthobo.jpg', 'A homeless dog helps solve tough problems.', 'Adventure', 'https://www.youtube.com/watch?v=lgGKSjiw0HQ'),
(4, 'Hey Arnold!', 'HeyArnold.jpg', 'The fourth grader with a football-shaped head takes on adventures to help solve classmates\' problems or come up with solutions to his own predicaments', 'Animated', 'https://www.youtube.com/watch?v=vUsnJ9jlwns'),
(5, 'Rugrats', 'rugrats.jpg', '`Rugrats\' reveals the world from a baby\'s point of view', 'Animated', 'https://www.youtube.com/watch?v=jMEj9kQg3F8'),
(6, 'The Magic School Bus', 'MagicBus.jpg', 'Scholastic\'s \"The Magic School Bus\" follows Ms. Frizzle and her class as they set off on field trips', 'animated', 'https://www.youtube.com/watch?v=egmmYxXhScQ'),
(7, 'Pinky & The Brain', 'PinkyBrain.jpg', 'Cartoon chaos with the genius mouse and his stupid sidekick who try to conquer the world each night.', 'Animated', 'https://www.youtube.com/watch?v=GBkT19uH2RQ'),
(8, 'Powerpuff Girls', 'PowerpuffGirls.jpg', 'Accidentally created in a lab by Professor Utonium, superpowered sisters Blossom, Bubbles and Buttercup regularly save Townsville', 'Animated', 'https://www.youtube.com/watch?v=4mmCMUPCNgE'),
(9, 'Boy Meets World', 'BoyMeetsWorld.jpg', 'With the help of true love Topanga, best friend Shawn and teacher Mr. Feeny, Cory Matthews juggles school, friends and romanc', 'Comedy', 'https://www.youtube.com/watch?v=2-DNTzQT2ac'),
(10, 'Avatar The Last Airbender', 'Airbender.jpg', 'The world is divided into four nations -- the Water Tribe, the Earth Kingdom, the Fire Nation and and the Air Nomads', 'Animated', 'https://www.youtube.com/watch?v=d1EnW4kn1kg'),
(11, 'Adventure Time', 'AdventureTime.jpg', 'Twelve- year-old Finn battles evil in the Land of Ooo. Assisted by his magical dog, Jake,', 'Animated', 'adventure time theme song'),
(12, 'Pokemon', 'Pokemon.jpg', '. Young Ash Ketchum is just beginning his Pokémon training as he reaches his 10th birthday.', 'Animated', 'https://www.youtube.com/watch?v=6xKWiCMKKJg'),
(13, 'My Little Pony Friendship Is Magic', 'PonyFriendship.jpg', '. In this series, Princess Celestia sends her star pupil, the bookish unicorn Twilight Sparkle, to Ponyville to improve her socialization skills.', 'Animated', 'https://www.youtube.com/watch?v=ZcBNxuKZyN4'),
(14, 'Wild Kratts', 'WildKratts.jpg', ' the animated Kratts encounter wild animals during stories of adventure and mystery. The live-action Kratt brothers introduce each episode.', 'Animated', 'https://www.youtube.com/watch?v=HJNat-H-6pU'),
(15, 'Kim Possible', 'KimPossible.jpg', 'Kim Possible looks like an average high-school cheerleader, but in her spare time, she saves the world from supervillain', 'Animated', 'https://www.youtube.com/watch?v=I43SMbqOMmY');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_movies_kids`
--

DROP TABLE IF EXISTS `tbl_movies_kids`;
CREATE TABLE IF NOT EXISTS `tbl_movies_kids` (
  `novies_kids_id` int(11) NOT NULL,
  `title` varchar(75) NOT NULL,
  `movie_year` varchar(5) NOT NULL,
  `movie_runtime` varchar(10) NOT NULL,
  `movie_storyline` varchar(250) NOT NULL,
  `movie_cover` varchar(15) NOT NULL,
  `movie_trailer` varchar(500) NOT NULL,
  `kids_genre` varchar(20) NOT NULL,
  PRIMARY KEY (`novies_kids_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_movie_adult`
--

DROP TABLE IF EXISTS `tbl_movie_adult`;
CREATE TABLE IF NOT EXISTS `tbl_movie_adult` (
  `movies_id` int(11) NOT NULL,
  `movie_title` varchar(50) NOT NULL,
  `movie_year` varchar(5) NOT NULL,
  `movie_cover` varchar(20) NOT NULL,
  `movie_runtime` varchar(10) NOT NULL,
  `movie_storyline` varchar(250) NOT NULL,
  `movie_genre` varchar(20) NOT NULL,
  `movie_trailer` varchar(500) NOT NULL,
  PRIMARY KEY (`movies_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_movie_adult`
--

INSERT INTO `tbl_movie_adult` (`movies_id`, `movie_title`, `movie_year`, `movie_cover`, `movie_runtime`, `movie_storyline`, `movie_genre`, `movie_trailer`) VALUES
(1, 'A Streetcar Named Desire', '1951', 'StreetcarDesire.jpg', '2hr 7min', 'Disturbed Blanche DuBois moves in with her sister in New Orleans and is tormented by her brutish brother-in-law while her reality crumbles around her.', 'Southern Gothic', 'https://www.youtube.com/watch?v=u9YgJjSCT08'),
(2, 'Plan 9 from Outer Space', '1959', 'plan9.jpg', '80 min', 'Aliens raise earths dead in an effort to prevent Humankind from developing a doomsday device.', 'Horro Sci-fi', 'https://www.youtube.com/watch?v=zyyIInQXCjg'),
(3, 'Creature from the Black Lagoon', '1954', 'BlackLagoon.jpg', '1hr 20min', 'Remnants of a mysterious animal have come to light in a remote jungle, and a group of scientists intends to determine if the find is an anomaly or evidence of an undiscovered beast.', 'Horror Sci-fi', 'https://www.youtube.com/watch?v=svyPswixryM'),
(4, 'Dial M for Murder', '1954', 'MforMurder.jpg', '1hr 45min', 'Ex-tennis pro Tony Wendice (Ray Milland) wants to have his wealthy wife, Margot (Grace Kelly), murdered so he can get his hands on her inheritance.', 'Thriller', 'https://www.youtube.com/watch?v=JWP_hrNHSN4'),
(5, 'Forbidden Planet', '1956', 'ForbiddenPlanet.jpg', '1hr 39min', 'a spacecraft travels to the distant planet Altair IV to discover the fate of a group of scientists sent there decades earlier. ', 'Sci-Fi', 'https://www.youtube.com/watch?v=AxQ9GG6hUDM'),
(6, 'Invasion Of The Body Snatchers', '1978', 'BodySnatchers.jpg', '1hr 20min', 'an alien species of human duplicates, grown from plant-like pods, is taking over the small town.', 'horror sci-fi', 'https://www.youtube.com/watch?v=vc_0dlmSq7I'),
(7, 'It Came From Outer Space', '1953', 'OuterSpace.jpg', '1hr 21min', 'While looking through his telescope one night, John Putnam sees what at first appears to be a meteor shower but it is actually a crash-landing alien spaceship', 'Sci-Fi', 'https://www.youtube.com/watch?v=85xpN_Ohwqs'),
(8, 'Paths of Glory', '1957', 'PathsOfGlory.jpg', '1hr 28min', 'Though the mission is foolhardy to the point of suicide, Mireau commands his own subordinate, Colonel Dax (Kirk Douglas), to plan the attack. ', 'War', 'https://www.youtube.com/watch?v=nmDA60X-f_A'),
(9, 'Singing In The Rain', '1952', 'Rain.jpg', '1hr 43min', '. Don and Lina have been cast repeatedly as a romantic couple, but when their latest film is remade into a musical, only Don has the voice for the new singing part', 'Comedy', 'https://www.youtube.com/watch?v=Fp7Ao6Zk_Mc'),
(10, 'Rear Window', '1954', 'RearWindow.jpg', '1hr 55min', 'A newspaper photographer with a broken leg passes time recuperating by observing his neighbors through his window', 'Thriller', 'https://www.youtube.com/watch?v=m01YktiEZCw'),
(11, 'Rebel Without A Cause', '1955', 'Rebel.jpg', '1hr 51min', 'After moving to a new town, troublemaking teen Jim Stark (James Dean) is supposed to have a clean slate, although being the new kid in town brings its own problems', 'Drama', 'https://www.youtube.com/watch?v=0COQv9HLtMo'),
(12, 'The Incredible Shirnking Man', '1957', 'ShrinkingMan.jpg', '1hr 21min', 'While on a boating trip, Scott Carey (Grant Williams) is exposed to a radioactive cloud', 'Horror Sci-fi', 'https://www.youtube.com/watch?v=eA9YoqhjNtI'),
(13, 'Strangers On A Train', '1951', 'StrangersTrain,jpg', '1hr 43min', 'Psychopathic Bruno kills Guy\'s wife, then urges Guy to reciprocate by killing Bruno\'s fathe', 'Thriller', 'https://www.youtube.com/watch?v=D6LCovGaOHY'),
(14, 'The Blob', '1958', 'TheBlob.jpg', '1hr 26min', 'The first to discover the substance and live to tell about it, Steve and Jane witness the blob destroying an elderly man and grow to a terrifying size', 'Horror Sci-Fi', 'https://www.youtube.com/watch?v=TdUsyXQ8Wrs'),
(15, 'The Thing From Another World', '1982', 'theThing.jpg', '1hr 49min', 'In remote Antarctica, a group of American research scientists are disturbed at their base camp by a helicopter shooting at a sled dog. ', 'Horror Sci-Fir', 'https://www.youtube.com/watch?v=T5dwbZKd64Y');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_users`
--

DROP TABLE IF EXISTS `tbl_users`;
CREATE TABLE IF NOT EXISTS `tbl_users` (
  `user_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(75) NOT NULL,
  `age` varchar(3) NOT NULL,
  `password` varchar(30) NOT NULL,
  `login_attempts` tinyint(4) NOT NULL,
  `last_login` date NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
