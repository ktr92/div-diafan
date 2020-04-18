<?php
/**
 * Шаблон таблицы с товарами в корзине
 * 
 * @package    DIAFAN.CMS
 * @author     diafan.ru
 * @version    6.0
 * @license    http://www.diafan.ru/license.html
 * @copyright  Copyright (c) 2003-2019 OOO «Диафан» (http://www.diafan.ru/)
 */

if (! defined('DIAFAN')) {
	$path = __FILE__;
	while(! file_exists($path.'/includes/404.php'))
	{
		$parent = dirname($path);
		if($parent == $path) exit;
		$path = $parent;
	}
	include $path.'/includes/404.php';
}



//шапка таблицы
?>

<div class="cart__table">
	<table>
		<thead>
			<tr>
				<th>Товар</th>
				<th></th>
				<th>Цена за шт.</th>
				<th>Количество</th>
				<th>Итог</th>
				<th></th>
			</tr>
		</thead>
		<tbody>
		
<?//товары
if(! empty($result["rows"]))
{
	foreach ($result["rows"] as $row)
	{
		?>
		
		<tr class="js_cart_item">
			<td class="cart__img">
				<span class="cartimg"><img src="<?=$row["img"]["src"]?>" alt=""></span>
			</td>
			<td class="cart__name"><a href="<?=BASE_PATH_HREF.$row["link"]?>"><span><?=$row["good_name"]?></span></a></td>
			<td class="cart__price">
				<? if ($row["old_price"]) { ?><span class="cart__priceold"><?=$row["old_price"].' '.$result["currency"]; ?></span><? } ?>
				<span class="cart__pricenew"><?=$row["price"].' '.$result["currency"]; ?></span>
				<? /* if($result["discount"])
						{
							echo '<div class="cell-d grid-d__cell grid-d__cell_type_price-old" title="'.$this->diafan->_('Цена со скидкой', false).'">';
							if($row["old_price"])
							{
								echo '<strong class="price-d"><span class="price-d__value">'.$row["price"].'</span><span class="price-d__currency"> '.$result["currency"].'</span></strong>';
							}
							echo ' </div>
							
							<div class="cell-d grid-d__cell grid-d__cell_type_discount" title="'.$this->diafan->_('Скидка', false).'"><strong class="price-d"><span class="price-d__value">';
							if($row["percent"])
							{
								echo $row["percent"].'%';
							}
							else
							{
								echo $row["discount_summ"];
							}
							echo ' </span>';
							if(! $row["percent"])
							{
								echo '<span class="price-d__currency">'.$result["currency"].'</span>';
							}
							echo '</strong></div>';
						}  */?>

			</td>
			<td class="cart__count">
				<div class="cartcount" title="Количество">
					<div class="amount-d grid-d__amount grid-d__amount_type_product js_cart_count cartcount__content">
						<? echo'			
							<button class="amount-d__decrement fa fa-minus js_cart_count_minus cartcount__minus'.($row["count"] <= 1 ? ' disabled' : '').'" type="button"></button>
							<input name="editshop'.$row["id"].'" class="amount-d__input cartcount__input" type="number" value="'.$row["count"].'" data-min="1" data-max="'.$row["price_count"].'">
							<button class="amount-d__increment fa fa-plus js_cart_count_plus cartcount__plus'.($row["price_count"] <= $row["count"] ? ' disabled' : '').'" type="button"></button>
							';
						?>
						
					</div>
				</div>
			</td>
			<td class="cart__total">
				<? /* <span class="cart__priceold">70 000 р</span> */ ?>
				<span class="cart__pricenew"><?=$row["summ"].' '.$result["currency"];?></span>
			</td>
			<td class="cart__remove">
				<div title="Убрать">
				<? echo '<input class="remover-d__input" type="checkbox" id="r'.$row["id"].'" name="del'.$row["id"].'" value="1"><label class="icon-d remover-d__icon fa fa-times-circle js_cart_remove" data-confirm="'.$this->diafan->_('Вы действительно хотите удалить товар из корзины?', false).'" for="r'.$row["id"].'"></label>'; ?>
				</div>
			</td>
		</tr>
	<? } ?>

	</tbody>
	</table>
	</div>
	
	<div class="cartconfirm">
		<div class="cartconfirm__items">
			<div class="cartconfirm__button">
				<a href="#order"><span>Оформить заказ</span></a>
			</div>
			<div class="cartconfirm__total">
				<span class="cartconfirm__text">Итого: </span><span class="cartconfirm__price"><?=$result["summ"].$result["currency"]?></span>
			</div>
			<div class="cartconfirm__remove">
				<div class="cart__remove">
						<div title="Убрать">
						<input class="remover-d__input" type="checkbox" id="" name="" value="1">
						<label class="icon-d remover-d__icon js_cart_remove" data-confirm="Вы действительно хотите удалить товар из корзины?" for="r1"></label>
						</div>
					</div>
			</div>
		</div>
	</div>
	
<? } 
	

	//дополнительно
	/* if (! empty($result["additional_cost"])) 
	{
		echo '<section class="grid-d invoice-d__grid invoice-d__grid_section_additions">
		<div class="grid-d__rows grid-d__rows_type_head">
		<div class="grid-d__row">
		<div class="cell-d grid-d__cell grid-d__cell_type_heading">
		<div class="cell-d__value">'.$this->diafan->_('Дополнительно').'</div>
		</div>
		</div>
		</div>
		<div class="grid-d__rows">';
		foreach ($result["additional_cost"] as $row)
		{
			echo '
			<div class="grid-d__row">
			<div class="cell-d grid-d__cell grid-d__cell_type_details">
			<div class="details-d grid-d__details grid-d__details_type_addition">
			<div class="features-d details-d__features">
			<div class="feature-d feature-d_type_name">'.$row["name"].'</div>
			<div class="feature-d feature-d_type_description is-typographic">'.$row['text'];
			if ($row['amount'])
			{
				echo '<br>'.$this->diafan->_('Бесплатно от суммы').' '.$row['amount'].' '.$result["currency"];
			}
			if($row['percent'])
			{
				echo '<br>'.$this->diafan->_('Стоимость').' '.$row['percent'].'%';
			}
			echo '</div>
			</div>
			</div>
			</div>
			<div class="cell-d grid-d__cell grid-d__cell_type_sum"><strong class="price-d"><span class="price-d__value">'.$row["summ"].' </span><span class="price-d__currency">'.$result["currency"].'</span></strong></div>
			<div class="cell-d grid-d__cell grid-d__cell_type_add">
			<div class="field-d field-d_checkbox">
			<input name="additional_cost_ids[]" value="'.$row['id'].'" type="checkbox" id="additional_cost_'.$row['id'].'"'.($row["checked"] ? ' checked' : '').'>
			<label for="additional_cost_'.$row['id'].'"></label>
			</div>
			</div>
			</div>';
		}
		echo '</div></section>';
	}
 */
	



//итоговая строка таблицы
/* echo '<section class="grid-d invoice-d__grid invoice-d__grid_section_total">
<div class="grid-d__rows">
<div class="grid-d__row">
<div class="cell-d grid-d__cell grid-d__cell_type_details">
<div class="cell-d__value">'.$this->diafan->_('Итого').':</div>
</div>
<div class="cell-d grid-d__cell grid-d__cell_type_sum"><strong class="price-d"><span class="price-d__value">'.$result["summ"].' </span><span class="price-d__currency">'.$result["currency"].'</span></strong>';

if(! empty($result["tax"]))
{
	echo $this->diafan->_('в т. ч. %s', true, $result["tax_name"]).' '.$result["tax"].' '.$result["currency"];
}
echo '</div>
<div class="cell-d grid-d__cell grid-d__cell_type_select"></div>
</div>
</div>
</section>

</div>' */;
