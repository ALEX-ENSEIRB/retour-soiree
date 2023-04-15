<?php

include "../header/header.php";
include "../header/connect.php";/* Le fichier connect.php contient les identifiants de connexion */


//Add the user to the trip in the table participations


$trip_id = $_POST['trip_id'];
$user_id = $_POST['user_id'];

echo $trip_id;
echo $user_id;

$sql = "INSERT INTO participations (ID_TRAJET, NO_ETUDIANT, GESTION) VALUES ('$trip_id', '$user_id', 'false')";

$res = $connection->query($sql);

if ($res) {
    http_response_code(200);
    header('Content-Type: application/json');
    echo json_encode(array('message' => 'User added to the trip'));
} else {
    http_response_code(400);
    header('Content-Type: application/json');
    echo json_encode(array('message' => 'Error while adding the user to the trip'));
}

$connection->close();