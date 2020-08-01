<?php
namespace Controller;
use USR\User;
include_once 'User.php';

class UserController {
    public function processRequest($requestMethod, $userId) {
        switch ($requestMethod) {
//        already working
            case 'GET':
                if ($userId != null) {
                    $response = $this->getUser($userId);
                } else {
                    $response = $this->getAllUsers();
                };
                break;
//        already working
            case 'POST':
                $response = $this->createUserFromRequest();
                break;
            case 'PUT':
                $response = $this->updateUserFromRequest($userId);
                break;
//        already working
            case 'DELETE':
                $response = $this->deleteUser($userId);
                break;
            default:
                $response = $this->notFoundResponse();
                break;
        }
        echo json_encode($response);
    }

    public function getAllUsers()
    {
        $result = User::getUsers();
        $response['status_code_header'] = 'HTTP/1.1 200 OK';
        $response['body'] = json_encode($result);
        $response['body']=$result;
        return $response;
    }

    public function getUser($id)
    {
        $result = User::getSingleUser($id);
        if (! $result) {
            return $this->notFoundResponse();
        }
        $response['status_code_header'] = 'HTTP/1.1 200 OK';
        $response['body'] = $result;
        return $response;
    }
    public function deleteUser($id)
    {
        $result = User::deleteUser($id);
        if (! $result) {
            return $this->notFoundResponse();
        }
        $response['status_code_header'] = 'HTTP/1.1 200 OK';
        $response['body'] = $result;
        return $response;
    }

    public function createUserFromRequest()
    {
        $input = (array) json_decode(file_get_contents('php://input'), TRUE);
        if (! $this->validatePerson($input)) {
            return $this->unprocessableEntityResponse();
        }
        User::addUser($input);
        $response['status_code_header'] = 'HTTP/1.1 201 Deleted';
        $response['body'] = null;
        return $response;
    }

    private function validatePerson($input)
    {
        if (! isset($input['Name']) || ! isset($input['LastName']) || ! isset($input['Telephone']) ||
            ! isset($input['Address']) || ! isset($input['City']) || ! isset($input['Mail']) || ! isset($input['Password']) ) {
            return false;
        }
        return true;
    }


    private function unprocessableEntityResponse()
    {
        $response['status_code_header'] = 'HTTP/1.1 422 Unprocessable Entity';
        $response['body'] = json_encode([
            'error' => 'Invalid input'
        ]);
        return $response;
    }

    private function notFoundResponse()
    {
        $response['status_code_header'] = 'HTTP/1.1 404 Not Found';
        $response['body'] = null;
        return $response;
    }
}