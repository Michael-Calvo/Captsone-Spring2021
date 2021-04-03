<?php

require "../database/dbapter.php";
include "apiConstants.php";

class apiUtil
{
    protected dbtadapter $dao;

    function __construct()
    {
        $this->$dao = new dbadapter();
    }

    function __destruct()
    {
        die();
    }

    protected function standardJSONReply(int $responseCode, array $responseMsg)
    {
        http_response_code(responseCode);
        echo json_encode(responseMsg);
    }

    public function createObj(String $objName, array $payload)
    {
        # code...
    }

    public function readObj(String $objName, array $payload)
    {
        # code...
    }

    public function updateObj(String $objName, array $payload)
    {
        //check the payload
        if ($this->checkUpdatePayload($payload)) {
            # code...
        }
        else {
            //bad request. inform the user
            $this->standardJSONReply(API_INCOMP_CODE, API_INCOMP);
        }
    }

    public function deleteObj(String $objName, array $payload)
    {
        # code...
    }

    protected function checkUpdatePayload(array $payload)
    {
        return $this->checkUDPayload($payload);
    }

    protected function checkDeletePayload(array $payload)
    {
        return $this->checkUDPayload($payload);
    }

    protected function checkUDPayload(array $payload)
    {
        //default return value to true
        $retval = true;

        //check for all components of the call
        foreach (API_UD_PAYLOADS as $key) {
            if (!key_exists($key, $payload)) {
                $retval = false;
            }
        }
        return $retval;
    }
}
?>