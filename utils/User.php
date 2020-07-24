<?php
include_once ("headers.php");
include_once 'conexion.php';
use DBC\Conexion as dbc;

class User extends DBC{

    function addUser($User){
        $Nombre = $User['Name'];
        $Apellido = $User['LastName'];
        $Telefono = $User['Telephone'];
        $Direccion = $User['Address'];
        $Ciudad = $User['City'];
        $Correo = $User['Mail'];
        $ContrasenaEn = password_hash($User['Password'], PASSWORD_DEFAULT, ['cost' => 5]);
        $query = "CALL Agregar_Usuario('$Nombre', '$Apellido', '$Telefono', '$Direccion', '$Ciudad', '$Correo', '$ContrasenaEn')";
        $response = dbc::Insert($query);
        return $response;
    }

    function getAllUsers(){
        $query = "SELECT * FROM usuario";
        $response = dbc::Query($query);
        return $response;
    }

    function getUser($param){
        $id = $param;
        $query = "Select * from usuario where Id = $id";
        $response = dbc::Query($query);
        return $response;
    }

}