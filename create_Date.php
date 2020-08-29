<?php
require "vendor/autoload.php";
include_once "utils/headers.php";
use DBC\Conexion as dbc;

$postdata = file_get_contents("php://input");
$request = json_decode($postdata);


@$Client = $request-> ClienteId;
@$Date = $request-> Fecha;
@$Model = $request-> Modelo;
@$Sto = $request-> Store;

if($Client != '' && $Date != '' && $Model != '' && $Sto != ''){
    $query = " INSERT INTO test (`date`, `users_id`, `products_id`, `stores_id`) VALUES ( '$Date', '$Client', '$Model', '$Sto')";
    $result = dbc::Insert($query);
    echo json_encode($result);
}else{
    echo json_encode('Error al agendar tu cita');
}