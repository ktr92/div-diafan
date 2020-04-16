<?php
/**
 * Шаблон страницы товара
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

<? /*
<pre><? print_r($result); ?></pre>
*/ ?>

<div class="catalog catalog_product">
						<div class="product">
							<h1><?=$result["name"];?></h1>
							<div class="product__content">
								<div class="product__info">
									<div class="row">
										<div class="col-md-6 col-sm-6 col-xs-12">
											<div class="productimg">
												<div class="productimg_container">
													<? if($result["preview_images"]) { ?>
													<div class="productimg__previewscontainer">
														<div class="productimg__previews">
														
													<?	
														foreach($result["img"] as $img)
														{
															echo ' <div class="productimg__preview"><div class="productimg__prev"><img src="'.$img["vs"]["large"].'"  class="img_block"></div></div>';
														}
													 ?>
													
													
																													
														</div>	
														<div class="productimg__previewsarrows">
															<div class="productimg__previewleft"><img src="/images/previews-up.png"></div>
															<div class="productimg__previewright"><img src="/images/previews-down.png"></div>
														</div>
													<? } ?>
													</div>		
														<div class="productimg__image">
															<div class="productimg__img productimg__img_desktop visible-lg visible-md visible-sm hidden-xs">																
																<a href="<?=BASE_PATH.$img["link"]?>" data-lightbox="product"><img src="<?=BASE_PATH.$img["link"]?>" alt="" class="img_block"></a>
															</div>
															<div class="productimg__img productimg__img_mobile hidden-lg hidden-md hidden-sm visible-xs">
																<a href="<?=BASE_PATH.$img["link"]?>" data-lightbox="product"><img src="<?=BASE_PATH.$img["link"]?>" alt="" class="img_block"></a>
															</div>		</div>													
												</div>												
											</div>										
										</div>	
										<div class="col-md-6 col-sm-6 col-xs-12">
											<div class="product__data">
											
												<? 	echo $this->get('buy_form_id', 'shop', array("row" => $result, "result" => $result)); ?>
											
												
												<div class="product__sale"><a href="#modalSale" data-toggle="modal">Получить специальную цену</a></div>
												
											<?	//характеристики товара
												if(! empty($result["param"]))
												{
													echo $this->get('param_params1', 'shop', array("rows" => $result["param"], "id" => $result["id"]));
												}
											?>	
											<?	//характеристики товара
												if(! empty($result["param"]))
												{
													echo $this->get('param_params2', 'shop', array("rows" => $result["param"], "id" => $result["id"]));
												}
											?>		
												
												
												
												
											</div>
										</div>
									</div>
								</div>
								
								<div class="product__description">
								<div class="container">	
									<div class="row">
										<div class="col-md-6">
											<div class="attributes attributes_right">
												
													<?	//характеристики товара
													if(! empty($result["param"]))
													{
														echo $this->get('param_params3', 'shop', array("rows" => $result["param"], "id" => $result["id"]));
													}
												?>		
												
											</div>
										</div>
										<div class="col-md-6">
											<div class="attributes">
												<?	//характеристики товара
													if(! empty($result["param"]))
													{
														echo $this->get('param_params4', 'shop', array("rows" => $result["param"], "id" => $result["id"]));
													}
												?>		
												
											</div>
										</div>
									</div>
									
									<div class="attributes attributes_large">
												<div class="attributes__title">Технические параметры</div>
												<div class="attributes__scroll wrapper1">
													<div class="attributes__scrolldiv">
													</div>
												</div>
												<div class="attributes__table wrapper2">
													<?	//характеристики товара
													if(! empty($result["param"]))
													{
														echo $this->get('param_params5', 'shop', array("rows" => $result["param"], "id" => $result["id"]));
													}
												?>		
												</div>
											</div>
								</div>
								
								<? //анонс
										echo '<div class="shop_text" style="padding: 30px;">'.$this->htmleditor($result['anons']).'</div>'; ?>
								
								<? //полное описание товара
										echo '<div class="shop_text" style="padding: 30px;">'.$this->htmleditor($result['text']).'</div>'; ?>
										
										
								
								</div>
							</div>	
							
							<div class="related">
								<? echo $this->htmleditor('<insert name="show_block_rel" module="shop" count="10" images="1">'); ?>
							</div>
							
					
						</div>
					</div>
					


<?

		//вывод производителя
		/* if (! empty($result["brand"]))
		{
			echo '<div class="shop_brand">';
			echo $this->diafan->_('Производитель').': ';
			echo '<a href="'.BASE_PATH_HREF.$result["brand"]["link"].'">'.$result["brand"]["name"].'</a>';
			if (! empty($result["brand"]["img"]))
			{
				echo ' ';
				foreach ($result["brand"]["img"] as $img)
				{
					switch ($img["type"])
					{
						case 'animation':
							echo '<a href="'.BASE_PATH.$img["link"].'" data-fancybox="gallery'.$result["id"].'shop_brand">';
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
			}
			echo '</div>';
		} */

		/* //вывод рейтинга товара
		if(! empty($result["rating"]))
		{
			echo '<div class="shop-item-rate rate">'.$this->diafan->_('Рейтинг').": ";
			echo $result["rating"];
			echo '</div>';
		}

		//скидка на товар
		if(! empty($result["discount"]))
		{
			echo '<div class="shop_discount">'.$this->diafan->_('Скидка').': <span class="shop_discount_value">'.$result["discount"].' '.$result["discount_currency"].($result["discount_finish"] ? ' ('.$this->diafan->_('до').' '.$result["discount_finish"].')' : '').'</span></div>';
		}

		//кнопка "Купить"
		echo $this->get('buy_form', 'shop', array("row" => $result, "result" => $result));

		if(empty($result["hide_compare"]))
		{
		    echo $this->get('compare_form', 'shop', $result);
		    //echo $this->get('compared_goods_list', 'shop', array("site_id" => $result["site_id"], "shop_link" => $result['shop_link']));
		}

		if(! empty($result["weight"]))
		{
			echo '<div class="shop_weight">'.$this->diafan->_('Вес').': '.$result["weight"].'</div>';
		}
		if(! empty($result["length"]))
		{
			echo '<div class="length">'.$this->diafan->_('Длина').': '.$result["length"].'</div>';
		}
		if(! empty($result["width"]))
		{
			echo '<div class="shop_width">'.$this->diafan->_('Ширина').': '.$result["width"].'</div>';
		}
		if(! empty($result["height"]))
		{
			echo '<div class="shop_height">'.$this->diafan->_('Высота').': '.$result["height"].'</div>';
		}
        echo $this->htmleditor('<insert name="show_social_links">');

	echo '</div>';

	echo '<div class="shop-item-info2">
		<div class="shop-item-info2">
			<div class="block">
				<h4><i class="fa fa-truck"></i>'.$this->diafan->_('Условия доставки').'</h4>
				'.$this->htmleditor('<insert name="show_block" module="site" id="3" defer="emergence">').'
				</div>
			<div class="block">
				<h4><i class="fa fa-refresh"></i>'.$this->diafan->_('Условия возврата').'</h4>
				'.$this->htmleditor('<insert name="show_block" module="site" id="4" defer="emergence">').'
			</div>
		</div>
	</div>';

  	echo $this->htmleditor('<insert name="show_block_order_rel" module="shop" count="2" images="1" defer="emergence" defer_title="C этим товаром покупают">');

echo '</div>';

//счетчик просмотров
if(! empty($result["counter"]))
{
	echo '<div class="shop_counter">'.$this->diafan->_('Просмотров').': '.$result["counter"].'</div>';
}

//теги товара
if(! empty($result["tags"]))
{
	echo $result["tags"];
}

//полное описание товара
echo '<div class="shop_text">'.$this->htmleditor($result['text']).'</div>';

//характеристики товара
if(! empty($result["param"]))
{
	echo $this->get('param', 'shop', array("rows" => $result["param"], "id" => $result["id"]));
}

//комментарии к товару
if (!empty($result["comments"]))
{
	echo $result["comments"];
}

echo '</div>';

//ссылки на предыдущий и последующий товар
if(! empty($result["previous"]) || ! empty($result["next"]))
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
}*/
