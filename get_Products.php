<?php
include_once ("utils/headers.php");
use DBC\Conexion as dbc;
require "vendor/autoload.php";

$query = "SELECT * FROM products";
$conexion = dbc::DB_Conect();
$result = dbc::Query($query);
echo json_encode($result);


