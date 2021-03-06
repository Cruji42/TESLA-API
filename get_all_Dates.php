<?php
require "vendor/autoload.php";
include_once "utils/headers.php";
use DBC\Conexion as dbc;


$query = " SELECT t1.id, t4.nickname  as Client, t1.date, t2.name as Vehicle, t2.image, t3.name, t1.state FROM
test as t1
JOIN products as t2
ON t1.products_id = t2.id
JOIN stores as t3
ON t1.stores_id = t3.id
JOIN users as t4 
ON t1.users_id = t4.id";

$result = dbc::Query($query);
echo json_encode($result);
