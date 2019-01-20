-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- 主機: 127.0.0.1
-- 產生時間： 2018 年 01 朁E08 日 14:21
-- 伺服器版本: 10.1.25-MariaDB
-- PHP 版本： 7.1.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 資料庫： `happy_elearning`
--

-- --------------------------------------------------------

--
-- 資料表結構 `groups`
--

CREATE TABLE `groups` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(510) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- 資料表的匯出資料 `groups`
--

INSERT INTO `groups` (`id`, `name`, `description`, `status`) VALUES
(1, 'TestCase001', 'SE@', 1),
(2, 'Admin Group', 'Admin Group', 1),
(3, 'wqew', 'wew', 0),
(4, 'qweqwe', 'qweqewewe', 0),
(5, 'qwe', 'ewewewew', 0),
(6, 'xvxc', 'qqqqqqqq', 0),
(7, 'sdsd', 'Unf', 0),
(8, 'IT-114105', 'volutpat. Nulla facilisis. Suspendisse commodo tincidunt nibh. Phasellus nulla. Integer', 0),
(9, 'IT-114106', 'Sed eget lacus. Mauris non dui nec urna', 0),
(10, 'IT-114107', 'Cras vulputate velit', 0),
(11, 'IT-114108', 'risus. Nulla eget metus eu erat', 0),
(12, 'IT-114109', 'orci, adipiscing non, luctus sit amet, faucibus ut,', 0),
(13, 'IT-114110', 'nunc sit amet metus. Aliquam erat', 0),
(14, 'IT-114111', 'Maecenas iaculis aliquet diam. Sed', 0),
(15, 'IT-114112', 'purus. Nullam scelerisque neque sed sem', 0),
(16, 'IT-114113', 'mi, ac mattis velit justo nec ante. Maecenas', 0),
(17, 'IT-114114', 'vitae velit egestas lacinia. Sed', 0),
(18, 'IT-114115', 'dolor sit amet, consectetuer adipiscing elit. Etiam laoreet, libero', 0),
(19, 'IT-114116', 'Mauris quis turpis vitae', 0),
(20, 'IT-114117', 'ut erat. Sed nunc', 0),
(21, 'IT-114118', 'leo elementum sem,', 0),
(22, 'IT-114119', 'pulvinar arcu et pede. Nunc', 0),
(23, 'IT-114120', 'nibh sit amet', 0),
(24, 'IT-114121', 'libero est, congue a, aliquet vel, vulputate eu, odio.', 0),
(25, 'IT-114122', 'orci. Donec nibh. Quisque nonummy ipsum non', 0),
(26, 'IT-114123', 'nec tellus.', 0),
(27, 'IT-114124', 'et, rutrum eu, ultrices sit amet,', 0),
(28, 'IT-114125', 'ipsum. Phasellus vitae mauris sit amet lorem', 0),
(29, 'IT-114126', 'est, congue a,', 0),
(30, 'IT-114127', 'urna convallis erat, eget tincidunt dui augue eu tellus. Phasellus', 0),
(31, 'IT-114128', 'nec ligula consectetuer', 0),
(32, 'IT-114129', 'Curabitur vel lectus. Cum sociis', 0),
(33, 'IT-114130', 'sodales purus, in molestie tortor', 0),
(34, 'IT-114131', 'consequat, lectus sit amet luctus vulputate, nisi', 0),
(35, 'IT-114132', 'aliquet nec, imperdiet nec,', 0),
(36, 'IT-114133', 'sem semper erat, in consectetuer ipsum nunc id enim. Curabitur', 0),
(37, 'IT-114134', 'fames ac turpis egestas.', 0),
(38, 'IT-114135', 'magna. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.', 0),
(39, 'IT-114136', 'Fusce fermentum fermentum', 0),
(40, 'IT-114137', 'in', 0),
(41, 'IT-114138', 'massa. Vestibulum accumsan neque et nunc. Quisque', 0),
(42, 'IT-114139', 'aliquam adipiscing lacus. Ut nec urna et arcu imperdiet ullamcorper.', 0),
(43, 'IT-114140', 'porta elit, a feugiat tellus lorem eu metus. In', 0),
(44, 'IT-114141', 'lorem tristique aliquet. Phasellus fermentum', 0),
(45, 'IT-114142', 'Suspendisse commodo tincidunt nibh. Phasellus nulla. Integer vulputate,', 0),
(46, 'IT-114143', 'egestas. Duis ac arcu.', 0),
(47, 'IT-114144', 'Nunc laoreet lectus quis massa. Mauris vestibulum, neque sed', 0),
(48, 'IT-114145', 'sem eget massa. Suspendisse', 0),
(49, 'IT-114146', 'erat, eget tincidunt dui augue eu tellus.', 0),
(50, 'IT-114147', 'eu, ultrices sit amet, risus. Donec nibh enim,', 0),
(51, 'IT-114148', 'sed, hendrerit a, arcu. Sed et', 0),
(52, 'IT-114149', 'ultricies ligula. Nullam enim. Sed nulla ante,', 0),
(53, 'IT-114150', 'dolor. Nulla semper', 0),
(54, 'IT-114151', 'Nullam suscipit, est ac', 0),
(55, 'IT-114152', 'ipsum sodales', 0),
(56, 'IT-114153', 'Nullam lobortis quam a felis ullamcorper viverra. Maecenas iaculis aliquet', 0),
(57, 'IT-114154', 'sit amet diam eu', 0),
(58, 'IT-114155', 'eget metus.', 0),
(59, 'IT-114156', 'sem egestas blandit.', 0),
(60, 'IT-114157', 'at sem molestie sodales. Mauris blandit enim consequat purus. Maecenas', 0),
(61, 'IT-114158', 'ipsum. Suspendisse', 0),
(62, 'IT-114159', 'nisl. Maecenas malesuada', 0),
(63, 'IT-114160', 'scelerisque neque. Nullam nisl. Maecenas malesuada fringilla est. Mauris eu', 0),
(64, 'IT-114161', 'ornare, elit elit fermentum risus, at fringilla', 0),
(65, 'IT-114162', 'dapibus', 0),
(66, 'IT-114163', 'quis lectus. Nullam suscipit, est ac facilisis facilisis,', 0),
(67, 'IT-114164', 'quis lectus. Nullam suscipit, est ac facilisis', 0),
(68, 'IT-114165', 'ut odio vel est tempor bibendum. Donec felis', 0),
(69, 'IT-114166', 'a feugiat', 0),
(70, 'IT-114167', 'vehicula. Pellentesque tincidunt tempus', 0),
(71, 'IT-114168', 'Class aptent taciti sociosqu ad litora torquent per conubia nostra,', 0),
(72, 'IT-114169', 'lorem vitae odio sagittis', 0),
(73, 'IT-114170', 'Nam ac nulla. In tincidunt congue turpis. In', 0),
(74, 'IT-114171', 'natoque', 0),
(75, 'IT-114172', 'pretium aliquet, metus urna convallis erat, eget', 0),
(76, 'IT-114173', 'nonummy ut, molestie in, tempus eu, ligula. Aenean euismod mauris', 0),
(77, 'IT-114174', 'interdum ligula eu enim.', 0),
(78, 'IT-114175', 'ridiculus', 0),
(79, 'IT-114176', 'Phasellus ornare. Fusce mollis. Duis sit amet diam eu dolor', 0),
(80, 'IT-114177', 'augue eu tellus. Phasellus elit pede, malesuada vel, venenatis vel,', 0),
(81, 'IT-114178', 'justo sit amet nulla. Donec non justo. Proin', 0),
(82, 'IT-114179', 'eu odio tristique', 0),
(83, 'IT-114180', 'lacus. Aliquam rutrum lorem ac risus. Morbi metus.', 0),
(84, 'IT-114181', 'odio sagittis semper. Nam tempor diam dictum', 0),
(85, 'IT-114182', 'urna justo faucibus lectus, a sollicitudin orci sem', 0),
(86, 'IT-114183', 'eros. Proin ultrices. Duis volutpat nunc sit amet', 0),
(87, 'IT-114184', 'accumsan sed, facilisis vitae, orci. Phasellus dapibus quam', 0),
(88, 'IT-114185', 'accumsan interdum libero dui nec', 0),
(89, 'IT-114186', 'lacus. Nulla tincidunt, neque vitae semper egestas, urna', 0),
(90, 'IT-114187', 'odio. Nam interdum enim non nisi. Aenean eget', 0),
(91, 'IT-114188', 'mauris sagittis placerat. Cras dictum ultricies ligula. Nullam enim.', 0),
(92, 'IT-114189', 'semper, dui', 0),
(93, 'IT-114190', 'quam vel sapien imperdiet ornare. In faucibus. Morbi vehicula. Pellentesque', 0),
(94, 'IT-114191', 'amet,', 0),
(95, 'IT-114192', 'lorem. Donec elementum, lorem ut aliquam', 0),
(96, 'IT-114193', 'leo. Cras vehicula aliquet', 0),
(97, 'IT-114194', 'ante dictum mi, ac mattis velit justo', 0),
(98, 'IT-114195', 'laoreet posuere, enim nisl', 0),
(99, 'IT-114196', 'erat neque non quam.', 0),
(100, 'IT-114197', 'Nulla', 0),
(101, 'IT-114198', 'sit amet, faucibus', 0),
(102, 'IT-114199', 'id', 0),
(103, 'IT-114200', 'et tristique pellentesque, tellus sem', 0),
(104, 'IT-114201', 'eleifend nec, malesuada', 0),
(105, 'IT-114202', 'dolor dapibus gravida.', 0),
(106, 'IT-114203', 'at arcu. Vestibulum ante ipsum primis in faucibus orci luctus', 0),
(107, 'IT-114204', 'tempor diam dictum', 0),
(108, 'max-width: 200px;', 'aaaaaaaaaaaaaaaaaaaaa', 0);

-- --------------------------------------------------------

--
-- 資料表結構 `module`
--

CREATE TABLE `module` (
  `id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- 資料表的匯出資料 `module`
--

INSERT INTO `module` (`id`, `name`, `code`, `status`) VALUES
(1, 'Programming', 'IT1000', 0),
(2, 'Networking', 'IT2000', 0);

-- --------------------------------------------------------

--
-- 資料表結構 `module_sections`
--

CREATE TABLE `module_sections` (
  `id` int(11) NOT NULL,
  `module` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT '0',
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- 資料表的匯出資料 `module_sections`
--

INSERT INTO `module_sections` (`id`, `module`, `status`, `name`) VALUES
(1, 1, 0, 'Section A'),
(2, 1, 0, 'Section B'),
(3, 2, 0, 'section c');

-- --------------------------------------------------------

--
-- 資料表結構 `module_selections`
--

CREATE TABLE `module_selections` (
  `groupid` int(11) NOT NULL,
  `moduleid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- 資料表的匯出資料 `module_selections`
--

INSERT INTO `module_selections` (`groupid`, `moduleid`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- 資料表結構 `question`
--

CREATE TABLE `question` (
  `id` int(11) NOT NULL,
  `module` int(11) NOT NULL,
  `questionType` varchar(100) NOT NULL,
  `question` varchar(255) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- 資料表的匯出資料 `question`
--

INSERT INTO `question` (`id`, `module`, `questionType`, `question`, `status`) VALUES
(1, 1, 'multichoice', 'Outsource is a major factor that undercut the salary of IT jobs in Hong Kong', 0),
(2, 1, 'multichoice', 'Off-shore is a major factor for the shortage IT workforce in Hong Kong', 0),
(3, 1, 'multichoice', 'Globalization is one of the reason of rich-poor divided in the developed country', 0),
(4, 1, 'multichoice', 'Big remuneration gap for ITP is very common in the developed country', 0),
(5, 1, 'multichoice', 'To most of employers, technical competence of their staff is more important than morality', 0),
(6, 1, 'multichoice', 'CPD and professional membership status can guarantee the career path of an IT Professional.', 0),
(7, 1, 'multichoice', 'CPD is one of the keys to sustain the competitive advantage of an IT professional.', 0),
(8, 1, 'multichoice', 'Life Long Learning is equivalent to Continuous Professional Development to most of ITPs', 0),
(9, 1, 'multichoice', 'Many professional bodies have mandatory CPD hours for their members.', 0),
(10, 1, 'multichoice', 'Mentoring Higher Diploma students is an example of CPD for an ITP.', 0),
(11, 1, 'selection', 'It is considered illegal to use the Internet for private use while at work.', 0),
(12, 1, 'selection', 'All ethics principles that are universal, i.e. they are the same in every part of the world.', 0),
(13, 1, 'selection', 'Most ITPs would agree that the application of ethics in their field is more difficult than in other disciplines.', 0),
(14, 1, 'selection', 'Moral relativism is ethical principle focus on there is no absolute reference.', 0),
(15, 1, 'selection', 'Ethical standard is generally lower but boarder than legal standard.', 0),
(16, 1, 'selection', 'It is considered unethical to use the Internet for private use while at work.', 0),
(17, 1, 'selection', 'Corporate policies are examples of informal guidelines for ITP to make ethical decision.', 0),
(18, 1, 'selection', 'The two mandatory ethical guidelines for IT Professionals are sunshine test and reciprocal test.', 0),
(19, 1, 'selection', 'Hacking is considered ethical unless non-repairable damage to hardware or files has occurred.', 0),
(20, 1, 'selection', 'Moral relativism is ethical principle focus on there is no absolute reference.', 0);

-- --------------------------------------------------------

--
-- 資料表結構 `question_multichoice`
--

CREATE TABLE `question_multichoice` (
  `id` int(11) NOT NULL,
  `question` int(11) NOT NULL,
  `offeredAnswer` varchar(500) NOT NULL,
  `correctAnswer` varchar(500) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- 資料表的匯出資料 `question_multichoice`
--

INSERT INTO `question_multichoice` (`id`, `question`, `offeredAnswer`, `correctAnswer`, `status`) VALUES
(1, 1, 'True;False;All of above;None of above', 'True', 0),
(2, 2, 'True;False;All of above;None of above', 'False', 0),
(3, 3, 'True;False;All of above;None of above', 'True', 0),
(4, 4, 'True;False;All of above;None of above', 'True', 0),
(5, 5, 'True;False;All of above;None of above', 'False', 0),
(6, 6, 'True;False;All of above;None of above', 'False', 0),
(7, 7, 'True;False;All of above;None of above', 'True', 0),
(8, 8, 'True;False;All of above;None of above', 'False', 0),
(9, 9, 'True;False;All of above;None of above', 'True', 0),
(10, 10, 'True;False;All of above;None of above', 'True', 0);

-- --------------------------------------------------------

--
-- 資料表結構 `question_selection`
--

CREATE TABLE `question_selection` (
  `id` int(11) NOT NULL,
  `question` int(11) NOT NULL,
  `offeredAnswer` varchar(500) NOT NULL,
  `correctAnswer` varchar(500) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- 資料表的匯出資料 `question_selection`
--

INSERT INTO `question_selection` (`id`, `question`, `offeredAnswer`, `correctAnswer`, `status`) VALUES
(1, 11, 'True;False;All of above;None of above', 'False', 0),
(2, 12, 'True;False;All of above;None of above', 'False', 0),
(3, 13, 'True;False;All of above;None of above', 'True', 0),
(4, 14, 'True;False;All of above;None of above', 'True', 0),
(5, 15, 'True;False;All of above;None of above', 'False', 0),
(6, 16, 'True;False;All of above;None of above', 'True', 0),
(7, 17, 'True;False;All of above;None of above', 'False', 0),
(8, 18, 'True;False;All of above;None of above', 'False', 0),
(9, 19, 'True;False;All of above;None of above', 'False', 0),
(10, 20, 'True;False;All of above;None of above', 'True', 0);

-- --------------------------------------------------------

--
-- 資料表結構 `quiz`
--

CREATE TABLE `quiz` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `intro` varchar(255) DEFAULT NULL,
  `timeopen` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `timeclose` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `attempts` int(11) NOT NULL,
  `timelimit` int(11) DEFAULT NULL,
  `timecreated` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `status` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- 資料表的匯出資料 `quiz`
--

INSERT INTO `quiz` (`id`, `name`, `intro`, `timeopen`, `timeclose`, `attempts`, `timelimit`, `timecreated`, `status`) VALUES
(1, 'Quiz 1', '', '2007-09-23 02:10:10', '2007-09-23 02:00:00', 3, 120, '2018-01-08 05:16:00', 0),
(2, 'IT exam', '', '2007-09-23 02:10:10', '2007-09-23 02:10:00', 3, 120, '2018-01-08 05:16:00', 0),
(3, 'Network IQ test', '', '2007-09-23 02:10:10', '2007-09-23 02:10:00', 3, 120, '2018-01-08 05:16:00', 0);

-- --------------------------------------------------------

--
-- 資料表結構 `quiz_assignment`
--

CREATE TABLE `quiz_assignment` (
  `id` int(11) NOT NULL,
  `quiz` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `groups` int(11) DEFAULT NULL,
  `student` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- 資料表的匯出資料 `quiz_assignment`
--

INSERT INTO `quiz_assignment` (`id`, `quiz`, `type`, `groups`, `student`) VALUES
(1, 1, 'student', NULL, 3),
(2, 2, 'group', 1, NULL),
(3, 3, 'group', 2, NULL),
(4, 2, 'student', NULL, 3),
(5, 3, 'student', NULL, 3);

-- --------------------------------------------------------

--
-- 資料表結構 `quiz_question`
--

CREATE TABLE `quiz_question` (
  `id` int(11) NOT NULL,
  `quiz` int(11) NOT NULL,
  `question` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- 資料表的匯出資料 `quiz_question`
--

INSERT INTO `quiz_question` (`id`, `quiz`, `question`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 1, 4),
(5, 1, 5),
(6, 1, 6),
(7, 1, 7),
(8, 1, 8),
(9, 1, 9),
(10, 1, 10),
(11, 2, 11),
(12, 2, 12),
(13, 2, 13),
(14, 2, 14),
(15, 2, 15),
(16, 2, 16),
(17, 2, 17),
(18, 2, 18),
(19, 2, 19),
(20, 2, 20),
(21, 3, 1),
(22, 3, 12),
(23, 3, 3),
(24, 3, 14),
(25, 3, 5),
(26, 3, 16),
(27, 3, 7),
(28, 3, 18),
(29, 3, 9),
(30, 3, 20);

-- --------------------------------------------------------

--
-- 資料表結構 `resources`
--

CREATE TABLE `resources` (
  `id` int(11) NOT NULL,
  `category` int(11) NOT NULL,
  `section` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fileName` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `timeopen` timestamp NULL DEFAULT NULL,
  `timeclose` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- 資料表結構 `student_quiz`
--

CREATE TABLE `student_quiz` (
  `id` int(11) NOT NULL,
  `quiz` int(11) NOT NULL,
  `student` int(11) NOT NULL,
  `mark` int(11) NOT NULL,
  `attempt` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- 資料表的匯出資料 `student_quiz`
--

INSERT INTO `student_quiz` (`id`, `quiz`, `student`, `mark`, `attempt`) VALUES
(23, 1, 3, 3, 1),
(24, 1, 3, 10, 2),
(25, 2, 3, 10, 1),
(26, 3, 3, 2, 1);

-- --------------------------------------------------------

--
-- 資料表結構 `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `firstname` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `usergroup` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- 資料表的匯出資料 `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `firstname`, `lastname`, `roles`, `status`, `usergroup`) VALUES
(1, '123', '123', '1234', '1234', 0, 0, 5),
(3, '234', '234', 'student', 'account', 1, 0, 1),
(6, 'peter', 'peter', 'Peter', 'Chan', 1, 0, 5),
(20, 'Peter2', 'Peter2', 'Peter', 'Chan', 0, 0, 5),
(42, 'hello', 'hello', '123', '12', 0, 0, 5),
(63, 'qwe', 'qwe', 'qwe', 'qwe', 0, 0, 5),
(64, 'adasdsaa', 'adasdsaa', 'adasda', 'asdasdsad', 1, 0, 5),
(66, '12312', '12312', '3213123121', '123123', 0, 0, 5),
(67, '1231231221121', '1231231221121', '12312', '1313', 0, 0, 5),
(68, '123123223223', '123123223223', '1233312', '123123123213312', 0, 0, 5),
(70, 'qqq', 'qqq', '', '', 0, 0, 5),
(72, 'Peter334', 'Peter334', '213', '12321', 0, 0, 5),
(73, 'asdsadasdsdas', 'asdsadasdsdas', 'asdad', 'qa', 0, 0, 5),
(74, 'adasdasdsakasdnkdfslkfdskjldsfklj', 'adasdasdsakasdnkdfslkfdskjldsfklj', 'lkjsdlkj', 'kljjkljkl', 0, 0, 5),
(76, '100', '100', 'Eaton', 'Dillard', 1, 0, 5),
(77, '101', '101', 'Justin', 'Johnson', 1, 0, 5),
(78, '102', '102', 'Edward', 'Collins', 1, 0, 5),
(79, '103', '103', 'Baker', 'Frazier', 1, 0, 5),
(80, '104', '104', 'Nash', 'Rowland', 0, 0, 5),
(81, '105', '105', 'Keaton', 'Hull', 0, 0, 5),
(82, '106', '106', 'Herman', 'Martinez', 1, 0, 5),
(83, '107', '107', 'Brian', 'Long', 0, 0, 5),
(84, '108', '108', 'Phillip', 'Peters', 0, 0, 5),
(85, '109', '109', 'Cadman', 'Barker', 1, 0, 5),
(86, '110', '110', 'Jelani', 'Pratt', 0, 0, 5),
(87, '111', '111', 'Kennedy', 'Cherry', 0, 0, 5),
(88, '112', '112', 'Nicholas', 'Roach', 1, 0, 5),
(89, '113', '113', 'Philip', 'Sampson', 0, 0, 5),
(90, '114', '114', 'Jasper', 'Bradley', 0, 0, 5),
(91, '115', '115', 'Ethan', 'Griffin', 0, 0, 5),
(92, '116', '116', 'Wing', 'Valenzuela', 1, 0, 5),
(93, '117', '117', 'Chase', 'Gonzales', 1, 0, 5),
(94, '118', '118', 'Lane', 'Tyler', 1, 0, 5),
(95, '119', '119', 'Guy', 'Hughes', 1, 0, 5),
(96, '120', '120', 'Camden', 'Burks', 0, 0, 5),
(97, '121', '121', 'Paki', 'Mckee', 0, 0, 5),
(98, '122', '122', 'Holmes', 'Arnold', 0, 0, 5),
(100, '124', '124', 'Eaton', 'Ball', 1, 0, 0),
(101, '125', '125', 'Hamilton', 'Perry', 0, 0, 0),
(102, '126', '126', 'Caldwell', 'Conner', 1, 0, 0),
(103, '127', '127', 'Maxwell', 'Shaffer', 0, 0, 0),
(104, '128', '128', 'Hector', 'Fitzpatrick', 1, 0, 0),
(105, '129', '129', 'Silas', 'Edwards', 1, 0, 0),
(106, '130', '130', 'Zachary', 'Raymond', 0, 0, 0),
(107, '131', '131', 'Len', 'Ramirez', 0, 0, 0),
(108, '132', '132', 'Emmanuel', 'Sexton', 1, 0, 0),
(109, '133', '133', 'Dane', 'George', 0, 0, 0),
(110, '134', '134', 'Keegan', 'Huber', 1, 0, 0),
(111, '135', '135', 'Daquan', 'Fields', 1, 0, 0),
(112, '136', '136', 'Amos', 'Daniel', 1, 0, 0),
(113, '137', '137', 'Beau', 'Sherman', 1, 0, 0),
(114, '138', '138', 'Wang', 'Carrillo', 1, 0, 0),
(115, '139', '139', 'Adrian', 'Frank', 1, 0, 0),
(116, '140', '140', 'Christopher', 'Pitts', 1, 0, 0),
(117, '141', '141', 'Nicholas', 'James', 0, 0, 0),
(118, '142', '142', 'Odysseus', 'Harding', 0, 0, 0),
(119, '143', '143', 'Owen', 'Schwartz', 0, 0, 0),
(120, '144', '144', 'Jacob', 'Ferguson', 1, 0, 0),
(121, '145', '145', 'Kaseem', 'Shaffer', 0, 0, 0),
(122, '146', '146', 'Boris', 'Mosley', 1, 0, 0),
(123, '147', '147', 'Kenyon', 'Trevino', 1, 0, 0),
(124, '148', '148', 'Lucas', 'Page', 1, 0, 0),
(125, '149', '149', 'Arsenio', 'Small', 1, 0, 0),
(126, '150', '150', 'Kennedy', 'Knight', 1, 0, 0),
(177, '151', '151', 'Gareth', 'Workman', 0, 0, 0),
(206, '152', '152', 'Gareth', 'Porter', 0, 0, 0),
(207, '153', '153', 'Vaughan', 'Velasquez', 0, 0, 0),
(208, '154', '154', 'Keane', 'King', 1, 0, 0),
(209, '155', '155', 'Jerome', 'Thomas', 0, 0, 0),
(210, '156', '156', 'Zahir', 'King', 1, 0, 0),
(211, '157', '157', 'Lance', 'Richardson', 1, 0, 0),
(212, '158', '158', 'Hakeem', 'Simpson', 0, 0, 0),
(213, '159', '159', 'Clarke', 'Phelps', 0, 0, 0),
(214, '160', '160', 'Clark', 'Adams', 1, 0, 0),
(215, '161', '161', 'Oren', 'Figueroa', 0, 0, 0),
(216, '162', '162', 'Orson', 'Ray', 1, 0, 0),
(217, '163', '163', 'Dylan', 'Glass', 0, 0, 0),
(218, '164', '164', 'Hyatt', 'Stewart', 0, 0, 0),
(219, '165', '165', 'Chandler', 'Bradley', 1, 0, 0),
(220, '166', '166', 'Carlos', 'Chandler', 1, 0, 0),
(221, '167', '167', 'Fulton', 'Wilkins', 1, 0, 0),
(222, '168', '168', 'Chandler', 'Goff', 0, 0, 0),
(223, '169', '169', 'Kennedy', 'Best', 1, 0, 0),
(224, '170', '170', 'Harlan', 'Juarez', 0, 0, 0),
(225, '171', '171', 'Levi', 'Vasquez', 1, 0, 0),
(226, '172', '172', 'Carlos', 'Buckner', 0, 0, 0),
(227, '173', '173', 'Kelly', 'Cruz', 1, 0, 0),
(228, '174', '174', 'Denton', 'Stout', 1, 0, 0),
(229, '185', '185', 'Evan', 'Burgess', 0, 0, 0),
(230, '186', '186', 'Byron', 'Charles', 1, 0, 0),
(231, '187', '187', 'Clayton', 'Carrillo', 0, 0, 0),
(232, '188', '188', 'Jeremy', 'Ayers', 0, 0, 0),
(233, '189', '189', 'Alden', 'Estes', 1, 0, 0),
(234, '190', '190', 'Slade', 'Lucas', 0, 0, 0),
(235, '191', '191', 'Sawyer', 'Odom', 0, 0, 0),
(236, '192', '192', 'Honorato', 'Jennings', 0, 0, 0),
(237, '193', '193', 'Wayne', 'Lambert', 0, 0, 0),
(238, '194', '194', 'Ulric', 'Marsh', 0, 0, 0),
(239, '195', '195', 'Alan', 'Hoover', 0, 0, 0),
(240, '196', '196', 'Len', 'Schultz', 1, 0, 0),
(241, '197', '197', 'Tad', 'Pierce', 1, 0, 0),
(242, '198', '198', 'Nasim', 'Welch', 1, 0, 0),
(243, '199', '199', 'Colt', 'Gilmore', 1, 0, 0),
(244, '200', '200', 'Malachi', 'Floyd', 0, 0, 0),
(245, '201', '201', 'Malcolm', 'Bass', 0, 0, 0),
(246, '202', '202', 'Dane', 'Hanson', 1, 0, 0),
(247, '203', '203', 'Ezra', 'Mays', 1, 0, 0),
(248, '204', '204', 'Kirk', 'Lynn', 0, 0, 0),
(249, '205', '205', 'Yoshio', 'Hays', 1, 0, 0),
(250, '206', '206', 'Quamar', 'Waller', 0, 0, 0),
(251, '207', '207', 'Louis', 'Clements', 0, 0, 0),
(252, '208', '208', 'Salvador', 'Bentley', 0, 0, 0),
(253, '209', '209', 'Ira', 'Flores', 0, 0, 0),
(254, '210', '210', 'Finn', 'Dodson', 0, 0, 0),
(255, '211', '211', 'Tyler', 'Wade', 0, 0, 0),
(256, '212', '212', 'Slade', 'Conley', 1, 0, 0),
(257, '213', '213', 'Porter', 'Francis', 0, 0, 0),
(258, '214', '214', 'Dominic', 'Langley', 0, 0, 0),
(259, '215', '215', 'Amir', 'Guzman', 1, 0, 0),
(260, '216', '216', 'Ray', 'Fisher', 0, 0, 0),
(261, '217', '217', 'Hoyt', 'Blackwell', 1, 0, 0),
(262, '218', '218', 'Kaseem', 'Small', 0, 0, 0),
(263, '219', '219', 'Rogan', 'Fulton', 1, 0, 0),
(264, '220', '220', 'Herman', 'Jennings', 1, 0, 0),
(265, '221', '221', 'Baxter', 'Boone', 0, 0, 0),
(266, '222', '222', 'Connor', 'Duncan', 0, 0, 0),
(267, '223', '223', 'Elvis', 'Cote', 0, 0, 0),
(268, '224', '224', 'Curran', 'Wilson', 0, 0, 0),
(269, '225', '225', 'Devin', 'Kirkland', 0, 0, 0),
(270, '226', '226', 'Gage', 'Rocha', 1, 0, 0),
(271, '227', '227', 'Dean', 'Mcdowell', 1, 0, 0),
(272, '228', '228', 'Gabriel', 'Ray', 1, 0, 0),
(273, '229', '229', 'Dexter', 'Stout', 0, 0, 0),
(274, '230', '230', 'Arsenio', 'Gordon', 1, 0, 0),
(275, '231', '231', 'Macon', 'Holland', 1, 0, 0),
(276, '232', '232', 'Cullen', 'Clarke', 0, 0, 0),
(277, '233', '233', 'Griffin', 'Ochoa', 0, 0, 0),
(279, '235', '235', 'Prescott', 'Buck', 1, 0, 0),
(280, '241', '241', 'Jin', 'Ramsey', 1, 0, 0),
(281, '242', '242', 'Vaughan', 'Haley', 0, 0, 0),
(282, '243', '243', 'Kenneth', 'Lindsey', 1, 0, 0),
(283, '244', '244', 'Cullen', 'Rivers', 0, 0, 0),
(284, '245', '245', 'Oren', 'Patton', 1, 0, 0),
(285, '246', '246', 'Jakeem', 'Hartman', 0, 0, 0),
(286, '247', '247', 'Charles', 'Brennan', 1, 0, 0),
(287, '248', '248', 'Yoshio', 'Ashley', 0, 0, 0),
(288, '249', '249', 'Connor', 'Gates', 1, 0, 0),
(289, '250', '250', 'Victor', 'Butler', 0, 0, 0),
(290, '251', '251', 'Branden', 'Campos', 1, 0, 0),
(291, '252', '252', 'Ryan', 'Gaines', 1, 0, 0),
(292, '253', '253', 'Kareem', 'Hurley', 0, 0, 0),
(293, '254', '254', 'Raja', 'Herman', 0, 0, 0),
(294, '255', '255', 'Hector', 'Foreman', 1, 0, 0),
(295, '256', '256', 'Galvin', 'Rasmussen', 1, 0, 0),
(296, '257', '257', 'Jamal', 'English', 0, 0, 0),
(297, '258', '258', 'Jared', 'Wagner', 0, 0, 0),
(298, '259', '259', 'Buckminster', 'Shields', 1, 0, 0),
(299, '260', '260', 'Simon', 'Barr', 1, 0, 0),
(300, '261', '261', 'Bert', 'Page', 1, 0, 0),
(301, '262', '262', 'Graiden', 'Hart', 1, 0, 0),
(302, '263', '263', 'Walker', 'Macias', 0, 0, 0),
(303, '264', '264', 'Caleb', 'Rollins', 0, 0, 0),
(304, '265', '265', 'Donovan', 'Rosa', 1, 0, 0),
(305, '266', '266', 'Justin', 'Garrett', 0, 0, 0),
(306, '267', '267', 'Nolan', 'Warner', 0, 0, 0),
(307, '268', '268', 'Avram', 'Cameron', 0, 0, 0),
(308, '269', '269', 'Amir', 'Herring', 1, 0, 0),
(309, '270', '270', 'Felix', 'Sparks', 0, 0, 0),
(310, '271', '271', 'Neville', 'Obrien', 0, 0, 0),
(311, '272', '272', 'Valentine', 'Jacobs', 1, 0, 0),
(312, '273', '273', 'Wyatt', 'Middleton', 1, 0, 0),
(313, '274', '274', 'Wallace', 'Parrish', 1, 0, 0),
(314, '275', '275', 'Joel', 'Roberson', 1, 0, 0),
(315, '276', '276', 'Russell', 'Henson', 0, 0, 0),
(316, '277', '277', 'August', 'Hale', 1, 0, 0),
(317, '278', '278', 'Kadeem', 'Beasley', 0, 0, 0),
(318, '279', '279', 'Cole', 'Beasley', 1, 0, 0),
(319, '280', '280', 'Daquan', 'Bentley', 0, 0, 0),
(320, '281', '281', 'Thaddeus', 'Barlow', 0, 0, 0),
(321, '282', '282', 'Oscar', 'Gaines', 1, 0, 0),
(322, '283', '283', 'Elton', 'Horn', 0, 0, 0),
(323, '284', '284', 'Bruno', 'Brock', 0, 0, 0),
(324, '285', '285', 'Addison', 'York', 0, 0, 0),
(325, '286', '286', 'Brady', 'Duncan', 0, 0, 0),
(326, '287', '287', 'Oscar', 'Mccullough', 0, 0, 0),
(327, '288', '288', 'Nasim', 'Trevino', 1, 0, 0),
(328, '289', '289', 'Jin', 'Cross', 1, 0, 0),
(329, '290', '290', 'Reese', 'Carroll', 0, 0, 0),
(330, '291', '291', 'Conan', 'Levy', 0, 0, 0),
(331, '292', '292', 'Jerome', 'Boyd', 0, 0, 0),
(332, '293', '293', 'Kibo', 'Blair', 1, 0, 0),
(333, '294', '294', 'Evan', 'Morrow', 1, 0, 0),
(334, '295', '295', 'Merritt', 'Mccormick', 0, 0, 0),
(335, '296', '296', 'William', 'Roberts', 0, 0, 0),
(336, '297', '297', 'Lee', 'Fowler', 0, 0, 0),
(337, '298', '298', 'Harlan', 'Hester', 0, 0, 0),
(338, '299', '299', 'Edan', 'Cochran', 1, 0, 0),
(339, '300', '300', 'Price', 'Foreman', 1, 0, 0),
(340, '301', '301', 'Amal', 'Peck', 0, 0, 0),
(341, '302', '302', 'Shad', 'Emerson', 1, 0, 0),
(342, '303', '303', 'Connor', 'Dorsey', 0, 0, 0),
(343, '304', '304', 'Steven', 'Curry', 1, 0, 0),
(344, '305', '305', 'Grant', 'Campos', 1, 0, 0),
(345, '306', '306', 'Mason', 'Hayden', 0, 0, 0),
(346, '307', '307', 'Kennedy', 'Schmidt', 1, 0, 0),
(347, '308', '308', 'Sylvester', 'Hurst', 0, 0, 0),
(348, '309', '309', 'Richard', 'Robinson', 1, 0, 0),
(349, '310', '310', 'Marshall', 'Russell', 1, 0, 0),
(350, '311', '311', 'Travis', 'Stout', 0, 0, 0),
(351, '312', '312', 'Tate', 'Alexander', 0, 0, 0),
(352, '313', '313', 'Reece', 'Rosario', 0, 0, 0),
(353, '314', '314', 'Nehru', 'Adams', 1, 0, 0),
(354, '315', '315', 'Berk', 'Puckett', 1, 0, 0),
(355, '316', '316', 'Jonas', 'Elliott', 0, 0, 0),
(356, '317', '317', 'Vincent', 'Vance', 1, 0, 0),
(357, '318', '318', 'Keegan', 'Oconnor', 1, 0, 0),
(358, '319', '319', 'Jackson', 'Brock', 0, 0, 0),
(359, '320', '320', 'Emmanuel', 'Dennis', 1, 0, 0),
(360, '321', '321', 'Kasimir', 'Meyers', 1, 0, 0),
(361, '322', '322', 'Forrest', 'Richard', 0, 0, 0),
(362, '323', '323', 'Ralph', 'Noble', 1, 0, 0),
(363, '324', '324', 'Wang', 'Hendricks', 0, 0, 0),
(364, '325', '325', 'Jin', 'Erickson', 1, 0, 0),
(365, '326', '326', 'Kenneth', 'Brady', 1, 0, 0),
(366, '327', '327', 'Kyle', 'Newman', 0, 0, 0),
(367, '328', '328', 'Clarke', 'Haney', 0, 0, 0),
(368, '329', '329', 'Gray', 'Lindsay', 0, 0, 0),
(369, '330', '330', 'Lane', 'Price', 1, 0, 0),
(370, '331', '331', 'Connor', 'Watts', 1, 0, 0),
(371, '332', '332', 'Jakeem', 'Jacobson', 1, 0, 0),
(372, '333', '333', 'Kieran', 'Donaldson', 0, 0, 0),
(373, '334', '334', 'Quentin', 'Compton', 0, 0, 0),
(374, '335', '335', 'Omar', 'Kaufman', 1, 0, 0),
(375, '336', '336', 'Tyler', 'Davis', 0, 0, 0),
(376, '337', '337', 'Ezekiel', 'Stevens', 1, 0, 0),
(377, '338', '338', 'Byron', 'Booker', 1, 0, 0),
(378, '339', '339', 'Jerome', 'Wilkinson', 1, 0, 0),
(379, '340', '340', 'Fulton', 'Erickson', 1, 0, 0),
(380, '341', '341', 'Ezra', 'Martinez', 1, 0, 0),
(381, '342', '342', 'Norman', 'Gillespie', 1, 0, 0),
(382, '343', '343', 'Merritt', 'Logan', 0, 0, 0),
(383, '344', '344', 'Lucas', 'Mcintosh', 0, 0, 0),
(384, '345', '345', 'Cameron', 'Flynn', 1, 0, 0),
(385, '346', '346', 'Maxwell', 'Allen', 0, 0, 0),
(386, '347', '347', 'Otto', 'Mendoza', 1, 0, 0),
(387, '348', '348', 'Barrett', 'Johnson', 1, 0, 0),
(388, '349', '349', 'Gil', 'Kelley', 0, 0, 0),
(389, '350', '350', 'Micah', 'Huber', 0, 0, 0),
(390, '351', '351', 'Benedict', 'Gilbert', 0, 0, 0),
(391, '352', '352', 'Allen', 'Bird', 1, 0, 0),
(392, '353', '353', 'Lucian', 'Albert', 1, 0, 0),
(393, '354', '354', 'Mason', 'Malone', 0, 0, 0),
(394, '355', '355', 'Jackson', 'Richard', 0, 0, 0),
(395, '356', '356', 'Jerry', 'Barr', 1, 0, 0),
(396, '357', '357', 'Graham', 'Tillman', 0, 0, 0),
(397, '358', '358', 'Blake', 'Hernandez', 1, 0, 0),
(398, '359', '359', 'Samson', 'Kidd', 0, 0, 0),
(399, '360', '360', 'Nicholas', 'Warner', 1, 0, 0),
(400, '361', '361', 'Samson', 'Johnson', 1, 0, 0),
(401, '362', '362', 'Rogan', 'Spears', 1, 0, 0),
(402, '363', '363', 'Demetrius', 'Mccarthy', 0, 0, 0),
(403, '364', '364', 'Slade', 'Bridges', 1, 0, 0),
(404, '365', '365', 'Murphy', 'Fleming', 1, 0, 0),
(405, '366', '366', 'Castor', 'Smith', 1, 0, 0),
(406, '367', '367', 'Kieran', 'Campos', 0, 0, 0),
(407, '368', '368', 'Benjamin', 'Oneal', 1, 0, 0),
(408, '369', '369', 'Clayton', 'Lynn', 0, 0, 0),
(409, '370', '370', 'Hall', 'Sosa', 0, 0, 0),
(410, '371', '371', 'Blaze', 'Bartlett', 1, 0, 0),
(411, '372', '372', 'Malik', 'Mcmahon', 0, 0, 0),
(412, '373', '373', 'Harper', 'Suarez', 0, 0, 0),
(413, '374', '374', 'Abdul', 'Booker', 1, 0, 0),
(414, '375', '375', 'Chadwick', 'Bernard', 0, 0, 0),
(415, '376', '376', 'Jerome', 'Dickerson', 0, 0, 0),
(416, '377', '377', 'Kaseem', 'Donaldson', 1, 0, 0),
(417, '378', '378', 'Hyatt', 'Poole', 1, 0, 0),
(418, '379', '379', 'Ali', 'Greene', 1, 0, 0),
(419, '380', '380', 'Hyatt', 'Porter', 1, 0, 0),
(420, '381', '381', 'Patrick', 'Lynn', 1, 0, 0),
(421, '382', '382', 'Oscar', 'Ellison', 0, 0, 0),
(422, '383', '383', 'Hiram', 'Haley', 1, 0, 0),
(423, '384', '384', 'Paul', 'Sweeney', 1, 0, 0),
(424, '385', '385', 'Blake', 'Douglas', 1, 0, 0),
(425, '386', '386', 'Dorian', 'Puckett', 1, 0, 0),
(426, '387', '387', 'Eaton', 'Eaton', 0, 0, 0),
(427, '388', '388', 'George', 'Ferguson', 1, 0, 0),
(428, '389', '389', 'Hashim', 'Giles', 0, 0, 0),
(429, '390', '390', 'Ray', 'Wooten', 0, 0, 0),
(430, '391', '391', 'Ahmed', 'Warner', 1, 0, 0),
(431, '392', '392', 'Raphael', 'Martinez', 0, 0, 0),
(432, '393', '393', 'Wyatt', 'Mathews', 1, 0, 0),
(433, '394', '394', 'Christopher', 'Norris', 0, 0, 0),
(434, '395', '395', 'Robert', 'Franco', 1, 0, 0),
(435, '396', '396', 'Oren', 'Adkins', 0, 0, 0),
(436, '397', '397', 'Hayden', 'Porter', 0, 0, 0),
(437, '398', '398', 'Damian', 'Stark', 1, 0, 0),
(438, '399', '399', 'Griffith', 'Marsh', 0, 0, 0),
(439, '', '', '', '', 0, 0, 0),
(440, 'Fuck', 'Fuck', 'Fuck', 'You', 0, 0, 0),
(441, 'Fuck2', 'Fuck2', 'Fuck', 'You', 0, 0, 0),
(442, 'TestCase1', 'TestCase1', 'Test', 'Case', 1, 0, 0),
(443, 'TestCase2', 'TestCase2', 'Test', 'Case2', 0, 0, 0),
(444, 'sdfs', 'sdfs', 'sdsd', 'sdfsdf', 0, 0, 0),
(445, 'TestCase3', 'TestCase3', 'Test', 'Case3', 1, 0, 5),
(446, 'aa', 'aaaaaaaaaaaaaaaaaaaaaa', 'aaaaaaaa', 'aaaa', 0, 0, 17),
(447, 'aaaaaaaaaaa', 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'aaaaaaaaaaaaaaaaaaa', 'aaaaaaaaaaaaaaaaaaaaaa', 0, 0, 0),
(448, 'admin', 'admin', 'admin', 'admin', 0, 0, 2);

--
-- 已匯出資料表的索引
--

--
-- 資料表索引 `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- 資料表索引 `module`
--
ALTER TABLE `module`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `name` (`name`) USING BTREE;

--
-- 資料表索引 `module_sections`
--
ALTER TABLE `module_sections`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `module` (`module`) USING BTREE;

--
-- 資料表索引 `module_selections`
--
ALTER TABLE `module_selections`
  ADD PRIMARY KEY (`groupid`,`moduleid`) USING BTREE,
  ADD KEY `moduleid` (`moduleid`) USING BTREE;

--
-- 資料表索引 `question`
--
ALTER TABLE `question`
  ADD PRIMARY KEY (`id`),
  ADD KEY `module` (`module`);

--
-- 資料表索引 `question_multichoice`
--
ALTER TABLE `question_multichoice`
  ADD PRIMARY KEY (`id`),
  ADD KEY `question` (`question`);

--
-- 資料表索引 `question_selection`
--
ALTER TABLE `question_selection`
  ADD PRIMARY KEY (`id`),
  ADD KEY `question` (`question`);

--
-- 資料表索引 `quiz`
--
ALTER TABLE `quiz`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `quiz_assignment`
--
ALTER TABLE `quiz_assignment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `quiz` (`quiz`),
  ADD KEY `groups` (`groups`),
  ADD KEY `student` (`student`);

--
-- 資料表索引 `quiz_question`
--
ALTER TABLE `quiz_question`
  ADD PRIMARY KEY (`id`),
  ADD KEY `quiz` (`quiz`),
  ADD KEY `question` (`question`);

--
-- 資料表索引 `resources`
--
ALTER TABLE `resources`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- 資料表索引 `student_quiz`
--
ALTER TABLE `student_quiz`
  ADD PRIMARY KEY (`id`),
  ADD KEY `quiz` (`quiz`),
  ADD KEY `student` (`student`);

--
-- 資料表索引 `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `username` (`username`) USING BTREE;

--
-- 在匯出的資料表使用 AUTO_INCREMENT
--

--
-- 使用資料表 AUTO_INCREMENT `groups`
--
ALTER TABLE `groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=109;
--
-- 使用資料表 AUTO_INCREMENT `module`
--
ALTER TABLE `module`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- 使用資料表 AUTO_INCREMENT `module_sections`
--
ALTER TABLE `module_sections`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- 使用資料表 AUTO_INCREMENT `question`
--
ALTER TABLE `question`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- 使用資料表 AUTO_INCREMENT `question_multichoice`
--
ALTER TABLE `question_multichoice`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- 使用資料表 AUTO_INCREMENT `question_selection`
--
ALTER TABLE `question_selection`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- 使用資料表 AUTO_INCREMENT `quiz`
--
ALTER TABLE `quiz`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- 使用資料表 AUTO_INCREMENT `quiz_assignment`
--
ALTER TABLE `quiz_assignment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- 使用資料表 AUTO_INCREMENT `quiz_question`
--
ALTER TABLE `quiz_question`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;
--
-- 使用資料表 AUTO_INCREMENT `resources`
--
ALTER TABLE `resources`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- 使用資料表 AUTO_INCREMENT `student_quiz`
--
ALTER TABLE `student_quiz`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;
--
-- 使用資料表 AUTO_INCREMENT `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=450;
--
-- 已匯出資料表的限制(Constraint)
--

--
-- 資料表的 Constraints `module_sections`
--
ALTER TABLE `module_sections`
  ADD CONSTRAINT `module_sections_ibfk_1` FOREIGN KEY (`module`) REFERENCES `module` (`id`);

--
-- 資料表的 Constraints `module_selections`
--
ALTER TABLE `module_selections`
  ADD CONSTRAINT `module_selections_ibfk_1` FOREIGN KEY (`groupid`) REFERENCES `groups` (`id`),
  ADD CONSTRAINT `module_selections_ibfk_2` FOREIGN KEY (`moduleid`) REFERENCES `module` (`id`);

--
-- 資料表的 Constraints `question`
--
ALTER TABLE `question`
  ADD CONSTRAINT `question_ibfk_1` FOREIGN KEY (`module`) REFERENCES `module` (`id`);

--
-- 資料表的 Constraints `question_multichoice`
--
ALTER TABLE `question_multichoice`
  ADD CONSTRAINT `question_multichoice_ibfk_1` FOREIGN KEY (`question`) REFERENCES `question` (`id`);

--
-- 資料表的 Constraints `question_selection`
--
ALTER TABLE `question_selection`
  ADD CONSTRAINT `question_selection_ibfk_1` FOREIGN KEY (`question`) REFERENCES `question` (`id`);

--
-- 資料表的 Constraints `quiz_assignment`
--
ALTER TABLE `quiz_assignment`
  ADD CONSTRAINT `quiz_assignment_ibfk_1` FOREIGN KEY (`quiz`) REFERENCES `quiz` (`id`),
  ADD CONSTRAINT `quiz_assignment_ibfk_2` FOREIGN KEY (`groups`) REFERENCES `groups` (`id`),
  ADD CONSTRAINT `quiz_assignment_ibfk_3` FOREIGN KEY (`student`) REFERENCES `user` (`id`);

--
-- 資料表的 Constraints `quiz_question`
--
ALTER TABLE `quiz_question`
  ADD CONSTRAINT `quiz_question_ibfk_1` FOREIGN KEY (`quiz`) REFERENCES `quiz` (`id`),
  ADD CONSTRAINT `quiz_question_ibfk_2` FOREIGN KEY (`question`) REFERENCES `question` (`id`);

--
-- 資料表的 Constraints `student_quiz`
--
ALTER TABLE `student_quiz`
  ADD CONSTRAINT `student_quiz_ibfk_1` FOREIGN KEY (`quiz`) REFERENCES `quiz` (`id`),
  ADD CONSTRAINT `student_quiz_ibfk_2` FOREIGN KEY (`student`) REFERENCES `user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
