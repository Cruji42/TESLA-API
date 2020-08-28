<?php
require "vendor/autoload.php";
include_once "utils/headers.php";
use DBC\Conexion as dbc;

$postdata = file_get_contents("php://input");
$request = json_decode($postdata);

@$Nickname = $request-> nickname;
@$Email = $request-> email;
@$Password = $request-> password;
@$Password_CRYPT = password_hash($Password, PASSWORD_DEFAULT, ['cost' => 5]);

if($Nickname != '' && $Email != '' && $Password != ''){
    $query = " INSERT INTO users (nickname, email, password) VALUES ( '$Nickname', '$Email', '$Password_CRYPT')";
    $result = dbc::Insert($query);
   echo json_encode($result);
}else{
    echo json_encode('Error al agregar usuario');
}