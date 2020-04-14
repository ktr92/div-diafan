<?php
/**
 * Шаблон блока категорий
 *
 * Шаблонный тег <insert name="show_category" module="shop"
 * [site_id="страница_с_прикрепленным_модулем"]
 * [images="количество_изображений"] [images_variation="тег_размера_изображений"]
 * [count_level="количество_уровней"] [number_elements="выводить_количество_товаров_в_категории:true|false"]
 * [only_module="true|false"]
 * [template="шаблон"]>:
 * блок категорий
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

if (empty($result["rows"][0]))
{
	return false;
} ?>
<div class="categoriesblock__items">
	<div class="row">
							

<? //вывод категорий
$i=0;
foreach ($result["rows"][0] as $row) { ?>

	<? if ($i%3==0) { ?><div class="clearfix"></div><? } ?>
	<div class="col-md-3 col-sm-4 col-xs-12">
		<div class="categoriesblock__item">
			<a href="<?=BASE_PATH_HREF.$row["link"]?>">
				<div class="categoriesblock__name"><?=$row["name"]?></div>
				<div class="categoriesblock__link"><span>Открыть каталог</span></div>
				<div class="categoriesblock__img">
				<? 				//изображения категорий
				if (! empty($row["img"]))
				{
					echo '<div class="shop_category_img">';
					foreach ($row["img"] as $img)
					{
						switch ($img["type"])
						{
							case 'animation':
								echo '<a href="'.BASE_PATH.$img["link"].'" data-fancybox="gallery'.$row["id"].'shop_category">';
								break;

							case 'large_image':
								echo '<a href="'.BASE_PATH.$img["link"].'" rel="large_image" width="'.$img["link_width"].'" height="'.$img["link_height"].'">';
								break;

							default:
								echo '<a href="'.BASE_PATH_HREF.$img["link"].'">';
								break;
						}
						echo '<img src="'.$img["src"].'" width="'.$img["width"].'" height="'.$img["height"].'" alt="'.$img["alt"].'" title="'.$img["title"].'">';		
						echo '</a> ';
					}
					echo '</div>';
				} ?>
				
				</div>
			</a>
		</div>
	</div>
<? $i++; } ?>
	<div class="col-md-3 col-sm-4 col-xs-12">
	<div class="categoriesblock__item categoriesblock__item_all">
	<a href="/shop/">
	<div class="categoriesblock__name">Смотреть все категории товаров</div>

	<div class="categoriesblock__img"></div>
	<div class="categoriesblock__link"><span>Открыть каталог</span></div>
	</a>
	</div>
	</div>
			</div>
	</div>			
	
	