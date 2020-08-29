<?php
require "vendor/autoload.php";
include_once "utils/headers.php";
use DBC\Conexion as dbc;
use AUTH\Auth as token;

$postdata = file_get_contents("php://input");
$request = json_decode($postdata);

@$Id = $request-> id_cite;
@$Token = $request-> token;

if(token::tokenvalidate($Token)){
    if($Id != ''){
        $query = " DELETE FROM test WHERE id = '$Id'";
        $result = dbc::Insert($query);
        echo json_encode($result);
    }else{
        echo json_encode('Error');
    }
}else{
    echo json_encode('TokenEXP');
}

