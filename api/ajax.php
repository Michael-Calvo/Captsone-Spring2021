<?php
include "../utility/apiConstants.php";
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: GET, POST");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

// get posted data
$data = json_decode(file_get_contents("php://input"));

//stub for the db
  
// make sure data is not empty
if(
    !empty($data) &&
    !empty($data->function) &&
    !empty($data->object) &&
    !empty($data->payload)
){
    //check the function and bounce if needed.
    if (!in_array($data->function, SUPPORTED_FUNCS) || !in_array($data->object, SUPPORTED_OBJS)) {
        // set response code - bad request
        http_response_code(API_UNSUPP_CODE);
  
        // tell the user
        echo json_encode(API_UNSUPP);
    }
  
    //process the request
    if ($data->function == API_CREATE) {
        # code...
    }
    if ($data->function == API_READ) {
        # code...
    }
    if ($data->function == API_UPDATE) {
        # code...
    }
    if ($data->function == API_DELETE) {
        # code...
    }
}
  
// tell the user data is incomplete
else{
  
    // set response code - bad request
    http_response_code(API_INCOMP_CODE);
  
    // tell the user
    echo json_encode(API_INCOMP);
}