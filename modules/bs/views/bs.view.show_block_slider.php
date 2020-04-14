<?php
/**
 * Шаблон блока баннеров
 * 
 * Шаблонный тег <insert name="show_block" module="bs" [count="all|количество"]
 * [cat_id="категория"] [id="номер_баннера"] [template="шаблон"]>:
 * блок баннеров
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

if (empty($result))
{
	return false;
}               

if(! isset($GLOBALS['include_bs_js']))
{
	$GLOBALS['include_bs_js'] = true;
	//скрытая форма для отправки статистики по кликам
	echo '<form method="POST" enctype="multipart/form-data" action="" class="ajax js_bs_form bs_form">
	<input type="hidden" name="module" value="bs">
	<input type="hidden" name="action" value="click">
	<input type="hidden" name="banner_id" value="0">
	</form>';
}

?>

<div class="mainslider">
	<div class="mainslider__container">
		<div class="mainslider__slider">
		<? foreach ($result as $i => $row) {
			if (! empty($row['html']) || ! empty($row['image']) || ! empty($row['swf'])) { ?>
			<div class="mainslider__slide" <? echo('style="background-image:url('.(! empty($row['image']) ? BASE_PATH.USERFILES.'/bs/'.$row['image'] : '').')"'); ?>>
				<? if (! empty($row['link'])) {
					echo '<a href="'.$row['link'].'" class="js_bs_counter bs_counter button" rel="'.$row['id'].'" '.(! empty($row['target_blank']) ? 'target="_blank"' : '').'>'.$this->diafan->_("Заказать").'</a>';
				} ?>
				<div class="mainslider__wrapper">
					<div class="container">
						<div class="mainslider__content">
							<div class="mainslider__title"><? echo $row['name']; ?></div>
							
							<? if (! empty($row['text'])) {
								echo $row['text'];
								echo '<br>';
							} ?>
						</div>
					</div>
				</div>
			</div>
			<? } ?>	
		<? } ?>	
		</div>
		<div class="mainslider__controls">
			<div class="container">
				<div class="mainslider__arrows">
					<div class="mainslider__arrowleft"></div>
					<div class="mainslider__dots"></div>
					<div class="mainslider__arrowright"></div>
				</div>							
			</div>
		</div>
		
	</div>
</div>
