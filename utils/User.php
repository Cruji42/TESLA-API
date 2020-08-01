<?php
namespace USR;
//This document contains the functions that can be used in the class (CRUD)
include_once ("headers.php");
use DBC\Conexion as dbc;
include_once 'conexion.php';
class User {

    public static function addUser($User){
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

    public static function getUsers(){
        $query = "SELECT * FROM usuario";
        $response = dbc::Query($query);
        return $response;
    }

    public static function getSingleUser($param){
        $id = $param;
        $query = "Select * from usuario where Id = $id";
        $response = dbc::Query($query);
        return $response;
    }
    public static function deleteUser($param){
        $id = $param;
        $query = "Delete from usuario where Id = $id";
        $response = dbc::Query($query);
        return $response;
    }

}