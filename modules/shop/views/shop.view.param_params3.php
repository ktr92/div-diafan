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



foreach ($result["rows"] as $param)
{
	if ((($param["id"]==9) && (!(empty($param["value"]))))) { 		
			echo $param["value"];			
		} 
	}
