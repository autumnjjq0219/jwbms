
CREATE DATABASE IF NOT EXISTS javaweb_books_management_system;

USE javaweb_books_management_system;

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES (1, 'root', '123456', '13100000000', NULL);
INSERT INTO `admin` VALUES (2, 'admin', 'admin', '13100000000', NULL);

-- ----------------------------
-- Table structure for book
-- ----------------------------
DROP TABLE IF EXISTS `book`;
CREATE TABLE `book`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `author` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `publisher` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `isbn` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `info` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `pricing` double NULL DEFAULT NULL,
  `is_borrowed` tinyint(4) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of book
-- ----------------------------
INSERT INTO `book` VALUES (1, 'Java编程项目实战', '罗骞编', '北京航空航天大学出版社有限公司 ', '978-7-5124-3674-9', '                                                                                                                                本书详细介绍了Java语言面向对象程序设计中的核心技术和编程技巧。另外本书还将Java教学与实战经验的知识点融入练习当中，通过练习让读者迅速的理解书中的知识点，并快速掌握Java技术的精髓，快速提高Java程序开发技能。本书适合Java从入门到精通各个层次的读者参考学习，Java初学者、Java编程爱好者、Java语言工程师等均可选择本书作为Java开发的实战指南和参考工具书，应用型高校计算机相关专业、培训机构也可选择本书作为Java算法、Java程序设计和面向对象编程的教材或参考书。\r\n                            \r\n                            \r\n                            \r\n                            ', 69, 0);
INSERT INTO `book` VALUES (2, 'JAVA程序设计', '张更路，李银锁主编', '北京：中国原子能出版社', '978-7-5221-0436-2', NULL, NULL, 1);
INSERT INTO `book` VALUES (3, 'Java语言程序设计', '张宏升，刘念，王莉主编', '长沙：湖南大学出版社', '978-7-5667-2245-4', NULL, 49.8, 0);
INSERT INTO `book` VALUES (4, 'Java语言程序设计', '王全新主编', '北京：北京邮电大学出版社', '978-7-5635-6167-4', '本书围绕面向对象的三大机制（封装、继承、多态），从介绍类和对象等基本概念出发，结合作者多年教学经验，循序渐渐地讲解了面向对象思想、集合、流、线程及网络编程等部分；同时，配有大量的实例介绍，有助于读者不断领悟相关概念的内涵。全书共有9个章节，主要内容包括搭建IDE环境、Java编程基础、面向对象程序设计（上）、面向对象程序设计（下）、Java中常用类、Java集合、输入输出流、Java多线程编程、Java网络编程。每个章节配有相应习题，便于读者巩固所学内容。本书适用面广，适用于本科或高职高专计算机科学与技术、电子商务', NULL, 0);
INSERT INTO `book` VALUES (5, 'Java Web应用开发', '周继松，马权主编', '重庆大学电子音像出版社', '978-7-89446-360-9', NULL, NULL, 0);
INSERT INTO `book` VALUES (6, 'C++函数式编程', '（塞尔维亚）伊凡·库奇著；程继洪，孙玉梅，娄山佑译', '北京：机械工业出版社', '978-7-111-64198-8', '本书主要介绍了C++的面向函数式编程，面向函数式编程是继面向对象编程之后又一编程范式，解决了命令式（过程式）编程与面向对象编程中出现的问题，是一种极具潜力的编程方式，值得研究学习。主要介绍了函数对象、纯洁性Purity、懒求值、Range、函数式数据结构、代数类型及模式匹配、Monad、模板元编程、并发系统的函数式设计，以及测试与调试等有关内容，还介绍了使用原有函数创建新函数的知识，全面介绍了C++中的函数式编程的内容。本书不仅可以作为C++程序员、编程爱好者以及软件工程师学习函数式编程的参考书，还可以作为高等院校C++编程语言的高级教材。', 79, 1);
INSERT INTO `book` VALUES (7, 'C++程序设计教程', '王樱，李浪主编；李康满，田小梅，刘新宇，郑光勇，尹友明副主编', '北京：中国铁道出版社', '978-7-113-25624-1', '本书共分两大部分。第一部分，第1章至第7章是基础部分，较为全面地介绍了程序设计语言C++的基本概念、基本语法和程序结构以及过程化程序思想，包含数据类型、语句和表达式、程序流程控制、数组与字符串、指针与引用、函数、宏与预编译等知识。第二部分，第8章至第14章，是面向对象程序设计部分，它建立在C++程序设计基础之上，讲述了面向对象程序设计方法。主要内容包括类与对象的基本概念、继承与派生、多态、输入输出流类库、模板、使用标准模板库STL、异常处理等，使得读者学习C++语言后，能够解决一些实际问题。', 45, 0);


-- ----------------------------
-- Table structure for borrowing
-- ----------------------------
DROP TABLE IF EXISTS `borrowing`;
CREATE TABLE `borrowing`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NULL DEFAULT NULL,
  `book_id` int(11) NULL DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `datetime` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of borrowing
-- ----------------------------
INSERT INTO `borrowing` VALUES (15, 1, 2, 'borrowing', '2023-01-07 20:53:08');
INSERT INTO `borrowing` VALUES (16, 1, 6, 'borrowing', '2023-01-07 20:53:09');
INSERT INTO `borrowing` VALUES (17, 1, 7, 'borrowing', '2023-01-07 20:53:15');
INSERT INTO `borrowing` VALUES (18, 1, 7, 'returning', '2023-01-07 20:53:17');
INSERT INTO `borrowing` VALUES (19, 1, 5, 'borrowing', '2023-01-07 20:53:24');
INSERT INTO `borrowing` VALUES (20, 1, 5, 'returning', '2023-01-07 20:53:26');
INSERT INTO `borrowing` VALUES (21, 2, 8, 'borrowing', '2023-01-12 15:37:51');
INSERT INTO `borrowing` VALUES (22, 2, 1, 'borrowing', '2023-01-12 18:25:34');
INSERT INTO `borrowing` VALUES (23, 2, 1, 'returning', '2023-01-12 18:25:36');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'user', '123', '13100000000');
INSERT INTO `user` VALUES (2, 'zhangsan', '123456', '13100000000');
INSERT INTO `user` VALUES (9, 'root', '31231', 'zd123');

SET FOREIGN_KEY_CHECKS = 1;
