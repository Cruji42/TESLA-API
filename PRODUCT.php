<?php
use PController\ProductController;
include_once 'ProductController.php';
include_once 'utils/headers.php';

//get the name of the archive clean
//we init the string without the ip
$uri = explode("/", substr(@$_SERVER['PHP_SELF'],1));
$URL = rtrim($uri[1],'.php');

switch ($URL){
    case 'PRODUCT':
        $postdata = file_get_contents("php://input");
        $request = json_decode($postdata);
        @$productId = $request-> id;
        $requestMethod = $_SERVER["REQUEST_METHOD"];
        $controller = new ProductController();
        $controller->processRequest($requestMethod, $productId);
        break;

};

