<?php
include "header.php";
include "connect.php";

$email = $_POST['email'];
$password = $_POST['password'];

$requete = "SELECT * FROM users WHERE MAIL_ETUDIANT = '$email'";
$result = $connection->query($requete);

if ($result->num_rows > 0) {
    $row = $result->fetch_assoc();
    $hashed_password = $row['MOT_DE_PASSE'];
    
    if (password_verify($password, $hashed_password)) {
        http_response_code(200);
        echo json_encode(array("message" => "Login successful.", "user" => $row));
        // Consider implementing and returning a session token for authentication
    }
} else {
    http_response_code(401);
    echo json_encode(array("message" => "Invalid credentials."));
}