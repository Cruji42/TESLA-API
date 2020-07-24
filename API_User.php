<?php

include_once 'utils/User.php';

class ApiUser {

    function addUser($item) {
        $User = new User();
        $response = $User->addUser($item);
        $this->success('New User Added');
        if($response){
            $this->setJSON($response);
        }else{
            $this->error('404');
        }
    }

    function getAllUsers() {
        $User = new User();
        $response = $User->getAllUsers();
        if($response){
            $this->setJSON($response);
        }else{
            $this->error('404');
        }
    }

    function getUser($id) {
        $User = new User();
        $response = $User->getUser($id);
        if($response){
            $this->setJSON($response);
        }else{
            $this->error('404');
        }
    }

    function setJSON($array){
        echo '<code>' . json_encode($array). '</code>';
    }

    function error($msj){
         echo '<code>' . json_encode(array('mesage' => $msj)). '</code>';

    }

    function success($msj){
         echo '<code>' . json_encode(array('mesage' => $msj)). '</code>';

    }
}