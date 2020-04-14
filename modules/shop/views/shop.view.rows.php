<?php
/**
 * Шаблон элементов в списке товаров
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

foreach ($result['rows'] as $row)
{		
?>

	<div class="col-md-4 col-sm-6 col-xs-12">
		<div class="catalogitems__item">
			<div class="catalogitems__content">
				<div class="catalogitems__img">
				
				<?
				
					//вывод изображений товара
					if(! empty($row["img"]))
					{
						
						foreach ($row["img"] as $img)
						{
							switch ($img["type"])
							{
								case 'animation':
									echo '<a href="'.BASE_PATH.$img["link"].'" data-fancybox="gallery'.$row["id"].'shop">';
									break;
								case 'large_image':
									echo '<a href="'.BASE_PATH.$img["link"].'" rel="large_image" width="'.$img["link_width"].'" height="'.$img["link_height"].'">';
									break;
								default:
									echo '<a href="'.BASE_PATH_HREF.$img["link"].'">';
									break;
							}
							echo '<img src="'.$img["src"].'" alt="'.$img["alt"].'" title="'.$img["title"].'" image_id="'.$img["id"].'" class="js_shop_img">';
							
							echo '</a> ';
							if(! empty($result['search']))
							{
								break;
							}
						}
						/* if(empty($result['search']))
						{
							echo '<span class="js_shop_wishlist shop_wishlist shop-like'.(! empty($row["wish"]) ? ' active' : '').'"><i class="fa fa-heart'.(! empty($row["wish"]) ? '' : '-o').'">&nbsp;</i></span>';
						} */

						echo '</div>';
					}
				
				?>
				
				
				</div>
				<div class="catalogitems__name"><? echo '<a href="'.BASE_PATH_HREF.$row["link"].'" class="shop-item-title">'.$row["name"].'</a>'; ?></div>			
				<div class="catalogitems__buy">
						<?
							if(empty($result['search']))
							{
								//вывод кнопки "Купить"
								echo $this->get('buy_form_catalog', 'shop', array("row" => $row, "result" => $result));
								
							}
						?>
					
				</div>
				<? if(!empty($row['hit']) || !empty($row['action']) || !empty($row['new'])) { ?>
				<div class="catalogitems__stickers">
					<div class="catalogitems__sticker catalogitems__sticker_sale">
						<? 
							
								if(! empty($row['hit']))
								{
									echo 'Хит';
								}
								if(! empty($row['action']))
								{
									echo 'Акция';
								}
								if(! empty($row['new']))
								{
									echo 'Новинка';					
								}
							
						?>
					</div>
				</div>
				<? } ?>
			</div>
		</div>
	

<? } ?>
<?

//Кнопка "Показать ещё"
if(! empty($result["show_more"]))
{
	
	echo $result["show_more"];
}
