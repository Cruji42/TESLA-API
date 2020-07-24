<?php
$method = $_SERVER['REQUEST_METHOD'];
$request = explode("/", substr(@$_SERVER['http://localhost/LAINNE/user'], 1));

switch ($method) {
    case 'PUT':
//        print_r($request);
        echo ('resultado put');
        break;
    case 'POST':
//        print_r($request);
        echo ('resultado post');
        break;
    case 'GET':
//        print_r($request);
        echo ('resultado get');
        break;
    default:
//        handle_error($request);
        break;
}

