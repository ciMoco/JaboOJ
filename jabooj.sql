/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 80036 (8.0.36)
 Source Host           : localhost:3306
 Source Schema         : jabooj

 Target Server Type    : MySQL
 Target Server Version : 80036 (8.0.36)
 File Encoding         : 65001

 Date: 31/03/2024 16:17:41
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for post
-- ----------------------------
DROP TABLE IF EXISTS `post`;
CREATE TABLE `post`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `title` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '标题',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '内容',
  `tags` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '标签列表（json 数组）',
  `thumbNum` int NOT NULL DEFAULT 0 COMMENT '点赞数',
  `favourNum` int NOT NULL DEFAULT 0 COMMENT '收藏数',
  `userId` bigint NOT NULL COMMENT '创建用户 id',
  `createTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updateTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `isDelete` tinyint NOT NULL DEFAULT 0 COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_userId`(`userId` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '帖子' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of post
-- ----------------------------

-- ----------------------------
-- Table structure for post_favour
-- ----------------------------
DROP TABLE IF EXISTS `post_favour`;
CREATE TABLE `post_favour`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `postId` bigint NOT NULL COMMENT '帖子 id',
  `userId` bigint NOT NULL COMMENT '创建用户 id',
  `createTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updateTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_postId`(`postId` ASC) USING BTREE,
  INDEX `idx_userId`(`userId` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_unicode_ci COMMENT = '帖子收藏' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of post_favour
-- ----------------------------

-- ----------------------------
-- Table structure for post_thumb
-- ----------------------------
DROP TABLE IF EXISTS `post_thumb`;
CREATE TABLE `post_thumb`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `postId` bigint NOT NULL COMMENT '帖子 id',
  `userId` bigint NOT NULL COMMENT '创建用户 id',
  `createTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updateTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_postId`(`postId` ASC) USING BTREE,
  INDEX `idx_userId`(`userId` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_unicode_ci COMMENT = '帖子点赞' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of post_thumb
-- ----------------------------

-- ----------------------------
-- Table structure for question
-- ----------------------------
DROP TABLE IF EXISTS `question`;
CREATE TABLE `question`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `title` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '标题',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '内容',
  `tags` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '标签列表（json 数组）',
  `answer` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '题目答案',
  `submitNum` int NOT NULL DEFAULT 0 COMMENT '题目提交数',
  `acceptedNum` int NOT NULL DEFAULT 0 COMMENT '题目通过数',
  `judgeCase` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '判题用例（json 数组）',
  `judgeConfig` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '判题配置（json 对象）',
  `thumbNum` int NOT NULL DEFAULT 0 COMMENT '点赞数',
  `favourNum` int NOT NULL DEFAULT 0 COMMENT '收藏数',
  `userId` bigint NOT NULL COMMENT '创建用户 id',
  `createTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updateTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `isDelete` tinyint NOT NULL DEFAULT 0 COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_userId`(`userId` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1758853230398115842 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '题目' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of question
-- ----------------------------
INSERT INTO `question` VALUES (1748632005234192385, '两数之和', '请输入 a + b\n\n## 示例输入\n1 2\n## 示例输出\n3', '[\"简单\"]', 'sum(a+b)', 0, 0, '[{\"input\":\"1 2\",\"output\":\"3\"}]', '{\"timeLimit\":1000,\"memoryLimit\":1000,\"stackLimit\":1000}', 0, 0, 1, '2024-01-20 17:02:12', '2024-02-17 21:17:54', 0);
INSERT INTO `question` VALUES (1758853116841529346, '三只小猪', 'a有1只小猪\nb有2只小猪\n问a和b有几只小猪', '[\"困难\",\"二叉树\"]', '3只小猪', 0, 0, '[{\"input\":\"1 2\",\"output\":\"3\"}]', '{\"timeLimit\":1000,\"memoryLimit\":1000,\"stackLimit\":1000}', 0, 0, 1, '2024-02-17 21:57:15', '2024-02-17 21:57:15', 0);
INSERT INTO `question` VALUES (1758853230398115841, '11', '111', '[\"11\",\"撒旦撒\"]', '11', 0, 0, '[{\"input\":\"\",\"output\":\"\"}]', '{\"timeLimit\":1000,\"memoryLimit\":1000,\"stackLimit\":1000}', 0, 0, 1, '2024-02-17 21:57:42', '2024-02-17 21:58:52', 1);

-- ----------------------------
-- Table structure for question_submit
-- ----------------------------
DROP TABLE IF EXISTS `question_submit`;
CREATE TABLE `question_submit`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `language` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL COMMENT '编程语言',
  `code` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL COMMENT '用户代码',
  `judgeInfo` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NULL COMMENT '判题信息（json 对象）',
  `status` int NOT NULL DEFAULT 0 COMMENT '判题状态（0 - 待判题、1 - 判题中、2 - 成功、3 - 失败）',
  `questionId` bigint NOT NULL COMMENT '题目 id',
  `userId` bigint NOT NULL COMMENT '创建用户 id',
  `createTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updateTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `isDelete` tinyint NOT NULL DEFAULT 0 COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_questionId`(`questionId` ASC) USING BTREE,
  INDEX `idx_userId`(`userId` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1769329218540359683 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_unicode_ci COMMENT = '题目提交' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of question_submit
-- ----------------------------
INSERT INTO `question_submit` VALUES (1749075092796420097, 'java', 'public class Main {\r\n	public static void main(String[] args) {\r\n		System.out.println(\"3\");\r\n	}\r\n}', '{}', 1, 1748632005234192385, 1, '2024-01-21 22:22:53', '2024-01-21 22:22:53', 0);
INSERT INTO `question_submit` VALUES (1749075325668372481, 'java', 'public class Main {\r\n	public static void main(String[] args) {\r\n		System.out.println(\"3\");\r\n	}\r\n}', '{}', 1, 1748632005234192385, 1, '2024-01-21 22:23:48', '2024-01-21 22:23:48', 0);
INSERT INTO `question_submit` VALUES (1749075803143745537, 'java', 'public class Main {\r\n	public static void main(String[] args) {\r\n		System.out.println(\"3\");\r\n	}\r\n}', '{\"message\":\"Accepted\",\"memory\":0,\"time\":41}', 2, 1748632005234192385, 1, '2024-01-21 22:25:42', '2024-01-21 22:25:43', 0);
INSERT INTO `question_submit` VALUES (1749076729946517506, 'java', 'public class Main {\r\n	public static void main(String[] args) {\r\n		System.out.println(\"4\");\r\n	}\r\n}', '{\"message\":\"Wrong Answer\",\"memory\":0,\"time\":29}', 2, 1748632005234192385, 1, '2024-01-21 22:29:23', '2024-01-21 22:29:23', 0);
INSERT INTO `question_submit` VALUES (1749076818416971778, 'java', 'public class Main {\r\n	public static void main(String[] args) {\r\n		System.out.println(\"3\");\r\n	}\r\n}', '{\"message\":\"Wrong Answer\",\"memory\":0,\"time\":29}', 2, 1748632005234192385, 1, '2024-01-21 22:29:44', '2024-01-21 22:29:45', 0);
INSERT INTO `question_submit` VALUES (1749076855582699522, 'java', 'public class Main {\r\n	public static void main(String[] args) {\r\n		System.out.println(\"4\");\r\n	}\r\n}', '{\"message\":\"Accepted\",\"memory\":0,\"time\":29}', 2, 1748632005234192385, 1, '2024-01-21 22:29:53', '2024-01-21 22:29:53', 0);
INSERT INTO `question_submit` VALUES (1749086990166188034, 'java', 'public class Main {\r\n	public static void main(String[] args) {\r\n		System.out.println(\"4\");\r\n	}\r\n}', '{\"message\":\"Accepted\",\"memory\":0,\"time\":23}', 2, 1748632005234192385, 1, '2024-01-21 23:10:09', '2024-01-21 23:10:11', 0);
INSERT INTO `question_submit` VALUES (1749087317225431041, 'java', 'public class Main {\r\n	public static void main(String[] args) {\r\n		System.out.println(\"3\");\r\n	}\r\n}', '{\"message\":\"Wrong Answer\",\"memory\":0,\"time\":18}', 2, 1748632005234192385, 1, '2024-01-21 23:11:27', '2024-01-21 23:11:47', 0);
INSERT INTO `question_submit` VALUES (1749090310494674945, 'java', 'public class Main {\r\n	public static void main(String[] args) {\r\n		System.out.println(\"3\");\r\n	}\r\n}', '{\"message\":\"Wrong Answer\",\"memory\":0,\"time\":28}', 2, 1748632005234192385, 1, '2024-01-21 23:23:21', '2024-01-21 23:23:34', 0);
INSERT INTO `question_submit` VALUES (1749090410432356353, 'java', 'public class Main {\r\n	public static void main(String[] args) {\r\n		System.out.println(\"4\");\r\n	}\r\n}', '{\"message\":\"Wrong Answer\",\"memory\":0,\"time\":15}', 2, 1748632005234192385, 1, '2024-01-21 23:23:45', '2024-01-21 23:23:54', 0);
INSERT INTO `question_submit` VALUES (1749090930156953602, 'java', 'public class Main {\r\n	public static void main(String[] args) {\r\n		System.out.println(\"4\");\r\n	}\r\n}', '{\"message\":\"Wrong Answer\",\"memory\":0,\"time\":17}', 2, 1748632005234192385, 1, '2024-01-21 23:25:48', '2024-01-21 23:25:58', 0);
INSERT INTO `question_submit` VALUES (1749091208327389186, 'java', 'public class Main {\r\n	public static void main(String[] args) {\r\n		System.out.println(\"4\");\r\n	}\r\n}', '{\"message\":\"Wrong Answer\",\"memory\":0,\"time\":17}', 2, 1748632005234192385, 1, '2024-01-21 23:26:55', '2024-01-21 23:27:02', 0);
INSERT INTO `question_submit` VALUES (1749091317148606466, 'java', 'public class Main {\r\n	public static void main(String[] args) {\r\n		System.out.println(\"4\");\r\n	}\r\n}', '{\"message\":\"Wrong Answer\",\"memory\":0,\"time\":16}', 2, 1748632005234192385, 1, '2024-01-21 23:27:21', '2024-01-21 23:27:32', 0);
INSERT INTO `question_submit` VALUES (1749091535722176513, 'java', 'public class Main {\r\n	public static void main(String[] args) {\r\n		System.out.println(\"4\");\r\n	}\r\n}', '{\"message\":\"Wrong Answer\",\"memory\":0,\"time\":26}', 2, 1748632005234192385, 1, '2024-01-21 23:28:13', '2024-01-21 23:28:22', 0);
INSERT INTO `question_submit` VALUES (1749091922269233153, 'java', 'public class Main {\r\n	public static void main(String[] args) {\r\n		System.out.println(\"3\");\r\n	}\r\n}', '{\"message\":\"Wrong Answer\",\"memory\":0,\"time\":30}', 2, 1748632005234192385, 1, '2024-01-21 23:29:45', '2024-01-21 23:29:46', 0);
INSERT INTO `question_submit` VALUES (1749091986664382465, 'java', 'public class Main {\r\n	public static void main(String[] args) {\r\n		System.out.println(\"4\");\r\n	}\r\n}', '{\"message\":\"Accepted\",\"memory\":0,\"time\":28}', 2, 1748632005234192385, 1, '2024-01-21 23:30:00', '2024-01-21 23:30:01', 0);
INSERT INTO `question_submit` VALUES (1749094899524624385, 'java', 'public class Main {\r\n	public static void main(String[] args) {\r\n		System.out.println(\"3\");\r\n	}\r\n}', '{\"message\":\"Wrong Answer\",\"memory\":0,\"time\":83}', 2, 1748632005234192385, 1, '2024-01-21 23:41:35', '2024-01-21 23:41:36', 0);
INSERT INTO `question_submit` VALUES (1749094957187915778, 'java', 'public class Main {\r\n	public static void main(String[] args) {\r\n		System.out.println(\"4\");\r\n	}\r\n}', '{\"message\":\"Accepted\",\"memory\":0,\"time\":75}', 2, 1748632005234192385, 1, '2024-01-21 23:41:49', '2024-01-21 23:41:49', 0);
INSERT INTO `question_submit` VALUES (1758378695295021057, 'java', 'public class Main {\r\n    public static void main(String[] args) {\r\n        System.out.println(3);\r\n    }\r\n}', '{\"message\":\"Wrong Answer\",\"memory\":0,\"time\":65}', 2, 1748632005234192385, 1758378414738092033, '2024-02-16 14:32:04', '2024-02-16 14:32:06', 0);
INSERT INTO `question_submit` VALUES (1758840950994341890, 'java', '撒旦撒', '{}', 1, 1748632005234192385, 1, '2024-02-17 21:08:55', '2024-02-17 21:08:55', 0);
INSERT INTO `question_submit` VALUES (1758841602172620801, 'java', 'public class Main {\r\n    public static void main(String[] args) {\r\n        int a = 1;\r\n        int b = 2;\r\n        int sum = a + b;\r\n        System.out.println(sum);\r\n    }\r\n}', '{\"message\":\"Wrong Answer\",\"memory\":0,\"time\":75}', 2, 1748632005234192385, 1, '2024-02-17 21:11:30', '2024-02-17 21:11:30', 0);
INSERT INTO `question_submit` VALUES (1758841684104155137, 'java', 'public class Main {\r\n    public static void main(String[] args) {\r\n        int a = 1;\r\n        int b = 2;\r\n        int sum = a + b;\r\n        System.out.println(3);\r\n    }\r\n}', '{\"message\":\"Wrong Answer\",\"memory\":0,\"time\":74}', 2, 1748632005234192385, 1, '2024-02-17 21:11:49', '2024-02-17 21:11:50', 0);
INSERT INTO `question_submit` VALUES (1758843121315975169, 'java', 'public class Main {\r\n	public static void main(String[] args) {\r\n		System.out.println(\"4\");\r\n	}\r\n}', '{\"message\":\"Accepted\",\"memory\":0,\"time\":74}', 2, 1748632005234192385, 1, '2024-02-17 21:17:32', '2024-02-17 21:17:33', 0);
INSERT INTO `question_submit` VALUES (1758843269236494338, 'java', 'public class Main {\r\n	public static void main(String[] args) {\r\n		System.out.println(\"4\");\r\n	}\r\n}', '{\"message\":\"Wrong Answer\",\"memory\":0,\"time\":73}', 2, 1748632005234192385, 1, '2024-02-17 21:18:07', '2024-02-17 21:18:08', 0);
INSERT INTO `question_submit` VALUES (1758843434785673217, 'java', 'public class Main {\r\n	public static void main(String[] args) {\r\n        int a=1;\r\n        int b=2;\r\n		System.out.println(a+b);\r\n	}\r\n}', '{\"message\":\"Accepted\",\"memory\":0,\"time\":74}', 2, 1748632005234192385, 1, '2024-02-17 21:18:47', '2024-02-17 21:18:47', 0);
INSERT INTO `question_submit` VALUES (1758843473134194689, 'java', 'public class Main {\r\n	public static void main(String[] args) {\r\n        int a=1;\r\n        int b=2;\r\n		System.out.println(a+b);\r\n	}\r\n}', '{\"message\":\"Accepted\",\"memory\":0,\"time\":74}', 2, 1748632005234192385, 1, '2024-02-17 21:18:56', '2024-02-17 21:18:56', 0);
INSERT INTO `question_submit` VALUES (1767850731226583042, 'java', 'ghg', '{}', 1, 1748632005234192385, 1, '2024-03-13 17:50:34', '2024-03-13 17:50:34', 0);
INSERT INTO `question_submit` VALUES (1769329049597988866, 'java', 'public class Main {  \r\n    public static void main(String[] args) {  \r\n        System.out.println(3);  \r\n    }  \r\n}', '{}', 1, 1748632005234192385, 1, '2024-03-17 19:44:52', '2024-03-17 19:44:52', 0);
INSERT INTO `question_submit` VALUES (1769329218540359682, 'java', 'public class Main {  \r\n    public static void main(String[] args) {  \r\n        System.out.println(3);  \r\n    }  \r\n}', '{\"message\":\"Accepted\",\"memory\":0,\"time\":71}', 2, 1748632005234192385, 1, '2024-03-17 19:45:32', '2024-03-17 19:45:33', 0);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `userAccount` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '账号',
  `userPassword` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '密码',
  `unionId` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '微信开放平台id',
  `mpOpenId` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '公众号openId',
  `userName` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '用户昵称',
  `userAvatar` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '用户头像',
  `userProfile` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '用户简介',
  `userRole` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'user' COMMENT '用户角色：user/admin/ban',
  `createTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updateTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `isDelete` tinyint NOT NULL DEFAULT 0 COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_unionId`(`unionId` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1758847417419894786 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '用户' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'admin', '9fe9f35de890677c75bac3c6a5cc4c61', NULL, NULL, '管理员宇芙', NULL, NULL, 'admin', '2024-01-15 20:42:57', '2024-01-15 20:45:07', 0);
INSERT INTO `user` VALUES (1746422126343925762, 'test', '9404bd919153b3d031f0d84f50436650', NULL, NULL, '测试', NULL, NULL, 'user', '2024-01-14 14:40:56', '2024-01-15 20:44:39', 0);
INSERT INTO `user` VALUES (1758378414738092033, 'zhujing', '9404bd919153b3d031f0d84f50436650', NULL, NULL, NULL, NULL, NULL, 'user', '2024-02-16 14:30:57', '2024-02-16 14:30:57', 0);
INSERT INTO `user` VALUES (1758847417419894785, 'yinjiabao', '9404bd919153b3d031f0d84f50436650', NULL, NULL, NULL, NULL, NULL, 'user', '2024-02-17 21:34:36', '2024-02-17 21:34:36', 0);

SET FOREIGN_KEY_CHECKS = 1;
