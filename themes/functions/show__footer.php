<?php
/**
 * Шаблонный тег: выводит основной контент страницы: заголовка (если не запрещен его вывод в настройке странице «Не показывать заголовок»), текста страницы и прикрепленного модуля. Заменяет три тега: show_h1, show_text, show_module.
 *
 * @package    DIAFAN.CMS
 * @author     diafan.ru
 * @version    6.0
 * @license    http://www.diafan.ru/license.html
 * @copyright  Copyright (c) 2003-2018 OOO «Диафан» (http://www.diafan.ru/)
 */
?>

<footer id="footer" class="footer">
			<div class="footer__top">
				<div class="container">
					<div class="row">
						<div class="col-md-3">
							<div class="logo"><a href="/"><img src="/images/logo2.png" alt=""></a></div>
						</div>
						<div class="col-lg-5 col-md-3">							
						</div>
						<div class="col-lg-2 col-md-3 col-sm-5 col-xs-5">
							<div class="phone"><?=$this->diafan->_parser_theme->get_function_in_theme('<insert name="show_block" module="site" id="1">');?></div>
						</div>
						<div class="col-lg-2 col-md-3 col-sm-7 col-xs-7">
							<div class="callback"><a href="#FormCall" data-toggle="modal" class="btn btn_border btn_call"><span>Обратный звонок</span></a></div>
						</div>
					</div>
				</div>
			</div>
			<div class="footer__main">
				<div class="container">
					<div class="row">
						<div class="col-md-6">
							<div class="footer__column">
								<div class="footer__title">Каталог товаров</div>
								<div class="footer__list">
									<?=$this->diafan->_parser_theme->get_function_in_theme('<insert name="show_category" module="shop" template="list" images="0" count_level="1">');?>									
								</div>
							</div>
						</div>
						<div class="col-md-3">
							<div class="footer__column">
								<div class="footer__title">Контактные данные</div>
								<?=$this->diafan->_parser_theme->get_function_in_theme('<insert name="show_block" module="site" id="2">');?>
							</div>
						</div>
						<div class="col-md-3">
							<div class="footer__column">
								<div class="footer__title">Данные организации</div>
								<div class="footer__text">
									<div class="footer__company">
										<?=$this->diafan->_parser_theme->get_function_in_theme('<insert name="show_block" module="site" id="3">');?>
									</div>
								</div>								
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="footer__bottom">
				<div class="container">
					<div class="row">
						<div class="col-md-8">
							<div class="footer__text">
								<div class="copy">© 2005 - 2020 г. ООО «Грузоподъемные Системы»</div>
							</div>
						</div>
						<div class="col-md-4">
							<div class="footer__text">
								<div class="velvet"><a href="//velvetmedia.ru">Создание сайта - <span>VELVET</span></a></div>
							</div>
						</div>
					</div>
				</div>
			</div>
			
		</footer>


<div class="modal fade" id="FormCall">
  <div class="modal-dialog">
	<div class="modal-content">
	  <div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		<h4 class="modal-title">Обратный звонок</h4>
		<p>Оставьте свои контакные данные,<br/> мы Вам перезвоним!</p>
	  </div>
	  <div class="modal-body">
		
	  
	<?=$this->diafan->_parser_theme->get_function_in_theme('<insert name="show_form" module="feedback" site_id="176" template="modal">'); ?>
		
	  </div>
	 
	</div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

