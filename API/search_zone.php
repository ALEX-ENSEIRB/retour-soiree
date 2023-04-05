<?php
include "header.php";
include "connect.php";

$sql = "SELECT *FROM zones";
$result = $connection->query($sql);
$data = array();
//récupere les données et les met dans un tableau
if ($result->num_rows > 0) {
    // output data of each row
    while($row = $result->fetch_assoc()) {
        $data[] = $row;
    }
}

echo json_encode($data);

http_response_code(200);
?>