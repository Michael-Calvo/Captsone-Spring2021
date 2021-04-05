<?php

interface modelObjectInterface
{
    public function readModelObject(String $className, array $parameters);
    public function createModelObject(String $className, array $parameters);
    public function updateModelObject(String $className, array $parameters);
    public function deleteModelObject(String $className, array $parameters);
    public function getClassParameters();
}