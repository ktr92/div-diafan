<?php
/**
 * Шаблон стартовой страницы сайта
 *
 * @package    DIAFAN.CMS
 * @author     diafan.ru
 * @version    6.0
 * @license    http://www.diafan.ru/license.html
 * @copyright  Copyright (c) 2003-2018 OOO «Диафан» (http://www.diafan.ru/)
 */

if(! defined("DIAFAN"))
{
	$path = __FILE__;
	while(! file_exists($path.'/includes/404.php'))
	{
		$parent = dirname($path);
		if($parent == $path) exit;
		$path = $parent;
	}
	include $path.'/includes/404.php';
}
?><!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<!-- шаблонный тег show_head выводит часть HTML-шапки сайта. Описан в файле themes/functions/show_head.php. -->
<insert name="show_head">

<link rel="shortcut icon" href="<insert name="path">favicon.ico" type="image/x-icon">
<!-- шаблонный тег show_css подключает CSS-файлы. Описан в файле themes/functions/show_css.php. -->
<insert name="show_css" files="default.css, bootstrap.min.css, bootstrap-theme.min.css, font-awesome.min.css, slick.css, slick-theme.css, main.css">

</head>

<body>
<insert name="show__header">

<main>
<!-- шаблонный тег вывода баннеров. Блок выводит баннеры слайдера. Вид блока редактируется в файле modules/bs/views/bs.view.show_block_slider.php-->
<insert name="show_block" module="bs" count="5" cat_id="1" template="slider">
<div class="categoriesblock">
	<div class="container">
		<div id="line1"><img src="/images/line.png"></div>
		<div id="line2"><img src="/images/line.png"></div>
		<div id="line3"><img src="/images/line.png"></div>
		<insert name="show_category" module="shop" template="index" images="1" count_level="1" count="8">
	</div>
</div>	



<!-- шаблонный тег вывода основного контента сайта -->
<insert name="show_body">
</main>

<insert name="show__footer">	



<!-- шаблонный тег show_js подключает JS-файлы. Описан в файле themes/functions/show_js.php. -->
<insert name="show_js">
<script type="text/javascript" asyncsrc="<insert name="custom" path="js/main.js" absolute="true" compress="js">" charset="UTF-8"></script>


</body>
</html>
