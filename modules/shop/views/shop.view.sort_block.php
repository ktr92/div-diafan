<?php
/**
 * Шаблон блока «Сортировать» с ссылками на направление сортировки
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
       
$link_sort   = $result["link_sort"];
$sort_config = $result['sort_config'];

/* echo '<div class="block">';

echo '<div class="sort-by by-rate">'; */
?>
<? /* 
<pre><? print_r($link_sort) ?></pre>
*/ ?>

<div class="sortblock">
	<div class="filter">
		<div class="filter__name">Сортировка:</div>
		<div class="sortblock__items"> 
				
				<? if ($link_sort[5]) { ?>
					<div class="sortblock__item"><a href="<?=BASE_PATH_HREF.$link_sort[5]?>">Популярные</a></div>
				<? } else  { ?>  
					<div class="sortblock__item"><a href="#">Популярные</a></div>
				<? } ?>				
				<? if ($link_sort[1]) { ?>
					<div class="sortblock__item"><a href="<?=BASE_PATH_HREF.$link_sort[1]?>">Недорогие</a></div>
				<? } else  { ?>  
					<div class="sortblock__item"><a href="#">Недорогие</a></div>
				<? } ?>
				<? if ($link_sort[2]) { ?>
					<div class="sortblock__item"><a href="<?=BASE_PATH_HREF.$link_sort[2]?>">Дорогие</a></div>
				<? } else  { ?>  
					<div class="sortblock__item"><a href="#">Дорогие</a></div>
				<? } ?>
				
		</div>
	</div>
</div>


<?
/* $symbol = 'up';
for ($i = 1; $i <= count($sort_config['sort_directions']); $i++)
{ 
	
	if(! empty($sort_config['sort_fields_names'][$i]))
	{
		echo '<a href="'.($link_sort[$i] ? BASE_PATH_HREF.$link_sort[$i] : '').'">' . $sort_config['sort_fields_names'][$i] . '</a>';
	}
	if ($link_sort[$i])
	{
		echo ' <a href="'.BASE_PATH_HREF.$link_sort[$i].'" class="sort-'.$symbol.'"><i class="fa fa-chevron-circle-'.$symbol.'"></i></a> ';
	}
	else
	{
		echo ' <span class="sort-'.$symbol.' active"><i class="fa fa-chevron-circle-'.$symbol.'"></i></span> ';
	}

	$symbol =  ($symbol == 'up' ?  'down' :'up');
} */

 /*echo '</div>';

echo '</div>'; */?>