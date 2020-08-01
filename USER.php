<?php
use Controller\UserController;
include_once 'UserController.php';
include_once 'utils/headers.php';

//get the name of the archive clean
//we init the string without the ip
$uri = explode("/", substr(@$_SERVER['PHP_SELF'],1));
$URL = rtrim($uri[1],'.php');

switch ($URL){
    case 'USER':
        $postdata = file_get_contents("php://input");
        $request = json_decode($postdata);
        @$userId = $request-> id;
        $requestMethod = $_SERVER["REQUEST_METHOD"];
        $controller = new UserController();
        $controller->processRequest($requestMethod, $userId);
    break;

};

