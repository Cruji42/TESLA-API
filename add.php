<?php

include_once 'API_User.php';

$postdata = file_get_contents("php://input");
$request = json_decode($postdata);

@$Name = $request-> Name;
@$LastName = $request-> LastName;
@$Telephone = $request-> Telephone;
@$Address = $request-> Address;
@$City = $request-> City;
@$Mail = $request-> Mail;
@$Password = $request-> Password;

$api = new ApiUser();


if($Name != '' && $LastName != '' && $Telephone != '' && $Address != '' && $City != '' && $Mail != '' && $Password != ''){
    $PasswordEn = password_hash($Password, PASSWORD_DEFAULT, ['cost' => 5]);
    $item = array(
        'Name' => $Name,
        'LastName' => $LastName,
        'Telephone' => $Telephone,
        'Address' => $Address,
        'City' => $City,
        'Mail' => $Mail,
        'Password' => $PasswordEn,

    );
    $api->addUser($item);
}else{
    $api->error('Data incomplete');
}