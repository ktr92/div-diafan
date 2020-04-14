<?php
/**
 * Ошибка 404. Страница не найдена
 *
 * Шаблон оформления страниц 404 (Не найдено)
 *
 * @package    DIAFAN.CMS
 * @author     diafan.ru
 * @version    6.0
 * @license    http://www.diafan.ru/license.html
 * @copyright  Copyright (c) 2003-2018 OOO «Диафан» (http://www.diafan.ru/)
 */

if (! defined('DIAFAN'))
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
	<div class="page">
<div class="page-404">
				<div class="container">
					<div class="smallcontent pagenotfound">
							<div class="row">
							<div class="col-md-4">
								<div class="pagenotfound__title">404</div>
								<div class="pagenotfound__text1">
									<p>Упс... К сожалению, этой страницы нет...</p>
								</div>
								<div class="smalltext">
									<p>Зато у нас есть много других интересных:</p>
									<p>
										<ul class="nolist pagenotfound__list">
											<li>— <a href="/">Главная</a></li>
											<li>— <a href="/shop/">Каталог товаров</a></li>
											<li>— <a href="/o-kompanii/">О компании</a></li>
											<li>— <a href="/oplata-i-dostavka/">Оплата и доставка</a></li>
											<li>— <a href="/kontakty/">Контакты</a></li>
										</ul>
									</p>
									<div class="pagenotfound__text2">
										<p>Или попробуйте найти то что искали:</p>
									</div>
									<div class="search">
										<form action="/search/" class="js_search_form search_form ajax" method="post" id="search">
											<div class="search-input">
												<input type="hidden" name="module" value="search">
												<input type="submit" value="">
												<input id="textbox" type="text" name="searchword" placeholder="Поиск по сайту">
											</div>
										</form>
									</div>
								</div>
							</div>
							<div class="col-md-8"></div>
						</div>
					</div>
				</div>		
			</div>
</div>		
</main>

<insert name="show__footer">	



<!-- шаблонный тег show_js подключает JS-файлы. Описан в файле themes/functions/show_js.php. -->
<insert name="show_js">
<script type="text/javascript" asyncsrc="<insert name="custom" path="js/main.js" absolute="true" compress="js">" charset="UTF-8"></script>


</body>
</html>

