

CREATE TABLE `j4x_action_log_config` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `type_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `type_alias` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `id_holder` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title_holder` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `table_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `text_prefix` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


INSERT INTO j4x_action_log_config VALUES
("1","article","com_content.article","id","title","#__content","PLG_ACTIONLOG_JOOMLA"),
("2","article","com_content.form","id","title","#__content","PLG_ACTIONLOG_JOOMLA"),
("3","banner","com_banners.banner","id","name","#__banners","PLG_ACTIONLOG_JOOMLA"),
("4","user_note","com_users.note","id","subject","#__user_notes","PLG_ACTIONLOG_JOOMLA"),
("5","media","com_media.file","","name","","PLG_ACTIONLOG_JOOMLA"),
("6","category","com_categories.category","id","title","#__categories","PLG_ACTIONLOG_JOOMLA"),
("7","menu","com_menus.menu","id","title","#__menu_types","PLG_ACTIONLOG_JOOMLA"),
("8","menu_item","com_menus.item","id","title","#__menu","PLG_ACTIONLOG_JOOMLA"),
("9","newsfeed","com_newsfeeds.newsfeed","id","name","#__newsfeeds","PLG_ACTIONLOG_JOOMLA"),
("10","link","com_redirect.link","id","old_url","#__redirect_links","PLG_ACTIONLOG_JOOMLA"),
("11","tag","com_tags.tag","id","title","#__tags","PLG_ACTIONLOG_JOOMLA"),
("12","style","com_templates.style","id","title","#__template_styles","PLG_ACTIONLOG_JOOMLA"),
("13","plugin","com_plugins.plugin","extension_id","name","#__extensions","PLG_ACTIONLOG_JOOMLA"),
("14","component_config","com_config.component","extension_id","name","","PLG_ACTIONLOG_JOOMLA"),
("15","contact","com_contact.contact","id","name","#__contact_details","PLG_ACTIONLOG_JOOMLA"),
("16","module","com_modules.module","id","title","#__modules","PLG_ACTIONLOG_JOOMLA"),
("17","access_level","com_users.level","id","title","#__viewlevels","PLG_ACTIONLOG_JOOMLA"),
("18","banner_client","com_banners.client","id","name","#__banner_clients","PLG_ACTIONLOG_JOOMLA"),
("19","application_config","com_config.application","","name","","PLG_ACTIONLOG_JOOMLA"),
("20","task","com_scheduler.task","id","title","#__scheduler_tasks","PLG_ACTIONLOG_JOOMLA");




CREATE TABLE `j4x_action_logs` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `message_language_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `log_date` datetime NOT NULL,
  `extension` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_id` int NOT NULL DEFAULT '0',
  `item_id` int NOT NULL DEFAULT '0',
  `ip_address` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0.0.0.0',
  PRIMARY KEY (`id`),
  KEY `idx_user_id` (`user_id`),
  KEY `idx_user_id_logdate` (`user_id`,`log_date`),
  KEY `idx_user_id_extension` (`user_id`,`extension`),
  KEY `idx_extension_item_id` (`extension`,`item_id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


INSERT INTO j4x_action_logs VALUES
("1","PLG_ACTIONLOG_JOOMLA_USER_LOGGED_IN","{\"action\":\"login\",\"userid\":\"424\",\"username\":\"finnern\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=424\",\"app\":\"PLG_ACTIONLOG_JOOMLA_APPLICATION_ADMINISTRATOR\"}","2022-12-11 09:40:40","com_users","424","0","COM_ACTIONLOGS_DISABLED"),
("2","PLG_ACTIONLOG_JOOMLA_APPLICATION_CONFIG_UPDATED","{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_APPLICATION_CONFIG\",\"extension_name\":\"com_config.application\",\"itemlink\":\"index.php?option=com_config\",\"userid\":\"424\",\"username\":\"finnern\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=424\"}","2022-12-11 09:42:05","com_config.application","424","0","COM_ACTIONLOGS_DISABLED"),
("3","PLG_ACTIONLOG_JOOMLA_USER_LOGGED_IN","{\"action\":\"login\",\"userid\":\"424\",\"username\":\"finnern\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=424\",\"app\":\"PLG_ACTIONLOG_JOOMLA_APPLICATION_ADMINISTRATOR\"}","2022-12-11 10:07:26","com_users","424","0","COM_ACTIONLOGS_DISABLED"),
("4","PLG_ACTIONLOG_JOOMLA_EXTENSION_INSTALLED","{\"action\":\"install\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_COMPONENT\",\"id\":\"10000\",\"name\":\"com_rsgallery2\",\"extension_name\":\"com_rsgallery2\",\"userid\":\"424\",\"username\":\"finnern\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=424\"}","2022-12-11 14:26:24","com_installer","424","10000","COM_ACTIONLOGS_DISABLED"),
("5","PLG_ACTIONLOG_JOOMLA_EXTENSION_INSTALLED","{\"action\":\"install\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_COMPONENT\",\"id\":\"10000\",\"name\":\"com_rsgallery2\",\"extension_name\":\"com_rsgallery2\",\"userid\":\"424\",\"username\":\"finnern\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=424\"}","2022-12-11 15:05:28","com_installer","424","10000","COM_ACTIONLOGS_DISABLED"),
("6","PLG_ACTIONLOG_JOOMLA_EXTENSION_INSTALLED","{\"action\":\"install\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_COMPONENT\",\"id\":false,\"name\":\"com_rsgallery2\",\"extension_name\":\"com_rsgallery2\",\"userid\":\"424\",\"username\":\"finnern\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=424\"}","2022-12-11 15:06:02","com_installer","424","0","COM_ACTIONLOGS_DISABLED"),
("7","PLG_ACTIONLOG_JOOMLA_EXTENSION_UPDATED","{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_COMPONENT\",\"id\":\"10000\",\"name\":\"com_rsgallery2\",\"extension_name\":\"com_rsgallery2\",\"userid\":\"424\",\"username\":\"finnern\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=424\"}","2022-12-11 15:44:35","com_installer","424","10000","COM_ACTIONLOGS_DISABLED"),
("8","PLG_ACTIONLOG_JOOMLA_USER_CHECKIN","{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":\"424\",\"title\":\"finnern\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=424\",\"userid\":\"424\",\"username\":\"finnern\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=424\",\"table\":\"#__menu\"}","2022-12-11 15:53:06","com_checkin","424","424","COM_ACTIONLOGS_DISABLED"),
("9","PLG_SYSTEM_ACTIONLOGS_CONTENT_ADDED","{\"action\":\"add\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MENU_ITEM\",\"id\":123,\"title\":\"RSG2\",\"itemlink\":\"index.php?option=com_menus&task=item.edit&id=123\",\"userid\":\"424\",\"username\":\"finnern\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=424\"}","2022-12-11 15:53:28","com_menus.item","424","123","COM_ACTIONLOGS_DISABLED"),
("10","PLG_SYSTEM_ACTIONLOGS_CONTENT_ADDED","{\"action\":\"add\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MENU_ITEM\",\"id\":124,\"title\":\"RSG2 Root gallery\",\"itemlink\":\"index.php?option=com_menus&task=item.edit&id=124\",\"userid\":\"424\",\"username\":\"finnern\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=424\"}","2022-12-11 15:53:54","com_menus.item","424","124","COM_ACTIONLOGS_DISABLED"),
("11","PLG_SYSTEM_ACTIONLOGS_CONTENT_ADDED","{\"action\":\"add\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MENU_ITEM\",\"id\":125,\"title\":\"RSG2 one gallery\",\"itemlink\":\"index.php?option=com_menus&task=item.edit&id=125\",\"userid\":\"424\",\"username\":\"finnern\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=424\"}","2022-12-11 15:54:23","com_menus.item","424","125","COM_ACTIONLOGS_DISABLED"),
("12","PLG_SYSTEM_ACTIONLOGS_CONTENT_ADDED","{\"action\":\"add\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MENU_ITEM\",\"id\":126,\"title\":\"RSG2 slideshow\",\"itemlink\":\"index.php?option=com_menus&task=item.edit&id=126\",\"userid\":\"424\",\"username\":\"finnern\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=424\"}","2022-12-11 15:55:04","com_menus.item","424","126","COM_ACTIONLOGS_DISABLED"),
("13","PLG_SYSTEM_ACTIONLOGS_CONTENT_UPDATED","{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MENU_ITEM\",\"id\":124,\"title\":\"RSG2 Root gallery\",\"itemlink\":\"index.php?option=com_menus&task=item.edit&id=124\",\"userid\":\"424\",\"username\":\"finnern\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=424\"}","2022-12-11 15:55:19","com_menus.item","424","124","COM_ACTIONLOGS_DISABLED"),
("14","PLG_ACTIONLOG_JOOMLA_USER_CHECKIN","{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":\"424\",\"title\":\"finnern\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=424\",\"userid\":\"424\",\"username\":\"finnern\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=424\",\"table\":\"#__menu\"}","2022-12-11 15:55:19","com_checkin","424","424","COM_ACTIONLOGS_DISABLED"),
("15","PLG_SYSTEM_ACTIONLOGS_CONTENT_UPDATED","{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MENU_ITEM\",\"id\":125,\"title\":\"RSG2 one gallery\",\"itemlink\":\"index.php?option=com_menus&task=item.edit&id=125\",\"userid\":\"424\",\"username\":\"finnern\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=424\"}","2022-12-11 15:56:08","com_menus.item","424","125","COM_ACTIONLOGS_DISABLED"),
("16","PLG_ACTIONLOG_JOOMLA_USER_CHECKIN","{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":\"424\",\"title\":\"finnern\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=424\",\"userid\":\"424\",\"username\":\"finnern\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=424\",\"table\":\"#__menu\"}","2022-12-11 15:56:08","com_checkin","424","424","COM_ACTIONLOGS_DISABLED"),
("17","PLG_ACTIONLOG_JOOMLA_USER_LOGGED_IN","{\"action\":\"login\",\"userid\":\"424\",\"username\":\"finnern\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=424\",\"app\":\"PLG_ACTIONLOG_JOOMLA_APPLICATION_ADMINISTRATOR\"}","2023-01-06 18:49:39","com_users","424","0","COM_ACTIONLOGS_DISABLED"),
("18","PLG_ACTIONLOG_JOOMLA_USER_LOGGED_IN","{\"action\":\"login\",\"userid\":\"424\",\"username\":\"finnern\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=424\",\"app\":\"PLG_ACTIONLOG_JOOMLA_APPLICATION_ADMINISTRATOR\"}","2023-02-03 20:19:40","com_users","424","0","COM_ACTIONLOGS_DISABLED"),
("19","PLG_ACTIONLOG_JOOMLA_COMPONENT_CONFIG_UPDATED","{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_COMPONENT_CONFIG\",\"id\":\"28\",\"title\":\"com_joomlaupdate\",\"extension_name\":\"com_joomlaupdate\",\"itemlink\":\"index.php?option=com_config&task=component.edit&extension_id=28\",\"userid\":\"424\",\"username\":\"finnern\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=424\"}","2023-02-03 20:58:14","com_config.component","424","28","COM_ACTIONLOGS_DISABLED"),
("20","PLG_ACTIONLOG_JOOMLA_USER_UPDATE","{\"action\":\"joomlaupdate\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":424,\"title\":\"finnern\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=424\",\"userid\":424,\"username\":\"finnern\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=424\",\"version\":\"4.2.7\",\"oldversion\":\"Unknown\"}","2023-02-03 21:00:04","com_joomlaupdate","424","424","COM_ACTIONLOGS_DISABLED"),
("21","PLG_ACTIONLOG_JOOMLA_USER_UPDATE","{\"action\":\"joomlaupdate\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":424,\"title\":\"finnern\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=424\",\"userid\":424,\"username\":\"finnern\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=424\",\"version\":\"4.2.7\",\"oldversion\":\"3.10.11\"}","2023-02-03 21:00:04","com_joomlaupdate","424","424","COM_ACTIONLOGS_DISABLED"),
("22","PLG_SYSTEM_ACTIONLOGS_CONTENT_ADDED","{\"action\":\"add\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MODULE\",\"id\":109,\"title\":\"Rsgallery2 Dashboard\",\"extension_name\":\"Rsgallery2 Dashboard\",\"itemlink\":\"index.php?option=com_modules&task=module.edit&id=109\",\"userid\":424,\"username\":\"finnern\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=424\"}","2023-02-03 21:13:15","com_modules.module","424","109","COM_ACTIONLOGS_DISABLED"),
("23","PLG_ACTIONLOG_JOOMLA_EXTENSION_INSTALLED","{\"action\":\"install\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_COMPONENT\",\"id\":10000,\"name\":\"COM_RSGALLERY2\",\"extension_name\":\"COM_RSGALLERY2\",\"userid\":424,\"username\":\"finnern\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=424\"}","2023-02-03 21:13:15","com_installer","424","10000","COM_ACTIONLOGS_DISABLED"),
("24","PLG_SYSTEM_ACTIONLOGS_CONTENT_ADDED","{\"action\":\"add\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MODULE\",\"id\":110,\"title\":\"Rsgallery2 Dashboard\",\"extension_name\":\"Rsgallery2 Dashboard\",\"itemlink\":\"index.php?option=com_modules&task=module.edit&id=110\",\"userid\":424,\"username\":\"finnern\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=424\"}","2023-02-03 21:36:23","com_modules.module","424","110","COM_ACTIONLOGS_DISABLED"),
("25","PLG_ACTIONLOG_JOOMLA_EXTENSION_INSTALLED","{\"action\":\"install\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_COMPONENT\",\"id\":10000,\"name\":\"COM_RSGALLERY2\",\"extension_name\":\"COM_RSGALLERY2\",\"userid\":424,\"username\":\"finnern\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=424\"}","2023-02-03 21:36:23","com_installer","424","10000","COM_ACTIONLOGS_DISABLED"),
("26","PLG_SYSTEM_ACTIONLOGS_CONTENT_ADDED","{\"action\":\"add\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MODULE\",\"id\":111,\"title\":\"Rsgallery2 Dashboard\",\"extension_name\":\"Rsgallery2 Dashboard\",\"itemlink\":\"index.php?option=com_modules&task=module.edit&id=111\",\"userid\":424,\"username\":\"finnern\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=424\"}","2023-02-03 21:39:16","com_modules.module","424","111","COM_ACTIONLOGS_DISABLED"),
("27","PLG_ACTIONLOG_JOOMLA_EXTENSION_INSTALLED","{\"action\":\"install\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_COMPONENT\",\"id\":10000,\"name\":\"COM_RSGALLERY2\",\"extension_name\":\"COM_RSGALLERY2\",\"userid\":424,\"username\":\"finnern\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=424\"}","2023-02-03 21:39:16","com_installer","424","10000","COM_ACTIONLOGS_DISABLED"),
("28","PLG_SYSTEM_ACTIONLOGS_CONTENT_ADDED","{\"action\":\"add\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MODULE\",\"id\":112,\"title\":\"Rsgallery2 Dashboard\",\"extension_name\":\"Rsgallery2 Dashboard\",\"itemlink\":\"index.php?option=com_modules&task=module.edit&id=112\",\"userid\":424,\"username\":\"finnern\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=424\"}","2023-02-03 21:59:11","com_modules.module","424","112","COM_ACTIONLOGS_DISABLED"),
("29","PLG_ACTIONLOG_JOOMLA_EXTENSION_INSTALLED","{\"action\":\"install\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_COMPONENT\",\"id\":10000,\"name\":\"COM_RSGALLERY2\",\"extension_name\":\"COM_RSGALLERY2\",\"userid\":424,\"username\":\"finnern\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=424\"}","2023-02-03 21:59:11","com_installer","424","10000","COM_ACTIONLOGS_DISABLED");




CREATE TABLE `j4x_action_logs_extensions` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `extension` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


INSERT INTO j4x_action_logs_extensions VALUES
("1","com_banners"),
("2","com_cache"),
("3","com_categories"),
("4","com_config"),
("5","com_contact"),
("6","com_content"),
("7","com_installer"),
("8","com_media"),
("9","com_menus"),
("10","com_messages"),
("11","com_modules"),
("12","com_newsfeeds"),
("13","com_plugins"),
("14","com_redirect"),
("15","com_tags"),
("16","com_templates"),
("17","com_users"),
("18","com_checkin"),
("19","com_scheduler");




CREATE TABLE `j4x_action_logs_users` (
  `user_id` int unsigned NOT NULL,
  `notify` tinyint unsigned NOT NULL,
  `extensions` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`user_id`),
  KEY `idx_notify` (`notify`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;






CREATE TABLE `j4x_assets` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `parent_id` int NOT NULL DEFAULT '0' COMMENT 'Nested set parent.',
  `lft` int NOT NULL DEFAULT '0' COMMENT 'Nested set lft.',
  `rgt` int NOT NULL DEFAULT '0' COMMENT 'Nested set rgt.',
  `level` int unsigned NOT NULL COMMENT 'The cached level in the nested tree.',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The unique name for the asset.\n',
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The descriptive title for the asset.',
  `rules` varchar(5120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'JSON encoded access control.',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_asset_name` (`name`),
  KEY `idx_lft_rgt` (`lft`,`rgt`),
  KEY `idx_parent_id` (`parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=115 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


INSERT INTO j4x_assets VALUES
("1","0","0","223","0","root.1","Root Asset","{\"core.login.site\":{\"6\":1,\"2\":1},\"core.login.admin\":{\"6\":1},\"core.login.offline\":{\"6\":1},\"core.admin\":{\"8\":1},\"core.manage\":{\"7\":1},\"core.create\":{\"6\":1,\"3\":1},\"core.delete\":{\"6\":1},\"core.edit\":{\"6\":1,\"4\":1},\"core.edit.state\":{\"6\":1,\"5\":1},\"core.edit.own\":{\"6\":1,\"3\":1}}"),
("2","1","1","2","1","com_admin","com_admin","{}"),
("3","1","3","6","1","com_banners","com_banners","{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1}}"),
("4","1","7","8","1","com_cache","com_cache","{\"core.admin\":{\"7\":1},\"core.manage\":{\"7\":1}}"),
("5","1","9","10","1","com_checkin","com_checkin","{\"core.admin\":{\"7\":1},\"core.manage\":{\"7\":1}}"),
("6","1","11","12","1","com_config","com_config","{}"),
("7","1","13","16","1","com_contact","com_contact","{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1}}"),
("8","1","17","20","1","com_content","com_content","{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.create\":{\"3\":1},\"core.edit\":{\"4\":1},\"core.edit.state\":{\"5\":1}}"),
("9","1","21","22","1","com_cpanel","com_cpanel","{}"),
("10","1","23","24","1","com_installer","com_installer","{\"core.manage\":{\"7\":0},\"core.delete\":{\"7\":0},\"core.edit.state\":{\"7\":0}}"),
("11","1","25","26","1","com_languages","com_languages","{\"core.admin\":{\"7\":1}}"),
("12","1","27","28","1","com_login","com_login","{}"),
("13","1","29","30","1","com_mailto","com_mailto","{}"),
("14","1","31","32","1","com_massmail","com_massmail","{}"),
("15","1","33","34","1","com_media","com_media","{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.create\":{\"3\":1},\"core.delete\":{\"5\":1}}"),
("16","1","35","38","1","com_menus","com_menus","{\"core.admin\":{\"7\":1}}"),
("17","1","39","40","1","com_messages","com_messages","{\"core.admin\":{\"7\":1},\"core.manage\":{\"7\":1}}"),
("18","1","41","86","1","com_modules","com_modules","{\"core.admin\":{\"7\":1}}"),
("19","1","87","90","1","com_newsfeeds","com_newsfeeds","{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1}}"),
("20","1","91","92","1","com_plugins","com_plugins","{\"core.admin\":{\"7\":1}}"),
("21","1","93","94","1","com_redirect","com_redirect","{\"core.admin\":{\"7\":1}}"),
("22","1","95","96","1","com_search","com_search","{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1}}"),
("23","1","97","98","1","com_templates","com_templates","{\"core.admin\":{\"7\":1}}"),
("24","1","99","102","1","com_users","com_users","{\"core.admin\":{\"7\":1}}"),
("26","1","103","104","1","com_wrapper","com_wrapper","{}"),
("27","8","18","19","2","com_content.category.2","Uncategorised","{}"),
("28","3","4","5","2","com_banners.category.3","Uncategorised","{}"),
("29","7","14","15","2","com_contact.category.4","Uncategorised","{}"),
("30","19","88","89","2","com_newsfeeds.category.5","Uncategorised","{}"),
("32","24","100","101","2","com_users.category.7","Uncategorised","{}"),
("33","1","105","106","1","com_finder","com_finder","{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1}}"),
("34","1","107","108","1","com_joomlaupdate","com_joomlaupdate","{}"),
("35","1","109","110","1","com_tags","com_tags","{}"),
("36","1","111","112","1","com_contenthistory","com_contenthistory","{}"),
("37","1","113","114","1","com_ajax","com_ajax","{}"),
("38","1","115","116","1","com_postinstall","com_postinstall","{}"),
("39","18","42","43","2","com_modules.module.1","Main Menu","{}"),
("40","18","44","45","2","com_modules.module.2","Login","{}"),
("41","18","46","47","2","com_modules.module.3","Popular Articles","{}"),
("42","18","48","49","2","com_modules.module.4","Recently Added Articles","{}"),
("43","18","50","51","2","com_modules.module.8","Toolbar","{}"),
("44","18","52","53","2","com_modules.module.9","Quick Icons","{}"),
("45","18","54","55","2","com_modules.module.10","Logged-in Users","{}"),
("46","18","56","57","2","com_modules.module.12","Admin Menu","{}"),
("47","18","58","59","2","com_modules.module.13","Admin Submenu","{}"),
("48","18","60","61","2","com_modules.module.14","User Status","{}"),
("49","18","62","63","2","com_modules.module.15","Title","{}"),
("50","18","64","65","2","com_modules.module.16","Login Form","{}"),
("51","18","66","67","2","com_modules.module.17","Breadcrumbs","{}"),
("52","18","68","69","2","com_modules.module.79","Multilanguage status","{}"),
("53","18","70","71","2","com_modules.module.86","Joomla Version","{}"),
("54","16","36","37","2","com_menus.menu.1","Main Menu","{}"),
("55","18","72","73","2","com_modules.module.87","Sample Data","{}"),
("56","1","117","118","1","com_privacy","com_privacy","{}"),
("57","1","119","120","1","com_actionlogs","com_actionlogs","{}"),
("58","18","74","75","2","com_modules.module.88","Latest Actions","{}"),
("59","18","76","77","2","com_modules.module.89","Privacy Dashboard","{}"),
("60","1","121","122","1","com_rsgallery2","com_rsgallery2","{}"),
("61","1","123","124","1","#__rsgallery2_galleries.1","#__rsgallery2_galleries.1","{}"),
("62","1","125","126","1","#__rsgallery2_galleries.2","#__rsgallery2_galleries.2","{}"),
("63","1","127","128","1","#__rsgallery2_galleries.3","#__rsgallery2_galleries.3","{}"),
("64","1","129","130","1","#__rsgallery2_galleries.4","#__rsgallery2_galleries.4","{}"),
("65","1","131","132","1","#__rsgallery2_files.1","#__rsgallery2_files.1","{}"),
("66","1","133","134","1","#__rsgallery2_files.2","#__rsgallery2_files.2","{}"),
("67","1","135","136","1","#__rsgallery2_files.3","#__rsgallery2_files.3","{}"),
("68","1","137","138","1","#__rsgallery2_files.4","#__rsgallery2_files.4","{}"),
("69","1","139","140","1","#__rsgallery2_files.5","#__rsgallery2_files.5","{}"),
("70","1","141","142","1","#__rsgallery2_files.6","#__rsgallery2_files.6","{}"),
("71","1","143","144","1","#__rsgallery2_files.7","#__rsgallery2_files.7","{}"),
("72","1","145","146","1","#__rsgallery2_files.8","#__rsgallery2_files.8","{}"),
("73","1","147","148","1","#__rsgallery2_files.9","#__rsgallery2_files.9","{}"),
("74","1","149","150","1","#__rsgallery2_files.10","#__rsgallery2_files.10","{}"),
("75","1","151","152","1","#__rsgallery2_files.11","#__rsgallery2_files.11","{}"),
("76","1","153","154","1","#__rsgallery2_files.12","#__rsgallery2_files.12","{}"),
("77","1","155","156","1","#__rsgallery2_files.13","#__rsgallery2_files.13","{}"),
("78","1","157","158","1","#__rsgallery2_files.14","#__rsgallery2_files.14","{}"),
("79","1","159","160","1","#__rsgallery2_files.15","#__rsgallery2_files.15","{}"),
("80","1","161","162","1","#__rsgallery2_files.16","#__rsgallery2_files.16","{}"),
("81","1","163","164","1","#__rsgallery2_files.17","#__rsgallery2_files.17","{}"),
("82","1","165","166","1","#__rsgallery2_files.18","#__rsgallery2_files.18","{}"),
("83","1","167","168","1","#__rsgallery2_files.19","#__rsgallery2_files.19","{}"),
("84","1","169","170","1","#__rsgallery2_files.20","#__rsgallery2_files.20","{}"),
("85","1","171","172","1","#__rsgallery2_files.21","#__rsgallery2_files.21","{}"),
("86","1","173","174","1","#__rsgallery2_files.22","#__rsgallery2_files.22","{}"),
("87","1","175","176","1","#__rsgallery2_files.23","#__rsgallery2_files.23","{}"),
("88","1","177","178","1","#__rsgallery2_files.24","#__rsgallery2_files.24","{}"),
("89","1","179","180","1","#__rsgallery2_files.25","#__rsgallery2_files.25","{}"),
("90","1","181","182","1","#__rsgallery2_files.26","#__rsgallery2_files.26","{}"),
("91","1","183","184","1","#__rsgallery2_files.27","#__rsgallery2_files.27","{}"),
("92","1","185","186","1","#__rsgallery2_files.28","#__rsgallery2_files.28","{}"),
("93","1","187","188","1","#__rsgallery2_files.29","#__rsgallery2_files.29","{}"),
("94","1","189","190","1","#__rsgallery2_files.30","#__rsgallery2_files.30","{}"),
("95","1","191","192","1","#__rsgallery2_files.31","#__rsgallery2_files.31","{}"),
("96","1","193","194","1","#__rsgallery2_files.32","#__rsgallery2_files.32","{}"),
("97","1","195","196","1","#__rsgallery2_files.33","#__rsgallery2_files.33","{}"),
("98","1","197","198","1","#__rsgallery2_files.34","#__rsgallery2_files.34","{}"),
("99","1","199","200","1","#__rsgallery2_files.35","#__rsgallery2_files.35","{}"),
("100","1","201","202","1","#__rsgallery2_files.36","#__rsgallery2_files.36","{}"),
("101","1","203","204","1","#__rsgallery2_files.37","#__rsgallery2_files.37","{}"),
("102","1","205","206","1","#__rsgallery2_files.38","#__rsgallery2_files.38","{}");
INSERT INTO j4x_assets VALUES
("103","1","207","208","1","#__rsgallery2_files.39","#__rsgallery2_files.39","{}"),
("104","1","209","210","1","#__rsgallery2_files.40","#__rsgallery2_files.40","{}"),
("105","1","211","212","1","#__rsgallery2_files.41","#__rsgallery2_files.41","{}"),
("106","1","213","214","1","#__rsgallery2_files.42","#__rsgallery2_files.42","{}"),
("107","1","215","216","1","#__rsgallery2_files.43","#__rsgallery2_files.43","{}"),
("108","1","217","218","1","#__rsgallery2_files.44","#__rsgallery2_files.44","{}"),
("109","1","219","220","1","#__rsgallery2_files.45","#__rsgallery2_files.45","{}"),
("110","1","221","222","1","#__rsgallery2_files.46","#__rsgallery2_files.46","{}"),
("111","18","78","79","2","com_modules.module.109","Rsgallery2 Dashboard","{}"),
("112","18","80","81","2","com_modules.module.110","Rsgallery2 Dashboard","{}"),
("113","18","82","83","2","com_modules.module.111","Rsgallery2 Dashboard","{}"),
("114","18","84","85","2","com_modules.module.112","Rsgallery2 Dashboard","{}");




CREATE TABLE `j4x_associations` (
  `id` int NOT NULL COMMENT 'A reference to the associated item.',
  `context` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The context of the associated item.',
  `key` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The key for the association computed from an md5 on associated ids.',
  PRIMARY KEY (`context`,`id`),
  KEY `idx_key` (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;






CREATE TABLE `j4x_banner_clients` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `contact` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `extrainfo` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` tinyint NOT NULL DEFAULT '0',
  `checked_out` int unsigned DEFAULT NULL,
  `checked_out_time` datetime DEFAULT NULL,
  `metakey` text COLLATE utf8mb4_unicode_ci,
  `own_prefix` tinyint NOT NULL DEFAULT '0',
  `metakey_prefix` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `purchase_type` tinyint NOT NULL DEFAULT '-1',
  `track_clicks` tinyint NOT NULL DEFAULT '-1',
  `track_impressions` tinyint NOT NULL DEFAULT '-1',
  PRIMARY KEY (`id`),
  KEY `idx_own_prefix` (`own_prefix`),
  KEY `idx_metakey_prefix` (`metakey_prefix`(100))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;






CREATE TABLE `j4x_banner_tracks` (
  `track_date` datetime NOT NULL,
  `track_type` int unsigned NOT NULL,
  `banner_id` int unsigned NOT NULL,
  `count` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`track_date`,`track_type`,`banner_id`),
  KEY `idx_track_date` (`track_date`),
  KEY `idx_track_type` (`track_type`),
  KEY `idx_banner_id` (`banner_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;






CREATE TABLE `j4x_banners` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cid` int NOT NULL DEFAULT '0',
  `type` int NOT NULL DEFAULT '0',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `alias` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `imptotal` int NOT NULL DEFAULT '0',
  `impmade` int NOT NULL DEFAULT '0',
  `clicks` int NOT NULL DEFAULT '0',
  `clickurl` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `state` tinyint NOT NULL DEFAULT '0',
  `catid` int unsigned NOT NULL DEFAULT '0',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `custombannercode` varchar(2048) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sticky` tinyint unsigned NOT NULL DEFAULT '0',
  `ordering` int NOT NULL DEFAULT '0',
  `metakey` text COLLATE utf8mb4_unicode_ci,
  `params` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `own_prefix` tinyint NOT NULL DEFAULT '0',
  `metakey_prefix` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `purchase_type` tinyint NOT NULL DEFAULT '-1',
  `track_clicks` tinyint NOT NULL DEFAULT '-1',
  `track_impressions` tinyint NOT NULL DEFAULT '-1',
  `checked_out` int unsigned DEFAULT NULL,
  `checked_out_time` datetime DEFAULT NULL,
  `publish_up` datetime DEFAULT NULL,
  `publish_down` datetime DEFAULT NULL,
  `reset` datetime DEFAULT NULL,
  `created` datetime NOT NULL,
  `language` char(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `created_by` int unsigned NOT NULL DEFAULT '0',
  `created_by_alias` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `modified` datetime NOT NULL,
  `modified_by` int unsigned NOT NULL DEFAULT '0',
  `version` int unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `idx_state` (`state`),
  KEY `idx_own_prefix` (`own_prefix`),
  KEY `idx_metakey_prefix` (`metakey_prefix`(100)),
  KEY `idx_banner_catid` (`catid`),
  KEY `idx_language` (`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;






CREATE TABLE `j4x_categories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `asset_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'FK to the #__assets table.',
  `parent_id` int unsigned NOT NULL DEFAULT '0',
  `lft` int NOT NULL DEFAULT '0',
  `rgt` int NOT NULL DEFAULT '0',
  `level` int unsigned NOT NULL DEFAULT '0',
  `path` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `extension` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `alias` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `note` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `published` tinyint NOT NULL DEFAULT '0',
  `checked_out` int unsigned DEFAULT NULL,
  `checked_out_time` datetime DEFAULT NULL,
  `access` int unsigned NOT NULL DEFAULT '0',
  `params` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `metadesc` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'The meta description for the page.',
  `metakey` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'The meta keywords for the page.',
  `metadata` varchar(2048) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'JSON encoded metadata properties.',
  `created_user_id` int unsigned NOT NULL DEFAULT '0',
  `created_time` datetime NOT NULL,
  `modified_user_id` int unsigned NOT NULL DEFAULT '0',
  `modified_time` datetime NOT NULL,
  `hits` int unsigned NOT NULL DEFAULT '0',
  `language` char(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `version` int unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `cat_idx` (`extension`,`published`,`access`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_path` (`path`(100)),
  KEY `idx_left_right` (`lft`,`rgt`),
  KEY `idx_alias` (`alias`(100)),
  KEY `idx_language` (`language`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


INSERT INTO j4x_categories VALUES
("1","0","0","0","11","0","","system","ROOT","root","","","1","","","1","{}","","","{}","424","2022-12-11 09:40:03","424","2022-12-11 09:40:03","0","*","1"),
("2","27","1","1","2","1","uncategorised","com_content","Uncategorised","uncategorised","","","1","","","1","{\"category_layout\":\"\",\"image\":\"\"}","","","{\"author\":\"\",\"robots\":\"\"}","424","2022-12-11 09:40:03","424","2022-12-11 09:40:03","0","*","1"),
("3","28","1","3","4","1","uncategorised","com_banners","Uncategorised","uncategorised","","","1","","","1","{\"category_layout\":\"\",\"image\":\"\"}","","","{\"author\":\"\",\"robots\":\"\"}","424","2022-12-11 09:40:03","424","2022-12-11 09:40:03","0","*","1"),
("4","29","1","5","6","1","uncategorised","com_contact","Uncategorised","uncategorised","","","1","","","1","{\"category_layout\":\"\",\"image\":\"\"}","","","{\"author\":\"\",\"robots\":\"\"}","424","2022-12-11 09:40:03","424","2022-12-11 09:40:03","0","*","1"),
("5","30","1","7","8","1","uncategorised","com_newsfeeds","Uncategorised","uncategorised","","","1","","","1","{\"category_layout\":\"\",\"image\":\"\"}","","","{\"author\":\"\",\"robots\":\"\"}","424","2022-12-11 09:40:03","424","2022-12-11 09:40:03","0","*","1"),
("7","32","1","9","10","1","uncategorised","com_users","Uncategorised","uncategorised","","","1","","","1","{\"category_layout\":\"\",\"image\":\"\"}","","","{\"author\":\"\",\"robots\":\"\"}","424","2022-12-11 09:40:03","424","2022-12-11 09:40:03","0","*","1");




CREATE TABLE `j4x_contact_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `alias` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `con_position` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `suburb` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postcode` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telephone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fax` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `misc` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_to` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `default_con` tinyint unsigned NOT NULL DEFAULT '0',
  `published` tinyint NOT NULL DEFAULT '0',
  `checked_out` int unsigned DEFAULT NULL,
  `checked_out_time` datetime DEFAULT NULL,
  `ordering` int NOT NULL DEFAULT '0',
  `params` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int NOT NULL DEFAULT '0',
  `catid` int NOT NULL DEFAULT '0',
  `access` int unsigned NOT NULL DEFAULT '0',
  `mobile` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `webpage` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `sortname1` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `sortname2` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `sortname3` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `language` varchar(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  `created_by` int unsigned NOT NULL DEFAULT '0',
  `created_by_alias` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `modified` datetime NOT NULL,
  `modified_by` int unsigned NOT NULL DEFAULT '0',
  `metakey` text COLLATE utf8mb4_unicode_ci,
  `metadesc` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `metadata` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `featured` tinyint unsigned NOT NULL DEFAULT '0' COMMENT 'Set if contact is featured.',
  `publish_up` datetime DEFAULT NULL,
  `publish_down` datetime DEFAULT NULL,
  `version` int unsigned NOT NULL DEFAULT '1',
  `hits` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_state` (`published`),
  KEY `idx_catid` (`catid`),
  KEY `idx_createdby` (`created_by`),
  KEY `idx_featured_catid` (`featured`,`catid`),
  KEY `idx_language` (`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;






CREATE TABLE `j4x_content` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `asset_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'FK to the #__assets table.',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `alias` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `introtext` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `fulltext` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` tinyint NOT NULL DEFAULT '0',
  `catid` int unsigned NOT NULL DEFAULT '0',
  `created` datetime NOT NULL,
  `created_by` int unsigned NOT NULL DEFAULT '0',
  `created_by_alias` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `modified` datetime NOT NULL,
  `modified_by` int unsigned NOT NULL DEFAULT '0',
  `checked_out` int unsigned DEFAULT NULL,
  `checked_out_time` datetime DEFAULT NULL,
  `publish_up` datetime DEFAULT NULL,
  `publish_down` datetime DEFAULT NULL,
  `images` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `urls` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `attribs` varchar(5120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `version` int unsigned NOT NULL DEFAULT '1',
  `ordering` int NOT NULL DEFAULT '0',
  `metakey` text COLLATE utf8mb4_unicode_ci,
  `metadesc` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `access` int unsigned NOT NULL DEFAULT '0',
  `hits` int unsigned NOT NULL DEFAULT '0',
  `metadata` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `featured` tinyint unsigned NOT NULL DEFAULT '0' COMMENT 'Set if article is featured.',
  `language` char(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The language code for the article.',
  `note` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_state` (`state`),
  KEY `idx_catid` (`catid`),
  KEY `idx_createdby` (`created_by`),
  KEY `idx_featured_catid` (`featured`,`catid`),
  KEY `idx_language` (`language`),
  KEY `idx_alias` (`alias`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;






CREATE TABLE `j4x_content_frontpage` (
  `content_id` int NOT NULL DEFAULT '0',
  `ordering` int NOT NULL DEFAULT '0',
  `featured_up` datetime DEFAULT NULL,
  `featured_down` datetime DEFAULT NULL,
  PRIMARY KEY (`content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;






CREATE TABLE `j4x_content_rating` (
  `content_id` int NOT NULL DEFAULT '0',
  `rating_sum` int unsigned NOT NULL DEFAULT '0',
  `rating_count` int unsigned NOT NULL DEFAULT '0',
  `lastip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;






CREATE TABLE `j4x_content_types` (
  `type_id` int unsigned NOT NULL AUTO_INCREMENT,
  `type_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `type_alias` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `table` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `rules` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `field_mappings` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `router` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `content_history_options` varchar(5120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'JSON string for com_contenthistory options',
  PRIMARY KEY (`type_id`),
  KEY `idx_alias` (`type_alias`(100))
) ENGINE=InnoDB AUTO_INCREMENT=10000 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


INSERT INTO j4x_content_types VALUES
("1","Article","com_content.article","{\"special\":{\"dbtable\":\"#__content\",\"key\":\"id\",\"type\":\"ArticleTable\",\"prefix\":\"Joomla\\\\Component\\\\Content\\\\Administrator\\\\Table\\\\\",\"config\":\"array()\"},\"common\":{\"dbtable\":\"#__ucm_content\",\"key\":\"ucm_id\",\"type\":\"Corecontent\",\"prefix\":\"Joomla\\\\CMS\\\\Table\\\\\",\"config\":\"array()\"}}","","{\"common\":{\"core_content_item_id\":\"id\",\"core_title\":\"title\",\"core_state\":\"state\",\"core_alias\":\"alias\",\"core_created_time\":\"created\",\"core_modified_time\":\"modified\",\"core_body\":\"introtext\", \"core_hits\":\"hits\",\"core_publish_up\":\"publish_up\",\"core_publish_down\":\"publish_down\",\"core_access\":\"access\", \"core_params\":\"attribs\", \"core_featured\":\"featured\", \"core_metadata\":\"metadata\", \"core_language\":\"language\", \"core_images\":\"images\", \"core_urls\":\"urls\", \"core_version\":\"version\", \"core_ordering\":\"ordering\", \"core_metakey\":\"metakey\", \"core_metadesc\":\"metadesc\", \"core_catid\":\"catid\", \"core_xreference\":\"xreference\", \"asset_id\":\"asset_id\", \"note\":\"note\"}, \"special\":{\"fulltext\":\"fulltext\"}}","ContentHelperRoute::getArticleRoute","{\"formFile\":\"administrator\\/components\\/com_content\\/models\\/forms\\/article.xml\", \"hideFields\":[\"asset_id\",\"checked_out\",\"checked_out_time\",\"version\"],\"ignoreChanges\":[\"modified_by\", \"modified\", \"checked_out\", \"checked_out_time\", \"version\", \"hits\", \"ordering\"],\"convertToInt\":[\"publish_up\", \"publish_down\", \"featured\", \"ordering\"],\"displayLookup\":[{\"sourceColumn\":\"catid\",\"targetTable\":\"#__categories\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"},{\"sourceColumn\":\"created_by\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"},{\"sourceColumn\":\"access\",\"targetTable\":\"#__viewlevels\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"},{\"sourceColumn\":\"modified_by\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"} ]}"),
("2","Contact","com_contact.contact","{\"special\":{\"dbtable\":\"#__contact_details\",\"key\":\"id\",\"type\":\"ContactTable\",\"prefix\":\"Joomla\\\\Component\\\\Contact\\\\Administrator\\\\Table\\\\\",\"config\":\"array()\"},\"common\":{\"dbtable\":\"#__ucm_content\",\"key\":\"ucm_id\",\"type\":\"Corecontent\",\"prefix\":\"Joomla\\\\CMS\\\\Table\\\\\",\"config\":\"array()\"}}","","{\"common\":{\"core_content_item_id\":\"id\",\"core_title\":\"name\",\"core_state\":\"published\",\"core_alias\":\"alias\",\"core_created_time\":\"created\",\"core_modified_time\":\"modified\",\"core_body\":\"address\", \"core_hits\":\"hits\",\"core_publish_up\":\"publish_up\",\"core_publish_down\":\"publish_down\",\"core_access\":\"access\", \"core_params\":\"params\", \"core_featured\":\"featured\", \"core_metadata\":\"metadata\", \"core_language\":\"language\", \"core_images\":\"image\", \"core_urls\":\"webpage\", \"core_version\":\"version\", \"core_ordering\":\"ordering\", \"core_metakey\":\"metakey\", \"core_metadesc\":\"metadesc\", \"core_catid\":\"catid\", \"core_xreference\":\"xreference\", \"asset_id\":\"null\"}, \"special\":{\"con_position\":\"con_position\",\"suburb\":\"suburb\",\"state\":\"state\",\"country\":\"country\",\"postcode\":\"postcode\",\"telephone\":\"telephone\",\"fax\":\"fax\",\"misc\":\"misc\",\"email_to\":\"email_to\",\"default_con\":\"default_con\",\"user_id\":\"user_id\",\"mobile\":\"mobile\",\"sortname1\":\"sortname1\",\"sortname2\":\"sortname2\",\"sortname3\":\"sortname3\"}}","ContactHelperRoute::getContactRoute","{\"formFile\":\"administrator\\/components\\/com_contact\\/models\\/forms\\/contact.xml\",\"hideFields\":[\"default_con\",\"checked_out\",\"checked_out_time\",\"version\",\"xreference\"],\"ignoreChanges\":[\"modified_by\", \"modified\", \"checked_out\", \"checked_out_time\", \"version\", \"hits\"],\"convertToInt\":[\"publish_up\", \"publish_down\", \"featured\", \"ordering\"], \"displayLookup\":[ {\"sourceColumn\":\"created_by\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"},{\"sourceColumn\":\"catid\",\"targetTable\":\"#__categories\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"},{\"sourceColumn\":\"modified_by\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"},{\"sourceColumn\":\"access\",\"targetTable\":\"#__viewlevels\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"},{\"sourceColumn\":\"user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"} ] }"),
("3","Newsfeed","com_newsfeeds.newsfeed","{\"special\":{\"dbtable\":\"#__newsfeeds\",\"key\":\"id\",\"type\":\"NewsfeedTable\",\"prefix\":\"Joomla\\\\Component\\\\Newsfeeds\\\\Administrator\\\\Table\\\\\",\"config\":\"array()\"},\"common\":{\"dbtable\":\"#__ucm_content\",\"key\":\"ucm_id\",\"type\":\"Corecontent\",\"prefix\":\"Joomla\\\\CMS\\\\Table\\\\\",\"config\":\"array()\"}}","","{\"common\":{\"core_content_item_id\":\"id\",\"core_title\":\"name\",\"core_state\":\"published\",\"core_alias\":\"alias\",\"core_created_time\":\"created\",\"core_modified_time\":\"modified\",\"core_body\":\"description\", \"core_hits\":\"hits\",\"core_publish_up\":\"publish_up\",\"core_publish_down\":\"publish_down\",\"core_access\":\"access\", \"core_params\":\"params\", \"core_featured\":\"featured\", \"core_metadata\":\"metadata\", \"core_language\":\"language\", \"core_images\":\"images\", \"core_urls\":\"link\", \"core_version\":\"version\", \"core_ordering\":\"ordering\", \"core_metakey\":\"metakey\", \"core_metadesc\":\"metadesc\", \"core_catid\":\"catid\", \"core_xreference\":\"xreference\", \"asset_id\":\"null\"}, \"special\":{\"numarticles\":\"numarticles\",\"cache_time\":\"cache_time\",\"rtl\":\"rtl\"}}","NewsfeedsHelperRoute::getNewsfeedRoute","{\"formFile\":\"administrator\\/components\\/com_newsfeeds\\/models\\/forms\\/newsfeed.xml\",\"hideFields\":[\"asset_id\",\"checked_out\",\"checked_out_time\",\"version\"],\"ignoreChanges\":[\"modified_by\", \"modified\", \"checked_out\", \"checked_out_time\", \"version\", \"hits\"],\"convertToInt\":[\"publish_up\", \"publish_down\", \"featured\", \"ordering\"],\"displayLookup\":[{\"sourceColumn\":\"catid\",\"targetTable\":\"#__categories\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"},{\"sourceColumn\":\"created_by\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"},{\"sourceColumn\":\"access\",\"targetTable\":\"#__viewlevels\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"},{\"sourceColumn\":\"modified_by\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"} ]}"),
("4","User","com_users.user","{\"special\":{\"dbtable\":\"#__users\",\"key\":\"id\",\"type\":\"UserTable\",\"prefix\":\"Joomla\\\\Component\\\\Users\\\\Administrator\\\\Table\\\\\",\"config\":\"array()\"},\"common\":{\"dbtable\":\"#__ucm_content\",\"key\":\"ucm_id\",\"type\":\"Corecontent\",\"prefix\":\"Joomla\\\\CMS\\\\Table\\\\\",\"config\":\"array()\"}}","","{\"common\":{\"core_content_item_id\":\"id\",\"core_title\":\"name\",\"core_state\":\"null\",\"core_alias\":\"username\",\"core_created_time\":\"registerDate\",\"core_modified_time\":\"null\",\"core_body\":\"null\", \"core_hits\":\"null\",\"core_publish_up\":\"null\",\"core_publish_down\":\"null\",\"access\":\"null\", \"core_params\":\"params\", \"core_featured\":\"null\", \"core_metadata\":\"null\", \"core_language\":\"null\", \"core_images\":\"null\", \"core_urls\":\"null\", \"core_version\":\"null\", \"core_ordering\":\"null\", \"core_metakey\":\"null\", \"core_metadesc\":\"null\", \"core_catid\":\"null\", \"core_xreference\":\"null\", \"asset_id\":\"null\"}, \"special\":{}}","",""),
("5","Article Category","com_content.category","{\"special\":{\"dbtable\":\"#__categories\",\"key\":\"id\",\"type\":\"Category\",\"prefix\":\"Joomla\\\\CMS\\\\Table\\\\\",\"config\":\"array()\"},\"common\":{\"dbtable\":\"#__ucm_content\",\"key\":\"ucm_id\",\"type\":\"Corecontent\",\"prefix\":\"Joomla\\\\CMS\\\\Table\\\\\",\"config\":\"array()\"}}","","{\"common\":{\"core_content_item_id\":\"id\",\"core_title\":\"title\",\"core_state\":\"published\",\"core_alias\":\"alias\",\"core_created_time\":\"created_time\",\"core_modified_time\":\"modified_time\",\"core_body\":\"description\", \"core_hits\":\"hits\",\"core_publish_up\":\"null\",\"core_publish_down\":\"null\",\"core_access\":\"access\", \"core_params\":\"params\", \"core_featured\":\"null\", \"core_metadata\":\"metadata\", \"core_language\":\"language\", \"core_images\":\"null\", \"core_urls\":\"null\", \"core_version\":\"version\", \"core_ordering\":\"null\", \"core_metakey\":\"metakey\", \"core_metadesc\":\"metadesc\", \"core_catid\":\"parent_id\", \"core_xreference\":\"null\", \"asset_id\":\"asset_id\"}, \"special\":{\"parent_id\":\"parent_id\",\"lft\":\"lft\",\"rgt\":\"rgt\",\"level\":\"level\",\"path\":\"path\",\"extension\":\"extension\",\"note\":\"note\"}}","ContentHelperRoute::getCategoryRoute","{\"formFile\":\"administrator\\/components\\/com_categories\\/models\\/forms\\/category.xml\", \"hideFields\":[\"asset_id\",\"checked_out\",\"checked_out_time\",\"version\",\"lft\",\"rgt\",\"level\",\"path\",\"extension\"], \"ignoreChanges\":[\"modified_user_id\", \"modified_time\", \"checked_out\", \"checked_out_time\", \"version\", \"hits\", \"path\"],\"convertToInt\":[\"publish_up\", \"publish_down\"], \"displayLookup\":[{\"sourceColumn\":\"created_user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"},{\"sourceColumn\":\"access\",\"targetTable\":\"#__viewlevels\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"},{\"sourceColumn\":\"modified_user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"},{\"sourceColumn\":\"parent_id\",\"targetTable\":\"#__categories\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"}]}"),
("6","Contact Category","com_contact.category","{\"special\":{\"dbtable\":\"#__categories\",\"key\":\"id\",\"type\":\"Category\",\"prefix\":\"Joomla\\\\CMS\\\\Table\\\\\",\"config\":\"array()\"},\"common\":{\"dbtable\":\"#__ucm_content\",\"key\":\"ucm_id\",\"type\":\"Corecontent\",\"prefix\":\"Joomla\\\\CMS\\\\Table\\\\\",\"config\":\"array()\"}}","","{\"common\":{\"core_content_item_id\":\"id\",\"core_title\":\"title\",\"core_state\":\"published\",\"core_alias\":\"alias\",\"core_created_time\":\"created_time\",\"core_modified_time\":\"modified_time\",\"core_body\":\"description\", \"core_hits\":\"hits\",\"core_publish_up\":\"null\",\"core_publish_down\":\"null\",\"core_access\":\"access\", \"core_params\":\"params\", \"core_featured\":\"null\", \"core_metadata\":\"metadata\", \"core_language\":\"language\", \"core_images\":\"null\", \"core_urls\":\"null\", \"core_version\":\"version\", \"core_ordering\":\"null\", \"core_metakey\":\"metakey\", \"core_metadesc\":\"metadesc\", \"core_catid\":\"parent_id\", \"core_xreference\":\"null\", \"asset_id\":\"asset_id\"}, \"special\":{\"parent_id\":\"parent_id\",\"lft\":\"lft\",\"rgt\":\"rgt\",\"level\":\"level\",\"path\":\"path\",\"extension\":\"extension\",\"note\":\"note\"}}","ContactHelperRoute::getCategoryRoute","{\"formFile\":\"administrator\\/components\\/com_categories\\/models\\/forms\\/category.xml\", \"hideFields\":[\"asset_id\",\"checked_out\",\"checked_out_time\",\"version\",\"lft\",\"rgt\",\"level\",\"path\",\"extension\"], \"ignoreChanges\":[\"modified_user_id\", \"modified_time\", \"checked_out\", \"checked_out_time\", \"version\", \"hits\", \"path\"],\"convertToInt\":[\"publish_up\", \"publish_down\"], \"displayLookup\":[{\"sourceColumn\":\"created_user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"},{\"sourceColumn\":\"access\",\"targetTable\":\"#__viewlevels\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"},{\"sourceColumn\":\"modified_user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"},{\"sourceColumn\":\"parent_id\",\"targetTable\":\"#__categories\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"}]}"),
("7","Newsfeeds Category","com_newsfeeds.category","{\"special\":{\"dbtable\":\"#__categories\",\"key\":\"id\",\"type\":\"Category\",\"prefix\":\"Joomla\\\\CMS\\\\Table\\\\\",\"config\":\"array()\"},\"common\":{\"dbtable\":\"#__ucm_content\",\"key\":\"ucm_id\",\"type\":\"Corecontent\",\"prefix\":\"Joomla\\\\CMS\\\\Table\\\\\",\"config\":\"array()\"}}","","{\"common\":{\"core_content_item_id\":\"id\",\"core_title\":\"title\",\"core_state\":\"published\",\"core_alias\":\"alias\",\"core_created_time\":\"created_time\",\"core_modified_time\":\"modified_time\",\"core_body\":\"description\", \"core_hits\":\"hits\",\"core_publish_up\":\"null\",\"core_publish_down\":\"null\",\"core_access\":\"access\", \"core_params\":\"params\", \"core_featured\":\"null\", \"core_metadata\":\"metadata\", \"core_language\":\"language\", \"core_images\":\"null\", \"core_urls\":\"null\", \"core_version\":\"version\", \"core_ordering\":\"null\", \"core_metakey\":\"metakey\", \"core_metadesc\":\"metadesc\", \"core_catid\":\"parent_id\", \"core_xreference\":\"null\", \"asset_id\":\"asset_id\"}, \"special\":{\"parent_id\":\"parent_id\",\"lft\":\"lft\",\"rgt\":\"rgt\",\"level\":\"level\",\"path\":\"path\",\"extension\":\"extension\",\"note\":\"note\"}}","NewsfeedsHelperRoute::getCategoryRoute","{\"formFile\":\"administrator\\/components\\/com_categories\\/models\\/forms\\/category.xml\", \"hideFields\":[\"asset_id\",\"checked_out\",\"checked_out_time\",\"version\",\"lft\",\"rgt\",\"level\",\"path\",\"extension\"], \"ignoreChanges\":[\"modified_user_id\", \"modified_time\", \"checked_out\", \"checked_out_time\", \"version\", \"hits\", \"path\"],\"convertToInt\":[\"publish_up\", \"publish_down\"], \"displayLookup\":[{\"sourceColumn\":\"created_user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"},{\"sourceColumn\":\"access\",\"targetTable\":\"#__viewlevels\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"},{\"sourceColumn\":\"modified_user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"},{\"sourceColumn\":\"parent_id\",\"targetTable\":\"#__categories\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"}]}"),
("8","Tag","com_tags.tag","{\"special\":{\"dbtable\":\"#__tags\",\"key\":\"tag_id\",\"type\":\"TagTable\",\"prefix\":\"Joomla\\\\Component\\\\Tags\\\\Administrator\\\\Table\\\\\",\"config\":\"array()\"},\"common\":{\"dbtable\":\"#__ucm_content\",\"key\":\"ucm_id\",\"type\":\"Corecontent\",\"prefix\":\"Joomla\\\\CMS\\\\Table\\\\\",\"config\":\"array()\"}}","","{\"common\":{\"core_content_item_id\":\"id\",\"core_title\":\"title\",\"core_state\":\"published\",\"core_alias\":\"alias\",\"core_created_time\":\"created_time\",\"core_modified_time\":\"modified_time\",\"core_body\":\"description\", \"core_hits\":\"hits\",\"core_publish_up\":\"null\",\"core_publish_down\":\"null\",\"core_access\":\"access\", \"core_params\":\"params\", \"core_featured\":\"featured\", \"core_metadata\":\"metadata\", \"core_language\":\"language\", \"core_images\":\"images\", \"core_urls\":\"urls\", \"core_version\":\"version\", \"core_ordering\":\"null\", \"core_metakey\":\"metakey\", \"core_metadesc\":\"metadesc\", \"core_catid\":\"null\", \"core_xreference\":\"null\", \"asset_id\":\"null\"}, \"special\":{\"parent_id\":\"parent_id\",\"lft\":\"lft\",\"rgt\":\"rgt\",\"level\":\"level\",\"path\":\"path\"}}","TagsHelperRoute::getTagRoute","{\"formFile\":\"administrator\\/components\\/com_tags\\/models\\/forms\\/tag.xml\", \"hideFields\":[\"checked_out\",\"checked_out_time\",\"version\", \"lft\", \"rgt\", \"level\", \"path\", \"urls\", \"publish_up\", \"publish_down\"],\"ignoreChanges\":[\"modified_user_id\", \"modified_time\", \"checked_out\", \"checked_out_time\", \"version\", \"hits\", \"path\"],\"convertToInt\":[\"publish_up\", \"publish_down\"], \"displayLookup\":[{\"sourceColumn\":\"created_user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"}, {\"sourceColumn\":\"access\",\"targetTable\":\"#__viewlevels\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"}, {\"sourceColumn\":\"modified_user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"}]}"),
("9","Banner","com_banners.banner","{\"special\":{\"dbtable\":\"#__banners\",\"key\":\"id\",\"type\":\"BannerTable\",\"prefix\":\"Joomla\\\\Component\\\\Banners\\\\Administrator\\\\Table\\\\\",\"config\":\"array()\"},\"common\":{\"dbtable\":\"#__ucm_content\",\"key\":\"ucm_id\",\"type\":\"Corecontent\",\"prefix\":\"Joomla\\\\CMS\\\\Table\\\\\",\"config\":\"array()\"}}","","{\"common\":{\"core_content_item_id\":\"id\",\"core_title\":\"name\",\"core_state\":\"published\",\"core_alias\":\"alias\",\"core_created_time\":\"created\",\"core_modified_time\":\"modified\",\"core_body\":\"description\", \"core_hits\":\"null\",\"core_publish_up\":\"publish_up\",\"core_publish_down\":\"publish_down\",\"core_access\":\"access\", \"core_params\":\"params\", \"core_featured\":\"null\", \"core_metadata\":\"metadata\", \"core_language\":\"language\", \"core_images\":\"images\", \"core_urls\":\"link\", \"core_version\":\"version\", \"core_ordering\":\"ordering\", \"core_metakey\":\"metakey\", \"core_metadesc\":\"metadesc\", \"core_catid\":\"catid\", \"core_xreference\":\"null\", \"asset_id\":\"null\"}, \"special\":{\"imptotal\":\"imptotal\", \"impmade\":\"impmade\", \"clicks\":\"clicks\", \"clickurl\":\"clickurl\", \"custombannercode\":\"custombannercode\", \"cid\":\"cid\", \"purchase_type\":\"purchase_type\", \"track_impressions\":\"track_impressions\", \"track_clicks\":\"track_clicks\"}}","","{\"formFile\":\"administrator\\/components\\/com_banners\\/models\\/forms\\/banner.xml\", \"hideFields\":[\"checked_out\",\"checked_out_time\",\"version\", \"reset\"],\"ignoreChanges\":[\"modified_by\", \"modified\", \"checked_out\", \"checked_out_time\", \"version\", \"imptotal\", \"impmade\", \"reset\"], \"convertToInt\":[\"publish_up\", \"publish_down\", \"ordering\"], \"displayLookup\":[{\"sourceColumn\":\"catid\",\"targetTable\":\"#__categories\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"}, {\"sourceColumn\":\"cid\",\"targetTable\":\"#__banner_clients\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"}, {\"sourceColumn\":\"created_by\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"},{\"sourceColumn\":\"modified_by\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"} ]}"),
("10","Banners Category","com_banners.category","{\"special\":{\"dbtable\":\"#__categories\",\"key\":\"id\",\"type\":\"Category\",\"prefix\":\"Joomla\\\\CMS\\\\Table\\\\\",\"config\":\"array()\"},\"common\":{\"dbtable\":\"#__ucm_content\",\"key\":\"ucm_id\",\"type\":\"Corecontent\",\"prefix\":\"Joomla\\\\CMS\\\\Table\\\\\",\"config\":\"array()\"}}","","{\"common\":{\"core_content_item_id\":\"id\",\"core_title\":\"title\",\"core_state\":\"published\",\"core_alias\":\"alias\",\"core_created_time\":\"created_time\",\"core_modified_time\":\"modified_time\",\"core_body\":\"description\", \"core_hits\":\"hits\",\"core_publish_up\":\"null\",\"core_publish_down\":\"null\",\"core_access\":\"access\", \"core_params\":\"params\", \"core_featured\":\"null\", \"core_metadata\":\"metadata\", \"core_language\":\"language\", \"core_images\":\"null\", \"core_urls\":\"null\", \"core_version\":\"version\", \"core_ordering\":\"null\", \"core_metakey\":\"metakey\", \"core_metadesc\":\"metadesc\", \"core_catid\":\"parent_id\", \"core_xreference\":\"null\", \"asset_id\":\"asset_id\"}, \"special\": {\"parent_id\":\"parent_id\",\"lft\":\"lft\",\"rgt\":\"rgt\",\"level\":\"level\",\"path\":\"path\",\"extension\":\"extension\",\"note\":\"note\"}}","","{\"formFile\":\"administrator\\/components\\/com_categories\\/models\\/forms\\/category.xml\", \"hideFields\":[\"asset_id\",\"checked_out\",\"checked_out_time\",\"version\",\"lft\",\"rgt\",\"level\",\"path\",\"extension\"], \"ignoreChanges\":[\"modified_user_id\", \"modified_time\", \"checked_out\", \"checked_out_time\", \"version\", \"hits\", \"path\"], \"convertToInt\":[\"publish_up\", \"publish_down\"], \"displayLookup\":[{\"sourceColumn\":\"created_user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"},{\"sourceColumn\":\"access\",\"targetTable\":\"#__viewlevels\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"},{\"sourceColumn\":\"modified_user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"},{\"sourceColumn\":\"parent_id\",\"targetTable\":\"#__categories\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"}]}"),
("11","Banner Client","com_banners.client","{\"special\":{\"dbtable\":\"#__banner_clients\",\"key\":\"id\",\"type\":\"ClientTable\",\"prefix\":\"Joomla\\\\Component\\\\Banners\\\\Administrator\\\\Table\\\\\"}}","","","","{\"formFile\":\"administrator\\/components\\/com_banners\\/models\\/forms\\/client.xml\", \"hideFields\":[\"checked_out\",\"checked_out_time\"], \"ignoreChanges\":[\"checked_out\", \"checked_out_time\"], \"convertToInt\":[], \"displayLookup\":[]}"),
("12","User Notes","com_users.note","{\"special\":{\"dbtable\":\"#__user_notes\",\"key\":\"id\",\"type\":\"NoteTable\",\"prefix\":\"Joomla\\\\Component\\\\Users\\\\Administrator\\\\Table\\\\\"}}","","","","{\"formFile\":\"administrator\\/components\\/com_users\\/models\\/forms\\/note.xml\", \"hideFields\":[\"checked_out\",\"checked_out_time\", \"publish_up\", \"publish_down\"],\"ignoreChanges\":[\"modified_user_id\", \"modified_time\", \"checked_out\", \"checked_out_time\"], \"convertToInt\":[\"publish_up\", \"publish_down\"],\"displayLookup\":[{\"sourceColumn\":\"catid\",\"targetTable\":\"#__categories\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"}, {\"sourceColumn\":\"created_user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"}, {\"sourceColumn\":\"user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"}, {\"sourceColumn\":\"modified_user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"}]}"),
("13","User Notes Category","com_users.category","{\"special\":{\"dbtable\":\"#__categories\",\"key\":\"id\",\"type\":\"Category\",\"prefix\":\"Joomla\\\\CMS\\\\Table\\\\\",\"config\":\"array()\"},\"common\":{\"dbtable\":\"#__ucm_content\",\"key\":\"ucm_id\",\"type\":\"Corecontent\",\"prefix\":\"Joomla\\\\CMS\\\\Table\\\\\",\"config\":\"array()\"}}","","{\"common\":{\"core_content_item_id\":\"id\",\"core_title\":\"title\",\"core_state\":\"published\",\"core_alias\":\"alias\",\"core_created_time\":\"created_time\",\"core_modified_time\":\"modified_time\",\"core_body\":\"description\", \"core_hits\":\"hits\",\"core_publish_up\":\"null\",\"core_publish_down\":\"null\",\"core_access\":\"access\", \"core_params\":\"params\", \"core_featured\":\"null\", \"core_metadata\":\"metadata\", \"core_language\":\"language\", \"core_images\":\"null\", \"core_urls\":\"null\", \"core_version\":\"version\", \"core_ordering\":\"null\", \"core_metakey\":\"metakey\", \"core_metadesc\":\"metadesc\", \"core_catid\":\"parent_id\", \"core_xreference\":\"null\", \"asset_id\":\"asset_id\"}, \"special\":{\"parent_id\":\"parent_id\",\"lft\":\"lft\",\"rgt\":\"rgt\",\"level\":\"level\",\"path\":\"path\",\"extension\":\"extension\",\"note\":\"note\"}}","","{\"formFile\":\"administrator\\/components\\/com_categories\\/models\\/forms\\/category.xml\", \"hideFields\":[\"checked_out\",\"checked_out_time\",\"version\",\"lft\",\"rgt\",\"level\",\"path\",\"extension\"], \"ignoreChanges\":[\"modified_user_id\", \"modified_time\", \"checked_out\", \"checked_out_time\", \"version\", \"hits\", \"path\"], \"convertToInt\":[\"publish_up\", \"publish_down\"], \"displayLookup\":[{\"sourceColumn\":\"created_user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"}, {\"sourceColumn\":\"access\",\"targetTable\":\"#__viewlevels\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"},{\"sourceColumn\":\"modified_user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"},{\"sourceColumn\":\"parent_id\",\"targetTable\":\"#__categories\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"}]}");




CREATE TABLE `j4x_contentitem_tag_map` (
  `type_alias` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `core_content_id` int unsigned NOT NULL COMMENT 'PK from the core content table',
  `content_item_id` int NOT NULL COMMENT 'PK from the content type table',
  `tag_id` int unsigned NOT NULL COMMENT 'PK from the tag table',
  `tag_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Date of most recent save for this tag-item',
  `type_id` mediumint NOT NULL COMMENT 'PK from the content_type table',
  UNIQUE KEY `uc_ItemnameTagid` (`type_id`,`content_item_id`,`tag_id`),
  KEY `idx_tag_type` (`tag_id`,`type_id`),
  KEY `idx_date_id` (`tag_date`,`tag_id`),
  KEY `idx_core_content_id` (`core_content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Maps items from content tables to tags';






CREATE TABLE `j4x_core_log_searches` (
  `search_term` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `hits` int unsigned NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;






CREATE TABLE `j4x_extensions` (
  `extension_id` int NOT NULL AUTO_INCREMENT,
  `package_id` int NOT NULL DEFAULT '0' COMMENT 'Parent package ID for extensions installed as a package.',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `element` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `changelogurl` text COLLATE utf8mb4_unicode_ci,
  `folder` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `client_id` tinyint NOT NULL,
  `enabled` tinyint NOT NULL DEFAULT '0',
  `access` int unsigned NOT NULL DEFAULT '1',
  `protected` tinyint NOT NULL DEFAULT '0' COMMENT 'Flag to indicate if the extension is protected. Protected extensions cannot be disabled.',
  `manifest_cache` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `params` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `custom_data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `checked_out` int unsigned DEFAULT NULL,
  `checked_out_time` datetime DEFAULT NULL,
  `ordering` int DEFAULT '0',
  `state` int DEFAULT '0',
  `note` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `locked` tinyint NOT NULL DEFAULT '0' COMMENT 'Flag to indicate if the extension is locked. Locked extensions cannot be uninstalled.',
  PRIMARY KEY (`extension_id`),
  KEY `element_clientid` (`element`,`client_id`),
  KEY `element_folder_clientid` (`element`,`folder`,`client_id`),
  KEY `extension` (`type`,`element`,`folder`,`client_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10069 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


INSERT INTO j4x_extensions VALUES
("2","0","com_wrapper","component","com_wrapper","","","1","1","1","0","{\"name\":\"com_wrapper\",\"type\":\"component\",\"creationDate\":\"2006-04\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2007 Open Source Matters, Inc.\\n\\t\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"COM_WRAPPER_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"wrapper\"}","","","","","0","0","","1"),
("3","0","com_admin","component","com_admin","","","1","1","1","1","{\"name\":\"com_admin\",\"type\":\"component\",\"creationDate\":\"2006-04\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"COM_ADMIN_XML_DESCRIPTION\",\"group\":\"\"}","","","","","0","0","","1"),
("4","0","com_banners","component","com_banners","","","1","1","1","0","{\"name\":\"com_banners\",\"type\":\"component\",\"creationDate\":\"2006-04\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"COM_BANNERS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"banners\"}","{\"purchase_type\":\"3\",\"track_impressions\":\"0\",\"track_clicks\":\"0\",\"metakey_prefix\":\"\",\"save_history\":\"1\",\"history_limit\":10}","","","","0","0","","1"),
("5","0","com_cache","component","com_cache","","","1","1","1","1","{\"name\":\"com_cache\",\"type\":\"component\",\"creationDate\":\"2006-04\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"COM_CACHE_XML_DESCRIPTION\",\"group\":\"\"}","","","","","0","0","","1"),
("6","0","com_categories","component","com_categories","","","1","1","1","1","{\"name\":\"com_categories\",\"type\":\"component\",\"creationDate\":\"2007-12\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2007 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"COM_CATEGORIES_XML_DESCRIPTION\",\"group\":\"\"}","","","","","0","0","","1"),
("7","0","com_checkin","component","com_checkin","","","1","1","1","1","{\"name\":\"com_checkin\",\"type\":\"component\",\"creationDate\":\"2006-04\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"COM_CHECKIN_XML_DESCRIPTION\",\"group\":\"\"}","","","","","0","0","","1"),
("8","0","com_contact","component","com_contact","","","1","1","1","0","{\"name\":\"com_contact\",\"type\":\"component\",\"creationDate\":\"2006-04\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"COM_CONTACT_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"contact\"}","{\"contact_layout\":\"_:default\",\"show_contact_category\":\"hide\",\"save_history\":\"1\",\"history_limit\":10,\"show_contact_list\":\"0\",\"presentation_style\":\"sliders\",\"show_tags\":\"1\",\"show_info\":\"1\",\"show_name\":\"1\",\"show_position\":\"1\",\"show_email\":\"0\",\"show_street_address\":\"1\",\"show_suburb\":\"1\",\"show_state\":\"1\",\"show_postcode\":\"1\",\"show_country\":\"1\",\"show_telephone\":\"1\",\"show_mobile\":\"1\",\"show_fax\":\"1\",\"show_webpage\":\"1\",\"show_image\":\"1\",\"show_misc\":\"1\",\"image\":\"\",\"allow_vcard\":\"0\",\"show_articles\":\"0\",\"articles_display_num\":\"10\",\"show_profile\":\"0\",\"show_user_custom_fields\":[\"-1\"],\"show_links\":\"0\",\"linka_name\":\"\",\"linkb_name\":\"\",\"linkc_name\":\"\",\"linkd_name\":\"\",\"linke_name\":\"\",\"contact_icons\":\"0\",\"icon_address\":\"\",\"icon_email\":\"\",\"icon_telephone\":\"\",\"icon_mobile\":\"\",\"icon_fax\":\"\",\"icon_misc\":\"\",\"category_layout\":\"_:default\",\"show_category_title\":\"1\",\"show_description\":\"1\",\"show_description_image\":\"0\",\"maxLevel\":\"-1\",\"show_subcat_desc\":\"1\",\"show_empty_categories\":\"0\",\"show_cat_items\":\"1\",\"show_cat_tags\":\"1\",\"show_base_description\":\"1\",\"maxLevelcat\":\"-1\",\"show_subcat_desc_cat\":\"1\",\"show_empty_categories_cat\":\"0\",\"show_cat_items_cat\":\"1\",\"filter_field\":\"0\",\"show_pagination_limit\":\"0\",\"show_headings\":\"1\",\"show_image_heading\":\"0\",\"show_position_headings\":\"1\",\"show_email_headings\":\"0\",\"show_telephone_headings\":\"1\",\"show_mobile_headings\":\"0\",\"show_fax_headings\":\"0\",\"show_suburb_headings\":\"1\",\"show_state_headings\":\"1\",\"show_country_headings\":\"1\",\"show_pagination\":\"2\",\"show_pagination_results\":\"1\",\"initial_sort\":\"ordering\",\"captcha\":\"\",\"show_email_form\":\"1\",\"show_email_copy\":\"0\",\"banned_email\":\"\",\"banned_subject\":\"\",\"banned_text\":\"\",\"validate_session\":\"1\",\"custom_reply\":\"0\",\"redirect\":\"\",\"show_feed_link\":\"1\",\"sef_advanced\":0,\"sef_ids\":0,\"custom_fields_enable\":\"1\"}","","","","0","0","","1"),
("9","0","com_cpanel","component","com_cpanel","","","1","1","1","1","{\"name\":\"com_cpanel\",\"type\":\"component\",\"creationDate\":\"2007-06\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2007 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"COM_CPANEL_XML_DESCRIPTION\",\"group\":\"\"}","","","","","0","0","","1"),
("10","0","com_installer","component","com_installer","","","1","1","1","1","{\"name\":\"com_installer\",\"type\":\"component\",\"creationDate\":\"2006-04\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"COM_INSTALLER_XML_DESCRIPTION\",\"group\":\"\"}","{\"show_jed_info\":\"1\",\"cachetimeout\":\"6\",\"minimum_stability\":\"4\"}","","","","0","0","","1"),
("11","0","com_languages","component","com_languages","","","1","1","1","1","{\"name\":\"com_languages\",\"type\":\"component\",\"creationDate\":\"2006-04\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"COM_LANGUAGES_XML_DESCRIPTION\",\"group\":\"\"}","{\"administrator\":\"en-GB\",\"site\":\"en-GB\"}","","","","0","0","","1"),
("12","0","com_login","component","com_login","","","1","1","1","1","{\"name\":\"com_login\",\"type\":\"component\",\"creationDate\":\"2006-04\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"COM_LOGIN_XML_DESCRIPTION\",\"group\":\"\"}","","","","","0","0","","1"),
("13","0","com_media","component","com_media","","","1","1","0","1","{\"name\":\"com_media\",\"type\":\"component\",\"creationDate\":\"2006-04\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_MEDIA_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"media\"}","{\"upload_extensions\":\"bmp,csv,doc,gif,ico,jpg,jpeg,odg,odp,ods,odt,pdf,png,ppt,txt,xcf,xls,BMP,CSV,DOC,GIF,ICO,JPG,JPEG,ODG,ODP,ODS,ODT,PDF,PNG,PPT,TXT,XCF,XLS\",\"upload_maxsize\":\"10\",\"file_path\":\"images\",\"image_path\":\"images\",\"restrict_uploads\":\"1\",\"allowed_media_usergroup\":\"3\",\"check_mime\":\"1\",\"image_extensions\":\"bmp,gif,jpg,png\",\"ignore_extensions\":\"\",\"upload_mime\":\"image\\/jpeg,image\\/gif,image\\/png,image\\/bmp,application\\/msword,application\\/excel,application\\/pdf,application\\/powerpoint,text\\/plain,application\\/x-zip\",\"upload_mime_illegal\":\"text\\/html\"}","","","","0","0","","1"),
("14","0","com_menus","component","com_menus","","","1","1","1","1","{\"name\":\"com_menus\",\"type\":\"component\",\"creationDate\":\"2006-04\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"COM_MENUS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"menus\"}","{\"page_title\":\"\",\"show_page_heading\":0,\"page_heading\":\"\",\"pageclass_sfx\":\"\"}","","","","0","0","","1"),
("15","0","com_messages","component","com_messages","","","1","1","1","1","{\"name\":\"com_messages\",\"type\":\"component\",\"creationDate\":\"2006-04\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"COM_MESSAGES_XML_DESCRIPTION\",\"group\":\"\"}","","","","","0","0","","1"),
("16","0","com_modules","component","com_modules","","","1","1","1","1","{\"name\":\"com_modules\",\"type\":\"component\",\"creationDate\":\"2006-04\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"COM_MODULES_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"modules\"}","","","","","0","0","","1"),
("17","0","com_newsfeeds","component","com_newsfeeds","","","1","1","1","0","{\"name\":\"com_newsfeeds\",\"type\":\"component\",\"creationDate\":\"2006-04\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"COM_NEWSFEEDS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"newsfeeds\"}","{\"newsfeed_layout\":\"_:default\",\"save_history\":\"1\",\"history_limit\":5,\"show_feed_image\":\"1\",\"show_feed_description\":\"1\",\"show_item_description\":\"1\",\"feed_character_count\":\"0\",\"feed_display_order\":\"des\",\"float_first\":\"right\",\"float_second\":\"right\",\"show_tags\":\"1\",\"category_layout\":\"_:default\",\"show_category_title\":\"1\",\"show_description\":\"1\",\"show_description_image\":\"1\",\"maxLevel\":\"-1\",\"show_empty_categories\":\"0\",\"show_subcat_desc\":\"1\",\"show_cat_items\":\"1\",\"show_cat_tags\":\"1\",\"show_base_description\":\"1\",\"maxLevelcat\":\"-1\",\"show_empty_categories_cat\":\"0\",\"show_subcat_desc_cat\":\"1\",\"show_cat_items_cat\":\"1\",\"filter_field\":\"1\",\"show_pagination_limit\":\"1\",\"show_headings\":\"1\",\"show_articles\":\"0\",\"show_link\":\"1\",\"show_pagination\":\"1\",\"show_pagination_results\":\"1\"}","","","","0","0","","1"),
("18","0","com_plugins","component","com_plugins","","","1","1","1","1","{\"name\":\"com_plugins\",\"type\":\"component\",\"creationDate\":\"2006-04\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"COM_PLUGINS_XML_DESCRIPTION\",\"group\":\"\"}","","","","","0","0","","1"),
("19","10053","com_search","component","com_search","","","1","1","1","0","{\"name\":\"com_search\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_SEARCH_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"search\"}","{\"enabled\":\"0\",\"search_phrases\":\"1\",\"search_areas\":\"1\",\"show_date\":\"1\",\"opensearch_name\":\"\",\"opensearch_description\":\"\"}","","","","0","0","","0"),
("20","0","com_templates","component","com_templates","","","1","1","1","1","{\"name\":\"com_templates\",\"type\":\"component\",\"creationDate\":\"2006-04\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"COM_TEMPLATES_XML_DESCRIPTION\",\"group\":\"\"}","{\"template_positions_display\":\"0\",\"upload_limit\":\"10\",\"image_formats\":\"gif,bmp,jpg,jpeg,png\",\"source_formats\":\"txt,less,ini,xml,js,php,css,scss,sass\",\"font_formats\":\"woff,ttf,otf\",\"compressed_formats\":\"zip\"}","","","","0","0","","1"),
("22","0","com_content","component","com_content","","","1","1","0","1","{\"name\":\"com_content\",\"type\":\"component\",\"creationDate\":\"2006-04\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"COM_CONTENT_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"content\"}","{\"article_layout\":\"_:default\",\"show_title\":\"1\",\"link_titles\":\"1\",\"show_intro\":\"1\",\"show_category\":\"1\",\"link_category\":\"1\",\"show_parent_category\":\"0\",\"link_parent_category\":\"0\",\"show_author\":\"1\",\"link_author\":\"0\",\"show_create_date\":\"0\",\"show_modify_date\":\"0\",\"show_publish_date\":\"1\",\"show_item_navigation\":\"1\",\"show_vote\":\"0\",\"show_readmore\":\"1\",\"show_readmore_title\":\"1\",\"readmore_limit\":\"100\",\"show_icons\":\"1\",\"show_print_icon\":\"1\",\"show_email_icon\":\"0\",\"show_hits\":\"1\",\"show_noauth\":\"0\",\"show_publishing_options\":\"1\",\"show_article_options\":\"1\",\"save_history\":\"1\",\"history_limit\":10,\"show_urls_images_frontend\":\"0\",\"show_urls_images_backend\":\"1\",\"targeta\":0,\"targetb\":0,\"targetc\":0,\"float_intro\":\"left\",\"float_fulltext\":\"left\",\"category_layout\":\"_:blog\",\"show_category_title\":\"0\",\"show_description\":\"0\",\"show_description_image\":\"0\",\"maxLevel\":\"1\",\"show_empty_categories\":\"0\",\"show_no_articles\":\"1\",\"show_subcat_desc\":\"1\",\"show_cat_num_articles\":\"0\",\"show_base_description\":\"1\",\"maxLevelcat\":\"-1\",\"show_empty_categories_cat\":\"0\",\"show_subcat_desc_cat\":\"1\",\"show_cat_num_articles_cat\":\"1\",\"num_leading_articles\":\"1\",\"num_intro_articles\":\"4\",\"num_columns\":\"2\",\"num_links\":\"4\",\"multi_column_order\":\"0\",\"show_subcategory_content\":\"0\",\"show_pagination_limit\":\"1\",\"filter_field\":\"hide\",\"show_headings\":\"1\",\"list_show_date\":\"0\",\"date_format\":\"\",\"list_show_hits\":\"1\",\"list_show_author\":\"1\",\"orderby_pri\":\"order\",\"orderby_sec\":\"rdate\",\"order_date\":\"published\",\"show_pagination\":\"2\",\"show_pagination_results\":\"1\",\"show_feed_link\":\"1\",\"feed_summary\":\"0\"}","","","","0","0","","1"),
("23","0","com_config","component","com_config","","","1","1","0","1","{\"name\":\"com_config\",\"type\":\"component\",\"creationDate\":\"2006-04\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"COM_CONFIG_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"config\"}","{\"filters\":{\"1\":{\"filter_type\":\"NH\",\"filter_tags\":\"\",\"filter_attributes\":\"\"},\"9\":{\"filter_type\":\"NH\",\"filter_tags\":\"\",\"filter_attributes\":\"\"},\"6\":{\"filter_type\":\"BL\",\"filter_tags\":\"\",\"filter_attributes\":\"\"},\"7\":{\"filter_type\":\"BL\",\"filter_tags\":\"\",\"filter_attributes\":\"\"},\"2\":{\"filter_type\":\"NH\",\"filter_tags\":\"\",\"filter_attributes\":\"\"},\"3\":{\"filter_type\":\"BL\",\"filter_tags\":\"\",\"filter_attributes\":\"\"},\"4\":{\"filter_type\":\"BL\",\"filter_tags\":\"\",\"filter_attributes\":\"\"},\"5\":{\"filter_type\":\"BL\",\"filter_tags\":\"\",\"filter_attributes\":\"\"},\"8\":{\"filter_type\":\"NONE\",\"filter_tags\":\"\",\"filter_attributes\":\"\"}}}","","","","0","0","","1"),
("24","0","com_redirect","component","com_redirect","","","1","1","0","0","{\"name\":\"com_redirect\",\"type\":\"component\",\"creationDate\":\"2006-04\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"COM_REDIRECT_XML_DESCRIPTION\",\"group\":\"\"}","","","","","0","0","","1"),
("25","0","com_users","component","com_users","","","1","1","0","1","{\"name\":\"com_users\",\"type\":\"component\",\"creationDate\":\"2006-04\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"COM_USERS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"users\"}","{\"allowUserRegistration\":\"0\",\"new_usertype\":\"2\",\"guest_usergroup\":\"9\",\"sendpassword\":\"0\",\"useractivation\":\"2\",\"mail_to_admin\":\"1\",\"captcha\":\"\",\"frontend_userparams\":\"1\",\"site_language\":\"0\",\"change_login_name\":\"0\",\"reset_count\":\"10\",\"reset_time\":\"1\",\"minimum_length\":\"4\",\"minimum_integers\":\"0\",\"minimum_symbols\":\"0\",\"minimum_uppercase\":\"0\",\"save_history\":\"1\",\"history_limit\":5,\"mailSubjectPrefix\":\"\",\"mailBodySuffix\":\"\"}","","","","0","0","","1"),
("27","0","com_finder","component","com_finder","","","1","1","0","0","{\"name\":\"com_finder\",\"type\":\"component\",\"creationDate\":\"2011-08\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2011 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"COM_FINDER_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"finder\"}","{\"enabled\":\"0\",\"show_description\":\"1\",\"description_length\":255,\"allow_empty_query\":\"0\",\"show_url\":\"1\",\"show_autosuggest\":\"1\",\"show_suggested_query\":\"1\",\"show_explained_query\":\"1\",\"show_advanced\":\"1\",\"show_advanced_tips\":\"1\",\"expand_advanced\":\"0\",\"show_date_filters\":\"0\",\"sort_order\":\"relevance\",\"sort_direction\":\"desc\",\"highlight_terms\":\"1\",\"opensearch_name\":\"\",\"opensearch_description\":\"\",\"batch_size\":\"50\",\"memory_table_limit\":30000,\"title_multiplier\":\"1.7\",\"text_multiplier\":\"0.7\",\"meta_multiplier\":\"1.2\",\"path_multiplier\":\"2.0\",\"misc_multiplier\":\"0.3\",\"stem\":\"1\",\"stemmer\":\"snowball\",\"enable_logging\":\"0\"}","","","","0","0","","1"),
("28","0","com_joomlaupdate","component","com_joomlaupdate","","","1","1","0","1","{\"name\":\"com_joomlaupdate\",\"type\":\"component\",\"creationDate\":\"2021-08\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2012 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.3\",\"description\":\"COM_JOOMLAUPDATE_XML_DESCRIPTION\",\"group\":\"\"}","{\"updatesource\":\"next\",\"minimum_stability\":\"4\",\"customurl\":\"\"}","","","","0","0","","1"),
("29","0","com_tags","component","com_tags","","","1","1","1","0","{\"name\":\"com_tags\",\"type\":\"component\",\"creationDate\":\"2013-12\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2013 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"COM_TAGS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"tags\"}","{\"tag_layout\":\"_:default\",\"save_history\":\"1\",\"history_limit\":5,\"show_tag_title\":\"0\",\"tag_list_show_tag_image\":\"0\",\"tag_list_show_tag_description\":\"0\",\"tag_list_image\":\"\",\"tag_list_orderby\":\"title\",\"tag_list_orderby_direction\":\"ASC\",\"show_headings\":\"0\",\"tag_list_show_date\":\"0\",\"tag_list_show_item_image\":\"0\",\"tag_list_show_item_description\":\"0\",\"tag_list_item_maximum_characters\":0,\"return_any_or_all\":\"1\",\"include_children\":\"0\",\"maximum\":200,\"tag_list_language_filter\":\"all\",\"tags_layout\":\"_:default\",\"all_tags_orderby\":\"title\",\"all_tags_orderby_direction\":\"ASC\",\"all_tags_show_tag_image\":\"0\",\"all_tags_show_tag_description\":\"0\",\"all_tags_tag_maximum_characters\":20,\"all_tags_show_tag_hits\":\"0\",\"filter_field\":\"1\",\"show_pagination_limit\":\"1\",\"show_pagination\":\"2\",\"show_pagination_results\":\"1\",\"tag_field_ajax_mode\":\"1\",\"show_feed_link\":\"1\"}","","","","0","0","","1"),
("30","0","com_contenthistory","component","com_contenthistory","","","1","1","1","0","{\"name\":\"com_contenthistory\",\"type\":\"component\",\"creationDate\":\"2013-05\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2013 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"COM_CONTENTHISTORY_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"contenthistory\"}","","","","","0","0","","1"),
("31","0","com_ajax","component","com_ajax","","","1","1","1","1","{\"name\":\"com_ajax\",\"type\":\"component\",\"creationDate\":\"2013-08\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2013 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"COM_AJAX_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"ajax\"}","","","","","0","0","","1"),
("32","0","com_postinstall","component","com_postinstall","","","1","1","1","1","{\"name\":\"com_postinstall\",\"type\":\"component\",\"creationDate\":\"2013-09\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2013 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"COM_POSTINSTALL_XML_DESCRIPTION\",\"group\":\"\"}","","","","","0","0","","1"),
("33","0","com_fields","component","com_fields","","","1","1","1","0","{\"name\":\"com_fields\",\"type\":\"component\",\"creationDate\":\"2016-03\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2016 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"COM_FIELDS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"fields\"}","","","","","0","0","","1"),
("34","0","com_associations","component","com_associations","","","1","1","1","0","{\"name\":\"com_associations\",\"type\":\"component\",\"creationDate\":\"2017-01\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2017 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"COM_ASSOCIATIONS_XML_DESCRIPTION\",\"group\":\"\"}","","","","","0","0","","1"),
("35","0","com_privacy","component","com_privacy","","","1","1","1","0","{\"name\":\"com_privacy\",\"type\":\"component\",\"creationDate\":\"2018-05\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2018 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.9.0\",\"description\":\"COM_PRIVACY_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"privacy\"}","","","","","0","0","","1"),
("36","0","com_actionlogs","component","com_actionlogs","","","1","1","1","0","{\"name\":\"com_actionlogs\",\"type\":\"component\",\"creationDate\":\"2018-05\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2018 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.9.0\",\"description\":\"COM_ACTIONLOGS_XML_DESCRIPTION\",\"group\":\"\"}","{\"ip_logging\":0,\"csv_delimiter\":\",\",\"loggable_extensions\":[\"com_banners\",\"com_cache\",\"com_categories\",\"com_checkin\",\"com_config\",\"com_contact\",\"com_content\",\"com_installer\",\"com_media\",\"com_menus\",\"com_messages\",\"com_modules\",\"com_newsfeeds\",\"com_plugins\",\"com_redirect\",\"com_tags\",\"com_templates\",\"com_users\"]}","","","","0","0","","1"),
("103","0","lib_joomla","library","joomla","","","0","1","1","1","{\"name\":\"lib_joomla\",\"type\":\"library\",\"creationDate\":\"2008-01\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2008 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"https:\\/\\/www.joomla.org\",\"version\":\"13.1\",\"description\":\"LIB_JOOMLA_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"joomla\"}","{\"mediaversion\":\"6dfe441cf99fc1ab9ce4e5c378ea9fb2\"}","","","","0","0","","1"),
("105","0","FOF","library","fof","","","0","1","1","0","{\"name\":\"FOF\",\"type\":\"library\",\"creationDate\":\"2015-04-22 13:15:32\",\"author\":\"Nicholas K. Dionysopoulos \\/ Akeeba Ltd\",\"copyright\":\"(C)2011-2015 Nicholas K. Dionysopoulos\",\"authorEmail\":\"nicholas@akeebabackup.com\",\"authorUrl\":\"https:\\/\\/www.akeebabackup.com\",\"version\":\"2.4.3\",\"description\":\"LIB_FOF_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"fof\"}","","","","","0","0","","0"),
("106","0","lib_phpass","library","phpass","","","0","1","1","1","{\"name\":\"lib_phpass\",\"type\":\"library\",\"creationDate\":\"2004-01\",\"author\":\"Solar Designer\",\"copyright\":\"\",\"authorEmail\":\"solar@openwall.com\",\"authorUrl\":\"https:\\/\\/www.openwall.com\\/phpass\\/\",\"version\":\"0.3\",\"description\":\"LIB_PHPASS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"phpass\"}","","","","","0","0","","1"),
("200","0","mod_articles_archive","module","mod_articles_archive","","","0","1","1","0","{\"name\":\"mod_articles_archive\",\"type\":\"module\",\"creationDate\":\"2006-07\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_ARTICLES_ARCHIVE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_articles_archive\"}","","","","","0","0","","1"),
("201","0","mod_articles_latest","module","mod_articles_latest","","","0","1","1","0","{\"name\":\"mod_articles_latest\",\"type\":\"module\",\"creationDate\":\"2004-07\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_LATEST_NEWS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_articles_latest\"}","","","","","0","0","","1"),
("202","0","mod_articles_popular","module","mod_articles_popular","","","0","1","1","0","{\"name\":\"mod_articles_popular\",\"type\":\"module\",\"creationDate\":\"2006-07\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_POPULAR_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_articles_popular\"}","","","","","0","0","","1"),
("203","0","mod_banners","module","mod_banners","","","0","1","1","0","{\"name\":\"mod_banners\",\"type\":\"module\",\"creationDate\":\"2006-07\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_BANNERS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_banners\"}","","","","","0","0","","1"),
("204","0","mod_breadcrumbs","module","mod_breadcrumbs","","","0","1","1","0","{\"name\":\"mod_breadcrumbs\",\"type\":\"module\",\"creationDate\":\"2006-07\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_BREADCRUMBS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_breadcrumbs\"}","","","","","0","0","","1"),
("205","0","mod_custom","module","mod_custom","","","0","1","1","0","{\"name\":\"mod_custom\",\"type\":\"module\",\"creationDate\":\"2004-07\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_CUSTOM_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_custom\"}","","","","","0","0","","1"),
("206","0","mod_feed","module","mod_feed","","","0","1","1","0","{\"name\":\"mod_feed\",\"type\":\"module\",\"creationDate\":\"2005-07\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_FEED_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_feed\"}","","","","","0","0","","1"),
("207","0","mod_footer","module","mod_footer","","","0","1","1","0","{\"name\":\"mod_footer\",\"type\":\"module\",\"creationDate\":\"2006-07\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_FOOTER_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_footer\"}","","","","","0","0","","1"),
("208","0","mod_login","module","mod_login","","","0","1","1","0","{\"name\":\"mod_login\",\"type\":\"module\",\"creationDate\":\"2006-07\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_LOGIN_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_login\"}","","","","","0","0","","1"),
("209","0","mod_menu","module","mod_menu","","","0","1","1","0","{\"name\":\"mod_menu\",\"type\":\"module\",\"creationDate\":\"2004-07\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_MENU_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_menu\"}","","","","","0","0","","1"),
("210","0","mod_articles_news","module","mod_articles_news","","","0","1","1","0","{\"name\":\"mod_articles_news\",\"type\":\"module\",\"creationDate\":\"2006-07\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_ARTICLES_NEWS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_articles_news\"}","","","","","0","0","","1"),
("211","0","mod_random_image","module","mod_random_image","","","0","1","1","0","{\"name\":\"mod_random_image\",\"type\":\"module\",\"creationDate\":\"2006-07\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_RANDOM_IMAGE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_random_image\"}","","","","","0","0","","1"),
("212","0","mod_related_items","module","mod_related_items","","","0","1","1","0","{\"name\":\"mod_related_items\",\"type\":\"module\",\"creationDate\":\"2004-07\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_RELATED_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_related_items\"}","","","","","0","0","","1"),
("213","10053","mod_search","module","mod_search","","","0","1","1","0","{\"name\":\"mod_search\",\"type\":\"module\",\"creationDate\":\"July 2004\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_SEARCH_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_search\"}","","","","","0","0","","0"),
("214","0","mod_stats","module","mod_stats","","","0","1","1","0","{\"name\":\"mod_stats\",\"type\":\"module\",\"creationDate\":\"2004-07\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_STATS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_stats\"}","","","","","0","0","","1"),
("215","0","mod_syndicate","module","mod_syndicate","","","0","1","1","0","{\"name\":\"mod_syndicate\",\"type\":\"module\",\"creationDate\":\"2006-05\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_SYNDICATE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_syndicate\"}","","","","","0","0","","1"),
("216","0","mod_users_latest","module","mod_users_latest","","","0","1","1","0","{\"name\":\"mod_users_latest\",\"type\":\"module\",\"creationDate\":\"2009-12\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2009 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_USERS_LATEST_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_users_latest\"}","","","","","0","0","","1"),
("218","0","mod_whosonline","module","mod_whosonline","","","0","1","1","0","{\"name\":\"mod_whosonline\",\"type\":\"module\",\"creationDate\":\"2004-07\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_WHOSONLINE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_whosonline\"}","","","","","0","0","","1"),
("219","0","mod_wrapper","module","mod_wrapper","","","0","1","1","0","{\"name\":\"mod_wrapper\",\"type\":\"module\",\"creationDate\":\"2004-10\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_WRAPPER_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_wrapper\"}","","","","","0","0","","1"),
("220","0","mod_articles_category","module","mod_articles_category","","","0","1","1","0","{\"name\":\"mod_articles_category\",\"type\":\"module\",\"creationDate\":\"2010-02\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2010 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_ARTICLES_CATEGORY_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_articles_category\"}","","","","","0","0","","1"),
("221","0","mod_articles_categories","module","mod_articles_categories","","","0","1","1","0","{\"name\":\"mod_articles_categories\",\"type\":\"module\",\"creationDate\":\"2010-02\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2010 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_ARTICLES_CATEGORIES_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_articles_categories\"}","","","","","0","0","","1"),
("222","0","mod_languages","module","mod_languages","","","0","1","1","0","{\"name\":\"mod_languages\",\"type\":\"module\",\"creationDate\":\"2010-02\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2010 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.5.0\",\"description\":\"MOD_LANGUAGES_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_languages\"}","","","","","0","0","","1"),
("223","0","mod_finder","module","mod_finder","","","0","1","0","0","{\"name\":\"mod_finder\",\"type\":\"module\",\"creationDate\":\"2011-08\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2011 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_FINDER_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_finder\"}","","","","","0","0","","1"),
("300","0","mod_custom","module","mod_custom","","","1","1","1","0","{\"name\":\"mod_custom\",\"type\":\"module\",\"creationDate\":\"2004-07\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_CUSTOM_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_custom\"}","","","","","0","0","","1"),
("301","0","mod_feed","module","mod_feed","","","1","1","1","0","{\"name\":\"mod_feed\",\"type\":\"module\",\"creationDate\":\"2005-07\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_FEED_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_feed\"}","","","","","0","0","","1"),
("302","0","mod_latest","module","mod_latest","","","1","1","1","0","{\"name\":\"mod_latest\",\"type\":\"module\",\"creationDate\":\"2004-07\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_LATEST_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_latest\"}","","","","","0","0","","1"),
("303","0","mod_logged","module","mod_logged","","","1","1","1","0","{\"name\":\"mod_logged\",\"type\":\"module\",\"creationDate\":\"2005-01\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_LOGGED_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_logged\"}","","","","","0","0","","1"),
("304","0","mod_login","module","mod_login","","","1","1","1","0","{\"name\":\"mod_login\",\"type\":\"module\",\"creationDate\":\"2005-03\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_LOGIN_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_login\"}","","","","","0","0","","1"),
("305","0","mod_menu","module","mod_menu","","","1","1","1","0","{\"name\":\"mod_menu\",\"type\":\"module\",\"creationDate\":\"2006-03\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_MENU_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_menu\"}","","","","","0","0","","1"),
("307","0","mod_popular","module","mod_popular","","","1","1","1","0","{\"name\":\"mod_popular\",\"type\":\"module\",\"creationDate\":\"2004-07\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_POPULAR_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_popular\"}","","","","","0","0","","1"),
("308","0","mod_quickicon","module","mod_quickicon","","","1","1","1","0","{\"name\":\"mod_quickicon\",\"type\":\"module\",\"creationDate\":\"2005-11\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_QUICKICON_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_quickicon\"}","","","","","0","0","","1"),
("311","0","mod_title","module","mod_title","","","1","1","1","0","{\"name\":\"mod_title\",\"type\":\"module\",\"creationDate\":\"2005-11\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_TITLE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_title\"}","","","","","0","0","","1"),
("312","0","mod_toolbar","module","mod_toolbar","","","1","1","1","0","{\"name\":\"mod_toolbar\",\"type\":\"module\",\"creationDate\":\"2005-11\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_TOOLBAR_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_toolbar\"}","","","","","0","0","","1"),
("313","0","mod_multilangstatus","module","mod_multilangstatus","","","1","1","1","0","{\"name\":\"mod_multilangstatus\",\"type\":\"module\",\"creationDate\":\"2011-09\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2011 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_MULTILANGSTATUS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_multilangstatus\"}","{\"cache\":\"0\"}","","","","0","0","","1"),
("314","0","mod_version","module","mod_version","","","1","1","1","0","{\"name\":\"mod_version\",\"type\":\"module\",\"creationDate\":\"2012-01\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2012 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_VERSION_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_version\"}","{\"format\":\"short\",\"product\":\"1\",\"cache\":\"0\"}","","","","0","0","","1"),
("315","0","mod_stats_admin","module","mod_stats_admin","","","1","1","1","0","{\"name\":\"mod_stats_admin\",\"type\":\"module\",\"creationDate\":\"2004-07\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_STATS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_stats_admin\"}","{\"serverinfo\":\"0\",\"siteinfo\":\"0\",\"counter\":\"0\",\"increase\":\"0\",\"cache\":\"1\",\"cache_time\":\"900\",\"cachemode\":\"static\"}","","","","0","0","","1"),
("316","0","mod_tags_popular","module","mod_tags_popular","","","0","1","1","0","{\"name\":\"mod_tags_popular\",\"type\":\"module\",\"creationDate\":\"2013-01\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2013 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.1.0\",\"description\":\"MOD_TAGS_POPULAR_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_tags_popular\"}","{\"maximum\":\"5\",\"timeframe\":\"alltime\",\"owncache\":\"1\"}","","","","0","0","","1"),
("317","0","mod_tags_similar","module","mod_tags_similar","","","0","1","1","0","{\"name\":\"mod_tags_similar\",\"type\":\"module\",\"creationDate\":\"2013-01\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2013 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.1.0\",\"description\":\"MOD_TAGS_SIMILAR_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_tags_similar\"}","{\"maximum\":\"5\",\"matchtype\":\"any\",\"owncache\":\"1\"}","","","","0","0","","1"),
("318","0","mod_sampledata","module","mod_sampledata","","","1","1","1","0","{\"name\":\"mod_sampledata\",\"type\":\"module\",\"creationDate\":\"2017-07\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2017 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.8.0\",\"description\":\"MOD_SAMPLEDATA_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_sampledata\"}","{}","","","","0","0","","1"),
("319","0","mod_latestactions","module","mod_latestactions","","","1","1","1","0","{\"name\":\"mod_latestactions\",\"type\":\"module\",\"creationDate\":\"2018-05\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2018 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.9.0\",\"description\":\"MOD_LATESTACTIONS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_latestactions\"}","{}","","","","0","0","","1"),
("320","0","mod_privacy_dashboard","module","mod_privacy_dashboard","","","1","1","1","0","{\"name\":\"mod_privacy_dashboard\",\"type\":\"module\",\"creationDate\":\"2018-06\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2018 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.9.0\",\"description\":\"MOD_PRIVACY_DASHBOARD_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_privacy_dashboard\"}","{}","","","","0","0","","1"),
("401","0","plg_authentication_joomla","plugin","joomla","","authentication","0","1","1","1","{\"name\":\"plg_authentication_joomla\",\"type\":\"plugin\",\"creationDate\":\"2005-11\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_AUTHENTICATION_JOOMLA_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"joomla\"}","","","","","0","0","","1"),
("402","0","plg_authentication_ldap","plugin","ldap","","authentication","0","0","1","0","{\"name\":\"plg_authentication_ldap\",\"type\":\"plugin\",\"creationDate\":\"2005-11\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_LDAP_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"ldap\"}","{\"host\":\"\",\"port\":\"389\",\"use_ldapV3\":\"0\",\"negotiate_tls\":\"0\",\"no_referrals\":\"0\",\"auth_method\":\"bind\",\"base_dn\":\"\",\"search_string\":\"\",\"users_dn\":\"\",\"username\":\"admin\",\"password\":\"bobby7\",\"ldap_fullname\":\"fullName\",\"ldap_email\":\"mail\",\"ldap_uid\":\"uid\"}","","","","3","0","","1"),
("403","0","plg_content_contact","plugin","contact","","content","0","1","1","0","{\"name\":\"plg_content_contact\",\"type\":\"plugin\",\"creationDate\":\"2014-01\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2014 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.2.2\",\"description\":\"PLG_CONTENT_CONTACT_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"contact\"}","","","","","1","0","","1"),
("404","0","plg_content_emailcloak","plugin","emailcloak","","content","0","1","1","0","{\"name\":\"plg_content_emailcloak\",\"type\":\"plugin\",\"creationDate\":\"2005-11\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_CONTENT_EMAILCLOAK_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"emailcloak\"}","{\"mode\":\"1\"}","","","","1","0","","1"),
("406","0","plg_content_loadmodule","plugin","loadmodule","","content","0","1","1","0","{\"name\":\"plg_content_loadmodule\",\"type\":\"plugin\",\"creationDate\":\"2005-11\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_LOADMODULE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"loadmodule\"}","{\"style\":\"xhtml\"}","","","2011-09-18 15:22:50","0","0","","1"),
("407","0","plg_content_pagebreak","plugin","pagebreak","","content","0","1","1","0","{\"name\":\"plg_content_pagebreak\",\"type\":\"plugin\",\"creationDate\":\"2005-11\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_CONTENT_PAGEBREAK_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"pagebreak\"}","{\"title\":\"1\",\"multipage_toc\":\"1\",\"showall\":\"1\"}","","","","4","0","","1"),
("408","0","plg_content_pagenavigation","plugin","pagenavigation","","content","0","1","1","0","{\"name\":\"plg_content_pagenavigation\",\"type\":\"plugin\",\"creationDate\":\"2006-01\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_PAGENAVIGATION_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"pagenavigation\"}","{\"position\":\"1\"}","","","","5","0","","1"),
("409","0","plg_content_vote","plugin","vote","","content","0","0","1","0","{\"name\":\"plg_content_vote\",\"type\":\"plugin\",\"creationDate\":\"2005-11\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_VOTE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"vote\"}","","","","","6","0","","1"),
("410","0","plg_editors_codemirror","plugin","codemirror","","editors","0","1","1","0","{\"name\":\"plg_editors_codemirror\",\"type\":\"plugin\",\"creationDate\":\"28 March 2011\",\"author\":\"Marijn Haverbeke\",\"copyright\":\"Copyright (C) 2014 - 2021 by Marijn Haverbeke <marijnh@gmail.com> and others\",\"authorEmail\":\"marijnh@gmail.com\",\"authorUrl\":\"https:\\/\\/codemirror.net\\/\",\"version\":\"5.65.6\",\"description\":\"PLG_CODEMIRROR_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"codemirror\"}","{\"lineNumbers\":\"1\",\"lineWrapping\":\"1\",\"matchTags\":\"1\",\"matchBrackets\":\"1\",\"marker-gutter\":\"1\",\"autoCloseTags\":\"1\",\"autoCloseBrackets\":\"1\",\"autoFocus\":\"1\",\"theme\":\"default\",\"tabmode\":\"indent\"}","","","","1","0","","1"),
("411","0","plg_editors_none","plugin","none","","editors","0","1","1","1","{\"name\":\"plg_editors_none\",\"type\":\"plugin\",\"creationDate\":\"2005-09\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_NONE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"none\"}","","","","","2","0","","1"),
("412","0","plg_editors_tinymce","plugin","tinymce","","editors","0","1","1","0","{\"name\":\"plg_editors_tinymce\",\"type\":\"plugin\",\"creationDate\":\"2005-08\",\"author\":\"Tiny Technologies, Inc\",\"copyright\":\"Tiny Technologies, Inc\",\"authorEmail\":\"N\\/A\",\"authorUrl\":\"https:\\/\\/www.tiny.cloud\",\"version\":\"5.10.7\",\"description\":\"PLG_TINY_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"tinymce\"}","{\"configuration\":{\"toolbars\":{\"2\":{\"toolbar1\":[\"bold\",\"underline\",\"strikethrough\",\"|\",\"undo\",\"redo\",\"|\",\"bullist\",\"numlist\",\"|\",\"pastetext\"]},\"1\":{\"menu\":[\"edit\",\"insert\",\"view\",\"format\",\"table\",\"tools\"],\"toolbar1\":[\"bold\",\"italic\",\"underline\",\"strikethrough\",\"|\",\"alignleft\",\"aligncenter\",\"alignright\",\"alignjustify\",\"|\",\"formatselect\",\"|\",\"bullist\",\"numlist\",\"|\",\"outdent\",\"indent\",\"|\",\"undo\",\"redo\",\"|\",\"link\",\"unlink\",\"anchor\",\"code\",\"|\",\"hr\",\"table\",\"|\",\"subscript\",\"superscript\",\"|\",\"charmap\",\"pastetext\",\"preview\"]},\"0\":{\"menu\":[\"edit\",\"insert\",\"view\",\"format\",\"table\",\"tools\"],\"toolbar1\":[\"bold\",\"italic\",\"underline\",\"strikethrough\",\"|\",\"alignleft\",\"aligncenter\",\"alignright\",\"alignjustify\",\"|\",\"styleselect\",\"|\",\"formatselect\",\"fontselect\",\"fontsizeselect\",\"|\",\"searchreplace\",\"|\",\"bullist\",\"numlist\",\"|\",\"outdent\",\"indent\",\"|\",\"undo\",\"redo\",\"|\",\"link\",\"unlink\",\"anchor\",\"image\",\"|\",\"code\",\"|\",\"forecolor\",\"backcolor\",\"|\",\"fullscreen\",\"|\",\"table\",\"|\",\"subscript\",\"superscript\",\"|\",\"charmap\",\"emoticons\",\"media\",\"hr\",\"ltr\",\"rtl\",\"|\",\"cut\",\"copy\",\"paste\",\"pastetext\",\"|\",\"visualchars\",\"visualblocks\",\"nonbreaking\",\"blockquote\",\"template\",\"|\",\"print\",\"preview\",\"codesample\",\"insertdatetime\",\"removeformat\"]}},\"setoptions\":{\"2\":{\"access\":[\"1\"],\"skin\":\"0\",\"skin_admin\":\"0\",\"mobile\":\"0\",\"drag_drop\":\"1\",\"path\":\"\",\"entity_encoding\":\"raw\",\"lang_mode\":\"1\",\"text_direction\":\"ltr\",\"content_css\":\"1\",\"content_css_custom\":\"\",\"relative_urls\":\"1\",\"newlines\":\"0\",\"use_config_textfilters\":\"0\",\"invalid_elements\":\"script,applet,iframe\",\"valid_elements\":\"\",\"extended_elements\":\"\",\"resizing\":\"1\",\"resize_horizontal\":\"1\",\"element_path\":\"1\",\"wordcount\":\"1\",\"image_advtab\":\"0\",\"advlist\":\"1\",\"autosave\":\"1\",\"contextmenu\":\"1\",\"custom_plugin\":\"\",\"custom_button\":\"\"},\"1\":{\"access\":[\"6\",\"2\"],\"skin\":\"0\",\"skin_admin\":\"0\",\"mobile\":\"0\",\"drag_drop\":\"1\",\"path\":\"\",\"entity_encoding\":\"raw\",\"lang_mode\":\"1\",\"text_direction\":\"ltr\",\"content_css\":\"1\",\"content_css_custom\":\"\",\"relative_urls\":\"1\",\"newlines\":\"0\",\"use_config_textfilters\":\"0\",\"invalid_elements\":\"script,applet,iframe\",\"valid_elements\":\"\",\"extended_elements\":\"\",\"resizing\":\"1\",\"resize_horizontal\":\"1\",\"element_path\":\"1\",\"wordcount\":\"1\",\"image_advtab\":\"0\",\"advlist\":\"1\",\"autosave\":\"1\",\"contextmenu\":\"1\",\"custom_plugin\":\"\",\"custom_button\":\"\"},\"0\":{\"access\":[\"7\",\"4\",\"8\"],\"skin\":\"0\",\"skin_admin\":\"0\",\"mobile\":\"0\",\"drag_drop\":\"1\",\"path\":\"\",\"entity_encoding\":\"raw\",\"lang_mode\":\"1\",\"text_direction\":\"ltr\",\"content_css\":\"1\",\"content_css_custom\":\"\",\"relative_urls\":\"1\",\"newlines\":\"0\",\"use_config_textfilters\":\"0\",\"invalid_elements\":\"script,applet,iframe\",\"valid_elements\":\"\",\"extended_elements\":\"\",\"resizing\":\"1\",\"resize_horizontal\":\"1\",\"element_path\":\"1\",\"wordcount\":\"1\",\"image_advtab\":\"1\",\"advlist\":\"1\",\"autosave\":\"1\",\"contextmenu\":\"1\",\"custom_plugin\":\"\",\"custom_button\":\"\"}}},\"sets_amount\":3,\"html_height\":\"550\",\"html_width\":\"750\"}","","","","3","0","","1"),
("413","0","plg_editors-xtd_article","plugin","article","","editors-xtd","0","1","1","0","{\"name\":\"plg_editors-xtd_article\",\"type\":\"plugin\",\"creationDate\":\"2009-10\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2009 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_ARTICLE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"article\"}","","","","","1","0","","1"),
("414","0","plg_editors-xtd_image","plugin","image","","editors-xtd","0","1","1","0","{\"name\":\"plg_editors-xtd_image\",\"type\":\"plugin\",\"creationDate\":\"2004-08\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_IMAGE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"image\"}","","","","","2","0","","1"),
("415","0","plg_editors-xtd_pagebreak","plugin","pagebreak","","editors-xtd","0","1","1","0","{\"name\":\"plg_editors-xtd_pagebreak\",\"type\":\"plugin\",\"creationDate\":\"2004-08\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_EDITORSXTD_PAGEBREAK_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"pagebreak\"}","","","","","3","0","","1"),
("416","0","plg_editors-xtd_readmore","plugin","readmore","","editors-xtd","0","1","1","0","{\"name\":\"plg_editors-xtd_readmore\",\"type\":\"plugin\",\"creationDate\":\"2006-03\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_READMORE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"readmore\"}","","","","","4","0","","1"),
("417","10053","plg_search_categories","plugin","categories","","search","0","1","1","0","{\"name\":\"plg_search_categories\",\"type\":\"plugin\",\"creationDate\":\"November 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_SEARCH_CATEGORIES_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"categories\"}","{\"search_limit\":\"50\",\"search_content\":\"1\",\"search_archived\":\"1\"}","","","","0","0","","0"),
("418","10053","plg_search_contacts","plugin","contacts","","search","0","1","1","0","{\"name\":\"plg_search_contacts\",\"type\":\"plugin\",\"creationDate\":\"November 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_SEARCH_CONTACTS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"contacts\"}","{\"search_limit\":\"50\",\"search_content\":\"1\",\"search_archived\":\"1\"}","","","","0","0","","0"),
("419","10053","plg_search_content","plugin","content","","search","0","1","1","0","{\"name\":\"plg_search_content\",\"type\":\"plugin\",\"creationDate\":\"November 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_SEARCH_CONTENT_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"content\"}","{\"search_limit\":\"50\",\"search_content\":\"1\",\"search_archived\":\"1\"}","","","","0","0","","0"),
("420","10053","plg_search_newsfeeds","plugin","newsfeeds","","search","0","1","1","0","{\"name\":\"plg_search_newsfeeds\",\"type\":\"plugin\",\"creationDate\":\"November 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_SEARCH_NEWSFEEDS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"newsfeeds\"}","{\"search_limit\":\"50\",\"search_content\":\"1\",\"search_archived\":\"1\"}","","","","0","0","","0"),
("422","0","plg_system_languagefilter","plugin","languagefilter","","system","0","0","1","0","{\"name\":\"plg_system_languagefilter\",\"type\":\"plugin\",\"creationDate\":\"2010-07\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2010 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_SYSTEM_LANGUAGEFILTER_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"languagefilter\"}","","","","","1","0","","1"),
("424","0","plg_system_cache","plugin","cache","","system","0","0","1","0","{\"name\":\"plg_system_cache\",\"type\":\"plugin\",\"creationDate\":\"2007-02\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2007 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_CACHE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"cache\"}","{\"browsercache\":\"0\",\"cachetime\":\"15\"}","","","","9","0","","1"),
("425","0","plg_system_debug","plugin","debug","","system","0","1","1","0","{\"name\":\"plg_system_debug\",\"type\":\"plugin\",\"creationDate\":\"2006-12\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_DEBUG_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"debug\"}","{\"profile\":\"1\",\"queries\":\"1\",\"memory\":\"1\",\"language_files\":\"1\",\"language_strings\":\"1\",\"strip-first\":\"1\",\"strip-prefix\":\"\",\"strip-suffix\":\"\"}","","","","4","0","","1"),
("426","0","plg_system_log","plugin","log","","system","0","1","1","0","{\"name\":\"plg_system_log\",\"type\":\"plugin\",\"creationDate\":\"2007-04\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2007 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_LOG_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"log\"}","","","","","5","0","","1");
INSERT INTO j4x_extensions VALUES
("427","0","plg_system_redirect","plugin","redirect","","system","0","0","1","0","{\"name\":\"plg_system_redirect\",\"type\":\"plugin\",\"creationDate\":\"2009-04\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2009 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_SYSTEM_REDIRECT_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"redirect\"}","","","","","3","0","","1"),
("428","0","plg_system_remember","plugin","remember","","system","0","1","1","0","{\"name\":\"plg_system_remember\",\"type\":\"plugin\",\"creationDate\":\"2007-04\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2007 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_REMEMBER_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"remember\"}","","","","","7","0","","1"),
("429","0","plg_system_sef","plugin","sef","","system","0","1","1","0","{\"name\":\"plg_system_sef\",\"type\":\"plugin\",\"creationDate\":\"2007-12\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2007 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_SEF_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"sef\"}","","","","","8","0","","1"),
("430","0","plg_system_logout","plugin","logout","","system","0","1","1","0","{\"name\":\"plg_system_logout\",\"type\":\"plugin\",\"creationDate\":\"2009-04\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2009 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_SYSTEM_LOGOUT_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"logout\"}","","","","","6","0","","1"),
("431","0","plg_user_contactcreator","plugin","contactcreator","","user","0","0","1","0","{\"name\":\"plg_user_contactcreator\",\"type\":\"plugin\",\"creationDate\":\"2009-08\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2009 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_CONTACTCREATOR_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"contactcreator\"}","{\"autowebpage\":\"\",\"category\":\"4\",\"autopublish\":\"0\"}","","","","1","0","","1"),
("432","0","plg_user_joomla","plugin","joomla","","user","0","1","1","0","{\"name\":\"plg_user_joomla\",\"type\":\"plugin\",\"creationDate\":\"2006-12\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_USER_JOOMLA_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"joomla\"}","{\"autoregister\":\"1\",\"mail_to_user\":\"1\",\"forceLogout\":\"1\"}","","","","2","0","","1"),
("433","0","plg_user_profile","plugin","profile","","user","0","0","1","0","{\"name\":\"plg_user_profile\",\"type\":\"plugin\",\"creationDate\":\"2008-01\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2008 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_USER_PROFILE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"profile\"}","{\"register-require_address1\":\"1\",\"register-require_address2\":\"1\",\"register-require_city\":\"1\",\"register-require_region\":\"1\",\"register-require_country\":\"1\",\"register-require_postal_code\":\"1\",\"register-require_phone\":\"1\",\"register-require_website\":\"1\",\"register-require_favoritebook\":\"1\",\"register-require_aboutme\":\"1\",\"register-require_tos\":\"1\",\"register-require_dob\":\"1\",\"profile-require_address1\":\"1\",\"profile-require_address2\":\"1\",\"profile-require_city\":\"1\",\"profile-require_region\":\"1\",\"profile-require_country\":\"1\",\"profile-require_postal_code\":\"1\",\"profile-require_phone\":\"1\",\"profile-require_website\":\"1\",\"profile-require_favoritebook\":\"1\",\"profile-require_aboutme\":\"1\",\"profile-require_tos\":\"1\",\"profile-require_dob\":\"1\"}","","","","0","0","","1"),
("434","0","plg_extension_joomla","plugin","joomla","","extension","0","1","1","0","{\"name\":\"plg_extension_joomla\",\"type\":\"plugin\",\"creationDate\":\"2010-05\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2010 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_EXTENSION_JOOMLA_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"joomla\"}","","","","","1","0","","1"),
("435","0","plg_content_joomla","plugin","joomla","","content","0","1","1","0","{\"name\":\"plg_content_joomla\",\"type\":\"plugin\",\"creationDate\":\"2010-11\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2010 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_CONTENT_JOOMLA_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"joomla\"}","","","","","0","0","","1"),
("436","0","plg_system_languagecode","plugin","languagecode","","system","0","0","1","0","{\"name\":\"plg_system_languagecode\",\"type\":\"plugin\",\"creationDate\":\"2011-11\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2011 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_SYSTEM_LANGUAGECODE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"languagecode\"}","","","","","10","0","","1"),
("437","0","plg_quickicon_joomlaupdate","plugin","joomlaupdate","","quickicon","0","1","1","0","{\"name\":\"plg_quickicon_joomlaupdate\",\"type\":\"plugin\",\"creationDate\":\"2011-08\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2011 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_QUICKICON_JOOMLAUPDATE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"joomlaupdate\"}","","","","","0","0","","1"),
("438","0","plg_quickicon_extensionupdate","plugin","extensionupdate","","quickicon","0","1","1","0","{\"name\":\"plg_quickicon_extensionupdate\",\"type\":\"plugin\",\"creationDate\":\"2011-08\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2011 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_QUICKICON_EXTENSIONUPDATE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"extensionupdate\"}","","","","","0","0","","1"),
("439","0","plg_captcha_recaptcha","plugin","recaptcha","","captcha","0","0","1","0","{\"name\":\"plg_captcha_recaptcha\",\"type\":\"plugin\",\"creationDate\":\"2011-12\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2011 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.4.0\",\"description\":\"PLG_CAPTCHA_RECAPTCHA_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"recaptcha\"}","{\"public_key\":\"\",\"private_key\":\"\",\"theme\":\"clean\"}","","","","0","0","","1"),
("440","0","plg_system_highlight","plugin","highlight","","system","0","1","1","0","{\"name\":\"plg_system_highlight\",\"type\":\"plugin\",\"creationDate\":\"2011-08\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2011 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_SYSTEM_HIGHLIGHT_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"highlight\"}","","","","","7","0","","1"),
("441","0","plg_content_finder","plugin","finder","","content","0","0","1","0","{\"name\":\"plg_content_finder\",\"type\":\"plugin\",\"creationDate\":\"2011-12\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2011 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_CONTENT_FINDER_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"finder\"}","","","","","0","0","","1"),
("442","0","plg_finder_categories","plugin","categories","","finder","0","1","1","0","{\"name\":\"plg_finder_categories\",\"type\":\"plugin\",\"creationDate\":\"2011-08\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2011 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_FINDER_CATEGORIES_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"categories\"}","","","","","1","0","","1"),
("443","0","plg_finder_contacts","plugin","contacts","","finder","0","1","1","0","{\"name\":\"plg_finder_contacts\",\"type\":\"plugin\",\"creationDate\":\"2011-08\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2011 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_FINDER_CONTACTS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"contacts\"}","","","","","2","0","","1"),
("444","0","plg_finder_content","plugin","content","","finder","0","1","1","0","{\"name\":\"plg_finder_content\",\"type\":\"plugin\",\"creationDate\":\"2011-08\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2011 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_FINDER_CONTENT_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"content\"}","","","","","3","0","","1"),
("445","0","plg_finder_newsfeeds","plugin","newsfeeds","","finder","0","1","1","0","{\"name\":\"plg_finder_newsfeeds\",\"type\":\"plugin\",\"creationDate\":\"2011-08\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2011 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_FINDER_NEWSFEEDS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"newsfeeds\"}","","","","","4","0","","1"),
("447","0","plg_finder_tags","plugin","tags","","finder","0","1","1","0","{\"name\":\"plg_finder_tags\",\"type\":\"plugin\",\"creationDate\":\"2013-02\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2013 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_FINDER_TAGS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"tags\"}","","","","","0","0","","1"),
("449","0","plg_authentication_cookie","plugin","cookie","","authentication","0","1","1","0","{\"name\":\"plg_authentication_cookie\",\"type\":\"plugin\",\"creationDate\":\"2013-07\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2013 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_AUTHENTICATION_COOKIE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"cookie\"}","","","","","0","0","","1"),
("451","10053","plg_search_tags","plugin","tags","","search","0","1","1","0","{\"name\":\"plg_search_tags\",\"type\":\"plugin\",\"creationDate\":\"March 2014\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2014 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_SEARCH_TAGS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"tags\"}","{\"search_limit\":\"50\",\"show_tagged_items\":\"1\"}","","","","0","0","","0"),
("452","0","plg_system_updatenotification","plugin","updatenotification","","system","0","1","1","0","{\"name\":\"plg_system_updatenotification\",\"type\":\"plugin\",\"creationDate\":\"2015-05\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2015 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.5.0\",\"description\":\"PLG_SYSTEM_UPDATENOTIFICATION_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"updatenotification\"}","{\"lastrun\":1675525849}","","","","0","0","","1"),
("453","0","plg_editors-xtd_module","plugin","module","","editors-xtd","0","1","1","0","{\"name\":\"plg_editors-xtd_module\",\"type\":\"plugin\",\"creationDate\":\"2015-10\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2015 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.5.0\",\"description\":\"PLG_MODULE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"module\"}","","","","","0","0","","1"),
("454","0","plg_system_stats","plugin","stats","","system","0","1","1","0","{\"name\":\"plg_system_stats\",\"type\":\"plugin\",\"creationDate\":\"2013-11\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2013 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.5.0\",\"description\":\"PLG_SYSTEM_STATS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"stats\"}","{\"mode\":3,\"lastrun\":\"\",\"unique_id\":\"fa92c9ab886cbfc22e3e4b3b132f52f926153a5e\",\"interval\":12}","","","","0","0","","1"),
("455","0","plg_installer_packageinstaller","plugin","packageinstaller","","installer","0","1","1","0","{\"name\":\"plg_installer_packageinstaller\",\"type\":\"plugin\",\"creationDate\":\"2016-05\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2016 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.6.0\",\"description\":\"PLG_INSTALLER_PACKAGEINSTALLER_PLUGIN_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"packageinstaller\"}","","","","","1","0","","1"),
("456","0","plg_installer_folderinstaller","plugin","folderinstaller","","installer","0","1","1","0","{\"name\":\"plg_installer_folderinstaller\",\"type\":\"plugin\",\"creationDate\":\"2016-05\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2016 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.6.0\",\"description\":\"PLG_INSTALLER_FOLDERINSTALLER_PLUGIN_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"folderinstaller\"}","","","","","2","0","","1"),
("457","0","plg_installer_urlinstaller","plugin","urlinstaller","","installer","0","1","1","0","{\"name\":\"plg_installer_urlinstaller\",\"type\":\"plugin\",\"creationDate\":\"2016-05\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2016 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.6.0\",\"description\":\"PLG_INSTALLER_URLINSTALLER_PLUGIN_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"urlinstaller\"}","","","","","3","0","","1"),
("458","0","plg_quickicon_phpversioncheck","plugin","phpversioncheck","","quickicon","0","1","1","0","{\"name\":\"plg_quickicon_phpversioncheck\",\"type\":\"plugin\",\"creationDate\":\"2016-08\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2016 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_QUICKICON_PHPVERSIONCHECK_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"phpversioncheck\"}","","","","","0","0","","1"),
("459","0","plg_editors-xtd_menu","plugin","menu","","editors-xtd","0","1","1","0","{\"name\":\"plg_editors-xtd_menu\",\"type\":\"plugin\",\"creationDate\":\"2016-08\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2016 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_EDITORS-XTD_MENU_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"menu\"}","","","","","0","0","","1"),
("460","0","plg_editors-xtd_contact","plugin","contact","","editors-xtd","0","1","1","0","{\"name\":\"plg_editors-xtd_contact\",\"type\":\"plugin\",\"creationDate\":\"2016-10\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2016 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_EDITORS-XTD_CONTACT_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"contact\"}","","","","","0","0","","1"),
("461","0","plg_system_fields","plugin","fields","","system","0","1","1","0","{\"name\":\"plg_system_fields\",\"type\":\"plugin\",\"creationDate\":\"2016-03\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2016 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_SYSTEM_FIELDS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"fields\"}","","","","","0","0","","1"),
("462","0","plg_fields_calendar","plugin","calendar","","fields","0","1","1","0","{\"name\":\"plg_fields_calendar\",\"type\":\"plugin\",\"creationDate\":\"2016-03\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2016 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_FIELDS_CALENDAR_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"calendar\"}","","","","","0","0","","1"),
("463","0","plg_fields_checkboxes","plugin","checkboxes","","fields","0","1","1","0","{\"name\":\"plg_fields_checkboxes\",\"type\":\"plugin\",\"creationDate\":\"2016-03\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2016 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_FIELDS_CHECKBOXES_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"checkboxes\"}","","","","","0","0","","1"),
("464","0","plg_fields_color","plugin","color","","fields","0","1","1","0","{\"name\":\"plg_fields_color\",\"type\":\"plugin\",\"creationDate\":\"2016-03\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2016 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_FIELDS_COLOR_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"color\"}","","","","","0","0","","1"),
("465","0","plg_fields_editor","plugin","editor","","fields","0","1","1","0","{\"name\":\"plg_fields_editor\",\"type\":\"plugin\",\"creationDate\":\"2016-03\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2016 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_FIELDS_EDITOR_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"editor\"}","","","","","0","0","","1"),
("466","0","plg_fields_imagelist","plugin","imagelist","","fields","0","1","1","0","{\"name\":\"plg_fields_imagelist\",\"type\":\"plugin\",\"creationDate\":\"2016-03\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2016 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_FIELDS_IMAGELIST_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"imagelist\"}","","","","","0","0","","1"),
("467","0","plg_fields_integer","plugin","integer","","fields","0","1","1","0","{\"name\":\"plg_fields_integer\",\"type\":\"plugin\",\"creationDate\":\"2016-03\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2016 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_FIELDS_INTEGER_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"integer\"}","{\"multiple\":\"0\",\"first\":\"1\",\"last\":\"100\",\"step\":\"1\"}","","","","0","0","","1"),
("468","0","plg_fields_list","plugin","list","","fields","0","1","1","0","{\"name\":\"plg_fields_list\",\"type\":\"plugin\",\"creationDate\":\"2016-03\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2016 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_FIELDS_LIST_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"list\"}","","","","","0","0","","1"),
("469","0","plg_fields_media","plugin","media","","fields","0","1","1","0","{\"name\":\"plg_fields_media\",\"type\":\"plugin\",\"creationDate\":\"2016-03\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2016 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_FIELDS_MEDIA_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"media\"}","","","","","0","0","","1"),
("470","0","plg_fields_radio","plugin","radio","","fields","0","1","1","0","{\"name\":\"plg_fields_radio\",\"type\":\"plugin\",\"creationDate\":\"2016-03\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2016 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_FIELDS_RADIO_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"radio\"}","","","","","0","0","","1"),
("471","0","plg_fields_sql","plugin","sql","","fields","0","1","1","0","{\"name\":\"plg_fields_sql\",\"type\":\"plugin\",\"creationDate\":\"2016-03\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2016 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_FIELDS_SQL_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"sql\"}","","","","","0","0","","1"),
("472","0","plg_fields_text","plugin","text","","fields","0","1","1","0","{\"name\":\"plg_fields_text\",\"type\":\"plugin\",\"creationDate\":\"2016-03\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2016 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_FIELDS_TEXT_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"text\"}","","","","","0","0","","1"),
("473","0","plg_fields_textarea","plugin","textarea","","fields","0","1","1","0","{\"name\":\"plg_fields_textarea\",\"type\":\"plugin\",\"creationDate\":\"2016-03\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2016 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_FIELDS_TEXTAREA_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"textarea\"}","","","","","0","0","","1"),
("474","0","plg_fields_url","plugin","url","","fields","0","1","1","0","{\"name\":\"plg_fields_url\",\"type\":\"plugin\",\"creationDate\":\"2016-03\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2016 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_FIELDS_URL_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"url\"}","","","","","0","0","","1"),
("475","0","plg_fields_user","plugin","user","","fields","0","1","1","0","{\"name\":\"plg_fields_user\",\"type\":\"plugin\",\"creationDate\":\"2016-03\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2016 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_FIELDS_USER_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"user\"}","","","","","0","0","","1"),
("476","0","plg_fields_usergrouplist","plugin","usergrouplist","","fields","0","1","1","0","{\"name\":\"plg_fields_usergrouplist\",\"type\":\"plugin\",\"creationDate\":\"2016-03\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2016 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_FIELDS_USERGROUPLIST_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"usergrouplist\"}","","","","","0","0","","1"),
("477","0","plg_content_fields","plugin","fields","","content","0","1","1","0","{\"name\":\"plg_content_fields\",\"type\":\"plugin\",\"creationDate\":\"2017-02\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2017 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_CONTENT_FIELDS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"fields\"}","","","","","0","0","","1"),
("478","0","plg_editors-xtd_fields","plugin","fields","","editors-xtd","0","1","1","0","{\"name\":\"plg_editors-xtd_fields\",\"type\":\"plugin\",\"creationDate\":\"2017-02\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2017 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_EDITORS-XTD_FIELDS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"fields\"}","","","","","0","0","","1"),
("479","0","plg_sampledata_blog","plugin","blog","","sampledata","0","1","1","0","{\"name\":\"plg_sampledata_blog\",\"type\":\"plugin\",\"creationDate\":\"2017-07\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2017 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.8.0\",\"description\":\"PLG_SAMPLEDATA_BLOG_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"blog\"}","","","","","0","0","","1"),
("480","0","plg_system_sessiongc","plugin","sessiongc","","system","0","1","1","0","{\"name\":\"plg_system_sessiongc\",\"type\":\"plugin\",\"creationDate\":\"2018-02\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2018 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.8.6\",\"description\":\"PLG_SYSTEM_SESSIONGC_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"sessiongc\"}","","","","","0","0","","1"),
("482","0","plg_content_confirmconsent","plugin","confirmconsent","","content","0","0","1","0","{\"name\":\"plg_content_confirmconsent\",\"type\":\"plugin\",\"creationDate\":\"2018-05\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2018 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.9.0\",\"description\":\"PLG_CONTENT_CONFIRMCONSENT_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"confirmconsent\"}","{}","","","","0","0","","1"),
("483","0","plg_system_actionlogs","plugin","actionlogs","","system","0","1","1","0","{\"name\":\"plg_system_actionlogs\",\"type\":\"plugin\",\"creationDate\":\"2018-05\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2018 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.9.0\",\"description\":\"PLG_SYSTEM_ACTIONLOGS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"actionlogs\"}","{}","","","","0","0","","1"),
("484","0","plg_actionlog_joomla","plugin","joomla","","actionlog","0","1","1","0","{\"name\":\"plg_actionlog_joomla\",\"type\":\"plugin\",\"creationDate\":\"2018-05\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2018 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.9.0\",\"description\":\"PLG_ACTIONLOG_JOOMLA_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"joomla\"}","{}","","","","0","0","","1"),
("485","0","plg_system_privacyconsent","plugin","privacyconsent","","system","0","0","1","0","{\"name\":\"plg_system_privacyconsent\",\"type\":\"plugin\",\"creationDate\":\"2018-04\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2018 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.9.0\",\"description\":\"PLG_SYSTEM_PRIVACYCONSENT_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"privacyconsent\"}","{}","","","","0","0","","1"),
("486","0","plg_system_logrotation","plugin","logrotation","","system","0","1","1","0","{\"name\":\"plg_system_logrotation\",\"type\":\"plugin\",\"creationDate\":\"2018-05\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2018 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.9.0\",\"description\":\"PLG_SYSTEM_LOGROTATION_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"logrotation\"}","{\"lastrun\":1675455578}","","","","0","0","","1"),
("487","0","plg_privacy_user","plugin","user","","privacy","0","1","1","0","{\"name\":\"plg_privacy_user\",\"type\":\"plugin\",\"creationDate\":\"2018-05\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2018 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.9.0\",\"description\":\"PLG_PRIVACY_USER_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"user\"}","{}","","","","0","0","","1"),
("488","0","plg_quickicon_privacycheck","plugin","privacycheck","","quickicon","0","1","1","0","{\"name\":\"plg_quickicon_privacycheck\",\"type\":\"plugin\",\"creationDate\":\"2018-06\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2018 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.9.0\",\"description\":\"PLG_QUICKICON_PRIVACYCHECK_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"privacycheck\"}","{}","","","","0","0","","1"),
("489","0","plg_user_terms","plugin","terms","","user","0","0","1","0","{\"name\":\"plg_user_terms\",\"type\":\"plugin\",\"creationDate\":\"2018-06\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2018 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.9.0\",\"description\":\"PLG_USER_TERMS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"terms\"}","{}","","","","0","0","","1"),
("490","0","plg_privacy_contact","plugin","contact","","privacy","0","1","1","0","{\"name\":\"plg_privacy_contact\",\"type\":\"plugin\",\"creationDate\":\"2018-07\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2018 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.9.0\",\"description\":\"PLG_PRIVACY_CONTACT_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"contact\"}","{}","","","","0","0","","1"),
("491","0","plg_privacy_content","plugin","content","","privacy","0","1","1","0","{\"name\":\"plg_privacy_content\",\"type\":\"plugin\",\"creationDate\":\"2018-07\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2018 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.9.0\",\"description\":\"PLG_PRIVACY_CONTENT_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"content\"}","{}","","","","0","0","","1"),
("492","0","plg_privacy_message","plugin","message","","privacy","0","1","1","0","{\"name\":\"plg_privacy_message\",\"type\":\"plugin\",\"creationDate\":\"2018-07\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2018 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.9.0\",\"description\":\"PLG_PRIVACY_MESSAGE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"message\"}","{}","","","","0","0","","1"),
("493","0","plg_privacy_actionlogs","plugin","actionlogs","","privacy","0","1","1","0","{\"name\":\"plg_privacy_actionlogs\",\"type\":\"plugin\",\"creationDate\":\"2018-07\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2018 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.9.0\",\"description\":\"PLG_PRIVACY_ACTIONLOGS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"actionlogs\"}","{}","","","","0","0","","1"),
("494","0","plg_captcha_recaptcha_invisible","plugin","recaptcha_invisible","","captcha","0","0","1","0","{\"name\":\"plg_captcha_recaptcha_invisible\",\"type\":\"plugin\",\"creationDate\":\"2017-11\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2017 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.8\",\"description\":\"PLG_CAPTCHA_RECAPTCHA_INVISIBLE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"recaptcha_invisible\"}","{\"public_key\":\"\",\"private_key\":\"\",\"theme\":\"clean\"}","","","","0","0","","1"),
("495","0","plg_privacy_consents","plugin","consents","","privacy","0","1","1","0","{\"name\":\"plg_privacy_consents\",\"type\":\"plugin\",\"creationDate\":\"2018-07\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2018 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.9.0\",\"description\":\"PLG_PRIVACY_CONSENTS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"consents\"}","{}","","","","0","0","","1"),
("600","802","English (en-GB)","language","en-GB","","","0","1","1","1","{\"name\":\"English (en-GB)\",\"type\":\"language\",\"creationDate\":\"2023-01\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.2.7\",\"description\":\"en-GB site language\",\"group\":\"\"}","","","","","0","0","","1"),
("601","802","English (en-GB)","language","en-GB","","","1","1","1","1","{\"name\":\"English (en-GB)\",\"type\":\"language\",\"creationDate\":\"2023-01\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.2.7\",\"description\":\"en-GB administrator language\",\"group\":\"\"}","","","","","0","0","","1"),
("700","0","files_joomla","file","joomla","","","0","1","1","1","{\"name\":\"files_joomla\",\"type\":\"file\",\"creationDate\":\"2023-01\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2019 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.2.7\",\"description\":\"FILES_JOOMLA_XML_DESCRIPTION\",\"group\":\"\"}","","","","","0","0","","1"),
("802","0","English (en-GB) Language Pack","package","pkg_en-GB","","","0","1","1","1","{\"name\":\"English (en-GB) Language Pack\",\"type\":\"package\",\"creationDate\":\"2023-01\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2019 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.2.7.1\",\"description\":\"en-GB language pack\",\"group\":\"\",\"filename\":\"pkg_en-GB\"}","","","","","0","0","","1"),
("10000","0","COM_RSGALLERY2","component","com_rsgallery2","https://raw.githubusercontent.com/RSGallery2/RSGallery2_J4/master/administrator/components/com_rsgallery2/changelog.xml","","1","1","0","0","{\"name\":\"COM_RSGALLERY2\",\"type\":\"component\",\"creationDate\":\"16. Jan. 2022\",\"author\":\"RSGallery2 Team\",\"copyright\":\"(c) 2005-2022 RSGallery2 Team\",\"authorEmail\":\"team2@rsgallery2.org\",\"authorUrl\":\"https:\\/\\/www.rsgallery2.org\",\"version\":\"5.0.0.36\",\"description\":\"COM_RSGALLERY2_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"rsgallery2\"}","{\"ToDo_list_general\":\"0\",\"sef_ids\":\"0\",\"ToDo_list_upload\":\"0\",\"image_size\":\"800,600,400\",\"thumb_size\":\"120\",\"thumb_style\":\"0\",\"jpegQuality\":\"80\",\"allowedFileTypes\":\"jpg,jpeg,gif,png\",\"keepOriginalImage\":\"1\",\"isPreSelectLatestGallery\":\"1\",\"ftp_path\":\"\",\"imgPath_root\":\"\\/images\\/rsgallery2\",\"useJ3xOldPaths\":\"0\",\"imgPath_original\":\"\\/images\\/rsgallery\\/original\",\"imgPath_display\":\"\\/images\\/rsgallery\\/display\",\"imgPath_thumb\":\"\\/images\\/rsgallery\\/thumb\",\"image_width\":\"400\",\"ToDo_list_galleries_view\":\"0\",\"galleries_column_arrangement\":\"1\",\"max_columns_in_galleries_view\":\"4\",\"galleries_row_arrangement\":\"1\",\"max_rows_in_galleries_view\":\"5\",\"max_thumbs_in_galleries_view\":\"20\",\"layout_galleries_thumbs\":\"layout02\",\"galleries_show_title\":\"0\",\"galleries_show_description\":\"layout01\",\"ToDo_list_images_view\":\"0\",\"images_column_arrangement\":\"1\",\"max_columns_in_images_view\":\"4\",\"images_row_arrangement\":\"2\",\"max_rows_in_images_view\":\"5\",\"max_images_in_images_view\":\"20\",\"layout_images_thumbs\":\"Layout of images thumbs\",\"images_show_title\":\"0\",\"images_show_description\":\"layout01\",\"j3x_db_galleries_copied\":true,\"j3x_db_images_copied\":\"0\",\"isDebugBackend\":\"0\",\"isDebugSite\":\"0\",\"isDevelop\":\"0\",\"galcountNrs\":\"5\",\"rules\":\"\"}","","","","0","0","","0"),
("10001","0","plg_behaviour_taggable","plugin","taggable","","behaviour","0","1","1","0","{\"name\":\"plg_behaviour_taggable\",\"type\":\"plugin\",\"creationDate\":\"2015-08\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2016 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"PLG_BEHAVIOUR_TAGGABLE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"taggable\"}","{}","","","","0","0","","1"),
("10002","0","plg_behaviour_versionable","plugin","versionable","","behaviour","0","1","1","0","{\"name\":\"plg_behaviour_versionable\",\"type\":\"plugin\",\"creationDate\":\"2015-08\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2016 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"PLG_BEHAVIOUR_VERSIONABLE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"versionable\"}","{}","","","","0","0","","1"),
("10003","0","atum","template","atum","","","1","1","1","0","{\"name\":\"atum\",\"type\":\"template\",\"creationDate\":\"2016-09\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2016 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"\",\"version\":\"1.0\",\"description\":\"TPL_ATUM_XML_DESCRIPTION\",\"group\":\"\",\"inheritable\":true,\"filename\":\"templateDetails\"}","{}","","","","0","0","","1"),
("10004","0","cassiopeia","template","cassiopeia","","","0","1","1","0","{\"name\":\"cassiopeia\",\"type\":\"template\",\"creationDate\":\"2017-02\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2017 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"\",\"version\":\"1.0\",\"description\":\"TPL_CASSIOPEIA_XML_DESCRIPTION\",\"group\":\"\",\"inheritable\":true,\"filename\":\"templateDetails\"}","{}","","","","0","0","","1"),
("10005","0","plg_filesystem_local","plugin","local","","filesystem","0","1","1","0","{\"name\":\"plg_filesystem_local\",\"type\":\"plugin\",\"creationDate\":\"2017-04\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2017 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"PLG_FILESYSTEM_LOCAL_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"local\"}","{}","","","","0","0","","1"),
("10006","0","plg_media-action_crop","plugin","crop","","media-action","0","1","1","0","{\"name\":\"plg_media-action_crop\",\"type\":\"plugin\",\"creationDate\":\"2017-01\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2017 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"PLG_MEDIA-ACTION_CROP_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"crop\"}","{}","","","","0","0","","1"),
("10007","0","plg_media-action_resize","plugin","resize","","media-action","0","1","1","0","{\"name\":\"plg_media-action_resize\",\"type\":\"plugin\",\"creationDate\":\"2017-01\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2017 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"PLG_MEDIA-ACTION_RESIZE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"resize\"}","{}","","","","0","0","","1"),
("10008","0","plg_media-action_rotate","plugin","rotate","","media-action","0","1","1","0","{\"name\":\"plg_media-action_rotate\",\"type\":\"plugin\",\"creationDate\":\"2017-01\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2017 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"PLG_MEDIA-ACTION_ROTATE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"rotate\"}","{}","","","","0","0","","1"),
("10009","0","plg_system_httpheaders","plugin","httpheaders","","system","0","0","1","0","{\"name\":\"plg_system_httpheaders\",\"type\":\"plugin\",\"creationDate\":\"2017-10\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2018 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"PLG_SYSTEM_HTTPHEADERS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"httpheaders\"}","{}","","","","0","0","","1"),
("10010","0","com_workflow","component","com_workflow","","","1","1","0","1","{\"name\":\"com_workflow\",\"type\":\"component\",\"creationDate\":\"2017-06\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2018 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"COM_WORKFLOW_XML_DESCRIPTION\",\"group\":\"\"}","{}","","","","0","0","","1"),
("10011","0","plg_workflow_publishing","plugin","publishing","","workflow","0","1","1","0","{\"name\":\"plg_workflow_publishing\",\"type\":\"plugin\",\"creationDate\":\"2020-03\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2020 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"PLG_WORKFLOW_PUBLISHING_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"publishing\"}","{}","","","","0","0","","0"),
("10012","0","plg_workflow_featuring","plugin","featuring","","workflow","0","1","1","0","{\"name\":\"plg_workflow_featuring\",\"type\":\"plugin\",\"creationDate\":\"2020-03\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2020 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"PLG_WORKFLOW_FEATURING_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"featuring\"}","{}","","","","0","0","","0"),
("10013","0","plg_workflow_notification","plugin","notification","","workflow","0","1","1","0","{\"name\":\"plg_workflow_notification\",\"type\":\"plugin\",\"creationDate\":\"2020-05\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2020 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"PLG_WORKFLOW_NOTIFICATION_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"notification\"}","{}","","","","0","0","","0"),
("10014","0","plg_extension_namespacemap","plugin","namespacemap","","extension","0","1","1","1","{\"name\":\"plg_extension_namespacemap\",\"type\":\"plugin\",\"creationDate\":\"2017-05\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2017 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"PLG_EXTENSION_NAMESPACEMAP_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"namespacemap\"}","","","","","0","0","","1"),
("10015","0","plg_installer_override","plugin","override","","installer","0","1","1","0","{\"name\":\"plg_installer_override\",\"type\":\"plugin\",\"creationDate\":\"2018-06\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2018 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"PLG_INSTALLER_OVERRIDE_PLUGIN_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"override\"}","","","","","4","0","","1"),
("10016","0","plg_quickicon_overridecheck","plugin","overridecheck","","quickicon","0","1","1","0","{\"name\":\"plg_quickicon_overridecheck\",\"type\":\"plugin\",\"creationDate\":\"2018-06\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2018 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"PLG_QUICKICON_OVERRIDECHECK_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"overridecheck\"}","","","","","0","0","","1"),
("10017","0","plg_extension_finder","plugin","finder","","extension","0","1","1","0","{\"name\":\"plg_extension_finder\",\"type\":\"plugin\",\"creationDate\":\"2018-06\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2019 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"PLG_EXTENSION_FINDER_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"finder\"}","","","","","0","0","","1"),
("10018","0","plg_api-authentication_basic","plugin","basic","","api-authentication","0","0","1","0","{\"name\":\"plg_api-authentication_basic\",\"type\":\"plugin\",\"creationDate\":\"2005-11\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2019 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"PLG_API-AUTHENTICATION_BASIC_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"basic\"}","{}","","","","0","0","","1"),
("10019","0","plg_webservices_content","plugin","content","","webservices","0","1","1","0","{\"name\":\"plg_webservices_content\",\"type\":\"plugin\",\"creationDate\":\"2019-09\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2019 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"PLG_WEBSERVICES_CONTENT_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"content\"}","{}","","","","0","0","","1"),
("10020","0","com_mails","component","com_mails","","","1","1","1","1","{\"name\":\"com_mails\",\"type\":\"component\",\"creationDate\":\"2019-01\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2019 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"COM_MAILS_XML_DESCRIPTION\",\"group\":\"\"}","{}","","","","0","0","","1"),
("10021","0","plg_system_skipto","plugin","skipto","","system","0","1","1","0","{\"name\":\"plg_system_skipto\",\"type\":\"plugin\",\"creationDate\":\"2020-02\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2019 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"PLG_SYSTEM_SKIPTO_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"skipto\"}","{}","","","","0","0","","1"),
("10022","0","plg_sampledata_multilang","plugin","multilang","","sampledata","0","1","1","0","{\"name\":\"plg_sampledata_multilang\",\"type\":\"plugin\",\"creationDate\":\"2018-07\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2018 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"PLG_SAMPLEDATA_MULTILANG_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"multilang\"}","{}","","","","0","0","","1"),
("10023","0","plg_installer_webinstaller","plugin","webinstaller","","installer","0","1","1","0","{\"name\":\"plg_installer_webinstaller\",\"type\":\"plugin\",\"creationDate\":\"2017-04\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2018 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"PLG_INSTALLER_WEBINSTALLER_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"webinstaller\"}","{}","","","","0","0","","1"),
("10024","0","plg_fields_subform","plugin","subform","","fields","0","1","1","0","{\"name\":\"plg_fields_subform\",\"type\":\"plugin\",\"creationDate\":\"2017-06\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2019 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"PLG_FIELDS_SUBFORM_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"subform\"}","","","","","0","0","","1"),
("10025","0","plg_system_webauthn","plugin","webauthn","","system","0","1","1","0","{\"name\":\"plg_system_webauthn\",\"type\":\"plugin\",\"creationDate\":\"2019-07-02\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2020 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"PLG_SYSTEM_WEBAUTHN_DESCRIPTION\",\"group\":\"\",\"filename\":\"webauthn\"}","{}","","","","0","0","","1"),
("10026","0","mod_loginsupport","module","mod_loginsupport","","","1","1","1","0","{\"name\":\"mod_loginsupport\",\"type\":\"module\",\"creationDate\":\"2019-06\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2019 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"MOD_LOGINSUPPORT_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_loginsupport\"}","","","","","0","0","","1"),
("10027","0","mod_frontend","module","mod_frontend","","","1","1","1","0","{\"name\":\"mod_frontend\",\"type\":\"module\",\"creationDate\":\"2019-07\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2019 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"MOD_FRONTEND_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_frontend\"}","","","","","0","0","","1"),
("10028","0","mod_messages","module","mod_messages","","","1","1","1","0","{\"name\":\"mod_messages\",\"type\":\"module\",\"creationDate\":\"2019-07\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2019 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"MOD_MESSAGES_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_messages\"}","","","","","0","0","","1"),
("10029","0","mod_post_installation_messages","module","mod_post_installation_messages","","","1","1","1","0","{\"name\":\"mod_post_installation_messages\",\"type\":\"module\",\"creationDate\":\"2019-07\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2019 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"MOD_POST_INSTALLATION_MESSAGES_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_post_installation_messages\"}","","","","","0","0","","1"),
("10030","0","mod_user","module","mod_user","","","1","1","1","0","{\"name\":\"mod_user\",\"type\":\"module\",\"creationDate\":\"2019-07\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2019 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"MOD_USER_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_user\"}","","","","","0","0","","1");
INSERT INTO j4x_extensions VALUES
("10031","0","mod_submenu","module","mod_submenu","","","1","1","1","0","{\"name\":\"mod_submenu\",\"type\":\"module\",\"creationDate\":\"2006-02\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_SUBMENU_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_submenu\"}","{}","","","","0","0","","1"),
("10032","0","mod_privacy_status","module","mod_privacy_status","","","1","1","1","0","{\"name\":\"mod_privacy_status\",\"type\":\"module\",\"creationDate\":\"2019-07\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2019 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"MOD_PRIVACY_STATUS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_privacy_status\"}","{}","","","","0","0","","1"),
("10033","0","plg_webservices_banners","plugin","banners","","webservices","0","1","1","0","{\"name\":\"plg_webservices_banners\",\"type\":\"plugin\",\"creationDate\":\"2019-09\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2019 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"PLG_WEBSERVICES_BANNERS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"banners\"}","{}","","","","0","0","","1"),
("10034","0","plg_webservices_config","plugin","config","","webservices","0","1","1","0","{\"name\":\"plg_webservices_config\",\"type\":\"plugin\",\"creationDate\":\"2019-09\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2019 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"PLG_WEBSERVICES_CONFIG_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"config\"}","{}","","","","0","0","","1"),
("10035","0","plg_webservices_contact","plugin","contact","","webservices","0","1","1","0","{\"name\":\"plg_webservices_contact\",\"type\":\"plugin\",\"creationDate\":\"2019-09\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2019 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"PLG_WEBSERVICES_CONTACT_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"contact\"}","{}","","","","0","0","","1"),
("10036","0","plg_webservices_languages","plugin","languages","","webservices","0","1","1","0","{\"name\":\"plg_webservices_languages\",\"type\":\"plugin\",\"creationDate\":\"2019-09\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2019 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"PLG_WEBSERVICES_LANGUAGES_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"languages\"}","{}","","","","0","0","","1"),
("10037","0","plg_webservices_menus","plugin","menus","","webservices","0","1","1","0","{\"name\":\"plg_webservices_menus\",\"type\":\"plugin\",\"creationDate\":\"2019-09\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2019 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"PLG_WEBSERVICES_MENUS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"menus\"}","{}","","","","0","0","","1"),
("10038","0","plg_webservices_messages","plugin","messages","","webservices","0","1","1","0","{\"name\":\"plg_webservices_messages\",\"type\":\"plugin\",\"creationDate\":\"2019-09\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2019 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"PLG_WEBSERVICES_MESSAGES_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"messages\"}","{}","","","","0","0","","1"),
("10039","0","plg_webservices_modules","plugin","modules","","webservices","0","1","1","0","{\"name\":\"plg_webservices_modules\",\"type\":\"plugin\",\"creationDate\":\"2019-09\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2019 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"PLG_WEBSERVICES_MODULES_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"modules\"}","{}","","","","0","0","","1"),
("10040","0","plg_webservices_newsfeeds","plugin","newsfeeds","","webservices","0","1","1","0","{\"name\":\"plg_webservices_newsfeeds\",\"type\":\"plugin\",\"creationDate\":\"2019-09\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2019 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"PLG_WEBSERVICES_NEWSFEEDS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"newsfeeds\"}","{}","","","","0","0","","1"),
("10041","0","plg_webservices_plugins","plugin","plugins","","webservices","0","1","1","0","{\"name\":\"plg_webservices_plugins\",\"type\":\"plugin\",\"creationDate\":\"2019-09\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2019 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"PLG_WEBSERVICES_PLUGINS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"plugins\"}","{}","","","","0","0","","1"),
("10042","0","plg_webservices_privacy","plugin","privacy","","webservices","0","1","1","0","{\"name\":\"plg_webservices_privacy\",\"type\":\"plugin\",\"creationDate\":\"2019-09\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2019 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"PLG_WEBSERVICES_PRIVACY_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"privacy\"}","{}","","","","0","0","","1"),
("10043","0","plg_webservices_redirect","plugin","redirect","","webservices","0","1","1","0","{\"name\":\"plg_webservices_redirect\",\"type\":\"plugin\",\"creationDate\":\"2019-09\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2019 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"PLG_WEBSERVICES_REDIRECT_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"redirect\"}","{}","","","","0","0","","1"),
("10044","0","plg_webservices_tags","plugin","tags","","webservices","0","1","1","0","{\"name\":\"plg_webservices_tags\",\"type\":\"plugin\",\"creationDate\":\"2019-09\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2019 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"PLG_WEBSERVICES_TAGS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"tags\"}","{}","","","","0","0","","1"),
("10045","0","plg_webservices_templates","plugin","templates","","webservices","0","1","1","0","{\"name\":\"plg_webservices_templates\",\"type\":\"plugin\",\"creationDate\":\"2019-09\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2019 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"PLG_WEBSERVICES_TEMPLATES_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"templates\"}","{}","","","","0","0","","1"),
("10046","0","plg_webservices_users","plugin","users","","webservices","0","1","1","0","{\"name\":\"plg_webservices_users\",\"type\":\"plugin\",\"creationDate\":\"2019-09\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2019 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"PLG_WEBSERVICES_USERS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"users\"}","{}","","","","0","0","","1"),
("10047","0","plg_webservices_installer","plugin","installer","","webservices","0","1","1","0","{\"name\":\"plg_webservices_installer\",\"type\":\"plugin\",\"creationDate\":\"2020-06\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2020 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"PLG_WEBSERVICES_INSTALLER_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"installer\"}","{}","","","","0","0","","0"),
("10048","0","plg_user_token","plugin","token","","user","0","1","1","0","{\"name\":\"plg_user_token\",\"type\":\"plugin\",\"creationDate\":\"2019-11\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2020 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.9.0\",\"description\":\"PLG_USER_TOKEN_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"token\"}","{}","","","","0","0","","1"),
("10049","0","plg_api-authentication_token","plugin","token","","api-authentication","0","1","1","0","{\"name\":\"plg_api-authentication_token\",\"type\":\"plugin\",\"creationDate\":\"2019-11\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2020 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"PLG_API-AUTHENTICATION_TOKEN_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"token\"}","{}","","","","0","0","","1"),
("10050","0","plg_system_accessibility","plugin","accessibility","","system","0","0","1","0","{\"name\":\"plg_system_accessibility\",\"type\":\"plugin\",\"creationDate\":\"2020-02-15\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2020 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"PLG_SYSTEM_ACCESSIBILITY_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"accessibility\"}","{}","","","","0","0","","1"),
("10051","802","English (en-GB)","language","en-GB","","","3","1","1","1","{\"name\":\"English (en-GB)\",\"type\":\"language\",\"creationDate\":\"2023-01\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2020 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.2.7\",\"description\":\"en-GB api language\",\"group\":\"\"}","","","","","0","0","","1"),
("10052","0","plg_quickicon_downloadkey","plugin","downloadkey","","quickicon","0","1","1","0","{\"name\":\"plg_quickicon_downloadkey\",\"type\":\"plugin\",\"creationDate\":\"2019-10\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2019 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"PLG_QUICKICON_DOWNLOADKEY_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"downloadkey\"}","","","","","0","0","","1"),
("10053","0","pkg_search","package","pkg_search","","","0","1","1","0","{\"name\":\"pkg_search\",\"type\":\"package\",\"creationDate\":\"2021-08-17\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2021 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"\",\"group\":\"\",\"filename\":\"pkg_search\"}","","","","","0","0","","0"),
("10054","0","com_scheduler","component","com_scheduler","","","1","1","1","0","{\"name\":\"com_scheduler\",\"type\":\"component\",\"creationDate\":\"2021-07\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2021 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.1.0\",\"description\":\"COM_SCHEDULER_XML_DESCRIPTION\",\"group\":\"\"}","{}","","","","0","0","","1"),
("10055","0","plg_system_schedulerunner","plugin","schedulerunner","","system","0","1","1","0","{\"name\":\"plg_system_schedulerunner\",\"type\":\"plugin\",\"creationDate\":\"2021-08\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2021 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.1\",\"description\":\"PLG_SYSTEM_SCHEDULERUNNER_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"schedulerunner\"}","{}","","","","15","0","","1"),
("10056","0","plg_system_task_notification","plugin","tasknotification","","system","0","1","1","0","{\"name\":\"plg_system_task_notification\",\"type\":\"plugin\",\"creationDate\":\"2021-09\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2021 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.1\",\"description\":\"PLG_SYSTEM_TASK_NOTIFICATION_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"tasknotification\"}","","","","","22","0","","1"),
("10057","0","plg_task_check_files","plugin","checkfiles","","task","0","1","1","0","{\"name\":\"plg_task_check_files\",\"type\":\"plugin\",\"creationDate\":\"2021-08\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2021 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.1\",\"description\":\"PLG_TASK_CHECK_FILES_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"checkfiles\"}","{}","","","","15","0","","1"),
("10058","0","plg_task_demo_tasks","plugin","demotasks","","task","0","1","1","0","{\"name\":\"plg_task_demo_tasks\",\"type\":\"plugin\",\"creationDate\":\"2021-07\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2021 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.1\",\"description\":\"PLG_TASK_DEMO_TASKS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"demotasks\"}","{}","","","","15","0","","1"),
("10059","0","plg_task_requests","plugin","requests","","task","0","1","1","0","{\"name\":\"plg_task_requests\",\"type\":\"plugin\",\"creationDate\":\"2021-08\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2021 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.1\",\"description\":\"PLG_TASK_REQUESTS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"requests\"}","{}","","","","15","0","","1"),
("10060","0","plg_task_site_status","plugin","sitestatus","","task","0","1","1","0","{\"name\":\"plg_task_site_status\",\"type\":\"plugin\",\"creationDate\":\"2021-08\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2021 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.1\",\"description\":\"PLG_TASK_SITE_STATUS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"sitestatus\"}","{}","","","","15","0","","1"),
("10061","0","plg_system_jooa11y","plugin","jooa11y","","system","0","1","1","0","{\"name\":\"plg_system_jooa11y\",\"type\":\"plugin\",\"creationDate\":\"2022-02\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2021 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.2.0\",\"description\":\"PLG_SYSTEM_JOOA11Y_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"jooa11y\"}","","","","","0","0","","1"),
("10062","0","plg_webservices_media","plugin","media","","webservices","0","1","1","0","{\"name\":\"plg_webservices_media\",\"type\":\"plugin\",\"creationDate\":\"2021-05\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2021 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.1.0\",\"description\":\"PLG_WEBSERVICES_MEDIA_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"media\"}","{}","","","","0","0","","1"),
("10063","0","plg_multifactorauth_totp","plugin","totp","","multifactorauth","0","0","1","0","{\"name\":\"plg_multifactorauth_totp\",\"type\":\"plugin\",\"creationDate\":\"2013-08\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2013 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.2.0\",\"description\":\"PLG_MULTIFACTORAUTH_TOTP_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"totp\"}","","","","","1","0","","1"),
("10064","0","plg_multifactorauth_yubikey","plugin","yubikey","","multifactorauth","0","0","1","0","{\"name\":\"plg_multifactorauth_yubikey\",\"type\":\"plugin\",\"creationDate\":\"2013-09\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2013 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.2.0\",\"description\":\"PLG_MULTIFACTORAUTH_YUBIKEY_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"yubikey\"}","","","","","2","0","","1"),
("10065","0","plg_multifactorauth_webauthn","plugin","webauthn","","multifactorauth","0","0","1","0","{\"name\":\"plg_multifactorauth_webauthn\",\"type\":\"plugin\",\"creationDate\":\"2022-05\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2022 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.2.0\",\"description\":\"PLG_MULTIFACTORAUTH_WEBAUTHN_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"webauthn\"}","","","","","3","0","","1"),
("10066","0","plg_multifactorauth_email","plugin","email","","multifactorauth","0","0","1","0","{\"name\":\"plg_multifactorauth_email\",\"type\":\"plugin\",\"creationDate\":\"2022-05\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2022 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.2.0\",\"description\":\"PLG_MULTIFACTORAUTH_EMAIL_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"email\"}","","","","","4","0","","1"),
("10067","0","plg_multifactorauth_fixed","plugin","fixed","","multifactorauth","0","0","1","0","{\"name\":\"plg_multifactorauth_fixed\",\"type\":\"plugin\",\"creationDate\":\"2022-05\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2022 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.2.0\",\"description\":\"PLG_MULTIFACTORAUTH_FIXED_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"fixed\"}","","","","","5","0","","1"),
("10068","0","plg_system_shortcut","plugin","shortcut","","system","0","1","1","0","{\"name\":\"plg_system_shortcut\",\"type\":\"plugin\",\"creationDate\":\"2022-06\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2022 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.2.0\",\"description\":\"PLG_SYSTEM_SHORTCUT_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"shortcut\"}","","","","","0","0","","1");




CREATE TABLE `j4x_fields` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `asset_id` int unsigned NOT NULL DEFAULT '0',
  `context` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `group_id` int unsigned NOT NULL DEFAULT '0',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `default_value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'text',
  `note` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` tinyint NOT NULL DEFAULT '0',
  `required` tinyint NOT NULL DEFAULT '0',
  `checked_out` int unsigned DEFAULT NULL,
  `checked_out_time` datetime DEFAULT NULL,
  `ordering` int NOT NULL DEFAULT '0',
  `params` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `fieldparams` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `language` char(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `created_time` datetime NOT NULL,
  `created_user_id` int unsigned NOT NULL DEFAULT '0',
  `modified_time` datetime NOT NULL,
  `modified_by` int unsigned NOT NULL DEFAULT '0',
  `access` int NOT NULL DEFAULT '1',
  `only_use_in_subform` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_state` (`state`),
  KEY `idx_created_user_id` (`created_user_id`),
  KEY `idx_access` (`access`),
  KEY `idx_context` (`context`(191)),
  KEY `idx_language` (`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;






CREATE TABLE `j4x_fields_categories` (
  `field_id` int NOT NULL DEFAULT '0',
  `category_id` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`field_id`,`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;






CREATE TABLE `j4x_fields_groups` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `asset_id` int unsigned NOT NULL DEFAULT '0',
  `context` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `note` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` tinyint NOT NULL DEFAULT '0',
  `checked_out` int unsigned DEFAULT NULL,
  `checked_out_time` datetime DEFAULT NULL,
  `ordering` int NOT NULL DEFAULT '0',
  `params` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `language` char(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `created` datetime NOT NULL,
  `created_by` int unsigned NOT NULL DEFAULT '0',
  `modified` datetime NOT NULL,
  `modified_by` int unsigned NOT NULL DEFAULT '0',
  `access` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_state` (`state`),
  KEY `idx_created_by` (`created_by`),
  KEY `idx_access` (`access`),
  KEY `idx_context` (`context`(191)),
  KEY `idx_language` (`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;






CREATE TABLE `j4x_fields_values` (
  `field_id` int unsigned NOT NULL,
  `item_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Allow references to items which have strings as ids, eg. none db systems.',
  `value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  KEY `idx_field_id` (`field_id`),
  KEY `idx_item_id` (`item_id`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;






CREATE TABLE `j4x_finder_filters` (
  `filter_id` int unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `alias` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` tinyint NOT NULL DEFAULT '1',
  `created` datetime NOT NULL,
  `created_by` int unsigned NOT NULL DEFAULT '0',
  `created_by_alias` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `modified` datetime NOT NULL,
  `modified_by` int unsigned NOT NULL DEFAULT '0',
  `checked_out` int unsigned DEFAULT NULL,
  `checked_out_time` datetime DEFAULT NULL,
  `map_count` int unsigned NOT NULL DEFAULT '0',
  `data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `params` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`filter_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;






CREATE TABLE `j4x_finder_links` (
  `link_id` int unsigned NOT NULL AUTO_INCREMENT,
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `route` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `indexdate` datetime NOT NULL,
  `md5sum` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `published` tinyint NOT NULL DEFAULT '1',
  `state` int NOT NULL DEFAULT '1',
  `access` int NOT NULL DEFAULT '0',
  `language` char(7) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `publish_start_date` datetime DEFAULT NULL,
  `publish_end_date` datetime DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `list_price` double unsigned NOT NULL DEFAULT '0',
  `sale_price` double unsigned NOT NULL DEFAULT '0',
  `type_id` int NOT NULL,
  `object` mediumblob NOT NULL,
  PRIMARY KEY (`link_id`),
  KEY `idx_type` (`type_id`),
  KEY `idx_title` (`title`(100)),
  KEY `idx_md5` (`md5sum`),
  KEY `idx_url` (`url`(75)),
  KEY `idx_published_list` (`published`,`state`,`access`,`publish_start_date`,`publish_end_date`,`list_price`),
  KEY `idx_published_sale` (`published`,`state`,`access`,`publish_start_date`,`publish_end_date`,`sale_price`),
  KEY `idx_language` (`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;






CREATE TABLE `j4x_finder_links_terms` (
  `link_id` int unsigned NOT NULL,
  `term_id` int unsigned NOT NULL,
  `weight` float unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;






CREATE TABLE `j4x_finder_logging` (
  `searchterm` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `md5sum` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `query` blob NOT NULL,
  `hits` int NOT NULL DEFAULT '1',
  `results` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`md5sum`),
  KEY `searchterm` (`searchterm`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;






CREATE TABLE `j4x_finder_taxonomy` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int unsigned NOT NULL DEFAULT '0',
  `lft` int NOT NULL DEFAULT '0',
  `rgt` int NOT NULL DEFAULT '0',
  `level` int unsigned NOT NULL DEFAULT '0',
  `path` varchar(400) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `alias` varchar(400) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `state` tinyint unsigned NOT NULL DEFAULT '1',
  `access` tinyint unsigned NOT NULL DEFAULT '1',
  `language` char(7) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `idx_state` (`state`),
  KEY `idx_access` (`access`),
  KEY `idx_path` (`path`(100)),
  KEY `idx_left_right` (`lft`,`rgt`),
  KEY `idx_alias` (`alias`(100)),
  KEY `idx_language` (`language`),
  KEY `idx_parent_published` (`parent_id`,`state`,`access`),
  KEY `idx_level` (`level`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


INSERT INTO j4x_finder_taxonomy VALUES
("1","0","0","1","0","","ROOT","root","1","1","*");




CREATE TABLE `j4x_finder_taxonomy_map` (
  `link_id` int unsigned NOT NULL,
  `node_id` int unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`node_id`),
  KEY `link_id` (`link_id`),
  KEY `node_id` (`node_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;






CREATE TABLE `j4x_finder_terms` (
  `term_id` int unsigned NOT NULL AUTO_INCREMENT,
  `term` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `stem` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `common` tinyint unsigned NOT NULL DEFAULT '0',
  `phrase` tinyint unsigned NOT NULL DEFAULT '0',
  `weight` float unsigned NOT NULL DEFAULT '0',
  `soundex` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `links` int NOT NULL DEFAULT '0',
  `language` char(7) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`term_id`),
  UNIQUE KEY `idx_term_language` (`term`,`language`),
  KEY `idx_term_phrase` (`term`,`phrase`),
  KEY `idx_stem_phrase` (`stem`,`phrase`),
  KEY `idx_soundex_phrase` (`soundex`,`phrase`),
  KEY `idx_stem` (`stem`),
  KEY `idx_language` (`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;






CREATE TABLE `j4x_finder_terms_common` (
  `term` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `language` char(7) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `custom` int NOT NULL DEFAULT '0',
  UNIQUE KEY `idx_term_language` (`term`,`language`),
  KEY `idx_lang` (`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


INSERT INTO j4x_finder_terms_common VALUES
("a","en","0"),
("about","en","0"),
("above","en","0"),
("after","en","0"),
("again","en","0"),
("against","en","0"),
("all","en","0"),
("am","en","0"),
("an","en","0"),
("and","en","0"),
("any","en","0"),
("are","en","0"),
("aren\'t","en","0"),
("as","en","0"),
("at","en","0"),
("be","en","0"),
("because","en","0"),
("been","en","0"),
("before","en","0"),
("being","en","0"),
("below","en","0"),
("between","en","0"),
("both","en","0"),
("but","en","0"),
("by","en","0"),
("can\'t","en","0"),
("cannot","en","0"),
("could","en","0"),
("couldn\'t","en","0"),
("did","en","0"),
("didn\'t","en","0"),
("do","en","0"),
("does","en","0"),
("doesn\'t","en","0"),
("doing","en","0"),
("don\'t","en","0"),
("down","en","0"),
("during","en","0"),
("each","en","0"),
("few","en","0"),
("for","en","0"),
("from","en","0"),
("further","en","0"),
("had","en","0"),
("hadn\'t","en","0"),
("has","en","0"),
("hasn\'t","en","0"),
("have","en","0"),
("haven\'t","en","0"),
("having","en","0"),
("he","en","0"),
("he\'d","en","0"),
("he\'ll","en","0"),
("he\'s","en","0"),
("her","en","0"),
("here","en","0"),
("here\'s","en","0"),
("hers","en","0"),
("herself","en","0"),
("him","en","0"),
("himself","en","0"),
("his","en","0"),
("how","en","0"),
("how\'s","en","0"),
("i","en","0"),
("i\'d","en","0"),
("i\'ll","en","0"),
("i\'m","en","0"),
("i\'ve","en","0"),
("if","en","0"),
("in","en","0"),
("into","en","0"),
("is","en","0"),
("isn\'t","en","0"),
("it","en","0"),
("it\'s","en","0"),
("its","en","0"),
("itself","en","0"),
("let\'s","en","0"),
("me","en","0"),
("more","en","0"),
("most","en","0"),
("mustn\'t","en","0"),
("my","en","0"),
("myself","en","0"),
("no","en","0"),
("nor","en","0"),
("not","en","0"),
("of","en","0"),
("off","en","0"),
("on","en","0"),
("once","en","0"),
("only","en","0"),
("or","en","0"),
("other","en","0"),
("ought","en","0"),
("our","en","0"),
("ours","en","0"),
("ourselves","en","0"),
("out","en","0");
INSERT INTO j4x_finder_terms_common VALUES
("over","en","0"),
("own","en","0"),
("same","en","0"),
("shan\'t","en","0"),
("she","en","0"),
("she\'d","en","0"),
("she\'ll","en","0"),
("she\'s","en","0"),
("should","en","0"),
("shouldn\'t","en","0"),
("so","en","0"),
("some","en","0"),
("such","en","0"),
("than","en","0"),
("that","en","0"),
("that\'s","en","0"),
("the","en","0"),
("their","en","0"),
("theirs","en","0"),
("them","en","0"),
("themselves","en","0"),
("then","en","0"),
("there","en","0"),
("there\'s","en","0"),
("these","en","0"),
("they","en","0"),
("they\'d","en","0"),
("they\'ll","en","0"),
("they\'re","en","0"),
("they\'ve","en","0"),
("this","en","0"),
("those","en","0"),
("through","en","0"),
("to","en","0"),
("too","en","0"),
("under","en","0"),
("until","en","0"),
("up","en","0"),
("very","en","0"),
("was","en","0"),
("wasn\'t","en","0"),
("we","en","0"),
("we\'d","en","0"),
("we\'ll","en","0"),
("we\'re","en","0"),
("we\'ve","en","0"),
("were","en","0"),
("weren\'t","en","0"),
("what","en","0"),
("what\'s","en","0"),
("when","en","0"),
("when\'s","en","0"),
("where","en","0"),
("where\'s","en","0"),
("which","en","0"),
("while","en","0"),
("who","en","0"),
("who\'s","en","0"),
("whom","en","0"),
("why","en","0"),
("why\'s","en","0"),
("with","en","0"),
("won\'t","en","0"),
("would","en","0"),
("wouldn\'t","en","0"),
("you","en","0"),
("you\'d","en","0"),
("you\'ll","en","0"),
("you\'re","en","0"),
("you\'ve","en","0"),
("your","en","0"),
("yours","en","0"),
("yourself","en","0"),
("yourselves","en","0");




CREATE TABLE `j4x_finder_tokens` (
  `term` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `stem` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `common` tinyint unsigned NOT NULL DEFAULT '0',
  `phrase` tinyint unsigned NOT NULL DEFAULT '0',
  `weight` float unsigned NOT NULL DEFAULT '1',
  `context` tinyint unsigned NOT NULL DEFAULT '2',
  `language` char(7) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  KEY `idx_word` (`term`),
  KEY `idx_context` (`context`),
  KEY `idx_stem` (`stem`),
  KEY `idx_language` (`language`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;






CREATE TABLE `j4x_finder_tokens_aggregate` (
  `term_id` int unsigned NOT NULL,
  `term` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `stem` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `common` tinyint unsigned NOT NULL DEFAULT '0',
  `phrase` tinyint unsigned NOT NULL DEFAULT '0',
  `term_weight` float unsigned NOT NULL DEFAULT '0',
  `context` tinyint unsigned NOT NULL DEFAULT '2',
  `context_weight` float unsigned NOT NULL DEFAULT '0',
  `total_weight` float unsigned NOT NULL DEFAULT '0',
  `language` char(7) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  KEY `token` (`term`),
  KEY `keyword_id` (`term_id`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;






CREATE TABLE `j4x_finder_types` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `mime` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `title` (`title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;






CREATE TABLE `j4x_history` (
  `version_id` int unsigned NOT NULL AUTO_INCREMENT,
  `item_id` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `version_note` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'Optional version name',
  `save_date` datetime NOT NULL,
  `editor_user_id` int unsigned NOT NULL DEFAULT '0',
  `character_count` int unsigned NOT NULL DEFAULT '0' COMMENT 'Number of characters in this version.',
  `sha1_hash` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'SHA1 hash of the version_data column.',
  `version_data` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'json-encoded string of version data',
  `keep_forever` tinyint NOT NULL DEFAULT '0' COMMENT '0=auto delete; 1=keep',
  PRIMARY KEY (`version_id`),
  KEY `idx_ucm_item_id` (`item_id`),
  KEY `idx_save_date` (`save_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;






CREATE TABLE `j4x_languages` (
  `lang_id` int unsigned NOT NULL AUTO_INCREMENT,
  `asset_id` int unsigned NOT NULL DEFAULT '0',
  `lang_code` char(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `title_native` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sef` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `metakey` text COLLATE utf8mb4_unicode_ci,
  `metadesc` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sitename` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `published` int NOT NULL DEFAULT '0',
  `access` int unsigned NOT NULL DEFAULT '0',
  `ordering` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`lang_id`),
  UNIQUE KEY `idx_sef` (`sef`),
  UNIQUE KEY `idx_langcode` (`lang_code`),
  KEY `idx_access` (`access`),
  KEY `idx_ordering` (`ordering`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


INSERT INTO j4x_languages VALUES
("1","0","en-GB","English (en-GB)","English (United Kingdom)","en","en_gb","","","","","1","1","1");




CREATE TABLE `j4x_mail_templates` (
  `template_id` varchar(127) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `extension` varchar(127) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `language` char(7) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `htmlbody` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `attachments` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `params` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`template_id`,`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


INSERT INTO j4x_mail_templates VALUES
("com_actionlogs.notification","com_actionlogs","","COM_ACTIONLOGS_EMAIL_SUBJECT","COM_ACTIONLOGS_EMAIL_BODY","COM_ACTIONLOGS_EMAIL_HTMLBODY","","{\"tags\":[\"message\",\"date\",\"extension\",\"username\"]}"),
("com_config.test_mail","com_config","","COM_CONFIG_SENDMAIL_SUBJECT","COM_CONFIG_SENDMAIL_BODY","","","{\"tags\":[\"sitename\",\"method\"]}"),
("com_contact.mail","com_contact","","COM_CONTACT_ENQUIRY_SUBJECT","COM_CONTACT_ENQUIRY_TEXT","","","{\"tags\":[\"sitename\",\"name\",\"email\",\"subject\",\"body\",\"url\",\"customfields\"]}"),
("com_contact.mail.copy","com_contact","","COM_CONTACT_COPYSUBJECT_OF","COM_CONTACT_COPYTEXT_OF","","","{\"tags\":[\"sitename\",\"name\",\"email\",\"subject\",\"body\",\"url\",\"customfields\",\"contactname\"]}"),
("com_messages.new_message","com_messages","","COM_MESSAGES_NEW_MESSAGE","COM_MESSAGES_NEW_MESSAGE_BODY","","","{\"tags\":[\"subject\",\"message\",\"fromname\",\"sitename\",\"siteurl\",\"fromemail\",\"toname\",\"toemail\"]}"),
("com_privacy.notification.admin.export","com_privacy","","COM_PRIVACY_EMAIL_ADMIN_REQUEST_SUBJECT_EXPORT_REQUEST","COM_PRIVACY_EMAIL_ADMIN_REQUEST_BODY_EXPORT_REQUEST","","","{\"tags\":[\"sitename\",\"url\",\"tokenurl\",\"formurl\",\"token\"]}"),
("com_privacy.notification.admin.remove","com_privacy","","COM_PRIVACY_EMAIL_ADMIN_REQUEST_SUBJECT_REMOVE_REQUEST","COM_PRIVACY_EMAIL_ADMIN_REQUEST_BODY_REMOVE_REQUEST","","","{\"tags\":[\"sitename\",\"url\",\"tokenurl\",\"formurl\",\"token\"]}"),
("com_privacy.notification.export","com_privacy","","COM_PRIVACY_EMAIL_REQUEST_SUBJECT_EXPORT_REQUEST","COM_PRIVACY_EMAIL_REQUEST_BODY_EXPORT_REQUEST","","","{\"tags\":[\"sitename\",\"url\",\"tokenurl\",\"formurl\",\"token\"]}"),
("com_privacy.notification.remove","com_privacy","","COM_PRIVACY_EMAIL_REQUEST_SUBJECT_REMOVE_REQUEST","COM_PRIVACY_EMAIL_REQUEST_BODY_REMOVE_REQUEST","","","{\"tags\":[\"sitename\",\"url\",\"tokenurl\",\"formurl\",\"token\"]}"),
("com_privacy.userdataexport","com_privacy","","COM_PRIVACY_EMAIL_DATA_EXPORT_COMPLETED_SUBJECT","COM_PRIVACY_EMAIL_DATA_EXPORT_COMPLETED_BODY","","","{\"tags\":[\"sitename\",\"url\"]}"),
("com_users.massmail.mail","com_users","","COM_USERS_MASSMAIL_MAIL_SUBJECT","COM_USERS_MASSMAIL_MAIL_BODY","","","{\"tags\":[\"subject\",\"body\",\"subjectprefix\",\"bodysuffix\"]}"),
("com_users.password_reset","com_users","","COM_USERS_EMAIL_PASSWORD_RESET_SUBJECT","COM_USERS_EMAIL_PASSWORD_RESET_BODY","","","{\"tags\":[\"name\",\"email\",\"sitename\",\"link_text\",\"link_html\",\"token\"]}"),
("com_users.registration.admin.new_notification","com_users","","COM_USERS_EMAIL_ACCOUNT_DETAILS","COM_USERS_EMAIL_REGISTERED_NOTIFICATION_TO_ADMIN_BODY","","","{\"tags\":[\"name\",\"sitename\",\"siteurl\",\"username\"]}"),
("com_users.registration.admin.verification_request","com_users","","COM_USERS_EMAIL_ACTIVATE_WITH_ADMIN_ACTIVATION_SUBJECT","COM_USERS_EMAIL_ACTIVATE_WITH_ADMIN_ACTIVATION_BODY","","","{\"tags\":[\"name\",\"sitename\",\"email\",\"username\",\"activate\"]}"),
("com_users.registration.user.admin_activated","com_users","","COM_USERS_EMAIL_ACTIVATED_BY_ADMIN_ACTIVATION_SUBJECT","COM_USERS_EMAIL_ACTIVATED_BY_ADMIN_ACTIVATION_BODY","","","{\"tags\":[\"name\",\"sitename\",\"siteurl\",\"username\"]}"),
("com_users.registration.user.admin_activation","com_users","","COM_USERS_EMAIL_ACCOUNT_DETAILS","COM_USERS_EMAIL_REGISTERED_WITH_ADMIN_ACTIVATION_BODY_NOPW","","","{\"tags\":[\"name\",\"sitename\",\"activate\",\"siteurl\",\"username\"]}"),
("com_users.registration.user.admin_activation_w_pw","com_users","","COM_USERS_EMAIL_ACCOUNT_DETAILS","COM_USERS_EMAIL_REGISTERED_WITH_ADMIN_ACTIVATION_BODY","","","{\"tags\":[\"name\",\"sitename\",\"activate\",\"siteurl\",\"username\",\"password_clear\"]}"),
("com_users.registration.user.registration_mail","com_users","","COM_USERS_EMAIL_ACCOUNT_DETAILS","COM_USERS_EMAIL_REGISTERED_BODY_NOPW","","","{\"tags\":[\"name\",\"sitename\",\"siteurl\",\"username\"]}"),
("com_users.registration.user.registration_mail_w_pw","com_users","","COM_USERS_EMAIL_ACCOUNT_DETAILS","COM_USERS_EMAIL_REGISTERED_BODY","","","{\"tags\":[\"name\",\"sitename\",\"siteurl\",\"username\",\"password_clear\"]}"),
("com_users.registration.user.self_activation","com_users","","COM_USERS_EMAIL_ACCOUNT_DETAILS","COM_USERS_EMAIL_REGISTERED_WITH_ACTIVATION_BODY_NOPW","","","{\"tags\":[\"name\",\"sitename\",\"activate\",\"siteurl\",\"username\"]}"),
("com_users.registration.user.self_activation_w_pw","com_users","","COM_USERS_EMAIL_ACCOUNT_DETAILS","COM_USERS_EMAIL_REGISTERED_WITH_ACTIVATION_BODY","","","{\"tags\":[\"name\",\"sitename\",\"activate\",\"siteurl\",\"username\",\"password_clear\"]}"),
("com_users.reminder","com_users","","COM_USERS_EMAIL_USERNAME_REMINDER_SUBJECT","COM_USERS_EMAIL_USERNAME_REMINDER_BODY","","","{\"tags\":[\"name\",\"username\",\"sitename\",\"email\",\"link_text\",\"link_html\"]}"),
("plg_multifactorauth_email.mail","plg_multifactorauth_email","","PLG_MULTIFACTORAUTH_EMAIL_EMAIL_SUBJECT","PLG_MULTIFACTORAUTH_EMAIL_EMAIL_BODY","","","{\"tags\":[\"code\",\"sitename\",\"siteurl\",\"username\",\"email\",\"fullname\"]}"),
("plg_system_privacyconsent.request.reminder","plg_system_privacyconsent","","PLG_SYSTEM_PRIVACYCONSENT_EMAIL_REMIND_SUBJECT","PLG_SYSTEM_PRIVACYCONSENT_EMAIL_REMIND_BODY","","","{\"tags\":[\"sitename\",\"url\",\"tokenurl\",\"formurl\",\"token\"]}"),
("plg_system_tasknotification.failure_mail","plg_system_tasknotification","","PLG_SYSTEM_TASK_NOTIFICATION_FAILURE_MAIL_SUBJECT","PLG_SYSTEM_TASK_NOTIFICATION_FAILURE_MAIL_BODY","","","{\"tags\": [\"task_id\", \"task_title\", \"exit_code\", \"exec_data_time\", \"task_output\"]}"),
("plg_system_tasknotification.fatal_recovery_mail","plg_system_tasknotification","","PLG_SYSTEM_TASK_NOTIFICATION_FATAL_MAIL_SUBJECT","PLG_SYSTEM_TASK_NOTIFICATION_FATAL_MAIL_BODY","","","{\"tags\": [\"task_id\", \"task_title\"]}"),
("plg_system_tasknotification.orphan_mail","plg_system_tasknotification","","PLG_SYSTEM_TASK_NOTIFICATION_ORPHAN_MAIL_SUBJECT","PLG_SYSTEM_TASK_NOTIFICATION_ORPHAN_MAIL_BODY","","","{\"tags\": [\"task_id\", \"task_title\"]}"),
("plg_system_tasknotification.success_mail","plg_system_tasknotification","","PLG_SYSTEM_TASK_NOTIFICATION_SUCCESS_MAIL_SUBJECT","PLG_SYSTEM_TASK_NOTIFICATION_SUCCESS_MAIL_BODY","","","{\"tags\":[\"task_id\", \"task_title\", \"exec_data_time\", \"task_output\"]}"),
("plg_system_updatenotification.mail","plg_system_updatenotification","","PLG_SYSTEM_UPDATENOTIFICATION_EMAIL_SUBJECT","PLG_SYSTEM_UPDATENOTIFICATION_EMAIL_BODY","","","{\"tags\":[\"newversion\",\"curversion\",\"sitename\",\"url\",\"link\",\"releasenews\"]}"),
("plg_user_joomla.mail","plg_user_joomla","","PLG_USER_JOOMLA_NEW_USER_EMAIL_SUBJECT","PLG_USER_JOOMLA_NEW_USER_EMAIL_BODY","","","{\"tags\":[\"name\",\"sitename\",\"url\",\"username\",\"password\",\"email\"]}");




CREATE TABLE `j4x_menu` (
  `id` int NOT NULL AUTO_INCREMENT,
  `menutype` varchar(24) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The type of menu this item belongs to. FK to #__menu_types.menutype',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The display title of the menu item.',
  `alias` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'The SEF alias of the menu item.',
  `note` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `path` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The computed path of the menu item based on the alias field.',
  `link` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The actually link the menu item refers to.',
  `type` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The type of link: Component, URL, Alias, Separator',
  `published` tinyint NOT NULL DEFAULT '0' COMMENT 'The published state of the menu link.',
  `parent_id` int unsigned NOT NULL DEFAULT '1' COMMENT 'The parent menu item in the menu tree.',
  `level` int unsigned NOT NULL DEFAULT '0' COMMENT 'The relative level in the tree.',
  `component_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'FK to #__extensions.id',
  `checked_out` int unsigned DEFAULT NULL,
  `checked_out_time` datetime DEFAULT NULL,
  `browserNav` tinyint NOT NULL DEFAULT '0' COMMENT 'The click behaviour of the link.',
  `access` int unsigned NOT NULL DEFAULT '0' COMMENT 'The access level required to view the menu item.',
  `img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The image of the menu item.',
  `template_style_id` int unsigned NOT NULL DEFAULT '0',
  `params` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'JSON encoded data for the menu item.',
  `lft` int NOT NULL DEFAULT '0' COMMENT 'Nested set lft.',
  `rgt` int NOT NULL DEFAULT '0' COMMENT 'Nested set rgt.',
  `home` tinyint unsigned NOT NULL DEFAULT '0' COMMENT 'Indicates if this menu item is the home or default page.',
  `language` char(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `client_id` tinyint NOT NULL DEFAULT '0',
  `publish_up` datetime DEFAULT NULL,
  `publish_down` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_client_id_parent_id_alias_language` (`client_id`,`parent_id`,`alias`(100),`language`),
  KEY `idx_componentid` (`component_id`,`menutype`,`published`,`access`),
  KEY `idx_menutype` (`menutype`),
  KEY `idx_left_right` (`lft`,`rgt`),
  KEY `idx_alias` (`alias`(100)),
  KEY `idx_path` (`path`(100)),
  KEY `idx_language` (`language`)
) ENGINE=InnoDB AUTO_INCREMENT=164 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


INSERT INTO j4x_menu VALUES
("1","","Menu_Item_Root","root","","","","","1","0","0","0","","","0","0","","0","","0","71","0","*","0","",""),
("2","main","com_banners","Banners","","Banners","index.php?option=com_banners","component","1","1","1","4","","","0","0","class:bookmark","0","","1","10","0","*","1","",""),
("3","main","com_banners","Banners","","Banners/Banners","index.php?option=com_banners&view=banners","component","1","2","2","4","","","0","0","class:banners","0","","2","3","0","*","1","",""),
("4","main","com_banners_categories","Categories","","Banners/Categories","index.php?option=com_categories&view=categories&extension=com_banners","component","1","2","2","6","","","0","0","class:banners-cat","0","","4","5","0","*","1","",""),
("5","main","com_banners_clients","Clients","","Banners/Clients","index.php?option=com_banners&view=clients","component","1","2","2","4","","","0","0","class:banners-clients","0","","6","7","0","*","1","",""),
("6","main","com_banners_tracks","Tracks","","Banners/Tracks","index.php?option=com_banners&view=tracks","component","1","2","2","4","","","0","0","class:banners-tracks","0","","8","9","0","*","1","",""),
("7","main","com_contact","Contacts","","Contacts","index.php?option=com_contact","component","1","1","1","8","","","0","0","class:address-book","0","","11","22","0","*","1","",""),
("8","main","com_contact_contacts","Contacts","","Contacts/Contacts","index.php?option=com_contact&view=contacts","component","1","7","2","8","","","0","0","class:contact","0","","12","13","0","*","1","",""),
("9","main","com_contact_categories","Categories","","Contacts/Categories","index.php?option=com_categories&view=categories&extension=com_contact","component","1","7","2","6","","","0","0","class:contact-cat","0","","14","15","0","*","1","",""),
("13","main","com_newsfeeds","News Feeds","","News Feeds","index.php?option=com_newsfeeds","component","1","1","1","17","","","0","0","class:rss","0","","23","28","0","*","1","",""),
("14","main","com_newsfeeds_feeds","Feeds","","News Feeds/Feeds","index.php?option=com_newsfeeds&view=newsfeeds","component","1","13","2","17","","","0","0","class:newsfeeds","0","","24","25","0","*","1","",""),
("15","main","com_newsfeeds_categories","Categories","","News Feeds/Categories","index.php?option=com_categories&view=categories&extension=com_newsfeeds","component","1","13","2","6","","","0","0","class:newsfeeds-cat","0","","26","27","0","*","1","",""),
("17","main","com_search","Basic Search","","Basic Search","index.php?option=com_search&view=searches","component","1","1","1","19","","","0","0","class:search","0","","29","30","0","*","1","",""),
("18","main","com_finder","Smart Search","","Smart Search","index.php?option=com_finder","component","1","1","1","27","","","0","0","class:search-plus","0","","31","42","0","*","1","",""),
("20","main","com_tags","Tags","","Tags","index.php?option=com_tags&view=tags","component","1","1","1","29","","","0","1","class:tags","0","","43","44","0","","1","",""),
("22","main","com_associations","Multilingual Associations","","Multilingual Associations","index.php?option=com_associations&view=associations","component","1","1","1","34","","","0","0","class:language","0","","45","46","0","*","1","",""),
("101","mainmenu","Home","home","","home","index.php?option=com_content&view=featured","component","1","1","1","22","","","0","1","","0","{\"featured_categories\":[\"\"],\"layout_type\":\"blog\",\"num_leading_articles\":\"1\",\"num_intro_articles\":\"3\",\"num_columns\":\"3\",\"num_links\":\"0\",\"multi_column_order\":\"1\",\"orderby_pri\":\"\",\"orderby_sec\":\"front\",\"order_date\":\"\",\"show_pagination\":\"2\",\"show_pagination_results\":\"1\",\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_vote\":\"\",\"show_readmore\":\"\",\"show_readmore_title\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_hits\":\"\",\"show_noauth\":\"\",\"show_feed_link\":\"1\",\"feed_summary\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"page_title\":\"\",\"show_page_heading\":1,\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}","47","48","1","*","0","",""),
("123","mainmenu","RSG2","rsg2","","rsg2","","heading","1","1","1","0","","","0","1"," ","0","{\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_image_css\":\"\",\"menu_text\":1,\"menu_show\":1}","49","56","0","*","0","",""),
("124","mainmenu","RSG2 Root gallery","rsg2-root-gallery","","rsg2/rsg2-root-gallery","index.php?option=com_rsgallery2&view=gallery&gid=0","component","1","123","2","10000","","","0","1"," ","0","{\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_image_css\":\"\",\"menu_text\":1,\"menu_show\":1,\"page_title\":\"\",\"show_page_heading\":\"\",\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}","52","53","0","*","0","",""),
("125","mainmenu","RSG2 one gallery","rsg2-one-gallery","","rsg2/rsg2-one-gallery","index.php?option=com_rsgallery2&view=gallery&gid=1","component","1","123","2","10000","","","0","1"," ","0","{\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_image_css\":\"\",\"menu_text\":1,\"menu_show\":1,\"page_title\":\"\",\"show_page_heading\":\"\",\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}","54","55","0","*","0","",""),
("126","mainmenu","RSG2 slideshow","rsg2-slideshow","","rsg2/rsg2-slideshow","index.php?option=com_rsgallery2&view=slideshow&gid=1&page=slideshow","component","1","123","2","10000","","","0","1"," ","0","{\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_image_css\":\"\",\"menu_text\":1,\"menu_show\":1,\"page_title\":\"\",\"show_page_heading\":\"\",\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}","50","51","0","*","0","",""),
("128","main","-","1675458004-2342","","Contacts/1675458004-2342","#","separator","1","7","2","33","","","0","0"," ","0","{}","16","17","0","*","1","",""),
("129","main","mod_menu_fields","contact-custom-fields","","Contacts/contact-custom-fields","index.php?option=com_fields&context=com_contact.contact","component","1","7","2","33","","","0","0"," ","0","{}","18","19","0","*","1","",""),
("130","main","mod_menu_fields_group","contact-custom-fields-group","","Contacts/contact-custom-fields-group","index.php?option=com_fields&view=groups&context=com_contact.contact","component","1","7","2","33","","","0","0"," ","0","{}","20","21","0","*","1","",""),
("131","main","-","1675458004-2363","","Smart Search/1675458004-2363","#","separator","1","18","2","27","","","0","0"," ","0","{}","32","33","0","*","1","",""),
("132","main","com_finder_index","smart-search-index","","Smart Search/smart-search-index","index.php?option=com_finder&view=index","component","1","18","2","27","","","0","0"," ","0","{}","34","35","0","*","1","",""),
("133","main","com_finder_maps","smart-search-maps","","Smart Search/smart-search-maps","index.php?option=com_finder&view=maps","component","1","18","2","27","","","0","0"," ","0","{}","36","37","0","*","1","",""),
("134","main","com_finder_filters","smart-search-filters","","Smart Search/smart-search-filters","index.php?option=com_finder&view=filters","component","1","18","2","27","","","0","0"," ","0","{}","38","39","0","*","1","",""),
("135","main","com_finder_searches","smart-search-searches","","Smart Search/smart-search-searches","index.php?option=com_finder&view=searches","component","1","18","2","27","","","0","0"," ","0","{}","40","41","0","*","1","",""),
("157","main","COM_RSGALLERY2_MENU","com-rsgallery2-menu","","com-rsgallery2-menu","index.php?option=com_rsgallery2&view=rsgallery2","component","1","1","1","10000","","","0","1","class:component","0","{\"dashboard\":\"rsgallery2\"}","57","70","0","","1","",""),
("158","main","COM_RSGALLERY2_MENU_CONTROL_PANEL","com-rsgallery2-menu-control-panel","","com-rsgallery2-menu/com-rsgallery2-menu-control-panel","index.php?option=com_rsgallery2","component","1","157","2","10000","","","0","1","class:home","0","{}","58","59","0","","1","",""),
("159","main","COM_RSGALLERY2_MENU_GALLERIES","com-rsgallery2-menu-galleries","","com-rsgallery2-menu/com-rsgallery2-menu-galleries","index.php?option=com_rsgallery2&view=galleries","component","1","157","2","10000","","","0","1","class:images","0","{\"menu-quicktask-title\":\"COM_RSGALLERY2_DASHBOARD_ADD_GALLERY\",\"menu-quicktask\":\"index.php?option=com_rsgallery2&task=gallery.add\"}","60","61","0","","1","",""),
("160","main","COM_RSGALLERY2_MENU_UPLOAD","com-rsgallery2-menu-upload","","com-rsgallery2-menu/com-rsgallery2-menu-upload","index.php?option=com_rsgallery2&view=upload","component","1","157","2","10000","","","0","1","class:upload","0","{}","62","63","0","","1","",""),
("161","main","COM_RSGALLERY2_MENU_IMAGES","com-rsgallery2-menu-images","","com-rsgallery2-menu/com-rsgallery2-menu-images","index.php?option=com_rsgallery2&view=images","component","1","157","2","10000","","","0","1","class:image","0","{}","64","65","0","","1","",""),
("162","main","COM_RSGALLERY2_MENU_CONFIG","com-rsgallery2-menu-config","","com-rsgallery2-menu/com-rsgallery2-menu-config","index.php?option=com_config&view=component&component=com_rsgallery2","component","1","157","2","10000","","","0","1","class:config","0","{}","66","67","0","","1","",""),
("163","main","COM_RSGALLERY2_MENU_MAINTENANCE","com-rsgallery2-menu-maintenance","","com-rsgallery2-menu/com-rsgallery2-menu-maintenance","index.php?option=com_rsgallery2&view=maintenance","component","1","157","2","10000","","","0","1","class:equalizer","0","{}","68","69","0","","1","","");




CREATE TABLE `j4x_menu_types` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `asset_id` int unsigned NOT NULL DEFAULT '0',
  `menutype` varchar(24) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(48) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `client_id` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_menutype` (`menutype`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


INSERT INTO j4x_menu_types VALUES
("1","0","mainmenu","Main Menu","The main menu for the site","0");




CREATE TABLE `j4x_messages` (
  `message_id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id_from` int unsigned NOT NULL DEFAULT '0',
  `user_id_to` int unsigned NOT NULL DEFAULT '0',
  `folder_id` tinyint unsigned NOT NULL DEFAULT '0',
  `date_time` datetime NOT NULL,
  `state` tinyint NOT NULL DEFAULT '0',
  `priority` tinyint unsigned NOT NULL DEFAULT '0',
  `subject` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`message_id`),
  KEY `useridto_state` (`user_id_to`,`state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;






CREATE TABLE `j4x_messages_cfg` (
  `user_id` int unsigned NOT NULL DEFAULT '0',
  `cfg_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `cfg_value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  UNIQUE KEY `idx_user_var_name` (`user_id`,`cfg_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;






CREATE TABLE `j4x_modules` (
  `id` int NOT NULL AUTO_INCREMENT,
  `asset_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'FK to the #__assets table.',
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `note` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `content` text COLLATE utf8mb4_unicode_ci,
  `ordering` int NOT NULL DEFAULT '0',
  `position` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `checked_out` int unsigned DEFAULT NULL,
  `checked_out_time` datetime DEFAULT NULL,
  `publish_up` datetime DEFAULT NULL,
  `publish_down` datetime DEFAULT NULL,
  `published` tinyint NOT NULL DEFAULT '0',
  `module` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `access` int unsigned NOT NULL DEFAULT '0',
  `showtitle` tinyint unsigned NOT NULL DEFAULT '1',
  `params` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `client_id` tinyint NOT NULL DEFAULT '0',
  `language` char(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `published` (`published`,`access`),
  KEY `newsfeeds` (`module`,`published`),
  KEY `idx_language` (`language`)
) ENGINE=InnoDB AUTO_INCREMENT=113 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


INSERT INTO j4x_modules VALUES
("1","39","Main Menu","","","1","position-7","","","","","1","mod_menu","1","1","{\"menutype\":\"mainmenu\",\"startLevel\":\"0\",\"endLevel\":\"0\",\"showAllChildren\":\"1\",\"tag_id\":\"\",\"class_sfx\":\"\",\"window_open\":\"\",\"layout\":\"\",\"moduleclass_sfx\":\"_menu\",\"cache\":\"1\",\"cache_time\":\"900\",\"cachemode\":\"itemid\"}","0","*"),
("2","40","Login","","","1","login","","","","","1","mod_login","1","1","","1","*"),
("3","41","Popular Articles","","","3","cpanel","","","","","1","mod_popular","3","1","{\"count\":\"5\",\"catid\":\"\",\"user_id\":\"0\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":\"0\"}","1","*"),
("4","42","Recently Added Articles","","","4","cpanel","","","","","1","mod_latest","3","1","{\"count\":\"5\",\"ordering\":\"c_dsc\",\"catid\":\"\",\"user_id\":\"0\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":\"0\"}","1","*"),
("8","43","Toolbar","","","1","toolbar","","","","","1","mod_toolbar","3","1","","1","*"),
("9","44","Notifications","","","3","icon","","","","","1","mod_quickicon","3","1","{\"context\":\"update_quickicon\",\"header_icon\":\"fas fa-sync\",\"show_global\":\"0\",\"show_checkin\":\"0\",\"show_cache\":\"0\",\"show_users\":\"0\",\"show_articles\":\"0\",\"show_categories\":\"0\",\"show_media\":\"0\",\"show_menuItems\":\"0\",\"show_modules\":\"0\",\"show_plugins\":\"0\",\"show_templates\":\"0\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":1,\"cache_time\":900,\"style\":\"0\",\"module_tag\":\"div\",\"bootstrap_size\":\"12\",\"header_tag\":\"h2\",\"header_class\":\"\"}","1","*"),
("10","45","Logged-in Users","","","2","cpanel","","","","","1","mod_logged","3","1","{\"count\":\"5\",\"name\":\"1\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":\"0\"}","1","*"),
("12","46","Admin Menu","","","1","menu","","","","","1","mod_menu","3","1","{\"layout\":\"\",\"moduleclass_sfx\":\"\",\"shownew\":\"1\",\"showhelp\":\"1\",\"cache\":\"0\"}","1","*"),
("13","47","Admin Submenu","","","1","submenu","","","","","1","mod_submenu","3","1","","1","*"),
("14","48","User Status","","","2","status","","","","","1","mod_status","3","1","","1","*"),
("15","49","Title","","","1","title","","","","","1","mod_title","3","1","","1","*"),
("16","50","Login Form","","","7","position-7","","","","","1","mod_login","1","1","{\"greeting\":\"1\",\"name\":\"0\"}","0","*"),
("17","51","Breadcrumbs","","","1","position-2","","","","","1","mod_breadcrumbs","1","1","{\"moduleclass_sfx\":\"\",\"showHome\":\"1\",\"homeText\":\"\",\"showComponent\":\"1\",\"separator\":\"\",\"cache\":\"0\",\"cache_time\":\"0\",\"cachemode\":\"itemid\"}","0","*"),
("79","52","Multilanguage status","","","2","status","","","","","0","mod_multilangstatus","3","1","{\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":\"0\"}","1","*"),
("86","53","Joomla Version","","","1","status","","","","","1","mod_version","3","1","{\"format\":\"short\",\"product\":\"1\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":\"0\"}","1","*"),
("87","55","Sample Data","","","0","cpanel","","","","","1","mod_sampledata","6","1","{}","1","*"),
("88","58","Latest Actions","","","0","cpanel","","","","","1","mod_latestactions","6","1","{}","1","*"),
("89","59","Privacy Dashboard","","","0","cpanel","","","","","1","mod_privacy_dashboard","6","1","{}","1","*"),
("90","0","Login Support","","","1","sidebar","","","","","1","mod_loginsupport","1","1","{\"forum_url\":\"https://forum.joomla.org/\",\"documentation_url\":\"https://docs.joomla.org/\",\"news_url\":\"https://www.joomla.org/announcements.html\",\"automatic_title\":1,\"prepare_content\":1,\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":1,\"cache_time\":900,\"module_tag\":\"div\",\"bootstrap_size\":\"0\",\"header_tag\":\"h3\",\"header_class\":\"\",\"style\":\"0\"}","1","*"),
("91","0","System Dashboard","","","1","cpanel-system","","","","","1","mod_submenu","1","0","{\"menutype\":\"*\",\"preset\":\"system\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"module_tag\":\"div\",\"bootstrap_size\":\"12\",\"header_tag\":\"h2\",\"header_class\":\"\",\"style\":\"System-none\"}","1","*"),
("92","0","Content Dashboard","","","1","cpanel-content","","","","","1","mod_submenu","1","0","{\"menutype\":\"*\",\"preset\":\"content\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"module_tag\":\"div\",\"bootstrap_size\":\"3\",\"header_tag\":\"h2\",\"header_class\":\"\",\"style\":\"System-none\"}","1","*"),
("93","0","Menus Dashboard","","","1","cpanel-menus","","","","","1","mod_submenu","1","0","{\"menutype\":\"*\",\"preset\":\"menus\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"module_tag\":\"div\",\"bootstrap_size\":\"12\",\"header_tag\":\"h2\",\"header_class\":\"\",\"style\":\"System-none\"}","1","*"),
("94","0","Components Dashboard","","","1","cpanel-components","","","","","1","mod_submenu","1","0","{\"menutype\":\"*\",\"preset\":\"components\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"module_tag\":\"div\",\"bootstrap_size\":\"12\",\"header_tag\":\"h2\",\"header_class\":\"\",\"style\":\"System-none\"}","1","*"),
("95","0","Users Dashboard","","","1","cpanel-users","","","","","1","mod_submenu","1","0","{\"menutype\":\"*\",\"preset\":\"users\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"module_tag\":\"div\",\"bootstrap_size\":\"12\",\"header_tag\":\"h2\",\"header_class\":\"\",\"style\":\"System-none\"}","1","*"),
("96","0","Popular Articles","","","3","cpanel-content","","","","","1","mod_popular","3","1","{\"count\":\"5\",\"catid\":\"\",\"user_id\":\"0\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":\"0\", \"bootstrap_size\":\"12\"}","1","*"),
("97","0","Recently Added Articles","","","4","cpanel-content","","","","","1","mod_latest","3","1","{\"count\":\"5\",\"ordering\":\"c_dsc\",\"catid\":\"\",\"user_id\":\"0\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":\"0\", \"bootstrap_size\":\"12\"}","1","*"),
("98","0","Logged-in Users","","","2","cpanel-users","","","","","1","mod_logged","3","1","{\"count\":\"5\",\"name\":\"1\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":\"0\", \"bootstrap_size\":\"12\"}","1","*"),
("99","0","Frontend Link","","","5","status","","","","","1","mod_frontend","1","1","","1","*"),
("100","0","Messages","","","4","status","","","","","1","mod_messages","3","1","","1","*"),
("101","0","Post Install Messages","","","3","status","","","","","1","mod_post_installation_messages","3","1","","1","*"),
("102","0","User Status","","","6","status","","","","","1","mod_user","3","1","","1","*"),
("103","0","Site","","","1","icon","","","","","1","mod_quickicon","1","1","{\"context\":\"site_quickicon\",\"header_icon\":\"fas fa-desktop\",\"show_users\":\"1\",\"show_articles\":\"1\",\"show_categories\":\"1\",\"show_media\":\"1\",\"show_menuItems\":\"1\",\"show_modules\":\"1\",\"show_plugins\":\"1\",\"show_templates\":\"1\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":1,\"cache_time\":900,\"style\":\"0\",\"module_tag\":\"div\",\"bootstrap_size\":\"12\",\"header_tag\":\"h2\",\"header_class\":\"\"}","1","*"),
("104","0","System","","","2","icon","","","","","1","mod_quickicon","1","1","{\"context\":\"system_quickicon\",\"header_icon\":\"fas fa-wrench\",\"show_global\":\"1\",\"show_checkin\":\"1\",\"show_cache\":\"1\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":1,\"cache_time\":900,\"style\":\"0\",\"module_tag\":\"div\",\"bootstrap_size\":\"12\",\"header_tag\":\"h2\",\"header_class\":\"\"}","1","*"),
("105","0","3rd Party","","","4","icon","","","","","1","mod_quickicon","1","1","{\"context\":\"mod_quickicon\",\"header_icon\":\"fas fa-boxes\",\"load_plugins\":\"1\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":1,\"cache_time\":900,\"style\":\"0\",\"module_tag\":\"div\",\"bootstrap_size\":\"12\",\"header_tag\":\"h2\",\"header_class\":\"\"}","1","*"),
("106","0","Help Dashboard","","","1","cpanel-help","","","","","1","mod_submenu","1","0","{\"menutype\":\"*\",\"preset\":\"help\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"style\":\"System-none\",\"module_tag\":\"div\",\"bootstrap_size\":\"0\",\"header_tag\":\"h2\",\"header_class\":\"\"}","1","*"),
("107","0","Privacy Requests","","","1","cpanel-privacy","","","","","1","mod_privacy_dashboard","1","1","{\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":1,\"cache_time\":900,\"cachemode\":\"static\",\"style\":\"0\",\"module_tag\":\"div\",\"bootstrap_size\":\"0\",\"header_tag\":\"h2\",\"header_class\":\"\"}","1","*"),
("108","0","Privacy Status","","","1","cpanel-privacy","","","","","1","mod_privacy_status","1","1","{\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":1,\"cache_time\":900,\"cachemode\":\"static\",\"style\":\"0\",\"module_tag\":\"div\",\"bootstrap_size\":\"0\",\"header_tag\":\"h2\",\"header_class\":\"\"}","1","*"),
("109","111","Rsgallery2 Dashboard","","","1","cpanel-rsgallery2","","","","","1","mod_submenu","1","0","{\"menutype\":\"*\",\"preset\":\"rsgallery2\",\"style\":\"System-none\"}","1","*"),
("110","112","Rsgallery2 Dashboard","","","2","cpanel-rsgallery2","","","","","1","mod_submenu","1","0","{\"menutype\":\"*\",\"preset\":\"rsgallery2\",\"style\":\"System-none\"}","1","*"),
("111","113","Rsgallery2 Dashboard","","","3","cpanel-rsgallery2","","","","","1","mod_submenu","1","0","{\"menutype\":\"*\",\"preset\":\"rsgallery2\",\"style\":\"System-none\"}","1","*"),
("112","114","Rsgallery2 Dashboard","","","4","cpanel-rsgallery2","","","","","1","mod_submenu","1","0","{\"menutype\":\"*\",\"preset\":\"rsgallery2\",\"style\":\"System-none\"}","1","*");




CREATE TABLE `j4x_modules_menu` (
  `moduleid` int NOT NULL DEFAULT '0',
  `menuid` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`moduleid`,`menuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


INSERT INTO j4x_modules_menu VALUES
("1","0"),
("2","0"),
("3","0"),
("4","0"),
("6","0"),
("7","0"),
("8","0"),
("9","0"),
("10","0"),
("12","0"),
("13","0"),
("14","0"),
("15","0"),
("16","0"),
("17","0"),
("79","0"),
("86","0"),
("87","0"),
("88","0"),
("89","0"),
("90","0"),
("91","0"),
("92","0"),
("93","0"),
("94","0"),
("95","0"),
("96","0"),
("97","0"),
("98","0"),
("99","0"),
("100","0"),
("101","0"),
("102","0"),
("103","0"),
("104","0"),
("105","0"),
("106","0"),
("107","0"),
("108","0"),
("109","0"),
("110","0"),
("111","0"),
("112","0");




CREATE TABLE `j4x_newsfeeds` (
  `catid` int NOT NULL DEFAULT '0',
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `alias` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `link` varchar(2048) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `published` tinyint NOT NULL DEFAULT '0',
  `numarticles` int unsigned NOT NULL DEFAULT '1',
  `cache_time` int unsigned NOT NULL DEFAULT '3600',
  `checked_out` int unsigned DEFAULT NULL,
  `checked_out_time` datetime DEFAULT NULL,
  `ordering` int NOT NULL DEFAULT '0',
  `rtl` tinyint NOT NULL DEFAULT '0',
  `access` int unsigned NOT NULL DEFAULT '0',
  `language` char(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `params` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  `created_by` int unsigned NOT NULL DEFAULT '0',
  `created_by_alias` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `modified` datetime NOT NULL,
  `modified_by` int unsigned NOT NULL DEFAULT '0',
  `metakey` text COLLATE utf8mb4_unicode_ci,
  `metadesc` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `metadata` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `publish_up` datetime DEFAULT NULL,
  `publish_down` datetime DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `version` int unsigned NOT NULL DEFAULT '1',
  `hits` int unsigned NOT NULL DEFAULT '0',
  `images` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_state` (`published`),
  KEY `idx_catid` (`catid`),
  KEY `idx_createdby` (`created_by`),
  KEY `idx_language` (`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;






CREATE TABLE `j4x_overrider` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `constant` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `string` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `file` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;






CREATE TABLE `j4x_postinstall_messages` (
  `postinstall_message_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `extension_id` bigint NOT NULL DEFAULT '700' COMMENT 'FK to #__extensions',
  `title_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'Lang key for the title',
  `description_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'Lang key for description',
  `action_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `language_extension` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'com_postinstall' COMMENT 'Extension holding lang keys',
  `language_client_id` tinyint NOT NULL DEFAULT '1',
  `type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'link' COMMENT 'Message type - message, link, action',
  `action_file` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'RAD URI to the PHP file containing action method',
  `action` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'Action method name or URL',
  `condition_file` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'RAD URI to file holding display condition method',
  `condition_method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Display condition method, must return boolean',
  `version_introduced` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '3.2.0' COMMENT 'Version when this message was introduced',
  `enabled` tinyint NOT NULL DEFAULT '1',
  PRIMARY KEY (`postinstall_message_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


INSERT INTO j4x_postinstall_messages VALUES
("2","700","COM_CPANEL_WELCOME_BEGINNERS_TITLE","COM_CPANEL_WELCOME_BEGINNERS_MESSAGE","","com_cpanel","1","message","","","","","3.2.0","1"),
("3","700","COM_CPANEL_MSG_STATS_COLLECTION_TITLE","COM_CPANEL_MSG_STATS_COLLECTION_BODY","","com_cpanel","1","message","","","admin://components/com_admin/postinstall/statscollection.php","admin_postinstall_statscollection_condition","3.5.0","1"),
("4","700","PLG_SYSTEM_UPDATENOTIFICATION_POSTINSTALL_UPDATECACHETIME","PLG_SYSTEM_UPDATENOTIFICATION_POSTINSTALL_UPDATECACHETIME_BODY","PLG_SYSTEM_UPDATENOTIFICATION_POSTINSTALL_UPDATECACHETIME_ACTION","plg_system_updatenotification","1","action","site://plugins/system/updatenotification/postinstall/updatecachetime.php","updatecachetime_postinstall_action","site://plugins/system/updatenotification/postinstall/updatecachetime.php","updatecachetime_postinstall_condition","3.6.3","1"),
("8","700","COM_ACTIONLOGS_POSTINSTALL_TITLE","COM_ACTIONLOGS_POSTINSTALL_BODY","","com_actionlogs","1","message","","","","","3.9.0","1"),
("9","700","COM_PRIVACY_POSTINSTALL_TITLE","COM_PRIVACY_POSTINSTALL_BODY","","com_privacy","1","message","","","","","3.9.0","1"),
("10","700","PLG_SYSTEM_HTTPHEADERS_POSTINSTALL_INTRODUCTION_TITLE","PLG_SYSTEM_HTTPHEADERS_POSTINSTALL_INTRODUCTION_BODY","PLG_SYSTEM_HTTPHEADERS_POSTINSTALL_INTRODUCTION_ACTION","plg_system_httpheaders","1","action","site://plugins/system/httpheaders/postinstall/introduction.php","httpheaders_postinstall_action","site://plugins/system/httpheaders/postinstall/introduction.php","httpheaders_postinstall_condition","4.0.0","1"),
("11","700","COM_USERS_POSTINSTALL_MULTIFACTORAUTH_TITLE","COM_USERS_POSTINSTALL_MULTIFACTORAUTH_BODY","COM_USERS_POSTINSTALL_MULTIFACTORAUTH_ACTION","com_users","1","action","admin://components/com_users/postinstall/multifactorauth.php","com_users_postinstall_mfa_action","admin://components/com_users/postinstall/multifactorauth.php","com_users_postinstall_mfa_condition","4.2.0","1");




CREATE TABLE `j4x_privacy_consents` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned NOT NULL DEFAULT '0',
  `state` int NOT NULL DEFAULT '1',
  `created` datetime NOT NULL,
  `subject` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `body` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remind` tinyint NOT NULL DEFAULT '0',
  `token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `idx_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;






CREATE TABLE `j4x_privacy_requests` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `requested_at` datetime NOT NULL,
  `status` tinyint NOT NULL DEFAULT '0',
  `request_type` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `confirm_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `confirm_token_created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;






CREATE TABLE `j4x_redirect_links` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `old_url` varchar(2048) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `new_url` varchar(2048) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `referer` varchar(2048) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `hits` int unsigned NOT NULL DEFAULT '0',
  `published` tinyint NOT NULL,
  `created_date` datetime NOT NULL,
  `modified_date` datetime NOT NULL,
  `header` smallint NOT NULL DEFAULT '301',
  PRIMARY KEY (`id`),
  KEY `idx_old_url` (`old_url`(100)),
  KEY `idx_link_modified` (`modified_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;






CREATE TABLE `j4x_rsg2_galleries` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `alias` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `thumb_id` int unsigned NOT NULL DEFAULT '0',
  `base_path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `note` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `params` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `published` tinyint NOT NULL DEFAULT '1',
  `publish_up` datetime DEFAULT NULL,
  `publish_down` datetime DEFAULT NULL,
  `hits` int unsigned NOT NULL DEFAULT '0',
  `checked_out` int unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime DEFAULT NULL,
  `created` datetime NOT NULL,
  `created_by` int unsigned NOT NULL DEFAULT '0',
  `created_by_alias` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `modified` datetime NOT NULL,
  `modified_by` int unsigned NOT NULL DEFAULT '0',
  `parent_id` int NOT NULL DEFAULT '0',
  `level` int NOT NULL DEFAULT '0',
  `path` varchar(400) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `lft` int NOT NULL DEFAULT '0',
  `rgt` int NOT NULL DEFAULT '0',
  `approved` tinyint unsigned NOT NULL DEFAULT '1',
  `asset_id` int NOT NULL DEFAULT '0',
  `access` int unsigned NOT NULL DEFAULT '0',
  `version` int unsigned NOT NULL DEFAULT '1',
  `sizes` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_state` (`published`),
  KEY `idx_left_right` (`lft`,`rgt`),
  KEY `idx_createdby` (`created_by`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


INSERT INTO j4x_rsg2_galleries VALUES
("1","galleries root","groot","root element of nested gallery list","0","","","","1","","","0","0","","2023-02-04 16:18:20","424","","2023-02-04 16:18:20","424","0","0","","0","9","1","0","0","1",""),
("2","Coffee","coffee","","0","","","","1","","","0","0","0000-00-00 00:00:00","2022-12-11 15:46:35","424","0","2022-12-11 15:46:35","0","1","1","","7","8","1","61","0","1",""),
("3","Coffee (2)","coffee-2","","0","","","","1","","","0","0","0000-00-00 00:00:00","2022-12-11 15:46:46","424","0","2022-12-11 15:46:46","0","1","1","","5","6","1","62","0","1",""),
("4","Lovelocks","","","0","","","","1","","","0","0","0000-00-00 00:00:00","2022-12-11 15:47:00","424","0","2022-12-11 15:47:00","0","1","1","","3","4","1","63","0","1",""),
("5","Lovelocks","","","0","","","","1","","","0","0","0000-00-00 00:00:00","2022-12-11 15:47:07","424","0","2022-12-11 15:47:07","0","1","1","","1","2","1","64","0","1","");




CREATE TABLE `j4x_rsg2_images` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `alias` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `original_path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `gallery_id` int unsigned NOT NULL DEFAULT '0',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `note` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `params` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `published` tinyint NOT NULL DEFAULT '1',
  `hits` int unsigned NOT NULL DEFAULT '0',
  `rating` int unsigned NOT NULL DEFAULT '0',
  `votes` int unsigned NOT NULL DEFAULT '0',
  `comments` int unsigned NOT NULL DEFAULT '0',
  `publish_up` datetime DEFAULT NULL,
  `publish_down` datetime DEFAULT NULL,
  `checked_out` int unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime DEFAULT NULL,
  `created` datetime NOT NULL,
  `created_by` int unsigned NOT NULL DEFAULT '0',
  `created_by_alias` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `modified` datetime NOT NULL,
  `modified_by` int unsigned NOT NULL DEFAULT '0',
  `ordering` int unsigned NOT NULL DEFAULT '0',
  `approved` tinyint unsigned NOT NULL DEFAULT '1',
  `asset_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'FK to the #__assets table.',
  `access` int NOT NULL DEFAULT '0',
  `use_j3x_location` tinyint NOT NULL DEFAULT '0',
  `sizes` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `version` int unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `idx_access` (`access`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;






CREATE TABLE `j4x_rsg2_state` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;






CREATE TABLE `j4x_rsgallery2_acl` (
  `id` int NOT NULL AUTO_INCREMENT,
  `gallery_id` int NOT NULL,
  `parent_id` int NOT NULL DEFAULT '0',
  `public_view` tinyint(1) NOT NULL DEFAULT '1',
  `public_up_mod_img` tinyint(1) NOT NULL DEFAULT '0',
  `public_del_img` tinyint(1) NOT NULL DEFAULT '0',
  `public_create_mod_gal` tinyint(1) NOT NULL DEFAULT '0',
  `public_del_gal` tinyint(1) NOT NULL DEFAULT '0',
  `public_vote_view` tinyint(1) NOT NULL DEFAULT '1',
  `public_vote_vote` tinyint(1) NOT NULL DEFAULT '0',
  `registered_view` tinyint(1) NOT NULL DEFAULT '1',
  `registered_up_mod_img` tinyint(1) NOT NULL DEFAULT '1',
  `registered_del_img` tinyint(1) NOT NULL DEFAULT '0',
  `registered_create_mod_gal` tinyint(1) NOT NULL DEFAULT '1',
  `registered_del_gal` tinyint(1) NOT NULL DEFAULT '0',
  `registered_vote_view` tinyint(1) NOT NULL DEFAULT '1',
  `registered_vote_vote` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;






CREATE TABLE `j4x_rsgallery2_comments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `user_name` varchar(100) NOT NULL,
  `user_ip` varchar(50) NOT NULL DEFAULT '0.0.0.0',
  `parent_id` int NOT NULL DEFAULT '0',
  `item_id` int NOT NULL,
  `item_table` varchar(50) DEFAULT NULL,
  `datetime` datetime NOT NULL,
  `subject` varchar(100) DEFAULT NULL,
  `comment` text NOT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '1',
  `checked_out` int NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int NOT NULL,
  `params` text,
  `hits` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;






CREATE TABLE `j4x_rsgallery2_config` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3;


INSERT INTO j4x_rsgallery2_config VALUES
("1","last_update_type","upload_drag_and_drop"),
("2","last_update_type","upload_drag_and_drop"),
("3","last_update_type","upload_drag_and_drop"),
("4","last_update_type","upload_drag_and_drop"),
("5","last_update_type","upload_drag_and_drop"),
("6","last_update_type","upload_drag_and_drop"),
("7","last_update_type","upload_drag_and_drop"),
("8","last_update_type","upload_drag_and_drop");




CREATE TABLE `j4x_rsgallery2_files` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `alias` varchar(255) NOT NULL DEFAULT '',
  `descr` text,
  `gallery_id` int unsigned NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT '',
  `hits` int unsigned NOT NULL DEFAULT '0',
  `date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `rating` int unsigned NOT NULL DEFAULT '0',
  `votes` int unsigned NOT NULL DEFAULT '0',
  `comments` int unsigned NOT NULL DEFAULT '0',
  `published` tinyint(1) NOT NULL DEFAULT '1',
  `checked_out` int NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int unsigned NOT NULL DEFAULT '0',
  `approved` tinyint unsigned NOT NULL DEFAULT '1',
  `userid` int NOT NULL,
  `params` text NOT NULL,
  `asset_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'FK to the #__assets table.',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_name` (`name`),
  KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb3;


INSERT INTO j4x_rsgallery2_files VALUES
("1","DSC_0708.jpg","dsc-0708","","1","DSC_0708","0","2022-12-11 15:47:45","0","0","0","1","0","0000-00-00 00:00:00","1","0","424","","65"),
("2","DSC_0711.jpg","dsc-0711","","1","DSC_0711","0","2022-12-11 15:47:45","0","0","0","1","0","0000-00-00 00:00:00","2","0","424","","66"),
("3","DSC_1254.jpg","dsc-1254","","1","DSC_1254","0","2022-12-11 15:47:46","0","0","0","1","0","0000-00-00 00:00:00","3","0","424","","67"),
("4","DSC_1281.jpg","dsc-1281","","1","DSC_1281","0","2022-12-11 15:47:47","0","0","0","1","0","0000-00-00 00:00:00","4","0","424","","68"),
("5","DSC_1282.jpg","dsc-1282","","1","DSC_1282","0","2022-12-11 15:47:47","0","0","0","1","0","0000-00-00 00:00:00","5","0","424","","69"),
("6","DSC_1284.jpg","dsc-1284","","1","DSC_1284","0","2022-12-11 15:47:47","0","0","0","1","0","0000-00-00 00:00:00","6","0","424","","70"),
("7","DSC_1694.jpg","dsc-1694","","1","DSC_1694","0","2022-12-11 15:47:48","0","0","0","1","0","0000-00-00 00:00:00","7","0","424","","71"),
("8","DSC_8994.jpg","dsc-8994","","1","DSC_8994","0","2022-12-11 15:47:48","0","0","0","1","0","0000-00-00 00:00:00","8","0","424","","72"),
("9","DSC_8995.jpg","dsc-8995","","1","DSC_8995","0","2022-12-11 15:47:48","0","0","0","1","0","0000-00-00 00:00:00","9","0","424","","73"),
("10","DSC_8997.jpg","dsc-8997","","1","DSC_8997","0","2022-12-11 15:47:48","0","0","0","1","0","0000-00-00 00:00:00","10","0","424","","74"),
("11","DSC_8999.jpg","dsc-8999","","1","DSC_8999","0","2022-12-11 15:47:48","0","0","0","1","0","0000-00-00 00:00:00","11","0","424","","75"),
("12","DSC_9236.jpg","dsc-9236","","1","DSC_9236","0","2022-12-11 15:47:48","0","0","0","1","0","0000-00-00 00:00:00","12","0","424","","76"),
("13","DSC_9307.jpg","dsc-9307","","1","DSC_9307","0","2022-12-11 15:47:48","0","0","0","1","0","0000-00-00 00:00:00","13","0","424","","77"),
("14","DSC_9309.jpg","dsc-9309","","1","DSC_9309","0","2022-12-11 15:47:48","0","0","0","1","0","0000-00-00 00:00:00","14","0","424","","78"),
("15","IMG_4838.jpg","img-4838","","1","IMG_4838","0","2022-12-11 15:47:49","0","0","0","1","0","0000-00-00 00:00:00","15","0","424","","79"),
("16","IMG_4846.jpg","img-4846","","1","IMG_4846","0","2022-12-11 15:47:49","0","0","0","1","0","0000-00-00 00:00:00","16","0","424","","80"),
("17","IMG_4857.jpg","img-4857","","1","IMG_4857","0","2022-12-11 15:47:49","0","0","0","1","0","0000-00-00 00:00:00","17","0","424","","81"),
("18","IMG_5254.jpg","img-5254","","1","IMG_5254","0","2022-12-11 15:47:49","0","0","0","1","0","0000-00-00 00:00:00","18","0","424","","82"),
("19","DSC_1282-2.jpg","dsc-1283","","1","DSC_1282 (2)","0","2022-12-11 15:50:52","0","0","0","1","0","0000-00-00 00:00:00","19","0","424","","83"),
("20","DSC_1284-2.jpg","dsc-1285","","1","DSC_1284 (2)","0","2022-12-11 15:50:52","0","0","0","1","0","0000-00-00 00:00:00","20","0","424","","84"),
("21","DSC_1694-2.jpg","dsc-1695","","1","DSC_1694 (2)","0","2022-12-11 15:50:52","0","0","0","1","0","0000-00-00 00:00:00","21","0","424","","85"),
("22","DSC_8994-2.jpg","dsc-8996","","1","DSC_8994 (3)","0","2022-12-11 15:50:52","0","0","0","1","0","0000-00-00 00:00:00","22","0","424","","86"),
("23","DSC_8995-2.jpg","dsc-8998","","1","DSC_8995 (4)","0","2022-12-11 15:50:52","0","0","0","1","0","0000-00-00 00:00:00","23","0","424","","87"),
("24","DSC_8997-2.jpg","dsc-9000","","1","DSC_8997 (4)","0","2022-12-11 15:50:52","0","0","0","1","0","0000-00-00 00:00:00","24","0","424","","88"),
("25","DSC_8999-2.jpg","dsc-9001","","1","DSC_8999 (3)","0","2022-12-11 15:50:53","0","0","0","1","0","0000-00-00 00:00:00","25","0","424","","89"),
("26","DSC_9236-2.jpg","dsc-9237","","1","DSC_9236 (2)","0","2022-12-11 15:50:53","0","0","0","1","0","0000-00-00 00:00:00","26","0","424","","90"),
("27","DSC_9307-2.jpg","dsc-9308","","1","DSC_9307 (2)","0","2022-12-11 15:50:53","0","0","0","1","0","0000-00-00 00:00:00","27","0","424","","91"),
("28","DSC_9309-2.jpg","dsc-9310","","1","DSC_9309 (2)","0","2022-12-11 15:50:53","0","0","0","1","0","0000-00-00 00:00:00","28","0","424","","92"),
("29","IMG_4838-2.jpg","img-4839","","1","IMG_4838 (2)","0","2022-12-11 15:50:53","0","0","0","1","0","0000-00-00 00:00:00","29","0","424","","93"),
("30","IMG_4846-2.jpg","img-4847","","1","IMG_4846 (2)","0","2022-12-11 15:50:53","0","0","0","1","0","0000-00-00 00:00:00","30","0","424","","94"),
("31","IMG_4857-2.jpg","img-4858","","1","IMG_4857 (2)","0","2022-12-11 15:50:53","0","0","0","1","0","0000-00-00 00:00:00","31","0","424","","95"),
("32","IMG_5254-2.jpg","img-5255","","1","IMG_5254 (2)","0","2022-12-11 15:50:54","0","0","0","1","0","0000-00-00 00:00:00","32","0","424","","96"),
("33","DSC_1282-3.jpg","dsc-1286","","1","DSC_1282 (5)","0","2022-12-11 15:51:11","0","0","0","1","0","0000-00-00 00:00:00","33","0","424","","97"),
("34","DSC_1284-3.jpg","dsc-1287","","1","DSC_1284 (4)","0","2022-12-11 15:51:11","0","0","0","1","0","0000-00-00 00:00:00","34","0","424","","98"),
("35","DSC_1694-3.jpg","dsc-1696","","1","DSC_1694 (3)","0","2022-12-11 15:51:11","0","0","0","1","0","0000-00-00 00:00:00","35","0","424","","99"),
("36","DSC_8994-3.jpg","dsc-9002","","1","DSC_8994 (9)","0","2022-12-11 15:51:34","0","0","0","1","0","0000-00-00 00:00:00","36","0","424","","100"),
("37","DSC_8995-3.jpg","dsc-9003","","1","DSC_8995 (9)","0","2022-12-11 15:51:48","0","0","0","1","0","0000-00-00 00:00:00","37","0","424","","101"),
("38","DSC_8997-3.jpg","dsc-9004","","1","DSC_8997 (8)","0","2022-12-11 15:51:49","0","0","0","1","0","0000-00-00 00:00:00","38","0","424","","102"),
("39","DSC_8999-3.jpg","dsc-9005","","1","DSC_8999 (7)","0","2022-12-11 15:51:51","0","0","0","1","0","0000-00-00 00:00:00","39","0","424","","103"),
("40","DSC_9236-3.jpg","dsc-9238","","1","DSC_9236 (3)","0","2022-12-11 15:51:51","0","0","0","1","0","0000-00-00 00:00:00","40","0","424","","104"),
("41","DSC_9307-3.jpg","dsc-9311","","1","DSC_9307 (5)","0","2022-12-11 15:51:51","0","0","0","1","0","0000-00-00 00:00:00","41","0","424","","105"),
("42","DSC_9309-3.jpg","dsc-9312","","1","DSC_9309 (4)","0","2022-12-11 15:51:51","0","0","0","1","0","0000-00-00 00:00:00","42","0","424","","106"),
("43","IMG_4838-3.jpg","img-4840","","1","IMG_4838 (3)","0","2022-12-11 15:51:51","0","0","0","1","0","0000-00-00 00:00:00","43","0","424","","107"),
("44","IMG_4846-3.jpg","img-4848","","1","IMG_4846 (3)","0","2022-12-11 15:51:51","0","0","0","1","0","0000-00-00 00:00:00","44","0","424","","108"),
("45","IMG_4857-3.jpg","img-4859","","1","IMG_4857 (3)","0","2022-12-11 15:51:51","0","0","0","1","0","0000-00-00 00:00:00","45","0","424","","109"),
("46","IMG_5254-3.jpg","img-5256","","1","IMG_5254 (3)","0","2022-12-11 15:51:52","0","0","0","1","0","0000-00-00 00:00:00","46","0","424","","110");




CREATE TABLE `j4x_rsgallery2_galleries` (
  `id` int NOT NULL AUTO_INCREMENT,
  `parent` int NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `alias` varchar(255) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` int unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int NOT NULL DEFAULT '0',
  `date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `hits` int NOT NULL DEFAULT '0',
  `params` text NOT NULL,
  `user` tinyint NOT NULL DEFAULT '0',
  `uid` int unsigned NOT NULL DEFAULT '0',
  `allowed` varchar(100) NOT NULL DEFAULT '0',
  `thumb_id` int unsigned NOT NULL DEFAULT '0',
  `asset_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'FK to the #__assets table.',
  `access` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;


INSERT INTO j4x_rsgallery2_galleries VALUES
("1","0","Coffee","coffee","","1","0","0000-00-00 00:00:00","4","2022-12-11 15:46:35","0","","0","424","0","0","61","1"),
("2","0","Coffee (2)","coffee-2","","1","0","0000-00-00 00:00:00","3","2022-12-11 15:46:46","0","","0","424","0","0","62","1"),
("3","0","Lovelocks","","","1","0","0000-00-00 00:00:00","2","2022-12-11 15:47:00","0","","0","424","0","0","63","1"),
("4","0","Lovelocks","","","1","0","0000-00-00 00:00:00","1","2022-12-11 15:47:07","0","","0","424","0","0","64","1");




CREATE TABLE `j4x_scheduler_tasks` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `asset_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'FK to the #__assets table.',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `type` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'unique identifier for job defined by plugin',
  `execution_rules` text COLLATE utf8mb4_unicode_ci COMMENT 'Execution Rules, Unprocessed',
  `cron_rules` text COLLATE utf8mb4_unicode_ci COMMENT 'Processed execution rules, crontab-like JSON form',
  `state` tinyint NOT NULL DEFAULT '0',
  `last_exit_code` int NOT NULL DEFAULT '0' COMMENT 'Exit code when job was last run',
  `last_execution` datetime DEFAULT NULL COMMENT 'Timestamp of last run',
  `next_execution` datetime DEFAULT NULL COMMENT 'Timestamp of next (planned) run, referred for execution on trigger',
  `times_executed` int DEFAULT '0' COMMENT 'Count of successful triggers',
  `times_failed` int DEFAULT '0' COMMENT 'Count of failures',
  `locked` datetime DEFAULT NULL,
  `priority` smallint NOT NULL DEFAULT '0',
  `ordering` int NOT NULL DEFAULT '0' COMMENT 'Configurable list ordering',
  `cli_exclusive` smallint NOT NULL DEFAULT '0' COMMENT 'If 1, the task is only accessible via CLI',
  `params` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `note` text COLLATE utf8mb4_unicode_ci,
  `created` datetime NOT NULL,
  `created_by` int unsigned NOT NULL DEFAULT '0',
  `checked_out` int unsigned DEFAULT NULL,
  `checked_out_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_type` (`type`),
  KEY `idx_state` (`state`),
  KEY `idx_last_exit` (`last_exit_code`),
  KEY `idx_next_exec` (`next_execution`),
  KEY `idx_locked` (`locked`),
  KEY `idx_priority` (`priority`),
  KEY `idx_cli_exclusive` (`cli_exclusive`),
  KEY `idx_checked_out` (`checked_out`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;






CREATE TABLE `j4x_schemas` (
  `extension_id` int NOT NULL,
  `version_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`extension_id`,`version_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


INSERT INTO j4x_schemas VALUES
("700","4.2.7-2022-12-29"),
("10000","5.0.0");




CREATE TABLE `j4x_session` (
  `session_id` varbinary(192) NOT NULL,
  `client_id` tinyint unsigned DEFAULT NULL,
  `guest` tinyint unsigned DEFAULT '1',
  `time` int NOT NULL DEFAULT '0',
  `data` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `userid` int DEFAULT '0',
  `username` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '',
  PRIMARY KEY (`session_id`),
  KEY `userid` (`userid`),
  KEY `time` (`time`),
  KEY `client_id_guest` (`client_id`,`guest`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


INSERT INTO j4x_session VALUES
("adbq1khtuf258aaab1m57ku55t","0","1","1675525850","joomla|s:956:\"TzoyNDoiSm9vbWxhXFJlZ2lzdHJ5XFJlZ2lzdHJ5IjozOntzOjc6IgAqAGRhdGEiO086ODoic3RkQ2xhc3MiOjM6e3M6OToiX19kZWZhdWx0IjtPOjg6InN0ZENsYXNzIjozOntzOjc6InNlc3Npb24iO086ODoic3RkQ2xhc3MiOjM6e3M6NzoiY291bnRlciI7aToxO3M6NToidGltZXIiO086ODoic3RkQ2xhc3MiOjM6e3M6NToic3RhcnQiO2k6MTY3NTQ1NzY2MztzOjQ6Imxhc3QiO2k6MTY3NTQ1NzY2MztzOjM6Im5vdyI7aToxNjc1NDU3NjYzO31zOjU6InRva2VuIjtzOjMyOiJRcElBV2VEVDVCQzU1T3Z3MGxPOERYT2w1eFdkNFB2WSI7fXM6ODoicmVnaXN0cnkiO086MjQ6Ikpvb21sYVxSZWdpc3RyeVxSZWdpc3RyeSI6Mzp7czo3OiIAKgBkYXRhIjtPOjg6InN0ZENsYXNzIjowOnt9czoxNDoiACoAaW5pdGlhbGl6ZWQiO2I6MDtzOjk6InNlcGFyYXRvciI7czoxOiIuIjt9czo0OiJ1c2VyIjtPOjIwOiJKb29tbGFcQ01TXFVzZXJcVXNlciI6MTp7czoyOiJpZCI7aTowO319czo3OiJzZXNzaW9uIjtPOjg6InN0ZENsYXNzIjoyOntzOjc6ImNvdW50ZXIiO2k6MztzOjU6InRpbWVyIjtPOjg6InN0ZENsYXNzIjoyOntzOjQ6Imxhc3QiO2k6MTY3NTQ2MDE2MDtzOjM6Im5vdyI7aToxNjc1NTI1ODQ5O319czoyMjoiUEhQREVCVUdCQVJfU1RBQ0tfREFUQSI7YTowOnt9fXM6MTQ6IgAqAGluaXRpYWxpemVkIjtiOjA7czo5OiJzZXBhcmF0b3IiO3M6MToiLiI7fQ==\";","0",""),
("psbnhl5mvcmspvolnj5cohd4bn","1","0","1675527552","joomla|s:2072:\"TzoyNDoiSm9vbWxhXFJlZ2lzdHJ5XFJlZ2lzdHJ5IjozOntzOjc6IgAqAGRhdGEiO086ODoic3RkQ2xhc3MiOjY6e3M6OToiX19kZWZhdWx0IjtPOjg6InN0ZENsYXNzIjo0OntzOjc6InNlc3Npb24iO086ODoic3RkQ2xhc3MiOjM6e3M6NzoiY291bnRlciI7aToxNjtzOjU6InRpbWVyIjtPOjg6InN0ZENsYXNzIjozOntzOjU6InN0YXJ0IjtpOjE2NzU0NTU1Nzc7czo0OiJsYXN0IjtpOjE2NzU0NTc5MzI7czozOiJub3ciO2k6MTY3NTQ1Nzk0NDt9czo1OiJ0b2tlbiI7czozMjoibXFmMVFNeElqYzJFSVNSOXBVU04wODRnYnl3eTllNkoiO31zOjg6InJlZ2lzdHJ5IjtPOjI0OiJKb29tbGFcUmVnaXN0cnlcUmVnaXN0cnkiOjM6e3M6NzoiACoAZGF0YSI7Tzo4OiJzdGRDbGFzcyI6NDp7czo5OiJjb21fbWVudXMiO086ODoic3RkQ2xhc3MiOjE6e3M6NToiaXRlbXMiO086ODoic3RkQ2xhc3MiOjQ6e3M6ODoibWVudXR5cGUiO3M6ODoibWFpbm1lbnUiO3M6OToiY2xpZW50X2lkIjtpOjA7czoxMDoibGltaXRzdGFydCI7aTowO3M6NDoibGlzdCI7YTo0OntzOjk6ImRpcmVjdGlvbiI7czozOiJhc2MiO3M6NToibGltaXQiO3M6MjoiMjAiO3M6ODoib3JkZXJpbmciO3M6NToiYS5sZnQiO3M6NToic3RhcnQiO2Q6MDt9fX1zOjEzOiJjb21faW5zdGFsbGVyIjtPOjg6InN0ZENsYXNzIjozOntzOjc6Im1lc3NhZ2UiO3M6MDoiIjtzOjE3OiJleHRlbnNpb25fbWVzc2FnZSI7czowOiIiO3M6MTI6InJlZGlyZWN0X3VybCI7Tjt9czoxMDoiY29tX2NvbmZpZyI7Tzo4OiJzdGRDbGFzcyI6MTp7czo2OiJjb25maWciO086ODoic3RkQ2xhc3MiOjE6e3M6NjoiZ2xvYmFsIjtPOjg6InN0ZENsYXNzIjoxOntzOjQ6ImRhdGEiO047fX19czoxNjoiY29tX2pvb21sYXVwZGF0ZSI7Tzo4OiJzdGRDbGFzcyI6NDp7czo0OiJmaWxlIjtOO3M6MTA6Im9sZHZlcnNpb24iO047czo4OiJwYXNzd29yZCI7czozMjoidzFSU0diQ25KS3VKUkUxUkh4aG9ZRHZEaUhmNk5zMkIiO3M6ODoiZmlsZXNpemUiO2k6MjgwNjAzNjA7fX1zOjE0OiIAKgBpbml0aWFsaXplZCI7YjowO3M6OToic2VwYXJhdG9yIjtzOjE6Ii4iO31zOjQ6InVzZXIiO086MjA6Ikpvb21sYVxDTVNcVXNlclxVc2VyIjoxOntzOjI6ImlkIjtpOjQyNDt9czoxMToiYXBwbGljYXRpb24iO086ODoic3RkQ2xhc3MiOjE6e3M6NToicXVldWUiO2E6MDp7fX19czo3OiJzZXNzaW9uIjtPOjg6InN0ZENsYXNzIjoyOntzOjc6ImNvdW50ZXIiO2k6NzY7czo1OiJ0aW1lciI7Tzo4OiJzdGRDbGFzcyI6Mjp7czo0OiJsYXN0IjtpOjE2NzU1Mjc0OTI7czozOiJub3ciO2k6MTY3NTUyNzU1Mjt9fXM6ODoib3ZlcnJpZGUiO086ODoic3RkQ2xhc3MiOjA6e31zOjk6ImNvbV91c2VycyI7Tzo4OiJzdGRDbGFzcyI6MTp7czoxMToibWZhX2NoZWNrZWQiO2k6MTt9czoxMToiYXBwbGljYXRpb24iO086ODoic3RkQ2xhc3MiOjE6e3M6NToicXVldWUiO2E6MDp7fX1zOjIyOiJQSFBERUJVR0JBUl9TVEFDS19EQVRBIjthOjA6e319czoxNDoiACoAaW5pdGlhbGl6ZWQiO2I6MDtzOjk6InNlcGFyYXRvciI7czoxOiIuIjt9\";","424","finnern");




CREATE TABLE `j4x_tags` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int unsigned NOT NULL DEFAULT '0',
  `lft` int NOT NULL DEFAULT '0',
  `rgt` int NOT NULL DEFAULT '0',
  `level` int unsigned NOT NULL DEFAULT '0',
  `path` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `alias` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `note` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `published` tinyint NOT NULL DEFAULT '0',
  `checked_out` int unsigned DEFAULT NULL,
  `checked_out_time` datetime DEFAULT NULL,
  `access` int unsigned NOT NULL DEFAULT '0',
  `params` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `metadesc` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The meta description for the page.',
  `metakey` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `metadata` varchar(2048) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'JSON encoded metadata properties.',
  `created_user_id` int unsigned NOT NULL DEFAULT '0',
  `created_time` datetime NOT NULL,
  `created_by_alias` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `modified_user_id` int unsigned NOT NULL DEFAULT '0',
  `modified_time` datetime NOT NULL,
  `images` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `urls` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `hits` int unsigned NOT NULL DEFAULT '0',
  `language` char(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `version` int unsigned NOT NULL DEFAULT '1',
  `publish_up` datetime DEFAULT NULL,
  `publish_down` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tag_idx` (`published`,`access`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_path` (`path`(100)),
  KEY `idx_left_right` (`lft`,`rgt`),
  KEY `idx_alias` (`alias`(100)),
  KEY `idx_language` (`language`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


INSERT INTO j4x_tags VALUES
("1","0","0","1","0","","ROOT","root","","","1","","","1","","","","","424","2022-12-11 09:40:03","","424","2022-12-11 09:40:03","","","0","*","1","","");




CREATE TABLE `j4x_template_overrides` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `template` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `hash_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `extension_id` int DEFAULT '0',
  `state` tinyint NOT NULL DEFAULT '0',
  `action` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `client_id` tinyint unsigned NOT NULL DEFAULT '0',
  `created_date` datetime NOT NULL,
  `modified_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_template` (`template`),
  KEY `idx_extension_id` (`extension_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;






CREATE TABLE `j4x_template_styles` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `template` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `client_id` tinyint unsigned NOT NULL DEFAULT '0',
  `home` char(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `inheritable` tinyint NOT NULL DEFAULT '0',
  `parent` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '',
  `params` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_template` (`template`),
  KEY `idx_client_id` (`client_id`),
  KEY `idx_client_id_home` (`client_id`,`home`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


INSERT INTO j4x_template_styles VALUES
("9","atum","1","1","Atum - Default","1","","{\"hue\":\"hsl(214, 63%, 20%)\",\"bg-light\":\"#f0f4fb\",\"text-dark\":\"#495057\",\"text-light\":\"#ffffff\",\"link-color\":\"#2a69b8\",\"special-color\":\"#001b4c\",\"monochrome\":\"0\",\"loginLogo\":\"\",\"loginLogoAlt\":\"\",\"logoBrandLarge\":\"\",\"logoBrandLargeAlt\":\"\",\"logoBrandSmall\":\"\",\"logoBrandSmallAlt\":\"\"}"),
("10","cassiopeia","0","1","Cassiopeia - Default","1","","{}");




CREATE TABLE `j4x_ucm_base` (
  `ucm_id` int unsigned NOT NULL,
  `ucm_item_id` int NOT NULL,
  `ucm_type_id` int NOT NULL,
  `ucm_language_id` int NOT NULL,
  PRIMARY KEY (`ucm_id`),
  KEY `idx_ucm_item_id` (`ucm_item_id`),
  KEY `idx_ucm_type_id` (`ucm_type_id`),
  KEY `idx_ucm_language_id` (`ucm_language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;






CREATE TABLE `j4x_ucm_content` (
  `core_content_id` int unsigned NOT NULL AUTO_INCREMENT,
  `core_type_alias` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'FK to the content types table',
  `core_title` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `core_alias` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `core_body` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `core_state` tinyint NOT NULL DEFAULT '0',
  `core_checked_out_time` datetime DEFAULT NULL,
  `core_checked_out_user_id` int unsigned DEFAULT NULL,
  `core_access` int unsigned NOT NULL DEFAULT '0',
  `core_params` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `core_featured` tinyint unsigned NOT NULL DEFAULT '0',
  `core_metadata` varchar(2048) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'JSON encoded metadata properties.',
  `core_created_user_id` int unsigned NOT NULL DEFAULT '0',
  `core_created_by_alias` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `core_created_time` datetime NOT NULL,
  `core_modified_user_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Most recent user that modified',
  `core_modified_time` datetime NOT NULL,
  `core_language` char(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `core_publish_up` datetime DEFAULT NULL,
  `core_publish_down` datetime DEFAULT NULL,
  `core_content_item_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'ID from the individual type table',
  `asset_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'FK to the #__assets table.',
  `core_images` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `core_urls` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `core_hits` int unsigned NOT NULL DEFAULT '0',
  `core_version` int unsigned NOT NULL DEFAULT '1',
  `core_ordering` int NOT NULL DEFAULT '0',
  `core_metakey` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `core_metadesc` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `core_catid` int unsigned NOT NULL DEFAULT '0',
  `core_xreference` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'A reference to enable linkages to external data sets.',
  `core_type_id` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`core_content_id`),
  KEY `tag_idx` (`core_state`,`core_access`),
  KEY `idx_access` (`core_access`),
  KEY `idx_alias` (`core_alias`(100)),
  KEY `idx_language` (`core_language`),
  KEY `idx_title` (`core_title`(100)),
  KEY `idx_modified_time` (`core_modified_time`),
  KEY `idx_created_time` (`core_created_time`),
  KEY `idx_content_type` (`core_type_alias`(100)),
  KEY `idx_core_modified_user_id` (`core_modified_user_id`),
  KEY `idx_core_checked_out_user_id` (`core_checked_out_user_id`),
  KEY `idx_core_created_user_id` (`core_created_user_id`),
  KEY `idx_core_type_id` (`core_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Contains core content data in name spaced fields';






CREATE TABLE `j4x_update_sites` (
  `update_site_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '',
  `type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '',
  `location` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `enabled` int DEFAULT '0',
  `last_check_timestamp` bigint DEFAULT '0',
  `extra_query` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '',
  `checked_out` int unsigned DEFAULT NULL,
  `checked_out_time` datetime DEFAULT NULL,
  PRIMARY KEY (`update_site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Update Sites';


INSERT INTO j4x_update_sites VALUES
("1","Joomla! Core","collection","https://update.joomla.org/core/sts/list_sts.xml","1","1675525850","","",""),
("2","Accredited Joomla! Translations","collection","https://update.joomla.org/language/translationlist_4.xml","1","1675457768","","",""),
("3","Joomla! Update Component","extension","https://update.joomla.org/core/extensions/com_joomlaupdate.xml","1","1675458579","","",""),
("4","Github RSGallery2 component updates","extension","http://releases.rsgallery2.org/RSG2_component_update.xml","1","1675457768","","",""),
("5","Github RSGallery2 component updates","extension","https://raw.githubusercontent.com/RSGallery2/RSGallery2_Project/master/UpdateServer/RSG2_component_update.xml","1","1675457768","","",""),
("6","Search Update Site","extension","https://raw.githubusercontent.com/joomla-extensions/search/main/manifest.xml","1","1675458680","","","");




CREATE TABLE `j4x_update_sites_extensions` (
  `update_site_id` int NOT NULL DEFAULT '0',
  `extension_id` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`update_site_id`,`extension_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Links extensions to update sites';


INSERT INTO j4x_update_sites_extensions VALUES
("1","700"),
("2","802"),
("3","28"),
("4","10000"),
("5","10000"),
("6","10053");




CREATE TABLE `j4x_updates` (
  `update_id` int NOT NULL AUTO_INCREMENT,
  `update_site_id` int DEFAULT '0',
  `extension_id` int DEFAULT '0',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `element` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '',
  `type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '',
  `folder` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '',
  `client_id` tinyint DEFAULT '0',
  `version` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '',
  `data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `detailsurl` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `infourl` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `changelogurl` text COLLATE utf8mb4_unicode_ci,
  `extra_query` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '',
  PRIMARY KEY (`update_id`)
) ENGINE=InnoDB AUTO_INCREMENT=236 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Available Updates';


INSERT INTO j4x_updates VALUES
("156","2","0","Afrikaans","","pkg_af-ZA","package","","0","3.9.16.1","","https://update.joomla.org/language/details3/af-ZA_details.xml","","",""),
("157","2","0","Albanian","","pkg_sq-AL","package","","0","3.1.1.2","","https://update.joomla.org/language/details3/sq-AL_details.xml","","",""),
("158","2","0","Arabic Unitag","","pkg_ar-AA","package","","0","3.9.27.1","","https://update.joomla.org/language/details3/ar-AA_details.xml","","",""),
("159","2","0","Armenian","","pkg_hy-AM","package","","0","3.4.4.1","","https://update.joomla.org/language/details3/hy-AM_details.xml","","",""),
("160","2","0","Basque","","pkg_eu-ES","package","","0","3.9.24.1","","https://update.joomla.org/language/details3/eu-ES_details.xml","","",""),
("161","2","0","Belarusian","","pkg_be-BY","package","","0","3.2.1.2","","https://update.joomla.org/language/details3/be-BY_details.xml","","",""),
("162","2","0","Bengali, Bangladesh","","pkg_bn-BD","package","","0","3.8.10.1","","https://update.joomla.org/language/details3/bn-BD_details.xml","","",""),
("163","2","0","Bosnian","","pkg_bs-BA","package","","0","3.9.24.1","","https://update.joomla.org/language/details3/bs-BA_details.xml","","",""),
("164","2","0","Bulgarian","","pkg_bg-BG","package","","0","3.6.5.2","","https://update.joomla.org/language/details3/bg-BG_details.xml","","",""),
("165","2","0","Catalan","","pkg_ca-ES","package","","0","3.9.23.1","","https://update.joomla.org/language/details3/ca-ES_details.xml","","",""),
("166","2","0","Chinese, Simplified","","pkg_zh-CN","package","","0","3.10.6.1","","https://update.joomla.org/language/details3/zh-CN_details.xml","","",""),
("167","2","0","Chinese, Traditional","","pkg_zh-TW","package","","0","3.8.0.1","","https://update.joomla.org/language/details3/zh-TW_details.xml","","",""),
("168","2","0","Croatian","","pkg_hr-HR","package","","0","3.10.11.1","","https://update.joomla.org/language/details3/hr-HR_details.xml","","",""),
("169","2","0","Czech","","pkg_cs-CZ","package","","0","3.10.11.1","","https://update.joomla.org/language/details3/cs-CZ_details.xml","","",""),
("170","2","0","Danish","","pkg_da-DK","package","","0","3.10.10.1","","https://update.joomla.org/language/details3/da-DK_details.xml","","",""),
("171","2","0","Dari Persian","","pkg_prs-AF","package","","0","3.4.4.3","","https://update.joomla.org/language/details3/prs-AF_details.xml","","",""),
("172","2","0","Dutch","","pkg_nl-NL","package","","0","3.10.11.1","","https://update.joomla.org/language/details3/nl-NL_details.xml","","",""),
("173","2","0","Dzongkha","","pkg_dz-BT","package","","0","3.6.2.1","","https://update.joomla.org/language/details3/dz-BT_details.xml","","",""),
("174","2","0","English, Australia","","pkg_en-AU","package","","0","3.9.28.1","","https://update.joomla.org/language/details3/en-AU_details.xml","","",""),
("175","2","0","English, Canada","","pkg_en-CA","package","","0","3.9.28.1","","https://update.joomla.org/language/details3/en-CA_details.xml","","",""),
("176","2","0","English, New Zealand","","pkg_en-NZ","package","","0","3.9.28.1","","https://update.joomla.org/language/details3/en-NZ_details.xml","","",""),
("177","2","0","English, USA","","pkg_en-US","package","","0","3.9.28.1","","https://update.joomla.org/language/details3/en-US_details.xml","","",""),
("178","2","0","Esperanto","","pkg_eo-XX","package","","0","3.8.11.1","","https://update.joomla.org/language/details3/eo-XX_details.xml","","",""),
("179","2","0","Estonian","","pkg_et-EE","package","","0","3.9.21.1","","https://update.joomla.org/language/details3/et-EE_details.xml","","",""),
("180","2","0","Finnish","","pkg_fi-FI","package","","0","3.9.16.1","","https://update.joomla.org/language/details3/fi-FI_details.xml","","",""),
("181","2","0","Flemish","","pkg_nl-BE","package","","0","3.10.11.1","","https://update.joomla.org/language/details3/nl-BE_details.xml","","",""),
("182","2","0","French","","pkg_fr-FR","package","","0","3.10.11.1","","https://update.joomla.org/language/details3/fr-FR_details.xml","","",""),
("183","2","0","French, Canada","","pkg_fr-CA","package","","0","3.6.5.1","","https://update.joomla.org/language/details3/fr-CA_details.xml","","",""),
("184","2","0","Galician","","pkg_gl-ES","package","","0","3.3.1.2","","https://update.joomla.org/language/details3/gl-ES_details.xml","","",""),
("185","2","0","Georgian","","pkg_ka-GE","package","","0","3.10.11.1","","https://update.joomla.org/language/details3/ka-GE_details.xml","","",""),
("186","2","0","German","","pkg_de-DE","package","","0","3.10.11.1","","https://update.joomla.org/language/details3/de-DE_details.xml","","",""),
("187","2","0","German, Austria","","pkg_de-AT","package","","0","3.10.11.1","","https://update.joomla.org/language/details3/de-AT_details.xml","","",""),
("188","2","0","German, Liechtenstein","","pkg_de-LI","package","","0","3.10.11.1","","https://update.joomla.org/language/details3/de-LI_details.xml","","",""),
("189","2","0","German, Luxembourg","","pkg_de-LU","package","","0","3.10.11.1","","https://update.joomla.org/language/details3/de-LU_details.xml","","",""),
("190","2","0","German, Switzerland","","pkg_de-CH","package","","0","3.10.11.1","","https://update.joomla.org/language/details3/de-CH_details.xml","","",""),
("191","2","0","Greek","","pkg_el-GR","package","","0","3.10.11.1","","https://update.joomla.org/language/details3/el-GR_details.xml","","",""),
("192","2","0","Hebrew","","pkg_he-IL","package","","0","3.1.1.2","","https://update.joomla.org/language/details3/he-IL_details.xml","","",""),
("193","2","0","Hindi, India","","pkg_hi-IN","package","","0","3.3.6.2","","https://update.joomla.org/language/details3/hi-IN_details.xml","","",""),
("194","2","0","Hungarian","","pkg_hu-HU","package","","0","3.10.11.1","","https://update.joomla.org/language/details3/hu-HU_details.xml","","",""),
("195","2","0","Indonesian, Bahasa Indonesia","","pkg_id-ID","package","","0","3.6.2.1","","https://update.joomla.org/language/details3/id-ID_details.xml","","",""),
("196","2","0","Irish","","pkg_ga-IE","package","","0","3.8.13.1","","https://update.joomla.org/language/details3/ga-IE_details.xml","","",""),
("197","2","0","Italian","","pkg_it-IT","package","","0","3.10.11.2","","https://update.joomla.org/language/details3/it-IT_details.xml","","",""),
("198","2","0","Japanese","","pkg_ja-JP","package","","0","3.10.11.1","","https://update.joomla.org/language/details3/ja-JP_details.xml","","",""),
("199","2","0","Kazakh","","pkg_kk-KZ","package","","0","3.9.23.1","","https://update.joomla.org/language/details3/kk-KZ_details.xml","","",""),
("200","2","0","Khmer","","pkg_km-KH","package","","0","3.4.5.1","","https://update.joomla.org/language/details3/km-KH_details.xml","","",""),
("201","2","0","Korean","","pkg_ko-KR","package","","0","3.8.9.1","","https://update.joomla.org/language/details3/ko-KR_details.xml","","",""),
("202","2","0","Latvian","","pkg_lv-LV","package","","0","3.9.25.2","","https://update.joomla.org/language/details3/lv-LV_details.xml","","",""),
("203","2","0","Lithuanian","","pkg_lt-LT","package","","0","3.9.16.1","","https://update.joomla.org/language/details3/lt-LT_details.xml","","",""),
("204","2","0","Macedonian","","pkg_mk-MK","package","","0","3.6.5.1","","https://update.joomla.org/language/details3/mk-MK_details.xml","","",""),
("205","2","0","Malay","","pkg_ms-MY","package","","0","3.4.1.2","","https://update.joomla.org/language/details3/ms-MY_details.xml","","",""),
("206","2","0","Montenegrin","","pkg_srp-ME","package","","0","3.3.1.2","","https://update.joomla.org/language/details3/srp-ME_details.xml","","",""),
("207","2","0","Norwegian Bokmål","","pkg_nb-NO","package","","0","3.10.0.1","","https://update.joomla.org/language/details3/nb-NO_details.xml","","",""),
("208","2","0","Norwegian Nynorsk","","pkg_nn-NO","package","","0","3.4.2.1","","https://update.joomla.org/language/details3/nn-NO_details.xml","","",""),
("209","2","0","Persian Farsi","","pkg_fa-IR","package","","0","3.10.11.2","","https://update.joomla.org/language/details3/fa-IR_details.xml","","",""),
("210","2","0","Polish","","pkg_pl-PL","package","","0","3.10.10.1","","https://update.joomla.org/language/details3/pl-PL_details.xml","","",""),
("211","2","0","Portuguese, Brazil","","pkg_pt-BR","package","","0","3.9.21.1","","https://update.joomla.org/language/details3/pt-BR_details.xml","","",""),
("212","2","0","Portuguese, Portugal","","pkg_pt-PT","package","","0","3.9.29.2","","https://update.joomla.org/language/details3/pt-PT_details.xml","","",""),
("213","2","0","Romanian","","pkg_ro-RO","package","","0","3.10.11.1","","https://update.joomla.org/language/details3/ro-RO_details.xml","","",""),
("214","2","0","Russian","","pkg_ru-RU","package","","0","3.10.9.1","","https://update.joomla.org/language/details3/ru-RU_details.xml","","",""),
("215","2","0","Serbian, Cyrillic","","pkg_sr-RS","package","","0","3.10.2.1","","https://update.joomla.org/language/details3/sr-RS_details.xml","","",""),
("216","2","0","Serbian, Latin","","pkg_sr-YU","package","","0","3.10.2.1","","https://update.joomla.org/language/details3/sr-YU_details.xml","","",""),
("217","2","0","Sinhala","","pkg_si-LK","package","","0","3.3.1.2","","https://update.joomla.org/language/details3/si-LK_details.xml","","",""),
("218","2","0","Slovak","","pkg_sk-SK","package","","0","3.10.5.1","","https://update.joomla.org/language/details3/sk-SK_details.xml","","",""),
("219","2","0","Slovenian","","pkg_sl-SI","package","","0","3.10.11.1","","https://update.joomla.org/language/details3/sl-SI_details.xml","","",""),
("220","2","0","Spanish","","pkg_es-ES","package","","0","3.10.10.1","","https://update.joomla.org/language/details3/es-ES_details.xml","","",""),
("221","2","0","Spanish, Colombia","","pkg_es-CO","package","","0","3.9.15.1","","https://update.joomla.org/language/details3/es-CO_details.xml","","",""),
("222","2","0","Swahili","","pkg_sw-KE","package","","0","3.10.11.1","","https://update.joomla.org/language/details3/sw-KE_details.xml","","",""),
("223","2","0","Swedish","","pkg_sv-SE","package","","0","3.10.11.1","","https://update.joomla.org/language/details3/sv-SE_details.xml","","",""),
("224","2","0","Syriac, East","","pkg_sy-IQ","package","","0","3.4.5.1","","https://update.joomla.org/language/details3/sy-IQ_details.xml","","",""),
("225","2","0","Tamil, India","","pkg_ta-IN","package","","0","3.10.11.1","","https://update.joomla.org/language/details3/ta-IN_details.xml","","",""),
("226","2","0","Thai","","pkg_th-TH","package","","0","3.10.11.1","","https://update.joomla.org/language/details3/th-TH_details.xml","","",""),
("227","2","0","Turkish","","pkg_tr-TR","package","","0","3.9.28.1","","https://update.joomla.org/language/details3/tr-TR_details.xml","","",""),
("228","2","0","Turkmen","","pkg_tk-TM","package","","0","3.5.0.2","","https://update.joomla.org/language/details3/tk-TM_details.xml","","",""),
("229","2","0","Ukrainian","","pkg_uk-UA","package","","0","3.10.2.1","","https://update.joomla.org/language/details3/uk-UA_details.xml","","",""),
("230","2","0","Uyghur","","pkg_ug-CN","package","","0","3.7.5.2","","https://update.joomla.org/language/details3/ug-CN_details.xml","","",""),
("231","2","0","Vietnamese","","pkg_vi-VN","package","","0","3.2.1.2","","https://update.joomla.org/language/details3/vi-VN_details.xml","","",""),
("232","2","0","Welsh","","pkg_cy-GB","package","","0","3.10.11.1","","https://update.joomla.org/language/details3/cy-GB_details.xml","","",""),
("235","6","10053","Search Extension Package","Joomla! CMS Search Package","pkg_search","package","","0","4.0.1-dev","","https://raw.githubusercontent.com/joomla-extensions/search/main/manifest.xml","https://github.com/joomla-extensions/search/releases/tag/4.0.1-dev","","");




CREATE TABLE `j4x_user_keys` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `series` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `time` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `uastring` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `series` (`series`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;






CREATE TABLE `j4x_user_mfa` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `method` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `default` tinyint NOT NULL DEFAULT '0',
  `options` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_on` datetime NOT NULL,
  `last_used` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Multi-factor Authentication settings';






CREATE TABLE `j4x_user_notes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned NOT NULL DEFAULT '0',
  `catid` int unsigned NOT NULL DEFAULT '0',
  `subject` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `body` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` tinyint NOT NULL DEFAULT '0',
  `checked_out` int unsigned DEFAULT NULL,
  `checked_out_time` datetime DEFAULT NULL,
  `created_user_id` int unsigned NOT NULL DEFAULT '0',
  `created_time` datetime NOT NULL,
  `modified_user_id` int unsigned NOT NULL DEFAULT '0',
  `modified_time` datetime NOT NULL,
  `review_time` datetime DEFAULT NULL,
  `publish_up` datetime DEFAULT NULL,
  `publish_down` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_user_id` (`user_id`),
  KEY `idx_category_id` (`catid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;






CREATE TABLE `j4x_user_profiles` (
  `user_id` int NOT NULL,
  `profile_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `profile_value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ordering` int NOT NULL DEFAULT '0',
  UNIQUE KEY `idx_user_id_profile_key` (`user_id`,`profile_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Simple user profile storage table';






CREATE TABLE `j4x_user_usergroup_map` (
  `user_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Foreign Key to #__users.id',
  `group_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Foreign Key to #__usergroups.id',
  PRIMARY KEY (`user_id`,`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


INSERT INTO j4x_user_usergroup_map VALUES
("424","8");




CREATE TABLE `j4x_usergroups` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `parent_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Adjacency List Reference Id',
  `lft` int NOT NULL DEFAULT '0' COMMENT 'Nested set lft.',
  `rgt` int NOT NULL DEFAULT '0' COMMENT 'Nested set rgt.',
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_usergroup_parent_title_lookup` (`parent_id`,`title`),
  KEY `idx_usergroup_title_lookup` (`title`),
  KEY `idx_usergroup_adjacency_lookup` (`parent_id`),
  KEY `idx_usergroup_nested_set_lookup` (`lft`,`rgt`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


INSERT INTO j4x_usergroups VALUES
("1","0","1","18","Public"),
("2","1","8","15","Registered"),
("3","2","9","14","Author"),
("4","3","10","13","Editor"),
("5","4","11","12","Publisher"),
("6","1","4","7","Manager"),
("7","6","5","6","Administrator"),
("8","1","16","17","Super Users"),
("9","1","2","3","Guest");




CREATE TABLE `j4x_users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `username` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `block` tinyint NOT NULL DEFAULT '0',
  `sendEmail` tinyint DEFAULT '0',
  `registerDate` datetime NOT NULL,
  `lastvisitDate` datetime DEFAULT NULL,
  `activation` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `params` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastResetTime` datetime DEFAULT NULL,
  `resetCount` int NOT NULL DEFAULT '0' COMMENT 'Count of password resets since lastResetTime',
  `otpKey` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'Two factor authentication encrypted keys',
  `otep` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'One time emergency passwords',
  `requireReset` tinyint NOT NULL DEFAULT '0' COMMENT 'Require user to reset password on next login',
  `authProvider` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'Name of used authentication plugin',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_username` (`username`),
  KEY `idx_name` (`name`(100)),
  KEY `idx_block` (`block`),
  KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=425 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


INSERT INTO j4x_users VALUES
("424","Super User","finnern","j3xwampp@tomfinnern.de","$2y$10$l0YzrdTiv3UpjZ.rrcJixuWbvrNrab/YPQ.LucRJF1os7NQCthyOu","0","1","2022-12-11 09:40:03","2023-02-03 20:19:40","0","","","0","","","0","");




CREATE TABLE `j4x_viewlevels` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `ordering` int NOT NULL DEFAULT '0',
  `rules` varchar(5120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'JSON encoded access control.',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_assetgroup_title_lookup` (`title`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


INSERT INTO j4x_viewlevels VALUES
("1","Public","0","[1]"),
("2","Registered","2","[6,2,8]"),
("3","Special","3","[6,3,8]"),
("5","Guest","1","[9]"),
("6","Super Users","4","[8]");




CREATE TABLE `j4x_webauthn_credentials` (
  `id` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Credential ID',
  `user_id` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'User handle',
  `label` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Human readable label',
  `credential` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Credential source data, JSON format',
  PRIMARY KEY (`id`(100)),
  KEY `user_id` (`user_id`(60))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;






CREATE TABLE `j4x_workflow_associations` (
  `item_id` int NOT NULL DEFAULT '0' COMMENT 'Extension table id value',
  `stage_id` int NOT NULL COMMENT 'Foreign Key to #__workflow_stages.id',
  `extension` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`item_id`,`extension`),
  KEY `idx_item_stage_extension` (`item_id`,`stage_id`,`extension`),
  KEY `idx_item_id` (`item_id`),
  KEY `idx_stage_id` (`stage_id`),
  KEY `idx_extension` (`extension`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;






CREATE TABLE `j4x_workflow_stages` (
  `id` int NOT NULL AUTO_INCREMENT,
  `asset_id` int DEFAULT '0',
  `ordering` int NOT NULL DEFAULT '0',
  `workflow_id` int NOT NULL,
  `published` tinyint NOT NULL DEFAULT '0',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `default` tinyint NOT NULL DEFAULT '0',
  `checked_out_time` datetime DEFAULT NULL,
  `checked_out` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_workflow_id` (`workflow_id`),
  KEY `idx_checked_out` (`checked_out`),
  KEY `idx_title` (`title`(191)),
  KEY `idx_asset_id` (`asset_id`),
  KEY `idx_default` (`default`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


INSERT INTO j4x_workflow_stages VALUES
("1","0","1","1","1","COM_WORKFLOW_BASIC_STAGE","","1","","");




CREATE TABLE `j4x_workflow_transitions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `asset_id` int DEFAULT '0',
  `ordering` int NOT NULL DEFAULT '0',
  `workflow_id` int NOT NULL,
  `published` tinyint NOT NULL DEFAULT '0',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `from_stage_id` int NOT NULL,
  `to_stage_id` int NOT NULL,
  `options` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `checked_out_time` datetime DEFAULT NULL,
  `checked_out` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_title` (`title`(191)),
  KEY `idx_asset_id` (`asset_id`),
  KEY `idx_checked_out` (`checked_out`),
  KEY `idx_from_stage_id` (`from_stage_id`),
  KEY `idx_to_stage_id` (`to_stage_id`),
  KEY `idx_workflow_id` (`workflow_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


INSERT INTO j4x_workflow_transitions VALUES
("1","0","1","1","1","UNPUBLISH","","-1","1","{\"publishing\":\"0\"}","",""),
("2","0","2","1","1","PUBLISH","","-1","1","{\"publishing\":\"1\"}","",""),
("3","0","3","1","1","TRASH","","-1","1","{\"publishing\":\"-2\"}","",""),
("4","0","4","1","1","ARCHIVE","","-1","1","{\"publishing\":\"2\"}","",""),
("5","0","5","1","1","FEATURE","","-1","1","{\"featuring\":\"1\"}","",""),
("6","0","6","1","1","UNFEATURE","","-1","1","{\"featuring\":\"0\"}","",""),
("7","0","7","1","1","PUBLISH_AND_FEATURE","","-1","1","{\"publishing\":\"1\",\"featuring\":\"1\"}","","");




CREATE TABLE `j4x_workflows` (
  `id` int NOT NULL AUTO_INCREMENT,
  `asset_id` int DEFAULT '0',
  `published` tinyint NOT NULL DEFAULT '0',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `extension` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `default` tinyint NOT NULL DEFAULT '0',
  `ordering` int NOT NULL DEFAULT '0',
  `created` datetime NOT NULL,
  `created_by` int NOT NULL DEFAULT '0',
  `modified` datetime NOT NULL,
  `modified_by` int NOT NULL DEFAULT '0',
  `checked_out_time` datetime DEFAULT NULL,
  `checked_out` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_asset_id` (`asset_id`),
  KEY `idx_title` (`title`(191)),
  KEY `idx_extension` (`extension`),
  KEY `idx_default` (`default`),
  KEY `idx_created` (`created`),
  KEY `idx_created_by` (`created_by`),
  KEY `idx_modified` (`modified`),
  KEY `idx_modified_by` (`modified_by`),
  KEY `idx_checked_out` (`checked_out`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


INSERT INTO j4x_workflows VALUES
("1","0","1","COM_WORKFLOW_BASIC_WORKFLOW","","com_content.article","1","1","2023-02-03 21:59:43","0","2023-02-03 21:59:43","0","","");


