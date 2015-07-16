<?php

/* SSL Management */
$useSSL = true;

require_once(dirname(__FILE__) . '../../../../../config/config.inc.php');
require_once(dirname(__FILE__) . '../../../../../header.php');
require_once(dirname(__FILE__) . '../../../everypay_prestashop_1_4_x.php');

//Check if the module is loaded - it may be not
$authorized = false;
foreach (Module::getPaymentModules() as $module)
    if ($module['name'] == 'everypay_prestashop_1_4_x') {
        $authorized = true;
        break;
    }
if (!$authorized) {
    Tools::redirect(__PS_BASE_URI__ . 'order.php?step=3');
} else {
    $ev = new EverypayPayments();
    $conf = $ev->configurePaymentForm();

    $smarty->assign(array(
        'EVERYPAY_STANDALONE' => true,
        'EVERYPAY_SHOW_AMOUNT' => true        
        ));

    if ($conf) {        
        if ($ev->configuration['EVERYPAY_BUTTON_MODE']) {
            $smarty->display(dirname(__FILE__) . '/../../views/templates/hook/payment-button.tpl');
        } else {
            $smarty->display(dirname(__FILE__) . '/../../views/templates/hook/payment.tpl');
        }
    }else{
        Tools::redirect(__PS_BASE_URI__ . 'order.php?step=3');
    }    
}

require_once(dirname(__FILE__) . '../../../../../footer.php');
