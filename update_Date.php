<?php
require "vendor/autoload.php";
include_once "utils/headers.php";
use DBC\Conexion as dbc;

$postdata = file_get_contents("php://input");
$request = json_decode($postdata);

@$Option = $request-> option;
@$Id = $request-> id;

if($Option != '' && $Id != ''){
    if($Option == 'A'){
        $query = "UPDATE test set state = 'Aceptada' where id= '$Id'";
        $result = dbc::Insert($query);
        echo json_encode($result);
    }else if ($Option == 'B'){
        $query = "UPDATE test set state = 'Rechazada' where id= '$Id'";
        $result = dbc::Insert($query);
        echo json_encode($result);

    }else{
        echo json_encode('No se pudo actualizar');
    }
}else{
    echo json_encode('Error');
}