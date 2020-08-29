<?php
require "vendor/autoload.php";
include_once "utils/headers.php";
use DBC\Conexion as dbc;

$postdata = file_get_contents("php://input");
$request = json_decode($postdata);

@$User = $request-> id;

if($User != ''){
    $query = " SELECT * FROM users WHERE id = '$User'";
    $result = dbc::Query($query);
    echo json_encode($result);
}else{
    echo json_encode('Error');
}