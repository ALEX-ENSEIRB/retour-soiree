<?php

include "header.php";
include "connect.php"; /* Le fichier connect.php contient les identifiants de connexion */

//To create a trip first we need to insert the start and end point in the table lieux
//Then we need to insert the trip in the table trajets

//Lieux has 3 columns: id_lieu, adresse_lieu, id_zone (id_zone is the id of the zone where the point is located)
//We need to insert the start and end point in the table lieux
//insert into lieux

$address_start = $_POST['address_start'];
$address_end = $_POST['address_end'];
$zone_start = $_POST['id_zone_start'];
$zone_end = $_POST['id_zone_end'];

$requete = "INSERT INTO lieux (adresse_lieu, id_zone) VALUES ('$address_start' , '$zone_start')";
$res = $connection->query($requete);
$id_depart = $connection->insert_id;

$requete = "INSERT INTO lieux (adresse_lieu, id_zone) VALUES ('$address_end', '$zone_end')";
$res = $connection->query($requete);
$id_arrivee = $connection->insert_id;


//Trajets has 6 columns: id_trajet, date_trajet, nb_places, id_lieu_depart, id_lieu_arrivee, id_event

//We need to insert the trip in the table trajets
//insert into trajets

$date_trajet = $_POST['date_trajet'];
$nb_places = $_POST['nb_places'];

if (isset($_POST['id_event']) && $_POST['id_event'] != 0) {
    $id_event = $_POST['id_event'];
    $requete = "INSERT INTO trajets (date_trajet, nb_places, id_depart, id_arrivee, id_event) VALUES ('$date_trajet', '$nb_places', '$id_depart', '$id_arrivee', '$id_event')";
} else {
    $requete = "INSERT INTO trajets (date_trajet, nb_places, id_depart, id_arrivee) VALUES ('$date_trajet', '$nb_places', '$id_depart', '$id_arrivee')";
    $id_event = NULL;
}

echo $requete;
$res = $connection->query($requete);
