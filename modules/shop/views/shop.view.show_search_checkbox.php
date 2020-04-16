<?php
/**
 * Шаблон форма поиска по товарам
 *
 * Шаблонный тег <insert name="show_search" module="shop"
 * [cat_id="категория"] [site_id="страница_с_прикрепленным_модулем"]
 * [ajax="подгружать_результаты"]
 * [only_module="only_on_module_page"] [template="шаблон"]>:
 * форма поиска по товарам
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

?>


<?

echo '<div class="block shop-search">
<div class="filter">';
if (! empty($result["brands"])) {
	echo '<div class="filter__name">'.$this->diafan->_('Бренд').':</div>';
}

echo '<form method="GET" action="'.BASE_PATH_HREF.$result["path"].'" class="js_shop_search_form'.(! empty($result["send_ajax"]) ? ' ajax' : '').'">';
echo '<input type="hidden" name="module" value="shop">
<input type="hidden" name="action" value="search">';

if (! empty($result["brands"]))
{
	
	foreach ($result["brands"] as $row)
	{
		echo '<div class="filter__item" site_id="'.$row["site_id"].'">
		<input type="checkbox" name="brand[]" value="'.$row["id"].'"';
		if(in_array($row["id"], $result["brand"]))
		{
			echo ' checked';
		}
		echo ' id="shop_search_brand'.$row["id"].'"> <label for="shop_search_brand'.$row["id"].'">'.$row["name"].'</label></div>';
	}

}


if(! empty($result["rows"]))
{
	foreach ($result["rows"] as $row)
	{
		if(! in_array($row["type"], array('title', 'date', 'datetime', 'numtext', 'checkbox', 'select', 'multiple')))
			continue;

		echo '<div class="js_shop_search_param shop_search_param shop_search_param'.$row["id"].'" cat_ids="'.$row["cat_ids"].'">';
		switch ($row["type"])
		{
			case 'title':
				echo '<span class="input-title">'.$row["name"].':</span>';
				break;

			case 'date':
				echo '
				<span class="input-title">'.$row["name"].':</span>
				<div>
					<input type="text" name="p'.$row["id"].'_1" value="'.$row["value1"].'" class="from timecalendar" showTime="false">
					&nbsp;-&nbsp;
					<input type="text" name="p'.$row["id"].'_2" value="'.$row["value2"].'" class="to timecalendar" showTime="false">
				</div>';
				break;

			case 'datetime':
				echo '
				<span class="input-title">'.$row["name"].':</span>
				<div>
					<input type="text" name="p'.$row["id"].'_1" value="'.$row["value1"].'" class="from timecalendar" showTime="true">
					&nbsp;-&nbsp;
					<input type="text" name="p'.$row["id"].'_2" value="'.$row["value2"].'" class="to timecalendar" showTime="true">
				</div>';
				break;

			case 'numtext':
				echo '
				<span class="input-title">'.$row["name"].':</span>
				<div>
					<input type="text" class="from" name="p'.$row["id"].'_1" value="'. $row["value1"].'">
					&nbsp;-&nbsp;
					<input type="text" class="to"  name="p'.$row["id"].'_2" value="'.$row["value2"].'">
				</div>';
				break;

			case 'checkbox':
				echo '
				<input type="checkbox" id="shop_search_p'.$row["id"].'" name="p'.$row["id"].'" value="1"'.($row["value"] ? " checked" : '').'>
				<label for="shop_search_p'.$row["id"].'">'.$row["name"].'</label>
				<br>';
				break;

			case 'select':
			case 'multiple':
				echo '
				<span class="input-title">'.$row["name"].':</span>';
				foreach ($row["select_array"] as $key => $value)
				{
					echo '<input type="checkbox" id="shop_search_p'.$row["id"].'_'.$key.'" name="p'.$row["id"].'[]" value="'.$key.'"'.(in_array($key, $row["value"]) ? " checked" : '').'>
					<label for="shop_search_p'.$row["id"].'_'.$key.'">'.$value.'</label>
					<br>';
				}
		}
		echo '
		</div>';
	}
}
echo '
	
	</form>
</div></div>';
