<?php
//create constants
define("CREATE_START", "INSERT INTO ");
define("CREATE_MID", "VALUES (");

//read constants
define("READ_START", "SELECT * FROM ");

//update constants
define("UPDATE_START", "UPDATE ");
define("UPDATE_MID", " SET ");
define("UPDATE_PARAM", " = ?");

//delete constants
define("DELETE_START", "DELETE FROM ");

//general sql constants
define("PARAM_SPACER", "?");
define("ID_END", "WHERE ? = ?;");
define("PARAM_SEP", ", ");
define("NORM_END", ";");
define("PAR_END", ");");
?>