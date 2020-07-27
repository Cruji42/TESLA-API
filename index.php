<?php
/*$method = $_SERVER['REQUEST_METHOD'];
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
*/

use Controller\UserController;

include_once 'utils/headers.php';
$uri = explode("/", substr(@$_SERVER['http://localhost/LAINNE/user'], 1));

// all of our endpoints start with /person
// everything else results in a 404 Not Found
if ($uri[2] !== 'user') {
    header("HTTP/1.1 404 Not Found");
    exit();
}

// the user id is, of course, optional and must be a number:
$userId = null;
if (isset($uri[1])) {
    $userId = (int) $uri[1];
}

$requestMethod = $_SERVER["REQUEST_METHOD"];

// pass the request method and user ID to the PersonController and process the HTTP request:
$controller = new UserController($requestMethod, $userId);
$controller->processRequest();
