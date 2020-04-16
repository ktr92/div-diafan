<?php
/**
 * Шаблон блока похожих товаров
 *
 * Шаблонный тег <insert name="show_block_rel" module="shop" [count="количество"]
 * [images="количество_изображений"] [images_variation="тег_размера_изображений"]
 * [template="шаблон"]>:
 * блок похожих товаров
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

if(empty($result['rows'])) return false;

	echo '<h2>'.$this->diafan->_('Вам также может подойти').'</h2>
	<div class="catalogitems related__slidercontainer">
		<div class="row related__slider">';
		$result["view_rows"] = 'rows_rel';
        echo $this->get($result["view_rows"],'shop',$result);
	echo '</div>
	
	<div class="related__arrow">
		<div class="related__left"><img src="/images/related-left.png" alt=""></div>
		<div class="related__right"><img src="/images/related-right.png" alt=""></div>
	</div>
	</div>';
