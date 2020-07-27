<?php
namespace Controller;
include_once 'API_User.php';

class UserController {
    private $requestMethod;
    private $userId;
public function processRequest() {
    switch ($this->requestMethod) {
        case 'GET':
            if ($this->userId) {
                $response = $this->getUser($this->userId);
            } else {
                $response = $this->getAllUsers();
            };
            break;
        case 'POST':
            $response = $this->createUserFromRequest();
            break;
        case 'PUT':
            $response = $this->updateUserFromRequest($this->userId);
            break;
        case 'DELETE':
            $response = $this->deleteUser($this->userId);
            break;
        default:
            $response = $this->notFoundResponse();
            break;
    }
    header($response['status_code_header']);
    if ($response['body']) {
        echo $response['body'];
    }
}

public function getAllUsers()
{
    $result = $this->agetAllUsers();
    $response['status_code_header'] = 'HTTP/1.1 200 OK';
    $response['body'] = json_encode($result);
    return $response;
}

public function getUser($id)
{
    $result = $this->getUser($id);
    if (! $result) {
        return $this->notFoundResponse();
    }
    $response['status_code_header'] = 'HTTP/1.1 200 OK';
    $response['body'] = json_encode($result);
    return $response;
}

public function createUserFromRequest()
{
    $input = (array) json_decode(file_get_contents('php://input'), TRUE);
    if (! $this->validatePerson($input)) {
        return $this->unprocessableEntityResponse();
    }
    $this->addUSer($input);
    $response['status_code_header'] = 'HTTP/1.1 201 Created';
    $response['body'] = null;
    return $response;
}

    private function validatePerson($input)
    {
        if (! isset($input['Name'])) {
            return false;
        }
        if (! isset($input['LastName'])) {
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