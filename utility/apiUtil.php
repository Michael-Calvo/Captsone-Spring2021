<?php

require "../database/dbadapter.php";
include_once "apiConstants.php";

class apiUtil
{
    protected dbadapter $dao;

    function __construct()
    {
        $this->dao = new dbadapter();
    }

    function __destruct()
    {
        die();
    }

    public function standardJSONReply(int $responseCode, array $responseMsg)
    {
        http_response_code($responseCode);
        echo json_encode($responseMsg);
    }

    protected function objCreatedJSONReply(int $responseCode, int $retID, array $responseMsg)
    {
        $responseMsg[API_OBJ_ID] = $retID;
        $this->standardJSONReply($responseCode, $responseMsg);
    }

    protected function objReadJSONReply(int $responseCode, array $data, array $responseMsg)
    {
        $responseMsg[API_OBJ_READS] = $data;
        $this->standardJSONReply($responseCode, $responseMsg);
    }

    public function createObj(String $objName, array $payload): int
    {
        $newID = $this->dao->createModelObject($objName,$payload);
        //check the new ID
        if (isset($newID) && is_int($newID) && $newID > 0) {
            //inform the caller
            $this->objCreatedJSONReply(API_OBJ_CREATED_CODE, $newID, API_OBJ_CREATED);
        }
        //there was a problem
        else {
            $this->standardJSONReply(API_OBJ_FAIL_CODE, API_OBJ_FAIL);
        }
    }

    public function readObj(String $objName, array $payload)
    {
        //get the reads
        $readData = $this->dao->readModelObject($objName, $payload);
        //send them to the user
        objReadJSONReply(API_OBJ_READ_CODE, $readData, API_OBJ_READ);
    }

    public function updateObj(String $objName, array $payload)
    {
        //check the payload
        if ($this->checkUpdatePayload($payload)) {
            //get the confirm from the db
            if ($this->dao->updateModelObject($objName, $payload)) {
                //send confirm message to the user
                $this->standardJSONReply(API_OBJ_UPDATED_CODE,API_OBJ_UPDATED);
            }
        }
        else {
            //bad request. inform the user
            $this->standardJSONReply(API_INCOMP_CODE, API_INCOMP);
        }
    }

    public function deleteObj(String $objName, array $payload)
    {
        //check the payload
        if ($this->checkDeletePayload($payload)) {
            //get the confirm from the db
            if ($this->dao->deleteModelObject($objName, $payload)) {
                //send confirm message to the user
                $this->standardJSONReply(API_OBJ_DELETED_CODE,API_OBJ_DELETED);
            }
        }
        else {
            //bad request. inform the user
            $this->standardJSONReply(API_INCOMP_CODE, API_INCOMP);
        }
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