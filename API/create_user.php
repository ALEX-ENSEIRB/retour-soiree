<?php

include "header.php";
include "connect.php"; /* Le fichier connect.php contient les identifiants de connexion */

// Users table has columns: id, name, firstname, email, phone, password
// We need to insert the new user in the table users

$name = $_POST['name'];
$firstname = $_POST['firstname'];
$email = $_POST['email'];
$phone = $_POST['phone'];
$password = $_POST['password'];

// Hash the password before storing it
$hashed_password = password_hash($password, PASSWORD_DEFAULT);

// Insert the new user into the users table
$requete = "INSERT INTO users (NOM_ETUDIANT, PRENOM_ETUDIANT, MAIL_ETUDIANT, NOTEL_ETUDIANT, MOT_DE_PASSE) VALUES ('$name', '$firstname', '$email', '$phone', '$hashed_password')";

try {
    $res = $connection->query($requete);
    // Check if the insertion was successful
    if ($res) {
        http_response_code(201);
        echo json_encode(array("message" => "User registered successfully."));
    }
} catch (\Throwable $th) {
    if($th->getCode() == 1062) {
        http_response_code(409);
        echo json_encode(array("message" => "User already exists."));
    }else {
        http_response_code(500);
        echo json_encode(array("message" => $th->getCode()));
    }
}


$connection->close();
?>