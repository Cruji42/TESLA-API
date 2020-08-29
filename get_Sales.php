<?php
include_once ("utils/headers.php");
use DBC\Conexion as dbc;
require "vendor/autoload.php";

$query = "SELECT SUM(T1.amount) as MES FROM sales AS T1 GROUP BY MONTH(T1.date)";
$conexion = dbc::DB_Conect();
$result = dbc::Query($query);
echo json_encode($result);


