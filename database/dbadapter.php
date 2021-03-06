<?php
include 'dbinterface.php';
include 'dbconnectorSP.php';
class dbadapter implements dbinterface
{
    private dbinterface $dao;

    function __construct()
    {
        $this->dao = new dbconnectorSP();
    }

    public function createModelObject(String $className, array $parameters)
    {
        return $this->dao->createModelObject($className, $parameters);
    }
    public function readModelObject(String $className, array $parameters)
    {
        return $this->dao->readModelObject($className, $parameters);
    }
    public function updateModelObject(String $className, array $parameters)
    {
        return $this->dao->updateModelObject($className, $parameters);
    }
    public function deleteModelObject(String $className, array $parameters)
    {
        return $this->dao->deleteModelObject($className, $parameters);
    }
}
?>