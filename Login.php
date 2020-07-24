<?php
require "vendor/autoload.php";
include_once "utils/headers.php";
use DBC\Conexion as dbc;
use AUTH\Auth as token;

$postdata = file_get_contents("php://input");
$request = json_decode($postdata);

@$Correo = $request-> email;
@$Contrasena = $request-> password;

if($Correo != '' && $Contrasena != ''){
    $query = " select * from usuario where correo= '".$Correo."'";
    $result = dbc::Query($query);
    if(password_verify($Contrasena, $result->Contrasena)) {
        $tokenData = [
            'id' => $result-> Id,
            'name' => $result -> Nombre,
        ];
        $token = Token::TokenGenerate($tokenData);
        $data=['success' => 1, 'token' => $token];
        echo json_encode($data, JSON_UNESCAPED_UNICODE);
    }else{
        echo json_encode('Error de Autenticación');
    }
}else{
    echo json_encode('Llena todos los campos');
}




