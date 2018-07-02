-- 管理员
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
    `id` int NOT NULL AUTO_INCREMENT,
    `name` varchar(100) NOT NULL,
    `pwd` varchar(100) NOT NULL,
    `is_super` smallint COMMENT "是否为超级管理员，0为超级管理员",
    `role_id` int,
    `addtime` datetime,
    PRIMARY KEY (`id`),
    UNIQUE (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- 管理员登录日志
DROP TABLE IF EXISTS `adminlog`;
CREATE TABLE `adminlog` (
    `id` int NOT NULL AUTO_INCREMENT,
    `admin_id` int,
    `ip` varchar(100),
    `addtime` datetime,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- 标签
DROP TABLE IF EXISTS `tag`;
CREATE TABLE `tag` (
    `id` int NOT NULL AUTO_INCREMENT,
    `name` varchar(100) NOT NULL,
    `addtime` datetime,
    PRIMARY KEY (`id`),
    UNIQUE (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- 电影
DROP TABLE IF EXISTS `movie`;
CREATE TABLE `movie` (
    `id` int NOT NULL AUTO_INCREMENT,
    `title` varchar(100),
    `url` varchar(255),
    `info` text,
    `logo` varchar(255),
    `star` smallint,
    `playnum` bigint,
    `commentnum` bigint,
    `tag_id` int,
    `area` varchar(255),
    `release_time` datetime,
    `length` varchar(100),
    `addtime` datetime,
    PRIMARY KEY (`id`),
    UNIQUE (`title`, `url`, `logo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- 上映预告
DROP TABLE IF EXISTS `preview`;
CREATE TABLE `preview` (
    `id` int NOT NULL AUTO_INCREMENT,
    `title` varchar(255),
    `logo` varchar(255),
    `addtime` datetime,
    PRIMARY KEY (`id`),
    UNIQUE (`title`, `logo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- 会员
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
    `id` int NOT NULL AUTO_INCREMENT,
    `name` varchar(100),
    `pwd` varchar(100),
    `email` varchar(100),
    `phone` varchar(11),
    `info` text,
    `face` varchar(255),
    `addtime` datetime DEFAULT now(),
    `uuid` varchar(255),
    PRIMARY KEY (`id`),
    UNIQUE (`name`, `email`, `phone`, `face`, `uuid`) 
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- 会员登录日志
DROP TABLE IF EXISTS `userlog`;
CREATE TABLE `userlog` (
    `id` int NOT NULL AUTO_INCREMENT,   
    `user_id` int,
    `ip` varchar(100),
    `addtime` datetime DEFAULT now(),
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- 评论
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
    `id` int NOT NULL AUTO_INCREMENT,
    `content` text,
    `movie_id` int,
    `user_id` int,
    `addtime` datetime DEFAULT now(),
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- 电影收藏
DROP TABLE IF EXISTS `moviecol`;
CREATE TABLE `moviecol` (
    `id` int NOT NULL AUTO_INCREMENT,
    `movie_id` int,
    `user_id` int,
    `addtime` datetime DEFAULT now(),
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO moviecol (movie_id, user_id, addtime) VALUES (7, 1, now()),
                                                         (7, 2, now()),
                                                         (7, 3, now()),
                                                         (7, 4, now()),
                                                         (8, 5, now()),
                                                         (8, 6, now()),
                                                         (8, 7, now()),
                                                         (8, 8, now());


-- 权限
DROP TABLE IF EXISTS `auth`;
CREATE TABLE `auth` (
    `id` int NOT NULL AUTO_INCREMENT,
    `name` varchar(100),
    `url` varchar(255),  
    `addtime` datetime,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- 角色
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
    `id` int NOT NULL AUTO_INCREMENT,
    `name` varchar(100),
    `auths` varchar(600),  
    `addtime` datetime,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;






INSERT INTO `admin` (`id`, `name`, `pwd`, `is_super`, `role_id`, `addtime`) VALUES
	(1, 'admin', '1', 0, NULL, '2018-06-30 16:46:54'),
	(8, '1', '1', 1, 3, '2018-06-30 16:46:52'),
	(9, '2', '2', 1, 3, '2018-06-30 16:46:51'),
	(10, 'test', '1', 1, 3, '2018-06-30 16:46:46');

INSERT INTO `adminlog` (`id`, `admin_id`, `ip`, `addtime`) VALUES
	(1, 1, '0:0:0:0:0:0:0:1', '2018-06-28 23:51:07'),
	(2, 1, '0:0:0:0:0:0:0:1', '2018-06-28 23:51:27'),
	(3, 1, '0:0:0:0:0:0:0:1', '2018-06-29 00:10:54'),
	(4, 1, '0:0:0:0:0:0:0:1', '2018-06-29 14:23:04'),
	(5, 1, '0:0:0:0:0:0:0:1', '2018-06-29 14:29:17'),
	(6, 1, '0:0:0:0:0:0:0:1', '2018-06-29 14:32:39'),
	(7, 1, '0:0:0:0:0:0:0:1', '2018-06-29 14:52:59'),
	(8, 1, '0:0:0:0:0:0:0:1', '2018-06-29 14:54:58'),
	(9, 1, '0:0:0:0:0:0:0:1', '2018-06-29 14:56:18'),
	(10, 1, '0:0:0:0:0:0:0:1', '2018-06-29 15:18:51'),
	(11, 8, '0:0:0:0:0:0:0:1', '2018-06-30 18:02:43'),
	(12, 1, '0:0:0:0:0:0:0:1', '2018-06-30 18:05:45'),
	(13, 1, '0:0:0:0:0:0:0:1', '2018-06-30 18:59:36'),
	(14, 8, '0:0:0:0:0:0:0:1', '2018-06-30 19:00:40'),
	(15, 1, '0:0:0:0:0:0:0:1', '2018-07-01 00:11:49'),
	(16, 1, '0:0:0:0:0:0:0:1', '2018-07-01 16:19:02'),
	(17, 1, '0:0:0:0:0:0:0:1', '2018-07-02 21:31:28'),
	(18, 1, '0:0:0:0:0:0:0:1', '2018-07-02 21:32:22'),
	(19, 1, '0:0:0:0:0:0:0:1', '2018-07-02 21:33:26'),
	(20, 1, '0:0:0:0:0:0:0:1', '2018-07-02 21:44:28'),
	(21, 1, '0:0:0:0:0:0:0:1', '2018-07-02 21:48:17');


INSERT INTO `auth` (`id`, `name`, `url`, `addtime`) VALUES
	(1, 'asdf', '/movie/admin/tag/add', '2018-06-29 14:29:26'),
	(2, 'asdf', 'asdf', '2018-06-29 14:30:02'),
	(3, '1', '1', '2018-06-29 14:30:30'),
	(4, '250', '250', '2018-06-29 14:30:49');
	

INSERT INTO `comment` (`id`, `content`, `movie_id`, `user_id`, `addtime`) VALUES
	(1, '好看', 1, 1, '2018-07-02 21:17:32'),
	(2, '不错', 9, 4, '2018-07-02 21:17:32'),
	(3, '经典', 1, 5, '2018-07-02 21:17:32'),
	(4, '给力', 3, 6, '2018-07-02 21:17:32'),
	(5, '难看', 6, 7, '2018-07-02 21:17:32'),
	(6, '无聊', 9, 8, '2018-07-02 21:17:32'),
	(7, '<p>好啊好啊</p>', 1, 13, '2018-07-02 21:30:01'),
	(8, '<p>123</p>', 1, 13, '2018-07-02 21:44:08'),
	(9, '<p>asdfsad</p>', 1, 13, '2018-07-02 23:02:46');
	

INSERT INTO `movie` (`id`, `title`, `url`, `info`, `logo`, `star`, `playnum`, `commentnum`, `tag_id`, `area`, `release_time`, `length`, `addtime`) VALUES
	(1, '卫藤美彩', '20180627174009-05bd55ac-fbc7-4e51-be8b-3318dd5f0752.mp4', '卫藤美彩', '20180702214835-d299f839-6539-4da3-9371-a118519663e0.jpg', 2, 16, 4, 11, '日本', '2018-06-26 00:00:00', '5', '2018-06-26 23:35:05'),
	(3, '环太平洋', '20180627144116-7a1c73f0-6e1d-4d02-8614-c7cc4aa6566a.mp4', '环太平洋', '20180627144116-c1ac7029-08ae-4aa9-acb6-c587cb22bd36.jpg', 4, 0, 0, 2, '美国', '2018-06-02 00:00:00', '200', '2018-06-27 14:41:16'),
	(6, 'test2', '20180627174242-1dadb2f4-2303-4569-bf88-efd9480f95bd.mp4', 'test介绍', '20180627174215-408fe874-1b1d-4dca-9b2b-0b56974b3203.jpg', 5, 0, 0, 12, 'test地区', '2018-06-27 00:00:00', '1243', '2018-06-27 17:33:55'),
	(9, '有内容', '20180627173641-749bbb01-2e91-4816-8f0e-b81b45e402cd.mp4', '有内容', '20180627173641-76bcd3cc-0c1e-40af-a90a-d5b00d00acdc.jpg', 1, 0, 0, 13, '日本', '2018-06-27 00:00:00', '123456', '2018-06-27 17:36:41');


INSERT INTO `moviecol` (`id`, `movie_id`, `user_id`, `addtime`) VALUES
	(1, 1, 9, '2018-07-02 22:11:23'),
	(2, 3, 2, '2018-07-02 22:11:23'),
	(3, 8, 4, '2018-07-02 22:11:23'),
	(4, 1, 5, '2018-07-02 22:11:23'),
	(5, 3, 6, '2018-07-02 22:11:23'),
	(6, 6, 7, '2018-07-02 22:11:23'),
	(7, 9, 8, '2018-07-02 22:11:23'),
	(8, 1, 13, '2018-07-02 22:58:26');
	

INSERT INTO `preview` (`id`, `title`, `logo`, `addtime`) VALUES
	(3, 'test', '20180628154846-0d25a3ea-993a-4219-8c6d-f723641aa0cc.jpg', '2018-06-28 15:48:46'),
	(4, '1234', '20180628155630-2969574d-d6c8-484d-ba08-01c09549eb0b.jpg', '2018-06-28 15:48:51');
	

INSERT INTO `role` (`id`, `name`, `auths`, `addtime`) VALUES
	(3, 'newName', '1', '2018-06-29 17:07:56');
	

INSERT INTO `tag` (`id`, `name`, `addtime`) VALUES
	(2, '科幻', '2018-06-26 14:30:05'),
	(3, '爱情', '2018-06-26 14:30:46'),
	(4, '动作', '2018-06-26 14:34:09'),
	(5, '犯罪', '2018-06-26 15:06:14'),
	(6, '悬疑', '2018-06-26 15:06:20'),
	(7, '战争', '2018-06-26 15:06:30'),
	(8, '恐怖', '2018-06-26 15:06:36'),
	(9, '灾难', '2018-06-26 15:06:41'),
	(10, '喜剧', '2018-06-26 15:06:44'),
	(11, '动画', '2018-06-26 15:07:10');
	

INSERT INTO `user` (`id`, `name`, `pwd`, `email`, `phone`, `info`, `face`, `addtime`, `uuid`) VALUES
	(2, '牛', '1232', '1232@123.com', '13888888882', '牛', '1f402.png', '2018-06-28 16:32:22', 'd32a72bdac524478b7e4f6dfc8394fc1'),
	(3, '虎', '1233', '1233@123.com', '13888888883', '虎', '1f405.png', '2018-06-28 16:32:22', 'd32a72bdac524478b7e4f6dfc8394fc2'),
	(4, '兔', '1234', '1234@123.com', '13888888884', '兔', '1f407.png', '2018-06-28 16:32:22', 'd32a72bdac524478b7e4f6dfc8394fc3'),
	(5, '龙', '1235', '1235@123.com', '13888888885', '龙', '1f409.png', '2018-06-28 16:32:22', 'd32a72bdac524478b7e4f6dfc8394fc4'),
	(6, '蛇', '1236', '1236@123.com', '13888888886', '蛇', '1f40d.png', '2018-06-28 16:32:22', 'd32a72bdac524478b7e4f6dfc8394fc5'),
	(7, '马', '1237', '1237@123.com', '13888888887', '马', '1f434.png', '2018-06-28 16:32:22', 'd32a72bdac524478b7e4f6dfc8394fc6'),
	(8, '羊', '1238', '1238@123.com', '13888888888', '羊', '1f411.png', '2018-06-28 16:32:22', 'd32a72bdac524478b7e4f6dfc8394fc7'),
	(9, '猴', '1239', '1239@123.com', '13888888889', '猴', '1f412.png', '2018-06-28 16:32:22', 'd32a72bdac524478b7e4f6dfc8394fc8'),
	(10, '鸡', '1240', '1240@123.com', '13888888891', '鸡', '1f413.png', '2018-06-28 16:32:22', 'd32a72bdac524478b7e4f6dfc8394fc9'),
	(11, '狗', '1241', '1241@123.com', '13888888892', '狗', '1f415.png', '2018-06-28 16:32:22', 'd32a72bdac524478b7e4f6dfc8394fd0'),
	(12, '猪', '1242', '1242@123.com', '13888888893', '猪', '1f416.png', '2018-06-28 16:32:22', 'd32a72bdac524478b7e4f6dfc8394fd1'),
	(13, '123', '123', '1234@qq.com', '13838381234', '我是简介', '20180701172402-0e61eeda-cd3e-421a-8257-7c68531e4269.jpg', '2018-06-30 23:09:41', 'a7be9f21-d942-4921-839c-7ed070fcc1bc');


INSERT INTO `userlog` (`id`, `user_id`, `ip`, `addtime`) VALUES
	(2, 13, '0:0:0:0:0:0:0:1', '2018-06-30 23:44:09'),
	(3, 13, '0:0:0:0:0:0:0:1', '2018-06-30 23:57:26'),
	(4, 13, '0:0:0:0:0:0:0:1', '2018-07-01 00:02:36'),
	(5, 13, '0:0:0:0:0:0:0:1', '2018-07-01 00:12:13'),
	(6, 13, '0:0:0:0:0:0:0:1', '2018-07-01 00:12:26'),
	(7, 13, '0:0:0:0:0:0:0:1', '2018-07-01 16:14:04'),
	(8, 13, '0:0:0:0:0:0:0:1', '2018-07-01 16:25:48'),
	(9, 13, '0:0:0:0:0:0:0:1', '2018-07-01 17:11:02'),
	(10, 13, '0:0:0:0:0:0:0:1', '2018-07-01 17:12:25'),
	(11, 13, '0:0:0:0:0:0:0:1', '2018-07-01 17:13:25'),
	(12, 13, '0:0:0:0:0:0:0:1', '2018-07-01 17:14:26'),
	(13, 13, '0:0:0:0:0:0:0:1', '2018-07-01 17:17:34'),
	(14, 13, '0:0:0:0:0:0:0:1', '2018-07-01 17:18:38'),
	(15, 13, '0:0:0:0:0:0:0:1', '2018-07-01 17:29:42'),
	(16, 13, '0:0:0:0:0:0:0:1', '2018-07-01 17:33:16'),
	(17, 13, '0:0:0:0:0:0:0:1', '2018-07-01 17:35:53'),
	(18, 13, '0:0:0:0:0:0:0:1', '2018-07-01 17:36:01'),
	(19, 13, '0:0:0:0:0:0:0:1', '2018-07-01 17:44:42'),
	(20, 13, '0:0:0:0:0:0:0:1', '2018-07-01 17:46:18'),
	(21, 13, '0:0:0:0:0:0:0:1', '2018-07-01 17:48:43'),
	(22, 13, '0:0:0:0:0:0:0:1', '2018-07-01 17:50:48'),
	(23, 13, '0:0:0:0:0:0:0:1', '2018-07-02 20:54:48'),
	(24, 13, '0:0:0:0:0:0:0:1', '2018-07-02 21:01:00'),
	(25, 13, '0:0:0:0:0:0:0:1', '2018-07-02 21:12:06'),
	(26, 13, '0:0:0:0:0:0:0:1', '2018-07-02 21:13:17'),
	(27, 13, '0:0:0:0:0:0:0:1', '2018-07-02 21:29:53'),
	(28, 13, '0:0:0:0:0:0:0:1', '2018-07-02 21:33:18'),
	(29, 13, '0:0:0:0:0:0:0:1', '2018-07-02 21:44:03'),
	(30, 13, '0:0:0:0:0:0:0:1', '2018-07-02 21:52:01'),
	(31, 13, '0:0:0:0:0:0:0:1', '2018-07-02 21:59:15'),
	(32, 13, '0:0:0:0:0:0:0:1', '2018-07-02 22:38:14'),
	(33, 13, '0:0:0:0:0:0:0:1', '2018-07-02 22:49:51'),
	(34, 13, '0:0:0:0:0:0:0:1', '2018-07-02 22:54:38'),
	(35, 13, '0:0:0:0:0:0:0:1', '2018-07-02 22:56:14'),
	(36, 13, '0:0:0:0:0:0:0:1', '2018-07-02 22:58:14'),
	(37, 13, '0:0:0:0:0:0:0:1', '2018-07-02 23:02:34');
