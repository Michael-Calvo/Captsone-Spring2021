<?php
//request constants
define("SUPPORTED_FUNCS", array("create","read","update","delete"));
define("API_CREATE", "create");
define("API_READ", "read");
define('API_UPDATE', 'update');
define('API_DELETE', 'delete');
define("SUPPORTED_OBJS", array('checkstatuslu','inventoryaudit','itemssold','job','menu','menuitem','menutypelu','paymentstatuslu','paymenttypelu','payperiod','poscheck','postables','punch','recipe','recipeitem','rolelu','schedule','shift','stockitem','stockpurchase','stockseller','store','tablestatuslu','ticket','ticketitem','ticketstatuslu','tickettypelu','transactionhistory','userlu','wastelog'));

//request messages
define('API_INCOMP', array("message" => "Unable to process request. Data incomplete."));
define('API_INCOMP_CODE', 400);
define('API_UNSUPP', array("message" => "Unable to process request. Unsupported request."));
define('API_UNSUPP_CODE', 400);
define('API_OBJ_CREATED', array("message" => "Object was created."));
define('API_OBJ_CREATED_CODE', 201);
define('API_OBJ_UPDATED', array("message" => "Object was updated."));
define('API_OBJ_UPDATED_CODE', 201);
define('API_OBJ_DELETED', array("message" => "Object was deleted."));
define('API_OBJ_DELETED_CODE', 201);
define('API_OBJ_FAIL', array("message" => "Unable to process request on object."));
define('API_OBJ_FAIL_CODE', 503);
define('API_OBJ_ID', 'ID');


//api payload constants
define('API_UD_PAYLOADS', array("ID", "UUID", "IsActive"));

//api db response

?>