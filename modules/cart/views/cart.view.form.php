<?php
/**
 * Шаблон формы редактирования корзины товаров, оформления заказа
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
if (empty($result["rows"]))
{
	echo '<p>'.$this->diafan->_('Корзина пуста.').' <a href="'.BASE_PATH_HREF.$result["shop_link"].'">'.$this->diafan->_('Перейти к покупкам.').'</a></p>';
	return;
}

echo '<a name="top"></a>';

/*
echo '<form action="" method="POST" class="ajax">
<input type="hidden" name="module" value="cart">
<input type="hidden" name="action" value="clear">
<input type="submit" value="'.$this->diafan->_('Очистить корзину', false).'">
</form>';
*/

echo '<div class="container"><div class="checkout"><div class="cart_order">';

echo '<form action="" method="POST" class="js_cart_table_form ajax">
<input type="hidden" name="module" value="cart">
<input type="hidden" name="action" value="recalc">
<input type="hidden" name="form_tag" value="'.$result["form_tag"].'">
<input type="hidden" name="delivery_summ" value=""> 
<input type="hidden" name="delivery_info" value="">
<div class="errors error"'.($result["error"] ? '>'.$result["error"] : ' style="display:none">').'</div>';
?>
<div class="cart step-js" id="step1">
	<div class="row">
		<div class="col-md-9">	
			<?
			echo $this->get('table', 'cart', $result); //вывод таблицы с товарами
			?>
		</div>
	</div>
	<div class="ordercontent__number active" data-step="step1"><span>1</span></div>
</div>
<?

echo '<div class="cart_recalc">';
// кнопка пересчитать
echo '<input type="submit" value="'.$this->diafan->_('Пересчитать', false).'">';
echo '</div>';
echo '</form>';

echo '
<form method="POST" action="" class="cart_form ajax" enctype="multipart/form-data">
<input type="hidden" name="module" value="cart">
<input type="hidden" name="action" value="order">
<input type="hidden" name="tmpcode" value="'.md5(mt_rand(0, 9999)).'">
<br><br>';

if(! empty($result["yandex_fast_order"]))
{
	echo '<p><a href="'.$result["yandex_fast_order_link"].'"><img src="http'.(IS_HTTPS ? "s" : '').'://cards2.yandex.net/hlp-get/5814/png/3.png" border="0" /></a></p>';
}

$required = false;

?>
<div class="order">
	<h2>Оформление заказа</h2>
	<a id="order"></a>
			<div class="ordercontent">
				<div class="ordercontent__steps">
					<div class="ordercontent__step step-js" id="step2">
				<div class="ordercontent__wrapper">
					<div class="ordercontent__items">
						<div class="ordercontent__itemscontent">
						
<?
if (! empty($result["rows_param"]))
{
	foreach ($result["rows_param"] as $row)
	{
		if($row["required"])
		{
			$required = true;
		}
		$value = ! empty($result["user"]['p'.$row["id"]]) ? $result["user"]['p'.$row["id"]] : '';
		

		echo '<div class="order_form_param'.$row["id"].'">';

		switch ($row["type"])
		{
			case 'title':
				echo '<div class="infoform">'.$row["name"].':</div>';
				break;

			case 'text':
				echo '<div class="ordercontent__item ordercontent__item_text"><div class="ordercontent__caption">'.$row["name"].($row["required"] ? '<span style="color:red;">*</span>' : '').':</div>
				<div class="ordercontent__inputs ordercontent__inputs_full"><div class="ordercontent__input ordercontent__input_full"><input type="text" name="p'.$row["id"].'" value="'.str_replace('"', '&quot;', $value).'"></div></div></div>';
				break;

			case "email":
				echo '<div class="ordercontent__item ordercontent__item_text"><div class="ordercontent__caption">'.$row["name"].($row["required"] ? '<span style="color:red;">*</span>' : '').':</div>
				<div class="ordercontent__inputs ordercontent__inputs_full"><div class="ordercontent__input ordercontent__input_full"><input type="email" name="p'.$row["id"].'" value="'.str_replace('"', '&quot;', $value).'"></div></div></div>';
				break;

			case "phone":
				echo '<div class="ordercontent__item ordercontent__item_text"><div class="ordercontent__caption">'.$row["name"].($row["required"] ? '<span style="color:red;">*</span>' : '').':</div>
				<div class="ordercontent__inputs ordercontent__inputs_full"><div class="ordercontent__input ordercontent__input_full"><input type="tel" name="p'.$row["id"].'" value="'.$value.'"></div></div></div>';
				break;

			case 'textarea':
				echo '<div class="ordercontent__item ordercontent__item_text"><div class="ordercontent__caption">'.$row["name"].($row["required"] ? '<span style="color:red;">*</span>' : '').':</div>
				<div class="ordercontent__inputs ordercontent__inputs_full"><div class="ordercontent__input ordercontent__input_full"><textarea name="p'.$row["id"].'">'.str_replace(array('<', '>', '"'), array('&lt;', '&gt;', '&quot;'), $value).'</textarea></div></div></div>';
				break;

			case 'date':
			case 'datetime':
				$timecalendar  = true;
				echo '<div class="ordercontent__item ordercontent__item_text"><div class="ordercontent__caption">'.$row["name"].($row["required"] ? '<span style="color:red;">*</span>' : '').':</div>
					<div class="ordercontent__inputs ordercontent__inputs_full"><div class="ordercontent__input ordercontent__input_full"><input type="text" name="p'.$row["id"].'" value="'.$value.'" class="timecalendar" showTime="'
					.($row["type"] == 'datetime'? 'true' : 'false').'"></div></div></div>';
				break;

			case 'numtext':
				echo '<div class="ordercontent__item ordercontent__item_text"><div class="ordercontent__caption">'.$row["name"].($row["required"] ? '<span style="color:red;">*</span>' : '').':</div>
				<div class="ordercontent__inputs ordercontent__inputs_full"><div class="ordercontent__input ordercontent__input_full"><input type="number" name="p'.$row["id"].'" size="5" value="'.$value.'"></div></div></div>';
				break;

			case 'checkbox':
				echo '<div class="ordercontent__item ordercontent__item_radio">
					<div class="ordercontent__caption">
						<div class="ordercontent__inputs">
						<div class="ordercontent__input">
							<input name="p'.$row["id"].'" id="cart_p'.$row["id"].'" value="1" type="checkbox" '.($value ? ' checked' : '').'>
							<label for="cart_p'.$row["id"].'">'.$row["name"].($row["required"] ? '<span style="color:red;">*</span>' : '').'</label>
						</div>
						</div>
					</div>
				</div>';
				break;

			case 'select':
				echo '<div class="ordercontent__item ordercontent__item_text"><div class="ordercontent__caption">'.$row["name"].($row["required"] ? '<span style="color:red;">*</span>' : '').':</div>
				<div class="ordercontent__inputs ordercontent__inputs_full"><div class="ordercontent__input ordercontent__input_full"><select name="p'.$row["id"].'" class="inpselect">
					<option value="">-</option>';
				foreach ($row["select_array"] as $select)
				{
					echo '<option value="'.$select["id"].'"'.($value == $select["id"] ? ' selected' : '').'>'.$select["name"].'</option>';
				}
				echo '</select></div></div></div>';
				break;

			case 'multiple':
				echo '<div class="ordercontent__item ordercontent__item_text">
				<div class="ordercontent__caption">'.$row["name"].($row["required"] ? '<span style="color:red;">*</span>' : '').':</div><div class="ordercontent__inputs ordercontent__inputs_full">';
				foreach ($row["select_array"] as $select)
				{
					echo '<div class="ordercontent__input "><input name="p'.$row["id"].'[]" id="cart_p'.$select["id"].'[]" value="'.$select["id"].'" type="checkbox" '.(is_array($value) && in_array($select["id"], $value) ? ' checked' : '').'><label for="cart_p'.$select["id"].'[]">'.$select["name"].'</label><br></div>';
				}
				echo '</div></div>';
				break;

			case "attachments":
				echo '<div class="ordercontent__item ordercontent__item_text"><div class="ordercontent__caption">'.$row["name"].($row["required"] ? '<span style="color:red;">*</span>' : '').':</div>';
				echo '<div class="inpattachment"><input type="file" name="attachments'.$row["id"].'[]" class="inpfiles" max="'.$row["max_count_attachments"].'"></div>';
				echo '<div class="inpattachment" style="display:none"><input type="file" name="hide_attachments'.$row["id"].'[]" class="inpfiles" max="'.$row["max_count_attachments"].'"></div>';
				if ($row["attachment_extensions"])
				{
					echo '<div class="attachment_extensions">('.$this->diafan->_('Доступные типы файлов').': '.$row["attachment_extensions"].')</div>';
				}
				break;
				echo '</div>';

			case "images":
				echo '<div class="ordercontent__item ordercontent__item_text"><div class="ordercontent__caption">'.$row["name"].($row["required"] ? '<span style="color:red;">*</span>' : '').':</div><div class="images"></div>';
				echo '<div class="ordercontent__inputs ordercontent__inputs_full"><div class="ordercontent__input ordercontent__input_full"><input type="file" name="images'.$row["id"].'" param_id="'.$row["id"].'" class="inpimages"></div></div>';
				break;
		}

		echo '<div class="order_form_param_text">'.$row["text"].'</div>
		</div>
		<div class="errors error_p'.$row["id"].'"'.($result["error_p".$row["id"]] ? '>'.$result["error_p".$row["id"]] : ' style="display:none">').'</div>';
	}
	if(! empty($result["subscribe_in_order"]))
	{
		echo '<input type="checkbox" checked name="subscribe_in_order" id="subscribe_in_order"><label for="subscribe_in_order">'.$this->diafan->_('Подписаться на новости').'</label>';
	}
}?>

	</div>
	<div class="ordercontent__number" data-step="step2"><span>2</span></div>
	</div>
	</div>
	</div>
	</div>
	<div class="ordercontent__step step-js" id="step3">
	<div class="ordercontent__wrapper">
		<div class="ordercontent__items ordercontent__items_type2">
		<div class="ordercontent__itemscontent">
			<div class="ordercontent__item ordercontent__item_col">
				<div class="ordercontent__caption">Доставка</div>
				<div class="ordercontent__inputs ordercontent__inputs_full ordercontent__inputs_col">
					<? /* <div class="ordercontent__input ordercontent__input_full ordercontent__input_type2"><input type="text" placeholder="Начните вводить адрес"></div> */ ?>
					<div class="ordercontent__radiogroup">
			
			<?

//способы доставки
	if (! empty($result["delivery"])) 
	{
		foreach ($result["delivery"] as $row)
		{
			?>
				<div class="ordercontent__input ordercontent__input_type2">
					 <?
					 
					echo '<input name="delivery_id" id="delivery_id_'.$row['id'].'" value="'.$row['id'].'" type="radio" '.($row["selected"] ? ' checked' : '').'>
					<label for="delivery_id_'.$row['id'].'">';
					echo $row["name"].' <i><small>'.$row["text"].'</small></i>';
					if ($row['id']==2) { } else {
						if (is_null($row["price"]))
						{
							echo $this->diafan->_('Недоступно');
						}
						elseif ($row["price"] !== false)
						{
							if ($row["price"]==0) { 
								echo " - <b>бесплатно</b>";
							}
							else {
								echo ' - <b>'.$row["price"].'</b>';
							}
						}
						echo ' </span>';
						if (! is_null($row["price"]) && $row["price"] !== false)
						{
							if ($row["price"]>0) { echo '<span class="price-d__currency"><b>'.$result["currency"].'</b></span>'; }
						}
					}
					echo '</label>';
					 
					 ?>
				</div>
				<div class="ordercontent__number" data-step="step3"><span>3</span></div>
			
			<?
			
			/* echo '
			<div class="grid-d__row">
			<div class="cell-d grid-d__cell grid-d__cell_type_details">
			<div class="details-d grid-d__details grid-d__details_type_delivery">
			<div class="features-d details-d__features">
			<div class="feature-d feature-d_type_name">'.$row["name"].'</div>
			<div class="feature-d feature-d_type_description is-typographic">'.$row["text"].'</div>
			</div>
			</div>
			</div>
			<div class="cell-d grid-d__cell grid-d__cell_type_sum"><strong class="price-d"><span class="price-d__value">';
			if (is_null($row["price"]))
			{
				echo $this->diafan->_('Недоступно');
			}
			elseif ($row["price"] !== false)
			{
				echo $row["price"];
			}
			echo ' </span>';
			if (! is_null($row["price"]) && $row["price"] !== false)
			{
				echo '<span class="price-d__currency">'.$result["currency"].'</span>';
			}
			echo '</strong></div>
			<div class="cell-d grid-d__cell grid-d__cell_type_select">
			<div class="field-d field-d_radio">
			<input name="delivery_id" id="delivery_id_'.$row['id'].'" value="'.$row['id'].'" type="radio" '.($row["selected"] ? ' checked' : '').'><label for="delivery_id_'.$row['id'].'"></label>
			</div>
			</div>
			</div>'; */
			if ($row["service_view"])
			{
				echo '<div class="delivery_service">';
				echo $row["service_view"];
				echo  '</div>';
			}
		}
		
	}
	?>
	</div>
	</div>
	</div>
	</div>
	</div>
	</div>
	</div>
	<?

if(! empty($result["payments"]))
{
	
	echo $this->get('list', 'payment', $result["payments"]);
}

/* echo '<input type="submit" value="'.$this->diafan->_('Продолжить', false).'">';

echo '<div class="privacy_field">'.$this->diafan->_('Отправляя форму, я даю согласие на <a href="%s">обработку персональных данных</a>.', true, BASE_PATH_HREF.'privacy'.ROUTE_END).'</div>';
 */
echo '<div class="errors error"'.($result["error"] ? '>'.$result["error"] : ' style="display:none">').'</div>';

/* if($required)
{
	echo '<div class="required_field"><span style="color:red;">*</span> — '.$this->diafan->_('Поля, обязательные для заполнения').'</div>';
} */
?>

<div class="ordercontent__step">
<div class="ordercontent__wrapper">
	<div class="ordercontent__items ordercontent__items_type2">
		<div class="ordercontent__itemscontent ordercontent__itemscontent_total">
		<div class="ordercontent__item ordercontent__item_col ordercontent__item_total">
			<div class="cartconfirm__total">
				<span class="cartconfirm__text">Итого: </span><span class="cartconfirm__price"><?=$result['summ_goods'];?></span>
			</div>
			<div class="cartconfirm__button cartconfirm__button_order">
				<button type="submit"><span>Оформить заказ</span></button>
			</div>
				</div>
			</div>
		</div>
	</div>
</div>
</div>
	</div>
	</div>
<?
echo '</form>';

if($result["show_auth"])
{
/* 	echo '<div class="cart_autorization">';
	echo $this->diafan->_('Если Вы оформляли заказ на сайте ранее, просто введите логин и пароль:');
	echo '<br>';
	echo $this->get('show_login', 'registration', $result["show_login"]);
	echo '</div>';
 */
	/*echo '<div class="cart_registration">';
	echo $this->diafan->_('Если Вы заполните форму регистрации, то при заказе в следующий раз Вам не придется повторно заполнять Ваши данные:');
	echo $this->get('form', 'registration', $result["registration"]);
	echo '</div>';*/
}
echo '</div></div></div>';
