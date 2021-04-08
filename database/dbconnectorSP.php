<?php
include_once 'dbconstants.php';
class dbconnectorSP implements dbinterface
{
    private string $db = "mysql:host=localhost;dbname=posdb;";
    private string $dbuser = "posuser";
    private string $dbpass = "1q2w3e4r5t";
    private string $failedConn = 'failed connection';
    private string $failedPrep = 'failed prep';
    private string $failMsg = 'There was an issue with an improper entry.';
    private object $pdo; 

    public function __construct(){
        // create the connection
        $this->pdo = new PDO($this->db, $this->dbuser, $this->dbpass);
    }
    
    private function makeSPCall(String $crudType, String $tableName, array $params) {
        if ($crudType == SP_CREATE) {
            return SP_START . $crudType . $tableName . $this->makeStringOfParams($params) . SP_END;
        }
        elseif ($crudType == SP_READ){
            return SP_START . $crudType . $tableName . $this->makeStringOfParams($params) . SP_END;
        }
        else {
            return SP_START . $crudType . $tableName . $this->makeStringOfParams($params) . SP_END;
        }
        
    }
    
    private  function makeInsertSPCall(String $tableName, array $params){
        return $this->makeSPCall(SP_CREATE, $tableName, $params);
    }
    
    private function makeReadSPCall(String $tableName, array $params){
        return $this->makeSPCall(SP_READ, $tableName, $params);
    }
    
    private function makeStringOfParams(array $params){
        $retVal = SP_PARAM_START;
        $paramLen = count($params);
        for ($i = 0; $i < $paramLen; $i++) {
            if ($i == ($paramLen - 1)) {
                $retVal = $retVal . $this->getFormattedBit($params[$i]);
            }
            else {
                $retVal = $retVal . $this->getFormattedBit($params[$i]) . SP_PARAM_SEP;
            }
        }
        return $retVal;
    }
    
    private function getFormattedBit($var) {
        $flag = (intval($var, 10) == 0);
        if (gettype($var) == "string" && $flag) {
            return "'" . $var . "'";
        }
        else {
            return $var;
        }
    }
    
    public function createModelObject(String $tableName, array $params)
    {
        return $this->makeInsertCall($tableName, $params);
    }
    
    private function makeInsertCall(string $tableName, array $params) {
        //this should be a constant bad ID
        $msg = -999;
        $stmt = $this->pdo->prepare($this->makeInsertSPCall($tableName, $params));
        if (!$stmt) {
            error_log(__CLASS__ . __FUNCTION__ . $this->failedPrep);
        }
        $result = $stmt->execute();
        if (!empty($result)) {
            $msg = $stmt->fetch();
        }else {
            error_log(__CLASS__ . __FUNCTION__ . $this->failedConn . print_r($stmt->errorInfo()));
            $msg[1] = $this->failMsg;
        }
        return intval($msg[0]);
    }
    
    public function readModelObject(String $tableName, array $params)
    {
        return $this->makeReadCall($tableName, $params);
    }
    
    private function makeReadCall(string $tableName, array $params) {
        
        $stmt = $this->pdo->prepare($this->makeSPCall(SP_READ, $tableName, $params));
        $result = $stmt->execute();
        if (!empty($result)) {
            $msg = $stmt->fetchAll(PDO::FETCH_ASSOC);
        }else {
            error_log(__CLASS__ . __FUNCTION__ . $this->failedConn . print_r($stmt->errorInfo()));
            $msg[1] = $this->failMsg;
        }
        return $msg;
    }
    
    public function updateModelObject(String $tableName, array $params)
    {
        return $this->makeUpdateCall($tableName, $params);
    }
    
    private function makeUpdateCall(string $tableName, array $params) {
        $msg = FALSE;
        $stmt = $this->pdo->prepare($this->makeSPCall(SP_UPDATE, $tableName, $params));
        if (!$stmt) {
            error_log(__CLASS__ . __FUNCTION__ . $this->getFailedPrep());
        }
        $result = $stmt->execute();
        if ($result) {
            $msg = $result;
        }else {
            error_log(__CLASS__ . __FUNCTION__ . $this->getFailedConn() . print_r($stmt->errorInfo()));
            $msg[1] = $this->failMsg;
        }
        return $msg;
    }
    
    public function deleteModelObject(String $tableName, array $params)
    {
        return $this->makeDeleteCall($tableName, $params);
    }
    
    private function makeDeleteCall(string $tableName, array $params) {
        $msg = FALSE;
        $stmt = $this->pdo->prepare($this->makeSPCall(SP_DELETE, $tableName, $params));
        if (!$stmt) {
            error_log(__CLASS__ . __FUNCTION__ . $this->getFailedPrep());
        }
        $result = $stmt->execute();
        if ($result) {
            $msg = $result;
        }else {
            error_log(__CLASS__ . __FUNCTION__ . $this->getFailedConn() . print_r($stmt->errorInfo()));
            $msg[1] = $this->failMsg;
        }
        return $msg;
    }
}
?>