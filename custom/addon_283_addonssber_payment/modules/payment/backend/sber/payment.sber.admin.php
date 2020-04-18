<?php
/**
 * Настройки платежной системы Яндекс.Касса для административного интерфейса
 * 
 * @package    DIAFAN.CMS
 * @author     diafan.ru
 * @version    6.0
 * @license    http://www.diafan.ru/license.html
 * @copyright  Copyright (c) 2003-2016 OOO «Диафан» (http://www.diafan.ru/)
 */

if (! defined('DIAFAN'))
{
	$path = __FILE__; $i = 0;
	while(! file_exists($path.'/includes/404.php'))
	{
		if($i == 10) exit; $i++;
		$path = dirname($path);
	}
	include $path.'/includes/404.php';
}

class Payment_sber_admin
{
	public $config;
	private $diafan;

	public function __construct(&$diafan)
	{
		$this->diafan = &$diafan;
		$this->config = array(
			"name" => 'Sber',
			"params" => array(
				'sber_login' => 'API login',
				'sber_password' => 'API password',
				'sber_test' => array('name' => 'Тестовый режим', 'type' => 'checkbox'),
			)
		);
	}
}