<?php
//récupérer les données créer trajet
$depart = $_POST['depart'];
$arrivee = $_POST['arrivee'];
$zdepart = $_POST['zdepart'];
$zarrivee = $_POST['zarrivee'];
$date = $_POST['date'];
$heure = $_POST['heure'];
$nbplaces = $_POST['nbplaces'];
$evenement = $_POST['evenement'];
$utilisateur = $_POST['utilisateur'];
//connexion à la base de données
include "connect.php";
//requête SQL
$sql = "INSERT INTO trajet (depart, arrivee, zdepart, zarrivee, date, heure, nbplaces, evenement, utilisateur) VALUES ('$depart', '$arrivee', '$zdepart','$zarrivee', '$date', '$heure', '$nbplaces', '$evenement', '$utilisateur')";
//exécution de la requête SQL
$result = $connection->query($sql);
//fermeture de la connexion
$connection->close();
//redirection vers la page d'accueil
header("Location: ../index.php");

?>