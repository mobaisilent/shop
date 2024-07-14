/*
 Navicat Premium Data Transfer

 Source Server         : asus
 Source Server Type    : MySQL
 Source Server Version : 80100
 Source Host           : 172.31.250.4:3306
 Source Schema         : mall_demo

 Target Server Type    : MySQL
 Target Server Version : 80100
 File Encoding         : 65001

 Date: 14/07/2024 20:24:45
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for address
-- ----------------------------
DROP TABLE IF EXISTS `address`;
CREATE TABLE `address`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) NULL DEFAULT NULL,
  `updated_at` datetime(3) NULL DEFAULT NULL,
  `deleted_at` datetime(3) NULL DEFAULT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `address` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_address_deleted_at`(`deleted_at` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 99 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of address
-- ----------------------------
INSERT INTO `address` VALUES (43, '2024-05-23 11:42:40.509', '2024-05-23 11:42:40.509', '2024-05-23 12:49:56.224', 3, '', '', 'test1');
INSERT INTO `address` VALUES (44, '2024-05-23 12:04:35.540', '2024-05-23 12:04:35.540', '2024-05-23 12:47:12.304', 3, '', '', 'test2');
INSERT INTO `address` VALUES (45, '2024-05-23 12:54:08.390', '2024-05-23 12:54:08.390', '2024-05-23 12:57:52.418', 3, '', '', 'test1');
INSERT INTO `address` VALUES (46, '2024-05-23 12:54:13.327', '2024-05-23 12:54:13.327', '2024-05-23 13:00:03.322', 3, '', '', 'test2');
INSERT INTO `address` VALUES (47, '2024-05-23 13:00:23.239', '2024-05-23 13:00:23.239', '2024-05-23 13:00:45.578', 3, '', '', 'TEST1');
INSERT INTO `address` VALUES (48, '2024-05-23 13:00:27.559', '2024-05-23 13:00:27.559', '2024-05-23 13:00:47.897', 3, '', '', 'TEST12');
INSERT INTO `address` VALUES (49, '2024-05-23 13:00:33.927', '2024-05-23 13:00:33.927', '2024-05-23 13:00:51.985', 3, '', '', 'TEST12434');
INSERT INTO `address` VALUES (50, '2024-05-23 13:03:15.507', '2024-05-23 13:03:15.507', '2024-05-23 13:03:26.147', 3, '', '', 'hello');
INSERT INTO `address` VALUES (51, '2024-05-23 13:03:20.877', '2024-05-23 13:03:20.877', '2024-05-23 13:03:28.620', 3, '', '', 'hello2');
INSERT INTO `address` VALUES (52, '2024-05-23 13:04:54.691', '2024-05-23 13:04:54.691', '2024-05-23 13:09:20.073', 3, '', '', 'a');
INSERT INTO `address` VALUES (53, '2024-05-24 13:05:39.170', '2024-05-24 13:05:39.170', '2024-05-26 02:44:58.005', 3, '', '', 'test1');
INSERT INTO `address` VALUES (54, '2024-05-24 13:05:44.485', '2024-05-24 13:05:44.485', '2024-05-26 02:45:14.307', 3, '', '', 'test2');
INSERT INTO `address` VALUES (55, '2024-05-24 13:12:07.567', '2024-05-24 13:12:07.567', '2024-05-26 02:45:16.025', 3, '', '', 'test3');
INSERT INTO `address` VALUES (56, '2024-05-24 13:13:05.999', '2024-05-24 13:13:05.999', '2024-05-26 02:45:17.461', 3, '', '', '');
INSERT INTO `address` VALUES (57, '2024-05-24 13:13:25.241', '2024-05-24 13:13:25.241', '2024-05-26 02:45:18.910', 3, '', '', '');
INSERT INTO `address` VALUES (58, '2024-05-24 13:13:30.929', '2024-05-24 13:13:30.929', '2024-05-26 02:45:20.628', 3, '', '', '');
INSERT INTO `address` VALUES (59, '2024-05-26 02:46:40.138', '2024-05-26 02:46:40.138', '2024-05-28 02:22:21.603', 3, '', '', 'test1');
INSERT INTO `address` VALUES (60, '2024-05-26 02:46:45.266', '2024-05-26 02:46:45.266', '2024-05-28 02:59:12.472', 3, '', '', 'test2');
INSERT INTO `address` VALUES (61, '2024-05-26 07:24:21.760', '2024-05-26 07:24:21.760', '2024-05-26 07:25:13.353', 5, '', '', 'testaddress1');
INSERT INTO `address` VALUES (62, '2024-05-26 07:26:14.556', '2024-05-26 07:26:14.556', NULL, 5, '', '', 'testaddress2');
INSERT INTO `address` VALUES (63, '2024-05-27 13:49:53.239', '2024-05-27 13:49:53.239', '2024-05-27 13:50:53.568', 7, '', '', 'test1');
INSERT INTO `address` VALUES (64, '2024-05-27 13:50:15.704', '2024-05-27 13:50:15.704', '2024-05-27 13:50:55.586', 7, '', '', 'test2');
INSERT INTO `address` VALUES (65, '2024-05-27 13:51:02.254', '2024-05-27 13:51:02.254', '2024-05-27 13:51:12.901', 7, '', '', 'test1');
INSERT INTO `address` VALUES (66, '2024-05-27 13:51:06.418', '2024-05-27 13:51:06.418', '2024-05-27 13:51:14.775', 7, '', '', 'test2');
INSERT INTO `address` VALUES (67, '2024-05-27 13:51:35.665', '2024-05-27 13:51:35.665', '2024-05-27 13:52:51.180', 7, '', '', 'test1');
INSERT INTO `address` VALUES (68, '2024-05-27 13:54:31.861', '2024-05-27 13:54:31.861', '2024-05-27 13:57:19.200', 7, '', '', 'test1');
INSERT INTO `address` VALUES (69, '2024-05-27 13:57:30.296', '2024-05-27 13:57:30.296', '2024-05-27 13:57:35.843', 7, '', '', 'test1');
INSERT INTO `address` VALUES (70, '2024-05-28 02:59:48.536', '2024-05-28 02:59:48.536', '2024-05-28 03:03:36.625', 3, '', '', 'test1');
INSERT INTO `address` VALUES (71, '2024-05-28 02:59:54.219', '2024-05-28 02:59:54.219', '2024-05-28 03:04:46.084', 3, '', '', 'test2');
INSERT INTO `address` VALUES (72, '2024-05-28 03:04:52.647', '2024-05-28 03:04:52.647', '2024-05-28 03:05:11.653', 3, '', '', 'test1');
INSERT INTO `address` VALUES (73, '2024-05-28 03:04:57.868', '2024-05-28 03:04:57.868', '2024-05-28 03:08:49.804', 3, '', '', 'test2');
INSERT INTO `address` VALUES (74, '2024-05-28 03:05:04.653', '2024-05-28 03:05:04.653', '2024-05-28 03:09:00.449', 3, '', '', 'test3');
INSERT INTO `address` VALUES (75, '2024-05-28 03:09:09.374', '2024-05-28 03:09:09.374', '2024-05-28 03:11:09.254', 3, '', '', 'test1');
INSERT INTO `address` VALUES (76, '2024-05-28 03:09:13.877', '2024-05-28 03:09:13.877', '2024-05-28 03:11:20.878', 3, '', '', 'test2');
INSERT INTO `address` VALUES (77, '2024-05-28 03:09:19.021', '2024-05-28 03:09:19.021', '2024-05-28 03:11:24.998', 3, '', '', 'test3');
INSERT INTO `address` VALUES (78, '2024-05-28 03:15:57.700', '2024-05-28 03:15:57.700', '2024-05-28 03:16:01.696', 3, '', '', 'test1');
INSERT INTO `address` VALUES (79, '2024-05-28 03:16:07.534', '2024-05-28 03:16:07.534', '2024-05-28 03:16:19.053', 3, '', '', 'test1');
INSERT INTO `address` VALUES (80, '2024-05-28 03:16:29.995', '2024-05-28 03:16:29.995', '2024-05-28 03:16:33.311', 3, '', '', 'test1');
INSERT INTO `address` VALUES (81, '2024-05-28 03:17:54.344', '2024-05-28 03:17:54.344', '2024-05-28 06:44:42.625', 3, '', '', 'test1');
INSERT INTO `address` VALUES (82, '2024-05-28 06:44:57.507', '2024-05-28 06:44:57.507', '2024-06-01 09:23:20.225', 3, '', '', 'test1');
INSERT INTO `address` VALUES (83, '2024-05-28 13:20:09.111', '2024-05-28 13:20:09.111', NULL, 4, '', '', 'test1');
INSERT INTO `address` VALUES (84, '2024-05-28 13:30:35.597', '2024-05-28 13:30:35.597', '2024-06-01 09:21:15.844', 8, '', '', 'admin');
INSERT INTO `address` VALUES (85, '2024-05-28 13:48:47.722', '2024-05-28 13:48:47.722', NULL, 9, '', '', 'aaa_test1');
INSERT INTO `address` VALUES (86, '2024-05-28 16:58:42.334', '2024-05-28 16:58:42.334', NULL, 10, '', '', 'tt');
INSERT INTO `address` VALUES (87, '2024-06-01 09:21:46.500', '2024-06-01 09:21:46.500', '2024-06-01 09:21:57.959', 8, '', '', 'admin');
INSERT INTO `address` VALUES (88, '2024-06-01 09:22:05.684', '2024-06-01 09:22:05.684', NULL, 8, '', '', 'admin');
INSERT INTO `address` VALUES (89, '2024-06-01 09:45:41.511', '2024-06-01 09:45:41.511', '2024-06-01 10:39:42.368', 3, '', '', 'tt');
INSERT INTO `address` VALUES (90, '2024-06-01 10:37:55.758', '2024-06-01 10:37:55.758', '2024-06-01 10:40:51.531', 3, '', '', 'testaddress1');
INSERT INTO `address` VALUES (91, '2024-06-01 10:38:09.583', '2024-06-01 10:38:09.583', '2024-06-01 10:40:55.813', 3, '', '', 'testaddress2');
INSERT INTO `address` VALUES (92, '2024-06-01 11:00:07.915', '2024-06-01 11:00:07.915', NULL, 3, '', '', 'testaddress1');
INSERT INTO `address` VALUES (93, '2024-06-03 07:36:48.741', '2024-06-03 07:36:48.741', NULL, 16, '', '', 'testaddress');
INSERT INTO `address` VALUES (94, '2024-06-03 07:43:58.880', '2024-06-03 07:43:58.880', '2024-06-03 07:44:10.950', 17, '', '', 'testaddress1');
INSERT INTO `address` VALUES (95, '2024-06-03 07:44:03.436', '2024-06-03 07:44:03.436', '2024-06-03 07:44:19.893', 17, '', '', 'testaddress2');
INSERT INTO `address` VALUES (96, '2024-06-03 07:44:33.500', '2024-06-03 07:44:33.500', NULL, 17, '', '', 'testaddress3');
INSERT INTO `address` VALUES (97, '2024-06-19 11:51:22.481', '2024-06-19 11:51:22.481', '2024-06-19 11:51:40.899', 18, '', '', 'testaddress1');
INSERT INTO `address` VALUES (98, '2024-06-19 11:51:29.917', '2024-06-19 11:51:29.917', '2024-06-19 11:55:23.427', 18, '', '', 'testaddress2');

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) NULL DEFAULT NULL,
  `updated_at` datetime(3) NULL DEFAULT NULL,
  `deleted_at` datetime(3) NULL DEFAULT NULL,
  `user_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `password` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_admin_deleted_at`(`deleted_at` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of admin
-- ----------------------------

-- ----------------------------
-- Table structure for carousel
-- ----------------------------
DROP TABLE IF EXISTS `carousel`;
CREATE TABLE `carousel`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) NULL DEFAULT NULL,
  `updated_at` datetime(3) NULL DEFAULT NULL,
  `deleted_at` datetime(3) NULL DEFAULT NULL,
  `img_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_carousel_deleted_at`(`deleted_at` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of carousel
-- ----------------------------

-- ----------------------------
-- Table structure for cart
-- ----------------------------
DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) NULL DEFAULT NULL,
  `updated_at` datetime(3) NULL DEFAULT NULL,
  `deleted_at` datetime(3) NULL DEFAULT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `boss_id` bigint UNSIGNED NOT NULL,
  `num` bigint UNSIGNED NOT NULL,
  `max_num` bigint UNSIGNED NOT NULL,
  `check` tinyint(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_cart_deleted_at`(`deleted_at` ASC) USING BTREE,
  INDEX `fk_cart_product`(`product_id` ASC) USING BTREE,
  INDEX `fk_cart_boss`(`boss_id` ASC) USING BTREE,
  CONSTRAINT `fk_cart_boss` FOREIGN KEY (`boss_id`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_cart_product` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of cart
-- ----------------------------
INSERT INTO `cart` VALUES (1, '2024-05-24 13:34:08.370', '2024-05-24 13:34:08.370', '2024-05-24 13:37:42.996', 3, 3, 3, 1, 100, 0);
INSERT INTO `cart` VALUES (2, '2024-05-24 13:35:32.317', '2024-05-24 13:35:32.317', NULL, 3, 3, 3, 1, 100, 0);
INSERT INTO `cart` VALUES (3, '2024-05-24 13:35:49.938', '2024-05-24 13:35:49.938', NULL, 3, 3, 3, 1, 100, 0);
INSERT INTO `cart` VALUES (4, '2024-05-24 13:35:57.522', '2024-05-24 13:35:57.522', NULL, 3, 4, 3, 1, 100, 0);
INSERT INTO `cart` VALUES (5, '2024-05-24 13:36:12.681', '2024-05-24 13:36:12.681', NULL, 3, 4, 3, 1, 100, 0);

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) NULL DEFAULT NULL,
  `updated_at` datetime(3) NULL DEFAULT NULL,
  `deleted_at` datetime(3) NULL DEFAULT NULL,
  `category_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_category_deleted_at`(`deleted_at` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of category
-- ----------------------------

-- ----------------------------
-- Table structure for favorite
-- ----------------------------
DROP TABLE IF EXISTS `favorite`;
CREATE TABLE `favorite`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) NULL DEFAULT NULL,
  `updated_at` datetime(3) NULL DEFAULT NULL,
  `deleted_at` datetime(3) NULL DEFAULT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `boss_id` bigint UNSIGNED NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_favorite_deleted_at`(`deleted_at` ASC) USING BTREE,
  INDEX `fk_favorite_user`(`user_id` ASC) USING BTREE,
  INDEX `fk_favorite_product`(`product_id` ASC) USING BTREE,
  INDEX `fk_favorite_boss`(`boss_id` ASC) USING BTREE,
  CONSTRAINT `fk_favorite_boss` FOREIGN KEY (`boss_id`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_favorite_product` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_favorite_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of favorite
-- ----------------------------
INSERT INTO `favorite` VALUES (1, '2024-05-26 07:31:33.124', '2024-05-26 07:31:33.124', NULL, 3, 3, 3);

-- ----------------------------
-- Table structure for notice
-- ----------------------------
DROP TABLE IF EXISTS `notice`;
CREATE TABLE `notice`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) NULL DEFAULT NULL,
  `updated_at` datetime(3) NULL DEFAULT NULL,
  `deleted_at` datetime(3) NULL DEFAULT NULL,
  `text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_notice_deleted_at`(`deleted_at` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of notice
-- ----------------------------

-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) NULL DEFAULT NULL,
  `updated_at` datetime(3) NULL DEFAULT NULL,
  `deleted_at` datetime(3) NULL DEFAULT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `boss_id` bigint UNSIGNED NOT NULL,
  `address_id` bigint UNSIGNED NOT NULL,
  `num` bigint NOT NULL,
  `order_num` bigint UNSIGNED NOT NULL,
  `type` bigint UNSIGNED NOT NULL,
  `money` double NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_order_deleted_at`(`deleted_at` ASC) USING BTREE,
  INDEX `fk_order_product`(`product_id` ASC) USING BTREE,
  INDEX `fk_order_boss`(`boss_id` ASC) USING BTREE,
  INDEX `fk_order_address`(`address_id` ASC) USING BTREE,
  CONSTRAINT `fk_order_address` FOREIGN KEY (`address_id`) REFERENCES `address` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_order_boss` FOREIGN KEY (`boss_id`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_order_product` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 81 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of order
-- ----------------------------
INSERT INTO `order` VALUES (37, '2024-05-28 07:06:05.043', '2024-05-28 07:21:07.458', NULL, 3, 3, 3, 82, 1, 934993630, 1, -6700);
INSERT INTO `order` VALUES (38, '2024-05-28 07:15:07.306', '2024-05-28 07:21:13.332', NULL, 3, 3, 3, 82, 1, 834925630, 1, -6700);
INSERT INTO `order` VALUES (39, '2024-05-28 07:21:54.410', '2024-05-28 07:29:44.234', NULL, 3, 3, 3, 82, 1, 5683230, 1, -6700);
INSERT INTO `order` VALUES (40, '2024-05-28 07:21:59.631', '2024-05-28 07:29:44.189', NULL, 3, 3, 3, 82, 1, 750616730, 1, -6700);
INSERT INTO `order` VALUES (41, '2024-05-28 07:28:54.973', '2024-05-28 07:28:54.973', NULL, 3, 3, 3, 82, 1, 740722030, 0, -4100);
INSERT INTO `order` VALUES (42, '2024-05-28 07:36:17.780', '2024-05-28 07:36:17.780', NULL, 3, 3, 3, 82, 1, 975610730, 0, -2000);
INSERT INTO `order` VALUES (43, '2024-05-28 07:36:37.151', '2024-05-28 07:36:37.151', NULL, 3, 3, 3, 82, 1, 148914830, 0, -2100);
INSERT INTO `order` VALUES (44, '2024-05-28 07:37:52.889', '2024-05-28 07:37:52.889', NULL, 3, 3, 3, 82, 1, 422935030, 0, -2000);
INSERT INTO `order` VALUES (45, '2024-05-28 07:40:27.210', '2024-05-28 07:40:27.210', NULL, 3, 3, 3, 82, 1, 959295930, 0, -2200);
INSERT INTO `order` VALUES (46, '2024-05-28 07:44:12.140', '2024-05-28 07:44:12.140', NULL, 3, 3, 3, 82, 1, 944664730, 0, -2100);
INSERT INTO `order` VALUES (47, '2024-05-28 07:45:09.304', '2024-05-28 07:45:09.304', NULL, 3, 3, 3, 82, 1, 454928030, 0, -2000);
INSERT INTO `order` VALUES (48, '2024-05-28 07:57:37.640', '2024-05-28 07:57:37.640', NULL, 3, 3, 3, 82, 1, 141418230, 0, -4300);
INSERT INTO `order` VALUES (49, '2024-05-28 07:57:38.817', '2024-05-28 07:57:38.817', NULL, 3, 3, 3, 82, 1, 811022330, 0, -4300);
INSERT INTO `order` VALUES (50, '2024-05-28 07:58:55.928', '2024-05-28 07:58:55.928', NULL, 3, 3, 3, 82, 1, 12902630, 0, -2000);
INSERT INTO `order` VALUES (51, '2024-05-28 08:01:10.716', '2024-05-28 08:01:10.716', NULL, 3, 3, 3, 82, 1, 141349930, 0, -4100);
INSERT INTO `order` VALUES (52, '2024-05-28 13:20:16.400', '2024-05-28 13:20:21.863', NULL, 4, 3, 3, 83, 1, 376498630, 1, -4100);
INSERT INTO `order` VALUES (53, '2024-05-28 13:22:07.882', '2024-05-28 13:22:19.901', NULL, 4, 3, 3, 83, 1, 912395730, 1, -4100);
INSERT INTO `order` VALUES (54, '2024-05-28 13:24:27.686', '2024-05-28 13:24:32.266', NULL, 4, 3, 3, 83, 1, 698710030, 1, 2100);
INSERT INTO `order` VALUES (55, '2024-05-28 13:30:40.913', '2024-05-28 13:30:44.066', NULL, 8, 3, 8, 84, 1, 362898330, 1, 4100);
INSERT INTO `order` VALUES (56, '2024-05-28 13:31:45.251', '2024-05-28 13:31:47.688', NULL, 4, 3, 8, 83, 1, 552797630, 1, 6300);
INSERT INTO `order` VALUES (57, '2024-05-28 13:32:32.686', '2024-05-28 13:32:37.728', NULL, 4, 3, 8, 83, 1, 82476030, 1, 6000);
INSERT INTO `order` VALUES (58, '2024-05-28 13:35:18.194', '2024-05-28 13:35:25.034', NULL, 4, 3, 8, 83, 1, 823598230, 1, 2000);
INSERT INTO `order` VALUES (59, '2024-05-28 13:50:10.659', '2024-05-28 13:50:15.897', NULL, 9, 3, 8, 85, 1, 531593730, 1, 4100);
INSERT INTO `order` VALUES (60, '2024-05-28 13:57:55.022', '2024-05-28 13:57:55.022', NULL, 3, 3, 8, 82, 1, 837796930, 0, 2000);
INSERT INTO `order` VALUES (61, '2024-05-28 15:56:42.231', '2024-05-28 15:56:42.231', NULL, 3, 3, 8, 82, 1, 621152430, 0, 2000);
INSERT INTO `order` VALUES (62, '2024-05-28 16:58:59.672', '2024-05-28 16:58:59.672', NULL, 10, 3, 8, 86, 1, 14412530, 0, 4100);
INSERT INTO `order` VALUES (63, '2024-05-28 16:59:09.270', '2024-05-28 16:59:13.493', NULL, 10, 3, 8, 86, 1, 172835830, 1, 4100);
INSERT INTO `order` VALUES (64, '2024-05-28 17:02:57.014', '2024-05-28 17:02:57.014', NULL, 10, 3, 8, 86, 1, 40447430, 0, 2000);
INSERT INTO `order` VALUES (65, '2024-05-28 17:03:03.361', '2024-05-28 17:03:06.541', NULL, 10, 3, 8, 86, 1, 81558430, 1, 2000);
INSERT INTO `order` VALUES (66, '2024-06-01 10:21:08.157', '2024-06-01 10:21:08.157', NULL, 3, 3, 8, 89, 1, 676184030, 0, 6300);
INSERT INTO `order` VALUES (67, '2024-06-01 10:21:41.346', '2024-06-01 10:21:41.346', NULL, 3, 3, 8, 89, 1, 717016930, 0, 6300);
INSERT INTO `order` VALUES (68, '2024-06-01 10:22:40.983', '2024-06-01 10:22:40.983', NULL, 3, 3, 8, 89, 1, 13509330, 0, 6300);
INSERT INTO `order` VALUES (69, '2024-06-01 10:23:53.503', '2024-06-01 10:23:55.569', NULL, 8, 3, 8, 88, 1, 309918930, 1, 6300);
INSERT INTO `order` VALUES (70, '2024-06-01 10:25:13.333', '2024-06-01 10:25:13.333', NULL, 8, 3, 8, 88, 1, 354367630, 0, 6300);
INSERT INTO `order` VALUES (71, '2024-06-01 10:26:08.238', '2024-06-01 10:26:08.238', NULL, 8, 3, 8, 88, 1, 827354230, 0, 4300);
INSERT INTO `order` VALUES (72, '2024-06-01 10:27:03.735', '2024-06-01 10:27:03.735', NULL, 8, 3, 8, 88, 1, 120943830, 0, 2200);
INSERT INTO `order` VALUES (73, '2024-06-01 10:29:03.025', '2024-06-01 10:29:03.025', NULL, 8, 3, 8, 88, 1, 981284230, 0, 2200);
INSERT INTO `order` VALUES (74, '2024-06-03 07:36:55.181', '2024-06-03 07:36:55.181', NULL, 16, 3, 8, 93, 1, 204909830, 0, 11500);
INSERT INTO `order` VALUES (75, '2024-06-03 07:45:42.008', '2024-06-03 07:45:42.008', NULL, 17, 3, 8, 96, 1, 793758630, 0, 13400);
INSERT INTO `order` VALUES (76, '2024-06-03 07:46:26.482', '2024-06-03 07:46:29.394', NULL, 17, 3, 8, 96, 1, 959385130, 1, 7400);
INSERT INTO `order` VALUES (77, '2024-06-17 11:41:30.850', '2024-06-17 11:41:30.850', NULL, 5, 3, 8, 62, 1, 878364330, 0, 2200);
INSERT INTO `order` VALUES (78, '2024-06-17 11:41:34.272', '2024-06-17 11:41:34.272', NULL, 5, 3, 8, 62, 1, 967629930, 0, 2200);
INSERT INTO `order` VALUES (79, '2024-06-19 11:52:10.417', '2024-06-19 11:52:10.417', NULL, 18, 3, 8, 98, 1, 320111230, 0, 10600);
INSERT INTO `order` VALUES (80, '2024-06-19 11:52:40.948', '2024-06-19 11:52:45.867', NULL, 18, 3, 8, 98, 1, 93763630, 1, 6300);

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) NULL DEFAULT NULL,
  `updated_at` datetime(3) NULL DEFAULT NULL,
  `deleted_at` datetime(3) NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `category_id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `info` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `img_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `price` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `discount_price` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `on_sale` tinyint(1) NULL DEFAULT 0,
  `num` bigint NOT NULL,
  `boss_id` bigint UNSIGNED NOT NULL,
  `boss_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `boss_avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_product_deleted_at`(`deleted_at` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES (3, '2024-05-22 13:03:51.073', '2024-06-19 11:52:45.857', NULL, '双开门冰箱', 1, '双开门冰箱', '双开门冰箱', 'boss3/双开门冰箱.jpg', '2000', '1999', 1, -22, 8, 'c', 'avatar.jpg');
INSERT INTO `product` VALUES (4, '2024-05-22 13:05:19.437', '2024-05-22 13:05:19.437', NULL, '电视', 2, '电视', '电视', 'boss3/电视.jpg', '2100', '2099', 1, 2, 8, 'c', 'avatar.jpg');
INSERT INTO `product` VALUES (5, '2024-05-22 13:05:57.930', '2024-05-22 13:05:57.930', NULL, '洗衣机', 3, '洗衣机', '洗衣机', 'boss3/洗衣机.jpg', '2200', '2199', 1, 3, 8, 'c', 'avatar.jpg');
INSERT INTO `product` VALUES (6, '2024-05-22 13:19:10.734', '2024-05-22 13:19:10.734', NULL, '空调', 4, '空调', '空调', 'boss3/空调.jpg', '4300', '4299', 1, 4, 8, 'c', 'avatar.jpg');
INSERT INTO `product` VALUES (7, '2024-05-22 13:19:37.995', '2024-05-22 13:19:37.995', NULL, '热水器', 5, '热水器', '热水器', 'boss3/热水器.jpg', '2400', '2399', 1, 5, 8, 'c', 'avatar.jpg');
INSERT INTO `product` VALUES (8, '2024-05-22 13:20:10.302', '2024-05-22 13:20:10.302', NULL, '笔记本电脑', 6, '笔记本电脑', '笔记本电脑', 'boss3/笔记本电脑.jpg', '7000', '6999', 1, 6, 8, 'c', 'avatar.jpg');
INSERT INTO `product` VALUES (9, '2024-05-22 13:20:41.565', '2024-05-22 13:20:41.565', NULL, '手机', 7, '手机', '手机', 'boss3/手机.jpg', '6000', '5999', 1, 7, 8, 'c', 'avatar.jpg');
INSERT INTO `product` VALUES (10, '2024-05-22 13:21:28.412', '2024-05-22 13:21:28.412', NULL, '平板电脑', 8, '平板电脑', '平板电脑', 'boss3/平板电脑.jpg', '3000', '2999', 1, 8, 8, 'c', 'avatar.jpg');
INSERT INTO `product` VALUES (11, '2024-05-22 13:22:10.449', '2024-05-22 13:22:10.449', NULL, '数码相机', 9, '数码相机', '数码相机', 'boss3/数码相机.jpg', '5000', '4999', 1, 9, 8, 'c', 'avatar.jpg');
INSERT INTO `product` VALUES (12, '2024-05-22 13:23:36.534', '2024-05-22 13:23:36.534', NULL, '3C配件', 10, '3C配件', '3C配件', 'boss3/3C配件.jpg', '500', '499', 1, 10, 8, 'c', 'avatar.jpg');

-- ----------------------------
-- Table structure for product_img
-- ----------------------------
DROP TABLE IF EXISTS `product_img`;
CREATE TABLE `product_img`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) NULL DEFAULT NULL,
  `updated_at` datetime(3) NULL DEFAULT NULL,
  `deleted_at` datetime(3) NULL DEFAULT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `img_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_product_img_deleted_at`(`deleted_at` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of product_img
-- ----------------------------
INSERT INTO `product_img` VALUES (3, '2024-05-22 13:03:51.081', '2024-05-22 13:03:51.081', NULL, 3, 'boss3/双开门冰箱0.jpg');
INSERT INTO `product_img` VALUES (4, '2024-05-22 13:05:19.444', '2024-05-22 13:05:19.444', NULL, 4, 'boss3/电视0.jpg');
INSERT INTO `product_img` VALUES (5, '2024-05-22 13:05:57.937', '2024-05-22 13:05:57.937', NULL, 5, 'boss3/洗衣机0.jpg');
INSERT INTO `product_img` VALUES (6, '2024-05-22 13:19:10.742', '2024-05-22 13:19:10.742', NULL, 6, 'boss3/空调0.jpg');
INSERT INTO `product_img` VALUES (7, '2024-05-22 13:19:38.002', '2024-05-22 13:19:38.002', NULL, 7, 'boss3/热水器0.jpg');
INSERT INTO `product_img` VALUES (8, '2024-05-22 13:20:10.310', '2024-05-22 13:20:10.310', NULL, 8, 'boss3/笔记本电脑0.jpg');
INSERT INTO `product_img` VALUES (9, '2024-05-22 13:20:41.574', '2024-05-22 13:20:41.574', NULL, 9, 'boss3/手机0.jpg');
INSERT INTO `product_img` VALUES (10, '2024-05-22 13:21:28.421', '2024-05-22 13:21:28.421', NULL, 10, 'boss3/平板电脑0.jpg');
INSERT INTO `product_img` VALUES (11, '2024-05-22 13:22:10.456', '2024-05-22 13:22:10.456', NULL, 11, 'boss3/数码相机0.jpg');
INSERT INTO `product_img` VALUES (12, '2024-05-22 13:23:36.547', '2024-05-22 13:23:36.547', NULL, 12, 'boss3/3C配件0.jpg');

-- ----------------------------
-- Table structure for sec_kill_order
-- ----------------------------
DROP TABLE IF EXISTS `sec_kill_order`;
CREATE TABLE `sec_kill_order`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) NULL DEFAULT NULL,
  `updated_at` datetime(3) NULL DEFAULT NULL,
  `deleted_at` datetime(3) NULL DEFAULT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `sec_kill_product_id` bigint UNSIGNED NOT NULL,
  `boss_id` bigint UNSIGNED NOT NULL,
  `address_id` bigint UNSIGNED NOT NULL,
  `num` bigint NOT NULL,
  `sec_kill_order_num` bigint UNSIGNED NOT NULL,
  `type` bigint UNSIGNED NOT NULL,
  `money` double NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_sec_kill_order_deleted_at`(`deleted_at` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sec_kill_order
-- ----------------------------

-- ----------------------------
-- Table structure for sec_kill_product
-- ----------------------------
DROP TABLE IF EXISTS `sec_kill_product`;
CREATE TABLE `sec_kill_product`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) NULL DEFAULT NULL,
  `updated_at` datetime(3) NULL DEFAULT NULL,
  `deleted_at` datetime(3) NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `category_id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `info` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `img_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `price` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `sec_kill_price` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `num` bigint NOT NULL,
  `boss_id` bigint UNSIGNED NOT NULL,
  `boss_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `boss_avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_sec_kill_product_deleted_at`(`deleted_at` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 257 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sec_kill_product
-- ----------------------------
INSERT INTO `sec_kill_product` VALUES (114, '2024-06-01 08:56:08.630', '2024-06-01 08:56:08.630', NULL, '秒杀3C配件', 10, '秒杀3C配件', '秒杀3C配件', 'boss8/秒杀3C配件.jpg', '500', '250', 200000, 8, 'admin', 'user8/admin.jpg');
INSERT INTO `sec_kill_product` VALUES (115, '2024-06-01 08:56:38.760', '2024-06-01 08:56:38.760', NULL, '秒杀3C配件', 10, '秒杀3C配件', '秒杀3C配件', 'boss8/秒杀3C配件.jpg', '500', '250', 200000, 8, 'admin', 'user8/admin.jpg');
INSERT INTO `sec_kill_product` VALUES (116, '2024-06-01 08:56:40.166', '2024-06-01 08:56:40.166', NULL, '秒杀3C配件', 10, '秒杀3C配件', '秒杀3C配件', 'boss8/秒杀3C配件.jpg', '500', '250', 200000, 8, 'admin', 'user8/admin.jpg');
INSERT INTO `sec_kill_product` VALUES (117, '2024-06-01 08:56:42.333', '2024-06-01 08:56:42.333', NULL, '秒杀3C配件', 10, '秒杀3C配件', '秒杀3C配件', 'boss8/秒杀3C配件.jpg', '500', '250', 200000, 8, 'admin', 'user8/admin.jpg');
INSERT INTO `sec_kill_product` VALUES (118, '2024-06-01 08:57:01.001', '2024-06-01 08:57:01.001', NULL, '秒杀3C配件', 10, '秒杀3C配件', '秒杀3C配件', 'boss8/秒杀3C配件.jpg', '500', '250', 200000, 8, 'admin', 'user8/admin.jpg');
INSERT INTO `sec_kill_product` VALUES (119, '2024-06-01 08:57:06.390', '2024-06-01 08:57:06.390', NULL, '秒杀3C配件', 10, '秒杀3C配件', '秒杀3C配件', 'boss8/秒杀3C配件.jpg', '500', '250', 200000, 8, 'admin', 'user8/admin.jpg');
INSERT INTO `sec_kill_product` VALUES (120, '2024-06-01 08:57:09.330', '2024-06-01 08:57:09.330', NULL, '秒杀3C配件', 10, '秒杀3C配件', '秒杀3C配件', 'boss8/秒杀3C配件.jpg', '500', '250', 200000, 8, 'admin', 'user8/admin.jpg');
INSERT INTO `sec_kill_product` VALUES (121, '2024-06-01 08:57:17.506', '2024-06-01 08:57:17.506', NULL, '秒杀3C配件', 10, '秒杀3C配件', '秒杀3C配件', 'boss8/秒杀3C配件.jpg', '500', '250', 200000, 8, 'admin', 'user8/admin.jpg');
INSERT INTO `sec_kill_product` VALUES (122, '2024-06-01 08:58:31.544', '2024-06-01 08:58:31.544', NULL, '秒杀3C配件', 10, '秒杀3C配件', '秒杀3C配件', 'boss8/秒杀3C配件.jpg', '500', '250', 200000, 8, 'admin', 'user8/admin.jpg');
INSERT INTO `sec_kill_product` VALUES (123, '2024-06-01 08:58:45.978', '2024-06-01 08:58:45.978', NULL, '秒杀3C配件', 10, '秒杀3C配件', '秒杀3C配件', 'boss8/秒杀3C配件.jpg', '500', '250', 200000, 8, 'admin', 'user8/admin.jpg');
INSERT INTO `sec_kill_product` VALUES (124, '2024-06-01 08:58:46.617', '2024-06-01 08:58:46.617', NULL, '秒杀3C配件', 10, '秒杀3C配件', '秒杀3C配件', 'boss8/秒杀3C配件.jpg', '500', '250', 200000, 8, 'admin', 'user8/admin.jpg');
INSERT INTO `sec_kill_product` VALUES (125, '2024-06-01 08:59:13.802', '2024-06-01 08:59:13.802', NULL, '秒杀3C配件', 10, '秒杀3C配件', '秒杀3C配件', 'boss8/秒杀3C配件.jpg', '500', '250', 200000, 8, 'admin', 'user8/admin.jpg');
INSERT INTO `sec_kill_product` VALUES (126, '2024-06-01 08:59:28.736', '2024-06-01 08:59:28.736', NULL, '秒杀3C配件', 10, '秒杀3C配件', '秒杀3C配件', 'boss8/秒杀3C配件.jpg', '500', '250', 200000, 8, 'admin', 'user8/admin.jpg');
INSERT INTO `sec_kill_product` VALUES (127, '2024-06-01 08:59:30.590', '2024-06-01 08:59:30.590', NULL, '秒杀3C配件', 10, '秒杀3C配件', '秒杀3C配件', 'boss8/秒杀3C配件.jpg', '500', '250', 200000, 8, 'admin', 'user8/admin.jpg');
INSERT INTO `sec_kill_product` VALUES (128, '2024-06-01 09:00:01.191', '2024-06-01 09:00:01.191', NULL, '秒杀3C配件', 10, '秒杀3C配件', '秒杀3C配件', 'boss8/秒杀3C配件.jpg', '500', '250', 200000, 8, 'admin', 'user8/admin.jpg');
INSERT INTO `sec_kill_product` VALUES (129, '2024-06-01 09:00:07.802', '2024-06-01 09:00:07.802', NULL, '秒杀3C配件', 10, '秒杀3C配件', '秒杀3C配件', 'boss8/秒杀3C配件.jpg', '500', '250', 200000, 8, 'admin', 'user8/admin.jpg');
INSERT INTO `sec_kill_product` VALUES (130, '2024-06-01 09:00:19.317', '2024-06-01 09:00:19.317', NULL, '秒杀3C配件', 10, '秒杀3C配件', '秒杀3C配件', 'boss8/秒杀3C配件.jpg', '500', '250', 200000, 8, 'admin', 'user8/admin.jpg');
INSERT INTO `sec_kill_product` VALUES (131, '2024-06-01 09:00:21.934', '2024-06-01 09:00:21.934', NULL, '秒杀3C配件', 10, '秒杀3C配件', '秒杀3C配件', 'boss8/秒杀3C配件.jpg', '500', '250', 200000, 8, 'admin', 'user8/admin.jpg');
INSERT INTO `sec_kill_product` VALUES (132, '2024-06-01 09:00:23.051', '2024-06-01 09:00:23.051', NULL, '秒杀3C配件', 10, '秒杀3C配件', '秒杀3C配件', 'boss8/秒杀3C配件.jpg', '500', '250', 200000, 8, 'admin', 'user8/admin.jpg');
INSERT INTO `sec_kill_product` VALUES (133, '2024-06-01 09:00:33.645', '2024-06-01 09:00:33.645', NULL, '秒杀3C配件', 10, '秒杀3C配件', '秒杀3C配件', 'boss8/秒杀3C配件.jpg', '500', '250', 200000, 8, 'admin', 'user8/admin.jpg');
INSERT INTO `sec_kill_product` VALUES (134, '2024-06-01 09:00:35.724', '2024-06-01 09:00:35.724', NULL, '秒杀3C配件', 10, '秒杀3C配件', '秒杀3C配件', 'boss8/秒杀3C配件.jpg', '500', '250', 200000, 8, 'admin', 'user8/admin.jpg');
INSERT INTO `sec_kill_product` VALUES (135, '2024-06-01 09:00:38.442', '2024-06-01 09:00:38.442', NULL, '秒杀3C配件', 10, '秒杀3C配件', '秒杀3C配件', 'boss8/秒杀3C配件.jpg', '500', '250', 200000, 8, 'admin', 'user8/admin.jpg');
INSERT INTO `sec_kill_product` VALUES (136, '2024-06-01 09:00:45.969', '2024-06-01 09:00:45.969', NULL, '秒杀3C配件', 10, '秒杀3C配件', '秒杀3C配件', 'boss8/秒杀3C配件.jpg', '500', '250', 200000, 8, 'admin', 'user8/admin.jpg');
INSERT INTO `sec_kill_product` VALUES (137, '2024-06-01 09:00:52.972', '2024-06-01 09:00:52.972', NULL, '秒杀3C配件', 10, '秒杀3C配件', '秒杀3C配件', 'boss8/秒杀3C配件.jpg', '500', '250', 200000, 8, 'admin', 'user8/admin.jpg');
INSERT INTO `sec_kill_product` VALUES (138, '2024-06-01 09:00:55.476', '2024-06-01 09:00:55.476', NULL, '秒杀3C配件', 10, '秒杀3C配件', '秒杀3C配件', 'boss8/秒杀3C配件.jpg', '500', '250', 200000, 8, 'admin', 'user8/admin.jpg');
INSERT INTO `sec_kill_product` VALUES (139, '2024-06-01 09:01:01.152', '2024-06-01 09:01:01.152', NULL, '秒杀3C配件', 10, '秒杀3C配件', '秒杀3C配件', 'boss8/秒杀3C配件.jpg', '500', '250', 200000, 8, 'admin', 'user8/admin.jpg');
INSERT INTO `sec_kill_product` VALUES (140, '2024-06-01 09:01:02.517', '2024-06-01 09:01:02.517', NULL, '秒杀3C配件', 10, '秒杀3C配件', '秒杀3C配件', 'boss8/秒杀3C配件.jpg', '500', '250', 200000, 8, 'admin', 'user8/admin.jpg');
INSERT INTO `sec_kill_product` VALUES (141, '2024-06-01 09:01:11.698', '2024-06-01 09:01:11.698', NULL, '秒杀3C配件', 10, '秒杀3C配件', '秒杀3C配件', 'boss8/秒杀3C配件.jpg', '500', '250', 200000, 8, 'admin', 'user8/admin.jpg');
INSERT INTO `sec_kill_product` VALUES (142, '2024-06-01 09:01:35.144', '2024-06-01 09:01:35.144', NULL, '秒杀3C配件', 10, '秒杀3C配件', '秒杀3C配件', 'boss8/秒杀3C配件.jpg', '500', '250', 200000, 8, 'admin', 'user8/admin.jpg');
INSERT INTO `sec_kill_product` VALUES (143, '2024-06-01 09:01:41.553', '2024-06-01 09:01:41.553', NULL, '秒杀3C配件', 10, '秒杀3C配件', '秒杀3C配件', 'boss8/秒杀3C配件.jpg', '500', '250', 200000, 8, 'admin', 'user8/admin.jpg');
INSERT INTO `sec_kill_product` VALUES (144, '2024-06-01 09:01:56.806', '2024-06-01 09:01:56.806', NULL, '秒杀3C配件', 10, '秒杀3C配件', '秒杀3C配件', 'boss8/秒杀3C配件.jpg', '500', '250', 200000, 8, 'admin', 'user8/admin.jpg');
INSERT INTO `sec_kill_product` VALUES (145, '2024-06-01 09:02:10.620', '2024-06-01 09:02:10.620', NULL, '秒杀3C配件', 10, '秒杀3C配件', '秒杀3C配件', 'boss8/秒杀3C配件.jpg', '500', '250', 200000, 8, 'admin', 'user8/admin.jpg');
INSERT INTO `sec_kill_product` VALUES (146, '2024-06-01 09:03:39.004', '2024-06-01 09:03:39.004', NULL, '秒杀3C配件', 10, '秒杀3C配件', '秒杀3C配件', 'boss8/秒杀3C配件.jpg', '500', '250', 200000, 8, 'admin', 'user8/admin.jpg');
INSERT INTO `sec_kill_product` VALUES (147, '2024-06-01 09:04:02.486', '2024-06-01 09:04:02.486', NULL, '秒杀3C配件', 10, '秒杀3C配件', '秒杀3C配件', 'boss8/秒杀3C配件.jpg', '500', '250', 200000, 8, 'admin', 'user8/admin.jpg');
INSERT INTO `sec_kill_product` VALUES (148, '2024-06-01 09:04:11.541', '2024-06-01 09:04:11.541', NULL, '秒杀3C配件', 10, '秒杀3C配件', '秒杀3C配件', 'boss8/秒杀3C配件.jpg', '500', '250', 200000, 8, 'admin', 'user8/admin.jpg');
INSERT INTO `sec_kill_product` VALUES (149, '2024-06-01 09:04:12.560', '2024-06-01 09:04:12.560', NULL, '秒杀3C配件', 10, '秒杀3C配件', '秒杀3C配件', 'boss8/秒杀3C配件.jpg', '500', '250', 200000, 8, 'admin', 'user8/admin.jpg');
INSERT INTO `sec_kill_product` VALUES (150, '2024-06-01 09:04:21.918', '2024-06-01 09:04:21.918', NULL, '秒杀3C配件', 10, '秒杀3C配件', '秒杀3C配件', 'boss8/秒杀3C配件.jpg', '500', '250', 200000, 8, 'admin', 'user8/admin.jpg');
INSERT INTO `sec_kill_product` VALUES (151, '2024-06-01 09:04:24.792', '2024-06-01 09:04:24.792', NULL, '秒杀3C配件', 10, '秒杀3C配件', '秒杀3C配件', 'boss8/秒杀3C配件.jpg', '500', '250', 200000, 8, 'admin', 'user8/admin.jpg');
INSERT INTO `sec_kill_product` VALUES (152, '2024-06-01 09:07:30.427', '2024-06-01 09:07:30.427', NULL, '秒杀3C配件', 10, '秒杀3C配件', '秒杀3C配件', 'boss8/秒杀3C配件.jpg', '500', '250', 200000, 8, 'admin', 'user8/admin.jpg');
INSERT INTO `sec_kill_product` VALUES (153, '2024-06-01 09:08:53.917', '2024-06-01 09:08:53.917', NULL, '秒杀3C配件', 10, '秒杀3C配件', '秒杀3C配件', 'boss8/秒杀3C配件.jpg', '500', '250', 200000, 8, 'admin', 'user8/admin.jpg');
INSERT INTO `sec_kill_product` VALUES (154, '2024-06-01 09:08:56.560', '2024-06-01 09:08:56.560', NULL, '秒杀3C配件', 10, '秒杀3C配件', '秒杀3C配件', 'boss8/秒杀3C配件.jpg', '500', '250', 200000, 8, 'admin', 'user8/admin.jpg');
INSERT INTO `sec_kill_product` VALUES (155, '2024-06-01 09:08:58.181', '2024-06-01 09:08:58.181', NULL, '秒杀3C配件', 10, '秒杀3C配件', '秒杀3C配件', 'boss8/秒杀3C配件.jpg', '500', '250', 200000, 8, 'admin', 'user8/admin.jpg');
INSERT INTO `sec_kill_product` VALUES (156, '2024-06-01 09:09:02.231', '2024-06-01 09:09:02.231', NULL, '秒杀3C配件', 10, '秒杀3C配件', '秒杀3C配件', 'boss8/秒杀3C配件.jpg', '500', '250', 200000, 8, 'admin', 'user8/admin.jpg');
INSERT INTO `sec_kill_product` VALUES (157, '2024-06-01 09:10:51.450', '2024-06-01 09:10:51.450', NULL, '秒杀3C配件', 10, '秒杀3C配件', '秒杀3C配件', 'boss8/秒杀3C配件.jpg', '500', '250', 200000, 8, 'admin', 'user8/admin.jpg');
INSERT INTO `sec_kill_product` VALUES (158, '2024-06-01 09:10:57.610', '2024-06-01 09:10:57.610', NULL, '秒杀3C配件', 10, '秒杀3C配件', '秒杀3C配件', 'boss8/秒杀3C配件.jpg', '500', '250', 200000, 8, 'admin', 'user8/admin.jpg');
INSERT INTO `sec_kill_product` VALUES (159, '2024-06-01 09:11:02.583', '2024-06-01 09:11:02.583', NULL, '秒杀3C配件', 10, '秒杀3C配件', '秒杀3C配件', 'boss8/秒杀3C配件.jpg', '500', '250', 200000, 8, 'admin', 'user8/admin.jpg');
INSERT INTO `sec_kill_product` VALUES (160, '2024-06-01 09:11:05.703', '2024-06-01 09:11:05.703', NULL, '秒杀3C配件', 10, '秒杀3C配件', '秒杀3C配件', 'boss8/秒杀3C配件.jpg', '500', '250', 200000, 8, 'admin', 'user8/admin.jpg');
INSERT INTO `sec_kill_product` VALUES (161, '2024-06-01 09:11:09.708', '2024-06-01 09:11:09.708', NULL, '秒杀3C配件', 10, '秒杀3C配件', '秒杀3C配件', 'boss8/秒杀3C配件.jpg', '500', '250', 200000, 8, 'admin', 'user8/admin.jpg');
INSERT INTO `sec_kill_product` VALUES (162, '2024-06-01 09:11:24.606', '2024-06-01 09:11:24.606', NULL, '秒杀3C配件', 10, '秒杀3C配件', '秒杀3C配件', 'boss8/秒杀3C配件.jpg', '500', '250', 200000, 8, 'admin', 'user8/admin.jpg');
INSERT INTO `sec_kill_product` VALUES (163, '2024-06-01 09:11:26.474', '2024-06-01 09:11:26.474', NULL, '秒杀3C配件', 10, '秒杀3C配件', '秒杀3C配件', 'boss8/秒杀3C配件.jpg', '500', '250', 200000, 8, 'admin', 'user8/admin.jpg');
INSERT INTO `sec_kill_product` VALUES (164, '2024-06-01 09:11:39.126', '2024-06-01 09:11:39.126', NULL, '秒杀3C配件', 10, '秒杀3C配件', '秒杀3C配件', 'boss8/秒杀3C配件.jpg', '500', '250', 200000, 8, 'admin', 'user8/admin.jpg');
INSERT INTO `sec_kill_product` VALUES (165, '2024-06-01 09:11:52.645', '2024-06-01 09:11:52.645', NULL, '秒杀3C配件', 10, '秒杀3C配件', '秒杀3C配件', 'boss8/秒杀3C配件.jpg', '500', '250', 200000, 8, 'admin', 'user8/admin.jpg');
INSERT INTO `sec_kill_product` VALUES (166, '2024-06-01 09:12:01.794', '2024-06-01 09:12:01.794', NULL, '秒杀3C配件', 10, '秒杀3C配件', '秒杀3C配件', 'boss8/秒杀3C配件.jpg', '500', '250', 200000, 8, 'admin', 'user8/admin.jpg');
INSERT INTO `sec_kill_product` VALUES (167, '2024-06-01 09:12:19.432', '2024-06-01 09:12:19.432', NULL, '秒杀3C配件', 10, '秒杀3C配件', '秒杀3C配件', 'boss8/秒杀3C配件.jpg', '500', '250', 200000, 8, 'admin', 'user8/admin.jpg');
INSERT INTO `sec_kill_product` VALUES (168, '2024-06-01 09:12:20.697', '2024-06-01 09:12:20.697', NULL, '秒杀3C配件', 10, '秒杀3C配件', '秒杀3C配件', 'boss8/秒杀3C配件.jpg', '500', '250', 200000, 8, 'admin', 'user8/admin.jpg');
INSERT INTO `sec_kill_product` VALUES (169, '2024-06-01 09:12:49.800', '2024-06-01 09:12:49.800', NULL, '秒杀3C配件', 10, '秒杀3C配件', '秒杀3C配件', 'boss8/秒杀3C配件.jpg', '500', '250', 200000, 8, 'admin', 'user8/admin.jpg');
INSERT INTO `sec_kill_product` VALUES (170, '2024-06-01 09:13:00.981', '2024-06-01 09:13:00.981', NULL, '秒杀3C配件', 10, '秒杀3C配件', '秒杀3C配件', 'boss8/秒杀3C配件.jpg', '500', '250', 200000, 8, 'admin', 'user8/admin.jpg');
INSERT INTO `sec_kill_product` VALUES (171, '2024-06-01 09:13:07.049', '2024-06-01 09:13:07.049', NULL, '秒杀3C配件', 10, '秒杀3C配件', '秒杀3C配件', 'boss8/秒杀3C配件.jpg', '500', '250', 200000, 8, 'admin', 'user8/admin.jpg');
INSERT INTO `sec_kill_product` VALUES (172, '2024-06-01 09:13:15.566', '2024-06-01 09:13:15.566', NULL, '秒杀3C配件', 10, '秒杀3C配件', '秒杀3C配件', 'boss8/秒杀3C配件.jpg', '500', '250', 200000, 8, 'admin', 'user8/admin.jpg');
INSERT INTO `sec_kill_product` VALUES (173, '2024-06-01 09:13:19.780', '2024-06-01 09:13:19.780', NULL, '秒杀3C配件', 10, '秒杀3C配件', '秒杀3C配件', 'boss8/秒杀3C配件.jpg', '500', '250', 200000, 8, 'admin', 'user8/admin.jpg');
INSERT INTO `sec_kill_product` VALUES (174, '2024-06-01 09:13:22.107', '2024-06-01 09:13:22.107', NULL, '秒杀3C配件', 10, '秒杀3C配件', '秒杀3C配件', 'boss8/秒杀3C配件.jpg', '500', '250', 200000, 8, 'admin', 'user8/admin.jpg');
INSERT INTO `sec_kill_product` VALUES (175, '2024-06-01 09:13:23.516', '2024-06-01 09:13:23.516', NULL, '秒杀3C配件', 10, '秒杀3C配件', '秒杀3C配件', 'boss8/秒杀3C配件.jpg', '500', '250', 200000, 8, 'admin', 'user8/admin.jpg');
INSERT INTO `sec_kill_product` VALUES (176, '2024-06-01 09:14:16.613', '2024-06-01 09:14:16.613', NULL, '秒杀3C配件', 10, '秒杀3C配件', '秒杀3C配件', 'boss8/秒杀3C配件.jpg', '500', '250', 200000, 8, 'admin', 'user8/admin.jpg');
INSERT INTO `sec_kill_product` VALUES (177, '2024-06-01 09:14:21.168', '2024-06-01 09:14:21.168', NULL, '秒杀3C配件', 10, '秒杀3C配件', '秒杀3C配件', 'boss8/秒杀3C配件.jpg', '500', '250', 200000, 8, 'admin', 'user8/admin.jpg');
INSERT INTO `sec_kill_product` VALUES (178, '2024-06-01 09:14:33.154', '2024-06-01 09:14:33.154', NULL, '秒杀3C配件', 10, '秒杀3C配件', '秒杀3C配件', 'boss8/秒杀3C配件.jpg', '500', '250', 200000, 8, 'admin', 'user8/admin.jpg');
INSERT INTO `sec_kill_product` VALUES (179, '2024-06-01 09:14:36.452', '2024-06-01 09:14:36.452', NULL, '秒杀3C配件', 10, '秒杀3C配件', '秒杀3C配件', 'boss8/秒杀3C配件.jpg', '500', '250', 200000, 8, 'admin', 'user8/admin.jpg');
INSERT INTO `sec_kill_product` VALUES (180, '2024-06-01 09:14:43.825', '2024-06-01 09:14:43.825', NULL, '秒杀3C配件', 10, '秒杀3C配件', '秒杀3C配件', 'boss8/秒杀3C配件.jpg', '500', '250', 200000, 8, 'admin', 'user8/admin.jpg');
INSERT INTO `sec_kill_product` VALUES (181, '2024-06-01 09:14:46.571', '2024-06-01 09:14:46.571', NULL, '秒杀3C配件', 10, '秒杀3C配件', '秒杀3C配件', 'boss8/秒杀3C配件.jpg', '500', '250', 200000, 8, 'admin', 'user8/admin.jpg');
INSERT INTO `sec_kill_product` VALUES (182, '2024-06-01 09:14:47.631', '2024-06-01 09:14:47.631', NULL, '秒杀3C配件', 10, '秒杀3C配件', '秒杀3C配件', 'boss8/秒杀3C配件.jpg', '500', '250', 200000, 8, 'admin', 'user8/admin.jpg');
INSERT INTO `sec_kill_product` VALUES (183, '2024-06-01 09:15:02.623', '2024-06-01 09:15:02.623', NULL, '秒杀3C配件', 10, '秒杀3C配件', '秒杀3C配件', 'boss8/秒杀3C配件.jpg', '500', '250', 200000, 8, 'admin', 'user8/admin.jpg');
INSERT INTO `sec_kill_product` VALUES (184, '2024-06-01 09:15:17.161', '2024-06-01 09:15:17.161', NULL, '秒杀3C配件', 10, '秒杀3C配件', '秒杀3C配件', 'boss8/秒杀3C配件.jpg', '500', '250', 200000, 8, 'admin', 'user8/admin.jpg');
INSERT INTO `sec_kill_product` VALUES (185, '2024-06-01 09:15:31.868', '2024-06-01 09:15:31.868', NULL, '秒杀3C配件', 10, '秒杀3C配件', '秒杀3C配件', 'boss8/秒杀3C配件.jpg', '500', '250', 200000, 8, 'admin', 'user8/admin.jpg');
INSERT INTO `sec_kill_product` VALUES (186, '2024-06-01 09:15:37.314', '2024-06-01 09:15:37.314', NULL, '秒杀3C配件', 10, '秒杀3C配件', '秒杀3C配件', 'boss8/秒杀3C配件.jpg', '500', '250', 200000, 8, 'admin', 'user8/admin.jpg');
INSERT INTO `sec_kill_product` VALUES (187, '2024-06-01 09:15:42.384', '2024-06-01 09:15:42.384', NULL, '秒杀3C配件', 10, '秒杀3C配件', '秒杀3C配件', 'boss8/秒杀3C配件.jpg', '500', '250', 200000, 8, 'admin', 'user8/admin.jpg');
INSERT INTO `sec_kill_product` VALUES (188, '2024-06-01 09:15:46.911', '2024-06-01 09:15:46.911', NULL, '秒杀3C配件', 10, '秒杀3C配件', '秒杀3C配件', 'boss8/秒杀3C配件.jpg', '500', '250', 200000, 8, 'admin', 'user8/admin.jpg');
INSERT INTO `sec_kill_product` VALUES (189, '2024-06-01 09:15:49.733', '2024-06-01 09:15:49.733', NULL, '秒杀3C配件', 10, '秒杀3C配件', '秒杀3C配件', 'boss8/秒杀3C配件.jpg', '500', '250', 200000, 8, 'admin', 'user8/admin.jpg');
INSERT INTO `sec_kill_product` VALUES (190, '2024-06-01 09:15:52.369', '2024-06-01 09:15:52.369', NULL, '秒杀3C配件', 10, '秒杀3C配件', '秒杀3C配件', 'boss8/秒杀3C配件.jpg', '500', '250', 200000, 8, 'admin', 'user8/admin.jpg');
INSERT INTO `sec_kill_product` VALUES (191, '2024-06-01 09:16:02.915', '2024-06-01 09:16:02.915', NULL, '秒杀3C配件', 10, '秒杀3C配件', '秒杀3C配件', 'boss8/秒杀3C配件.jpg', '500', '250', 200000, 8, 'admin', 'user8/admin.jpg');
INSERT INTO `sec_kill_product` VALUES (192, '2024-06-01 09:16:45.810', '2024-06-01 09:16:45.810', NULL, '秒杀3C配件', 10, '秒杀3C配件', '秒杀3C配件', 'boss8/秒杀3C配件.jpg', '500', '250', 200000, 8, 'admin', 'user8/admin.jpg');
INSERT INTO `sec_kill_product` VALUES (193, '2024-06-01 09:18:11.452', '2024-06-01 09:18:11.452', NULL, '秒杀3C配件', 10, '秒杀3C配件', '秒杀3C配件', 'boss8/秒杀3C配件.jpg', '500', '250', 200000, 8, 'admin', 'user8/admin.jpg');
INSERT INTO `sec_kill_product` VALUES (194, '2024-06-01 09:18:18.430', '2024-06-01 09:18:18.430', NULL, '秒杀3C配件', 10, '秒杀3C配件', '秒杀3C配件', 'boss8/秒杀3C配件.jpg', '500', '250', 200000, 8, 'admin', 'user8/admin.jpg');
INSERT INTO `sec_kill_product` VALUES (195, '2024-06-01 09:18:20.954', '2024-06-01 09:18:20.954', NULL, '秒杀3C配件', 10, '秒杀3C配件', '秒杀3C配件', 'boss8/秒杀3C配件.jpg', '500', '250', 200000, 8, 'admin', 'user8/admin.jpg');
INSERT INTO `sec_kill_product` VALUES (196, '2024-06-01 09:18:24.681', '2024-06-01 09:18:24.681', NULL, '秒杀3C配件', 10, '秒杀3C配件', '秒杀3C配件', 'boss8/秒杀3C配件.jpg', '500', '250', 200000, 8, 'admin', 'user8/admin.jpg');
INSERT INTO `sec_kill_product` VALUES (197, '2024-06-01 09:19:15.440', '2024-06-01 09:19:15.440', NULL, '秒杀3C配件', 10, '秒杀3C配件', '秒杀3C配件', 'boss8/秒杀3C配件.jpg', '500', '250', 200000, 8, 'admin', 'user8/admin.jpg');
INSERT INTO `sec_kill_product` VALUES (198, '2024-06-01 09:19:29.226', '2024-06-01 09:19:29.226', NULL, '秒杀3C配件', 10, '秒杀3C配件', '秒杀3C配件', 'boss8/秒杀3C配件.jpg', '500', '250', 200000, 8, 'admin', 'user8/admin.jpg');
INSERT INTO `sec_kill_product` VALUES (199, '2024-06-01 09:19:55.295', '2024-06-01 09:19:55.295', NULL, '秒杀3C配件', 10, '秒杀3C配件', '秒杀3C配件', 'boss8/秒杀3C配件.jpg', '500', '250', 200000, 8, 'admin', 'user8/admin.jpg');
INSERT INTO `sec_kill_product` VALUES (200, '2024-06-01 09:20:02.760', '2024-06-01 09:20:02.760', NULL, '秒杀3C配件', 10, '秒杀3C配件', '秒杀3C配件', 'boss8/秒杀3C配件.jpg', '500', '250', 200000, 8, 'admin', 'user8/admin.jpg');
INSERT INTO `sec_kill_product` VALUES (201, '2024-06-01 09:20:11.462', '2024-06-01 09:20:11.462', NULL, '秒杀3C配件', 10, '秒杀3C配件', '秒杀3C配件', 'boss8/秒杀3C配件.jpg', '500', '250', 200000, 8, 'admin', 'user8/admin.jpg');
INSERT INTO `sec_kill_product` VALUES (202, '2024-06-01 09:21:12.680', '2024-06-01 09:21:12.680', NULL, '秒杀3C配件', 10, '秒杀3C配件', '秒杀3C配件', 'boss8/秒杀3C配件.jpg', '500', '250', 200000, 8, 'admin', 'user8/admin.jpg');
INSERT INTO `sec_kill_product` VALUES (203, '2024-06-01 09:22:10.214', '2024-06-01 09:22:10.214', NULL, '秒杀3C配件', 10, '秒杀3C配件', '秒杀3C配件', 'boss8/秒杀3C配件.jpg', '500', '250', 200000, 8, 'admin', 'user8/admin.jpg');
INSERT INTO `sec_kill_product` VALUES (204, '2024-06-01 09:23:15.278', '2024-06-01 09:23:15.278', NULL, '秒杀3C配件', 10, '秒杀3C配件', '秒杀3C配件', 'boss3/秒杀3C配件.jpg', '500', '250', 200000, 3, 'c', 'user3/c.jpg');
INSERT INTO `sec_kill_product` VALUES (205, '2024-06-01 09:23:23.465', '2024-06-01 09:23:23.465', NULL, '秒杀3C配件', 10, '秒杀3C配件', '秒杀3C配件', 'boss3/秒杀3C配件.jpg', '500', '250', 200000, 3, 'c', 'user3/c.jpg');
INSERT INTO `sec_kill_product` VALUES (206, '2024-06-01 09:24:33.019', '2024-06-01 09:24:33.019', NULL, '秒杀3C配件', 10, '秒杀3C配件', '秒杀3C配件', 'boss3/秒杀3C配件.jpg', '500', '250', 200000, 3, 'c', 'user3/c.jpg');
INSERT INTO `sec_kill_product` VALUES (207, '2024-06-01 09:24:50.731', '2024-06-01 09:24:50.731', NULL, '秒杀3C配件', 10, '秒杀3C配件', '秒杀3C配件', 'boss3/秒杀3C配件.jpg', '500', '250', 200000, 3, 'c', 'user3/c.jpg');
INSERT INTO `sec_kill_product` VALUES (208, '2024-06-01 09:24:55.305', '2024-06-01 09:24:55.305', NULL, '秒杀3C配件', 10, '秒杀3C配件', '秒杀3C配件', 'boss3/秒杀3C配件.jpg', '500', '250', 200000, 3, 'c', 'user3/c.jpg');
INSERT INTO `sec_kill_product` VALUES (209, '2024-06-01 09:25:01.343', '2024-06-01 09:25:01.343', NULL, '秒杀3C配件', 10, '秒杀3C配件', '秒杀3C配件', 'boss3/秒杀3C配件.jpg', '500', '250', 200000, 3, 'c', 'user3/c.jpg');
INSERT INTO `sec_kill_product` VALUES (210, '2024-06-01 09:25:05.993', '2024-06-01 09:25:05.993', NULL, '秒杀3C配件', 10, '秒杀3C配件', '秒杀3C配件', 'boss3/秒杀3C配件.jpg', '500', '250', 200000, 3, 'c', 'user3/c.jpg');
INSERT INTO `sec_kill_product` VALUES (211, '2024-06-01 09:25:21.080', '2024-06-01 09:25:21.080', NULL, '秒杀3C配件', 10, '秒杀3C配件', '秒杀3C配件', 'boss3/秒杀3C配件.jpg', '500', '250', 200000, 3, 'c', 'user3/c.jpg');
INSERT INTO `sec_kill_product` VALUES (212, '2024-06-01 09:25:32.903', '2024-06-01 09:25:32.903', NULL, '秒杀3C配件', 10, '秒杀3C配件', '秒杀3C配件', 'boss3/秒杀3C配件.jpg', '500', '250', 200000, 3, 'c', 'user3/c.jpg');
INSERT INTO `sec_kill_product` VALUES (213, '2024-06-01 09:25:38.877', '2024-06-01 09:25:38.877', NULL, '秒杀3C配件', 10, '秒杀3C配件', '秒杀3C配件', 'boss3/秒杀3C配件.jpg', '500', '250', 200000, 3, 'c', 'user3/c.jpg');
INSERT INTO `sec_kill_product` VALUES (214, '2024-06-01 09:25:55.886', '2024-06-01 09:25:55.886', NULL, '秒杀3C配件', 10, '秒杀3C配件', '秒杀3C配件', 'boss3/秒杀3C配件.jpg', '500', '250', 200000, 3, 'c', 'user3/c.jpg');
INSERT INTO `sec_kill_product` VALUES (215, '2024-06-01 09:26:00.356', '2024-06-01 09:26:00.356', NULL, '秒杀3C配件', 10, '秒杀3C配件', '秒杀3C配件', 'boss3/秒杀3C配件.jpg', '500', '250', 200000, 3, 'c', 'user3/c.jpg');
INSERT INTO `sec_kill_product` VALUES (216, '2024-06-01 09:26:07.191', '2024-06-01 09:26:07.191', NULL, '秒杀3C配件', 10, '秒杀3C配件', '秒杀3C配件', 'boss3/秒杀3C配件.jpg', '500', '250', 200000, 3, 'c', 'user3/c.jpg');
INSERT INTO `sec_kill_product` VALUES (217, '2024-06-01 09:26:10.664', '2024-06-01 09:26:10.664', NULL, '秒杀3C配件', 10, '秒杀3C配件', '秒杀3C配件', 'boss3/秒杀3C配件.jpg', '500', '250', 200000, 3, 'c', 'user3/c.jpg');
INSERT INTO `sec_kill_product` VALUES (218, '2024-06-01 09:26:28.744', '2024-06-01 09:26:28.744', NULL, '秒杀3C配件', 10, '秒杀3C配件', '秒杀3C配件', 'boss3/秒杀3C配件.jpg', '500', '250', 200000, 3, 'c', 'user3/c.jpg');
INSERT INTO `sec_kill_product` VALUES (219, '2024-06-01 09:26:30.391', '2024-06-01 09:26:30.391', NULL, '秒杀3C配件', 10, '秒杀3C配件', '秒杀3C配件', 'boss3/秒杀3C配件.jpg', '500', '250', 200000, 3, 'c', 'user3/c.jpg');
INSERT INTO `sec_kill_product` VALUES (220, '2024-06-01 09:26:37.439', '2024-06-01 09:26:37.439', NULL, '秒杀3C配件', 10, '秒杀3C配件', '秒杀3C配件', 'boss3/秒杀3C配件.jpg', '500', '250', 200000, 3, 'c', 'user3/c.jpg');
INSERT INTO `sec_kill_product` VALUES (221, '2024-06-01 09:27:03.314', '2024-06-01 09:27:03.314', NULL, '秒杀3C配件', 10, '秒杀3C配件', '秒杀3C配件', 'boss3/秒杀3C配件.jpg', '500', '250', 200000, 3, 'c', 'user3/c.jpg');
INSERT INTO `sec_kill_product` VALUES (222, '2024-06-01 09:29:01.958', '2024-06-01 09:29:01.958', NULL, '秒杀3C配件', 10, '秒杀3C配件', '秒杀3C配件', 'boss3/秒杀3C配件.jpg', '500', '250', 200000, 3, 'c', 'user3/c.jpg');
INSERT INTO `sec_kill_product` VALUES (223, '2024-06-01 09:29:09.356', '2024-06-01 09:29:09.356', NULL, '秒杀3C配件', 10, '秒杀3C配件', '秒杀3C配件', 'boss3/秒杀3C配件.jpg', '500', '250', 200000, 3, 'c', 'user3/c.jpg');
INSERT INTO `sec_kill_product` VALUES (224, '2024-06-01 09:29:10.579', '2024-06-01 09:29:10.579', NULL, '秒杀3C配件', 10, '秒杀3C配件', '秒杀3C配件', 'boss3/秒杀3C配件.jpg', '500', '250', 200000, 3, 'c', 'user3/c.jpg');
INSERT INTO `sec_kill_product` VALUES (225, '2024-06-01 09:29:14.513', '2024-06-01 09:29:14.513', NULL, '秒杀3C配件', 10, '秒杀3C配件', '秒杀3C配件', 'boss3/秒杀3C配件.jpg', '500', '250', 200000, 3, 'c', 'user3/c.jpg');
INSERT INTO `sec_kill_product` VALUES (226, '2024-06-01 09:29:20.633', '2024-06-01 09:29:20.633', NULL, '秒杀3C配件', 10, '秒杀3C配件', '秒杀3C配件', 'boss3/秒杀3C配件.jpg', '500', '250', 200000, 3, 'c', 'user3/c.jpg');
INSERT INTO `sec_kill_product` VALUES (227, '2024-06-01 09:29:29.886', '2024-06-01 09:29:29.886', NULL, '秒杀3C配件', 10, '秒杀3C配件', '秒杀3C配件', 'boss3/秒杀3C配件.jpg', '500', '250', 200000, 3, 'c', 'user3/c.jpg');
INSERT INTO `sec_kill_product` VALUES (228, '2024-06-01 09:29:30.584', '2024-06-01 09:29:30.584', NULL, '秒杀3C配件', 10, '秒杀3C配件', '秒杀3C配件', 'boss3/秒杀3C配件.jpg', '500', '250', 200000, 3, 'c', 'user3/c.jpg');
INSERT INTO `sec_kill_product` VALUES (229, '2024-06-01 09:29:31.400', '2024-06-01 09:29:31.400', NULL, '秒杀3C配件', 10, '秒杀3C配件', '秒杀3C配件', 'boss3/秒杀3C配件.jpg', '500', '250', 200000, 3, 'c', 'user3/c.jpg');
INSERT INTO `sec_kill_product` VALUES (230, '2024-06-01 09:29:37.786', '2024-06-01 09:29:37.786', NULL, '秒杀3C配件', 10, '秒杀3C配件', '秒杀3C配件', 'boss3/秒杀3C配件.jpg', '500', '250', 200000, 3, 'c', 'user3/c.jpg');
INSERT INTO `sec_kill_product` VALUES (231, '2024-06-01 09:29:39.075', '2024-06-01 09:29:39.075', NULL, '秒杀3C配件', 10, '秒杀3C配件', '秒杀3C配件', 'boss3/秒杀3C配件.jpg', '500', '250', 200000, 3, 'c', 'user3/c.jpg');
INSERT INTO `sec_kill_product` VALUES (232, '2024-06-01 09:30:16.294', '2024-06-01 09:30:16.294', NULL, '秒杀3C配件', 10, '秒杀3C配件', '秒杀3C配件', 'boss3/秒杀3C配件.jpg', '500', '250', 200000, 3, 'c', 'user3/c.jpg');
INSERT INTO `sec_kill_product` VALUES (233, '2024-06-01 09:30:16.536', '2024-06-01 09:30:16.536', NULL, '秒杀3C配件', 10, '秒杀3C配件', '秒杀3C配件', 'boss3/秒杀3C配件.jpg', '500', '250', 200000, 3, 'c', 'user3/c.jpg');
INSERT INTO `sec_kill_product` VALUES (234, '2024-06-01 09:30:16.736', '2024-06-01 09:30:16.736', NULL, '秒杀3C配件', 10, '秒杀3C配件', '秒杀3C配件', 'boss3/秒杀3C配件.jpg', '500', '250', 200000, 3, 'c', 'user3/c.jpg');
INSERT INTO `sec_kill_product` VALUES (235, '2024-06-01 09:30:16.894', '2024-06-01 09:30:16.894', NULL, '秒杀3C配件', 10, '秒杀3C配件', '秒杀3C配件', 'boss3/秒杀3C配件.jpg', '500', '250', 200000, 3, 'c', 'user3/c.jpg');
INSERT INTO `sec_kill_product` VALUES (236, '2024-06-01 09:30:17.043', '2024-06-01 09:30:17.043', NULL, '秒杀3C配件', 10, '秒杀3C配件', '秒杀3C配件', 'boss3/秒杀3C配件.jpg', '500', '250', 200000, 3, 'c', 'user3/c.jpg');
INSERT INTO `sec_kill_product` VALUES (237, '2024-06-01 09:30:17.540', '2024-06-01 09:30:17.540', NULL, '秒杀3C配件', 10, '秒杀3C配件', '秒杀3C配件', 'boss3/秒杀3C配件.jpg', '500', '250', 200000, 3, 'c', 'user3/c.jpg');
INSERT INTO `sec_kill_product` VALUES (238, '2024-06-01 09:30:19.040', '2024-06-01 09:30:19.040', NULL, '秒杀3C配件', 10, '秒杀3C配件', '秒杀3C配件', 'boss3/秒杀3C配件.jpg', '500', '250', 200000, 3, 'c', 'user3/c.jpg');
INSERT INTO `sec_kill_product` VALUES (239, '2024-06-01 09:30:21.486', '2024-06-01 09:30:21.486', NULL, '秒杀3C配件', 10, '秒杀3C配件', '秒杀3C配件', 'boss3/秒杀3C配件.jpg', '500', '250', 200000, 3, 'c', 'user3/c.jpg');
INSERT INTO `sec_kill_product` VALUES (240, '2024-06-01 09:30:26.306', '2024-06-01 09:30:26.306', NULL, '秒杀3C配件', 10, '秒杀3C配件', '秒杀3C配件', 'boss3/秒杀3C配件.jpg', '500', '250', 200000, 3, 'c', 'user3/c.jpg');
INSERT INTO `sec_kill_product` VALUES (241, '2024-06-01 09:30:38.981', '2024-06-01 09:30:38.981', NULL, '秒杀3C配件', 10, '秒杀3C配件', '秒杀3C配件', 'boss3/秒杀3C配件.jpg', '500', '250', 200000, 3, 'c', 'user3/c.jpg');
INSERT INTO `sec_kill_product` VALUES (242, '2024-06-01 09:30:39.408', '2024-06-01 09:30:39.408', NULL, '秒杀3C配件', 10, '秒杀3C配件', '秒杀3C配件', 'boss3/秒杀3C配件.jpg', '500', '250', 200000, 3, 'c', 'user3/c.jpg');
INSERT INTO `sec_kill_product` VALUES (243, '2024-06-01 09:30:39.710', '2024-06-01 09:30:39.710', NULL, '秒杀3C配件', 10, '秒杀3C配件', '秒杀3C配件', 'boss3/秒杀3C配件.jpg', '500', '250', 200000, 3, 'c', 'user3/c.jpg');
INSERT INTO `sec_kill_product` VALUES (244, '2024-06-01 09:30:39.893', '2024-06-01 09:30:39.893', NULL, '秒杀3C配件', 10, '秒杀3C配件', '秒杀3C配件', 'boss3/秒杀3C配件.jpg', '500', '250', 200000, 3, 'c', 'user3/c.jpg');
INSERT INTO `sec_kill_product` VALUES (245, '2024-06-01 09:30:46.428', '2024-06-01 09:30:46.428', NULL, '秒杀3C配件', 10, '秒杀3C配件', '秒杀3C配件', 'boss3/秒杀3C配件.jpg', '500', '250', 200000, 3, 'c', 'user3/c.jpg');
INSERT INTO `sec_kill_product` VALUES (246, '2024-06-01 09:33:07.394', '2024-06-01 09:33:07.394', NULL, '秒杀3C配件', 10, '秒杀3C配件', '秒杀3C配件', 'boss3/秒杀3C配件.jpg', '500', '250', 200000, 3, 'c', 'user3/c.jpg');
INSERT INTO `sec_kill_product` VALUES (247, '2024-06-01 09:33:21.841', '2024-06-01 09:33:21.841', NULL, '秒杀3C配件', 10, '秒杀3C配件', '秒杀3C配件', 'boss3/秒杀3C配件.jpg', '500', '250', 200000, 3, 'c', 'user3/c.jpg');
INSERT INTO `sec_kill_product` VALUES (248, '2024-06-01 09:33:26.935', '2024-06-01 09:33:26.935', NULL, '秒杀3C配件', 10, '秒杀3C配件', '秒杀3C配件', 'boss3/秒杀3C配件.jpg', '500', '250', 200000, 3, 'c', 'user3/c.jpg');
INSERT INTO `sec_kill_product` VALUES (249, '2024-06-01 09:33:41.253', '2024-06-01 09:33:41.253', NULL, '秒杀3C配件', 10, '秒杀3C配件', '秒杀3C配件', 'boss3/秒杀3C配件.jpg', '500', '250', 200000, 3, 'c', 'user3/c.jpg');
INSERT INTO `sec_kill_product` VALUES (250, '2024-06-01 09:33:51.427', '2024-06-01 09:33:51.427', NULL, '秒杀3C配件', 10, '秒杀3C配件', '秒杀3C配件', 'boss3/秒杀3C配件.jpg', '500', '250', 200000, 3, 'c', 'user3/c.jpg');
INSERT INTO `sec_kill_product` VALUES (251, '2024-06-01 09:33:58.962', '2024-06-01 09:33:58.962', NULL, '秒杀3C配件', 10, '秒杀3C配件', '秒杀3C配件', 'boss3/秒杀3C配件.jpg', '500', '250', 200000, 3, 'c', 'user3/c.jpg');
INSERT INTO `sec_kill_product` VALUES (252, '2024-06-01 09:34:02.225', '2024-06-01 09:34:02.225', NULL, '秒杀3C配件', 10, '秒杀3C配件', '秒杀3C配件', 'boss3/秒杀3C配件.jpg', '500', '250', 200000, 3, 'c', 'user3/c.jpg');
INSERT INTO `sec_kill_product` VALUES (253, '2024-06-01 09:34:14.769', '2024-06-01 09:34:14.769', NULL, '秒杀3C配件', 10, '秒杀3C配件', '秒杀3C配件', 'boss3/秒杀3C配件.jpg', '500', '250', 200000, 3, 'c', 'user3/c.jpg');
INSERT INTO `sec_kill_product` VALUES (254, '2024-06-01 09:34:53.588', '2024-06-01 09:34:53.588', NULL, '秒杀3C配件', 10, '秒杀3C配件', '秒杀3C配件', 'boss3/秒杀3C配件.jpg', '500', '250', 200000, 3, 'c', 'user3/c.jpg');
INSERT INTO `sec_kill_product` VALUES (255, '2024-06-01 09:43:21.996', '2024-06-01 09:43:21.996', NULL, '秒杀3C配件', 10, '秒杀3C配件', '秒杀3C配件', 'boss8/秒杀3C配件.jpg', '500', '250', 200000, 8, 'admin', 'user8/admin.jpg');
INSERT INTO `sec_kill_product` VALUES (256, '2024-06-03 07:21:21.678', '2024-06-03 07:21:21.678', NULL, '秒杀3C配件', 10, '秒杀3C配件', '秒杀3C配件', 'boss8/秒杀3C配件.jpg', '500', '250', 200000, 8, 'admin', 'user8/admin.jpg');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) NULL DEFAULT NULL,
  `updated_at` datetime(3) NULL DEFAULT NULL,
  `deleted_at` datetime(3) NULL DEFAULT NULL,
  `user_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `nick_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `money` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_user_deleted_at`(`deleted_at` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, '2024-05-11 07:44:56.401', '2024-05-11 07:44:56.401', NULL, 'testUserName', '', '$2a$10$zTMG61BaL7aURNIlp9RBlenP/6W0etYMdF80yHlPYCP5RSY9n4yJa', 'testNickName', 'avatar.jpg', 'active', 'c160bd69ec75c84866b7664c3859be14');
INSERT INTO `user` VALUES (2, '2024-05-11 08:12:31.127', '2024-05-11 09:03:59.500', NULL, 'testUserName2', '', '$2a$10$mvLPXScJ2KQSNK5Ibwue8OkOvoaE31Is.wQyoq2CdiAnz2vBae3Uy', 'newNickName', 'user2/testUserName2.jpg', 'active', '2af150227f46065f8e2d56fd27a35f57');
INSERT INTO `user` VALUES (3, '2024-05-21 08:28:06.022', '2024-05-28 13:24:32.257', NULL, 'c', '', '$2a$10$qi7ae/YZAQQFLHhfYAKgne7qah7A4Xz6vQOCGOBM4FVhrnuTA.UrC', 'abc', 'user3/c.jpg', 'active', '3cd98f639c21e552f0d0223125bcb4d7');
INSERT INTO `user` VALUES (4, '2024-05-26 03:29:58.861', '2024-05-28 13:35:25.008', NULL, 'a', '', '$2a$10$W0uL1exvoa3//Y2c32hCo.5HIUBNQDpJao8XsDFd7KFrXZCXu97KO', 'a', 'user4/a.jpg', 'active', '88f28e9088780a87b15eb7448fb4eb6b');
INSERT INTO `user` VALUES (5, '2024-05-26 07:09:42.872', '2024-05-27 13:26:16.464', NULL, 'mobai', '', '$2a$10$u0nKGcbmIaBAYjyuRqz5Yuu6Cji2dJw2c1LqT8uuJyYDI1hyd.3a2', 'abc', 'user5/mobai.jpg', 'active', '2af150227f46065f8e2d56fd27a35f57');
INSERT INTO `user` VALUES (6, '2024-05-27 13:26:32.016', '2024-05-27 13:28:34.919', NULL, 'aa', '', '$2a$10$edvPfH9vXvAfn7bVGxGJ7OCEcPFM5/paIxg0ZdHqwzpgvQnmAl0mO', 'abc', 'user6/aa.jpg', 'active', '2af150227f46065f8e2d56fd27a35f57');
INSERT INTO `user` VALUES (7, '2024-05-27 13:29:27.374', '2024-05-27 13:40:59.484', NULL, 'ab', '', '$2a$10$TSMJd12nW6JHDwwlLB9VIufp7mPdNy5dX7xaqCNNaqt8iGlmci6Ue', 'abc', 'user7/ab.jpg', 'active', '2af150227f46065f8e2d56fd27a35f57');
INSERT INTO `user` VALUES (8, '2024-05-28 13:27:05.523', '2024-06-19 11:52:45.848', NULL, 'admin', '', '$2a$10$G/nw4LSCSw5BUhKJd2busOyXnVycYb98oWGVfAvGIqRHZCuAHvbvS', 'admin', 'user8/admin.jpg', 'active', 'fa7c5048e5c16aa7be724407cfc48657');
INSERT INTO `user` VALUES (9, '2024-05-28 13:48:13.003', '2024-05-28 13:50:15.882', NULL, 'aaa', '', '$2a$10$ysG577/96I4ht8PcoHJmn.CvnyPjIKpKmWmrKFHLQiEBRUNmmBGDW', 'aaa', 'avatar.jpg', 'active', 'db84523ef0ca8ad0c9d0333fcba280b4');
INSERT INTO `user` VALUES (10, '2024-05-28 16:58:14.141', '2024-05-28 17:03:06.525', NULL, 'aaaa', '', '$2a$10$f33Ys8wetOAFPrNpVginzuU87Y/EzAN4aGqhoa/uRvkogWAzEZVYG', 'aaaa', 'avatar.jpg', 'active', '3ca18177742fad859857bba69d5b1f93');
INSERT INTO `user` VALUES (11, '2024-05-29 03:17:21.311', '2024-05-29 03:17:21.311', NULL, 'mobaisilent', '', '$2a$10$cCJjagT/mhhbybRoaNai8.2G6IHqENJAIvByxnDmbmX76EmGyaPJC', 'mobaisilent', 'avatar.jpg', 'active', '2af150227f46065f8e2d56fd27a35f57');
INSERT INTO `user` VALUES (14, '2024-06-01 10:50:53.268', '2024-06-01 10:54:34.837', NULL, 'mobaia1', '', '$2a$10$MU5Yoq3uAnRIAfiQ0Glhp.WNj3PgnaMpAaP2GKC14f6w1VwtvdKMW', 'mobaiaa', 'user14/mobaia1.jpg', 'active', '2af150227f46065f8e2d56fd27a35f57');
INSERT INTO `user` VALUES (15, '2024-06-03 07:20:35.173', '2024-06-03 07:20:35.173', NULL, 'show', '', '$2a$10$HXgwAbMCA9wrZGAmHow1IukDtpyvgjEJnX2X1j8YVCCArqi3a947C', 'show', 'avatar.jpg', 'active', '2af150227f46065f8e2d56fd27a35f57');
INSERT INTO `user` VALUES (16, '2024-06-03 07:35:03.930', '2024-06-03 07:36:07.617', NULL, 'test10', '', '$2a$10$fLYYaXsD6o/Lhu0xVR6hTeGbV/aQ1lF0Kfgphf5Nyt1FvwyurAqRi', 'tshow', 'user16/test10.jpg', 'active', '2af150227f46065f8e2d56fd27a35f57');
INSERT INTO `user` VALUES (17, '2024-06-03 07:43:18.568', '2024-06-03 07:47:03.980', NULL, 'mobaishow', '', '$2a$10$.m/ecr8H1pj3R.7ezJRFHOP7Q6NJeBlO8LQjvHf4kBybWzKtHvZg.', 'mobaishownickname', 'user17/mobaishow.jpg', 'active', '1ba0e2779aa769e81fd0c3d0b778ebdb');
INSERT INTO `user` VALUES (18, '2024-06-19 11:48:06.281', '2024-06-19 11:52:45.811', NULL, 'test1', '', '$2a$10$1Aryr9dfk8NMP0fxNaTTD.HA.uIAr8NDoiR4aSK3rCvLmZERaUCkO', 'test2', 'user18/test1.jpg', 'active', 'd49c202f045a484c4b6644883ded5f22');

SET FOREIGN_KEY_CHECKS = 1;
