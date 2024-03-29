<?php

/**
 * Формирует данные для формы платежной системы Яндекс.Касса
 * 
 * @package    DIAFAN.CMS
 * @author     diafan.ru
 * @version    6.0
 * @license    http://www.diafan.ru/license.html
 * @copyright  Copyright (c) 2003-2016 OOO «Диафан» (http://www.diafan.ru/)
 */
if (!defined('DIAFAN')) {
    $path = __FILE__;
    $i = 0;
    while (!file_exists($path . '/includes/404.php')) {
        if ($i == 10)
            exit;
        $i++;
        $path = dirname($path);
    }
    include $path . '/includes/404.php';
}

class Payment_sber_model extends Diafan {

    /**
     * Формирует данные для формы платежной системы "YandexMoney"
     * 
     * @param array $params настройки платежной системы
     * @param array $pay данные о платеже
     * @return array
     */
    public function get($params, $pay) {
        //print_r($params);
        //print_r($pay);

        $result['text'] = $pay['text'];

        Custom::inc('plugins/httprequest/httprequest.php');

        try {

            $url = (!empty($params['sber_test']) ? 'https://3dsec.sberbank.ru' : 'https://securepayments.sberbank.ru');

            // регистрация заказа
            $http = DHttpRequest::post($url.'/payment/rest/register.do')->form(
                            array(
                                'userName' => $params['sber_login'],
                                'password' => $params['sber_password'],
                                'orderNumber' => $pay['id'],
                                'amount' => intval(floatval($pay['summ']) * 100),
                                'returnUrl' => BASE_PATH . 'payment/get/sber/success/?' . rand(1111, 9999),
                                'failUrl' => BASE_PATH . 'payment/get/sber/fail/?' . rand(1111, 9999),
                                'description' => $pay['desc'])
                    )->acceptJson();

            $json = $http->ok() ? json_decode($http->body(),true) : null;
            
            if(array_key_exists('formUrl', $json)) {
                $result['link'] = $json['formUrl'];
                $result['link_name'] = $this->diafan->_('Оплатить');
                DB::query("UPDATE {payment_history} SET payment_data='%s' WHERE id='%d'", $json['orderId'], $pay['id']);
            }
            else {
                $result['error'] = $json['errorMessage'];
            }
            
        } catch (DHttpRequestException $e) {
            $result['error'] = $e->getMessage();
        }

        


        return $result;
    }

}
