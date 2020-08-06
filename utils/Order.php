<?php
namespace ORD;
//This document contains the functions that can be used in the class (CRUD)
include_once ("headers.php");
use DBC\Conexion as dbc;
include_once 'conexion.php';
class Order {

    public static function add($Product){
        $Fecha = date_format(date_create($Product['FechaEntrega']), "Y/m/d H:i:S");
        $Cliente = $Product['ClienteId'];
        $Producto = $Product['ProductoID'];
        $Cantidad = $Product['ProductoCant'];
        $Importe = $Product['ProductImporte'];
        $Decoracion = $Product['ProductoDecoracion'];


        $query = "CALL Crear_Orden('$Fecha', '$Cliente', '$Producto', '$Cantidad', '$Importe', '$Decoracion')";
        $response = dbc::Insert($query);
        return $response;
    }

    public static function get(){
        $query = "SELECT * FROM orden";
        $response = dbc::Query($query);
        return $response;
    }

    public static function getSingle($param){
        $id = $param;
        $query = "call Obtener_Pedido('$id')";
        $response = dbc::Query($query);
        return $response;
    }
    public static function delete($param){
        $id = $param;
        $query = "Delete from orden where Id = $id";
        $response = dbc::Query($query);
        return $response;
    }

}