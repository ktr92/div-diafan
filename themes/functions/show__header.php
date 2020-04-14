<?php
/**
 * Шаблонный тег: 
 *
 * @package    DIAFAN.CMS
 * @author     diafan.ru
 * @version    6.0
 * @license    http://www.diafan.ru/license.html
 * @copyright  Copyright (c) 2003-2018 OOO «Диафан» (http://www.diafan.ru/)
 */
 ?>
 				 

<header id="header" class="header">
	<div class="header__top">
		<div class="container">
			<div class="row">
				<div class="col-md-3">
					<div class="logo"><a href="/"><img src="/images/logo.png" alt=""></a></div>
				</div>
				<div class="col-md-5">
					<div class="search">
						<?=$this->diafan->_parser_theme->get_function_in_theme('<insert name="show_search" module="search" template="top" ajax="true">');?>
					</div>
						
				</div>
				<div class="col-md-2 col-sm-5 col-xs-5">
					<div class="phone"><?=$this->diafan->_parser_theme->get_function_in_theme('<insert name="show_block" module="site" id="1">');?></div>
				</div>
				<div class="col-md-2 col-sm-7 col-xs-7">
					<div class="callback"><a href="#FormCall" data-toggle="modal" class="btn btn_border btn_call"><span>Обратный звонок</span></a></div>
				</div>
			</div>
		</div>
	</div>
	<div class="header__bottom">
		<div class="container">
			<div class="mainmenu">
				<?=$this->diafan->_parser_theme->get_function_in_theme('<insert name="show_block" module="menu" id="1" template="topmenu">'); ?>
				
				
			</div>
		</div>
	</div>
	<button id="mobile-menu"><i class="fa fa-bars" aria-hidden="true"></i></button>
	<div class="mainmenu__cart mainmenu__cart_mobile">
		<a href=""><span>16</span><img src="/images/icon-cart.png" alt=""></a>
		<?=$this->diafan->_parser_theme->get_function_in_theme('<insert name="show_block" module="cart" id="1" template="headercart">'); ?>
	</div>
</header>