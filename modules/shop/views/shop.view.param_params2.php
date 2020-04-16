<?php
/**
 * Шаблон дополнительных характеристик товара
 *
 * Шаблон вывода дополнительных характеристик товара
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
?> <? /* ?>
<pre><? print_r($result); ?></pre>
*/ ?>
	<div class="product__docs">
		<div class="docs">
			<div class="docs__title">Техническая документация:</div>
			<div class="docs__items">
<?

foreach ($result["rows"] as $param)
{
	if ((($param["id"]==5) && (!(empty($param["value"])))) || (($param["id"]==6) && (!(empty($param["value"]))))) {		
	?> 
		<div class="docs__item">
			<a href="<?=$param["value"][0]["link"]?>">
			<? if (strripos($param["value"][0]["link"], ".doc") || strripos($param["value"][0]["link"], ".docx")) { ?><img src="/images/doc.png"><? }?>
			<? if (strripos($param["value"][0]["link"], ".pdf")) { ?><img src="/images/pdf.png"><? }?>
				<span><?=$param["value"][0]["name"]?></span>
			</a>
			
		</div>
	<?	} ?>
<?	} ?>
	</div>
		</div>
	</div>