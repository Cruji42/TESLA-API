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
    $query = " select * from users where email= '".$Correo."'";
    $result = dbc::Query($query);

      if(password_verify($Contrasena, $result[0]['password'])) {
            $tokenData = [
                'id' => $result[0]['id'],
                'name' => $result[0]['nickname'],
                'access' => $result[0]['access']
            ];
            $token = Token::TokenGenerate($tokenData);
            $data=['success' => 1, 'token' => $token, 'id' => $result[0]['id']];
            echo json_encode($data, JSON_UNESCAPED_UNICODE);
        }else{
            echo json_encode('Usuario o contraseña incorrecto');
        }
}else{
    echo json_encode('Llena todos los campos');
}
