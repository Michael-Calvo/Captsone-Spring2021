<?php
include 'dbconstants.php'
class dbconnector implements dbinterface
{
    private string $db = "mysql:host=localhost;dbname=posdb;";
    private string $dbuser = "GTBUser";
    private string $dbpass = "1q2w3e4r5t";
    private string $failedConn = 'failed connection';
    private string $failedPrep = 'failed prep';
    private string $failMsg = 'There was an issue with an improper entry or a FK constraint issue';
    private object $pdo; 

    function __construct(){
        // create the connection
        $this->pdo = new PDO($this->db, $this->dbuser, $this->dbpass);
    }

    public function createModelObject(String $className, array $parameters)
    {
        return $this->makeInsertCall($className, $parameters);
    }

    private function makeInsertCall(string $tableName, array $params) {
	    //this should be a constant bad ID
        $msg = FALSE;
	    $stmt = $this->pdo->prepare($this->createInsertStat($tableName, $params));
	    if (!$stmt) {
	        error_log(__CLASS__ . __FUNCTION__ . $this->failedPrep);
	    }
	    $result = $stmt->execute();
	    if ($result) {
            // @TODO this should return the ID
	        $msg = TRUE;
	    }else {
	        error_log(__CLASS__ . __FUNCTION__ . $this->failedConn . print_r($stmt->errorInfo()));
	        $msg[1] = $this->failMsg;
	    }
	    return $msg;
	}

    private function createInsertState(string $table, array $params)
    {
        return CREATE_START . $tableName . $this->makeInsertParamList($params);
    }

    private function makeInsertParamList(array $params)
    {
        $ret1 = " (";
	    $ret2 = "";
	    $i = count($params) - 1;
	    $x = 0;
	    foreach ($params as $key => $value) {
	        if ($i != $x) {
	            $ret1 = $ret1 . $key . ', ';
	            $ret2 = $ret2 . $this->getFormattedBit($value) . ', ';
	            $x++;
	        }
	        else {
	            $ret1 = $ret1 . $key;
	            $ret2 = $ret2 . $this->getFormattedBit($value);
	        }
	    }
	    return $ret1 . ') ' . CREATE_MID . $ret2 . PAR_END;
    }

    public function readModelObject(String $className, array $parameters)
    {
        return $this->makeReadCall($className, $parameters);
    }

    private function makeReadCall(string $tableName, array $params) {
	    
	    $stmt = $this->pdo->prepare($this->createReadStat($tableName));
	    $stmt->execute();
	    return $stmt->fetchAll();
	}

    private function createReadStat(string $tableName) {
	    return READ_START . $tableName . NORM_END;
	}

    public function updateModelObject(String $className, array $parameters)
    {
        return $this->makeUpdateCall($className, $parameters);
    }

    private function makeUpdateCall(string $tableName, array $params) {
	    $msg = FALSE;
	    $stmt = $this->pdo->prepare($this->createUpdateStat($tableName, $params));
	    if (!$stmt) {
	        error_log(__CLASS__ . __FUNCTION__ . $this->getFailedPrep());
	    }
	    $result = $stmt->execute();
	    if ($result) {
	        $msg = TRUE;
	    }else {
	        error_log(__CLASS__ . __FUNCTION__ . $this->getFailedConn() . print_r($stmt->errorInfo()));
	        $msg[1] = $this->failMsg;
	    }
	    return $msg;
	}

    private function createUpdateStat(string $tableName, array $params) {
	    return UPDATE_START . $tableName . UPDATE_MID . $this->makeUpdateParamList($params, $tableName);
	}

    private function makeUpdateParamList(array $params, string $tableName) {
	    $retVal = "";
	    $i = count($params) - 1;
	    $x = 0;
	    foreach ($params as $key => $value) {
	        if ($i != $x) {
	            $retVal = $retVal . $key . ' = ' . $this->getFormattedBit($value) . ', ';
	            $x++;
	        }
	        else {
	            $retVal = $retVal . $key . ' = ' . $this->getFormattedBit($value);
	            $retVal = $retVal . $this->makeWhereStat($params, $tableName);
	        }
	    }
	    return $retVal;
	}

    private function makeWhereStat(array $params, string $tableName) {
	    $retVal = ' WHERE ';
	    $i = 0;
	    $x = count($this->pks[$tableName]) - 1;
	    foreach ($this->pks[$tableName] as $value) {
	        if ($i != $x) {
	            $retVal = $retVal . $value . ' = ' . $this->getFormattedBit($params[$value]) . ' AND ';
	            $i++;
	        }
	        else {
	            $retVal = $retVal . $value . ' = ' . $this->getFormattedBit($params[$value]) . NORM_END;
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

    public function deleteModelObject(String $className, array $parameters)
    {
        return $this->makeDeleteCall($className, $parameters);
    }

    private function makeDeleteCall(string $tableName, array $params) {
	    $msg = FALSE;
	    $stmt = $this->pdo->prepare($this->createDeleteStat($tableName, $params));
	    if (!$stmt) {
	        error_log(__CLASS__ . __FUNCTION__ . $this->getFailedPrep());
	    }
	    $result = $stmt->execute();
	    if ($result) {
	        $msg = TRUE;
	    }else {
	        error_log(__CLASS__ . __FUNCTION__ . $this->getFailedConn() . print_r($stmt->errorInfo()));
	        $msg[1] = $this->failMsg;
	    }
	    return $msg;
	}

    private function createDeleteStat(string $tableName, array $params) {
	    return DELETE_START . $tableName . $this->makeWhereStat($params, $tableName);
	}
}
?>