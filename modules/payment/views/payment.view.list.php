<?php
/**
 * Шаблон списка платежных система при оплате
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

if(empty($result))
{
	return;
}?>

<div class="ordercontent__step step-js" id="step4">
<div class="ordercontent__wrapper">
	<div class="ordercontent__items ordercontent__items_type2">
		<div class="ordercontent__itemscontent">
		<div class="ordercontent__item ordercontent__item_col">
			<div class="ordercontent__caption">Оплата</div>
			<div class="ordercontent__inputs ordercontent__inputs_full ordercontent__inputs_col">															
				<div class="ordercontent__radiogroup">
					
					
					
					<?
						foreach ($result as $i => $row)
						{	
							echo '<div class="ordercontent__input ordercontent__input_type2">
							<input name="payment_id" id="payment'.$row['id'].'" value="'.$row['id'].'" type="radio" '.(! $i ? 'checked' : '').'>
							<label for="payment'.$row['id'].'">'.$row['name'];
							if(! empty($row['text']))
							{
								echo ' <small><i>'.$row['text'].'</i></small>';
							}
							echo '</label></div>';
						}
					
					?>
				</div>	
				</div>
				</div>
			</div>
		</div>
		<div class="ordercontent__number" data-step="step4"><span>4</span></div>
	</div>
</div>

<?
/* 
echo '<div class="payments">';
foreach ($result as $i => $row)
{
	echo '<div class="payment">
	<input name="payment_id" id="payment'.$row['id'].'" value="'.$row['id'].'" type="radio" '.(! $i ? 'checked' : '').'>
	<label for="payment'.$row['id'].'">'.$row['name'].'</label>';
	if(! empty($row['text']))
	{
		echo '<div class="payment_text">'.$row['text'].'</div>';
	}
	echo '</div>';
}
echo '</div>'; */
