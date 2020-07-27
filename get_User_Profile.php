<?php
include_once ("utils/headers.php");
use DBC\Conexion as dbc;
use auth\Auth as tkn;
require "vendor/autoload.php";

$postdata = file_get_contents("php://input");
$request = json_decode($postdata);

@$token = $request-> token;

$tokenVerify = tkn::tokenvalidate($token);
$userID = tkn::GetData($token);
echo $userID;

/*$query = "Select * from usuario where id = ''";
$conexion = dbc::DB_Conect();
$result = dbc::Query($query);
echo json_encode($result);*/


