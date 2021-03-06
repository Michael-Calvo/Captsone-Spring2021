<?php
include "../utility/apiConstants.php";
include "../utility/apiUtil.php";

header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: GET, POST");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

//get posted data
$data = json_decode(file_get_contents("php://input"));

//call up the util
$api = new apiUtil();

// make sure data is not empty
if(
    !empty($data) &&
    !empty($data->function) &&
    !empty($data->object) &&
    !empty($data->payload)
){
    //check the function and bounce if needed.
    if (!in_array($data->function, SUPPORTED_FUNCS) || !in_array($data->object, SUPPORTED_OBJS)) {
        $api->standardJSONReply(API_UNSUPP_CODE, API_UNSUPP);
    }

    //process the request
    if ($data->function == API_CREATE) {
        $api->createObj($data->object, $data->payload);
    }
    if ($data->function == API_READ) {
        $api->readObj($data->object, $data->payload);
    }
    if ($data->function == API_UPDATE) {
        $api->updateObj($data->object, $data->payload);
    }
    if ($data->function == API_DELETE) {
        $api->deleteObj($data->object, $data->payload);
    }
}
  
// tell the user data is incomplete
else{
    // set response code - bad request - inform user
    $api->standardJSONReply(API_INCOMP_CODE,API_INCOMP);
}