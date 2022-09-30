-- phpMyAdmin SQL Dump
-- version 3.5.2.2
-- http://www.phpmyadmin.net
--
-- 主机: localhost
-- 生成日期: 2018 年 09 月 07 日 11:28
-- 服务器版本: 5.5.48-log
-- PHP 版本: 5.6.22

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 数据库: `base`
--

-- --------------------------------------------------------

--
-- 表的结构 `md_admin`
--

CREATE TABLE IF NOT EXISTS `md_admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL,
  `password` varchar(50) NOT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `group_id` varchar(255) NOT NULL COMMENT '所属用户组',
  `mobile` bigint(15) DEFAULT NULL COMMENT '手机',
  `email` varchar(100) DEFAULT NULL COMMENT '邮箱',
  `status` int(1) NOT NULL DEFAULT '1' COMMENT '状态,1为正常，2为禁止',
  `addtime` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `md_admin`
--

INSERT INTO `md_admin` (`id`, `username`, `password`, `avatar`, `group_id`, `mobile`, `email`, `status`, `addtime`) VALUES
(1, 'mangdin', '5b44ef8fb1fddede825d70cbc184152a', '', '', 18119682492, '993905935@qq.com', 1, 0),
(2, 'ceshi', 'e10adc3949ba59abbe56e057f20f883e', '', '', 2147483647, '12345678912@qq.com', 1, 0);

-- --------------------------------------------------------

--
-- 表的结构 `md_admin_group`
--

CREATE TABLE IF NOT EXISTS `md_admin_group` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `title` char(100) NOT NULL DEFAULT '',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `desc` varchar(255) DEFAULT NULL COMMENT '简介',
  `rules` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `md_admin_group`
--

INSERT INTO `md_admin_group` (`id`, `title`, `status`, `desc`, `rules`) VALUES
(1, '超级管理员', 1, '拥有至高无上的权利', '1,2,26,4,5,6,7,8,9,10,11,12,14,15,16,17,18,19,20,21,22,23'),
(2, '测试人员', 1, '仅可登陆', '1,2,5');

-- --------------------------------------------------------

--
-- 表的结构 `md_admin_group_access`
--

CREATE TABLE IF NOT EXISTS `md_admin_group_access` (
  `uid` mediumint(8) unsigned NOT NULL,
  `group_id` mediumint(8) unsigned NOT NULL,
  UNIQUE KEY `uid_group_id` (`uid`,`group_id`),
  KEY `uid` (`uid`),
  KEY `group_id` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `md_admin_group_access`
--

INSERT INTO `md_admin_group_access` (`uid`, `group_id`) VALUES
(1, 1),
(1, 2),
(2, 1),
(2, 2);

-- --------------------------------------------------------

--
-- 表的结构 `md_admin_log`
--

CREATE TABLE IF NOT EXISTS `md_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `aid` int(11) NOT NULL COMMENT '操作人ID',
  `content` varchar(255) NOT NULL COMMENT '操作内容',
  `ip` varchar(255) NOT NULL COMMENT '操作人IP',
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '是否操作成功，1为成功，2为失败',
  `addtime` int(11) NOT NULL COMMENT '操作时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 AUTO_INCREMENT=11 ;

--
-- 转存表中的数据 `md_admin_log`
--

INSERT INTO `md_admin_log` (`id`, `aid`, `content`, `ip`, `status`, `addtime`) VALUES
(1, 1, '登录后台', '127.0.0.1', 1, 1535078674),
(2, 1, '添加菜单', '127.0.0.1', 1, 1535082143),
(3, 1, '添加菜单', '127.0.0.1', 1, 1535082163),
(4, 1, '添加权限', '127.0.0.1', 1, 1535082187),
(5, 1, '修改权限 ID：24', '127.0.0.1', 1, 1535082205),
(6, 1, '添加权限', '127.0.0.1', 1, 1535082225),
(7, 1, '修改用户组 ID：1', '127.0.0.1', 1, 1535082233),
(8, 1, '登录后台', '127.0.0.1', 1, 1536287582),
(9, 1, '添加权限', '127.0.0.1', 1, 1536289427),
(10, 1, '修改用户组 ID：1', '127.0.0.1', 1, 1536289446);

-- --------------------------------------------------------

--
-- 表的结构 `md_admin_nav`
--

CREATE TABLE IF NOT EXISTS `md_admin_nav` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '菜单表',
  `pid` int(11) unsigned DEFAULT '0' COMMENT '所属菜单',
  `name` varchar(15) DEFAULT '' COMMENT '菜单名称',
  `mca` varchar(255) DEFAULT '' COMMENT '模块、控制器、方法',
  `ico` varchar(20) DEFAULT '' COMMENT 'font-awesome图标',
  `order_number` int(11) unsigned DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=57 ;

--
-- 转存表中的数据 `md_admin_nav`
--

INSERT INTO `md_admin_nav` (`id`, `pid`, `name`, `mca`, `ico`, `order_number`) VALUES
(39, 0, '权限控制', 'admin/auth/index', '&#xe70b;', 1),
(51, 39, '菜单管理', 'admin/auth/nav_list', NULL, 1),
(40, 39, '权限列表', 'admin/auth/index', '', 2),
(41, 39, '用户组管理', 'admin/auth/group', '', 3),
(42, 39, '管理员列表', 'admin/auth/admin_list', '', 4),
(53, 0, '操作日志', 'admin/index/log', '&#xe699;', 0),
(55, 0, '用户管理', 'admin/user/index', '&#xe6b8;', NULL);

-- --------------------------------------------------------

--
-- 表的结构 `md_admin_rule`
--

CREATE TABLE IF NOT EXISTS `md_admin_rule` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL,
  `name` char(80) NOT NULL DEFAULT '',
  `title` char(20) NOT NULL DEFAULT '',
  `type` tinyint(1) NOT NULL DEFAULT '1',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `condition` char(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=27 ;

--
-- 转存表中的数据 `md_admin_rule`
--

INSERT INTO `md_admin_rule` (`id`, `pid`, `name`, `title`, `type`, `status`, `condition`) VALUES
(1, 0, 'admin/index/index', '后台iform框架', 1, 1, ''),
(2, 1, 'admin/index/home', '后台首页2', 1, 1, ''),
(4, 0, 'admin/auth', '权限管理', 1, 1, ''),
(5, 4, 'admin/auth/index', '权限列表', 1, 1, ''),
(6, 4, 'admin/auth/add', '添加权限', 1, 1, ''),
(7, 4, 'admin/auth/edit', '修改权限', 1, 1, ''),
(8, 4, 'admin/auth/delete', '删除权限', 1, 1, ''),
(9, 4, 'admin/auth/group', '用户组列表', 1, 1, ''),
(10, 4, 'admin/auth/add_group', '添加用户组', 1, 1, ''),
(11, 4, 'admin/auth/edit_group', '添加用户组', 1, 1, ''),
(12, 4, 'admin/auth/delete_group', '删除用户组', 1, 1, ''),
(14, 4, 'admin/auth/admin_list', '管理员列表', 1, 1, ''),
(15, 4, 'admin/auth/add_admin', '添加管理员', 1, 1, ''),
(16, 4, 'admin/auth/edit_admin', '修改管理员', 1, 1, ''),
(17, 4, 'admin/auth/delete_admin', '删除管理员', 1, 1, ''),
(18, 4, 'admin/auth/nav_list', '菜单列表', 1, 1, ''),
(19, 4, 'admin/auth/add_nav', '添加菜单', 1, 1, ''),
(20, 4, 'admin/auth/edit_nav', '修改菜单', 1, 1, ''),
(21, 4, 'admin/auth/delete_nav', '删除菜单', 1, 1, ''),
(22, 4, 'admin/auth/order_nav', '菜单排序', 1, 1, ''),
(23, 0, 'admin/index/log', '操作日志', 1, 1, ''),
(26, 1, 'admin/index/clean', '清空缓存', 1, 1, '');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
