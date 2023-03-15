<?php

include "header.php";
include "connect.php"; /* Le fichier connect.php contient les identifiants de connexion */

$requete = "select distinct NOM, PRENOM from ACTEUR";
$res = $connection->query($requete);
$data = array();
if ($res->num_rows > 0) {
    while ($acteur =  $res->fetch_assoc()) {
        $data[] = $acteur;
      }
}

echo json_encode($data);