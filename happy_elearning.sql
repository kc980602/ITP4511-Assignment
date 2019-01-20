/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50720
 Source Host           : localhost:3306
 Source Schema         : happy_elearning

 Target Server Type    : MySQL
 Target Server Version : 50720
 File Encoding         : 65001

 Date: 06/01/2018 05:34:57
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for groups
-- ----------------------------
DROP TABLE IF EXISTS `groups`;
CREATE TABLE `groups`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(510) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 109 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of groups
-- ----------------------------
INSERT INTO `groups` VALUES (1, 'TestCase001', 'Fucking SE@', 1);
INSERT INTO `groups` VALUES (2, 'qweq', 'wewe', 0);
INSERT INTO `groups` VALUES (3, 'wqew', 'wew', 0);
INSERT INTO `groups` VALUES (4, 'qweqwe', 'qweqewewe', 0);
INSERT INTO `groups` VALUES (5, 'qwe', 'ewewewew', 0);
INSERT INTO `groups` VALUES (6, 'xvxc', 'qqqqqqqq', 0);
INSERT INTO `groups` VALUES (7, 'sdsd', 'Unf', 0);
INSERT INTO `groups` VALUES (8, 'IT-114105', 'volutpat. Nulla facilisis. Suspendisse commodo tincidunt nibh. Phasellus nulla. Integer', 0);
INSERT INTO `groups` VALUES (9, 'IT-114106', 'Sed eget lacus. Mauris non dui nec urna', 0);
INSERT INTO `groups` VALUES (10, 'IT-114107', 'Cras vulputate velit', 0);
INSERT INTO `groups` VALUES (11, 'IT-114108', 'risus. Nulla eget metus eu erat', 0);
INSERT INTO `groups` VALUES (12, 'IT-114109', 'orci, adipiscing non, luctus sit amet, faucibus ut,', 0);
INSERT INTO `groups` VALUES (13, 'IT-114110', 'nunc sit amet metus. Aliquam erat', 0);
INSERT INTO `groups` VALUES (14, 'IT-114111', 'Maecenas iaculis aliquet diam. Sed', 0);
INSERT INTO `groups` VALUES (15, 'IT-114112', 'purus. Nullam scelerisque neque sed sem', 0);
INSERT INTO `groups` VALUES (16, 'IT-114113', 'mi, ac mattis velit justo nec ante. Maecenas', 0);
INSERT INTO `groups` VALUES (17, 'IT-114114', 'vitae velit egestas lacinia. Sed', 0);
INSERT INTO `groups` VALUES (18, 'IT-114115', 'dolor sit amet, consectetuer adipiscing elit. Etiam laoreet, libero', 0);
INSERT INTO `groups` VALUES (19, 'IT-114116', 'Mauris quis turpis vitae', 0);
INSERT INTO `groups` VALUES (20, 'IT-114117', 'ut erat. Sed nunc', 0);
INSERT INTO `groups` VALUES (21, 'IT-114118', 'leo elementum sem,', 0);
INSERT INTO `groups` VALUES (22, 'IT-114119', 'pulvinar arcu et pede. Nunc', 0);
INSERT INTO `groups` VALUES (23, 'IT-114120', 'nibh sit amet', 0);
INSERT INTO `groups` VALUES (24, 'IT-114121', 'libero est, congue a, aliquet vel, vulputate eu, odio.', 0);
INSERT INTO `groups` VALUES (25, 'IT-114122', 'orci. Donec nibh. Quisque nonummy ipsum non', 0);
INSERT INTO `groups` VALUES (26, 'IT-114123', 'nec tellus.', 0);
INSERT INTO `groups` VALUES (27, 'IT-114124', 'et, rutrum eu, ultrices sit amet,', 0);
INSERT INTO `groups` VALUES (28, 'IT-114125', 'ipsum. Phasellus vitae mauris sit amet lorem', 0);
INSERT INTO `groups` VALUES (29, 'IT-114126', 'est, congue a,', 0);
INSERT INTO `groups` VALUES (30, 'IT-114127', 'urna convallis erat, eget tincidunt dui augue eu tellus. Phasellus', 0);
INSERT INTO `groups` VALUES (31, 'IT-114128', 'nec ligula consectetuer', 0);
INSERT INTO `groups` VALUES (32, 'IT-114129', 'Curabitur vel lectus. Cum sociis', 0);
INSERT INTO `groups` VALUES (33, 'IT-114130', 'sodales purus, in molestie tortor', 0);
INSERT INTO `groups` VALUES (34, 'IT-114131', 'consequat, lectus sit amet luctus vulputate, nisi', 0);
INSERT INTO `groups` VALUES (35, 'IT-114132', 'aliquet nec, imperdiet nec,', 0);
INSERT INTO `groups` VALUES (36, 'IT-114133', 'sem semper erat, in consectetuer ipsum nunc id enim. Curabitur', 0);
INSERT INTO `groups` VALUES (37, 'IT-114134', 'fames ac turpis egestas.', 0);
INSERT INTO `groups` VALUES (38, 'IT-114135', 'magna. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.', 0);
INSERT INTO `groups` VALUES (39, 'IT-114136', 'Fusce fermentum fermentum', 0);
INSERT INTO `groups` VALUES (40, 'IT-114137', 'in', 0);
INSERT INTO `groups` VALUES (41, 'IT-114138', 'massa. Vestibulum accumsan neque et nunc. Quisque', 0);
INSERT INTO `groups` VALUES (42, 'IT-114139', 'aliquam adipiscing lacus. Ut nec urna et arcu imperdiet ullamcorper.', 0);
INSERT INTO `groups` VALUES (43, 'IT-114140', 'porta elit, a feugiat tellus lorem eu metus. In', 0);
INSERT INTO `groups` VALUES (44, 'IT-114141', 'lorem tristique aliquet. Phasellus fermentum', 0);
INSERT INTO `groups` VALUES (45, 'IT-114142', 'Suspendisse commodo tincidunt nibh. Phasellus nulla. Integer vulputate,', 0);
INSERT INTO `groups` VALUES (46, 'IT-114143', 'egestas. Duis ac arcu.', 0);
INSERT INTO `groups` VALUES (47, 'IT-114144', 'Nunc laoreet lectus quis massa. Mauris vestibulum, neque sed', 0);
INSERT INTO `groups` VALUES (48, 'IT-114145', 'sem eget massa. Suspendisse', 0);
INSERT INTO `groups` VALUES (49, 'IT-114146', 'erat, eget tincidunt dui augue eu tellus.', 0);
INSERT INTO `groups` VALUES (50, 'IT-114147', 'eu, ultrices sit amet, risus. Donec nibh enim,', 0);
INSERT INTO `groups` VALUES (51, 'IT-114148', 'sed, hendrerit a, arcu. Sed et', 0);
INSERT INTO `groups` VALUES (52, 'IT-114149', 'ultricies ligula. Nullam enim. Sed nulla ante,', 0);
INSERT INTO `groups` VALUES (53, 'IT-114150', 'dolor. Nulla semper', 0);
INSERT INTO `groups` VALUES (54, 'IT-114151', 'Nullam suscipit, est ac', 0);
INSERT INTO `groups` VALUES (55, 'IT-114152', 'ipsum sodales', 0);
INSERT INTO `groups` VALUES (56, 'IT-114153', 'Nullam lobortis quam a felis ullamcorper viverra. Maecenas iaculis aliquet', 0);
INSERT INTO `groups` VALUES (57, 'IT-114154', 'sit amet diam eu', 0);
INSERT INTO `groups` VALUES (58, 'IT-114155', 'eget metus.', 0);
INSERT INTO `groups` VALUES (59, 'IT-114156', 'sem egestas blandit.', 0);
INSERT INTO `groups` VALUES (60, 'IT-114157', 'at sem molestie sodales. Mauris blandit enim consequat purus. Maecenas', 0);
INSERT INTO `groups` VALUES (61, 'IT-114158', 'ipsum. Suspendisse', 0);
INSERT INTO `groups` VALUES (62, 'IT-114159', 'nisl. Maecenas malesuada', 0);
INSERT INTO `groups` VALUES (63, 'IT-114160', 'scelerisque neque. Nullam nisl. Maecenas malesuada fringilla est. Mauris eu', 0);
INSERT INTO `groups` VALUES (64, 'IT-114161', 'ornare, elit elit fermentum risus, at fringilla', 0);
INSERT INTO `groups` VALUES (65, 'IT-114162', 'dapibus', 0);
INSERT INTO `groups` VALUES (66, 'IT-114163', 'quis lectus. Nullam suscipit, est ac facilisis facilisis,', 0);
INSERT INTO `groups` VALUES (67, 'IT-114164', 'quis lectus. Nullam suscipit, est ac facilisis', 0);
INSERT INTO `groups` VALUES (68, 'IT-114165', 'ut odio vel est tempor bibendum. Donec felis', 0);
INSERT INTO `groups` VALUES (69, 'IT-114166', 'a feugiat', 0);
INSERT INTO `groups` VALUES (70, 'IT-114167', 'vehicula. Pellentesque tincidunt tempus', 0);
INSERT INTO `groups` VALUES (71, 'IT-114168', 'Class aptent taciti sociosqu ad litora torquent per conubia nostra,', 0);
INSERT INTO `groups` VALUES (72, 'IT-114169', 'lorem vitae odio sagittis', 0);
INSERT INTO `groups` VALUES (73, 'IT-114170', 'Nam ac nulla. In tincidunt congue turpis. In', 0);
INSERT INTO `groups` VALUES (74, 'IT-114171', 'natoque', 0);
INSERT INTO `groups` VALUES (75, 'IT-114172', 'pretium aliquet, metus urna convallis erat, eget', 0);
INSERT INTO `groups` VALUES (76, 'IT-114173', 'nonummy ut, molestie in, tempus eu, ligula. Aenean euismod mauris', 0);
INSERT INTO `groups` VALUES (77, 'IT-114174', 'interdum ligula eu enim.', 0);
INSERT INTO `groups` VALUES (78, 'IT-114175', 'ridiculus', 0);
INSERT INTO `groups` VALUES (79, 'IT-114176', 'Phasellus ornare. Fusce mollis. Duis sit amet diam eu dolor', 0);
INSERT INTO `groups` VALUES (80, 'IT-114177', 'augue eu tellus. Phasellus elit pede, malesuada vel, venenatis vel,', 0);
INSERT INTO `groups` VALUES (81, 'IT-114178', 'justo sit amet nulla. Donec non justo. Proin', 0);
INSERT INTO `groups` VALUES (82, 'IT-114179', 'eu odio tristique', 0);
INSERT INTO `groups` VALUES (83, 'IT-114180', 'lacus. Aliquam rutrum lorem ac risus. Morbi metus.', 0);
INSERT INTO `groups` VALUES (84, 'IT-114181', 'odio sagittis semper. Nam tempor diam dictum', 0);
INSERT INTO `groups` VALUES (85, 'IT-114182', 'urna justo faucibus lectus, a sollicitudin orci sem', 0);
INSERT INTO `groups` VALUES (86, 'IT-114183', 'eros. Proin ultrices. Duis volutpat nunc sit amet', 0);
INSERT INTO `groups` VALUES (87, 'IT-114184', 'accumsan sed, facilisis vitae, orci. Phasellus dapibus quam', 0);
INSERT INTO `groups` VALUES (88, 'IT-114185', 'accumsan interdum libero dui nec', 0);
INSERT INTO `groups` VALUES (89, 'IT-114186', 'lacus. Nulla tincidunt, neque vitae semper egestas, urna', 0);
INSERT INTO `groups` VALUES (90, 'IT-114187', 'odio. Nam interdum enim non nisi. Aenean eget', 0);
INSERT INTO `groups` VALUES (91, 'IT-114188', 'mauris sagittis placerat. Cras dictum ultricies ligula. Nullam enim.', 0);
INSERT INTO `groups` VALUES (92, 'IT-114189', 'semper, dui', 0);
INSERT INTO `groups` VALUES (93, 'IT-114190', 'quam vel sapien imperdiet ornare. In faucibus. Morbi vehicula. Pellentesque', 0);
INSERT INTO `groups` VALUES (94, 'IT-114191', 'amet,', 0);
INSERT INTO `groups` VALUES (95, 'IT-114192', 'lorem. Donec elementum, lorem ut aliquam', 0);
INSERT INTO `groups` VALUES (96, 'IT-114193', 'leo. Cras vehicula aliquet', 0);
INSERT INTO `groups` VALUES (97, 'IT-114194', 'ante dictum mi, ac mattis velit justo', 0);
INSERT INTO `groups` VALUES (98, 'IT-114195', 'laoreet posuere, enim nisl', 0);
INSERT INTO `groups` VALUES (99, 'IT-114196', 'erat neque non quam.', 0);
INSERT INTO `groups` VALUES (100, 'IT-114197', 'Nulla', 0);
INSERT INTO `groups` VALUES (101, 'IT-114198', 'sit amet, faucibus', 0);
INSERT INTO `groups` VALUES (102, 'IT-114199', 'id', 0);
INSERT INTO `groups` VALUES (103, 'IT-114200', 'et tristique pellentesque, tellus sem', 0);
INSERT INTO `groups` VALUES (104, 'IT-114201', 'eleifend nec, malesuada', 0);
INSERT INTO `groups` VALUES (105, 'IT-114202', 'dolor dapibus gravida.', 0);
INSERT INTO `groups` VALUES (106, 'IT-114203', 'at arcu. Vestibulum ante ipsum primis in faucibus orci luctus', 0);
INSERT INTO `groups` VALUES (107, 'IT-114204', 'tempor diam dictum', 0);
INSERT INTO `groups` VALUES (108, 'max-width: 200px;', 'aaaaaaaaaaaaaaaaaaaaa', 0);

-- ----------------------------
-- Table structure for module
-- ----------------------------
DROP TABLE IF EXISTS `module`;
CREATE TABLE `module`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of module
-- ----------------------------
INSERT INTO `module` VALUES (1, 'Programming', 'IT1000', 0);
INSERT INTO `module` VALUES (2, 'Networking', 'IT2000', 0);

-- ----------------------------
-- Table structure for module_sections
-- ----------------------------
DROP TABLE IF EXISTS `module_sections`;
CREATE TABLE `module_sections`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `module` int(11) NULL DEFAULT NULL,
  `status` int(11) NULL DEFAULT 0,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `module`(`module`) USING BTREE,
  CONSTRAINT `module_sections_ibfk_1` FOREIGN KEY (`module`) REFERENCES `module` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of module_sections
-- ----------------------------
INSERT INTO `module_sections` VALUES (1, 1, 0, 'Section A');
INSERT INTO `module_sections` VALUES (2, 1, 0, 'Section B');
INSERT INTO `module_sections` VALUES (3, 2, 0, 'section c');

-- ----------------------------
-- Table structure for module_selections
-- ----------------------------
DROP TABLE IF EXISTS `module_selections`;
CREATE TABLE `module_selections`  (
  `groupid` int(11) NOT NULL,
  `moduleid` int(11) NOT NULL,
  PRIMARY KEY (`groupid`, `moduleid`) USING BTREE,
  INDEX `moduleid`(`moduleid`) USING BTREE,
  CONSTRAINT `module_selections_ibfk_1` FOREIGN KEY (`groupid`) REFERENCES `groups` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `module_selections_ibfk_2` FOREIGN KEY (`moduleid`) REFERENCES `module` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of module_selections
-- ----------------------------
INSERT INTO `module_selections` VALUES (1, 1);

-- ----------------------------
-- Table structure for question
-- ----------------------------
DROP TABLE IF EXISTS `question`;
CREATE TABLE `question`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category` int(11) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `questionType` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `question` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 33 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of question
-- ----------------------------
INSERT INTO `question` VALUES (1, 1, 'Quiz1 Q1 selection', 'selection', 1, 0);
INSERT INTO `question` VALUES (2, 2, 'Quiz2 Q1 selection', 'selection', 2, 0);
INSERT INTO `question` VALUES (3, 3, 'Quiz3 Q1 selection', 'selection', 3, 0);
INSERT INTO `question` VALUES (4, 1, 'Quiz1 Q2 selection', 'selection', 4, 0);
INSERT INTO `question` VALUES (5, 1, 'Quiz1 Q3 multichoice', 'multichoice', 1, 0);
INSERT INTO `question` VALUES (6, 2, 'Quiz2 Q2 multichoice', 'multichoice', 2, 0);
INSERT INTO `question` VALUES (7, 3, 'Quiz3 Q2 multichoice', 'multichoice', 3, 0);
INSERT INTO `question` VALUES (8, 1, 'Quiz1 Q4 multichoice', 'multichoice', 4, 0);
INSERT INTO `question` VALUES (9, 1, 'Outsource is a major factor that undercut the salary of IT jobs in Hong Kong', 'selection', 1, 0);
INSERT INTO `question` VALUES (10, 2, 'Off-shore is a major factor for the shortage IT workforce in Hong Kong', 'selection', 2, 0);
INSERT INTO `question` VALUES (11, 3, 'Globalization is one of the reason of rich-poor divided in the developed country', 'selection', 3, 0);
INSERT INTO `question` VALUES (12, 1, 'Big remuneration gap for ITP is very common in the developed country', 'selection', 4, 0);
INSERT INTO `question` VALUES (13, 1, 'Outsource is a major factor that undercut the salary of IT jobs in Hong Kong', 'selection', 1, 0);
INSERT INTO `question` VALUES (14, 2, 'Off-shore is a major factor for the shortage IT workforce in Hong Kong', 'selection', 2, 0);
INSERT INTO `question` VALUES (15, 3, 'Globalization is one of the reason of rich-poor divided in the developed country', 'selection', 3, 0);
INSERT INTO `question` VALUES (16, 1, 'Big remuneration gap for ITP is very common in the developed country', 'selection', 4, 0);
INSERT INTO `question` VALUES (17, 1, 'Quiz1 Q3 multichoice', 'multichoice', 1, 0);
INSERT INTO `question` VALUES (18, 2, 'Quiz2 Q2 multichoice', 'multichoice', 2, 0);
INSERT INTO `question` VALUES (19, 3, 'Quiz3 Q2 multichoice', 'multichoice', 3, 0);
INSERT INTO `question` VALUES (20, 1, 'Quiz1 Q4 multichoice', 'multichoice', 4, 0);
INSERT INTO `question` VALUES (21, 1, 'Outsource is a major factor that undercut the salary of IT jobs in Hong Kong', 'selection', 1, 0);
INSERT INTO `question` VALUES (22, 2, 'Off-shore is a major factor for the shortage IT workforce in Hong Kong', 'selection', 2, 0);
INSERT INTO `question` VALUES (23, 3, 'Globalization is one of the reason of rich-poor divided in the developed country', 'selection', 3, 0);
INSERT INTO `question` VALUES (24, 1, 'Big remuneration gap for ITP is very common in the developed country', 'selection', 4, 0);
INSERT INTO `question` VALUES (25, 1, 'Quiz1 Q1 selection', 'selection', 1, 0);
INSERT INTO `question` VALUES (26, 2, 'Quiz2 Q1 selection', 'selection', 2, 0);
INSERT INTO `question` VALUES (27, 3, 'Quiz3 Q1 selection', 'selection', 3, 0);
INSERT INTO `question` VALUES (28, 1, 'Quiz1 Q2 selection', 'selection', 4, 0);
INSERT INTO `question` VALUES (29, 1, 'Quiz1 Q3 multichoice', 'multichoice', 1, 0);
INSERT INTO `question` VALUES (30, 2, 'Quiz2 Q2 multichoice', 'multichoice', 2, 0);
INSERT INTO `question` VALUES (31, 3, 'Quiz3 Q2 multichoice', 'multichoice', 3, 0);
INSERT INTO `question` VALUES (32, 1, 'Quiz1 Q4 multichoice', 'multichoice', 4, 0);

-- ----------------------------
-- Table structure for question_multichoice
-- ----------------------------
DROP TABLE IF EXISTS `question_multichoice`;
CREATE TABLE `question_multichoice`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question` int(11) NOT NULL,
  `questionText` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `offeredAnswer` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `questionAnswer` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `question`(`question`) USING BTREE,
  CONSTRAINT `question_multichoice_ibfk_1` FOREIGN KEY (`question`) REFERENCES `question` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of question_multichoice
-- ----------------------------
INSERT INTO `question_multichoice` VALUES (1, 5, '{1:\'AAA\', 2:\'BBB\', 3:\'CCC\'}', '{4}', '{3,4}', 0);
INSERT INTO `question_multichoice` VALUES (2, 6, '{1:\'apple\', 2:\'blue\', 3:\'car\'}', NULL, '{3,4}', 0);
INSERT INTO `question_multichoice` VALUES (3, 7, '{1:\'apple\', 2:\'blue\', 3:\'car\'}', NULL, '{5,6}', 0);
INSERT INTO `question_multichoice` VALUES (4, 8, '{1:\'apple\', 2:\'blue\', 3:\'car\'}', NULL, '{7,8}', 0);

-- ----------------------------
-- Table structure for question_selection
-- ----------------------------
DROP TABLE IF EXISTS `question_selection`;
CREATE TABLE `question_selection`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question` int(11) NOT NULL,
  `answer` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `offeredAnswer` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `questionAnswer` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `question`(`question`) USING BTREE,
  CONSTRAINT `question_selection_ibfk_1` FOREIGN KEY (`question`) REFERENCES `question` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of question_selection
-- ----------------------------
INSERT INTO `question_selection` VALUES (1, 1, '{\'A\':\'answerA\', \'B\':\'answerB\', \'C\':\'answerC\', \'D\':\'answerD\'}', 'B', 'D', 0);
INSERT INTO `question_selection` VALUES (2, 2, '{\'A\':\'answerA\', \'B\':\'answerB\', \'C\':\'answerC\', \'D\':\'answerD\'}', NULL, 'B', 0);
INSERT INTO `question_selection` VALUES (3, 3, '{\'A\':\'answerA\', \'B\':\'answerB\', \'C\':\'answerC\', \'D\':\'answerD\'}', NULL, 'C', 0);
INSERT INTO `question_selection` VALUES (4, 4, '{\'A\':\'answerA\', \'B\':\'answerB\', \'C\':\'answerC\', \'D\':\'answerD\'}', NULL, 'D', 0);

-- ----------------------------
-- Table structure for quiz
-- ----------------------------
DROP TABLE IF EXISTS `quiz`;
CREATE TABLE `quiz`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `intro` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `timeopen` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0),
  `timeclose` timestamp(0) NOT NULL,
  `attempts` int(11) NOT NULL,
  `timelimit` int(11) NULL DEFAULT NULL,
  `timecreated` timestamp(0) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of quiz
-- ----------------------------
INSERT INTO `quiz` VALUES (1, 'Quiz 1', '', '2007-09-23 10:10:10', '2007-09-23 10:10:10', 3, 120, '2018-01-05 17:43:06', 0);
INSERT INTO `quiz` VALUES (2, 'IT exam', '', '2007-09-23 10:10:10', '2007-09-23 10:10:10', 3, 120, '2018-01-05 17:43:06', 0);
INSERT INTO `quiz` VALUES (3, 'Network IQ test', '', '2007-09-23 10:10:10', '2007-09-23 10:10:10', 3, 120, '2018-01-05 17:43:06', 0);
INSERT INTO `quiz` VALUES (4, 'Quiz 1', '', '2007-09-23 10:10:10', '2007-09-23 10:10:10', 3, 120, '2018-01-05 17:43:52', 0);
INSERT INTO `quiz` VALUES (5, 'IT exam', '', '2007-09-23 10:10:10', '2007-09-23 10:10:10', 3, 120, '2018-01-05 17:43:52', 0);
INSERT INTO `quiz` VALUES (6, 'Network IQ test', '', '2007-09-23 10:10:10', '2007-09-23 10:10:10', 3, 120, '2018-01-05 17:43:52', 0);
INSERT INTO `quiz` VALUES (7, 'Quiz 1', '', '2007-09-23 10:10:10', '2007-09-23 10:10:10', 3, 120, '2018-01-05 17:44:05', 0);
INSERT INTO `quiz` VALUES (8, 'IT exam', '', '2007-09-23 10:10:10', '2007-09-23 10:10:10', 3, 120, '2018-01-05 17:44:05', 0);
INSERT INTO `quiz` VALUES (9, 'Network IQ test', '', '2007-09-23 10:10:10', '2007-09-23 10:10:10', 3, 120, '2018-01-05 17:44:05', 0);

-- ----------------------------
-- Table structure for quiz_assignment
-- ----------------------------
DROP TABLE IF EXISTS `quiz_assignment`;
CREATE TABLE `quiz_assignment`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `quiz` int(11) NOT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `groups` int(11) NULL DEFAULT NULL,
  `student` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `quiz`(`quiz`) USING BTREE,
  INDEX `groups`(`groups`) USING BTREE,
  INDEX `student`(`student`) USING BTREE,
  CONSTRAINT `quiz_assignment_ibfk_1` FOREIGN KEY (`quiz`) REFERENCES `quiz` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `quiz_assignment_ibfk_2` FOREIGN KEY (`groups`) REFERENCES `groups` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `quiz_assignment_ibfk_3` FOREIGN KEY (`student`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for quiz_question
-- ----------------------------
DROP TABLE IF EXISTS `quiz_question`;
CREATE TABLE `quiz_question`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `quiz` int(11) NOT NULL,
  `question` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `quiz`(`quiz`) USING BTREE,
  INDEX `question`(`question`) USING BTREE,
  CONSTRAINT `quiz_question_ibfk_1` FOREIGN KEY (`quiz`) REFERENCES `quiz` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `quiz_question_ibfk_2` FOREIGN KEY (`question`) REFERENCES `question` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of quiz_question
-- ----------------------------
INSERT INTO `quiz_question` VALUES (1, 1, 1);
INSERT INTO `quiz_question` VALUES (2, 2, 2);
INSERT INTO `quiz_question` VALUES (3, 3, 3);
INSERT INTO `quiz_question` VALUES (4, 1, 4);
INSERT INTO `quiz_question` VALUES (5, 1, 5);
INSERT INTO `quiz_question` VALUES (6, 2, 6);
INSERT INTO `quiz_question` VALUES (7, 3, 7);
INSERT INTO `quiz_question` VALUES (8, 1, 8);
INSERT INTO `quiz_question` VALUES (9, 1, 1);
INSERT INTO `quiz_question` VALUES (10, 1, 2);
INSERT INTO `quiz_question` VALUES (11, 1, 3);
INSERT INTO `quiz_question` VALUES (12, 1, 4);
INSERT INTO `quiz_question` VALUES (13, 2, 5);
INSERT INTO `quiz_question` VALUES (14, 2, 6);
INSERT INTO `quiz_question` VALUES (15, 2, 7);
INSERT INTO `quiz_question` VALUES (16, 2, 8);
INSERT INTO `quiz_question` VALUES (17, 1, 1);
INSERT INTO `quiz_question` VALUES (18, 2, 2);
INSERT INTO `quiz_question` VALUES (19, 3, 3);
INSERT INTO `quiz_question` VALUES (20, 1, 4);
INSERT INTO `quiz_question` VALUES (21, 1, 5);
INSERT INTO `quiz_question` VALUES (22, 2, 6);
INSERT INTO `quiz_question` VALUES (23, 3, 7);
INSERT INTO `quiz_question` VALUES (24, 1, 8);

-- ----------------------------
-- Table structure for resources
-- ----------------------------
DROP TABLE IF EXISTS `resources`;
CREATE TABLE `resources`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category` int(11) NOT NULL,
  `section` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `fileName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `timeopen` timestamp(0) NULL DEFAULT NULL,
  `timeclose` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `firstname` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `usergroup` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 450 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, '123', '123', '1234', '1234', 0, 0, 5);
INSERT INTO `user` VALUES (3, '234', '234', 'student', 'account', 1, 0, 1);
INSERT INTO `user` VALUES (6, 'peter', 'peter', 'Peter', 'Chan', 1, 0, 5);
INSERT INTO `user` VALUES (20, 'Peter2', 'Peter2', 'Peter', 'Chan', 0, 0, 5);
INSERT INTO `user` VALUES (42, 'hello', 'hello', '123', '12', 0, 0, 5);
INSERT INTO `user` VALUES (63, 'qwe', 'qwe', 'qwe', 'qwe', 0, 0, 5);
INSERT INTO `user` VALUES (64, 'adasdsaa', 'adasdsaa', 'adasda', 'asdasdsad', 1, 0, 5);
INSERT INTO `user` VALUES (66, '12312', '12312', '3213123121', '123123', 0, 0, 5);
INSERT INTO `user` VALUES (67, '1231231221121', '1231231221121', '12312', '1313', 0, 0, 5);
INSERT INTO `user` VALUES (68, '123123223223', '123123223223', '1233312', '123123123213312', 0, 0, 5);
INSERT INTO `user` VALUES (70, 'qqq', 'qqq', '', '', 0, 0, 5);
INSERT INTO `user` VALUES (72, 'Peter334', 'Peter334', '213', '12321', 0, 0, 5);
INSERT INTO `user` VALUES (73, 'asdsadasdsdas', 'asdsadasdsdas', 'asdad', 'qa', 0, 0, 5);
INSERT INTO `user` VALUES (74, 'adasdasdsakasdnkdfslkfdskjldsfklj', 'adasdasdsakasdnkdfslkfdskjldsfklj', 'lkjsdlkj', 'kljjkljkl', 0, 0, 5);
INSERT INTO `user` VALUES (76, '100', '100', 'Eaton', 'Dillard', 1, 0, 5);
INSERT INTO `user` VALUES (77, '101', '101', 'Justin', 'Johnson', 1, 0, 5);
INSERT INTO `user` VALUES (78, '102', '102', 'Edward', 'Collins', 1, 0, 5);
INSERT INTO `user` VALUES (79, '103', '103', 'Baker', 'Frazier', 1, 0, 5);
INSERT INTO `user` VALUES (80, '104', '104', 'Nash', 'Rowland', 0, 0, 5);
INSERT INTO `user` VALUES (81, '105', '105', 'Keaton', 'Hull', 0, 0, 5);
INSERT INTO `user` VALUES (82, '106', '106', 'Herman', 'Martinez', 1, 0, 5);
INSERT INTO `user` VALUES (83, '107', '107', 'Brian', 'Long', 0, 0, 5);
INSERT INTO `user` VALUES (84, '108', '108', 'Phillip', 'Peters', 0, 0, 5);
INSERT INTO `user` VALUES (85, '109', '109', 'Cadman', 'Barker', 1, 0, 5);
INSERT INTO `user` VALUES (86, '110', '110', 'Jelani', 'Pratt', 0, 0, 5);
INSERT INTO `user` VALUES (87, '111', '111', 'Kennedy', 'Cherry', 0, 0, 5);
INSERT INTO `user` VALUES (88, '112', '112', 'Nicholas', 'Roach', 1, 0, 5);
INSERT INTO `user` VALUES (89, '113', '113', 'Philip', 'Sampson', 0, 0, 5);
INSERT INTO `user` VALUES (90, '114', '114', 'Jasper', 'Bradley', 0, 0, 5);
INSERT INTO `user` VALUES (91, '115', '115', 'Ethan', 'Griffin', 0, 0, 5);
INSERT INTO `user` VALUES (92, '116', '116', 'Wing', 'Valenzuela', 1, 0, 5);
INSERT INTO `user` VALUES (93, '117', '117', 'Chase', 'Gonzales', 1, 0, 5);
INSERT INTO `user` VALUES (94, '118', '118', 'Lane', 'Tyler', 1, 0, 5);
INSERT INTO `user` VALUES (95, '119', '119', 'Guy', 'Hughes', 1, 0, 5);
INSERT INTO `user` VALUES (96, '120', '120', 'Camden', 'Burks', 0, 0, 5);
INSERT INTO `user` VALUES (97, '121', '121', 'Paki', 'Mckee', 0, 0, 5);
INSERT INTO `user` VALUES (98, '122', '122', 'Holmes', 'Arnold', 0, 0, 5);
INSERT INTO `user` VALUES (100, '124', '124', 'Eaton', 'Ball', 1, 0, 0);
INSERT INTO `user` VALUES (101, '125', '125', 'Hamilton', 'Perry', 0, 0, 0);
INSERT INTO `user` VALUES (102, '126', '126', 'Caldwell', 'Conner', 1, 0, 0);
INSERT INTO `user` VALUES (103, '127', '127', 'Maxwell', 'Shaffer', 0, 0, 0);
INSERT INTO `user` VALUES (104, '128', '128', 'Hector', 'Fitzpatrick', 1, 0, 0);
INSERT INTO `user` VALUES (105, '129', '129', 'Silas', 'Edwards', 1, 0, 0);
INSERT INTO `user` VALUES (106, '130', '130', 'Zachary', 'Raymond', 0, 0, 0);
INSERT INTO `user` VALUES (107, '131', '131', 'Len', 'Ramirez', 0, 0, 0);
INSERT INTO `user` VALUES (108, '132', '132', 'Emmanuel', 'Sexton', 1, 0, 0);
INSERT INTO `user` VALUES (109, '133', '133', 'Dane', 'George', 0, 0, 0);
INSERT INTO `user` VALUES (110, '134', '134', 'Keegan', 'Huber', 1, 0, 0);
INSERT INTO `user` VALUES (111, '135', '135', 'Daquan', 'Fields', 1, 0, 0);
INSERT INTO `user` VALUES (112, '136', '136', 'Amos', 'Daniel', 1, 0, 0);
INSERT INTO `user` VALUES (113, '137', '137', 'Beau', 'Sherman', 1, 0, 0);
INSERT INTO `user` VALUES (114, '138', '138', 'Wang', 'Carrillo', 1, 0, 0);
INSERT INTO `user` VALUES (115, '139', '139', 'Adrian', 'Frank', 1, 0, 0);
INSERT INTO `user` VALUES (116, '140', '140', 'Christopher', 'Pitts', 1, 0, 0);
INSERT INTO `user` VALUES (117, '141', '141', 'Nicholas', 'James', 0, 0, 0);
INSERT INTO `user` VALUES (118, '142', '142', 'Odysseus', 'Harding', 0, 0, 0);
INSERT INTO `user` VALUES (119, '143', '143', 'Owen', 'Schwartz', 0, 0, 0);
INSERT INTO `user` VALUES (120, '144', '144', 'Jacob', 'Ferguson', 1, 0, 0);
INSERT INTO `user` VALUES (121, '145', '145', 'Kaseem', 'Shaffer', 0, 0, 0);
INSERT INTO `user` VALUES (122, '146', '146', 'Boris', 'Mosley', 1, 0, 0);
INSERT INTO `user` VALUES (123, '147', '147', 'Kenyon', 'Trevino', 1, 0, 0);
INSERT INTO `user` VALUES (124, '148', '148', 'Lucas', 'Page', 1, 0, 0);
INSERT INTO `user` VALUES (125, '149', '149', 'Arsenio', 'Small', 1, 0, 0);
INSERT INTO `user` VALUES (126, '150', '150', 'Kennedy', 'Knight', 1, 0, 0);
INSERT INTO `user` VALUES (177, '151', '151', 'Gareth', 'Workman', 0, 0, 0);
INSERT INTO `user` VALUES (206, '152', '152', 'Gareth', 'Porter', 0, 0, 0);
INSERT INTO `user` VALUES (207, '153', '153', 'Vaughan', 'Velasquez', 0, 0, 0);
INSERT INTO `user` VALUES (208, '154', '154', 'Keane', 'King', 1, 0, 0);
INSERT INTO `user` VALUES (209, '155', '155', 'Jerome', 'Thomas', 0, 0, 0);
INSERT INTO `user` VALUES (210, '156', '156', 'Zahir', 'King', 1, 0, 0);
INSERT INTO `user` VALUES (211, '157', '157', 'Lance', 'Richardson', 1, 0, 0);
INSERT INTO `user` VALUES (212, '158', '158', 'Hakeem', 'Simpson', 0, 0, 0);
INSERT INTO `user` VALUES (213, '159', '159', 'Clarke', 'Phelps', 0, 0, 0);
INSERT INTO `user` VALUES (214, '160', '160', 'Clark', 'Adams', 1, 0, 0);
INSERT INTO `user` VALUES (215, '161', '161', 'Oren', 'Figueroa', 0, 0, 0);
INSERT INTO `user` VALUES (216, '162', '162', 'Orson', 'Ray', 1, 0, 0);
INSERT INTO `user` VALUES (217, '163', '163', 'Dylan', 'Glass', 0, 0, 0);
INSERT INTO `user` VALUES (218, '164', '164', 'Hyatt', 'Stewart', 0, 0, 0);
INSERT INTO `user` VALUES (219, '165', '165', 'Chandler', 'Bradley', 1, 0, 0);
INSERT INTO `user` VALUES (220, '166', '166', 'Carlos', 'Chandler', 1, 0, 0);
INSERT INTO `user` VALUES (221, '167', '167', 'Fulton', 'Wilkins', 1, 0, 0);
INSERT INTO `user` VALUES (222, '168', '168', 'Chandler', 'Goff', 0, 0, 0);
INSERT INTO `user` VALUES (223, '169', '169', 'Kennedy', 'Best', 1, 0, 0);
INSERT INTO `user` VALUES (224, '170', '170', 'Harlan', 'Juarez', 0, 0, 0);
INSERT INTO `user` VALUES (225, '171', '171', 'Levi', 'Vasquez', 1, 0, 0);
INSERT INTO `user` VALUES (226, '172', '172', 'Carlos', 'Buckner', 0, 0, 0);
INSERT INTO `user` VALUES (227, '173', '173', 'Kelly', 'Cruz', 1, 0, 0);
INSERT INTO `user` VALUES (228, '174', '174', 'Denton', 'Stout', 1, 0, 0);
INSERT INTO `user` VALUES (229, '185', '185', 'Evan', 'Burgess', 0, 0, 0);
INSERT INTO `user` VALUES (230, '186', '186', 'Byron', 'Charles', 1, 0, 0);
INSERT INTO `user` VALUES (231, '187', '187', 'Clayton', 'Carrillo', 0, 0, 0);
INSERT INTO `user` VALUES (232, '188', '188', 'Jeremy', 'Ayers', 0, 0, 0);
INSERT INTO `user` VALUES (233, '189', '189', 'Alden', 'Estes', 1, 0, 0);
INSERT INTO `user` VALUES (234, '190', '190', 'Slade', 'Lucas', 0, 0, 0);
INSERT INTO `user` VALUES (235, '191', '191', 'Sawyer', 'Odom', 0, 0, 0);
INSERT INTO `user` VALUES (236, '192', '192', 'Honorato', 'Jennings', 0, 0, 0);
INSERT INTO `user` VALUES (237, '193', '193', 'Wayne', 'Lambert', 0, 0, 0);
INSERT INTO `user` VALUES (238, '194', '194', 'Ulric', 'Marsh', 0, 0, 0);
INSERT INTO `user` VALUES (239, '195', '195', 'Alan', 'Hoover', 0, 0, 0);
INSERT INTO `user` VALUES (240, '196', '196', 'Len', 'Schultz', 1, 0, 0);
INSERT INTO `user` VALUES (241, '197', '197', 'Tad', 'Pierce', 1, 0, 0);
INSERT INTO `user` VALUES (242, '198', '198', 'Nasim', 'Welch', 1, 0, 0);
INSERT INTO `user` VALUES (243, '199', '199', 'Colt', 'Gilmore', 1, 0, 0);
INSERT INTO `user` VALUES (244, '200', '200', 'Malachi', 'Floyd', 0, 0, 0);
INSERT INTO `user` VALUES (245, '201', '201', 'Malcolm', 'Bass', 0, 0, 0);
INSERT INTO `user` VALUES (246, '202', '202', 'Dane', 'Hanson', 1, 0, 0);
INSERT INTO `user` VALUES (247, '203', '203', 'Ezra', 'Mays', 1, 0, 0);
INSERT INTO `user` VALUES (248, '204', '204', 'Kirk', 'Lynn', 0, 0, 0);
INSERT INTO `user` VALUES (249, '205', '205', 'Yoshio', 'Hays', 1, 0, 0);
INSERT INTO `user` VALUES (250, '206', '206', 'Quamar', 'Waller', 0, 0, 0);
INSERT INTO `user` VALUES (251, '207', '207', 'Louis', 'Clements', 0, 0, 0);
INSERT INTO `user` VALUES (252, '208', '208', 'Salvador', 'Bentley', 0, 0, 0);
INSERT INTO `user` VALUES (253, '209', '209', 'Ira', 'Flores', 0, 0, 0);
INSERT INTO `user` VALUES (254, '210', '210', 'Finn', 'Dodson', 0, 0, 0);
INSERT INTO `user` VALUES (255, '211', '211', 'Tyler', 'Wade', 0, 0, 0);
INSERT INTO `user` VALUES (256, '212', '212', 'Slade', 'Conley', 1, 0, 0);
INSERT INTO `user` VALUES (257, '213', '213', 'Porter', 'Francis', 0, 0, 0);
INSERT INTO `user` VALUES (258, '214', '214', 'Dominic', 'Langley', 0, 0, 0);
INSERT INTO `user` VALUES (259, '215', '215', 'Amir', 'Guzman', 1, 0, 0);
INSERT INTO `user` VALUES (260, '216', '216', 'Ray', 'Fisher', 0, 0, 0);
INSERT INTO `user` VALUES (261, '217', '217', 'Hoyt', 'Blackwell', 1, 0, 0);
INSERT INTO `user` VALUES (262, '218', '218', 'Kaseem', 'Small', 0, 0, 0);
INSERT INTO `user` VALUES (263, '219', '219', 'Rogan', 'Fulton', 1, 0, 0);
INSERT INTO `user` VALUES (264, '220', '220', 'Herman', 'Jennings', 1, 0, 0);
INSERT INTO `user` VALUES (265, '221', '221', 'Baxter', 'Boone', 0, 0, 0);
INSERT INTO `user` VALUES (266, '222', '222', 'Connor', 'Duncan', 0, 0, 0);
INSERT INTO `user` VALUES (267, '223', '223', 'Elvis', 'Cote', 0, 0, 0);
INSERT INTO `user` VALUES (268, '224', '224', 'Curran', 'Wilson', 0, 0, 0);
INSERT INTO `user` VALUES (269, '225', '225', 'Devin', 'Kirkland', 0, 0, 0);
INSERT INTO `user` VALUES (270, '226', '226', 'Gage', 'Rocha', 1, 0, 0);
INSERT INTO `user` VALUES (271, '227', '227', 'Dean', 'Mcdowell', 1, 0, 0);
INSERT INTO `user` VALUES (272, '228', '228', 'Gabriel', 'Ray', 1, 0, 0);
INSERT INTO `user` VALUES (273, '229', '229', 'Dexter', 'Stout', 0, 0, 0);
INSERT INTO `user` VALUES (274, '230', '230', 'Arsenio', 'Gordon', 1, 0, 0);
INSERT INTO `user` VALUES (275, '231', '231', 'Macon', 'Holland', 1, 0, 0);
INSERT INTO `user` VALUES (276, '232', '232', 'Cullen', 'Clarke', 0, 0, 0);
INSERT INTO `user` VALUES (277, '233', '233', 'Griffin', 'Ochoa', 0, 0, 0);
INSERT INTO `user` VALUES (279, '235', '235', 'Prescott', 'Buck', 1, 0, 0);
INSERT INTO `user` VALUES (280, '241', '241', 'Jin', 'Ramsey', 1, 0, 0);
INSERT INTO `user` VALUES (281, '242', '242', 'Vaughan', 'Haley', 0, 0, 0);
INSERT INTO `user` VALUES (282, '243', '243', 'Kenneth', 'Lindsey', 1, 0, 0);
INSERT INTO `user` VALUES (283, '244', '244', 'Cullen', 'Rivers', 0, 0, 0);
INSERT INTO `user` VALUES (284, '245', '245', 'Oren', 'Patton', 1, 0, 0);
INSERT INTO `user` VALUES (285, '246', '246', 'Jakeem', 'Hartman', 0, 0, 0);
INSERT INTO `user` VALUES (286, '247', '247', 'Charles', 'Brennan', 1, 0, 0);
INSERT INTO `user` VALUES (287, '248', '248', 'Yoshio', 'Ashley', 0, 0, 0);
INSERT INTO `user` VALUES (288, '249', '249', 'Connor', 'Gates', 1, 0, 0);
INSERT INTO `user` VALUES (289, '250', '250', 'Victor', 'Butler', 0, 0, 0);
INSERT INTO `user` VALUES (290, '251', '251', 'Branden', 'Campos', 1, 0, 0);
INSERT INTO `user` VALUES (291, '252', '252', 'Ryan', 'Gaines', 1, 0, 0);
INSERT INTO `user` VALUES (292, '253', '253', 'Kareem', 'Hurley', 0, 0, 0);
INSERT INTO `user` VALUES (293, '254', '254', 'Raja', 'Herman', 0, 0, 0);
INSERT INTO `user` VALUES (294, '255', '255', 'Hector', 'Foreman', 1, 0, 0);
INSERT INTO `user` VALUES (295, '256', '256', 'Galvin', 'Rasmussen', 1, 0, 0);
INSERT INTO `user` VALUES (296, '257', '257', 'Jamal', 'English', 0, 0, 0);
INSERT INTO `user` VALUES (297, '258', '258', 'Jared', 'Wagner', 0, 0, 0);
INSERT INTO `user` VALUES (298, '259', '259', 'Buckminster', 'Shields', 1, 0, 0);
INSERT INTO `user` VALUES (299, '260', '260', 'Simon', 'Barr', 1, 0, 0);
INSERT INTO `user` VALUES (300, '261', '261', 'Bert', 'Page', 1, 0, 0);
INSERT INTO `user` VALUES (301, '262', '262', 'Graiden', 'Hart', 1, 0, 0);
INSERT INTO `user` VALUES (302, '263', '263', 'Walker', 'Macias', 0, 0, 0);
INSERT INTO `user` VALUES (303, '264', '264', 'Caleb', 'Rollins', 0, 0, 0);
INSERT INTO `user` VALUES (304, '265', '265', 'Donovan', 'Rosa', 1, 0, 0);
INSERT INTO `user` VALUES (305, '266', '266', 'Justin', 'Garrett', 0, 0, 0);
INSERT INTO `user` VALUES (306, '267', '267', 'Nolan', 'Warner', 0, 0, 0);
INSERT INTO `user` VALUES (307, '268', '268', 'Avram', 'Cameron', 0, 0, 0);
INSERT INTO `user` VALUES (308, '269', '269', 'Amir', 'Herring', 1, 0, 0);
INSERT INTO `user` VALUES (309, '270', '270', 'Felix', 'Sparks', 0, 0, 0);
INSERT INTO `user` VALUES (310, '271', '271', 'Neville', 'Obrien', 0, 0, 0);
INSERT INTO `user` VALUES (311, '272', '272', 'Valentine', 'Jacobs', 1, 0, 0);
INSERT INTO `user` VALUES (312, '273', '273', 'Wyatt', 'Middleton', 1, 0, 0);
INSERT INTO `user` VALUES (313, '274', '274', 'Wallace', 'Parrish', 1, 0, 0);
INSERT INTO `user` VALUES (314, '275', '275', 'Joel', 'Roberson', 1, 0, 0);
INSERT INTO `user` VALUES (315, '276', '276', 'Russell', 'Henson', 0, 0, 0);
INSERT INTO `user` VALUES (316, '277', '277', 'August', 'Hale', 1, 0, 0);
INSERT INTO `user` VALUES (317, '278', '278', 'Kadeem', 'Beasley', 0, 0, 0);
INSERT INTO `user` VALUES (318, '279', '279', 'Cole', 'Beasley', 1, 0, 0);
INSERT INTO `user` VALUES (319, '280', '280', 'Daquan', 'Bentley', 0, 0, 0);
INSERT INTO `user` VALUES (320, '281', '281', 'Thaddeus', 'Barlow', 0, 0, 0);
INSERT INTO `user` VALUES (321, '282', '282', 'Oscar', 'Gaines', 1, 0, 0);
INSERT INTO `user` VALUES (322, '283', '283', 'Elton', 'Horn', 0, 0, 0);
INSERT INTO `user` VALUES (323, '284', '284', 'Bruno', 'Brock', 0, 0, 0);
INSERT INTO `user` VALUES (324, '285', '285', 'Addison', 'York', 0, 0, 0);
INSERT INTO `user` VALUES (325, '286', '286', 'Brady', 'Duncan', 0, 0, 0);
INSERT INTO `user` VALUES (326, '287', '287', 'Oscar', 'Mccullough', 0, 0, 0);
INSERT INTO `user` VALUES (327, '288', '288', 'Nasim', 'Trevino', 1, 0, 0);
INSERT INTO `user` VALUES (328, '289', '289', 'Jin', 'Cross', 1, 0, 0);
INSERT INTO `user` VALUES (329, '290', '290', 'Reese', 'Carroll', 0, 0, 0);
INSERT INTO `user` VALUES (330, '291', '291', 'Conan', 'Levy', 0, 0, 0);
INSERT INTO `user` VALUES (331, '292', '292', 'Jerome', 'Boyd', 0, 0, 0);
INSERT INTO `user` VALUES (332, '293', '293', 'Kibo', 'Blair', 1, 0, 0);
INSERT INTO `user` VALUES (333, '294', '294', 'Evan', 'Morrow', 1, 0, 0);
INSERT INTO `user` VALUES (334, '295', '295', 'Merritt', 'Mccormick', 0, 0, 0);
INSERT INTO `user` VALUES (335, '296', '296', 'William', 'Roberts', 0, 0, 0);
INSERT INTO `user` VALUES (336, '297', '297', 'Lee', 'Fowler', 0, 0, 0);
INSERT INTO `user` VALUES (337, '298', '298', 'Harlan', 'Hester', 0, 0, 0);
INSERT INTO `user` VALUES (338, '299', '299', 'Edan', 'Cochran', 1, 0, 0);
INSERT INTO `user` VALUES (339, '300', '300', 'Price', 'Foreman', 1, 0, 0);
INSERT INTO `user` VALUES (340, '301', '301', 'Amal', 'Peck', 0, 0, 0);
INSERT INTO `user` VALUES (341, '302', '302', 'Shad', 'Emerson', 1, 0, 0);
INSERT INTO `user` VALUES (342, '303', '303', 'Connor', 'Dorsey', 0, 0, 0);
INSERT INTO `user` VALUES (343, '304', '304', 'Steven', 'Curry', 1, 0, 0);
INSERT INTO `user` VALUES (344, '305', '305', 'Grant', 'Campos', 1, 0, 0);
INSERT INTO `user` VALUES (345, '306', '306', 'Mason', 'Hayden', 0, 0, 0);
INSERT INTO `user` VALUES (346, '307', '307', 'Kennedy', 'Schmidt', 1, 0, 0);
INSERT INTO `user` VALUES (347, '308', '308', 'Sylvester', 'Hurst', 0, 0, 0);
INSERT INTO `user` VALUES (348, '309', '309', 'Richard', 'Robinson', 1, 0, 0);
INSERT INTO `user` VALUES (349, '310', '310', 'Marshall', 'Russell', 1, 0, 0);
INSERT INTO `user` VALUES (350, '311', '311', 'Travis', 'Stout', 0, 0, 0);
INSERT INTO `user` VALUES (351, '312', '312', 'Tate', 'Alexander', 0, 0, 0);
INSERT INTO `user` VALUES (352, '313', '313', 'Reece', 'Rosario', 0, 0, 0);
INSERT INTO `user` VALUES (353, '314', '314', 'Nehru', 'Adams', 1, 0, 0);
INSERT INTO `user` VALUES (354, '315', '315', 'Berk', 'Puckett', 1, 0, 0);
INSERT INTO `user` VALUES (355, '316', '316', 'Jonas', 'Elliott', 0, 0, 0);
INSERT INTO `user` VALUES (356, '317', '317', 'Vincent', 'Vance', 1, 0, 0);
INSERT INTO `user` VALUES (357, '318', '318', 'Keegan', 'Oconnor', 1, 0, 0);
INSERT INTO `user` VALUES (358, '319', '319', 'Jackson', 'Brock', 0, 0, 0);
INSERT INTO `user` VALUES (359, '320', '320', 'Emmanuel', 'Dennis', 1, 0, 0);
INSERT INTO `user` VALUES (360, '321', '321', 'Kasimir', 'Meyers', 1, 0, 0);
INSERT INTO `user` VALUES (361, '322', '322', 'Forrest', 'Richard', 0, 0, 0);
INSERT INTO `user` VALUES (362, '323', '323', 'Ralph', 'Noble', 1, 0, 0);
INSERT INTO `user` VALUES (363, '324', '324', 'Wang', 'Hendricks', 0, 0, 0);
INSERT INTO `user` VALUES (364, '325', '325', 'Jin', 'Erickson', 1, 0, 0);
INSERT INTO `user` VALUES (365, '326', '326', 'Kenneth', 'Brady', 1, 0, 0);
INSERT INTO `user` VALUES (366, '327', '327', 'Kyle', 'Newman', 0, 0, 0);
INSERT INTO `user` VALUES (367, '328', '328', 'Clarke', 'Haney', 0, 0, 0);
INSERT INTO `user` VALUES (368, '329', '329', 'Gray', 'Lindsay', 0, 0, 0);
INSERT INTO `user` VALUES (369, '330', '330', 'Lane', 'Price', 1, 0, 0);
INSERT INTO `user` VALUES (370, '331', '331', 'Connor', 'Watts', 1, 0, 0);
INSERT INTO `user` VALUES (371, '332', '332', 'Jakeem', 'Jacobson', 1, 0, 0);
INSERT INTO `user` VALUES (372, '333', '333', 'Kieran', 'Donaldson', 0, 0, 0);
INSERT INTO `user` VALUES (373, '334', '334', 'Quentin', 'Compton', 0, 0, 0);
INSERT INTO `user` VALUES (374, '335', '335', 'Omar', 'Kaufman', 1, 0, 0);
INSERT INTO `user` VALUES (375, '336', '336', 'Tyler', 'Davis', 0, 0, 0);
INSERT INTO `user` VALUES (376, '337', '337', 'Ezekiel', 'Stevens', 1, 0, 0);
INSERT INTO `user` VALUES (377, '338', '338', 'Byron', 'Booker', 1, 0, 0);
INSERT INTO `user` VALUES (378, '339', '339', 'Jerome', 'Wilkinson', 1, 0, 0);
INSERT INTO `user` VALUES (379, '340', '340', 'Fulton', 'Erickson', 1, 0, 0);
INSERT INTO `user` VALUES (380, '341', '341', 'Ezra', 'Martinez', 1, 0, 0);
INSERT INTO `user` VALUES (381, '342', '342', 'Norman', 'Gillespie', 1, 0, 0);
INSERT INTO `user` VALUES (382, '343', '343', 'Merritt', 'Logan', 0, 0, 0);
INSERT INTO `user` VALUES (383, '344', '344', 'Lucas', 'Mcintosh', 0, 0, 0);
INSERT INTO `user` VALUES (384, '345', '345', 'Cameron', 'Flynn', 1, 0, 0);
INSERT INTO `user` VALUES (385, '346', '346', 'Maxwell', 'Allen', 0, 0, 0);
INSERT INTO `user` VALUES (386, '347', '347', 'Otto', 'Mendoza', 1, 0, 0);
INSERT INTO `user` VALUES (387, '348', '348', 'Barrett', 'Johnson', 1, 0, 0);
INSERT INTO `user` VALUES (388, '349', '349', 'Gil', 'Kelley', 0, 0, 0);
INSERT INTO `user` VALUES (389, '350', '350', 'Micah', 'Huber', 0, 0, 0);
INSERT INTO `user` VALUES (390, '351', '351', 'Benedict', 'Gilbert', 0, 0, 0);
INSERT INTO `user` VALUES (391, '352', '352', 'Allen', 'Bird', 1, 0, 0);
INSERT INTO `user` VALUES (392, '353', '353', 'Lucian', 'Albert', 1, 0, 0);
INSERT INTO `user` VALUES (393, '354', '354', 'Mason', 'Malone', 0, 0, 0);
INSERT INTO `user` VALUES (394, '355', '355', 'Jackson', 'Richard', 0, 0, 0);
INSERT INTO `user` VALUES (395, '356', '356', 'Jerry', 'Barr', 1, 0, 0);
INSERT INTO `user` VALUES (396, '357', '357', 'Graham', 'Tillman', 0, 0, 0);
INSERT INTO `user` VALUES (397, '358', '358', 'Blake', 'Hernandez', 1, 0, 0);
INSERT INTO `user` VALUES (398, '359', '359', 'Samson', 'Kidd', 0, 0, 0);
INSERT INTO `user` VALUES (399, '360', '360', 'Nicholas', 'Warner', 1, 0, 0);
INSERT INTO `user` VALUES (400, '361', '361', 'Samson', 'Johnson', 1, 0, 0);
INSERT INTO `user` VALUES (401, '362', '362', 'Rogan', 'Spears', 1, 0, 0);
INSERT INTO `user` VALUES (402, '363', '363', 'Demetrius', 'Mccarthy', 0, 0, 0);
INSERT INTO `user` VALUES (403, '364', '364', 'Slade', 'Bridges', 1, 0, 0);
INSERT INTO `user` VALUES (404, '365', '365', 'Murphy', 'Fleming', 1, 0, 0);
INSERT INTO `user` VALUES (405, '366', '366', 'Castor', 'Smith', 1, 0, 0);
INSERT INTO `user` VALUES (406, '367', '367', 'Kieran', 'Campos', 0, 0, 0);
INSERT INTO `user` VALUES (407, '368', '368', 'Benjamin', 'Oneal', 1, 0, 0);
INSERT INTO `user` VALUES (408, '369', '369', 'Clayton', 'Lynn', 0, 0, 0);
INSERT INTO `user` VALUES (409, '370', '370', 'Hall', 'Sosa', 0, 0, 0);
INSERT INTO `user` VALUES (410, '371', '371', 'Blaze', 'Bartlett', 1, 0, 0);
INSERT INTO `user` VALUES (411, '372', '372', 'Malik', 'Mcmahon', 0, 0, 0);
INSERT INTO `user` VALUES (412, '373', '373', 'Harper', 'Suarez', 0, 0, 0);
INSERT INTO `user` VALUES (413, '374', '374', 'Abdul', 'Booker', 1, 0, 0);
INSERT INTO `user` VALUES (414, '375', '375', 'Chadwick', 'Bernard', 0, 0, 0);
INSERT INTO `user` VALUES (415, '376', '376', 'Jerome', 'Dickerson', 0, 0, 0);
INSERT INTO `user` VALUES (416, '377', '377', 'Kaseem', 'Donaldson', 1, 0, 0);
INSERT INTO `user` VALUES (417, '378', '378', 'Hyatt', 'Poole', 1, 0, 0);
INSERT INTO `user` VALUES (418, '379', '379', 'Ali', 'Greene', 1, 0, 0);
INSERT INTO `user` VALUES (419, '380', '380', 'Hyatt', 'Porter', 1, 0, 0);
INSERT INTO `user` VALUES (420, '381', '381', 'Patrick', 'Lynn', 1, 0, 0);
INSERT INTO `user` VALUES (421, '382', '382', 'Oscar', 'Ellison', 0, 0, 0);
INSERT INTO `user` VALUES (422, '383', '383', 'Hiram', 'Haley', 1, 0, 0);
INSERT INTO `user` VALUES (423, '384', '384', 'Paul', 'Sweeney', 1, 0, 0);
INSERT INTO `user` VALUES (424, '385', '385', 'Blake', 'Douglas', 1, 0, 0);
INSERT INTO `user` VALUES (425, '386', '386', 'Dorian', 'Puckett', 1, 0, 0);
INSERT INTO `user` VALUES (426, '387', '387', 'Eaton', 'Eaton', 0, 0, 0);
INSERT INTO `user` VALUES (427, '388', '388', 'George', 'Ferguson', 1, 0, 0);
INSERT INTO `user` VALUES (428, '389', '389', 'Hashim', 'Giles', 0, 0, 0);
INSERT INTO `user` VALUES (429, '390', '390', 'Ray', 'Wooten', 0, 0, 0);
INSERT INTO `user` VALUES (430, '391', '391', 'Ahmed', 'Warner', 1, 0, 0);
INSERT INTO `user` VALUES (431, '392', '392', 'Raphael', 'Martinez', 0, 0, 0);
INSERT INTO `user` VALUES (432, '393', '393', 'Wyatt', 'Mathews', 1, 0, 0);
INSERT INTO `user` VALUES (433, '394', '394', 'Christopher', 'Norris', 0, 0, 0);
INSERT INTO `user` VALUES (434, '395', '395', 'Robert', 'Franco', 1, 0, 0);
INSERT INTO `user` VALUES (435, '396', '396', 'Oren', 'Adkins', 0, 0, 0);
INSERT INTO `user` VALUES (436, '397', '397', 'Hayden', 'Porter', 0, 0, 0);
INSERT INTO `user` VALUES (437, '398', '398', 'Damian', 'Stark', 1, 0, 0);
INSERT INTO `user` VALUES (438, '399', '399', 'Griffith', 'Marsh', 0, 0, 0);
INSERT INTO `user` VALUES (439, '', '', '', '', 0, 0, 0);
INSERT INTO `user` VALUES (440, 'Fuck', 'Fuck', 'Fuck', 'You', 0, 0, 0);
INSERT INTO `user` VALUES (441, 'Fuck2', 'Fuck2', 'Fuck', 'You', 0, 0, 0);
INSERT INTO `user` VALUES (442, 'TestCase1', 'TestCase1', 'Test', 'Case', 1, 0, 0);
INSERT INTO `user` VALUES (443, 'TestCase2', 'TestCase2', 'Test', 'Case2', 0, 0, 0);
INSERT INTO `user` VALUES (444, 'sdfs', 'sdfs', 'sdsd', 'sdfsdf', 0, 0, 0);
INSERT INTO `user` VALUES (445, 'TestCase3', 'TestCase3', 'Test', 'Case3', 1, 0, 5);
INSERT INTO `user` VALUES (446, 'aa', 'aaaaaaaaaaaaaaaaaaaaaa', 'aaaaaaaa', 'aaaa', 0, 0, 17);
INSERT INTO `user` VALUES (447, 'aaaaaaaaaaa', 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'aaaaaaaaaaaaaaaaaaa', 'aaaaaaaaaaaaaaaaaaaaaa', 0, 0, 0);
INSERT INTO `user` VALUES (448, 'admin', 'admin', 'admin', 'admin', 0, 0, 999999999);

SET FOREIGN_KEY_CHECKS = 1;
