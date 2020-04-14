-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Апр 14 2020 г., 15:08
-- Версия сервера: 10.3.13-MariaDB-log
-- Версия PHP: 7.1.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `div`
--

-- --------------------------------------------------------

--
-- Структура таблицы `diafan_ab`
--

CREATE TABLE `diafan_ab` (
  `id` int(11) UNSIGNED NOT NULL COMMENT 'идентификатор',
  `name1` text DEFAULT NULL COMMENT 'название',
  `act1` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'показывать на сайте: 0 - нет, 1 - да',
  `date_start` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'дата начала показа',
  `date_finish` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'дата окончания показа',
  `created` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'дата создания',
  `map_no_show` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'не показывать на карте сайта: 0 - нет, 1 - да',
  `changefreq` enum('always','hourly','daily','weekly','monthly','yearly','never') NOT NULL DEFAULT 'always' COMMENT 'Changefreq для sitemap.xml',
  `priority` varchar(3) NOT NULL DEFAULT '' COMMENT 'Priority для sitemap.xml',
  `noindex` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'не индексировать: 0 - нет, 1 - да',
  `cat_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор основной категории из таблицы `diafan_ab_category`',
  `site_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор страницы сайта из таблицы `diafan_site`',
  `keywords1` varchar(250) NOT NULL DEFAULT '' COMMENT 'ключевые слова, тег Keywords',
  `descr1` text DEFAULT NULL COMMENT 'описание, тэг Description',
  `canonical1` varchar(100) NOT NULL DEFAULT '' COMMENT 'канонический тег',
  `title_meta1` varchar(250) NOT NULL DEFAULT '' COMMENT 'заголовок окна в браузере, тег Title',
  `anons1` text DEFAULT NULL COMMENT 'анонс',
  `anons_plus1` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'добавлять анонс к описанию: 0 - нет, 1 - да',
  `text1` text DEFAULT NULL COMMENT 'описание',
  `prior` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'важно, всегда сверху: 0 - нет, 1 - да',
  `timeedit` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'время последнего изменения в формате UNIXTIME',
  `access` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'доступ ограничен: 0 - нет, 1 - да',
  `admin_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'пользователь из таблицы `diafan_users`, добавивший или первый отредктировавший объявление в административной части',
  `user_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор пользователя из таблицы `diafan_users`',
  `theme` varchar(50) NOT NULL DEFAULT '' COMMENT 'шаблон страницы сайта',
  `view` varchar(50) NOT NULL DEFAULT '' COMMENT 'шаблон модуля',
  `readed` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'сообщение прочитано: 0 - нет, 1 - да',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Объявления';

-- --------------------------------------------------------

--
-- Структура таблицы `diafan_ab_category`
--

CREATE TABLE `diafan_ab_category` (
  `id` int(11) UNSIGNED NOT NULL COMMENT 'идентификатор',
  `name1` text DEFAULT NULL COMMENT 'название',
  `act1` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'показывать на сайте: 0 - нет, 1 - да',
  `map_no_show` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'не показывать на карте сайта: 0 - нет, 1 - да',
  `changefreq` enum('always','hourly','daily','weekly','monthly','yearly','never') NOT NULL DEFAULT 'always' COMMENT 'Changefreq для sitemap.xml',
  `priority` varchar(3) NOT NULL DEFAULT '' COMMENT 'Priority для sitemap.xml',
  `noindex` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'не индексировать: 0 - нет, 1 - да',
  `parent_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор родителя из таблицы `diafan_ab_category`',
  `count_children` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'количество вложенных категорий',
  `site_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор страницы сайта из таблицы `diafan_site`',
  `keywords1` varchar(250) NOT NULL DEFAULT '' COMMENT 'ключевые слова, тег Keywords',
  `descr1` text DEFAULT NULL COMMENT 'описание, тэг Description',
  `canonical1` varchar(100) NOT NULL DEFAULT '' COMMENT 'канонический тег',
  `title_meta1` varchar(250) NOT NULL DEFAULT '' COMMENT 'заголовок окна в браузере, тег Title',
  `anons1` text DEFAULT NULL COMMENT 'анонс',
  `anons_plus1` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'добавлять анонс к описанию: 0 - нет, 1 - да',
  `text1` text DEFAULT NULL COMMENT 'описание',
  `sort` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'подрядковый номер для сортировки',
  `timeedit` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'время последнего изменения в формате UNIXTIME',
  `access` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'доступ ограничен: 0 - нет, 1 - да',
  `admin_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'пользователь из таблицы `diafan_users`, добавивший или первый отредктировавший категорию в административной части',
  `theme` varchar(50) NOT NULL DEFAULT '' COMMENT 'шаблон страницы сайта',
  `view` varchar(50) NOT NULL DEFAULT '' COMMENT 'шаблон модуля',
  `view_rows` varchar(50) NOT NULL DEFAULT '' COMMENT 'шаблон модуля для элементов в списке категории',
  `view_element` varchar(50) NOT NULL DEFAULT '' COMMENT 'шаблон модуля для элементов в категории',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Категории объявлений';

-- --------------------------------------------------------

--
-- Структура таблицы `diafan_ab_category_parents`
--

CREATE TABLE `diafan_ab_category_parents` (
  `id` int(11) UNSIGNED NOT NULL COMMENT 'идентификатор',
  `element_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор категории из таблицы `diafan_ab_category`',
  `parent_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор категории-родителя из таблицы `diafan_ab_category`',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Родительские связи категорий объявлений';

-- --------------------------------------------------------

--
-- Структура таблицы `diafan_ab_category_rel`
--

CREATE TABLE `diafan_ab_category_rel` (
  `id` int(11) UNSIGNED NOT NULL COMMENT 'идентификатор',
  `element_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор объявления из таблицы `diafan_ab`',
  `cat_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор категории из таблицы `diafan_ab_category`',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Связи объявлений и категорий';

-- --------------------------------------------------------

--
-- Структура таблицы `diafan_ab_counter`
--

CREATE TABLE `diafan_ab_counter` (
  `id` int(11) UNSIGNED NOT NULL COMMENT 'идентификатор',
  `element_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор объявления из таблицы `diafan_ab`',
  `count_view` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'количество просмотров',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Счетчик просмотров объявлений';

-- --------------------------------------------------------

--
-- Структура таблицы `diafan_ab_param`
--

CREATE TABLE `diafan_ab_param` (
  `id` int(11) UNSIGNED NOT NULL COMMENT 'идентификатор',
  `name1` varchar(250) NOT NULL DEFAULT '' COMMENT 'название',
  `type` varchar(20) NOT NULL DEFAULT '' COMMENT 'тип',
  `sort` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'подрядковый номер для сортировки',
  `search` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'характеристика выводится в форме поиска: 0 - нет, 1 - да',
  `list` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'характеристика выводится в списке: 0 - нет, 1 - да',
  `block` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'характеристика выводится в блоке объявлений: 0 - нет, 1 - да',
  `id_page` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'характеристика выводится на странице объявления: 0 - нет, 1 - да',
  `required` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'обязательно для заполнения: 0 - нет, 1 - да',
  `page` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'отдельная страница для значений: 0 - нет, 1 - да',
  `text1` text DEFAULT NULL COMMENT 'описание',
  `config` text DEFAULT NULL COMMENT 'дополнительные настройки поля',
  `display_in_sort` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'выводится в блоке для сортировки: 0 - нет, 1 - да',
  `measure_unit1` varchar(50) NOT NULL DEFAULT '' COMMENT 'единица измерения',
  `site_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор страницы сайта из таблицы `diafan_site`',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Дополнительные характеристики объявлений';

--
-- Дамп данных таблицы `diafan_ab_param`
--

INSERT INTO `diafan_ab_param` (`id`, `name1`, `type`, `sort`, `search`, `list`, `block`, `id_page`, `required`, `page`, `text1`, `config`, `display_in_sort`, `measure_unit1`, `site_id`, `trash`) VALUES
(1, 'Для связи', 'text', 1, '0', '0', '0', '0', '0', '0', NULL, NULL, '0', '', 151, '0');

-- --------------------------------------------------------

--
-- Структура таблицы `diafan_ab_param_category_rel`
--

CREATE TABLE `diafan_ab_param_category_rel` (
  `id` int(11) UNSIGNED NOT NULL COMMENT 'идентификатор',
  `element_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор характеристики из таблицы `diafan_ab_param`',
  `cat_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор категории из таблицы `diafan_ab_category`',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Связи дополнительных характеристик объявлений и категорий';

--
-- Дамп данных таблицы `diafan_ab_param_category_rel`
--

INSERT INTO `diafan_ab_param_category_rel` (`id`, `element_id`, `cat_id`, `trash`) VALUES
(1, 1, 0, '0');

-- --------------------------------------------------------

--
-- Структура таблицы `diafan_ab_param_element`
--

CREATE TABLE `diafan_ab_param_element` (
  `id` int(11) UNSIGNED NOT NULL COMMENT 'идентификатор',
  `value1` text DEFAULT NULL COMMENT 'значение',
  `param_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор характеристики из таблицы `diafan_ab_param`',
  `element_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор объявления из таблицы `diafan_ab`',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Значений дополнительных характеристик объявлений';

-- --------------------------------------------------------

--
-- Структура таблицы `diafan_ab_param_select`
--

CREATE TABLE `diafan_ab_param_select` (
  `id` int(11) UNSIGNED NOT NULL COMMENT 'идентификатор',
  `param_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор характеристики из таблицы `diafan_ab_param`',
  `value` tinyint(2) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'значение для типа характеристики «галочка»: 0 - нет, 1 - да',
  `name1` varchar(50) NOT NULL DEFAULT '' COMMENT 'значение',
  `sort` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'подрядковый номер для сортировки',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Варианты значений дополнительных характеристик объявлений типа список';

-- --------------------------------------------------------

--
-- Структура таблицы `diafan_ab_rel`
--

CREATE TABLE `diafan_ab_rel` (
  `id` int(11) UNSIGNED NOT NULL COMMENT 'идентификатор',
  `element_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор объявления из таблицы `diafan_ab`',
  `rel_element_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор похожего объявления из таблицы `diafan_ab`',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Связи похожих объявлений';

-- --------------------------------------------------------

--
-- Структура таблицы `diafan_access`
--

CREATE TABLE `diafan_access` (
  `id` int(11) UNSIGNED NOT NULL COMMENT 'идентификатор',
  `element_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор элемента модуля',
  `element_type` varchar(20) NOT NULL DEFAULT 'element' COMMENT 'тип элемента модуля',
  `module_name` varchar(50) NOT NULL DEFAULT '' COMMENT 'название модуля',
  `role_id` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор типа пользователя из таблицы `diafan_users_role`',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Доступ к элементам модулей';

-- --------------------------------------------------------

--
-- Структура таблицы `diafan_addons`
--

CREATE TABLE `diafan_addons` (
  `id` int(11) UNSIGNED NOT NULL COMMENT 'идентификатор',
  `addon_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор дополнения',
  `custom_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор из таблицы `diafan_custom`',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT 'название',
  `cat_name` varchar(100) NOT NULL DEFAULT '' COMMENT 'название категории',
  `anons` text DEFAULT NULL COMMENT 'анонс',
  `text` text DEFAULT NULL COMMENT 'описание',
  `install` text DEFAULT NULL COMMENT 'описание установки дополнения',
  `file_rewrite` varchar(255) NOT NULL DEFAULT '' COMMENT 'ссылка на страницу дополнения в административной части сайта',
  `tag` varchar(255) NOT NULL DEFAULT '' COMMENT 'тег дополнения',
  `link` varchar(255) NOT NULL DEFAULT '' COMMENT 'внешняя ссылка',
  `image` varchar(255) NOT NULL DEFAULT '' COMMENT 'внешняя ссылка на изображение',
  `author` text DEFAULT NULL COMMENT 'данные об авторе',
  `author_link` text DEFAULT NULL COMMENT 'ссылка на страницу автора',
  `sort` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'порядковый номер для сортировки',
  `downloaded` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'количество скачиваний',
  `price` double NOT NULL DEFAULT 0 COMMENT 'цена',
  `price_month` double NOT NULL DEFAULT 0 COMMENT 'цена по подписке',
  `available_subscription` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'доступно по подписке: 0 - нет, 1 - да',
  `buy` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'куплено дополнение: 0 - нет, 1 - да',
  `subscription` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'время окончания подписки на дополнение в формате UNIXTIME',
  `auto_subscription` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'автопродление подписки: 0 - нет, 1 - да',
  `timeedit` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'время последнего изменения в формате UNIXTIME',
  `custom_timeedit` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'время последнего изменения в формате UNIXTIME в таблице `diafan_custom`',
  `import_update` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'метка обновления записи: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Дополнения для CMS';

--
-- Дамп данных таблицы `diafan_addons`
--

INSERT INTO `diafan_addons` (`id`, `addon_id`, `custom_id`, `name`, `cat_name`, `anons`, `text`, `install`, `file_rewrite`, `tag`, `link`, `image`, `author`, `author_link`, `sort`, `downloaded`, `price`, `price_month`, `available_subscription`, `buy`, `subscription`, `auto_subscription`, `timeedit`, `custom_timeedit`, `import_update`) VALUES
(1, 312, 0, 'amoCRM', 'Общие модули', '<p>Передавайте в amoCRM сообщения из форм модуля &laquo;Обратная связь&raquo;, информацию о зарегистрировавшихся пользователях и заказы из магазина.</p>', '<p>Передавайте в <a href=\"https://www.amocrm.ru/\" target=\"_blank\">amoCRM</a> сообщения из форм модуля &laquo;Обратная связь&raquo;, информацию о зарегистрировавшихся пользователях и заказы из магазина.</p>\r\n<p><iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/M53mBkTC4nE?ytp-pause-overlay=0&rel=0&modestbranding=1\" frameborder=\"0\" allow=\"accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen=\"\"></iframe></p>\r\n<p>Настраивается интеграция в четыре шага:</p>\r\n<p>1. Указываете данные учетной записи amoCRM.</p>\r\n<p><img src=\"http://addons.diafan.ru//userfiles/images/amocrm/1.png\" alt=\"Настройка учетной записи amoCRM\" title=\"Настройка учетной записи amoCRM\" width=\"498\" height=\"384\" /></p>\r\n<p>2. Импортируете поля из amoCRM.</p>\r\n<p><img src=\"http://addons.diafan.ru//userfiles/images/amocrm/2.png\" alt=\"Импорт полей из amoCRM\" title=\"Импорт полей из amoCRM\" width=\"812\" height=\"416\" /></p>\r\n<p>3. Задаете модули и страницы, с которых будет передаваться информация. Можно выбрать из модулей &laquo;Корзина&raquo;, &laquo;Регистрация&raquo; и &laquo;Обратная связь&raquo; (все возможные формы из этого модуля).</p>\r\n<p><img src=\"http://addons.diafan.ru//userfiles/images/amocrm/3.png\" alt=\"Модули DIAFAN.CMS, из которых будут передаваться данные в amoCRM\" title=\"Модули DIAFAN.CMS, из которых будут передаваться данные в amoCRM\" width=\"840\" height=\"534\" /></p>\r\n<p>4. Сопоставляете поля выбранных модулей DIAFAN.CMS с полями amoCRM. Есть предустановленные данные. Так что вы легко разберетесь на примере.</p>\r\n<p><img src=\"http://addons.diafan.ru//userfiles/images/amocrm/4.png\" alt=\"Сопоставление полей DIAFAN.CMS и amoCRM\" title=\"Сопоставление полей DIAFAN.CMS и amoCRM\" width=\"511\" height=\"666\" /></p>\r\n<p>Теперь данные будут передаваться в amoCRM без вашего участия.</p>\r\n<p><strong><br /></strong></p>\r\n<p><strong>Новая версия от 19 августа 2019 г.</strong></p>', '<p>Дополнение можно установить двумя способами.</p>\r\n<p>1. В административной панели сайта в разделе &laquo;Дополнения для CMS&raquo; отмечаете &laquo;Установить&raquo; для данного дополнения. Для сайтов, созданных на DIAFAN.CMS 6.0.6.11+</p>\r\n<p>2. Если нет возможности установить из дополнений:</p>\r\n<ul>\r\n<li>Скачайте дополнение.&nbsp;</li>\r\n<li>В административной части сайта в разделе &laquo;Темы и дизайн&raquo; выберите &laquo;Добавить вручную&raquo;.&nbsp;</li>\r\n<li>Отметьте &laquo;Применить&raquo; и загрузите архив дополнения в поле &laquo;Импорт темы&raquo;.&nbsp;</li>\r\n<li>Затем нужно установить модуль &laquo;AmoCRM клиент&raquo; в интерфейсе &laquo;Модули и БД&raquo;.</li>\r\n</ul>', 'amocrm/param', '', 'http://addons.diafan.ru/modules/modules-and-services/amocrm/', 'http://addons.diafan.ru/userfiles/files/mmedium/1491_amocrm.png', 'Diafan', 'https://www.diafan.ru/', 673, 314, 0, 0, '0', '0', 0, '0', 1579077995, 0, '0'),
(2, 418, 0, 'Калькулятор доставки СДЭК', 'Доставка', '', '<p>Данный модуль интегрирует интернет магазин с службой доставки СДЭК. <br />Модуль протестирован на Diafan CMS начиная с версии 6.0.10.7<br /><br />В модуль интегрирован виджет (карта).</p>', 'Установка<br><br>А) Автоматически в модуле Дополнения в административной части Вашего сайта<br><br>Б) Вручную:<br><br>1. Скачиваем архив с модулем. <br>2. Заходим в раздел «Темы и дизайн» административной части DiafanCMS <br>3. Заходим (открываем на редактирование) в текущую тему <br>4. В пункте «Импорт темы», нажимаем «Выбрать файл» <br>5. Выбираем скачанный архив с модулем. <br>6. На странице редактирования темы жмём сохранить.<br><br>Далее нужно:<br>1. В разделе \"Настройки\" заходим в подраздел \"Модули и БД\" и устанавливаем галочку у появившегося модуля Служба доставки СДЭК <br>2. Прописать API ключи в настройки модуля и настроить его так как Вам это нужно. (Город доставки, вес по умолчанию, если нужно и вы не будете задавать его всем товарам отдельно). <br>3. В справочниках нужно создать доставки СДЭК (Курьер и ПВЗ).', 'delivery', '', 'http://addons.diafan.ru/modules/modules-and-services/kalkulyator-dostavki-sdek/', 'http://addons.diafan.ru/userfiles/files/mmedium/2004_1.png.png', 'Денис (korogan)', 'http://user.diafan.ru/user/korogan/', 672, 17, 5990, 290, '0', '0', 0, '0', 1585056792, 0, '0'),
(3, 594, 0, 'Регистрация и авторизация пользователей OAuth', 'Пользователи', '', '<p>Модуль автоматической регистрации и авторизации через соцсети: VK, Facebook, Google.</p>\r\n<p>Модуль автоматически добавляется к блоку стандартной авторизации при установке с помощью модуля \"Вставки\" либо тегом <insert name=\"show_oauth\" module=\"oauth\">, выводит кнопки VK, F, G, по клику на любую иконку переадресовывает на соответствующую соцсеть, запрашивает права, получает имя, email и аватар, возвращается на сайт, регистрирует пользователя и сразу авторизует его. В дальнейшем по клику, если пользователь ранее регистрировался через соцсеть, сразу авторизует его.</p>\r\n<p>Модуль полностью совместим с автообновлениями и работает в защищенном режиме.</p>\r\n<p>Версия DIAFAN.CMS 6.0.12+</p>', '<h2>Регистрация сайта во ВКонтакте</h2>\r\n<p>Зарегистрируйте сайт в виде веб-приложения на сайте: <a href=\"https://vk.com/editapp?act=create\" target=\"_blank\">https://vk.com/editapp?act=create</a>, чтобы получить ID-приложения и секретный ключ.</p>\r\n<p><img src=\"http://addons.diafan.ru//userfiles/images/oauth/vk1.jpg\" width=\"769\" height=\"440\" alt=\"vk1\" title=\"vk1\" /></p>\r\n<p><img src=\"http://addons.diafan.ru//userfiles/images/oauth/vk2.jpg\" width=\"853\" height=\"816\" alt=\"vk2\" title=\"vk2\" /></p>\r\n<h2>Регистрация сайта в Facebook</h2>\r\n<p>Зарегистрируйте сайт в виде на сайте Facebook: <a href=\"https://developers.facebook.com/apps/\" target=\"_blank\">https://developers.facebook.com/apps/</a>, чтобы получить ID-приложения и секретный ключ.</p>\r\n<p><img src=\"http://addons.diafan.ru//userfiles/images/oauth/fb1.jpg\" width=\"466\" height=\"370\" alt=\"fb1\" title=\"fb1\" /></p>\r\n<p>Получите секретные коды и активируйте приложение переключателем вверху</p>\r\n<p><img src=\"http://addons.diafan.ru//userfiles/images/oauth/fb2.jpg\" width=\"1163\" height=\"768\" alt=\"fb2\" title=\"fb2\" /></p>\r\n<p>Перейдите в настройки приложения и <strong>обязательно</strong> укажите возвратный URL: https://www.vash_site.ru/?fb=login</p>\r\n<p><img src=\"http://addons.diafan.ru//userfiles/images/oauth/fb3.jpg\" width=\"865\" height=\"744\" alt=\"fb3\" title=\"fb3\" /></p>\r\n<h2>Регистрация сайта в Google</h2>\r\n<p>Нажмите \"Создать учетные данные\" в \"API и сервисы\"</p>\r\n<p><img src=\"http://addons.diafan.ru//userfiles/images/oauth/g1.jpg\" width=\"970\" height=\"384\" alt=\"g1\" title=\"g1\" /></p>\r\n<p>Выберите \"Веб-приложение\"</p>\r\n<p><img src=\"http://addons.diafan.ru//userfiles/images/oauth/g2.jpg\" width=\"703\" height=\"750\" alt=\"g2\" title=\"g2\" /></p>\r\n<p>Заполните данные сайта и получите секретные коды</p>\r\n<p><img src=\"http://addons.diafan.ru//userfiles/images/oauth/g3.jpg\" width=\"1204\" height=\"884\" alt=\"g3\" title=\"g3\" /></p>\r\n<p><img src=\"http://addons.diafan.ru//userfiles/images/oauth/g4.jpg\" width=\"581\" height=\"588\" alt=\"g4\" title=\"g4\" /></p>\r\n<p><img src=\"http://addons.diafan.ru//userfiles/images/oauth/g5.jpg\" width=\"759\" height=\"829\" alt=\"g5\" title=\"g5\" /></p>', 'oauth', '', 'http://addons.diafan.ru/modules/polzovateli/registratsiya-i-avtorizatsiya-polzovateley-oauth/', 'http://addons.diafan.ru/userfiles/files/mmedium/3008_registratsiya-i-avtorizatsiya-.jpg', 'Diafan', 'https://www.diafan.ru/', 669, 3, 1000, 70, '0', '0', 0, '0', 1586178669, 0, '0'),
(4, 584, 0, 'Почта России: расчет стоимости доставки', 'Доставка', '', '<p>Модуль позволяет рассчитать в корзине стоимость доставки по одному из тарифов ПОЧТЫ РОССИИ. <br /><br />На данный момент доступны следующие тарифы:<br /><br />27030 => \'Посылка стандарт (Частному лицу или предприятию)\',<br />27020 => \'Посылка стандарт с объявленной ценностью (Частному лицу или предприятию)\',<br />27040 => \'Посылка стандарт с объявленной ценностью и наложенным платежом (Частному лицу или предприятию)\',<br />23030 => \'Посылка онлайн обыкновенная (Корпоративному клиенту)\',<br />23020 => \'Посылка онлайн с объявленной ценностью (Корпоративному клиенту)\',<br />23040 => \'Посылка онлайн с объявленной ценностью и наложенным платежом (Корпоративному клиенту)\',<br />4030 => \'Посылка нестандартная (Частному лицу или предприятию)\', <br />4020 => \'Посылка нестандартная с объявленной ценностью (Частному лицу или предприятию)\', <br />4040 => \'Посылка нестандартная с объявленной ценностью и наложенным платежом (Частному лицу или предприятию)\', <br />47030 => \'Посылка 1 класса (Частному лицу или предприятию)\', <br />47020 => \'Посылка 1 класса с объявленной ценностью (Частному лицу или предприятию)\', <br />47040 => \'Посылка 1 класса с объявленной ценностью и наложенным платежом (Частному лицу или предприятию)\', <br />30030 => \'Бизнес курьер (Корпоративному клиенту)\',<br />30020 => \'Бизнес курьер с объявленной ценностью (Корпоративному клиенту)\',<br />31030 => \'Бизнес курьер экспресс (Корпоративному клиенту)\',<br />31020 => \'Бизнес курьер экпресс с объявленной ценностью (Корпоративному клиенту)\',<br />39000 => \'КПО-стандарт (Корпоративному клиенту)\',<br />40000 => \'КПО-эконом (Корпоративному клиенту)\',<br />53030 => \'EKOM обыкновенный (Корпоративному клиенту)\',<br />53070 => \'EKOM обыкновенный с обязательным платежом (Корпоративному клиенту)\',<br /><br />В демо-версии не все способы отдают стоимость, т.к. некоторые тарифы работают только в отдельных городах и доставка там возможна в отдельные адреса, как и забор посылок. В таких случаях клиенту предлагается выбрать другой способ доставки.<br /><br />Подсчет стоимости по тарифам не требует авторизации на сайте Почты или заключения договора с Почтой. При этом для работы по некоторым из тарифов необходим договор с Почтой России. Подробно о каждом из тарифов можно узнать в корпоративных отделах ваших городов. <br /><br />Вес и габариты берутся из стандартных полей товаров в системе управления. Если они не указаны, то данные забираются из настроек модуля.<br /><br />В модуле есть возможность прибавить нужную сумму к стоимости доставки, а также указать вес упаковки, который будет прибавляться к весу посылки при расчете стоимости. Имеется возможность указать размер упаковки.<br /><br />Подробнее смотрите на скриншотах модуля.<br /><br />Будем очень благодарны за обратную связь, т.к. тарифов много и, возможно, что-то потребует доработки в виде более широких наборов параметров и прочих нюансов. <br /><br />Всем купившим обновления модуля предоставляются бесплатно.</p>', '<p>Установка<br /><br />А) Автоматически в модуле Дополнения в административной части Вашего сайта<br /><br />Б) Вручную:<br /><br />1. Скачайте архив с модулем.<br />2. В разделе &laquo;Темы и дизайн&raquo; административной части DIAFAN.CMS выберите &laquo;Добавить вручную&raquo; и введите произвольное имя темы.<br />3. В пункте &laquo;Импорт темы&raquo; нажмите &laquo;Выбрать файл&raquo; и выберите архив с модулем.<br />4. Нажмите &laquo;Сохранить&raquo;.</p>', 'delivery', '', 'http://addons.diafan.ru/modules/moduli-dostavki/pochta-rossii-raschet-stoimosti-dostavki/', 'http://addons.diafan.ru/userfiles/files/mmedium/2955_pochta-rossii.png.png', 'Андрей (kolia)', 'http://user.diafan.ru/user/kolia/', 655, 1, 5990, 290, '0', '0', 0, '0', 1583932689, 0, '0'),
(5, 566, 0, 'DPD: курьерская доставка', 'Доставка', '', 'Модуль добавляет в корзину способ доставки «Доставка DPD курьером». <br><br><b>Дополнение умеет:</b><br>– считать «на лету» стоимость доставки курьером до выбранного населенного пункта<br><br>Модуль содержит все нужные настройки для быстрого запуска способа доставки, в том числе, в тестовом режиме (подробнее на скриншотах)<br><br><b>Дополнение сделано в соответствии со всеми требованиями DIAFAN.CMS. Это означает, что:</b><br>– при установке оно абсолютно обособлено и не затрагивает файлы системы управления<br>– при обновлении дополнение будет работать и ничего не сломается<br><br>Версия API DPD всегда свежая, либо быстро обновляется (если DPD обновит свой обмен – обязательно напишите, мы внесем корректировки в модуль и на ваш сайт).<br><br>Все обновления модуля для купивших бесплатные.', '1. Скачайте архив с модулем.<br>2. В разделе «Темы и дизайн» административной части DIAFAN.CMS выберите «Добавить вручную» и введите произвольное имя темы, например dpdcourier.<br>3. В пункте «Импорт темы» нажмите «Выбрать файл» и выберите архив с модулем.<br>4. Нажмите «Сохранить».', '', 'delivery', 'http://addons.diafan.ru/modules/dpd-kurerskaya-dostavka/', 'http://addons.diafan.ru/userfiles/files/mmedium/2844_dostavka-do-doma.png.png', 'Андрей (kolia)', 'http://user.diafan.ru/user/kolia/', 653, 0, 3990, 200, '0', '0', 0, '0', 1577109399, 0, '0'),
(6, 565, 0, 'DPD: доставка в точки выдачи', 'Доставка', '', 'Модуль добавляет в корзину способ доставки «Доставка DPD до точки выдачи». <br><br><b>Дополнение умеет:</b><br>– считать «на лету» стоимость доставки до точки выдачи<br>– показывать все варианты возможных точек выдачи либо в виде выпадающего списка или на карте<br>– все точки выдачи хранятся на сервере, что значительно ускоряет работу с модулем – не нужно каждый раз забирать с сервере DPD все актуальные точки<br>– содержит все нужные настройки для быстрого запуска способа доставки, в том числе, в тестовом режиме (подробнее на скриншотах)<br><br><b>Дополнение сделано в соответствии со всеми требованиями DIAFAN.CMS. Это означает, что:</b><br>– при установке оно абсолютно обособлено и не затрагивает файлы системы управления<br>– при обновлении дополнение будет работать и ничего не сломается<br><br>Версия API DPD всегда свежая, либо быстро обновляется (если DPD обновит свой обмен – обязательно напишите, мы внесем корректировки в модуль и на ваш сайт).<br><br>Все обновления модуля для купивших бесплатные.', '1. Скачайте архив с модулем.<br>2. В разделе «Темы и дизайн» административной части DIAFAN.CMS выберите «Добавить вручную» и введите произвольное имя темы, например dpdpoints.<br>3. В пункте «Импорт темы» нажмите «Выбрать файл» и выберите архив с модулем.<br>4. Нажмите «Сохранить».', '', 'delivery', 'http://addons.diafan.ru/modules/dpd-dostavka-v-tochki-vydachi/', 'http://addons.diafan.ru/userfiles/files/mmedium/2840_punk-vydachi.png.png', 'Андрей (kolia)', 'http://user.diafan.ru/user/kolia/', 650, 0, 3990, 200, '0', '0', 0, '0', 1577109391, 0, '0'),
(7, 465, 0, 'Платежный модуль &quot;Альфа-Банк&quot;', 'Платежи', '<p>Платежный модуль Альфа-банка для приема онлайн платежей на сайте.</p>', '<p>Платежный модуль Альфа-Банка</p>\r\n<p><span style=\"color: #ff0000;\"><strong>Внимание!</strong>&nbsp;</span>По всем возникающим вопросам, ошибкам модуля вы можете писать в службу поддержки из своего Личного кабинета</p>\r\n<p>Дополнение устанавливается из панели управления DIAFAN.CMS 6.0.6.11+ на Вашем сайте либо импортируется вручную в разделе \"Темы и дизайн\".</p>', '<ol>После установки модуля добавьте новый метод оплаты, указав платежной системой &laquo;Альфа-банк&raquo;. После добавления откройте метод и пропишите в параметрах Логин и Пароль для магазина из Личного кабинета Альфа-Банка.&nbsp;Используйте логин с суффиксом -api.</ol>', 'payment', 'payment', 'http://addons.diafan.ru/modules/platezhnye-moduli/platezhnyy-modul-alfa-bank/', 'http://addons.diafan.ru/userfiles/files/mmedium/2288_platezhnyy-modul-alfa-ban.jpg', 'Diafan', 'https://www.diafan.ru/', 648, 159, 0, 0, '0', '0', 0, '0', 1578340293, 0, '0'),
(8, 562, 0, 'Скидка за E-MAIL: модуль сбора  e-mail в  обмен на купон', 'Оповещения, уведомления, рассылки, связь', '', '<p><b>Зачем нужен модуль?</b><br /><br />При входе на сайт всплывает окно с Вашим текстом и просьбой оставить e-mail. В обмен на предложенную скидку предлагаем посетителю оставить электронный адрес. После получения почты потенциальному клиенту отправляется купон со скидкой. Все регулируется средствами модуля и стандартными скидками diafan.CMS. Т.е. настраивается как угодно. На любом крупном и не очень сайте подобные окна есть на протяжении многих лет. Они работают! Работают как источник покупателей. Как источник будущей прибыли и самое главное &mdash; клиента на многие годы существования магазина. <br /><br /><b>Если посетитель оставил e-mail</b><br /><br />- Автоматически попадает в базу рассылки сайта<br />- Автоматически попадает в рассылку по брошенным корзинам<br /><br /><b>Зачем собирать электронную почту посетителей?</b><br /><br />- каждая электронная почта потенциальный покупатель<br /><br /><i>Если пользователь оставил почту и ему что-то не понравилось сегодня &mdash; всегда можно отправить письмо и пригласить на сайт вновь (акции, брошенные корзина, поздравления с днем рождения, подборки товаров, повышение лояльности покупателей к бренду и многое другое)</i><br /><br />- минимизация потерь перешедших на сайт пользователей<br /><br /><i>Каждый клик откуда угодно стоит Вам денег. Даже если это переход из поисковой системы, а не прямая реклама. Даже если Вы не отдали денег кому-то за продвижение &mdash; Ваше время это самая бесценная валюта. Пришедший пользователь кликнувший по рекламе и ушедший с сайта через 30 секунд просто потратил Ваши деньги. Не допускайте этого! Конвертируйте любое посещение минимум в e-mail</i><br /><br />- затраты на рассылки почти ничего не стоят<br /><br /><i>Разослать 5000 тысяч писем сейчас практически ничего не стоит во многих сервисах (в рамках системы управления diafan.CMS не стоит вообще ничего). Затраты на создание баннера и текста рассылки минимальны, можно сделать самому. Даже самая слабо подготовленная рассылка даст результат &mdash; чем больше база электронных адресов, тем выше прибыль. Одна хорошая рассылка может окупить все затраченные время и деньги с первого раза</i><br /><br />- возможно автоматизировать почти все<br /><br /><i>в системе управления уже есть отправка писем по брошенным корзинам, модуль рассылок. В сторонних сервисах есть такое, о чем Вы даже не подозревали.</i><br /><br />- Возможность стимулирования продаж в несезонное для магазина время (при условии наличия сезонности товара, конечно же)<br /><br />- Возврат ушедших клиентов<br /><br />- Удержание текущих клиентов<br /><br />Плюсов рассылки еще очень много &mdash; например сложные маркетинговые стратегии в комплексе с другими рекламными каналами. Перечислены лишь основные.<br /><br />У нас много клиентов &mdash; очень многие не использует рассылку. Они совершают огромную ошибку. Клиенты, которые решились делать регулярные уведомления в растущей базе подписчиков окупают затраты очень быстро. При условии нормальной базы с первой акционной рассылки. Проверено на десятках клиентов. <br /><br />Не ждите пока магазин вырастет и вот тогда Вы начнете рассылать письма &mdash; готовьтесь, собирая почты клиентов сейчас или рассылайте уже сейчас. Наш модуль Вам в этом обязательно поможет.<br /><br />Для купивших все обновления модуля бесплатны.</p>', '<p>Установка</p>\r\n<p>А) Автоматически в модуле Дополнения в административной части Вашего сайта</p>\r\n<p>Б) Вручную:</p>\r\n<p>1. Скачайте архив с модулем.<br />2. В разделе &laquo;Темы и дизайн&raquo; административной части DIAFAN.CMS выберите &laquo;Добавить вручную&raquo; и введите произвольное имя темы, например couponmail.<br />3. В пункте &laquo;Импорт темы&raquo; нажмите &laquo;Выбрать файл&raquo; и выберите архив с модулем. <br />4. Нажмите &laquo;Сохранить&raquo;.<br />5. В разделе &laquo;Настройки&raquo; зайдите в подраздел &laquo;Модули и БД&raquo;, установите галочку &laquo;Купон за E-mail (RL)&raquo; и нажмите &laquo;Установить&raquo;.</p>', 'couponmail', '', 'http://addons.diafan.ru/modules/skidka-za-e-mail-modul-sbora-e-mail-v-obmen-na-kupon/', 'http://addons.diafan.ru/userfiles/files/mmedium/2819_podpiska-s-kuponom.png.png', 'Андрей (kolia)', 'http://user.diafan.ru/user/kolia/', 646, 1, 3599, 180, '0', '0', 0, '0', 1576786915, 0, '0'),
(9, 559, 0, 'Снижение показателя брошенных корзин: модуль «Отсчет времени резерва»', 'Заказы', '', '<p>Модуль предназначен для увеличения количества заказов и снижения показателя брошенных корзин (который, как правило, очень большой). Сообщение со счетчиком обратного отсчета в корзине о резервировании товара на короткий промежуток времени стимулирует пользователя к скорейшему оформлению заказа. <br /><br />Легко настраивается по Вашему усмотрению&nbsp;<span>&ndash;</span> цвета, размер/текст надписей (подробнее на скриншотах и видео).<br /><br />Дополнение абсолютно обособлено. Вы можете не переживать за обновление системы управления.<br /><br />Для купивших все обновления модуля бесплатны.<br /><br />По всем вопросам обращайтесь в комментариях к данному модулю или в личные сообщения.<br /><br /><iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/67hI9R3JfZ0?ytp-pause-overlay=0&rel=0&modestbranding=1\" frameborder=\"0\" allow=\"accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen=\"\"></iframe></p>', '<p>Установка</p>\r\n<p>А) Автоматически в модуле Дополнения в административной части Вашего сайта</p>\r\n<p>Б) Вручную:</p>\r\n<p>1. Скачайте архив с модулем. <br />2. В разделе &laquo;Темы и дизайн&raquo; административной части DIAFAN.CMS выберите &laquo;Добавить вручную&raquo; и введите произвольное имя темы, например reserve.<br />3. В пункте &laquo;Импорт темы&raquo; нажмите &laquo;Выбрать файл&raquo; и выберите архив с модулем. <br />4. Нажмите &laquo;Сохранить&raquo;. <br />5. В разделе &laquo;Настройки&raquo; зайдите в подраздел &laquo;Модули и БД&raquo;, установите галочку &laquo;Отсчет времени резерва (RL)&raquo; и нажмите &laquo;Установить&raquo;.</p>', 'reserve/config', '', 'http://addons.diafan.ru/modules/snizhenie-pokazatelya-broshennykh-korzin-modul-ots/', 'http://addons.diafan.ru/userfiles/files/mmedium/2798_reserv.png.png', 'Андрей (kolia)', 'http://user.diafan.ru/user/kolia/', 638, 0, 2990, 150, '0', '0', 0, '0', 1577694000, 0, '0'),
(10, 558, 0, 'Увеличение продаж акционных товаров: модуль «Успей купить!»', 'Цены, скидки, акции', '', '<p>Модуль предназначен для увеличения конверсии по продажам акционных товаров. Счетчик обратного отсчета оставшегося времени скидки стимулирует пользователя к покупке. <br /><br />Модуль прекрасно подойдет для таких акций как &laquo;Товар дня&raquo; (скидка действует определенный период времени на разные товары, которые ежедневно меняются) и ей подобных. <br /><br />Легко настраивается по Вашему усмотрению&nbsp;<span>&ndash;</span> цвета, места отображения, страницы отображения, размер/текст надписей и т.д. (подробнее на скриншотах и видео).<br /><br />Дополнение абсолютно обособлено. Вы можете не переживать за обновление системы управления. В качестве механизма скидок используется стандартный функционал системы управления.<br /><br />Для купивших все обновления модуля бесплатны.<br /><br />По всем вопросам обращайтесь в комментариях к данному модулю или в личные сообщения.<br /><br /><iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/LU6hnypZoo4?ytp-pause-overlay=0&rel=0&modestbranding=1\" frameborder=\"0\" allow=\"accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen=\"\"></iframe></p>', '<p>Установка:</p>\r\n<p>А) Автоматически из панели Дополнений в административной части сайта</p>\r\n<p>Б) Ручная установка:</p>\r\n<p>1. Скачайте архив с модулем. <br />2. В разделе &laquo;Темы и дизайн&raquo; административной части DIAFAN.CMS выберите &laquo;Добавить вручную&raquo; и введите произвольное имя темы, например thingsbuy.<br />3. В пункте &laquo;Импорт темы&raquo; нажмите &laquo;Выбрать файл&raquo; и выберите архив с модулем. <br />4. Нажмите &laquo;Сохранить&raquo;. <br />5. В разделе &laquo;Настройки&raquo; зайдите в подраздел &laquo;Модули и БД&raquo;, установите галочку &laquo;Успей купить (RL)&raquo; и нажмите &laquo;Установить&raquo;.</p>', 'thingsbuy/config/', '', 'http://addons.diafan.ru/modules/uvelichenie-prodazh-aktsionnykh-tovarov-modul-uspe/', 'http://addons.diafan.ru/userfiles/files/mmedium/2791_sale.png.png', 'Андрей (kolia)', 'http://user.diafan.ru/user/kolia/', 634, 1, 3490, 175, '0', '0', 0, '0', 1577694125, 0, '0'),
(11, 564, 0, 'Каптча больше не нужна: модуль сервиса CleanTalk', 'Общие модули', '', '<p>Модуль позволяет полностью отказаться от каптчи с помощью сервиса CleanTalk. Теперь не нужно вводить коды, собирать пазлы, даже нажимать галки. Все происходит в скрытом режиме на основе поведения посетителя и других факторов. Модуль предоставляет серьезную защиту от спама. Продуманный алгоритм работы позволяет очень точно отделять нормальных посетителей от ботов и злоумышленников. Вы не будете терять клиентов. Также сервис предоставляет полную статистику обращений из всех форм в личном кабинете.<br /><br />Дополнение устанавливается в разделе Captcha как еще один вариант каптчи. Установка и настройка очень просты, модуль используется для всех форм на сайте, в которых предусмотрена защита.<br /><br />Итак, CleanTalk это:</p>\r\n<ul>\r\n<li>100% защита от спам-ботов</li>\r\n<li>Экономия времени и ресурсов</li>\r\n<li>Рост регистраций/комментариев/посетителей</li>\r\n<li>Просто в установке и использовании</li>\r\n<li>Привлечение трафика и лояльность посетителей</li>\r\n<li>Техническая поддержка 24/7</li>\r\n<li>Прозрачную статистику</li>\r\n<li>Без капчи, пазлов и т.д.</li>\r\n<li>Бесплатное мобильное приложение</li>\r\n</ul>\r\n<p>Обновления модуля будут бесплатными для купивших.</p>', '<p>1. Скачайте архив с модулем.<br />2. В разделе &laquo;Темы и дизайн&raquo; административной части DIAFAN.CMS выберите &laquo;Добавить вручную&raquo; и введите произвольное имя темы, например cleantalk.<br />3. В пункте &laquo;Импорт темы&raquo; нажмите &laquo;Выбрать файл&raquo; и выберите архив с модулем.<br />4. Нажмите &laquo;Сохранить&raquo;.</p>', 'captcha', 'captcha', 'http://addons.diafan.ru/modules/kaptcha-bolshe-ne-nuzhna-modul-servisa-cleantalk/', 'http://addons.diafan.ru/userfiles/files/mmedium/2837_spamCaptcha.png.png', 'Андрей (kolia)', 'http://user.diafan.ru/user/kolia/', 632, 0, 2990, 150, '0', '0', 0, '0', 1573286240, 0, '0'),
(12, 492, 0, 'SEO-виджет Limtek.ru', 'SEO', '<p>Виджет компании Лимтек с описанием услуг, ценами и контактами.</p>', '<p>Виджет компании LIMTEK. Описание услуг продвижения сайтов в поисковых системах Yandex, Google и контекстной рекламы, а также SMM.<br /><br />Виджет устанавливается из панели управления DIAFAN.CMS 6.0.6.11+ на Вашем сайте либо импортируется вручную в разделе \"Темы и дизайн\".</p>', '<p>После установки модуля появится пункт в административном меню, чтобы перейти в карточку компании.</p>', 'limtek', '', 'http://addons.diafan.ru/uslugi/seo/besplatnyy-seo-audit/', 'http://addons.diafan.ru/userfiles/files/mmedium/2716_2715_seo-ot-limtek.png.png', 'Виталий (echo)', 'http://user.diafan.ru/user/echo/', 592, 10, 0, 0, '0', '0', 0, '0', 1565172477, 0, '0'),
(13, 454, 0, 'OrangeDATA — сервис по аренде онлайн-касс', 'Платежи', '<p>OrangeDATA &mdash; сервис по аренде онлайн-кассы для сайта (соответствует требованиям 54-ФЗ).</p>', '<p>Cервис по аренде онлайн-касс&nbsp;для регистрации расчетов с использованием электронных средств платежа в сети Интернет:</p>\r\n<ul>\r\n<li>фискальные накопители для каждой ККТ</li>\r\n<li>формирование фискальных документов и их отправка в ФНС в режиме реального времени</li>\r\n<li>доступ к удобному личному кабинету с полной статистикой по кассам, управлением услугами</li>\r\n<li>возможность прямого подключения к оператору фискальных данных &laquo;ОФД-Я&raquo;</li>\r\n</ul>\r\n<p><strong><span style=\"color: #800000;\">Внимание!</span>&nbsp;</strong><span>По всем возникающим вопросам, ошибкам модуля вы можете писать в службу поддержки из своего&nbsp;</span><a href=\"https://user.diafan.ru/\">Личного кабинета</a><span>.</span></p>\r\n<p><span>Реализован в виде бэкенда к модулю &laquo;Онлайн касса&raquo;.</span></p>', '<div>\r\n<p><strong>Установка модуля</strong></p>\r\n<p>1. В настройках модуля&nbsp; &laquo;Онлайн касса&raquo; (Оплата &mdash; Онлайн касса &mdash;&nbsp;Настройки модуля) в списке&nbsp;&laquo;Тип&raquo; выберите &laquo;Добавить тип&raquo;.</p>\r\n<p>2. В открывшемся списке дополнений выберите&nbsp;&laquo;OrangeDATA &mdash; сервис по аренде онлайн-касс&raquo; &mdash;&nbsp;&laquo;Установить&raquo;.</p>\r\n<p>3. Теперь в настройках модуля&nbsp;&laquo;Онлайн касса&raquo; будет доступен тип&nbsp;&laquo;Orangedata&raquo;.</p>\r\n<p><br /><strong>Настройка модуля&nbsp;</strong></p>\r\n<p>В настройках модуля&nbsp;&laquo;Онлайн касса&raquo; выберите&nbsp;&laquo;Тип&raquo; &mdash;&nbsp;&laquo;Orangedata&raquo;. Теперь будут доступны настройки сервиса OrangeDATA.</p>\r\n</div>', 'cashregister/config', 'cashregister', 'http://addons.diafan.ru/modules/platezhnye-moduli/orangedata/', 'http://addons.diafan.ru/userfiles/files/mmedium/2287_orangedata---servis-po-arende-onl.jpg', 'Diafan', 'https://www.diafan.ru/', 573, 117, 0, 0, '0', '0', 0, '0', 1578340301, 0, '0'),
(14, 464, 0, 'АТОЛ — сервис по аренде онлайн-касс', 'Платежи', '<p>АТОЛ<span>&nbsp;&mdash;</span> сервис по аренде онлайн-кассы для сайта (соответствует требованиям 54-ФЗ).</p>', '<p>Онлайн-касса для сайта в соответствии с требованиями обновлённого 54-ФЗ. Соответствует новому порядку применения ККТ: независимо от способа оплаты (наличные, электронные средства платежа, оплата в сети Интернет, мобильный банк и др.), интернет-магазин должен выдать чек покупателю в момент расчета.</p>\r\n<p><span><span style=\"color: #ff0000;\"><strong>Внимание!</strong></span>&nbsp;</span>По всем возникающим вопросам, ошибкам модуля вы можете писать в службу поддержки из своего <a href=\"https://user.diafan.ru/\">Личного кабинета</a>.</p>\r\n<p><span>Реализован в виде бэкенда к модулю &laquo;Онлайн касса&raquo;.</span></p>', '<p><strong>Установка модуля</strong></p>\r\n<p>1. В настройках модуля&nbsp; &laquo;Онлайн касса&raquo; (Оплата &mdash; Онлайн касса &mdash;&nbsp;Настройки модуля) в списке&nbsp;&laquo;Тип&raquo; выберите &laquo;Добавить тип&raquo;.</p>\r\n<p>2. В открывшемся списке дополнений выберите&nbsp;&laquo;АТОЛ &mdash; сервис по аренде онлайн-касс&raquo; &mdash;&nbsp;&laquo;Установить&raquo;.</p>\r\n<p>3. Теперь в настройках модуля&nbsp;&laquo;Онлайн касса&raquo; будет доступен тип&nbsp;&laquo;Атол онлайн&raquo;.</p>\r\n<p><br /><strong>Настройка модуля&nbsp;</strong></p>\r\n<p>В настройках модуля&nbsp;&laquo;Онлайн касса&raquo; выберите&nbsp;&laquo;Тип&raquo; &mdash;&nbsp;&laquo;Атол онлайн&raquo;. Теперь будут доступны настройки сервиса АТОЛ.</p>', 'cashregister/config', 'cashregister', 'http://addons.diafan.ru/modules/atol-servis-po-arende-onlayn-kass/', 'http://addons.diafan.ru/userfiles/files/mmedium/2285_atol.jpg', 'Diafan', 'https://www.diafan.ru/', 571, 367, 0, 0, '0', '0', 0, '0', 1578340307, 0, '0'),
(15, 283, 0, 'Платежный модуль Сбербанка', 'Платежи', '<p>Платежный модуль Сбербанка для приема онлайн платежей на сайте.</p>', '<p>Платежный модуль Сбербанка для приема онлайн платежей на сайте.</p>\r\n<p></p>\r\n<p>Дополнение устанавливается из панели управления DIAFAN.CMS 6.0.6.11+ на Вашем сайте либо импортируется вручную в разделе \"Темы и дизайн\".</p>', '<p>После установки дополнения создайте в административной панели Вашего сайта новый способ оплаты и внесите туда необходимые настройки.</p>', 'payment', 'payment', 'http://addons.diafan.ru/modules/platezhnye-moduli/platezhnyy-modul-sberbanka/', 'http://addons.diafan.ru/userfiles/files/mmedium/2048_platezhnyy-modul-sberbanka.jpg', 'Gar|k (garik)', 'http://user.diafan.ru/user/garik/', 570, 475, 0, 0, '0', '0', 0, '0', 1578340313, 0, '0'),
(16, 413, 0, 'Платежный модуль «Тинькофф Банк»', 'Платежи', '<p>Платежный модуль банка Тинькофф для приема онлайн платежей на сайте.</p>', '<p>Платежный модуль &laquo;Тинькофф Банк&raquo;</p>\r\n<p>Дополнение устанавливается из панели управления DIAFAN.CMS 6.0.6.11+ на Вашем сайте либо импортируется вручную в разделе \"Темы и дизайн\".</p>', '<ol>\r\n<li>После установки дополнения создайте новый метод оплаты, указав в списке платежной системы &laquo;Tinkoff&raquo;. Откройте созданный метод и в &nbsp;настройках укажите в поле &laquo;Tinkoff: шлюз&raquo;: https://securepay.tinkoff.ru/rest/. В поля &laquo;Tinkoff: терминал&raquo; и &laquo;Tinkoff: секретный ключ&raquo; пропишите параметры Терминал и Пароль для магазина из Личного кабинета https://oplata.tinkoff.ru.</li>\r\n<li>Перейдите на сайт oplata.tinkoff.ru, &laquo;Профиль&raquo; -> &laquo;Магазины&raquo;, выберите свой магазин, в меню слева выберите пункт &laquo;Терминалы&raquo; и нажмите &laquo;Настроить&raquo;. Выполните следующие настройки: Выберите способ подключения: &laquo;Универсальное подключение&raquo;, Выберите пункт: Нотификация по http(s), URL для нотификации по http: <название_сайта>/payment/get/tinkoff/notification Если вы хотите использовать стандартные страницы успешного/неуспешного платежа, то оставьте значения по умолчанию в полях URL страницы успешного/неуспешного платежа. Если вы хотите использовать страницы успешного/неуспешного платежа расположенные на вашем сайте, необходимо выбрать тип страницы &laquo;Собственная страница&raquo; и прописать следующие значения: URL страницы успешного платежа: <название_сайта>/payment/get/tinkoff/success URL страницы неуспешного платежа: <название_сайта>/payment/get/tinkoff/failure</li>\r\n</ol>', 'payment', 'payment', 'http://addons.diafan.ru/modules/platezhnye-moduli/platezhnyy-modul-tinkoff-bank/', 'http://addons.diafan.ru/userfiles/files/mmedium/2023_platezhnyy-modul-tinkoff.jpg', 'Diafan', 'https://www.diafan.ru/', 560, 115, 0, 0, '0', '0', 0, '0', 1577372103, 0, '0'),
(17, 455, 0, 'Платежный модуль PayMaster', 'Платежи', '<p>Платежный модуль PayMaster для приема онлайн платежей на сайте.</p>', '<p><a href=\"https://www.paymaster.ru/\" target=\"_blank\">PayMaster</a> &mdash; удобная онлайн-оплата на сайте. Прием платежей на сайте с помощью PayMaster &mdash; это один договор, одна интеграция и множество популярных способов оплаты: банковские карты, интернет-банкинг, терминалы, электронные платежные системы, денежные переводы и другие.</p>\r\n<p>Дополнение устанавливается из панели управления DIAFAN.CMS 6.0.6.11+ на Вашем сайте либо импортируется вручную в разделе \"Темы и дизайн\".</p>', '<ol>\r\n<li>После установки дополнение добавьте новый метод оплаты, указав &laquo;PayMaster&raquo;. Откройте созданный метод и заполните параметрами, полученными в PayMaster.</li>\r\n<li>В личном кабинете на сайте paymaster.ru укажите: <br />Тип подписи: SHA256 <br />Payment notification: POST запрос и http://ваш-сайт.ru/payment/get/paymaster/notification <br />Success redirect: POST запрос и http://ваш-сайт.ru/payment/get/paymaster/success <br />Failure redirect: POST запрос и http://ваш-сайт.ru/payment/get/paymaster/failure</li>\r\n</ol>', 'payment', 'payment', 'http://addons.diafan.ru/modules/platezhnye-moduli/platezhnyy-modul-paymaster/', 'http://addons.diafan.ru/userfiles/files/mmedium/2245_platezhnyy-modul-paymaster.jpg', 'Diafan', 'https://www.diafan.ru/', 559, 167, 0, 0, '0', '0', 0, '0', 1578340329, 0, '0'),
(18, 284, 0, 'Платежный модуль RFI Bank', 'Платежи', '<p>Платежный модуль RFI Bank для приема онлайн платежей на сайте.</p>', '<p>- Мы предложим ставку ниже, чем любой посредник. <br />- Мы единственный классический БАНК в России, который предоставляет 9(!) способов оплаты в рамках одного договора. <br />- Интернет эквайринг &ndash; наш основной бизнес и мы реализуем всё лучшее, что есть на мировом рынке. <br />- Технически у нас есть ВСЁ - удобный виджет оплаты на сайте, оплата по QR-коду, короткие ссылки, рекуррентный платеж, двухэтапная авторизация (холдирование) и пр. <br />- API &ndash; реально простое <a href=\"http://lib.rfibank.ru/\" target=\"_blank\">http://lib.rfibank.ru/</a> <br />- 45 подключенных CMS. <br />- Выплачиваем деньги на следующий день.</p>\r\n<p></p>\r\n<p>Дополнение устанавливается из панели управления DIAFAN.CMS 6.0.6.11+ на Вашем сайте либо импортируется вручную в разделе \"Темы и дизайн\".</p>', '<p>После установки дополнения необходимо выполнить:</p>\r\n<p>1. Регистрируемся на rficb.ru <br />2. Заходим в административную часть сайта в раздел Оплата и нажимаем добавить. Выбираем тип платежную систему Rficb <br />3. Настраиваем способ оплаты: <br />ввести ключ платежа и секретный ключ <br />4. В личном кабинете rficb в разделе \"Инструменты / Сервисы\" добавьте сервис и заполните настройки. <br />URL скрипта обработчика на Вашем сайте: <a href=\"http://www.example.com/payment/get/rficb/result\" target=\"_blank\">http://www.example.com/payment/get/rficb/result</a> <br />URL страницы успешной покупки: <a href=\"http://www.example.com/payment/get/rficb/success\" target=\"_blank\">http://www.example.com/payment/get/rficb/success</a> <br />URL страницы ошибки: <a href=\"http://www.example.com/payment/get/rficb/fail\" target=\"_blank\">http://www.example.com/payment/get/rficb/fail</a></p>', 'payment', 'payment', 'http://addons.diafan.ru/modules/platezhnye-moduli/platezhnyy-modul-rfi-bank/', 'http://addons.diafan.ru/userfiles/files/mmedium/2047_platezhnyy-modul-rfi-bank.jpg', 'Сергей (rfibank)', 'http://user.diafan.ru/user/rfibank/', 557, 26, 0, 0, '0', '0', 0, '0', 1578340336, 0, '0'),
(19, 51, 0, 'Платежный модуль PayAnyWay', 'Платежи', '<p>Платежный модуль PayAnyWay для приема онлайн платежей на сайте.</p>', '<p>2.4 изменен способ получения e-mail пользователя при проведении успешной оплаты. <br /> <br />В версии 2.3 от 04.09.2017 изменена схема работы сервисом <a href=\"https://kassa.payanyway.ru\" target=\"_blank\">https://kassa.payanyway.ru</a>. Теперь для подключения кассы используйте \"Транзитный Pay URL\": <br /> <br />Для этого в настройках Вашего расширенного счёта в Монета.ру установите Pay URL: <a href=\"https://kassa.payanyway.ru/index.php?do=invoicepayurl,\" target=\"_blank\">https://kassa.payanyway.ru/index.php?do=invoicepayurl,</a> а в настройках кассы в kassa.payanyway.ru пропишите ссылку на Pay URL Вашего интернет-магазина. В этом случае будет пробиваться чек по 54-ФЗ через сервис kassa.payanyway.ru, а запрос на Pay URL магазина будет проходить транзитом через сервис kassa.payanyway.ru. <br /> <br />Версия (v 2.0) платежного модуля PayAnyWay, поддерживающая фискализацию чека согласно 54-ФЗ через сервис <a href=\"https://kassa.payanyway.ru\" target=\"_blank\">https://kassa.payanyway.ru</a> <br /> <br />Можно использовать кассу АТОЛ онлайн и МодульКассу. <br /> <br />PayURL - <a href=\"http://site.ru/payment/get/payanyway/success/\" target=\"_blank\">http://site.ru/payment/get/payanyway/result/</a> <br /> <br />HTTP-метод: POST!</p>\r\n<p></p>\r\n<p>Дополнение устанавливается из панели управления DIAFAN.CMS 6.0.6.11+ на Вашем сайте либо импортируется вручную в разделе \"Темы и дизайн\".</p>', '<p>После установки дополнения создайте платежный метод, указа PayAnyWay и настройте его.</p>\r\n<p>При возникновении вопросов или сложностей пишите в тех. поддержку: tech@support.moneta.ru</p>', 'payment', 'payment', 'http://addons.diafan.ru/modules/platezhnyy-modul-payanyway/', 'http://addons.diafan.ru/userfiles/files/mmedium/1800_logo_payanyway_ecwid_png.png.png', 'moneta_ru (moneta_ru)', 'http://user.diafan.ru/user/moneta_ru/', 556, 155, 0, 0, '0', '0', 0, '0', 1578340361, 0, '0'),
(20, 490, 0, 'Оплата CloudPayments', 'Платежи', '', '<p>Модуль позволит с легкостью добавить на ваш сайт оплату банковскими картами через платежный сервис CloudPayments. Порядок регистрация сайта описан в документации <a href=\"https://cloudpayments.ru/Docs/Connect\" target=\"_blank\">https://cloudpayments.ru/Docs/Connect</a> <br /> <br />Возможности: <br />&bull; Одностадийная схема оплаты; <br />&bull; Поддержка онлайн-касс (ФЗ-54); <br />&bull; Отправка чеков по email; <br />&bull; Отправка чеков по SMS; <br />&bull; Отдельная настройка НДС для доставки;</p>', '<p><b>Установка модуля</b> <br />Разархивируйте модуль и скопируйте каталог modules в корень сайта <br /> <br /><b>Техническая настройка </b> <br />Личный кабинет CloudPayments <br />В личном кабинете CloudPayments в настройках сайта необходимо включить следующие уведомления: <br /> <br />Запрос на проверку платежа (Сheck): <br />http://domain.ru/payment/get/cloudpayments/check <br />Уведомление о принятом платеже (Pay): <br />http://domain.ru/payment/get/cloudpayments/pay <br />Уведомление при отклоненном платеже (Fail): <br />http://domain.ru/payment/get/cloudpayments/fail <br />Уведомление о возврате платежа (Refund): <br />http://domain.ru/payment/get/cloudpayments/refund <br />Где domain.ru &mdash; доменное имя вашего сайта. Во всех случаях требуется выбирать вариант по умолчанию: кодировка &mdash; UTF-8, HTTP-метод &mdash; POST, формат &mdash; CloudPayments Данные URL можно скопировать из настройки модуля CloudPayments в панели администрирования DiafanCMS <br /> <br /><b>Панель администратора DiafanCMS </b> <br />В разделе \"Оплата\" (Интернет-магазин) необходимо добавить новый способ оплаты и указать платежную систему CloudPayments Затем указать следующий настройки: <br /> <br />Идентификатор сайта &mdash; Public id сайта из личного кабинета CloudPayments <br />Секретный ключ &mdash; API Secret из личного кабинета CloudPayments <br />Язык виджета &mdash; Язык интерфейса виджета <br />Валюта виджета &mdash; Валюта в которой будет происходить оплата <br />При использовании интеграции с онлайн-кассой <br />Онлайн-касса &mdash; Включение/отключение формирования онлайн-чека при оплате <br />Система налогообложения &mdash; Тип системы налогообложения. Возможные значения перечислены в документации CloudPayments <a href=\"https://cloudpayments.ru/Docs/Directory#taxation-system\" target=\"_blank\">https://cloudpayments.ru/Docs/Directory#taxation-system</a> <br />Ставка НДС &mdash; Указание ставки НДС. Все возможные значения указаны в документации <a href=\"https://cloudpayments.ru/Docs/Kassa#data-format\" target=\"_blank\">https://cloudpayments.ru/Docs/Kassa#data-format</a> <br />Ставка НДС для доставки &mdash; Указание ставки НДС для доставки. Аналогично ставке НДС.</p>', 'payment', 'payment', 'http://addons.diafan.ru/modules/platezhnye-moduli/oplata-cloudpayments/', 'http://addons.diafan.ru/userfiles/files/mmedium/2711_logo-5122.png.png', 'CloudPayments Support (support-cp)', 'http://user.diafan.ru/user/support-cp/', 554, 59, 0, 0, '0', '0', 0, '0', 1578340367, 0, '0'),
(21, 573, 0, 'Макрос: массовое изменение цен товаров', 'Инструменты администратора', '', '<b>Для чего модуль?</b><br><br>Если нужно изменить цену на определенное значение у группы товаров, то данный модуль Вам очень пригодится. Новая групповая операция позволяет:<br><br>- увеличить/уменьшить цену товара на число<br>- увеличить/уменьшить цену на процент<br>- сделать цену одинаковой для выбранных товаров<br><br>Модуль позволяет оперативно менять цены у группы товаров не заходя в каждый по отдельности максимально экономя время владельца сайта.<br><br><b>Если захочу обновить CMS?</b><br><br>Можете делать это совершенно спокойно - модуль обособлен и не влияет на обновления, как и обновления не влияют на него. <br><br><b>Если возникнут трудности или вопросы?</b><br><br>Пишите в личные сообщения или комментарии к модулю - постараемся оперативно помочь.<br><br>Макросы доступны начиная с версии DIAFAN.CMS  6.0.10.5', 'Установка<br><br>А) Автоматически в модуле Дополнения в административной части Вашего сайта<br><br>Б) Вручную:<br><br>1. Скачайте архив с модулем.<br>2. В разделе «Темы и дизайн» административной части DIAFAN.CMS выберите «Добавить вручную» и введите произвольное имя темы, например mytheme.<br>3. В пункте «Импорт темы» нажмите «Выбрать файл» и выберите архив с модулем.<br>4. Нажмите «Сохранить».', 'shop', 'macros/group/shop', 'http://addons.diafan.ru/modules/makros-massovoe-izmenenie-tsen-tovarov/', 'http://addons.diafan.ru/userfiles/files/mmedium/2891_massovoe-izmenenie-tsen-3.png.png', 'Андрей (kolia)', 'http://user.diafan.ru/user/kolia/', 551, 3, 2990, 150, '0', '0', 0, '0', 1580142499, 0, '0'),
(22, 570, 0, 'Макрос: групповая смена значений параметров/характеристик', 'Инструменты администратора', '', '<i></i><b>Для чего модуль?</b><br><br>Это групповая операция по смене характеристик товаров/объявлений/... - везде где есть какие-либо параметры появится новая групповая операция. Это очень удобно - теперь не нужно заходить в каждый, например товар, отдельно и править каждую характеристику вручную. Можно просто отфильтровать нужные элементы и с помощью нашего модуля сделать все в несколько кликов. Наличие базовой возможности выводить на странице списка нужное количество элементов еще больше все упрощает. Учитываются все возможные типы характеристик - текстовое поле, список, галка и т.д.<br><br><u>Пример 1</u><br><br><i>В магазине есть товары определенной категории имеющие определенный одинаковый вес. Вес указан характеристикой. В какой-то момент производитель товара меняет вес и уведомляет Вас об этом. Чтобы сменить вес у 100 товаров нужно будет зайти в каждый и сменить его вручную потратив огромное количество времени. С нашим дополнением все можно сделать за 1 минуту.</i><br><br><u>Пример 2</u><br><br><i>В магазине имеется товар, который был в двух цветовых вариантах. Появился третий вариант. Без нашего модуля - добавляем новый вариант в характеристику и заходим в каждый товар, чтобы связать новый цвет с товаром. В случае с дополнением - добавляем новый цвет в характеристику, отфильтровываем нужные товары и парой-тройкой кликов добавляем новый цвет всем товарам сразу.</i><br><br><b>Если захочу обновить CMS?</b><br><br>Можете делать это совершенно спокойно - модуль обособлен и не влияет на обновления, как и обновления не влияют на него. <br><br><b>Если возникнут трудности или вопросы?</b><br><br>Пишите в личные сообщения или комментарии к модулю - постараемся оперативно помочь.<br><br>Макросы доступны начиная с версии DIAFAN.CMS  6.0.10.5', '<p>Установка<br /><br />А) Автоматически в модуле Дополнения в административной части Вашего сайта<br /><br />Б) Вручную:<br /><br />1. Скачайте архив с модулем.<br />2. В разделе &laquo;Темы и дизайн&raquo; административной части DIAFAN.CMS выберите &laquo;Добавить вручную&raquo; и введите произвольное имя темы, например mytheme.<br />3. В пункте &laquo;Импорт темы&raquo; нажмите &laquo;Выбрать файл&raquo; и выберите архив с модулем.<br />4. Нажмите &laquo;Сохранить&raquo;.</p>', '', 'macros/group', 'http://addons.diafan.ru/modules/makros-gruppovaya-smena-znacheniy-parametrovkharak/', 'http://addons.diafan.ru/userfiles/files/mmedium/2882_massovoe-izmenenie-tsen.png.png', 'Андрей (kolia)', 'http://user.diafan.ru/user/kolia/', 550, 3, 2400, 0, '0', '0', 0, '0', 1583932656, 0, '0'),
(23, 572, 0, 'Макрос: массовая работа с любыми параметрами', 'Инструменты администратора', '', '<b>Для чего модуль?</b><br><br>Для всех модулей, в которых есть характеристики, появляется новая групповая операция по смене настроек этих характеристик. Для полного понимания взгляните на скриншоты.<br><br><b>Пример</b><br><br>Есть ряд параметров в магазине, которые до определнного момента не нужно было выводить в карточке товара или еще где-бы то ни было (в списке, в фильтре). Наступило время, когда характеристики заполнены и нужно их вывести. Допустим таких характеристик 20 штук. Для того, чтобы вывести каждую из них в нужном месте необходимо зайти в каждую отдельно и проставить нужные галки. Наш модуль позволяет избежать этой рутины и с помощью групповой операции и пары кликов проставить нужные галки прямо из списка неограниченному числу параметров. <br><br><b>Если захочу обновить CMS?</b><br><br>Можете делать это совершенно спокойно - модуль обособлен и не влияет на обновления, как и обновления не влияют на него. <br><br><b>Если возникнут трудности или вопросы?</b><br><br>Пишите в личные сообщения или комментарии к модулю - постараемся оперативно помочь.<br><br>Макросы доступны начиная с версии DIAFAN.CMS  6.0.10.5', 'Установка<br><br>А) Автоматически в модуле Дополнения в административной части Вашего сайта<br><br>Б) Вручную:<br><br>1. Скачайте архив с модулем.<br>2. В разделе «Темы и дизайн» административной части DIAFAN.CMS выберите «Добавить вручную» и введите произвольное имя темы, например mytheme.<br>3. В пункте «Импорт темы» нажмите «Выбрать файл» и выберите архив с модулем.<br>4. Нажмите «Сохранить».', '', 'macros/group', 'http://addons.diafan.ru/modules/makros-massovaya-rabota-s-lyubymi-parametrami/', 'http://addons.diafan.ru/userfiles/files/mmedium/2888_konstruktor-obratnoy-svyazi.png.png', 'Андрей (kolia)', 'http://user.diafan.ru/user/kolia/', 549, 0, 2990, 150, '0', '0', 0, '0', 1580142480, 0, '0');
INSERT INTO `diafan_addons` (`id`, `addon_id`, `custom_id`, `name`, `cat_name`, `anons`, `text`, `install`, `file_rewrite`, `tag`, `link`, `image`, `author`, `author_link`, `sort`, `downloaded`, `price`, `price_month`, `available_subscription`, `buy`, `subscription`, `auto_subscription`, `timeedit`, `custom_timeedit`, `import_update`) VALUES
(24, 571, 0, 'Макрос: групповая перегенерация ссылок (ЧПУ)', 'Инструменты администратора', '', '<b>Для чего модуль?</b><br><br>Нужно заново сгенерировать ссылки у группы товаров, статей, новостей, объявлений и т.д.? Вам подойдет наш модуль. Дополнительная групповая операция дополнит все модули в рамках системы управления, где есть списки и их элементы имеют ссылки. Просто выберите нужные элементы из списка и с помощью модуля в два клика сгенерируйте ссылки заново. Очень просто и удобно. Не нужно заходить в каждый товар/новость/статью/... и переписывать ссылку вручную. <br>С помощью дополнительной галки Вы можете сделать 301-редирект со старых ссылок на новые, перегинерированные.<br><br><b>Когда может пригодиться?</b><br><br>Например, когда сменилась одна из страниц в ссылке. Каталог был \"shop\", стал \"catalog\". Чтобы сменить во всех товарах ссылку \"shop/tovar\" на \"catalog/tovar\" - нужно зайти в каждый отдельно и переписать руками потратив день, два.... Или использовать модуль и сделать все за пару минут.<br><br><b>Если захочу обновить CMS?</b><br><br>Можете делать это совершенно спокойно - модуль обособлен и не влияет на обновления, как и обновления не влияют на него. <br><br><b>Если возникнут трудности или вопросы?</b><br><br>Пишите в личные сообщения или комментарии к модулю - постараемся оперативно помочь.<br><br>Макросы доступны начиная с версии DIAFAN.CMS  6.0.10.5', 'Установка<br><br>А) Автоматически в модуле Дополнения в административной части Вашего сайта<br><br>Б) Вручную:<br><br>1. Скачайте архив с модулем.<br>2. В разделе «Темы и дизайн» административной части DIAFAN.CMS выберите «Добавить вручную» и введите произвольное имя темы, например mytheme.<br>3. В пункте «Импорт темы» нажмите «Выбрать файл» и выберите архив с модулем.<br>4. Нажмите «Сохранить».', '', 'macros/group', 'http://addons.diafan.ru/modules/makros-gruppovaya-peregeneratsiya-ssylok-chpu/', 'http://addons.diafan.ru/userfiles/files/mmedium/2887_http.png.png', 'Андрей (kolia)', 'http://user.diafan.ru/user/kolia/', 548, 4, 1490, 0, '0', '0', 0, '0', 1580142455, 0, '0'),
(25, 569, 0, 'Макрос: массовая смена шаблона', 'Инструменты администратора', '', '<b>Для чего модуль?</b><br><br>Нужно сменить старый шаблон папки themes на новый. Для это придется заходить в каждую страницу/товар/... и делать это вручную. Дополнения позволяет избежать этой рутины с помощью новой групповой операции. Просто выберете в списке нужные элементы и не заходя в каждый в пару кликов смените им шаблон. <br><br><b>Если захочу обновить CMS?</b><br><br>Можете делать это совершенно спокойно - модуль обособлен и не влияет на обновления, как и обновления не влияют на него. <br><br><b>Если возникнут трудности или вопросы?</b><br><br>Пишите в личные сообщения или комментарии к модулю - постараемся оперативно помочь.<br><br>Макросы доступны начиная с версии DIAFAN.CMS  6.0.10.5', 'Установка<br><br>А) Автоматически в модуле Дополнения в административной части Вашего сайта<br><br>Б) Вручную:<br><br>1. Скачайте архив с модулем.<br>2. В разделе «Темы и дизайн» административной части DIAFAN.CMS выберите «Добавить вручную» и введите произвольное имя темы, например mytheme.<br>3. В пункте «Импорт темы» нажмите «Выбрать файл» и выберите архив с модулем.<br>4. Нажмите «Сохранить».', '', 'macros/group', 'http://addons.diafan.ru/modules/makros-massovaya-smena-shablona/', 'http://addons.diafan.ru/userfiles/files/mmedium/2880_massovoe-izmenenie-tsen-2.png.png', 'Андрей (kolia)', 'http://user.diafan.ru/user/kolia/', 546, 13, 300, 0, '0', '0', 0, '0', 1580142445, 0, '0'),
(26, 568, 0, 'Макрос: массовое изменение бренда', 'Инструменты администратора', '', '<b>Для чего модуль?</b><br><br>Если нужно сменить бренд (в рамках системы управления \"Производитель\") сразу у нескольких товаров - Вам подойдет наше дополнение. Оно позволяет не заходя в конкретный товар, а прямо из списка, сменить бренд у выбранных товаров. Т.е. это дополнительная групповая операция в каталоге. <br><br><b>Если захочу обновить CMS?</b><br><br>Можете делать это совершенно спокойно - модуль обособлен и не влияет на обновления, как и обновления не влияют на него. <br><br><b>Если возникнут трудности или вопросы?</b><br><br>Пишите в личные сообщения или комментарии к модулю - постараемся оперативно помочь.<br><br>Макросы доступны начиная с версии DIAFAN.CMS  6.0.10.5', 'Установка<br><br>А) Автоматически в модуле Дополнения в административной части Вашего сайта<br><br>Б) Вручную:<br><br>1. Скачайте архив с модулем.<br>2. В разделе «Темы и дизайн» административной части DIAFAN.CMS выберите «Добавить вручную» и введите произвольное имя темы, например mytheme.<br>3. В пункте «Импорт темы» нажмите «Выбрать файл» и выберите архив с модулем.<br>4. Нажмите «Сохранить».', 'shop', 'macros/group/shop', 'http://addons.diafan.ru/modules/makros-massovoe-izmenenie-brenda/', 'http://addons.diafan.ru/userfiles/files/mmedium/2878_massovoe-izmenenie-tsen-1.png.png', 'Андрей (kolia)', 'http://user.diafan.ru/user/kolia/', 545, 1, 390, 0, '0', '0', 0, '0', 1580142439, 0, '0'),
(27, 577, 0, 'Макрос: групповая смена сопутствующих услуг товаров', 'Инструменты администратора', '', 'После установки модуля на странице списка товаров появится дополнительная групповая операция \"Сопутствующие услуги\". Макрос позволяет менять набор дополнительных услуг не заходя в каждый товаров по отдельности значительно экономя время администратора сайта.<br><br><b>Если захочу обновить CMS?</b><br><br>Можете делать это совершенно спокойно - модуль обособлен и не влияет на обновления, как и обновления не влияют на него.<br><br><b>Если возникнут трудности или вопросы?</b><br><br>Пишите в личные сообщения или комментарии к модулю - постараемся оперативно помочь.<br><br>Макросы доступны начиная с версии DIAFAN.CMS  6.0.10.5', 'Установка<br><br>А) Автоматически в модуле Дополнения в административной части Вашего сайта<br><br>Б) Вручную:<br><br>1. Скачайте архив с модулем.<br>2. В разделе «Темы и дизайн» административной части DIAFAN.CMS выберите «Добавить вручную» и введите произвольное имя темы, например mytheme.<br>3. В пункте «Импорт темы» нажмите «Выбрать файл» и выберите архив с модулем.<br>4. Нажмите «Сохранить».', '', 'macros/group/shop', 'http://addons.diafan.ru/modules/makros-gruppovaya-smena-soputstvuyuschikh-uslug-to/', 'http://addons.diafan.ru/userfiles/files/mmedium/2922_massovoe-soputstvuyuschikh-uslug.png.png', 'Андрей (kolia)', 'http://user.diafan.ru/user/kolia/', 544, 0, 1990, 0, '0', '0', 0, '0', 1580142429, 0, '0'),
(28, 555, 0, 'Точки самовывоза на карте', 'Доставка', '', '<p>Встречайте новый модуль &laquo;Точки самовывоза на карте&raquo; v1.0<br /><br />Модуль позволит вам задать сколько угодно точек самовывоза товара и указать их координаты на карте. Для каждой точки возможно указать свою стоимость самовывоза.<br />Ключевые особенности модуля:</p>\r\n<ul>\r\n<li>неограниченное кол-во точек самовывоза на карте</li>\r\n<li>интеграция с Яндекс-картами</li>\r\n<li>индивидуальная цена для каждой точки самовывоза</li>\r\n<li>удобный административный интерфейс</li>\r\n<li>будущие обновления</li>\r\n</ul>\r\n<p>Да, кстати. Данный модуль мы разработали вместе с Diafan. <br />Следите за обновлениями и хороших вам продаж!</p>', '<p>Модуль устанавливается по стандартной схеме через \"темы и дизайн\" -> \"добавить вручную\"<br />Далее нужно добавить новый способ доставки через \"Интернет-магазин\" -> \"справочники\" -> \"способы доставки\"</p>', 'delivery', 'delivery', 'http://addons.diafan.ru/modules/moduli-dostavki/tochki-samovyvoza-na-karte/', 'http://addons.diafan.ru/userfiles/files/mmedium/2767_1.png.png', 'Андрей (R4W)', 'http://user.diafan.ru/user/R4W/', 539, 0, 4000, 200, '0', '0', 0, '0', 1576964526, 0, '0'),
(29, 578, 0, 'Переписка пользователей для админа', 'Пользователи', '', '<p>Модуль позволяет в удобном виде посмотреть переписку пользователей в личных сообщениях. По умолчанию в системе управления такой возможности нет - диалоги пользователей не модерируются и не администрируются. Дополнение позволяет это сделать.<br /><br />Видя диалоги посетителей между собой можно узнать, как они реагируют на нововведения на сайте, устраивает ли их текущий функционал, все ли работает как Вы задумали и т.д. Особенно актуален модуль для сайтов, где ведется какая-либо торговля или обмен непосредственно между посетителями. <br /><br /><b>Если захочу обновить CMS?</b><br /><br />Можете делать это совершенно спокойно - модуль обособлен и не влияет на обновления, как и обновления не влияют на него.<br /><br /><b>Если возникнут трудности или вопросы?</b><br /><br />Пишите в личные сообщения или комментарии к модулю - постараемся оперативно помочь.</p>', '<p>Установка</p>\r\n<p>А) Автоматически в модуле Дополнения в административной части Вашего сайта</p>\r\n<p>Б) Вручную:</p>\r\n<p>1. Скачайте архив с модулем.<br />2. В разделе &laquo;Темы и дизайн&raquo; административной части DIAFAN.CMS выберите &laquo;Добавить вручную&raquo; и введите произвольное имя темы, например gamecoupon.<br />3. В пункте &laquo;Импорт темы&raquo; нажмите &laquo;Выбрать файл&raquo; и выберите архив с модулем.<br />4. Нажмите &laquo;Сохранить&raquo;.<br />5. В разделе &laquo;Настройки&raquo; зайдите в подраздел &laquo;Модули и БД&raquo;, установите галочку &laquo;Сообщения пользователей&raquo; и нажмите &laquo;Установить&raquo;.</p>', '', '', 'http://addons.diafan.ru/modules/perepiska-polzovateley-dlya-admina/', 'http://addons.diafan.ru/userfiles/files/mmedium/2924_correspondence.png.png', 'Андрей (kolia)', 'http://user.diafan.ru/user/kolia/', 521, 0, 4490, 225, '0', '0', 0, '0', 1576787237, 0, '0'),
(30, 491, 0, 'Онлайн-касса CloudKassir', 'Платежи', '', '<p>Модуль позволяет интегрировать онлайн-кассу CloudKassir в интернет-магазин на платформе DIAFAN.CMS. <br /> <br /><b>Возможности: </b> <br />&bull; Поддержка онлайн-касс (ФЗ-54); <br />&bull; Автоматическая отправка чеков прихода по email и SMS; <br />&bull; Отправка чеков возврата по email и SMS.</p>\r\n<p>Реализован в виде бэкенда к модулю &laquo;Онлайн касса&raquo;.</p>', '<p><b>Установка модуля</b></p>\r\n<p>1. В настройках модуля&nbsp; &laquo;Онлайн касса&raquo; (Оплата &mdash; Онлайн касса &mdash;&nbsp;Настройки модуля) в списке&nbsp;&laquo;Тип&raquo; выберите &laquo;Добавить тип&raquo;.</p>\r\n<p>2. В открывшемся списке дополнений выберите&nbsp;&laquo;Онлайн-касса CloudKassir&raquo; &mdash;&nbsp;&laquo;Установить&raquo;.</p>\r\n<p>3. Теперь в настройках модуля&nbsp;&laquo;Онлайн касса&raquo; будет доступен тип&nbsp;&laquo;CloudKassir&raquo;.</p>\r\n<p><br /><b>Настройка модуля</b>&nbsp;</p>\r\n<p>В настройках модуля&nbsp;&laquo;Онлайн касса&raquo; выберите&nbsp;&laquo;Тип&raquo; &mdash;&nbsp;&laquo;CloudKassir&raquo;. Теперь будут доступны следующие настройки:<br /><br /></p>\r\n<ul>\r\n<li>Идентификатор сайта &mdash; Public id сайта из личного кабинета CloudPayments</li>\r\n<li>Секретный ключ &mdash; API Secret из личного кабинета CloudPayments</li>\r\n<li>ИНН &mdash; ИНН организации, на которую зарегистрирована онлайн-касса</li>\r\n<li>Ставка НДС &mdash; Указание ставки НДС. Все возможные значения указаны в документации&nbsp;<a href=\"https://cloudpayments.ru/Docs/Kassa#data-format\" target=\"_blank\">https://cloudpayments.ru/Docs/Kassa#data-format</a></li>\r\n<li>Ставка НДС для доставки &mdash; Указание отдельной ставки НДС для доставки. Если доставка платная, то она в чеке оформляется отдельной строкой со своей ставкой НДС. Значения аналогично ставке НДС для товаров.</li>\r\n<li>Система налогообложения &mdash; Тип системы налогообложения. Возможные значения перечислены в документации CloudPayments&nbsp;<a href=\"https://cloudpayments.ru/Docs/Directory#taxation-system\" target=\"_blank\">https://cloudpayments.ru/Docs/Directory#taxation-system</a></li>\r\n</ul>', 'payment', 'cashregister', 'http://addons.diafan.ru/modules/onlayn-kassa-cloudkassir/', 'http://addons.diafan.ru/userfiles/files/mmedium/2710_cloud-kassir-512x512.png.png', 'CloudPayments Support (support-cp)', 'http://user.diafan.ru/user/support-cp/', 502, 53, 0, 0, '0', '0', 0, '0', 1578340373, 0, '0'),
(31, 143, 0, 'Платежный модуль IntellectMoney', 'Платежи', '<p>Платежный модуль IntellectMoney для приема онлайн платежей на сайте.</p>', '<p>IntellectMoney &mdash; это универсальное решение по приему платежей в интернете. Мы работаем на рынке онлайн-платежей более 5 лет. За это время нас выбрали более 6 000 компаний и 17 кредитных организаций. Среди них как российские, так и иностранные компании. <br /> <br /> Процессинговый центр IntellectMoney каждый квартал подтверждает соответствие сертификации PCI DSS. <br /> <br /> Мы предлагаем более 30 способов оплаты: <br /> &mdash; банковскими картами Visa, Mastercard, Maestro; <br /> &mdash; электронные кошельки Qiwi; <br /> &mdash; электронные валюты Яндекс.Деньги, WebMoney, Деньги@Mail.RU; <br /> &mdash; с баланса мобильного телефона; <br /> &mdash; через терминалы оплаты; <br /> &mdash; салоны сотовой связи; <br /> &mdash; банковский платеж; <br /> &mdash; через банкоматы; <br /> &mdash; почта России; <br /> &mdash; онлайн кредитование. <br /> <br /> Техническое взаимодействие с банками-экваерами построено так, что система выбирает лучший банк-экваер на момент проведения платежа. <br /> <br /> В личном кабинете менеджеры наших поставщиков могут: <br /> &mdash; получить закрывающие документы; <br /> &mdash; заказать акт-сверки за любой период; <br /> &mdash; настроить автоматический вывод денежных средств на расчетный счет организации; <br /> &mdash; автоматизировать процесс возвратов (без штрафов для магазина и плательщика); <br /> &mdash; вручную выставлять счета для клиентов; <br /> &mdash; самостоятельно создавать новые интернет-магазины без помощи менеджеров IntellectMoney. <br /> <br /> Для получения более подробной информации, обращайтесь: <br /> тел. +7 495 649 86 81 доб. 1199 <br /> e-mail: info@intellectmoney.ru</p>\r\n<p></p>\r\n<p>Дополнение устанавливается из панели управления DIAFAN.CMS 6.0.6.11+ на Вашем сайте либо импортируется вручную в разделе \"Темы и дизайн\".</p>', '<p>Процесс настройки в&nbsp;личном кабинете ИнтеллектМани<br /> 1. В&nbsp;личном кабинете в&nbsp;разделе &laquo;магазины&raquo; нажмите &laquo;Добавть магазин&raquo; ИЛИ &laquo;Настройки&raquo; напротив уже существующего магазина<br /> 2. На&nbsp;вкладке &laquo;Прием платеже&raquo;:<br /> а. Протокол&nbsp;&mdash; выбарть IntellectMoney<br /> b. CMS&nbsp;&mdash; выбрать Diafan.CMS<br /> c. Версия CMS&nbsp;&mdash; указать 5.4<br /> d. Back URL&nbsp;&mdash; оставить пустым<br /> e. Secret Key&nbsp;&mdash; придумайте и&nbsp;укажите секретное слово.<br /> f. Result URL&nbsp;&mdash; укажите http://<адрес>/payment/get/intellectmoney/result/<br /> <br /> Процесс настройки в&nbsp;админ. панели интернет-магазина:<br /> 1. В&nbsp;админ. панели перейти в&nbsp;раздел &laquo;Оплата&raquo; нажать кнопку &laquo;Добавить&raquo;<br /> Настройка:<br /> 2. Платежная система&nbsp;&mdash; выбираете IntellectMoney.<br /> 3. Номер магазина в&nbsp;системе IntellectMoney&nbsp;&mdash; укажите номер магазина из&nbsp;личного кабинета ИнтеллектМани<br /> 4. Секретный ключ в&nbsp;системе IntellectMoney&nbsp;&mdash; укажите секретный ключ, который указывали в&nbsp;личном кабинете ИнтеллектМани<br /> 5. Тестовый режим&nbsp;&mdash; используется для выставления тестовый счетов во&nbsp;время тестирования<br /> 6. Режим холдироваиня&nbsp;&mdash; если вы&nbsp;хотите использовать режим холдирования, то&nbsp;поставьте галочку<br /> 7. Дней в&nbsp;холде&nbsp;&mdash; при выбранном режиме холдирования необходимо указать сколько дней денежные средства будут захолдированы<br /> 8. Доступные способы оплаты&nbsp;&mdash; какие способы оплаты хотите использовать (список можно посмотерть https://docs.google.com/document/d/1VHIkEyNgdeyqmrcVuGx0Lv8xrZp2XJZ9nYNUHDYvw0k/edit)<!--адрес--></p>', 'payment', 'payment', 'http://addons.diafan.ru/modules/platezhnye-moduli/platezhnyy-modul-intellectmoney/', 'http://addons.diafan.ru/userfiles/files/mmedium/631_intellectmoney_logo_117x75.png.png', 'Сергей (PSIntellect)', 'http://user.diafan.ru/user/PSIntellect/', 483, 85, 0, 0, '0', '0', 0, '0', 1578340391, 0, '0'),
(32, 349, 0, 'Интеграция с Dashamail.ru', 'Оповещения, уведомления, рассылки, связь', '<p>Модуль позволяет автоматически добавлять, импортировать e-mail клиентов, которые хотят подписаться на рассылки сайта, в адресную базу DashaMail.ru.</p>', '<p>Если ваш сайт работает под управлением CMS-системы Diafan, то начать работу с ДашаМейл очень просто. Достаточно скачать и установить модуль, который позволит вам добавить форму подписки Даши на ваш сайт. <br /> <br />После ее установки и настройки все ваши клиенты, которые хотят подписаться на ваши рассылки, будут автоматически попадать в выбранную вами адресную базу на DashaMail. Также, вы можете настроить переадресацию на произвольную страницу сразу после подписки. Кроме того, модуль позволяет за 2 клика импортировать зарегистрированных пользователей сайта в адресную базу на Dashamail.</p>\r\n<p></p>\r\n<p>Дополнение устанавливается из панели управления DIAFAN.CMS 6.0.6.11+ на Вашем сайте либо импортируется вручную в разделе \"Темы и дизайн\".</p>', '<p>1) Распаковать архив в корень сайта. <br />2) В админке сайта в разделе \"модули и БД\" выбрать пункт \"Интеграция с Dashamail\" и нажать \"установить\". <br />3) Перейти в раздел настроек модуля.</p>', 'dashamail', '', 'http://addons.diafan.ru/modules/integratsiya-s-dashamailru/', 'http://addons.diafan.ru/userfiles/files/mmedium/2013_integratsiya-s-dashamailru.jpg', 'Юрий (yual)', 'http://user.diafan.ru/user/yual/', 433, 25, 0, 0, '0', '0', 0, '0', 1571227929, 0, '0'),
(33, 344, 0, 'TargetSMS.ru: SMS-рассылки и уведомления', 'Оповещения, уведомления, рассылки, связь', '<p>Отправляйте SMS-сообщения с помощью оператора&nbsp;<a href=\"https://targetsms.ru/\">targetSMS</a>.</p>', '<p>Отправляйте SMS-сообщения с помощью оператора TargetSMS.ru.<br /><br />Данное дополнение реализовано как бэкенд модуля &laquo;Уведомления&raquo;, через который отправляются любые SMS-сообщения на сайте: уведомления администратора о поступлении заказа, сообщений в модуле &laquo;Обратная связь&raquo;, комментариев, вопросов и ответов, SMS-рассылка.<br /><br /><b>Функционал</b></p>\r\n<ul>\r\n<li>Регистрация Вашего имени отправителя бесплатно.</li>\r\n<li>Возможность отправки СМС-уведомлений администратора интернет-магазина о поступлении новых заказов.</li>\r\n<li>Отправка СМС из модулей &laquo;Обратная связь&raquo;, &laquo;Оформление заказа&raquo;, &laquo;Комментарии&raquo;, &laquo;Вопрос-Ответ&raquo;, &laquo;Рассылки&raquo; (Подключать SMS-уведомления нужно в настройках соответствующего модуля).</li>\r\n</ul>\r\n<p>Бэкенды SMS-операторов поддерживаются в DIAFAN.CMS 6.0.9.10+.</p>', '<p><strong>Установка дополнения</strong></p>\r\n<ul>\r\n<li>Пройдите&nbsp;регистрацию&nbsp;в нашем сервисе SMS-рассылок. После регистрации Вы получите логин, пароль, тестовое имя отправителя и тестовый баланс для проверки работы сервиса SMS-рассылок</li>\r\n<li>Установите наше дополнение &laquo;TargetSMS.ru: SMS-рассылки и уведомления&raquo; одним из описанных ниже способов.</li>\r\n</ul>\r\n<p><strong>Способ 1. Установка дополнения из админитстративной панели сайта на DIAFAN.CMS</strong></p>\r\n<ul>\r\n<li>Зайдите в административную панель вашего сайта, работающего на платформе DIAFAN.CMS.</li>\r\n<li>Зайдите в пункт меню &laquo;Дополнения для CMS&raquo;.</li>\r\n<li>Найдите в каталоге наше приложение и нажмите &laquo;Установить&raquo;.</li>\r\n</ul>\r\n<p><strong>Способ 2. Установка дополнения вручную</strong></p>\r\n<ul>\r\n<li>Зайдите&nbsp;на страницу нашего дополнения на сайте addons.diafan.ru&nbsp;и нажмите на кнопку &laquo;Скачать&raquo;.</li>\r\n<li>Далее необходимо вручную создать тему и загрузить в неё архив с дополнением (раздел меню &laquo;Темы и дизайн&raquo; > &laquo;Добавить вручную&raquo;) либо загрузить скаченный архив в уже установленную тему. Можно также файлы скаченного архива вручную (аккуратно) перенести в файловую систему вашего интернет-магазина в соответствующие места.</li>\r\n</ul>\r\n<p><strong>Активация дополнения</strong></p>\r\n<ul>\r\n<li>Зайдите в пункт меню &laquo;Уведомления&raquo; &ndash; &laquo;Настройки SMS&raquo;.</li>\r\n<li>Во вкладке &laquo;SMS&raquo; отметьте &laquo;Подключить SMS-уведомления&raquo;, выберите &laquo;Поставщик услуг: targetsms&raquo; и заполните форму, указав полученные при регистрации в нашем сервисе логин, пароль и согласованное или тестовое имя отправителя (Внимание: не указывайте произвольные/не согласованные с нами имена отправителей - сервис работает только с заранее прописанными на нашей стороне/согласованными именами отправителей). Нажмите кнопку &laquo;Сохранить&raquo;.</li>\r\n</ul>\r\n<p>Подробная инструкция по работе дополнения &laquo;TargetSMS.ru: SMS-рассылки и уведомления&raquo; находится тут:&nbsp;<a href=\"https://targetsms.ru/otpravka-sms-iz-diafan-cms\">https://targetsms.ru/otpravka-sms-iz-diafan-cms</a></p>', 'postman/config', 'postman/sms', 'http://addons.diafan.ru/modules/integratsiya-s-targetsmsru/', 'http://addons.diafan.ru/userfiles/files/mmedium/2014_integratsiya-s-targetsmsru.jpg', 'Максим (targetsms)', 'http://user.diafan.ru/user/targetsms/', 430, 27, 0, 0, '0', '0', 0, '0', 1573286005, 0, '0'),
(34, 345, 0, 'Автоматическая SEO генерация текстов, заголовков и мэтатэгов', 'SEO', '', '<p><b>Для чего предназначен?</b><br /><br />С помощью дополнения можно автоматически формировать описание товаров, метатэги элементов (title, description, keywords), а также заголовок h1.<br />Модуль расширяет набор переменных в шаблонах метатэгов для модуля \"Каталог\", а также выносит все шаблоны мэтатэгов на отдельную страницу для более удобного их администрирования и редактирования. <br /><br /><b>Пример</b><br />На сайт загружено 100 товаров. Для успешного SEO продвижения рекомендуется каждому из них задать уникальное описание, метатэги, заголовки h1. Система управления позволяет все сделать в ручном режиме. Время, которое потребуется на формирование уникальности исчисляется часами или днями. Дополнение позволяет сформировать, с помощью описанных ниже переменных, уникальные данные за считанные минуты. С администратора сайта снимается огромное количество рутинной и ручной работы.<br /><br /><b>Список возможных переменных </b><br /><br /><b>Переменные для всех модулей:</b> <br />Категория: %name - название; %parent - родитель; %page - номер страницы (только для мэтатэгов) <br />Элемент: %name - название; %category - категория; %parent_category - родительская категория <br /> <br /><b>Дополнительные переменные для модуля \"Каталог\":</b> <br />Категория: %minprice - минимальная цена товара в категории; %maxprice - максимальная цена товара в категории <br />Элемент: %minprice - минимальная цена; %maxprice - максимальная цена; %article - артикул; %id - id товара; %start_category - родительская категория 1 уровня; %param[номер характеристики] - текущее значение характеристики; %brand - значение производителя, %p_all[номер характеристики] - выведет все значения характеристики с типом \"выпадающий список\" или \"список с выбором нескольких значений\", привязанные к товару<br /><br />По всем вопросам обращайтесь в личные сообщения или комментарии.<br /><br />Модуль работает обособленно - это значит Вы можете спокойно обновлять систему управления.</p>', '<p>1. Скачайте архив с модулем. <br />2. В разделе &laquo;Темы и дизайн&raquo; административной части DIAFAN.CMS открыть на редактирование нужную тему <br />3. В пункте &laquo;Импорт темы&raquo;, нажать &laquo;Выбрать файл&raquo; и выбираем архив с модулем <br />4. На странице редактирования темы нажать сохранить. <br />5. В разделе &laquo;Модули и БД&raquo; установите галочку &laquo;Метатэги&raquo; и нажмите &laquo;Установить&raquo;.</p>', 'metatags', '', 'http://addons.diafan.ru/modules/rasshirennye-shablony-metategov-i-h1/', 'http://addons.diafan.ru/userfiles/files/mmedium/2921_SEOgeneration.png.png', 'Андрей (kolia)', 'http://user.diafan.ru/user/kolia/', 429, 11, 2990, 150, '0', '0', 0, '0', 1577095300, 0, '0'),
(35, 328, 0, 'Интеграция с SMS.RU', 'Оповещения, уведомления, рассылки, связь', '<p>Отправляйте SMS-сообщения с помощью оператора <a href=\"http://sms.ru/\">SMS.RU</a>.</p>', '<p>Отправляйте SMS-сообщения с помощью оператора&nbsp;<a href=\"http://sms.ru/\">SMS.RU</a>.</p>\r\n<p>Дополнение реализовано как бэкенд модуля &laquo;Уведомления&raquo;, через который отправляются любые SMS-сообщения на сайте: уведомления администратора о поступлении заказа, сообщений в модуле &laquo;Обратная связь&raquo;, комментариев, вопросов и ответов, SMS-рассылка.</p>\r\n<p>Бэкенды SMS-операторов поддерживаются в DIAFAN.CMS 6.0.9.10+.</p>', '<p>Для установки дополнения:<br />1. Зарегистрируйтесь на сайте <a href=\"https://sms.ru/?panel=register\">SMS.RU</a>.<br />2. В административной панели сайта пройдите в меню &laquo;Дополнения для CMS&raquo;.<br />3. Найдите дополнение &laquo;Интеграция с SMS.RU&raquo; (можно отфильтровать по названию).<br />4. Нажмите &laquo;Установить&raquo;.<br />5. Пройдите в настройки модуля &laquo;Уведомления&raquo;.<br />6. Во вкладке &laquo;SMS&raquo; отметьте &laquo;Подключить SMS-уведомления&raquo; и выберите &laquo;Поставщик услуг: sms.ru&raquo;.<br />7. Заполните поля api_id и имя отправителя.</p>', 'postman/config', 'postman/sms', 'http://addons.diafan.ru/modules/integratsiya-s-smsru/', 'http://addons.diafan.ru/userfiles/files/mmedium/1588_logo-big1.png.png', 'Николай (VampiRUS)', 'http://user.diafan.ru/user/VampiRUS/', 413, 48, 0, 0, '0', '0', 0, '0', 1573286021, 0, '0'),
(36, 30, 0, 'Платежный модуль PayPal', 'Платежи', '<p>Платежный модуль PayPal для приема онлайн платежей на сайте.</p>', '<p>Платежный модуль PayPal для приема онлайн платежей на сайте.</p>\r\n<p></p>\r\n<p>Дополнение устанавливается из панели управления DIAFAN.CMS 6.0.6.11+ на Вашем сайте либо импортируется вручную в разделе \"Темы и дизайн\".</p>', '<p>После установки дополнения зарегистрируйте аккаунт на&nbsp;сайте <a target=\"_blank\" href=\"https://www.paypal.com/\">https://www.paypal.com/</a>, создайте новый способ оплаты в&nbsp;интерфейсе &laquo;Оплаты&raquo;. В&nbsp;качестве платежной системы выберите из&nbsp;списка PayPal. Заполните поле &laquo;E-mail в&nbsp;аккаунте PayPal&raquo;.</p>\r\n<p>Для тестирования рекомендуется отметить опцию &laquo;Тестовый режим&raquo;. При этом деньги списываться не&nbsp;будут. Но&nbsp;для тестов нужно регистировать аккаунты на&nbsp;сайте <a href=\"https://sandbox.paypal.com/\">https://sandbox.paypal.com/</a></p>', 'payment', 'payment', 'http://addons.diafan.ru/modules/modules-and-services/paypal/', 'http://addons.diafan.ru/userfiles/files/mmedium/220_platezhnyy-modul-paypal.jpg', 'Diafan', 'https://www.diafan.ru/', 409, 200, 0, 0, '0', '0', 0, '0', 1578340397, 0, '0'),
(37, 53, 0, 'Платежный модуль Chronopay', 'Платежи', '<p>Платежный модуль Chronopay для приема онлайн платежей на сайте.</p>', '<p>Платежный модуль ChronoPay для версий 5.4-6.0.&nbsp;</p>\r\n<p>Требуется регистрация и подключение к системе ChoronoPay, т.к. для работы модуля обязателен sign магазина</p>\r\n<p></p>\r\n<p>Дополнение устанавливается из панели управления DIAFAN.CMS 6.0.6.11+ на Вашем сайте либо импортируется вручную в разделе \"Темы и дизайн\".</p>', '<p>После установки дополнения создайте платежный метод, указав ChronoPay и настройте его.</p>\r\n<p>Дополнительные настройки:</p>\r\n<ul>\r\n<li>SharedSec</li>\r\n<li>Product_ID</li>\r\n</ul>\r\n<p>Параметры настройки ChronoPay:</p>\r\n<p>SuccessURL: <em>http://site.ru/payment/get/chronopay/success/</em></p>\r\n<p>FailURL: <em>http://site.ru/payment/get/chronopay/fail/</em></p>', 'payment', 'payment', 'http://addons.diafan.ru/modules/platezhnyy-modul-chronopay/', 'http://addons.diafan.ru/userfiles/files/mmedium/215_platezhnyy-modul-chronopay.jpg', 'Diafan', 'https://www.diafan.ru/', 376, 37, 0, 0, '0', '0', 0, '0', 1578340403, 0, '0'),
(38, 52, 0, 'Платежный модуль LiqPay', 'Платежи', '<p>Платежный модуль LiqPay для приема онлайн платежей на сайте.</p>', '<p>Платежный модуль LiqPay для приема онлайн платежей на сайте.</p>\r\n<p></p>\r\n<p>Дополнение устанавливается из панели управления DIAFAN.CMS 6.0.6.11+ на Вашем сайте либо импортируется вручную в разделе \"Темы и дизайн\".</p>', '<p>После установки дополнения создайте платежный метод, указав Liqpay и настройте его.</p>\r\n<p>Дополнительные настройки:</p>\r\n<ul>\r\n<li>merchant_id &ndash; id мерчанта, выдается системой</li>\r\n<li>signature &ndash; сигнатур, выдается системой</li>\r\n<li>Метод оплаты &ndash; с карты <em>card</em>, с телефона <em>liqpay</em>, наличными <em>delayed</em></li>\r\n<li>Валюта &ndash; RUR и т.д.</li>\r\n<li>Телефон &ndash; телефон, на который приходит SMS при попытке оплатить товар картой</li>\r\n</ul>\r\n<p>Параметры настройки Liqpay:</p>\r\n<p>ResultURL: <em>http://site.ru/payment/get/liqpay/</em></p>', 'payment', 'payment', 'http://addons.diafan.ru/modules/platezhnyy-modul-liqpay/', 'http://addons.diafan.ru/userfiles/files/mmedium/216_platezhnyy-modul-liqpay.jpg', 'Diafan', 'https://www.diafan.ru/', 375, 64, 0, 0, '0', '0', 0, '0', 1578340434, 0, '0'),
(39, 324, 0, 'Платежный модуль Mandarinpay', 'Платежи', '<p>Платежный модуль Mandarinpay для приема онлайн платежей на сайте.</p>', '<p>MandarinPay <br /> <br />Разработчик: MandarinBank <br />Сайт: www.mandarinpay.com <br />Почта: support@mandarinbank.com <br />Телефон: +7 (495) 374-81-89 <br /> <br />Платежная система <br /> <br />MandarinPay &ndash; универсальная платежная платформа для онлайн-бизнеса. С ее помощью вы получите возможность не только принимать оплату от пользователей по всему миру с помощью банковских карт, но и осуществлять моментальные выплаты на карты и электронные кошельки своих клиентов и партнеров.&nbsp; <br /> <br />БЫСТРО <br />подключение приема платежей по банковским картам от 1 часа, дополнительного сервиса массовых выплат - от 1 недели. <br /> <br />УДОБНО <br />интеграция в рамках единого договора, минимум документов, возможность работать без интеграции через ручное выставление счетов, техподдержка в режиме онлайн 7 дней в неделю. <br /> <br />ТЕХНОЛОГИЧНО <br />оплата без переадресации (widget, frame), привязка банковских карт, автосписание и подписки, кастомизация платежной страницы, аналитика в личном кабинете. <br /> <br />ВЫГОДНО <br />Привлекательные тарифы на премиальный сервис. Бесплатная интеграция. Без скрытых комиссий. Уникальная партнерская программа. <br /> <br />Для маркетплейсов и финансовых компаний MandarinPay предлагает специальные решения по комплексному сопровождению платежной инфраструктуры.</p>\r\n<p></p>\r\n<p>Дополнение устанавливается из панели управления DIAFAN.CMS 6.0.6.11+ на Вашем сайте либо импортируется вручную в разделе \"Темы и дизайн\".</p>', '<p>После установки дополнения создайте в административной панели вашего сайта новый способ оплаты и внесите туда настройки (Система управления > Оплата > +Добавить). <br /> <br />Название - Мандарин <br /> <br />Платежная система - Mandarin <br /> <br />ID мерчанта - число, полученное при регистрации магазина в Mandarin <br /> <br />Secret мерчанта - строка, полученная при регистрации магазина в Mandarin <br /> <br />Описание - текст, который будет видно под названием системы оплаты во время выбора способа оплаты. Его можно согласовать с представителями Mandarin. <br /> <br />Параметры для платёжной системы: <br /> <br />CallbackUrl - %domain%/payment/get/mandarin <br />ReturnUrl - Произвольный (любая созданная страница с текстом \"Ваш заказ оплачен, мы с вами свяжемся!\") <br /> <br />Статус заказа при успешной оплате меняется на \"В обработке\".</p>', 'payment', 'payment', 'http://addons.diafan.ru/modules/platezhnye-moduli/platezhnyy-modul-mandarinpay/', 'http://addons.diafan.ru/userfiles/files/mmedium/2040_platezhnyy-modul-mandarinpay.jpg', 'Владимир (akio)', 'http://user.diafan.ru/user/akio/', 365, 4, 0, 0, '0', '0', 0, '0', 1578340426, 0, '0'),
(40, 397, 0, 'Authorize.net payment module', 'Платежи', '<p>Платежный модуль Authorize.net для приема онлайн платежей на сайте.</p>', '<p>Платежный модуль Authorize.net для приема онлайн платежей на сайте.</p>\r\n<p>This payment module allows you to integrate with <a href=\"https://www.authorize.net/\" target=\"_blank\">https://www.authorize.net/</a>&nbsp;payment module, providing several payment methods.&nbsp;</p>\r\n<p></p>\r\n<p>Дополнение устанавливается из панели управления DIAFAN.CMS 6.0.6.11+ на Вашем сайте либо импортируется вручную в разделе \"Темы и дизайн\".</p>', '<p>After installing the add-on, go to the \"Online store\" -> \"Payment\" section, then add a new payment method and configure it by entering all the necessary data.</p>', 'payment', 'payment', 'http://addons.diafan.ru/modules/platezhnye-moduli/authorize/', 'http://addons.diafan.ru/userfiles/files/mmedium/2028_authorizenet-payment-module.jpg', 'Diafan', 'https://www.diafan.ru/', 345, 6, 0, 0, '0', '0', 0, '0', 1578340421, 0, '0'),
(41, 64, 0, 'Платежный метод Platron', 'Платежи', '<p>Платежный модуль Platron для приема онлайн платежей на сайте.</p>', '<p>С помощью Платрон вы сможете принимать платежи более чем через 20 платежных систем, объединенных единым техническим шлюзом и коммерческими условиями подключения.<br /><br /><br /><br />Дополнение устанавливается из панели управления DIAFAN.CMS 6.0.6.11+ на Вашем сайте либо импортируется вручную в разделе \"Темы и дизайн\".</p>', '<p>После установки дополнения:<br /><br />1. Регистрируемся на platron.ru<br />2. Заходим в административную часть сайта в раздел Оплата и нажимаем добавить. Выбираем тип платежную систему Platron<br />3. Настраиваем способ оплаты. Описание настроек есть в описании полей<br /> <br /> * Чтобы не принимать оплату по конкретной транзакции нужно поменять статус заказа на отменен.<br /> ** Если вы хотите чтобы ПС выбиралась на стороне магазина &ndash; нужно добавить столько методов оплаты с типом Платрон, сколько ПС подключено у Вас в личном кабинете Platron. При этом в поле название платежной системы надо ввести название платежной системы, на которую будет ссылаться метод оплаты.</p>', 'payment', 'payment', 'http://addons.diafan.ru/modules/modules-and-services/platezhnyy-metod-platron/', 'http://addons.diafan.ru/userfiles/files/mmedium/267_1.png.png', 'Алексей (Lexus1990)', 'http://user.diafan.ru/user/Lexus1990/', 315, 31, 0, 0, '0', '0', 0, '0', 1578340416, 0, '0'),
(42, 142, 0, 'Автоматическое подключение характеристик к дочерним категориям', 'Товар на сайте', '<p>Модуль добавляет возможность автоматического прикрепления характеристики товара ко всем вновь создаваемым подкатегориям внутри категории каталога, которая такую характеристику уже имеет. Также есть возможность выборочно отменить автоматически назначенные категории.&nbsp;</p>', '<p>Добавляет возможность автоматического прикрепления характеристики товара ко всем вновь создаваемым под категориям внутри категории каталога, которая такую характеристику уже имеет. Можно выборочно отменить автоматически назначенные категории. <br /> <br /><a href=\"https://github.com/weissfl/Diafan_CMS_autoparams_children_category\" target=\"_blank\">Дополнение на GitHub</a></p>\r\n<p>Дополнение устанавливается из панели управления DIAFAN.CMS 6.0.6.11+ на Вашем сайте либо импортируется вручную в разделе \"Темы и дизайн\".</p>', '<p>Создайте тему в интерфейсе &laquo;Темы и дизайн&raquo; и импортируйте туда скачанный архив. При создании отметьте опцию &laquo;Применить&raquo;. ВНИМАНИЕ! Если на сайте уже существует активная тема дизайна и её нужно сохранить, импортировать архив нужно в уже примененную тему.</p>', '', '', 'http://addons.diafan.ru/modules/avtomaticheskoe-podklyuchenie-kharakteristik-k-doc/', 'http://addons.diafan.ru/userfiles/files/mmedium/2080_avtomaticheskoe-podklyucheni.jpg', 'Dmitry (weissfl)', 'http://user.diafan.ru/user/weissfl/', 257, 55, 0, 0, '0', '0', 0, '0', 1571571117, 0, '0'),
(43, 34, 0, '2gis — расширение для модуля «Геокарты»', 'Общие модули', '<p>Модуль 2GIS является расширением для модуля DIAFAN.CMS - \"Геокарта\"</p>', '<p>Модуль 2GIS является расширением для модуля DIAFAN.CMS - \"Геокарта\"</p>\r\n<p>Дополнение устанавливается из панели управления DIAFAN.CMS 6.0.6.11+ на Вашем сайте либо импортируется вручную в разделе \"Темы и дизайн\".</p>', '<div class=\"install-module__text\">\r\n<p>После установки дополнения в административной части модуля &laquo;Геокарта&raquo; выберите &laquo;Бэкенд&raquo;&nbsp;&mdash; &laquo;2Gis&raquo; и настройте центр карты и&nbsp;масштаб.</p>\r\n</div>', 'geomap', 'geomap', 'http://addons.diafan.ru/modules/modules-and-services/2gis/', 'http://addons.diafan.ru/userfiles/files/mmedium/218_2gis--rasshirenie-dlya-modulya-.jpg', 'Diafan', 'https://www.diafan.ru/', 196, 135, 0, 0, '0', '0', 0, '0', 1573286269, 0, '0'),
(44, 73, 0, 'Рутокен Web', 'Общие модули', '<p>Модуль позволяет организовать доступ к учетным записям пользователей на сайте при помощи электронного идентификатора Рутокен Web.</p>', '<p>Модуль Рутокен Web позволяет организовать доступ к учетным записям пользователей на сайте при помощи электронного идентификатора Рутокен Web.<br /> <br /> Рутокен Web &mdash; устройство в форм-факторе USB-токена, используя который, вы можете:<br /> 1. Заменить небезопасную авторизацию по паре логин-пароль на надежную двухфакторную аппаратную аутентификацию.<br /> 2. Избежать &laquo;клонирования&raquo; пользователей web-сервиса, так как невозможно использовать один токен на нескольких рабочих местах одновременно.<br /> 3. Ограничить сотруднику доступ к учетной записи на корпоративном сайте простым изъятием у него токена.</p>\r\n<p>Для корректной работы плагина на сервере должна быть установлена библиотека gmp.</p>\r\n<p>Дополнение устанавливается из панели управления DIAFAN.CMS 6.0.6.11+ на Вашем сайте либо импортируется вручную в разделе \"Темы и дизайн\".</p>', '<p>После установки модуля для отображения модуля на&nbsp;главной странице сайта добавьте шаблонный тег вывода форм логина <br /> <insert name=\"show_token_login\" module=\"rutokenweb\"> <br /> в&nbsp;файл шаблона сайта&nbsp;<em>themes/site_start.php</em>.</p>', '', '', 'http://addons.diafan.ru/modules/rutoken-web/', 'http://addons.diafan.ru/userfiles/files/mmedium/294_Diafan-cms_1.png.png', 'Алексей Лазарев (Barzini)', 'http://user.diafan.ru/user/Barzini/', 195, 30, 0, 0, '0', '0', 0, '0', 1578593239, 0, '0'),
(45, 69, 0, 'uLogin - популярный модуль регистрации на сайте с помощью социальных сетей', 'Пользователи', '', '<p>Модуль позволяет интегрировать на Ваш сайт популярный сервис регистрации через социальные сети uLogin.ru. <br /> Посетитель регистрируется на сайте в два клика, при этом получая все возможности стандартного пользователя системы управления.<br /> В административной части имеется отдельный раздел, где Вы сможете настроить внешний вид блока авторизации, а также посмотреть всех посетителей, которые воспользовались модулем.</p>', '<p>1.&nbsp;Создайте тему в интерфейсе &laquo;Темы и дизайн&raquo; и импортируйте туда скачанный архив. При создании отметьте опцию &laquo;Применить&raquo;. ВНИМАНИЕ! Если на сайте уже существует активная тема дизайна и её нужно сохранить, импортировать архив нужно в уже примененную тему. <br /> <br />2. Установите модуль в&nbsp;интерфейсе &laquo;Модули и&nbsp;БД&raquo;&nbsp;&mdash; &laquo;Установка модулей&raquo;. Для этого отметьте галочку рядом с&nbsp;модулем uLogin и&nbsp;нажмите кнопку &laquo;Установить&raquo;. </p>\r\n<p>3. Вывод кнопок авторизации осуществляется шаблонным тэгом <insert name=\"show_block\" module=\"ulogin\">. Внимание&nbsp;&mdash; шаблонный тэг, для нормальной работы, желательно размещать на&nbsp;всех страницах. Если вывод кнопок на&nbsp;тех или иных страницах необязателен&nbsp;&mdash; просто скройте их&nbsp;с&nbsp;помощью css. <br /> Примечание: модуль подразумевает, что роль &laquo;Пользователь&raquo; на&nbsp;сайте не&nbsp;удалялась и&nbsp;существует с&nbsp;идентификатором &laquo;1&raquo;.</insert></p>', 'ulogin', '', 'http://addons.diafan.ru/modules/ulogin---populyarnyy-modul-registratsii-na-sayte-s69/', 'http://addons.diafan.ru/userfiles/files/mmedium/279_banner1.png.png', 'Андрей (kolia)', 'http://user.diafan.ru/user/kolia/', 194, 11, 550, 5, '0', '0', 0, '0', 1577705055, 0, '0'),
(46, 65, 0, 'CSS редактор', 'Инструменты администратора', '<p>Модуль позволяет визуально редактировать цветовые стили классов css, позволяет изменить цветовое оформление сайта</p>', '<p>Модуль позволяет визуально редактировать цветовые стили классов css.</p>\r\n<p>Текущая версия 1.4:</p>\r\n<ul>\r\n<li>Исправлено нахожение файла colors.css в темах для новой версии CMS</li>\r\n<li>Поддерживается свойство transparent</li>\r\n<li>Добавлена работа с прозрачностью цвета (свойство rgba)</li>\r\n</ul>\r\n<p>Для работы редактора необходимо, чтобы в&nbsp;каталоге <strong>/css/</strong> активной темы находился файл с&nbsp;именем <strong>colors.css</strong>, в&nbsp;таком формате записей:</p>\r\n<p>.class1 { /*# Шапка */<br />&nbsp; &nbsp;color:#2B32FF;<br />&nbsp; &nbsp;background: #36F536;<br />}<br />#id2 { /*# Форма заявки */<br />&nbsp; &nbsp;background-color: #006400;<br />}<br />#class2, .class3 { /*# Меню */<br />&nbsp; &nbsp;border-color: #774362;<br />}<br />#class4 > div > table td:first-child { /*# Плашка */<br />&nbsp; &nbsp;color:#FF681C;<br />}</p>\r\n<p>Подключается модуль классически, с&nbsp;помощью тега <strong>show_css</strong></p>\r\n<p>Если вынести некоторые свойства стилей в&nbsp;файл colors.css, можно &laquo;на&nbsp;горячую&raquo; визуально править нужные цвета.</p>\r\n<p>Наиболее востребован модуль партнерами-разработчиками и&nbsp;веб-мастерами, которые сдают сайты клиентам с&nbsp;возможностью править цвета шаблонов сайта.</p>\r\n<p>Дополнение устанавливается из панели управления DIAFAN.CMS 6.0.6.11+ на Вашем сайте либо импортируется вручную в разделе \"Темы и дизайн\".</p>', '<p>После установки дополнения создайте файл /css/colors.css и вынесите в него необходимые для правки цвета сайта, согласно описанию.</p>', 'csseditor', '', 'http://addons.diafan.ru/modules/css-redaktor/', 'http://addons.diafan.ru/userfiles/files/mmedium/2088_css-redaktor.jpg', 'Diafan', 'https://www.diafan.ru/', 188, 317, 0, 0, '0', '0', 0, '0', 1571234130, 0, '0'),
(47, 32, 0, 'Товарная накладная формы Торг-12', 'Бухгалтерия, статистика, отчёты', '<p>Добавьте товарную накладную унифицированной формы Торг-12 для заказов.</p>', '<p>Товарная накладная унифицированной формы Торг-12 будет выводиться по&nbsp;ссылке &laquo;Сформировать товарную накладную для печати&raquo; в&nbsp;заказе.</p>\r\n<p>Дополнение реализовано как бэкенд модуля &laquo;Расширения для заказа&raquo;&nbsp;&ndash;&nbsp;доступны в версии DIAFAN.CMS 6.0.9.10+.</p>', '<div class=\"install-module__text\">\r\n<p><span>1. В административной панели сайта пройдите в меню &laquo;Дополнения для CMS&raquo;.</span><br /><span>2. Найдите дополнение &laquo;Товарная накладная формы Торг-12&raquo; (можно отфильтровать по названию).</span><br /><span>3. Нажмите &laquo;Установить&raquo;.<br /></span>4. В заказе появится ссылка на товарную накладную.</p>\r\n</div>', 'order/backend', 'order/backend', 'http://addons.diafan.ru/modules/torg-12/', 'http://addons.diafan.ru/userfiles/files/mmedium/221_tovarnaya-nakladnaya-formy-t.jpg', 'Diafan', 'https://www.diafan.ru/', 165, 233, 0, 0, '0', '0', 0, '0', 1573286191, 0, '0'),
(48, 434, 0, 'Реферальная система', 'Пользователи', '', '<p>Модуль позволяет установить и использовать на сайте стандартную одноуровневую реферальную систему. <br /> <br />Зарегистрированным пользователям присваивается уникальная ссылка доступная в личном кабинете, по которой они могут приглашать других пользователей и получать процент с их покупок. Процент может быть выставлен индивидуально для каждого пользователя. Далее пользователь, накопивший баллы, может сделать заявку на вывод средств, конвертирование средств в баллы системы управления и т.д. Заявка приходит на почту администратора, который далее делает начисление оговоренным условиями работы реферальной системы способом.</p>', '<p>1. Скачайте архив с модулем. <br />2. В разделе &laquo;Темы и дизайн&raquo; административной части DiafanCMS открыть на редактирование нужную тему <br />3. В пункте &laquo;Импорт темы&raquo;, нажать &laquo;Выбрать файл&raquo; и выбираем архив с модулем <br />4. На странице редактирования темы нажать сохранить. <br />5. В разделе \"Настройки\" зайдите в подраздел \"Модули и БД\", установите галочку \"Рефералы\" и нажмите \"Установить\". <br />6. Перейти в \"Настройки\" модуля \"Пользователи\" (название_сайта/admin/users/config/), прокрутить страницу вниз, активировать пункт \"Использовать реферальную систему\". <br /> <br />Примечания: <br />- Во всех шаблонах папки themes должен быть шаблонный тэг <insert name=\"show_block\" module=\"referals\">, а также заменен <br /><insert name=\"show_css\" files=\"default.css, style.css..... на <insert name=\"show_css\" files=\"default.css, style.css, chartist.min.css, chartist-plugin-tooltip.css, referals.css\">. Т.е. подключены три дополнительных файла стилей chartist.min.css, chartist-plugin-tooltip.css, referals.css для корректного отображения графиков в пользовательской части.</p>', 'referals', '', 'http://addons.diafan.ru/modules/referalnaya-sistema/', 'http://addons.diafan.ru/userfiles/files/mmedium/2147_banner.jpg.jpg', 'Андрей (kolia)', 'http://user.diafan.ru/user/kolia/', 134, 1, 4590, 230, '0', '0', 0, '0', 1577703589, 0, '0'),
(49, 415, 0, 'КОМТЕТ Касса, фискализация чеков по 54-ФЗ', 'Платежи', '<p>КОМТЕТ Касса <span>&mdash;&nbsp;</span>сервис по аренде онлайн-кассы для сайта (соответствует требованиям 54-ФЗ).</p>', '<p>Данное решение позволяет подключить Ваш интернет-магазин к облачному сервису <a href=\"https://kassa.komtet.ru\" target=\"_blank\">КОМТЕТ Касса</a> с целью соответствия требованиям 54-ФЗ для регистрации расчетов с использованием электронного средства платежа в сети Интернет. <br /><br /><b>Возможности дополнения</b></p>\r\n<ul>\r\n<li>автоматическая фискализация платежей;</li>\r\n<li>фискализация в ручном режиме.</li>\r\n</ul>\r\n<p>Реализован в виде бэкенда к модулю &laquo;Онлайн касса&raquo;.</p>', '<p><b>Установка модуля</b></p>\r\n<p>1. В настройках модуля&nbsp; &laquo;Онлайн касса&raquo; (Оплата &mdash; Онлайн касса &mdash;&nbsp;Настройки модуля) в списке&nbsp;&laquo;Тип&raquo; выберите &laquo;Добавить тип&raquo;.</p>\r\n<p>2. В открывшемся списке дополнений выберите&nbsp;&laquo;КОМТЕТ Касса, фискализация чеков по 54-ФЗ&raquo; &mdash;&nbsp;&laquo;Установить&raquo;.</p>\r\n<p>3. Теперь в настройках модуля&nbsp;&laquo;Онлайн касса&raquo; будет доступен тип&nbsp;&laquo;Komtetkassa&raquo;.</p>', 'cashregister/config', 'cashregister', 'http://addons.diafan.ru/modules/modules-and-services/komtet-kassa/', 'http://addons.diafan.ru/userfiles/files/mmedium/2698_komtet-kassa-fiskalizatsiya-.jpg', 'КОМТЕТ Касса (komtetkassa)', 'http://user.diafan.ru/user/komtetkassa/', 131, 39, 0, 0, '0', '0', 0, '0', 1578593162, 0, '0');

-- --------------------------------------------------------

--
-- Структура таблицы `diafan_admin`
--

CREATE TABLE `diafan_admin` (
  `id` smallint(5) UNSIGNED NOT NULL COMMENT 'идентификатор',
  `parent_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор родителя из таблицы `diafan_admin`',
  `count_children` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'количество вложенных страниц',
  `group_id` enum('1','2','3','4','5','6','7') NOT NULL DEFAULT '1' COMMENT 'группа',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT 'название',
  `rewrite` varchar(30) NOT NULL DEFAULT '' COMMENT 'псевдоссылка',
  `act` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'показывать в меню: 0 - нет, 1 - да',
  `add` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'ссылка на добавление элемента в быстром меню: 0 - нет, 1 - да',
  `add_name` varchar(100) NOT NULL DEFAULT '' COMMENT 'текст ссылки на добавление элемента в быстром меню',
  `sort` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'порядковый номер для сортировки',
  `docs` varchar(255) NOT NULL DEFAULT '' COMMENT 'ссылка на раздел в документации',
  `icon_name` varchar(30) NOT NULL DEFAULT '' COMMENT 'иконка модуля для административной части сайта'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Страницы в админки';

--
-- Дамп данных таблицы `diafan_admin`
--

INSERT INTO `diafan_admin` (`id`, `parent_id`, `count_children`, `group_id`, `name`, `rewrite`, `act`, `add`, `add_name`, `sort`, `docs`, `icon_name`) VALUES
(1, 0, 8, '5', 'Модули и БД', 'service', '1', '0', '', 34, '', ''),
(2, 1, 0, '5', 'Установка модулей', 'service', '1', '0', '', 1, '', ''),
(3, 1, 0, '5', 'Восстановление БД', 'service/repair', '1', '0', '', 2, '', ''),
(4, 1, 0, '5', 'Экспорт/импорт БД', 'service/db', '1', '0', '', 3, '', ''),
(5, 1, 0, '5', 'Экспорт/импорт данных', 'service/express', '1', '0', '', 4, '', ''),
(6, 1, 0, '5', 'Импорт', 'service/express/import', '0', '0', '', 5, '', ''),
(7, 1, 0, '5', 'Экспорт', 'service/express/export', '0', '0', '', 6, '', ''),
(8, 1, 0, '5', 'Сохраненные импорт/экспорт', 'service/express/fields', '0', '0', '', 7, '', ''),
(9, 1, 0, '5', 'Настройки', 'service/config', '0', '0', '', 8, '', ''),
(10, 0, 0, '1', 'Страницы админки', 'admin', '0', '0', '', 1, '', ''),
(11, 0, 0, '5', 'Параметры сайта', 'config', '1', '0', '', 33, '', ''),
(12, 0, 1, '5', 'Обработка изображений', 'images', '1', '0', '', 37, '', ''),
(13, 12, 0, '5', 'Настройки', 'images/config', '0', '0', '', 1, '', ''),
(14, 0, 3, '1', 'Меню на сайте', 'menu', '1', '0', '', 4, '', ''),
(15, 14, 0, '1', 'Пункты меню', 'menu', '1', '0', '', 1, '', ''),
(16, 14, 0, '1', 'Меню', 'menu/category', '1', '0', '', 2, '', ''),
(17, 14, 0, '1', 'Настройки', 'menu/config', '0', '0', '', 3, '', ''),
(18, 0, 4, '1', 'Страницы сайта', 'site', '1', '1', 'Страница сайта', 3, '', ''),
(19, 18, 0, '1', 'Страницы сайта', 'site', '1', '0', '', 1, '', ''),
(20, 18, 0, '1', 'Блоки на сайте', 'site/blocks', '1', '0', '', 2, '', ''),
(21, 18, 0, '1', 'Динамические блоки', 'site/dynamic', '1', '0', '', 3, '', ''),
(22, 18, 0, '1', 'Настройки', 'site/config', '0', '0', '', 4, '', ''),
(23, 0, 5, '1', 'Объявления', 'ab', '0', '1', 'Объявление', 9, '', ''),
(24, 23, 0, '1', 'Объявления', 'ab', '0', '0', '', 1, '', ''),
(25, 23, 0, '1', 'Характеристики', 'ab/param', '0', '0', '', 2, '', ''),
(26, 23, 0, '1', 'Категории', 'ab/category', '0', '0', '', 3, '', ''),
(27, 23, 0, '1', 'Статистика', 'ab/counter', '0', '0', '', 4, '', ''),
(28, 23, 0, '1', 'Настройки', 'ab/config', '0', '0', '', 5, '', ''),
(29, 0, 4, '6', 'Кабинет пользователя', 'account', '0', '0', '', 31, '', 'user'),
(30, 29, 0, '6', 'Персональная страница', 'account', '0', '0', '', 1, '', 'user'),
(31, 29, 0, '6', 'Служба поддержки', 'account/support', '0', '0', '', 2, '', 'user'),
(32, 29, 0, '6', 'Поиск веб-мастера', 'account/projects', '0', '0', '', 3, '', 'user'),
(33, 29, 0, '6', 'Настройки', 'account/config', '0', '0', '', 4, '', 'user'),
(34, 0, 1, '6', 'Дополнения для CMS', 'addons', '1', '0', '', 41, '', 'cubes'),
(35, 34, 0, '6', 'Каталог дополнений', 'addons', '1', '0', '', 1, '', 'cubes'),
(36, 0, 2, '4', 'Оплата', 'payment', '1', '0', '', 14, '', ''),
(37, 36, 0, '4', 'Баланс', 'balance', '1', '0', '', 3, '', ''),
(38, 36, 0, '4', 'Настройки', 'balance/config', '0', '0', '', 1, '', ''),
(39, 0, 3, '1', 'Баннеры', 'bs', '1', '1', 'Баннер', 8, 'http://www.diafan.ru/moduli/bannery/', ''),
(40, 39, 0, '1', 'Баннеры', 'bs', '1', '0', '', 1, 'http://www.diafan.ru/moduli/bannery/', ''),
(41, 39, 0, '1', 'Категории', 'bs/category', '1', '0', '', 2, 'http://www.diafan.ru/moduli/bannery/', ''),
(42, 39, 0, '1', 'Настройка', 'bs/config', '0', '0', '', 3, 'http://www.diafan.ru/moduli/bannery/', ''),
(43, 0, 0, '5', 'Captcha', 'captcha', '1', '0', '', 39, '', ''),
(44, 0, 4, '1', 'Статьи', 'clauses', '0', '1', 'Статью', 6, 'http://www.diafan.ru/moduli/stati/', ''),
(45, 44, 0, '1', 'Статьи', 'clauses', '0', '0', '', 1, 'http://www.diafan.ru/moduli/stati/', ''),
(46, 44, 0, '1', 'Категории', 'clauses/category', '0', '0', '', 2, 'http://www.diafan.ru/moduli/stati/', ''),
(47, 44, 0, '1', 'Статистика', 'clauses/counter', '0', '0', '', 3, 'http://www.diafan.ru/moduli/stati/', ''),
(48, 44, 0, '1', 'Настройки', 'clauses/config', '0', '0', '', 4, 'http://www.diafan.ru/moduli/stati/', ''),
(49, 0, 3, '2', 'Комментарии', 'comments', '0', '0', '', 24, 'http://www.diafan.ru/moduli/kommentarii/', ''),
(50, 49, 0, '2', 'Список комментариев', 'comments', '0', '0', '', 1, 'http://www.diafan.ru/moduli/kommentarii/', ''),
(51, 49, 0, '2', 'Конструктор формы', 'comments/param', '0', '0', '', 2, 'http://www.diafan.ru/moduli/kommentarii/', ''),
(52, 49, 0, '2', 'Настройки', 'comments/config', '0', '0', '', 3, 'http://www.diafan.ru/moduli/kommentarii/', ''),
(54, 0, 2, '5', 'Расписание задач', 'crontab', '0', '0', '', 36, '', 'calendar-o'),
(55, 54, 0, '5', 'Список задач', 'crontab', '0', '0', '', 1, '', 'calendar-o'),
(56, 54, 0, '5', 'Настройки', 'crontab/config', '0', '0', '', 2, '', 'calendar-o'),
(57, 0, 0, '3', 'Темы и дизайн', 'custom', '0', '0', '', 30, '', ''),
(58, 0, 0, '1', 'События', 'dashboard', '0', '0', '', 2, '', ''),
(59, 0, 2, '5', 'Фоновые процессы', 'executable', '0', '0', '', 35, '', 'tasks'),
(60, 59, 0, '5', 'Реестр фоновых процессов', 'executable', '0', '0', '', 1, '', 'tasks'),
(61, 59, 0, '5', 'Настройки', 'executable/config', '0', '0', '', 2, '', 'tasks'),
(62, 0, 4, '2', 'Вопрос-Ответ', 'faq', '1', '0', '', 18, 'http://www.diafan.ru/moduli/vopros-otvet/', ''),
(63, 62, 0, '2', 'Вопросы', 'faq', '1', '0', '', 1, 'http://www.diafan.ru/moduli/vopros-otvet/', ''),
(64, 62, 0, '2', 'Категории', 'faq/category', '1', '0', '', 2, 'http://www.diafan.ru/moduli/vopros-otvet/', ''),
(65, 62, 0, '2', 'Статистика', 'faq/counter', '1', '0', '', 3, 'http://www.diafan.ru/moduli/vopros-otvet/', ''),
(66, 62, 0, '2', 'Настройки', 'faq/config', '1', '0', '', 4, 'http://www.diafan.ru/moduli/vopros-otvet/', ''),
(67, 0, 3, '2', 'Обратная связь', 'feedback', '1', '0', '', 19, 'http://www.diafan.ru/moduli/obratnaya_svyaz/', ''),
(68, 67, 0, '2', 'Сообщения', 'feedback', '1', '0', '', 1, 'http://www.diafan.ru/moduli/obratnaya_svyaz/', ''),
(69, 67, 0, '2', 'Конструктор формы', 'feedback/param', '1', '0', '', 2, 'http://www.diafan.ru/moduli/obratnaya_svyaz/', ''),
(70, 67, 0, '2', 'Настройки', 'feedback/config', '1', '0', '', 3, 'http://www.diafan.ru/moduli/obratnaya_svyaz/', ''),
(71, 0, 0, '3', 'Файловый менеджер', 'filemanager', '0', '0', '', 29, '', ''),
(72, 0, 4, '1', 'Файловый архив', 'files', '0', '0', '', 8, 'http://www.diafan.ru/moduli/fajlovyj_arxiv/', ''),
(73, 72, 0, '1', 'Файлы', 'files', '0', '0', '', 1, 'http://www.diafan.ru/moduli/fajlovyj_arxiv/', ''),
(74, 72, 0, '1', 'Категории', 'files/category', '0', '0', '', 2, 'http://www.diafan.ru/moduli/fajlovyj_arxiv/', ''),
(75, 72, 0, '1', 'Статистика', 'files/counter', '0', '0', '', 3, 'http://www.diafan.ru/moduli/fajlovyj_arxiv/', ''),
(76, 72, 0, '1', 'Настройки', 'files/config', '0', '0', '', 4, 'http://www.diafan.ru/moduli/fajlovyj_arxiv/', ''),
(77, 0, 5, '2', 'Форум', 'forum', '0', '0', '', 17, 'http://www.diafan.ru/moduli/forum/', ''),
(78, 77, 0, '2', 'Темы', 'forum', '0', '0', '', 1, 'http://www.diafan.ru/moduli/forum/', ''),
(79, 77, 0, '2', 'Блоки', 'forum/blocks', '0', '0', '', 2, 'http://www.diafan.ru/moduli/forum/', ''),
(80, 77, 0, '2', 'Категории', 'forum/category', '0', '0', '', 3, 'http://www.diafan.ru/moduli/forum/', ''),
(81, 77, 0, '2', 'Сообщения', 'forum/messages', '0', '0', '', 4, 'http://www.diafan.ru/moduli/forum/', ''),
(82, 77, 0, '2', 'Настройки', 'forum/config', '0', '0', '', 5, 'http://www.diafan.ru/moduli/forum/', ''),
(83, 0, 0, '2', 'Геокарта', 'geomap', '0', '0', '', 22, '', ''),
(84, 0, 0, '3', 'Вставки', 'inserts', '0', '0', '', 44, '', 'clipboard'),
(85, 0, 3, '3', 'Перелинковка', 'keywords', '0', '0', '', 28, '', ''),
(86, 85, 0, '3', 'Ключевые слова', 'keywords', '0', '0', '', 1, '', ''),
(87, 85, 0, '3', 'Импорт/экспорт', 'keywords/importexport', '0', '0', '', 2, '', ''),
(88, 85, 0, '3', 'Настройки', 'keywords/config', '0', '0', '', 3, '', ''),
(89, 0, 2, '5', 'Языки сайта', 'languages', '0', '0', '', 38, '', ''),
(90, 89, 0, '5', 'Языки сайта', 'languages', '0', '0', '', 1, '', ''),
(91, 89, 0, '5', 'Перевод интерфейса', 'languages/translate', '0', '0', '', 2, '', ''),
(92, 0, 2, '5', 'Лог', 'log', '0', '0', '', 46, '', 'file-text-o'),
(93, 92, 0, '5', 'Лог ошибок', 'log', '0', '0', '', 1, '', 'file-text-o'),
(94, 92, 0, '5', 'Настройки', 'log/config', '0', '0', '', 2, '', 'file-text-o'),
(95, 0, 0, '2', 'Ошибки на сайте', 'mistakes', '0', '0', '', 26, '', ''),
(96, 0, 4, '1', 'Новости', 'news', '0', '1', 'Новость', 5, 'http://www.diafan.ru/moduli/novosti/', ''),
(97, 96, 0, '1', 'Новости', 'news', '0', '0', '', 1, 'http://www.diafan.ru/moduli/novosti/', ''),
(98, 96, 0, '1', 'Категории', 'news/category', '0', '0', '', 2, 'http://www.diafan.ru/moduli/novosti/', ''),
(99, 96, 0, '1', 'Статистика', 'news/counter', '0', '0', '', 3, 'http://www.diafan.ru/moduli/novosti/', ''),
(100, 96, 0, '1', 'Настройки', 'news/config', '0', '0', '', 4, 'http://www.diafan.ru/moduli/novosti/', ''),
(101, 36, 0, '4', 'Методы оплаты', 'payment', '1', '0', '', 1, '', ''),
(102, 36, 0, '4', 'История платежей', 'payment/history', '1', '0', '', 2, '', ''),
(103, 0, 4, '1', 'Фотогалерея', 'photo', '0', '1', 'Фотография', 7, 'http://www.diafan.ru/moduli/fotogalereya/', ''),
(104, 103, 0, '1', 'Фотографии', 'photo', '0', '0', '', 1, 'http://www.diafan.ru/moduli/fotogalereya/', ''),
(105, 103, 0, '1', 'Альбомы', 'photo/category', '0', '0', '', 2, 'http://www.diafan.ru/moduli/fotogalereya/', ''),
(106, 103, 0, '1', 'Статистика', 'photo/counter', '0', '0', '', 3, 'http://www.diafan.ru/moduli/fotogalereya/', ''),
(107, 103, 0, '1', 'Настройки', 'photo/config', '0', '0', '', 4, 'http://www.diafan.ru/moduli/fotogalereya/', ''),
(108, 0, 2, '3', 'Уведомления', 'postman', '0', '0', '', 42, '', ''),
(109, 108, 0, '3', 'Список отправлений', 'postman', '0', '0', '', 1, '', ''),
(110, 108, 0, '3', 'Настройки', 'postman/config', '0', '0', '', 1, '', ''),
(111, 0, 1, '2', 'Рейтинг', 'rating', '0', '0', '', 23, 'http://www.diafan.ru/moduli/rejtingi/', ''),
(112, 111, 0, '2', 'Настройки', 'rating/config', '0', '0', '', 1, 'http://www.diafan.ru/moduli/rejtingi/', ''),
(113, 0, 3, '2', 'Отзывы', 'reviews', '0', '0', '', 25, '', ''),
(114, 113, 0, '2', 'Отзывы', 'reviews', '0', '0', '', 1, '', ''),
(115, 113, 0, '2', 'Конструктор формы', 'reviews/param', '0', '0', '', 2, '', ''),
(116, 113, 0, '2', 'Настройки', 'reviews/config', '0', '0', '', 3, '', ''),
(117, 0, 3, '3', 'Поиск по сайту', 'search', '1', '0', '', 32, 'http://www.diafan.ru/moduli/poisk/', ''),
(118, 117, 0, '3', 'Индексация', 'search', '1', '0', '', 1, 'http://www.diafan.ru/moduli/poisk/', ''),
(119, 117, 0, '3', 'История поиска', 'search/history', '1', '0', '', 2, 'http://www.diafan.ru/moduli/poisk/', ''),
(120, 117, 0, '3', 'Настройки', 'search/config', '0', '0', '', 3, 'http://www.diafan.ru/moduli/poisk/', ''),
(121, 0, 7, '4', 'Каталог', 'shop', '1', '1', 'Товар', 11, 'http://www.diafan.ru/moduli/magazin/', ''),
(122, 121, 0, '4', 'Товары', 'shop', '1', '0', '', 1, 'http://www.diafan.ru/moduli/magazin/', ''),
(123, 121, 0, '4', 'Скидки', 'shop/discount', '1', '0', '', 2, 'http://www.diafan.ru/moduli/magazin/', ''),
(124, 121, 0, '4', 'Производители', 'shop/brand', '1', '0', '', 3, 'http://www.diafan.ru/moduli/magazin/', ''),
(125, 121, 0, '4', 'Категории', 'shop/category', '1', '0', '', 4, 'http://www.diafan.ru/moduli/magazin/', ''),
(126, 121, 0, '4', 'Характеристики', 'shop/param', '1', '0', '', 5, 'http://www.diafan.ru/moduli/magazin/', ''),
(127, 121, 0, '4', 'Импорт/экспорт', 'shop/importexport', '1', '0', '', 6, 'http://www.diafan.ru/moduli/magazin/', ''),
(128, 121, 0, '4', 'Настройки', 'shop/config', '0', '0', '', 7, 'http://www.diafan.ru/moduli/magazin/', ''),
(129, 0, 3, '4', 'Заказы', 'order', '1', '0', '', 12, 'http://www.diafan.ru/moduli/magazin/', ''),
(130, 129, 0, '4', 'Заказы', 'order', '1', '0', '', 1, 'http://www.diafan.ru/moduli/magazin/', ''),
(131, 129, 0, '4', 'Расширения для заказа', 'order/backend', '1', '0', '', 2, 'http://www.diafan.ru/moduli/magazin/', ''),
(132, 129, 0, '4', 'Настройки', 'order/config', '0', '0', '', 3, 'http://www.diafan.ru/moduli/magazin/', ''),
(133, 0, 5, '4', 'Справочники', 'delivery', '1', '0', '', 13, 'http://www.diafan.ru/moduli/magazin/', ''),
(134, 133, 0, '4', 'Способы доставки', 'delivery', '1', '0', '', 1, 'http://www.diafan.ru/moduli/magazin/', ''),
(135, 133, 0, '4', 'Сопутствующие услуги', 'shop/additionalcost', '1', '0', '', 2, 'http://www.diafan.ru/moduli/magazin/', ''),
(136, 133, 0, '4', 'Форма оформления заказа', 'shop/orderparam', '1', '0', '', 3, 'http://www.diafan.ru/moduli/magazin/', ''),
(137, 133, 0, '4', 'Статусы заказа', 'shop/orderstatus', '1', '0', '', 4, 'http://www.diafan.ru/moduli/magazin/', ''),
(138, 133, 0, '4', 'Валюты', 'shop/currency', '1', '0', '', 5, 'http://www.diafan.ru/moduli/magazin/', ''),
(139, 0, 5, '4', 'Статистика', 'shop/ordercount', '0', '0', '', 15, 'http://www.diafan.ru/moduli/magazin/', ''),
(140, 139, 0, '4', 'Отчеты о заказах', 'shop/ordercount', '0', '0', '', 1, 'http://www.diafan.ru/moduli/magazin/', ''),
(141, 139, 0, '4', 'Отложенные товары', 'shop/wishlist', '0', '0', '', 2, 'http://www.diafan.ru/moduli/magazin/', ''),
(142, 139, 0, '4', 'Список ожиданий', 'shop/waitlist', '0', '0', '', 3, 'http://www.diafan.ru/moduli/magazin/', ''),
(143, 139, 0, '4', 'Брошенные корзины', 'cart', '0', '0', '', 4, 'http://www.diafan.ru/moduli/magazin/', ''),
(144, 139, 0, '4', 'Статистика товаров', 'shop/counter', '0', '0', '', 5, 'http://www.diafan.ru/moduli/magazin/', ''),
(145, 36, 0, '4', 'Он-лайн касса', 'cashregister', '1', '0', '', 4, '', ''),
(146, 36, 0, '4', 'Настройки', 'cashregister/config', '0', '0', '', 1, '', ''),
(147, 0, 6, '2', 'Рассылки', 'subscription', '0', '0', '', 21, 'http://www.diafan.ru/moduli/rassylki/', ''),
(148, 147, 0, '2', 'E-mail рассылки', 'subscription', '0', '0', '', 1, 'http://www.diafan.ru/moduli/rassylki/', ''),
(149, 147, 0, '2', 'Категории', 'subscription/category', '0', '0', '', 2, 'http://www.diafan.ru/moduli/rassylki/', ''),
(150, 147, 0, '2', 'Подписчики', 'subscription/emails', '0', '0', '', 3, 'http://www.diafan.ru/moduli/rassylki/', ''),
(151, 147, 0, '2', 'SMS-рассылки', 'subscription/sms', '0', '0', '', 4, 'http://www.diafan.ru/moduli/rassylki/', ''),
(152, 147, 0, '2', 'Номера телефонов', 'subscription/phones', '0', '0', '', 5, 'http://www.diafan.ru/moduli/rassylki/', ''),
(153, 147, 0, '2', 'Настройки', 'subscription/config', '0', '0', '', 6, 'http://www.diafan.ru/moduli/rassylki/', ''),
(154, 0, 1, '1', 'Теги', 'tags', '0', '0', '', 10, 'http://www.diafan.ru/moduli/tegi/', ''),
(155, 154, 0, '1', 'Настройки', 'tags/config', '0', '0', '', 1, 'http://www.diafan.ru/moduli/tegi/', ''),
(156, 0, 0, '5', 'Корзина', 'trash', '1', '0', '', 40, 'http://www.diafan.ru/moduli/korzina/', ''),
(157, 0, 0, '6', 'Обновление CMS', 'update', '0', '0', '', 43, 'http://www.diafan.ru/moduli/obnovleniya/', ''),
(158, 0, 4, '2', 'Пользователи сайта', 'users', '1', '0', '', 16, 'http://www.diafan.ru/moduli/polzovateli/', ''),
(159, 158, 0, '2', 'Пользователи', 'users', '1', '0', '', 1, 'http://www.diafan.ru/moduli/polzovateli/', ''),
(160, 158, 0, '2', 'Права доступа', 'users/role', '1', '0', '', 2, 'http://www.diafan.ru/moduli/polzovateli/', ''),
(161, 158, 0, '2', 'Конструктор формы регистрации', 'users/param', '1', '0', '', 3, 'http://www.diafan.ru/moduli/polzovateli/', ''),
(162, 158, 0, '2', 'Настройки', 'users/config', '0', '0', '', 4, 'http://www.diafan.ru/moduli/polzovateli/', ''),
(163, 0, 5, '3', 'Посещаемость', 'visitors', '0', '0', '', 45, '', ''),
(164, 163, 0, '3', 'Сводная статистика', 'visitors', '0', '0', '', 1, '', ''),
(165, 163, 0, '3', 'Посетители', 'visitors/counter', '0', '0', '', 2, '', ''),
(166, 163, 0, '3', 'Яндекс Метрика', 'visitors/yandex', '0', '0', '', 3, '', ''),
(167, 163, 0, '3', 'Google Аналитика', 'visitors/google', '0', '0', '', 4, '', ''),
(168, 163, 0, '3', 'Настройки', 'visitors/config', '0', '0', '', 5, '', ''),
(169, 0, 3, '2', 'Опросы', 'votes', '0', '0', '', 20, 'http://www.diafan.ru/moduli/oprosy/', ''),
(170, 169, 0, '2', 'Опросы', 'votes', '0', '0', '', 1, 'http://www.diafan.ru/moduli/oprosy/', ''),
(171, 169, 0, '2', 'Варианты пользователей', 'votes/userversion', '0', '0', '', 2, 'http://www.diafan.ru/moduli/oprosy/', ''),
(172, 169, 0, '2', 'Настройки', 'votes/config', '0', '0', '', 3, 'http://www.diafan.ru/moduli/oprosy/', '');

-- --------------------------------------------------------

--
-- Структура таблицы `diafan_admin_parents`
--

CREATE TABLE `diafan_admin_parents` (
  `id` smallint(5) UNSIGNED NOT NULL COMMENT 'идентификатор',
  `element_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор страницы из таблицы `diafan_admin`',
  `parent_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор страницы родителя из таблицы `diafan_admin`'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Родительские связи страниц админки';

--
-- Дамп данных таблицы `diafan_admin_parents`
--

INSERT INTO `diafan_admin_parents` (`id`, `element_id`, `parent_id`) VALUES
(1, 2, 1),
(2, 3, 1),
(3, 4, 1),
(4, 5, 1),
(5, 6, 1),
(6, 7, 1),
(7, 8, 1),
(8, 9, 1),
(9, 13, 12),
(10, 15, 14),
(11, 16, 14),
(12, 17, 14),
(13, 19, 18),
(14, 20, 18),
(15, 21, 18),
(16, 22, 18),
(17, 24, 23),
(18, 25, 23),
(19, 26, 23),
(20, 27, 23),
(21, 28, 23),
(22, 30, 29),
(23, 31, 29),
(24, 32, 29),
(25, 33, 29),
(26, 35, 34),
(27, 37, 36),
(28, 38, 36),
(29, 40, 39),
(30, 41, 39),
(31, 42, 39),
(32, 45, 44),
(33, 46, 44),
(34, 47, 44),
(35, 48, 44),
(36, 50, 49),
(37, 51, 49),
(38, 52, 49),
(39, 55, 54),
(40, 56, 54),
(41, 60, 59),
(42, 61, 59),
(43, 63, 62),
(44, 64, 62),
(45, 65, 62),
(46, 66, 62),
(47, 68, 67),
(48, 69, 67),
(49, 70, 67),
(50, 73, 72),
(51, 74, 72),
(52, 75, 72),
(53, 76, 72),
(54, 78, 77),
(55, 79, 77),
(56, 80, 77),
(57, 81, 77),
(58, 82, 77),
(59, 86, 85),
(60, 87, 85),
(61, 88, 85),
(62, 90, 89),
(63, 91, 89),
(64, 93, 92),
(65, 94, 92),
(66, 97, 96),
(67, 98, 96),
(68, 99, 96),
(69, 100, 96),
(70, 101, 36),
(71, 102, 36),
(72, 104, 103),
(73, 105, 103),
(74, 106, 103),
(75, 107, 103),
(76, 109, 108),
(77, 110, 108),
(78, 112, 111),
(79, 114, 113),
(80, 115, 113),
(81, 116, 113),
(82, 118, 117),
(83, 119, 117),
(84, 120, 117),
(85, 122, 121),
(86, 123, 121),
(87, 124, 121),
(88, 125, 121),
(89, 126, 121),
(90, 127, 121),
(91, 128, 121),
(92, 130, 129),
(93, 131, 129),
(94, 132, 129),
(95, 134, 133),
(96, 135, 133),
(97, 136, 133),
(98, 137, 133),
(99, 138, 133),
(100, 140, 139),
(101, 141, 139),
(102, 142, 139),
(103, 143, 139),
(104, 144, 139),
(105, 145, 36),
(106, 146, 36),
(107, 148, 147),
(108, 149, 147),
(109, 150, 147),
(110, 151, 147),
(111, 152, 147),
(112, 153, 147),
(113, 155, 154),
(114, 159, 158),
(115, 160, 158),
(116, 161, 158),
(117, 162, 158),
(118, 164, 163),
(119, 165, 163),
(120, 166, 163),
(121, 167, 163),
(122, 168, 163),
(123, 170, 169),
(124, 171, 169),
(125, 172, 169);

-- --------------------------------------------------------

--
-- Структура таблицы `diafan_attachments`
--

CREATE TABLE `diafan_attachments` (
  `id` int(11) UNSIGNED NOT NULL COMMENT 'идентификатор',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT 'название файла',
  `module_name` varchar(50) NOT NULL DEFAULT '' COMMENT 'название модуля',
  `element_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор элемента модуля',
  `param_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор поля или характеристики с типом «файлы»',
  `extension` varchar(255) NOT NULL DEFAULT '' COMMENT 'расширение файла',
  `size` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'размер файла',
  `is_image` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'это изображение: 0 - нет, 1 - да',
  `access_admin` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'доступ только для администратора: 0 - нет, 1 - да',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Прикрепленные файлы';

-- --------------------------------------------------------

--
-- Структура таблицы `diafan_balance`
--

CREATE TABLE `diafan_balance` (
  `id` smallint(5) UNSIGNED NOT NULL COMMENT 'идентификатор',
  `user_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор пользователя из таблицы `diafan_users`',
  `summ` double UNSIGNED NOT NULL DEFAULT 0 COMMENT 'сумма на балансе'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Баланс пользователей';

-- --------------------------------------------------------

--
-- Структура таблицы `diafan_bs`
--

CREATE TABLE `diafan_bs` (
  `id` int(11) UNSIGNED NOT NULL COMMENT 'идентификатор',
  `name1` varchar(250) NOT NULL DEFAULT '' COMMENT 'название',
  `text1` text DEFAULT NULL COMMENT 'описание',
  `alt1` varchar(250) NOT NULL DEFAULT '' COMMENT 'атрибут alt для баннера-изображения',
  `title1` varchar(250) NOT NULL DEFAULT '' COMMENT 'атрибут title для баннера-изображения',
  `act1` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'показывать на сайте: 0 - нет, 1 - да',
  `type` enum('1','2','3') NOT NULL DEFAULT '1' COMMENT 'тип: 1 - изображение, 2 - флэш, 3 - HTML',
  `file` varchar(250) NOT NULL DEFAULT '' COMMENT 'имя файла, загруженного в папку userfls/bs',
  `html` text DEFAULT NULL COMMENT 'HTML код баннера-блока',
  `link1` text DEFAULT NULL COMMENT 'ссылка на баннер-изображение или баннер-флэш',
  `cat_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор категории из таблицы `diafan_bs_category`',
  `check_number` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'ограничить количество показов: 0 - нет, 1 - да',
  `check_click` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'ограничить по количеству кликов: 0 - нет, 1 - да',
  `show_click` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'ограничить по количеству кликов: осталось кликов',
  `created` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'дата создания',
  `date_start` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'дата начала показа',
  `date_finish` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'дата окончания показа',
  `show_number` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'ограничить количество показов: осталось показов',
  `click` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'всего кликов',
  `width` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'ширина флэш-баннера',
  `height` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'высота флэш-баннера',
  `check_user` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'ограничить количество показов посетителю в сутки: 0 - нет, 1 - да',
  `show_user` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'количество показов посетителю в сутки',
  `count_view` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'всего показов',
  `target_blank` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'открывать ссылку в новом окне',
  `sort` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'подрядковый номер для сортировки',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Баннеры';

--
-- Дамп данных таблицы `diafan_bs`
--

INSERT INTO `diafan_bs` (`id`, `name1`, `text1`, `alt1`, `title1`, `act1`, `type`, `file`, `html`, `link1`, `cat_id`, `check_number`, `check_click`, `show_click`, `created`, `date_start`, `date_finish`, `show_number`, `click`, `width`, `height`, `check_user`, `show_user`, `count_view`, `target_blank`, `sort`, `trash`) VALUES
(1, 'Автомобильная гидравлика', '<div class=\"mainslider__items\">\r\n	<div class=\"mainslider__item\"><span>Доставка</span></div>\r\n	<div class=\"mainslider__item\"><span>Рассрочка</span></div>\r\n	<div class=\"mainslider__item\"><span>В наличии</span></div>\r\n</div>\r\n<div class=\"mainslider__text\">Более <span class=\"orange\">1000 видов</span> продукции!</div>', '', '', '1', '1', 'slide1_1.jpg', '', '', 1, '0', '0', 0, 1586725200, 0, 0, 0, 0, 0, 0, '0', 0, 123, '0', 2, '0'),
(2, 'Автомобильная гидравлика 2', '<div class=\"mainslider__items\">\r\n	<div class=\"mainslider__item\"><span>Доставка</span></div>\r\n	<div class=\"mainslider__item\"><span>Рассрочка</span></div>\r\n	<div class=\"mainslider__item\"><span>В наличии</span></div>\r\n</div>\r\n<div class=\"mainslider__text\">Более <span class=\"orange\">1000 видов</span> продукции!</div>', '', '', '1', '1', 'slide1_2.png', '', '', 1, '0', '0', 0, 1586725200, 0, 0, 0, 0, 0, 0, '0', 0, 123, '0', 1, '0');

-- --------------------------------------------------------

--
-- Структура таблицы `diafan_bs_category`
--

CREATE TABLE `diafan_bs_category` (
  `id` int(11) UNSIGNED NOT NULL COMMENT 'идентификатор',
  `name` text DEFAULT NULL COMMENT 'название',
  `act` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'показывать на сайте: 0 - нет, 1 - да',
  `sort` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'подрядковый номер для сортировки',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Категории баннеров';

--
-- Дамп данных таблицы `diafan_bs_category`
--

INSERT INTO `diafan_bs_category` (`id`, `name`, `act`, `sort`, `trash`) VALUES
(1, 'Баннеры на главной', '1', 1, '0');

-- --------------------------------------------------------

--
-- Структура таблицы `diafan_bs_site_rel`
--

CREATE TABLE `diafan_bs_site_rel` (
  `id` int(11) UNSIGNED NOT NULL COMMENT 'идентификатор',
  `element_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор баннера из таблицы `diafan_bs_category`',
  `site_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор страницы сайта из таблицы `diafan_site`',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Данные о том, на каких страницах сайта выводятся баннеры';

--
-- Дамп данных таблицы `diafan_bs_site_rel`
--

INSERT INTO `diafan_bs_site_rel` (`id`, `element_id`, `site_id`, `trash`) VALUES
(1, 1, 1, '0'),
(2, 2, 0, '0');

-- --------------------------------------------------------

--
-- Структура таблицы `diafan_captcha_qa`
--

CREATE TABLE `diafan_captcha_qa` (
  `id` int(11) UNSIGNED NOT NULL COMMENT 'идентификатор',
  `name1` text DEFAULT NULL COMMENT 'текст вопроса',
  `act1` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'показывать на сайте: 0 - нет, 1 - да',
  `is_write` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'ответы не отображаются на сайте: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Вопросы для капчи типа Вопрос-ответ';

-- --------------------------------------------------------

--
-- Структура таблицы `diafan_captcha_qa_answers`
--

CREATE TABLE `diafan_captcha_qa_answers` (
  `id` int(11) UNSIGNED NOT NULL COMMENT 'идентификатор',
  `text1` text DEFAULT NULL COMMENT 'текст ответа',
  `is_right` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'ответ правильный: 0 - нет, 1 - да',
  `captcha_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор вопроса из таблицы `diafan_captcha`'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Варианты ответов для капчи типа Вопрос-ответ';

-- --------------------------------------------------------

--
-- Структура таблицы `diafan_clauses`
--

CREATE TABLE `diafan_clauses` (
  `id` int(11) UNSIGNED NOT NULL COMMENT 'идентификатор',
  `name1` text DEFAULT NULL COMMENT 'название',
  `act1` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'показывать на сайте: 0 - нет, 1 - да',
  `map_no_show` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'не показывать на карте сайта: 0 - нет, 1 - да',
  `changefreq` enum('always','hourly','daily','weekly','monthly','yearly','never') NOT NULL DEFAULT 'always' COMMENT 'Changefreq для sitemap.xml',
  `priority` varchar(3) NOT NULL DEFAULT '' COMMENT 'Priority для sitemap.xml',
  `noindex` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'не индексировать: 0 - нет, 1 - да',
  `created` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'дата создания',
  `date_start` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'дата начала показа',
  `date_finish` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'дата окончания показа',
  `cat_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор основной категории из таблицы `diafan_clauses_category`',
  `site_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор страницы сайта из таблицы `diafan_site`',
  `keywords1` varchar(250) NOT NULL DEFAULT '' COMMENT 'ключевые слова, тег Keywords',
  `descr1` text DEFAULT NULL COMMENT 'описание, тэг Description',
  `canonical1` varchar(100) NOT NULL DEFAULT '' COMMENT 'канонический тег',
  `title_meta1` varchar(250) NOT NULL DEFAULT '' COMMENT 'заголовок окна в браузере, тег Title',
  `anons1` text DEFAULT NULL COMMENT 'анонс',
  `anons_plus1` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'добавлять анонс к описанию: 0 - нет, 1 - да',
  `text1` longtext DEFAULT NULL COMMENT 'описание',
  `import` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'элемент только что импортирован: 0 - нет, 1 - да',
  `import_id` varchar(100) NOT NULL DEFAULT '' COMMENT 'собственный идентификатор элемента при импорте',
  `sort` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'подрядковый номер для сортировки',
  `timeedit` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'время последнего изменения в формате UNIXTIME',
  `admin_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'пользователь из таблицы `diafan_users`, добавивший или первый отредктировавший статью в административной части',
  `access` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'доступ ограничен: 0 - нет, 1 - да',
  `theme` varchar(50) NOT NULL DEFAULT '' COMMENT 'шаблон страницы сайта',
  `view` varchar(50) NOT NULL DEFAULT '' COMMENT 'шаблон модуля',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Статьи';

-- --------------------------------------------------------

--
-- Структура таблицы `diafan_clauses_category`
--

CREATE TABLE `diafan_clauses_category` (
  `id` int(11) UNSIGNED NOT NULL COMMENT 'идентификатор',
  `name1` text DEFAULT NULL COMMENT 'название',
  `act1` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'показывать на сайте: 0 - нет, 1 - да',
  `map_no_show` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'не показывать на карте сайта: 0 - нет, 1 - да',
  `changefreq` enum('always','hourly','daily','weekly','monthly','yearly','never') NOT NULL DEFAULT 'always' COMMENT 'Changefreq для sitemap.xml',
  `priority` varchar(3) NOT NULL DEFAULT '' COMMENT 'Priority для sitemap.xml',
  `noindex` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'не индексировать: 0 - нет, 1 - да',
  `parent_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор родителя из таблицы `diafan_clauses_category`',
  `count_children` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'количество вложенных категорий',
  `site_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор страницы сайта из таблицы `diafan_site`',
  `keywords1` varchar(250) NOT NULL DEFAULT '' COMMENT 'ключевые слова, тег Keywords',
  `descr1` text DEFAULT NULL COMMENT 'описание, тэг Description',
  `canonical1` varchar(100) NOT NULL DEFAULT '' COMMENT 'канонический тег',
  `title_meta1` varchar(250) NOT NULL DEFAULT '' COMMENT 'заголовок окна в браузере, тег Title',
  `anons1` text DEFAULT NULL COMMENT 'анонс',
  `anons_plus1` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'добавлять анонс к описанию: 0 - нет, 1 - да',
  `text1` text DEFAULT NULL COMMENT 'описание',
  `import` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'категория только что импортирован: 0 - нет, 1 - да',
  `import_id` varchar(100) NOT NULL DEFAULT '' COMMENT 'собственный идентификатор категории при импорте',
  `sort` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'подрядковый номер для сортировки',
  `timeedit` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'время последнего изменения в формате UNIXTIME',
  `admin_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'пользователь из таблицы `diafan_users`, добавивший или первый отредктировавший категорию в административной части',
  `access` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'доступ ограничен: 0 - нет, 1 - да',
  `theme` varchar(50) NOT NULL DEFAULT '' COMMENT 'шаблон страницы сайта',
  `view` varchar(50) NOT NULL DEFAULT '' COMMENT 'шаблон модуля',
  `view_rows` varchar(50) NOT NULL DEFAULT '' COMMENT 'шаблон модуля для элементов в списке категории',
  `view_element` varchar(50) NOT NULL DEFAULT '' COMMENT 'шаблон модуля для элементов в категории',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Категории статей';

-- --------------------------------------------------------

--
-- Структура таблицы `diafan_clauses_category_parents`
--

CREATE TABLE `diafan_clauses_category_parents` (
  `id` int(11) UNSIGNED NOT NULL COMMENT 'идентификатор',
  `element_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор категории из таблицы `diafan_clauses_category`',
  `parent_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор категории-родителя из таблицы `diafan_clauses_category`',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Родительские связи категорий статей';

-- --------------------------------------------------------

--
-- Структура таблицы `diafan_clauses_category_rel`
--

CREATE TABLE `diafan_clauses_category_rel` (
  `id` int(11) UNSIGNED NOT NULL COMMENT 'идентификатор',
  `element_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор статьи из таблицы `diafan_clauses`',
  `cat_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор категории из таблицы `diafan_clauses_category`',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Связи статей и категорий';

-- --------------------------------------------------------

--
-- Структура таблицы `diafan_clauses_counter`
--

CREATE TABLE `diafan_clauses_counter` (
  `id` int(11) UNSIGNED NOT NULL COMMENT 'идентификатор',
  `element_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор статьи из таблицы `diafan_clauses`',
  `count_view` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'количество просмотров',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Счетчик просмотров статей';

-- --------------------------------------------------------

--
-- Структура таблицы `diafan_clauses_rel`
--

CREATE TABLE `diafan_clauses_rel` (
  `id` int(11) UNSIGNED NOT NULL COMMENT 'идентификатор',
  `element_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор статьи из таблицы `diafan_clauses`',
  `rel_element_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор связанной статьи из таблицы `diafan_clauses`',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Связи похожих статей';

-- --------------------------------------------------------

--
-- Структура таблицы `diafan_comments`
--

CREATE TABLE `diafan_comments` (
  `id` int(11) UNSIGNED NOT NULL COMMENT 'идентификатор',
  `user_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор пользователя из таблицы `diafan_users`',
  `text` text DEFAULT NULL COMMENT 'текст комментария',
  `act` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'показывать на сайте: 0 - нет, 1 - да',
  `created` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'дата создания',
  `module_name` varchar(50) NOT NULL DEFAULT '' COMMENT 'название модуля',
  `element_type` enum('element','cat') NOT NULL DEFAULT 'element' COMMENT 'тип элемента модуля',
  `element_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор элемента модуля',
  `parent_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор родителя из таблицы `diafan_comments`',
  `count_children` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'количество вложенных комментариев',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Комментарии';

-- --------------------------------------------------------

--
-- Структура таблицы `diafan_comments_mail`
--

CREATE TABLE `diafan_comments_mail` (
  `id` int(11) UNSIGNED NOT NULL COMMENT 'идентификатор',
  `mail` varchar(64) NOT NULL DEFAULT '' COMMENT 'e-mail пользователя',
  `module_name` varchar(50) NOT NULL DEFAULT '' COMMENT 'название модуля',
  `element_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор элемента модуля',
  `element_type` enum('element','cat') NOT NULL DEFAULT 'element' COMMENT 'тип элемента модуля',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Подписка пользователей на новые комментарии';

-- --------------------------------------------------------

--
-- Структура таблицы `diafan_comments_param`
--

CREATE TABLE `diafan_comments_param` (
  `id` int(11) UNSIGNED NOT NULL COMMENT 'идентификатор',
  `name1` varchar(250) NOT NULL DEFAULT '' COMMENT 'название',
  `type` varchar(20) NOT NULL DEFAULT '' COMMENT 'тип',
  `module_name` varchar(50) NOT NULL DEFAULT '' COMMENT 'название модуля',
  `sort` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'подрядковый номер для сортировки',
  `required` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'обязательно для заполнения: 0 - нет, 1 - да',
  `show_in_list` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'показывать в списке: 0 - нет, 1 - да',
  `show_in_form_auth` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'показывать в форме авторизованным пользователям: 0 - нет, 1 - да',
  `show_in_form_no_auth` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'показывать в списке: 0 - нет, 1 - да',
  `text1` text DEFAULT NULL COMMENT 'описание',
  `config` text DEFAULT NULL COMMENT 'серилизованные настройки поля',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Дополнительные поля комментариев';

--
-- Дамп данных таблицы `diafan_comments_param`
--

INSERT INTO `diafan_comments_param` (`id`, `name1`, `type`, `module_name`, `sort`, `required`, `show_in_list`, `show_in_form_auth`, `show_in_form_no_auth`, `text1`, `config`, `trash`) VALUES
(1, 'Имя', 'text', '', 1, '1', '1', '0', '1', NULL, NULL, '0');

-- --------------------------------------------------------

--
-- Структура таблицы `diafan_comments_param_element`
--

CREATE TABLE `diafan_comments_param_element` (
  `id` int(11) UNSIGNED NOT NULL COMMENT 'идентификатор',
  `value` text DEFAULT NULL COMMENT 'значение',
  `param_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор характеристики из таблицы `diafan_comments_param`',
  `element_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор комментария из таблицы `diafan_comments`',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Значения дополнительных полей комментариев';

-- --------------------------------------------------------

--
-- Структура таблицы `diafan_comments_param_select`
--

CREATE TABLE `diafan_comments_param_select` (
  `id` int(11) UNSIGNED NOT NULL COMMENT 'идентификатор',
  `param_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор характеристики из таблицы `diafan_comments_param`',
  `name1` varchar(50) NOT NULL DEFAULT '' COMMENT 'значение',
  `value` varchar(1) NOT NULL DEFAULT '' COMMENT 'значение для типа характеристики «галочка»: 0 - нет, 1 - да',
  `sort` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'подрядковый номер для сортировки',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Варианты значения дополнительных полей комментариев с типом список';

-- --------------------------------------------------------

--
-- Структура таблицы `diafan_comments_parents`
--

CREATE TABLE `diafan_comments_parents` (
  `id` int(11) UNSIGNED NOT NULL COMMENT 'идентификатор',
  `element_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор комментария из таблицы `diafan_comments`',
  `parent_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор родителя комментария из таблицы `diafan_comments`',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Родительские связи комментариев';

-- --------------------------------------------------------

--
-- Структура таблицы `diafan_config`
--

CREATE TABLE `diafan_config` (
  `id` smallint(5) UNSIGNED NOT NULL COMMENT 'идентификатор',
  `module_name` varchar(50) NOT NULL DEFAULT '' COMMENT 'название модуля',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT 'название настройки',
  `lang_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор языка сайта из таблицы `diafan_languages`',
  `value` text DEFAULT NULL COMMENT 'значение',
  `site_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор страницы сайта из таблицы `diafan_site`'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Настройки модулей';

--
-- Дамп данных таблицы `diafan_config`
--

INSERT INTO `diafan_config` (`id`, `module_name`, `name`, `lang_id`, `value`, `site_id`) VALUES
(1, 'route', 'method', 0, '1', 0),
(2, 'route', 'translit_array', 0, ' |а|б|в|г|д|е|ё|ж|з|и|й|к|л|м|н|о|п|р|с|т|у|ф|х|ц|ч|ш|щ|ы|э|ю|я|А|Б|В|Г|Д|Е|Ё|Ж|З|И|Й|К|Л|М|Н|О|П|Р|С|Т|У|Ф|Х|Ц|Ч|Ш|Щ|Ы|Э|Ю|Я````-|a|b|v|g|d|e|yo|zh|z|i|y|k|l|m|n|o|p|r|s|t|u|f|kh|ts|ch|sh|sch|y|e|yu|ya|A|B|V|G|D|E|YO|ZH|Z|I|Y|K|L|M|N|O|P|R|S|T|U|F|KH|TS|CH|SH|SCH|Y|E|YU|YA', 0),
(3, 'service', 'express_preview_enable', 0, '1', 0),
(4, 'service', 'express_count_part', 0, '1000', 0),
(5, 'editor', 'images_variations_element', 0, 'a:1:{i:0;a:1:{s:2:\"id\";s:1:\"2\";}}', 0),
(6, 'images', 'hash_compare', 0, '1', 0),
(7, 'site', 'use_animation', 0, '1', 0),
(8, 'site', 'images_variations', 0, 'a:2:{i:0;a:2:{s:4:\"name\";s:6:\"medium\";s:2:\"id\";i:1;}i:1;a:2:{s:4:\"name\";s:5:\"large\";s:2:\"id\";i:3;}}', 0),
(9, 'core', 'trial', 0, '1588491037', 0),
(10, 'htmleditor', 'hide_site_blocks_1', 1, 'text', 0),
(11, 'ab', 'images_element', 0, '1', 0),
(12, 'ab', 'use_animation', 0, '1', 0),
(13, 'ab', 'list_img_element', 0, '1', 0),
(14, 'ab', 'count_list', 0, '3', 0),
(15, 'ab', 'count_child_list', 0, '2', 0),
(16, 'ab', 'counter', 0, '1', 0),
(17, 'ab', 'nastr', 0, '10', 0),
(18, 'ab', 'nastr_cat', 0, '10', 0),
(19, 'ab', 'children_elements', 0, '1', 0),
(20, 'ab', 'rel_two_sided', 0, '1', 0),
(21, 'ab', 'add_message', 0, 'Объявление успешно добавлено.', 0),
(22, 'ab', 'subject_admin', 0, 'Новое объявление на сайте %title (%url)', 0),
(23, 'ab', 'message_admin', 0, 'Здравствуйте, администратор сайта %title (%url)!<br>В рубрике Объявления появилось новое объявление:<br>%message', 0),
(24, 'ab', 'images_variations_element', 0, 'a:2:{i:0;a:2:{s:4:\"name\";s:6:\"medium\";s:2:\"id\";i:1;}i:1;a:2:{s:4:\"name\";s:5:\"large\";s:2:\"id\";i:3;}}', 0),
(25, 'ab', 'form_name', 0, '1', 0),
(26, 'ab', 'form_anons', 0, '1', 0),
(27, 'ab', 'form_text', 0, '1', 0),
(28, 'ab', 'form_date_finish', 0, '1', 0),
(29, 'ab', 'form_images', 0, '1', 0),
(30, 'ab', 'captcha', 0, 'a:1:{i:0;s:1:\"0\";}', 0),
(31, 'ab', 'comments', 0, '1', 0),
(32, 'ab', 'cat', 0, '1', 0),
(33, 'ab', 'rating', 0, '1', 0),
(34, 'ab', 'show_more', 0, '1', 0),
(35, 'balance', 'mes', 0, 'Для продолжения процедуры пополнения баланса, требуется его оплатить.', 0),
(36, 'balance', 'subject', 0, 'Вы пополнили баланс на сайте %title (%url).', 0),
(37, 'balance', 'message', 0, 'Здравствуйте!<br>Вы пополнили баланс на сайте %title (%url):<br><br>Способ оплаты: %payment<br>Номер платежа: %id', 0),
(38, 'balance', 'subject_admin', 0, '%title (%url). Пополненение баланса', 0),
(39, 'balance', 'message_admin', 0, 'Здравствуйте, администратор сайта %title (%url)!<br>На сайте произведено пополнение баланса пользователя.<br>Способ оплаты: %payment<br>Номер счета: %id', 0),
(40, 'balance', 'desc_payment', 0, 'Popolnenie balanca #%id', 0),
(41, 'balance', 'payment_success_text', 0, '<p>Спасибо, платеж успешно принят. Деньги зачислены на счет.</p>', 0),
(42, 'balance', 'payment_fail_text', 0, '<p>Извините, платеж не прошел.</p>', 0),
(43, 'balance', 'currency', 0, 'руб.', 0),
(44, 'bs', 'cat', 0, '1', 0),
(45, 'captcha', 'backend', 0, 'kcaptcha', 0),
(46, 'clauses', 'images_element', 0, '1', 0),
(47, 'clauses', 'list_img_element', 0, '1', 0),
(48, 'clauses', 'use_animation', 0, '1', 0),
(49, 'clauses', 'format_date', 0, '2', 0),
(50, 'clauses', 'nastr', 0, '10', 0),
(51, 'clauses', 'nastr_cat', 0, '10', 0),
(52, 'clauses', 'count_list', 0, '3', 0),
(53, 'clauses', 'count_child_list', 0, '2', 0),
(54, 'clauses', 'children_elements', 0, '1', 0),
(55, 'clauses', 'counter', 0, '1', 0),
(56, 'clauses', 'images_variations_element', 0, 'a:2:{i:0;a:2:{s:4:\"name\";s:6:\"medium\";s:2:\"id\";i:1;}i:1;a:2:{s:4:\"name\";s:5:\"large\";s:2:\"id\";i:3;}}', 0),
(57, 'clauses', 'cat', 0, '1', 0),
(58, 'clauses', 'comments', 0, '1', 0),
(59, 'clauses', 'show_more', 0, '1', 0),
(60, 'comments', 'captcha', 0, 'a:1:{i:0;s:1:\"0\";}', 0),
(61, 'comments', 'format_date', 0, '5', 0),
(62, 'comments', 'user_name', 0, '1', 0),
(63, 'comments', 'error_insert_message', 0, 'Ваше сообщение уже имеется в базе.', 0),
(64, 'comments', 'add_message', 0, 'Спасибо! Ваш комментарий будет проверен в ближайшее время и появится на сайте.', 0),
(65, 'comments', 'count_level', 0, '7', 0),
(66, 'comments', 'nastr', 0, '10', 0),
(67, 'comments', 'security_moderation', 0, '1', 0),
(68, 'comments', 'use_mail', 0, '0', 0),
(69, 'comments', 'subject', 0, 'Новый комментарий на сайте %title (%url)', 0),
(70, 'comments', 'message', 0, 'Здравствуйте! Вы подписались на комментарии на сайте %title (%url).<br>На странице появился <a href=\"%link\">новый комментарий</a>:<br>%message<br><br>Отписаться можете по <a href=\"%actlink\">ссылке</a>.', 0),
(71, 'comments', 'sendmailadmin', 0, '1', 0),
(72, 'comments', 'subject_admin', 0, '%title (%url). Новый комментарий', 0),
(73, 'comments', 'message_admin', 0, 'Здравствуйте, администратор сайта %title (%url)! На странице <a href=\"%urlpage\">%urlpage</a> появился новый комментарий: %message', 0),
(74, 'faq', 'comments', 0, '1', 0),
(75, 'files', 'comments', 0, '1', 0),
(76, 'news', 'comments', 0, '1', 0),
(77, 'photo', 'comments', 0, '1', 0),
(78, 'photo', 'comments_cat', 0, '1', 0),
(80, 'comments', 'show_more', 0, '1', 0),
(82, 'faq', 'security', 0, '2', 0),
(83, 'faq', 'format_date', 0, '1', 0),
(84, 'faq', 'nastr', 0, '10', 0),
(85, 'faq', 'nastr_cat', 0, '10', 0),
(86, 'faq', 'count_list', 0, '3', 0),
(87, 'faq', 'count_child_list', 0, '1', 0),
(88, 'faq', 'counter', 0, '1', 0),
(89, 'faq', 'attachments', 0, '1', 0),
(90, 'faq', 'max_count_attachments', 0, '10', 0),
(91, 'faq', 'attachment_extensions', 0, 'doc, gif, jpg, jpeg, mpg, pdf, png, txt, zip', 0),
(92, 'faq', 'recognize_image', 0, '1', 0),
(93, 'faq', 'attach_big_width', 0, '500', 0),
(94, 'faq', 'attach_big_height', 0, '500', 0),
(95, 'faq', 'attach_big_quality', 0, '90', 0),
(96, 'faq', 'attach_medium_width', 0, '100', 0),
(97, 'faq', 'attach_medium_height', 0, '100', 0),
(98, 'faq', 'attach_medium_quality', 0, '90', 0),
(99, 'faq', 'sendmailadmin', 0, '1', 0),
(100, 'faq', 'count_letter_list', 0, '160', 0),
(101, 'faq', 'page_show', 0, '1', 0),
(102, 'faq', 'add_message', 0, '<div align=\"center\"><b>Спасибо за ваше сообщение!</b><br>Наш консультант подберет необходимую информацию, после чего ваш вопрос и ответ на него будут опубликованы на этой странице.</div>', 0),
(103, 'faq', 'error_insert_message', 0, 'Ваше сообщение уже имеется в базе.', 0),
(104, 'faq', 'subject', 0, '%title (%url). Вопрос-Ответ', 0),
(105, 'faq', 'message', 0, 'Здравствуйте, %name!<br>Вы задали вопрос на сайте %title (%url).<br><b>Вопрос:</b> %question <br><b>Ответ:</b> %answer', 0),
(106, 'faq', 'subject_admin', 0, '%title (%url). Новый вопрос в рубрике Вопрос-Ответ', 0),
(107, 'faq', 'message_admin', 0, 'Здравствуйте, администратор сайта %title (%url)!<br>В рубрике Вопрос-Ответ появился новый вопрос:<br>%question.<br>%name<br>%email<br>Прикреленные файлы: %files', 0),
(108, 'faq', 'rel_two_sided', 0, '1', 0),
(109, 'faq', 'show_more', 0, '1', 0),
(117, 'files', 'images_element', 0, '1', 0),
(118, 'files', 'list_img_element', 0, '1', 0),
(119, 'files', 'use_animation', 0, '1', 0),
(120, 'files', 'nastr', 0, '20', 0),
(121, 'files', 'nastr_cat', 0, '10', 0),
(122, 'files', 'count_list', 0, '3', 0),
(123, 'files', 'count_child_list', 0, '2', 0),
(124, 'files', 'children_elements', 0, '1', 0),
(125, 'files', 'counter', 0, '1', 0),
(126, 'files', 'attachment_extensions', 0, 'doc, gif, jpg, jpeg, mpg, pdf, png, txt, zip', 0),
(127, 'files', 'images_variations_element', 0, 'a:2:{i:0;a:2:{s:4:\"name\";s:6:\"medium\";s:2:\"id\";i:1;}i:1;a:2:{s:4:\"name\";s:5:\"large\";s:2:\"id\";i:3;}}', 0),
(128, 'files', 'rating', 0, '1', 0),
(129, 'files', 'show_more', 0, '1', 0),
(130, 'forum', 'news_count_days', 0, '3', 0),
(131, 'forum', 'count_level', 0, '7', 0),
(132, 'forum', 'max_count', 0, '50', 0),
(133, 'forum', 'format_date', 0, '5', 0),
(134, 'forum', 'nastr', 0, '30', 0),
(135, 'forum', 'attachments', 0, '1', 0),
(136, 'forum', 'max_count_attachments', 0, '5', 0),
(137, 'forum', 'attachment_extensions', 0, 'doc, gif, jpg, jpeg, mpg, pdf, png, txt, zip', 0),
(138, 'forum', 'recognize_image', 0, '1', 0),
(139, 'forum', 'attach_big_width', 0, '1000', 0),
(140, 'forum', 'attach_big_height', 0, '1000', 0),
(141, 'forum', 'attach_big_quality', 0, '90', 0),
(142, 'forum', 'attach_medium_width', 0, '100', 0),
(143, 'forum', 'attach_medium_height', 0, '100', 0),
(144, 'forum', 'attach_medium_quality', 0, '80', 0),
(145, 'forum', 'use_animation', 0, '1', 0),
(146, 'forum', 'show_more', 0, '1', 0),
(147, 'geomap', 'backend', 0, 'yandex', 0),
(148, 'geomap', 'yandex_zoom', 0, '13', 0),
(149, 'ab', 'geomap_element', 0, '1', 0),
(150, 'keywords', 'max', 0, '2', 0),
(151, 'site', 'keywords', 0, '1', 0),
(152, 'ab', 'keywords', 0, '1', 0),
(153, 'clauses', 'keywords', 0, '1', 0),
(154, 'faq', 'keywords', 0, '1', 0),
(155, 'files', 'keywords', 0, '1', 0),
(156, 'news', 'keywords', 0, '1', 0),
(157, 'photo', 'keywords', 0, '1', 0),
(159, 'news', 'images_element', 0, '1', 0),
(160, 'news', 'count_list', 0, '2', 0),
(161, 'news', 'count_child_list', 0, '2', 0),
(162, 'news', 'children_elements', 0, '1', 0),
(163, 'news', 'list_img_element', 0, '1', 0),
(164, 'news', 'use_animation', 0, '1', 0),
(165, 'news', 'format_date', 0, '2', 0),
(166, 'news', 'nastr', 0, '10', 0),
(167, 'news', 'nastr_cat', 0, '10', 0),
(168, 'news', 'rel_two_sided', 0, '1', 0),
(169, 'news', 'counter', 0, '1', 0),
(170, 'news', 'title_tpl', 0, '%name, %category', 0),
(171, 'news', 'keywords_tpl', 0, '%name %category', 0),
(172, 'news', 'images_variations_element', 0, 'a:2:{i:0;a:2:{s:4:\"name\";s:6:\"medium\";s:2:\"id\";i:1;}i:1;a:2:{s:4:\"name\";s:5:\"large\";s:2:\"id\";i:3;}}', 0),
(173, 'news', 'cat', 0, '1', 0),
(174, 'news', 'show_more', 0, '1', 0),
(175, 'photo', 'images_element', 0, '1', 0),
(176, 'photo', 'page_show', 0, '1', 0),
(177, 'photo', 'use_animation', 0, '1', 0),
(178, 'photo', 'count_list', 0, '1', 0),
(179, 'photo', 'count_child_list', 0, '1', 0),
(180, 'photo', 'children_elements', 0, '1', 0),
(181, 'photo', 'counter', 0, '1', 0),
(182, 'photo', 'nastr', 0, '10', 0),
(183, 'photo', 'nastr_cat', 0, '10', 0),
(184, 'photo', 'images_variations_element', 0, 'a:2:{i:0;a:2:{s:4:\"name\";s:6:\"medium\";s:2:\"id\";i:2;}i:1;a:2:{s:4:\"name\";s:5:\"large\";s:2:\"id\";i:3;}}', 0),
(185, 'photo', 'show_more', 0, '1', 0),
(186, 'postman', 'mail_prior', 0, '1', 0),
(187, 'postman', 'sms_prior', 0, '1', 0),
(188, 'postman', 'del_after_send', 0, '1', 0),
(189, 'postman', 'auto_send', 0, '1', 0),
(190, 'rating', 'security', 0, '4', 0),
(191, 'clauses', 'rating', 0, '1', 0),
(192, 'news', 'rating', 0, '1', 0),
(193, 'photo', 'rating', 0, '1', 0),
(195, 'reviews', 'captcha', 0, 'a:1:{i:0;s:1:\"0\";}', 0),
(196, 'reviews', 'format_date', 0, '5', 0),
(197, 'reviews', 'user_name', 0, '1', 0),
(198, 'reviews', 'add_message', 0, 'Спасибо за Ваш отзыв!', 0),
(199, 'reviews', 'count_level', 0, '7', 0),
(200, 'reviews', 'nastr', 0, '10', 0),
(201, 'reviews', 'security_moderation', 0, '1', 0),
(202, 'reviews', 'sendmailadmin', 0, '1', 0),
(203, 'reviews', 'subject_admin', 0, '%title (%url). Новый отзыв', 0),
(204, 'reviews', 'message_admin', 0, 'Здравствуйте, администратор сайта %title (%url)! На странице <a href=\"%urlpage\">%urlpage</a> появился новый отзыв: %message', 0),
(205, 'reviews', 'subject', 0, '%title (%url). Отзывы', 0),
(206, 'reviews', 'message', 0, 'Здравствуйте!<br>Вы оставили отзыв на сайте %title (%url).<br><b>Сообщение:</b> %message <br><b>Ответ:</b> %answer', 0),
(207, 'reviews', 'show_more', 0, '1', 0),
(208, 'search', 'nastr', 0, '10', 0),
(209, 'search', 'count_history', 0, '10', 0),
(210, 'search', 'show_more', 0, '1', 0),
(211, 'search', 'auto_index', 0, '1', 0),
(257, 'cashregister', 'auto_send', 0, '1', 0),
(258, 'cashregister', 'defer', 0, '1', 0),
(259, 'cashregister', 'status_presell', 0, '2', 0),
(260, 'cashregister', 'status_sell', 0, '4', 0),
(261, 'cashregister', 'status_refund', 0, '3', 0),
(263, 'subscription', 'captcha', 0, 'a:1:{i:0;s:1:\"0\";}', 0),
(264, 'subscription', 'subject', 0, 'Рассылка сайта %title (%url). %subject', 0),
(265, 'subscription', 'message', 0, 'Рассылка сайта %title (%url). %text Для изменения списка категорий рассылок пройдите <a href=\"%link\">по ссылке</a>.<br>Если Вы хотите отписаться от рассылки, пройдите <a href=\"%actlink\">по ссылке</a>.', 0),
(266, 'subscription', 'add_mail', 0, 'E-mail успешно добавлен. Вам отправлено уведомление.', 0),
(267, 'subscription', 'subject_user', 0, 'Подписка на рассылку с  сайта %title (%url)', 0),
(268, 'subscription', 'message_user', 0, 'Здравствуйте! Вы подписались на рассылку с сайта %title (%url).<br>Для изменения списка категорий рассылок пройдите <a href=\"%link\">по ссылке</a>.<br>Если Вы хотите отписаться от рассылки, пройдите <a href=\"%actlink\">по ссылке</a>.', 0),
(269, 'tags', 'nastr', 0, '10', 0),
(270, 'ab', 'tags', 0, '1', 0),
(271, 'clauses', 'tags', 0, '1', 0),
(272, 'faq', 'tags', 0, '1', 0),
(273, 'files', 'tags', 0, '1', 0),
(274, 'news', 'tags', 0, '1', 0),
(275, 'photo', 'tags', 0, '1', 0),
(277, 'tags', 'show_more', 0, '1', 0),
(278, 'update', 'hash', 0, '406341e3d3ea39345c59e3dffb9eedd0484ab155', 0),
(279, 'users', 'captcha', 0, 'a:1:{i:0;s:1:\"0\";}', 0),
(280, 'users', 'sendmailadmin', 0, '1', 0),
(281, 'users', 'act', 0, '1', 0),
(282, 'users', 'subject_admin', 0, '%title (%url). Новый пользователь', 0),
(283, 'users', 'message_admin', 0, 'Здравствуйте, администратор сайта %title (%url)!<br>На сайте появился новый пользователь: %fio (%login), %email.', 0),
(284, 'users', 'mes', 0, 'Вы удачно зарегистрированы. Для активации аккаунта пройдите по ссылке, высланной на ваш e-mail.', 0),
(285, 'users', 'subject', 0, 'Вы зарегистрированы на сайте %title (%url)', 0),
(286, 'users', 'message', 0, 'Здравствуйте, %fio!<br>Вы зарегистрированы на сайте %title (%url).<br>Логин: %login<br>Пароль: %password<br>Для активации аккаунта пройдите по <a href=\"%actlink\">ссылке</a>.<br>Ссылка действует в течение суток.', 0),
(287, 'users', 'subject_act', 0, 'Ваш аккаунт на сайте %title (%url) активирован администратором', 0),
(288, 'users', 'message_act', 0, 'Здравствуйте, %fio!<br>Ваш аккаунт на сайте %title (%url) активирован администратором.<br>Логин: %login', 0),
(289, 'users', 'mes_reminding', 0, 'На ваш e-mail отправлена ссылка на форму изменения пароля.', 0),
(290, 'users', 'subject_reminding', 0, 'Восстановление доступа к сайту %title (%url).', 0),
(291, 'users', 'message_reminding', 0, 'Здравствуйте, %fio!<br>Вы запросили восстановление доступа к сайту %title (%url).<br>Для изменения пароля пройдите <a href=\"%actlink\">по ссылке</a>.', 0),
(292, 'users', 'subject_reminding_new_pass', 0, 'Новый пароль на сайте %title (%url)', 0),
(293, 'users', 'message_reminding_new_pass', 0, 'Здравствуйте, %fio!<br>Вы изменили пароль на сайте %title (%url).<br>Логин: %login<br>Пароль: %password', 0),
(294, 'users', 'avatar', 0, '1', 0),
(295, 'users', 'avatar_width', 0, '50', 0),
(296, 'users', 'avatar_height', 0, '50', 0),
(297, 'users', 'avatar_quality', 0, '80', 0),
(298, 'visitors', 'counter_enable', 0, '1', 0),
(299, 'visitors', 'counter_defer', 0, '1', 0),
(300, 'votes', 'security', 0, '4', 0),
(301, 'map', 'full_index', 1, '0', 0),
(302, 'postman', 'email', 0, 'testservices92@gmail.com', 0),
(303, 'visitors', 'counter_timeedit_installed', 0, '1586763050', 0),
(304, 'visitors', 'counter_uid', 0, '5E01AC2D', 0),
(305, 'visitors', 'counter_active_interval', 0, '1440', 0),
(306, 'visitors', 'counter_delay_activity_user', 0, '900', 0),
(307, 'visitors', 'counter_delay_activity_bot', 0, '30', 0),
(308, 'visitors', 'counter_gc_timemarker', 0, '1586811540', 0),
(309, 'editor', 'images_timeedit', 1, '1586764043', 0),
(310, 'editor', 'images_max_size', 1, '70865', 0),
(311, 'editor', 'images_count', 1, '10', 0),
(312, 'route', 'translate_yandex_key', 0, '', 0),
(313, 'htmleditor', 'hide_bs_1', 1, 'text', 0),
(314, 'htmleditor', 'hide_bs_2', 1, 'text', 0),
(316, 'feedback', 'add_message', 1, '<div align=\"center\"><b>Спасибо за ваше сообщение!</b></div>', 0),
(317, 'feedback', 'subject', 1, '%title (%url). Обратная связь', 0),
(318, 'feedback', 'message', 1, 'Здравствуйте!<br>Вы оставили сообщение в форме обратной связи на сайте %title (%url).<br><b>Сообщение:</b> %message <br><b>Ответ:</b> %answer', 0),
(319, 'feedback', 'sendmailadmin', 0, '1', 0),
(320, 'feedback', 'subject_admin', 0, '%title (%url). Новое сообщение в рубрике Обратная связь', 0),
(321, 'feedback', 'message_admin', 0, 'Здравствуйте, администратор сайта %title (%url)!<br>В рубрике Обратная связь появилось новое сообщение:<br>%message', 0),
(322, 'feedback', 'admin_page', 0, '1', 0),
(323, 'feedback', 'sendsmsadmin', 1, '0', 0),
(324, 'executable', 'token', 0, 'd061a4f81b483ae50682e6b75f401228', 0),
(326, 'shop', 'use_count_goods', 0, '0', 0),
(327, 'shop', 'attachment_extensions', 0, 'zip, rar', 0),
(328, 'shop', 'attachments_access_admin', 0, '1', 0),
(329, 'shop', 'one_click', 0, '1', 0),
(330, 'shop', 'currency', 1, 'руб.', 0),
(331, 'shop', 'format_price_1', 0, '2', 0),
(332, 'shop', 'format_price_2', 0, ',', 0),
(333, 'shop', 'tax_name', 0, 'НДС', 0),
(334, 'shop', 'tax', 0, '20', 0),
(335, 'shop', 'order_redirect', 0, 'shop/cart/done', 0),
(336, 'shop', 'nastr', 0, '12', 0),
(337, 'shop', 'show_more', 0, '1', 0),
(338, 'shop', 'sort', 0, '0', 0),
(339, 'shop', 'rel_two_sided', 0, '1', 0),
(340, 'shop', 'cat', 0, '1', 0),
(341, 'shop', 'nastr_cat', 0, '10', 0),
(342, 'shop', 'count_list', 0, '4', 0),
(343, 'shop', 'count_child_list', 0, '4', 0),
(344, 'shop', 'search_price', 0, '1', 0),
(345, 'shop', 'search_article', 0, '1', 0),
(346, 'shop', 'comments', 0, '1', 0),
(347, 'shop', 'tags', 0, '1', 0),
(348, 'shop', 'rating', 0, '1', 0),
(349, 'shop', 'keywords', 0, '1', 0),
(350, 'shop', 'counter', 0, '1', 0),
(351, 'shop', 'images_variations_element', 0, 'a:3:{i:0;a:2:{s:4:\"name\";s:5:\"large\";s:2:\"id\";s:1:\"3\";}i:1;a:2:{s:4:\"name\";s:6:\"medium\";s:2:\"id\";s:1:\"1\";}i:2;a:2:{s:4:\"name\";s:7:\"preview\";s:2:\"id\";s:1:\"4\";}}', 0),
(352, 'shop', 'images_variations_cat', 0, 'a:2:{i:0;a:2:{s:4:\"name\";s:5:\"large\";s:2:\"id\";s:1:\"6\";}i:1;a:2:{s:4:\"name\";s:6:\"medium\";s:2:\"id\";s:1:\"6\";}}', 0),
(353, 'shop', 'images_variations_brand', 0, 'a:3:{i:0;a:2:{s:4:\"name\";s:5:\"large\";s:2:\"id\";s:1:\"3\";}i:1;a:2:{s:4:\"name\";s:6:\"medium\";s:2:\"id\";s:1:\"1\";}i:2;a:2:{s:4:\"name\";s:7:\"preview\";s:2:\"id\";s:1:\"4\";}}', 0),
(354, 'shop', 'use_animation', 0, '1', 0),
(355, 'shop', 'images_element', 0, '1', 0),
(356, 'shop', 'list_img_element', 0, '1', 0),
(357, 'shop', 'images_cat', 0, '1', 0),
(358, 'shop', 'list_img_cat', 0, '1', 0),
(359, 'shop', 'images_brand', 0, '1', 0),
(360, 'shop', 'yandex', 0, '1', 0),
(361, 'shop', 'nameshop', 0, 'ДИВ', 0),
(362, 'shop', 'currencyyandex', 0, 'RUR', 0),
(363, 'shop', 'show_yandex_category', 0, '0', 0),
(364, 'shop', 'show_yandex_element', 0, '0', 0),
(365, 'shop', 'bid', 0, '15', 0),
(366, 'shop', 'currency_google', 0, 'RUB', 0),
(367, 'shop', 'dimension_measure_google', 0, 'cm', 0),
(368, 'shop', 'weight_measure_google', 0, 'kg', 0),
(369, 'shop', 'show_google_category', 0, '0', 0),
(370, 'shop', 'show_google_element', 0, '0', 0),
(371, 'shop', 'subject_waitlist', 1, 'Товар поступил на склад', 0),
(372, 'shop', 'message_waitlist', 1, 'Здравствуйте!<br>Товар <a href=\"%link\">%good</a> поступил на склад.', 0),
(373, 'shop', 'mes', 1, 'Оплата заказа №%id на сумму %summ руб.', 0),
(374, 'shop', 'desc_payment', 1, 'Oplata zakaza #%id', 0),
(375, 'shop', 'payment_success_text', 1, '<p>Спасибо, платеж успешно принят. В ближайшее время мы с Вами свяжемся для уточнения деталей заказа.</p>', 0),
(376, 'shop', 'payment_fail_text', 1, '<p>Извините, платеж не прошел.</p>', 0),
(377, 'shop', 'subject', 1, 'Вы оформили заказ %id на сайте %title (%url)', 0),
(378, 'shop', 'message', 1, '<p>Здравствуйте!</p><p>Вы оформили заказ #%id на сайте %title (%url)</p>%order<p>Способ оплаты: %payment</p><p>%message</p><p>Спасибо за Ваш заказ! В ближайшее время мы с Вами свяжемся для подтверждения заказа</p>', 0),
(379, 'shop', 'subject_change_status', 1, 'Статус заказа изменен', 0),
(380, 'shop', 'message_change_status', 1, 'Здравствуйте!<br>Статус заказ №%order изменен на «%status».', 0),
(381, 'shop', 'subject_admin', 0, '%title (%url). Новый заказ %id', 0),
(382, 'shop', 'message_admin', 0, 'Здравствуйте, администратор сайта %title (%url)!<br>На сайте появился новый заказ номер %id: %order<br>Способ оплаты: %payment<br><br>%message', 0),
(383, 'shop', 'subject_file_sale_message', 1, 'Вы оформили заказ %id на сайте %title (%url)', 0),
(384, 'shop', 'file_sale_message', 1, 'Здравствуйте!<br>Вы оформили заказ на сайте %title (%url):<br><br>Номер заказа: %id<br>Файлы можно скачать по ссылкам в течение часа: %files<br><br>Спасибо за Ваш заказ!', 0),
(385, 'shop', 'subject_abandonmented_cart', 1, 'Вы забыли товары в корзине на сайте %title (%url)', 0),
(386, 'shop', 'message_abandonmented_cart', 1, 'Здравствуйте!<br>Вы наполнили корзину на сайте %title (%url):<br><br>Мы сохраним Вашу корзину и Вы в любой момент можете продолжить оформление заказа пройдя по ссылке: <a href=\"%link\">%link</a>. Но мы не обещаем, что все товары будут в наличии. Пожалуйста, поторопитесь оформить заказ пока товары не раскупили.<br>Вот Ваш заказ:<br>%goods', 0),
(387, 'shop', 'sendsmsadmin', 1, '0', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `diafan_crontab`
--

CREATE TABLE `diafan_crontab` (
  `id` int(11) UNSIGNED NOT NULL COMMENT 'идентификатор',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT 'название задачи',
  `text` text DEFAULT NULL COMMENT 'описание задачи',
  `datetime` varchar(21) NOT NULL DEFAULT '' COMMENT 'время выполнения в формате CRONTAB',
  `module_name` varchar(50) NOT NULL DEFAULT '' COMMENT 'название модуля',
  `method` varchar(50) NOT NULL DEFAULT '' COMMENT 'название метода',
  `params` varchar(250) NOT NULL DEFAULT '' COMMENT 'серилизованные параметры инициализации',
  `act` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'активное задание: 0 - нет, 1 - да',
  `sort` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'подрядковый номер для сортировки',
  `timeedit` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'время последнего изменения в формате UNIXTIME',
  `timeinit` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'время последней инициализации задачи в формате UNIXTIME',
  `result` text DEFAULT NULL COMMENT 'результат исполнения процесса',
  `errors` text DEFAULT NULL COMMENT 'ошибки при исполнении процесса',
  `content` text DEFAULT NULL COMMENT 'контент по результатам исполнения процесса',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Расписание задач';

-- --------------------------------------------------------

--
-- Структура таблицы `diafan_custom`
--

CREATE TABLE `diafan_custom` (
  `id` smallint(5) UNSIGNED NOT NULL COMMENT 'идентификатор',
  `addon_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор дополнения',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT 'название',
  `created` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'дата создания',
  `current` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'текущая тема: 0 - нет, 1 - да',
  `text` text DEFAULT NULL COMMENT 'описание'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Темы';

-- --------------------------------------------------------

--
-- Структура таблицы `diafan_executable`
--

CREATE TABLE `diafan_executable` (
  `master_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'главный идентификатор в формате UNIXTIME',
  `slave_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'вторичный идентификатор в интервале master_id',
  `id` varchar(21) NOT NULL DEFAULT '' COMMENT 'объединенный идентификатор',
  `created` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'дата создания',
  `timeedit` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'время последнего изменения в формате UNIXTIME',
  `module_name` varchar(50) NOT NULL DEFAULT '' COMMENT 'название модуля',
  `method` varchar(50) NOT NULL DEFAULT '' COMMENT 'название метода',
  `params` text DEFAULT NULL COMMENT 'серилизованные параметры инициализации',
  `text` text DEFAULT NULL COMMENT 'описание процесса',
  `is_admin` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'статус: 0 - общая часть сайта, 1 - административная часть сайта',
  `rewrite` varchar(250) NOT NULL DEFAULT '' COMMENT 'псевдоссылка',
  `iteration` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'порядковый номер итерации',
  `max_iteration` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'максимальный номер итерации',
  `init_params` text DEFAULT NULL COMMENT 'серилизованные параметры первичной инициализации',
  `init_backtrace` text DEFAULT NULL COMMENT 'стек вызовов функций инициализации',
  `result` text DEFAULT NULL COMMENT 'результат исполнения процесса',
  `break` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'статус: 0 - процесс разрешён, 1 - процесс прерван',
  `status` enum('0','1','2','3') NOT NULL DEFAULT '0' COMMENT 'статус: 0 - ожидает инициализации, 1 - процесс выполнения, 2 - процесс завершен, 3 - ошибка во время выполнения',
  `forced` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'принудительное исполнение: 0 - нет, 1 - да',
  `prior` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'приоритет исполнения: 0 - без приоритета, 1 - приоритетно',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'считать запись мусором по завершению процесса: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Реестр фоновых процессов';

--
-- Дамп данных таблицы `diafan_executable`
--

INSERT INTO `diafan_executable` (`master_id`, `slave_id`, `id`, `created`, `timeedit`, `module_name`, `method`, `params`, `text`, `is_admin`, `rewrite`, `iteration`, `max_iteration`, `init_params`, `init_backtrace`, `result`, `break`, `status`, `forced`, `prior`, `trash`) VALUES
(1586774105, 1, '1586774105-1', 1586774105, 1586774105, 'postman', 'send', 'a:1:{s:2:\"id\";s:12:\"1586774105-1\";}', 'Отправка уведомления', '0', '', 0, 0, 'a:14:{s:7:\"created\";i:1586774105;s:8:\"timeedit\";i:1586774105;s:11:\"module_name\";s:7:\"postman\";s:6:\"method\";s:4:\"send\";s:6:\"params\";s:35:\"a:1:{s:2:\"id\";s:12:\"1586774105-1\";}\";s:4:\"text\";s:39:\"Отправка уведомления\";s:9:\"iteration\";i:0;s:13:\"max_iteration\";i:0;s:6:\"forced\";i:0;s:5:\"prior\";i:1;s:5:\"trash\";i:0;s:6:\"result\";s:0:\"\";s:6:\"status\";i:1;s:5:\"break\";i:0;}', '#0  Executable_inc->execute(Array ([module] => postman,[method] => send,[params] => Array ([id] => 1586774105-1),[text] => Отправка уведомления,[prior] => 1)) called at [F:OSPaneldomainsos-divmodulespostmanincpostman.inc.message.php:96]\n#1  Postman_inc_message->send(1586774105-1, 1) called at [F:OSPaneldomainsos-divmodulespostmanincpostman.inc.message.php:48]\n#2  Postman_inc_message->add_mail(testservices92@gmail.com, ДИВ (os-div). Новое сообщение в рубрике Обратная связь, Здравствуйте, администратор сайта ДИВ (os-div)!<br>В рубрике Обратная связь появилось новое сообщение:<br>Имя: test<br>Телефон: +3333 333 3333, testservices92@gmail.com) called at [F:OSPaneldomainsos-divmodulespostmanpostman.inc.php:64]\n#3  Postman_inc->__call(message_add_mail, Array ([0] => testservices92@gmail.com,[1] => ДИВ (os-div). Новое сообщение в рубрике Обратная связь,[2] => Здравствуйте, администратор сайта ДИВ (os-div)!<br>В рубрике Обратная связь появилось новое сообщение:<br>Имя: test<br>Телефон: +3333 333 3333,[3] => testservices92@gmail.com)) called at [F:OSPaneldomainsos-divmodulesfeedbackfeedback.action.php:160]\n#4  Feedback_action->send_mail() called at [F:OSPaneldomainsos-divmodulesfeedbackfeedback.action.php:60]\n#5  Feedback_action->add() called at [F:OSPaneldomainsos-divmodulesfeedbackfeedback.php:51]\n#6  Feedback->action() called at [F:OSPaneldomainsos-divincludesinit.php:706]\n#7  Init->module() called at [F:OSPaneldomainsos-divincludesinit.php:174]\n#8  Init->start() called at [F:OSPaneldomainsos-divindex.php:77]\n', '{\"result\":\"success\"}', '0', '2', '0', '1', '0');

-- --------------------------------------------------------

--
-- Структура таблицы `diafan_faq`
--

CREATE TABLE `diafan_faq` (
  `id` int(11) UNSIGNED NOT NULL COMMENT 'идентификатор',
  `name1` text DEFAULT NULL COMMENT 'название',
  `act1` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'показывать на сайте: 0 - нет, 1 - да',
  `map_no_show` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'не показывать на карте сайта: 0 - нет, 1 - да',
  `changefreq` enum('always','hourly','daily','weekly','monthly','yearly','never') NOT NULL DEFAULT 'always' COMMENT 'Changefreq для sitemap.xml',
  `priority` varchar(3) NOT NULL DEFAULT '' COMMENT 'Priority для sitemap.xml',
  `noindex` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'не индексировать: 0 - нет, 1 - да',
  `created` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'дата создания',
  `date_start` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'дата начала показа',
  `date_finish` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'дата окончания показа',
  `mail` varchar(40) NOT NULL DEFAULT '' COMMENT 'e-mail пользоваля, задавшего вопрос',
  `cat_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор основной категории из таблицы `diafan_faq_category`',
  `site_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор страницы сайта из таблицы `diafan_site`',
  `keywords1` varchar(250) NOT NULL DEFAULT '' COMMENT 'ключевые слова, тег Keywords',
  `descr1` text DEFAULT NULL COMMENT 'описание, тэг Description',
  `canonical1` varchar(100) NOT NULL DEFAULT '' COMMENT 'канонический тег',
  `title_meta1` varchar(250) NOT NULL DEFAULT '' COMMENT 'заголовок окна в браузере, тег Title',
  `anons1` text DEFAULT NULL COMMENT 'вопрос',
  `text1` text DEFAULT NULL COMMENT 'ответ',
  `often` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'часто задаваемый вопрос: 0 - нет, 1 - да',
  `timeedit` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'время последнего изменения в формате UNIXTIME',
  `access` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'доступ ограничен: 0 - нет, 1 - да',
  `user_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор пользователя из таблицы `diafan_users`',
  `admin_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'пользователь из таблицы `diafan_users`, добавивший или первый отредктировавший вопрос в административной части',
  `theme` varchar(50) NOT NULL DEFAULT '' COMMENT 'шаблон страницы сайта',
  `view` varchar(50) NOT NULL DEFAULT '' COMMENT 'шаблон модуля',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Вопросы и ответы';

-- --------------------------------------------------------

--
-- Структура таблицы `diafan_faq_category`
--

CREATE TABLE `diafan_faq_category` (
  `id` int(11) UNSIGNED NOT NULL COMMENT 'идентификатор',
  `name1` text DEFAULT NULL COMMENT 'название',
  `act1` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'показывать на сайте: 0 - нет, 1 - да',
  `map_no_show` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'не показывать на карте сайта: 0 - нет, 1 - да',
  `changefreq` enum('always','hourly','daily','weekly','monthly','yearly','never') NOT NULL DEFAULT 'always' COMMENT 'Changefreq для sitemap.xml',
  `priority` varchar(3) NOT NULL DEFAULT '' COMMENT 'Priority для sitemap.xml',
  `noindex` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'не индексировать: 0 - нет, 1 - да',
  `parent_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор родителя из таблицы `diafan_faq_category`',
  `count_children` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'количество вложенных категорий',
  `site_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор страницы сайта из таблицы `diafan_site`',
  `keywords1` varchar(250) NOT NULL DEFAULT '' COMMENT 'ключевые слова, тег Keywords',
  `descr1` text DEFAULT NULL COMMENT 'описание, тэг Description',
  `canonical1` varchar(100) NOT NULL DEFAULT '' COMMENT 'канонический тег',
  `title_meta1` varchar(250) NOT NULL DEFAULT '' COMMENT 'заголовок окна в браузере, тег Title',
  `anons1` text DEFAULT NULL COMMENT 'анонс',
  `anons_plus1` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'добавлять анонс к описанию: 0 - нет, 1 - да',
  `text1` text DEFAULT NULL COMMENT 'описание',
  `sort` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'подрядковый номер для сортировки',
  `timeedit` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'время последнего изменения в формате UNIXTIME',
  `access` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'доступ ограничен: 0 - нет, 1 - да',
  `admin_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'пользователь из таблицы `diafan_users`, добавивший или первый отредктировавший категорию в административной части',
  `theme` varchar(50) NOT NULL DEFAULT '' COMMENT 'шаблон страницы сайта',
  `view` varchar(50) NOT NULL DEFAULT '' COMMENT 'шаблон модуля',
  `view_rows` varchar(50) NOT NULL DEFAULT '' COMMENT 'шаблон модуля для элементов в списке категории',
  `view_element` varchar(50) NOT NULL DEFAULT '' COMMENT 'шаблон модуля для элементов в категории',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Категории вопросов и ответов';

-- --------------------------------------------------------

--
-- Структура таблицы `diafan_faq_category_parents`
--

CREATE TABLE `diafan_faq_category_parents` (
  `id` int(11) UNSIGNED NOT NULL COMMENT 'идентификатор',
  `element_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор категории из таблицы `diafan_faq_category`',
  `parent_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор категории-родителя из таблицы `diafan_faq_category`',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Родительские связи категорий вопросов и ответов';

-- --------------------------------------------------------

--
-- Структура таблицы `diafan_faq_category_rel`
--

CREATE TABLE `diafan_faq_category_rel` (
  `id` int(11) UNSIGNED NOT NULL COMMENT 'идентификатор',
  `element_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор вопроса из таблицы `diafan_faq`',
  `cat_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор категории из таблицы `diafan_faq_category`',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Связи вопросов и ответов с категориями';

-- --------------------------------------------------------

--
-- Структура таблицы `diafan_faq_counter`
--

CREATE TABLE `diafan_faq_counter` (
  `id` int(11) UNSIGNED NOT NULL COMMENT 'идентификатор',
  `element_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор вопроса из таблицы `diafan_faq`',
  `count_view` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'количество просмотров',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Счетчик вопросов и ответов';

-- --------------------------------------------------------

--
-- Структура таблицы `diafan_faq_rel`
--

CREATE TABLE `diafan_faq_rel` (
  `id` int(11) UNSIGNED NOT NULL COMMENT 'идентификатор',
  `element_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор вопроса из таблицы `diafan_faq`',
  `rel_element_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор похожего вопроса из таблицы `diafan_faq`',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Связи похожих вопросов и ответов';

-- --------------------------------------------------------

--
-- Структура таблицы `diafan_feedback`
--

CREATE TABLE `diafan_feedback` (
  `id` int(11) UNSIGNED NOT NULL COMMENT 'идентификатор',
  `created` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'дата создания',
  `site_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор страницы сайта из таблицы `diafan_site`',
  `lang_id` tinyint(2) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор языка сайта из таблицы `diafan_languages`',
  `text` text DEFAULT NULL COMMENT 'ответ',
  `user_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор пользователя из таблицы `diafan_users`',
  `admin_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'пользователь из таблицы `diafan_users`, добавивший или первый отредктировавший сообщение в административной части',
  `readed` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'сообщение прочитано: 0 - нет, 1 - да',
  `url` text DEFAULT NULL COMMENT 'страница, с которой отправлено сообщение',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Сообщения из обратной связи';

--
-- Дамп данных таблицы `diafan_feedback`
--

INSERT INTO `diafan_feedback` (`id`, `created`, `site_id`, `lang_id`, `text`, `user_id`, `admin_id`, `readed`, `url`, `trash`) VALUES
(1, 1586774105, 176, 1, NULL, 1, 0, '0', 'http://os-div/?587&amp;help=1', '0');

-- --------------------------------------------------------

--
-- Структура таблицы `diafan_feedback_param`
--

CREATE TABLE `diafan_feedback_param` (
  `id` int(11) UNSIGNED NOT NULL COMMENT 'идентификатор',
  `name1` varchar(250) NOT NULL DEFAULT '' COMMENT 'название',
  `type` varchar(20) NOT NULL DEFAULT '' COMMENT 'тип',
  `site_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор страницы сайта из таблицы `diafan_site`',
  `sort` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'подрядковый номер для сортировки',
  `required` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'обязательно для заполнения: 0 - нет, 1 - да',
  `text1` text DEFAULT NULL COMMENT 'описание',
  `config` text DEFAULT NULL COMMENT 'дополнительные настройки поля',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Поля конструктора формы обратной связи';

--
-- Дамп данных таблицы `diafan_feedback_param`
--

INSERT INTO `diafan_feedback_param` (`id`, `name1`, `type`, `site_id`, `sort`, `required`, `text1`, `config`, `trash`) VALUES
(1, 'Ваше имя', 'text', 155, 2, '0', NULL, NULL, '0'),
(2, 'Ваш e-mail', 'email', 155, 6, '0', NULL, NULL, '0'),
(3, 'Ваше сообщение', 'textarea', 155, 8, '0', NULL, NULL, '0'),
(4, 'Дата Вашего рождения', 'date', 155, 3, '0', NULL, NULL, '0'),
(5, 'Вы турист?', 'select', 155, 4, '0', NULL, NULL, '0'),
(6, 'Ваш телефон', 'phone', 155, 7, '0', NULL, NULL, '0'),
(7, 'Для связи', 'title', 155, 5, '0', NULL, NULL, '0'),
(8, 'О Вас', 'title', 155, 1, '0', NULL, NULL, '0'),
(9, 'Имя', 'text', 176, 9, '1', '', NULL, '0'),
(10, 'Телефон', 'phone', 176, 10, '1', '', NULL, '0');

-- --------------------------------------------------------

--
-- Структура таблицы `diafan_feedback_param_element`
--

CREATE TABLE `diafan_feedback_param_element` (
  `id` int(11) UNSIGNED NOT NULL COMMENT 'идентификатор',
  `value` text DEFAULT NULL COMMENT 'значение',
  `param_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор характеристики из таблицы `diafan_feedback_param`',
  `element_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор сообщения из таблицы `diafan_feedback`',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Значения полей конструктора формы обратной связи, заполненные в сообщении';

--
-- Дамп данных таблицы `diafan_feedback_param_element`
--

INSERT INTO `diafan_feedback_param_element` (`id`, `value`, `param_id`, `element_id`, `trash`) VALUES
(1, 'test', 9, 1, '0'),
(2, '+3333 333 3333', 10, 1, '0');

-- --------------------------------------------------------

--
-- Структура таблицы `diafan_feedback_param_select`
--

CREATE TABLE `diafan_feedback_param_select` (
  `id` int(11) UNSIGNED NOT NULL COMMENT 'идентификатор',
  `param_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор характеристики из таблицы `diafan_feedback_param`',
  `value` tinyint(2) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'значение для типа характеристики «галочка»: 0 - нет, 1 - да',
  `name1` varchar(50) NOT NULL DEFAULT '' COMMENT 'значение',
  `sort` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'подрядковый номер для сортировки',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Варианты значений полей конструктора с типом список';

--
-- Дамп данных таблицы `diafan_feedback_param_select`
--

INSERT INTO `diafan_feedback_param_select` (`id`, `param_id`, `value`, `name1`, `sort`, `trash`) VALUES
(1, 5, 0, 'Да', 1, '0'),
(2, 5, 0, 'Нет', 2, '0');

-- --------------------------------------------------------

--
-- Структура таблицы `diafan_files`
--

CREATE TABLE `diafan_files` (
  `id` int(11) UNSIGNED NOT NULL COMMENT 'идентификатор',
  `name1` text DEFAULT NULL COMMENT 'название',
  `act1` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'показывать на сайте: 0 - нет, 1 - да',
  `date_start` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'дата начала показа',
  `date_finish` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'дата окончания показа',
  `map_no_show` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'не показывать на карте сайта: 0 - нет, 1 - да',
  `changefreq` enum('always','hourly','daily','weekly','monthly','yearly','never') NOT NULL DEFAULT 'always' COMMENT 'Changefreq для sitemap.xml',
  `priority` varchar(3) NOT NULL DEFAULT '' COMMENT 'Priority для sitemap.xml',
  `noindex` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'не индексировать: 0 - нет, 1 - да',
  `cat_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор основной категории из таблицы `diafan_files_category`',
  `site_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор страницы сайта из таблицы `diafan_site`',
  `keywords1` varchar(250) NOT NULL DEFAULT '' COMMENT 'ключевые слова, тег Keywords',
  `descr1` text DEFAULT NULL COMMENT 'описание, тэг Description',
  `canonical1` varchar(100) NOT NULL DEFAULT '' COMMENT 'канонический тег',
  `title_meta1` varchar(250) NOT NULL DEFAULT '' COMMENT 'заголовок окна в браузере, тег Title',
  `anons1` text DEFAULT NULL COMMENT 'анонс',
  `anons_plus1` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'добавлять анонс к описанию: 0 - нет, 1 - да',
  `text1` text DEFAULT NULL COMMENT 'описание',
  `sort` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'подрядковый номер для сортировки',
  `timeedit` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'время последнего изменения в формате UNIXTIME',
  `access` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'доступ ограничен: 0 - нет, 1 - да',
  `admin_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'пользователь из таблицы `diafan_users`, добавивший или первый отредктировавший файл в административной части',
  `theme` varchar(50) NOT NULL DEFAULT '' COMMENT 'шаблон страницы сайта',
  `view` varchar(50) NOT NULL DEFAULT '' COMMENT 'шаблон модуля',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Файлы в файловом архиве';

-- --------------------------------------------------------

--
-- Структура таблицы `diafan_files_category`
--

CREATE TABLE `diafan_files_category` (
  `id` int(11) UNSIGNED NOT NULL COMMENT 'идентификатор',
  `name1` text DEFAULT NULL COMMENT 'название',
  `act1` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'показывать на сайте: 0 - нет, 1 - да',
  `map_no_show` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'не показывать на карте сайта: 0 - нет, 1 - да',
  `changefreq` enum('always','hourly','daily','weekly','monthly','yearly','never') NOT NULL DEFAULT 'always' COMMENT 'Changefreq для sitemap.xml',
  `priority` varchar(3) NOT NULL DEFAULT '' COMMENT 'Priority для sitemap.xml',
  `noindex` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'не индексировать: 0 - нет, 1 - да',
  `parent_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор родителя из таблицы `diafan_files_category`',
  `count_children` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'количество вложенных категорий',
  `site_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор страницы сайта из таблицы `diafan_site`',
  `keywords1` varchar(250) NOT NULL DEFAULT '' COMMENT 'ключевые слова, тег Keywords',
  `descr1` text DEFAULT NULL COMMENT 'описание, тэг Description',
  `canonical1` varchar(100) NOT NULL DEFAULT '' COMMENT 'канонический тег',
  `title_meta1` varchar(250) NOT NULL DEFAULT '' COMMENT 'заголовок окна в браузере, тег Title',
  `anons1` text DEFAULT NULL COMMENT 'анонс',
  `anons_plus1` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'добавлять анонс к описанию: 0 - нет, 1 - да',
  `text1` text DEFAULT NULL COMMENT 'описание',
  `sort` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'подрядковый номер для сортировки',
  `timeedit` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'время последнего изменения в формате UNIXTIME',
  `access` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'доступ ограничен: 0 - нет, 1 - да',
  `admin_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'пользователь из таблицы `diafan_users`, добавивший или первый отредктировавший категорию в административной части',
  `theme` varchar(50) NOT NULL DEFAULT '' COMMENT 'шаблон страницы сайта',
  `view` varchar(50) NOT NULL DEFAULT '' COMMENT 'шаблон модуля',
  `view_rows` varchar(50) NOT NULL DEFAULT '' COMMENT 'шаблон модуля для элементов в списке категории',
  `view_element` varchar(50) NOT NULL DEFAULT '' COMMENT 'шаблон модуля для элементов в категории',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Категории файлового архива';

-- --------------------------------------------------------

--
-- Структура таблицы `diafan_files_category_parents`
--

CREATE TABLE `diafan_files_category_parents` (
  `id` int(11) UNSIGNED NOT NULL COMMENT 'идентификатор',
  `element_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор категории из таблицы `diafan_files_category`',
  `parent_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор категории-родителя из таблицы `diafan_files_category`',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Родительские связи категорий файлового архива';

-- --------------------------------------------------------

--
-- Структура таблицы `diafan_files_category_rel`
--

CREATE TABLE `diafan_files_category_rel` (
  `id` int(11) UNSIGNED NOT NULL COMMENT 'идентификатор',
  `element_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор файла из таблицы `diafan_files`',
  `cat_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор категории из таблицы `diafan_files_category`',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Связи файлов и категорий в файловом архиве';

-- --------------------------------------------------------

--
-- Структура таблицы `diafan_files_counter`
--

CREATE TABLE `diafan_files_counter` (
  `id` int(11) UNSIGNED NOT NULL COMMENT 'идентификатор',
  `element_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор файла из таблицы `diafan_files`',
  `count_view` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'количество просмотров',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Счетчик просмотров файлов в файловом архиве';

-- --------------------------------------------------------

--
-- Структура таблицы `diafan_files_links`
--

CREATE TABLE `diafan_files_links` (
  `id` int(11) UNSIGNED NOT NULL COMMENT 'идентификатор',
  `element_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор файла из таблицы `diafan_files`',
  `link` varchar(255) NOT NULL DEFAULT '' COMMENT 'внешняя ссылка',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Внешние ссылки на файлы для файлового архива';

-- --------------------------------------------------------

--
-- Структура таблицы `diafan_files_rel`
--

CREATE TABLE `diafan_files_rel` (
  `id` int(11) UNSIGNED NOT NULL COMMENT 'идентификатор',
  `element_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор вопроса из таблицы `diafan_files`',
  `rel_element_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор связанного вопроса из таблицы `diafan_files`',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Связи похожих файлов';

-- --------------------------------------------------------

--
-- Структура таблицы `diafan_forum`
--

CREATE TABLE `diafan_forum` (
  `id` int(11) UNSIGNED NOT NULL COMMENT 'идентификатор',
  `user_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор пользователя из таблицы `diafan_users`',
  `cat_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор категории из таблицы `diafan_forum_category`',
  `created` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'дата создания',
  `name` varchar(250) NOT NULL DEFAULT '' COMMENT 'название',
  `date_update` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'дата редакции',
  `user_update` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор пользователя из таблицы `diafan_users`, отредактировавший сообщение',
  `timeedit` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'время последнего изменения в формате UNIXTIME',
  `counter_view` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'количество просмотров',
  `act` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'показывать на сайте: 0 - нет, 1 - да',
  `prior` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'тема закреплена: 0 - нет, 1 - да',
  `close` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'тема закрыта: 0 - нет, 1 - да',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Темы форума';

-- --------------------------------------------------------

--
-- Структура таблицы `diafan_forum_blocks`
--

CREATE TABLE `diafan_forum_blocks` (
  `id` smallint(5) UNSIGNED NOT NULL COMMENT 'идентификатор',
  `name` varchar(250) NOT NULL DEFAULT '' COMMENT 'название',
  `sort` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'подрядковый номер для сортировки',
  `act` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'показывать на сайте: 0 - нет, 1 - да',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Блоки форума';

--
-- Дамп данных таблицы `diafan_forum_blocks`
--

INSERT INTO `diafan_forum_blocks` (`id`, `name`, `sort`, `act`, `trash`) VALUES
(1, 'Главная категория форума', 1, '1', '0');

-- --------------------------------------------------------

--
-- Структура таблицы `diafan_forum_category`
--

CREATE TABLE `diafan_forum_category` (
  `id` int(11) UNSIGNED NOT NULL COMMENT 'идентификатор',
  `name` varchar(250) NOT NULL DEFAULT '' COMMENT 'название',
  `timeedit` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'время последнего изменения в формате UNIXTIME',
  `block_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор блока из таблицы `diafan_forum_blocks`',
  `counter_view` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'количество просмотров',
  `act` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'показывать на сайте: 0 - нет, 1 - да',
  `sort` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'подрядковый номер для сортировки',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Категории форума';

--
-- Дамп данных таблицы `diafan_forum_category`
--

INSERT INTO `diafan_forum_category` (`id`, `name`, `timeedit`, `block_id`, `counter_view`, `act`, `sort`, `trash`) VALUES
(1, 'Общий раздел', 1586763037, 1, 0, '1', 1, '0');

-- --------------------------------------------------------

--
-- Структура таблицы `diafan_forum_messages`
--

CREATE TABLE `diafan_forum_messages` (
  `id` int(11) UNSIGNED NOT NULL COMMENT 'идентификатор',
  `name` varchar(20) NOT NULL DEFAULT '' COMMENT 'название',
  `user_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор пользователя из таблицы `diafan_users`',
  `parent_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор родителя из таблицы `diafan_forum_messages`',
  `count_children` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'количество вложенных сообщений',
  `created` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'дата создания',
  `date_update` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'дата редакции',
  `user_update` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор пользователя из таблицы `diafan_users`, отредактировавший сообщение',
  `forum_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор темы из таблицы `diafan_forum`',
  `text` text DEFAULT NULL COMMENT 'описание',
  `act` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'показывать на сайте: 0 - нет, 1 - да',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Сообщения на форуме';

-- --------------------------------------------------------

--
-- Структура таблицы `diafan_forum_messages_parents`
--

CREATE TABLE `diafan_forum_messages_parents` (
  `id` int(11) UNSIGNED NOT NULL COMMENT 'идентификатор',
  `element_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор сообщения из таблицы `diafan_forum_messages`',
  `parent_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор родителя сообщения из таблицы `diafan_forum_messages`',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Родительские связи сообщений';

-- --------------------------------------------------------

--
-- Структура таблицы `diafan_forum_show`
--

CREATE TABLE `diafan_forum_show` (
  `id` int(11) UNSIGNED NOT NULL COMMENT 'идентификатор',
  `element_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор сообщения из таблицы `diafan_forum_messages`',
  `user_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор пользователя из таблицы `diafan_users`',
  `created` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'дата создания',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Новые сообщения и темы для пользователей';

-- --------------------------------------------------------

--
-- Структура таблицы `diafan_geomap`
--

CREATE TABLE `diafan_geomap` (
  `id` int(11) UNSIGNED NOT NULL COMMENT 'идентификатор',
  `element_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор элемента модуля',
  `module_name` varchar(50) NOT NULL DEFAULT '' COMMENT 'название модуля',
  `element_type` enum('element','cat') NOT NULL DEFAULT 'element' COMMENT 'тип элемента модуля',
  `point` text DEFAULT NULL COMMENT 'координаты точки',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Точки на карте';

-- --------------------------------------------------------

--
-- Структура таблицы `diafan_images`
--

CREATE TABLE `diafan_images` (
  `id` int(11) UNSIGNED NOT NULL COMMENT 'идентификатор',
  `image_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор изображения из таблицы `diafan_images`, если запись является ссылкой на изображение',
  `name` varchar(250) NOT NULL DEFAULT '' COMMENT 'название файла',
  `module_name` varchar(50) NOT NULL DEFAULT '' COMMENT 'название модуля',
  `element_type` enum('element','cat','brand') NOT NULL DEFAULT 'element' COMMENT 'тип элемента модуля',
  `element_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор элемента модуля',
  `alt1` varchar(250) NOT NULL DEFAULT '' COMMENT 'атрибут alt',
  `title1` varchar(250) NOT NULL DEFAULT '' COMMENT 'атрибут title',
  `param_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор поля или характеристики с типом «изображения»',
  `size` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'размер файла',
  `sort` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'подрядковый номер для сортировки',
  `tmpcode` varchar(32) NOT NULL DEFAULT '' COMMENT 'временный идентификатор, если изображение прикрепляется к еще не созданному элементу',
  `created` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'дата создания',
  `folder_num` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'номер папки',
  `hash` char(32) NOT NULL DEFAULT '' COMMENT 'хэш файла',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Прикрепленные изображения';

--
-- Дамп данных таблицы `diafan_images`
--

INSERT INTO `diafan_images` (`id`, `image_id`, `name`, `module_name`, `element_type`, `element_id`, `alt1`, `title1`, `param_id`, `size`, `sort`, `tmpcode`, `created`, `folder_num`, `hash`, `trash`) VALUES
(1, 0, '1_mekhanicheskie-ustroystva-up.png', 'shop', 'cat', 2, '', '', 0, 0, 1, '', 1586779787, 0, 'db89036d63a218b7292f9b9e82293033', '0'),
(2, 0, '2_korobki-otbora-moschnosti.png', 'shop', 'cat', 3, '', '', 0, 0, 2, '', 1586779808, 0, '221ccbb03effc52fa9fc83a315b42dd0', '0'),
(3, 0, '3_shesterenchatye-nasosy.png', 'shop', 'cat', 4, '', '', 0, 0, 3, '', 1586779817, 0, '08154772e029d84c2c8bd6f22856c39e', '0'),
(4, 0, '4_ruchnye-nasosy.png', 'shop', 'cat', 5, '', '', 0, 0, 4, '', 1586779827, 0, '12060879812b6832d22e2f998a209b06', '0'),
(5, 0, '5_gidravlicheskie-raspredeli.png', 'shop', 'cat', 6, '', '', 0, 0, 5, '', 1586779836, 0, 'ef7fb39b8d2395b9ee6db693306efa79', '0'),
(6, 0, '6_pnevmaticheskie-organy-upra.png', 'shop', 'cat', 7, '', '', 0, 0, 6, '', 1586779845, 0, 'aaacdd3e0b7efb9355097c059ad25935', '0'),
(7, 0, '7_porshnevye-nasosy.png', 'shop', 'cat', 8, '', '', 0, 0, 7, '', 1586779853, 0, '3caa7f77bccd90d8d0df95ae74edfd5b', '0'),
(8, 0, '8_emkostnoe-oborudovanie.png', 'shop', 'cat', 9, '', '', 0, 0, 8, '', 1586779866, 0, '38ace34671a9627f7dd9545262763594', '0');

-- --------------------------------------------------------

--
-- Структура таблицы `diafan_images_editor_folders`
--

CREATE TABLE `diafan_images_editor_folders` (
  `id` smallint(5) UNSIGNED NOT NULL COMMENT 'идентификатор',
  `parent_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор папки-родителя из таблицы `diafan_images_editor_folders`',
  `name` varchar(250) NOT NULL DEFAULT '' COMMENT 'название'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Папки изображений в плагине для визуального редактора';

-- --------------------------------------------------------

--
-- Структура таблицы `diafan_images_variations`
--

CREATE TABLE `diafan_images_variations` (
  `id` int(11) UNSIGNED NOT NULL COMMENT 'идентификатор',
  `name` varchar(250) NOT NULL DEFAULT '' COMMENT 'название',
  `folder` varchar(20) NOT NULL DEFAULT '' COMMENT 'название папки',
  `quality` tinyint(2) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'качество для изображений в формет JPEG',
  `param` text DEFAULT NULL COMMENT 'информация о применяемых действиях',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Варианты загрузки изображений';

--
-- Дамп данных таблицы `diafan_images_variations`
--

INSERT INTO `diafan_images_variations` (`id`, `name`, `folder`, `quality`, `param`, `trash`) VALUES
(1, 'Маленькое изображение (превью)', 'small', 90, 'a:1:{i:0;a:4:{s:4:\"name\";s:6:\"resize\";s:5:\"width\";i:180;s:6:\"height\";i:180;s:3:\"max\";i:0;}}', '0'),
(2, 'Среднее изображение', 'medium', 90, 'a:1:{i:0;a:4:{s:4:\"name\";s:6:\"resize\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:3:\"max\";i:0;}}', '0'),
(3, 'Большое изображение (полная версия)', 'large', 90, 'a:1:{i:0;a:4:{s:4:\"name\";s:6:\"resize\";s:5:\"width\";i:1200;s:6:\"height\";i:1200;s:3:\"max\";i:0;}}', '0'),
(4, 'Превью товара', 'preview', 90, 'a:1:{i:0;a:4:{s:4:\"name\";s:6:\"resize\";s:5:\"width\";s:3:\"113\";s:6:\"height\";s:3:\"113\";s:3:\"max\";i:0;}}', '0'),
(5, 'Аватар для отзывов', 'avatar', 90, 'a:2:{i:0;a:4:{s:4:\"name\";s:6:\"resize\";s:5:\"width\";s:2:\"50\";s:6:\"height\";s:2:\"50\";s:3:\"max\";i:1;}i:1;a:7:{s:4:\"name\";s:4:\"crop\";s:5:\"width\";s:2:\"50\";s:6:\"height\";s:2:\"50\";s:8:\"vertical\";s:3:\"top\";s:11:\"vertical_px\";s:0:\"\";s:10:\"horizontal\";s:4:\"left\";s:13:\"horizontal_px\";s:0:\"\";}}', '0'),
(6, 'Изображение категории в списке', 'cat_preview', 80, 'a:1:{i:0;a:4:{s:4:\"name\";s:6:\"resize\";s:5:\"width\";s:3:\"176\";s:6:\"height\";s:0:\"\";s:3:\"max\";i:1;}}', '0');

-- --------------------------------------------------------

--
-- Структура таблицы `diafan_inserts`
--

CREATE TABLE `diafan_inserts` (
  `id` int(11) UNSIGNED NOT NULL COMMENT 'идентификатор',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT 'название',
  `act1` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'показывать на сайте: 0 - нет, 1 - да',
  `prefix` enum('replace','before','after') NOT NULL DEFAULT 'replace' COMMENT 'размещение: replace - вместо, before - перед, after - после',
  `tag` varchar(255) NOT NULL DEFAULT '' COMMENT 'шаблонный тег',
  `text` text DEFAULT NULL COMMENT 'содержание вставки',
  `sort` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'подрядковый номер для сортировки',
  `date_start` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'дата начала показа',
  `date_finish` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'дата окончания показа',
  `timeedit` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'время последнего изменения в формате UNIXTIME',
  `admin_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'пользователь из таблицы `diafan_users`, добавивший или первый отредктировавший товар в административной части',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Вставки';

-- --------------------------------------------------------

--
-- Структура таблицы `diafan_inserts_site_rel`
--

CREATE TABLE `diafan_inserts_site_rel` (
  `id` int(11) UNSIGNED NOT NULL COMMENT 'идентификатор',
  `element_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор вставки из таблицы `diafan_inserts`',
  `site_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор страницы сайта из таблицы `diafan_site`',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Данные о том, на каких страницах выводятся вставки';

-- --------------------------------------------------------

--
-- Структура таблицы `diafan_keywords`
--

CREATE TABLE `diafan_keywords` (
  `id` int(11) UNSIGNED NOT NULL COMMENT 'идентификатор',
  `text` text DEFAULT NULL COMMENT 'ключевое слово',
  `link` text DEFAULT NULL COMMENT 'ссылка',
  `act1` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'показывать на сайте: 0 - нет, 1 - да',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Ключевые слова для перелинковки';

-- --------------------------------------------------------

--
-- Структура таблицы `diafan_languages`
--

CREATE TABLE `diafan_languages` (
  `id` tinyint(2) UNSIGNED NOT NULL COMMENT 'идентификатор',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT 'название',
  `shortname` varchar(10) NOT NULL DEFAULT '' COMMENT 'скоращенное название',
  `base_admin` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'язык является основным для административной части: 0 - нет, 1 - да',
  `base_site` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'язык является основным для пользовательской части: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Языки сайта';

--
-- Дамп данных таблицы `diafan_languages`
--

INSERT INTO `diafan_languages` (`id`, `name`, `shortname`, `base_admin`, `base_site`) VALUES
(1, 'ru', 'ru', '1', '1');

-- --------------------------------------------------------

--
-- Структура таблицы `diafan_languages_translate`
--

CREATE TABLE `diafan_languages_translate` (
  `id` int(11) UNSIGNED NOT NULL COMMENT 'идентификатор',
  `text` text DEFAULT NULL COMMENT 'описание',
  `text_translate` text DEFAULT NULL COMMENT 'перевод',
  `lang_id` tinyint(2) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор языка из таблицы `diafan_languages`',
  `module_name` varchar(50) NOT NULL DEFAULT '' COMMENT 'название модуля, для которого применим перевод',
  `type` enum('admin','site') NOT NULL DEFAULT 'admin' COMMENT 'часть сайта: admin - административная, site - пользовательская'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Перевод интерфейса';

-- --------------------------------------------------------

--
-- Структура таблицы `diafan_log`
--

CREATE TABLE `diafan_log` (
  `id` int(11) UNSIGNED NOT NULL COMMENT 'идентификатор',
  `ip` varchar(20) NOT NULL DEFAULT '' COMMENT 'IP-адрес пользователя',
  `created` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'дата в формате UNIXTIME',
  `count` int(11) UNSIGNED NOT NULL DEFAULT 1 COMMENT 'количество неудачных попыток',
  `info` text DEFAULT NULL COMMENT 'дополнительная информация'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Лог неудачных попыток авторизации';

-- --------------------------------------------------------

--
-- Структура таблицы `diafan_log_note`
--

CREATE TABLE `diafan_log_note` (
  `id` int(11) UNSIGNED NOT NULL COMMENT 'идентификатор',
  `module_name` varchar(50) NOT NULL DEFAULT '' COMMENT 'название модуля',
  `element_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор элемента модуля',
  `element_type` enum('element','cat') NOT NULL DEFAULT 'element' COMMENT 'тип элемента модуля',
  `note` int(7) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'оценка',
  `created` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'дата создания',
  `ip` varchar(62) NOT NULL DEFAULT '' COMMENT 'IP-адрес пользователя',
  `session_id` varchar(64) NOT NULL DEFAULT '' COMMENT 'идентификатор сессии из таблицы `diafan_sessions`',
  `include_name` varchar(10) NOT NULL DEFAULT '' COMMENT 'подключенный модуль'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Лог голосований и оценок';

-- --------------------------------------------------------

--
-- Структура таблицы `diafan_map_index`
--

CREATE TABLE `diafan_map_index` (
  `id` int(11) UNSIGNED NOT NULL COMMENT 'идентификатор',
  `url` text DEFAULT NULL COMMENT 'ссылка',
  `module_name` varchar(50) NOT NULL DEFAULT '' COMMENT 'название модуля',
  `element_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор элемента модуля',
  `element_type` enum('element','cat','param','brand') NOT NULL DEFAULT 'element' COMMENT 'тип элемента модуля',
  `timeedit` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'время последнего редактирования',
  `changefreq` enum('always','hourly','daily','weekly','monthly','yearly','never') NOT NULL DEFAULT 'always' COMMENT 'Changefreq',
  `priority` varchar(3) NOT NULL DEFAULT '' COMMENT 'Priority',
  `date_start` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'дата начала показа',
  `date_finish` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'дата окончания показа',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Индекс для файла sitemap.xml';

--
-- Дамп данных таблицы `diafan_map_index`
--

INSERT INTO `diafan_map_index` (`id`, `url`, `module_name`, `element_id`, `element_type`, `timeedit`, `changefreq`, `priority`, `date_start`, `date_finish`, `trash`) VALUES
(1, 'oplata-i-dostavkaROUTE_END', 'site', 173, 'element', 1586765880, 'monthly', '', 0, 0, '0'),
(4, 'shopROUTE_END', 'site', 164, 'element', 1586765913, 'always', '', 0, 0, '0'),
(5, 'obratnyy-zvonokROUTE_END', 'site', 176, 'element', 1586769400, 'monthly', '', 0, 0, '0'),
(6, 'shop/mekhanicheskie-ustroystva-upravleniyaROUTE_END', 'shop', 2, 'cat', 1586779795, 'monthly', '', 0, 0, '0'),
(7, 'shop/korobki-otbora-moschnostiROUTE_END', 'shop', 3, 'cat', 1586779809, 'monthly', '', 0, 0, '0'),
(8, 'shop/shesterenchatye-nasosyROUTE_END', 'shop', 4, 'cat', 1586779818, 'monthly', '', 0, 0, '0'),
(9, 'shop/ruchnye-nasosyROUTE_END', 'shop', 5, 'cat', 1586779828, 'monthly', '', 0, 0, '0'),
(10, 'shop/gidravlicheskie-raspredeliteliROUTE_END', 'shop', 6, 'cat', 1586779837, 'monthly', '', 0, 0, '0'),
(11, 'shop/pnevmaticheskie-organy-upravleniyaROUTE_END', 'shop', 7, 'cat', 1586779846, 'monthly', '', 0, 0, '0'),
(12, 'shop/porshnevye-nasosyROUTE_END', 'shop', 8, 'cat', 1586779854, 'monthly', '', 0, 0, '0'),
(13, 'shop/emkostnoe-oborudovanieROUTE_END', 'shop', 9, 'cat', 1586779869, 'monthly', '', 0, 0, '0'),
(14, '', 'site', 1, 'element', 1586780618, 'always', '', 0, 0, '0'),
(15, 'kontaktyROUTE_END', 'site', 175, 'element', 1586781991, 'monthly', '', 0, 0, '0'),
(17, 'o-kompaniiROUTE_END', 'site', 174, 'element', 1586783031, 'monthly', '', 0, 0, '0');

-- --------------------------------------------------------

--
-- Структура таблицы `diafan_menu`
--

CREATE TABLE `diafan_menu` (
  `id` int(11) UNSIGNED NOT NULL COMMENT 'идентификатор',
  `name1` varchar(100) NOT NULL DEFAULT '' COMMENT 'название',
  `module_name` varchar(50) NOT NULL DEFAULT '' COMMENT 'название модуля',
  `element_type` enum('element','cat','brand','param') NOT NULL DEFAULT 'element' COMMENT 'тип элемента модуля',
  `element_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор элемента модуля',
  `cat_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор меню из таблицы `diafan_menu_category`',
  `parent_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор пункта меню - родителя из таблицы `diafan_menu`',
  `count_children` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'количество вложенных пунтов',
  `othurl` varchar(250) NOT NULL DEFAULT '' COMMENT 'внешнаяя ссылка',
  `access` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'доступ ограничен: 0 - нет, 1 - да',
  `date_start` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'дата начала показа',
  `date_finish` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'дата окончания показа',
  `sort` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'подрядковый номер для сортировки',
  `act1` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'показывать на сайте: 0 - нет, 1 - да',
  `text1` varchar(255) NOT NULL DEFAULT '' COMMENT 'описание пункта меню',
  `attributes` varchar(250) NOT NULL DEFAULT '' COMMENT 'атрибуты ссылки',
  `target_blank` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'открывать в новом окне',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Пункты меню';

--
-- Дамп данных таблицы `diafan_menu`
--

INSERT INTO `diafan_menu` (`id`, `name1`, `module_name`, `element_type`, `element_id`, `cat_id`, `parent_id`, `count_children`, `othurl`, `access`, `date_start`, `date_finish`, `sort`, `act1`, `text1`, `attributes`, `target_blank`, `trash`) VALUES
(1, 'Полезное', 'site', 'element', 2, 1, 0, 6, '', '0', 0, 0, 2, '1', '', '', '0', '1'),
(2, 'О компании', 'site', 'element', 4, 1, 0, 3, '', '0', 0, 0, 1, '1', '', '', '0', '1'),
(3, 'Объявления', 'site', 'element', 151, 1, 1, 0, '', '0', 0, 0, 151, '1', '', '', '0', '1'),
(4, 'Статьи', 'site', 'element', 153, 1, 1, 0, '', '0', 0, 0, 153, '1', '', '', '0', '1'),
(5, 'Вопрос-Ответ', 'site', 'element', 154, 1, 2, 0, '', '0', 0, 0, 154, '1', '', '', '0', '1'),
(6, 'Обратная связь', 'site', 'element', 155, 1, 2, 0, '', '0', 0, 0, 155, '1', '', '', '0', '1'),
(7, 'Файловый архив', 'site', 'element', 156, 1, 1, 0, '', '0', 0, 0, 156, '1', '', '', '0', '1'),
(8, 'Форум', 'site', 'element', 157, 1, 1, 0, '', '0', 0, 0, 157, '1', '', '', '0', '1'),
(9, 'Новости', 'site', 'element', 160, 1, 1, 0, '', '0', 0, 0, 160, '1', '', '', '0', '1'),
(10, 'Фотогалерея', 'site', 'element', 161, 1, 1, 0, '', '0', 0, 0, 161, '1', '', '', '0', '1'),
(11, 'Отзывы', 'site', 'element', 162, 1, 2, 0, '', '0', 0, 0, 162, '1', '', '', '0', '1'),
(12, 'Наши товары', 'shop', 'cat', 1, 2, 0, 0, '', '0', 0, 0, 1, '1', '', '', '0', '1'),
(13, 'Оплата и доставка', 'site', 'element', 173, 1, 0, 0, '', '0', 0, 0, 173, '1', '', '', '0', '0'),
(14, 'О компании', 'site', 'element', 174, 1, 0, 0, '', '0', 0, 0, 174, '1', '', '', '0', '0'),
(15, 'Контакты', 'site', 'element', 175, 1, 0, 0, '', '0', 0, 0, 175, '1', '', '', '0', '0'),
(16, 'Каталог товаров', 'site', 'element', 164, 1, 0, 0, '', '0', 0, 0, 4, '1', '', '', '0', '0'),
(17, 'Механические устройства управления', 'shop', 'cat', 2, 2, 0, 0, '', '0', 0, 0, 2, '1', '', '', '0', '0'),
(18, 'Коробки отбора мощности', 'shop', 'cat', 3, 2, 0, 0, '', '0', 0, 0, 3, '1', '', '', '0', '0'),
(19, 'Шестеренчатые насосы', 'shop', 'cat', 4, 2, 0, 0, '', '0', 0, 0, 4, '1', '', '', '0', '0'),
(20, 'Ручные насосы', 'shop', 'cat', 5, 2, 0, 0, '', '0', 0, 0, 5, '1', '', '', '0', '0'),
(21, 'Гидравлические распределители', 'shop', 'cat', 6, 2, 0, 0, '', '0', 0, 0, 6, '1', '', '', '0', '0'),
(22, 'Пневматические органы управления', 'shop', 'cat', 7, 2, 0, 0, '', '0', 0, 0, 7, '1', '', '', '0', '0'),
(23, 'Поршневые насосы', 'shop', 'cat', 8, 2, 0, 0, '', '0', 0, 0, 8, '1', '', '', '0', '0'),
(24, 'Емкостное оборудование', 'shop', 'cat', 9, 2, 0, 0, '', '0', 0, 0, 9, '1', '', '', '0', '0');

-- --------------------------------------------------------

--
-- Структура таблицы `diafan_menu_category`
--

CREATE TABLE `diafan_menu_category` (
  `id` int(11) UNSIGNED NOT NULL COMMENT 'идентификатор',
  `name1` varchar(100) NOT NULL DEFAULT '' COMMENT 'название',
  `show_title` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'показывать заголовок: 0 - нет, 1 - да',
  `show_all_level` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'выводить сразу все уровни вложенности: 0 - нет, 1 - да',
  `hide_parent_link` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'не выводить ссылку, если есть вложенные пункты: 0 - нет, 1 - да',
  `act1` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'показывать на сайте: 0 - нет, 1 - да',
  `access` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'доступ ограничен: 0 - нет, 1 - да',
  `current_link` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'текущий пункт ссылкой: 0 - нет, 1 - да',
  `only_image` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'не отображать имя пункта меню, если используется изображние: 0 - нет, 1 - да',
  `menu_template` varchar(100) NOT NULL DEFAULT '' COMMENT 'шаблон вывода меню',
  `sort` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'подрядковый номер для сортировки',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Меню';

--
-- Дамп данных таблицы `diafan_menu_category`
--

INSERT INTO `diafan_menu_category` (`id`, `name1`, `show_title`, `show_all_level`, `hide_parent_link`, `act1`, `access`, `current_link`, `only_image`, `menu_template`, `sort`, `trash`) VALUES
(1, 'Меню верхнее', '0', '1', '0', '1', '0', '1', '0', '', 1, '0'),
(2, 'Меню интернет-магазин', '0', '0', '0', '1', '0', '0', '0', '', 2, '0');

-- --------------------------------------------------------

--
-- Структура таблицы `diafan_menu_category_site_rel`
--

CREATE TABLE `diafan_menu_category_site_rel` (
  `id` int(11) UNSIGNED NOT NULL COMMENT 'идентификатор',
  `element_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор пункта меню из таблицы `diafan_menu`',
  `site_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор страницы сайта из таблицы `diafan_site`',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Данные о том, на каких страницах сайта выводится меню';

--
-- Дамп данных таблицы `diafan_menu_category_site_rel`
--

INSERT INTO `diafan_menu_category_site_rel` (`id`, `element_id`, `site_id`, `trash`) VALUES
(1, 1, 0, '0'),
(2, 2, 0, '0');

-- --------------------------------------------------------

--
-- Структура таблицы `diafan_menu_parents`
--

CREATE TABLE `diafan_menu_parents` (
  `id` int(11) UNSIGNED NOT NULL COMMENT 'идентификатор',
  `element_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор пункта меню из таблицы `diafan_menu`',
  `parent_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор пункта меню - родителя из таблицы `diafan_menu`',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Родительские связи пунктов меню';

--
-- Дамп данных таблицы `diafan_menu_parents`
--

INSERT INTO `diafan_menu_parents` (`id`, `element_id`, `parent_id`, `trash`) VALUES
(1, 3, 1, '1'),
(2, 4, 1, '1'),
(3, 5, 2, '1'),
(4, 6, 2, '1'),
(5, 7, 1, '1'),
(6, 8, 1, '1'),
(7, 9, 1, '1'),
(8, 10, 1, '1'),
(9, 11, 2, '1');

-- --------------------------------------------------------

--
-- Структура таблицы `diafan_messages`
--

CREATE TABLE `diafan_messages` (
  `id` int(11) UNSIGNED NOT NULL COMMENT 'идентификатор',
  `author` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор пользователя из таблицы `diafan_users`, написавшего сообщение',
  `to_user` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор пользователя из таблицы `diafan_users` получателя сообщения',
  `text` text DEFAULT NULL COMMENT 'текст сообщения',
  `created` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'дата создания',
  `readed` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'сообщение прочитано: 0 - нет, 1 - да',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Личные сообщения пользователей';

-- --------------------------------------------------------

--
-- Структура таблицы `diafan_messages_user`
--

CREATE TABLE `diafan_messages_user` (
  `id` int(11) UNSIGNED NOT NULL COMMENT 'идентификатор',
  `user_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор пользователя из таблицы `diafan_users` кто инициировал контакт',
  `contact_user_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор пользователя из таблицы `diafan_users` с кем создан контакт',
  `date_update` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'дата последнего сообщения',
  `readed` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'все сообщения прочитаны: 0 - нет, 1 - да',
  `count_message` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'количество сообщений',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Контакты пользователей';

-- --------------------------------------------------------

--
-- Структура таблицы `diafan_mistakes`
--

CREATE TABLE `diafan_mistakes` (
  `id` int(11) UNSIGNED NOT NULL COMMENT 'идентификатор',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT 'ссылка на сайте',
  `created` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'дата создания',
  `selected_text` text DEFAULT NULL COMMENT 'выделенный текст с ошибкой',
  `comment` text DEFAULT NULL COMMENT 'комментарий пользователя'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Ошибки на сайте, добавленные пользователями';

-- --------------------------------------------------------

--
-- Структура таблицы `diafan_modules`
--

CREATE TABLE `diafan_modules` (
  `id` smallint(5) UNSIGNED NOT NULL COMMENT 'идентификатор',
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT 'название',
  `module_name` varchar(50) NOT NULL DEFAULT '' COMMENT 'название основного модуля',
  `site` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'используется на сайте: 0 - нет, 1 - да',
  `site_page` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'подключается к странице сайта: 0 - нет, 1 - да',
  `admin` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'используется в административной части: 0 - нет, 1 - да',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT 'название для пользователей'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Модули';

--
-- Дамп данных таблицы `diafan_modules`
--

INSERT INTO `diafan_modules` (`id`, `name`, `module_name`, `site`, `site_page`, `admin`, `title`) VALUES
(1, 'service', 'core', '1', '0', '1', 'Модули и БД'),
(2, 'admin', 'core', '0', '0', '1', 'Страницы админки'),
(3, 'config', 'core', '0', '0', '1', 'Параметры сайта'),
(4, 'images', 'core', '1', '0', '1', 'Изображения'),
(5, 'attachments', 'core', '1', '0', '1', 'Прикрепленные файлы'),
(6, 'menu', 'core', '1', '0', '1', 'Меню'),
(7, 'site', 'core', '1', '0', '1', 'Страницы сайта'),
(8, 'ab', 'ab', '1', '1', '1', 'Объявления'),
(9, 'account', 'core', '0', '0', '1', 'Кабинет пользователя'),
(10, 'addons', 'core', '0', '0', '1', 'Дополнения'),
(11, 'balance', 'balance', '1', '1', '1', 'Баланс пользователя'),
(12, 'bbcode', 'core', '1', '0', '0', 'Bbcode'),
(13, 'bs', 'bs', '1', '0', '1', 'Баннеры'),
(14, 'captcha', 'core', '1', '0', '1', 'Captcha'),
(15, 'clauses', 'clauses', '1', '1', '1', 'Статьи'),
(16, 'comments', 'comments', '1', '0', '1', 'Комментарии'),
(18, 'crontab', 'core', '0', '0', '1', 'Расписание задач'),
(19, 'custom', 'core', '1', '0', '1', 'Темы и дизайн'),
(20, 'dashboard', 'core', '0', '0', '1', 'События'),
(21, 'executable', 'core', '0', '0', '1', 'Фоновые процессы'),
(22, 'faq', 'faq', '1', '1', '1', 'Вопрос-Ответ'),
(23, 'feedback', 'feedback', '1', '1', '1', 'Обратная связь'),
(24, 'filemanager', 'filemanager', '0', '0', '1', 'Файловый менеджер'),
(25, 'files', 'files', '1', '1', '1', 'Файловый архив'),
(26, 'forum', 'forum', '1', '1', '1', 'Форум'),
(27, 'geomap', 'geomap', '1', '1', '1', 'Геокарта'),
(28, 'inserts', 'core', '1', '0', '1', 'Вставки'),
(29, 'keywords', 'keywords', '1', '0', '1', 'Перелинковка'),
(30, 'languages', 'core', '1', '0', '1', 'Языки сайта'),
(31, 'log', 'log', '0', '0', '1', 'Лог'),
(32, 'map', 'map', '1', '1', '0', 'Карта сайта'),
(33, 'messages', 'messages', '1', '1', '0', 'Личные сообщения'),
(34, 'mistakes', 'mistakes', '1', '0', '1', 'Ошибки на сайте'),
(35, 'news', 'news', '1', '1', '1', 'Новости'),
(36, 'paginator', 'core', '1', '0', '1', 'Постраничная навигация'),
(37, 'payment', 'payment', '1', '0', '1', 'Оплата'),
(38, 'photo', 'photo', '1', '1', '1', 'Фотогалерея'),
(39, 'postman', 'core', '1', '0', '1', 'Уведомления'),
(40, 'rating', 'rating', '1', '0', '1', 'Рейтинг'),
(41, 'reviews', 'reviews', '1', '0', '1', 'Отзывы'),
(42, 'search', 'search', '1', '1', '1', 'Поиск'),
(43, 'shop', 'shop', '1', '1', '1', 'Интернет-магазин'),
(44, 'cart', 'shop', '1', '1', '1', 'Корзина'),
(45, 'cashregister', 'shop', '1', '0', '1', 'Онлайн касса'),
(46, 'delivery', 'shop', '1', '0', '1', 'Служба доставки'),
(47, 'order', 'shop', '1', '0', '1', 'Заказы'),
(48, 'wishlist', 'shop', '1', '1', '0', 'Отложенные'),
(49, 'subscription', 'subscription', '1', '1', '1', 'Рассылки'),
(50, 'tags', 'tags', '1', '1', '1', 'Теги'),
(51, 'trash', 'core', '0', '0', '1', 'Корзина'),
(52, 'update', 'core', '1', '0', '1', 'Обновление DIAFAN.CMS'),
(53, 'useradmin', 'core', '1', '0', '1', 'Панель быстрого редактирования'),
(54, 'users', 'core', '1', '0', '1', 'Пользователи'),
(55, 'userpage', 'core', '1', '1', '0', 'Страница пользователя'),
(56, 'usersettings', 'core', '1', '1', '0', 'Настройки аккаунта'),
(57, 'registration', 'core', '1', '1', '0', 'Регистрация'),
(58, 'reminding', 'core', '1', '1', '0', 'Восстановление доступа'),
(59, 'visitors', 'visitors', '1', '0', '1', 'Посещаемость'),
(60, 'votes', 'votes', '1', '0', '1', 'Опросы');

-- --------------------------------------------------------

--
-- Структура таблицы `diafan_news`
--

CREATE TABLE `diafan_news` (
  `id` int(11) UNSIGNED NOT NULL COMMENT 'идентификатор',
  `name1` text DEFAULT NULL COMMENT 'название',
  `act1` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'показывать на сайте: 0 - нет, 1 - да',
  `map_no_show` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'не показывать на карте сайта: 0 - нет, 1 - да',
  `changefreq` enum('always','hourly','daily','weekly','monthly','yearly','never') NOT NULL DEFAULT 'always' COMMENT 'Changefreq для sitemap.xml',
  `priority` varchar(3) NOT NULL DEFAULT '' COMMENT 'Priority для sitemap.xml',
  `noindex` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'не индексировать: 0 - нет, 1 - да',
  `created` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'дата создания',
  `date_start` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'дата начала показа',
  `date_finish` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'дата окончания показа',
  `cat_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор основной категории из таблицы `diafan_news_category`',
  `site_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор страницы сайта из таблицы `diafan_site`',
  `keywords1` varchar(250) NOT NULL DEFAULT '' COMMENT 'ключевые слова, тег Keywords',
  `descr1` text DEFAULT NULL COMMENT 'описание, тэг Description',
  `canonical1` varchar(100) NOT NULL DEFAULT '' COMMENT 'канонический тег',
  `title_meta1` varchar(250) NOT NULL DEFAULT '' COMMENT 'заголовок окна в браузере, тег Title',
  `anons1` text DEFAULT NULL COMMENT 'анонс',
  `anons_plus1` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'добавлять анонс к описанию: 0 - нет, 1 - да',
  `text1` text DEFAULT NULL COMMENT 'описание',
  `prior` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'важно, всегда сверху: 0 - нет, 1 - да',
  `import` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'элемент только что импортирован: 0 - нет, 1 - да',
  `import_id` varchar(100) NOT NULL DEFAULT '' COMMENT 'собственный идентификатор элемента при импорте',
  `sort` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'подрядковый номер для сортировки',
  `timeedit` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'время последнего изменения в формате UNIXTIME',
  `admin_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'пользователь из таблицы `diafan_users`, добавивший или первый отредктировавший новость в административной части',
  `access` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'доступ ограничен: 0 - нет, 1 - да',
  `theme` varchar(50) NOT NULL DEFAULT '' COMMENT 'шаблон страницы сайта',
  `view` varchar(50) NOT NULL DEFAULT '' COMMENT 'шаблон модуля',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Новости';

-- --------------------------------------------------------

--
-- Структура таблицы `diafan_news_category`
--

CREATE TABLE `diafan_news_category` (
  `id` int(11) UNSIGNED NOT NULL COMMENT 'идентификатор',
  `name1` text DEFAULT NULL COMMENT 'название',
  `act1` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'показывать на сайте: 0 - нет, 1 - да',
  `map_no_show` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'не показывать на карте сайта: 0 - нет, 1 - да',
  `changefreq` enum('always','hourly','daily','weekly','monthly','yearly','never') NOT NULL DEFAULT 'always' COMMENT 'Changefreq для sitemap.xml',
  `priority` varchar(3) NOT NULL DEFAULT '' COMMENT 'Priority для sitemap.xml',
  `noindex` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'не индексировать: 0 - нет, 1 - да',
  `parent_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор родителя из таблицы `diafan_news_category`',
  `count_children` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'количество вложенных категорий',
  `site_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор страницы сайта из таблицы `diafan_site`',
  `keywords1` varchar(250) NOT NULL DEFAULT '' COMMENT 'ключевые слова, тег Keywords',
  `descr1` text DEFAULT NULL COMMENT 'описание, тэг Description',
  `canonical1` varchar(100) NOT NULL DEFAULT '' COMMENT 'канонический тег',
  `title_meta1` varchar(250) NOT NULL DEFAULT '' COMMENT 'заголовок окна в браузере, тег Title',
  `anons1` text DEFAULT NULL COMMENT 'анонс',
  `anons_plus1` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'добавлять анонс к описанию: 0 - нет, 1 - да',
  `text1` text DEFAULT NULL COMMENT 'описание',
  `import` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'категория только что импортирован: 0 - нет, 1 - да',
  `import_id` varchar(100) NOT NULL DEFAULT '' COMMENT 'собственный идентификатор категории при импорте',
  `sort` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'подрядковый номер для сортировки',
  `timeedit` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'время последнего изменения в формате UNIXTIME',
  `admin_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'пользователь из таблицы `diafan_users`, добавивший или первый отредктировавший категорию в административной части',
  `access` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'доступ ограничен: 0 - нет, 1 - да',
  `theme` varchar(50) NOT NULL DEFAULT '' COMMENT 'шаблон страницы сайта',
  `view` varchar(50) NOT NULL DEFAULT '' COMMENT 'шаблон модуля',
  `view_rows` varchar(50) NOT NULL DEFAULT '' COMMENT 'шаблон модуля для элементов в списке категории',
  `view_element` varchar(50) NOT NULL DEFAULT '' COMMENT 'шаблон модуля для элементов в категории',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Категории новостей';

-- --------------------------------------------------------

--
-- Структура таблицы `diafan_news_category_parents`
--

CREATE TABLE `diafan_news_category_parents` (
  `id` int(11) UNSIGNED NOT NULL COMMENT 'идентификатор',
  `element_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор категории из таблицы `diafan_news_category`',
  `parent_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор категории-родителя из таблицы `diafan_news_category`',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Родительские связи категорий новостей';

-- --------------------------------------------------------

--
-- Структура таблицы `diafan_news_category_rel`
--

CREATE TABLE `diafan_news_category_rel` (
  `id` int(11) UNSIGNED NOT NULL COMMENT 'идентификатор',
  `element_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор новости из таблицы `diafan_news`',
  `cat_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор категории из таблицы `diafan_news_category`',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Связи новостей и категорий';

-- --------------------------------------------------------

--
-- Структура таблицы `diafan_news_counter`
--

CREATE TABLE `diafan_news_counter` (
  `id` int(11) UNSIGNED NOT NULL COMMENT 'идентификатор',
  `element_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор новости из таблицы `diafan_news`',
  `count_view` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'количество просмотров',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Счетчик просмотров новостей';

-- --------------------------------------------------------

--
-- Структура таблицы `diafan_news_rel`
--

CREATE TABLE `diafan_news_rel` (
  `id` int(11) UNSIGNED NOT NULL COMMENT 'идентификатор',
  `element_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор новости из таблицы `diafan_news`',
  `rel_element_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор связанной новости из таблицы `diafan_news`',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Связи похожих новостей';

-- --------------------------------------------------------

--
-- Структура таблицы `diafan_payment`
--

CREATE TABLE `diafan_payment` (
  `id` smallint(5) UNSIGNED NOT NULL COMMENT 'идентификатор',
  `name1` varchar(50) NOT NULL DEFAULT '' COMMENT 'название',
  `text1` text DEFAULT NULL COMMENT 'описание',
  `act1` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'показывать на сайте: 0 - нет, 1 - да',
  `payment` varchar(20) NOT NULL DEFAULT '' COMMENT 'платежная система',
  `params` text DEFAULT NULL COMMENT 'серилизованные настройки платежной системы',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да',
  `sort` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'подрядковый номер для сортировки'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Методы оплаты';

--
-- Дамп данных таблицы `diafan_payment`
--

INSERT INTO `diafan_payment` (`id`, `name1`, `text1`, `act1`, `payment`, `params`, `trash`, `sort`) VALUES
(1, 'Наличными курьеру', 'Заказ необходимо оплатить курьеру на руки наличными', '1', '', NULL, '0', 1),
(2, 'Оплата счета балансом', 'Вы можете оплатить счет используя баланс', '1', 'balance', NULL, '0', 2);

-- --------------------------------------------------------

--
-- Структура таблицы `diafan_payment_history`
--

CREATE TABLE `diafan_payment_history` (
  `id` int(11) UNSIGNED NOT NULL COMMENT 'идентификатор',
  `element_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'элемент модуля, для которого производится платеж (номер заказа или идентификатор пользователя)',
  `status` enum('request_pay','pay') NOT NULL DEFAULT 'request_pay' COMMENT 'статус платежа: request_pay - запрошен, pay - оплачен',
  `created` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'дата создания',
  `summ` double NOT NULL DEFAULT 0 COMMENT 'сумма платежа',
  `payment_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор метода оплаты из таблицы `diafan_payment`',
  `module_name` enum('cart','balance') NOT NULL DEFAULT 'cart' COMMENT 'модуль, в котором используются платежи',
  `code` varchar(32) NOT NULL DEFAULT '0' COMMENT 'код доступа к платежным документам',
  `payment_data` varchar(50) NOT NULL DEFAULT '0' COMMENT 'данные о платеже из платежной системы'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='История платежей';

-- --------------------------------------------------------

--
-- Структура таблицы `diafan_photo`
--

CREATE TABLE `diafan_photo` (
  `id` int(11) UNSIGNED NOT NULL COMMENT 'идентификатор',
  `name1` text DEFAULT NULL COMMENT 'название',
  `act1` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'показывать на сайте: 0 - нет, 1 - да',
  `date_start` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'дата начала показа',
  `date_finish` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'дата окончания показа',
  `map_no_show` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'не показывать на карте сайта: 0 - нет, 1 - да',
  `changefreq` enum('always','hourly','daily','weekly','monthly','yearly','never') NOT NULL DEFAULT 'always' COMMENT 'Changefreq для sitemap.xml',
  `priority` varchar(3) NOT NULL DEFAULT '' COMMENT 'Priority для sitemap.xml',
  `noindex` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'не индексировать: 0 - нет, 1 - да',
  `cat_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор основного альбома из таблицы `diafan_photo_category`',
  `site_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор страницы сайта из таблицы `diafan_site`',
  `keywords1` varchar(250) NOT NULL DEFAULT '' COMMENT 'ключевые слова, тег Keywords',
  `descr1` text DEFAULT NULL COMMENT 'описание, тэг Description',
  `canonical1` varchar(100) NOT NULL DEFAULT '' COMMENT 'канонический тег',
  `title_meta1` varchar(250) NOT NULL DEFAULT '' COMMENT 'заголовок окна в браузере, тег Title',
  `anons1` text DEFAULT NULL COMMENT 'анонс',
  `anons_plus1` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'добавлять анонс к описанию: 0 - нет, 1 - да',
  `text1` text DEFAULT NULL COMMENT 'описание',
  `sort` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'подрядковый номер для сортировки',
  `timeedit` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'время последнего изменения в формате UNIXTIME',
  `access` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'доступ ограничен: 0 - нет, 1 - да',
  `admin_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'пользователь из таблицы `diafan_users`, добавивший или первый отредктировавший фотографию в административной части',
  `theme` varchar(50) NOT NULL DEFAULT '' COMMENT 'шаблон страницы сайта',
  `view` varchar(50) NOT NULL DEFAULT '' COMMENT 'шаблон модуля',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Фотографии';

-- --------------------------------------------------------

--
-- Структура таблицы `diafan_photo_category`
--

CREATE TABLE `diafan_photo_category` (
  `id` int(11) UNSIGNED NOT NULL COMMENT 'идентификатор',
  `name1` text DEFAULT NULL COMMENT 'название',
  `act1` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'показывать на сайте: 0 - нет, 1 - да',
  `map_no_show` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'не показывать на карте сайта: 0 - нет, 1 - да',
  `changefreq` enum('always','hourly','daily','weekly','monthly','yearly','never') NOT NULL DEFAULT 'always' COMMENT 'Changefreq для sitemap.xml',
  `priority` varchar(3) NOT NULL DEFAULT '' COMMENT 'Priority для sitemap.xml',
  `noindex` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'не индексировать: 0 - нет, 1 - да',
  `parent_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор родителя из таблицы `diafan_photo_category`',
  `count_children` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'количество вложенных альбомов',
  `site_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор страницы сайта из таблицы `diafan_site`',
  `keywords1` varchar(250) NOT NULL DEFAULT '' COMMENT 'ключевые слова, тег Keywords',
  `descr1` text DEFAULT NULL COMMENT 'описание, тэг Description',
  `canonical1` varchar(100) NOT NULL DEFAULT '' COMMENT 'канонический тег',
  `title_meta1` varchar(250) NOT NULL DEFAULT '' COMMENT 'заголовок окна в браузере, тег Title',
  `anons1` text DEFAULT NULL COMMENT 'анонс',
  `anons_plus1` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'добавлять анонс к описанию: 0 - нет, 1 - да',
  `text1` text DEFAULT NULL COMMENT 'описание',
  `sort` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'подрядковый номер для сортировки',
  `timeedit` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'время последнего изменения в формате UNIXTIME',
  `access` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'доступ ограничен: 0 - нет, 1 - да',
  `admin_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'пользователь из таблицы `diafan_users`, добавивший или первый отредктировавший альбом в административной части',
  `theme` varchar(50) NOT NULL DEFAULT '' COMMENT 'шаблон страницы сайта',
  `view` varchar(50) NOT NULL DEFAULT '' COMMENT 'шаблон модуля',
  `view_rows` varchar(50) NOT NULL DEFAULT '' COMMENT 'шаблон модуля для элементов в списке категории',
  `view_element` varchar(50) NOT NULL DEFAULT '' COMMENT 'шаблон модуля для элементов в категории',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Альбомы фотографий';

-- --------------------------------------------------------

--
-- Структура таблицы `diafan_photo_category_parents`
--

CREATE TABLE `diafan_photo_category_parents` (
  `id` int(11) UNSIGNED NOT NULL COMMENT 'идентификатор',
  `element_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор альбома из таблицы `diafan_photo_category`',
  `parent_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор альбома-родителя из таблицы `diafan_photo_category`',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Родительские связи альбомов фотографий';

-- --------------------------------------------------------

--
-- Структура таблицы `diafan_photo_category_rel`
--

CREATE TABLE `diafan_photo_category_rel` (
  `id` int(11) UNSIGNED NOT NULL COMMENT 'идентификатор',
  `element_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор фотографии из таблицы `diafan_photo`',
  `cat_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор альбома из таблицы `diafan_photo_category`',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Связи фотографий с альбомами';

-- --------------------------------------------------------

--
-- Структура таблицы `diafan_photo_counter`
--

CREATE TABLE `diafan_photo_counter` (
  `id` int(11) UNSIGNED NOT NULL COMMENT 'идентификатор',
  `element_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор фотографии из таблицы `diafan_photo`',
  `count_view` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'количество просмотров',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Счетчик просмотров фотографий';

-- --------------------------------------------------------

--
-- Структура таблицы `diafan_photo_rel`
--

CREATE TABLE `diafan_photo_rel` (
  `id` int(11) UNSIGNED NOT NULL COMMENT 'идентификатор',
  `element_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор фотографии из таблицы `diafan_photo`',
  `rel_element_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор связанной фотографии из таблицы `diafan_photo`',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Связи похожих фотографий';

-- --------------------------------------------------------

--
-- Структура таблицы `diafan_postman`
--

CREATE TABLE `diafan_postman` (
  `master_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'главный идентификатор в формате UNIXTIME',
  `slave_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'вторичный идентификатор в интервале master_id',
  `id` varchar(21) NOT NULL DEFAULT '' COMMENT 'объединенный идентификатор',
  `type` enum('mail','sms') NOT NULL DEFAULT 'mail' COMMENT 'тип уведомления: mail - электронные письма, sms - короткие сообщения',
  `recipient` text DEFAULT NULL COMMENT 'получатель/получатели',
  `subject` text DEFAULT NULL COMMENT 'тема письма',
  `body` text DEFAULT NULL COMMENT 'содержание письма',
  `from` text DEFAULT NULL COMMENT 'адрес отправителя',
  `auto` enum('0','1') NOT NULL DEFAULT '1' COMMENT 'метод отправки уведомления: 0 - ручной, 1 - автоматический',
  `timeedit` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'время последнего изменения в формате UNIXTIME',
  `timesent` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'время отправки уведомления в формате UNIXTIME',
  `status` enum('0','1','2') NOT NULL DEFAULT '0' COMMENT 'отчет об отправке уведомления: 0 - не отправлено, 1 - отправлено, 2 - ошибка отправления',
  `error` text DEFAULT NULL COMMENT 'отчет об ошибке отправления',
  `trace` text DEFAULT NULL COMMENT 'трассировка отправления'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Уведомления';

-- --------------------------------------------------------

--
-- Структура таблицы `diafan_rating`
--

CREATE TABLE `diafan_rating` (
  `id` int(11) UNSIGNED NOT NULL COMMENT 'идентификатор',
  `element_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор элемента модуля',
  `module_name` varchar(50) NOT NULL DEFAULT '' COMMENT 'название модуля',
  `element_type` enum('element','cat') NOT NULL DEFAULT 'element' COMMENT 'тип элемента модуля',
  `rating` double NOT NULL DEFAULT 0 COMMENT 'средняя оценка',
  `count_votes` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'количество оценок',
  `created` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'дата последней оценки',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Рейтинг элементов модулей';

-- --------------------------------------------------------

--
-- Структура таблицы `diafan_redirect`
--

CREATE TABLE `diafan_redirect` (
  `id` int(11) UNSIGNED NOT NULL COMMENT 'идентификатор',
  `redirect` varchar(255) NOT NULL DEFAULT '' COMMENT 'исходная псевдоссылка, с которой иустановлен редирект',
  `code` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'код редиректа',
  `module_name` varchar(50) NOT NULL DEFAULT '' COMMENT 'название модуля',
  `element_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор элемента модуля',
  `element_type` enum('element','cat','brand','param') NOT NULL DEFAULT 'element' COMMENT 'тип элемента модуля',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Редиректы';

-- --------------------------------------------------------

--
-- Структура таблицы `diafan_reviews`
--

CREATE TABLE `diafan_reviews` (
  `id` int(11) UNSIGNED NOT NULL COMMENT 'идентификатор',
  `user_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор пользователя из таблицы `diafan_users`',
  `session_id` varchar(64) NOT NULL DEFAULT '' COMMENT 'уникальный идентификатор сессии',
  `act` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'показывать на сайте: 0 - нет, 1 - да',
  `readed` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'сообщение прочитано: 0 - нет, 1 - да',
  `votes` double NOT NULL DEFAULT 0 COMMENT 'средняя оценка',
  `count_votes_plus` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'количество согласных',
  `count_votes_minues` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'количество несогласных',
  `created` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'дата создания',
  `module_name` varchar(50) NOT NULL DEFAULT '' COMMENT 'название модуля',
  `element_type` enum('element','cat','brand') NOT NULL DEFAULT 'element' COMMENT 'тип элемента модуля',
  `element_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор элемента модуля',
  `text` text DEFAULT NULL COMMENT 'ответ',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Отзывы';

-- --------------------------------------------------------

--
-- Структура таблицы `diafan_reviews_param`
--

CREATE TABLE `diafan_reviews_param` (
  `id` int(11) UNSIGNED NOT NULL COMMENT 'идентификатор',
  `name1` varchar(250) NOT NULL DEFAULT '' COMMENT 'название',
  `type` varchar(20) NOT NULL DEFAULT '' COMMENT 'тип',
  `info` varchar(20) NOT NULL DEFAULT '' COMMENT 'смысловая нагрузка',
  `module_name` varchar(50) NOT NULL DEFAULT '' COMMENT 'название модуля',
  `sort` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'подрядковый номер для сортировки',
  `required` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'обязательно для заполнения: 0 - нет, 1 - да',
  `show_in_list` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'показывать в списке: 0 - нет, 1 - да',
  `show_in_form_auth` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'показывать в форме авторизованным пользователям: 0 - нет, 1 - да',
  `show_in_form_no_auth` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'показывать в списке: 0 - нет, 1 - да',
  `text1` text DEFAULT NULL COMMENT 'описание',
  `config` text DEFAULT NULL COMMENT 'серилизованные настройки поля',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Дополнительные поля отзывов';

--
-- Дамп данных таблицы `diafan_reviews_param`
--

INSERT INTO `diafan_reviews_param` (`id`, `name1`, `type`, `info`, `module_name`, `sort`, `required`, `show_in_list`, `show_in_form_auth`, `show_in_form_no_auth`, `text1`, `config`, `trash`) VALUES
(1, 'Имя', 'text', 'name', '', 1, '1', '0', '0', '1', NULL, NULL, '0'),
(2, 'E-mail', 'email', 'email', '', 2, '1', '0', '1', '1', NULL, NULL, '0'),
(3, 'Город', 'text', '', '', 3, '0', '1', '1', '1', NULL, NULL, '0'),
(4, 'Аватар', 'images', 'avatar', '', 4, '0', '0', '0', '1', NULL, 'a:1:{i:0;a:2:{s:4:\"name\";s:5:\"large\";s:2:\"id\";s:1:\"5\";}}', '0'),
(5, 'Оценка', 'radio', 'rating', '', 5, '0', '1', '1', '1', NULL, NULL, '0'),
(6, 'Достоинства', 'textarea', '', '', 6, '0', '1', '1', '1', NULL, NULL, '0'),
(7, 'Недостатки', 'textarea', '', '', 7, '0', '1', '1', '1', NULL, NULL, '0'),
(8, 'Отзыв', 'textarea', '', '', 8, '0', '1', '1', '1', NULL, NULL, '0'),
(9, 'Приложить файлы', 'attachments', '', '', 9, '0', '1', '1', '1', NULL, 'a:11:{s:21:\"max_count_attachments\";i:3;s:21:\"attachment_extensions\";s:13:\"jpg, png, zip\";s:15:\"recognize_image\";i:0;s:24:\"attachments_access_admin\";i:0;s:16:\"attach_big_width\";i:0;s:17:\"attach_big_height\";i:0;s:18:\"attach_big_quality\";i:0;s:19:\"attach_medium_width\";i:0;s:20:\"attach_medium_height\";i:0;s:21:\"attach_medium_quality\";i:0;s:13:\"use_animation\";i:0;}', '0');

-- --------------------------------------------------------

--
-- Структура таблицы `diafan_reviews_param_element`
--

CREATE TABLE `diafan_reviews_param_element` (
  `id` int(11) UNSIGNED NOT NULL COMMENT 'идентификатор',
  `value` text DEFAULT NULL COMMENT 'значение',
  `param_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор характеристики из таблицы `diafan_reviews_param`',
  `element_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор отзыва из таблицы `diafan_reviews`',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Значения дополнительных полей отзывов';

-- --------------------------------------------------------

--
-- Структура таблицы `diafan_reviews_param_select`
--

CREATE TABLE `diafan_reviews_param_select` (
  `id` int(11) UNSIGNED NOT NULL COMMENT 'идентификатор',
  `param_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор характеристики из таблицы `diafan_reviews_param`',
  `name1` varchar(50) NOT NULL DEFAULT '' COMMENT 'значение',
  `value` varchar(1) NOT NULL DEFAULT '' COMMENT 'значение для типа характеристики «галочка»: 0 - нет, 1 - да',
  `sort` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'подрядковый номер для сортировки',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Варианты значения дополнительных полей отзывов с типом список';

--
-- Дамп данных таблицы `diafan_reviews_param_select`
--

INSERT INTO `diafan_reviews_param_select` (`id`, `param_id`, `name1`, `value`, `sort`, `trash`) VALUES
(1, 5, '1', '', 1, '0'),
(2, 5, '2', '', 2, '0'),
(3, 5, '3', '', 3, '0'),
(4, 5, '4', '', 4, '0'),
(5, 5, '5', '', 5, '0');

-- --------------------------------------------------------

--
-- Структура таблицы `diafan_rewrite`
--

CREATE TABLE `diafan_rewrite` (
  `id` int(11) UNSIGNED NOT NULL COMMENT 'идентификатор',
  `rewrite` varchar(250) NOT NULL DEFAULT '' COMMENT 'псевдоссылка',
  `module_name` varchar(50) NOT NULL DEFAULT '' COMMENT 'название модуля',
  `element_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор элемента модуля',
  `element_type` enum('element','cat','brand','param') NOT NULL DEFAULT 'element' COMMENT 'тип элемента модуля',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Псевдоссылки';

--
-- Дамп данных таблицы `diafan_rewrite`
--

INSERT INTO `diafan_rewrite` (`id`, `rewrite`, `module_name`, `element_id`, `element_type`, `trash`) VALUES
(1, '', 'site', 1, 'element', '0'),
(2, 'useful', 'site', 2, 'element', '0'),
(3, 'privacy', 'site', 150, 'element', '0'),
(4, 'ads', 'site', 151, 'element', '0'),
(5, 'balance', 'site', 152, 'element', '0'),
(6, 'clauses', 'site', 153, 'element', '0'),
(7, 'faq', 'site', 154, 'element', '0'),
(8, 'feedback', 'site', 155, 'element', '0'),
(9, 'files', 'site', 156, 'element', '0'),
(10, 'forum', 'site', 157, 'element', '0'),
(11, 'map', 'site', 158, 'element', '0'),
(12, 'messages', 'site', 159, 'element', '0'),
(13, 'news', 'site', 160, 'element', '0'),
(14, 'photo', 'site', 161, 'element', '0'),
(15, 'reviews', 'site', 162, 'element', '0'),
(16, 'search', 'site', 163, 'element', '0'),
(17, 'shop', 'site', 164, 'element', '0'),
(18, 'shop/cart', 'site', 165, 'element', '0'),
(19, 'shop/cart/done', 'site', 166, 'element', '0'),
(20, 'shop/wishlist', 'site', 167, 'element', '0'),
(21, 'subscription', 'site', 168, 'element', '0'),
(22, 'tags', 'site', 169, 'element', '0'),
(23, 'user', 'site', 3, 'element', '0'),
(24, 'settings', 'site', 170, 'element', '0'),
(25, 'registration', 'site', 171, 'element', '0'),
(26, 'reminding', 'site', 172, 'element', '0'),
(27, 'oplata-i-dostavka', 'site', 173, 'element', '0'),
(28, 'o-kompanii', 'site', 174, 'element', '0'),
(29, 'kontakty', 'site', 175, 'element', '0'),
(30, 'obratnyy-zvonok', 'site', 176, 'element', '0'),
(31, 'shop/mekhanicheskie-ustroystva-upravleniya', 'shop', 2, 'cat', '0'),
(32, 'shop/korobki-otbora-moschnosti', 'shop', 3, 'cat', '0'),
(33, 'shop/shesterenchatye-nasosy', 'shop', 4, 'cat', '0'),
(34, 'shop/ruchnye-nasosy', 'shop', 5, 'cat', '0'),
(35, 'shop/gidravlicheskie-raspredeliteli', 'shop', 6, 'cat', '0'),
(36, 'shop/pnevmaticheskie-organy-upravleniya', 'shop', 7, 'cat', '0'),
(37, 'shop/porshnevye-nasosy', 'shop', 8, 'cat', '0'),
(38, 'shop/emkostnoe-oborudovanie', 'shop', 9, 'cat', '0');

-- --------------------------------------------------------

--
-- Структура таблицы `diafan_search_history`
--

CREATE TABLE `diafan_search_history` (
  `id` int(11) UNSIGNED NOT NULL COMMENT 'идентификатор',
  `created` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'дата создания',
  `name` text DEFAULT NULL COMMENT 'поисковый запрос'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='История поисковых запросов';

--
-- Дамп данных таблицы `diafan_search_history`
--

INSERT INTO `diafan_search_history` (`id`, `created`, `name`) VALUES
(1, 1586767254, 'test'),
(2, 1586783239, 'dasdas'),
(3, 1586783245, 'контакты'),
(4, 1586785704, '');

-- --------------------------------------------------------

--
-- Структура таблицы `diafan_search_index`
--

CREATE TABLE `diafan_search_index` (
  `id` int(11) UNSIGNED NOT NULL COMMENT 'идентификатор',
  `keyword_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор слова из таблицы `diafan_search_keywords`',
  `result_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор проиндексированного элемента из таблицы `diafan_saerch_results`',
  `rating` tinyint(2) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'рейтинг для сортировки результатов'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Связи слов и проиндексированных для поиска элементов';

--
-- Дамп данных таблицы `diafan_search_index`
--

INSERT INTO `diafan_search_index` (`id`, `keyword_id`, `result_id`, `rating`) VALUES
(1, 1, 1, 0),
(2, 2, 1, 0),
(5, 5, 4, 0),
(6, 6, 4, 0),
(7, 8, 5, 0),
(8, 7, 5, 0),
(9, 9, 6, 0),
(10, 10, 6, 0),
(11, 11, 6, 0),
(12, 12, 7, 0),
(13, 13, 7, 0),
(14, 14, 7, 0),
(15, 16, 8, 0),
(16, 15, 8, 0),
(17, 16, 9, 0),
(18, 17, 9, 0),
(19, 18, 10, 0),
(20, 19, 10, 0),
(21, 11, 11, 0),
(22, 21, 11, 0),
(23, 20, 11, 0),
(24, 16, 12, 0),
(25, 22, 12, 0),
(26, 23, 13, 0),
(27, 24, 13, 0),
(28, 3, 14, 1),
(29, 25, 14, 0),
(30, 26, 14, 0),
(31, 27, 14, 1),
(32, 28, 14, 1),
(33, 29, 14, 1),
(34, 30, 14, 1),
(35, 31, 14, 1),
(36, 32, 14, 1),
(37, 33, 14, 1),
(38, 34, 14, 1),
(39, 35, 14, 1),
(40, 36, 14, 1),
(41, 37, 14, 1),
(42, 38, 14, 1),
(43, 39, 14, 1),
(44, 40, 14, 1),
(45, 41, 14, 1),
(46, 42, 14, 1),
(47, 43, 14, 1),
(48, 44, 14, 1),
(49, 45, 14, 1),
(50, 46, 14, 1),
(51, 47, 14, 1),
(52, 48, 14, 1),
(53, 49, 14, 1),
(54, 50, 14, 1),
(55, 51, 14, 1),
(56, 52, 14, 1),
(57, 53, 14, 1),
(58, 54, 14, 1),
(59, 55, 14, 1),
(60, 56, 14, 1),
(61, 57, 14, 1),
(62, 58, 14, 1),
(63, 59, 14, 1),
(64, 60, 14, 1),
(65, 61, 14, 1),
(66, 62, 14, 1),
(67, 63, 14, 1),
(68, 64, 14, 1),
(69, 65, 14, 1),
(70, 66, 14, 1),
(71, 67, 14, 1),
(72, 68, 14, 1),
(73, 69, 14, 1),
(74, 70, 14, 1),
(75, 71, 14, 1),
(76, 72, 14, 1),
(77, 73, 14, 1),
(78, 74, 14, 1),
(79, 75, 14, 1),
(80, 76, 14, 1),
(81, 77, 14, 1),
(82, 8, 15, 1),
(83, 78, 15, 0),
(84, 79, 15, 1),
(85, 80, 15, 1),
(86, 81, 15, 1),
(87, 82, 15, 1),
(88, 83, 15, 1),
(89, 84, 15, 1),
(90, 85, 15, 1),
(91, 86, 15, 1),
(92, 87, 15, 1),
(93, 88, 15, 1),
(94, 89, 15, 1),
(95, 90, 15, 1),
(96, 91, 15, 1),
(97, 92, 15, 1),
(98, 93, 15, 1),
(99, 94, 15, 1),
(100, 95, 15, 1),
(101, 96, 15, 1),
(102, 97, 15, 1),
(103, 98, 15, 1),
(104, 99, 15, 1),
(105, 100, 15, 1),
(187, 3, 17, 0),
(188, 27, 17, 1),
(189, 28, 17, 1),
(190, 29, 17, 1),
(191, 30, 17, 1),
(192, 31, 17, 1),
(193, 32, 17, 1),
(194, 33, 17, 1),
(195, 34, 17, 1),
(196, 35, 17, 1),
(197, 36, 17, 1),
(198, 37, 17, 1),
(199, 38, 17, 1),
(200, 39, 17, 1),
(201, 40, 17, 1),
(202, 41, 17, 1),
(203, 42, 17, 1),
(204, 43, 17, 1),
(205, 44, 17, 1),
(206, 45, 17, 1),
(207, 46, 17, 1),
(208, 47, 17, 1),
(209, 48, 17, 1),
(210, 49, 17, 1),
(211, 50, 17, 1),
(212, 51, 17, 1),
(213, 52, 17, 1),
(214, 53, 17, 1),
(215, 54, 17, 1),
(216, 55, 17, 1),
(217, 56, 17, 1),
(218, 57, 17, 1),
(219, 58, 17, 1),
(220, 59, 17, 1),
(221, 60, 17, 1),
(222, 61, 17, 1),
(223, 62, 17, 1),
(224, 63, 17, 1),
(225, 64, 17, 1),
(226, 65, 17, 1),
(227, 66, 17, 1),
(228, 67, 17, 1),
(229, 68, 17, 1),
(230, 69, 17, 1),
(231, 70, 17, 1),
(232, 71, 17, 1),
(233, 72, 17, 1),
(234, 73, 17, 1),
(235, 74, 17, 1),
(236, 75, 17, 1),
(237, 76, 17, 1),
(238, 131, 17, 1),
(239, 132, 17, 1),
(240, 133, 17, 1),
(241, 134, 17, 1),
(242, 135, 17, 1),
(243, 136, 17, 1),
(244, 137, 17, 1),
(245, 138, 17, 1),
(246, 139, 17, 1),
(247, 140, 17, 1),
(248, 141, 17, 1),
(249, 142, 17, 1),
(250, 143, 17, 1),
(251, 144, 17, 1),
(252, 145, 17, 1),
(253, 146, 17, 1),
(254, 147, 17, 1),
(255, 148, 17, 1),
(256, 149, 17, 1),
(257, 150, 17, 1),
(258, 151, 17, 1),
(259, 152, 17, 1),
(260, 153, 17, 1),
(261, 154, 17, 1),
(262, 155, 17, 1),
(263, 156, 17, 1),
(264, 157, 17, 1),
(265, 158, 17, 1),
(266, 159, 17, 1),
(267, 160, 17, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `diafan_search_keywords`
--

CREATE TABLE `diafan_search_keywords` (
  `id` int(11) UNSIGNED NOT NULL COMMENT 'идентификатор',
  `keyword` varchar(255) NOT NULL DEFAULT '' COMMENT 'уникальное слово'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Индексированные для поиска слова';

--
-- Дамп данных таблицы `diafan_search_keywords`
--

INSERT INTO `diafan_search_keywords` (`id`, `keyword`) VALUES
(1, 'оплат'),
(2, 'доставк'),
(3, 'компан'),
(5, 'каталог'),
(6, 'товар'),
(7, 'обратн'),
(8, 'звонок'),
(9, 'механическ'),
(10, 'устройств'),
(11, 'управлен'),
(12, 'коробк'),
(13, 'отбор'),
(14, 'мощност'),
(15, 'шестеренчат'),
(16, 'насос'),
(17, 'ручн'),
(18, 'гидравлическ'),
(19, 'распределител'),
(20, 'пневматическ'),
(21, 'орга'),
(22, 'поршнев'),
(23, 'емкостн'),
(24, 'оборудован'),
(25, 'главн'),
(26, 'страниц'),
(27, 'ооо'),
(28, 'грузоподъемн'),
(29, 'систем'),
(30, 'основа'),
(31, '2005'),
(32, 'год'),
(33, 'сам'),
(34, 'нача'),
(35, 'нам'),
(36, 'был'),
(37, 'поставл'),
(38, 'высок'),
(39, 'планк'),
(40, 'организац'),
(41, 'удобств'),
(42, 'работ'),
(43, 'клиент'),
(44, 'наш'),
(45, 'благодар'),
(46, 'такому'),
(47, 'подходу'),
(48, 'просто'),
(49, 'работа'),
(50, 'активно'),
(51, 'развива'),
(52, 'открыва'),
(53, 'нов'),
(54, 'направлен'),
(55, 'привлека'),
(56, 'иностранных'),
(57, 'партнер'),
(58, 'над'),
(59, 'логистик'),
(60, 'ценообразован'),
(61, 'основн'),
(62, 'деятельност'),
(63, 'реализац'),
(64, 'новых'),
(65, 'автомобил'),
(66, 'спецтехник'),
(67, 'шасс'),
(68, 'камаз'),
(69, 'ура'),
(70, 'запасных'),
(71, 'част'),
(72, 'выкуп'),
(73, 'корпоративных'),
(74, 'автопарк'),
(75, 'ремонт'),
(76, 'доработк'),
(77, 'подробн'),
(78, 'контакт'),
(79, 'адрес'),
(80, 'республик'),
(81, 'татарста'),
(82, 'набережн'),
(83, 'челн'),
(84, 'промышленно'),
(85, 'коммунальн'),
(86, 'зон'),
(87, 'промзон'),
(88, 'пролетарск'),
(89, 'проезд'),
(90, 'почтов'),
(91, '423827'),
(92, '27144'),
(93, 'телефон'),
(94, '800'),
(95, '333'),
(96, 'росс'),
(97, 'бесплатн'),
(98, 'mail'),
(99, 'd1gps'),
(100, 'avto'),
(131, 'банковск'),
(132, 'реквизит'),
(133, 'ин'),
(134, '1650131757'),
(135, 'кпп'),
(136, '165001001'),
(137, '407'),
(138, '028'),
(139, '105'),
(140, '291'),
(141, '400'),
(142, '000'),
(143, 'филиал'),
(144, 'нижегородск'),
(145, 'оао'),
(146, 'альф'),
(147, 'банк'),
(148, 'нижн'),
(149, 'новгород'),
(150, '301'),
(151, '018'),
(152, '102'),
(153, '824'),
(154, 'бик'),
(155, '042'),
(156, '202'),
(157, 'огрн'),
(158, '1051614162203'),
(159, 'окпо'),
(160, '78684100');

-- --------------------------------------------------------

--
-- Структура таблицы `diafan_search_results`
--

CREATE TABLE `diafan_search_results` (
  `id` int(11) UNSIGNED NOT NULL COMMENT 'идентификатор',
  `element_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор элемента',
  `table_name` varchar(50) NOT NULL DEFAULT '' COMMENT 'таблица элемента',
  `lang_id` tinyint(2) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор языка сайта из таблицы `diafan_languages`',
  `access` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'доступ к элементу ограничен',
  `rating` tinyint(2) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'рейтинг для сортировки результатов',
  `date_start` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'дата начала показа',
  `date_finish` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'дата окончания показа'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Индексированные для поиска элементы';

--
-- Дамп данных таблицы `diafan_search_results`
--

INSERT INTO `diafan_search_results` (`id`, `element_id`, `table_name`, `lang_id`, `access`, `rating`, `date_start`, `date_finish`) VALUES
(1, 173, 'site', 1, '0', 5, 0, 0),
(4, 164, 'site', 1, '0', 5, 0, 0),
(5, 176, 'site', 1, '0', 5, 0, 0),
(6, 2, 'shop_category', 1, '0', 6, 0, 0),
(7, 3, 'shop_category', 1, '0', 6, 0, 0),
(8, 4, 'shop_category', 1, '0', 6, 0, 0),
(9, 5, 'shop_category', 1, '0', 6, 0, 0),
(10, 6, 'shop_category', 1, '0', 6, 0, 0),
(11, 7, 'shop_category', 1, '0', 6, 0, 0),
(12, 8, 'shop_category', 1, '0', 6, 0, 0),
(13, 9, 'shop_category', 1, '0', 6, 0, 0),
(14, 1, 'site', 1, '0', 5, 0, 0),
(15, 175, 'site', 1, '0', 5, 0, 0),
(17, 174, 'site', 1, '0', 5, 0, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `diafan_service_express_fields`
--

CREATE TABLE `diafan_service_express_fields` (
  `id` int(11) UNSIGNED NOT NULL COMMENT 'идентификатор',
  `name` varchar(250) NOT NULL DEFAULT '' COMMENT 'название',
  `cat_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор описания файла из таблицы `diafan_service_express_fields_category`',
  `type` varchar(20) NOT NULL DEFAULT '' COMMENT 'тип',
  `params` text DEFAULT NULL COMMENT 'серилизованные данные о поле',
  `required` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'серилизованные данные о поле',
  `sort` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'выдавать ошибку, если поле не заполнено: 0 - нет, 1 - да',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Описание полей файлов импорта';

-- --------------------------------------------------------

--
-- Структура таблицы `diafan_service_express_fields_category`
--

CREATE TABLE `diafan_service_express_fields_category` (
  `id` int(11) UNSIGNED NOT NULL COMMENT 'идентификатор',
  `name` varchar(250) NOT NULL DEFAULT '' COMMENT 'название',
  `module_name` varchar(50) NOT NULL DEFAULT '' COMMENT 'название модуля',
  `type` enum('element','category','brand') NOT NULL DEFAULT 'element' COMMENT 'тип данных: element - элементы, category - категории',
  `delete_items` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'удалять не описанные в файле данные: 0 - нет, 1 - да',
  `add_new_items` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'добавить только новые данные, описанные в файле: 0 - нет, 1 - да',
  `act_items` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'опубликовать данные, описанные в файле: 0 - нет, 1 - да',
  `site_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор страницы сайта из таблицы `diafan_site`',
  `cat_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор категории из таблицы `diafan_*module_name*_category`',
  `menu_cat_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор категории из таблицы `diafan_menu_category`',
  `count_part` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'количество строк, выгружаемых за один проход скрипта',
  `sub_delimiter` varchar(20) NOT NULL DEFAULT '|' COMMENT 'разделитель данных внутри поля',
  `header` enum('0','1') NOT NULL DEFAULT '1' COMMENT 'первая строка - названия столбцов: 0 - нет, 1 - да',
  `sort` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'подрядковый номер для сортировки',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Описание файлов импорта';

-- --------------------------------------------------------

--
-- Структура таблицы `diafan_sessions`
--

CREATE TABLE `diafan_sessions` (
  `user_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор пользователя из таблицы `diafan_users`',
  `session_id` varchar(64) NOT NULL DEFAULT '' COMMENT 'уникальный идентификатор сессии',
  `hostname` varchar(128) NOT NULL DEFAULT '' COMMENT 'хост',
  `user_agent` text DEFAULT NULL COMMENT 'браузер пользователя',
  `timestamp` varchar(20) NOT NULL DEFAULT '0' COMMENT 'время, до которого сессия действует',
  `session` text DEFAULT NULL COMMENT 'серилизованные данные сессии'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Сессии';

--
-- Дамп данных таблицы `diafan_sessions`
--

INSERT INTO `diafan_sessions` (`user_id`, `session_id`, `hostname`, `user_agent`, `timestamp`, `session`) VALUES
(1, 'buhh9ia4qq7vabs5mk5gphibhdo9jtb4', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.163 Safari/537.36', '1586774109', 'visitors|a:10:{s:1:\"v\";s:18:\"1.0.0.0_1586763050\";s:10:\"only_valid\";b:0;s:5:\"valid\";b:1;s:15:\"valid_completed\";b:1;s:3:\"SID\";s:32:\"buhh9ia4qq7vabs5mk5gphibhdo9jtb4\";s:9:\"timestamp\";s:10:\"1586774105\";s:6:\"create\";i:1586764536;s:8:\"timeedit\";i:1586774109;s:5:\"admin\";a:3:{s:6:\"is_new\";b:0;s:13:\"last_timeedit\";i:1586770284;s:8:\"timeedit\";i:1586774109;}s:4:\"site\";a:3:{s:6:\"is_new\";b:0;s:13:\"last_timeedit\";i:1586774047;s:8:\"timeedit\";i:1586774097;}}group_action|a:2:{s:4:\"menu\";s:5:\"trash\";s:4:\"site\";s:7:\"unblock\";}search|a:1:{i:0;s:4:\"test\";}'),
(1, 'j9hq2f3jovfl2hssirvj4rc04utmfpbj', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.163 Safari/537.36', '1586785704', 'visitors|a:11:{s:1:\"v\";s:18:\"1.0.0.0_1586763050\";s:10:\"only_valid\";b:0;s:5:\"valid\";b:1;s:15:\"valid_completed\";b:1;s:3:\"SID\";s:32:\"j9hq2f3jovfl2hssirvj4rc04utmfpbj\";s:9:\"timestamp\";s:10:\"1586785342\";s:6:\"create\";i:1586777577;s:8:\"timeedit\";i:1586785702;s:4:\"site\";a:3:{s:6:\"is_new\";b:0;s:13:\"last_timeedit\";i:1586785342;s:8:\"timeedit\";i:1586785702;}s:11:\"valid_count\";i:1;s:5:\"admin\";a:3:{s:6:\"is_new\";b:0;s:13:\"last_timeedit\";i:1586783028;s:8:\"timeedit\";i:1586783031;}}search|a:3:{i:0;s:6:\"dasdas\";i:1;s:16:\"контакты\";i:2;s:0:\"\";}');

-- --------------------------------------------------------

--
-- Структура таблицы `diafan_sessions_hash`
--

CREATE TABLE `diafan_sessions_hash` (
  `id` int(11) UNSIGNED NOT NULL COMMENT 'идентификатор',
  `user_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор пользователя из таблицы `diafan_users`',
  `hash` char(32) NOT NULL DEFAULT '' COMMENT 'хеш',
  `created` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'дата создания'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Контрольные хэши авторизованных пользователей';

--
-- Дамп данных таблицы `diafan_sessions_hash`
--

INSERT INTO `diafan_sessions_hash` (`id`, `user_id`, `hash`, `created`) VALUES
(189, 1, 'c646983dae29432929b0add6696a1bbe', 1586777582),
(190, 1, 'e398c02f70009e186760b17ea6b4b657', 1586779649),
(191, 1, 'a9205a50874a4467ccb0db6701d04295', 1586779650),
(192, 1, '80221f3d33a12c9f97f9bf71dbf4ef1d', 1586779652),
(193, 1, 'a32da23cc11a107a24052bfcbdad447f', 1586779676),
(194, 1, 'f055570de14a27df7a9f5e9c7b6d461a', 1586779739),
(198, 1, '10f2bebfa0c9838d2d0c19cf24b1102f', 1586779758),
(199, 1, 'd9fd1934671ddc7355dd307010ef1a3e', 1586779761),
(200, 1, '0fe034268d1b85b4e1daf80aaba0e3de', 1586779763),
(201, 1, '57f857b76a35132a0cafaaf09fd76cd8', 1586779764),
(202, 1, '87bbf4abbebd3d6c9d270ddf984b0a4e', 1586779765),
(205, 1, 'd32bbce1eaedb921e25c399a3c418be0', 1586779779),
(206, 1, '935943d3eac48a2a85b203b5f2429aa1', 1586779780),
(223, 1, '6f4c019ae760d078e03168875c89b8ef', 1586779869),
(224, 1, 'ff6f7f2891e73d950c92272ab21e4f44', 1586780271),
(225, 1, 'ecb58b60a5be2c560f64ae616326a1dd', 1586780577),
(226, 1, 'b1b48c0310981acb2c8f8e0125d5e77a', 1586780610),
(229, 1, '4303aabd44a331ef16f0c902b8f0701b', 1586780618),
(230, 1, 'a9b7cd876c5f3a3cbaf045a9b99fc441', 1586780629),
(231, 1, 'd125dcedb4a7a37fdec5be09bf9dc6c4', 1586781608),
(234, 1, '84c794d49cac49fe3e50f88f8006591f', 1586781626),
(237, 1, 'eac025373fd8841b8ec327042efd2b60', 1586781707),
(238, 1, 'a35c63c20f98750382e16b5e7bd1e672', 1586781971),
(241, 1, 'f2e6da162a771b416c105f9a0d48cec2', 1586781991),
(242, 1, '637f7e3c95e80add73430d045802b584', 1586781993),
(245, 1, '8dc8b85a115cd5e9fc3652805df5eda8', 1586783007),
(248, 1, '8cb22bdd0b7ba1ab13d742e22eed8da2', 1586783031);

-- --------------------------------------------------------

--
-- Структура таблицы `diafan_shop`
--

CREATE TABLE `diafan_shop` (
  `id` int(11) UNSIGNED NOT NULL COMMENT 'идентификатор',
  `name1` text DEFAULT NULL COMMENT 'название',
  `act1` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'показывать на сайте: 0 - нет, 1 - да',
  `date_start` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'дата начала показа',
  `date_finish` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'дата окончания показа',
  `article` varchar(30) NOT NULL DEFAULT '' COMMENT 'артикул',
  `measure_unit1` varchar(50) NOT NULL DEFAULT '' COMMENT 'единица измерения',
  `weight` varchar(50) NOT NULL DEFAULT '' COMMENT 'вес',
  `length` varchar(50) NOT NULL DEFAULT '' COMMENT 'длина',
  `width` varchar(50) NOT NULL DEFAULT '' COMMENT 'ширина',
  `height` varchar(50) NOT NULL DEFAULT '' COMMENT 'высота',
  `map_no_show` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'не показывать на карте сайта: 0 - нет, 1 - да',
  `changefreq` enum('always','hourly','daily','weekly','monthly','yearly','never') NOT NULL DEFAULT 'always' COMMENT 'Changefreq для sitemap.xml',
  `priority` varchar(3) NOT NULL DEFAULT '' COMMENT 'Priority для sitemap.xml',
  `noindex` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'не индексировать: 0 - нет, 1 - да',
  `cat_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор основной категории из таблицы `diafan_shop_category`',
  `site_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор страницы сайта из таблицы `diafan_site`',
  `brand_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор производителя из таблицы `diafan_shop_brand`',
  `keywords1` varchar(250) NOT NULL DEFAULT '' COMMENT 'ключевые слова, тег Keywords',
  `descr1` text DEFAULT NULL COMMENT 'описание, тэг Description',
  `canonical1` varchar(100) NOT NULL DEFAULT '' COMMENT 'канонический тег',
  `title_meta1` varchar(250) NOT NULL DEFAULT '' COMMENT 'заголовок окна в браузере, тег Title',
  `anons1` text DEFAULT NULL COMMENT 'анонс',
  `anons_plus1` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'добавлять анонс к описанию: 0 - нет, 1 - да',
  `text1` text DEFAULT NULL COMMENT 'описание',
  `yandex` text DEFAULT NULL COMMENT 'данные для выгрузки в Яндекс.Маркет',
  `show_yandex` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'выгружать в Яндекс.Маркет: 0 - нет, 1 - да (если в настройках выбрана выгрузка только выбранных товаров)',
  `google` text DEFAULT NULL COMMENT 'данные для выгрузки в Google Merchant',
  `show_google` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'выгружать в Google Merchant: 0 - нет, 1 - да (если в настройках выбрана выгрузка только выбранных товаров)',
  `no_buy` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'товар временно отсутствует: 0 - нет, 1 - да',
  `import` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'элемент только что импортирован: 0 - нет, 1 - да',
  `import_id` varchar(100) NOT NULL DEFAULT '' COMMENT 'собственный идентификатор элемента при импорте',
  `sort` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'подрядковый номер для сортировки',
  `timeedit` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'время последнего изменения в формате UNIXTIME',
  `counter_buy` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'количество покупок',
  `hit` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'хит: 0 - нет, 1 - да',
  `new` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'новинка: 0 - нет, 1 - да',
  `action` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'акция: 0 - нет, 1 - да',
  `is_file` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'это товар-файл: 0 - нет, 1 - да',
  `access` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'доступ ограничен: 0 - нет, 1 - да',
  `admin_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'пользователь из таблицы `diafan_users`, добавивший или первый отредктировавший товар в административной части',
  `theme` varchar(50) NOT NULL DEFAULT '' COMMENT 'шаблон страницы сайта',
  `view` varchar(50) NOT NULL DEFAULT '' COMMENT 'шаблон модуля',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Товары';

-- --------------------------------------------------------

--
-- Структура таблицы `diafan_shop_additional_cost`
--

CREATE TABLE `diafan_shop_additional_cost` (
  `id` smallint(5) UNSIGNED NOT NULL COMMENT 'идентификатор',
  `name1` varchar(50) NOT NULL DEFAULT '' COMMENT 'название',
  `text1` text DEFAULT NULL COMMENT 'описание',
  `act1` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'показывать на сайте: 0 - нет, 1 - да',
  `shop_rel` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'связана с товаром: 0 - нет, 1 - да',
  `percent` double NOT NULL DEFAULT 0 COMMENT 'процент от стоимости товаров в корзине',
  `price` double NOT NULL DEFAULT 0 COMMENT 'цена',
  `amount` double NOT NULL DEFAULT 0 COMMENT 'бесплатно от',
  `required` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'всегда включено в цену: 0 - нет, 1 - да',
  `sort` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'подрядковый номер для сортировки',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Сопутствующие услуги';

-- --------------------------------------------------------

--
-- Структура таблицы `diafan_shop_additional_cost_category_rel`
--

CREATE TABLE `diafan_shop_additional_cost_category_rel` (
  `id` int(11) UNSIGNED NOT NULL COMMENT 'идентификатор',
  `cat_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор категории из таблицы `diafan_shop_category`',
  `element_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор сопутствующей услуги из таблицы `diafan_shop_additional_cost`',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Связь сопутствующих услуг и категорий';

-- --------------------------------------------------------

--
-- Структура таблицы `diafan_shop_additional_cost_rel`
--

CREATE TABLE `diafan_shop_additional_cost_rel` (
  `id` int(11) UNSIGNED NOT NULL COMMENT 'идентификатор',
  `element_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор товара из таблицы `diafan_shop`',
  `additional_cost_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор сопутствующей услуги из таблицы `diafan_shop_additional_cost`',
  `summ` double NOT NULL DEFAULT 0 COMMENT 'сумма',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Связь сопутствующих услуг и товаров';

-- --------------------------------------------------------

--
-- Структура таблицы `diafan_shop_brand`
--

CREATE TABLE `diafan_shop_brand` (
  `id` int(11) UNSIGNED NOT NULL COMMENT 'идентификатор',
  `name1` text DEFAULT NULL COMMENT 'название',
  `act1` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'показывать на сайте: 0 - нет, 1 - да',
  `map_no_show` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'не показывать на карте сайта: 0 - нет, 1 - да',
  `changefreq` enum('always','hourly','daily','weekly','monthly','yearly','never') NOT NULL DEFAULT 'always' COMMENT 'Changefreq для sitemap.xml',
  `priority` varchar(3) NOT NULL DEFAULT '' COMMENT 'Priority для sitemap.xml',
  `noindex` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'не индексировать: 0 - нет, 1 - да',
  `site_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор страницы сайта из таблицы `diafan_site`',
  `keywords1` varchar(250) NOT NULL DEFAULT '' COMMENT 'ключевые слова, тег Keywords',
  `descr1` text DEFAULT NULL COMMENT 'описание, тэг Description',
  `canonical1` varchar(100) NOT NULL DEFAULT '' COMMENT 'канонический тег',
  `title_meta1` varchar(250) NOT NULL DEFAULT '' COMMENT 'заголовок окна в браузере, тег Title',
  `text1` text DEFAULT NULL COMMENT 'описание',
  `import` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'производитель только что импортирован: 0 - нет, 1 - да',
  `import_id` varchar(100) NOT NULL DEFAULT '' COMMENT 'собственный идентификатор производителя при импорте',
  `sort` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'подрядковый номер для сортировки',
  `timeedit` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'время последнего изменения в формате UNIXTIME',
  `admin_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'пользователь из таблицы `diafan_users`, добавивший или первый отредктировавший производителя в административной части',
  `theme` varchar(50) NOT NULL DEFAULT '' COMMENT 'шаблон страницы сайта',
  `view` varchar(50) NOT NULL DEFAULT '' COMMENT 'шаблон модуля',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Бренды';

--
-- Дамп данных таблицы `diafan_shop_brand`
--

INSERT INTO `diafan_shop_brand` (`id`, `name1`, `act1`, `map_no_show`, `changefreq`, `priority`, `noindex`, `site_id`, `keywords1`, `descr1`, `canonical1`, `title_meta1`, `text1`, `import`, `import_id`, `sort`, `timeedit`, `admin_id`, `theme`, `view`, `trash`) VALUES
(1, 'Фирма А', '1', '0', 'always', '', '0', 164, '', NULL, '', '', NULL, '0', '', 1, 1586763038, 0, '', '', '1');

-- --------------------------------------------------------

--
-- Структура таблицы `diafan_shop_brand_category_rel`
--

CREATE TABLE `diafan_shop_brand_category_rel` (
  `id` int(11) UNSIGNED NOT NULL COMMENT 'идентификатор',
  `element_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор производителя из таблицы `diafan_shop_brand`',
  `cat_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор категории из таблицы `diafan_shop_category`',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Связи производителей и категорий';

--
-- Дамп данных таблицы `diafan_shop_brand_category_rel`
--

INSERT INTO `diafan_shop_brand_category_rel` (`id`, `element_id`, `cat_id`, `trash`) VALUES
(1, 1, 0, '0');

-- --------------------------------------------------------

--
-- Структура таблицы `diafan_shop_cart`
--

CREATE TABLE `diafan_shop_cart` (
  `id` int(11) UNSIGNED NOT NULL COMMENT 'идентификатор',
  `user_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор пользователя из таблицы `diafan_users`',
  `session_id` varchar(64) NOT NULL DEFAULT '' COMMENT 'номер сессии пользователя из таблицы `diafan_sessions`, если не заполнен user_id',
  `name` varchar(250) NOT NULL DEFAULT '' COMMENT 'имя',
  `mail` varchar(64) NOT NULL DEFAULT '' COMMENT 'e-mail',
  `summ` double NOT NULL DEFAULT 0 COMMENT 'сумма заказа',
  `count_goods` double NOT NULL DEFAULT 0 COMMENT 'количество товарных позиций',
  `delivery_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор службы доставки из таблицы `diafan_shop_delivery`',
  `additional_cost` text DEFAULT NULL COMMENT 'идентификаторы сопутствующих услугах, разделенные запятой',
  `orders` text DEFAULT NULL COMMENT 'идентификаторы совершенных заказов, разделенные запятой',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Товары в корзине';

-- --------------------------------------------------------

--
-- Структура таблицы `diafan_shop_cart_goods`
--

CREATE TABLE `diafan_shop_cart_goods` (
  `id` int(11) UNSIGNED NOT NULL COMMENT 'идентификатор',
  `cart_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор корзины из таблицы `diafan_shop_cart`',
  `created` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'дата создания',
  `good_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор товара из таблицы `diafan_shop`',
  `price_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор цены товара - поле price_id из таблицы `diafan_shop_price`',
  `count` double NOT NULL DEFAULT 0 COMMENT 'количество товара',
  `param` text DEFAULT NULL COMMENT 'идентификаторы характеристик товара из таблицы `diafan_shop_parm_select`, разделенные запятой',
  `additional_cost` text DEFAULT NULL COMMENT 'идентификаторы сопутствующих услугах, разделенные запятой',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Товары в корзине';

-- --------------------------------------------------------

--
-- Структура таблицы `diafan_shop_cart_log_mail`
--

CREATE TABLE `diafan_shop_cart_log_mail` (
  `id` int(11) UNSIGNED NOT NULL COMMENT 'идентификатор',
  `created` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'дата отправления',
  `cart_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор корзины из таблицы `diafan_cart_id`',
  `order_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор заказа из таблицы `diafan_shop_order`',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Лог отправлений писем';

-- --------------------------------------------------------

--
-- Структура таблицы `diafan_shop_cashregister`
--

CREATE TABLE `diafan_shop_cashregister` (
  `master_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'главный идентификатор в формате UNIXTIME',
  `slave_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'вторичный идентификатор в интервале master_id',
  `id` varchar(21) NOT NULL DEFAULT '' COMMENT 'объединенный идентификатор',
  `type` enum('presell','sell','refund') NOT NULL DEFAULT 'sell' COMMENT 'тип чека: presell - предоплата, sell - полная оплата, refund - возврат',
  `important` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'защита от повторого чека: 0 - нет, 1 - да',
  `order_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор заказа из таблицы `diafan_shop_orders`',
  `external_id` varchar(255) NOT NULL DEFAULT '' COMMENT 'идентификатор чека, полученный от сервиса',
  `auto` enum('0','1') NOT NULL DEFAULT '1' COMMENT 'метод отправки чека: 0 - ручной, 1 - автоматический',
  `timeedit` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'время последнего изменения в формате UNIXTIME',
  `timesent` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'время отправки чека в формате UNIXTIME',
  `status` enum('0','1','2') NOT NULL DEFAULT '0' COMMENT 'отчет об отправки чека: 0 - не отправлено, 1 - отправлено, 2 - ошибка отправления',
  `payment` varchar(50) NOT NULL DEFAULT '' COMMENT 'касса из платежного метода',
  `error` text DEFAULT NULL COMMENT 'отчет об ошибке отправления',
  `trace` text DEFAULT NULL COMMENT 'трассировка отправления'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Чеки для онлайн кассы';

-- --------------------------------------------------------

--
-- Структура таблицы `diafan_shop_category`
--

CREATE TABLE `diafan_shop_category` (
  `id` int(11) UNSIGNED NOT NULL COMMENT 'идентификатор',
  `name1` text DEFAULT NULL COMMENT 'название',
  `act1` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'показывать на сайте: 0 - нет, 1 - да',
  `map_no_show` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'не показывать на карте сайта: 0 - нет, 1 - да',
  `changefreq` enum('always','hourly','daily','weekly','monthly','yearly','never') NOT NULL DEFAULT 'always' COMMENT 'Changefreq для sitemap.xml',
  `priority` varchar(3) NOT NULL DEFAULT '' COMMENT 'Priority для sitemap.xml',
  `noindex` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'не индексировать: 0 - нет, 1 - да',
  `parent_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор родителя из таблицы `diafan_shop_category`',
  `count_children` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'количество вложенных категорий',
  `site_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор страницы сайта из таблицы `diafan_site`',
  `keywords1` varchar(250) NOT NULL DEFAULT '' COMMENT 'ключевые слова, тег Keywords',
  `descr1` text DEFAULT NULL COMMENT 'описание, тэг Description',
  `canonical1` varchar(100) NOT NULL DEFAULT '' COMMENT 'канонический тег',
  `title_meta1` varchar(250) NOT NULL DEFAULT '' COMMENT 'заголовок окна в браузере, тег Title',
  `anons1` text DEFAULT NULL COMMENT 'анонс',
  `anons_plus1` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'добавлять анонс к описанию: 0 - нет, 1 - да',
  `text1` text DEFAULT NULL COMMENT 'описание',
  `show_yandex` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'выгружать в Яндекс.Маркет: 0 - нет, 1 - да (если в настройках выбрана выгрузка только выбранных категорий)',
  `show_google` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'выгружать в Google Merchant: 0 - нет, 1 - да (если в настройках выбрана выгрузка только выбранных товаров)',
  `import` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'категория только что импортирован: 0 - нет, 1 - да',
  `import_id` varchar(100) NOT NULL DEFAULT '' COMMENT 'собственный идентификатор категории при импорте',
  `sort` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'подрядковый номер для сортировки',
  `timeedit` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'время последнего изменения в формате UNIXTIME',
  `access` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'доступ ограничен: 0 - нет, 1 - да',
  `admin_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'пользователь из таблицы `diafan_users`, добавивший или первый отредктировавший категорию в административной части',
  `theme` varchar(50) NOT NULL DEFAULT '' COMMENT 'шаблон страницы сайта',
  `view` varchar(50) NOT NULL DEFAULT '' COMMENT 'шаблон модуля',
  `view_rows` varchar(50) NOT NULL DEFAULT '' COMMENT 'шаблон модуля для элементов в списке категории',
  `view_element` varchar(50) NOT NULL DEFAULT '' COMMENT 'шаблон модуля для элементов в категории',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Категории товаров';

--
-- Дамп данных таблицы `diafan_shop_category`
--

INSERT INTO `diafan_shop_category` (`id`, `name1`, `act1`, `map_no_show`, `changefreq`, `priority`, `noindex`, `parent_id`, `count_children`, `site_id`, `keywords1`, `descr1`, `canonical1`, `title_meta1`, `anons1`, `anons_plus1`, `text1`, `show_yandex`, `show_google`, `import`, `import_id`, `sort`, `timeedit`, `access`, `admin_id`, `theme`, `view`, `view_rows`, `view_element`, `trash`) VALUES
(1, 'Наши товары', '1', '0', 'always', '', '0', 0, 0, 164, '', NULL, '', '', NULL, '0', NULL, '0', '0', '0', '', 1, 1586763038, '0', 0, '', '', '', '', '1'),
(2, 'Механические устройства управления', '1', '0', 'monthly', '0', '0', 0, 0, 164, '', '', '', '', '', '0', '', '0', '0', '0', '', 2, 1586779795, '0', 1, '', '', '', '', '0'),
(3, 'Коробки отбора мощности', '1', '0', 'monthly', '0', '0', 0, 0, 164, '', '', '', '', '', '0', '', '0', '0', '0', '', 3, 1586779809, '0', 1, '', '', '', '', '0'),
(4, 'Шестеренчатые насосы', '1', '0', 'monthly', '0', '0', 0, 0, 164, '', '', '', '', '', '0', '', '0', '0', '0', '', 4, 1586779818, '0', 1, '', '', '', '', '0'),
(5, 'Ручные насосы', '1', '0', 'monthly', '0', '0', 0, 0, 164, '', '', '', '', '', '0', '', '0', '0', '0', '', 5, 1586779828, '0', 1, '', '', '', '', '0'),
(6, 'Гидравлические распределители', '1', '0', 'monthly', '0', '0', 0, 0, 164, '', '', '', '', '', '0', '', '0', '0', '0', '', 6, 1586779837, '0', 1, '', '', '', '', '0'),
(7, 'Пневматические органы управления', '1', '0', 'monthly', '0', '0', 0, 0, 164, '', '', '', '', '', '0', '', '0', '0', '0', '', 7, 1586779846, '0', 1, '', '', '', '', '0'),
(8, 'Поршневые насосы', '1', '0', 'monthly', '0', '0', 0, 0, 164, '', '', '', '', '', '0', '', '0', '0', '0', '', 8, 1586779854, '0', 1, '', '', '', '', '0'),
(9, 'Емкостное оборудование', '1', '0', 'monthly', '0', '0', 0, 0, 164, '', '', '', '', '', '0', '', '0', '0', '0', '', 9, 1586779869, '0', 1, '', '', '', '', '0');

-- --------------------------------------------------------

--
-- Структура таблицы `diafan_shop_category_parents`
--

CREATE TABLE `diafan_shop_category_parents` (
  `id` int(11) UNSIGNED NOT NULL COMMENT 'идентификатор',
  `element_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор категории из таблицы `diafan_shop_category`',
  `parent_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор категории-родителя из таблицы `diafan_shop_category`',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Родительские связи категорий товаров';

-- --------------------------------------------------------

--
-- Структура таблицы `diafan_shop_category_rel`
--

CREATE TABLE `diafan_shop_category_rel` (
  `id` int(11) UNSIGNED NOT NULL COMMENT 'идентификатор',
  `element_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор товара из таблицы `diafan_shop`',
  `cat_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор категории из таблицы `diafan_shop_category`',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Связи товаров и категорий';

-- --------------------------------------------------------

--
-- Структура таблицы `diafan_shop_counter`
--

CREATE TABLE `diafan_shop_counter` (
  `id` int(11) UNSIGNED NOT NULL COMMENT 'идентификатор',
  `element_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор товара из таблицы `diafan_shop`',
  `count_view` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'количество просмотров',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Счетчик просмотров товаров';

-- --------------------------------------------------------

--
-- Структура таблицы `diafan_shop_currency`
--

CREATE TABLE `diafan_shop_currency` (
  `id` smallint(5) UNSIGNED NOT NULL COMMENT 'идентификатор',
  `name` varchar(20) NOT NULL DEFAULT '' COMMENT 'название',
  `exchange_rate` double NOT NULL DEFAULT 0 COMMENT 'курс к основной валюте',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Дополнительные валюты магазина';

--
-- Дамп данных таблицы `diafan_shop_currency`
--

INSERT INTO `diafan_shop_currency` (`id`, `name`, `exchange_rate`, `trash`) VALUES
(1, 'Euro', 50, '0');

-- --------------------------------------------------------

--
-- Структура таблицы `diafan_shop_delivery`
--

CREATE TABLE `diafan_shop_delivery` (
  `id` smallint(5) UNSIGNED NOT NULL COMMENT 'идентификатор',
  `name1` varchar(50) NOT NULL DEFAULT '' COMMENT 'название',
  `text1` text DEFAULT NULL COMMENT 'описание',
  `service` varchar(50) NOT NULL DEFAULT '' COMMENT 'служба доставки',
  `params` text DEFAULT NULL COMMENT 'серилизованные настройки службы доставки',
  `act1` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'показывать на сайте: 0 - нет, 1 - да',
  `sort` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'подрядковый номер для сортировки',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Способы доставки';

--
-- Дамп данных таблицы `diafan_shop_delivery`
--

INSERT INTO `diafan_shop_delivery` (`id`, `name1`, `text1`, `service`, `params`, `act1`, `sort`, `trash`) VALUES
(1, 'Курьер', 'Товар доставляется курьером до двери Вашего дома.', '', NULL, '1', 1, '0'),
(2, 'Почта России', 'Доставка по всей России небольших посылок', '', NULL, '1', 2, '0'),
(3, 'EMS-доставка', 'Экспресс-доставка до дверей курьером в любую точку России', '', NULL, '1', 3, '0');

-- --------------------------------------------------------

--
-- Структура таблицы `diafan_shop_delivery_thresholds`
--

CREATE TABLE `diafan_shop_delivery_thresholds` (
  `id` smallint(5) UNSIGNED NOT NULL COMMENT 'идентификатор',
  `delivery_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор способа доставки из таблицы `diafan_shop_delivery`',
  `price` double NOT NULL DEFAULT 0 COMMENT 'стоимость',
  `amount` double NOT NULL DEFAULT 0 COMMENT 'сумма, от которой действует стоимость',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Стоимость способов доставки';

--
-- Дамп данных таблицы `diafan_shop_delivery_thresholds`
--

INSERT INTO `diafan_shop_delivery_thresholds` (`id`, `delivery_id`, `price`, `amount`, `trash`) VALUES
(1, 1, 500, 0, '0'),
(2, 1, 0, 6000, '0'),
(3, 2, 650, 0, '0'),
(4, 3, 1200, 0, '0');

-- --------------------------------------------------------

--
-- Структура таблицы `diafan_shop_discount`
--

CREATE TABLE `diafan_shop_discount` (
  `id` int(11) UNSIGNED NOT NULL COMMENT 'идентификатор',
  `date_start` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'дата начала действия',
  `date_finish` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'дата окночания действия',
  `discount` double NOT NULL DEFAULT 0 COMMENT 'процент скидки',
  `amount` double NOT NULL DEFAULT 0 COMMENT 'действует от цены товара',
  `deduction` double NOT NULL DEFAULT 0 COMMENT 'фиксированная сумма скидки',
  `threshold` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'действует от общей суммы заказа',
  `threshold_cumulative` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'действует от общей оплаченных заказов',
  `role_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '  тип пользователя из таблицы `diafan_users_role`, для которого установлена скидка',
  `act` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'показывать на сайте: 0 - нет, 1 - да',
  `person` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'скидка действует только для определенных пользователей: 0 - нет, 1 - да',
  `text` text DEFAULT NULL COMMENT 'описание скидки для администратора',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Скидки';

--
-- Дамп данных таблицы `diafan_shop_discount`
--

INSERT INTO `diafan_shop_discount` (`id`, `date_start`, `date_finish`, `discount`, `amount`, `deduction`, `threshold`, `threshold_cumulative`, `role_id`, `act`, `person`, `text`, `trash`) VALUES
(1, 0, 0, 5, 0, 0, 0, 0, 0, '1', '0', NULL, '1');

-- --------------------------------------------------------

--
-- Структура таблицы `diafan_shop_discount_coupon`
--

CREATE TABLE `diafan_shop_discount_coupon` (
  `id` int(11) UNSIGNED NOT NULL COMMENT 'идентификатор',
  `discount_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор скидки из таблицы `diafan_shop_discount`',
  `coupon` varchar(10) NOT NULL DEFAULT '' COMMENT 'код купона',
  `count_use` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'cколько раз можно использовать купон',
  `used` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'сколько раз купон использован при оформлении заказа',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Купоны на скидку';

-- --------------------------------------------------------

--
-- Структура таблицы `diafan_shop_discount_object`
--

CREATE TABLE `diafan_shop_discount_object` (
  `id` int(11) UNSIGNED NOT NULL COMMENT 'идентификатор',
  `discount_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор скидки из таблицы `diafan_shop_discount`',
  `cat_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор категории из таблицы `diafan_shop_category`',
  `good_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор товара из таблицы `diafan_shop`',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Товары и категории, на которые действуют скидки';

-- --------------------------------------------------------

--
-- Структура таблицы `diafan_shop_discount_person`
--

CREATE TABLE `diafan_shop_discount_person` (
  `id` int(11) UNSIGNED NOT NULL COMMENT 'идентификатор',
  `discount_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор скидки из таблицы `diafan_shop_discount`',
  `user_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор пользователя из таблицы `diafan_users`',
  `session_id` varchar(64) NOT NULL DEFAULT '' COMMENT 'номер сессии пользователя из таблицы `diafan_sessions`',
  `coupon_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор купона из таблицы `diafan_shop_discount_coupon`',
  `used` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'скидка уже использована: 0 - нет, 1 - да',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Пользователи, для которых действуют скидки';

-- --------------------------------------------------------

--
-- Структура таблицы `diafan_shop_files_codes`
--

CREATE TABLE `diafan_shop_files_codes` (
  `id` int(11) UNSIGNED NOT NULL COMMENT 'идентификатор',
  `shop_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор товара из таблицы `diafan_shop`',
  `code` varchar(50) NOT NULL DEFAULT '' COMMENT 'код для скачивания товара-файла',
  `date_finish` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'дата и время окончания действия кода'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Коды для скачивания товаров-нематериальных активов';

-- --------------------------------------------------------

--
-- Структура таблицы `diafan_shop_import`
--

CREATE TABLE `diafan_shop_import` (
  `id` int(11) UNSIGNED NOT NULL COMMENT 'идентификатор',
  `name` varchar(250) NOT NULL DEFAULT '' COMMENT 'название',
  `cat_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор описания файла из таблицы `diafan_shop_import`',
  `type` varchar(20) NOT NULL DEFAULT '' COMMENT 'тип',
  `params` text DEFAULT NULL COMMENT 'серилизованные данные о поле',
  `required` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'серилизованные данные о поле',
  `sort` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'выдавать ошибку, если поле не заполнено: 0 - нет, 1 - да',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Описание полей файлов импорта';

--
-- Дамп данных таблицы `diafan_shop_import`
--

INSERT INTO `diafan_shop_import` (`id`, `name`, `cat_id`, `type`, `params`, `required`, `sort`, `trash`) VALUES
(1, 'Идентификатор', 1, 'id', 'a:1:{s:4:\"type\";s:4:\"site\";}', '0', 1, '0'),
(2, 'Артикул товара', 1, 'article', NULL, '0', 2, '0'),
(3, 'Название товара', 1, 'name', NULL, '0', 3, '0'),
(4, 'Краткое описание', 1, 'anons', NULL, '0', 4, '0'),
(5, 'Полное описание товара', 1, 'text', NULL, '0', 5, '0'),
(6, 'Цена', 1, 'price', 'a:5:{s:9:\"delimitor\";s:1:\"&\";s:11:\"select_type\";s:3:\"key\";s:5:\"count\";i:0;s:8:\"currency\";i:0;s:15:\"select_currency\";s:3:\"key\";}', '0', 6, '0'),
(7, 'Количество', 1, 'count', 'a:2:{s:9:\"delimitor\";s:1:\"&\";s:11:\"select_type\";s:3:\"key\";}', '0', 7, '0'),
(8, 'Хит (1/0)', 1, 'hit', NULL, '0', 8, '0'),
(9, 'Новинка (1/0)', 1, 'new', NULL, '0', 9, '0'),
(10, 'Акция (1/0)', 1, 'action', NULL, '0', 10, '0'),
(11, 'Идентификатор', 2, 'id', 'a:1:{s:4:\"type\";s:4:\"site\";}', '0', 11, '0'),
(12, 'Название категории', 2, 'name', NULL, '0', 12, '0'),
(13, 'Краткое описание категории', 2, 'anons', NULL, '0', 13, '0'),
(14, 'Полное описание категории', 2, 'text', NULL, '0', 14, '0'),
(15, 'Идентификатор', 3, 'id', 'a:1:{s:4:\"type\";s:4:\"site\";}', '0', 15, '0'),
(16, 'Название производителя', 3, 'name', NULL, '0', 16, '0'),
(17, 'Описание категории', 3, 'text', NULL, '0', 17, '0');

-- --------------------------------------------------------

--
-- Структура таблицы `diafan_shop_import_category`
--

CREATE TABLE `diafan_shop_import_category` (
  `id` int(11) UNSIGNED NOT NULL COMMENT 'идентификатор',
  `name` varchar(250) NOT NULL DEFAULT '' COMMENT 'название',
  `format` enum('csv','xls') NOT NULL DEFAULT 'csv' COMMENT 'формат файла',
  `type` enum('good','category','brand') NOT NULL DEFAULT 'good' COMMENT 'тип данных: good - товары, category - категории товаров',
  `delete_items` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'удалять не описанные в файле данные: 0 - нет, 1 - да',
  `site_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор страницы сайта из таблицы `diafan_site`',
  `cat_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор категории из таблицы `diafan_shop_category`',
  `count_part` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'количество строк, выгружаемых за один проход скрипта',
  `delimiter` varchar(20) NOT NULL DEFAULT '' COMMENT 'разделитель данных в строке',
  `end_string` varchar(20) NOT NULL DEFAULT '' COMMENT 'обозначать конец строки символом',
  `encoding` varchar(20) NOT NULL DEFAULT '' COMMENT 'кодировка',
  `sub_delimiter` varchar(20) NOT NULL DEFAULT '' COMMENT 'разделитель данных внутри поля',
  `header` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'первая строка - названия столбцов: 0 - нет, 1 - да',
  `sort` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'подрядковый номер для сортировки',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Описание файлов импорта';

--
-- Дамп данных таблицы `diafan_shop_import_category`
--

INSERT INTO `diafan_shop_import_category` (`id`, `name`, `format`, `type`, `delete_items`, `site_id`, `cat_id`, `count_part`, `delimiter`, `end_string`, `encoding`, `sub_delimiter`, `header`, `sort`, `trash`) VALUES
(1, 'Импорт товаров', 'csv', 'good', '0', 164, 0, 20, ';', '', 'cp1251', '|', '0', 1, '0'),
(2, 'Импорт категорий', 'csv', 'category', '0', 164, 0, 20, ';', '', 'cp1251', '|', '0', 2, '0'),
(3, 'Импорт производителей', 'csv', 'brand', '0', 164, 0, 20, ';', '', 'cp1251', '|', '0', 3, '0');

-- --------------------------------------------------------

--
-- Структура таблицы `diafan_shop_order`
--

CREATE TABLE `diafan_shop_order` (
  `id` int(11) UNSIGNED NOT NULL COMMENT 'идентификатор',
  `user_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор пользователя из таблицы `diafan_users`',
  `created` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'дата создания',
  `status` enum('0','1','2','3','4') NOT NULL DEFAULT '0' COMMENT 'действие статуса заказа',
  `status_id` tinyint(3) NOT NULL DEFAULT 0 COMMENT 'идентификатор статуса заказа из таблицы `diafan_shop_order_status`',
  `lang_id` tinyint(2) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор языковой версии сайта, с которой был сделан заказ, из таблицы `diafan_languages`',
  `summ` double NOT NULL DEFAULT 0 COMMENT 'общая сумма заказа',
  `delivery_id` varchar(10) NOT NULL DEFAULT '0' COMMENT 'способ доставки из таблицы `diafan_shop_delivery`',
  `delivery_summ` double NOT NULL DEFAULT 0 COMMENT 'стоимость доставки',
  `delivery_info` text DEFAULT NULL COMMENT 'данные службы доставки',
  `discount_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор скидки из таблицы `diafan_shop_discount`',
  `discount_summ` double NOT NULL DEFAULT 0 COMMENT 'сумма скидки',
  `coupon` varchar(255) NOT NULL DEFAULT '' COMMENT 'код купона',
  `count_minus` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'товары списаны: 0 - нет, 1 - да',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Заказы';

-- --------------------------------------------------------

--
-- Структура таблицы `diafan_shop_order_additional_cost`
--

CREATE TABLE `diafan_shop_order_additional_cost` (
  `id` int(11) UNSIGNED NOT NULL COMMENT 'идентификатор',
  `order_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор заказа из таблицы `diafan_shop_order`',
  `order_goods_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор записи о купленном товаре из таблицы `diafan_shop_order_goods`',
  `additional_cost_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор сопутствующей услуги из таблицы `diafan_shop_additional_cost`',
  `summ` double NOT NULL DEFAULT 0 COMMENT 'сумма'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Сопутствующие услуги, включенные в заказ';

-- --------------------------------------------------------

--
-- Структура таблицы `diafan_shop_order_backend`
--

CREATE TABLE `diafan_shop_order_backend` (
  `id` smallint(5) UNSIGNED NOT NULL COMMENT 'идентификатор',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT 'название',
  `backend` varchar(50) NOT NULL DEFAULT '' COMMENT 'бэкенд',
  `params` text DEFAULT NULL COMMENT 'серилизованные настройки',
  `act` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'показывать на сайте: 0 - нет, 1 - да',
  `sort` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'подрядковый номер для сортировки',
  `list` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'выводить в списке: 0 - нет, 1 - да',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Расширения заказа';

--
-- Дамп данных таблицы `diafan_shop_order_backend`
--

INSERT INTO `diafan_shop_order_backend` (`id`, `name`, `backend`, `params`, `act`, `sort`, `list`, `trash`) VALUES
(1, 'Товарный чек', 'packing_list', NULL, '1', 1, '0', '0');

-- --------------------------------------------------------

--
-- Структура таблицы `diafan_shop_order_backend_element`
--

CREATE TABLE `diafan_shop_order_backend_element` (
  `id` int(11) UNSIGNED NOT NULL COMMENT 'идентификатор',
  `order_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор заказа из таблицы `diafan_shop_order`',
  `backend` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор расширения из таблицы `diafan_shop_order_backend`',
  `type` varchar(50) NOT NULL DEFAULT '' COMMENT 'тип - для разделения данных внутри бэкенда',
  `value` text DEFAULT NULL COMMENT 'данные',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Данные о заказе для бэкенда';

-- --------------------------------------------------------

--
-- Структура таблицы `diafan_shop_order_goods`
--

CREATE TABLE `diafan_shop_order_goods` (
  `id` int(11) UNSIGNED NOT NULL COMMENT 'идентификатор',
  `order_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор заказа из таблицы `diafan_shop_order`',
  `good_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор товара из таблицы `diafan_shop`',
  `discount_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор скидки из таблицы `diafan_shop_discount`',
  `count_goods` double NOT NULL DEFAULT 0 COMMENT 'количество товаров',
  `price` double NOT NULL DEFAULT 0 COMMENT 'цена',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Товары в заказе';

-- --------------------------------------------------------

--
-- Структура таблицы `diafan_shop_order_goods_param`
--

CREATE TABLE `diafan_shop_order_goods_param` (
  `id` int(11) UNSIGNED NOT NULL COMMENT 'идентификатор',
  `value` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'значение характеристики',
  `param_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор характеристики из таблицы `diafan_shop_param`',
  `order_goods_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор записи о купленном товаре из таблицы `diafan_shop_order_goods`',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Дополнительных характеристики товаров в заказе';

-- --------------------------------------------------------

--
-- Структура таблицы `diafan_shop_order_param`
--

CREATE TABLE `diafan_shop_order_param` (
  `id` int(11) UNSIGNED NOT NULL COMMENT 'идентификатор',
  `name1` varchar(250) NOT NULL DEFAULT '' COMMENT 'название',
  `text1` text DEFAULT NULL COMMENT 'описание',
  `type` varchar(20) NOT NULL DEFAULT '' COMMENT 'тип',
  `info` varchar(30) NOT NULL DEFAULT '' COMMENT 'смысловая нагрузка',
  `sort` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'подрядковый номер для сортировки',
  `required` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'обязательно для заполнения: 0 - нет, 1 - да',
  `show_in_form` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'использовать в стандатной форме оформления заказа: 0 - нет, 1 - да',
  `show_in_form_register` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'позволять редактировать из личного кабинета: 0 - нет, 1 - да',
  `show_in_form_one_click` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'использовать в форме быстрого заказа: 0 - нет, 1 - да',
  `config` text DEFAULT NULL COMMENT 'дополнительные настройки поля',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Поля конструктора формы оформления заказа';

--
-- Дамп данных таблицы `diafan_shop_order_param`
--

INSERT INTO `diafan_shop_order_param` (`id`, `name1`, `text1`, `type`, `info`, `sort`, `required`, `show_in_form`, `show_in_form_register`, `show_in_form_one_click`, `config`, `trash`) VALUES
(1, 'ФИО или название компании', NULL, 'text', 'name', 1, '1', '1', '0', '1', NULL, '0'),
(2, 'E-mail', NULL, 'email', 'email', 2, '1', '1', '0', '0', NULL, '0'),
(3, 'Контактные телефоны (с кодом города)', NULL, 'phone', 'phone', 3, '1', '1', '0', '1', NULL, '0'),
(4, 'Индекс', NULL, 'text', 'zip', 4, '0', '1', '0', '0', NULL, '0'),
(5, 'Город', NULL, 'text', 'city', 5, '0', '1', '0', '0', NULL, '0'),
(6, 'Улица, проспект и пр.', NULL, 'text', 'street', 6, '0', '1', '0', '0', NULL, '0'),
(7, 'Номер дома', NULL, 'text', 'building', 7, '0', '1', '0', '0', NULL, '0'),
(8, 'Корпус', NULL, 'text', 'suite', 8, '0', '1', '0', '0', NULL, '0'),
(9, 'Квартира, офис', NULL, 'text', 'flat', 9, '0', '1', '0', '0', NULL, '0'),
(10, 'Комментарии', NULL, 'textarea', 'comment', 10, '0', '1', '0', '0', NULL, '0');

-- --------------------------------------------------------

--
-- Структура таблицы `diafan_shop_order_param_element`
--

CREATE TABLE `diafan_shop_order_param_element` (
  `id` int(11) UNSIGNED NOT NULL COMMENT 'идентификатор',
  `value` text DEFAULT NULL COMMENT 'значение',
  `param_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор поля из таблицы `diafan_shop_order_param`',
  `element_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор заказа из таблицы `diafan_shop_order`',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Значения полей конструктора оформления заказа';

-- --------------------------------------------------------

--
-- Структура таблицы `diafan_shop_order_param_select`
--

CREATE TABLE `diafan_shop_order_param_select` (
  `id` int(11) UNSIGNED NOT NULL COMMENT 'идентификатор',
  `param_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор поля из таблицы `diafan_shop_order_param`',
  `value` tinyint(2) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'значение для типа характеристики «галочка»: 0 - нет, 1 - да',
  `name1` varchar(50) NOT NULL DEFAULT '' COMMENT 'значение',
  `sort` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'подрядковый номер для сортировки',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Варианты значений полей конструктора оформления заказа типа список';

-- --------------------------------------------------------

--
-- Структура таблицы `diafan_shop_order_param_user`
--

CREATE TABLE `diafan_shop_order_param_user` (
  `id` int(11) UNSIGNED NOT NULL COMMENT 'идентификатор',
  `value` text DEFAULT NULL COMMENT 'значение',
  `param_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор поля из таблицы `diafan_shop_order_param`',
  `user_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор пользователя из таблицы `diafan_users`',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Значения полей конструктора оформления заказа, предзаполненные пользователями';

-- --------------------------------------------------------

--
-- Структура таблицы `diafan_shop_order_status`
--

CREATE TABLE `diafan_shop_order_status` (
  `id` tinyint(3) UNSIGNED NOT NULL COMMENT 'идентификатор',
  `name1` varchar(50) NOT NULL DEFAULT '' COMMENT 'название',
  `color` varchar(20) NOT NULL DEFAULT '' COMMENT 'цвет',
  `status` enum('0','1','2','3','4') NOT NULL DEFAULT '0' COMMENT 'действие статуса заказа',
  `sort` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'подрядковый номер для сортировки',
  `count_minus` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'списывать товары: 0 - нет, 1 - да',
  `send_mail` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'отправлять уведомление пользователю о смене статуса: 0 - нет, 1 - да',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Статусы заказов';

--
-- Дамп данных таблицы `diafan_shop_order_status`
--

INSERT INTO `diafan_shop_order_status` (`id`, `name1`, `color`, `status`, `sort`, `count_minus`, `send_mail`, `trash`) VALUES
(1, 'Новый', '#D54640', '0', 1, '0', '0', '0'),
(2, 'В обработке', '#F49D10', '1', 2, '1', '1', '0'),
(3, 'Отменен', '#A6AEB0', '2', 3, '0', '1', '0'),
(4, 'Выполнен', '#8AC73C', '3', 4, '1', '1', '0');

-- --------------------------------------------------------

--
-- Структура таблицы `diafan_shop_param`
--

CREATE TABLE `diafan_shop_param` (
  `id` int(11) UNSIGNED NOT NULL COMMENT 'идентификатор',
  `name1` varchar(250) NOT NULL DEFAULT '' COMMENT 'название',
  `type` varchar(20) NOT NULL DEFAULT '' COMMENT 'тип',
  `sort` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'подрядковый номер для сортировки',
  `search` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'характеристика выводится в форме поиска: 0 - нет, 1 - да',
  `list` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'характеристика выводится в списке товаров: 0 - нет, 1 - да',
  `block` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'характеристика выводится в блоке товаров: 0 - нет, 1 - да',
  `id_page` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'характеристика выводится на странице товара: 0 - нет, 1 - да',
  `required` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'доступен к выбору при заказе: 0 - нет, 1 - да',
  `page` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'отдельная страница для значений: 0 - нет, 1 - да',
  `text1` text DEFAULT NULL COMMENT 'описание',
  `config` text DEFAULT NULL COMMENT 'дополнительные настройки поля',
  `display_in_sort` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'выводится в блоке для сортировки: 0 - нет, 1 - да',
  `yandex_use` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'выгружается в файл YML: 0 - нет, 1 - да',
  `yandex_name` varchar(100) NOT NULL DEFAULT '' COMMENT 'название в файле YML',
  `yandex_unit` varchar(50) NOT NULL DEFAULT '' COMMENT 'единица измерения в файле YML',
  `measure_unit1` varchar(50) NOT NULL DEFAULT '' COMMENT 'единица измерения',
  `site_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор страницы сайта из таблицы `diafan_site`',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Дополнительные характеристики товаров';

--
-- Дамп данных таблицы `diafan_shop_param`
--

INSERT INTO `diafan_shop_param` (`id`, `name1`, `type`, `sort`, `search`, `list`, `block`, `id_page`, `required`, `page`, `text1`, `config`, `display_in_sort`, `yandex_use`, `yandex_name`, `yandex_unit`, `measure_unit1`, `site_id`, `trash`) VALUES
(1, 'Размер', 'text', 1, '0', '0', '0', '1', '0', '0', NULL, NULL, '0', '0', '', '', '', 164, '1');

-- --------------------------------------------------------

--
-- Структура таблицы `diafan_shop_param_category_rel`
--

CREATE TABLE `diafan_shop_param_category_rel` (
  `id` int(11) UNSIGNED NOT NULL COMMENT 'идентификатор',
  `element_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор характеристики из таблицы `diafan_shop_param`',
  `cat_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор категории из таблицы `diafan_shop_category`',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Связи дополнительных характеристик товаров и категорий';

--
-- Дамп данных таблицы `diafan_shop_param_category_rel`
--

INSERT INTO `diafan_shop_param_category_rel` (`id`, `element_id`, `cat_id`, `trash`) VALUES
(1, 1, 0, '1');

-- --------------------------------------------------------

--
-- Структура таблицы `diafan_shop_param_element`
--

CREATE TABLE `diafan_shop_param_element` (
  `id` int(11) UNSIGNED NOT NULL COMMENT 'идентификатор',
  `value1` text DEFAULT NULL COMMENT 'значение',
  `param_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор характеристики из таблицы `diafan_shop_param`',
  `element_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор товара из таблицы `diafan_shop`',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Значения дополнительных характеристик товаров';

-- --------------------------------------------------------

--
-- Структура таблицы `diafan_shop_param_select`
--

CREATE TABLE `diafan_shop_param_select` (
  `id` int(11) UNSIGNED NOT NULL COMMENT 'идентификатор',
  `param_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор характеристики из таблицы `diafan_shop_param`',
  `value` tinyint(2) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'значение для типа характеристики «галочка»: 0 - нет, 1 - да',
  `name1` varchar(50) NOT NULL DEFAULT '' COMMENT 'значение',
  `sort` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'подрядковый номер для сортировки',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Варианты значений дополнительных характеристик товаров типа список';

-- --------------------------------------------------------

--
-- Структура таблицы `diafan_shop_price`
--

CREATE TABLE `diafan_shop_price` (
  `id` int(11) UNSIGNED NOT NULL COMMENT 'идентификатор',
  `good_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор товара из таблицы `diafan_shop`',
  `price` double UNSIGNED NOT NULL DEFAULT 0 COMMENT 'цена',
  `old_price` double UNSIGNED NOT NULL DEFAULT 0 COMMENT 'исходная цена',
  `count_goods` double NOT NULL DEFAULT 0 COMMENT 'количество товара',
  `price_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор исходной цены из таблицы `diafan_shop_price`',
  `date_start` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'дата начала действия',
  `date_finish` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'дата окончания действия',
  `discount` double NOT NULL DEFAULT 0 COMMENT 'скидка',
  `discount_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор скидки из таблицы `diafan_shop_discount`',
  `person` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'цена действует только для определенных пользователей: 0 - нет, 1 - да',
  `role_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор типа пользователя из таблицы `diafan_users_role`, для которого действует скидка',
  `currency_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор валюты из таблицы `diafan_shop_currency`',
  `import_id` varchar(100) NOT NULL DEFAULT '' COMMENT 'собственный идентификатор при импорте',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Цены товаров';

-- --------------------------------------------------------

--
-- Структура таблицы `diafan_shop_price_image_rel`
--

CREATE TABLE `diafan_shop_price_image_rel` (
  `id` int(11) UNSIGNED NOT NULL COMMENT 'идентификатор',
  `price_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор исходной цены из таблицы `diafan_shop_price`',
  `image_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор изображения из таблицы `diafan_images`',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Изображения товаров, прикрепленные к цене';

-- --------------------------------------------------------

--
-- Структура таблицы `diafan_shop_price_param`
--

CREATE TABLE `diafan_shop_price_param` (
  `id` int(11) UNSIGNED NOT NULL COMMENT 'идентификатор',
  `price_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор исходной цены из таблицы `diafan_shop_price`',
  `param_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор характеристики из таблицы `diafan_shop_param`',
  `param_value` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'значение характеристики - идентификатор из таблицы `diafan_shop_param_select`',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Дополнительные характеристики, учитываемые в цене';

-- --------------------------------------------------------

--
-- Структура таблицы `diafan_shop_rel`
--

CREATE TABLE `diafan_shop_rel` (
  `id` int(11) UNSIGNED NOT NULL COMMENT 'идентификатор',
  `element_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор товара из таблицы `diafan_shop`',
  `rel_element_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор похожего товара из таблицы `diafan_shop`',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Связи похожих товаров';

-- --------------------------------------------------------

--
-- Структура таблицы `diafan_shop_waitlist`
--

CREATE TABLE `diafan_shop_waitlist` (
  `id` int(11) UNSIGNED NOT NULL COMMENT 'идентификатор',
  `good_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор товара из таблицы `diafan_shop`',
  `user_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор пользователя из таблицы `diafan_users`',
  `lang_id` tinyint(2) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор языка сайта из таблицы `diafan_languages`',
  `mail` varchar(64) NOT NULL DEFAULT '' COMMENT 'e-mail пользователя',
  `created` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'дата создания',
  `param` text DEFAULT NULL COMMENT 'серилизованные данные о характеристиках товара (доступных к выбору при заказе)',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Товары в списке ожидания';

-- --------------------------------------------------------

--
-- Структура таблицы `diafan_shop_wishlist`
--

CREATE TABLE `diafan_shop_wishlist` (
  `id` int(11) UNSIGNED NOT NULL COMMENT 'идентификатор',
  `good_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор товара из таблицы `diafan_shop`',
  `user_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор пользователя из таблицы `diafan_users`',
  `session_id` varchar(64) NOT NULL DEFAULT '' COMMENT 'номер сессии пользователя из таблицы `diafan_sessions`',
  `created` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'дата создания',
  `count` double UNSIGNED NOT NULL DEFAULT 0 COMMENT 'количество товара',
  `param` text DEFAULT NULL COMMENT 'серилизованные данные о характеристиках товара (доступных к выбору при заказе)',
  `additional_cost` text DEFAULT NULL COMMENT 'идентификаторы сопутствующих услугах, разделенные запятой',
  `is_file` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'товар-файл: 0 - нет, 1 - да',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Товары в списке пожеланий';

-- --------------------------------------------------------

--
-- Структура таблицы `diafan_site`
--

CREATE TABLE `diafan_site` (
  `id` int(11) UNSIGNED NOT NULL COMMENT 'идентификатор',
  `parent_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор родителя из таблицы `diafan_site`',
  `count_children` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'количество вложенных страниц',
  `name1` varchar(100) NOT NULL DEFAULT '' COMMENT 'название',
  `title_meta1` varchar(250) NOT NULL DEFAULT '' COMMENT 'заголовок окна в браузере, тег Title',
  `keywords1` varchar(250) NOT NULL DEFAULT '' COMMENT 'ключевые слова, тег Keywords',
  `descr1` text DEFAULT NULL COMMENT 'описание, тэг Description',
  `canonical1` varchar(100) NOT NULL DEFAULT '' COMMENT 'канонический тег',
  `text1` longtext DEFAULT NULL COMMENT 'контент',
  `act1` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'показывать на сайте: 0 - нет, 1 - да',
  `access` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'доступ ограничен: 0 - нет, 1 - да',
  `date_start` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'дата начала показа',
  `date_finish` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'дата окончания показа',
  `admin_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'пользователь из таблицы `diafan_users`, добавивший или первый отредктировавший страницу в административной части',
  `title_no_show` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'не копировать заголовок в H1: 0 - нет, 1 - да',
  `map_no_show` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'не показывать на карте сайта: 0 - нет, 1 - да',
  `changefreq` enum('always','hourly','daily','weekly','monthly','yearly','never') NOT NULL DEFAULT 'always' COMMENT 'Changefreq для sitemap.xml',
  `priority` varchar(3) NOT NULL DEFAULT '' COMMENT 'Priority для sitemap.xml',
  `noindex` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'не индексировать: 0 - нет, 1 - да',
  `search_no_show` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'не участвует в поисковой выдаче: 0 - нет, 1 - да',
  `sort` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'подрядковый номер для сортировки',
  `timeedit` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'время последнего изменения в формате UNIXTIME',
  `theme` varchar(50) NOT NULL DEFAULT '' COMMENT 'шаблон страницы сайта',
  `module_name` varchar(50) NOT NULL DEFAULT '' COMMENT 'прикрепленный модуль',
  `js` text DEFAULT NULL COMMENT 'JS-код',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Страницы сайта';

--
-- Дамп данных таблицы `diafan_site`
--

INSERT INTO `diafan_site` (`id`, `parent_id`, `count_children`, `name1`, `title_meta1`, `keywords1`, `descr1`, `canonical1`, `text1`, `act1`, `access`, `date_start`, `date_finish`, `admin_id`, `title_no_show`, `map_no_show`, `changefreq`, `priority`, `noindex`, `search_no_show`, `sort`, `timeedit`, `theme`, `module_name`, `js`, `trash`) VALUES
(1, 0, 0, 'Главная страница', '', '', '', '', '<div class=\"serticatblock\">\r\n				<div class=\"container\">\r\n					<div class=\"row\">\r\n						<div class=\"col-md-9\">\r\n							<div class=\"sertficatinfo\">\r\n								<h2>О компании</h2>\r\n								<div class=\"textblock\">\r\n									<p>Компания ООО «Грузоподъемные Системы» основана 05.10.2005 года. С самого начала нами была\r\n										поставлена высокая планка в организации удобства работы клиентов с нашей компанией. Благодаря\r\n										такому подходу мы не просто работаем, а активно развиваемся, открываем новые направления,\r\n										привлекаем иностранных партнеров, работаем над логистикой и ценообразованием.</p>\r\n									<p style=\"color: #000;\"><b>Основные направления деятельности компании:</b></p>\r\n									<p>\r\n										<ul>\r\n											<li>- Реализация новых автомобилей и спецтехники</li>\r\n											<li>- Реализация б/у автомобилей и спецтехники на шасси КАМАЗ, УРАЛ</li>\r\n											<li>- Реализация запасных частей</li>\r\n											<li>- Выкуп автомобилей корпоративных автопарков</li>\r\n											<li>- Ремонт и доработка автомобилей на шасси КамАЗ</li>\r\n										</ul>\r\n									</p>\r\n									<p><a href=\"\" class=\"readmore\">Подробнее</a></p>\r\n								</div>\r\n							</div>\r\n						</div>\r\n						<div class=\"col-md-3\">\r\n							<div class=\"sertificatslider\">\r\n								<div class=\"sertificatslider__container\">\r\n									<div class=\"sertificatslider__slider\">\r\n										<div class=\"sertificatslider__slide\">\r\n											<div class=\"sertificatslider__item\"><a href=\"/images/sertificat.png\" data-lightbox=\"sertificat\"><img src=\"/images/sertificat.png\" alt=\"\"></a></div>\r\n										</div>\r\n										<div class=\"sertificatslider__slide\">\r\n											<div class=\"sertificatslider__item\"><a href=\"/images/sertificat.png\" data-lightbox=\"sertificat\"><img src=\"/images/sertificat.png\" alt=\"\"></a></div>\r\n										</div>										\r\n									</div>\r\n									<div  class=\"sertificatslider__controls\">\r\n										<div class=\"sertificatslider__zoom\"><a href=\"/images/sertificat.png\" data-lightbox=\"sertificat\"><img src=\"/images/add.png\" alt=\"\"></a></div>\r\n										<div class=\"sertificatslider__arrows\">\r\n											<div class=\"sertificatslider__left\"><img src=\"/images/sertificat-left.png\" alt=\"\"></div>\r\n											<div class=\"sertificatslider__right\"><img src=\"/images/sertificat-right.png\" alt=\"\"></div>\r\n										</div>\r\n									</div>\r\n								</div>\r\n							</div>\r\n						</div>\r\n					</div>\r\n				</div>\r\n			</div>', '1', '0', 0, 0, 1, '1', '0', 'always', '0', '0', '0', 1, 1586780618, 'site_start.php', '', '', '0'),
(2, 0, 6, 'Полезное', '', '', NULL, '', '<insert name=\"show_links\" module=\"site\">', '0', '0', 0, 0, 0, '0', '0', 'always', '', '0', '0', 2, 1586763037, '', '', NULL, '0'),
(3, 0, 2, 'Страница пользователя', '', '', NULL, '', NULL, '0', '0', 0, 0, 0, '0', '1', 'always', '', '1', '1', 5, 1586763038, '', 'userpage', NULL, '0'),
(4, 0, 3, 'О компании', '', '', NULL, '', NULL, '0', '0', 0, 0, 0, '0', '0', 'always', '', '0', '0', 1, 1586763037, '', '', NULL, '0'),
(150, 0, 0, 'Согласие на обработку персональных данных', '', '', NULL, '', '<p>Пользователь, оставляя заявку, принимает настоящее Согласие на обработку персональных данных (далее – Согласие). Действуя свободно, своей волей и в своем интересе, а также подтверждая свою дееспособность, Пользователь дает свое согласие на обработку своих персональных данных со следующими условиями:</p>\n					<ol>\n					<li>Данное Согласие дается на обработку персональных данных, как без использования средств автоматизации, так и с их использованием.</li>\n					<li>Согласие дается на обработку следующих персональных данных: Персональные данные, не являющиеся специальными или биометрическими: номера контактных телефонов; адреса электронной почты; место работы и занимаемая должность; пользовательские данные (сведения о местоположении; тип и версия ОС; тип и версия Браузера; тип устройства и разрешение его экрана; источник откуда пришел на сайт пользователь; с какого сайта или по какой рекламе; язык ОС и Браузера; какие страницы открывает и на какие кнопки нажимает пользователь; ip-адрес.</li>\n					<li>Персональные данные не являются общедоступными.</li>\n					<li>Цель обработки персональных данных: обработка входящих запросов физических лиц с целью оказания консультирования; аналитики действий физического лица на веб-сайте и функционирования веб-сайта; проведение рекламных и новостных рассылок.</li>\n					<li>Основанием для обработки персональных данных является: ст. 24 Конституции Российской Федерации; ст.6 Федерального закона №152-ФЗ «О персональных данных»; настоящее согласие на обработку персональных данных</li>\n					<li>В ходе обработки с персональными данными будут совершены следующие действия: сбор; запись; систематизация; накопление; хранение; уточнение (обновление, изменение); извлечение; использование; передача (распространение, предоставление, доступ); блокирование; удаление; уничтожение.</li>\n					<li>Персональные данные обрабатываются до отписки физического лица от рекламных и новостных рассылок. Также обработка персональных данных может быть прекращена по запросу субъекта персональных данных. Хранение персональных данных, зафиксированных на бумажных носителях осуществляется согласно Федеральномузакону №125-ФЗ «Об архивном деле в Российской Федерации» и иным нормативно правовым актам в области архивного дела и архивного хранения. </li>\n					<li>Согласие может быть отозвано субъектом персональных данных или его представителем путем направления письменного заявления по адресу, указанному на главной странице настоящего сайта.</li>\n					<li>В случае отзыва субъектом персональных данных или его представителем согласия на обработку персональных данных владельцы сайта вправе продолжить обработку персональных данных без согласия субъекта персональных данных при наличии оснований, указанных в пунктах 2 – 11 части 1 статьи 6, части 2 статьи 10 и части 2 статьи 11 Федерального закона №152-ФЗ «О персональных данных» от 27.07.2006 г.</li>\n					<li>Настоящее согласие действует все время до момента прекращения обработки персональных данных, указанных в п.7 и п.8 данного Согласия.</li></ol></p>', '1', '0', 0, 0, 0, '0', '0', 'always', '', '0', '0', 1, 1586763037, '', '', NULL, '0'),
(151, 2, 0, 'Объявления', '', '', NULL, '', NULL, '0', '0', 0, 0, 0, '0', '0', 'always', '', '0', '0', 151, 1586763037, '', 'ab', NULL, '0'),
(152, 3, 0, 'Баланс', '', '', NULL, '', NULL, '0', '0', 0, 0, 0, '0', '1', 'always', '', '1', '1', 152, 1586763037, '', 'balance', NULL, '0'),
(153, 2, 0, 'Статьи', '', '', NULL, '', NULL, '0', '0', 0, 0, 0, '0', '0', 'always', '', '0', '0', 153, 1586763037, '', 'clauses', NULL, '0'),
(154, 4, 0, 'Вопрос-Ответ', '', '', NULL, '', NULL, '0', '0', 0, 0, 0, '0', '0', 'always', '', '0', '0', 154, 1586763037, '', 'faq', NULL, '0'),
(155, 4, 0, 'Обратная связь', '', '', NULL, '', NULL, '0', '0', 0, 0, 0, '0', '0', 'always', '', '0', '0', 155, 1586763037, '', 'feedback', NULL, '0'),
(156, 2, 0, 'Файловый архив', '', '', NULL, '', NULL, '0', '0', 0, 0, 0, '0', '0', 'always', '', '0', '0', 156, 1586763037, '', 'files', NULL, '0'),
(157, 2, 0, 'Форум', '', '', NULL, '', NULL, '0', '0', 0, 0, 0, '0', '0', 'always', '', '0', '0', 157, 1586763037, '', 'forum', NULL, '0'),
(158, 0, 0, 'Карта сайта', '', '', NULL, '', NULL, '1', '0', 0, 0, 0, '0', '1', 'always', '', '1', '1', 158, 1586763037, '', 'map', NULL, '0'),
(159, 3, 0, 'Сообщения', '', '', NULL, '', NULL, '0', '0', 0, 0, 0, '0', '1', 'always', '', '1', '1', 159, 1586763037, '', 'messages', NULL, '0'),
(160, 2, 0, 'Новости', '', '', NULL, '', NULL, '0', '0', 0, 0, 0, '0', '0', 'always', '', '0', '0', 160, 1586763037, '', 'news', NULL, '0'),
(161, 2, 0, 'Фотогалерея', '', '', NULL, '', NULL, '0', '0', 0, 0, 0, '0', '0', 'always', '', '0', '0', 161, 1586763037, '', 'photo', NULL, '0'),
(162, 4, 0, 'Отзывы', '', '', NULL, '', '<insert name=\"show\" module=\"reviews\">', '0', '0', 0, 0, 0, '0', '0', 'always', '', '0', '0', 162, 1586763037, '', 'reviews', NULL, '0'),
(163, 0, 0, 'Поиск', '', '', NULL, '', NULL, '1', '0', 0, 0, 0, '0', '1', 'always', '', '1', '1', 163, 1586763037, '', 'search', NULL, '0'),
(164, 0, 6, 'Каталог товаров', '', '', '', '', '', '1', '0', 0, 0, 1, '0', '0', 'always', '0', '0', '0', 4, 1586765913, '', 'shop', '', '0'),
(165, 164, 0, 'Корзина', '', '', NULL, '', '<insert name=\"show_add_coupon\" module=\"shop\">', '1', '0', 0, 0, 0, '0', '0', 'always', '', '1', '1', 165, 1586763038, '', 'cart', NULL, '0'),
(166, 164, 0, 'Заказ оформлен', '', '', NULL, '', '<p>Спасибо за Ваш заказ! В ближайшее время мы свяжемся с Вами!</p><insert name=\"show_last_order\" module=\"cart\">', '1', '0', 0, 0, 0, '0', '0', 'always', '', '1', '1', 166, 1586763038, '', '', NULL, '0'),
(167, 164, 0, 'Отложенные', '', '', NULL, '', NULL, '1', '0', 0, 0, 0, '0', '0', 'always', '', '1', '1', 167, 1586763038, '', 'wishlist', NULL, '0'),
(168, 0, 0, 'Рассылки', '', '', NULL, '', NULL, '0', '0', 0, 0, 0, '0', '1', 'always', '', '1', '1', 168, 1586763038, '', 'subscription', NULL, '0'),
(169, 0, 0, 'Теги', '', '', NULL, '', NULL, '0', '0', 0, 0, 0, '0', '0', 'always', '', '0', '0', 169, 1586763038, '', 'tags', NULL, '0'),
(170, 3, 0, 'Настройки аккаунта', '', '', NULL, '', NULL, '0', '0', 0, 0, 0, '0', '1', 'always', '', '1', '1', 170, 1586763038, '', 'usersettings', NULL, '0'),
(171, 0, 0, 'Регистрация', '', '', NULL, '', NULL, '0', '0', 0, 0, 0, '0', '1', 'always', '', '1', '1', 171, 1586763038, '', 'registration', NULL, '0'),
(172, 0, 0, 'Восстановление доступа', '', '', NULL, '', NULL, '0', '0', 0, 0, 0, '0', '1', 'always', '', '1', '1', 172, 1586763038, '', 'reminding', NULL, '0'),
(173, 0, 0, 'Оплата и доставка', '', '', '', '', '', '1', '0', 0, 0, 1, '0', '0', 'monthly', '0', '0', '0', 173, 1586765880, '', '', '', '0'),
(174, 0, 0, 'О компании', '', '', '', '', '<div class=\"about\">\r\n				<div class=\"serticatblock\" style=\"padding: 0;\">\r\n				<div class=\"container\">\r\n				<div class=\"about__content\">\r\n					<div class=\"row\">\r\n						<div class=\"col-md-9\">\r\n							<div class=\"sertficatinfo\">\r\n								\r\n								<div class=\"textblock\"  style=\"padding: 0 25px 0 0;\">\r\n									<p>Компания <b>ООО «Грузоподъемные Системы»</b> основана 05.10.2005 года. С самого начала нами была\r\n										поставлена высокая планка в организации удобства работы клиентов с нашей компанией. Благодаря\r\n										такому подходу мы не просто работаем, а активно развиваемся, открываем новые направления,\r\n										привлекаем иностранных партнеров, работаем над логистикой и ценообразованием.</p>\r\n									<p style=\"color: #000;\"><b>Основные направления деятельности компании:</b></p>\r\n									<p>\r\n										<ul>\r\n											<li>- Реализация новых автомобилей и спецтехники</li>\r\n											<li>- Реализация б/у автомобилей и спецтехники на шасси КАМАЗ, УРАЛ</li>\r\n											<li>- Реализация запасных частей</li>\r\n											<li>- Выкуп автомобилей корпоративных автопарков</li>\r\n											<li>- Ремонт и доработка автомобилей на шасси КамАЗ</li>\r\n										</ul>\r\n									</p>\r\n									<p style=\"color: #000;\"><b>Банковские реквизиты:</b></p>\r\n									<div class=\"about__text1\">\r\n										<div>ИНН 1650131757  |  КПП 165001001</div>\r\n										<div>Р/с 407 028 105 291 400 000 41 в Филиале \"Нижегородский\" ОАО \"АЛЬФА-БАНК\" г. Нижний Новгород</div>\r\n										<div>К/с 301 018 102 000 000 00 824</div>\r\n										<div>БИК 042 202 824</div>\r\n										<div>ОГРН 1051614162203</div>\r\n										<div>ОКПО 78684100</div>\r\n									</div>\r\n\r\n								</div>\r\n							</div>\r\n						</div>\r\n						<div class=\"col-md-3\">\r\n							<div class=\"sertificatslider\">\r\n								<div class=\"sertificatslider__container\">\r\n									<div class=\"sertificatslider__slider\">\r\n										<div class=\"sertificatslider__slide\">\r\n											<div class=\"sertificatslider__item\"><a href=\"/images/sertificat.png\" data-lightbox=\"sertificat\"><img src=\"/images/sertificat.png\" alt=\"\"></a></div>\r\n										</div>\r\n										<div class=\"sertificatslider__slide\">\r\n											<div class=\"sertificatslider__item\"><a href=\"/images/sertificat.png\" data-lightbox=\"sertificat\"><img src=\"/images/sertificat.png\" alt=\"\"></a></div>\r\n										</div>										\r\n									</div>\r\n									<div  class=\"sertificatslider__controls\">\r\n										<div class=\"sertificatslider__zoom\"><a href=\"/images/sertificat.png\" data-lightbox=\"sertificat\"><img src=\"/images/add.png\" alt=\"\"></a></div>\r\n										<div class=\"sertificatslider__arrows\">\r\n											<div class=\"sertificatslider__left\"><img src=\"/images/sertificat-left.png\" alt=\"\"></div>\r\n											<div class=\"sertificatslider__right\"><img src=\"/images/sertificat-right.png\" alt=\"\"></div>\r\n										</div>\r\n									</div>\r\n								</div>\r\n							</div>\r\n						</div>\r\n					</div>\r\n				</div></div>\r\n			</div>\r\n			</div>', '1', '0', 0, 0, 1, '0', '0', 'monthly', '0', '0', '0', 174, 1586783031, '', '', '', '0'),
(175, 0, 0, 'Контакты', '', '', '', '', '<div class=\"contacts\">\r\n						<div class=\"container\">\r\n							<div class=\"contacts__content\">\r\n								<div class=\"row\">\r\n									<div class=\"col-md-5\">\r\n										<div class=\"contacts__left\">\r\n											<div class=\"contacts__items\">\r\n												<div class=\"contacts__item\">\r\n													<div class=\"contacts__title\">Адрес</div>\r\n													<div class=\"contacts__text\">Республика Татарстан, г. Набережные Челны, Промышленно-коммунальная зона Промзона, Пролетарский проезд 22/15</div>\r\n												</div>\r\n												<div class=\"contacts__item\">\r\n													<div class=\"contacts__title\">Почтовый адрес</div>\r\n													<div class=\"contacts__text\">423827, Республика Татарстан, г. Набережные Челны, а/я 27144</div>\r\n												</div>\r\n												<div class=\"contacts__item\">\r\n													<div class=\"contacts__title\">Телефон</div>\r\n													<div class=\"contacts__text\"><b>8-800-333-87-17</b><small> - звонок по России бесплатный!</small></div>\r\n												</div>\r\n												<div class=\"contacts__item\">\r\n													<div class=\"contacts__title\">E-mail</div>\r\n													<div class=\"contacts__text\">d1@gps-avto.su</div>\r\n												</div>												\r\n											</div>\r\n										</div>\r\n									</div>\r\n									<div class=\"col-md-7\">\r\n										<div class=\"map\">\r\n											<iframe src=\"https://yandex.ru/map-widget/v1/?um=constructor%3A8d59cb1d90480aabc92f5b0019331af2923b065340b21ebcb9a538e8d0f18a7a&amp;source=constructor\" width=\"100%\" height=\"480\" frameborder=\"0\"></iframe>\r\n										</div>\r\n									</div>\r\n								</div>\r\n							</div>\r\n						</div>\r\n					</div>', '1', '0', 0, 0, 1, '0', '0', 'monthly', '0', '0', '0', 175, 1586781991, '', '', '', '0'),
(176, 0, 0, 'Обратный звонок', '', '', '', '', '', '1', '0', 0, 0, 1, '0', '0', 'monthly', '0', '0', '0', 176, 1586769400, '', 'feedback', '', '0');

-- --------------------------------------------------------

--
-- Структура таблицы `diafan_site_blocks`
--

CREATE TABLE `diafan_site_blocks` (
  `id` int(11) UNSIGNED NOT NULL COMMENT 'идентификатор',
  `name1` varchar(100) NOT NULL DEFAULT '' COMMENT 'название',
  `text1` text DEFAULT NULL COMMENT 'описание',
  `act1` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'показывать на сайте: 0 - нет, 1 - да',
  `access` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'доступ ограничен: 0 - нет, 1 - да',
  `title_no_show` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'не показывать заголовок: 0 - нет, 1 - да',
  `date_start` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'дата начала показа',
  `date_finish` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'дата окончания показа',
  `admin_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'пользователь из таблицы `diafan_users`, добавивший или первый отредктировавший блок в административной части',
  `sort` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'подрядковый номер для сортировки',
  `timeedit` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'время последнего изменения в формате UNIXTIME',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Блоки на сайте';

--
-- Дамп данных таблицы `diafan_site_blocks`
--

INSERT INTO `diafan_site_blocks` (`id`, `name1`, `text1`, `act1`, `access`, `title_no_show`, `date_start`, `date_finish`, `admin_id`, `sort`, `timeedit`, `trash`) VALUES
(1, 'Телефон в шапке сайта', '<a href=\"tel:88003338717\">8 (800) 333 87 17</a>', '1', '0', '1', 0, 0, 1, 1, 1586764080, '0'),
(2, 'Контакты в футере', '<div class=\"footer__text\">\r\n									<div class=\"footer__address\">г. Набережные Челны, Промышленно-коммунальная зона Промзона, Пролетарский проезд 22/15</div>\r\n								</div>\r\n								<div class=\"footer__text\">\r\n									<div class=\"footer__contacts\">\r\n										<a href=\"tel:89172298818\">тел. <span>8 (917) 229-88-18</span></a>\r\n										<a href=\"mailto:gps-a@yandex.ru\">E-mail: gps-a@yandex.ru</a>\r\n									</div>\r\n								</div>', '1', '0', '1', 0, 0, 1, 2, 1586781626, '0'),
(3, 'Данные организации', '<p>ИНН 1650131757</p>\r\n										<p>КПП 165001001</p>\r\n										<p>Р/с 407 028 105 291 400 000 41</p>\r\n										<p>К/с 301 018 102 000 000 00 824</p>\r\n										<p>БИК 042 202 824</p>\r\n										<p>ОГРН 1051614162203</p>', '1', '0', '1', 0, 0, 1, 3, 1586781707, '0'),
(4, 'Блок о возврате в карточке товара', '<p>14 дней возврат/обмен<br> 2 года гарантия</p>', '1', '0', '1', 0, 0, 0, 4, 1586763037, '0');

-- --------------------------------------------------------

--
-- Структура таблицы `diafan_site_blocks_site_rel`
--

CREATE TABLE `diafan_site_blocks_site_rel` (
  `id` int(11) UNSIGNED NOT NULL COMMENT 'идентификатор',
  `element_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор блока из таблицы `diafan_site_blocks`',
  `site_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор страницы сайта из таблицы `diafan_site`',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Данные о том, на каких страницах выводятся блоки на сайте';

--
-- Дамп данных таблицы `diafan_site_blocks_site_rel`
--

INSERT INTO `diafan_site_blocks_site_rel` (`id`, `element_id`, `site_id`, `trash`) VALUES
(4, 4, 0, '0'),
(5, 1, 0, '0'),
(6, 2, 0, '0'),
(7, 3, 0, '0');

-- --------------------------------------------------------

--
-- Структура таблицы `diafan_site_dynamic`
--

CREATE TABLE `diafan_site_dynamic` (
  `id` int(11) UNSIGNED NOT NULL COMMENT 'идентификатор',
  `name1` varchar(100) NOT NULL DEFAULT '' COMMENT 'название',
  `text` text DEFAULT NULL COMMENT 'описание',
  `act1` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'показывать на сайте: 0 - нет, 1 - да',
  `type` varchar(20) NOT NULL DEFAULT '' COMMENT 'тип',
  `access` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'доступ ограничен: 0 - нет, 1 - да',
  `title_no_show` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'не показывать заголовок: 0 - нет, 1 - да',
  `date_start` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'дата начала показа',
  `date_finish` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'дата окончания показа',
  `admin_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'пользователь из таблицы `diafan_users`, добавивший или первый отредктировавший блок в административной части',
  `sort` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'подрядковый номер для сортировки',
  `timeedit` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'время последнего изменения в формате UNIXTIME',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Динамические блоки';

--
-- Дамп данных таблицы `diafan_site_dynamic`
--

INSERT INTO `diafan_site_dynamic` (`id`, `name1`, `text`, `act1`, `type`, `access`, `title_no_show`, `date_start`, `date_finish`, `admin_id`, `sort`, `timeedit`, `trash`) VALUES
(1, 'Источник новости и автор текста', NULL, '1', 'editor', '0', '0', 0, 0, 0, 1, 1586763037, '0');

-- --------------------------------------------------------

--
-- Структура таблицы `diafan_site_dynamic_element`
--

CREATE TABLE `diafan_site_dynamic_element` (
  `id` int(11) UNSIGNED NOT NULL COMMENT 'идентификатор',
  `dynamic_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор динамического блока из таблицы `diafan_site_dynamic`',
  `module_name` varchar(50) NOT NULL DEFAULT '' COMMENT 'название модуля',
  `element_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор элемента модуля',
  `element_type` varchar(20) NOT NULL DEFAULT '' COMMENT 'тип элемента',
  `value1` text DEFAULT NULL COMMENT 'значение',
  `parent` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'применить к элементам категории: 0 - нет, 1 - да',
  `category` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'применить к вложенным элементам: 0 - нет, 1 - да',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Контент динамических блоков, заполенный в элементах модулей';

-- --------------------------------------------------------

--
-- Структура таблицы `diafan_site_dynamic_module`
--

CREATE TABLE `diafan_site_dynamic_module` (
  `id` int(11) UNSIGNED NOT NULL COMMENT 'идентификатор',
  `dynamic_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор динамического блока из таблицы `diafan_site_dynamic`',
  `module_name` varchar(50) NOT NULL DEFAULT '' COMMENT 'название модуля',
  `element_type` varchar(20) NOT NULL DEFAULT '' COMMENT 'тип элемента',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Данные о том, в каких модулях заполняются динамические блоки';

--
-- Дамп данных таблицы `diafan_site_dynamic_module`
--

INSERT INTO `diafan_site_dynamic_module` (`id`, `dynamic_id`, `module_name`, `element_type`, `trash`) VALUES
(1, 1, 'news', 'element', '0');

-- --------------------------------------------------------

--
-- Структура таблицы `diafan_site_parents`
--

CREATE TABLE `diafan_site_parents` (
  `id` int(11) UNSIGNED NOT NULL COMMENT 'идентификатор',
  `element_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор страницы из таблицы `diafan_site`',
  `parent_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор страницы-родителя из таблицы `diafan_site`',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Родительские связи страниц сайта';

--
-- Дамп данных таблицы `diafan_site_parents`
--

INSERT INTO `diafan_site_parents` (`id`, `element_id`, `parent_id`, `trash`) VALUES
(1, 151, 2, '0'),
(2, 152, 3, '0'),
(3, 153, 2, '0'),
(4, 154, 4, '0'),
(5, 155, 4, '0'),
(6, 156, 2, '0'),
(7, 157, 2, '0'),
(8, 159, 3, '0'),
(9, 160, 2, '0'),
(10, 161, 2, '0'),
(11, 162, 4, '0'),
(12, 165, 164, '0'),
(13, 166, 164, '0'),
(14, 167, 164, '0'),
(15, 170, 3, '0');

-- --------------------------------------------------------

--
-- Структура таблицы `diafan_subscription`
--

CREATE TABLE `diafan_subscription` (
  `id` int(11) UNSIGNED NOT NULL COMMENT 'идентификатор',
  `created` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'дата создания',
  `send` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'рассылка отправлена: 0 - нет, 1 - да',
  `send_only_admin` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'отправлять рассылку только администратору: 0 - нет, 1 - да',
  `cat_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор категории из таблицы `diafan_subscription_category`',
  `name` varchar(250) NOT NULL DEFAULT '' COMMENT 'название',
  `text` text DEFAULT NULL COMMENT 'текст рассылки',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Рассылки';

-- --------------------------------------------------------

--
-- Структура таблицы `diafan_subscription_category`
--

CREATE TABLE `diafan_subscription_category` (
  `id` int(11) UNSIGNED NOT NULL COMMENT 'идентификатор',
  `name1` varchar(250) NOT NULL DEFAULT '' COMMENT 'название',
  `act` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'показывать на сайте: 0 - нет, 1 - да',
  `sort` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'подрядковый номер для сортировки',
  `text1` text DEFAULT NULL COMMENT 'описание',
  `parent_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор родителя из таблицы `diafan_subscription_category`',
  `count_children` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'количество вложенных категорий',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Категории рассылок';

-- --------------------------------------------------------

--
-- Структура таблицы `diafan_subscription_category_parents`
--

CREATE TABLE `diafan_subscription_category_parents` (
  `id` int(11) UNSIGNED NOT NULL COMMENT 'идентификатор',
  `element_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор категории из таблицы `diafan_subscription_category`',
  `parent_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор родителя категории из таблицы `diafan_subscription_category`',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Родительские связи категорий рассылок';

-- --------------------------------------------------------

--
-- Структура таблицы `diafan_subscription_category_rel`
--

CREATE TABLE `diafan_subscription_category_rel` (
  `id` int(11) UNSIGNED NOT NULL COMMENT 'идентификатор',
  `element_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор рассылки из таблицы `diafan_subscription`',
  `cat_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор категории из таблицы `diafan_subscription_category`',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Связи рассылок и категорий';

-- --------------------------------------------------------

--
-- Структура таблицы `diafan_subscription_emails`
--

CREATE TABLE `diafan_subscription_emails` (
  `id` int(11) UNSIGNED NOT NULL COMMENT 'идентификатор',
  `created` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'дата добавления',
  `name` varchar(250) NOT NULL DEFAULT '' COMMENT 'имя',
  `mail` varchar(64) NOT NULL DEFAULT '' COMMENT 'e-mail',
  `code` varchar(32) NOT NULL DEFAULT '' COMMENT 'код доступа к управлению подпиской',
  `act` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'получает рассылку: 0 - нет, 1 - да',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Подписчики на рассылку';

-- --------------------------------------------------------

--
-- Структура таблицы `diafan_subscription_emails_cat_unrel`
--

CREATE TABLE `diafan_subscription_emails_cat_unrel` (
  `id` int(11) UNSIGNED NOT NULL COMMENT 'идентификатор',
  `element_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор подписчика из таблицы `diafan_subscription_emails`',
  `cat_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор категории из таблицы `diafan_subscription_category`',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Отключенные категории рассылок у подписчиков';

-- --------------------------------------------------------

--
-- Структура таблицы `diafan_subscription_phones`
--

CREATE TABLE `diafan_subscription_phones` (
  `id` int(11) UNSIGNED NOT NULL COMMENT 'идентификатор',
  `created` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'дата добавления',
  `name` varchar(250) NOT NULL DEFAULT '' COMMENT 'имя',
  `phone` varchar(64) NOT NULL DEFAULT '' COMMENT 'телефон',
  `act` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'получает рассылку: 0 - нет, 1 - да',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Телефоны для рассылок';

--
-- Дамп данных таблицы `diafan_subscription_phones`
--

INSERT INTO `diafan_subscription_phones` (`id`, `created`, `name`, `phone`, `act`, `trash`) VALUES
(1, 0, '1586765576', '', '1', '0');

-- --------------------------------------------------------

--
-- Структура таблицы `diafan_subscription_sms`
--

CREATE TABLE `diafan_subscription_sms` (
  `id` int(11) UNSIGNED NOT NULL COMMENT 'идентификатор',
  `created` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'дата создания',
  `send` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'рассылка отправлена: 0 - нет, 1 - да',
  `name` varchar(250) NOT NULL DEFAULT '' COMMENT 'название',
  `text` text DEFAULT NULL COMMENT 'текст',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='SMS-рассылки';

-- --------------------------------------------------------

--
-- Структура таблицы `diafan_tags`
--

CREATE TABLE `diafan_tags` (
  `id` int(11) UNSIGNED NOT NULL COMMENT 'идентификатор',
  `module_name` varchar(50) NOT NULL DEFAULT '' COMMENT 'название модуля',
  `element_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор элемента модуля',
  `element_type` enum('element','cat') NOT NULL DEFAULT 'element' COMMENT 'тип элемента модуля',
  `tags_name_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор тега из таблицы `diafan_tags_name`',
  `act1` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'показывать на сайте: 0 - нет, 1 - да',
  `access` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'доступ к элементу ограничен',
  `date_start` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'дата начала показа',
  `date_finish` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'дата окончания показа',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Связи тегов и элементов модулей';

-- --------------------------------------------------------

--
-- Структура таблицы `diafan_tags_name`
--

CREATE TABLE `diafan_tags_name` (
  `id` int(11) UNSIGNED NOT NULL COMMENT 'идентификатор',
  `name1` varchar(70) NOT NULL DEFAULT '' COMMENT 'тег',
  `map_no_show` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'не показывать на карте сайта: 0 - нет, 1 - да',
  `sort` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'подрядковый номер для сортировки',
  `changefreq` enum('always','hourly','daily','weekly','monthly','yearly','never') NOT NULL DEFAULT 'always' COMMENT 'Changefreq для sitemap.xml',
  `priority` varchar(3) NOT NULL DEFAULT '' COMMENT 'Priority для sitemap.xml',
  `noindex` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'не индексировать: 0 - нет, 1 - да',
  `keywords1` varchar(250) NOT NULL DEFAULT '' COMMENT 'ключевые слова, тег Keywords',
  `descr1` text DEFAULT NULL COMMENT 'описание, тэг Description',
  `title_meta1` varchar(250) NOT NULL DEFAULT '' COMMENT 'заголовок окна в браузере, тег Title',
  `text1` text DEFAULT NULL COMMENT 'описание',
  `timeedit` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'время последнего изменения в формате UNIXTIME',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Теги';

-- --------------------------------------------------------

--
-- Структура таблицы `diafan_trash`
--

CREATE TABLE `diafan_trash` (
  `id` int(11) UNSIGNED NOT NULL COMMENT 'идентификатор',
  `table_name` varchar(50) NOT NULL DEFAULT '' COMMENT 'название таблицы удаленного элемента',
  `module_name` varchar(50) NOT NULL DEFAULT '' COMMENT 'название модуля удаленного элемента',
  `element_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор удаленного элемента',
  `created` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'дата удаления',
  `parent_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор родителя из таблицы `diafan_trash`',
  `count_children` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'количество удаленных вместе с текущей записей',
  `user_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор пользователя из таблицы `diafan_users`'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Корзина с удаленными элементами';

--
-- Дамп данных таблицы `diafan_trash`
--

INSERT INTO `diafan_trash` (`id`, `table_name`, `module_name`, `element_id`, `created`, `parent_id`, `count_children`, `user_id`) VALUES
(1, 'shop_discount', 'shop', 1, 1586764193, 0, 0, 1),
(2, 'shop_brand', 'shop', 1, 1586764197, 0, 0, 1),
(3, 'shop_category', 'shop', 1, 1586764204, 0, 1, 1),
(4, 'menu', 'menu', 12, 1586764204, 3, 0, 1),
(5, 'shop_param', 'shop', 1, 1586764216, 0, 1, 1),
(6, 'shop_param_category_rel', 'shop', 1, 1586764216, 5, 0, 1),
(7, 'menu', 'menu', 2, 1586765841, 0, 6, 1),
(8, 'menu', 'menu', 5, 1586765841, 7, 0, 1),
(9, 'menu', 'menu', 6, 1586765841, 7, 0, 1),
(10, 'menu', 'menu', 11, 1586765841, 7, 0, 1),
(11, 'menu_parents', 'menu', 3, 1586765841, 7, 0, 1),
(12, 'menu_parents', 'menu', 4, 1586765841, 7, 0, 1),
(13, 'menu_parents', 'menu', 9, 1586765841, 7, 0, 1),
(14, 'menu', 'menu', 1, 1586765841, 0, 12, 1),
(15, 'menu', 'menu', 3, 1586765841, 14, 0, 1),
(16, 'menu', 'menu', 4, 1586765841, 14, 0, 1),
(17, 'menu', 'menu', 7, 1586765841, 14, 0, 1),
(18, 'menu', 'menu', 8, 1586765841, 14, 0, 1),
(19, 'menu', 'menu', 9, 1586765841, 14, 0, 1),
(20, 'menu', 'menu', 10, 1586765841, 14, 0, 1),
(21, 'menu_parents', 'menu', 1, 1586765841, 14, 0, 1),
(22, 'menu_parents', 'menu', 2, 1586765841, 14, 0, 1),
(23, 'menu_parents', 'menu', 5, 1586765841, 14, 0, 1),
(24, 'menu_parents', 'menu', 6, 1586765841, 14, 0, 1),
(25, 'menu_parents', 'menu', 7, 1586765841, 14, 0, 1),
(26, 'menu_parents', 'menu', 8, 1586765841, 14, 0, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `diafan_trash_parents`
--

CREATE TABLE `diafan_trash_parents` (
  `id` int(11) UNSIGNED NOT NULL COMMENT 'идентификатор',
  `element_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор записи из таблицы `diafan_trash` об удалении элемента',
  `parent_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор записи-родителя из таблицы `diafan_trash` об удалении элемента'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Родительские связи в корзине (какое удаление влечет за собой другое)';

--
-- Дамп данных таблицы `diafan_trash_parents`
--

INSERT INTO `diafan_trash_parents` (`id`, `element_id`, `parent_id`) VALUES
(1, 1, 0),
(2, 2, 0),
(3, 3, 0),
(4, 4, 3),
(5, 5, 0),
(6, 6, 5),
(7, 7, 0),
(8, 8, 7),
(9, 9, 7),
(10, 10, 7),
(11, 11, 7),
(12, 12, 7),
(13, 13, 7),
(14, 14, 0),
(15, 15, 14),
(16, 16, 14),
(17, 17, 14),
(18, 18, 14),
(19, 19, 14),
(20, 20, 14),
(21, 21, 14),
(22, 22, 14),
(23, 23, 14),
(24, 24, 14),
(25, 25, 14),
(26, 26, 14);

-- --------------------------------------------------------

--
-- Структура таблицы `diafan_update_return`
--

CREATE TABLE `diafan_update_return` (
  `id` smallint(5) UNSIGNED NOT NULL COMMENT 'идентификатор',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT 'название',
  `created` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'дата создания',
  `current` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'текущая точка: 0 - нет, 1 - да',
  `hash` varchar(100) NOT NULL DEFAULT '' COMMENT 'уникальный хэш',
  `text` text DEFAULT NULL COMMENT 'описание',
  `version` varchar(32) NOT NULL DEFAULT '' COMMENT 'версия сборки'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Точки возврата';

--
-- Дамп данных таблицы `diafan_update_return`
--

INSERT INTO `diafan_update_return` (`id`, `name`, `created`, `current`, `hash`, `text`, `version`) VALUES
(1, 'Установка', 1586763049, '1', '406341e3d3ea39345c59e3dffb9eedd0484ab155', NULL, '6.0.12.5');

-- --------------------------------------------------------

--
-- Структура таблицы `diafan_users`
--

CREATE TABLE `diafan_users` (
  `id` int(11) UNSIGNED NOT NULL COMMENT 'идентификатор',
  `name` varchar(60) NOT NULL DEFAULT '' COMMENT 'логин',
  `password` varchar(32) NOT NULL DEFAULT '' COMMENT 'пароль в зашифрованном виде',
  `mail` varchar(64) NOT NULL DEFAULT '' COMMENT 'e-mail',
  `phone` varchar(64) NOT NULL DEFAULT '' COMMENT 'телефон',
  `created` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'дата регистрации',
  `fio` varchar(255) NOT NULL DEFAULT '' COMMENT 'ФИО',
  `role_id` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор типа пользователя из таблицы `diafan_users_role`',
  `act` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'активен на сайте: 0 - нет, 1 - да',
  `htmleditor` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'использовать визуальный редактор: 0 - нет, 1 - да',
  `copy_files` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'cохранять картинки с внешних сайтов, при вставке контента в визуальный редактор: 0 - нет, 1 - да',
  `useradmin` enum('0','1','2') NOT NULL DEFAULT '0' COMMENT 'панель быстрого редактирования: 0 - отключена, 1 - включена, 2 - только панель без режима редактирования',
  `start_admin` varchar(30) NOT NULL DEFAULT '' COMMENT 'стартовая страница административной части',
  `lang_id` tinyint(2) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор языка сайта из таблицы `diafan_languages`',
  `admin_nastr` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'колечество элементов на странице в административной части',
  `identity` varchar(255) NOT NULL DEFAULT '' COMMENT 'URL на страницу в соц. сети',
  `config` text DEFAULT NULL COMMENT 'Настройки пользователя',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Пользователи';

--
-- Дамп данных таблицы `diafan_users`
--

INSERT INTO `diafan_users` (`id`, `name`, `password`, `mail`, `phone`, `created`, `fio`, `role_id`, `act`, `htmleditor`, `copy_files`, `useradmin`, `start_admin`, `lang_id`, `admin_nastr`, `identity`, `config`, `trash`) VALUES
(1, 'admin', '859f965970c90fbdefa8b423d355c955', 'testservices92@gmail.com', '', 1584171000, 'admin', 3, '1', '0', '1', '0', '', 0, 0, '', NULL, '0');

-- --------------------------------------------------------

--
-- Структура таблицы `diafan_users_actlink`
--

CREATE TABLE `diafan_users_actlink` (
  `id` int(11) UNSIGNED NOT NULL COMMENT 'идентификатор',
  `link` varchar(255) NOT NULL DEFAULT '' COMMENT 'код активации',
  `user_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор пользователя из таблицы `diafan_users`',
  `created` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'дата создания',
  `count` int(11) UNSIGNED NOT NULL DEFAULT 1 COMMENT 'количество неудачных попыток'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Код активации аккаунта';

-- --------------------------------------------------------

--
-- Структура таблицы `diafan_users_param`
--

CREATE TABLE `diafan_users_param` (
  `id` int(11) UNSIGNED NOT NULL COMMENT 'идентификатор',
  `name1` varchar(250) NOT NULL DEFAULT '' COMMENT 'название',
  `text1` text DEFAULT NULL COMMENT 'описание',
  `type` varchar(20) NOT NULL DEFAULT '' COMMENT 'тип',
  `show_in_page` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'выводить на странице пользователя: 0 - нет, 1 - да',
  `show_in_form_auth` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'выводить в форме редактирования данных для авторизованных пользователей: 0 - нет, 1 - да',
  `show_in_form_no_auth` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'выводить в форме регистрации: 0 - нет, 1 - да',
  `sort` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'подрядковый номер для сортировки',
  `required` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'обязательно для заполнения: 0 - нет, 1 - да',
  `config` text DEFAULT NULL COMMENT 'серилизованные данные о настройках поля',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Дополнительные поля с данными о пользователях';

-- --------------------------------------------------------

--
-- Структура таблицы `diafan_users_param_element`
--

CREATE TABLE `diafan_users_param_element` (
  `id` int(11) UNSIGNED NOT NULL COMMENT 'идентификатор',
  `value` text DEFAULT NULL COMMENT 'значение',
  `param_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор поля из таблицы `diafan_users_param`',
  `element_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор пользователя из таблицы `diafan_users`',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Значения дополнительных полей с данными о пользователях';

-- --------------------------------------------------------

--
-- Структура таблицы `diafan_users_param_role_rel`
--

CREATE TABLE `diafan_users_param_role_rel` (
  `id` int(11) UNSIGNED NOT NULL COMMENT 'идентификатор',
  `element_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор поля из таблицы `diafan_users_param`',
  `role_id` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор типа пользователя из таблицы `diafan_users_role`',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Связи дополнительных полей с данными о пользователях и типов пользователей';

-- --------------------------------------------------------

--
-- Структура таблицы `diafan_users_param_select`
--

CREATE TABLE `diafan_users_param_select` (
  `id` int(11) UNSIGNED NOT NULL COMMENT 'идентификатор',
  `param_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор поля из таблицы `diafan_users_param`',
  `value` tinyint(2) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'значение для типа характеристики «галочка»: 0 - нет, 1 - да',
  `name1` varchar(50) NOT NULL DEFAULT '' COMMENT 'название',
  `sort` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'подрядковый номер для сортировки',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Варианты значений дополнительных полей с данными о пользователях для типа список';

-- --------------------------------------------------------

--
-- Структура таблицы `diafan_users_role`
--

CREATE TABLE `diafan_users_role` (
  `id` tinyint(3) UNSIGNED NOT NULL COMMENT 'идентификатор',
  `name1` varchar(64) NOT NULL DEFAULT '' COMMENT 'название',
  `registration` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'задавать при регистрации: 0 - нет, 1 - да',
  `only_self` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'видеть только свои материалы: 0 - нет, 1 - да',
  `sort` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'подрядковый номер для сортировки',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Типы пользователей';

--
-- Дамп данных таблицы `diafan_users_role`
--

INSERT INTO `diafan_users_role` (`id`, `name1`, `registration`, `only_self`, `sort`, `trash`) VALUES
(1, 'Пользователь', '1', '0', 1, '0'),
(2, 'Модератор', '0', '0', 2, '0'),
(3, 'Администратор', '0', '0', 3, '0');

-- --------------------------------------------------------

--
-- Структура таблицы `diafan_users_role_perm`
--

CREATE TABLE `diafan_users_role_perm` (
  `id` int(11) UNSIGNED NOT NULL COMMENT 'идентификатор',
  `role_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор типа пользователя из таблицы `diafan_users_role`',
  `perm` text DEFAULT NULL COMMENT 'права на действия: all, init, edit, del',
  `rewrite` text DEFAULT NULL COMMENT 'тег доступа (например, название модуля)',
  `type` enum('site','admin') NOT NULL DEFAULT 'admin' COMMENT 'часть сайта: site - пользовательская, admin - административная'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Права типов пользователей';

--
-- Дамп данных таблицы `diafan_users_role_perm`
--

INSERT INTO `diafan_users_role_perm` (`id`, `role_id`, `perm`, `rewrite`, `type`) VALUES
(1, 3, 'all', 'all', 'admin'),
(2, 3, 'edit', 'useradmin', 'site'),
(3, 3, 'moderator', 'forum', 'site');

-- --------------------------------------------------------

--
-- Структура таблицы `diafan_users_token`
--

CREATE TABLE `diafan_users_token` (
  `id` int(11) UNSIGNED NOT NULL COMMENT 'идентификатор',
  `user_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор пользователя из таблицы `diafan_users`',
  `element_type` varchar(10) NOT NULL DEFAULT '' COMMENT 'тип ключа',
  `created` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'дата создания',
  `token` char(32) NOT NULL DEFAULT '' COMMENT 'электронный ключ',
  `date_start` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'дата начала действия электронного ключа',
  `date_finish` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'дата окончания действия электронного ключа'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Электронные ключи пользователей';

-- --------------------------------------------------------

--
-- Структура таблицы `diafan_visitors_session`
--

CREATE TABLE `diafan_visitors_session` (
  `master_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'главный идентификатор в формате UNIXTIME',
  `slave_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'вторичный идентификатор в интервале master_id',
  `id` varchar(21) NOT NULL DEFAULT '' COMMENT 'объединенный идентификатор',
  `session_id` varchar(64) NOT NULL DEFAULT '' COMMENT 'идентификатор сессии из таблицы `diafan_sessions`',
  `user_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор пользователя из таблицы `diafan_users`',
  `role_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '  тип пользователя из таблицы `diafan_users_role`, для которого установлена скидка',
  `hostname` varchar(128) NOT NULL DEFAULT '' COMMENT 'хост',
  `user_agent` text DEFAULT NULL COMMENT 'браузер пользователя',
  `create` varchar(10) NOT NULL DEFAULT '0' COMMENT 'время создания в формате UNIXTIME',
  `timestamp` varchar(20) NOT NULL DEFAULT '0' COMMENT 'время, до которого сессия действует',
  `timeedit` varchar(10) NOT NULL DEFAULT '0' COMMENT 'время последнего изменения в формате UNIXTIME',
  `status` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'статус валидации пользовательского агента: 0 - бот, 1 - посетитель',
  `search_bot` varchar(255) NOT NULL DEFAULT '' COMMENT 'имя поискового бота'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Статистика посетителей';

--
-- Дамп данных таблицы `diafan_visitors_session`
--

INSERT INTO `diafan_visitors_session` (`master_id`, `slave_id`, `id`, `session_id`, `user_id`, `role_id`, `hostname`, `user_agent`, `create`, `timestamp`, `timeedit`, `status`, `search_bot`) VALUES
(1586763665, 1, '1586763665-1', 'buhh9ia4qq7vabs5mk5gphibhdo9jtb4', 1, 3, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.163 Safari/537.36', '1586764536', '1586774105', '1586774109', '1', ''),
(1586777577, 1, '1586777577-1', 'j9hq2f3jovfl2hssirvj4rc04utmfpbj', 1, 3, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.163 Safari/537.36', '1586777577', '1586785342', '1586785702', '1', '');

-- --------------------------------------------------------

--
-- Структура таблицы `diafan_visitors_stat_traffic`
--

CREATE TABLE `diafan_visitors_stat_traffic` (
  `id` int(11) UNSIGNED NOT NULL COMMENT 'идентификатор',
  `date` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'время в формате UNIXTIME',
  `visits_count` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'количество визитов',
  `visits_search_bot_count` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'количество визитов от поисковых ботов',
  `visits_bot_count` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'количество визитов от неопределенных ботов',
  `pageviews_count` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'количество просмотров',
  `pageviews_search_bot_count` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'количество просмотров от поисковых ботов',
  `pageviews_bot_count` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'количество просмотров от неопределенных ботов',
  `users_count` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'количество уникальных посетители',
  `users_search_bot_count` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'количество уникальнех поисковых ботов',
  `users_bot_count` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'количество уникальных неопределенных ботов'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Статистика посещений';

--
-- Дамп данных таблицы `diafan_visitors_stat_traffic`
--

INSERT INTO `diafan_visitors_stat_traffic` (`id`, `date`, `visits_count`, `visits_search_bot_count`, `visits_bot_count`, `pageviews_count`, `pageviews_search_bot_count`, `pageviews_bot_count`, `users_count`, `users_search_bot_count`, `users_bot_count`) VALUES
(1, 1586590238, 40, 10, 20, 60, 15, 25, 20, 1, 5),
(2, 1586725200, 0, 0, 0, 2, 0, 0, 1, 0, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `diafan_visitors_stat_traffic_names_search_bot`
--

CREATE TABLE `diafan_visitors_stat_traffic_names_search_bot` (
  `master_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'главный идентификатор в формате UNIXTIME',
  `slave_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'вторичный идентификатор в интервале master_id',
  `id` varchar(21) NOT NULL DEFAULT '' COMMENT 'объединенный идентификатор',
  `search_bot` varchar(255) NOT NULL DEFAULT '' COMMENT 'имя поискового бота',
  `visits_search_bot_count` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'количество визитов от поисковых ботов',
  `timeedit` varchar(10) NOT NULL DEFAULT '0' COMMENT 'время последнего изменения в формате UNIXTIME'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Статистика по поисковым ботам';

--
-- Дамп данных таблицы `diafan_visitors_stat_traffic_names_search_bot`
--

INSERT INTO `diafan_visitors_stat_traffic_names_search_bot` (`master_id`, `slave_id`, `id`, `search_bot`, `visits_search_bot_count`, `timeedit`) VALUES
(1, 1, '1-1', 'YandexBot', 10, '1586763038'),
(1, 2, '1-2', 'Googlebot', 5, '1586763038');

-- --------------------------------------------------------

--
-- Структура таблицы `diafan_visitors_stat_traffic_pages`
--

CREATE TABLE `diafan_visitors_stat_traffic_pages` (
  `master_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'главный идентификатор в формате UNIXTIME',
  `slave_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'вторичный идентификатор в интервале master_id',
  `id` varchar(21) NOT NULL DEFAULT '' COMMENT 'объединенный идентификатор',
  `site_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор страницы сайта из таблицы `diafan_site`',
  `visits_count` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'количество визитов',
  `visits_search_bot_count` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'количество визитов от поисковых ботов',
  `visits_bot_count` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'количество визитов от неопределенных ботов',
  `timeedit` varchar(10) NOT NULL DEFAULT '0' COMMENT 'время последнего изменения в формате UNIXTIME'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Статистика по посещаемым страницам сайта';

--
-- Дамп данных таблицы `diafan_visitors_stat_traffic_pages`
--

INSERT INTO `diafan_visitors_stat_traffic_pages` (`master_id`, `slave_id`, `id`, `site_id`, `visits_count`, `visits_search_bot_count`, `visits_bot_count`, `timeedit`) VALUES
(1, 1, '1-1', 1, 1, 1, 1, '1586590238');

-- --------------------------------------------------------

--
-- Структура таблицы `diafan_visitors_stat_traffic_source`
--

CREATE TABLE `diafan_visitors_stat_traffic_source` (
  `master_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'главный идентификатор в формате UNIXTIME',
  `slave_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'вторичный идентификатор в интервале master_id',
  `id` varchar(21) NOT NULL DEFAULT '' COMMENT 'объединенный идентификатор',
  `referer_domain` text DEFAULT NULL COMMENT 'домен-рефферер',
  `visits_count` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'количество визитов',
  `visits_search_bot_count` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'количество визитов от поисковых ботов',
  `visits_bot_count` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'количество визитов от неопределенных ботов',
  `timeedit` varchar(10) NOT NULL DEFAULT '0' COMMENT 'время последнего изменения в формате UNIXTIME'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Статистика по источникам трафика';

--
-- Дамп данных таблицы `diafan_visitors_stat_traffic_source`
--

INSERT INTO `diafan_visitors_stat_traffic_source` (`master_id`, `slave_id`, `id`, `referer_domain`, `visits_count`, `visits_search_bot_count`, `visits_bot_count`, `timeedit`) VALUES
(1, 1, '1-1', 'www.yandex.ru', 10, 10, 10, '1586763038'),
(1, 2, '1-2', 'www.google.ru', 5, 5, 5, '1586763038'),
(1586764063, 1, '1586764063-1', '/', 2, 0, 0, '1586764043');

-- --------------------------------------------------------

--
-- Структура таблицы `diafan_visitors_url`
--

CREATE TABLE `diafan_visitors_url` (
  `master_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'главный идентификатор в формате UNIXTIME',
  `slave_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'вторичный идентификатор в интервале master_id',
  `id` varchar(21) NOT NULL DEFAULT '' COMMENT 'объединенный идентификатор',
  `visitors_session_id` varchar(21) NOT NULL DEFAULT '' COMMENT 'идентификатор посетителей из таблицы `diafan_visitors_session`',
  `hostname` varchar(128) NOT NULL DEFAULT '' COMMENT 'хост',
  `referer_scheme` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'протокол рефферер: 0 - http, 1 - https',
  `referer_domain` text DEFAULT NULL COMMENT 'домен-рефферер',
  `referer_rewrite` text DEFAULT NULL COMMENT 'адрес-рефферер',
  `referer_query` text DEFAULT NULL COMMENT 'параметры-рефферер',
  `scheme` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'протокол: 0 - http, 1 - https',
  `rewrite` text DEFAULT NULL COMMENT 'псевдоссылка страницы',
  `query` text DEFAULT NULL COMMENT 'параметры адреса',
  `is_admin` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'страница относится к административной части сайта: 0 - нет, 1 - да',
  `site_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор страницы сайта из таблицы `diafan_site`',
  `module_name` varchar(50) NOT NULL DEFAULT '' COMMENT 'название модуля',
  `element_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор элемента модуля',
  `element_type` enum('element','cat','brand','param') NOT NULL DEFAULT 'element' COMMENT 'тип элемента модуля',
  `is_mobile` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'использование мобильного устройства: 0 - нет, 1 - да',
  `is_mobile_url` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'мобильная версия страницы: 0 - нет, 1 - да',
  `user_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор пользователя из таблицы `diafan_users`',
  `role_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '  тип пользователя из таблицы `diafan_users_role`, для которого установлена скидка',
  `visits` enum('0','1','2') NOT NULL DEFAULT '0' COMMENT 'посещение: 0 - нет, 1 - новое, 2 - повторное',
  `status` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'статус валидации пользовательского агента: 0 - бот, 1 - посетитель',
  `search_bot` varchar(255) NOT NULL DEFAULT '' COMMENT 'имя поискового бота',
  `timeedit` varchar(10) NOT NULL DEFAULT '0' COMMENT 'время последнего изменения в формате UNIXTIME'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Лог посещений пользователей';

--
-- Дамп данных таблицы `diafan_visitors_url`
--

INSERT INTO `diafan_visitors_url` (`master_id`, `slave_id`, `id`, `visitors_session_id`, `hostname`, `referer_scheme`, `referer_domain`, `referer_rewrite`, `referer_query`, `scheme`, `rewrite`, `query`, `is_admin`, `site_id`, `module_name`, `element_id`, `element_type`, `is_mobile`, `is_mobile_url`, `user_id`, `role_id`, `visits`, `status`, `search_bot`, `timeedit`) VALUES
(1586763665, 1, '1586763665-1', '1586763665-1', '127.0.0.1', '0', '/', '/installation/step6/', '', '0', '/', '?587&amp;amp;help=1', '0', 1, 'site', 1, 'element', '0', '0', 0, 0, '1', '1', '', '1586763665'),
(1586764040, 1, '1586764040-1', '1586763665-1', '127.0.0.1', '0', '/', '/installation/step6/', '', '0', '/', '?587&amp;amp;help=1', '0', 1, 'site', 1, 'element', '0', '0', 0, 0, '0', '1', '', '1586764040'),
(1586764043, 1, '1586764043-1', '1586763665-1', '127.0.0.1', '0', '', '', '', '0', '/', '', '1', 0, '', 0, 'element', '0', '0', 0, 0, '1', '1', '', '1586764043'),
(1586764063, 1, '1586764063-1', '1586763665-1', '127.0.0.1', '0', '/', '/admin', '', '0', '/', '', '1', 0, 'dashboard', 0, 'element', '0', '0', 1, 3, '0', '1', '', '1586764063'),
(1586764068, 1, '1586764068-1', '1586763665-1', '127.0.0.1', '0', '/', '/admin', '', '0', 'menu', '', '1', 0, 'menu', 0, 'element', '0', '0', 1, 3, '0', '1', '', '1586764068'),
(1586764070, 1, '1586764070-1', '1586763665-1', '127.0.0.1', '0', '/', '/admin/menu/', '', '0', 'site', '', '1', 0, 'site', 0, 'element', '0', '0', 1, 3, '0', '1', '', '1586764070'),
(1586764071, 1, '1586764071-1', '1586763665-1', '127.0.0.1', '0', '/', '/admin/site/', '', '0', 'site/blocks', '', '1', 0, 'site', 0, 'element', '0', '0', 1, 3, '0', '1', '', '1586764071'),
(1586764072, 1, '1586764072-1', '1586763665-1', '127.0.0.1', '0', '/', '/admin/site/blocks/', '', '0', 'site/blocks/edit1', '', '1', 0, 'site', 1, 'element', '0', '0', 1, 3, '0', '1', '', '1586764072'),
(1586764080, 1, '1586764080-1', '1586763665-1', '127.0.0.1', '0', '/', '/admin/site/blocks/edit1/', '', '0', 'site/blocks', '', '1', 0, 'site', 0, 'element', '0', '0', 1, 3, '0', '1', '', '1586764080'),
(1586764088, 1, '1586764088-1', '1586763665-1', '127.0.0.1', '0', '/', '/admin/site/blocks/', '', '0', 'site', '', '1', 0, 'site', 0, 'element', '0', '0', 1, 3, '0', '1', '', '1586764088'),
(1586764095, 1, '1586764095-1', '1586763665-1', '127.0.0.1', '0', '/', '/admin/site/', '', '0', 'admin', '', '1', 0, 'admin', 0, 'element', '0', '0', 1, 3, '0', '1', '', '1586764177'),
(1586764186, 1, '1586764186-1', '1586763665-1', '127.0.0.1', '0', '/', '/admin/admin/', '', '0', 'shop', '', '1', 164, 'shop', 0, 'element', '0', '0', 1, 3, '0', '1', '', '1586764186'),
(1586764187, 1, '1586764187-1', '1586763665-1', '127.0.0.1', '0', '/', '/admin/shop/', '', '0', 'shop/discount/site164', '', '1', 164, 'shop', 0, 'element', '0', '0', 1, 3, '0', '1', '', '1586764193'),
(1586764193, 1, '1586764193-1', '1586763665-1', '127.0.0.1', '0', '/', '/admin/shop/discount/site164/', '', '0', 'shop/brand/site164', '', '1', 164, 'shop', 0, 'brand', '0', '0', 1, 3, '0', '1', '', '1586764198'),
(1586764198, 1, '1586764198-1', '1586763665-1', '127.0.0.1', '0', '/', '/admin/shop/brand/site164/', '', '0', 'shop/category/site164', '', '1', 164, 'shop', 0, 'cat', '0', '0', 1, 3, '0', '1', '', '1586764204'),
(1586764205, 1, '1586764205-1', '1586763665-1', '127.0.0.1', '0', '/', '/admin/shop/category/site164/', '', '0', 'shop/param/site164', '', '1', 164, 'shop', 0, 'param', '0', '0', 1, 3, '0', '1', '', '1586764205'),
(1586764208, 1, '1586764208-1', '1586763665-1', '127.0.0.1', '0', '/', '/admin/shop/param/site164/', '', '0', 'shop/param/site164/edit1', '', '1', 164, 'shop', 1, 'param', '0', '0', 1, 3, '0', '1', '', '1586764208'),
(1586764213, 1, '1586764213-1', '1586763665-1', '127.0.0.1', '0', '/', '/admin/shop/category/site164/', '', '0', 'shop/param/site164', '', '1', 164, 'shop', 0, 'param', '0', '0', 1, 3, '0', '1', '', '1586764216'),
(1586764217, 1, '1586764217-1', '1586763665-1', '127.0.0.1', '0', '/', '/admin/shop/param/site164/', '', '0', 'site', '', '1', 0, 'site', 0, 'element', '0', '0', 1, 3, '0', '1', '', '1586764217'),
(1586764306, 1, '1586764306-1', '1586763665-1', '127.0.0.1', '0', '/', '/admin/site/', '', '0', 'shop', '', '1', 164, 'shop', 0, 'element', '0', '0', 1, 3, '0', '1', '', '1586764306'),
(1586764308, 1, '1586764308-1', '1586763665-1', '127.0.0.1', '0', '/', '/admin/shop/', '', '0', 'site', '', '1', 0, 'site', 0, 'element', '0', '0', 1, 3, '0', '1', '', '1586764308'),
(1586764310, 1, '1586764310-1', '1586763665-1', '127.0.0.1', '0', '/', '/admin/site/', '', '0', 'site/blocks', '', '1', 0, 'site', 0, 'element', '0', '0', 1, 3, '0', '1', '', '1586764310'),
(1586764311, 1, '1586764311-1', '1586763665-1', '127.0.0.1', '0', '/', '/admin/site/blocks/', '', '0', 'site/blocks/edit1', '', '1', 0, 'site', 1, 'element', '0', '0', 1, 3, '0', '1', '', '1586764311'),
(1586764313, 1, '1586764313-1', '1586763665-1', '127.0.0.1', '0', '/', '/admin/site/', '', '0', 'site/blocks', '', '1', 0, 'site', 0, 'element', '0', '0', 1, 3, '0', '1', '', '1586764313'),
(1586764338, 1, '1586764338-1', '1586763665-1', '127.0.0.1', '0', '/', '/installation/step6/', '', '0', '/', '?587&amp;amp;help=1', '0', 1, 'site', 1, 'element', '0', '0', 1, 3, '0', '1', '', '1586764338'),
(1586764383, 1, '1586764383-1', '1586763665-1', '127.0.0.1', '0', '/', '/admin/site/blocks/', '', '0', 'config', '', '1', 0, 'config', 0, 'element', '0', '0', 1, 3, '0', '1', '', '1586764393'),
(1586764504, 1, '1586764504-1', '1586763665-1', '127.0.0.1', '0', '/', '/installation/step6/', '', '0', '/', '?587&amp;amp;help=1', '0', 1, 'site', 1, 'element', '0', '0', 1, 3, '0', '1', '', '1586764504'),
(1586764506, 1, '1586764506-1', '1586763665-1', '127.0.0.1', '0', '/', '/installation/step6/', '', '0', '/', '?587&amp;amp;help=1', '0', 1, 'site', 1, 'element', '0', '0', 1, 3, '0', '1', '', '1586764506'),
(1586764536, 1, '1586764536-1', '1586763665-1', '127.0.0.1', '0', '/', '/admin/config/', '', '0', 'images', '', '1', 0, '', 0, 'element', '0', '0', 0, 0, '1', '1', '', '1586764536'),
(1586764538, 1, '1586764538-1', '1586763665-1', '127.0.0.1', '0', '/', '/admin/images/', '', '0', 'images', '', '1', 0, 'images', 0, 'element', '0', '0', 1, 3, '0', '1', '', '1586764538'),
(1586764562, 1, '1586764562-1', '1586763665-1', '127.0.0.1', '0', '/', '/installation/step6/', '', '0', '/', '?587&amp;amp;help=1', '0', 1, 'site', 1, 'element', '0', '0', 1, 3, '1', '1', '', '1586764562'),
(1586764564, 1, '1586764564-1', '1586763665-1', '127.0.0.1', '0', '/', '/installation/step6/', '', '0', '/', '?587&amp;amp;help=1', '0', 1, 'site', 1, 'element', '0', '0', 1, 3, '0', '1', '', '1586764564'),
(1586764651, 1, '1586764651-1', '1586763665-1', '127.0.0.1', '0', '/', '/admin/images/', '', '0', 'bs', '', '1', 0, 'bs', 0, 'element', '0', '0', 1, 3, '0', '1', '', '1586764651'),
(1586764653, 1, '1586764653-1', '1586763665-1', '127.0.0.1', '0', '/', '/admin/bs/', '', '0', 'bs/category', '', '1', 0, 'bs', 0, 'cat', '0', '0', 1, 3, '0', '1', '', '1586764653'),
(1586764654, 1, '1586764654-1', '1586763665-1', '127.0.0.1', '0', '/', '/admin/bs/category/', '', '0', 'bs/category/addnew1', '', '1', 0, 'bs', 0, 'cat', '0', '0', 1, 3, '0', '1', '', '1586764654'),
(1586764662, 1, '1586764662-1', '1586763665-1', '127.0.0.1', '0', '/', '/admin/bs/category/addnew1/', '', '0', 'bs/category', '', '1', 0, 'bs', 0, 'cat', '0', '0', 1, 3, '0', '1', '', '1586764662'),
(1586764664, 1, '1586764664-1', '1586763665-1', '127.0.0.1', '0', '/', '/admin/bs/category/', '', '0', 'bs', '', '1', 0, 'bs', 0, 'element', '0', '0', 1, 3, '0', '1', '', '1586764664'),
(1586764665, 1, '1586764665-1', '1586763665-1', '127.0.0.1', '0', '/', '/admin/bs/', '', '0', 'bs/addnew1', '', '1', 0, 'bs', 0, 'element', '0', '0', 1, 3, '0', '1', '', '1586764665'),
(1586764740, 1, '1586764740-1', '1586763665-1', '127.0.0.1', '0', '/', '/admin/bs/addnew1/', '', '0', 'bs/cat1', '', '1', 0, 'bs', 0, 'element', '0', '0', 1, 3, '0', '1', '', '1586764740'),
(1586764752, 1, '1586764752-1', '1586763665-1', '127.0.0.1', '0', '/', '/admin/bs/cat1/', '', '0', 'bs/cat1/addnew1', '', '1', 0, 'bs', 0, 'element', '0', '0', 1, 3, '0', '1', '', '1586764752'),
(1586764778, 1, '1586764778-1', '1586763665-1', '127.0.0.1', '0', '/', '/admin/bs/cat1/addnew1/', '', '0', 'bs/cat1', '', '1', 0, 'bs', 0, 'element', '0', '0', 1, 3, '0', '1', '', '1586764778'),
(1586765149, 1, '1586765149-1', '1586763665-1', '127.0.0.1', '0', '/', '/installation/step6/', '', '0', '/', '?587&amp;amp;help=1', '0', 1, 'site', 1, 'element', '0', '0', 1, 3, '0', '1', '', '1586765149'),
(1586765231, 1, '1586765231-1', '1586763665-1', '127.0.0.1', '0', '/', '/installation/step6/', '', '0', '/', '?587&amp;amp;help=1', '0', 1, 'site', 1, 'element', '0', '0', 1, 3, '0', '1', '', '1586765231'),
(1586765332, 1, '1586765332-1', '1586763665-1', '127.0.0.1', '0', '/', '/installation/step6/', '', '0', '/', '?587&amp;amp;help=1', '0', 1, 'site', 1, 'element', '0', '0', 1, 3, '0', '1', '', '1586765332'),
(1586765500, 1, '1586765500-1', '1586763665-1', '127.0.0.1', '0', '/', '/installation/step6/', '', '0', '/', '?587&amp;amp;help=1', '0', 1, 'site', 1, 'element', '0', '0', 1, 3, '0', '1', '', '1586765500'),
(1586765556, 1, '1586765556-1', '1586763665-1', '127.0.0.1', '0', '/', '/installation/step6/', '', '0', '/', '?587&amp;amp;help=1', '0', 1, 'site', 1, 'element', '0', '0', 1, 3, '0', '1', '', '1586765556'),
(1586765562, 1, '1586765562-1', '1586763665-1', '127.0.0.1', '0', '/', '/admin/bs/cat1/', '', '0', 'config', '', '1', 0, 'config', 0, 'element', '0', '0', 1, 3, '0', '1', '', '1586765562'),
(1586765566, 1, '1586765566-1', '1586763665-1', '127.0.0.1', '0', '/', '/admin/config/', '', '0', 'users/edit1', '', '1', 0, 'users', 1, 'element', '0', '0', 1, 3, '0', '1', '', '1586765566'),
(1586765576, 1, '1586765576-1', '1586763665-1', '127.0.0.1', '0', '/', '/admin/users/edit1/', '', '0', 'users', '', '1', 0, 'users', 0, 'element', '0', '0', 1, 3, '0', '1', '', '1586765576'),
(1586765823, 1, '1586765823-1', '1586763665-1', '127.0.0.1', '0', '/', '/installation/step6/', '', '0', '/', '?587&amp;amp;help=1', '0', 1, 'site', 1, 'element', '0', '0', 1, 3, '0', '1', '', '1586765823'),
(1586765831, 1, '1586765831-1', '1586763665-1', '127.0.0.1', '0', '/', '/admin/users/', '', '0', 'menu', '', '1', 0, 'menu', 0, 'element', '0', '0', 1, 3, '0', '1', '', '1586765842'),
(1586765843, 1, '1586765843-1', '1586763665-1', '127.0.0.1', '0', '/', '/admin/menu/', '', '0', 'site', '', '1', 0, 'site', 0, 'element', '0', '0', 1, 3, '0', '1', '', '1586765864'),
(1586765866, 1, '1586765866-1', '1586763665-1', '127.0.0.1', '0', '/', '/admin/site/', '', '0', 'site/addnew1', '', '1', 0, 'site', 0, 'element', '0', '0', 1, 3, '0', '1', '', '1586765887'),
(1586765895, 1, '1586765895-1', '1586763665-1', '127.0.0.1', '0', '/', '/admin/site/addnew1/', '', '0', 'site', '', '1', 0, 'site', 0, 'element', '0', '0', 1, 3, '0', '1', '', '1586765895'),
(1586765898, 1, '1586765898-1', '1586763665-1', '127.0.0.1', '0', '/', '/admin/site/', '', '0', 'site/edit164', '', '1', 0, 'site', 164, 'element', '0', '0', 1, 3, '0', '1', '', '1586765898'),
(1586765913, 1, '1586765913-1', '1586763665-1', '127.0.0.1', '0', '/', '/admin/site/edit164/', '', '0', 'shop/site164', '', '1', 164, 'shop', 0, 'element', '0', '0', 1, 3, '0', '1', '', '1586765913'),
(1586765916, 1, '1586765916-1', '1586763665-1', '127.0.0.1', '0', '/', '/admin/shop/site164/', '', '0', 'shop', '', '1', 164, 'shop', 0, 'element', '0', '0', 1, 3, '0', '1', '', '1586765916'),
(1586765918, 1, '1586765918-1', '1586763665-1', '127.0.0.1', '0', '/', '/admin/shop/', '', '0', 'site', '', '1', 0, 'site', 0, 'element', '0', '0', 1, 3, '0', '1', '', '1586765918'),
(1586765919, 1, '1586765919-1', '1586763665-1', '127.0.0.1', '0', '/', '/admin/site/', '', '0', 'site/edit164', '', '1', 0, 'site', 164, 'element', '0', '0', 1, 3, '0', '1', '', '1586765919'),
(1586765923, 1, '1586765923-1', '1586763665-1', '127.0.0.1', '0', '/', '/admin/site/edit164/', '', '0', 'menu', '', '1', 0, 'menu', 0, 'element', '0', '0', 1, 3, '0', '1', '', '1586765923'),
(1586765927, 1, '1586765927-1', '1586763665-1', '127.0.0.1', '0', '/', '/installation/step6/', '', '0', '/', '?587&amp;amp;help=1', '0', 1, 'site', 1, 'element', '0', '0', 1, 3, '0', '1', '', '1586765927'),
(1586765944, 1, '1586765944-1', '1586763665-1', '127.0.0.1', '0', '', '', '', '0', '/', '?587&amp;amp;help=1', '0', 1, 'site', 1, 'element', '0', '0', 1, 3, '0', '1', '', '1586765944'),
(1586765958, 1, '1586765958-1', '1586763665-1', '127.0.0.1', '0', '/', '/installation/step6/', '', '0', '/', '?587&amp;amp;help=1', '0', 1, 'site', 1, 'element', '0', '0', 1, 3, '0', '1', '', '1586765958'),
(1586765964, 1, '1586765964-1', '1586763665-1', '127.0.0.1', '0', '/', '/admin/menu/', '', '0', 'admin', '', '1', 0, 'admin', 0, 'element', '0', '0', 1, 3, '0', '1', '', '1586765964'),
(1586765969, 1, '1586765969-1', '1586763665-1', '127.0.0.1', '0', '/', '/admin/admin/', '', '0', 'admin/page2', '', '1', 0, 'admin', 0, 'element', '0', '0', 1, 3, '0', '1', '', '1586765969'),
(1586765974, 1, '1586765974-1', '1586763665-1', '127.0.0.1', '0', '/', '/admin/admin/page2/', '', '0', 'admin/page2/edit53', '', '1', 0, 'admin', 53, 'element', '0', '0', 1, 3, '0', '1', '', '1586765974'),
(1586765978, 1, '1586765978-1', '1586763665-1', '127.0.0.1', '0', '/', '/admin/admin/page2/edit53/', '', '0', 'site', '', '1', 0, 'site', 0, 'element', '0', '0', 1, 3, '0', '1', '', '1586765978'),
(1586765988, 1, '1586765988-1', '1586763665-1', '127.0.0.1', '0', '/', '/admin/site/', '', '0', 'faq', '', '1', 154, 'faq', 0, 'element', '0', '0', 1, 3, '0', '1', '', '1586765988'),
(1586765991, 1, '1586765991-1', '1586763665-1', '127.0.0.1', '0', '/', '/admin/faq/', '', '0', 'addons', '', '1', 0, 'addons', 0, 'element', '0', '0', 1, 3, '0', '1', '', '1586765991'),
(1586765997, 1, '1586765997-1', '1586763665-1', '127.0.0.1', '0', '/', '/admin/addons/', '', '0', 'service', '', '1', 0, 'service', 0, 'element', '0', '0', 1, 3, '0', '1', '', '1586765997'),
(1586766011, 1, '1586766011-1', '1586763665-1', '127.0.0.1', '0', '/', '/admin/service/', '', '0', 'service/page2', '', '1', 0, 'service', 0, 'element', '0', '0', 1, 3, '0', '1', '', '1586766011'),
(1586766013, 1, '1586766013-1', '1586763665-1', '127.0.0.1', '0', '/', '/installation/step6/', '', '0', '/', '?587&amp;amp;help=1', '0', 1, 'site', 1, 'element', '0', '0', 1, 3, '0', '1', '', '1586766013'),
(1586766096, 1, '1586766096-1', '1586763665-1', '127.0.0.1', '0', '/', '/installation/step6/', '', '0', '/', '?587&amp;amp;help=1', '0', 1, 'site', 1, 'element', '0', '0', 1, 3, '0', '1', '', '1586766096'),
(1586766098, 1, '1586766098-1', '1586763665-1', '127.0.0.1', '0', '', '', '', '0', '/', '?587&amp;amp;help=1', '0', 1, 'site', 1, 'element', '0', '0', 1, 3, '0', '1', '', '1586766098'),
(1586766206, 1, '1586766206-1', '1586763665-1', '127.0.0.1', '0', '/', '/installation/step6/', '', '0', '/', '?587&amp;amp;help=1', '0', 1, 'site', 1, 'element', '0', '0', 1, 3, '0', '1', '', '1586766206'),
(1586766259, 1, '1586766259-1', '1586763665-1', '127.0.0.1', '0', '/', '/installation/step6/', '', '0', '/', '?587&amp;amp;help=1', '0', 1, 'site', 1, 'element', '0', '0', 1, 3, '0', '1', '', '1586766259'),
(1586766302, 1, '1586766302-1', '1586763665-1', '127.0.0.1', '0', '/', '/installation/step6/', '', '0', '/', '?587&amp;amp;help=1', '0', 1, 'site', 1, 'element', '0', '0', 1, 3, '0', '1', '', '1586766302'),
(1586766880, 1, '1586766880-1', '1586763665-1', '127.0.0.1', '0', '/', '/installation/step6/', '', '0', '/', '?587&amp;amp;help=1', '0', 1, 'site', 1, 'element', '0', '0', 1, 3, '0', '1', '', '1586766880'),
(1586766882, 1, '1586766882-1', '1586763665-1', '127.0.0.1', '0', '/', '/', '?587&amp;amp;help=1', '0', 'shop', '', '0', 164, 'site', 164, 'element', '0', '0', 1, 3, '0', '1', '', '1586766882'),
(1586766884, 1, '1586766884-1', '1586763665-1', '127.0.0.1', '0', '/', '/installation/step6/', '', '0', '/', '?587&amp;amp;help=1', '0', 1, 'site', 1, 'element', '0', '0', 1, 3, '0', '1', '', '1586766884'),
(1586766915, 1, '1586766915-1', '1586763665-1', '127.0.0.1', '0', '', '', '', '0', '/', '?587&amp;amp;help=1', '0', 1, 'site', 1, 'element', '0', '0', 1, 3, '0', '1', '', '1586766915'),
(1586766980, 1, '1586766980-1', '1586763665-1', '127.0.0.1', '0', '', '', '', '0', '/', '?587&amp;amp;help=1', '0', 1, 'site', 1, 'element', '0', '0', 1, 3, '0', '1', '', '1586766980'),
(1586767018, 1, '1586767018-1', '1586763665-1', '127.0.0.1', '0', '/', '/installation/step6/', '', '0', '/', '?587&amp;amp;help=1', '0', 1, 'site', 1, 'element', '0', '0', 1, 3, '0', '1', '', '1586767018'),
(1586767108, 1, '1586767108-1', '1586763665-1', '127.0.0.1', '0', '/', '/installation/step6/', '', '0', '/', '?587&amp;amp;help=1', '0', 1, 'site', 1, 'element', '0', '0', 1, 3, '0', '1', '', '1586767108'),
(1586767140, 1, '1586767140-1', '1586763665-1', '127.0.0.1', '0', '/', '/installation/step6/', '', '0', '/', '?587&amp;amp;help=1', '0', 1, 'site', 1, 'element', '0', '0', 1, 3, '0', '1', '', '1586767140'),
(1586767192, 1, '1586767192-1', '1586763665-1', '127.0.0.1', '0', '/', '/installation/step6/', '', '0', '/', '?587&amp;amp;help=1', '0', 1, 'site', 1, 'element', '0', '0', 1, 3, '0', '1', '', '1586767192'),
(1586767197, 1, '1586767197-1', '1586763665-1', '127.0.0.1', '0', '/', '/admin/service/page2/', '', '0', 'bs', '', '1', 0, 'bs', 0, 'element', '0', '0', 1, 3, '0', '1', '', '1586767197'),
(1586767200, 1, '1586767200-1', '1586763665-1', '127.0.0.1', '0', '/', '/installation/step6/', '', '0', '/', '?587&amp;amp;help=1', '0', 1, 'site', 1, 'element', '0', '0', 1, 3, '0', '1', '', '1586767200'),
(1586767707, 1, '1586767707-1', '1586763665-1', '127.0.0.1', '0', '/', '/installation/step6/', '', '0', '/', '?587&amp;amp;help=1', '0', 1, 'site', 1, 'element', '0', '0', 1, 3, '0', '1', '', '1586767707'),
(1586767775, 1, '1586767775-1', '1586763665-1', '127.0.0.1', '0', '/', '/installation/step6/', '', '0', '/', '?587&amp;amp;help=1', '0', 1, 'site', 1, 'element', '0', '0', 1, 3, '0', '1', '', '1586767775'),
(1586767777, 1, '1586767777-1', '1586763665-1', '127.0.0.1', '0', '/', '/installation/step6/', '', '0', '/', '?587&amp;amp;help=1', '0', 1, 'site', 1, 'element', '0', '0', 1, 3, '0', '1', '', '1586767777'),
(1586768112, 1, '1586768112-1', '1586763665-1', '127.0.0.1', '0', '/', '/installation/step6/', '', '0', '/', '?587&amp;amp;help=1', '0', 1, 'site', 1, 'element', '0', '0', 1, 3, '0', '1', '', '1586768112'),
(1586768138, 1, '1586768138-1', '1586763665-1', '127.0.0.1', '0', '/', '/', '?587&amp;amp;help=1', '0', 'oplata-i-dostavka', '', '0', 173, 'site', 173, 'element', '0', '0', 1, 3, '0', '1', '', '1586768138'),
(1586768139, 1, '1586768139-1', '1586763665-1', '127.0.0.1', '0', '/', '/installation/step6/', '', '0', '/', '?587&amp;amp;help=1', '0', 1, 'site', 1, 'element', '0', '0', 1, 3, '0', '1', '', '1586768139'),
(1586768140, 1, '1586768140-1', '1586763665-1', '127.0.0.1', '0', '/', '/', '?587&amp;amp;help=1', '0', 'shop', '', '0', 164, 'site', 164, 'element', '0', '0', 1, 3, '0', '1', '', '1586768140'),
(1586768144, 1, '1586768144-1', '1586763665-1', '127.0.0.1', '0', '/', '/installation/step6/', '', '0', '/', '?587&amp;amp;help=1', '0', 1, 'site', 1, 'element', '0', '0', 1, 3, '0', '1', '', '1586768144'),
(1586768173, 1, '1586768173-1', '1586763665-1', '127.0.0.1', '0', '/', '/installation/step6/', '', '0', '/', '?587&amp;amp;help=1', '0', 1, 'site', 1, 'element', '0', '0', 1, 3, '0', '1', '', '1586768173'),
(1586768250, 1, '1586768250-1', '1586763665-1', '127.0.0.1', '0', '/', '/installation/step6/', '', '0', '/', '?587&amp;amp;help=1', '0', 1, 'site', 1, 'element', '0', '0', 1, 3, '0', '1', '', '1586768250'),
(1586768257, 1, '1586768257-1', '1586763665-1', '127.0.0.1', '0', '/', '/installation/step6/', '', '0', '/', '?587&amp;amp;help=1', '0', 1, 'site', 1, 'element', '0', '0', 1, 3, '0', '1', '', '1586768257'),
(1586768264, 1, '1586768264-1', '1586763665-1', '127.0.0.1', '0', '/', '/installation/step6/', '', '0', '/', '?587&amp;amp;help=1', '0', 1, 'site', 1, 'element', '0', '0', 1, 3, '0', '1', '', '1586768264'),
(1586768268, 1, '1586768268-1', '1586763665-1', '127.0.0.1', '0', '/', '/installation/step6/', '', '0', '/', '?587&amp;amp;help=1', '0', 1, 'site', 1, 'element', '0', '0', 1, 3, '0', '1', '', '1586768268'),
(1586768324, 1, '1586768324-1', '1586763665-1', '127.0.0.1', '0', '/', '/installation/step6/', '', '0', '/', '?587&amp;amp;help=1', '0', 1, 'site', 1, 'element', '0', '0', 1, 3, '0', '1', '', '1586768324'),
(1586768347, 1, '1586768347-1', '1586763665-1', '127.0.0.1', '0', '/', '/installation/step6/', '', '0', '/', '?587&amp;amp;help=1', '0', 1, 'site', 1, 'element', '0', '0', 1, 3, '0', '1', '', '1586768347'),
(1586768361, 1, '1586768361-1', '1586763665-1', '127.0.0.1', '0', '/', '/installation/step6/', '', '0', '/', '?587&amp;amp;help=1', '0', 1, 'site', 1, 'element', '0', '0', 1, 3, '0', '1', '', '1586768361'),
(1586768373, 1, '1586768373-1', '1586763665-1', '127.0.0.1', '0', '/', '/installation/step6/', '', '0', '/', '?587&amp;amp;help=1', '0', 1, 'site', 1, 'element', '0', '0', 1, 3, '0', '1', '', '1586768373'),
(1586768397, 1, '1586768397-1', '1586763665-1', '127.0.0.1', '0', '/', '/installation/step6/', '', '0', '/', '?587&amp;amp;help=1', '0', 1, 'site', 1, 'element', '0', '0', 1, 3, '0', '1', '', '1586768397'),
(1586768403, 1, '1586768403-1', '1586763665-1', '127.0.0.1', '0', '/', '/installation/step6/', '', '0', '/', '?587&amp;amp;help=1', '0', 1, 'site', 1, 'element', '0', '0', 1, 3, '0', '1', '', '1586768403'),
(1586768406, 1, '1586768406-1', '1586763665-1', '127.0.0.1', '0', '/', '/installation/step6/', '', '0', '/', '?587&amp;amp;help=1', '0', 1, 'site', 1, 'element', '0', '0', 1, 3, '0', '1', '', '1586768406'),
(1586768466, 1, '1586768466-1', '1586763665-1', '127.0.0.1', '0', '/', '/installation/step6/', '', '0', '/', '?587&amp;amp;help=1', '0', 1, 'site', 1, 'element', '0', '0', 1, 3, '0', '1', '', '1586768466'),
(1586768480, 1, '1586768480-1', '1586763665-1', '127.0.0.1', '0', '/', '/installation/step6/', '', '0', '/', '?587&amp;amp;help=1', '0', 1, 'site', 1, 'element', '0', '0', 1, 3, '0', '1', '', '1586768480'),
(1586768489, 1, '1586768489-1', '1586763665-1', '127.0.0.1', '0', '/', '/installation/step6/', '', '0', '/', '?587&amp;amp;help=1', '0', 1, 'site', 1, 'element', '0', '0', 1, 3, '0', '1', '', '1586768489'),
(1586768515, 1, '1586768515-1', '1586763665-1', '127.0.0.1', '0', '/', '/installation/step6/', '', '0', '/', '?587&amp;amp;help=1', '0', 1, 'site', 1, 'element', '0', '0', 1, 3, '0', '1', '', '1586768515'),
(1586768551, 1, '1586768551-1', '1586763665-1', '127.0.0.1', '0', '/', '/installation/step6/', '', '0', '/', '?587&amp;amp;help=1', '0', 1, 'site', 1, 'element', '0', '0', 1, 3, '0', '1', '', '1586768551'),
(1586768563, 1, '1586768563-1', '1586763665-1', '127.0.0.1', '0', '', '', '', '0', '/', '?587&amp;amp;help=1', '0', 1, 'site', 1, 'element', '0', '0', 1, 3, '0', '1', '', '1586768563'),
(1586768669, 1, '1586768669-1', '1586763665-1', '127.0.0.1', '0', '/', '/installation/step6/', '', '0', '/', '?587&amp;amp;help=1', '0', 1, 'site', 1, 'element', '0', '0', 1, 3, '0', '1', '', '1586768669'),
(1586768835, 1, '1586768835-1', '1586763665-1', '127.0.0.1', '0', '/', '/installation/step6/', '', '0', '/', '?587&amp;amp;help=1', '0', 1, 'site', 1, 'element', '0', '0', 1, 3, '0', '1', '', '1586768835'),
(1586768850, 1, '1586768850-1', '1586763665-1', '127.0.0.1', '0', '/', '/installation/step6/', '', '0', '/', '?587&amp;amp;help=1', '0', 1, 'site', 1, 'element', '0', '0', 1, 3, '0', '1', '', '1586768850'),
(1586768854, 1, '1586768854-1', '1586763665-1', '127.0.0.1', '0', '', '', '', '0', '/', '?587&amp;amp;help=1', '0', 1, 'site', 1, 'element', '0', '0', 1, 3, '0', '1', '', '1586768854'),
(1586769002, 1, '1586769002-1', '1586763665-1', '127.0.0.1', '0', '/', '/installation/step6/', '', '0', '/', '?587&amp;amp;help=1', '0', 1, 'site', 1, 'element', '0', '0', 1, 3, '0', '1', '', '1586769002'),
(1586769013, 1, '1586769013-1', '1586763665-1', '127.0.0.1', '0', '/', '/installation/step6/', '', '0', '/', '?587&amp;amp;help=1', '0', 1, 'site', 1, 'element', '0', '0', 1, 3, '0', '1', '', '1586769013'),
(1586769036, 1, '1586769036-1', '1586763665-1', '127.0.0.1', '0', '', '', '', '0', '/', '?587&amp;amp;help=1', '0', 1, 'site', 1, 'element', '0', '0', 1, 3, '0', '1', '', '1586769036'),
(1586769176, 1, '1586769176-1', '1586763665-1', '127.0.0.1', '0', '/', '/installation/step6/', '', '0', '/', '?587&amp;amp;help=1', '0', 1, 'site', 1, 'element', '0', '0', 1, 3, '0', '1', '', '1586769176'),
(1586769275, 1, '1586769275-1', '1586763665-1', '127.0.0.1', '0', '/', '/installation/step6/', '', '0', '/', '?587&amp;amp;help=1', '0', 1, 'site', 1, 'element', '0', '0', 1, 3, '0', '1', '', '1586769275'),
(1586769277, 1, '1586769277-1', '1586763665-1', '127.0.0.1', '0', '/', '/installation/step6/', '', '0', '/', '?587&amp;amp;help=1', '0', 1, 'site', 1, 'element', '0', '0', 1, 3, '0', '1', '', '1586769277'),
(1586769277, 2, '1586769277-2', '1586763665-1', '127.0.0.1', '0', '/', '/installation/step6/', '', '0', '/', '?587&amp;amp;help=1', '0', 1, 'site', 1, 'element', '0', '0', 1, 3, '0', '1', '', '1586769277'),
(1586769278, 1, '1586769278-1', '1586763665-1', '127.0.0.1', '0', '/', '/installation/step6/', '', '0', '/', '?587&amp;amp;help=1', '0', 1, 'site', 1, 'element', '0', '0', 1, 3, '0', '1', '', '1586769278'),
(1586769278, 2, '1586769278-2', '1586763665-1', '127.0.0.1', '0', '/', '/installation/step6/', '', '0', '/', '?587&amp;amp;help=1', '0', 1, 'site', 1, 'element', '0', '0', 1, 3, '0', '1', '', '1586769278'),
(1586769281, 1, '1586769281-1', '1586763665-1', '127.0.0.1', '0', '/', '/installation/step6/', '', '0', '/', '?587&amp;amp;help=1', '0', 1, 'site', 1, 'element', '0', '0', 1, 3, '0', '1', '', '1586769281'),
(1586769286, 1, '1586769286-1', '1586763665-1', '127.0.0.1', '0', '/', '/installation/step6/', '', '0', '/', '?587&amp;amp;help=1', '0', 1, 'site', 1, 'element', '0', '0', 1, 3, '0', '1', '', '1586769286'),
(1586769306, 1, '1586769306-1', '1586763665-1', '127.0.0.1', '0', '/', '/', '?587&amp;amp;help=1', '0', '/', '?587&amp;amp;help=1', '0', 1, 'site', 1, 'element', '0', '0', 1, 3, '0', '1', '', '1586769306'),
(1586769385, 1, '1586769385-1', '1586763665-1', '127.0.0.1', '0', '/', '/admin/bs/', '', '0', 'site', '', '1', 0, 'site', 0, 'element', '0', '0', 1, 3, '0', '1', '', '1586769385'),
(1586769386, 1, '1586769386-1', '1586763665-1', '127.0.0.1', '0', '/', '/admin/site/', '', '0', 'site/addnew1', '', '1', 0, 'site', 0, 'element', '0', '0', 1, 3, '0', '1', '', '1586769386'),
(1586769401, 1, '1586769401-1', '1586763665-1', '127.0.0.1', '0', '/', '/admin/site/addnew1/', '', '0', 'feedback/site176', '', '1', 176, 'feedback', 0, 'element', '0', '0', 1, 3, '0', '1', '', '1586769401'),
(1586769402, 1, '1586769402-1', '1586763665-1', '127.0.0.1', '0', '/', '/admin/feedback/site176/', '', '0', 'feedback/config', '', '1', 0, 'feedback', 0, 'element', '0', '0', 1, 3, '0', '1', '', '1586769402'),
(1586769412, 1, '1586769412-1', '1586763665-1', '127.0.0.1', '0', '/', '/admin/feedback/config/', '', '0', 'feedback/config/success1', '', '1', 0, 'feedback', 0, 'element', '0', '0', 1, 3, '0', '1', '', '1586769412'),
(1586769420, 1, '1586769420-1', '1586763665-1', '127.0.0.1', '0', '/', '/admin/feedback/config/success1/', '', '0', 'admin', '', '1', 0, 'admin', 0, 'element', '0', '0', 1, 3, '0', '1', '', '1586769424'),
(1586769426, 1, '1586769426-1', '1586763665-1', '127.0.0.1', '0', '/', '/admin/admin/', '', '0', 'feedback/site176', '', '1', 176, 'feedback', 0, 'element', '0', '0', 1, 3, '0', '1', '', '1586769426'),
(1586769428, 1, '1586769428-1', '1586763665-1', '127.0.0.1', '0', '/', '/admin/feedback/site176/', '', '0', 'feedback/param/site176', '', '1', 176, 'feedback', 0, 'param', '0', '0', 1, 3, '0', '1', '', '1586769428'),
(1586769429, 1, '1586769429-1', '1586763665-1', '127.0.0.1', '0', '/', '/admin/feedback/param/site176/', '', '0', 'feedback/param/site176/addnew1', '', '1', 176, 'feedback', 0, 'param', '0', '0', 1, 3, '0', '1', '', '1586769438'),
(1586769445, 1, '1586769445-1', '1586763665-1', '127.0.0.1', '0', '/', '/admin/feedback/param/site176/addnew1/', '', '0', 'feedback/param/site176', '', '1', 176, 'feedback', 0, 'param', '0', '0', 1, 3, '0', '1', '', '1586769445'),
(1586770284, 1, '1586770284-1', '1586763665-1', '127.0.0.1', '0', '/', '/admin/feedback/param/site176/', '', '0', 'site', '', '1', 0, 'site', 0, 'element', '0', '0', 1, 3, '0', '1', '', '1586770284'),
(1586770456, 1, '1586770456-1', '1586763665-1', '127.0.0.1', '0', '/', '/', '?587&amp;amp;help=1', '0', '/', '?587&amp;amp;help=1', '0', 1, 'site', 1, 'element', '0', '0', 1, 3, '0', '1', '', '1586770456'),
(1586770538, 1, '1586770538-1', '1586763665-1', '127.0.0.1', '0', '/', '/', '?587&amp;amp;help=1', '0', '/', '?587&amp;amp;help=1', '0', 1, 'site', 1, 'element', '0', '0', 1, 3, '0', '1', '', '1586770538'),
(1586770562, 1, '1586770562-1', '1586763665-1', '127.0.0.1', '0', '/', '/', '?587&amp;amp;help=1', '0', '/', '?587&amp;amp;help=1', '0', 1, 'site', 1, 'element', '0', '0', 1, 3, '0', '1', '', '1586770562'),
(1586771192, 1, '1586771192-1', '1586763665-1', '127.0.0.1', '0', '/', '/', '?587&amp;amp;help=1', '0', '/', '?587&amp;amp;help=1', '0', 1, 'site', 1, 'element', '0', '0', 1, 3, '0', '1', '', '1586771192'),
(1586771447, 1, '1586771447-1', '1586763665-1', '127.0.0.1', '0', '/', '/', '?587&amp;amp;help=1', '0', '/', '?587&amp;amp;help=1', '0', 1, 'site', 1, 'element', '0', '0', 1, 3, '0', '1', '', '1586771447'),
(1586772585, 1, '1586772585-1', '1586763665-1', '127.0.0.1', '0', '/', '/', '?587&amp;amp;help=1', '0', '/', '?587&amp;amp;help=1', '0', 1, 'site', 1, 'element', '0', '0', 1, 3, '0', '1', '', '1586772585'),
(1586772618, 1, '1586772618-1', '1586763665-1', '127.0.0.1', '0', '/', '/', '?587&amp;amp;help=1', '0', '/', '?587&amp;amp;help=1', '0', 1, 'site', 1, 'element', '0', '0', 1, 3, '0', '1', '', '1586772618'),
(1586772653, 1, '1586772653-1', '1586763665-1', '127.0.0.1', '0', '/', '/', '?587&amp;amp;help=1', '0', '/', '?587&amp;amp;help=1', '0', 1, 'site', 1, 'element', '0', '0', 1, 3, '0', '1', '', '1586772653'),
(1586772843, 1, '1586772843-1', '1586763665-1', '127.0.0.1', '0', '/', '/', '?587&amp;amp;help=1', '0', '/', '?587&amp;amp;help=1', '0', 1, 'site', 1, 'element', '0', '0', 1, 3, '0', '1', '', '1586772843'),
(1586772886, 1, '1586772886-1', '1586763665-1', '127.0.0.1', '0', '/', '/', '?587&amp;amp;help=1', '0', '/', '?587&amp;amp;help=1', '0', 1, 'site', 1, 'element', '0', '0', 1, 3, '0', '1', '', '1586772886'),
(1586772891, 1, '1586772891-1', '1586763665-1', '127.0.0.1', '0', '/', '/', '?587&amp;amp;help=1', '0', 'privacy', '', '0', 150, 'site', 150, 'element', '0', '0', 1, 3, '0', '1', '', '1586772891'),
(1586772893, 1, '1586772893-1', '1586763665-1', '127.0.0.1', '0', '/', '/', '?587&amp;amp;help=1', '0', '/', '?587&amp;amp;help=1', '0', 1, 'site', 1, 'element', '0', '0', 1, 3, '0', '1', '', '1586772893'),
(1586772923, 1, '1586772923-1', '1586763665-1', '127.0.0.1', '0', '/', '/', '?587&amp;amp;help=1', '0', '/', '?587&amp;amp;help=1', '0', 1, 'site', 1, 'element', '0', '0', 1, 3, '0', '1', '', '1586772923'),
(1586772939, 1, '1586772939-1', '1586763665-1', '127.0.0.1', '0', '/', '/', '?587&amp;amp;help=1', '0', '/', '?587&amp;amp;help=1', '0', 1, 'site', 1, 'element', '0', '0', 1, 3, '0', '1', '', '1586772939'),
(1586772951, 1, '1586772951-1', '1586763665-1', '127.0.0.1', '0', '/', '/', '?587&amp;amp;help=1', '0', '/', '?587&amp;amp;help=1', '0', 1, 'site', 1, 'element', '0', '0', 1, 3, '0', '1', '', '1586772951'),
(1586772999, 1, '1586772999-1', '1586763665-1', '127.0.0.1', '0', '/', '/', '?587&amp;amp;help=1', '0', '/', '?587&amp;amp;help=1', '0', 1, 'site', 1, 'element', '0', '0', 1, 3, '0', '1', '', '1586772999'),
(1586773016, 1, '1586773016-1', '1586763665-1', '127.0.0.1', '0', '/', '/', '?587&amp;amp;help=1', '0', '/', '?587&amp;amp;help=1', '0', 1, 'site', 1, 'element', '0', '0', 1, 3, '0', '1', '', '1586773016'),
(1586773042, 1, '1586773042-1', '1586763665-1', '127.0.0.1', '0', '/', '/', '?587&amp;amp;help=1', '0', '/', '?587&amp;amp;help=1', '0', 1, 'site', 1, 'element', '0', '0', 1, 3, '0', '1', '', '1586773042'),
(1586773074, 1, '1586773074-1', '1586763665-1', '127.0.0.1', '0', '/', '/', '?587&amp;amp;help=1', '0', '/', '?587&amp;amp;help=1', '0', 1, 'site', 1, 'element', '0', '0', 1, 3, '0', '1', '', '1586773074'),
(1586773148, 1, '1586773148-1', '1586763665-1', '127.0.0.1', '0', '/', '/', '?587&amp;amp;help=1', '0', '/', '?587&amp;amp;help=1', '0', 1, 'site', 1, 'element', '0', '0', 1, 3, '0', '1', '', '1586773148'),
(1586773684, 1, '1586773684-1', '1586763665-1', '127.0.0.1', '0', '/', '/', '?587&amp;amp;help=1', '0', '/', '?587&amp;amp;help=1', '0', 1, 'site', 1, 'element', '0', '0', 1, 3, '0', '1', '', '1586773684'),
(1586773707, 1, '1586773707-1', '1586763665-1', '127.0.0.1', '0', '/', '/', '?587&amp;amp;help=1', '0', '/', '?587&amp;amp;help=1', '0', 1, 'site', 1, 'element', '0', '0', 1, 3, '0', '1', '', '1586773707'),
(1586773733, 1, '1586773733-1', '1586763665-1', '127.0.0.1', '0', '/', '/', '?587&amp;amp;help=1', '0', '/', '?587&amp;amp;help=1', '0', 1, 'site', 1, 'element', '0', '0', 1, 3, '0', '1', '', '1586773733'),
(1586773746, 1, '1586773746-1', '1586763665-1', '127.0.0.1', '0', '/', '/', '?587&amp;amp;help=1', '0', '/', '?587&amp;amp;help=1', '0', 1, 'site', 1, 'element', '0', '0', 1, 3, '0', '1', '', '1586773746'),
(1586773760, 1, '1586773760-1', '1586763665-1', '127.0.0.1', '0', '/', '/', '?587&amp;amp;help=1', '0', '/', '?587&amp;amp;help=1', '0', 1, 'site', 1, 'element', '0', '0', 1, 3, '0', '1', '', '1586773760'),
(1586773818, 1, '1586773818-1', '1586763665-1', '127.0.0.1', '0', '/', '/', '?587&amp;amp;help=1', '0', '/', '?587&amp;amp;help=1', '0', 1, 'site', 1, 'element', '0', '0', 1, 3, '0', '1', '', '1586773818'),
(1586773837, 1, '1586773837-1', '1586763665-1', '127.0.0.1', '0', '/', '/', '?587&amp;amp;help=1', '0', '/', '?587&amp;amp;help=1', '0', 1, 'site', 1, 'element', '0', '0', 1, 3, '0', '1', '', '1586773837'),
(1586773864, 1, '1586773864-1', '1586763665-1', '127.0.0.1', '0', '/', '/', '?587&amp;amp;help=1', '0', '/', '?587&amp;amp;help=1', '0', 1, 'site', 1, 'element', '0', '0', 1, 3, '0', '1', '', '1586773864'),
(1586773872, 1, '1586773872-1', '1586763665-1', '127.0.0.1', '0', '/', '/', '?587&amp;amp;help=1', '0', '/', '?587&amp;amp;help=1', '0', 1, 'site', 1, 'element', '0', '0', 1, 3, '0', '1', '', '1586773872'),
(1586773890, 1, '1586773890-1', '1586763665-1', '127.0.0.1', '0', '/', '/', '?587&amp;amp;help=1', '0', '/', '?587&amp;amp;help=1', '0', 1, 'site', 1, 'element', '0', '0', 1, 3, '0', '1', '', '1586773890'),
(1586773906, 1, '1586773906-1', '1586763665-1', '127.0.0.1', '0', '/', '/', '?587&amp;amp;help=1', '0', '/', '?587&amp;amp;help=1', '0', 1, 'site', 1, 'element', '0', '0', 1, 3, '0', '1', '', '1586773906'),
(1586773915, 1, '1586773915-1', '1586763665-1', '127.0.0.1', '0', '/', '/', '?587&amp;amp;help=1', '0', '/', '?587&amp;amp;help=1', '0', 1, 'site', 1, 'element', '0', '0', 1, 3, '0', '1', '', '1586773915'),
(1586773930, 1, '1586773930-1', '1586763665-1', '127.0.0.1', '0', '/', '/', '?587&amp;amp;help=1', '0', '/', '?587&amp;amp;help=1', '0', 1, 'site', 1, 'element', '0', '0', 1, 3, '0', '1', '', '1586773930'),
(1586773962, 1, '1586773962-1', '1586763665-1', '127.0.0.1', '0', '/', '/', '?587&amp;amp;help=1', '0', '/', '?587&amp;amp;help=1', '0', 1, 'site', 1, 'element', '0', '0', 1, 3, '0', '1', '', '1586773962'),
(1586774002, 1, '1586774002-1', '1586763665-1', '127.0.0.1', '0', '/', '/', '?587&amp;amp;help=1', '0', '/', '?587&amp;amp;help=1', '0', 1, 'site', 1, 'element', '0', '0', 1, 3, '0', '1', '', '1586774002'),
(1586774021, 1, '1586774021-1', '1586763665-1', '127.0.0.1', '0', '/', '/', '?587&amp;amp;help=1', '0', '/', '?587&amp;amp;help=1', '0', 1, 'site', 1, 'element', '0', '0', 1, 3, '0', '1', '', '1586774021'),
(1586774038, 1, '1586774038-1', '1586763665-1', '127.0.0.1', '0', '/', '/', '?587&amp;amp;help=1', '0', '/', '?587&amp;amp;help=1', '0', 1, 'site', 1, 'element', '0', '0', 1, 3, '0', '1', '', '1586774038'),
(1586774047, 1, '1586774047-1', '1586763665-1', '127.0.0.1', '0', '/', '/', '?587&amp;amp;help=1', '0', '/', '?587&amp;amp;help=1', '0', 1, 'site', 1, 'element', '0', '0', 1, 3, '0', '1', '', '1586774047'),
(1586774097, 1, '1586774097-1', '1586763665-1', '127.0.0.1', '0', '/', '/', '?587&amp;amp;help=1', '0', '/', '?587&amp;amp;help=1', '0', 1, 'site', 1, 'element', '0', '0', 1, 3, '0', '1', '', '1586774097'),
(1586774109, 1, '1586774109-1', '1586763665-1', '127.0.0.1', '0', '/', '/admin/feedback/param/site176/', '', '0', 'site', '', '1', 0, 'site', 0, 'element', '0', '0', 1, 3, '0', '1', '', '1586774109'),
(1586777577, 1, '1586777577-1', '1586777577-1', '127.0.0.1', '0', '/', '/', '?587&amp;amp;help=1', '0', '/', '?587&amp;amp;help=1', '0', 1, 'site', 1, 'element', '0', '0', 0, 0, '1', '1', '', '1586777577'),
(1586777578, 1, '1586777578-1', '1586777577-1', '127.0.0.1', '0', '/', '/admin/feedback/param/site176/', '', '0', 'site', '', '1', 0, '', 0, 'element', '0', '0', 0, 0, '1', '1', '', '1586777578'),
(1586777582, 1, '1586777582-1', '1586777577-1', '127.0.0.1', '0', '/', '/admin/site/', '', '0', 'site', '', '1', 0, 'site', 0, 'element', '0', '0', 1, 3, '0', '1', '', '1586777582'),
(1586779649, 1, '1586779649-1', '1586777577-1', '127.0.0.1', '0', '/', '/admin/site/', '', '0', 'shop', '', '1', 164, 'shop', 0, 'element', '0', '0', 1, 3, '0', '1', '', '1586779649'),
(1586779651, 1, '1586779651-1', '1586777577-1', '127.0.0.1', '0', '/', '/admin/shop/', '', '0', 'shop/category/site164', '', '1', 164, 'shop', 0, 'cat', '0', '0', 1, 3, '0', '1', '', '1586779651'),
(1586779652, 1, '1586779652-1', '1586777577-1', '127.0.0.1', '0', '/', '/admin/shop/category/site164/', '', '0', 'shop/category/site164/addnew1', '', '1', 164, 'shop', 0, 'cat', '0', '0', 1, 3, '0', '1', '', '1586779652'),
(1586779676, 1, '1586779676-1', '1586777577-1', '127.0.0.1', '0', '/', '/admin/shop/category/site164/addnew1/', '', '0', 'shop/config', '', '1', 0, 'shop', 0, 'element', '0', '0', 1, 3, '0', '1', '', '1586779676'),
(1586779739, 1, '1586779739-1', '1586777577-1', '127.0.0.1', '0', '/', '/admin/shop/config/', '', '0', 'images', '', '1', 0, 'images', 0, 'element', '0', '0', 1, 3, '0', '1', '', '1586779739'),
(1586779742, 1, '1586779742-1', '1586777577-1', '127.0.0.1', '0', '/', '/admin/images/', '', '0', 'images/addnew1', '', '1', 0, 'images', 0, 'element', '0', '0', 1, 3, '0', '1', '', '1586779742'),
(1586779758, 1, '1586779758-1', '1586777577-1', '127.0.0.1', '0', '/', '/admin/images/addnew1/', '', '0', 'images', '', '1', 0, 'images', 0, 'element', '0', '0', 1, 3, '0', '1', '', '1586779758'),
(1586779761, 1, '1586779761-1', '1586777577-1', '127.0.0.1', '0', '/', '/admin/images/', '', '0', 'shop', '', '1', 164, 'shop', 0, 'element', '0', '0', 1, 3, '0', '1', '', '1586779761'),
(1586779763, 1, '1586779763-1', '1586777577-1', '127.0.0.1', '0', '/', '/admin/shop/', '', '0', 'shop/config', '', '1', 0, 'shop', 0, 'element', '0', '0', 1, 3, '0', '1', '', '1586779763'),
(1586779764, 1, '1586779764-1', '1586777577-1', '127.0.0.1', '0', '/', '/admin/shop/config/', '', '0', 'shop/category', '', '1', 164, 'shop', 0, 'cat', '0', '0', 1, 3, '0', '1', '', '1586779764'),
(1586779765, 1, '1586779765-1', '1586777577-1', '127.0.0.1', '0', '/', '/admin/shop/category/', '', '0', 'shop/category/site164/site164/addnew1', '', '1', 164, 'shop', 0, 'cat', '0', '0', 1, 3, '0', '1', '', '1586779765'),
(1586779768, 1, '1586779768-1', '1586777577-1', '127.0.0.1', '0', '/', '/admin/shop/category/site164/site164/addnew1/', '', '0', 'shop/config', '', '1', 0, 'shop', 0, 'element', '0', '0', 1, 3, '0', '1', '', '1586779768'),
(1586779779, 1, '1586779779-1', '1586777577-1', '127.0.0.1', '0', '/', '/admin/shop/config/', '', '0', 'shop/config/success1', '', '1', 0, 'shop', 0, 'element', '0', '0', 1, 3, '0', '1', '', '1586779779'),
(1586779780, 1, '1586779780-1', '1586777577-1', '127.0.0.1', '0', '/', '/admin/shop/config/success1/', '', '0', 'shop/category', '', '1', 164, 'shop', 0, 'cat', '0', '0', 1, 3, '0', '1', '', '1586779780'),
(1586779781, 1, '1586779781-1', '1586777577-1', '127.0.0.1', '0', '/', '/admin/shop/category/', '', '0', 'shop/category/site164/site164/addnew1', '', '1', 164, 'shop', 0, 'cat', '0', '0', 1, 3, '0', '1', '', '1586779781'),
(1586779796, 1, '1586779796-1', '1586777577-1', '127.0.0.1', '0', '/', '/admin/shop/category/site164/site164/addnew1/', '', '0', 'shop/category/site164/addnew1', '', '1', 164, 'shop', 0, 'cat', '0', '0', 1, 3, '0', '1', '', '1586779854'),
(1586779869, 1, '1586779869-1', '1586777577-1', '127.0.0.1', '0', '/', '/admin/shop/category/site164/addnew1/', '', '0', 'shop/category/site164', '', '1', 164, 'shop', 0, 'cat', '0', '0', 1, 3, '0', '1', '', '1586779869'),
(1586780004, 1, '1586780004-1', '1586777577-1', '127.0.0.1', '0', '/', '/', '?587&amp;amp;help=1', '0', '/', '?587&amp;amp;help=1', '0', 1, 'site', 1, 'element', '0', '0', 1, 3, '0', '1', '', '1586780004'),
(1586780236, 1, '1586780236-1', '1586777577-1', '127.0.0.1', '0', '/', '/', '?587&amp;amp;help=1', '0', '/', '?587&amp;amp;help=1', '0', 1, 'site', 1, 'element', '0', '0', 1, 3, '0', '1', '', '1586780236'),
(1586780271, 1, '1586780271-1', '1586777577-1', '127.0.0.1', '0', '/', '/', '?587&amp;amp;help=1', '0', 'shop/mekhanicheskie-ustroystva-upravleniya', '', '0', 164, 'shop', 2, 'cat', '0', '0', 1, 3, '0', '1', '', '1586780271'),
(1586780272, 1, '1586780272-1', '1586777577-1', '127.0.0.1', '0', '/', '/', '?587&amp;amp;help=1', '0', '/', '?587&amp;amp;help=1', '0', 1, 'site', 1, 'element', '0', '0', 1, 3, '0', '1', '', '1586780272'),
(1586780309, 1, '1586780309-1', '1586777577-1', '127.0.0.1', '0', '/', '/', '?587&amp;amp;help=1', '0', '/', '?587&amp;amp;help=1', '0', 1, 'site', 1, 'element', '0', '0', 1, 3, '0', '1', '', '1586780309'),
(1586780313, 1, '1586780313-1', '1586777577-1', '127.0.0.1', '0', '/', '/', '?587&amp;amp;help=1', '0', '/', '?587&amp;amp;help=1', '0', 1, 'site', 1, 'element', '0', '0', 1, 3, '0', '1', '', '1586780313'),
(1586780334, 1, '1586780334-1', '1586777577-1', '127.0.0.1', '0', '/', '/', '?587&amp;amp;help=1', '0', '/', '?587&amp;amp;help=1', '0', 1, 'site', 1, 'element', '0', '0', 1, 3, '0', '1', '', '1586780334'),
(1586780416, 1, '1586780416-1', '1586777577-1', '127.0.0.1', '0', '/', '/', '?587&amp;amp;help=1', '0', '/', '?587&amp;amp;help=1', '0', 1, 'site', 1, 'element', '0', '0', 1, 3, '0', '1', '', '1586780416'),
(1586780422, 1, '1586780422-1', '1586777577-1', '127.0.0.1', '0', '/', '/', '?587&amp;amp;help=1', '0', '/', '?587&amp;amp;help=1', '0', 1, 'site', 1, 'element', '0', '0', 1, 3, '0', '1', '', '1586780422'),
(1586780503, 1, '1586780503-1', '1586777577-1', '127.0.0.1', '0', '/', '/', '?587&amp;amp;help=1', '0', '/', '?587&amp;amp;help=1', '0', 1, 'site', 1, 'element', '0', '0', 1, 3, '0', '1', '', '1586780503'),
(1586780510, 1, '1586780510-1', '1586777577-1', '127.0.0.1', '0', '/', '/', '?587&amp;amp;help=1', '0', '/', '?587&amp;amp;help=1', '0', 1, 'site', 1, 'element', '0', '0', 1, 3, '0', '1', '', '1586780510'),
(1586780524, 1, '1586780524-1', '1586777577-1', '127.0.0.1', '0', '/', '/', '?587&amp;amp;help=1', '0', '/', '?587&amp;amp;help=1', '0', 1, 'site', 1, 'element', '0', '0', 1, 3, '0', '1', '', '1586780524'),
(1586780548, 1, '1586780548-1', '1586777577-1', '127.0.0.1', '0', '/', '/', '?587&amp;amp;help=1', '0', '/', '?587&amp;amp;help=1', '0', 1, 'site', 1, 'element', '0', '0', 1, 3, '0', '1', '', '1586780548'),
(1586780565, 1, '1586780565-1', '1586777577-1', '127.0.0.1', '0', '/', '/', '?587&amp;amp;help=1', '0', '/', '?587&amp;amp;help=1', '0', 1, 'site', 1, 'element', '0', '0', 1, 3, '0', '1', '', '1586780565'),
(1586780575, 1, '1586780575-1', '1586777577-1', '127.0.0.1', '0', '/', '/', '?587&amp;amp;help=1', '0', '/', '?587&amp;amp;help=1', '0', 1, 'site', 1, 'element', '0', '0', 1, 3, '0', '1', '', '1586780575'),
(1586780577, 1, '1586780577-1', '1586777577-1', '127.0.0.1', '0', '/', '/', '?587&amp;amp;help=1', '0', 'shop/pnevmaticheskie-organy-upravleniya', '', '0', 164, 'shop', 7, 'cat', '0', '0', 1, 3, '0', '1', '', '1586780577'),
(1586780579, 1, '1586780579-1', '1586777577-1', '127.0.0.1', '0', '/', '/', '?587&amp;amp;help=1', '0', '/', '?587&amp;amp;help=1', '0', 1, 'site', 1, 'element', '0', '0', 1, 3, '0', '1', '', '1586780579'),
(1586780610, 1, '1586780610-1', '1586777577-1', '127.0.0.1', '0', '/', '/admin/shop/category/site164/', '', '0', 'site', '', '1', 0, 'site', 0, 'element', '0', '0', 1, 3, '0', '1', '', '1586780610'),
(1586780611, 1, '1586780611-1', '1586777577-1', '127.0.0.1', '0', '/', '/admin/site/', '', '0', 'site/edit1', '', '1', 0, 'site', 1, 'element', '0', '0', 1, 3, '0', '1', '', '1586780611'),
(1586780618, 1, '1586780618-1', '1586777577-1', '127.0.0.1', '0', '/', '/admin/site/edit1/', '', '0', 'site', '', '1', 0, 'site', 0, 'element', '0', '0', 1, 3, '0', '1', '', '1586780618'),
(1586780620, 1, '1586780620-1', '1586777577-1', '127.0.0.1', '0', '/', '/', '?587&amp;amp;help=1', '0', '/', '?587&amp;amp;help=1', '0', 1, 'site', 1, 'element', '0', '0', 1, 3, '0', '1', '', '1586780620'),
(1586780628, 1, '1586780628-1', '1586777577-1', '127.0.0.1', '0', '/', '/', '?587&amp;amp;help=1', '0', '/', '?587&amp;amp;help=1', '0', 1, 'site', 1, 'element', '0', '0', 1, 3, '0', '1', '', '1586780628'),
(1586780629, 1, '1586780629-1', '1586777577-1', '127.0.0.1', '0', '/', '/', '?587&amp;amp;help=1', '0', 'shop', '', '0', 164, 'site', 164, 'element', '0', '0', 1, 3, '0', '1', '', '1586780629'),
(1586780644, 1, '1586780644-1', '1586777577-1', '127.0.0.1', '0', '/', '/', '?587&amp;amp;help=1', '0', '/', '?587&amp;amp;help=1', '0', 1, 'site', 1, 'element', '0', '0', 1, 3, '0', '1', '', '1586780644'),
(1586781590, 1, '1586781590-1', '1586777577-1', '127.0.0.1', '0', '/', '/', '?587&amp;amp;help=1', '0', '/', '?587&amp;amp;help=1', '0', 1, 'site', 1, 'element', '0', '0', 1, 3, '0', '1', '', '1586781590'),
(1586781608, 1, '1586781608-1', '1586777577-1', '127.0.0.1', '0', '/', '/admin/site/', '', '0', 'site/blocks', '', '1', 0, 'site', 0, 'element', '0', '0', 1, 3, '0', '1', '', '1586781608'),
(1586781609, 1, '1586781609-1', '1586777577-1', '127.0.0.1', '0', '/', '/admin/site/blocks/', '', '0', 'site/blocks/edit2', '', '1', 0, 'site', 2, 'element', '0', '0', 1, 3, '0', '1', '', '1586781609'),
(1586781626, 1, '1586781626-1', '1586777577-1', '127.0.0.1', '0', '/', '/admin/site/blocks/edit2/', '', '0', 'site/blocks', '', '1', 0, 'site', 0, 'element', '0', '0', 1, 3, '0', '1', '', '1586781626'),
(1586781628, 1, '1586781628-1', '1586777577-1', '127.0.0.1', '0', '/', '/', '?587&amp;amp;help=1', '0', '/', '?587&amp;amp;help=1', '0', 1, 'site', 1, 'element', '0', '0', 1, 3, '0', '1', '', '1586781628'),
(1586781635, 1, '1586781635-1', '1586777577-1', '127.0.0.1', '0', '/', '/', '?587&amp;amp;help=1', '0', '/', '?587&amp;amp;help=1', '0', 1, 'site', 1, 'element', '0', '0', 1, 3, '0', '1', '', '1586781635'),
(1586781640, 1, '1586781640-1', '1586777577-1', '127.0.0.1', '0', '/', '/', '?587&amp;amp;help=1', '0', '/', '?587&amp;amp;help=1', '0', 1, 'site', 1, 'element', '0', '0', 1, 3, '0', '1', '', '1586781640'),
(1586781657, 1, '1586781657-1', '1586777577-1', '127.0.0.1', '0', '/', '/', '?587&amp;amp;help=1', '0', '/', '?587&amp;amp;help=1', '0', 1, 'site', 1, 'element', '0', '0', 1, 3, '0', '1', '', '1586781657'),
(1586781686, 1, '1586781686-1', '1586777577-1', '127.0.0.1', '0', '/', '/admin/site/blocks/', '', '0', 'site/blocks/edit3', '', '1', 0, 'site', 3, 'element', '0', '0', 1, 3, '0', '1', '', '1586781686'),
(1586781707, 1, '1586781707-1', '1586777577-1', '127.0.0.1', '0', '/', '/admin/site/blocks/edit3/', '', '0', 'site/blocks', '', '1', 0, 'site', 0, 'element', '0', '0', 1, 3, '0', '1', '', '1586781707'),
(1586781708, 1, '1586781708-1', '1586777577-1', '127.0.0.1', '0', '/', '/', '?587&amp;amp;help=1', '0', '/', '?587&amp;amp;help=1', '0', 1, 'site', 1, 'element', '0', '0', 1, 3, '0', '1', '', '1586781708'),
(1586781717, 1, '1586781717-1', '1586777577-1', '127.0.0.1', '0', '/', '/', '?587&amp;amp;help=1', '0', '/', '?587&amp;amp;help=1', '0', 1, 'site', 1, 'element', '0', '0', 1, 3, '0', '1', '', '1586781717'),
(1586781736, 1, '1586781736-1', '1586777577-1', '127.0.0.1', '0', '/', '/', '?587&amp;amp;help=1', '0', '/', '?587&amp;amp;help=1', '0', 1, 'site', 1, 'element', '0', '0', 1, 3, '0', '1', '', '1586781736'),
(1586781971, 1, '1586781971-1', '1586777577-1', '127.0.0.1', '0', '/', '/admin/site/blocks/', '', '0', 'site', '', '1', 0, 'site', 0, 'element', '0', '0', 1, 3, '0', '1', '', '1586781971'),
(1586781974, 1, '1586781974-1', '1586777577-1', '127.0.0.1', '0', '/', '/admin/site/', '', '0', 'site/edit175', '', '1', 0, 'site', 175, 'element', '0', '0', 1, 3, '0', '1', '', '1586781974'),
(1586781991, 1, '1586781991-1', '1586777577-1', '127.0.0.1', '0', '/', '/admin/site/edit175/', '', '0', 'site', '', '1', 0, 'site', 0, 'element', '0', '0', 1, 3, '0', '1', '', '1586781991'),
(1586781993, 1, '1586781993-1', '1586777577-1', '127.0.0.1', '0', '/', '/', '?587&amp;amp;help=1', '0', 'kontakty', '', '0', 175, 'site', 175, 'element', '0', '0', 1, 3, '0', '1', '', '1586782689'),
(1586782721, 1, '1586782721-1', '1586777577-1', '127.0.0.1', '0', '/', '/kontakty/', '', '0', 'o-kompanii', '', '0', 174, 'site', 174, 'element', '0', '0', 1, 3, '0', '1', '', '1586782721'),
(1586782722, 1, '1586782722-1', '1586777577-1', '127.0.0.1', '0', '/', '/o-kompanii/', '', '0', 'kontakty', '', '0', 175, 'site', 175, 'element', '0', '0', 1, 3, '0', '1', '', '1586782722'),
(1586782724, 1, '1586782724-1', '1586777577-1', '127.0.0.1', '0', '/', '/kontakty/', '', '0', 'o-kompanii', '', '0', 174, 'site', 174, 'element', '0', '0', 1, 3, '0', '1', '', '1586782724'),
(1586782726, 1, '1586782726-1', '1586777577-1', '127.0.0.1', '0', '/', '/o-kompanii/', '', '0', 'kontakty', '', '0', 175, 'site', 175, 'element', '0', '0', 1, 3, '0', '1', '', '1586782726'),
(1586782726, 2, '1586782726-2', '1586777577-1', '127.0.0.1', '0', '/', '/kontakty/', '', '0', 'o-kompanii', '', '0', 174, 'site', 174, 'element', '0', '0', 1, 3, '0', '1', '', '1586782726'),
(1586782731, 1, '1586782731-1', '1586777577-1', '127.0.0.1', '0', '/', '/o-kompanii/', '', '0', 'kontakty', '', '0', 175, 'site', 175, 'element', '0', '0', 1, 3, '0', '1', '', '1586782731');
INSERT INTO `diafan_visitors_url` (`master_id`, `slave_id`, `id`, `visitors_session_id`, `hostname`, `referer_scheme`, `referer_domain`, `referer_rewrite`, `referer_query`, `scheme`, `rewrite`, `query`, `is_admin`, `site_id`, `module_name`, `element_id`, `element_type`, `is_mobile`, `is_mobile_url`, `user_id`, `role_id`, `visits`, `status`, `search_bot`, `timeedit`) VALUES
(1586782732, 1, '1586782732-1', '1586777577-1', '127.0.0.1', '0', '/', '/kontakty/', '', '0', 'o-kompanii', '', '0', 174, 'site', 174, 'element', '0', '0', 1, 3, '0', '1', '', '1586782964'),
(1586782966, 1, '1586782966-1', '1586777577-1', '127.0.0.1', '0', '/', '/o-kompanii/', '', '0', 'oplata-i-dostavka', '', '0', 173, 'site', 173, 'element', '0', '0', 1, 3, '0', '1', '', '1586782966'),
(1586783005, 1, '1586783005-1', '1586777577-1', '127.0.0.1', '0', '/', '/admin/site/', '', '0', 'site/edit174', '', '1', 0, 'site', 174, 'element', '0', '0', 1, 3, '0', '1', '', '1586783005'),
(1586783007, 1, '1586783007-1', '1586777577-1', '127.0.0.1', '0', '/', '/admin/site/edit174/', '', '0', 'site', '', '1', 0, 'site', 0, 'element', '0', '0', 1, 3, '0', '1', '', '1586783007'),
(1586783009, 1, '1586783009-1', '1586777577-1', '127.0.0.1', '0', '/', '/oplata-i-dostavka/', '', '0', 'o-kompanii', '', '0', 174, 'site', 174, 'element', '0', '0', 1, 3, '0', '1', '', '1586783009'),
(1586783028, 1, '1586783028-1', '1586777577-1', '127.0.0.1', '0', '/', '/admin/site/', '', '0', 'site/edit174', '', '1', 0, 'site', 174, 'element', '0', '0', 1, 3, '0', '1', '', '1586783028'),
(1586783031, 1, '1586783031-1', '1586777577-1', '127.0.0.1', '0', '/', '/admin/site/edit174/', '', '0', 'site', '', '1', 0, 'site', 0, 'element', '0', '0', 1, 3, '0', '1', '', '1586783031'),
(1586783032, 1, '1586783032-1', '1586777577-1', '127.0.0.1', '0', '/', '/oplata-i-dostavka/', '', '0', 'o-kompanii', '', '0', 174, 'site', 174, 'element', '0', '0', 1, 3, '0', '1', '', '1586783032'),
(1586783185, 1, '1586783185-1', '1586777577-1', '127.0.0.1', '0', '/', '/dasd/', '', '0', 'kontakty', '', '0', 175, 'site', 175, 'element', '0', '0', 1, 3, '0', '1', '', '1586783185'),
(1586783189, 1, '1586783189-1', '1586777577-1', '127.0.0.1', '0', '/', '/kontakty/', '', '0', 'oplata-i-dostavka', '', '0', 173, 'site', 173, 'element', '0', '0', 1, 3, '0', '1', '', '1586783189'),
(1586783193, 1, '1586783193-1', '1586777577-1', '127.0.0.1', '0', '/', '/oplata-i-dostavka/', '', '0', 'o-kompanii', '', '0', 174, 'site', 174, 'element', '0', '0', 1, 3, '0', '1', '', '1586783193'),
(1586783199, 1, '1586783199-1', '1586777577-1', '127.0.0.1', '0', '/', '/o-kompanii/', '', '0', 'shop', '', '0', 164, 'site', 164, 'element', '0', '0', 1, 3, '0', '1', '', '1586783199'),
(1586783273, 1, '1586783273-1', '1586777577-1', '127.0.0.1', '0', '/', '/fsdff/', '', '0', 'oplata-i-dostavka', '', '0', 173, 'site', 173, 'element', '0', '0', 1, 3, '0', '1', '', '1586783273'),
(1586783276, 1, '1586783276-1', '1586777577-1', '127.0.0.1', '0', '/', '/oplata-i-dostavka/', '', '0', 'o-kompanii', '', '0', 174, 'site', 174, 'element', '0', '0', 1, 3, '0', '1', '', '1586783276'),
(1586783276, 2, '1586783276-2', '1586777577-1', '127.0.0.1', '0', '/', '/o-kompanii/', '', '0', 'kontakty', '', '0', 175, 'site', 175, 'element', '0', '0', 1, 3, '0', '1', '', '1586783276'),
(1586783277, 1, '1586783277-1', '1586777577-1', '127.0.0.1', '0', '/', '/kontakty/', '', '0', 'oplata-i-dostavka', '', '0', 173, 'site', 173, 'element', '0', '0', 1, 3, '0', '1', '', '1586783277'),
(1586783278, 1, '1586783278-1', '1586777577-1', '127.0.0.1', '0', '/', '/oplata-i-dostavka/', '', '0', 'shop', '', '0', 164, 'site', 164, 'element', '0', '0', 1, 3, '0', '1', '', '1586783279'),
(1586783280, 1, '1586783280-1', '1586777577-1', '127.0.0.1', '0', '/', '/shop/', '', '0', 'shop/mekhanicheskie-ustroystva-upravleniya', '', '0', 164, 'shop', 2, 'cat', '0', '0', 1, 3, '0', '1', '', '1586785342'),
(1586785702, 1, '1586785702-1', '1586777577-1', '127.0.0.1', '0', '/', '/shop/mekhanicheskie-ustroystva-upravleniya/', '', '0', '/', '', '0', 1, 'site', 1, 'element', '0', '0', 1, 3, '0', '1', '', '1586785702');

-- --------------------------------------------------------

--
-- Структура таблицы `diafan_votes`
--

CREATE TABLE `diafan_votes` (
  `id` int(11) UNSIGNED NOT NULL COMMENT 'идентификатор',
  `name1` text DEFAULT NULL COMMENT 'название',
  `act1` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'показывать на сайте: 0 - нет, 1 - да',
  `no_result` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'не показывать результаты: 0 - нет, 1 - да',
  `userversion` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'пользователи могут дать свой вариант ответа: 0 - нет, 1 - да',
  `sort` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'подрядковый номер для сортировки',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Опросы';

-- --------------------------------------------------------

--
-- Структура таблицы `diafan_votes_answers`
--

CREATE TABLE `diafan_votes_answers` (
  `id` int(11) UNSIGNED NOT NULL COMMENT 'идентификатор',
  `text1` text DEFAULT NULL COMMENT 'описание',
  `votes_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор вопроса из таблицы `diafan_votes`',
  `count_votes` int(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'количество ответов',
  `sort` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'подрядковый номер для сортировки',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Варианты ответов на опросы';

-- --------------------------------------------------------

--
-- Структура таблицы `diafan_votes_site_rel`
--

CREATE TABLE `diafan_votes_site_rel` (
  `id` int(11) UNSIGNED NOT NULL COMMENT 'идентификатор',
  `element_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор вопроса из таблицы `diafan_votes`',
  `site_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор страницы сайта из таблицы `diafan_site`',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Данные о том, на каких страницах сайта выводятся опросы';

-- --------------------------------------------------------

--
-- Структура таблицы `diafan_votes_userversion`
--

CREATE TABLE `diafan_votes_userversion` (
  `id` int(11) UNSIGNED NOT NULL COMMENT 'идентификатор',
  `votes_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'идентификатор вопроса из таблицы `diafan_votes`',
  `text` varchar(250) NOT NULL DEFAULT '' COMMENT 'текст',
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'запись удалена в корзину: 0 - нет, 1 - да'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Варианты ответов пользователей';

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `diafan_ab`
--
ALTER TABLE `diafan_ab`
  ADD PRIMARY KEY (`id`),
  ADD KEY `site_id` (`site_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Индексы таблицы `diafan_ab_category`
--
ALTER TABLE `diafan_ab_category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parent_id` (`parent_id`),
  ADD KEY `site_id` (`site_id`);

--
-- Индексы таблицы `diafan_ab_category_parents`
--
ALTER TABLE `diafan_ab_category_parents`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `diafan_ab_category_rel`
--
ALTER TABLE `diafan_ab_category_rel`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cat_id` (`cat_id`);

--
-- Индексы таблицы `diafan_ab_counter`
--
ALTER TABLE `diafan_ab_counter`
  ADD PRIMARY KEY (`id`),
  ADD KEY `element_id` (`element_id`);

--
-- Индексы таблицы `diafan_ab_param`
--
ALTER TABLE `diafan_ab_param`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `diafan_ab_param_category_rel`
--
ALTER TABLE `diafan_ab_param_category_rel`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cat_id` (`cat_id`);

--
-- Индексы таблицы `diafan_ab_param_element`
--
ALTER TABLE `diafan_ab_param_element`
  ADD PRIMARY KEY (`id`),
  ADD KEY `element_id` (`element_id`),
  ADD KEY `param_id` (`param_id`);

--
-- Индексы таблицы `diafan_ab_param_select`
--
ALTER TABLE `diafan_ab_param_select`
  ADD PRIMARY KEY (`id`),
  ADD KEY `param_id` (`param_id`);

--
-- Индексы таблицы `diafan_ab_rel`
--
ALTER TABLE `diafan_ab_rel`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `diafan_access`
--
ALTER TABLE `diafan_access`
  ADD PRIMARY KEY (`id`),
  ADD KEY `module_name` (`module_name`(2)),
  ADD KEY `element_id` (`element_id`),
  ADD KEY `element_type` (`element_type`);

--
-- Индексы таблицы `diafan_addons`
--
ALTER TABLE `diafan_addons`
  ADD PRIMARY KEY (`id`),
  ADD KEY `addon_id` (`addon_id`),
  ADD KEY `custom_id` (`custom_id`);

--
-- Индексы таблицы `diafan_admin`
--
ALTER TABLE `diafan_admin`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parent_id` (`parent_id`);

--
-- Индексы таблицы `diafan_admin_parents`
--
ALTER TABLE `diafan_admin_parents`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `diafan_attachments`
--
ALTER TABLE `diafan_attachments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `element_id` (`element_id`),
  ADD KEY `module_name` (`module_name`(2));

--
-- Индексы таблицы `diafan_balance`
--
ALTER TABLE `diafan_balance`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `diafan_bs`
--
ALTER TABLE `diafan_bs`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `diafan_bs_category`
--
ALTER TABLE `diafan_bs_category`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `diafan_bs_site_rel`
--
ALTER TABLE `diafan_bs_site_rel`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `diafan_captcha_qa`
--
ALTER TABLE `diafan_captcha_qa`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `diafan_captcha_qa_answers`
--
ALTER TABLE `diafan_captcha_qa_answers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `captcha_id` (`captcha_id`);

--
-- Индексы таблицы `diafan_clauses`
--
ALTER TABLE `diafan_clauses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `site_id` (`site_id`);

--
-- Индексы таблицы `diafan_clauses_category`
--
ALTER TABLE `diafan_clauses_category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parent_id` (`parent_id`),
  ADD KEY `site_id` (`site_id`);

--
-- Индексы таблицы `diafan_clauses_category_parents`
--
ALTER TABLE `diafan_clauses_category_parents`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `diafan_clauses_category_rel`
--
ALTER TABLE `diafan_clauses_category_rel`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cat_id` (`cat_id`);

--
-- Индексы таблицы `diafan_clauses_counter`
--
ALTER TABLE `diafan_clauses_counter`
  ADD PRIMARY KEY (`id`),
  ADD KEY `element_id` (`element_id`);

--
-- Индексы таблицы `diafan_clauses_rel`
--
ALTER TABLE `diafan_clauses_rel`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `diafan_comments`
--
ALTER TABLE `diafan_comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `element_id` (`element_id`),
  ADD KEY `module_name` (`module_name`(2));

--
-- Индексы таблицы `diafan_comments_mail`
--
ALTER TABLE `diafan_comments_mail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `element_id` (`element_id`),
  ADD KEY `module_name` (`module_name`(2));

--
-- Индексы таблицы `diafan_comments_param`
--
ALTER TABLE `diafan_comments_param`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `diafan_comments_param_element`
--
ALTER TABLE `diafan_comments_param_element`
  ADD PRIMARY KEY (`id`),
  ADD KEY `element_id` (`element_id`),
  ADD KEY `param_id` (`param_id`),
  ADD KEY `value` (`value`(5));

--
-- Индексы таблицы `diafan_comments_param_select`
--
ALTER TABLE `diafan_comments_param_select`
  ADD PRIMARY KEY (`id`),
  ADD KEY `param_id` (`param_id`);

--
-- Индексы таблицы `diafan_comments_parents`
--
ALTER TABLE `diafan_comments_parents`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `diafan_config`
--
ALTER TABLE `diafan_config`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `diafan_crontab`
--
ALTER TABLE `diafan_crontab`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `diafan_custom`
--
ALTER TABLE `diafan_custom`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `diafan_executable`
--
ALTER TABLE `diafan_executable`
  ADD PRIMARY KEY (`master_id`,`slave_id`);

--
-- Индексы таблицы `diafan_faq`
--
ALTER TABLE `diafan_faq`
  ADD PRIMARY KEY (`id`),
  ADD KEY `site_id` (`site_id`);

--
-- Индексы таблицы `diafan_faq_category`
--
ALTER TABLE `diafan_faq_category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parent_id` (`parent_id`),
  ADD KEY `site_id` (`site_id`);

--
-- Индексы таблицы `diafan_faq_category_parents`
--
ALTER TABLE `diafan_faq_category_parents`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `diafan_faq_category_rel`
--
ALTER TABLE `diafan_faq_category_rel`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cat_id` (`cat_id`);

--
-- Индексы таблицы `diafan_faq_counter`
--
ALTER TABLE `diafan_faq_counter`
  ADD PRIMARY KEY (`id`),
  ADD KEY `element_id` (`element_id`);

--
-- Индексы таблицы `diafan_faq_rel`
--
ALTER TABLE `diafan_faq_rel`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `diafan_feedback`
--
ALTER TABLE `diafan_feedback`
  ADD PRIMARY KEY (`id`),
  ADD KEY `site_id` (`site_id`);

--
-- Индексы таблицы `diafan_feedback_param`
--
ALTER TABLE `diafan_feedback_param`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `diafan_feedback_param_element`
--
ALTER TABLE `diafan_feedback_param_element`
  ADD PRIMARY KEY (`id`),
  ADD KEY `element_id` (`element_id`),
  ADD KEY `param_id` (`param_id`),
  ADD KEY `value` (`value`(5));

--
-- Индексы таблицы `diafan_feedback_param_select`
--
ALTER TABLE `diafan_feedback_param_select`
  ADD PRIMARY KEY (`id`),
  ADD KEY `param_id` (`param_id`);

--
-- Индексы таблицы `diafan_files`
--
ALTER TABLE `diafan_files`
  ADD PRIMARY KEY (`id`),
  ADD KEY `site_id` (`site_id`);

--
-- Индексы таблицы `diafan_files_category`
--
ALTER TABLE `diafan_files_category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parent_id` (`parent_id`),
  ADD KEY `site_id` (`site_id`);

--
-- Индексы таблицы `diafan_files_category_parents`
--
ALTER TABLE `diafan_files_category_parents`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `diafan_files_category_rel`
--
ALTER TABLE `diafan_files_category_rel`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cat_id` (`cat_id`);

--
-- Индексы таблицы `diafan_files_counter`
--
ALTER TABLE `diafan_files_counter`
  ADD PRIMARY KEY (`id`),
  ADD KEY `element_id` (`element_id`);

--
-- Индексы таблицы `diafan_files_links`
--
ALTER TABLE `diafan_files_links`
  ADD PRIMARY KEY (`id`),
  ADD KEY `element_id` (`element_id`);

--
-- Индексы таблицы `diafan_files_rel`
--
ALTER TABLE `diafan_files_rel`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `diafan_forum`
--
ALTER TABLE `diafan_forum`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Индексы таблицы `diafan_forum_blocks`
--
ALTER TABLE `diafan_forum_blocks`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `diafan_forum_category`
--
ALTER TABLE `diafan_forum_category`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `diafan_forum_messages`
--
ALTER TABLE `diafan_forum_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parent_id` (`parent_id`),
  ADD KEY `forum_id` (`forum_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Индексы таблицы `diafan_forum_messages_parents`
--
ALTER TABLE `diafan_forum_messages_parents`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `diafan_forum_show`
--
ALTER TABLE `diafan_forum_show`
  ADD PRIMARY KEY (`id`),
  ADD KEY `element_id` (`element_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Индексы таблицы `diafan_geomap`
--
ALTER TABLE `diafan_geomap`
  ADD PRIMARY KEY (`id`),
  ADD KEY `element_id` (`element_id`),
  ADD KEY `module_name` (`module_name`(2));

--
-- Индексы таблицы `diafan_images`
--
ALTER TABLE `diafan_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `module_name` (`module_name`(2)),
  ADD KEY `element_id` (`element_id`),
  ADD KEY `element_type` (`element_type`);

--
-- Индексы таблицы `diafan_images_editor_folders`
--
ALTER TABLE `diafan_images_editor_folders`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `diafan_images_variations`
--
ALTER TABLE `diafan_images_variations`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `diafan_inserts`
--
ALTER TABLE `diafan_inserts`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `diafan_inserts_site_rel`
--
ALTER TABLE `diafan_inserts_site_rel`
  ADD PRIMARY KEY (`id`),
  ADD KEY `site_id` (`site_id`);

--
-- Индексы таблицы `diafan_keywords`
--
ALTER TABLE `diafan_keywords`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `diafan_languages`
--
ALTER TABLE `diafan_languages`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `diafan_languages_translate`
--
ALTER TABLE `diafan_languages_translate`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `diafan_log`
--
ALTER TABLE `diafan_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ip` (`ip`(4));

--
-- Индексы таблицы `diafan_log_note`
--
ALTER TABLE `diafan_log_note`
  ADD PRIMARY KEY (`id`),
  ADD KEY `element_id` (`element_id`),
  ADD KEY `session_id` (`session_id`(2)),
  ADD KEY `include_name` (`include_name`(2)),
  ADD KEY `module_name` (`module_name`(2));

--
-- Индексы таблицы `diafan_map_index`
--
ALTER TABLE `diafan_map_index`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `diafan_menu`
--
ALTER TABLE `diafan_menu`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parent_id` (`parent_id`);

--
-- Индексы таблицы `diafan_menu_category`
--
ALTER TABLE `diafan_menu_category`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `diafan_menu_category_site_rel`
--
ALTER TABLE `diafan_menu_category_site_rel`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `diafan_menu_parents`
--
ALTER TABLE `diafan_menu_parents`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `diafan_messages`
--
ALTER TABLE `diafan_messages`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `diafan_messages_user`
--
ALTER TABLE `diafan_messages_user`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `diafan_mistakes`
--
ALTER TABLE `diafan_mistakes`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `diafan_modules`
--
ALTER TABLE `diafan_modules`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `diafan_news`
--
ALTER TABLE `diafan_news`
  ADD PRIMARY KEY (`id`),
  ADD KEY `site_id` (`site_id`);

--
-- Индексы таблицы `diafan_news_category`
--
ALTER TABLE `diafan_news_category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parent_id` (`parent_id`),
  ADD KEY `site_id` (`site_id`);

--
-- Индексы таблицы `diafan_news_category_parents`
--
ALTER TABLE `diafan_news_category_parents`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `diafan_news_category_rel`
--
ALTER TABLE `diafan_news_category_rel`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cat_id` (`cat_id`);

--
-- Индексы таблицы `diafan_news_counter`
--
ALTER TABLE `diafan_news_counter`
  ADD PRIMARY KEY (`id`),
  ADD KEY `element_id` (`element_id`);

--
-- Индексы таблицы `diafan_news_rel`
--
ALTER TABLE `diafan_news_rel`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `diafan_payment`
--
ALTER TABLE `diafan_payment`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `diafan_payment_history`
--
ALTER TABLE `diafan_payment_history`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `diafan_photo`
--
ALTER TABLE `diafan_photo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `site_id` (`site_id`);

--
-- Индексы таблицы `diafan_photo_category`
--
ALTER TABLE `diafan_photo_category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parent_id` (`parent_id`),
  ADD KEY `site_id` (`site_id`);

--
-- Индексы таблицы `diafan_photo_category_parents`
--
ALTER TABLE `diafan_photo_category_parents`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `diafan_photo_category_rel`
--
ALTER TABLE `diafan_photo_category_rel`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cat_id` (`cat_id`);

--
-- Индексы таблицы `diafan_photo_counter`
--
ALTER TABLE `diafan_photo_counter`
  ADD PRIMARY KEY (`id`),
  ADD KEY `element_id` (`element_id`);

--
-- Индексы таблицы `diafan_photo_rel`
--
ALTER TABLE `diafan_photo_rel`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `diafan_postman`
--
ALTER TABLE `diafan_postman`
  ADD PRIMARY KEY (`master_id`,`slave_id`);

--
-- Индексы таблицы `diafan_rating`
--
ALTER TABLE `diafan_rating`
  ADD PRIMARY KEY (`id`),
  ADD KEY `element_id` (`element_id`),
  ADD KEY `module_name` (`module_name`(2));

--
-- Индексы таблицы `diafan_redirect`
--
ALTER TABLE `diafan_redirect`
  ADD PRIMARY KEY (`id`),
  ADD KEY `module_name` (`module_name`(2)),
  ADD KEY `element_id` (`element_id`),
  ADD KEY `element_type` (`element_type`);

--
-- Индексы таблицы `diafan_reviews`
--
ALTER TABLE `diafan_reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `element_id` (`element_id`),
  ADD KEY `module_name` (`module_name`(2));

--
-- Индексы таблицы `diafan_reviews_param`
--
ALTER TABLE `diafan_reviews_param`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `diafan_reviews_param_element`
--
ALTER TABLE `diafan_reviews_param_element`
  ADD PRIMARY KEY (`id`),
  ADD KEY `element_id` (`element_id`),
  ADD KEY `param_id` (`param_id`),
  ADD KEY `value` (`value`(5));

--
-- Индексы таблицы `diafan_reviews_param_select`
--
ALTER TABLE `diafan_reviews_param_select`
  ADD PRIMARY KEY (`id`),
  ADD KEY `param_id` (`param_id`);

--
-- Индексы таблицы `diafan_rewrite`
--
ALTER TABLE `diafan_rewrite`
  ADD PRIMARY KEY (`id`),
  ADD KEY `module_name` (`module_name`(2)),
  ADD KEY `element_id` (`element_id`);

--
-- Индексы таблицы `diafan_search_history`
--
ALTER TABLE `diafan_search_history`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `diafan_search_index`
--
ALTER TABLE `diafan_search_index`
  ADD PRIMARY KEY (`id`),
  ADD KEY `keyword_id` (`keyword_id`);

--
-- Индексы таблицы `diafan_search_keywords`
--
ALTER TABLE `diafan_search_keywords`
  ADD PRIMARY KEY (`id`),
  ADD KEY `keyword` (`keyword`(3));

--
-- Индексы таблицы `diafan_search_results`
--
ALTER TABLE `diafan_search_results`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `diafan_service_express_fields`
--
ALTER TABLE `diafan_service_express_fields`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `diafan_service_express_fields_category`
--
ALTER TABLE `diafan_service_express_fields_category`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `diafan_sessions`
--
ALTER TABLE `diafan_sessions`
  ADD PRIMARY KEY (`session_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Индексы таблицы `diafan_sessions_hash`
--
ALTER TABLE `diafan_sessions_hash`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `diafan_shop`
--
ALTER TABLE `diafan_shop`
  ADD PRIMARY KEY (`id`),
  ADD KEY `site_id` (`site_id`),
  ADD KEY `brand_id` (`brand_id`);

--
-- Индексы таблицы `diafan_shop_additional_cost`
--
ALTER TABLE `diafan_shop_additional_cost`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `diafan_shop_additional_cost_category_rel`
--
ALTER TABLE `diafan_shop_additional_cost_category_rel`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cat_id` (`cat_id`);

--
-- Индексы таблицы `diafan_shop_additional_cost_rel`
--
ALTER TABLE `diafan_shop_additional_cost_rel`
  ADD PRIMARY KEY (`id`),
  ADD KEY `element_id` (`element_id`);

--
-- Индексы таблицы `diafan_shop_brand`
--
ALTER TABLE `diafan_shop_brand`
  ADD PRIMARY KEY (`id`),
  ADD KEY `site_id` (`site_id`);

--
-- Индексы таблицы `diafan_shop_brand_category_rel`
--
ALTER TABLE `diafan_shop_brand_category_rel`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cat_id` (`cat_id`);

--
-- Индексы таблицы `diafan_shop_cart`
--
ALTER TABLE `diafan_shop_cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Индексы таблицы `diafan_shop_cart_goods`
--
ALTER TABLE `diafan_shop_cart_goods`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cart_id` (`cart_id`);

--
-- Индексы таблицы `diafan_shop_cart_log_mail`
--
ALTER TABLE `diafan_shop_cart_log_mail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cart_id` (`cart_id`);

--
-- Индексы таблицы `diafan_shop_cashregister`
--
ALTER TABLE `diafan_shop_cashregister`
  ADD PRIMARY KEY (`master_id`,`slave_id`);

--
-- Индексы таблицы `diafan_shop_category`
--
ALTER TABLE `diafan_shop_category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parent_id` (`parent_id`),
  ADD KEY `site_id` (`site_id`);

--
-- Индексы таблицы `diafan_shop_category_parents`
--
ALTER TABLE `diafan_shop_category_parents`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `diafan_shop_category_rel`
--
ALTER TABLE `diafan_shop_category_rel`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cat_id` (`cat_id`);

--
-- Индексы таблицы `diafan_shop_counter`
--
ALTER TABLE `diafan_shop_counter`
  ADD PRIMARY KEY (`id`),
  ADD KEY `element_id` (`element_id`);

--
-- Индексы таблицы `diafan_shop_currency`
--
ALTER TABLE `diafan_shop_currency`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `diafan_shop_delivery`
--
ALTER TABLE `diafan_shop_delivery`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `diafan_shop_delivery_thresholds`
--
ALTER TABLE `diafan_shop_delivery_thresholds`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `diafan_shop_discount`
--
ALTER TABLE `diafan_shop_discount`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `diafan_shop_discount_coupon`
--
ALTER TABLE `diafan_shop_discount_coupon`
  ADD PRIMARY KEY (`id`),
  ADD KEY `discount_id` (`discount_id`);

--
-- Индексы таблицы `diafan_shop_discount_object`
--
ALTER TABLE `diafan_shop_discount_object`
  ADD PRIMARY KEY (`id`),
  ADD KEY `discount_id` (`discount_id`);

--
-- Индексы таблицы `diafan_shop_discount_person`
--
ALTER TABLE `diafan_shop_discount_person`
  ADD PRIMARY KEY (`id`),
  ADD KEY `discount_id` (`discount_id`);

--
-- Индексы таблицы `diafan_shop_files_codes`
--
ALTER TABLE `diafan_shop_files_codes`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `diafan_shop_import`
--
ALTER TABLE `diafan_shop_import`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `diafan_shop_import_category`
--
ALTER TABLE `diafan_shop_import_category`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `diafan_shop_order`
--
ALTER TABLE `diafan_shop_order`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `diafan_shop_order_additional_cost`
--
ALTER TABLE `diafan_shop_order_additional_cost`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `diafan_shop_order_backend`
--
ALTER TABLE `diafan_shop_order_backend`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `diafan_shop_order_backend_element`
--
ALTER TABLE `diafan_shop_order_backend_element`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `diafan_shop_order_goods`
--
ALTER TABLE `diafan_shop_order_goods`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `diafan_shop_order_goods_param`
--
ALTER TABLE `diafan_shop_order_goods_param`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_goods_id` (`order_goods_id`);

--
-- Индексы таблицы `diafan_shop_order_param`
--
ALTER TABLE `diafan_shop_order_param`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `diafan_shop_order_param_element`
--
ALTER TABLE `diafan_shop_order_param_element`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `diafan_shop_order_param_select`
--
ALTER TABLE `diafan_shop_order_param_select`
  ADD PRIMARY KEY (`id`),
  ADD KEY `param_id` (`param_id`);

--
-- Индексы таблицы `diafan_shop_order_param_user`
--
ALTER TABLE `diafan_shop_order_param_user`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `diafan_shop_order_status`
--
ALTER TABLE `diafan_shop_order_status`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `diafan_shop_param`
--
ALTER TABLE `diafan_shop_param`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `diafan_shop_param_category_rel`
--
ALTER TABLE `diafan_shop_param_category_rel`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cat_id` (`cat_id`);

--
-- Индексы таблицы `diafan_shop_param_element`
--
ALTER TABLE `diafan_shop_param_element`
  ADD PRIMARY KEY (`id`),
  ADD KEY `element_id` (`element_id`),
  ADD KEY `param_id` (`param_id`);

--
-- Индексы таблицы `diafan_shop_param_select`
--
ALTER TABLE `diafan_shop_param_select`
  ADD PRIMARY KEY (`id`),
  ADD KEY `param_id` (`param_id`);

--
-- Индексы таблицы `diafan_shop_price`
--
ALTER TABLE `diafan_shop_price`
  ADD PRIMARY KEY (`id`),
  ADD KEY `good_id` (`good_id`),
  ADD KEY `price_id` (`price_id`);

--
-- Индексы таблицы `diafan_shop_price_image_rel`
--
ALTER TABLE `diafan_shop_price_image_rel`
  ADD PRIMARY KEY (`id`),
  ADD KEY `price_id` (`price_id`);

--
-- Индексы таблицы `diafan_shop_price_param`
--
ALTER TABLE `diafan_shop_price_param`
  ADD PRIMARY KEY (`id`),
  ADD KEY `price_id` (`price_id`),
  ADD KEY `param_id` (`param_id`),
  ADD KEY `param_value` (`param_value`);

--
-- Индексы таблицы `diafan_shop_rel`
--
ALTER TABLE `diafan_shop_rel`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `diafan_shop_waitlist`
--
ALTER TABLE `diafan_shop_waitlist`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `diafan_shop_wishlist`
--
ALTER TABLE `diafan_shop_wishlist`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Индексы таблицы `diafan_site`
--
ALTER TABLE `diafan_site`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parent_id` (`parent_id`);

--
-- Индексы таблицы `diafan_site_blocks`
--
ALTER TABLE `diafan_site_blocks`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `diafan_site_blocks_site_rel`
--
ALTER TABLE `diafan_site_blocks_site_rel`
  ADD PRIMARY KEY (`id`),
  ADD KEY `site_id` (`site_id`);

--
-- Индексы таблицы `diafan_site_dynamic`
--
ALTER TABLE `diafan_site_dynamic`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `diafan_site_dynamic_element`
--
ALTER TABLE `diafan_site_dynamic_element`
  ADD PRIMARY KEY (`id`),
  ADD KEY `dynamic_id` (`dynamic_id`),
  ADD KEY `element_id` (`element_id`),
  ADD KEY `element_type` (`element_type`);

--
-- Индексы таблицы `diafan_site_dynamic_module`
--
ALTER TABLE `diafan_site_dynamic_module`
  ADD PRIMARY KEY (`id`),
  ADD KEY `dynamic_id` (`dynamic_id`);

--
-- Индексы таблицы `diafan_site_parents`
--
ALTER TABLE `diafan_site_parents`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `diafan_subscription`
--
ALTER TABLE `diafan_subscription`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cat_id` (`cat_id`);

--
-- Индексы таблицы `diafan_subscription_category`
--
ALTER TABLE `diafan_subscription_category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parent_id` (`parent_id`);

--
-- Индексы таблицы `diafan_subscription_category_parents`
--
ALTER TABLE `diafan_subscription_category_parents`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `diafan_subscription_category_rel`
--
ALTER TABLE `diafan_subscription_category_rel`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cat_id` (`cat_id`);

--
-- Индексы таблицы `diafan_subscription_emails`
--
ALTER TABLE `diafan_subscription_emails`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `diafan_subscription_emails_cat_unrel`
--
ALTER TABLE `diafan_subscription_emails_cat_unrel`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `diafan_subscription_phones`
--
ALTER TABLE `diafan_subscription_phones`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `diafan_subscription_sms`
--
ALTER TABLE `diafan_subscription_sms`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `diafan_tags`
--
ALTER TABLE `diafan_tags`
  ADD PRIMARY KEY (`id`),
  ADD KEY `element_id` (`element_id`),
  ADD KEY `module_name` (`module_name`(2)),
  ADD KEY `tags_name_id` (`tags_name_id`);

--
-- Индексы таблицы `diafan_tags_name`
--
ALTER TABLE `diafan_tags_name`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `diafan_trash`
--
ALTER TABLE `diafan_trash`
  ADD PRIMARY KEY (`id`),
  ADD KEY `module_name` (`module_name`(2)),
  ADD KEY `parent_id` (`parent_id`),
  ADD KEY `table_name` (`table_name`(2)),
  ADD KEY `element_id` (`element_id`);

--
-- Индексы таблицы `diafan_trash_parents`
--
ALTER TABLE `diafan_trash_parents`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `diafan_update_return`
--
ALTER TABLE `diafan_update_return`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `diafan_users`
--
ALTER TABLE `diafan_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`(1));

--
-- Индексы таблицы `diafan_users_actlink`
--
ALTER TABLE `diafan_users_actlink`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `diafan_users_param`
--
ALTER TABLE `diafan_users_param`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `diafan_users_param_element`
--
ALTER TABLE `diafan_users_param_element`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `diafan_users_param_role_rel`
--
ALTER TABLE `diafan_users_param_role_rel`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `diafan_users_param_select`
--
ALTER TABLE `diafan_users_param_select`
  ADD PRIMARY KEY (`id`),
  ADD KEY `param_id` (`param_id`);

--
-- Индексы таблицы `diafan_users_role`
--
ALTER TABLE `diafan_users_role`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `diafan_users_role_perm`
--
ALTER TABLE `diafan_users_role_perm`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `diafan_users_token`
--
ALTER TABLE `diafan_users_token`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `diafan_visitors_session`
--
ALTER TABLE `diafan_visitors_session`
  ADD PRIMARY KEY (`master_id`,`slave_id`);

--
-- Индексы таблицы `diafan_visitors_stat_traffic`
--
ALTER TABLE `diafan_visitors_stat_traffic`
  ADD PRIMARY KEY (`id`),
  ADD KEY `date` (`date`);

--
-- Индексы таблицы `diafan_visitors_stat_traffic_names_search_bot`
--
ALTER TABLE `diafan_visitors_stat_traffic_names_search_bot`
  ADD PRIMARY KEY (`master_id`,`slave_id`);

--
-- Индексы таблицы `diafan_visitors_stat_traffic_pages`
--
ALTER TABLE `diafan_visitors_stat_traffic_pages`
  ADD PRIMARY KEY (`master_id`,`slave_id`);

--
-- Индексы таблицы `diafan_visitors_stat_traffic_source`
--
ALTER TABLE `diafan_visitors_stat_traffic_source`
  ADD PRIMARY KEY (`master_id`,`slave_id`);

--
-- Индексы таблицы `diafan_visitors_url`
--
ALTER TABLE `diafan_visitors_url`
  ADD PRIMARY KEY (`master_id`,`slave_id`);

--
-- Индексы таблицы `diafan_votes`
--
ALTER TABLE `diafan_votes`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `diafan_votes_answers`
--
ALTER TABLE `diafan_votes_answers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `votes_id` (`votes_id`);

--
-- Индексы таблицы `diafan_votes_site_rel`
--
ALTER TABLE `diafan_votes_site_rel`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `diafan_votes_userversion`
--
ALTER TABLE `diafan_votes_userversion`
  ADD PRIMARY KEY (`id`),
  ADD KEY `votes_id` (`votes_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `diafan_ab`
--
ALTER TABLE `diafan_ab`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'идентификатор';

--
-- AUTO_INCREMENT для таблицы `diafan_ab_category`
--
ALTER TABLE `diafan_ab_category`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'идентификатор';

--
-- AUTO_INCREMENT для таблицы `diafan_ab_category_parents`
--
ALTER TABLE `diafan_ab_category_parents`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'идентификатор';

--
-- AUTO_INCREMENT для таблицы `diafan_ab_category_rel`
--
ALTER TABLE `diafan_ab_category_rel`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'идентификатор';

--
-- AUTO_INCREMENT для таблицы `diafan_ab_counter`
--
ALTER TABLE `diafan_ab_counter`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'идентификатор';

--
-- AUTO_INCREMENT для таблицы `diafan_ab_param`
--
ALTER TABLE `diafan_ab_param`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'идентификатор', AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `diafan_ab_param_category_rel`
--
ALTER TABLE `diafan_ab_param_category_rel`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'идентификатор', AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `diafan_ab_param_element`
--
ALTER TABLE `diafan_ab_param_element`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'идентификатор';

--
-- AUTO_INCREMENT для таблицы `diafan_ab_param_select`
--
ALTER TABLE `diafan_ab_param_select`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'идентификатор';

--
-- AUTO_INCREMENT для таблицы `diafan_ab_rel`
--
ALTER TABLE `diafan_ab_rel`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'идентификатор';

--
-- AUTO_INCREMENT для таблицы `diafan_access`
--
ALTER TABLE `diafan_access`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'идентификатор';

--
-- AUTO_INCREMENT для таблицы `diafan_addons`
--
ALTER TABLE `diafan_addons`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'идентификатор', AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT для таблицы `diafan_admin`
--
ALTER TABLE `diafan_admin`
  MODIFY `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'идентификатор', AUTO_INCREMENT=173;

--
-- AUTO_INCREMENT для таблицы `diafan_admin_parents`
--
ALTER TABLE `diafan_admin_parents`
  MODIFY `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'идентификатор', AUTO_INCREMENT=126;

--
-- AUTO_INCREMENT для таблицы `diafan_attachments`
--
ALTER TABLE `diafan_attachments`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'идентификатор';

--
-- AUTO_INCREMENT для таблицы `diafan_balance`
--
ALTER TABLE `diafan_balance`
  MODIFY `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'идентификатор';

--
-- AUTO_INCREMENT для таблицы `diafan_bs`
--
ALTER TABLE `diafan_bs`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'идентификатор', AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `diafan_bs_category`
--
ALTER TABLE `diafan_bs_category`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'идентификатор', AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `diafan_bs_site_rel`
--
ALTER TABLE `diafan_bs_site_rel`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'идентификатор', AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `diafan_captcha_qa`
--
ALTER TABLE `diafan_captcha_qa`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'идентификатор';

--
-- AUTO_INCREMENT для таблицы `diafan_captcha_qa_answers`
--
ALTER TABLE `diafan_captcha_qa_answers`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'идентификатор';

--
-- AUTO_INCREMENT для таблицы `diafan_clauses`
--
ALTER TABLE `diafan_clauses`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'идентификатор';

--
-- AUTO_INCREMENT для таблицы `diafan_clauses_category`
--
ALTER TABLE `diafan_clauses_category`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'идентификатор';

--
-- AUTO_INCREMENT для таблицы `diafan_clauses_category_parents`
--
ALTER TABLE `diafan_clauses_category_parents`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'идентификатор';

--
-- AUTO_INCREMENT для таблицы `diafan_clauses_category_rel`
--
ALTER TABLE `diafan_clauses_category_rel`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'идентификатор';

--
-- AUTO_INCREMENT для таблицы `diafan_clauses_counter`
--
ALTER TABLE `diafan_clauses_counter`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'идентификатор';

--
-- AUTO_INCREMENT для таблицы `diafan_clauses_rel`
--
ALTER TABLE `diafan_clauses_rel`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'идентификатор';

--
-- AUTO_INCREMENT для таблицы `diafan_comments`
--
ALTER TABLE `diafan_comments`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'идентификатор';

--
-- AUTO_INCREMENT для таблицы `diafan_comments_mail`
--
ALTER TABLE `diafan_comments_mail`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'идентификатор';

--
-- AUTO_INCREMENT для таблицы `diafan_comments_param`
--
ALTER TABLE `diafan_comments_param`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'идентификатор', AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `diafan_comments_param_element`
--
ALTER TABLE `diafan_comments_param_element`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'идентификатор';

--
-- AUTO_INCREMENT для таблицы `diafan_comments_param_select`
--
ALTER TABLE `diafan_comments_param_select`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'идентификатор';

--
-- AUTO_INCREMENT для таблицы `diafan_comments_parents`
--
ALTER TABLE `diafan_comments_parents`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'идентификатор';

--
-- AUTO_INCREMENT для таблицы `diafan_config`
--
ALTER TABLE `diafan_config`
  MODIFY `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'идентификатор', AUTO_INCREMENT=388;

--
-- AUTO_INCREMENT для таблицы `diafan_crontab`
--
ALTER TABLE `diafan_crontab`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'идентификатор';

--
-- AUTO_INCREMENT для таблицы `diafan_custom`
--
ALTER TABLE `diafan_custom`
  MODIFY `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'идентификатор';

--
-- AUTO_INCREMENT для таблицы `diafan_faq`
--
ALTER TABLE `diafan_faq`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'идентификатор';

--
-- AUTO_INCREMENT для таблицы `diafan_faq_category`
--
ALTER TABLE `diafan_faq_category`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'идентификатор';

--
-- AUTO_INCREMENT для таблицы `diafan_faq_category_parents`
--
ALTER TABLE `diafan_faq_category_parents`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'идентификатор';

--
-- AUTO_INCREMENT для таблицы `diafan_faq_category_rel`
--
ALTER TABLE `diafan_faq_category_rel`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'идентификатор';

--
-- AUTO_INCREMENT для таблицы `diafan_faq_counter`
--
ALTER TABLE `diafan_faq_counter`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'идентификатор';

--
-- AUTO_INCREMENT для таблицы `diafan_faq_rel`
--
ALTER TABLE `diafan_faq_rel`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'идентификатор';

--
-- AUTO_INCREMENT для таблицы `diafan_feedback`
--
ALTER TABLE `diafan_feedback`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'идентификатор', AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `diafan_feedback_param`
--
ALTER TABLE `diafan_feedback_param`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'идентификатор', AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `diafan_feedback_param_element`
--
ALTER TABLE `diafan_feedback_param_element`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'идентификатор', AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `diafan_feedback_param_select`
--
ALTER TABLE `diafan_feedback_param_select`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'идентификатор', AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `diafan_files`
--
ALTER TABLE `diafan_files`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'идентификатор';

--
-- AUTO_INCREMENT для таблицы `diafan_files_category`
--
ALTER TABLE `diafan_files_category`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'идентификатор';

--
-- AUTO_INCREMENT для таблицы `diafan_files_category_parents`
--
ALTER TABLE `diafan_files_category_parents`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'идентификатор';

--
-- AUTO_INCREMENT для таблицы `diafan_files_category_rel`
--
ALTER TABLE `diafan_files_category_rel`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'идентификатор';

--
-- AUTO_INCREMENT для таблицы `diafan_files_counter`
--
ALTER TABLE `diafan_files_counter`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'идентификатор';

--
-- AUTO_INCREMENT для таблицы `diafan_files_links`
--
ALTER TABLE `diafan_files_links`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'идентификатор';

--
-- AUTO_INCREMENT для таблицы `diafan_files_rel`
--
ALTER TABLE `diafan_files_rel`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'идентификатор';

--
-- AUTO_INCREMENT для таблицы `diafan_forum`
--
ALTER TABLE `diafan_forum`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'идентификатор';

--
-- AUTO_INCREMENT для таблицы `diafan_forum_blocks`
--
ALTER TABLE `diafan_forum_blocks`
  MODIFY `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'идентификатор', AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `diafan_forum_category`
--
ALTER TABLE `diafan_forum_category`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'идентификатор', AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `diafan_forum_messages`
--
ALTER TABLE `diafan_forum_messages`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'идентификатор';

--
-- AUTO_INCREMENT для таблицы `diafan_forum_messages_parents`
--
ALTER TABLE `diafan_forum_messages_parents`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'идентификатор';

--
-- AUTO_INCREMENT для таблицы `diafan_forum_show`
--
ALTER TABLE `diafan_forum_show`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'идентификатор';

--
-- AUTO_INCREMENT для таблицы `diafan_geomap`
--
ALTER TABLE `diafan_geomap`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'идентификатор';

--
-- AUTO_INCREMENT для таблицы `diafan_images`
--
ALTER TABLE `diafan_images`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'идентификатор', AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT для таблицы `diafan_images_editor_folders`
--
ALTER TABLE `diafan_images_editor_folders`
  MODIFY `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'идентификатор';

--
-- AUTO_INCREMENT для таблицы `diafan_images_variations`
--
ALTER TABLE `diafan_images_variations`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'идентификатор', AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `diafan_inserts`
--
ALTER TABLE `diafan_inserts`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'идентификатор';

--
-- AUTO_INCREMENT для таблицы `diafan_inserts_site_rel`
--
ALTER TABLE `diafan_inserts_site_rel`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'идентификатор';

--
-- AUTO_INCREMENT для таблицы `diafan_keywords`
--
ALTER TABLE `diafan_keywords`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'идентификатор';

--
-- AUTO_INCREMENT для таблицы `diafan_languages`
--
ALTER TABLE `diafan_languages`
  MODIFY `id` tinyint(2) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'идентификатор', AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `diafan_languages_translate`
--
ALTER TABLE `diafan_languages_translate`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'идентификатор';

--
-- AUTO_INCREMENT для таблицы `diafan_log`
--
ALTER TABLE `diafan_log`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'идентификатор';

--
-- AUTO_INCREMENT для таблицы `diafan_log_note`
--
ALTER TABLE `diafan_log_note`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'идентификатор';

--
-- AUTO_INCREMENT для таблицы `diafan_map_index`
--
ALTER TABLE `diafan_map_index`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'идентификатор', AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT для таблицы `diafan_menu`
--
ALTER TABLE `diafan_menu`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'идентификатор', AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT для таблицы `diafan_menu_category`
--
ALTER TABLE `diafan_menu_category`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'идентификатор', AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `diafan_menu_category_site_rel`
--
ALTER TABLE `diafan_menu_category_site_rel`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'идентификатор', AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `diafan_menu_parents`
--
ALTER TABLE `diafan_menu_parents`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'идентификатор', AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT для таблицы `diafan_messages`
--
ALTER TABLE `diafan_messages`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'идентификатор';

--
-- AUTO_INCREMENT для таблицы `diafan_messages_user`
--
ALTER TABLE `diafan_messages_user`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'идентификатор';

--
-- AUTO_INCREMENT для таблицы `diafan_mistakes`
--
ALTER TABLE `diafan_mistakes`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'идентификатор';

--
-- AUTO_INCREMENT для таблицы `diafan_modules`
--
ALTER TABLE `diafan_modules`
  MODIFY `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'идентификатор', AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT для таблицы `diafan_news`
--
ALTER TABLE `diafan_news`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'идентификатор';

--
-- AUTO_INCREMENT для таблицы `diafan_news_category`
--
ALTER TABLE `diafan_news_category`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'идентификатор';

--
-- AUTO_INCREMENT для таблицы `diafan_news_category_parents`
--
ALTER TABLE `diafan_news_category_parents`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'идентификатор';

--
-- AUTO_INCREMENT для таблицы `diafan_news_category_rel`
--
ALTER TABLE `diafan_news_category_rel`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'идентификатор';

--
-- AUTO_INCREMENT для таблицы `diafan_news_counter`
--
ALTER TABLE `diafan_news_counter`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'идентификатор';

--
-- AUTO_INCREMENT для таблицы `diafan_news_rel`
--
ALTER TABLE `diafan_news_rel`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'идентификатор';

--
-- AUTO_INCREMENT для таблицы `diafan_payment`
--
ALTER TABLE `diafan_payment`
  MODIFY `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'идентификатор', AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `diafan_payment_history`
--
ALTER TABLE `diafan_payment_history`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'идентификатор';

--
-- AUTO_INCREMENT для таблицы `diafan_photo`
--
ALTER TABLE `diafan_photo`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'идентификатор';

--
-- AUTO_INCREMENT для таблицы `diafan_photo_category`
--
ALTER TABLE `diafan_photo_category`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'идентификатор';

--
-- AUTO_INCREMENT для таблицы `diafan_photo_category_parents`
--
ALTER TABLE `diafan_photo_category_parents`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'идентификатор';

--
-- AUTO_INCREMENT для таблицы `diafan_photo_category_rel`
--
ALTER TABLE `diafan_photo_category_rel`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'идентификатор';

--
-- AUTO_INCREMENT для таблицы `diafan_photo_counter`
--
ALTER TABLE `diafan_photo_counter`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'идентификатор';

--
-- AUTO_INCREMENT для таблицы `diafan_photo_rel`
--
ALTER TABLE `diafan_photo_rel`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'идентификатор';

--
-- AUTO_INCREMENT для таблицы `diafan_rating`
--
ALTER TABLE `diafan_rating`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'идентификатор';

--
-- AUTO_INCREMENT для таблицы `diafan_redirect`
--
ALTER TABLE `diafan_redirect`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'идентификатор';

--
-- AUTO_INCREMENT для таблицы `diafan_reviews`
--
ALTER TABLE `diafan_reviews`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'идентификатор';

--
-- AUTO_INCREMENT для таблицы `diafan_reviews_param`
--
ALTER TABLE `diafan_reviews_param`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'идентификатор', AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT для таблицы `diafan_reviews_param_element`
--
ALTER TABLE `diafan_reviews_param_element`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'идентификатор';

--
-- AUTO_INCREMENT для таблицы `diafan_reviews_param_select`
--
ALTER TABLE `diafan_reviews_param_select`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'идентификатор', AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `diafan_rewrite`
--
ALTER TABLE `diafan_rewrite`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'идентификатор', AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT для таблицы `diafan_search_history`
--
ALTER TABLE `diafan_search_history`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'идентификатор', AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `diafan_search_index`
--
ALTER TABLE `diafan_search_index`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'идентификатор', AUTO_INCREMENT=268;

--
-- AUTO_INCREMENT для таблицы `diafan_search_keywords`
--
ALTER TABLE `diafan_search_keywords`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'идентификатор', AUTO_INCREMENT=161;

--
-- AUTO_INCREMENT для таблицы `diafan_search_results`
--
ALTER TABLE `diafan_search_results`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'идентификатор', AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT для таблицы `diafan_service_express_fields`
--
ALTER TABLE `diafan_service_express_fields`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'идентификатор';

--
-- AUTO_INCREMENT для таблицы `diafan_service_express_fields_category`
--
ALTER TABLE `diafan_service_express_fields_category`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'идентификатор';

--
-- AUTO_INCREMENT для таблицы `diafan_sessions_hash`
--
ALTER TABLE `diafan_sessions_hash`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'идентификатор', AUTO_INCREMENT=249;

--
-- AUTO_INCREMENT для таблицы `diafan_shop`
--
ALTER TABLE `diafan_shop`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'идентификатор';

--
-- AUTO_INCREMENT для таблицы `diafan_shop_additional_cost`
--
ALTER TABLE `diafan_shop_additional_cost`
  MODIFY `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'идентификатор';

--
-- AUTO_INCREMENT для таблицы `diafan_shop_additional_cost_category_rel`
--
ALTER TABLE `diafan_shop_additional_cost_category_rel`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'идентификатор';

--
-- AUTO_INCREMENT для таблицы `diafan_shop_additional_cost_rel`
--
ALTER TABLE `diafan_shop_additional_cost_rel`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'идентификатор';

--
-- AUTO_INCREMENT для таблицы `diafan_shop_brand`
--
ALTER TABLE `diafan_shop_brand`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'идентификатор', AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `diafan_shop_brand_category_rel`
--
ALTER TABLE `diafan_shop_brand_category_rel`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'идентификатор', AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `diafan_shop_cart`
--
ALTER TABLE `diafan_shop_cart`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'идентификатор';

--
-- AUTO_INCREMENT для таблицы `diafan_shop_cart_goods`
--
ALTER TABLE `diafan_shop_cart_goods`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'идентификатор';

--
-- AUTO_INCREMENT для таблицы `diafan_shop_cart_log_mail`
--
ALTER TABLE `diafan_shop_cart_log_mail`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'идентификатор';

--
-- AUTO_INCREMENT для таблицы `diafan_shop_category`
--
ALTER TABLE `diafan_shop_category`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'идентификатор', AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT для таблицы `diafan_shop_category_parents`
--
ALTER TABLE `diafan_shop_category_parents`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'идентификатор';

--
-- AUTO_INCREMENT для таблицы `diafan_shop_category_rel`
--
ALTER TABLE `diafan_shop_category_rel`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'идентификатор';

--
-- AUTO_INCREMENT для таблицы `diafan_shop_counter`
--
ALTER TABLE `diafan_shop_counter`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'идентификатор';

--
-- AUTO_INCREMENT для таблицы `diafan_shop_currency`
--
ALTER TABLE `diafan_shop_currency`
  MODIFY `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'идентификатор', AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `diafan_shop_delivery`
--
ALTER TABLE `diafan_shop_delivery`
  MODIFY `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'идентификатор', AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `diafan_shop_delivery_thresholds`
--
ALTER TABLE `diafan_shop_delivery_thresholds`
  MODIFY `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'идентификатор', AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `diafan_shop_discount`
--
ALTER TABLE `diafan_shop_discount`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'идентификатор', AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `diafan_shop_discount_coupon`
--
ALTER TABLE `diafan_shop_discount_coupon`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'идентификатор';

--
-- AUTO_INCREMENT для таблицы `diafan_shop_discount_object`
--
ALTER TABLE `diafan_shop_discount_object`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'идентификатор';

--
-- AUTO_INCREMENT для таблицы `diafan_shop_discount_person`
--
ALTER TABLE `diafan_shop_discount_person`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'идентификатор';

--
-- AUTO_INCREMENT для таблицы `diafan_shop_files_codes`
--
ALTER TABLE `diafan_shop_files_codes`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'идентификатор';

--
-- AUTO_INCREMENT для таблицы `diafan_shop_import`
--
ALTER TABLE `diafan_shop_import`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'идентификатор', AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT для таблицы `diafan_shop_import_category`
--
ALTER TABLE `diafan_shop_import_category`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'идентификатор', AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `diafan_shop_order`
--
ALTER TABLE `diafan_shop_order`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'идентификатор';

--
-- AUTO_INCREMENT для таблицы `diafan_shop_order_additional_cost`
--
ALTER TABLE `diafan_shop_order_additional_cost`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'идентификатор';

--
-- AUTO_INCREMENT для таблицы `diafan_shop_order_backend`
--
ALTER TABLE `diafan_shop_order_backend`
  MODIFY `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'идентификатор', AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `diafan_shop_order_backend_element`
--
ALTER TABLE `diafan_shop_order_backend_element`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'идентификатор';

--
-- AUTO_INCREMENT для таблицы `diafan_shop_order_goods`
--
ALTER TABLE `diafan_shop_order_goods`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'идентификатор';

--
-- AUTO_INCREMENT для таблицы `diafan_shop_order_goods_param`
--
ALTER TABLE `diafan_shop_order_goods_param`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'идентификатор';

--
-- AUTO_INCREMENT для таблицы `diafan_shop_order_param`
--
ALTER TABLE `diafan_shop_order_param`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'идентификатор', AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `diafan_shop_order_param_element`
--
ALTER TABLE `diafan_shop_order_param_element`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'идентификатор';

--
-- AUTO_INCREMENT для таблицы `diafan_shop_order_param_select`
--
ALTER TABLE `diafan_shop_order_param_select`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'идентификатор';

--
-- AUTO_INCREMENT для таблицы `diafan_shop_order_param_user`
--
ALTER TABLE `diafan_shop_order_param_user`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'идентификатор';

--
-- AUTO_INCREMENT для таблицы `diafan_shop_order_status`
--
ALTER TABLE `diafan_shop_order_status`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'идентификатор', AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `diafan_shop_param`
--
ALTER TABLE `diafan_shop_param`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'идентификатор', AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `diafan_shop_param_category_rel`
--
ALTER TABLE `diafan_shop_param_category_rel`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'идентификатор', AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `diafan_shop_param_element`
--
ALTER TABLE `diafan_shop_param_element`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'идентификатор';

--
-- AUTO_INCREMENT для таблицы `diafan_shop_param_select`
--
ALTER TABLE `diafan_shop_param_select`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'идентификатор';

--
-- AUTO_INCREMENT для таблицы `diafan_shop_price`
--
ALTER TABLE `diafan_shop_price`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'идентификатор';

--
-- AUTO_INCREMENT для таблицы `diafan_shop_price_image_rel`
--
ALTER TABLE `diafan_shop_price_image_rel`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'идентификатор';

--
-- AUTO_INCREMENT для таблицы `diafan_shop_price_param`
--
ALTER TABLE `diafan_shop_price_param`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'идентификатор';

--
-- AUTO_INCREMENT для таблицы `diafan_shop_rel`
--
ALTER TABLE `diafan_shop_rel`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'идентификатор';

--
-- AUTO_INCREMENT для таблицы `diafan_shop_waitlist`
--
ALTER TABLE `diafan_shop_waitlist`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'идентификатор';

--
-- AUTO_INCREMENT для таблицы `diafan_shop_wishlist`
--
ALTER TABLE `diafan_shop_wishlist`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'идентификатор';

--
-- AUTO_INCREMENT для таблицы `diafan_site`
--
ALTER TABLE `diafan_site`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'идентификатор', AUTO_INCREMENT=177;

--
-- AUTO_INCREMENT для таблицы `diafan_site_blocks`
--
ALTER TABLE `diafan_site_blocks`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'идентификатор', AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `diafan_site_blocks_site_rel`
--
ALTER TABLE `diafan_site_blocks_site_rel`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'идентификатор', AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT для таблицы `diafan_site_dynamic`
--
ALTER TABLE `diafan_site_dynamic`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'идентификатор', AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `diafan_site_dynamic_element`
--
ALTER TABLE `diafan_site_dynamic_element`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'идентификатор';

--
-- AUTO_INCREMENT для таблицы `diafan_site_dynamic_module`
--
ALTER TABLE `diafan_site_dynamic_module`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'идентификатор', AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `diafan_site_parents`
--
ALTER TABLE `diafan_site_parents`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'идентификатор', AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT для таблицы `diafan_subscription`
--
ALTER TABLE `diafan_subscription`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'идентификатор';

--
-- AUTO_INCREMENT для таблицы `diafan_subscription_category`
--
ALTER TABLE `diafan_subscription_category`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'идентификатор';

--
-- AUTO_INCREMENT для таблицы `diafan_subscription_category_parents`
--
ALTER TABLE `diafan_subscription_category_parents`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'идентификатор';

--
-- AUTO_INCREMENT для таблицы `diafan_subscription_category_rel`
--
ALTER TABLE `diafan_subscription_category_rel`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'идентификатор';

--
-- AUTO_INCREMENT для таблицы `diafan_subscription_emails`
--
ALTER TABLE `diafan_subscription_emails`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'идентификатор';

--
-- AUTO_INCREMENT для таблицы `diafan_subscription_emails_cat_unrel`
--
ALTER TABLE `diafan_subscription_emails_cat_unrel`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'идентификатор';

--
-- AUTO_INCREMENT для таблицы `diafan_subscription_phones`
--
ALTER TABLE `diafan_subscription_phones`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'идентификатор', AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `diafan_subscription_sms`
--
ALTER TABLE `diafan_subscription_sms`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'идентификатор';

--
-- AUTO_INCREMENT для таблицы `diafan_tags`
--
ALTER TABLE `diafan_tags`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'идентификатор';

--
-- AUTO_INCREMENT для таблицы `diafan_tags_name`
--
ALTER TABLE `diafan_tags_name`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'идентификатор';

--
-- AUTO_INCREMENT для таблицы `diafan_trash`
--
ALTER TABLE `diafan_trash`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'идентификатор', AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT для таблицы `diafan_trash_parents`
--
ALTER TABLE `diafan_trash_parents`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'идентификатор', AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT для таблицы `diafan_update_return`
--
ALTER TABLE `diafan_update_return`
  MODIFY `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'идентификатор', AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `diafan_users`
--
ALTER TABLE `diafan_users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'идентификатор', AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `diafan_users_actlink`
--
ALTER TABLE `diafan_users_actlink`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'идентификатор';

--
-- AUTO_INCREMENT для таблицы `diafan_users_param`
--
ALTER TABLE `diafan_users_param`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'идентификатор';

--
-- AUTO_INCREMENT для таблицы `diafan_users_param_element`
--
ALTER TABLE `diafan_users_param_element`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'идентификатор';

--
-- AUTO_INCREMENT для таблицы `diafan_users_param_role_rel`
--
ALTER TABLE `diafan_users_param_role_rel`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'идентификатор';

--
-- AUTO_INCREMENT для таблицы `diafan_users_param_select`
--
ALTER TABLE `diafan_users_param_select`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'идентификатор';

--
-- AUTO_INCREMENT для таблицы `diafan_users_role`
--
ALTER TABLE `diafan_users_role`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'идентификатор', AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `diafan_users_role_perm`
--
ALTER TABLE `diafan_users_role_perm`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'идентификатор', AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `diafan_users_token`
--
ALTER TABLE `diafan_users_token`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'идентификатор';

--
-- AUTO_INCREMENT для таблицы `diafan_visitors_stat_traffic`
--
ALTER TABLE `diafan_visitors_stat_traffic`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'идентификатор', AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `diafan_votes`
--
ALTER TABLE `diafan_votes`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'идентификатор';

--
-- AUTO_INCREMENT для таблицы `diafan_votes_answers`
--
ALTER TABLE `diafan_votes_answers`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'идентификатор';

--
-- AUTO_INCREMENT для таблицы `diafan_votes_site_rel`
--
ALTER TABLE `diafan_votes_site_rel`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'идентификатор';

--
-- AUTO_INCREMENT для таблицы `diafan_votes_userversion`
--
ALTER TABLE `diafan_votes_userversion`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'идентификатор';
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
