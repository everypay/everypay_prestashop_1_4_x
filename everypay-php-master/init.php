<?php

$include = '/AbstractResource.php
/Action/AbstractAction.php
/Action/Create.php
/Action/Delete.php
/Action/ListAll.php
/Action/Refund.php
/Action/Retrieve.php
/Action/Update.php
/Everypay.php
/Exception/RuntimeException.php
/Exception/ApiErrorException.php
/Exception/CurlException.php
/Exception/InvalidArgumentException.php
/Http/Client/ClientInterface.php
/Http/Client/CurlClient.php
/Http/Message.php
/Http/RequestInterface.php
/Http/Request.php
/Http/ResponseInterface.php
/Http/Response.php
/Http/UriInterface.php
/Http/Uri.php
/Customer.php
/Payment.php
/Token.php';

$files = explode('
', $include);

$path = _PS_MODULE_DIR_ . EVERYPAY_BASE_FOLDER . '/everypay-php-master/src';
foreach($files as $file){
    require_once($path . $file);
}