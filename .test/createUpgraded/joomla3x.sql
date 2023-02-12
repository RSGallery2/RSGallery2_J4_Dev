

CREATE TABLE `j4x_action_log_config` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `type_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `type_alias` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `id_holder` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title_holder` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `table_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `text_prefix` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


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
("19","application_config","com_config.application","","name","","PLG_ACTIONLOG_JOOMLA");




CREATE TABLE `j4x_action_logs` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `message_language_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `log_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `extension` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_id` int NOT NULL DEFAULT '0',
  `item_id` int NOT NULL DEFAULT '0',
  `ip_address` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0.0.0.0',
  PRIMARY KEY (`id`),
  KEY `idx_user_id` (`user_id`),
  KEY `idx_user_id_logdate` (`user_id`,`log_date`),
  KEY `idx_user_id_extension` (`user_id`,`extension`),
  KEY `idx_extension_item_id` (`extension`,`item_id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


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
("19","PLG_ACTIONLOG_JOOMLA_USER_LOGGED_IN","{\"action\":\"login\",\"userid\":\"424\",\"username\":\"finnern\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=424\",\"app\":\"PLG_ACTIONLOG_JOOMLA_APPLICATION_ADMINISTRATOR\"}","2023-02-12 15:59:12","com_users","424","0","COM_ACTIONLOGS_DISABLED"),
("20","PLG_ACTIONLOG_JOOMLA_USER_CHECKIN","{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":\"424\",\"title\":\"finnern\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=424\",\"userid\":\"424\",\"username\":\"finnern\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=424\",\"table\":\"#__rsgallery2_galleries\"}","2023-02-12 16:53:32","com_checkin","424","424","COM_ACTIONLOGS_DISABLED"),
("21","PLG_ACTIONLOG_JOOMLA_USER_CHECKIN","{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":\"424\",\"title\":\"finnern\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=424\",\"userid\":\"424\",\"username\":\"finnern\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=424\",\"table\":\"#__rsgallery2_galleries\"}","2023-02-12 16:53:42","com_checkin","424","424","COM_ACTIONLOGS_DISABLED"),
("22","PLG_ACTIONLOG_JOOMLA_USER_CHECKIN","{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":\"424\",\"title\":\"finnern\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=424\",\"userid\":\"424\",\"username\":\"finnern\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=424\",\"table\":\"#__rsgallery2_galleries\"}","2023-02-12 16:53:51","com_checkin","424","424","COM_ACTIONLOGS_DISABLED"),
("23","PLG_ACTIONLOG_JOOMLA_USER_CHECKIN","{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":\"424\",\"title\":\"finnern\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=424\",\"userid\":\"424\",\"username\":\"finnern\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=424\",\"table\":\"#__rsgallery2_galleries\"}","2023-02-12 17:01:25","com_checkin","424","424","COM_ACTIONLOGS_DISABLED");




CREATE TABLE `j4x_action_logs_extensions` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `extension` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


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
("18","com_checkin");




CREATE TABLE `j4x_action_logs_users` (
  `user_id` int unsigned NOT NULL,
  `notify` tinyint unsigned NOT NULL,
  `extensions` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`user_id`),
  KEY `idx_notify` (`notify`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;






CREATE TABLE `j4x_assets` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `parent_id` int NOT NULL DEFAULT '0' COMMENT 'Nested set parent.',
  `lft` int NOT NULL DEFAULT '0' COMMENT 'Nested set lft.',
  `rgt` int NOT NULL DEFAULT '0' COMMENT 'Nested set rgt.',
  `level` int unsigned NOT NULL COMMENT 'The cached level in the nested tree.',
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The unique name for the asset.\n',
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The descriptive title for the asset.',
  `rules` varchar(5120) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'JSON encoded access control.',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_asset_name` (`name`),
  KEY `idx_lft_rgt` (`lft`,`rgt`),
  KEY `idx_parent_id` (`parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=158 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


INSERT INTO j4x_assets VALUES
("1","0","0","305","0","root.1","Root Asset","{\"core.login.site\":{\"6\":1,\"2\":1},\"core.login.admin\":{\"6\":1},\"core.login.offline\":{\"6\":1},\"core.admin\":{\"8\":1},\"core.manage\":{\"7\":1},\"core.create\":{\"6\":1,\"3\":1},\"core.delete\":{\"6\":1},\"core.edit\":{\"6\":1,\"4\":1},\"core.edit.state\":{\"6\":1,\"5\":1},\"core.edit.own\":{\"6\":1,\"3\":1}}"),
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
("18","1","41","78","1","com_modules","com_modules","{\"core.admin\":{\"7\":1}}"),
("19","1","79","82","1","com_newsfeeds","com_newsfeeds","{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1}}"),
("20","1","83","84","1","com_plugins","com_plugins","{\"core.admin\":{\"7\":1}}"),
("21","1","85","86","1","com_redirect","com_redirect","{\"core.admin\":{\"7\":1}}"),
("22","1","87","88","1","com_search","com_search","{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1}}"),
("23","1","89","90","1","com_templates","com_templates","{\"core.admin\":{\"7\":1}}"),
("24","1","91","94","1","com_users","com_users","{\"core.admin\":{\"7\":1}}"),
("26","1","95","96","1","com_wrapper","com_wrapper","{}"),
("27","8","18","19","2","com_content.category.2","Uncategorised","{}"),
("28","3","4","5","2","com_banners.category.3","Uncategorised","{}"),
("29","7","14","15","2","com_contact.category.4","Uncategorised","{}"),
("30","19","80","81","2","com_newsfeeds.category.5","Uncategorised","{}"),
("32","24","92","93","2","com_users.category.7","Uncategorised","{}"),
("33","1","97","98","1","com_finder","com_finder","{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1}}"),
("34","1","99","100","1","com_joomlaupdate","com_joomlaupdate","{}"),
("35","1","101","102","1","com_tags","com_tags","{}"),
("36","1","103","104","1","com_contenthistory","com_contenthistory","{}"),
("37","1","105","106","1","com_ajax","com_ajax","{}"),
("38","1","107","108","1","com_postinstall","com_postinstall","{}"),
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
("56","1","109","110","1","com_privacy","com_privacy","{}"),
("57","1","111","112","1","com_actionlogs","com_actionlogs","{}"),
("58","18","74","75","2","com_modules.module.88","Latest Actions","{}"),
("59","18","76","77","2","com_modules.module.89","Privacy Dashboard","{}"),
("60","1","113","114","1","com_rsgallery2","com_rsgallery2","{}"),
("61","1","115","116","1","#__rsgallery2_galleries.1","#__rsgallery2_galleries.1","{}"),
("64","1","117","118","1","#__rsgallery2_galleries.4","#__rsgallery2_galleries.4","{}"),
("65","1","119","120","1","#__rsgallery2_files.1","#__rsgallery2_files.1","{}"),
("66","1","121","122","1","#__rsgallery2_files.2","#__rsgallery2_files.2","{}"),
("67","1","123","124","1","#__rsgallery2_files.3","#__rsgallery2_files.3","{}"),
("68","1","125","126","1","#__rsgallery2_files.4","#__rsgallery2_files.4","{}"),
("69","1","127","128","1","#__rsgallery2_files.5","#__rsgallery2_files.5","{}"),
("70","1","129","130","1","#__rsgallery2_files.6","#__rsgallery2_files.6","{}"),
("71","1","131","132","1","#__rsgallery2_files.7","#__rsgallery2_files.7","{}"),
("72","1","133","134","1","#__rsgallery2_files.8","#__rsgallery2_files.8","{}"),
("73","1","135","136","1","#__rsgallery2_files.9","#__rsgallery2_files.9","{}"),
("74","1","137","138","1","#__rsgallery2_files.10","#__rsgallery2_files.10","{}"),
("75","1","139","140","1","#__rsgallery2_files.11","#__rsgallery2_files.11","{}"),
("76","1","141","142","1","#__rsgallery2_files.12","#__rsgallery2_files.12","{}"),
("77","1","143","144","1","#__rsgallery2_files.13","#__rsgallery2_files.13","{}"),
("78","1","145","146","1","#__rsgallery2_files.14","#__rsgallery2_files.14","{}"),
("79","1","147","148","1","#__rsgallery2_files.15","#__rsgallery2_files.15","{}"),
("80","1","149","150","1","#__rsgallery2_files.16","#__rsgallery2_files.16","{}"),
("81","1","151","152","1","#__rsgallery2_files.17","#__rsgallery2_files.17","{}"),
("82","1","153","154","1","#__rsgallery2_files.18","#__rsgallery2_files.18","{}"),
("83","1","155","156","1","#__rsgallery2_files.19","#__rsgallery2_files.19","{}"),
("84","1","157","158","1","#__rsgallery2_files.20","#__rsgallery2_files.20","{}"),
("85","1","159","160","1","#__rsgallery2_files.21","#__rsgallery2_files.21","{}"),
("86","1","161","162","1","#__rsgallery2_files.22","#__rsgallery2_files.22","{}"),
("87","1","163","164","1","#__rsgallery2_files.23","#__rsgallery2_files.23","{}"),
("88","1","165","166","1","#__rsgallery2_files.24","#__rsgallery2_files.24","{}"),
("89","1","167","168","1","#__rsgallery2_files.25","#__rsgallery2_files.25","{}"),
("90","1","169","170","1","#__rsgallery2_files.26","#__rsgallery2_files.26","{}"),
("91","1","171","172","1","#__rsgallery2_files.27","#__rsgallery2_files.27","{}"),
("92","1","173","174","1","#__rsgallery2_files.28","#__rsgallery2_files.28","{}"),
("93","1","175","176","1","#__rsgallery2_files.29","#__rsgallery2_files.29","{}"),
("94","1","177","178","1","#__rsgallery2_files.30","#__rsgallery2_files.30","{}"),
("95","1","179","180","1","#__rsgallery2_files.31","#__rsgallery2_files.31","{}"),
("96","1","181","182","1","#__rsgallery2_files.32","#__rsgallery2_files.32","{}"),
("97","1","183","184","1","#__rsgallery2_files.33","#__rsgallery2_files.33","{}"),
("98","1","185","186","1","#__rsgallery2_files.34","#__rsgallery2_files.34","{}"),
("99","1","187","188","1","#__rsgallery2_files.35","#__rsgallery2_files.35","{}"),
("100","1","189","190","1","#__rsgallery2_files.36","#__rsgallery2_files.36","{}"),
("101","1","191","192","1","#__rsgallery2_files.37","#__rsgallery2_files.37","{}"),
("102","1","193","194","1","#__rsgallery2_files.38","#__rsgallery2_files.38","{}"),
("103","1","195","196","1","#__rsgallery2_files.39","#__rsgallery2_files.39","{}"),
("104","1","197","198","1","#__rsgallery2_files.40","#__rsgallery2_files.40","{}");
INSERT INTO j4x_assets VALUES
("105","1","199","200","1","#__rsgallery2_files.41","#__rsgallery2_files.41","{}"),
("106","1","201","202","1","#__rsgallery2_files.42","#__rsgallery2_files.42","{}"),
("107","1","203","204","1","#__rsgallery2_files.43","#__rsgallery2_files.43","{}"),
("108","1","205","206","1","#__rsgallery2_files.44","#__rsgallery2_files.44","{}"),
("109","1","207","208","1","#__rsgallery2_files.45","#__rsgallery2_files.45","{}"),
("110","1","209","210","1","#__rsgallery2_files.46","#__rsgallery2_files.46","{}"),
("111","1","211","212","1","#__rsgallery2_files.47","#__rsgallery2_files.47","{}"),
("112","1","213","214","1","#__rsgallery2_files.48","#__rsgallery2_files.48","{}"),
("113","1","215","216","1","#__rsgallery2_files.49","#__rsgallery2_files.49","{}"),
("114","1","217","218","1","#__rsgallery2_files.50","#__rsgallery2_files.50","{}"),
("115","1","219","220","1","#__rsgallery2_files.51","#__rsgallery2_files.51","{}"),
("116","1","221","222","1","#__rsgallery2_files.52","#__rsgallery2_files.52","{}"),
("117","1","223","224","1","#__rsgallery2_files.53","#__rsgallery2_files.53","{}"),
("118","1","225","226","1","#__rsgallery2_files.54","#__rsgallery2_files.54","{}"),
("119","1","227","228","1","#__rsgallery2_files.55","#__rsgallery2_files.55","{}"),
("120","1","229","230","1","#__rsgallery2_files.56","#__rsgallery2_files.56","{}"),
("121","1","231","232","1","#__rsgallery2_files.57","#__rsgallery2_files.57","{}"),
("122","1","233","234","1","#__rsgallery2_files.58","#__rsgallery2_files.58","{}"),
("123","1","235","236","1","#__rsgallery2_files.59","#__rsgallery2_files.59","{}"),
("124","1","237","238","1","#__rsgallery2_files.60","#__rsgallery2_files.60","{}"),
("125","1","239","240","1","#__rsgallery2_files.61","#__rsgallery2_files.61","{}"),
("126","1","241","242","1","#__rsgallery2_files.62","#__rsgallery2_files.62","{}"),
("127","1","243","244","1","#__rsgallery2_files.63","#__rsgallery2_files.63","{}"),
("128","1","245","246","1","#__rsgallery2_files.64","#__rsgallery2_files.64","{}"),
("129","1","247","248","1","#__rsgallery2_files.65","#__rsgallery2_files.65","{}"),
("130","1","249","250","1","#__rsgallery2_files.66","#__rsgallery2_files.66","{}"),
("131","1","251","252","1","#__rsgallery2_files.67","#__rsgallery2_files.67","{}"),
("132","1","253","254","1","#__rsgallery2_galleries.5","#__rsgallery2_galleries.5","{}"),
("133","1","255","256","1","#__rsgallery2_files.68","#__rsgallery2_files.68","{}"),
("134","1","257","258","1","#__rsgallery2_files.69","#__rsgallery2_files.69","{}"),
("135","1","259","260","1","#__rsgallery2_files.70","#__rsgallery2_files.70","{}"),
("136","1","261","262","1","#__rsgallery2_files.71","#__rsgallery2_files.71","{}"),
("137","1","263","264","1","#__rsgallery2_files.72","#__rsgallery2_files.72","{}"),
("138","1","265","266","1","#__rsgallery2_files.73","#__rsgallery2_files.73","{}"),
("139","1","267","268","1","#__rsgallery2_files.74","#__rsgallery2_files.74","{}"),
("140","1","269","270","1","#__rsgallery2_files.75","#__rsgallery2_files.75","{}"),
("141","1","271","272","1","#__rsgallery2_files.76","#__rsgallery2_files.76","{}"),
("142","1","273","274","1","#__rsgallery2_files.77","#__rsgallery2_files.77","{}"),
("143","1","275","276","1","#__rsgallery2_files.78","#__rsgallery2_files.78","{}"),
("144","1","277","278","1","#__rsgallery2_files.79","#__rsgallery2_files.79","{}"),
("145","1","279","280","1","#__rsgallery2_files.80","#__rsgallery2_files.80","{}"),
("146","1","281","282","1","#__rsgallery2_files.81","#__rsgallery2_files.81","{}"),
("147","1","283","284","1","#__rsgallery2_files.82","#__rsgallery2_files.82","{}"),
("148","1","285","286","1","#__rsgallery2_files.83","#__rsgallery2_files.83","{}"),
("149","1","287","288","1","#__rsgallery2_files.84","#__rsgallery2_files.84","{}"),
("150","1","289","290","1","#__rsgallery2_files.85","#__rsgallery2_files.85","{}"),
("151","1","291","292","1","#__rsgallery2_files.86","#__rsgallery2_files.86","{}"),
("152","1","293","294","1","#__rsgallery2_files.87","#__rsgallery2_files.87","{}"),
("153","1","295","296","1","#__rsgallery2_files.88","#__rsgallery2_files.88","{}"),
("154","1","297","298","1","#__rsgallery2_files.89","#__rsgallery2_files.89","{}"),
("155","1","299","300","1","#__rsgallery2_files.90","#__rsgallery2_files.90","{}"),
("156","1","301","302","1","#__rsgallery2_files.91","#__rsgallery2_files.91","{}"),
("157","1","303","304","1","#__rsgallery2_files.92","#__rsgallery2_files.92","{}");




CREATE TABLE `j4x_associations` (
  `id` int NOT NULL COMMENT 'A reference to the associated item.',
  `context` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The context of the associated item.',
  `key` char(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The key for the association computed from an md5 on associated ids.',
  PRIMARY KEY (`context`,`id`),
  KEY `idx_key` (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;






CREATE TABLE `j4x_banner_clients` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `contact` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `extrainfo` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` tinyint NOT NULL DEFAULT '0',
  `checked_out` int unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `metakey` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `own_prefix` tinyint NOT NULL DEFAULT '0',
  `metakey_prefix` varchar(400) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
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
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `alias` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `imptotal` int NOT NULL DEFAULT '0',
  `impmade` int NOT NULL DEFAULT '0',
  `clicks` int NOT NULL DEFAULT '0',
  `clickurl` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `state` tinyint NOT NULL DEFAULT '0',
  `catid` int unsigned NOT NULL DEFAULT '0',
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `custombannercode` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sticky` tinyint unsigned NOT NULL DEFAULT '0',
  `ordering` int NOT NULL DEFAULT '0',
  `metakey` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `params` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `own_prefix` tinyint NOT NULL DEFAULT '0',
  `metakey_prefix` varchar(400) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `purchase_type` tinyint NOT NULL DEFAULT '-1',
  `track_clicks` tinyint NOT NULL DEFAULT '-1',
  `track_impressions` tinyint NOT NULL DEFAULT '-1',
  `checked_out` int unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `reset` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `language` char(7) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `created_by` int unsigned NOT NULL DEFAULT '0',
  `created_by_alias` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
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
  `path` varchar(400) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `extension` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `alias` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `note` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` mediumtext COLLATE utf8mb4_unicode_ci,
  `published` tinyint NOT NULL DEFAULT '0',
  `checked_out` int unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `access` int unsigned NOT NULL DEFAULT '0',
  `params` text COLLATE utf8mb4_unicode_ci,
  `metadesc` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'The meta description for the page.',
  `metakey` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'The meta keywords for the page.',
  `metadata` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'JSON encoded metadata properties.',
  `created_user_id` int unsigned NOT NULL DEFAULT '0',
  `created_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_user_id` int unsigned NOT NULL DEFAULT '0',
  `modified_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `hits` int unsigned NOT NULL DEFAULT '0',
  `language` char(7) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
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
("1","0","0","0","11","0","","system","ROOT","root","","","1","0","0000-00-00 00:00:00","1","{}","","","{}","424","2022-12-11 09:40:03","0","0000-00-00 00:00:00","0","*","1"),
("2","27","1","1","2","1","uncategorised","com_content","Uncategorised","uncategorised","","","1","0","0000-00-00 00:00:00","1","{\"category_layout\":\"\",\"image\":\"\"}","","","{\"author\":\"\",\"robots\":\"\"}","424","2022-12-11 09:40:03","0","0000-00-00 00:00:00","0","*","1"),
("3","28","1","3","4","1","uncategorised","com_banners","Uncategorised","uncategorised","","","1","0","0000-00-00 00:00:00","1","{\"category_layout\":\"\",\"image\":\"\"}","","","{\"author\":\"\",\"robots\":\"\"}","424","2022-12-11 09:40:03","0","0000-00-00 00:00:00","0","*","1"),
("4","29","1","5","6","1","uncategorised","com_contact","Uncategorised","uncategorised","","","1","0","0000-00-00 00:00:00","1","{\"category_layout\":\"\",\"image\":\"\"}","","","{\"author\":\"\",\"robots\":\"\"}","424","2022-12-11 09:40:03","0","0000-00-00 00:00:00","0","*","1"),
("5","30","1","7","8","1","uncategorised","com_newsfeeds","Uncategorised","uncategorised","","","1","0","0000-00-00 00:00:00","1","{\"category_layout\":\"\",\"image\":\"\"}","","","{\"author\":\"\",\"robots\":\"\"}","424","2022-12-11 09:40:03","0","0000-00-00 00:00:00","0","*","1"),
("7","32","1","9","10","1","uncategorised","com_users","Uncategorised","uncategorised","","","1","0","0000-00-00 00:00:00","1","{\"category_layout\":\"\",\"image\":\"\"}","","","{\"author\":\"\",\"robots\":\"\"}","424","2022-12-11 09:40:03","0","0000-00-00 00:00:00","0","*","1");




CREATE TABLE `j4x_contact_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alias` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `con_position` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci,
  `suburb` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postcode` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telephone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fax` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `misc` mediumtext COLLATE utf8mb4_unicode_ci,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_to` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `default_con` tinyint unsigned NOT NULL DEFAULT '0',
  `published` tinyint NOT NULL DEFAULT '0',
  `checked_out` int unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int NOT NULL DEFAULT '0',
  `params` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int NOT NULL DEFAULT '0',
  `catid` int NOT NULL DEFAULT '0',
  `access` int unsigned NOT NULL DEFAULT '0',
  `mobile` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `webpage` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `sortname1` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `sortname2` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `sortname3` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `language` varchar(7) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int unsigned NOT NULL DEFAULT '0',
  `created_by_alias` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int unsigned NOT NULL DEFAULT '0',
  `metakey` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `metadesc` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `metadata` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `featured` tinyint unsigned NOT NULL DEFAULT '0' COMMENT 'Set if contact is featured.',
  `xreference` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'A reference to enable linkages to external data sets.',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `version` int unsigned NOT NULL DEFAULT '1',
  `hits` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_state` (`published`),
  KEY `idx_catid` (`catid`),
  KEY `idx_createdby` (`created_by`),
  KEY `idx_featured_catid` (`featured`,`catid`),
  KEY `idx_language` (`language`),
  KEY `idx_xreference` (`xreference`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;






CREATE TABLE `j4x_content` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `asset_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'FK to the #__assets table.',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `alias` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `introtext` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `fulltext` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` tinyint NOT NULL DEFAULT '0',
  `catid` int unsigned NOT NULL DEFAULT '0',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int unsigned NOT NULL DEFAULT '0',
  `created_by_alias` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int unsigned NOT NULL DEFAULT '0',
  `checked_out` int unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `images` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `urls` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `attribs` varchar(5120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `version` int unsigned NOT NULL DEFAULT '1',
  `ordering` int NOT NULL DEFAULT '0',
  `metakey` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `metadesc` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `access` int unsigned NOT NULL DEFAULT '0',
  `hits` int unsigned NOT NULL DEFAULT '0',
  `metadata` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `featured` tinyint unsigned NOT NULL DEFAULT '0' COMMENT 'Set if article is featured.',
  `language` char(7) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The language code for the article.',
  `xreference` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'A reference to enable linkages to external data sets.',
  `note` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_state` (`state`),
  KEY `idx_catid` (`catid`),
  KEY `idx_createdby` (`created_by`),
  KEY `idx_featured_catid` (`featured`,`catid`),
  KEY `idx_language` (`language`),
  KEY `idx_xreference` (`xreference`),
  KEY `idx_alias` (`alias`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;






CREATE TABLE `j4x_content_frontpage` (
  `content_id` int NOT NULL DEFAULT '0',
  `ordering` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;






CREATE TABLE `j4x_content_rating` (
  `content_id` int NOT NULL DEFAULT '0',
  `rating_sum` int unsigned NOT NULL DEFAULT '0',
  `rating_count` int unsigned NOT NULL DEFAULT '0',
  `lastip` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;






CREATE TABLE `j4x_content_types` (
  `type_id` int unsigned NOT NULL AUTO_INCREMENT,
  `type_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `type_alias` varchar(400) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `table` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `rules` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `field_mappings` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `router` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `content_history_options` varchar(5120) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'JSON string for com_contenthistory options',
  PRIMARY KEY (`type_id`),
  KEY `idx_alias` (`type_alias`(100))
) ENGINE=InnoDB AUTO_INCREMENT=10000 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


INSERT INTO j4x_content_types VALUES
("1","Article","com_content.article","{\"special\":{\"dbtable\":\"#__content\",\"key\":\"id\",\"type\":\"Content\",\"prefix\":\"JTable\",\"config\":\"array()\"},\"common\":{\"dbtable\":\"#__ucm_content\",\"key\":\"ucm_id\",\"type\":\"Corecontent\",\"prefix\":\"JTable\",\"config\":\"array()\"}}","","{\"common\":{\"core_content_item_id\":\"id\",\"core_title\":\"title\",\"core_state\":\"state\",\"core_alias\":\"alias\",\"core_created_time\":\"created\",\"core_modified_time\":\"modified\",\"core_body\":\"introtext\", \"core_hits\":\"hits\",\"core_publish_up\":\"publish_up\",\"core_publish_down\":\"publish_down\",\"core_access\":\"access\", \"core_params\":\"attribs\", \"core_featured\":\"featured\", \"core_metadata\":\"metadata\", \"core_language\":\"language\", \"core_images\":\"images\", \"core_urls\":\"urls\", \"core_version\":\"version\", \"core_ordering\":\"ordering\", \"core_metakey\":\"metakey\", \"core_metadesc\":\"metadesc\", \"core_catid\":\"catid\", \"core_xreference\":\"xreference\", \"asset_id\":\"asset_id\", \"note\":\"note\"}, \"special\":{\"fulltext\":\"fulltext\"}}","ContentHelperRoute::getArticleRoute","{\"formFile\":\"administrator\\/components\\/com_content\\/models\\/forms\\/article.xml\", \"hideFields\":[\"asset_id\",\"checked_out\",\"checked_out_time\",\"version\"],\"ignoreChanges\":[\"modified_by\", \"modified\", \"checked_out\", \"checked_out_time\", \"version\", \"hits\", \"ordering\"],\"convertToInt\":[\"publish_up\", \"publish_down\", \"featured\", \"ordering\"],\"displayLookup\":[{\"sourceColumn\":\"catid\",\"targetTable\":\"#__categories\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"},{\"sourceColumn\":\"created_by\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"},{\"sourceColumn\":\"access\",\"targetTable\":\"#__viewlevels\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"},{\"sourceColumn\":\"modified_by\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"} ]}"),
("2","Contact","com_contact.contact","{\"special\":{\"dbtable\":\"#__contact_details\",\"key\":\"id\",\"type\":\"Contact\",\"prefix\":\"ContactTable\",\"config\":\"array()\"},\"common\":{\"dbtable\":\"#__ucm_content\",\"key\":\"ucm_id\",\"type\":\"Corecontent\",\"prefix\":\"JTable\",\"config\":\"array()\"}}","","{\"common\":{\"core_content_item_id\":\"id\",\"core_title\":\"name\",\"core_state\":\"published\",\"core_alias\":\"alias\",\"core_created_time\":\"created\",\"core_modified_time\":\"modified\",\"core_body\":\"address\", \"core_hits\":\"hits\",\"core_publish_up\":\"publish_up\",\"core_publish_down\":\"publish_down\",\"core_access\":\"access\", \"core_params\":\"params\", \"core_featured\":\"featured\", \"core_metadata\":\"metadata\", \"core_language\":\"language\", \"core_images\":\"image\", \"core_urls\":\"webpage\", \"core_version\":\"version\", \"core_ordering\":\"ordering\", \"core_metakey\":\"metakey\", \"core_metadesc\":\"metadesc\", \"core_catid\":\"catid\", \"core_xreference\":\"xreference\", \"asset_id\":\"null\"}, \"special\":{\"con_position\":\"con_position\",\"suburb\":\"suburb\",\"state\":\"state\",\"country\":\"country\",\"postcode\":\"postcode\",\"telephone\":\"telephone\",\"fax\":\"fax\",\"misc\":\"misc\",\"email_to\":\"email_to\",\"default_con\":\"default_con\",\"user_id\":\"user_id\",\"mobile\":\"mobile\",\"sortname1\":\"sortname1\",\"sortname2\":\"sortname2\",\"sortname3\":\"sortname3\"}}","ContactHelperRoute::getContactRoute","{\"formFile\":\"administrator\\/components\\/com_contact\\/models\\/forms\\/contact.xml\",\"hideFields\":[\"default_con\",\"checked_out\",\"checked_out_time\",\"version\",\"xreference\"],\"ignoreChanges\":[\"modified_by\", \"modified\", \"checked_out\", \"checked_out_time\", \"version\", \"hits\"],\"convertToInt\":[\"publish_up\", \"publish_down\", \"featured\", \"ordering\"], \"displayLookup\":[ {\"sourceColumn\":\"created_by\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"},{\"sourceColumn\":\"catid\",\"targetTable\":\"#__categories\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"},{\"sourceColumn\":\"modified_by\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"},{\"sourceColumn\":\"access\",\"targetTable\":\"#__viewlevels\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"},{\"sourceColumn\":\"user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"} ] }"),
("3","Newsfeed","com_newsfeeds.newsfeed","{\"special\":{\"dbtable\":\"#__newsfeeds\",\"key\":\"id\",\"type\":\"Newsfeed\",\"prefix\":\"NewsfeedsTable\",\"config\":\"array()\"},\"common\":{\"dbtable\":\"#__ucm_content\",\"key\":\"ucm_id\",\"type\":\"Corecontent\",\"prefix\":\"JTable\",\"config\":\"array()\"}}","","{\"common\":{\"core_content_item_id\":\"id\",\"core_title\":\"name\",\"core_state\":\"published\",\"core_alias\":\"alias\",\"core_created_time\":\"created\",\"core_modified_time\":\"modified\",\"core_body\":\"description\", \"core_hits\":\"hits\",\"core_publish_up\":\"publish_up\",\"core_publish_down\":\"publish_down\",\"core_access\":\"access\", \"core_params\":\"params\", \"core_featured\":\"featured\", \"core_metadata\":\"metadata\", \"core_language\":\"language\", \"core_images\":\"images\", \"core_urls\":\"link\", \"core_version\":\"version\", \"core_ordering\":\"ordering\", \"core_metakey\":\"metakey\", \"core_metadesc\":\"metadesc\", \"core_catid\":\"catid\", \"core_xreference\":\"xreference\", \"asset_id\":\"null\"}, \"special\":{\"numarticles\":\"numarticles\",\"cache_time\":\"cache_time\",\"rtl\":\"rtl\"}}","NewsfeedsHelperRoute::getNewsfeedRoute","{\"formFile\":\"administrator\\/components\\/com_newsfeeds\\/models\\/forms\\/newsfeed.xml\",\"hideFields\":[\"asset_id\",\"checked_out\",\"checked_out_time\",\"version\"],\"ignoreChanges\":[\"modified_by\", \"modified\", \"checked_out\", \"checked_out_time\", \"version\", \"hits\"],\"convertToInt\":[\"publish_up\", \"publish_down\", \"featured\", \"ordering\"],\"displayLookup\":[{\"sourceColumn\":\"catid\",\"targetTable\":\"#__categories\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"},{\"sourceColumn\":\"created_by\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"},{\"sourceColumn\":\"access\",\"targetTable\":\"#__viewlevels\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"},{\"sourceColumn\":\"modified_by\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"} ]}"),
("4","User","com_users.user","{\"special\":{\"dbtable\":\"#__users\",\"key\":\"id\",\"type\":\"User\",\"prefix\":\"JTable\",\"config\":\"array()\"},\"common\":{\"dbtable\":\"#__ucm_content\",\"key\":\"ucm_id\",\"type\":\"Corecontent\",\"prefix\":\"JTable\",\"config\":\"array()\"}}","","{\"common\":{\"core_content_item_id\":\"id\",\"core_title\":\"name\",\"core_state\":\"null\",\"core_alias\":\"username\",\"core_created_time\":\"registerdate\",\"core_modified_time\":\"lastvisitDate\",\"core_body\":\"null\", \"core_hits\":\"null\",\"core_publish_up\":\"null\",\"core_publish_down\":\"null\",\"access\":\"null\", \"core_params\":\"params\", \"core_featured\":\"null\", \"core_metadata\":\"null\", \"core_language\":\"null\", \"core_images\":\"null\", \"core_urls\":\"null\", \"core_version\":\"null\", \"core_ordering\":\"null\", \"core_metakey\":\"null\", \"core_metadesc\":\"null\", \"core_catid\":\"null\", \"core_xreference\":\"null\", \"asset_id\":\"null\"}, \"special\":{}}","UsersHelperRoute::getUserRoute",""),
("5","Article Category","com_content.category","{\"special\":{\"dbtable\":\"#__categories\",\"key\":\"id\",\"type\":\"Category\",\"prefix\":\"JTable\",\"config\":\"array()\"},\"common\":{\"dbtable\":\"#__ucm_content\",\"key\":\"ucm_id\",\"type\":\"Corecontent\",\"prefix\":\"JTable\",\"config\":\"array()\"}}","","{\"common\":{\"core_content_item_id\":\"id\",\"core_title\":\"title\",\"core_state\":\"published\",\"core_alias\":\"alias\",\"core_created_time\":\"created_time\",\"core_modified_time\":\"modified_time\",\"core_body\":\"description\", \"core_hits\":\"hits\",\"core_publish_up\":\"null\",\"core_publish_down\":\"null\",\"core_access\":\"access\", \"core_params\":\"params\", \"core_featured\":\"null\", \"core_metadata\":\"metadata\", \"core_language\":\"language\", \"core_images\":\"null\", \"core_urls\":\"null\", \"core_version\":\"version\", \"core_ordering\":\"null\", \"core_metakey\":\"metakey\", \"core_metadesc\":\"metadesc\", \"core_catid\":\"parent_id\", \"core_xreference\":\"null\", \"asset_id\":\"asset_id\"}, \"special\":{\"parent_id\":\"parent_id\",\"lft\":\"lft\",\"rgt\":\"rgt\",\"level\":\"level\",\"path\":\"path\",\"extension\":\"extension\",\"note\":\"note\"}}","ContentHelperRoute::getCategoryRoute","{\"formFile\":\"administrator\\/components\\/com_categories\\/models\\/forms\\/category.xml\", \"hideFields\":[\"asset_id\",\"checked_out\",\"checked_out_time\",\"version\",\"lft\",\"rgt\",\"level\",\"path\",\"extension\"], \"ignoreChanges\":[\"modified_user_id\", \"modified_time\", \"checked_out\", \"checked_out_time\", \"version\", \"hits\", \"path\"],\"convertToInt\":[\"publish_up\", \"publish_down\"], \"displayLookup\":[{\"sourceColumn\":\"created_user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"},{\"sourceColumn\":\"access\",\"targetTable\":\"#__viewlevels\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"},{\"sourceColumn\":\"modified_user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"},{\"sourceColumn\":\"parent_id\",\"targetTable\":\"#__categories\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"}]}"),
("6","Contact Category","com_contact.category","{\"special\":{\"dbtable\":\"#__categories\",\"key\":\"id\",\"type\":\"Category\",\"prefix\":\"JTable\",\"config\":\"array()\"},\"common\":{\"dbtable\":\"#__ucm_content\",\"key\":\"ucm_id\",\"type\":\"Corecontent\",\"prefix\":\"JTable\",\"config\":\"array()\"}}","","{\"common\":{\"core_content_item_id\":\"id\",\"core_title\":\"title\",\"core_state\":\"published\",\"core_alias\":\"alias\",\"core_created_time\":\"created_time\",\"core_modified_time\":\"modified_time\",\"core_body\":\"description\", \"core_hits\":\"hits\",\"core_publish_up\":\"null\",\"core_publish_down\":\"null\",\"core_access\":\"access\", \"core_params\":\"params\", \"core_featured\":\"null\", \"core_metadata\":\"metadata\", \"core_language\":\"language\", \"core_images\":\"null\", \"core_urls\":\"null\", \"core_version\":\"version\", \"core_ordering\":\"null\", \"core_metakey\":\"metakey\", \"core_metadesc\":\"metadesc\", \"core_catid\":\"parent_id\", \"core_xreference\":\"null\", \"asset_id\":\"asset_id\"}, \"special\":{\"parent_id\":\"parent_id\",\"lft\":\"lft\",\"rgt\":\"rgt\",\"level\":\"level\",\"path\":\"path\",\"extension\":\"extension\",\"note\":\"note\"}}","ContactHelperRoute::getCategoryRoute","{\"formFile\":\"administrator\\/components\\/com_categories\\/models\\/forms\\/category.xml\", \"hideFields\":[\"asset_id\",\"checked_out\",\"checked_out_time\",\"version\",\"lft\",\"rgt\",\"level\",\"path\",\"extension\"], \"ignoreChanges\":[\"modified_user_id\", \"modified_time\", \"checked_out\", \"checked_out_time\", \"version\", \"hits\", \"path\"],\"convertToInt\":[\"publish_up\", \"publish_down\"], \"displayLookup\":[{\"sourceColumn\":\"created_user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"},{\"sourceColumn\":\"access\",\"targetTable\":\"#__viewlevels\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"},{\"sourceColumn\":\"modified_user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"},{\"sourceColumn\":\"parent_id\",\"targetTable\":\"#__categories\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"}]}"),
("7","Newsfeeds Category","com_newsfeeds.category","{\"special\":{\"dbtable\":\"#__categories\",\"key\":\"id\",\"type\":\"Category\",\"prefix\":\"JTable\",\"config\":\"array()\"},\"common\":{\"dbtable\":\"#__ucm_content\",\"key\":\"ucm_id\",\"type\":\"Corecontent\",\"prefix\":\"JTable\",\"config\":\"array()\"}}","","{\"common\":{\"core_content_item_id\":\"id\",\"core_title\":\"title\",\"core_state\":\"published\",\"core_alias\":\"alias\",\"core_created_time\":\"created_time\",\"core_modified_time\":\"modified_time\",\"core_body\":\"description\", \"core_hits\":\"hits\",\"core_publish_up\":\"null\",\"core_publish_down\":\"null\",\"core_access\":\"access\", \"core_params\":\"params\", \"core_featured\":\"null\", \"core_metadata\":\"metadata\", \"core_language\":\"language\", \"core_images\":\"null\", \"core_urls\":\"null\", \"core_version\":\"version\", \"core_ordering\":\"null\", \"core_metakey\":\"metakey\", \"core_metadesc\":\"metadesc\", \"core_catid\":\"parent_id\", \"core_xreference\":\"null\", \"asset_id\":\"asset_id\"}, \"special\":{\"parent_id\":\"parent_id\",\"lft\":\"lft\",\"rgt\":\"rgt\",\"level\":\"level\",\"path\":\"path\",\"extension\":\"extension\",\"note\":\"note\"}}","NewsfeedsHelperRoute::getCategoryRoute","{\"formFile\":\"administrator\\/components\\/com_categories\\/models\\/forms\\/category.xml\", \"hideFields\":[\"asset_id\",\"checked_out\",\"checked_out_time\",\"version\",\"lft\",\"rgt\",\"level\",\"path\",\"extension\"], \"ignoreChanges\":[\"modified_user_id\", \"modified_time\", \"checked_out\", \"checked_out_time\", \"version\", \"hits\", \"path\"],\"convertToInt\":[\"publish_up\", \"publish_down\"], \"displayLookup\":[{\"sourceColumn\":\"created_user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"},{\"sourceColumn\":\"access\",\"targetTable\":\"#__viewlevels\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"},{\"sourceColumn\":\"modified_user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"},{\"sourceColumn\":\"parent_id\",\"targetTable\":\"#__categories\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"}]}"),
("8","Tag","com_tags.tag","{\"special\":{\"dbtable\":\"#__tags\",\"key\":\"tag_id\",\"type\":\"Tag\",\"prefix\":\"TagsTable\",\"config\":\"array()\"},\"common\":{\"dbtable\":\"#__ucm_content\",\"key\":\"ucm_id\",\"type\":\"Corecontent\",\"prefix\":\"JTable\",\"config\":\"array()\"}}","","{\"common\":{\"core_content_item_id\":\"id\",\"core_title\":\"title\",\"core_state\":\"published\",\"core_alias\":\"alias\",\"core_created_time\":\"created_time\",\"core_modified_time\":\"modified_time\",\"core_body\":\"description\", \"core_hits\":\"hits\",\"core_publish_up\":\"null\",\"core_publish_down\":\"null\",\"core_access\":\"access\", \"core_params\":\"params\", \"core_featured\":\"featured\", \"core_metadata\":\"metadata\", \"core_language\":\"language\", \"core_images\":\"images\", \"core_urls\":\"urls\", \"core_version\":\"version\", \"core_ordering\":\"null\", \"core_metakey\":\"metakey\", \"core_metadesc\":\"metadesc\", \"core_catid\":\"null\", \"core_xreference\":\"null\", \"asset_id\":\"null\"}, \"special\":{\"parent_id\":\"parent_id\",\"lft\":\"lft\",\"rgt\":\"rgt\",\"level\":\"level\",\"path\":\"path\"}}","TagsHelperRoute::getTagRoute","{\"formFile\":\"administrator\\/components\\/com_tags\\/models\\/forms\\/tag.xml\", \"hideFields\":[\"checked_out\",\"checked_out_time\",\"version\", \"lft\", \"rgt\", \"level\", \"path\", \"urls\", \"publish_up\", \"publish_down\"],\"ignoreChanges\":[\"modified_user_id\", \"modified_time\", \"checked_out\", \"checked_out_time\", \"version\", \"hits\", \"path\"],\"convertToInt\":[\"publish_up\", \"publish_down\"], \"displayLookup\":[{\"sourceColumn\":\"created_user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"}, {\"sourceColumn\":\"access\",\"targetTable\":\"#__viewlevels\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"}, {\"sourceColumn\":\"modified_user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"}]}"),
("9","Banner","com_banners.banner","{\"special\":{\"dbtable\":\"#__banners\",\"key\":\"id\",\"type\":\"Banner\",\"prefix\":\"BannersTable\",\"config\":\"array()\"},\"common\":{\"dbtable\":\"#__ucm_content\",\"key\":\"ucm_id\",\"type\":\"Corecontent\",\"prefix\":\"JTable\",\"config\":\"array()\"}}","","{\"common\":{\"core_content_item_id\":\"id\",\"core_title\":\"name\",\"core_state\":\"published\",\"core_alias\":\"alias\",\"core_created_time\":\"created\",\"core_modified_time\":\"modified\",\"core_body\":\"description\", \"core_hits\":\"null\",\"core_publish_up\":\"publish_up\",\"core_publish_down\":\"publish_down\",\"core_access\":\"access\", \"core_params\":\"params\", \"core_featured\":\"null\", \"core_metadata\":\"metadata\", \"core_language\":\"language\", \"core_images\":\"images\", \"core_urls\":\"link\", \"core_version\":\"version\", \"core_ordering\":\"ordering\", \"core_metakey\":\"metakey\", \"core_metadesc\":\"metadesc\", \"core_catid\":\"catid\", \"core_xreference\":\"null\", \"asset_id\":\"null\"}, \"special\":{\"imptotal\":\"imptotal\", \"impmade\":\"impmade\", \"clicks\":\"clicks\", \"clickurl\":\"clickurl\", \"custombannercode\":\"custombannercode\", \"cid\":\"cid\", \"purchase_type\":\"purchase_type\", \"track_impressions\":\"track_impressions\", \"track_clicks\":\"track_clicks\"}}","","{\"formFile\":\"administrator\\/components\\/com_banners\\/models\\/forms\\/banner.xml\", \"hideFields\":[\"checked_out\",\"checked_out_time\",\"version\", \"reset\"],\"ignoreChanges\":[\"modified_by\", \"modified\", \"checked_out\", \"checked_out_time\", \"version\", \"imptotal\", \"impmade\", \"reset\"], \"convertToInt\":[\"publish_up\", \"publish_down\", \"ordering\"], \"displayLookup\":[{\"sourceColumn\":\"catid\",\"targetTable\":\"#__categories\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"}, {\"sourceColumn\":\"cid\",\"targetTable\":\"#__banner_clients\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"}, {\"sourceColumn\":\"created_by\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"},{\"sourceColumn\":\"modified_by\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"} ]}"),
("10","Banners Category","com_banners.category","{\"special\":{\"dbtable\":\"#__categories\",\"key\":\"id\",\"type\":\"Category\",\"prefix\":\"JTable\",\"config\":\"array()\"},\"common\":{\"dbtable\":\"#__ucm_content\",\"key\":\"ucm_id\",\"type\":\"Corecontent\",\"prefix\":\"JTable\",\"config\":\"array()\"}}","","{\"common\":{\"core_content_item_id\":\"id\",\"core_title\":\"title\",\"core_state\":\"published\",\"core_alias\":\"alias\",\"core_created_time\":\"created_time\",\"core_modified_time\":\"modified_time\",\"core_body\":\"description\", \"core_hits\":\"hits\",\"core_publish_up\":\"null\",\"core_publish_down\":\"null\",\"core_access\":\"access\", \"core_params\":\"params\", \"core_featured\":\"null\", \"core_metadata\":\"metadata\", \"core_language\":\"language\", \"core_images\":\"null\", \"core_urls\":\"null\", \"core_version\":\"version\", \"core_ordering\":\"null\", \"core_metakey\":\"metakey\", \"core_metadesc\":\"metadesc\", \"core_catid\":\"parent_id\", \"core_xreference\":\"null\", \"asset_id\":\"asset_id\"}, \"special\": {\"parent_id\":\"parent_id\",\"lft\":\"lft\",\"rgt\":\"rgt\",\"level\":\"level\",\"path\":\"path\",\"extension\":\"extension\",\"note\":\"note\"}}","","{\"formFile\":\"administrator\\/components\\/com_categories\\/models\\/forms\\/category.xml\", \"hideFields\":[\"asset_id\",\"checked_out\",\"checked_out_time\",\"version\",\"lft\",\"rgt\",\"level\",\"path\",\"extension\"], \"ignoreChanges\":[\"modified_user_id\", \"modified_time\", \"checked_out\", \"checked_out_time\", \"version\", \"hits\", \"path\"], \"convertToInt\":[\"publish_up\", \"publish_down\"], \"displayLookup\":[{\"sourceColumn\":\"created_user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"},{\"sourceColumn\":\"access\",\"targetTable\":\"#__viewlevels\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"},{\"sourceColumn\":\"modified_user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"},{\"sourceColumn\":\"parent_id\",\"targetTable\":\"#__categories\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"}]}"),
("11","Banner Client","com_banners.client","{\"special\":{\"dbtable\":\"#__banner_clients\",\"key\":\"id\",\"type\":\"Client\",\"prefix\":\"BannersTable\"}}","","","","{\"formFile\":\"administrator\\/components\\/com_banners\\/models\\/forms\\/client.xml\", \"hideFields\":[\"checked_out\",\"checked_out_time\"], \"ignoreChanges\":[\"checked_out\", \"checked_out_time\"], \"convertToInt\":[], \"displayLookup\":[]}"),
("12","User Notes","com_users.note","{\"special\":{\"dbtable\":\"#__user_notes\",\"key\":\"id\",\"type\":\"Note\",\"prefix\":\"UsersTable\"}}","","","","{\"formFile\":\"administrator\\/components\\/com_users\\/models\\/forms\\/note.xml\", \"hideFields\":[\"checked_out\",\"checked_out_time\", \"publish_up\", \"publish_down\"],\"ignoreChanges\":[\"modified_user_id\", \"modified_time\", \"checked_out\", \"checked_out_time\"], \"convertToInt\":[\"publish_up\", \"publish_down\"],\"displayLookup\":[{\"sourceColumn\":\"catid\",\"targetTable\":\"#__categories\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"}, {\"sourceColumn\":\"created_user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"}, {\"sourceColumn\":\"user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"}, {\"sourceColumn\":\"modified_user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"}]}"),
("13","User Notes Category","com_users.category","{\"special\":{\"dbtable\":\"#__categories\",\"key\":\"id\",\"type\":\"Category\",\"prefix\":\"JTable\",\"config\":\"array()\"},\"common\":{\"dbtable\":\"#__ucm_content\",\"key\":\"ucm_id\",\"type\":\"Corecontent\",\"prefix\":\"JTable\",\"config\":\"array()\"}}","","{\"common\":{\"core_content_item_id\":\"id\",\"core_title\":\"title\",\"core_state\":\"published\",\"core_alias\":\"alias\",\"core_created_time\":\"created_time\",\"core_modified_time\":\"modified_time\",\"core_body\":\"description\", \"core_hits\":\"hits\",\"core_publish_up\":\"null\",\"core_publish_down\":\"null\",\"core_access\":\"access\", \"core_params\":\"params\", \"core_featured\":\"null\", \"core_metadata\":\"metadata\", \"core_language\":\"language\", \"core_images\":\"null\", \"core_urls\":\"null\", \"core_version\":\"version\", \"core_ordering\":\"null\", \"core_metakey\":\"metakey\", \"core_metadesc\":\"metadesc\", \"core_catid\":\"parent_id\", \"core_xreference\":\"null\", \"asset_id\":\"asset_id\"}, \"special\":{\"parent_id\":\"parent_id\",\"lft\":\"lft\",\"rgt\":\"rgt\",\"level\":\"level\",\"path\":\"path\",\"extension\":\"extension\",\"note\":\"note\"}}","","{\"formFile\":\"administrator\\/components\\/com_categories\\/models\\/forms\\/category.xml\", \"hideFields\":[\"checked_out\",\"checked_out_time\",\"version\",\"lft\",\"rgt\",\"level\",\"path\",\"extension\"], \"ignoreChanges\":[\"modified_user_id\", \"modified_time\", \"checked_out\", \"checked_out_time\", \"version\", \"hits\", \"path\"], \"convertToInt\":[\"publish_up\", \"publish_down\"], \"displayLookup\":[{\"sourceColumn\":\"created_user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"}, {\"sourceColumn\":\"access\",\"targetTable\":\"#__viewlevels\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"},{\"sourceColumn\":\"modified_user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"},{\"sourceColumn\":\"parent_id\",\"targetTable\":\"#__categories\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"}]}");




CREATE TABLE `j4x_contentitem_tag_map` (
  `type_alias` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
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
  `search_term` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `hits` int unsigned NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;






CREATE TABLE `j4x_extensions` (
  `extension_id` int NOT NULL AUTO_INCREMENT,
  `package_id` int NOT NULL DEFAULT '0' COMMENT 'Parent package ID for extensions installed as a package.',
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `element` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `folder` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `client_id` tinyint NOT NULL,
  `enabled` tinyint NOT NULL DEFAULT '0',
  `access` int unsigned NOT NULL DEFAULT '1',
  `protected` tinyint NOT NULL DEFAULT '0',
  `manifest_cache` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `params` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `custom_data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `system_data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `checked_out` int unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int DEFAULT '0',
  `state` int DEFAULT '0',
  PRIMARY KEY (`extension_id`),
  KEY `element_clientid` (`element`,`client_id`),
  KEY `element_folder_clientid` (`element`,`folder`,`client_id`),
  KEY `extension` (`type`,`element`,`folder`,`client_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10001 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


INSERT INTO j4x_extensions VALUES
("1","0","com_mailto","component","com_mailto","","0","1","1","1","{\"name\":\"com_mailto\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_MAILTO_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mailto\"}","","","","0","0000-00-00 00:00:00","0","0"),
("2","0","com_wrapper","component","com_wrapper","","0","1","1","1","{\"name\":\"com_wrapper\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2007 Open Source Matters, Inc.\\n\\t\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_WRAPPER_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"wrapper\"}","","","","0","0000-00-00 00:00:00","0","0"),
("3","0","com_admin","component","com_admin","","1","1","1","1","{\"name\":\"com_admin\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_ADMIN_XML_DESCRIPTION\",\"group\":\"\"}","","","","0","0000-00-00 00:00:00","0","0"),
("4","0","com_banners","component","com_banners","","1","1","1","0","{\"name\":\"com_banners\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_BANNERS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"banners\"}","{\"purchase_type\":\"3\",\"track_impressions\":\"0\",\"track_clicks\":\"0\",\"metakey_prefix\":\"\",\"save_history\":\"1\",\"history_limit\":10}","","","0","0000-00-00 00:00:00","0","0"),
("5","0","com_cache","component","com_cache","","1","1","1","1","{\"name\":\"com_cache\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_CACHE_XML_DESCRIPTION\",\"group\":\"\"}","","","","0","0000-00-00 00:00:00","0","0"),
("6","0","com_categories","component","com_categories","","1","1","1","1","{\"name\":\"com_categories\",\"type\":\"component\",\"creationDate\":\"December 2007\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2007 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_CATEGORIES_XML_DESCRIPTION\",\"group\":\"\"}","","","","0","0000-00-00 00:00:00","0","0"),
("7","0","com_checkin","component","com_checkin","","1","1","1","1","{\"name\":\"com_checkin\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_CHECKIN_XML_DESCRIPTION\",\"group\":\"\"}","","","","0","0000-00-00 00:00:00","0","0"),
("8","0","com_contact","component","com_contact","","1","1","1","0","{\"name\":\"com_contact\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_CONTACT_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"contact\"}","{\"contact_layout\":\"_:default\",\"show_contact_category\":\"hide\",\"save_history\":\"1\",\"history_limit\":10,\"show_contact_list\":\"0\",\"presentation_style\":\"sliders\",\"show_tags\":\"1\",\"show_info\":\"1\",\"show_name\":\"1\",\"show_position\":\"1\",\"show_email\":\"0\",\"show_street_address\":\"1\",\"show_suburb\":\"1\",\"show_state\":\"1\",\"show_postcode\":\"1\",\"show_country\":\"1\",\"show_telephone\":\"1\",\"show_mobile\":\"1\",\"show_fax\":\"1\",\"show_webpage\":\"1\",\"show_image\":\"1\",\"show_misc\":\"1\",\"image\":\"\",\"allow_vcard\":\"0\",\"show_articles\":\"0\",\"articles_display_num\":\"10\",\"show_profile\":\"0\",\"show_user_custom_fields\":[\"-1\"],\"show_links\":\"0\",\"linka_name\":\"\",\"linkb_name\":\"\",\"linkc_name\":\"\",\"linkd_name\":\"\",\"linke_name\":\"\",\"contact_icons\":\"0\",\"icon_address\":\"\",\"icon_email\":\"\",\"icon_telephone\":\"\",\"icon_mobile\":\"\",\"icon_fax\":\"\",\"icon_misc\":\"\",\"category_layout\":\"_:default\",\"show_category_title\":\"1\",\"show_description\":\"1\",\"show_description_image\":\"0\",\"maxLevel\":\"-1\",\"show_subcat_desc\":\"1\",\"show_empty_categories\":\"0\",\"show_cat_items\":\"1\",\"show_cat_tags\":\"1\",\"show_base_description\":\"1\",\"maxLevelcat\":\"-1\",\"show_subcat_desc_cat\":\"1\",\"show_empty_categories_cat\":\"0\",\"show_cat_items_cat\":\"1\",\"filter_field\":\"0\",\"show_pagination_limit\":\"0\",\"show_headings\":\"1\",\"show_image_heading\":\"0\",\"show_position_headings\":\"1\",\"show_email_headings\":\"0\",\"show_telephone_headings\":\"1\",\"show_mobile_headings\":\"0\",\"show_fax_headings\":\"0\",\"show_suburb_headings\":\"1\",\"show_state_headings\":\"1\",\"show_country_headings\":\"1\",\"show_pagination\":\"2\",\"show_pagination_results\":\"1\",\"initial_sort\":\"ordering\",\"captcha\":\"\",\"show_email_form\":\"1\",\"show_email_copy\":\"0\",\"banned_email\":\"\",\"banned_subject\":\"\",\"banned_text\":\"\",\"validate_session\":\"1\",\"custom_reply\":\"0\",\"redirect\":\"\",\"show_feed_link\":\"1\",\"sef_advanced\":0,\"sef_ids\":0,\"custom_fields_enable\":\"1\"}","","","0","0000-00-00 00:00:00","0","0"),
("9","0","com_cpanel","component","com_cpanel","","1","1","1","1","{\"name\":\"com_cpanel\",\"type\":\"component\",\"creationDate\":\"Jun 2007\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2007 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_CPANEL_XML_DESCRIPTION\",\"group\":\"\"}","","","","0","0000-00-00 00:00:00","0","0"),
("10","0","com_installer","component","com_installer","","1","1","1","1","{\"name\":\"com_installer\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_INSTALLER_XML_DESCRIPTION\",\"group\":\"\"}","{\"show_jed_info\":\"1\",\"cachetimeout\":\"6\",\"minimum_stability\":\"4\"}","","","0","0000-00-00 00:00:00","0","0"),
("11","0","com_languages","component","com_languages","","1","1","1","1","{\"name\":\"com_languages\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_LANGUAGES_XML_DESCRIPTION\",\"group\":\"\"}","{\"administrator\":\"en-GB\",\"site\":\"en-GB\"}","","","0","0000-00-00 00:00:00","0","0"),
("12","0","com_login","component","com_login","","1","1","1","1","{\"name\":\"com_login\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_LOGIN_XML_DESCRIPTION\",\"group\":\"\"}","","","","0","0000-00-00 00:00:00","0","0"),
("13","0","com_media","component","com_media","","1","1","0","1","{\"name\":\"com_media\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_MEDIA_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"media\"}","{\"upload_extensions\":\"bmp,csv,doc,gif,ico,jpg,jpeg,odg,odp,ods,odt,pdf,png,ppt,txt,xcf,xls,BMP,CSV,DOC,GIF,ICO,JPG,JPEG,ODG,ODP,ODS,ODT,PDF,PNG,PPT,TXT,XCF,XLS\",\"upload_maxsize\":\"10\",\"file_path\":\"images\",\"image_path\":\"images\",\"restrict_uploads\":\"1\",\"allowed_media_usergroup\":\"3\",\"check_mime\":\"1\",\"image_extensions\":\"bmp,gif,jpg,png\",\"ignore_extensions\":\"\",\"upload_mime\":\"image\\/jpeg,image\\/gif,image\\/png,image\\/bmp,application\\/msword,application\\/excel,application\\/pdf,application\\/powerpoint,text\\/plain,application\\/x-zip\",\"upload_mime_illegal\":\"text\\/html\"}","","","0","0000-00-00 00:00:00","0","0"),
("14","0","com_menus","component","com_menus","","1","1","1","1","{\"name\":\"com_menus\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_MENUS_XML_DESCRIPTION\",\"group\":\"\"}","{\"page_title\":\"\",\"show_page_heading\":0,\"page_heading\":\"\",\"pageclass_sfx\":\"\"}","","","0","0000-00-00 00:00:00","0","0"),
("15","0","com_messages","component","com_messages","","1","1","1","1","{\"name\":\"com_messages\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_MESSAGES_XML_DESCRIPTION\",\"group\":\"\"}","","","","0","0000-00-00 00:00:00","0","0"),
("16","0","com_modules","component","com_modules","","1","1","1","1","{\"name\":\"com_modules\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_MODULES_XML_DESCRIPTION\",\"group\":\"\"}","","","","0","0000-00-00 00:00:00","0","0"),
("17","0","com_newsfeeds","component","com_newsfeeds","","1","1","1","0","{\"name\":\"com_newsfeeds\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_NEWSFEEDS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"newsfeeds\"}","{\"newsfeed_layout\":\"_:default\",\"save_history\":\"1\",\"history_limit\":5,\"show_feed_image\":\"1\",\"show_feed_description\":\"1\",\"show_item_description\":\"1\",\"feed_character_count\":\"0\",\"feed_display_order\":\"des\",\"float_first\":\"right\",\"float_second\":\"right\",\"show_tags\":\"1\",\"category_layout\":\"_:default\",\"show_category_title\":\"1\",\"show_description\":\"1\",\"show_description_image\":\"1\",\"maxLevel\":\"-1\",\"show_empty_categories\":\"0\",\"show_subcat_desc\":\"1\",\"show_cat_items\":\"1\",\"show_cat_tags\":\"1\",\"show_base_description\":\"1\",\"maxLevelcat\":\"-1\",\"show_empty_categories_cat\":\"0\",\"show_subcat_desc_cat\":\"1\",\"show_cat_items_cat\":\"1\",\"filter_field\":\"1\",\"show_pagination_limit\":\"1\",\"show_headings\":\"1\",\"show_articles\":\"0\",\"show_link\":\"1\",\"show_pagination\":\"1\",\"show_pagination_results\":\"1\"}","","","0","0000-00-00 00:00:00","0","0"),
("18","0","com_plugins","component","com_plugins","","1","1","1","1","{\"name\":\"com_plugins\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_PLUGINS_XML_DESCRIPTION\",\"group\":\"\"}","","","","0","0000-00-00 00:00:00","0","0"),
("19","0","com_search","component","com_search","","1","1","1","0","{\"name\":\"com_search\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_SEARCH_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"search\"}","{\"enabled\":\"0\",\"search_phrases\":\"1\",\"search_areas\":\"1\",\"show_date\":\"1\",\"opensearch_name\":\"\",\"opensearch_description\":\"\"}","","","0","0000-00-00 00:00:00","0","0"),
("20","0","com_templates","component","com_templates","","1","1","1","1","{\"name\":\"com_templates\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_TEMPLATES_XML_DESCRIPTION\",\"group\":\"\"}","{\"template_positions_display\":\"0\",\"upload_limit\":\"10\",\"image_formats\":\"gif,bmp,jpg,jpeg,png\",\"source_formats\":\"txt,less,ini,xml,js,php,css,scss,sass\",\"font_formats\":\"woff,ttf,otf\",\"compressed_formats\":\"zip\"}","","","0","0000-00-00 00:00:00","0","0"),
("22","0","com_content","component","com_content","","1","1","0","1","{\"name\":\"com_content\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_CONTENT_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"content\"}","{\"article_layout\":\"_:default\",\"show_title\":\"1\",\"link_titles\":\"1\",\"show_intro\":\"1\",\"show_category\":\"1\",\"link_category\":\"1\",\"show_parent_category\":\"0\",\"link_parent_category\":\"0\",\"show_author\":\"1\",\"link_author\":\"0\",\"show_create_date\":\"0\",\"show_modify_date\":\"0\",\"show_publish_date\":\"1\",\"show_item_navigation\":\"1\",\"show_vote\":\"0\",\"show_readmore\":\"1\",\"show_readmore_title\":\"1\",\"readmore_limit\":\"100\",\"show_icons\":\"1\",\"show_print_icon\":\"1\",\"show_email_icon\":\"0\",\"show_hits\":\"1\",\"show_noauth\":\"0\",\"show_publishing_options\":\"1\",\"show_article_options\":\"1\",\"save_history\":\"1\",\"history_limit\":10,\"show_urls_images_frontend\":\"0\",\"show_urls_images_backend\":\"1\",\"targeta\":0,\"targetb\":0,\"targetc\":0,\"float_intro\":\"left\",\"float_fulltext\":\"left\",\"category_layout\":\"_:blog\",\"show_category_title\":\"0\",\"show_description\":\"0\",\"show_description_image\":\"0\",\"maxLevel\":\"1\",\"show_empty_categories\":\"0\",\"show_no_articles\":\"1\",\"show_subcat_desc\":\"1\",\"show_cat_num_articles\":\"0\",\"show_base_description\":\"1\",\"maxLevelcat\":\"-1\",\"show_empty_categories_cat\":\"0\",\"show_subcat_desc_cat\":\"1\",\"show_cat_num_articles_cat\":\"1\",\"num_leading_articles\":\"1\",\"num_intro_articles\":\"4\",\"num_columns\":\"2\",\"num_links\":\"4\",\"multi_column_order\":\"0\",\"show_subcategory_content\":\"0\",\"show_pagination_limit\":\"1\",\"filter_field\":\"hide\",\"show_headings\":\"1\",\"list_show_date\":\"0\",\"date_format\":\"\",\"list_show_hits\":\"1\",\"list_show_author\":\"1\",\"orderby_pri\":\"order\",\"orderby_sec\":\"rdate\",\"order_date\":\"published\",\"show_pagination\":\"2\",\"show_pagination_results\":\"1\",\"show_feed_link\":\"1\",\"feed_summary\":\"0\"}","","","0","0000-00-00 00:00:00","0","0"),
("23","0","com_config","component","com_config","","1","1","0","1","{\"name\":\"com_config\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_CONFIG_XML_DESCRIPTION\",\"group\":\"\"}","{\"filters\":{\"1\":{\"filter_type\":\"NH\",\"filter_tags\":\"\",\"filter_attributes\":\"\"},\"9\":{\"filter_type\":\"NH\",\"filter_tags\":\"\",\"filter_attributes\":\"\"},\"6\":{\"filter_type\":\"BL\",\"filter_tags\":\"\",\"filter_attributes\":\"\"},\"7\":{\"filter_type\":\"BL\",\"filter_tags\":\"\",\"filter_attributes\":\"\"},\"2\":{\"filter_type\":\"NH\",\"filter_tags\":\"\",\"filter_attributes\":\"\"},\"3\":{\"filter_type\":\"BL\",\"filter_tags\":\"\",\"filter_attributes\":\"\"},\"4\":{\"filter_type\":\"BL\",\"filter_tags\":\"\",\"filter_attributes\":\"\"},\"5\":{\"filter_type\":\"BL\",\"filter_tags\":\"\",\"filter_attributes\":\"\"},\"8\":{\"filter_type\":\"NONE\",\"filter_tags\":\"\",\"filter_attributes\":\"\"}}}","","","0","0000-00-00 00:00:00","0","0"),
("24","0","com_redirect","component","com_redirect","","1","1","0","1","{\"name\":\"com_redirect\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_REDIRECT_XML_DESCRIPTION\",\"group\":\"\"}","","","","0","0000-00-00 00:00:00","0","0"),
("25","0","com_users","component","com_users","","1","1","0","1","{\"name\":\"com_users\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_USERS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"users\"}","{\"allowUserRegistration\":\"0\",\"new_usertype\":\"2\",\"guest_usergroup\":\"9\",\"sendpassword\":\"0\",\"useractivation\":\"2\",\"mail_to_admin\":\"1\",\"captcha\":\"\",\"frontend_userparams\":\"1\",\"site_language\":\"0\",\"change_login_name\":\"0\",\"reset_count\":\"10\",\"reset_time\":\"1\",\"minimum_length\":\"4\",\"minimum_integers\":\"0\",\"minimum_symbols\":\"0\",\"minimum_uppercase\":\"0\",\"save_history\":\"1\",\"history_limit\":5,\"mailSubjectPrefix\":\"\",\"mailBodySuffix\":\"\"}","","","0","0000-00-00 00:00:00","0","0"),
("27","0","com_finder","component","com_finder","","1","1","0","0","{\"name\":\"com_finder\",\"type\":\"component\",\"creationDate\":\"August 2011\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2011 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_FINDER_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"finder\"}","{\"enabled\":\"0\",\"show_description\":\"1\",\"description_length\":255,\"allow_empty_query\":\"0\",\"show_url\":\"1\",\"show_autosuggest\":\"1\",\"show_suggested_query\":\"1\",\"show_explained_query\":\"1\",\"show_advanced\":\"1\",\"show_advanced_tips\":\"1\",\"expand_advanced\":\"0\",\"show_date_filters\":\"0\",\"sort_order\":\"relevance\",\"sort_direction\":\"desc\",\"highlight_terms\":\"1\",\"opensearch_name\":\"\",\"opensearch_description\":\"\",\"batch_size\":\"50\",\"memory_table_limit\":30000,\"title_multiplier\":\"1.7\",\"text_multiplier\":\"0.7\",\"meta_multiplier\":\"1.2\",\"path_multiplier\":\"2.0\",\"misc_multiplier\":\"0.3\",\"stem\":\"1\",\"stemmer\":\"snowball\",\"enable_logging\":\"0\"}","","","0","0000-00-00 00:00:00","0","0"),
("28","0","com_joomlaupdate","component","com_joomlaupdate","","1","1","0","1","{\"name\":\"com_joomlaupdate\",\"type\":\"component\",\"creationDate\":\"February 2012\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2012 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.10.1\",\"description\":\"COM_JOOMLAUPDATE_XML_DESCRIPTION\",\"group\":\"\"}","{\"updatesource\":\"default\",\"customurl\":\"\"}","","","0","0000-00-00 00:00:00","0","0"),
("29","0","com_tags","component","com_tags","","1","1","1","1","{\"name\":\"com_tags\",\"type\":\"component\",\"creationDate\":\"December 2013\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2013 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.1.0\",\"description\":\"COM_TAGS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"tags\"}","{\"tag_layout\":\"_:default\",\"save_history\":\"1\",\"history_limit\":5,\"show_tag_title\":\"0\",\"tag_list_show_tag_image\":\"0\",\"tag_list_show_tag_description\":\"0\",\"tag_list_image\":\"\",\"tag_list_orderby\":\"title\",\"tag_list_orderby_direction\":\"ASC\",\"show_headings\":\"0\",\"tag_list_show_date\":\"0\",\"tag_list_show_item_image\":\"0\",\"tag_list_show_item_description\":\"0\",\"tag_list_item_maximum_characters\":0,\"return_any_or_all\":\"1\",\"include_children\":\"0\",\"maximum\":200,\"tag_list_language_filter\":\"all\",\"tags_layout\":\"_:default\",\"all_tags_orderby\":\"title\",\"all_tags_orderby_direction\":\"ASC\",\"all_tags_show_tag_image\":\"0\",\"all_tags_show_tag_description\":\"0\",\"all_tags_tag_maximum_characters\":20,\"all_tags_show_tag_hits\":\"0\",\"filter_field\":\"1\",\"show_pagination_limit\":\"1\",\"show_pagination\":\"2\",\"show_pagination_results\":\"1\",\"tag_field_ajax_mode\":\"1\",\"show_feed_link\":\"1\"}","","","0","0000-00-00 00:00:00","0","0"),
("30","0","com_contenthistory","component","com_contenthistory","","1","1","1","0","{\"name\":\"com_contenthistory\",\"type\":\"component\",\"creationDate\":\"May 2013\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2013 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.2.0\",\"description\":\"COM_CONTENTHISTORY_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"contenthistory\"}","","","","0","0000-00-00 00:00:00","0","0"),
("31","0","com_ajax","component","com_ajax","","1","1","1","1","{\"name\":\"com_ajax\",\"type\":\"component\",\"creationDate\":\"August 2013\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2013 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.2.0\",\"description\":\"COM_AJAX_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"ajax\"}","","","","0","0000-00-00 00:00:00","0","0"),
("32","0","com_postinstall","component","com_postinstall","","1","1","1","1","{\"name\":\"com_postinstall\",\"type\":\"component\",\"creationDate\":\"September 2013\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2013 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.2.0\",\"description\":\"COM_POSTINSTALL_XML_DESCRIPTION\",\"group\":\"\"}","","","","0","0000-00-00 00:00:00","0","0"),
("33","0","com_fields","component","com_fields","","1","1","1","0","{\"name\":\"com_fields\",\"type\":\"component\",\"creationDate\":\"March 2016\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2016 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"COM_FIELDS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"fields\"}","","","","0","0000-00-00 00:00:00","0","0"),
("34","0","com_associations","component","com_associations","","1","1","1","0","{\"name\":\"com_associations\",\"type\":\"component\",\"creationDate\":\"January 2017\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2017 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"COM_ASSOCIATIONS_XML_DESCRIPTION\",\"group\":\"\"}","","","","0","0000-00-00 00:00:00","0","0"),
("35","0","com_privacy","component","com_privacy","","1","1","1","1","{\"name\":\"com_privacy\",\"type\":\"component\",\"creationDate\":\"May 2018\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2018 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.9.0\",\"description\":\"COM_PRIVACY_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"privacy\"}","","","","0","0000-00-00 00:00:00","0","0"),
("36","0","com_actionlogs","component","com_actionlogs","","1","1","1","1","{\"name\":\"com_actionlogs\",\"type\":\"component\",\"creationDate\":\"May 2018\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2018 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.9.0\",\"description\":\"COM_ACTIONLOGS_XML_DESCRIPTION\",\"group\":\"\"}","{\"ip_logging\":0,\"csv_delimiter\":\",\",\"loggable_extensions\":[\"com_banners\",\"com_cache\",\"com_categories\",\"com_checkin\",\"com_config\",\"com_contact\",\"com_content\",\"com_installer\",\"com_media\",\"com_menus\",\"com_messages\",\"com_modules\",\"com_newsfeeds\",\"com_plugins\",\"com_redirect\",\"com_tags\",\"com_templates\",\"com_users\"]}","","","0","0000-00-00 00:00:00","0","0"),
("102","0","LIB_PHPUTF8","library","phputf8","","0","1","1","1","{\"name\":\"LIB_PHPUTF8\",\"type\":\"library\",\"creationDate\":\"2006\",\"author\":\"Harry Fuecks\",\"copyright\":\"Copyright various authors\",\"authorEmail\":\"hfuecks@gmail.com\",\"authorUrl\":\"http:\\/\\/sourceforge.net\\/projects\\/phputf8\",\"version\":\"0.5\",\"description\":\"LIB_PHPUTF8_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"phputf8\"}","","","","0","0000-00-00 00:00:00","0","0"),
("103","0","LIB_JOOMLA","library","joomla","","0","1","1","1","{\"name\":\"LIB_JOOMLA\",\"type\":\"library\",\"creationDate\":\"2008\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2008 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"https:\\/\\/www.joomla.org\",\"version\":\"13.1\",\"description\":\"LIB_JOOMLA_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"joomla\"}","{\"mediaversion\":\"1f59c185e55d31dfe90c6af215d6bc76\"}","","","0","0000-00-00 00:00:00","0","0"),
("104","0","LIB_IDNA","library","idna_convert","","0","1","1","1","{\"name\":\"LIB_IDNA\",\"type\":\"library\",\"creationDate\":\"2004\",\"author\":\"phlyLabs\",\"copyright\":\"2004-2011 phlyLabs Berlin, http:\\/\\/phlylabs.de\",\"authorEmail\":\"phlymail@phlylabs.de\",\"authorUrl\":\"http:\\/\\/phlylabs.de\",\"version\":\"0.8.0\",\"description\":\"LIB_IDNA_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"idna_convert\"}","","","","0","0000-00-00 00:00:00","0","0"),
("105","0","FOF","library","fof","","0","1","1","1","{\"name\":\"FOF\",\"type\":\"library\",\"creationDate\":\"2015-04-22 13:15:32\",\"author\":\"Nicholas K. Dionysopoulos \\/ Akeeba Ltd\",\"copyright\":\"(C)2011-2015 Nicholas K. Dionysopoulos\",\"authorEmail\":\"nicholas@akeebabackup.com\",\"authorUrl\":\"https:\\/\\/www.akeebabackup.com\",\"version\":\"2.4.3\",\"description\":\"LIB_FOF_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"fof\"}","","","","0","0000-00-00 00:00:00","0","0"),
("106","0","LIB_PHPASS","library","phpass","","0","1","1","1","{\"name\":\"LIB_PHPASS\",\"type\":\"library\",\"creationDate\":\"2004-2006\",\"author\":\"Solar Designer\",\"copyright\":\"\",\"authorEmail\":\"solar@openwall.com\",\"authorUrl\":\"http:\\/\\/www.openwall.com\\/phpass\\/\",\"version\":\"0.3\",\"description\":\"LIB_PHPASS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"phpass\"}","","","","0","0000-00-00 00:00:00","0","0"),
("200","0","mod_articles_archive","module","mod_articles_archive","","0","1","1","0","{\"name\":\"mod_articles_archive\",\"type\":\"module\",\"creationDate\":\"July 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_ARTICLES_ARCHIVE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_articles_archive\"}","","","","0","0000-00-00 00:00:00","0","0"),
("201","0","mod_articles_latest","module","mod_articles_latest","","0","1","1","0","{\"name\":\"mod_articles_latest\",\"type\":\"module\",\"creationDate\":\"July 2004\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_LATEST_NEWS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_articles_latest\"}","","","","0","0000-00-00 00:00:00","0","0"),
("202","0","mod_articles_popular","module","mod_articles_popular","","0","1","1","0","{\"name\":\"mod_articles_popular\",\"type\":\"module\",\"creationDate\":\"July 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_POPULAR_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_articles_popular\"}","","","","0","0000-00-00 00:00:00","0","0"),
("203","0","mod_banners","module","mod_banners","","0","1","1","0","{\"name\":\"mod_banners\",\"type\":\"module\",\"creationDate\":\"July 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_BANNERS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_banners\"}","","","","0","0000-00-00 00:00:00","0","0"),
("204","0","mod_breadcrumbs","module","mod_breadcrumbs","","0","1","1","1","{\"name\":\"mod_breadcrumbs\",\"type\":\"module\",\"creationDate\":\"July 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_BREADCRUMBS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_breadcrumbs\"}","","","","0","0000-00-00 00:00:00","0","0"),
("205","0","mod_custom","module","mod_custom","","0","1","1","1","{\"name\":\"mod_custom\",\"type\":\"module\",\"creationDate\":\"July 2004\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_CUSTOM_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_custom\"}","","","","0","0000-00-00 00:00:00","0","0"),
("206","0","mod_feed","module","mod_feed","","0","1","1","0","{\"name\":\"mod_feed\",\"type\":\"module\",\"creationDate\":\"July 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_FEED_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_feed\"}","","","","0","0000-00-00 00:00:00","0","0"),
("207","0","mod_footer","module","mod_footer","","0","1","1","0","{\"name\":\"mod_footer\",\"type\":\"module\",\"creationDate\":\"July 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_FOOTER_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_footer\"}","","","","0","0000-00-00 00:00:00","0","0"),
("208","0","mod_login","module","mod_login","","0","1","1","1","{\"name\":\"mod_login\",\"type\":\"module\",\"creationDate\":\"July 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_LOGIN_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_login\"}","","","","0","0000-00-00 00:00:00","0","0"),
("209","0","mod_menu","module","mod_menu","","0","1","1","1","{\"name\":\"mod_menu\",\"type\":\"module\",\"creationDate\":\"July 2004\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_MENU_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_menu\"}","","","","0","0000-00-00 00:00:00","0","0"),
("210","0","mod_articles_news","module","mod_articles_news","","0","1","1","0","{\"name\":\"mod_articles_news\",\"type\":\"module\",\"creationDate\":\"July 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_ARTICLES_NEWS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_articles_news\"}","","","","0","0000-00-00 00:00:00","0","0"),
("211","0","mod_random_image","module","mod_random_image","","0","1","1","0","{\"name\":\"mod_random_image\",\"type\":\"module\",\"creationDate\":\"July 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_RANDOM_IMAGE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_random_image\"}","","","","0","0000-00-00 00:00:00","0","0"),
("212","0","mod_related_items","module","mod_related_items","","0","1","1","0","{\"name\":\"mod_related_items\",\"type\":\"module\",\"creationDate\":\"July 2004\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_RELATED_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_related_items\"}","","","","0","0000-00-00 00:00:00","0","0"),
("213","0","mod_search","module","mod_search","","0","1","1","0","{\"name\":\"mod_search\",\"type\":\"module\",\"creationDate\":\"July 2004\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_SEARCH_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_search\"}","","","","0","0000-00-00 00:00:00","0","0"),
("214","0","mod_stats","module","mod_stats","","0","1","1","0","{\"name\":\"mod_stats\",\"type\":\"module\",\"creationDate\":\"July 2004\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_STATS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_stats\"}","","","","0","0000-00-00 00:00:00","0","0"),
("215","0","mod_syndicate","module","mod_syndicate","","0","1","1","1","{\"name\":\"mod_syndicate\",\"type\":\"module\",\"creationDate\":\"May 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_SYNDICATE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_syndicate\"}","","","","0","0000-00-00 00:00:00","0","0"),
("216","0","mod_users_latest","module","mod_users_latest","","0","1","1","0","{\"name\":\"mod_users_latest\",\"type\":\"module\",\"creationDate\":\"December 2009\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2009 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_USERS_LATEST_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_users_latest\"}","","","","0","0000-00-00 00:00:00","0","0"),
("218","0","mod_whosonline","module","mod_whosonline","","0","1","1","0","{\"name\":\"mod_whosonline\",\"type\":\"module\",\"creationDate\":\"July 2004\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_WHOSONLINE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_whosonline\"}","","","","0","0000-00-00 00:00:00","0","0"),
("219","0","mod_wrapper","module","mod_wrapper","","0","1","1","0","{\"name\":\"mod_wrapper\",\"type\":\"module\",\"creationDate\":\"October 2004\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_WRAPPER_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_wrapper\"}","","","","0","0000-00-00 00:00:00","0","0"),
("220","0","mod_articles_category","module","mod_articles_category","","0","1","1","0","{\"name\":\"mod_articles_category\",\"type\":\"module\",\"creationDate\":\"February 2010\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2010 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_ARTICLES_CATEGORY_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_articles_category\"}","","","","0","0000-00-00 00:00:00","0","0"),
("221","0","mod_articles_categories","module","mod_articles_categories","","0","1","1","0","{\"name\":\"mod_articles_categories\",\"type\":\"module\",\"creationDate\":\"February 2010\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2010 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_ARTICLES_CATEGORIES_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_articles_categories\"}","","","","0","0000-00-00 00:00:00","0","0"),
("222","0","mod_languages","module","mod_languages","","0","1","1","1","{\"name\":\"mod_languages\",\"type\":\"module\",\"creationDate\":\"February 2010\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2010 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.5.0\",\"description\":\"MOD_LANGUAGES_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_languages\"}","","","","0","0000-00-00 00:00:00","0","0"),
("223","0","mod_finder","module","mod_finder","","0","1","0","0","{\"name\":\"mod_finder\",\"type\":\"module\",\"creationDate\":\"August 2011\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2011 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_FINDER_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_finder\"}","","","","0","0000-00-00 00:00:00","0","0"),
("300","0","mod_custom","module","mod_custom","","1","1","1","1","{\"name\":\"mod_custom\",\"type\":\"module\",\"creationDate\":\"July 2004\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_CUSTOM_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_custom\"}","","","","0","0000-00-00 00:00:00","0","0"),
("301","0","mod_feed","module","mod_feed","","1","1","1","0","{\"name\":\"mod_feed\",\"type\":\"module\",\"creationDate\":\"July 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_FEED_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_feed\"}","","","","0","0000-00-00 00:00:00","0","0"),
("302","0","mod_latest","module","mod_latest","","1","1","1","0","{\"name\":\"mod_latest\",\"type\":\"module\",\"creationDate\":\"July 2004\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_LATEST_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_latest\"}","","","","0","0000-00-00 00:00:00","0","0"),
("303","0","mod_logged","module","mod_logged","","1","1","1","0","{\"name\":\"mod_logged\",\"type\":\"module\",\"creationDate\":\"January 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_LOGGED_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_logged\"}","","","","0","0000-00-00 00:00:00","0","0"),
("304","0","mod_login","module","mod_login","","1","1","1","1","{\"name\":\"mod_login\",\"type\":\"module\",\"creationDate\":\"March 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_LOGIN_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_login\"}","","","","0","0000-00-00 00:00:00","0","0"),
("305","0","mod_menu","module","mod_menu","","1","1","1","0","{\"name\":\"mod_menu\",\"type\":\"module\",\"creationDate\":\"March 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_MENU_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_menu\"}","","","","0","0000-00-00 00:00:00","0","0"),
("307","0","mod_popular","module","mod_popular","","1","1","1","0","{\"name\":\"mod_popular\",\"type\":\"module\",\"creationDate\":\"July 2004\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_POPULAR_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_popular\"}","","","","0","0000-00-00 00:00:00","0","0"),
("308","0","mod_quickicon","module","mod_quickicon","","1","1","1","1","{\"name\":\"mod_quickicon\",\"type\":\"module\",\"creationDate\":\"November 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_QUICKICON_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_quickicon\"}","","","","0","0000-00-00 00:00:00","0","0"),
("309","0","mod_status","module","mod_status","","1","1","1","0","{\"name\":\"mod_status\",\"type\":\"module\",\"creationDate\":\"February 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_STATUS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_status\"}","","","","0","0000-00-00 00:00:00","0","0"),
("310","0","mod_submenu","module","mod_submenu","","1","1","1","0","{\"name\":\"mod_submenu\",\"type\":\"module\",\"creationDate\":\"February 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_SUBMENU_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_submenu\"}","","","","0","0000-00-00 00:00:00","0","0"),
("311","0","mod_title","module","mod_title","","1","1","1","0","{\"name\":\"mod_title\",\"type\":\"module\",\"creationDate\":\"November 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_TITLE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_title\"}","","","","0","0000-00-00 00:00:00","0","0"),
("312","0","mod_toolbar","module","mod_toolbar","","1","1","1","1","{\"name\":\"mod_toolbar\",\"type\":\"module\",\"creationDate\":\"November 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_TOOLBAR_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_toolbar\"}","","","","0","0000-00-00 00:00:00","0","0"),
("313","0","mod_multilangstatus","module","mod_multilangstatus","","1","1","1","0","{\"name\":\"mod_multilangstatus\",\"type\":\"module\",\"creationDate\":\"September 2011\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2011 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_MULTILANGSTATUS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_multilangstatus\"}","{\"cache\":\"0\"}","","","0","0000-00-00 00:00:00","0","0"),
("314","0","mod_version","module","mod_version","","1","1","1","0","{\"name\":\"mod_version\",\"type\":\"module\",\"creationDate\":\"January 2012\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2012 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_VERSION_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_version\"}","{\"format\":\"short\",\"product\":\"1\",\"cache\":\"0\"}","","","0","0000-00-00 00:00:00","0","0"),
("315","0","mod_stats_admin","module","mod_stats_admin","","1","1","1","0","{\"name\":\"mod_stats_admin\",\"type\":\"module\",\"creationDate\":\"July 2004\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_STATS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_stats_admin\"}","{\"serverinfo\":\"0\",\"siteinfo\":\"0\",\"counter\":\"0\",\"increase\":\"0\",\"cache\":\"1\",\"cache_time\":\"900\",\"cachemode\":\"static\"}","","","0","0000-00-00 00:00:00","0","0"),
("316","0","mod_tags_popular","module","mod_tags_popular","","0","1","1","0","{\"name\":\"mod_tags_popular\",\"type\":\"module\",\"creationDate\":\"January 2013\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2013 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.1.0\",\"description\":\"MOD_TAGS_POPULAR_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_tags_popular\"}","{\"maximum\":\"5\",\"timeframe\":\"alltime\",\"owncache\":\"1\"}","","","0","0000-00-00 00:00:00","0","0"),
("317","0","mod_tags_similar","module","mod_tags_similar","","0","1","1","0","{\"name\":\"mod_tags_similar\",\"type\":\"module\",\"creationDate\":\"January 2013\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2013 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.1.0\",\"description\":\"MOD_TAGS_SIMILAR_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_tags_similar\"}","{\"maximum\":\"5\",\"matchtype\":\"any\",\"owncache\":\"1\"}","","","0","0000-00-00 00:00:00","0","0"),
("318","0","mod_sampledata","module","mod_sampledata","","1","1","1","0","{\"name\":\"mod_sampledata\",\"type\":\"module\",\"creationDate\":\"July 2017\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2017 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.8.0\",\"description\":\"MOD_SAMPLEDATA_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_sampledata\"}","{}","","","0","0000-00-00 00:00:00","0","0"),
("319","0","mod_latestactions","module","mod_latestactions","","1","1","1","0","{\"name\":\"mod_latestactions\",\"type\":\"module\",\"creationDate\":\"May 2018\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2018 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.9.0\",\"description\":\"MOD_LATESTACTIONS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_latestactions\"}","{}","","","0","0000-00-00 00:00:00","0","0"),
("320","0","mod_privacy_dashboard","module","mod_privacy_dashboard","","1","1","1","0","{\"name\":\"mod_privacy_dashboard\",\"type\":\"module\",\"creationDate\":\"June 2018\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2018 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.9.0\",\"description\":\"MOD_PRIVACY_DASHBOARD_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_privacy_dashboard\"}","{}","","","0","0000-00-00 00:00:00","0","0"),
("400","0","plg_authentication_gmail","plugin","gmail","authentication","0","0","1","0","{\"name\":\"plg_authentication_gmail\",\"type\":\"plugin\",\"creationDate\":\"February 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_GMAIL_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"gmail\"}","{\"applysuffix\":\"0\",\"suffix\":\"\",\"verifypeer\":\"1\",\"user_blacklist\":\"\"}","","","0","0000-00-00 00:00:00","1","0"),
("401","0","plg_authentication_joomla","plugin","joomla","authentication","0","1","1","1","{\"name\":\"plg_authentication_joomla\",\"type\":\"plugin\",\"creationDate\":\"November 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_AUTH_JOOMLA_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"joomla\"}","","","","0","0000-00-00 00:00:00","0","0"),
("402","0","plg_authentication_ldap","plugin","ldap","authentication","0","0","1","0","{\"name\":\"plg_authentication_ldap\",\"type\":\"plugin\",\"creationDate\":\"November 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_LDAP_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"ldap\"}","{\"host\":\"\",\"port\":\"389\",\"use_ldapV3\":\"0\",\"negotiate_tls\":\"0\",\"no_referrals\":\"0\",\"auth_method\":\"bind\",\"base_dn\":\"\",\"search_string\":\"\",\"users_dn\":\"\",\"username\":\"admin\",\"password\":\"bobby7\",\"ldap_fullname\":\"fullName\",\"ldap_email\":\"mail\",\"ldap_uid\":\"uid\"}","","","0","0000-00-00 00:00:00","3","0"),
("403","0","plg_content_contact","plugin","contact","content","0","1","1","0","{\"name\":\"plg_content_contact\",\"type\":\"plugin\",\"creationDate\":\"January 2014\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2014 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.2.2\",\"description\":\"PLG_CONTENT_CONTACT_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"contact\"}","","","","0","0000-00-00 00:00:00","1","0"),
("404","0","plg_content_emailcloak","plugin","emailcloak","content","0","1","1","0","{\"name\":\"plg_content_emailcloak\",\"type\":\"plugin\",\"creationDate\":\"November 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_CONTENT_EMAILCLOAK_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"emailcloak\"}","{\"mode\":\"1\"}","","","0","0000-00-00 00:00:00","1","0"),
("406","0","plg_content_loadmodule","plugin","loadmodule","content","0","1","1","0","{\"name\":\"plg_content_loadmodule\",\"type\":\"plugin\",\"creationDate\":\"November 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_LOADMODULE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"loadmodule\"}","{\"style\":\"xhtml\"}","","","0","2011-09-18 15:22:50","0","0"),
("407","0","plg_content_pagebreak","plugin","pagebreak","content","0","1","1","0","{\"name\":\"plg_content_pagebreak\",\"type\":\"plugin\",\"creationDate\":\"November 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_CONTENT_PAGEBREAK_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"pagebreak\"}","{\"title\":\"1\",\"multipage_toc\":\"1\",\"showall\":\"1\"}","","","0","0000-00-00 00:00:00","4","0"),
("408","0","plg_content_pagenavigation","plugin","pagenavigation","content","0","1","1","0","{\"name\":\"plg_content_pagenavigation\",\"type\":\"plugin\",\"creationDate\":\"January 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_PAGENAVIGATION_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"pagenavigation\"}","{\"position\":\"1\"}","","","0","0000-00-00 00:00:00","5","0"),
("409","0","plg_content_vote","plugin","vote","content","0","0","1","0","{\"name\":\"plg_content_vote\",\"type\":\"plugin\",\"creationDate\":\"November 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_VOTE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"vote\"}","","","","0","0000-00-00 00:00:00","6","0"),
("410","0","plg_editors_codemirror","plugin","codemirror","editors","0","1","1","1","{\"name\":\"plg_editors_codemirror\",\"type\":\"plugin\",\"creationDate\":\"28 March 2011\",\"author\":\"Marijn Haverbeke\",\"copyright\":\"Copyright (C) 2014 - 2021 by Marijn Haverbeke <marijnh@gmail.com> and others\",\"authorEmail\":\"marijnh@gmail.com\",\"authorUrl\":\"https:\\/\\/codemirror.net\\/\",\"version\":\"5.60.0\",\"description\":\"PLG_CODEMIRROR_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"codemirror\"}","{\"lineNumbers\":\"1\",\"lineWrapping\":\"1\",\"matchTags\":\"1\",\"matchBrackets\":\"1\",\"marker-gutter\":\"1\",\"autoCloseTags\":\"1\",\"autoCloseBrackets\":\"1\",\"autoFocus\":\"1\",\"theme\":\"default\",\"tabmode\":\"indent\"}","","","0","0000-00-00 00:00:00","1","0"),
("411","0","plg_editors_none","plugin","none","editors","0","1","1","1","{\"name\":\"plg_editors_none\",\"type\":\"plugin\",\"creationDate\":\"September 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_NONE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"none\"}","","","","0","0000-00-00 00:00:00","2","0"),
("412","0","plg_editors_tinymce","plugin","tinymce","editors","0","1","1","0","{\"name\":\"plg_editors_tinymce\",\"type\":\"plugin\",\"creationDate\":\"2005-2020\",\"author\":\"Tiny Technologies, Inc\",\"copyright\":\"Tiny Technologies, Inc\",\"authorEmail\":\"N\\/A\",\"authorUrl\":\"https:\\/\\/www.tiny.cloud\",\"version\":\"4.5.12\",\"description\":\"PLG_TINY_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"tinymce\"}","{\"configuration\":{\"toolbars\":{\"2\":{\"toolbar1\":[\"bold\",\"underline\",\"strikethrough\",\"|\",\"undo\",\"redo\",\"|\",\"bullist\",\"numlist\",\"|\",\"pastetext\"]},\"1\":{\"menu\":[\"edit\",\"insert\",\"view\",\"format\",\"table\",\"tools\"],\"toolbar1\":[\"bold\",\"italic\",\"underline\",\"strikethrough\",\"|\",\"alignleft\",\"aligncenter\",\"alignright\",\"alignjustify\",\"|\",\"formatselect\",\"|\",\"bullist\",\"numlist\",\"|\",\"outdent\",\"indent\",\"|\",\"undo\",\"redo\",\"|\",\"link\",\"unlink\",\"anchor\",\"code\",\"|\",\"hr\",\"table\",\"|\",\"subscript\",\"superscript\",\"|\",\"charmap\",\"pastetext\",\"preview\"]},\"0\":{\"menu\":[\"edit\",\"insert\",\"view\",\"format\",\"table\",\"tools\"],\"toolbar1\":[\"bold\",\"italic\",\"underline\",\"strikethrough\",\"|\",\"alignleft\",\"aligncenter\",\"alignright\",\"alignjustify\",\"|\",\"styleselect\",\"|\",\"formatselect\",\"fontselect\",\"fontsizeselect\",\"|\",\"searchreplace\",\"|\",\"bullist\",\"numlist\",\"|\",\"outdent\",\"indent\",\"|\",\"undo\",\"redo\",\"|\",\"link\",\"unlink\",\"anchor\",\"image\",\"|\",\"code\",\"|\",\"forecolor\",\"backcolor\",\"|\",\"fullscreen\",\"|\",\"table\",\"|\",\"subscript\",\"superscript\",\"|\",\"charmap\",\"emoticons\",\"media\",\"hr\",\"ltr\",\"rtl\",\"|\",\"cut\",\"copy\",\"paste\",\"pastetext\",\"|\",\"visualchars\",\"visualblocks\",\"nonbreaking\",\"blockquote\",\"template\",\"|\",\"print\",\"preview\",\"codesample\",\"insertdatetime\",\"removeformat\"]}},\"setoptions\":{\"2\":{\"access\":[\"1\"],\"skin\":\"0\",\"skin_admin\":\"0\",\"mobile\":\"0\",\"drag_drop\":\"1\",\"path\":\"\",\"entity_encoding\":\"raw\",\"lang_mode\":\"1\",\"text_direction\":\"ltr\",\"content_css\":\"1\",\"content_css_custom\":\"\",\"relative_urls\":\"1\",\"newlines\":\"0\",\"use_config_textfilters\":\"0\",\"invalid_elements\":\"script,applet,iframe\",\"valid_elements\":\"\",\"extended_elements\":\"\",\"resizing\":\"1\",\"resize_horizontal\":\"1\",\"element_path\":\"1\",\"wordcount\":\"1\",\"image_advtab\":\"0\",\"advlist\":\"1\",\"autosave\":\"1\",\"contextmenu\":\"1\",\"custom_plugin\":\"\",\"custom_button\":\"\"},\"1\":{\"access\":[\"6\",\"2\"],\"skin\":\"0\",\"skin_admin\":\"0\",\"mobile\":\"0\",\"drag_drop\":\"1\",\"path\":\"\",\"entity_encoding\":\"raw\",\"lang_mode\":\"1\",\"text_direction\":\"ltr\",\"content_css\":\"1\",\"content_css_custom\":\"\",\"relative_urls\":\"1\",\"newlines\":\"0\",\"use_config_textfilters\":\"0\",\"invalid_elements\":\"script,applet,iframe\",\"valid_elements\":\"\",\"extended_elements\":\"\",\"resizing\":\"1\",\"resize_horizontal\":\"1\",\"element_path\":\"1\",\"wordcount\":\"1\",\"image_advtab\":\"0\",\"advlist\":\"1\",\"autosave\":\"1\",\"contextmenu\":\"1\",\"custom_plugin\":\"\",\"custom_button\":\"\"},\"0\":{\"access\":[\"7\",\"4\",\"8\"],\"skin\":\"0\",\"skin_admin\":\"0\",\"mobile\":\"0\",\"drag_drop\":\"1\",\"path\":\"\",\"entity_encoding\":\"raw\",\"lang_mode\":\"1\",\"text_direction\":\"ltr\",\"content_css\":\"1\",\"content_css_custom\":\"\",\"relative_urls\":\"1\",\"newlines\":\"0\",\"use_config_textfilters\":\"0\",\"invalid_elements\":\"script,applet,iframe\",\"valid_elements\":\"\",\"extended_elements\":\"\",\"resizing\":\"1\",\"resize_horizontal\":\"1\",\"element_path\":\"1\",\"wordcount\":\"1\",\"image_advtab\":\"1\",\"advlist\":\"1\",\"autosave\":\"1\",\"contextmenu\":\"1\",\"custom_plugin\":\"\",\"custom_button\":\"\"}}},\"sets_amount\":3,\"html_height\":\"550\",\"html_width\":\"750\"}","","","0","0000-00-00 00:00:00","3","0"),
("413","0","plg_editors-xtd_article","plugin","article","editors-xtd","0","1","1","0","{\"name\":\"plg_editors-xtd_article\",\"type\":\"plugin\",\"creationDate\":\"October 2009\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2009 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_ARTICLE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"article\"}","","","","0","0000-00-00 00:00:00","1","0"),
("414","0","plg_editors-xtd_image","plugin","image","editors-xtd","0","1","1","0","{\"name\":\"plg_editors-xtd_image\",\"type\":\"plugin\",\"creationDate\":\"August 2004\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_IMAGE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"image\"}","","","","0","0000-00-00 00:00:00","2","0"),
("415","0","plg_editors-xtd_pagebreak","plugin","pagebreak","editors-xtd","0","1","1","0","{\"name\":\"plg_editors-xtd_pagebreak\",\"type\":\"plugin\",\"creationDate\":\"August 2004\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_EDITORSXTD_PAGEBREAK_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"pagebreak\"}","","","","0","0000-00-00 00:00:00","3","0"),
("416","0","plg_editors-xtd_readmore","plugin","readmore","editors-xtd","0","1","1","0","{\"name\":\"plg_editors-xtd_readmore\",\"type\":\"plugin\",\"creationDate\":\"March 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_READMORE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"readmore\"}","","","","0","0000-00-00 00:00:00","4","0"),
("417","0","plg_search_categories","plugin","categories","search","0","1","1","0","{\"name\":\"plg_search_categories\",\"type\":\"plugin\",\"creationDate\":\"November 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_SEARCH_CATEGORIES_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"categories\"}","{\"search_limit\":\"50\",\"search_content\":\"1\",\"search_archived\":\"1\"}","","","0","0000-00-00 00:00:00","0","0"),
("418","0","plg_search_contacts","plugin","contacts","search","0","1","1","0","{\"name\":\"plg_search_contacts\",\"type\":\"plugin\",\"creationDate\":\"November 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_SEARCH_CONTACTS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"contacts\"}","{\"search_limit\":\"50\",\"search_content\":\"1\",\"search_archived\":\"1\"}","","","0","0000-00-00 00:00:00","0","0");
INSERT INTO j4x_extensions VALUES
("419","0","plg_search_content","plugin","content","search","0","1","1","0","{\"name\":\"plg_search_content\",\"type\":\"plugin\",\"creationDate\":\"November 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_SEARCH_CONTENT_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"content\"}","{\"search_limit\":\"50\",\"search_content\":\"1\",\"search_archived\":\"1\"}","","","0","0000-00-00 00:00:00","0","0"),
("420","0","plg_search_newsfeeds","plugin","newsfeeds","search","0","1","1","0","{\"name\":\"plg_search_newsfeeds\",\"type\":\"plugin\",\"creationDate\":\"November 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_SEARCH_NEWSFEEDS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"newsfeeds\"}","{\"search_limit\":\"50\",\"search_content\":\"1\",\"search_archived\":\"1\"}","","","0","0000-00-00 00:00:00","0","0"),
("422","0","plg_system_languagefilter","plugin","languagefilter","system","0","0","1","1","{\"name\":\"plg_system_languagefilter\",\"type\":\"plugin\",\"creationDate\":\"July 2010\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2010 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_SYSTEM_LANGUAGEFILTER_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"languagefilter\"}","","","","0","0000-00-00 00:00:00","1","0"),
("423","0","plg_system_p3p","plugin","p3p","system","0","0","1","0","{\"name\":\"plg_system_p3p\",\"type\":\"plugin\",\"creationDate\":\"September 2010\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2010 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_P3P_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"p3p\"}","{\"headers\":\"NOI ADM DEV PSAi COM NAV OUR OTRo STP IND DEM\"}","","","0","0000-00-00 00:00:00","2","0"),
("424","0","plg_system_cache","plugin","cache","system","0","0","1","1","{\"name\":\"plg_system_cache\",\"type\":\"plugin\",\"creationDate\":\"February 2007\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2007 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_CACHE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"cache\"}","{\"browsercache\":\"0\",\"cachetime\":\"15\"}","","","0","0000-00-00 00:00:00","9","0"),
("425","0","plg_system_debug","plugin","debug","system","0","1","1","0","{\"name\":\"plg_system_debug\",\"type\":\"plugin\",\"creationDate\":\"December 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_DEBUG_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"debug\"}","{\"profile\":\"1\",\"queries\":\"1\",\"memory\":\"1\",\"language_files\":\"1\",\"language_strings\":\"1\",\"strip-first\":\"1\",\"strip-prefix\":\"\",\"strip-suffix\":\"\"}","","","0","0000-00-00 00:00:00","4","0"),
("426","0","plg_system_log","plugin","log","system","0","1","1","1","{\"name\":\"plg_system_log\",\"type\":\"plugin\",\"creationDate\":\"April 2007\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2007 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_LOG_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"log\"}","","","","0","0000-00-00 00:00:00","5","0"),
("427","0","plg_system_redirect","plugin","redirect","system","0","0","1","1","{\"name\":\"plg_system_redirect\",\"type\":\"plugin\",\"creationDate\":\"April 2009\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2009 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_SYSTEM_REDIRECT_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"redirect\"}","","","","0","0000-00-00 00:00:00","3","0"),
("428","0","plg_system_remember","plugin","remember","system","0","1","1","1","{\"name\":\"plg_system_remember\",\"type\":\"plugin\",\"creationDate\":\"April 2007\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2007 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_REMEMBER_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"remember\"}","","","","0","0000-00-00 00:00:00","7","0"),
("429","0","plg_system_sef","plugin","sef","system","0","1","1","0","{\"name\":\"plg_system_sef\",\"type\":\"plugin\",\"creationDate\":\"December 2007\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2007 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_SEF_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"sef\"}","","","","0","0000-00-00 00:00:00","8","0"),
("430","0","plg_system_logout","plugin","logout","system","0","1","1","1","{\"name\":\"plg_system_logout\",\"type\":\"plugin\",\"creationDate\":\"April 2009\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2009 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_SYSTEM_LOGOUT_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"logout\"}","","","","0","0000-00-00 00:00:00","6","0"),
("431","0","plg_user_contactcreator","plugin","contactcreator","user","0","0","1","0","{\"name\":\"plg_user_contactcreator\",\"type\":\"plugin\",\"creationDate\":\"August 2009\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2009 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_CONTACTCREATOR_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"contactcreator\"}","{\"autowebpage\":\"\",\"category\":\"4\",\"autopublish\":\"0\"}","","","0","0000-00-00 00:00:00","1","0"),
("432","0","plg_user_joomla","plugin","joomla","user","0","1","1","0","{\"name\":\"plg_user_joomla\",\"type\":\"plugin\",\"creationDate\":\"December 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_USER_JOOMLA_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"joomla\"}","{\"autoregister\":\"1\",\"mail_to_user\":\"1\",\"forceLogout\":\"1\"}","","","0","0000-00-00 00:00:00","2","0"),
("433","0","plg_user_profile","plugin","profile","user","0","0","1","0","{\"name\":\"plg_user_profile\",\"type\":\"plugin\",\"creationDate\":\"January 2008\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2008 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_USER_PROFILE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"profile\"}","{\"register-require_address1\":\"1\",\"register-require_address2\":\"1\",\"register-require_city\":\"1\",\"register-require_region\":\"1\",\"register-require_country\":\"1\",\"register-require_postal_code\":\"1\",\"register-require_phone\":\"1\",\"register-require_website\":\"1\",\"register-require_favoritebook\":\"1\",\"register-require_aboutme\":\"1\",\"register-require_tos\":\"1\",\"register-require_dob\":\"1\",\"profile-require_address1\":\"1\",\"profile-require_address2\":\"1\",\"profile-require_city\":\"1\",\"profile-require_region\":\"1\",\"profile-require_country\":\"1\",\"profile-require_postal_code\":\"1\",\"profile-require_phone\":\"1\",\"profile-require_website\":\"1\",\"profile-require_favoritebook\":\"1\",\"profile-require_aboutme\":\"1\",\"profile-require_tos\":\"1\",\"profile-require_dob\":\"1\"}","","","0","0000-00-00 00:00:00","0","0"),
("434","0","plg_extension_joomla","plugin","joomla","extension","0","1","1","1","{\"name\":\"plg_extension_joomla\",\"type\":\"plugin\",\"creationDate\":\"May 2010\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2010 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_EXTENSION_JOOMLA_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"joomla\"}","","","","0","0000-00-00 00:00:00","1","0"),
("435","0","plg_content_joomla","plugin","joomla","content","0","1","1","0","{\"name\":\"plg_content_joomla\",\"type\":\"plugin\",\"creationDate\":\"November 2010\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2010 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_CONTENT_JOOMLA_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"joomla\"}","","","","0","0000-00-00 00:00:00","0","0"),
("436","0","plg_system_languagecode","plugin","languagecode","system","0","0","1","0","{\"name\":\"plg_system_languagecode\",\"type\":\"plugin\",\"creationDate\":\"November 2011\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2011 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_SYSTEM_LANGUAGECODE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"languagecode\"}","","","","0","0000-00-00 00:00:00","10","0"),
("437","0","plg_quickicon_joomlaupdate","plugin","joomlaupdate","quickicon","0","1","1","1","{\"name\":\"plg_quickicon_joomlaupdate\",\"type\":\"plugin\",\"creationDate\":\"August 2011\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2011 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_QUICKICON_JOOMLAUPDATE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"joomlaupdate\"}","","","","0","0000-00-00 00:00:00","0","0"),
("438","0","plg_quickicon_extensionupdate","plugin","extensionupdate","quickicon","0","1","1","1","{\"name\":\"plg_quickicon_extensionupdate\",\"type\":\"plugin\",\"creationDate\":\"August 2011\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2011 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_QUICKICON_EXTENSIONUPDATE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"extensionupdate\"}","","","","0","0000-00-00 00:00:00","0","0"),
("439","0","plg_captcha_recaptcha","plugin","recaptcha","captcha","0","0","1","0","{\"name\":\"plg_captcha_recaptcha\",\"type\":\"plugin\",\"creationDate\":\"December 2011\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2011 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.4.0\",\"description\":\"PLG_CAPTCHA_RECAPTCHA_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"recaptcha\"}","{\"public_key\":\"\",\"private_key\":\"\",\"theme\":\"clean\"}","","","0","0000-00-00 00:00:00","0","0"),
("440","0","plg_system_highlight","plugin","highlight","system","0","1","1","0","{\"name\":\"plg_system_highlight\",\"type\":\"plugin\",\"creationDate\":\"August 2011\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2011 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_SYSTEM_HIGHLIGHT_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"highlight\"}","","","","0","0000-00-00 00:00:00","7","0"),
("441","0","plg_content_finder","plugin","finder","content","0","0","1","0","{\"name\":\"plg_content_finder\",\"type\":\"plugin\",\"creationDate\":\"December 2011\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2011 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_CONTENT_FINDER_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"finder\"}","","","","0","0000-00-00 00:00:00","0","0"),
("442","0","plg_finder_categories","plugin","categories","finder","0","1","1","0","{\"name\":\"plg_finder_categories\",\"type\":\"plugin\",\"creationDate\":\"August 2011\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2011 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_FINDER_CATEGORIES_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"categories\"}","","","","0","0000-00-00 00:00:00","1","0"),
("443","0","plg_finder_contacts","plugin","contacts","finder","0","1","1","0","{\"name\":\"plg_finder_contacts\",\"type\":\"plugin\",\"creationDate\":\"August 2011\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2011 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_FINDER_CONTACTS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"contacts\"}","","","","0","0000-00-00 00:00:00","2","0"),
("444","0","plg_finder_content","plugin","content","finder","0","1","1","0","{\"name\":\"plg_finder_content\",\"type\":\"plugin\",\"creationDate\":\"August 2011\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2011 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_FINDER_CONTENT_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"content\"}","","","","0","0000-00-00 00:00:00","3","0"),
("445","0","plg_finder_newsfeeds","plugin","newsfeeds","finder","0","1","1","0","{\"name\":\"plg_finder_newsfeeds\",\"type\":\"plugin\",\"creationDate\":\"August 2011\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2011 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_FINDER_NEWSFEEDS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"newsfeeds\"}","","","","0","0000-00-00 00:00:00","4","0"),
("447","0","plg_finder_tags","plugin","tags","finder","0","1","1","0","{\"name\":\"plg_finder_tags\",\"type\":\"plugin\",\"creationDate\":\"February 2013\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2013 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_FINDER_TAGS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"tags\"}","","","","0","0000-00-00 00:00:00","0","0"),
("448","0","plg_twofactorauth_totp","plugin","totp","twofactorauth","0","0","1","0","{\"name\":\"plg_twofactorauth_totp\",\"type\":\"plugin\",\"creationDate\":\"August 2013\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2013 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.2.0\",\"description\":\"PLG_TWOFACTORAUTH_TOTP_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"totp\"}","","","","0","0000-00-00 00:00:00","0","0"),
("449","0","plg_authentication_cookie","plugin","cookie","authentication","0","1","1","0","{\"name\":\"plg_authentication_cookie\",\"type\":\"plugin\",\"creationDate\":\"July 2013\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2013 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_AUTH_COOKIE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"cookie\"}","","","","0","0000-00-00 00:00:00","0","0"),
("450","0","plg_twofactorauth_yubikey","plugin","yubikey","twofactorauth","0","0","1","0","{\"name\":\"plg_twofactorauth_yubikey\",\"type\":\"plugin\",\"creationDate\":\"September 2013\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2013 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.2.0\",\"description\":\"PLG_TWOFACTORAUTH_YUBIKEY_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"yubikey\"}","","","","0","0000-00-00 00:00:00","0","0"),
("451","0","plg_search_tags","plugin","tags","search","0","1","1","0","{\"name\":\"plg_search_tags\",\"type\":\"plugin\",\"creationDate\":\"March 2014\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2014 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_SEARCH_TAGS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"tags\"}","{\"search_limit\":\"50\",\"show_tagged_items\":\"1\"}","","","0","0000-00-00 00:00:00","0","0"),
("452","0","plg_system_updatenotification","plugin","updatenotification","system","0","1","1","0","{\"name\":\"plg_system_updatenotification\",\"type\":\"plugin\",\"creationDate\":\"May 2015\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2015 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.5.0\",\"description\":\"PLG_SYSTEM_UPDATENOTIFICATION_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"updatenotification\"}","{\"lastrun\":1676217546}","","","0","0000-00-00 00:00:00","0","0"),
("453","0","plg_editors-xtd_module","plugin","module","editors-xtd","0","1","1","0","{\"name\":\"plg_editors-xtd_module\",\"type\":\"plugin\",\"creationDate\":\"October 2015\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2015 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.5.0\",\"description\":\"PLG_MODULE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"module\"}","","","","0","0000-00-00 00:00:00","0","0"),
("454","0","plg_system_stats","plugin","stats","system","0","1","1","0","{\"name\":\"plg_system_stats\",\"type\":\"plugin\",\"creationDate\":\"November 2013\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2013 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.5.0\",\"description\":\"PLG_SYSTEM_STATS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"stats\"}","{\"mode\":3,\"lastrun\":1670751672,\"unique_id\":\"fa92c9ab886cbfc22e3e4b3b132f52f926153a5e\",\"interval\":12}","","","0","0000-00-00 00:00:00","0","0"),
("455","0","plg_installer_packageinstaller","plugin","packageinstaller","installer","0","1","1","1","{\"name\":\"plg_installer_packageinstaller\",\"type\":\"plugin\",\"creationDate\":\"May 2016\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2016 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.6.0\",\"description\":\"PLG_INSTALLER_PACKAGEINSTALLER_PLUGIN_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"packageinstaller\"}","","","","0","0000-00-00 00:00:00","1","0"),
("456","0","PLG_INSTALLER_FOLDERINSTALLER","plugin","folderinstaller","installer","0","1","1","1","{\"name\":\"PLG_INSTALLER_FOLDERINSTALLER\",\"type\":\"plugin\",\"creationDate\":\"May 2016\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2016 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.6.0\",\"description\":\"PLG_INSTALLER_FOLDERINSTALLER_PLUGIN_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"folderinstaller\"}","","","","0","0000-00-00 00:00:00","2","0"),
("457","0","PLG_INSTALLER_URLINSTALLER","plugin","urlinstaller","installer","0","1","1","1","{\"name\":\"PLG_INSTALLER_URLINSTALLER\",\"type\":\"plugin\",\"creationDate\":\"May 2016\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2016 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.6.0\",\"description\":\"PLG_INSTALLER_URLINSTALLER_PLUGIN_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"urlinstaller\"}","","","","0","0000-00-00 00:00:00","3","0"),
("458","0","plg_quickicon_phpversioncheck","plugin","phpversioncheck","quickicon","0","1","1","1","{\"name\":\"plg_quickicon_phpversioncheck\",\"type\":\"plugin\",\"creationDate\":\"August 2016\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2016 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_QUICKICON_PHPVERSIONCHECK_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"phpversioncheck\"}","","","","0","0000-00-00 00:00:00","0","0"),
("459","0","plg_editors-xtd_menu","plugin","menu","editors-xtd","0","1","1","0","{\"name\":\"plg_editors-xtd_menu\",\"type\":\"plugin\",\"creationDate\":\"August 2016\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2016 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_EDITORS-XTD_MENU_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"menu\"}","","","","0","0000-00-00 00:00:00","0","0"),
("460","0","plg_editors-xtd_contact","plugin","contact","editors-xtd","0","1","1","0","{\"name\":\"plg_editors-xtd_contact\",\"type\":\"plugin\",\"creationDate\":\"October 2016\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2016 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_EDITORS-XTD_CONTACT_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"contact\"}","","","","0","0000-00-00 00:00:00","0","0"),
("461","0","plg_system_fields","plugin","fields","system","0","1","1","0","{\"name\":\"plg_system_fields\",\"type\":\"plugin\",\"creationDate\":\"March 2016\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2016 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_SYSTEM_FIELDS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"fields\"}","","","","0","0000-00-00 00:00:00","0","0"),
("462","0","plg_fields_calendar","plugin","calendar","fields","0","1","1","0","{\"name\":\"plg_fields_calendar\",\"type\":\"plugin\",\"creationDate\":\"March 2016\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2016 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_FIELDS_CALENDAR_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"calendar\"}","","","","0","0000-00-00 00:00:00","0","0"),
("463","0","plg_fields_checkboxes","plugin","checkboxes","fields","0","1","1","0","{\"name\":\"plg_fields_checkboxes\",\"type\":\"plugin\",\"creationDate\":\"March 2016\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2016 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_FIELDS_CHECKBOXES_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"checkboxes\"}","","","","0","0000-00-00 00:00:00","0","0"),
("464","0","plg_fields_color","plugin","color","fields","0","1","1","0","{\"name\":\"plg_fields_color\",\"type\":\"plugin\",\"creationDate\":\"March 2016\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2016 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_FIELDS_COLOR_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"color\"}","","","","0","0000-00-00 00:00:00","0","0"),
("465","0","plg_fields_editor","plugin","editor","fields","0","1","1","0","{\"name\":\"plg_fields_editor\",\"type\":\"plugin\",\"creationDate\":\"March 2016\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2016 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_FIELDS_EDITOR_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"editor\"}","","","","0","0000-00-00 00:00:00","0","0"),
("466","0","plg_fields_imagelist","plugin","imagelist","fields","0","1","1","0","{\"name\":\"plg_fields_imagelist\",\"type\":\"plugin\",\"creationDate\":\"March 2016\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2016 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_FIELDS_IMAGELIST_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"imagelist\"}","","","","0","0000-00-00 00:00:00","0","0"),
("467","0","plg_fields_integer","plugin","integer","fields","0","1","1","0","{\"name\":\"plg_fields_integer\",\"type\":\"plugin\",\"creationDate\":\"March 2016\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2016 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_FIELDS_INTEGER_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"integer\"}","{\"multiple\":\"0\",\"first\":\"1\",\"last\":\"100\",\"step\":\"1\"}","","","0","0000-00-00 00:00:00","0","0"),
("468","0","plg_fields_list","plugin","list","fields","0","1","1","0","{\"name\":\"plg_fields_list\",\"type\":\"plugin\",\"creationDate\":\"March 2016\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2016 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_FIELDS_LIST_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"list\"}","","","","0","0000-00-00 00:00:00","0","0"),
("469","0","plg_fields_media","plugin","media","fields","0","1","1","0","{\"name\":\"plg_fields_media\",\"type\":\"plugin\",\"creationDate\":\"March 2016\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2016 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_FIELDS_MEDIA_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"media\"}","","","","0","0000-00-00 00:00:00","0","0"),
("470","0","plg_fields_radio","plugin","radio","fields","0","1","1","0","{\"name\":\"plg_fields_radio\",\"type\":\"plugin\",\"creationDate\":\"March 2016\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2016 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_FIELDS_RADIO_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"radio\"}","","","","0","0000-00-00 00:00:00","0","0"),
("471","0","plg_fields_sql","plugin","sql","fields","0","1","1","0","{\"name\":\"plg_fields_sql\",\"type\":\"plugin\",\"creationDate\":\"March 2016\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2016 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_FIELDS_SQL_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"sql\"}","","","","0","0000-00-00 00:00:00","0","0"),
("472","0","plg_fields_text","plugin","text","fields","0","1","1","0","{\"name\":\"plg_fields_text\",\"type\":\"plugin\",\"creationDate\":\"March 2016\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2016 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_FIELDS_TEXT_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"text\"}","","","","0","0000-00-00 00:00:00","0","0"),
("473","0","plg_fields_textarea","plugin","textarea","fields","0","1","1","0","{\"name\":\"plg_fields_textarea\",\"type\":\"plugin\",\"creationDate\":\"March 2016\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2016 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_FIELDS_TEXTAREA_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"textarea\"}","","","","0","0000-00-00 00:00:00","0","0"),
("474","0","plg_fields_url","plugin","url","fields","0","1","1","0","{\"name\":\"plg_fields_url\",\"type\":\"plugin\",\"creationDate\":\"March 2016\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2016 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_FIELDS_URL_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"url\"}","","","","0","0000-00-00 00:00:00","0","0"),
("475","0","plg_fields_user","plugin","user","fields","0","1","1","0","{\"name\":\"plg_fields_user\",\"type\":\"plugin\",\"creationDate\":\"March 2016\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2016 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_FIELDS_USER_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"user\"}","","","","0","0000-00-00 00:00:00","0","0"),
("476","0","plg_fields_usergrouplist","plugin","usergrouplist","fields","0","1","1","0","{\"name\":\"plg_fields_usergrouplist\",\"type\":\"plugin\",\"creationDate\":\"March 2016\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2016 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_FIELDS_USERGROUPLIST_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"usergrouplist\"}","","","","0","0000-00-00 00:00:00","0","0"),
("477","0","plg_content_fields","plugin","fields","content","0","1","1","0","{\"name\":\"plg_content_fields\",\"type\":\"plugin\",\"creationDate\":\"February 2017\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2017 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_CONTENT_FIELDS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"fields\"}","","","","0","0000-00-00 00:00:00","0","0"),
("478","0","plg_editors-xtd_fields","plugin","fields","editors-xtd","0","1","1","0","{\"name\":\"plg_editors-xtd_fields\",\"type\":\"plugin\",\"creationDate\":\"February 2017\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2017 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_EDITORS-XTD_FIELDS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"fields\"}","","","","0","0000-00-00 00:00:00","0","0"),
("479","0","plg_sampledata_blog","plugin","blog","sampledata","0","1","1","0","{\"name\":\"plg_sampledata_blog\",\"type\":\"plugin\",\"creationDate\":\"July 2017\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2017 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.8.0\",\"description\":\"PLG_SAMPLEDATA_BLOG_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"blog\"}","","","","0","0000-00-00 00:00:00","0","0"),
("480","0","plg_system_sessiongc","plugin","sessiongc","system","0","1","1","0","{\"name\":\"plg_system_sessiongc\",\"type\":\"plugin\",\"creationDate\":\"February 2018\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2018 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.8.6\",\"description\":\"PLG_SYSTEM_SESSIONGC_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"sessiongc\"}","","","","0","0000-00-00 00:00:00","0","0"),
("481","0","plg_fields_repeatable","plugin","repeatable","fields","0","1","1","0","{\"name\":\"plg_fields_repeatable\",\"type\":\"plugin\",\"creationDate\":\"April 2018\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2018 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.9.0\",\"description\":\"PLG_FIELDS_REPEATABLE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"repeatable\"}","","","","0","0000-00-00 00:00:00","0","0"),
("482","0","plg_content_confirmconsent","plugin","confirmconsent","content","0","0","1","0","{\"name\":\"plg_content_confirmconsent\",\"type\":\"plugin\",\"creationDate\":\"May 2018\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2018 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.9.0\",\"description\":\"PLG_CONTENT_CONFIRMCONSENT_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"confirmconsent\"}","{}","","","0","0000-00-00 00:00:00","0","0"),
("483","0","PLG_SYSTEM_ACTIONLOGS","plugin","actionlogs","system","0","1","1","0","{\"name\":\"PLG_SYSTEM_ACTIONLOGS\",\"type\":\"plugin\",\"creationDate\":\"May 2018\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2018 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.9.0\",\"description\":\"PLG_SYSTEM_ACTIONLOGS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"actionlogs\"}","{}","","","0","0000-00-00 00:00:00","0","0"),
("484","0","PLG_ACTIONLOG_JOOMLA","plugin","joomla","actionlog","0","1","1","0","{\"name\":\"PLG_ACTIONLOG_JOOMLA\",\"type\":\"plugin\",\"creationDate\":\"May 2018\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2018 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.9.0\",\"description\":\"PLG_ACTIONLOG_JOOMLA_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"joomla\"}","{}","","","0","0000-00-00 00:00:00","0","0"),
("485","0","plg_system_privacyconsent","plugin","privacyconsent","system","0","0","1","0","{\"name\":\"plg_system_privacyconsent\",\"type\":\"plugin\",\"creationDate\":\"April 2018\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2018 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.9.0\",\"description\":\"PLG_SYSTEM_PRIVACYCONSENT_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"privacyconsent\"}","{}","","","0","0000-00-00 00:00:00","0","0"),
("486","0","plg_system_logrotation","plugin","logrotation","system","0","1","1","0","{\"name\":\"plg_system_logrotation\",\"type\":\"plugin\",\"creationDate\":\"May 2018\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2018 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.9.0\",\"description\":\"PLG_SYSTEM_LOGROTATION_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"logrotation\"}","{\"lastrun\":1675455578}","","","0","0000-00-00 00:00:00","0","0"),
("487","0","plg_privacy_user","plugin","user","privacy","0","1","1","0","{\"name\":\"plg_privacy_user\",\"type\":\"plugin\",\"creationDate\":\"May 2018\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2018 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.9.0\",\"description\":\"PLG_PRIVACY_USER_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"user\"}","{}","","","0","0000-00-00 00:00:00","0","0"),
("488","0","plg_quickicon_privacycheck","plugin","privacycheck","quickicon","0","1","1","0","{\"name\":\"plg_quickicon_privacycheck\",\"type\":\"plugin\",\"creationDate\":\"June 2018\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2018 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.9.0\",\"description\":\"PLG_QUICKICON_PRIVACYCHECK_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"privacycheck\"}","{}","","","0","0000-00-00 00:00:00","0","0"),
("489","0","plg_user_terms","plugin","terms","user","0","0","1","0","{\"name\":\"plg_user_terms\",\"type\":\"plugin\",\"creationDate\":\"June 2018\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2018 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.9.0\",\"description\":\"PLG_USER_TERMS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"terms\"}","{}","","","0","0000-00-00 00:00:00","0","0"),
("490","0","plg_privacy_contact","plugin","contact","privacy","0","1","1","0","{\"name\":\"plg_privacy_contact\",\"type\":\"plugin\",\"creationDate\":\"July 2018\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2018 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.9.0\",\"description\":\"PLG_PRIVACY_CONTACT_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"contact\"}","{}","","","0","0000-00-00 00:00:00","0","0"),
("491","0","plg_privacy_content","plugin","content","privacy","0","1","1","0","{\"name\":\"plg_privacy_content\",\"type\":\"plugin\",\"creationDate\":\"July 2018\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2018 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.9.0\",\"description\":\"PLG_PRIVACY_CONTENT_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"content\"}","{}","","","0","0000-00-00 00:00:00","0","0"),
("492","0","plg_privacy_message","plugin","message","privacy","0","1","1","0","{\"name\":\"plg_privacy_message\",\"type\":\"plugin\",\"creationDate\":\"July 2018\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2018 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.9.0\",\"description\":\"PLG_PRIVACY_MESSAGE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"message\"}","{}","","","0","0000-00-00 00:00:00","0","0"),
("493","0","plg_privacy_actionlogs","plugin","actionlogs","privacy","0","1","1","0","{\"name\":\"plg_privacy_actionlogs\",\"type\":\"plugin\",\"creationDate\":\"July 2018\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2018 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.9.0\",\"description\":\"PLG_PRIVACY_ACTIONLOGS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"actionlogs\"}","{}","","","0","0000-00-00 00:00:00","0","0"),
("494","0","plg_captcha_recaptcha_invisible","plugin","recaptcha_invisible","captcha","0","0","1","0","{\"name\":\"plg_captcha_recaptcha_invisible\",\"type\":\"plugin\",\"creationDate\":\"November 2017\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2017 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.8\",\"description\":\"PLG_CAPTCHA_RECAPTCHA_INVISIBLE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"recaptcha_invisible\"}","{\"public_key\":\"\",\"private_key\":\"\",\"theme\":\"clean\"}","","","0","0000-00-00 00:00:00","0","0"),
("495","0","plg_privacy_consents","plugin","consents","privacy","0","1","1","0","{\"name\":\"plg_privacy_consents\",\"type\":\"plugin\",\"creationDate\":\"July 2018\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2018 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.9.0\",\"description\":\"PLG_PRIVACY_CONSENTS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"consents\"}","{}","","","0","0000-00-00 00:00:00","0","0"),
("496","0","plg_quickicon_eos310","plugin","eos310","quickicon","0","1","1","0","{\"name\":\"plg_quickicon_eos310\",\"type\":\"plugin\",\"creationDate\":\"June 2021\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2021 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.10.0\",\"description\":\"PLG_QUICKICON_EOS310_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"eos310\"}","{\"last_snoozed_id\":3}","","","0","0000-00-00 00:00:00","0","0"),
("503","0","beez3","template","beez3","","0","1","1","0","{\"name\":\"beez3\",\"type\":\"template\",\"creationDate\":\"25 November 2009\",\"author\":\"Angie Radtke\",\"copyright\":\"(C) 2010 Open Source Matters, Inc.\",\"authorEmail\":\"a.radtke@derauftritt.de\",\"authorUrl\":\"http:\\/\\/www.der-auftritt.de\",\"version\":\"3.1.0\",\"description\":\"TPL_BEEZ3_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"templateDetails\"}","{\"wrapperSmall\":\"53\",\"wrapperLarge\":\"72\",\"sitetitle\":\"\",\"sitedescription\":\"\",\"navposition\":\"center\",\"templatecolor\":\"nature\"}","","","0","0000-00-00 00:00:00","0","0"),
("504","0","hathor","template","hathor","","1","1","1","0","{\"name\":\"hathor\",\"type\":\"template\",\"creationDate\":\"May 2010\",\"author\":\"Andrea Tarr\",\"copyright\":\"(C) 2010 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"\",\"version\":\"3.0.0\",\"description\":\"TPL_HATHOR_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"templateDetails\"}","{\"showSiteName\":\"0\",\"colourChoice\":\"0\",\"boldText\":\"0\"}","","","0","0000-00-00 00:00:00","0","0"),
("506","0","protostar","template","protostar","","0","1","1","0","{\"name\":\"protostar\",\"type\":\"template\",\"creationDate\":\"4\\/30\\/2012\",\"author\":\"Kyle Ledbetter\",\"copyright\":\"(C) 2012 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"\",\"version\":\"1.0\",\"description\":\"TPL_PROTOSTAR_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"templateDetails\"}","{\"templateColor\":\"\",\"logoFile\":\"\",\"googleFont\":\"0\",\"googleFontName\":\"Open+Sans\",\"fluidContainer\":\"0\"}","","","0","0000-00-00 00:00:00","0","0"),
("507","0","isis","template","isis","","1","1","1","0","{\"name\":\"isis\",\"type\":\"template\",\"creationDate\":\"3\\/30\\/2012\",\"author\":\"Kyle Ledbetter\",\"copyright\":\"(C) 2012 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"\",\"version\":\"1.0\",\"description\":\"TPL_ISIS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"templateDetails\"}","{\"templateColor\":\"\",\"logoFile\":\"\"}","","","0","0000-00-00 00:00:00","0","0"),
("600","802","English (en-GB)","language","en-GB","","0","1","1","1","{\"name\":\"English (en-GB)\",\"type\":\"language\",\"creationDate\":\"August 2022\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.10.11\",\"description\":\"en-GB site language\",\"group\":\"\"}","","","","0","0000-00-00 00:00:00","0","0"),
("601","802","English (en-GB)","language","en-GB","","1","1","1","1","{\"name\":\"English (en-GB)\",\"type\":\"language\",\"creationDate\":\"August 2022\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.10.11\",\"description\":\"en-GB administrator language\",\"group\":\"\"}","","","","0","0000-00-00 00:00:00","0","0"),
("700","0","files_joomla","file","joomla","","0","1","1","1","{\"name\":\"files_joomla\",\"type\":\"file\",\"creationDate\":\"August 2022\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2019 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.10.11\",\"description\":\"FILES_JOOMLA_XML_DESCRIPTION\",\"group\":\"\"}","","","","0","0000-00-00 00:00:00","0","0"),
("802","0","English (en-GB) Language Pack","package","pkg_en-GB","","0","1","1","1","{\"name\":\"English (en-GB) Language Pack\",\"type\":\"package\",\"creationDate\":\"August 2022\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2019 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.10.11.1\",\"description\":\"en-GB language pack\",\"group\":\"\",\"filename\":\"pkg_en-GB\"}","","","","0","0000-00-00 00:00:00","0","0"),
("10000","0","com_rsgallery2","component","com_rsgallery2","","1","1","0","0","{\"name\":\"com_rsgallery2\",\"type\":\"component\",\"creationDate\":\"28. Aug. 2021\",\"author\":\"RSGallery2 Team\",\"copyright\":\"(c) 2005-2021 RSGallery2 Team\",\"authorEmail\":\"team2@rsgallery2.org\",\"authorUrl\":\"https:\\/\\/www.rsgallery2.org\",\"version\":\"4.5.2.0\",\"description\":\"COM_RSGALLERY2_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"RSGallery2\"}","{}","","","0","0000-00-00 00:00:00","0","0");




CREATE TABLE `j4x_fields` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `asset_id` int unsigned NOT NULL DEFAULT '0',
  `context` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `group_id` int unsigned NOT NULL DEFAULT '0',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `label` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `default_value` text COLLATE utf8mb4_unicode_ci,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'text',
  `note` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` tinyint NOT NULL DEFAULT '0',
  `required` tinyint NOT NULL DEFAULT '0',
  `checked_out` int NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int NOT NULL DEFAULT '0',
  `params` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `fieldparams` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `language` char(7) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `created_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_user_id` int unsigned NOT NULL DEFAULT '0',
  `modified_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int unsigned NOT NULL DEFAULT '0',
  `access` int NOT NULL DEFAULT '1',
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
  `context` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `note` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` tinyint NOT NULL DEFAULT '0',
  `checked_out` int NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int NOT NULL DEFAULT '0',
  `params` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `language` char(7) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int unsigned NOT NULL DEFAULT '0',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
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
  `item_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Allow references to items which have strings as ids, eg. none db systems.',
  `value` text COLLATE utf8mb4_unicode_ci,
  KEY `idx_field_id` (`field_id`),
  KEY `idx_item_id` (`item_id`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;






CREATE TABLE `j4x_finder_filters` (
  `filter_id` int unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `alias` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `state` tinyint NOT NULL DEFAULT '1',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int unsigned NOT NULL,
  `created_by_alias` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int unsigned NOT NULL DEFAULT '0',
  `checked_out` int unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `map_count` int unsigned NOT NULL DEFAULT '0',
  `data` text COLLATE utf8mb4_general_ci NOT NULL,
  `params` mediumtext COLLATE utf8mb4_general_ci,
  PRIMARY KEY (`filter_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;






CREATE TABLE `j4x_finder_links` (
  `link_id` int unsigned NOT NULL AUTO_INCREMENT,
  `url` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `route` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `title` varchar(400) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_general_ci,
  `indexdate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `md5sum` varchar(32) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `published` tinyint NOT NULL DEFAULT '1',
  `state` int DEFAULT '1',
  `access` int DEFAULT '0',
  `language` varchar(8) COLLATE utf8mb4_general_ci NOT NULL,
  `publish_start_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_end_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `start_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `end_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
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
  KEY `idx_published_sale` (`published`,`state`,`access`,`publish_start_date`,`publish_end_date`,`sale_price`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;






CREATE TABLE `j4x_finder_links_terms0` (
  `link_id` int unsigned NOT NULL,
  `term_id` int unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;






CREATE TABLE `j4x_finder_links_terms1` (
  `link_id` int unsigned NOT NULL,
  `term_id` int unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;






CREATE TABLE `j4x_finder_links_terms2` (
  `link_id` int unsigned NOT NULL,
  `term_id` int unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;






CREATE TABLE `j4x_finder_links_terms3` (
  `link_id` int unsigned NOT NULL,
  `term_id` int unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;






CREATE TABLE `j4x_finder_links_terms4` (
  `link_id` int unsigned NOT NULL,
  `term_id` int unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;






CREATE TABLE `j4x_finder_links_terms5` (
  `link_id` int unsigned NOT NULL,
  `term_id` int unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;






CREATE TABLE `j4x_finder_links_terms6` (
  `link_id` int unsigned NOT NULL,
  `term_id` int unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;






CREATE TABLE `j4x_finder_links_terms7` (
  `link_id` int unsigned NOT NULL,
  `term_id` int unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;






CREATE TABLE `j4x_finder_links_terms8` (
  `link_id` int unsigned NOT NULL,
  `term_id` int unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;






CREATE TABLE `j4x_finder_links_terms9` (
  `link_id` int unsigned NOT NULL,
  `term_id` int unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;






CREATE TABLE `j4x_finder_links_termsa` (
  `link_id` int unsigned NOT NULL,
  `term_id` int unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;






CREATE TABLE `j4x_finder_links_termsb` (
  `link_id` int unsigned NOT NULL,
  `term_id` int unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;






CREATE TABLE `j4x_finder_links_termsc` (
  `link_id` int unsigned NOT NULL,
  `term_id` int unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;






CREATE TABLE `j4x_finder_links_termsd` (
  `link_id` int unsigned NOT NULL,
  `term_id` int unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;






CREATE TABLE `j4x_finder_links_termse` (
  `link_id` int unsigned NOT NULL,
  `term_id` int unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;






CREATE TABLE `j4x_finder_links_termsf` (
  `link_id` int unsigned NOT NULL,
  `term_id` int unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;






CREATE TABLE `j4x_finder_taxonomy` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int unsigned NOT NULL DEFAULT '0',
  `title` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `state` tinyint unsigned NOT NULL DEFAULT '1',
  `access` tinyint unsigned NOT NULL DEFAULT '0',
  `ordering` tinyint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_id`),
  KEY `state` (`state`),
  KEY `ordering` (`ordering`),
  KEY `access` (`access`),
  KEY `idx_parent_published` (`parent_id`,`state`,`access`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


INSERT INTO j4x_finder_taxonomy VALUES
("1","0","ROOT","0","0","0");




CREATE TABLE `j4x_finder_taxonomy_map` (
  `link_id` int unsigned NOT NULL,
  `node_id` int unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`node_id`),
  KEY `link_id` (`link_id`),
  KEY `node_id` (`node_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;






CREATE TABLE `j4x_finder_terms` (
  `term_id` int unsigned NOT NULL AUTO_INCREMENT,
  `term` varchar(75) COLLATE utf8mb4_general_ci NOT NULL,
  `stem` varchar(75) COLLATE utf8mb4_general_ci NOT NULL,
  `common` tinyint unsigned NOT NULL DEFAULT '0',
  `phrase` tinyint unsigned NOT NULL DEFAULT '0',
  `weight` float unsigned NOT NULL DEFAULT '0',
  `soundex` varchar(75) COLLATE utf8mb4_general_ci NOT NULL,
  `links` int NOT NULL DEFAULT '0',
  `language` char(3) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`term_id`),
  UNIQUE KEY `idx_term` (`term`),
  KEY `idx_term_phrase` (`term`,`phrase`),
  KEY `idx_stem_phrase` (`stem`,`phrase`),
  KEY `idx_soundex_phrase` (`soundex`,`phrase`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;






CREATE TABLE `j4x_finder_terms_common` (
  `term` varchar(75) COLLATE utf8mb4_general_ci NOT NULL,
  `language` varchar(3) COLLATE utf8mb4_general_ci NOT NULL,
  KEY `idx_word_lang` (`term`,`language`),
  KEY `idx_lang` (`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


INSERT INTO j4x_finder_terms_common VALUES
("a","en"),
("about","en"),
("after","en"),
("ago","en"),
("all","en"),
("am","en"),
("an","en"),
("and","en"),
("any","en"),
("are","en"),
("aren\'t","en"),
("as","en"),
("at","en"),
("be","en"),
("but","en"),
("by","en"),
("for","en"),
("from","en"),
("get","en"),
("go","en"),
("how","en"),
("if","en"),
("in","en"),
("into","en"),
("is","en"),
("isn\'t","en"),
("it","en"),
("its","en"),
("me","en"),
("more","en"),
("most","en"),
("must","en"),
("my","en"),
("new","en"),
("no","en"),
("none","en"),
("not","en"),
("nothing","en"),
("of","en"),
("off","en"),
("often","en"),
("old","en"),
("on","en"),
("onc","en"),
("once","en"),
("only","en"),
("or","en"),
("other","en"),
("our","en"),
("ours","en"),
("out","en"),
("over","en"),
("page","en"),
("she","en"),
("should","en"),
("small","en"),
("so","en"),
("some","en"),
("than","en"),
("thank","en"),
("that","en"),
("the","en"),
("their","en"),
("theirs","en"),
("them","en"),
("then","en"),
("there","en"),
("these","en"),
("they","en"),
("this","en"),
("those","en"),
("thus","en"),
("time","en"),
("times","en"),
("to","en"),
("too","en"),
("true","en"),
("under","en"),
("until","en"),
("up","en"),
("upon","en"),
("use","en"),
("user","en"),
("users","en"),
("version","en"),
("very","en"),
("via","en"),
("want","en"),
("was","en"),
("way","en"),
("were","en"),
("what","en"),
("when","en"),
("where","en"),
("which","en"),
("who","en"),
("whom","en"),
("whose","en"),
("why","en"),
("wide","en");
INSERT INTO j4x_finder_terms_common VALUES
("will","en"),
("with","en"),
("within","en"),
("without","en"),
("would","en"),
("yes","en"),
("yet","en"),
("you","en"),
("your","en"),
("yours","en");




CREATE TABLE `j4x_finder_tokens` (
  `term` varchar(75) COLLATE utf8mb4_general_ci NOT NULL,
  `stem` varchar(75) COLLATE utf8mb4_general_ci NOT NULL,
  `common` tinyint unsigned NOT NULL DEFAULT '0',
  `phrase` tinyint unsigned NOT NULL DEFAULT '0',
  `weight` float unsigned NOT NULL DEFAULT '1',
  `context` tinyint unsigned NOT NULL DEFAULT '2',
  `language` char(3) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  KEY `idx_word` (`term`),
  KEY `idx_context` (`context`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;






CREATE TABLE `j4x_finder_tokens_aggregate` (
  `term_id` int unsigned NOT NULL,
  `map_suffix` char(1) COLLATE utf8mb4_general_ci NOT NULL,
  `term` varchar(75) COLLATE utf8mb4_general_ci NOT NULL,
  `stem` varchar(75) COLLATE utf8mb4_general_ci NOT NULL,
  `common` tinyint unsigned NOT NULL DEFAULT '0',
  `phrase` tinyint unsigned NOT NULL DEFAULT '0',
  `term_weight` float unsigned NOT NULL,
  `context` tinyint unsigned NOT NULL DEFAULT '2',
  `context_weight` float unsigned NOT NULL,
  `total_weight` float unsigned NOT NULL,
  `language` char(3) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  KEY `token` (`term`),
  KEY `keyword_id` (`term_id`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;






CREATE TABLE `j4x_finder_types` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `mime` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `title` (`title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;






CREATE TABLE `j4x_languages` (
  `lang_id` int unsigned NOT NULL AUTO_INCREMENT,
  `asset_id` int unsigned NOT NULL DEFAULT '0',
  `lang_code` char(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `title` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title_native` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sef` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(512) COLLATE utf8mb4_unicode_ci NOT NULL,
  `metakey` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `metadesc` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `sitename` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
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




CREATE TABLE `j4x_menu` (
  `id` int NOT NULL AUTO_INCREMENT,
  `menutype` varchar(24) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The type of menu this item belongs to. FK to #__menu_types.menutype',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The display title of the menu item.',
  `alias` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'The SEF alias of the menu item.',
  `note` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `path` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The computed path of the menu item based on the alias field.',
  `link` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The actually link the menu item refers to.',
  `type` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The type of link: Component, URL, Alias, Separator',
  `published` tinyint NOT NULL DEFAULT '0' COMMENT 'The published state of the menu link.',
  `parent_id` int unsigned NOT NULL DEFAULT '1' COMMENT 'The parent menu item in the menu tree.',
  `level` int unsigned NOT NULL DEFAULT '0' COMMENT 'The relative level in the tree.',
  `component_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'FK to #__extensions.id',
  `checked_out` int unsigned NOT NULL DEFAULT '0' COMMENT 'FK to #__users.id',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'The time the menu item was checked out.',
  `browserNav` tinyint NOT NULL DEFAULT '0' COMMENT 'The click behaviour of the link.',
  `access` int unsigned NOT NULL DEFAULT '0' COMMENT 'The access level required to view the menu item.',
  `img` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The image of the menu item.',
  `template_style_id` int unsigned NOT NULL DEFAULT '0',
  `params` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'JSON encoded data for the menu item.',
  `lft` int NOT NULL DEFAULT '0' COMMENT 'Nested set lft.',
  `rgt` int NOT NULL DEFAULT '0' COMMENT 'Nested set rgt.',
  `home` tinyint unsigned NOT NULL DEFAULT '0' COMMENT 'Indicates if this menu item is the home or default page.',
  `language` char(7) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `client_id` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_client_id_parent_id_alias_language` (`client_id`,`parent_id`,`alias`(100),`language`),
  KEY `idx_componentid` (`component_id`,`menutype`,`published`,`access`),
  KEY `idx_menutype` (`menutype`),
  KEY `idx_left_right` (`lft`,`rgt`),
  KEY `idx_alias` (`alias`(100)),
  KEY `idx_path` (`path`(100)),
  KEY `idx_language` (`language`)
) ENGINE=InnoDB AUTO_INCREMENT=127 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


INSERT INTO j4x_menu VALUES
("1","","Menu_Item_Root","root","","","","","1","0","0","0","0","0000-00-00 00:00:00","0","0","","0","","0","65","0","*","0"),
("2","main","com_banners","Banners","","Banners","index.php?option=com_banners","component","1","1","1","4","0","0000-00-00 00:00:00","0","0","class:banners","0","","1","10","0","*","1"),
("3","main","com_banners","Banners","","Banners/Banners","index.php?option=com_banners","component","1","2","2","4","0","0000-00-00 00:00:00","0","0","class:banners","0","","2","3","0","*","1"),
("4","main","com_banners_categories","Categories","","Banners/Categories","index.php?option=com_categories&extension=com_banners","component","1","2","2","6","0","0000-00-00 00:00:00","0","0","class:banners-cat","0","","4","5","0","*","1"),
("5","main","com_banners_clients","Clients","","Banners/Clients","index.php?option=com_banners&view=clients","component","1","2","2","4","0","0000-00-00 00:00:00","0","0","class:banners-clients","0","","6","7","0","*","1"),
("6","main","com_banners_tracks","Tracks","","Banners/Tracks","index.php?option=com_banners&view=tracks","component","1","2","2","4","0","0000-00-00 00:00:00","0","0","class:banners-tracks","0","","8","9","0","*","1"),
("7","main","com_contact","Contacts","","Contacts","index.php?option=com_contact","component","1","1","1","8","0","0000-00-00 00:00:00","0","0","class:contact","0","","11","16","0","*","1"),
("8","main","com_contact_contacts","Contacts","","Contacts/Contacts","index.php?option=com_contact","component","1","7","2","8","0","0000-00-00 00:00:00","0","0","class:contact","0","","12","13","0","*","1"),
("9","main","com_contact_categories","Categories","","Contacts/Categories","index.php?option=com_categories&extension=com_contact","component","1","7","2","6","0","0000-00-00 00:00:00","0","0","class:contact-cat","0","","14","15","0","*","1"),
("10","main","com_messages","Messaging","","Messaging","index.php?option=com_messages","component","1","1","1","15","0","0000-00-00 00:00:00","0","0","class:messages","0","","17","20","0","*","1"),
("11","main","com_messages_add","New Private Message","","Messaging/New Private Message","index.php?option=com_messages&task=message.add","component","1","10","2","15","0","0000-00-00 00:00:00","0","0","class:messages-add","0","","18","19","0","*","1"),
("13","main","com_newsfeeds","News Feeds","","News Feeds","index.php?option=com_newsfeeds","component","1","1","1","17","0","0000-00-00 00:00:00","0","0","class:newsfeeds","0","","21","26","0","*","1"),
("14","main","com_newsfeeds_feeds","Feeds","","News Feeds/Feeds","index.php?option=com_newsfeeds","component","1","13","2","17","0","0000-00-00 00:00:00","0","0","class:newsfeeds","0","","22","23","0","*","1"),
("15","main","com_newsfeeds_categories","Categories","","News Feeds/Categories","index.php?option=com_categories&extension=com_newsfeeds","component","1","13","2","6","0","0000-00-00 00:00:00","0","0","class:newsfeeds-cat","0","","24","25","0","*","1"),
("16","main","com_redirect","Redirect","","Redirect","index.php?option=com_redirect","component","1","1","1","24","0","0000-00-00 00:00:00","0","0","class:redirect","0","","27","28","0","*","1"),
("17","main","com_search","Basic Search","","Basic Search","index.php?option=com_search","component","1","1","1","19","0","0000-00-00 00:00:00","0","0","class:search","0","","29","30","0","*","1"),
("18","main","com_finder","Smart Search","","Smart Search","index.php?option=com_finder","component","1","1","1","27","0","0000-00-00 00:00:00","0","0","class:finder","0","","31","32","0","*","1"),
("19","main","com_joomlaupdate","Joomla! Update","","Joomla! Update","index.php?option=com_joomlaupdate","component","1","1","1","28","0","0000-00-00 00:00:00","0","0","class:joomlaupdate","0","","33","34","0","*","1"),
("20","main","com_tags","Tags","","Tags","index.php?option=com_tags","component","1","1","1","29","0","0000-00-00 00:00:00","0","1","class:tags","0","","35","36","0","","1"),
("21","main","com_postinstall","Post-installation messages","","Post-installation messages","index.php?option=com_postinstall","component","1","1","1","32","0","0000-00-00 00:00:00","0","1","class:postinstall","0","","37","38","0","*","1"),
("22","main","com_associations","Multilingual Associations","","Multilingual Associations","index.php?option=com_associations","component","1","1","1","34","0","0000-00-00 00:00:00","0","0","class:associations","0","","39","40","0","*","1"),
("101","mainmenu","Home","home","","home","index.php?option=com_content&view=featured","component","1","1","1","22","0","0000-00-00 00:00:00","0","1","","0","{\"featured_categories\":[\"\"],\"layout_type\":\"blog\",\"num_leading_articles\":\"1\",\"num_intro_articles\":\"3\",\"num_columns\":\"3\",\"num_links\":\"0\",\"multi_column_order\":\"1\",\"orderby_pri\":\"\",\"orderby_sec\":\"front\",\"order_date\":\"\",\"show_pagination\":\"2\",\"show_pagination_results\":\"1\",\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_vote\":\"\",\"show_readmore\":\"\",\"show_readmore_title\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_hits\":\"\",\"show_noauth\":\"\",\"show_feed_link\":\"1\",\"feed_summary\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"page_title\":\"\",\"show_page_heading\":1,\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}","41","42","1","*","0"),
("116","main","COM_RSGALLERY2_MENU","com-rsgallery2-menu","","com-rsgallery2-menu","index.php?option=com_rsgallery2","component","1","1","1","10000","0","0000-00-00 00:00:00","0","1","administrator/components/com_rsgallery2/images/rsg2_menu.png","0","{}","43","56","0","","1"),
("117","main","COM_RSGALLERY2_MENU_CONTROL_PANEL","com-rsgallery2-menu-control-panel","","com-rsgallery2-menu/com-rsgallery2-menu-control-panel","index.php?option=com_rsgallery2","component","1","116","2","10000","0","0000-00-00 00:00:00","0","1","class:config","0","{}","44","45","0","","1"),
("118","main","COM_RSGALLERY2_MENU_GALLERIES","com-rsgallery2-menu-galleries","","com-rsgallery2-menu/com-rsgallery2-menu-galleries","index.php?option=com_rsgallery2&view=galleries","component","1","116","2","10000","0","0000-00-00 00:00:00","0","1","class:component","0","{}","46","47","0","","1"),
("119","main","COM_RSGALLERY2_MENU_UPLOAD","com-rsgallery2-menu-upload","","com-rsgallery2-menu/com-rsgallery2-menu-upload","index.php?option=com_rsgallery2&view=upload","component","1","116","2","10000","0","0000-00-00 00:00:00","0","1","class:component","0","{}","48","49","0","","1"),
("120","main","COM_RSGALLERY2_MENU_ITEMS","com-rsgallery2-menu-items","","com-rsgallery2-menu/com-rsgallery2-menu-items","index.php?option=com_rsgallery2&view=images","component","1","116","2","10000","0","0000-00-00 00:00:00","0","1","class:component","0","{}","50","51","0","","1"),
("121","main","COM_RSGALLERY2_MENU_CONFIG","com-rsgallery2-menu-config","","com-rsgallery2-menu/com-rsgallery2-menu-config","index.php?option=com_rsgallery2&view=config&task=config.edit","component","1","116","2","10000","0","0000-00-00 00:00:00","0","1","class:component","0","{}","52","53","0","","1"),
("122","main","COM_RSGALLERY2_MENU_MAINTENANCE","com-rsgallery2-menu-maintenance","","com-rsgallery2-menu/com-rsgallery2-menu-maintenance","index.php?option=com_rsgallery2&view=maintenance","component","1","116","2","10000","0","0000-00-00 00:00:00","0","1","class:component","0","{}","54","55","0","","1"),
("123","mainmenu","RSG2","rsg2","","rsg2","","heading","1","1","1","0","0","0000-00-00 00:00:00","0","1"," ","0","{\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_image_css\":\"\",\"menu_text\":1,\"menu_show\":1}","57","64","0","*","0"),
("124","mainmenu","RSG2 Root gallery","rsg2-root-gallery","","rsg2/rsg2-root-gallery","index.php?option=com_rsgallery2&view=gallery&gid=0","component","1","123","2","10000","0","0000-00-00 00:00:00","0","1"," ","0","{\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_image_css\":\"\",\"menu_text\":1,\"menu_show\":1,\"page_title\":\"\",\"show_page_heading\":\"\",\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}","60","61","0","*","0"),
("125","mainmenu","RSG2 one gallery","rsg2-one-gallery","","rsg2/rsg2-one-gallery","index.php?option=com_rsgallery2&view=gallery&gid=1","component","1","123","2","10000","0","0000-00-00 00:00:00","0","1"," ","0","{\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_image_css\":\"\",\"menu_text\":1,\"menu_show\":1,\"page_title\":\"\",\"show_page_heading\":\"\",\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}","62","63","0","*","0"),
("126","mainmenu","RSG2 slideshow","rsg2-slideshow","","rsg2/rsg2-slideshow","index.php?option=com_rsgallery2&view=slideshow&gid=1&page=slideshow","component","1","123","2","10000","0","0000-00-00 00:00:00","0","1"," ","0","{\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_image_css\":\"\",\"menu_text\":1,\"menu_show\":1,\"page_title\":\"\",\"show_page_heading\":\"\",\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}","58","59","0","*","0");




CREATE TABLE `j4x_menu_types` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `asset_id` int unsigned NOT NULL DEFAULT '0',
  `menutype` varchar(24) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(48) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
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
  `date_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `state` tinyint NOT NULL DEFAULT '0',
  `priority` tinyint unsigned NOT NULL DEFAULT '0',
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`message_id`),
  KEY `useridto_state` (`user_id_to`,`state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;






CREATE TABLE `j4x_messages_cfg` (
  `user_id` int unsigned NOT NULL DEFAULT '0',
  `cfg_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `cfg_value` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  UNIQUE KEY `idx_user_var_name` (`user_id`,`cfg_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;






CREATE TABLE `j4x_modules` (
  `id` int NOT NULL AUTO_INCREMENT,
  `asset_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'FK to the #__assets table.',
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `note` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `content` text COLLATE utf8mb4_unicode_ci,
  `ordering` int NOT NULL DEFAULT '0',
  `position` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `checked_out` int unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `published` tinyint NOT NULL DEFAULT '0',
  `module` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `access` int unsigned NOT NULL DEFAULT '0',
  `showtitle` tinyint unsigned NOT NULL DEFAULT '1',
  `params` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `client_id` tinyint NOT NULL DEFAULT '0',
  `language` char(7) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `published` (`published`,`access`),
  KEY `newsfeeds` (`module`,`published`),
  KEY `idx_language` (`language`)
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


INSERT INTO j4x_modules VALUES
("1","39","Main Menu","","","1","position-7","0","0000-00-00 00:00:00","0000-00-00 00:00:00","0000-00-00 00:00:00","1","mod_menu","1","1","{\"menutype\":\"mainmenu\",\"startLevel\":\"0\",\"endLevel\":\"0\",\"showAllChildren\":\"1\",\"tag_id\":\"\",\"class_sfx\":\"\",\"window_open\":\"\",\"layout\":\"\",\"moduleclass_sfx\":\"_menu\",\"cache\":\"1\",\"cache_time\":\"900\",\"cachemode\":\"itemid\"}","0","*"),
("2","40","Login","","","1","login","0","0000-00-00 00:00:00","0000-00-00 00:00:00","0000-00-00 00:00:00","1","mod_login","1","1","","1","*"),
("3","41","Popular Articles","","","3","cpanel","0","0000-00-00 00:00:00","0000-00-00 00:00:00","0000-00-00 00:00:00","1","mod_popular","3","1","{\"count\":\"5\",\"catid\":\"\",\"user_id\":\"0\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":\"0\"}","1","*"),
("4","42","Recently Added Articles","","","4","cpanel","0","0000-00-00 00:00:00","0000-00-00 00:00:00","0000-00-00 00:00:00","1","mod_latest","3","1","{\"count\":\"5\",\"ordering\":\"c_dsc\",\"catid\":\"\",\"user_id\":\"0\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":\"0\"}","1","*"),
("8","43","Toolbar","","","1","toolbar","0","0000-00-00 00:00:00","0000-00-00 00:00:00","0000-00-00 00:00:00","1","mod_toolbar","3","1","","1","*"),
("9","44","Quick Icons","","","1","icon","0","0000-00-00 00:00:00","0000-00-00 00:00:00","0000-00-00 00:00:00","1","mod_quickicon","3","1","","1","*"),
("10","45","Logged-in Users","","","2","cpanel","0","0000-00-00 00:00:00","0000-00-00 00:00:00","0000-00-00 00:00:00","1","mod_logged","3","1","{\"count\":\"5\",\"name\":\"1\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":\"0\"}","1","*"),
("12","46","Admin Menu","","","1","menu","0","0000-00-00 00:00:00","0000-00-00 00:00:00","0000-00-00 00:00:00","1","mod_menu","3","1","{\"layout\":\"\",\"moduleclass_sfx\":\"\",\"shownew\":\"1\",\"showhelp\":\"1\",\"cache\":\"0\"}","1","*"),
("13","47","Admin Submenu","","","1","submenu","0","0000-00-00 00:00:00","0000-00-00 00:00:00","0000-00-00 00:00:00","1","mod_submenu","3","1","","1","*"),
("14","48","User Status","","","2","status","0","0000-00-00 00:00:00","0000-00-00 00:00:00","0000-00-00 00:00:00","1","mod_status","3","1","","1","*"),
("15","49","Title","","","1","title","0","0000-00-00 00:00:00","0000-00-00 00:00:00","0000-00-00 00:00:00","1","mod_title","3","1","","1","*"),
("16","50","Login Form","","","7","position-7","0","0000-00-00 00:00:00","0000-00-00 00:00:00","0000-00-00 00:00:00","1","mod_login","1","1","{\"greeting\":\"1\",\"name\":\"0\"}","0","*"),
("17","51","Breadcrumbs","","","1","position-2","0","0000-00-00 00:00:00","0000-00-00 00:00:00","0000-00-00 00:00:00","1","mod_breadcrumbs","1","1","{\"moduleclass_sfx\":\"\",\"showHome\":\"1\",\"homeText\":\"\",\"showComponent\":\"1\",\"separator\":\"\",\"cache\":\"0\",\"cache_time\":\"0\",\"cachemode\":\"itemid\"}","0","*"),
("79","52","Multilanguage status","","","1","status","0","0000-00-00 00:00:00","0000-00-00 00:00:00","0000-00-00 00:00:00","0","mod_multilangstatus","3","1","{\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":\"0\"}","1","*"),
("86","53","Joomla Version","","","1","footer","0","0000-00-00 00:00:00","0000-00-00 00:00:00","0000-00-00 00:00:00","1","mod_version","3","1","{\"format\":\"short\",\"product\":\"1\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":\"0\"}","1","*"),
("87","55","Sample Data","","","0","cpanel","0","0000-00-00 00:00:00","0000-00-00 00:00:00","0000-00-00 00:00:00","1","mod_sampledata","6","1","{}","1","*"),
("88","58","Latest Actions","","","0","cpanel","0","0000-00-00 00:00:00","0000-00-00 00:00:00","0000-00-00 00:00:00","1","mod_latestactions","6","1","{}","1","*"),
("89","59","Privacy Dashboard","","","0","cpanel","0","0000-00-00 00:00:00","0000-00-00 00:00:00","0000-00-00 00:00:00","1","mod_privacy_dashboard","6","1","{}","1","*");




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
("89","0");




CREATE TABLE `j4x_newsfeeds` (
  `catid` int NOT NULL DEFAULT '0',
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `alias` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `link` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `published` tinyint NOT NULL DEFAULT '0',
  `numarticles` int unsigned NOT NULL DEFAULT '1',
  `cache_time` int unsigned NOT NULL DEFAULT '3600',
  `checked_out` int unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int NOT NULL DEFAULT '0',
  `rtl` tinyint NOT NULL DEFAULT '0',
  `access` int unsigned NOT NULL DEFAULT '0',
  `language` char(7) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `params` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int unsigned NOT NULL DEFAULT '0',
  `created_by_alias` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int unsigned NOT NULL DEFAULT '0',
  `metakey` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `metadesc` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `metadata` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `xreference` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'A reference to enable linkages to external data sets.',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `version` int unsigned NOT NULL DEFAULT '1',
  `hits` int unsigned NOT NULL DEFAULT '0',
  `images` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_state` (`published`),
  KEY `idx_catid` (`catid`),
  KEY `idx_createdby` (`created_by`),
  KEY `idx_language` (`language`),
  KEY `idx_xreference` (`xreference`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;






CREATE TABLE `j4x_overrider` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `constant` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `string` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `file` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;






CREATE TABLE `j4x_postinstall_messages` (
  `postinstall_message_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `extension_id` bigint NOT NULL DEFAULT '700' COMMENT 'FK to #__extensions',
  `title_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'Lang key for the title',
  `description_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'Lang key for description',
  `action_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `language_extension` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'com_postinstall' COMMENT 'Extension holding lang keys',
  `language_client_id` tinyint NOT NULL DEFAULT '1',
  `type` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'link' COMMENT 'Message type - message, link, action',
  `action_file` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'RAD URI to the PHP file containing action method',
  `action` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'Action method name or URL',
  `condition_file` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'RAD URI to file holding display condition method',
  `condition_method` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Display condition method, must return boolean',
  `version_introduced` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '3.2.0' COMMENT 'Version when this message was introduced',
  `enabled` tinyint NOT NULL DEFAULT '1',
  PRIMARY KEY (`postinstall_message_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


INSERT INTO j4x_postinstall_messages VALUES
("1","700","PLG_TWOFACTORAUTH_TOTP_POSTINSTALL_TITLE","PLG_TWOFACTORAUTH_TOTP_POSTINSTALL_BODY","PLG_TWOFACTORAUTH_TOTP_POSTINSTALL_ACTION","plg_twofactorauth_totp","1","action","site://plugins/twofactorauth/totp/postinstall/actions.php","twofactorauth_postinstall_action","site://plugins/twofactorauth/totp/postinstall/actions.php","twofactorauth_postinstall_condition","3.2.0","1"),
("2","700","COM_CPANEL_WELCOME_BEGINNERS_TITLE","COM_CPANEL_WELCOME_BEGINNERS_MESSAGE","","com_cpanel","1","message","","","","","3.2.0","1"),
("3","700","COM_CPANEL_MSG_STATS_COLLECTION_TITLE","COM_CPANEL_MSG_STATS_COLLECTION_BODY","","com_cpanel","1","message","","","admin://components/com_admin/postinstall/statscollection.php","admin_postinstall_statscollection_condition","3.5.0","1"),
("4","700","PLG_SYSTEM_UPDATENOTIFICATION_POSTINSTALL_UPDATECACHETIME","PLG_SYSTEM_UPDATENOTIFICATION_POSTINSTALL_UPDATECACHETIME_BODY","PLG_SYSTEM_UPDATENOTIFICATION_POSTINSTALL_UPDATECACHETIME_ACTION","plg_system_updatenotification","1","action","site://plugins/system/updatenotification/postinstall/updatecachetime.php","updatecachetime_postinstall_action","site://plugins/system/updatenotification/postinstall/updatecachetime.php","updatecachetime_postinstall_condition","3.6.3","1"),
("5","700","COM_CPANEL_MSG_JOOMLA40_PRE_CHECKS_TITLE","COM_CPANEL_MSG_JOOMLA40_PRE_CHECKS_BODY","","com_cpanel","1","message","","","admin://components/com_admin/postinstall/joomla40checks.php","admin_postinstall_joomla40checks_condition","3.7.0","1"),
("6","700","TPL_HATHOR_MESSAGE_POSTINSTALL_TITLE","TPL_HATHOR_MESSAGE_POSTINSTALL_BODY","TPL_HATHOR_MESSAGE_POSTINSTALL_ACTION","tpl_hathor","1","action","admin://templates/hathor/postinstall/hathormessage.php","hathormessage_postinstall_action","admin://templates/hathor/postinstall/hathormessage.php","hathormessage_postinstall_condition","3.7.0","1"),
("7","700","PLG_PLG_RECAPTCHA_VERSION_1_POSTINSTALL_TITLE","PLG_PLG_RECAPTCHA_VERSION_1_POSTINSTALL_BODY","PLG_PLG_RECAPTCHA_VERSION_1_POSTINSTALL_ACTION","plg_captcha_recaptcha","1","action","site://plugins/captcha/recaptcha/postinstall/actions.php","recaptcha_postinstall_action","site://plugins/captcha/recaptcha/postinstall/actions.php","recaptcha_postinstall_condition","3.8.6","1"),
("8","700","COM_ACTIONLOGS_POSTINSTALL_TITLE","COM_ACTIONLOGS_POSTINSTALL_BODY","","com_actionlogs","1","message","","","","","3.9.0","1"),
("9","700","COM_PRIVACY_POSTINSTALL_TITLE","COM_PRIVACY_POSTINSTALL_BODY","","com_privacy","1","message","","","","","3.9.0","1");




CREATE TABLE `j4x_privacy_consents` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned NOT NULL DEFAULT '0',
  `state` int NOT NULL DEFAULT '1',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `remind` tinyint NOT NULL DEFAULT '0',
  `token` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `idx_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;






CREATE TABLE `j4x_privacy_requests` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `requested_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `status` tinyint NOT NULL DEFAULT '0',
  `request_type` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `confirm_token` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `confirm_token_created_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;






CREATE TABLE `j4x_redirect_links` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `old_url` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL,
  `new_url` varchar(2048) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `referer` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `hits` int unsigned NOT NULL DEFAULT '0',
  `published` tinyint NOT NULL,
  `created_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `header` smallint NOT NULL DEFAULT '301',
  PRIMARY KEY (`id`),
  KEY `idx_old_url` (`old_url`(100)),
  KEY `idx_link_modifed` (`modified_date`)
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
) ENGINE=MyISAM AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb3;


INSERT INTO j4x_rsgallery2_config VALUES
("1","last_update_type","upload_drag_and_drop"),
("2","last_update_type","upload_drag_and_drop"),
("3","last_update_type","upload_drag_and_drop"),
("4","last_update_type","upload_drag_and_drop"),
("5","last_update_type","upload_drag_and_drop"),
("6","last_update_type","upload_drag_and_drop"),
("7","last_update_type","upload_drag_and_drop"),
("8","last_update_type","upload_drag_and_drop"),
("9","last_update_type","upload_drag_and_drop"),
("10","last_update_type","upload_drag_and_drop"),
("11","last_update_type","upload_drag_and_drop"),
("12","last_update_type","upload_drag_and_drop"),
("13","last_update_type","upload_drag_and_drop"),
("14","last_update_type","upload_drag_and_drop"),
("15","last_update_type","upload_drag_and_drop"),
("16","last_update_type","upload_drag_and_drop"),
("17","last_update_type","upload_drag_and_drop"),
("18","last_update_type","upload_drag_and_drop"),
("19","last_update_type","upload_drag_and_drop"),
("20","last_update_type","upload_drag_and_drop"),
("21","last_update_type","upload_drag_and_drop"),
("22","last_update_type","upload_drag_and_drop"),
("23","last_update_type","upload_drag_and_drop"),
("24","last_update_type","upload_drag_and_drop"),
("25","last_update_type","upload_drag_and_drop"),
("26","last_update_type","upload_drag_and_drop"),
("27","last_update_type","upload_drag_and_drop"),
("28","last_update_type","upload_drag_and_drop"),
("29","last_update_type","upload_drag_and_drop"),
("30","last_update_type","upload_drag_and_drop"),
("31","last_update_type","upload_drag_and_drop"),
("32","last_update_type","upload_drag_and_drop"),
("33","last_update_type","upload_drag_and_drop");




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
) ENGINE=MyISAM AUTO_INCREMENT=93 DEFAULT CHARSET=utf8mb3;


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
("73","2015-12-25_00059.jpg","2015-12-25-00059","","5","2015-12-25_00059","0","2023-02-12 17:00:57","0","0","0","1","0","0000-00-00 00:00:00","6","0","424","","138"),
("72","2015-12-25_00058.jpg","2015-12-25-00058","","5","2015-12-25_00058","1","2023-02-12 17:00:57","0","0","0","1","0","0000-00-00 00:00:00","5","0","424","","137"),
("71","2015-12-25_00057.jpg","2015-12-25-00057","","5","2015-12-25_00057","0","2023-02-12 17:00:57","0","0","0","1","0","0000-00-00 00:00:00","4","0","424","","136"),
("68","2015-12-25_00054.jpg","2015-12-25-00054","","5","2015-12-25_00054","0","2023-02-12 17:00:56","0","0","0","1","0","0000-00-00 00:00:00","1","0","424","","133"),
("66","dsc_5527.jpg","dsc_5527","","4","dsc_5527","0","2023-02-12 16:48:48","0","0","0","1","0","0000-00-00 00:00:00","0","0","424","","130"),
("64","dsc_5525.jpg","dsc_5525","","4","dsc_5525","0","2023-02-12 16:48:48","0","0","0","1","0","0000-00-00 00:00:00","0","0","424","","128"),
("62","dsc_5523.jpg","dsc_5523","","4","dsc_5523","0","2023-02-12 16:48:48","0","0","0","1","0","0000-00-00 00:00:00","0","0","424","","126"),
("60","dsc_5520.jpg","dsc_5520","","4","dsc_5520","0","2023-02-12 16:48:31","0","0","0","1","0","0000-00-00 00:00:00","0","0","424","","124"),
("58","dsc_5518.jpg","dsc_5518","","4","dsc_5518","0","2023-02-12 16:48:31","0","0","0","1","0","0000-00-00 00:00:00","0","0","424","","122"),
("56","dsc_5516.jpg","dsc_5516","","4","dsc_5516","0","2023-02-12 16:48:14","0","0","0","1","0","0000-00-00 00:00:00","0","0","424","","120"),
("54","dsc_5515.jpg","dsc_5515","","4","dsc_5515","0","2023-02-12 16:48:00","0","0","0","1","0","0000-00-00 00:00:00","0","0","424","","118"),
("52","dsc_5513.jpg","dsc_5513","","4","dsc_5513","0","2023-02-12 16:47:54","0","0","0","1","0","0000-00-00 00:00:00","0","0","424","","116"),
("50","dsc_5504.jpg","dsc_5504","","4","dsc_5504","0","2023-02-12 16:47:51","0","0","0","1","0","0000-00-00 00:00:00","0","0","424","","114"),
("49","dsc_5503.jpg","dsc_5503","","4","dsc_5503","0","2023-02-12 16:47:50","0","0","0","1","0","0000-00-00 00:00:00","0","0","424","","113"),
("70","2015-12-25_00056.jpg","2015-12-25-00056","","5","2015-12-25_00056","0","2023-02-12 17:00:57","0","0","0","1","0","0000-00-00 00:00:00","3","0","424","","135"),
("69","2015-12-25_00055.jpg","2015-12-25-00055","","5","2015-12-25_00055","0","2023-02-12 17:00:56","0","0","0","1","0","0000-00-00 00:00:00","2","0","424","","134"),
("67","dsc_5528.jpg","dsc_5528","","4","dsc_5528","0","2023-02-12 16:48:48","0","0","0","1","0","0000-00-00 00:00:00","0","0","424","","131"),
("65","dsc_5526.jpg","dsc_5526","","4","dsc_5526","0","2023-02-12 16:48:48","0","0","0","1","0","0000-00-00 00:00:00","0","0","424","","129"),
("63","dsc_5524.jpg","dsc_5524","","4","dsc_5524","0","2023-02-12 16:48:48","0","0","0","1","0","0000-00-00 00:00:00","0","0","424","","127"),
("61","dsc_5521.jpg","dsc_5521","","4","dsc_5521","0","2023-02-12 16:48:48","0","0","0","1","0","0000-00-00 00:00:00","0","0","424","","125"),
("59","dsc_5519.jpg","dsc_5519","","4","dsc_5519","0","2023-02-12 16:48:31","0","0","0","1","0","0000-00-00 00:00:00","0","0","424","","123"),
("57","dsc_5517.jpg","dsc_5517","","4","dsc_5517","0","2023-02-12 16:48:31","0","0","0","1","0","0000-00-00 00:00:00","0","0","424","","121"),
("55","dsc_5529.jpg","dsc_5529","","4","dsc_5529","0","2023-02-12 16:48:07","0","0","0","1","0","0000-00-00 00:00:00","0","0","424","","119"),
("53","dsc_5514.jpg","dsc_5514","","4","dsc_5514","0","2023-02-12 16:47:55","0","0","0","1","0","0000-00-00 00:00:00","0","0","424","","117"),
("51","dsc_5505.jpg","dsc_5505","","4","dsc_5505","0","2023-02-12 16:47:53","0","0","0","1","0","0000-00-00 00:00:00","0","0","424","","115"),
("48","dsc_5502.jpg","dsc_5502","","4","dsc_5502","0","2023-02-12 16:47:48","0","0","0","1","0","0000-00-00 00:00:00","0","0","424","","112"),
("47","dsc_5501.jpg","dsc_5501","","4","dsc_5501","0","2023-02-12 16:47:43","0","0","0","1","0","0000-00-00 00:00:00","0","0","424","","111"),
("74","2015-12-25_00060.jpg","2015-12-25-00060","","5","2015-12-25_00060","0","2023-02-12 17:00:57","0","0","0","1","0","0000-00-00 00:00:00","7","0","424","","139"),
("75","2015-12-25_00061.jpg","2015-12-25-00061","","5","2015-12-25_00061","0","2023-02-12 17:00:57","0","0","0","1","0","0000-00-00 00:00:00","8","0","424","","140"),
("76","2015-12-25_00062.jpg","2015-12-25-00062","","5","2015-12-25_00062","0","2023-02-12 17:00:58","0","0","0","1","0","0000-00-00 00:00:00","9","0","424","","141"),
("77","2015-12-25_00063.jpg","2015-12-25-00063","","5","2015-12-25_00063","0","2023-02-12 17:00:58","0","0","0","1","0","0000-00-00 00:00:00","10","0","424","","142"),
("78","2015-12-25_00064.jpg","2015-12-25-00064","","5","2015-12-25_00064","0","2023-02-12 17:00:58","0","0","0","1","0","0000-00-00 00:00:00","11","0","424","","143"),
("79","2015-12-25_00065.jpg","2015-12-25-00065","","5","2015-12-25_00065","0","2023-02-12 17:00:58","0","0","0","1","0","0000-00-00 00:00:00","12","0","424","","144"),
("80","2015-12-25_00066.jpg","2015-12-25-00066","","5","2015-12-25_00066","0","2023-02-12 17:00:58","0","0","0","1","0","0000-00-00 00:00:00","13","0","424","","145"),
("81","2015-12-25_00067.jpg","2015-12-25-00067","","5","2015-12-25_00067","0","2023-02-12 17:00:58","0","0","0","1","0","0000-00-00 00:00:00","14","0","424","","146"),
("82","2015-12-25_00068.jpg","2015-12-25-00068","","5","2015-12-25_00068","0","2023-02-12 17:00:58","0","0","0","1","0","0000-00-00 00:00:00","15","0","424","","147"),
("83","2015-12-25_00069.jpg","2015-12-25-00069","","5","2015-12-25_00069","0","2023-02-12 17:00:59","0","0","0","1","0","0000-00-00 00:00:00","16","0","424","","148"),
("84","2015-12-25_00070.jpg","2015-12-25-00070","","5","2015-12-25_00070","0","2023-02-12 17:00:59","0","0","0","1","0","0000-00-00 00:00:00","17","0","424","","149"),
("85","2015-12-25_00071.jpg","2015-12-25-00071","","5","2015-12-25_00071","0","2023-02-12 17:00:59","0","0","0","1","0","0000-00-00 00:00:00","18","0","424","","150"),
("86","2015-12-25_00072.jpg","2015-12-25-00072","","5","2015-12-25_00072","0","2023-02-12 17:00:59","0","0","0","1","0","0000-00-00 00:00:00","19","0","424","","151"),
("87","2015-12-25_00073.jpg","2015-12-25-00073","","5","2015-12-25_00073","0","2023-02-12 17:00:59","0","0","0","1","0","0000-00-00 00:00:00","20","0","424","","152"),
("88","2015-12-25_00074.jpg","2015-12-25-00074","","5","2015-12-25_00074","0","2023-02-12 17:00:59","0","0","0","1","0","0000-00-00 00:00:00","21","0","424","","153"),
("89","2015-12-25_00075.jpg","2015-12-25-00075","","5","2015-12-25_00075","0","2023-02-12 17:00:59","0","0","0","1","0","0000-00-00 00:00:00","22","0","424","","154"),
("90","2015-12-25_00076.jpg","2015-12-25-00076","","5","2015-12-25_00076","0","2023-02-12 17:00:59","0","0","0","1","0","0000-00-00 00:00:00","23","0","424","","155"),
("91","2015-12-25_00077.jpg","2015-12-25-00077","","5","2015-12-25_00077","0","2023-02-12 17:01:00","0","0","0","1","0","0000-00-00 00:00:00","24","0","424","","156"),
("92","2015-12-25_00078.jpg","2015-12-25-00078","","5","2015-12-25_00078","0","2023-02-12 17:01:00","0","0","0","1","0","0000-00-00 00:00:00","25","0","424","","157");




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
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;


INSERT INTO j4x_rsgallery2_galleries VALUES
("1","0","Coffee","coffee","","1","0","0000-00-00 00:00:00","3","2022-12-11 15:46:35","3","","0","424","0","0","61","1"),
("5","0","Vollmond","vollmond","","1","0","0000-00-00 00:00:00","1","2023-02-12 17:01:25","2","","0","424","0","0","132","1"),
("4","0","Lovelocks","lovelocks","","1","0","0000-00-00 00:00:00","2","2023-02-12 16:53:32","11","","0","424","0","0","64","1");




CREATE TABLE `j4x_schemas` (
  `extension_id` int NOT NULL,
  `version_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`extension_id`,`version_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


INSERT INTO j4x_schemas VALUES
("700","3.10.7-2022-03-18"),
("10000","4.3.0");




CREATE TABLE `j4x_session` (
  `session_id` varbinary(192) NOT NULL,
  `client_id` tinyint unsigned DEFAULT NULL,
  `guest` tinyint unsigned DEFAULT '1',
  `time` int NOT NULL DEFAULT '0',
  `data` mediumtext COLLATE utf8mb4_unicode_ci,
  `userid` int DEFAULT '0',
  `username` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT '',
  PRIMARY KEY (`session_id`),
  KEY `userid` (`userid`),
  KEY `time` (`time`),
  KEY `client_id_guest` (`client_id`,`guest`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


INSERT INTO j4x_session VALUES
("1d6pa6mkcrd7o629pmu5uk0mab","1","0","1670752755","joomla|s:1096:\"TzoyNDoiSm9vbWxhXFJlZ2lzdHJ5XFJlZ2lzdHJ5IjozOntzOjc6IgAqAGRhdGEiO086ODoic3RkQ2xhc3MiOjE6e3M6OToiX19kZWZhdWx0IjtPOjg6InN0ZENsYXNzIjo0OntzOjc6InNlc3Npb24iO086ODoic3RkQ2xhc3MiOjM6e3M6NzoiY291bnRlciI7aToyMDtzOjU6InRpbWVyIjtPOjg6InN0ZENsYXNzIjozOntzOjU6InN0YXJ0IjtpOjE2NzA3NTE2MjE7czo0OiJsYXN0IjtpOjE2NzA3NTI3NTE7czozOiJub3ciO2k6MTY3MDc1Mjc1NDt9czo1OiJ0b2tlbiI7czozMjoiWThTczlPMHZZZTdjZmk0SDVQV1J5Q0Q5aVI0bzJqa2IiO31zOjg6InJlZ2lzdHJ5IjtPOjI0OiJKb29tbGFcUmVnaXN0cnlcUmVnaXN0cnkiOjM6e3M6NzoiACoAZGF0YSI7Tzo4OiJzdGRDbGFzcyI6Mjp7czoxMzoiY29tX2luc3RhbGxlciI7Tzo4OiJzdGRDbGFzcyI6Mjp7czo3OiJtZXNzYWdlIjtzOjA6IiI7czoxNzoiZXh0ZW5zaW9uX21lc3NhZ2UiO3M6MDoiIjt9czoxMDoiY29tX2NvbmZpZyI7Tzo4OiJzdGRDbGFzcyI6MTp7czo2OiJjb25maWciO086ODoic3RkQ2xhc3MiOjE6e3M6NjoiZ2xvYmFsIjtPOjg6InN0ZENsYXNzIjoxOntzOjQ6ImRhdGEiO047fX19fXM6MTQ6IgAqAGluaXRpYWxpemVkIjtiOjA7czo5OiJzZXBhcmF0b3IiO3M6MToiLiI7fXM6NDoidXNlciI7TzoyMDoiSm9vbWxhXENNU1xVc2VyXFVzZXIiOjE6e3M6MjoiaWQiO3M6MzoiNDI0Ijt9czoxMToiYXBwbGljYXRpb24iO086ODoic3RkQ2xhc3MiOjE6e3M6NToicXVldWUiO2E6MDp7fX19fXM6MTQ6IgAqAGluaXRpYWxpemVkIjtiOjA7czo5OiJzZXBhcmF0b3IiO3M6MToiLiI7fQ==\";","424","finnern"),
("4l1mftve788fpje988en88r4he","0","1","1676221315","joomla|s:736:\"TzoyNDoiSm9vbWxhXFJlZ2lzdHJ5XFJlZ2lzdHJ5IjozOntzOjc6IgAqAGRhdGEiO086ODoic3RkQ2xhc3MiOjE6e3M6OToiX19kZWZhdWx0IjtPOjg6InN0ZENsYXNzIjozOntzOjc6InNlc3Npb24iO086ODoic3RkQ2xhc3MiOjM6e3M6NzoiY291bnRlciI7aToyNztzOjU6InRpbWVyIjtPOjg6InN0ZENsYXNzIjozOntzOjU6InN0YXJ0IjtpOjE2NzYyMjAwMjM7czo0OiJsYXN0IjtpOjE2NzYyMjEzMTM7czozOiJub3ciO2k6MTY3NjIyMTMxNTt9czo1OiJ0b2tlbiI7czozMjoiMVBUdVhLRXVNOWx5cUlHR2t4Tzg4MFd3eWdjYmVRUTQiO31zOjg6InJlZ2lzdHJ5IjtPOjI0OiJKb29tbGFcUmVnaXN0cnlcUmVnaXN0cnkiOjM6e3M6NzoiACoAZGF0YSI7Tzo4OiJzdGRDbGFzcyI6MDp7fXM6MTQ6IgAqAGluaXRpYWxpemVkIjtiOjA7czo5OiJzZXBhcmF0b3IiO3M6MToiLiI7fXM6NDoidXNlciI7TzoyMDoiSm9vbWxhXENNU1xVc2VyXFVzZXIiOjE6e3M6MjoiaWQiO2k6MDt9fX1zOjE0OiIAKgBpbml0aWFsaXplZCI7YjowO3M6OToic2VwYXJhdG9yIjtzOjE6Ii4iO30=\";","0",""),
("7ol1s767ushj8fq420au71rq2o","1","0","1676221285","joomla|s:1120:\"TzoyNDoiSm9vbWxhXFJlZ2lzdHJ5XFJlZ2lzdHJ5IjozOntzOjc6IgAqAGRhdGEiO086ODoic3RkQ2xhc3MiOjE6e3M6OToiX19kZWZhdWx0IjtPOjg6InN0ZENsYXNzIjo0OntzOjc6InNlc3Npb24iO086ODoic3RkQ2xhc3MiOjM6e3M6NzoiY291bnRlciI7aTo5MTtzOjU6InRpbWVyIjtPOjg6InN0ZENsYXNzIjozOntzOjU6InN0YXJ0IjtpOjE2NzYyMTc1NDY7czo0OiJsYXN0IjtpOjE2NzYyMjEyODQ7czozOiJub3ciO2k6MTY3NjIyMTI4NTt9czo1OiJ0b2tlbiI7czozMjoiWGl1eXg5WEZJMlVTOW9jWmJGSTFDUUpEZnJNOUV1MkciO31zOjg6InJlZ2lzdHJ5IjtPOjI0OiJKb29tbGFcUmVnaXN0cnlcUmVnaXN0cnkiOjM6e3M6NzoiACoAZGF0YSI7Tzo4OiJzdGRDbGFzcyI6Mjp7czoxMzoiY29tX2luc3RhbGxlciI7Tzo4OiJzdGRDbGFzcyI6Mjp7czo3OiJtZXNzYWdlIjtzOjA6IiI7czoxNzoiZXh0ZW5zaW9uX21lc3NhZ2UiO3M6MDoiIjt9czoxNDoiY29tX3JzZ2FsbGVyeTIiO086ODoic3RkQ2xhc3MiOjE6e3M6NDoiZWRpdCI7Tzo4OiJzdGRDbGFzcyI6MTp7czo3OiJnYWxsZXJ5IjtPOjg6InN0ZENsYXNzIjoyOntzOjI6ImlkIjthOjA6e31zOjQ6ImRhdGEiO047fX19fXM6MTQ6IgAqAGluaXRpYWxpemVkIjtiOjA7czo5OiJzZXBhcmF0b3IiO3M6MToiLiI7fXM6NDoidXNlciI7TzoyMDoiSm9vbWxhXENNU1xVc2VyXFVzZXIiOjE6e3M6MjoiaWQiO3M6MzoiNDI0Ijt9czoxMToiYXBwbGljYXRpb24iO086ODoic3RkQ2xhc3MiOjE6e3M6NToicXVldWUiO2E6MDp7fX19fXM6MTQ6IgAqAGluaXRpYWxpemVkIjtiOjA7czo5OiJzZXBhcmF0b3IiO3M6MToiLiI7fQ==\";","424","finnern"),
("f3q2ja5mtd2fnchi1nl3v55d0l","0","1","1670781379","joomla|s:736:\"TzoyNDoiSm9vbWxhXFJlZ2lzdHJ5XFJlZ2lzdHJ5IjozOntzOjc6IgAqAGRhdGEiO086ODoic3RkQ2xhc3MiOjE6e3M6OToiX19kZWZhdWx0IjtPOjg6InN0ZENsYXNzIjozOntzOjc6InNlc3Npb24iO086ODoic3RkQ2xhc3MiOjM6e3M6NzoiY291bnRlciI7aTo0O3M6NToidGltZXIiO086ODoic3RkQ2xhc3MiOjM6e3M6NToic3RhcnQiO2k6MTY3MDc3NDE3MDtzOjQ6Imxhc3QiO2k6MTY3MDc4MDQ5MTtzOjM6Im5vdyI7aToxNjcwNzgxMzc5O31zOjU6InRva2VuIjtzOjMyOiJNNmxObzdXMTVPVlluM3FCQ0Z3eE54OTMzZzdVeGdkMSI7fXM6ODoicmVnaXN0cnkiO086MjQ6Ikpvb21sYVxSZWdpc3RyeVxSZWdpc3RyeSI6Mzp7czo3OiIAKgBkYXRhIjtPOjg6InN0ZENsYXNzIjowOnt9czoxNDoiACoAaW5pdGlhbGl6ZWQiO2I6MDtzOjk6InNlcGFyYXRvciI7czoxOiIuIjt9czo0OiJ1c2VyIjtPOjIwOiJKb29tbGFcQ01TXFVzZXJcVXNlciI6MTp7czoyOiJpZCI7aTowO319fXM6MTQ6IgAqAGluaXRpYWxpemVkIjtiOjA7czo5OiJzZXBhcmF0b3IiO3M6MToiLiI7fQ==\";","0",""),
("lif3bk92akounvdsqeoghghjso","1","0","1673030983","joomla|s:868:\"TzoyNDoiSm9vbWxhXFJlZ2lzdHJ5XFJlZ2lzdHJ5IjozOntzOjc6IgAqAGRhdGEiO086ODoic3RkQ2xhc3MiOjE6e3M6OToiX19kZWZhdWx0IjtPOjg6InN0ZENsYXNzIjozOntzOjc6InNlc3Npb24iO086ODoic3RkQ2xhc3MiOjM6e3M6NzoiY291bnRlciI7aTo1O3M6NToidGltZXIiO086ODoic3RkQ2xhc3MiOjM6e3M6NToic3RhcnQiO2k6MTY3MzAzMDk2NztzOjQ6Imxhc3QiO2k6MTY3MzAzMDk4MTtzOjM6Im5vdyI7aToxNjczMDMwOTgzO31zOjU6InRva2VuIjtzOjMyOiJBdml3U3o0bEUzUnJ6b2tZVUJCNjg1aG9pQzhyRFlsUyI7fXM6ODoicmVnaXN0cnkiO086MjQ6Ikpvb21sYVxSZWdpc3RyeVxSZWdpc3RyeSI6Mzp7czo3OiIAKgBkYXRhIjtPOjg6InN0ZENsYXNzIjoxOntzOjEzOiJjb21faW5zdGFsbGVyIjtPOjg6InN0ZENsYXNzIjoyOntzOjc6Im1lc3NhZ2UiO3M6MDoiIjtzOjE3OiJleHRlbnNpb25fbWVzc2FnZSI7czowOiIiO319czoxNDoiACoAaW5pdGlhbGl6ZWQiO2I6MDtzOjk6InNlcGFyYXRvciI7czoxOiIuIjt9czo0OiJ1c2VyIjtPOjIwOiJKb29tbGFcQ01TXFVzZXJcVXNlciI6MTp7czoyOiJpZCI7czozOiI0MjQiO319fXM6MTQ6IgAqAGluaXRpYWxpemVkIjtiOjA7czo5OiJzZXBhcmF0b3IiO3M6MToiLiI7fQ==\";","424","finnern"),
("mleqgl12jt1p9poq9qsqnsigvt","1","0","1670780588","joomla|s:1608:\"TzoyNDoiSm9vbWxhXFJlZ2lzdHJ5XFJlZ2lzdHJ5IjozOntzOjc6IgAqAGRhdGEiO086ODoic3RkQ2xhc3MiOjE6e3M6OToiX19kZWZhdWx0IjtPOjg6InN0ZENsYXNzIjo0OntzOjc6InNlc3Npb24iO086ODoic3RkQ2xhc3MiOjM6e3M6NzoiY291bnRlciI7aToxMzc7czo1OiJ0aW1lciI7Tzo4OiJzdGRDbGFzcyI6Mzp7czo1OiJzdGFydCI7aToxNjcwNzUzMjQyO3M6NDoibGFzdCI7aToxNjcwNzc0Mjk1O3M6Mzoibm93IjtpOjE2NzA3ODA0NzA7fXM6NToidG9rZW4iO3M6MzI6IklLZU9rMkl0YXNIc29PVjEyUkVJVWhXU1dEUHpaZ2x4Ijt9czo4OiJyZWdpc3RyeSI7TzoyNDoiSm9vbWxhXFJlZ2lzdHJ5XFJlZ2lzdHJ5IjozOntzOjc6IgAqAGRhdGEiO086ODoic3RkQ2xhc3MiOjM6e3M6MTM6ImNvbV9pbnN0YWxsZXIiO086ODoic3RkQ2xhc3MiOjM6e3M6NzoibWVzc2FnZSI7czowOiIiO3M6MTc6ImV4dGVuc2lvbl9tZXNzYWdlIjtzOjA6IiI7czoxMjoicmVkaXJlY3RfdXJsIjtOO31zOjE0OiJjb21fcnNnYWxsZXJ5MiI7Tzo4OiJzdGRDbGFzcyI6MTp7czo0OiJlZGl0IjtPOjg6InN0ZENsYXNzIjoxOntzOjc6ImdhbGxlcnkiO086ODoic3RkQ2xhc3MiOjE6e3M6NDoiZGF0YSI7Tjt9fX1zOjk6ImNvbV9tZW51cyI7Tzo4OiJzdGRDbGFzcyI6Mjp7czo1OiJpdGVtcyI7Tzo4OiJzdGRDbGFzcyI6NDp7czo4OiJtZW51dHlwZSI7czo4OiJtYWlubWVudSI7czo5OiJjbGllbnRfaWQiO2k6MDtzOjEwOiJsaW1pdHN0YXJ0IjtpOjA7czo0OiJsaXN0IjthOjQ6e3M6OToiZGlyZWN0aW9uIjtzOjM6ImFzYyI7czo1OiJsaW1pdCI7czoyOiIyMCI7czo4OiJvcmRlcmluZyI7czo1OiJhLmxmdCI7czo1OiJzdGFydCI7ZDowO319czo0OiJlZGl0IjtPOjg6InN0ZENsYXNzIjoxOntzOjQ6Iml0ZW0iO086ODoic3RkQ2xhc3MiOjQ6e3M6MjoiaWQiO2E6MDp7fXM6NDoiZGF0YSI7TjtzOjQ6InR5cGUiO047czo0OiJsaW5rIjtOO319fX1zOjE0OiIAKgBpbml0aWFsaXplZCI7YjowO3M6OToic2VwYXJhdG9yIjtzOjE6Ii4iO31zOjQ6InVzZXIiO086MjA6Ikpvb21sYVxDTVNcVXNlclxVc2VyIjoxOntzOjI6ImlkIjtzOjM6IjQyNCI7fXM6MTE6ImFwcGxpY2F0aW9uIjtPOjg6InN0ZENsYXNzIjoxOntzOjU6InF1ZXVlIjthOjA6e319fX1zOjE0OiIAKgBpbml0aWFsaXplZCI7YjowO3M6OToic2VwYXJhdG9yIjtzOjE6Ii4iO30=\";","424","finnern"),
("psbnhl5mvcmspvolnj5cohd4bn","1","0","1675456518","joomla|s:1068:\"TzoyNDoiSm9vbWxhXFJlZ2lzdHJ5XFJlZ2lzdHJ5IjozOntzOjc6IgAqAGRhdGEiO086ODoic3RkQ2xhc3MiOjE6e3M6OToiX19kZWZhdWx0IjtPOjg6InN0ZENsYXNzIjozOntzOjc6InNlc3Npb24iO086ODoic3RkQ2xhc3MiOjM6e3M6NzoiY291bnRlciI7aTo0O3M6NToidGltZXIiO086ODoic3RkQ2xhc3MiOjM6e3M6NToic3RhcnQiO2k6MTY3NTQ1NTU3NztzOjQ6Imxhc3QiO2k6MTY3NTQ1NTU4MDtzOjM6Im5vdyI7aToxNjc1NDU2NTE4O31zOjU6InRva2VuIjtzOjMyOiJtcWYxUU14SWpjMkVJU1I5cFVTTjA4NGdieXd5OWU2SiI7fXM6ODoicmVnaXN0cnkiO086MjQ6Ikpvb21sYVxSZWdpc3RyeVxSZWdpc3RyeSI6Mzp7czo3OiIAKgBkYXRhIjtPOjg6InN0ZENsYXNzIjoxOntzOjk6ImNvbV9tZW51cyI7Tzo4OiJzdGRDbGFzcyI6MTp7czo1OiJpdGVtcyI7Tzo4OiJzdGRDbGFzcyI6NDp7czo4OiJtZW51dHlwZSI7czo4OiJtYWlubWVudSI7czo5OiJjbGllbnRfaWQiO2k6MDtzOjEwOiJsaW1pdHN0YXJ0IjtpOjA7czo0OiJsaXN0IjthOjQ6e3M6OToiZGlyZWN0aW9uIjtzOjM6ImFzYyI7czo1OiJsaW1pdCI7czoyOiIyMCI7czo4OiJvcmRlcmluZyI7czo1OiJhLmxmdCI7czo1OiJzdGFydCI7ZDowO319fX1zOjE0OiIAKgBpbml0aWFsaXplZCI7YjowO3M6OToic2VwYXJhdG9yIjtzOjE6Ii4iO31zOjQ6InVzZXIiO086MjA6Ikpvb21sYVxDTVNcVXNlclxVc2VyIjoxOntzOjI6ImlkIjtzOjM6IjQyNCI7fX19czoxNDoiACoAaW5pdGlhbGl6ZWQiO2I6MDtzOjk6InNlcGFyYXRvciI7czoxOiIuIjt9\";","424","finnern"),
("s04mu7on16n9hmcoqi82l5hpm0","0","1","1670752726","joomla|s:736:\"TzoyNDoiSm9vbWxhXFJlZ2lzdHJ5XFJlZ2lzdHJ5IjozOntzOjc6IgAqAGRhdGEiO086ODoic3RkQ2xhc3MiOjE6e3M6OToiX19kZWZhdWx0IjtPOjg6InN0ZENsYXNzIjozOntzOjc6InNlc3Npb24iO086ODoic3RkQ2xhc3MiOjM6e3M6NzoiY291bnRlciI7aToxO3M6NToidGltZXIiO086ODoic3RkQ2xhc3MiOjM6e3M6NToic3RhcnQiO2k6MTY3MDc1MjcyNjtzOjQ6Imxhc3QiO2k6MTY3MDc1MjcyNjtzOjM6Im5vdyI7aToxNjcwNzUyNzI2O31zOjU6InRva2VuIjtzOjMyOiJFb0hMcm13eUlGZWh3ZDBjNW05ZXNyT3UxMUxaZnBCViI7fXM6ODoicmVnaXN0cnkiO086MjQ6Ikpvb21sYVxSZWdpc3RyeVxSZWdpc3RyeSI6Mzp7czo3OiIAKgBkYXRhIjtPOjg6InN0ZENsYXNzIjowOnt9czoxNDoiACoAaW5pdGlhbGl6ZWQiO2I6MDtzOjk6InNlcGFyYXRvciI7czoxOiIuIjt9czo0OiJ1c2VyIjtPOjIwOiJKb29tbGFcQ01TXFVzZXJcVXNlciI6MTp7czoyOiJpZCI7aTowO319fXM6MTQ6IgAqAGluaXRpYWxpemVkIjtiOjA7czo5OiJzZXBhcmF0b3IiO3M6MToiLiI7fQ==\";","0","");




CREATE TABLE `j4x_tags` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int unsigned NOT NULL DEFAULT '0',
  `lft` int NOT NULL DEFAULT '0',
  `rgt` int NOT NULL DEFAULT '0',
  `level` int unsigned NOT NULL DEFAULT '0',
  `path` varchar(400) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alias` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `note` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `published` tinyint NOT NULL DEFAULT '0',
  `checked_out` int unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `access` int unsigned NOT NULL DEFAULT '0',
  `params` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `metadesc` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The meta description for the page.',
  `metakey` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The meta keywords for the page.',
  `metadata` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'JSON encoded metadata properties.',
  `created_user_id` int unsigned NOT NULL DEFAULT '0',
  `created_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by_alias` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `modified_user_id` int unsigned NOT NULL DEFAULT '0',
  `modified_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `images` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `urls` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `hits` int unsigned NOT NULL DEFAULT '0',
  `language` char(7) COLLATE utf8mb4_unicode_ci NOT NULL,
  `version` int unsigned NOT NULL DEFAULT '1',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
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
("1","0","0","1","0","","ROOT","root","","","1","0","0000-00-00 00:00:00","1","","","","","424","2022-12-11 09:40:03","","0","0000-00-00 00:00:00","","","0","*","1","0000-00-00 00:00:00","0000-00-00 00:00:00");




CREATE TABLE `j4x_template_styles` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `template` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `client_id` tinyint unsigned NOT NULL DEFAULT '0',
  `home` char(7) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `inheritable` tinyint NOT NULL DEFAULT '0',
  `parent` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `params` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_template` (`template`),
  KEY `idx_client_id` (`client_id`),
  KEY `idx_client_id_home` (`client_id`,`home`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


INSERT INTO j4x_template_styles VALUES
("4","beez3","0","0","Beez3 - Default","0","","{\"wrapperSmall\":\"53\",\"wrapperLarge\":\"72\",\"logo\":\"images\\/joomla_black.png\",\"sitetitle\":\"Joomla!\",\"sitedescription\":\"Open Source Content Management\",\"navposition\":\"left\",\"templatecolor\":\"personal\",\"html5\":\"0\"}"),
("5","hathor","1","0","Hathor - Default","0","","{\"showSiteName\":\"0\",\"colourChoice\":\"\",\"boldText\":\"0\"}"),
("7","protostar","0","1","protostar - Default","0","","{\"templateColor\":\"\",\"logoFile\":\"\",\"googleFont\":\"0\",\"googleFontName\":\"Open+Sans\",\"fluidContainer\":\"0\"}"),
("8","isis","1","1","isis - Default","0","","{\"templateColor\":\"\",\"logoFile\":\"\"}");




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
  `core_type_alias` varchar(400) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'FK to the content types table',
  `core_title` varchar(400) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `core_alias` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `core_body` mediumtext COLLATE utf8mb4_unicode_ci,
  `core_state` tinyint NOT NULL DEFAULT '0',
  `core_checked_out_time` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0000-00-00 00:00:00',
  `core_checked_out_user_id` int unsigned NOT NULL DEFAULT '0',
  `core_access` int unsigned NOT NULL DEFAULT '0',
  `core_params` text COLLATE utf8mb4_unicode_ci,
  `core_featured` tinyint unsigned NOT NULL DEFAULT '0',
  `core_metadata` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'JSON encoded metadata properties.',
  `core_created_user_id` int unsigned NOT NULL DEFAULT '0',
  `core_created_by_alias` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `core_created_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `core_modified_user_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Most recent user that modified',
  `core_modified_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `core_language` char(7) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `core_publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `core_publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `core_content_item_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'ID from the individual type table',
  `asset_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'FK to the #__assets table.',
  `core_images` text COLLATE utf8mb4_unicode_ci,
  `core_urls` text COLLATE utf8mb4_unicode_ci,
  `core_hits` int unsigned NOT NULL DEFAULT '0',
  `core_version` int unsigned NOT NULL DEFAULT '1',
  `core_ordering` int NOT NULL DEFAULT '0',
  `core_metakey` text COLLATE utf8mb4_unicode_ci,
  `core_metadesc` text COLLATE utf8mb4_unicode_ci,
  `core_catid` int unsigned NOT NULL DEFAULT '0',
  `core_xreference` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'A reference to enable linkages to external data sets.',
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






CREATE TABLE `j4x_ucm_history` (
  `version_id` int unsigned NOT NULL AUTO_INCREMENT,
  `ucm_item_id` int unsigned NOT NULL,
  `ucm_type_id` int unsigned NOT NULL,
  `version_note` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'Optional version name',
  `save_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `editor_user_id` int unsigned NOT NULL DEFAULT '0',
  `character_count` int unsigned NOT NULL DEFAULT '0' COMMENT 'Number of characters in this version.',
  `sha1_hash` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'SHA1 hash of the version_data column.',
  `version_data` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'json-encoded string of version data',
  `keep_forever` tinyint NOT NULL DEFAULT '0' COMMENT '0=auto delete; 1=keep',
  PRIMARY KEY (`version_id`),
  KEY `idx_ucm_item_id` (`ucm_type_id`,`ucm_item_id`),
  KEY `idx_save_date` (`save_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;






CREATE TABLE `j4x_update_sites` (
  `update_site_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `type` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `location` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `enabled` int DEFAULT '0',
  `last_check_timestamp` bigint DEFAULT '0',
  `extra_query` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT '',
  PRIMARY KEY (`update_site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Update Sites';


INSERT INTO j4x_update_sites VALUES
("1","Joomla! Core","collection","https://update.joomla.org/core/list.xml","1","1676217546",""),
("2","Accredited Joomla! Translations","collection","https://update.joomla.org/language/translationlist_3.xml","1","1676217557",""),
("3","Joomla! Update Component Update Site","extension","https://update.joomla.org/core/extensions/com_joomlaupdate.xml","1","1676217557",""),
("4","Github RSGallery2 component updates","extension","http://releases.rsgallery2.org/RSG2_component_update.xml","1","1676217557",""),
("5","Github RSGallery2 component updates","extension","https://raw.githubusercontent.com/RSGallery2/RSGallery2_Project/master/UpdateServer/RSG2_component_update.xml","1","1676217557","");




CREATE TABLE `j4x_update_sites_extensions` (
  `update_site_id` int NOT NULL DEFAULT '0',
  `extension_id` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`update_site_id`,`extension_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Links extensions to update sites';


INSERT INTO j4x_update_sites_extensions VALUES
("1","700"),
("2","802"),
("3","28"),
("4","10000"),
("5","10000");




CREATE TABLE `j4x_updates` (
  `update_id` int NOT NULL AUTO_INCREMENT,
  `update_site_id` int DEFAULT '0',
  `extension_id` int DEFAULT '0',
  `name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `element` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `type` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `folder` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `client_id` tinyint DEFAULT '0',
  `version` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `detailsurl` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `infourl` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `extra_query` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT '',
  PRIMARY KEY (`update_id`)
) ENGINE=InnoDB AUTO_INCREMENT=233 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Available Updates';


INSERT INTO j4x_updates VALUES
("156","2","0","Afrikaans","","pkg_af-ZA","package","","0","3.9.16.1","","https://update.joomla.org/language/details3/af-ZA_details.xml","",""),
("157","2","0","Albanian","","pkg_sq-AL","package","","0","3.1.1.2","","https://update.joomla.org/language/details3/sq-AL_details.xml","",""),
("158","2","0","Arabic Unitag","","pkg_ar-AA","package","","0","3.9.27.1","","https://update.joomla.org/language/details3/ar-AA_details.xml","",""),
("159","2","0","Armenian","","pkg_hy-AM","package","","0","3.4.4.1","","https://update.joomla.org/language/details3/hy-AM_details.xml","",""),
("160","2","0","Basque","","pkg_eu-ES","package","","0","3.9.24.1","","https://update.joomla.org/language/details3/eu-ES_details.xml","",""),
("161","2","0","Belarusian","","pkg_be-BY","package","","0","3.2.1.2","","https://update.joomla.org/language/details3/be-BY_details.xml","",""),
("162","2","0","Bengali, Bangladesh","","pkg_bn-BD","package","","0","3.8.10.1","","https://update.joomla.org/language/details3/bn-BD_details.xml","",""),
("163","2","0","Bosnian","","pkg_bs-BA","package","","0","3.9.24.1","","https://update.joomla.org/language/details3/bs-BA_details.xml","",""),
("164","2","0","Bulgarian","","pkg_bg-BG","package","","0","3.6.5.2","","https://update.joomla.org/language/details3/bg-BG_details.xml","",""),
("165","2","0","Catalan","","pkg_ca-ES","package","","0","3.9.23.1","","https://update.joomla.org/language/details3/ca-ES_details.xml","",""),
("166","2","0","Chinese, Simplified","","pkg_zh-CN","package","","0","3.10.6.1","","https://update.joomla.org/language/details3/zh-CN_details.xml","",""),
("167","2","0","Chinese, Traditional","","pkg_zh-TW","package","","0","3.8.0.1","","https://update.joomla.org/language/details3/zh-TW_details.xml","",""),
("168","2","0","Croatian","","pkg_hr-HR","package","","0","3.10.11.1","","https://update.joomla.org/language/details3/hr-HR_details.xml","",""),
("169","2","0","Czech","","pkg_cs-CZ","package","","0","3.10.11.1","","https://update.joomla.org/language/details3/cs-CZ_details.xml","",""),
("170","2","0","Danish","","pkg_da-DK","package","","0","3.10.10.1","","https://update.joomla.org/language/details3/da-DK_details.xml","",""),
("171","2","0","Dari Persian","","pkg_prs-AF","package","","0","3.4.4.3","","https://update.joomla.org/language/details3/prs-AF_details.xml","",""),
("172","2","0","Dutch","","pkg_nl-NL","package","","0","3.10.11.1","","https://update.joomla.org/language/details3/nl-NL_details.xml","",""),
("173","2","0","Dzongkha","","pkg_dz-BT","package","","0","3.6.2.1","","https://update.joomla.org/language/details3/dz-BT_details.xml","",""),
("174","2","0","English, Australia","","pkg_en-AU","package","","0","3.9.28.1","","https://update.joomla.org/language/details3/en-AU_details.xml","",""),
("175","2","0","English, Canada","","pkg_en-CA","package","","0","3.9.28.1","","https://update.joomla.org/language/details3/en-CA_details.xml","",""),
("176","2","0","English, New Zealand","","pkg_en-NZ","package","","0","3.9.28.1","","https://update.joomla.org/language/details3/en-NZ_details.xml","",""),
("177","2","0","English, USA","","pkg_en-US","package","","0","3.9.28.1","","https://update.joomla.org/language/details3/en-US_details.xml","",""),
("178","2","0","Esperanto","","pkg_eo-XX","package","","0","3.8.11.1","","https://update.joomla.org/language/details3/eo-XX_details.xml","",""),
("179","2","0","Estonian","","pkg_et-EE","package","","0","3.9.21.1","","https://update.joomla.org/language/details3/et-EE_details.xml","",""),
("180","2","0","Finnish","","pkg_fi-FI","package","","0","3.9.16.1","","https://update.joomla.org/language/details3/fi-FI_details.xml","",""),
("181","2","0","Flemish","","pkg_nl-BE","package","","0","3.10.11.1","","https://update.joomla.org/language/details3/nl-BE_details.xml","",""),
("182","2","0","French","","pkg_fr-FR","package","","0","3.10.11.1","","https://update.joomla.org/language/details3/fr-FR_details.xml","",""),
("183","2","0","French, Canada","","pkg_fr-CA","package","","0","3.6.5.1","","https://update.joomla.org/language/details3/fr-CA_details.xml","",""),
("184","2","0","Galician","","pkg_gl-ES","package","","0","3.3.1.2","","https://update.joomla.org/language/details3/gl-ES_details.xml","",""),
("185","2","0","Georgian","","pkg_ka-GE","package","","0","3.10.11.1","","https://update.joomla.org/language/details3/ka-GE_details.xml","",""),
("186","2","0","German","","pkg_de-DE","package","","0","3.10.11.1","","https://update.joomla.org/language/details3/de-DE_details.xml","",""),
("187","2","0","German, Austria","","pkg_de-AT","package","","0","3.10.11.1","","https://update.joomla.org/language/details3/de-AT_details.xml","",""),
("188","2","0","German, Liechtenstein","","pkg_de-LI","package","","0","3.10.11.1","","https://update.joomla.org/language/details3/de-LI_details.xml","",""),
("189","2","0","German, Luxembourg","","pkg_de-LU","package","","0","3.10.11.1","","https://update.joomla.org/language/details3/de-LU_details.xml","",""),
("190","2","0","German, Switzerland","","pkg_de-CH","package","","0","3.10.11.1","","https://update.joomla.org/language/details3/de-CH_details.xml","",""),
("191","2","0","Greek","","pkg_el-GR","package","","0","3.10.11.1","","https://update.joomla.org/language/details3/el-GR_details.xml","",""),
("192","2","0","Hebrew","","pkg_he-IL","package","","0","3.1.1.2","","https://update.joomla.org/language/details3/he-IL_details.xml","",""),
("193","2","0","Hindi, India","","pkg_hi-IN","package","","0","3.3.6.2","","https://update.joomla.org/language/details3/hi-IN_details.xml","",""),
("194","2","0","Hungarian","","pkg_hu-HU","package","","0","3.10.11.1","","https://update.joomla.org/language/details3/hu-HU_details.xml","",""),
("195","2","0","Indonesian, Bahasa Indonesia","","pkg_id-ID","package","","0","3.6.2.1","","https://update.joomla.org/language/details3/id-ID_details.xml","",""),
("196","2","0","Irish","","pkg_ga-IE","package","","0","3.8.13.1","","https://update.joomla.org/language/details3/ga-IE_details.xml","",""),
("197","2","0","Italian","","pkg_it-IT","package","","0","3.10.11.2","","https://update.joomla.org/language/details3/it-IT_details.xml","",""),
("198","2","0","Japanese","","pkg_ja-JP","package","","0","3.10.11.1","","https://update.joomla.org/language/details3/ja-JP_details.xml","",""),
("199","2","0","Kazakh","","pkg_kk-KZ","package","","0","3.9.23.1","","https://update.joomla.org/language/details3/kk-KZ_details.xml","",""),
("200","2","0","Khmer","","pkg_km-KH","package","","0","3.4.5.1","","https://update.joomla.org/language/details3/km-KH_details.xml","",""),
("201","2","0","Korean","","pkg_ko-KR","package","","0","3.8.9.1","","https://update.joomla.org/language/details3/ko-KR_details.xml","",""),
("202","2","0","Latvian","","pkg_lv-LV","package","","0","3.9.25.2","","https://update.joomla.org/language/details3/lv-LV_details.xml","",""),
("203","2","0","Lithuanian","","pkg_lt-LT","package","","0","3.9.16.1","","https://update.joomla.org/language/details3/lt-LT_details.xml","",""),
("204","2","0","Macedonian","","pkg_mk-MK","package","","0","3.6.5.1","","https://update.joomla.org/language/details3/mk-MK_details.xml","",""),
("205","2","0","Malay","","pkg_ms-MY","package","","0","3.4.1.2","","https://update.joomla.org/language/details3/ms-MY_details.xml","",""),
("206","2","0","Montenegrin","","pkg_srp-ME","package","","0","3.3.1.2","","https://update.joomla.org/language/details3/srp-ME_details.xml","",""),
("207","2","0","Norwegian Bokmål","","pkg_nb-NO","package","","0","3.10.0.1","","https://update.joomla.org/language/details3/nb-NO_details.xml","",""),
("208","2","0","Norwegian Nynorsk","","pkg_nn-NO","package","","0","3.4.2.1","","https://update.joomla.org/language/details3/nn-NO_details.xml","",""),
("209","2","0","Persian Farsi","","pkg_fa-IR","package","","0","3.10.11.2","","https://update.joomla.org/language/details3/fa-IR_details.xml","",""),
("210","2","0","Polish","","pkg_pl-PL","package","","0","3.10.10.1","","https://update.joomla.org/language/details3/pl-PL_details.xml","",""),
("211","2","0","Portuguese, Brazil","","pkg_pt-BR","package","","0","3.9.21.1","","https://update.joomla.org/language/details3/pt-BR_details.xml","",""),
("212","2","0","Portuguese, Portugal","","pkg_pt-PT","package","","0","3.9.29.2","","https://update.joomla.org/language/details3/pt-PT_details.xml","",""),
("213","2","0","Romanian","","pkg_ro-RO","package","","0","3.10.11.1","","https://update.joomla.org/language/details3/ro-RO_details.xml","",""),
("214","2","0","Russian","","pkg_ru-RU","package","","0","3.10.9.1","","https://update.joomla.org/language/details3/ru-RU_details.xml","",""),
("215","2","0","Serbian, Cyrillic","","pkg_sr-RS","package","","0","3.10.2.1","","https://update.joomla.org/language/details3/sr-RS_details.xml","",""),
("216","2","0","Serbian, Latin","","pkg_sr-YU","package","","0","3.10.2.1","","https://update.joomla.org/language/details3/sr-YU_details.xml","",""),
("217","2","0","Sinhala","","pkg_si-LK","package","","0","3.3.1.2","","https://update.joomla.org/language/details3/si-LK_details.xml","",""),
("218","2","0","Slovak","","pkg_sk-SK","package","","0","3.10.5.1","","https://update.joomla.org/language/details3/sk-SK_details.xml","",""),
("219","2","0","Slovenian","","pkg_sl-SI","package","","0","3.10.11.1","","https://update.joomla.org/language/details3/sl-SI_details.xml","",""),
("220","2","0","Spanish","","pkg_es-ES","package","","0","3.10.10.1","","https://update.joomla.org/language/details3/es-ES_details.xml","",""),
("221","2","0","Spanish, Colombia","","pkg_es-CO","package","","0","3.9.15.1","","https://update.joomla.org/language/details3/es-CO_details.xml","",""),
("222","2","0","Swahili","","pkg_sw-KE","package","","0","3.10.11.1","","https://update.joomla.org/language/details3/sw-KE_details.xml","",""),
("223","2","0","Swedish","","pkg_sv-SE","package","","0","3.10.11.1","","https://update.joomla.org/language/details3/sv-SE_details.xml","",""),
("224","2","0","Syriac, East","","pkg_sy-IQ","package","","0","3.4.5.1","","https://update.joomla.org/language/details3/sy-IQ_details.xml","",""),
("225","2","0","Tamil, India","","pkg_ta-IN","package","","0","3.10.11.1","","https://update.joomla.org/language/details3/ta-IN_details.xml","",""),
("226","2","0","Thai","","pkg_th-TH","package","","0","3.10.11.1","","https://update.joomla.org/language/details3/th-TH_details.xml","",""),
("227","2","0","Turkish","","pkg_tr-TR","package","","0","3.9.28.1","","https://update.joomla.org/language/details3/tr-TR_details.xml","",""),
("228","2","0","Turkmen","","pkg_tk-TM","package","","0","3.5.0.2","","https://update.joomla.org/language/details3/tk-TM_details.xml","",""),
("229","2","0","Ukrainian","","pkg_uk-UA","package","","0","3.10.2.1","","https://update.joomla.org/language/details3/uk-UA_details.xml","",""),
("230","2","0","Uyghur","","pkg_ug-CN","package","","0","3.7.5.2","","https://update.joomla.org/language/details3/ug-CN_details.xml","",""),
("231","2","0","Vietnamese","","pkg_vi-VN","package","","0","3.2.1.2","","https://update.joomla.org/language/details3/vi-VN_details.xml","",""),
("232","2","0","Welsh","","pkg_cy-GB","package","","0","3.10.11.1","","https://update.joomla.org/language/details3/cy-GB_details.xml","","");




CREATE TABLE `j4x_user_keys` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `series` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `invalid` tinyint NOT NULL,
  `time` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `uastring` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `series` (`series`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;






CREATE TABLE `j4x_user_notes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned NOT NULL DEFAULT '0',
  `catid` int unsigned NOT NULL DEFAULT '0',
  `subject` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` tinyint NOT NULL DEFAULT '0',
  `checked_out` int unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_user_id` int unsigned NOT NULL DEFAULT '0',
  `created_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_user_id` int unsigned NOT NULL,
  `modified_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `review_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `idx_user_id` (`user_id`),
  KEY `idx_category_id` (`catid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;






CREATE TABLE `j4x_user_profiles` (
  `user_id` int NOT NULL,
  `profile_key` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `profile_value` text COLLATE utf8mb4_unicode_ci NOT NULL,
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
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
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
  `name` varchar(400) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `username` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `password` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `block` tinyint NOT NULL DEFAULT '0',
  `sendEmail` tinyint DEFAULT '0',
  `registerDate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `lastvisitDate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `activation` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `params` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastResetTime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Date of last password reset',
  `resetCount` int NOT NULL DEFAULT '0' COMMENT 'Count of password resets since lastResetTime',
  `otpKey` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'Two factor authentication encrypted keys',
  `otep` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'One time emergency passwords',
  `requireReset` tinyint NOT NULL DEFAULT '0' COMMENT 'Require user to reset password on next login',
  `authProvider` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'Name of used authentication plugin',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_username` (`username`),
  KEY `idx_name` (`name`(100)),
  KEY `idx_block` (`block`),
  KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=425 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


INSERT INTO j4x_users VALUES
("424","Super User","finnern","j3xwampp@tomfinnern.de","$2y$10$l0YzrdTiv3UpjZ.rrcJixuWbvrNrab/YPQ.LucRJF1os7NQCthyOu","0","1","2022-12-11 09:40:03","2023-02-12 15:59:12","0","","0000-00-00 00:00:00","0","","","0","");




CREATE TABLE `j4x_utf8_conversion` (
  `converted` tinyint NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


INSERT INTO j4x_utf8_conversion VALUES
("5");




CREATE TABLE `j4x_viewlevels` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `ordering` int NOT NULL DEFAULT '0',
  `rules` varchar(5120) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'JSON encoded access control.',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_assetgroup_title_lookup` (`title`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


INSERT INTO j4x_viewlevels VALUES
("1","Public","0","[1]"),
("2","Registered","2","[6,2,8]"),
("3","Special","3","[6,3,8]"),
("5","Guest","1","[9]"),
("6","Super Users","4","[8]");


