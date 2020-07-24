<?php
require "vendor/autoload.php";
include_once "utils/headers.php";
use DBC\Conexion as dbc;

$postdata = file_get_contents("php://input");
$request = json_decode($postdata);

@$Nombre = $request-> nombre;
@$Apellido = $request-> apellido;
@$Telefono = $request-> telefono;
@$Direccion = $request-> direccion;
@$Ciudad = $request-> ciudad;
@$Correo = $request-> correo;
@$Contrasena = $request-> contrasena;



if($Nombre != '' && $Apellido != '' && $Telefono != '' && $Direccion != '' && $Ciudad != '' && $Correo != '' && $Contrasena != ''){
    $ContrasenaEn = password_hash($Contrasena, PASSWORD_DEFAULT, ['cost' => 5]);
    $query = "CALL Agregar_Usuario('".$Nombre."', '".$Apellido."', '".$Telefono."', '".$Direccion."', '".$Ciudad."', '".$Correo."', '".$ContrasenaEn."')";
    dbc::Query($query);
}else{
    echo json_encode('Faltaron datos');
}

