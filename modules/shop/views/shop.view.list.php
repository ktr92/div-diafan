<?php
/**
 * Шаблон списка товаров
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

if(! empty($result["error"]))
{
	echo '<p>'.$result["error"].'</p>';
	return;
}

if(empty($result["ajax"]))
{
	echo '<div class="js_shop_list shop_list">';
}

?>
<insert name="show_search" module="search" button="найти">

<div class="filter">
	<div class="filter__name">Бренд:</div>
	<form action="">												
		<div class="filter__items">
			<div class="filter__item"><input type="checkbox" id="param1"><label for="param1">Foton</label></div>
			<div class="filter__item"><input type="checkbox" id="param2"><label for="param2">Hino</label></div>
			<div class="filter__item"><input type="checkbox" id="param3"><label for="param3">hyundai</label></div>
			<div class="filter__item"><input type="checkbox" id="param4"><label for="param4">isuzu</label></div>
			<div class="filter__item"><input type="checkbox" id="param5"><label for="param5">kamaz/gaz</label></div>
			<div class="filter__item"><input type="checkbox" id="param6"><label for="param6">maz</label></div>
			<div class="filter__item"><input type="checkbox" id="param7"><label for="param7">scania</label></div>
			<div class="filter__item"><input type="checkbox" id="param8"><label for="param8">Комплект вала / shatf kit</label></div>
			<div class="filter__item"><input type="checkbox" id="param9"><label for="param9">shaanxi</label></div>
			<div class="filter__item"><input type="checkbox" id="param10"><label for="param10">tata</label></div>
			<div class="filter__item"><input type="checkbox" id="param11"><label for="param11">gazel</label></div>
			<div class="filter__item"><input type="checkbox" id="param12"><label for="param12">zf</label></div>
			<div class="filter__item"><input type="checkbox" id="param13"><label for="param13">iveco</label></div>
		</div>
	</form>
</div>
<div class="catalog__nav">	

	
	<?
		//вывод сортировки товаров
		if(! empty($result["link_sort"]))
		{
			echo $this->get('sort_block', 'shop', $result);
		}
	?>
	
	<? //постраничная навигация
	if(! empty($result["paginator"]))
	{
		echo $result["paginator"];
	}	?>
</div>

<?

//вывод описания текущей категории
if(! empty($result["text"]))
{
	echo '<div class="shop_text text">';
	//вывод изображений текущей категории
	/* if(! empty($result["img"]))
	{
		echo '<div class="shop_cat_all_img">';
		foreach($result["img"] as $img)
		{
			switch ($img["type"])
			{
				case 'animation':
					echo '<a href="'.BASE_PATH.$img["link"].'" data-fancybox="gallery'.$result["id"].'shop_cat">';
					break;
				case 'large_image':
					echo '<a href="'.BASE_PATH.$img["link"].'" rel="large_image" width="'.$img["link_width"].'" height="'.$img["link_height"].'">';
					break;
				default:
					echo '<a href="'.BASE_PATH_HREF.$img["link"].'">';
					break;
			}
			echo '<img src="'.$img["src"].'" width="'.$img["width"].'" height="'.$img["height"].'" alt="'.$img["alt"].'" title="'.$img["title"].'">'
			. '</a> ';
		}
		echo '</div>';
	} */
	echo $result['text'].'</div>';
}
else
{
	//вывод изображений текущей категории
	/* if(! empty($result["img"]))
	{
		echo '<div class="shop_cat_all_img">';
		foreach($result["img"] as $img)
		{
			switch ($img["type"])
			{
				case 'animation':
					echo '<a href="'.BASE_PATH.$img["link"].'" data-fancybox="gallery'.$result["id"].'shop_cat">';
					break;
				case 'large_image':
					echo '<a href="'.BASE_PATH.$img["link"].'" rel="large_image" width="'.$img["link_width"].'" height="'.$img["link_height"].'">';
					break;
				default:
					echo '<a href="'.BASE_PATH_HREF.$img["link"].'">';
					break;
			}
			echo '<img src="'.$img["src"].'" width="'.$img["width"].'" height="'.$img["height"].'" alt="'.$img["alt"].'" title="'.$img["title"].'">'
			. '</a> ';
		}
		echo '</div>';
	} */
}

//вывод подкатегории
/* if(! empty($result["children"]))
{
	foreach($result["children"] as $child)
	{
		echo '<div class="shop_cat_link">';

		//вывод изображений подкатегории
		if(! empty($child["img"]))
		{
			echo '<div class="shop_cat_img">';
			foreach($child["img"] as $img)
			{
				switch ($img["type"])
				{
					case 'animation':
						echo '<a href="'.BASE_PATH.$img["link"].'" data-fancybox="gallery'.$child["id"].'shop">';
						break;
					case 'large_image':
						echo '<a href="'.BASE_PATH.$img["link"].'" rel="large_image" width="'.$img["link_width"].'" height="'.$img["link_height"].'">';
						break;
					default:
						echo '<a href="'.BASE_PATH_HREF.$img["link"].'">';
						break;
				}
				echo '<img src="'.$img["src"].'" width="'.$img["width"].'" height="'.$img["height"].'" alt="'.$img["alt"].'" title="'.$img["title"].'">'
				. '</a> ';
			}
			echo '</div>';
		}

		//название и ссылка подкатегории
		echo '<a href="'.BASE_PATH_HREF.$child["link"].'">'.$child["name"].' ('.$child["count"].')</a>';		

		//краткое описание подкатегории
		if($child["anons"])
		{
			echo '<div class="shop_cat_anons">'.$child['anons'].'</div>';
		}
		echo '</div>';

		//вывод списка товаров подкатегории
		if(! empty($child["rows"]))
		{
			$res = $result; unset($res["show_more"]);
			$res["rows"] = $child["rows"];
                        echo '<div class="shop-pane">';
			echo $this->get($result["view_rows"], 'shop', $res);
                        echo '</div>';
		}
	}
}
 */
//вывод списка товаров
	if(! empty($result["rows"]))
	{
	?>
	<div class="catalogitems">
		<div class="row">
			<? echo $this->get($result["view_rows"], 'shop', $result); ?>
		</div>
	</div>
	<? } ?>
	<div class="catalog__navsbottom">
		
		<? //постраничная навигация
			if(! empty($result["paginator"]))
			{
				echo $result["paginator"];
			}	?>
		</div>
	</div>
		<?

/* if (!empty($result["rows"]) && empty($result["hide_compare"]))
{
	echo $this->get('compared_goods_list', 'shop', array("site_id" => $this->diafan->_site->id, "shop_link" => $result['shop_link']));
} */

//вывод ссылок на предыдущую и последующую категории
/* if(! empty($result["previous"]) || ! empty($result["next"]))
{
	echo '<div class="previous_next_links">';
	if(! empty($result["previous"]))
	{
		echo '<div class="previous_link"><a href="'.BASE_PATH_HREF.$result["previous"]["link"].'">&larr; '.$result["previous"]["text"].'</a></div>';
	}
	if(! empty($result["next"]))
	{
		echo '<div class="next_link"><a href="'.BASE_PATH_HREF.$result["next"]["link"].'">'.$result["next"]["text"].' &rarr;</a></div>';
	}
	echo '</div>';
}
 */
//вывод комментариев ко всей категории товаров (комментарии к конкретному товару в функции id())
/* if(! empty($result["comments"]))
{
	echo $result["comments"];
} */

if(empty($result["ajax"]))
{
	echo '</div>';
}