<?php
require 'modelConstants.php';
abstract class modelObject implements modelObjectInterface
{
    protected String $UUID;
    protected int $id;
    protected boolval $active;
    protected int $sortValue;

    function __construct()
    {
        $this->$UUID = uniqid();
        $this->$id = DB_DEFAULT_ID;
        $this->$active = TRUE;
        $this->$sortValue = DB_DEFAULT_SORT_VALUE;
    }
}