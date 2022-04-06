<?php 
$serverName = "localhost";
$userName = "id18067408_root";
$password = ")_X!I6IZ1rf4CtDm";
$databaseName = "id18067408_practicedb";

$conn= new mysqli($serverName,$userName,$password,$databaseName);
if($conn->connect_error){
  
    die("Connection errro ".$conn->connect_error);
}

$return["message"]="";

 $firstValue = $_POST['firstValue'];
 $secondValue = $_POST['secondValue'];

 

$sql = "INSERT INTO practiceTable (first_value,second_value) VALUES ('$firstValue','$secondValue')";
if($conn->query($sql)===TRUE){
  
    $return['message'] = $firstValue+$secondValue;
    $return['hi'] ="this is practice hello world";
    
}
else{
      
    die("Unsuccessful to insert data".$conn->error);
}
$conn->close();

  header('Content-Type: application/json');
 
  // tell browser that its a json data
  echo json_encode($return);
  //converting array to JSON string
 ?>
