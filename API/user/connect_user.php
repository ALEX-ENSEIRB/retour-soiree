<?php
include "../header/header.php";
include "../header/connect.php";

$email = $_POST['email'];
$password = $_POST['password'];

$requete = "SELECT * FROM users WHERE MAIL_ETUDIANT = '$email'";
$result = $connection->query($requete);
if ($result->num_rows > 0) {
    $row = $result->fetch_assoc();
    $hashed_password = $row['MOT_DE_PASSE'];
    
    if (password_verify($password, $hashed_password)) {
        $user = array(
            'id' => $row['NO_ETUDIANT'],
            'name' => $row['NOM_ETUDIANT'],
            'firstname' => $row['PRENOM_ETUDIANT'],
            'email' => $email
        );
        $array = array();
        $array['user'] = $user;
        echo json_encode($array);
        http_response_code(200);
    }
} else {
    http_response_code(401);
    echo json_encode(array("message" => "Invalid credentials."));
}